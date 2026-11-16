const fs = require('fs');
const path = require('path');
const vscode = require('vscode');
const { LanguageClient } = require('vscode-languageclient/node');

let client;

function isIDEKARepository(candidate) {
    return fs.existsSync(path.join(candidate, 'scripts', 'flsp.py'))
        && fs.existsSync(path.join(candidate, 'src', 'compiler', 'iparser.py'));
}

function discoverRepository(startPaths) {
    for (const startPath of startPaths) {
        let candidate = path.resolve(startPath);
        while (true) {
            if (isIDEKARepository(candidate)) {
                return candidate;
            }
            const parent = path.dirname(candidate);
            if (parent === candidate) {
                break;
            }
            candidate = parent;
        }
    }
    return undefined;
}

function resolveConfiguredPath(configuredPath, basePath) {
    if (!configuredPath) {
        return undefined;
    }
    return path.isAbsolute(configuredPath)
        ? configuredPath
        : path.resolve(basePath, configuredPath);
}

async function activate(context) {
    const config = vscode.workspace.getConfiguration('ideka');
    const workspacePaths = (vscode.workspace.workspaceFolders || [])
        .map(folder => folder.uri.fsPath);
    const configuredRoot = resolveConfiguredPath(config.get('sourcePath'), workspacePaths[0] || process.cwd());
    const sourceRoot = configuredRoot || discoverRepository(workspacePaths);
    const configuredServer = resolveConfiguredPath(config.get('serverPath'), sourceRoot || workspacePaths[0] || process.cwd());
    const serverPath = configuredServer || (sourceRoot && path.join(sourceRoot, 'scripts', 'flsp.py'));

    if (!sourceRoot || !serverPath || !fs.existsSync(serverPath)) {
        void vscode.window.showWarningMessage(
            'IDEKA language server not started. Open an IDEKA repository or set ideka.sourcePath and ideka.serverPath.'
        );
        return;
    }

    const serverOptions = {
        command: config.get('pythonPath', 'python3'),
        args: [serverPath],
        options: {
            cwd: sourceRoot,
            env: {
                ...process.env,
                IDEKA_SRCDIR: sourceRoot,
                IDEKA_STDLIB: path.join(sourceRoot, 'src', 'stdlib')
            }
        }
    };
    const clientOptions = {
        documentSelector: [{ scheme: 'file', language: 'IDEKA' }],
        outputChannelName: 'IDEKA Language Server'
    };

    client = new LanguageClient('ideka', 'IDEKA Language Server', serverOptions, clientOptions);
    context.subscriptions.push(client);
    try {
        await client.start();
    } catch (error) {
        client = undefined;
        void vscode.window.showErrorMessage(`Failed to start IDEKA language server: ${error.message}`);
    }
}

function deactivate() {
    return client ? client.stop() : undefined;
}

module.exports = { activate, deactivate };
