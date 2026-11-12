; ModuleID = "IDEKA_module"
target triple = "x86_64-pc-windows-msvc"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%"standard__math__POINT" = type {i32, i32}
%"standard__system__windows__MSG" = type {i64, i32, i64, i64, i32, %"standard__math__POINT"}
%"standard__system__windows__WNDCLASSEXA" = type {i32, i32, i64*, i32, i32, i64, i64, i64, i64, i8*, i8*, i64}
%"standard__system__windows__RECT" = type {i32, i32, i32, i32}
%"standard__system__windows__PAINTSTRUCT" = type {i64, i32, %"standard__system__windows__RECT", i32, i32, [32 x i8]}
%"standard__vectors__Vec3" = type {float, float, float}
%"OpenGL__GLContext" = type {i64, i64, i1}
%"IDKC_TYPESYS" = type {i8*, i8*, i1, i1, i1, i1, i1, i32, i1, i32, i32, i32, i32, i8*, i1, i8*, i8*}
%"IDKC_PARAM" = type {i8*, %"IDKC_TYPESYS"}
%"IDKC_FUNCINFO" = type {i32, %"IDKC_PARAM"*, %"IDKC_TYPESYS", i8*, i1, i1, i1, i1, i1, i1, i32, i32}
%"PtrVec" = type {i8**, i32, i32}
%"NameMap" = type {i8**, i8**, i32*, i32, i32, i32}
%"IDKC_SYMENTRY" = type {i8*, i8*, %"IDKC_TYPESYS", i8*, i32, i32, i8*, i8*}
%"IDKC_SYMTABLE" = type {i32, %"IDKC_SYMENTRY"*, %"PtrVec"*, %"PtrVec"*, %"PtrVec"*, %"PtrVec"*, %"PtrVec"*, %"PtrVec"*, %"NameMap"*, %"NameMap"*, %"NameMap"*, i8*}
%"SYSTEM_INFO_PARTIAL" = type {i32, i32, i8*, i8*, i64, i32, i32, i32, i16, i16}
%"BlockEntry" = type {i64, i64, i64, i64}
%"Slab" = type {i64, i64, i64, i64, %"Slab"*}
%"FreeNode" = type {%"FreeNode"*}
%"RingAllocResult" = type {i64*, i1}
%"ExceptionState" = type {i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64}
%"Exception" = type {i8*, i32, %"ExceptionState"}
%"WinExceptionRecord" = type {i32, i32, %"WinExceptionRecord"*, i8*, i32, [15 x i64]}
%"WinContext" = type {i64, i64, i64, i64, i64, i64, i32, i32, i16, i16, i16, i16, i16, i16, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64}
%"WinExceptionPointers" = type {%"WinExceptionRecord"*, %"WinContext"*}
%"IDEKAJmpBuf" = type {i64, i64, i64, i64, i64, i64, i64, i64, i1*, i64*, i1*, i32*}
%"timespec" = type {i64, i64}
%"PIXELFORMATDESCRIPTOR" = type {i16, i16, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32}
%"Thread" = type {[8 x i8], i32}
%"Mutex" = type {[64 x i8]}
%"RWLock" = type {[64 x i8]}
%"CondVar" = type {[64 x i8]}
%"Semaphore" = type {[32 x i8]}
%"Barrier" = type {i32, i32, i32, i32}
%"TLSKey" = type {[8 x i8]}
%"WorkSlice" = type {i32, i32, i32, i32, double*, double*, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double, double, double, double, double*}
@"standard__system__cpu__g_l2_bytes" = internal global i64 0
@"standard__system__cpu__g_ermsb" = internal global i1 0
@"standard__system__cpu__g_cpuid_run" = internal global i1 0
@"standard__memory__allocators__stdheap__g_next_slab_size" = internal global i64 4194304
@"standard__memory__allocators__stdheap__g_slab_size_cap" = internal global i64 67108864
@"standard__memory__allocators__stdheap__g_large_used" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_cap" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_count" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_slab_cap" = internal global i64 0
@"standard__io__console__out_buf" = internal global [8192 x i8] zeroinitializer
@"standard__io__console__out_len" = internal global i32 0
@"standard__math__POINT.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 64, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 32, i32 32, i32 32}]}
@"standard__system__windows__WS_VISIBLE" = internal global i32 268435456
@"standard__system__windows__WS_OVERLAPPEDWINDOW" = internal global i32 13565952
@"standard__system__windows__WS_EX_APPWINDOW" = internal global i32 262144
@"standard__system__windows__CS_VREDRAW" = internal global i32 1
@"standard__system__windows__CS_HREDRAW" = internal global i32 2
@"standard__system__windows__CS_OWNDC" = internal global i32 32
@"standard__system__windows__SW_SHOW" = internal global i32 5
@"standard__system__windows__WM_DESTROY" = internal global i32 2
@"standard__system__windows__WM_PAINT" = internal global i32 15
@"standard__system__windows__WM_ERASEBKGND" = internal global i32 20
@"standard__system__windows__WM_CLOSE" = internal global i32 16
@"standard__system__windows__WM_QUIT" = internal global i32 18
@"standard__system__windows__WM_KEYDOWN" = internal global i32 256
@"standard__system__windows__WM_MOUSEMOVE" = internal global i32 512
@"standard__system__windows__WM_LBUTTONDOWN" = internal global i32 513
@"standard__system__windows__WM_LBUTTONUP" = internal global i32 514
@"standard__system__windows__WM_RBUTTONDOWN" = internal global i32 516
@"standard__system__windows__WM_RBUTTONUP" = internal global i32 517
@"standard__system__windows__PM_REMOVE" = internal global i32 1
@"standard__system__windows__BLACK_BRUSH" = internal global i32 4
@"standard__system__windows__MSG.TLD" = internal constant {i32, i32, [6 x {i32, i32, i32}]} {i32 384, i32 6, [6 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 32, i32 32}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 64, i32 64}, {i32, i32, i32} {i32 256, i32 32, i32 32}, {i32, i32, i32} {i32 320, i32 64, i32 64}]}
@"standard__system__windows__WNDCLASSEXA.TLD" = internal constant {i32, i32, [12 x {i32, i32, i32}]} {i32 640, i32 12, [12 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 32, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 32, i32 32}, {i32, i32, i32} {i32 160, i32 32, i32 32}, {i32, i32, i32} {i32 192, i32 64, i32 64}, {i32, i32, i32} {i32 256, i32 64, i32 64}, {i32, i32, i32} {i32 320, i32 64, i32 64}, {i32, i32, i32} {i32 384, i32 64, i32 64}, {i32, i32, i32} {i32 448, i32 64, i32 64}, {i32, i32, i32} {i32 512, i32 64, i32 64}, {i32, i32, i32} {i32 576, i32 64, i32 64}]}
@"standard__system__windows__RECT.TLD" = internal constant {i32, i32, [4 x {i32, i32, i32}]} {i32 128, i32 4, [4 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 32, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 32, i32 32}, {i32, i32, i32} {i32 96, i32 32, i32 32}]}
@"standard__system__windows__PAINTSTRUCT.TLD" = internal constant {i32, i32, [6 x {i32, i32, i32}]} {i32 576, i32 6, [6 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 32, i32 32}, {i32, i32, i32} {i32 128, i32 128, i32 64}, {i32, i32, i32} {i32 256, i32 32, i32 32}, {i32, i32, i32} {i32 288, i32 32, i32 32}, {i32, i32, i32} {i32 320, i32 256, i32 8}]}
@"standard__vectors__Vec3.TLD" = internal constant {i32, i32, [3 x {i32, i32, i32}]} {i32 96, i32 3, [3 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 32, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 32, i32 32}]}
@"OpenGL___glGenBuffers" = internal global i8* null
@"OpenGL___glDeleteBuffers" = internal global i8* null
@"OpenGL___glBindBuffer" = internal global i8* null
@"OpenGL___glBufferData" = internal global i8* null
@"OpenGL___glBufferSubData" = internal global i8* null
@"OpenGL___glMapBuffer" = internal global i8* null
@"OpenGL___glUnmapBuffer" = internal global i8* null
@"OpenGL___glGenVertexArrays" = internal global i8* null
@"OpenGL___glDeleteVertexArrays" = internal global i8* null
@"OpenGL___glBindVertexArray" = internal global i8* null
@"OpenGL___glEnableVertexAttribArray" = internal global i8* null
@"OpenGL___glDisableVertexAttribArray" = internal global i8* null
@"OpenGL___glVertexAttribPointer" = internal global i8* null
@"OpenGL___glCreateShader" = internal global i8* null
@"OpenGL___glDeleteShader" = internal global i8* null
@"OpenGL___glShaderSource" = internal global i8* null
@"OpenGL___glCompileShader" = internal global i8* null
@"OpenGL___glGetShaderiv" = internal global i8* null
@"OpenGL___glGetShaderInfoLog" = internal global i8* null
@"OpenGL___glCreateProgram" = internal global i8* null
@"OpenGL___glDeleteProgram" = internal global i8* null
@"OpenGL___glAttachShader" = internal global i8* null
@"OpenGL___glDetachShader" = internal global i8* null
@"OpenGL___glLinkProgram" = internal global i8* null
@"OpenGL___glUseProgram" = internal global i8* null
@"OpenGL___glGetProgramiv" = internal global i8* null
@"OpenGL___glGetProgramInfoLog" = internal global i8* null
@"OpenGL___glBindAttribLocation" = internal global i8* null
@"OpenGL___glGetUniformLocation" = internal global i8* null
@"OpenGL___glUniform1i" = internal global i8* null
@"OpenGL___glUniform1f" = internal global i8* null
@"OpenGL___glUniform2f" = internal global i8* null
@"OpenGL___glUniform3f" = internal global i8* null
@"OpenGL___glUniform4f" = internal global i8* null
@"OpenGL___glUniform1iv" = internal global i8* null
@"OpenGL___glUniform2fv" = internal global i8* null
@"OpenGL___glUniform3fv" = internal global i8* null
@"OpenGL___glUniform4fv" = internal global i8* null
@"OpenGL___glUniformMat4fv" = internal global i8* null
@"OpenGL___glGenFramebuffers" = internal global i8* null
@"OpenGL___glDeleteFramebuffers" = internal global i8* null
@"OpenGL___glBindFramebuffer" = internal global i8* null
@"OpenGL___glFramebufferTexture2D" = internal global i8* null
@"OpenGL___glCheckFramebufferStatus" = internal global i8* null
@"OpenGL___glGenRenderbuffers" = internal global i8* null
@"OpenGL___glDeleteRenderbuffers" = internal global i8* null
@"OpenGL___glBindRenderbuffer" = internal global i8* null
@"OpenGL___glRenderbufferStorage" = internal global i8* null
@"OpenGL___glFramebufferRenderbuffer" = internal global i8* null
@"OpenGL___glGenerateMipmap" = internal global i8* null
@"OpenGL___glActiveTexture" = internal global i8* null
@"OpenGL___glDrawArrays" = internal global i8* null
@"OpenGL___glDrawElements" = internal global i8* null
@"OpenGL___glDrawArraysInstanced" = internal global i8* null
@"OpenGL___glDrawElementsInstanced" = internal global i8* null
define %"OpenGL__GLContext"* @"OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1"(%"OpenGL__GLContext"* %"this.1", i64 %"device_context.1")
{
entry:
  %"device_context.addr" = alloca i64
  store i64 %"device_context.1", i64* %"device_context.addr"
  %"device_context.2" = load i64, i64* %"device_context.addr"
  %".5" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 0
  store i64 %"device_context.2", i64* %".5"
  %"device_context.3" = load i64, i64* %"device_context.addr"
  %".7" = call i64 @"OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"device_context.3")
  %".8" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 1
  store i64 %".7", i64* %".8"
  %".10" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 2
  store i1 false, i1* %".10"
  ret %"OpenGL__GLContext"* %"this.1"
}

define void @"OpenGL__GLContext.__exit__0__ret_voidE1"(%"OpenGL__GLContext"* %"this.1")
{
entry:
  %"rc_ptr" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 1
  %"rc" = load i64, i64* %"rc_ptr"
  %".3" = sext i32 0 to i64
  %".4" = icmp ne i64 %"rc", %".3"
  br i1 %".4", label %"then", label %"else"
then:
  %".6" = sext i32 0 to i64
  %".7" = sext i32 0 to i64
  %".8" = call i1 @"wglMakeCurrent"(i64 %".6", i64 %".7")
  %"rc_ptr.1" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 1
  %"rc.1" = load i64, i64* %"rc_ptr.1"
  %".9" = call i1 @"wglDeleteContext"(i64 %"rc.1")
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  ret void
}

define void @"OpenGL__GLContext.load_extensions__0__ret_voidE1"(%"OpenGL__GLContext"* %"this.1")
{
entry:
  call void @"OpenGL__gl_load_extensions__0__ret_voidE1"()
  %".3" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 2
  store i1 true, i1* %".3"
  ret void
}

define void @"OpenGL__GLContext.present__0__ret_voidE1"(%"OpenGL__GLContext"* %"this.1")
{
entry:
  %"dc_ptr" = getelementptr inbounds %"OpenGL__GLContext", %"OpenGL__GLContext"* %"this.1", i32 0, i32 0
  %"dc" = load i64, i64* %"dc_ptr"
  call void @"OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1"(i64 %"dc")
  ret void
}

define void @"OpenGL__GLContext.clear__0__ret_voidE1"(%"OpenGL__GLContext"* %"this.1")
{
entry:
  %"GL_COLOR_BUFFER_BIT" = load i32, i32* @"GL_COLOR_BUFFER_BIT"
  %"GL_DEPTH_BUFFER_BIT" = load i32, i32* @"GL_DEPTH_BUFFER_BIT"
  %".3" = or i32 %"GL_COLOR_BUFFER_BIT", %"GL_DEPTH_BUFFER_BIT"
  call void @"glClear"(i32 %".3")
  ret void
}

@"IDKC_TYPESYS.TLD" = internal constant {i32, i32, [17 x {i32, i32, i32}]} {i32 640, i32 17, [17 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 1, i32 1}, {i32, i32, i32} {i32 129, i32 1, i32 1}, {i32, i32, i32} {i32 130, i32 1, i32 1}, {i32, i32, i32} {i32 131, i32 1, i32 1}, {i32, i32, i32} {i32 132, i32 1, i32 1}, {i32, i32, i32} {i32 160, i32 32, i32 32}, {i32, i32, i32} {i32 192, i32 1, i32 1}, {i32, i32, i32} {i32 224, i32 32, i32 32}, {i32, i32, i32} {i32 256, i32 32, i32 32}, {i32, i32, i32} {i32 288, i32 32, i32 32}, {i32, i32, i32} {i32 320, i32 32, i32 32}, {i32, i32, i32} {i32 384, i32 64, i32 64}, {i32, i32, i32} {i32 448, i32 1, i32 1}, {i32, i32, i32} {i32 512, i32 64, i32 64}, {i32, i32, i32} {i32 576, i32 64, i32 64}]}
@"IDKC_PARAM.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 704, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 640, i32 64}]}
@"IDKC_FUNCINFO.TLD" = internal constant {i32, i32, [12 x {i32, i32, i32}]} {i32 928, i32 12, [12 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 640, i32 64}, {i32, i32, i32} {i32 768, i32 64, i32 64}, {i32, i32, i32} {i32 832, i32 1, i32 1}, {i32, i32, i32} {i32 833, i32 1, i32 1}, {i32, i32, i32} {i32 834, i32 1, i32 1}, {i32, i32, i32} {i32 835, i32 1, i32 1}, {i32, i32, i32} {i32 836, i32 1, i32 1}, {i32, i32, i32} {i32 837, i32 1, i32 1}, {i32, i32, i32} {i32 864, i32 32, i32 32}, {i32, i32, i32} {i32 896, i32 32, i32 32}]}
@"PtrVec.TLD" = internal constant {i32, i32, [3 x {i32, i32, i32}]} {i32 128, i32 3, [3 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 32, i32 32}, {i32, i32, i32} {i32 96, i32 32, i32 32}]}
@"NameMap.TLD" = internal constant {i32, i32, [6 x {i32, i32, i32}]} {i32 288, i32 6, [6 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 32, i32 32}, {i32, i32, i32} {i32 224, i32 32, i32 32}, {i32, i32, i32} {i32 256, i32 32, i32 32}]}
@"IDKC_SYMENTRY.TLD" = internal constant {i32, i32, [8 x {i32, i32, i32}]} {i32 1024, i32 8, [8 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 640, i32 64}, {i32, i32, i32} {i32 768, i32 64, i32 64}, {i32, i32, i32} {i32 832, i32 32, i32 32}, {i32, i32, i32} {i32 864, i32 32, i32 32}, {i32, i32, i32} {i32 896, i32 64, i32 64}, {i32, i32, i32} {i32 960, i32 64, i32 64}]}
@"IDKC_SYMTABLE.TLD" = internal constant {i32, i32, [12 x {i32, i32, i32}]} {i32 768, i32 12, [12 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 64, i32 64}, {i32, i32, i32} {i32 256, i32 64, i32 64}, {i32, i32, i32} {i32 320, i32 64, i32 64}, {i32, i32, i32} {i32 384, i32 64, i32 64}, {i32, i32, i32} {i32 448, i32 64, i32 64}, {i32, i32, i32} {i32 512, i32 64, i32 64}, {i32, i32, i32} {i32 576, i32 64, i32 64}, {i32, i32, i32} {i32 640, i32 64, i32 64}, {i32, i32, i32} {i32 704, i32 64, i32 64}]}
@"SYSTEM_INFO_PARTIAL.TLD" = internal constant {i32, i32, [10 x {i32, i32, i32}]} {i32 384, i32 10, [10 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 1}, {i32, i32, i32} {i32 32, i32 32, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 64, i32 1}, {i32, i32, i32} {i32 256, i32 32, i32 1}, {i32, i32, i32} {i32 288, i32 32, i32 1}, {i32, i32, i32} {i32 320, i32 32, i32 1}, {i32, i32, i32} {i32 352, i32 16, i32 1}, {i32, i32, i32} {i32 368, i32 16, i32 1}]}
@"BlockEntry.TLD" = internal constant {i32, i32, [4 x {i32, i32, i32}]} {i32 256, i32 4, [4 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}, {i32, i32, i32} {i32 128, i32 64, i32 1}, {i32, i32, i32} {i32 192, i32 64, i32 1}]}
@"Slab.TLD" = internal constant {i32, i32, [5 x {i32, i32, i32}]} {i32 320, i32 5, [5 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}, {i32, i32, i32} {i32 128, i32 64, i32 1}, {i32, i32, i32} {i32 192, i32 64, i32 1}, {i32, i32, i32} {i32 256, i32 64, i32 64}]}
@"FreeNode.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 64, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}]}
@"RingAllocResult.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 65, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 1, i32 1}]}
@"ExceptionState.TLD" = internal constant {i32, i32, [18 x {i32, i32, i32}]} {i32 1152, i32 18, [18 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}, {i32, i32, i32} {i32 128, i32 64, i32 1}, {i32, i32, i32} {i32 192, i32 64, i32 1}, {i32, i32, i32} {i32 256, i32 64, i32 1}, {i32, i32, i32} {i32 320, i32 64, i32 1}, {i32, i32, i32} {i32 384, i32 64, i32 1}, {i32, i32, i32} {i32 448, i32 64, i32 1}, {i32, i32, i32} {i32 512, i32 64, i32 1}, {i32, i32, i32} {i32 576, i32 64, i32 1}, {i32, i32, i32} {i32 640, i32 64, i32 1}, {i32, i32, i32} {i32 704, i32 64, i32 1}, {i32, i32, i32} {i32 768, i32 64, i32 1}, {i32, i32, i32} {i32 832, i32 64, i32 1}, {i32, i32, i32} {i32 896, i32 64, i32 1}, {i32, i32, i32} {i32 960, i32 64, i32 1}, {i32, i32, i32} {i32 1024, i32 64, i32 1}, {i32, i32, i32} {i32 1088, i32 64, i32 1}]}
@"Exception.TLD" = internal constant {i32, i32, [3 x {i32, i32, i32}]} {i32 1248, i32 3, [3 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 32, i32 1}, {i32, i32, i32} {i32 96, i32 1152, i32 1}]}
@"WinExceptionRecord.TLD" = internal constant {i32, i32, [6 x {i32, i32, i32}]} {i32 1184, i32 6, [6 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 1}, {i32, i32, i32} {i32 32, i32 32, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 64}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 32, i32 1}, {i32, i32, i32} {i32 224, i32 960, i32 1}]}
@"WinContext.TLD" = internal constant {i32, i32, [38 x {i32, i32, i32}]} {i32 2048, i32 38, [38 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}, {i32, i32, i32} {i32 128, i32 64, i32 1}, {i32, i32, i32} {i32 192, i32 64, i32 1}, {i32, i32, i32} {i32 256, i32 64, i32 1}, {i32, i32, i32} {i32 320, i32 64, i32 1}, {i32, i32, i32} {i32 384, i32 32, i32 1}, {i32, i32, i32} {i32 416, i32 32, i32 1}, {i32, i32, i32} {i32 448, i32 16, i32 1}, {i32, i32, i32} {i32 464, i32 16, i32 1}, {i32, i32, i32} {i32 480, i32 16, i32 1}, {i32, i32, i32} {i32 496, i32 16, i32 1}, {i32, i32, i32} {i32 512, i32 16, i32 1}, {i32, i32, i32} {i32 528, i32 16, i32 1}, {i32, i32, i32} {i32 544, i32 32, i32 1}, {i32, i32, i32} {i32 576, i32 64, i32 1}, {i32, i32, i32} {i32 640, i32 64, i32 1}, {i32, i32, i32} {i32 704, i32 64, i32 1}, {i32, i32, i32} {i32 768, i32 64, i32 1}, {i32, i32, i32} {i32 832, i32 64, i32 1}, {i32, i32, i32} {i32 896, i32 64, i32 1}, {i32, i32, i32} {i32 960, i32 64, i32 1}, {i32, i32, i32} {i32 1024, i32 64, i32 1}, {i32, i32, i32} {i32 1088, i32 64, i32 1}, {i32, i32, i32} {i32 1152, i32 64, i32 1}, {i32, i32, i32} {i32 1216, i32 64, i32 1}, {i32, i32, i32} {i32 1280, i32 64, i32 1}, {i32, i32, i32} {i32 1344, i32 64, i32 1}, {i32, i32, i32} {i32 1408, i32 64, i32 1}, {i32, i32, i32} {i32 1472, i32 64, i32 1}, {i32, i32, i32} {i32 1536, i32 64, i32 1}, {i32, i32, i32} {i32 1600, i32 64, i32 1}, {i32, i32, i32} {i32 1664, i32 64, i32 1}, {i32, i32, i32} {i32 1728, i32 64, i32 1}, {i32, i32, i32} {i32 1792, i32 64, i32 1}, {i32, i32, i32} {i32 1856, i32 64, i32 1}, {i32, i32, i32} {i32 1920, i32 64, i32 1}, {i32, i32, i32} {i32 1984, i32 64, i32 1}]}
@"WinExceptionPointers.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 128, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 64}, {i32, i32, i32} {i32 64, i32 64, i32 64}]}
@"IDEKAJmpBuf.TLD" = internal constant {i32, i32, [12 x {i32, i32, i32}]} {i32 768, i32 12, [12 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}, {i32, i32, i32} {i32 128, i32 64, i32 1}, {i32, i32, i32} {i32 192, i32 64, i32 1}, {i32, i32, i32} {i32 256, i32 64, i32 1}, {i32, i32, i32} {i32 320, i32 64, i32 1}, {i32, i32, i32} {i32 384, i32 64, i32 1}, {i32, i32, i32} {i32 448, i32 64, i32 1}, {i32, i32, i32} {i32 512, i32 64, i32 64}, {i32, i32, i32} {i32 576, i32 64, i32 64}, {i32, i32, i32} {i32 640, i32 64, i32 64}, {i32, i32, i32} {i32 704, i32 64, i32 64}]}
@"timespec.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 128, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}]}
@"PIXELFORMATDESCRIPTOR.TLD" = internal constant {i32, i32, [26 x {i32, i32, i32}]} {i32 320, i32 26, [26 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 16, i32 1}, {i32, i32, i32} {i32 16, i32 16, i32 1}, {i32, i32, i32} {i32 32, i32 32, i32 1}, {i32, i32, i32} {i32 64, i32 8, i32 1}, {i32, i32, i32} {i32 72, i32 8, i32 1}, {i32, i32, i32} {i32 80, i32 8, i32 1}, {i32, i32, i32} {i32 88, i32 8, i32 1}, {i32, i32, i32} {i32 96, i32 8, i32 1}, {i32, i32, i32} {i32 104, i32 8, i32 1}, {i32, i32, i32} {i32 112, i32 8, i32 1}, {i32, i32, i32} {i32 120, i32 8, i32 1}, {i32, i32, i32} {i32 128, i32 8, i32 1}, {i32, i32, i32} {i32 136, i32 8, i32 1}, {i32, i32, i32} {i32 144, i32 8, i32 1}, {i32, i32, i32} {i32 152, i32 8, i32 1}, {i32, i32, i32} {i32 160, i32 8, i32 1}, {i32, i32, i32} {i32 168, i32 8, i32 1}, {i32, i32, i32} {i32 176, i32 8, i32 1}, {i32, i32, i32} {i32 184, i32 8, i32 1}, {i32, i32, i32} {i32 192, i32 8, i32 1}, {i32, i32, i32} {i32 200, i32 8, i32 1}, {i32, i32, i32} {i32 208, i32 8, i32 1}, {i32, i32, i32} {i32 216, i32 8, i32 1}, {i32, i32, i32} {i32 224, i32 32, i32 1}, {i32, i32, i32} {i32 256, i32 32, i32 1}, {i32, i32, i32} {i32 288, i32 32, i32 1}]}
@"Thread.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 96, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 8}, {i32, i32, i32} {i32 64, i32 32, i32 1}]}
@"Mutex.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 512, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 512, i32 8}]}
@"RWLock.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 512, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 512, i32 8}]}
@"CondVar.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 512, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 512, i32 8}]}
@"Semaphore.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 256, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 256, i32 8}]}
@"Barrier.TLD" = internal constant {i32, i32, [4 x {i32, i32, i32}]} {i32 128, i32 4, [4 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 1}, {i32, i32, i32} {i32 32, i32 32, i32 1}, {i32, i32, i32} {i32 64, i32 32, i32 1}, {i32, i32, i32} {i32 96, i32 32, i32 1}]}
@"TLSKey.TLD" = internal constant {i32, i32, [1 x {i32, i32, i32}]} {i32 64, i32 1, [1 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 8}]}
@"WorkSlice.TLD" = internal constant {i32, i32, [21 x {i32, i32, i32}]} {i32 1216, i32 21, [21 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 32, i32 32}, {i32, i32, i32} {i32 32, i32 32, i32 32}, {i32, i32, i32} {i32 64, i32 32, i32 32}, {i32, i32, i32} {i32 96, i32 32, i32 32}, {i32, i32, i32} {i32 128, i32 64, i32 64}, {i32, i32, i32} {i32 192, i32 64, i32 64}, {i32, i32, i32} {i32 256, i32 64, i32 64}, {i32, i32, i32} {i32 320, i32 64, i32 64}, {i32, i32, i32} {i32 384, i32 64, i32 64}, {i32, i32, i32} {i32 448, i32 64, i32 64}, {i32, i32, i32} {i32 512, i32 64, i32 64}, {i32, i32, i32} {i32 576, i32 64, i32 64}, {i32, i32, i32} {i32 640, i32 64, i32 64}, {i32, i32, i32} {i32 704, i32 64, i32 64}, {i32, i32, i32} {i32 768, i32 64, i32 64}, {i32, i32, i32} {i32 832, i32 64, i32 64}, {i32, i32, i32} {i32 896, i32 64, i32 64}, {i32, i32, i32} {i32 960, i32 64, i32 64}, {i32, i32, i32} {i32 1024, i32 64, i32 64}, {i32, i32, i32} {i32 1088, i32 64, i32 64}, {i32, i32, i32} {i32 1152, i32 64, i32 64}]}
@"standard__memory__allocators__stdheap__g_slab_head" = internal global %"Slab"* null
@"standard__memory__allocators__stdheap__g_table" = internal global %"BlockEntry"* null
@"standard__memory__allocators__stdheap__g_bins" = internal global [9 x %"FreeNode"*] zeroinitializer
declare external i32 @"system"(i8* %"arg0")

declare external i8* @"LoadLibraryA"(i8* %"arg0")

declare external i8* @"GetProcAddress"(i8* %"arg0", i8* %"arg1")

declare external void @"GetSystemInfo"(i8* %"arg0")

declare external i8* @"malloc"(i64 %"arg0")

declare external void @"free"(i8* %"arg0")

declare external i8* @"calloc"(i64 %"arg0", i64 %"arg1")

declare external i8* @"realloc"(i8* %"arg0", i64 %"arg1")

declare external i64 @"VirtualAlloc"(i64 %"arg0.3", i64 %"arg1.3", i32 %"arg2.3", i32 %"arg3.3")

declare external i1 @"VirtualFree"(i64 %"arg0.3", i64 %"arg1.3", i32 %"arg2.3")

declare external i1 @"VirtualProtect"(i64 %"arg0.1", i64 %"arg1.1", i32 %"arg2.1", i32* %"arg3.1")

declare external i1 @"FlushInstructionCache"(i64 %"arg0", i64 %"arg1", i64 %"arg2")

declare external i8* @"AddVectoredExceptionHandler"(i32 %"First", i8* %"Handler")

declare external i32 @"SetThreadStackGuarantee"(i32* %"StackSizeInBytes")

declare external i1 @"QueryPerformanceCounter"(i64* %"arg0")

declare external i1 @"QueryPerformanceFrequency"(i64* %"arg0")

declare external i32 @"GetTickCount"()

declare external void @"Sleep"(i32 %"arg0.1")

declare external i8* @"fgets"(i8* %"arg0", i32 %"arg1", i8* %"arg2")

declare external i8* @"fopen"(i8* %"arg0", i8* %"arg1")

declare external i32 @"fclose"(i8* %"arg0")

declare external i64 @"GetStdHandle"(i32 %"nStdHandle")

declare external i16* @"GetCommandLineW"()

declare external i8* @"LocalFree"(i8* %"x")

declare external void @"RtlExitUserProcess"(i32 %"code")

declare external i8* @"CreateThread"(i8* %"arg0", i64 %"arg1", i8* %"arg2", i8* %"arg3", i32 %"arg4", i32* %"arg5")

declare external i32 @"WaitForSingleObject"(i8* %"arg0", i32 %"arg1")

declare external i32 @"CloseHandle"(i8* %"arg0.1")

declare external i32 @"GetCurrentThreadId"()

declare external i32 @"SwitchToThread"()

declare external void @"ExitThread"(i32 %"arg0")

declare external void @"InitializeCriticalSection"(i8* %"arg0")

declare external void @"DeleteCriticalSection"(i8* %"arg0")

declare external void @"EnterCriticalSection"(i8* %"arg0")

declare external void @"LeaveCriticalSection"(i8* %"arg0")

declare external i32 @"TryEnterCriticalSection"(i8* %"arg0")

declare external void @"InitializeSRWLock"(i8* %"arg0")

declare external void @"AcquireSRWLockExclusive"(i8* %"arg0")

declare external void @"ReleaseSRWLockExclusive"(i8* %"arg0")

declare external void @"AcquireSRWLockShared"(i8* %"arg0")

declare external void @"ReleaseSRWLockShared"(i8* %"arg0")

declare external i32 @"TryAcquireSRWLockExclusive"(i8* %"arg0")

declare external i32 @"TryAcquireSRWLockShared"(i8* %"arg0")

declare external void @"InitializeConditionVariable"(i8* %"arg0")

declare external i32 @"SleepConditionVariableCS"(i8* %"arg0", i8* %"arg1", i32 %"arg2")

declare external void @"WakeConditionVariable"(i8* %"arg0")

declare external void @"WakeAllConditionVariable"(i8* %"arg0")

declare external i8* @"CreateSemaphoreA"(i8* %"arg0", i32 %"arg1", i32 %"arg2", i8* %"arg3")

declare external i32 @"ReleaseSemaphore"(i8* %"arg0", i32 %"arg1", i32* %"arg2")

declare external i32 @"TlsAlloc"()

declare external i32 @"TlsFree"(i32 %"arg0")

declare external i8* @"TlsGetValue"(i32 %"arg0")

declare external i32 @"TlsSetValue"(i32 %"arg0", i8* %"arg1")

@"STDLIB_GVP" = internal global i8* null
@"U64MAXVAL" = internal global i64 -1
@"_fltused" = internal global i1 1
@"nt_threshold" = internal global i64 0
@"ermsb" = internal global i1 0
define void @"__static_init"()
{
entry:
  ret void
cont:
  ret void
}

@"WIN_STDOUT_HANDLE" = internal global i64 0
define void @"standard__system__cpu__cpuid_query__0__ret_voidE1"()
{
entry:
  %"g_cpuid_run" = load i1, i1* @"standard__system__cpu__g_cpuid_run"
  %"eax" = alloca i64
  %"ebx" = alloca i64
  %"ecx" = alloca i64
  %"edx" = alloca i64
  switch i1 %"g_cpuid_run", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  store i64 0, i64* %"eax"
  store i64 0, i64* %"ebx"
  store i64 0, i64* %"ecx"
  store i64 0, i64* %"edx"
  %".9" = call {i64, i64, i64, i64} asm sideeffect "movq $$7,  %rax
                    xorq %rcx, %rcx
                    cpuid
                    movq %rax, $0
                    movq %rbx, $1
                    movq %rcx, $2
                    movq %rdx, $3", "=r,=r,=r,=r,~{rax},~{rbx},~{rcx},~{rdx},~{memory}"
()
  %".10" = extractvalue {i64, i64, i64, i64} %".9", 0
  store i64 %".10", i64* %"eax"
  %".12" = extractvalue {i64, i64, i64, i64} %".9", 1
  store i64 %".12", i64* %"ebx"
  %".14" = extractvalue {i64, i64, i64, i64} %".9", 2
  store i64 %".14", i64* %"ecx"
  %".16" = extractvalue {i64, i64, i64, i64} %".9", 3
  store i64 %".16", i64* %"edx"
  %"ebx.1" = load i64, i64* %"ebx"
  %".18" = zext i32 9 to i64
  %".19" = ashr i64 %"ebx.1", %".18"
  %".20" = and i64 %".19", 1
  %".21" = trunc i64 %".20" to i1
  store i1 %".21", i1* @"standard__system__cpu__g_ermsb"
  %".23" = call i64 asm sideeffect "movq $$0x80000006, %rax
                    cpuid
                    movq %rcx, $0", "=r,~{rax},~{rbx},~{rcx},~{rdx},~{memory}"
()
  store i64 %".23", i64* %"ecx"
  %"ecx.1" = load i64, i64* %"ecx"
  %".25" = zext i32 16 to i64
  %".26" = ashr i64 %"ecx.1", %".25"
  %".27" = and i64 %".26", 65535
  %".28" = zext i32 10 to i64
  %".29" = shl i64 %".27", %".28"
  store i64 %".29", i64* @"standard__system__cpu__g_l2_bytes"
  %"g_l2_bytes" = load i64, i64* @"standard__system__cpu__g_l2_bytes"
  %".31" = icmp eq i64 %"g_l2_bytes", 0
  switch i1 %".31", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  ret void
switch_default:
  br label %"switch_merge"
switch_merge.1:
  store i1 true, i1* @"standard__system__cpu__g_cpuid_run"
  ret void
switch_case_0.1:
  store i64 262144, i64* @"standard__system__cpu__g_l2_bytes"
  br label %"switch_merge.1"
switch_default.1:
  br label %"switch_merge.1"
}

define i64 @"standard__system__cpu__l2_bytes__0__ret_ulongE1"()
{
entry:
  call void @"standard__system__cpu__cpuid_query__0__ret_voidE1"()
  %"g_l2_bytes" = load i64, i64* @"standard__system__cpu__g_l2_bytes"
  ret i64 %"g_l2_bytes"
}

define i1 @"standard__system__cpu__ermsb__0__ret_boolE1"()
{
entry:
  call void @"standard__system__cpu__cpuid_query__0__ret_voidE1"()
  %"g_ermsb" = load i1, i1* @"standard__system__cpu__g_ermsb"
  ret i1 %"g_ermsb"
}

define i8* @"memset"(i8* %"dst", i32 %"c", i64 %"n")
{
entry:
  %"dst.addr" = alloca i8*
  store i8* %"dst", i8** %"dst.addr"
  %"c.addr" = alloca i32
  store i32 %"c", i32* %"c.addr"
  %"n.addr" = alloca i64
  store i64 %"n", i64* %"n.addr"
  %"d" = alloca i8*
  %"dst.1" = load i8*, i8** %"dst.addr"
  store i8* %"dst.1", i8** %"d"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n.addr"
  %".11" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".11", label %"while.body", label %"while.end"
while.body:
  %"c.1" = load i32, i32* %"c.addr"
  %".13" = trunc i32 %"c.1" to i8
  %"d.1" = load i8*, i8** %"d"
  %"i.2" = load i64, i64* %"i"
  %".14" = getelementptr inbounds i8, i8* %"d.1", i64 %"i.2"
  store i8 %".13", i8* %".14"
  %"i.3" = load i64, i64* %"i"
  %".16" = add i64 %"i.3", 1
  store i64 %".16", i64* %"i"
  br label %"while.cond"
while.end:
  %"dst.2" = load i8*, i8** %"dst.addr"
  ret i8* %"dst.2"
}

define i64 @"standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"bytes")
{
entry:
  %"bytes.addr" = alloca i64
  store i64 %"bytes", i64* %"bytes.addr"
  %"bytes.1" = load i64, i64* %"bytes.addr"
  %".4" = sext i32 0 to i64
  %".5" = call i64 @"VirtualAlloc"(i64 %".4", i64 %"bytes.1", i32 12288, i32 4)
  ret i64 %".5"
}

define void @"standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(i64 %"ptr", i64 %"bytes")
{
entry:
  %"ptr.addr" = alloca i64
  store i64 %"ptr", i64* %"ptr.addr"
  %"bytes.addr" = alloca i64
  store i64 %"bytes", i64* %"bytes.addr"
  %"ptr.1" = load i64, i64* %"ptr.addr"
  %".6" = sext i32 0 to i64
  %".7" = call i1 @"VirtualFree"(i64 %"ptr.1", i64 %".6", i32 32768)
  ret void
}

define i64 @"standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x") alwaysinline
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"r" = alloca i64
  store i64 0, i64* %"r"
  %"x_load" = load i64, i64* %"x.addr"
  %".5" = call i64 asm  "bsrq $1, $0", "=r,r,~{cc}"
(i64 %"x_load")
  store i64 %".5", i64* %"r"
  %"r.1" = load i64, i64* %"r"
  ret i64 %"r.1"
}

define i64 @"standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"cls") alwaysinline
{
entry:
  %"cls.addr" = alloca i64
  store i64 %"cls", i64* %"cls.addr"
  %"cls.1" = load i64, i64* %"cls.addr"
  %".4" = zext i32 8 to i64
  %".5" = icmp ugt i64 %"cls.1", %".4"
  switch i1 %".5", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %".10" = sext i32 16 to i64
  %"cls.2" = load i64, i64* %"cls.addr"
  %".11" = shl i64 %".10", %"cls.2"
  ret i64 %".11"
switch_case_0:
  %".7" = sext i32 4096 to i64
  ret i64 %".7"
switch_default:
  br label %"switch_merge"
}

define void @"standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1"(i64 %"cls", %"FreeNode"* %"node") alwaysinline
{
entry:
  %"cls.addr" = alloca i64
  store i64 %"cls", i64* %"cls.addr"
  %"node.addr" = alloca %"FreeNode"*
  store %"FreeNode"* %"node", %"FreeNode"** %"node.addr"
  %"cls.1" = load i64, i64* %"cls.addr"
  %".6" = zext i32 8 to i64
  %".7" = icmp ugt i64 %"cls.1", %".6"
  switch i1 %".7", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"cls.2" = load i64, i64* %"cls.addr"
  %"idx_trunc" = trunc i64 %"cls.2" to i32
  %"array_gep" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i32 %"idx_trunc"
  %"array_load" = load %"FreeNode"*, %"FreeNode"** %"array_gep"
  %"node_ptr" = load %"FreeNode"*, %"FreeNode"** %"node.addr"
  %".11" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"node_ptr", i32 0, i32 0
  store %"FreeNode"* %"array_load", %"FreeNode"** %".11"
  %"obj_this" = load %"FreeNode"*, %"FreeNode"** %"node.addr"
  %"node.1" = load %"FreeNode"*, %"FreeNode"** %"node.addr"
  %"cls.3" = load i64, i64* %"cls.addr"
  %".13" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i64 %"cls.3"
  store %"FreeNode"* %"node.1", %"FreeNode"** %".13"
  ret void
switch_case_0:
  ret void
switch_default:
  br label %"switch_merge"
}

define i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr", i64 %"cap") alwaysinline
{
entry:
  %"ptr.addr" = alloca i64
  store i64 %"ptr", i64* %"ptr.addr"
  %"cap.addr" = alloca i64
  store i64 %"cap", i64* %"cap.addr"
  %"h" = alloca i64
  %"ptr.1" = load i64, i64* %"ptr.addr"
  %".6" = sext i32 4 to i64
  %".7" = lshr i64 %"ptr.1", %".6"
  store i64 %".7", i64* %"h"
  %"h.1" = load i64, i64* %"h"
  %".9" = mul i64 %"h.1", 11400714819323198485
  store i64 %".9", i64* %"h"
  %"h.2" = load i64, i64* %"h"
  %"h.3" = load i64, i64* %"h"
  %".11" = sext i32 32 to i64
  %".12" = lshr i64 %"h.3", %".11"
  %".13" = xor i64 %"h.2", %".12"
  store i64 %".13", i64* %"h"
  %"h.4" = load i64, i64* %"h"
  %"cap.1" = load i64, i64* %"cap.addr"
  %".15" = sext i32 1 to i64
  %".16" = sub i64 %"cap.1", %".15"
  %".17" = and i64 %"h.4", %".16"
  ret i64 %".17"
}

define void @"standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"BlockEntry"* %"tbl", i64 %"cap", i64 %"key", i64 %"size", i64 %"kind", i64 %"slab")
{
entry:
  %"tbl.addr" = alloca %"BlockEntry"*
  store %"BlockEntry"* %"tbl", %"BlockEntry"** %"tbl.addr"
  %"cap.addr" = alloca i64
  store i64 %"cap", i64* %"cap.addr"
  %"key.addr" = alloca i64
  store i64 %"key", i64* %"key.addr"
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"kind.addr" = alloca i64
  store i64 %"kind", i64* %"kind.addr"
  %"slab.addr" = alloca i64
  store i64 %"slab", i64* %"slab.addr"
  %"idx" = alloca i64
  %"key.1" = load i64, i64* %"key.addr"
  %"cap.1" = load i64, i64* %"cap.addr"
  %".14" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"key.1", i64 %"cap.1")
  store i64 %".14", i64* %"idx"
  br label %"while.cond"
while.cond:
  %"tbl.1" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.1" = load i64, i64* %"idx"
  %"idx_trunc" = trunc i64 %"idx.1" to i32
  %"ptr_gep" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.1", i32 %"idx_trunc"
  %"tbl.2" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.2" = load i64, i64* %"idx"
  %"idx_trunc.1" = trunc i64 %"idx.2" to i32
  %"ptr_gep.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.2", i32 %"idx_trunc.1"
  %"key_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.1", i32 0, i32 0
  %"key.2" = load i64, i64* %"key_ptr"
  %"not_zero" = icmp ne i64 %"key.2", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"tobool" = icmp ne i8 %"not_null_result", 0
  br i1 %"tobool", label %"while.body", label %"while.end"
while.body:
  %"idx.3" = load i64, i64* %"idx"
  %".18" = zext i32 1 to i64
  %".19" = add i64 %"idx.3", %".18"
  %"cap.2" = load i64, i64* %"cap.addr"
  %".20" = zext i32 1 to i64
  %".21" = sub i64 %"cap.2", %".20"
  %".22" = and i64 %".19", %".21"
  store i64 %".22", i64* %"idx"
  br label %"while.cond"
while.end:
  %"key.3" = load i64, i64* %"key.addr"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"tbl.3" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.4" = load i64, i64* %"idx"
  %"idx_trunc.2" = trunc i64 %"idx.4" to i32
  %"ptr_gep.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.3", i32 %"idx_trunc.2"
  %".25" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.2", i32 0, i32 0
  store i64 %"key.3", i64* %".25"
  %"size.1" = load i64, i64* %"size.addr"
  %"obj_this.1" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"tbl.4" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.5" = load i64, i64* %"idx"
  %"idx_trunc.3" = trunc i64 %"idx.5" to i32
  %"ptr_gep.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.4", i32 %"idx_trunc.3"
  %".27" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.3", i32 0, i32 1
  store i64 %"size.1", i64* %".27"
  %"kind.1" = load i64, i64* %"kind.addr"
  %"obj_this.2" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"tbl.5" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.6" = load i64, i64* %"idx"
  %"idx_trunc.4" = trunc i64 %"idx.6" to i32
  %"ptr_gep.4" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.5", i32 %"idx_trunc.4"
  %".29" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.4", i32 0, i32 2
  store i64 %"kind.1", i64* %".29"
  %"slab.1" = load i64, i64* %"slab.addr"
  %"obj_this.3" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"tbl.6" = load %"BlockEntry"*, %"BlockEntry"** %"tbl.addr"
  %"idx.7" = load i64, i64* %"idx"
  %"idx_trunc.5" = trunc i64 %"idx.7" to i32
  %"ptr_gep.5" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"tbl.6", i32 %"idx_trunc.5"
  %".31" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.5", i32 0, i32 3
  store i64 %"slab.1", i64* %".31"
  ret void
}

define i1 @"standard__memory__allocators__stdheap__table_grow__0__ret_boolE1"()
{
entry:
  %"new_cap" = alloca i64
  %"g_table_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".2" = zext i32 2 to i64
  %".3" = mul i64 %"g_table_cap", %".2"
  store i64 %".3", i64* %"new_cap"
  %"new_bytes" = alloca i64
  %"new_cap.1" = load i64, i64* %"new_cap"
  %".5" = zext i32 32 to i64
  %".6" = mul i64 %"new_cap.1", %".5"
  store i64 %".6", i64* %"new_bytes"
  %"raw" = alloca i64
  %"new_bytes.1" = load i64, i64* %"new_bytes"
  %".8" = call i64 @"standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"new_bytes.1")
  store i64 %".8", i64* %"raw"
  %"raw.1" = load i64, i64* %"raw"
  %".10" = zext i32 0 to i64
  %".11" = icmp eq i64 %"raw.1", %".10"
  %"j" = alloca i64
  %"new_tbl" = alloca %"BlockEntry"*
  %"old_tbl_addr" = alloca i64
  %"rm_idx" = alloca i64
  %"rm_hole" = alloca i64
  %"rm_next" = alloca i64
  %"rm_natural" = alloca i64
  %"rm_found" = alloca i1
  %"rm_shift" = alloca i1
  %"rm_in_range" = alloca i1
  switch i1 %".11", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  store i64 0, i64* %"j"
  %"raw.2" = load i64, i64* %"raw"
  %"int_to_ptr" = inttoptr i64 %"raw.2" to %"BlockEntry"*
  store %"BlockEntry"* %"int_to_ptr", %"BlockEntry"** %"new_tbl"
  %".17" = sext i32 0 to i64
  store i64 %".17", i64* @"standard__memory__allocators__stdheap__g_table_count"
  br label %"while.cond"
switch_case_0:
  ret i1 false
switch_default:
  br label %"switch_merge"
while.cond:
  %"j.1" = load i64, i64* %"j"
  %"g_table_cap.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".20" = icmp ult i64 %"j.1", %"g_table_cap.1"
  br i1 %".20", label %"while.body", label %"while.end"
while.body:
  %"g_table" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.2" = load i64, i64* %"j"
  %"idx_trunc" = trunc i64 %"j.2" to i32
  %"ptr_gep" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table", i32 %"idx_trunc"
  %"g_table.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.3" = load i64, i64* %"j"
  %"idx_trunc.1" = trunc i64 %"j.3" to i32
  %"ptr_gep.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.1", i32 %"idx_trunc.1"
  %"key_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.1", i32 0, i32 0
  %"key" = load i64, i64* %"key_ptr"
  %"not_zero" = icmp ne i64 %"key", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  switch i8 %"not_null_result", label %"switch_default.1" [i8 1, label %"switch_case_0.1"]
while.end:
  %"obj_this.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.10" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"ptr_to_int" = ptrtoint %"BlockEntry"* %"g_table.10" to i64
  store i64 %"ptr_to_int", i64* %"old_tbl_addr"
  %"old_tbl_addr.1" = load i64, i64* %"old_tbl_addr"
  %"new_cap.3" = load i64, i64* %"new_cap"
  %".32" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"old_tbl_addr.1", i64 %"new_cap.3")
  store i64 %".32", i64* %"rm_idx"
  store i64 0, i64* %"rm_hole"
  store i64 0, i64* %"rm_next"
  store i64 0, i64* %"rm_natural"
  store i1 0, i1* %"rm_found"
  store i1 0, i1* %"rm_shift"
  store i1 0, i1* %"rm_in_range"
  br label %"while.cond.1"
switch_merge.1:
  %"j.12" = load i64, i64* %"j"
  %".28" = add i64 %"j.12", 1
  store i64 %".28", i64* %"j"
  br label %"while.cond"
switch_case_0.1:
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.1" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_cap.2" = load i64, i64* %"new_cap"
  %"g_table.2" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.4" = load i64, i64* %"j"
  %"idx_trunc.2" = trunc i64 %"j.4" to i32
  %"ptr_gep.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.2", i32 %"idx_trunc.2"
  %"g_table.3" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.5" = load i64, i64* %"j"
  %"idx_trunc.3" = trunc i64 %"j.5" to i32
  %"ptr_gep.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.3", i32 %"idx_trunc.3"
  %"key_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.3", i32 0, i32 0
  %"key.1" = load i64, i64* %"key_ptr.1"
  %"g_table.4" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.6" = load i64, i64* %"j"
  %"idx_trunc.4" = trunc i64 %"j.6" to i32
  %"ptr_gep.4" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.4", i32 %"idx_trunc.4"
  %"g_table.5" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.7" = load i64, i64* %"j"
  %"idx_trunc.5" = trunc i64 %"j.7" to i32
  %"ptr_gep.5" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.5", i32 %"idx_trunc.5"
  %"size_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.5", i32 0, i32 1
  %"size" = load i64, i64* %"size_ptr"
  %"g_table.6" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.8" = load i64, i64* %"j"
  %"idx_trunc.6" = trunc i64 %"j.8" to i32
  %"ptr_gep.6" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.6", i32 %"idx_trunc.6"
  %"g_table.7" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.9" = load i64, i64* %"j"
  %"idx_trunc.7" = trunc i64 %"j.9" to i32
  %"ptr_gep.7" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.7", i32 %"idx_trunc.7"
  %"kind_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.7", i32 0, i32 2
  %"kind" = load i64, i64* %"kind_ptr"
  %"g_table.8" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.10" = load i64, i64* %"j"
  %"idx_trunc.8" = trunc i64 %"j.10" to i32
  %"ptr_gep.8" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.8", i32 %"idx_trunc.8"
  %"g_table.9" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"j.11" = load i64, i64* %"j"
  %"idx_trunc.9" = trunc i64 %"j.11" to i32
  %"ptr_gep.9" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.9", i32 %"idx_trunc.9"
  %"slab_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.9", i32 0, i32 3
  %"slab" = load i64, i64* %"slab_ptr"
  call void @"standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"BlockEntry"* %"new_tbl.1", i64 %"new_cap.2", i64 %"key.1", i64 %"size", i64 %"kind", i64 %"slab")
  %"g_table_count" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".24" = add i64 %"g_table_count", 1
  store i64 %".24", i64* @"standard__memory__allocators__stdheap__g_table_count"
  br label %"switch_merge.1"
switch_default.1:
  br label %"switch_merge.1"
while.cond.1:
  %"new_tbl.2" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_idx.1" = load i64, i64* %"rm_idx"
  %"idx_trunc.10" = trunc i64 %"rm_idx.1" to i32
  %"ptr_gep.10" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.2", i32 %"idx_trunc.10"
  %"new_tbl.3" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_idx.2" = load i64, i64* %"rm_idx"
  %"idx_trunc.11" = trunc i64 %"rm_idx.2" to i32
  %"ptr_gep.11" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.3", i32 %"idx_trunc.11"
  %"key_ptr.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.11", i32 0, i32 0
  %"key.2" = load i64, i64* %"key_ptr.2"
  %"not_zero.1" = icmp ne i64 %"key.2", 0
  %"not_null_result.1" = zext i1 %"not_zero.1" to i8
  %"tobool" = icmp ne i8 %"not_null_result.1", 0
  br i1 %"tobool", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"new_tbl.4" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_idx.3" = load i64, i64* %"rm_idx"
  %"idx_trunc.12" = trunc i64 %"rm_idx.3" to i32
  %"ptr_gep.12" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.4", i32 %"idx_trunc.12"
  %"new_tbl.5" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_idx.4" = load i64, i64* %"rm_idx"
  %"idx_trunc.13" = trunc i64 %"rm_idx.4" to i32
  %"ptr_gep.13" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.5", i32 %"idx_trunc.13"
  %"key_ptr.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.13", i32 0, i32 0
  %"key.3" = load i64, i64* %"key_ptr.3"
  %"old_tbl_addr.2" = load i64, i64* %"old_tbl_addr"
  %".42" = icmp eq i64 %"key.3", %"old_tbl_addr.2"
  switch i1 %".42", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
while.end.1:
  %"obj_this.8" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.11" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"ptr_to_int.1" = ptrtoint %"BlockEntry"* %"g_table.11" to i64
  %"g_table_slab_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_slab_cap"
  call void @"standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.1", i64 %"g_table_slab_cap")
  %"obj_this.9" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.24" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  store %"BlockEntry"* %"new_tbl.24", %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"new_cap.8" = load i64, i64* %"new_cap"
  store i64 %"new_cap.8", i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %"new_bytes.2" = load i64, i64* %"new_bytes"
  store i64 %"new_bytes.2", i64* @"standard__memory__allocators__stdheap__g_table_slab_cap"
  %"obj_this.10" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.12" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table_cap.2" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %"raw.3" = load i64, i64* %"raw"
  %"new_bytes.3" = load i64, i64* %"new_bytes"
  %"raw.4" = load i64, i64* %"raw"
  %".135" = sext i32 2 to i64
  call void @"standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"BlockEntry"* %"g_table.12", i64 %"g_table_cap.2", i64 %"raw.3", i64 %"new_bytes.3", i64 %".135", i64 %"raw.4")
  %"g_table_count.2" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".137" = add i64 %"g_table_count.2", 1
  store i64 %".137", i64* @"standard__memory__allocators__stdheap__g_table_count"
  ret i1 true
switch_merge.2:
  %"rm_found.1" = load i1, i1* %"rm_found"
  switch i1 %"rm_found.1", label %"switch_default.11" [i1 1, label %"switch_case_0.11"]
switch_case_0.2:
  %"obj_this.2" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.6" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_idx.5" = load i64, i64* %"rm_idx"
  %"idx_trunc.14" = trunc i64 %"rm_idx.5" to i32
  %"ptr_gep.14" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.6", i32 %"idx_trunc.14"
  %".44" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.14", i32 0, i32 0
  %".45" = sext i32 0 to i64
  store i64 %".45", i64* %".44"
  %"g_table_count.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".47" = sub i64 %"g_table_count.1", 1
  store i64 %".47", i64* @"standard__memory__allocators__stdheap__g_table_count"
  %"rm_idx.6" = load i64, i64* %"rm_idx"
  store i64 %"rm_idx.6", i64* %"rm_hole"
  %"rm_idx.7" = load i64, i64* %"rm_idx"
  %".50" = zext i32 1 to i64
  %".51" = add i64 %"rm_idx.7", %".50"
  %"new_cap.4" = load i64, i64* %"new_cap"
  %".52" = zext i32 1 to i64
  %".53" = sub i64 %"new_cap.4", %".52"
  %".54" = and i64 %".51", %".53"
  store i64 %".54", i64* %"rm_next"
  br label %"while.cond.2"
switch_default.2:
  br label %"switch_merge.2"
while.cond.2:
  %"new_tbl.7" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.1" = load i64, i64* %"rm_next"
  %"idx_trunc.15" = trunc i64 %"rm_next.1" to i32
  %"ptr_gep.15" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.7", i32 %"idx_trunc.15"
  %"new_tbl.8" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.2" = load i64, i64* %"rm_next"
  %"idx_trunc.16" = trunc i64 %"rm_next.2" to i32
  %"ptr_gep.16" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.8", i32 %"idx_trunc.16"
  %"key_ptr.4" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.16", i32 0, i32 0
  %"key.4" = load i64, i64* %"key_ptr.4"
  %"not_zero.2" = icmp ne i64 %"key.4", 0
  %"not_null_result.2" = zext i1 %"not_zero.2" to i8
  %"tobool.1" = icmp ne i8 %"not_null_result.2", 0
  br i1 %"tobool.1", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"new_tbl.9" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.3" = load i64, i64* %"rm_next"
  %"idx_trunc.17" = trunc i64 %"rm_next.3" to i32
  %"ptr_gep.17" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.9", i32 %"idx_trunc.17"
  %"new_tbl.10" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.4" = load i64, i64* %"rm_next"
  %"idx_trunc.18" = trunc i64 %"rm_next.4" to i32
  %"ptr_gep.18" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.10", i32 %"idx_trunc.18"
  %"key_ptr.5" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.18", i32 0, i32 0
  %"key.5" = load i64, i64* %"key_ptr.5"
  %"new_cap.5" = load i64, i64* %"new_cap"
  %".58" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"key.5", i64 %"new_cap.5")
  store i64 %".58", i64* %"rm_natural"
  %"rm_hole.1" = load i64, i64* %"rm_hole"
  %"rm_next.5" = load i64, i64* %"rm_next"
  %".60" = icmp ult i64 %"rm_hole.1", %"rm_next.5"
  switch i1 %".60", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
while.end.2:
  store i1 true, i1* %"rm_found"
  br label %"switch_merge.2"
switch_merge.3:
  %"rm_shift.1" = load i1, i1* %"rm_shift"
  switch i1 %"rm_shift.1", label %"switch_default.10" [i1 1, label %"switch_case_0.10"]
switch_case_0.3:
  %"rm_natural.1" = load i64, i64* %"rm_natural"
  %"rm_hole.2" = load i64, i64* %"rm_hole"
  %".62" = icmp ugt i64 %"rm_natural.1", %"rm_hole.2"
  switch i1 %".62", label %"switch_default.4" [i1 1, label %"switch_case_0.4"]
switch_default.3:
  %"rm_natural.3" = load i64, i64* %"rm_natural"
  %"rm_hole.3" = load i64, i64* %"rm_hole"
  %".79" = icmp ugt i64 %"rm_natural.3", %"rm_hole.3"
  switch i1 %".79", label %"switch_default.7" [i1 1, label %"switch_case_0.7"]
switch_merge.4:
  %"rm_in_range.1" = load i1, i1* %"rm_in_range"
  switch i1 %"rm_in_range.1", label %"switch_default.6" [i1 1, label %"switch_case_0.6"]
switch_case_0.4:
  %"rm_natural.2" = load i64, i64* %"rm_natural"
  %"rm_next.6" = load i64, i64* %"rm_next"
  %".64" = icmp ule i64 %"rm_natural.2", %"rm_next.6"
  switch i1 %".64", label %"switch_default.5" [i1 1, label %"switch_case_0.5"]
switch_default.4:
  store i1 false, i1* %"rm_in_range"
  br label %"switch_merge.4"
switch_merge.5:
  br label %"switch_merge.4"
switch_case_0.5:
  store i1 true, i1* %"rm_in_range"
  br label %"switch_merge.5"
switch_default.5:
  store i1 false, i1* %"rm_in_range"
  br label %"switch_merge.5"
switch_merge.6:
  br label %"switch_merge.3"
switch_case_0.6:
  store i1 false, i1* %"rm_shift"
  br label %"switch_merge.6"
switch_default.6:
  store i1 true, i1* %"rm_shift"
  br label %"switch_merge.6"
switch_merge.7:
  %"rm_in_range.2" = load i1, i1* %"rm_in_range"
  switch i1 %"rm_in_range.2", label %"switch_default.9" [i1 1, label %"switch_case_0.9"]
switch_case_0.7:
  store i1 true, i1* %"rm_in_range"
  br label %"switch_merge.7"
switch_default.7:
  %"rm_natural.4" = load i64, i64* %"rm_natural"
  %"rm_next.7" = load i64, i64* %"rm_next"
  %".83" = icmp ule i64 %"rm_natural.4", %"rm_next.7"
  switch i1 %".83", label %"switch_default.8" [i1 1, label %"switch_case_0.8"]
switch_merge.8:
  br label %"switch_merge.7"
switch_case_0.8:
  store i1 true, i1* %"rm_in_range"
  br label %"switch_merge.8"
switch_default.8:
  store i1 false, i1* %"rm_in_range"
  br label %"switch_merge.8"
switch_merge.9:
  br label %"switch_merge.3"
switch_case_0.9:
  store i1 false, i1* %"rm_shift"
  br label %"switch_merge.9"
switch_default.9:
  store i1 true, i1* %"rm_shift"
  br label %"switch_merge.9"
switch_merge.10:
  %"rm_next.18" = load i64, i64* %"rm_next"
  %".111" = zext i32 1 to i64
  %".112" = add i64 %"rm_next.18", %".111"
  %"new_cap.6" = load i64, i64* %"new_cap"
  %".113" = zext i32 1 to i64
  %".114" = sub i64 %"new_cap.6", %".113"
  %".115" = and i64 %".112", %".114"
  store i64 %".115", i64* %"rm_next"
  br label %"while.cond.2"
switch_case_0.10:
  %"new_tbl.11" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.8" = load i64, i64* %"rm_next"
  %"idx_trunc.19" = trunc i64 %"rm_next.8" to i32
  %"ptr_gep.19" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.11", i32 %"idx_trunc.19"
  %"new_tbl.12" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.9" = load i64, i64* %"rm_next"
  %"idx_trunc.20" = trunc i64 %"rm_next.9" to i32
  %"ptr_gep.20" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.12", i32 %"idx_trunc.20"
  %"key_ptr.6" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.20", i32 0, i32 0
  %"key.6" = load i64, i64* %"key_ptr.6"
  %"obj_this.3" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.13" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_hole.4" = load i64, i64* %"rm_hole"
  %"idx_trunc.21" = trunc i64 %"rm_hole.4" to i32
  %"ptr_gep.21" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.13", i32 %"idx_trunc.21"
  %".97" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.21", i32 0, i32 0
  store i64 %"key.6", i64* %".97"
  %"new_tbl.14" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.10" = load i64, i64* %"rm_next"
  %"idx_trunc.22" = trunc i64 %"rm_next.10" to i32
  %"ptr_gep.22" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.14", i32 %"idx_trunc.22"
  %"new_tbl.15" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.11" = load i64, i64* %"rm_next"
  %"idx_trunc.23" = trunc i64 %"rm_next.11" to i32
  %"ptr_gep.23" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.15", i32 %"idx_trunc.23"
  %"size_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.23", i32 0, i32 1
  %"size.1" = load i64, i64* %"size_ptr.1"
  %"obj_this.4" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.16" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_hole.5" = load i64, i64* %"rm_hole"
  %"idx_trunc.24" = trunc i64 %"rm_hole.5" to i32
  %"ptr_gep.24" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.16", i32 %"idx_trunc.24"
  %".99" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.24", i32 0, i32 1
  store i64 %"size.1", i64* %".99"
  %"new_tbl.17" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.12" = load i64, i64* %"rm_next"
  %"idx_trunc.25" = trunc i64 %"rm_next.12" to i32
  %"ptr_gep.25" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.17", i32 %"idx_trunc.25"
  %"new_tbl.18" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.13" = load i64, i64* %"rm_next"
  %"idx_trunc.26" = trunc i64 %"rm_next.13" to i32
  %"ptr_gep.26" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.18", i32 %"idx_trunc.26"
  %"kind_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.26", i32 0, i32 2
  %"kind.1" = load i64, i64* %"kind_ptr.1"
  %"obj_this.5" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.19" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_hole.6" = load i64, i64* %"rm_hole"
  %"idx_trunc.27" = trunc i64 %"rm_hole.6" to i32
  %"ptr_gep.27" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.19", i32 %"idx_trunc.27"
  %".101" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.27", i32 0, i32 2
  store i64 %"kind.1", i64* %".101"
  %"new_tbl.20" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.14" = load i64, i64* %"rm_next"
  %"idx_trunc.28" = trunc i64 %"rm_next.14" to i32
  %"ptr_gep.28" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.20", i32 %"idx_trunc.28"
  %"new_tbl.21" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.15" = load i64, i64* %"rm_next"
  %"idx_trunc.29" = trunc i64 %"rm_next.15" to i32
  %"ptr_gep.29" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.21", i32 %"idx_trunc.29"
  %"slab_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.29", i32 0, i32 3
  %"slab.1" = load i64, i64* %"slab_ptr.1"
  %"obj_this.6" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.22" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_hole.7" = load i64, i64* %"rm_hole"
  %"idx_trunc.30" = trunc i64 %"rm_hole.7" to i32
  %"ptr_gep.30" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.22", i32 %"idx_trunc.30"
  %".103" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.30", i32 0, i32 3
  store i64 %"slab.1", i64* %".103"
  %"obj_this.7" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"new_tbl.23" = load %"BlockEntry"*, %"BlockEntry"** %"new_tbl"
  %"rm_next.16" = load i64, i64* %"rm_next"
  %"idx_trunc.31" = trunc i64 %"rm_next.16" to i32
  %"ptr_gep.31" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"new_tbl.23", i32 %"idx_trunc.31"
  %".105" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.31", i32 0, i32 0
  %".106" = sext i32 0 to i64
  store i64 %".106", i64* %".105"
  %"rm_next.17" = load i64, i64* %"rm_next"
  store i64 %"rm_next.17", i64* %"rm_hole"
  br label %"switch_merge.10"
switch_default.10:
  br label %"switch_merge.10"
switch_merge.11:
  %"rm_idx.8" = load i64, i64* %"rm_idx"
  %".124" = zext i32 1 to i64
  %".125" = add i64 %"rm_idx.8", %".124"
  %"new_cap.7" = load i64, i64* %"new_cap"
  %".126" = zext i32 1 to i64
  %".127" = sub i64 %"new_cap.7", %".126"
  %".128" = and i64 %".125", %".127"
  store i64 %".128", i64* %"rm_idx"
  br label %"while.cond.1"
switch_case_0.11:
  br label %"while.end.1"
switch_default.11:
  br label %"switch_merge.11"
}

define i1 @"standard__memory__allocators__stdheap__table_init__0__ret_boolE1"()
{
entry:
  %"initial_cap" = alloca i64
  %".2" = sext i32 1024 to i64
  store i64 %".2", i64* %"initial_cap"
  %"initial_bytes" = alloca i64
  %"initial_cap.1" = load i64, i64* %"initial_cap"
  %".4" = zext i32 32 to i64
  %".5" = mul i64 %"initial_cap.1", %".4"
  store i64 %".5", i64* %"initial_bytes"
  %"raw" = alloca i64
  %"initial_bytes.1" = load i64, i64* %"initial_bytes"
  %".7" = call i64 @"standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"initial_bytes.1")
  store i64 %".7", i64* %"raw"
  %"raw.1" = load i64, i64* %"raw"
  %".9" = zext i32 0 to i64
  %".10" = icmp eq i64 %"raw.1", %".9"
  %"p" = alloca i8*
  %"i" = alloca i64
  switch i1 %".10", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"raw.2" = load i64, i64* %"raw"
  %"int_to_ptr" = inttoptr i64 %"raw.2" to i8*
  store i8* %"int_to_ptr", i8** %"p"
  store i64 0, i64* %"i"
  br label %"while.cond"
switch_case_0:
  ret i1 false
switch_default:
  br label %"switch_merge"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"initial_bytes.2" = load i64, i64* %"initial_bytes"
  %".17" = icmp ult i64 %"i.1", %"initial_bytes.2"
  br i1 %".17", label %"while.body", label %"while.end"
while.body:
  %"p.1" = load i8*, i8** %"p"
  %"i.2" = load i64, i64* %"i"
  %".19" = getelementptr inbounds i8, i8* %"p.1", i64 %"i.2"
  %".20" = trunc i32 0 to i8
  store i8 %".20", i8* %".19"
  %"i.3" = load i64, i64* %"i"
  %".22" = add i64 %"i.3", 1
  store i64 %".22", i64* %"i"
  br label %"while.cond"
while.end:
  %"raw.3" = load i64, i64* %"raw"
  %"int_to_ptr.1" = inttoptr i64 %"raw.3" to %"BlockEntry"*
  store %"BlockEntry"* %"int_to_ptr.1", %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"initial_cap.2" = load i64, i64* %"initial_cap"
  store i64 %"initial_cap.2", i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".27" = sext i32 0 to i64
  store i64 %".27", i64* @"standard__memory__allocators__stdheap__g_table_count"
  %"initial_bytes.3" = load i64, i64* %"initial_bytes"
  store i64 %"initial_bytes.3", i64* @"standard__memory__allocators__stdheap__g_table_slab_cap"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %"raw.4" = load i64, i64* %"raw"
  %"initial_bytes.4" = load i64, i64* %"initial_bytes"
  %"raw.5" = load i64, i64* %"raw"
  %".30" = sext i32 2 to i64
  call void @"standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"BlockEntry"* %"g_table", i64 %"g_table_cap", i64 %"raw.4", i64 %"initial_bytes.4", i64 %".30", i64 %"raw.5")
  %"g_table_count" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".32" = add i64 %"g_table_count", 1
  store i64 %".32", i64* @"standard__memory__allocators__stdheap__g_table_count"
  ret i1 true
}

define i1 @"standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1"(i64 %"key", i64 %"size", i64 %"kind", i64 %"slab")
{
entry:
  %"key.addr" = alloca i64
  store i64 %"key", i64* %"key.addr"
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"kind.addr" = alloca i64
  store i64 %"kind", i64* %"kind.addr"
  %"slab.addr" = alloca i64
  store i64 %"slab", i64* %"slab.addr"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"BlockEntry"*
  %".10" = ptrtoint %"BlockEntry"* %"g_table" to i64
  %".11" = ptrtoint %"BlockEntry"* %"int_to_ptr" to i64
  %".12" = icmp eq i64 %".10", %".11"
  switch i1 %".12", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"g_table_count" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".20" = zext i32 2 to i64
  %".21" = mul i64 %"g_table_count", %".20"
  %"g_table_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".22" = icmp uge i64 %".21", %"g_table_cap"
  switch i1 %".22", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_case_0:
  %"op_overload_result" = call i1 @"standard__memory__allocators__stdheap__table_init__0__ret_boolE1"()
  %".14" = xor i1 %"op_overload_result", -1
  switch i1 %".14", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_default:
  br label %"switch_merge"
switch_merge.1:
  br label %"switch_merge"
switch_case_0.1:
  ret i1 false
switch_default.1:
  br label %"switch_merge.1"
switch_merge.2:
  %"obj_this.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table_cap.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %"key.1" = load i64, i64* %"key.addr"
  %"size.1" = load i64, i64* %"size.addr"
  %"kind.1" = load i64, i64* %"kind.addr"
  %"slab.1" = load i64, i64* %"slab.addr"
  call void @"standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"BlockEntry"* %"g_table.1", i64 %"g_table_cap.1", i64 %"key.1", i64 %"size.1", i64 %"kind.1", i64 %"slab.1")
  %"g_table_count.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".31" = add i64 %"g_table_count.1", 1
  store i64 %".31", i64* @"standard__memory__allocators__stdheap__g_table_count"
  ret i1 true
switch_case_0.2:
  %"op_overload_result.1" = call i1 @"standard__memory__allocators__stdheap__table_grow__0__ret_boolE1"()
  %".24" = xor i1 %"op_overload_result.1", -1
  switch i1 %".24", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
switch_default.2:
  br label %"switch_merge.2"
switch_merge.3:
  br label %"switch_merge.2"
switch_case_0.3:
  ret i1 false
switch_default.3:
  br label %"switch_merge.3"
}

define %"BlockEntry"* @"standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1"(i64 %"key") alwaysinline
{
entry:
  %"key.addr" = alloca i64
  store i64 %"key", i64* %"key.addr"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"BlockEntry"*
  %".4" = ptrtoint %"BlockEntry"* %"g_table" to i64
  %".5" = ptrtoint %"BlockEntry"* %"int_to_ptr" to i64
  %".6" = icmp eq i64 %".4", %".5"
  %"idx" = alloca i64
  switch i1 %".6", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"key.1" = load i64, i64* %"key.addr"
  %"g_table_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".10" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"key.1", i64 %"g_table_cap")
  store i64 %".10", i64* %"idx"
  br label %"while.cond"
switch_case_0:
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to %"BlockEntry"*
  ret %"BlockEntry"* %"int_to_ptr.1"
switch_default:
  br label %"switch_merge"
while.cond:
  %"g_table.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.1" = load i64, i64* %"idx"
  %"idx_trunc" = trunc i64 %"idx.1" to i32
  %"ptr_gep" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.1", i32 %"idx_trunc"
  %"g_table.2" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.2" = load i64, i64* %"idx"
  %"idx_trunc.1" = trunc i64 %"idx.2" to i32
  %"ptr_gep.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.2", i32 %"idx_trunc.1"
  %"key_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.1", i32 0, i32 0
  %"key.2" = load i64, i64* %"key_ptr"
  %"not_zero" = icmp ne i64 %"key.2", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"tobool" = icmp ne i8 %"not_null_result", 0
  br i1 %"tobool", label %"while.body", label %"while.end"
while.body:
  %"g_table.3" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.3" = load i64, i64* %"idx"
  %"idx_trunc.2" = trunc i64 %"idx.3" to i32
  %"ptr_gep.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.3", i32 %"idx_trunc.2"
  %"g_table.4" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.4" = load i64, i64* %"idx"
  %"idx_trunc.3" = trunc i64 %"idx.4" to i32
  %"ptr_gep.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.4", i32 %"idx_trunc.3"
  %"key_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.3", i32 0, i32 0
  %"key.3" = load i64, i64* %"key_ptr.1"
  %"key.4" = load i64, i64* %"key.addr"
  %".14" = icmp eq i64 %"key.3", %"key.4"
  switch i1 %".14", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
while.end:
  %"int_to_ptr_zext.2" = zext i32 0 to i64
  %"int_to_ptr.2" = inttoptr i64 %"int_to_ptr_zext.2" to %"BlockEntry"*
  ret %"BlockEntry"* %"int_to_ptr.2"
switch_merge.1:
  %"idx.6" = load i64, i64* %"idx"
  %".19" = zext i32 1 to i64
  %".20" = add i64 %"idx.6", %".19"
  %"g_table_cap.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".21" = zext i32 1 to i64
  %".22" = sub i64 %"g_table_cap.1", %".21"
  %".23" = and i64 %".20", %".22"
  store i64 %".23", i64* %"idx"
  br label %"while.cond"
switch_case_0.1:
  %"idx.5" = load i64, i64* %"idx"
  %"array_param_ptr" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %".16" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"array_param_ptr", i64 %"idx.5"
  ret %"BlockEntry"* %".16"
switch_default.1:
  br label %"switch_merge.1"
}

define void @"standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1"(i64 %"key")
{
entry:
  %"key.addr" = alloca i64
  store i64 %"key", i64* %"key.addr"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"BlockEntry"*
  %".4" = ptrtoint %"BlockEntry"* %"g_table" to i64
  %".5" = ptrtoint %"BlockEntry"* %"int_to_ptr" to i64
  %".6" = icmp eq i64 %".4", %".5"
  %"idx" = alloca i64
  %"hole" = alloca i64
  %"next" = alloca i64
  %"natural" = alloca i64
  %"should_shift" = alloca i1
  %"in_range" = alloca i1
  switch i1 %".6", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"key.1" = load i64, i64* %"key.addr"
  %"g_table_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".10" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"key.1", i64 %"g_table_cap")
  store i64 %".10", i64* %"idx"
  store i64 0, i64* %"hole"
  store i64 0, i64* %"next"
  store i64 0, i64* %"natural"
  store i1 0, i1* %"should_shift"
  store i1 0, i1* %"in_range"
  br label %"while.cond"
switch_case_0:
  ret void
switch_default:
  br label %"switch_merge"
while.cond:
  %"g_table.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.1" = load i64, i64* %"idx"
  %"idx_trunc" = trunc i64 %"idx.1" to i32
  %"ptr_gep" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.1", i32 %"idx_trunc"
  %"g_table.2" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.2" = load i64, i64* %"idx"
  %"idx_trunc.1" = trunc i64 %"idx.2" to i32
  %"ptr_gep.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.2", i32 %"idx_trunc.1"
  %"key_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.1", i32 0, i32 0
  %"key.2" = load i64, i64* %"key_ptr"
  %".18" = zext i32 0 to i64
  %".19" = icmp ne i64 %"key.2", %".18"
  br i1 %".19", label %"while.body", label %"while.end"
while.body:
  %"g_table.3" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.3" = load i64, i64* %"idx"
  %"idx_trunc.2" = trunc i64 %"idx.3" to i32
  %"ptr_gep.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.3", i32 %"idx_trunc.2"
  %"g_table.4" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.4" = load i64, i64* %"idx"
  %"idx_trunc.3" = trunc i64 %"idx.4" to i32
  %"ptr_gep.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.4", i32 %"idx_trunc.3"
  %"key_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.3", i32 0, i32 0
  %"key.3" = load i64, i64* %"key_ptr.1"
  %"key.4" = load i64, i64* %"key.addr"
  %".21" = icmp eq i64 %"key.3", %"key.4"
  switch i1 %".21", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
while.end:
  ret void
switch_merge.1:
  %"idx.8" = load i64, i64* %"idx"
  %".101" = zext i32 1 to i64
  %".102" = add i64 %"idx.8", %".101"
  %"g_table_cap.4" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".103" = zext i32 1 to i64
  %".104" = sub i64 %"g_table_cap.4", %".103"
  %".105" = and i64 %".102", %".104"
  store i64 %".105", i64* %"idx"
  br label %"while.cond"
switch_case_0.1:
  %"obj_this.1" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.5" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"idx.5" = load i64, i64* %"idx"
  %"idx_trunc.4" = trunc i64 %"idx.5" to i32
  %"ptr_gep.4" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.5", i32 %"idx_trunc.4"
  %".23" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.4", i32 0, i32 0
  %".24" = sext i32 0 to i64
  store i64 %".24", i64* %".23"
  %"g_table_count" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_count"
  %".26" = sub i64 %"g_table_count", 1
  store i64 %".26", i64* @"standard__memory__allocators__stdheap__g_table_count"
  %"idx.6" = load i64, i64* %"idx"
  store i64 %"idx.6", i64* %"hole"
  %"idx.7" = load i64, i64* %"idx"
  %".29" = zext i32 1 to i64
  %".30" = add i64 %"idx.7", %".29"
  %"g_table_cap.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".31" = zext i32 1 to i64
  %".32" = sub i64 %"g_table_cap.1", %".31"
  %".33" = and i64 %".30", %".32"
  store i64 %".33", i64* %"next"
  br label %"while.cond.1"
switch_default.1:
  br label %"switch_merge.1"
while.cond.1:
  %"g_table.6" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.1" = load i64, i64* %"next"
  %"idx_trunc.5" = trunc i64 %"next.1" to i32
  %"ptr_gep.5" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.6", i32 %"idx_trunc.5"
  %"g_table.7" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.2" = load i64, i64* %"next"
  %"idx_trunc.6" = trunc i64 %"next.2" to i32
  %"ptr_gep.6" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.7", i32 %"idx_trunc.6"
  %"key_ptr.2" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.6", i32 0, i32 0
  %"key.5" = load i64, i64* %"key_ptr.2"
  %".36" = zext i32 0 to i64
  %".37" = icmp ne i64 %"key.5", %".36"
  br i1 %".37", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"g_table.8" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.3" = load i64, i64* %"next"
  %"idx_trunc.7" = trunc i64 %"next.3" to i32
  %"ptr_gep.7" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.8", i32 %"idx_trunc.7"
  %"g_table.9" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.4" = load i64, i64* %"next"
  %"idx_trunc.8" = trunc i64 %"next.4" to i32
  %"ptr_gep.8" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.9", i32 %"idx_trunc.8"
  %"key_ptr.3" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.8", i32 0, i32 0
  %"key.6" = load i64, i64* %"key_ptr.3"
  %"g_table_cap.2" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".39" = call i64 @"standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"key.6", i64 %"g_table_cap.2")
  store i64 %".39", i64* %"natural"
  %"hole.1" = load i64, i64* %"hole"
  %"next.5" = load i64, i64* %"next"
  %".41" = icmp ult i64 %"hole.1", %"next.5"
  switch i1 %".41", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
while.end.1:
  ret void
switch_merge.2:
  %"should_shift.1" = load i1, i1* %"should_shift"
  switch i1 %"should_shift.1", label %"switch_default.9" [i1 1, label %"switch_case_0.9"]
switch_case_0.2:
  %"natural.1" = load i64, i64* %"natural"
  %"hole.2" = load i64, i64* %"hole"
  %".43" = icmp ugt i64 %"natural.1", %"hole.2"
  switch i1 %".43", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
switch_default.2:
  %"natural.3" = load i64, i64* %"natural"
  %"hole.3" = load i64, i64* %"hole"
  %".60" = icmp ugt i64 %"natural.3", %"hole.3"
  switch i1 %".60", label %"switch_default.6" [i1 1, label %"switch_case_0.6"]
switch_merge.3:
  %"in_range.1" = load i1, i1* %"in_range"
  switch i1 %"in_range.1", label %"switch_default.5" [i1 1, label %"switch_case_0.5"]
switch_case_0.3:
  %"natural.2" = load i64, i64* %"natural"
  %"next.6" = load i64, i64* %"next"
  %".45" = icmp ule i64 %"natural.2", %"next.6"
  switch i1 %".45", label %"switch_default.4" [i1 1, label %"switch_case_0.4"]
switch_default.3:
  store i1 false, i1* %"in_range"
  br label %"switch_merge.3"
switch_merge.4:
  br label %"switch_merge.3"
switch_case_0.4:
  store i1 true, i1* %"in_range"
  br label %"switch_merge.4"
switch_default.4:
  store i1 false, i1* %"in_range"
  br label %"switch_merge.4"
switch_merge.5:
  br label %"switch_merge.2"
switch_case_0.5:
  store i1 false, i1* %"should_shift"
  br label %"switch_merge.5"
switch_default.5:
  store i1 true, i1* %"should_shift"
  br label %"switch_merge.5"
switch_merge.6:
  %"in_range.2" = load i1, i1* %"in_range"
  switch i1 %"in_range.2", label %"switch_default.8" [i1 1, label %"switch_case_0.8"]
switch_case_0.6:
  store i1 true, i1* %"in_range"
  br label %"switch_merge.6"
switch_default.6:
  %"natural.4" = load i64, i64* %"natural"
  %"next.7" = load i64, i64* %"next"
  %".64" = icmp ule i64 %"natural.4", %"next.7"
  switch i1 %".64", label %"switch_default.7" [i1 1, label %"switch_case_0.7"]
switch_merge.7:
  br label %"switch_merge.6"
switch_case_0.7:
  store i1 true, i1* %"in_range"
  br label %"switch_merge.7"
switch_default.7:
  store i1 false, i1* %"in_range"
  br label %"switch_merge.7"
switch_merge.8:
  br label %"switch_merge.2"
switch_case_0.8:
  store i1 false, i1* %"should_shift"
  br label %"switch_merge.8"
switch_default.8:
  store i1 true, i1* %"should_shift"
  br label %"switch_merge.8"
switch_merge.9:
  %"next.18" = load i64, i64* %"next"
  %".92" = zext i32 1 to i64
  %".93" = add i64 %"next.18", %".92"
  %"g_table_cap.3" = load i64, i64* @"standard__memory__allocators__stdheap__g_table_cap"
  %".94" = zext i32 1 to i64
  %".95" = sub i64 %"g_table_cap.3", %".94"
  %".96" = and i64 %".93", %".95"
  store i64 %".96", i64* %"next"
  br label %"while.cond.1"
switch_case_0.9:
  %"g_table.10" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.8" = load i64, i64* %"next"
  %"idx_trunc.9" = trunc i64 %"next.8" to i32
  %"ptr_gep.9" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.10", i32 %"idx_trunc.9"
  %"g_table.11" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.9" = load i64, i64* %"next"
  %"idx_trunc.10" = trunc i64 %"next.9" to i32
  %"ptr_gep.10" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.11", i32 %"idx_trunc.10"
  %"key_ptr.4" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.10", i32 0, i32 0
  %"key.7" = load i64, i64* %"key_ptr.4"
  %"obj_this.2" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.12" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"hole.4" = load i64, i64* %"hole"
  %"idx_trunc.11" = trunc i64 %"hole.4" to i32
  %"ptr_gep.11" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.12", i32 %"idx_trunc.11"
  %".78" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.11", i32 0, i32 0
  store i64 %"key.7", i64* %".78"
  %"g_table.13" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.10" = load i64, i64* %"next"
  %"idx_trunc.12" = trunc i64 %"next.10" to i32
  %"ptr_gep.12" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.13", i32 %"idx_trunc.12"
  %"g_table.14" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.11" = load i64, i64* %"next"
  %"idx_trunc.13" = trunc i64 %"next.11" to i32
  %"ptr_gep.13" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.14", i32 %"idx_trunc.13"
  %"size_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.13", i32 0, i32 1
  %"size" = load i64, i64* %"size_ptr"
  %"obj_this.3" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.15" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"hole.5" = load i64, i64* %"hole"
  %"idx_trunc.14" = trunc i64 %"hole.5" to i32
  %"ptr_gep.14" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.15", i32 %"idx_trunc.14"
  %".80" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.14", i32 0, i32 1
  store i64 %"size", i64* %".80"
  %"g_table.16" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.12" = load i64, i64* %"next"
  %"idx_trunc.15" = trunc i64 %"next.12" to i32
  %"ptr_gep.15" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.16", i32 %"idx_trunc.15"
  %"g_table.17" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.13" = load i64, i64* %"next"
  %"idx_trunc.16" = trunc i64 %"next.13" to i32
  %"ptr_gep.16" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.17", i32 %"idx_trunc.16"
  %"kind_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.16", i32 0, i32 2
  %"kind" = load i64, i64* %"kind_ptr"
  %"obj_this.4" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.18" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"hole.6" = load i64, i64* %"hole"
  %"idx_trunc.17" = trunc i64 %"hole.6" to i32
  %"ptr_gep.17" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.18", i32 %"idx_trunc.17"
  %".82" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.17", i32 0, i32 2
  store i64 %"kind", i64* %".82"
  %"g_table.19" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.14" = load i64, i64* %"next"
  %"idx_trunc.18" = trunc i64 %"next.14" to i32
  %"ptr_gep.18" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.19", i32 %"idx_trunc.18"
  %"g_table.20" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.15" = load i64, i64* %"next"
  %"idx_trunc.19" = trunc i64 %"next.15" to i32
  %"ptr_gep.19" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.20", i32 %"idx_trunc.19"
  %"slab_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.19", i32 0, i32 3
  %"slab" = load i64, i64* %"slab_ptr"
  %"obj_this.5" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.21" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"hole.7" = load i64, i64* %"hole"
  %"idx_trunc.20" = trunc i64 %"hole.7" to i32
  %"ptr_gep.20" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.21", i32 %"idx_trunc.20"
  %".84" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.20", i32 0, i32 3
  store i64 %"slab", i64* %".84"
  %"obj_this.6" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"g_table.22" = load %"BlockEntry"*, %"BlockEntry"** @"standard__memory__allocators__stdheap__g_table"
  %"next.16" = load i64, i64* %"next"
  %"idx_trunc.21" = trunc i64 %"next.16" to i32
  %"ptr_gep.21" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"g_table.22", i32 %"idx_trunc.21"
  %".86" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"ptr_gep.21", i32 0, i32 0
  %".87" = sext i32 0 to i64
  store i64 %".87", i64* %".86"
  %"next.17" = load i64, i64* %"next"
  store i64 %"next.17", i64* %"hole"
  br label %"switch_merge.9"
switch_default.9:
  br label %"switch_merge.9"
}

define %"Slab"* @"standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1"(i64 %"min_capacity")
{
entry:
  %"min_capacity.addr" = alloca i64
  store i64 %"min_capacity", i64* %"min_capacity.addr"
  %"sz" = alloca i64
  %"g_next_slab_size" = load i64, i64* @"standard__memory__allocators__stdheap__g_next_slab_size"
  store i64 %"g_next_slab_size", i64* %"sz"
  %"header_size" = alloca i64
  %".5" = add i32 40, 15
  %".6" = xor i32 15, -1
  %".7" = and i32 %".5", %".6"
  %".8" = sext i32 %".7" to i64
  store i64 %".8", i64* %"header_size"
  %"min_capacity.1" = load i64, i64* %"min_capacity.addr"
  %"header_size.1" = load i64, i64* %"header_size"
  %".10" = add i64 %"min_capacity.1", %"header_size.1"
  %"sz.1" = load i64, i64* %"sz"
  %".11" = icmp ugt i64 %".10", %"sz.1"
  %"raw" = alloca i64
  %"slab" = alloca %"Slab"*
  %"next" = alloca i64
  switch i1 %".11", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"sz.2" = load i64, i64* %"sz"
  %".17" = call i64 @"standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.2")
  store i64 %".17", i64* %"raw"
  %"raw.1" = load i64, i64* %"raw"
  %".19" = zext i32 0 to i64
  %".20" = icmp eq i64 %"raw.1", %".19"
  switch i1 %".20", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  %"min_capacity.2" = load i64, i64* %"min_capacity.addr"
  %"header_size.2" = load i64, i64* %"header_size"
  %".13" = add i64 %"min_capacity.2", %"header_size.2"
  store i64 %".13", i64* %"sz"
  br label %"switch_merge"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"raw.2" = load i64, i64* %"raw"
  %"int_to_ptr.1" = inttoptr i64 %"raw.2" to %"Slab"*
  store %"Slab"* %"int_to_ptr.1", %"Slab"** %"slab"
  %"raw.3" = load i64, i64* %"raw"
  %"slab_ptr" = load %"Slab"*, %"Slab"** %"slab"
  %".25" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr", i32 0, i32 0
  store i64 %"raw.3", i64* %".25"
  %"sz.3" = load i64, i64* %"sz"
  %"slab_ptr.1" = load %"Slab"*, %"Slab"** %"slab"
  %".27" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr.1", i32 0, i32 1
  store i64 %"sz.3", i64* %".27"
  %"header_size.3" = load i64, i64* %"header_size"
  %"slab_ptr.2" = load %"Slab"*, %"Slab"** %"slab"
  %".29" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr.2", i32 0, i32 2
  store i64 %"header_size.3", i64* %".29"
  %"slab_ptr.3" = load %"Slab"*, %"Slab"** %"slab"
  %".31" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr.3", i32 0, i32 3
  %".32" = sext i32 0 to i64
  store i64 %".32", i64* %".31"
  %"obj_this" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"slab_ptr.4" = load %"Slab"*, %"Slab"** %"slab"
  %".34" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr.4", i32 0, i32 4
  store %"Slab"* %"g_slab_head", %"Slab"** %".34"
  %"obj_this.1" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.1" = load %"Slab"*, %"Slab"** %"slab"
  store %"Slab"* %"slab.1", %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_next_slab_size.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_next_slab_size"
  %".37" = zext i32 2 to i64
  %".38" = mul i64 %"g_next_slab_size.1", %".37"
  store i64 %".38", i64* %"next"
  %"next.1" = load i64, i64* %"next"
  %"g_slab_size_cap" = load i64, i64* @"standard__memory__allocators__stdheap__g_slab_size_cap"
  %".40" = icmp ugt i64 %"next.1", %"g_slab_size_cap"
  switch i1 %".40", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_case_0.1:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"Slab"*
  ret %"Slab"* %"int_to_ptr"
switch_default.1:
  br label %"switch_merge.1"
switch_merge.2:
  %"next.2" = load i64, i64* %"next"
  store i64 %"next.2", i64* @"standard__memory__allocators__stdheap__g_next_slab_size"
  %"obj_this.2" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.2" = load %"Slab"*, %"Slab"** %"slab"
  ret %"Slab"* %"slab.2"
switch_case_0.2:
  %"g_slab_size_cap.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_slab_size_cap"
  store i64 %"g_slab_size_cap.1", i64* %"next"
  br label %"switch_merge.2"
switch_default.2:
  br label %"switch_merge.2"
}

define i64 @"standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"bytes") alwaysinline
{
entry:
  %"bytes.addr" = alloca i64
  store i64 %"bytes", i64* %"bytes.addr"
  %"slab" = alloca %"Slab"*
  %"obj_this" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  store %"Slab"* %"g_slab_head", %"Slab"** %"slab"
  %"b" = alloca i1
  %"obj_this.1" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.1" = load %"Slab"*, %"Slab"** %"slab"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"Slab"*
  %".5" = ptrtoint %"Slab"* %"slab.1" to i64
  %".6" = ptrtoint %"Slab"* %"int_to_ptr" to i64
  %".7" = icmp eq i64 %".5", %".6"
  store i1 %".7", i1* %"b"
  %"b.1" = load i1, i1* %"b"
  %"ret" = alloca i1
  %"ptr" = alloca i64
  switch i1 %"b.1", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"obj_this.2" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.2" = load %"Slab"*, %"Slab"** %"slab"
  %"not_null" = icmp ne %"Slab"* %"slab.2", null
  %"not_null_result" = zext i1 %"not_null" to i8
  %"slab.3" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.4" = load %"Slab"*, %"Slab"** %"slab"
  %"frontier_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.4", i32 0, i32 2
  %"frontier" = load i64, i64* %"frontier_ptr"
  %"bytes.1" = load i64, i64* %"bytes.addr"
  %".13" = add i64 %"frontier", %"bytes.1"
  %"slab.5" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.6" = load %"Slab"*, %"Slab"** %"slab"
  %"capacity_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.6", i32 0, i32 1
  %"capacity" = load i64, i64* %"capacity_ptr"
  %".14" = icmp ule i64 %".13", %"capacity"
  %".15" = zext i1 %".14" to i8
  %".16" = and i8 %"not_null_result", %".15"
  %".17" = trunc i8 %".16" to i1
  store i1 %".17", i1* %"ret"
  %"slab.7" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.8" = load %"Slab"*, %"Slab"** %"slab"
  %"base_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.8", i32 0, i32 0
  %"base" = load i64, i64* %"base_ptr"
  %"int_to_ptr.1" = inttoptr i64 %"base" to i8*
  %"slab.9" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.10" = load %"Slab"*, %"Slab"** %"slab"
  %"frontier_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.10", i32 0, i32 2
  %"frontier.1" = load i64, i64* %"frontier_ptr.1"
  %".19" = getelementptr i8, i8* %"int_to_ptr.1", i64 %"frontier.1"
  %"ptr_to_int" = ptrtoint i8* %".19" to i64
  store i64 %"ptr_to_int", i64* %"ptr"
  %"slab.11" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.12" = load %"Slab"*, %"Slab"** %"slab"
  %"frontier_ptr.2" = getelementptr inbounds %"Slab", %"Slab"* %"slab.12", i32 0, i32 2
  %"frontier.2" = load i64, i64* %"frontier_ptr.2"
  %"bytes.2" = load i64, i64* %"bytes.addr"
  %".21" = add i64 %"frontier.2", %"bytes.2"
  %"slab_ptr" = load %"Slab"*, %"Slab"** %"slab"
  %".22" = getelementptr inbounds %"Slab", %"Slab"* %"slab_ptr", i32 0, i32 2
  store i64 %".21", i64* %".22"
  %"ptr.1" = load i64, i64* %"ptr"
  %"ret.1" = load i1, i1* %"ret"
  %".24" = zext i1 %"ret.1" to i64
  %".25" = mul i64 %"ptr.1", %".24"
  ret i64 %".25"
switch_case_0:
  %".10" = sext i32 0 to i64
  ret i64 %".10"
switch_default:
  br label %"switch_merge"
}

define i64 @"standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size")
{
entry:
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"raw" = alloca i64
  %"size.1" = load i64, i64* %"size.addr"
  %".4" = call i64 @"standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size.1")
  store i64 %".4", i64* %"raw"
  %"raw.1" = load i64, i64* %"raw"
  %".6" = zext i32 0 to i64
  %".7" = icmp eq i64 %"raw.1", %".6"
  switch i1 %".7", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"raw.2" = load i64, i64* %"raw"
  %"size.2" = load i64, i64* %"size.addr"
  %"size.3" = load i64, i64* %"size.addr"
  %".12" = sext i32 1 to i64
  %".13" = call i1 @"standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1"(i64 %"raw.2", i64 %"size.2", i64 %".12", i64 %"size.3")
  %".14" = xor i1 %".13", -1
  switch i1 %".14", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  %".9" = sext i32 0 to i64
  ret i64 %".9"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"g_large_used" = load i64, i64* @"standard__memory__allocators__stdheap__g_large_used"
  %".20" = add i64 %"g_large_used", 1
  store i64 %".20", i64* @"standard__memory__allocators__stdheap__g_large_used"
  %"raw.4" = load i64, i64* %"raw"
  ret i64 %"raw.4"
switch_case_0.1:
  %"raw.3" = load i64, i64* %"raw"
  %"size.4" = load i64, i64* %"size.addr"
  call void @"standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(i64 %"raw.3", i64 %"size.4")
  %".17" = sext i32 0 to i64
  ret i64 %".17"
switch_default.1:
  br label %"switch_merge.1"
}

define i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size")
{
entry:
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"size.1" = load i64, i64* %"size.addr"
  %".4" = zext i1 0 to i64
  %".5" = icmp eq i64 %"size.1", %".4"
  %"cls" = alloca i64
  %"node" = alloca %"FreeNode"*
  %"block" = alloca i64
  %"ptr" = alloca i64
  switch i1 %".5", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"size.3" = load i64, i64* %"size.addr"
  %".9" = zext i32 4096 to i64
  %".10" = icmp ugt i64 %"size.3", %".9"
  switch i1 %".10", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  %"size.2" = load i64, i64* %"size.addr"
  ret i64 %"size.2"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"size.5" = load i64, i64* %"size.addr"
  %".15" = zext i32 1 to i64
  %".16" = sub i64 %"size.5", %".15"
  %".17" = zext i32 15 to i64
  %".18" = or i64 %".16", %".17"
  %".19" = call i64 @"standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".18")
  %".20" = sext i32 3 to i64
  %".21" = sub i64 %".19", %".20"
  store i64 %".21", i64* %"cls"
  %"cls.1" = load i64, i64* %"cls"
  %"idx_trunc" = trunc i64 %"cls.1" to i32
  %"array_gep" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i32 %"idx_trunc"
  %"array_load" = load %"FreeNode"*, %"FreeNode"** %"array_gep"
  store %"FreeNode"* %"array_load", %"FreeNode"** %"node"
  %"obj_this" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.1" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"not_null" = icmp ne %"FreeNode"* %"node.1", null
  %"not_null_result" = zext i1 %"not_null" to i8
  switch i8 %"not_null_result", label %"switch_default.2" [i8 1, label %"switch_case_0.2"]
switch_case_0.1:
  %"size.4" = load i64, i64* %"size.addr"
  %".12" = call i64 @"standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size.4")
  ret i64 %".12"
switch_default.1:
  br label %"switch_merge.1"
switch_merge.2:
  %"cls.3" = load i64, i64* %"cls"
  %".29" = call i64 @"standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"cls.3")
  store i64 %".29", i64* %"block"
  %"block.1" = load i64, i64* %"block"
  %".31" = call i64 @"standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"block.1")
  store i64 %".31", i64* %"ptr"
  %"ptr.1" = load i64, i64* %"ptr"
  %".33" = zext i1 0 to i64
  %".34" = icmp eq i64 %"ptr.1", %".33"
  switch i1 %".34", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
switch_case_0.2:
  %"node.2" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.3" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"next_ptr" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"node.3", i32 0, i32 0
  %"next" = load %"FreeNode"*, %"FreeNode"** %"next_ptr"
  %"cls.2" = load i64, i64* %"cls"
  %".25" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i64 %"cls.2"
  store %"FreeNode"* %"next", %"FreeNode"** %".25"
  %"obj_this.1" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.4" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"ptr_to_int" = ptrtoint %"FreeNode"* %"node.4" to i64
  ret i64 %"ptr_to_int"
switch_default.2:
  br label %"switch_merge.2"
switch_merge.3:
  %"ptr.3" = load i64, i64* %"ptr"
  %"cls.4" = load i64, i64* %"cls"
  %"obj_this.2" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"ptr_to_int.1" = ptrtoint %"Slab"* %"g_slab_head" to i64
  %".54" = sext i32 0 to i64
  %".55" = call i1 @"standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1"(i64 %"ptr.3", i64 %"cls.4", i64 %".54", i64 %"ptr_to_int.1")
  %".56" = xor i1 %".55", -1
  switch i1 %".56", label %"switch_default.6" [i1 1, label %"switch_case_0.6"]
switch_case_0.3:
  %"block.2" = load i64, i64* %"block"
  %".36" = call %"Slab"* @"standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1"(i64 %"block.2")
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"Slab"*
  %".37" = ptrtoint %"Slab"* %".36" to i64
  %".38" = ptrtoint %"Slab"* %"int_to_ptr" to i64
  %".39" = icmp eq i64 %".37", %".38"
  switch i1 %".39", label %"switch_default.4" [i1 1, label %"switch_case_0.4"]
switch_default.3:
  br label %"switch_merge.3"
switch_merge.4:
  %"block.3" = load i64, i64* %"block"
  %".44" = call i64 @"standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"block.3")
  store i64 %".44", i64* %"ptr"
  %"ptr.2" = load i64, i64* %"ptr"
  %".46" = zext i1 0 to i64
  %".47" = icmp eq i64 %"ptr.2", %".46"
  switch i1 %".47", label %"switch_default.5" [i1 1, label %"switch_case_0.5"]
switch_case_0.4:
  %".41" = sext i32 0 to i64
  ret i64 %".41"
switch_default.4:
  br label %"switch_merge.4"
switch_merge.5:
  br label %"switch_merge.3"
switch_case_0.5:
  %".49" = sext i32 0 to i64
  ret i64 %".49"
switch_default.5:
  br label %"switch_merge.5"
switch_merge.6:
  %"g_slab_head.1" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head.2" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"used_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"g_slab_head.2", i32 0, i32 3
  %"used" = load i64, i64* %"used_ptr"
  %".61" = add i64 %"used", 1
  %"obj_this.3" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head.3" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %".62" = getelementptr inbounds %"Slab", %"Slab"* %"g_slab_head.3", i32 0, i32 3
  store i64 %".61", i64* %".62"
  %"ptr.4" = load i64, i64* %"ptr"
  ret i64 %"ptr.4"
switch_case_0.6:
  %".58" = sext i32 0 to i64
  ret i64 %".58"
switch_default.6:
  br label %"switch_merge.6"
}

define i64 @"standard__memory__allocators__stdheap__fmalloc__1__ulongE1__ret_dataE1_ubits64"(i64 %"size")
{
entry:
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"size.1" = load i64, i64* %"size.addr"
  %".4" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size.1")
  ret i64 %".4"
}

define void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr")
{
entry:
  %"ptr.addr" = alloca i64
  store i64 %"ptr", i64* %"ptr.addr"
  %"ptr.1" = load i64, i64* %"ptr.addr"
  %".4" = zext i1 0 to i64
  %".5" = icmp eq i64 %"ptr.1", %".4"
  %"entry.1" = alloca %"BlockEntry"*
  %"kind" = alloca i64
  %"size" = alloca i64
  %"slab" = alloca i64
  switch i1 %".5", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"ptr.2" = load i64, i64* %"ptr.addr"
  %".9" = call %"BlockEntry"* @"standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1"(i64 %"ptr.2")
  store %"BlockEntry"* %".9", %"BlockEntry"** %"entry.1"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.2" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"BlockEntry"*
  %".11" = ptrtoint %"BlockEntry"* %"entry.2" to i64
  %".12" = ptrtoint %"BlockEntry"* %"int_to_ptr" to i64
  %".13" = icmp eq i64 %".11", %".12"
  switch i1 %".13", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  ret void
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"entry.3" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.4" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"kind_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.4", i32 0, i32 2
  %"kind.1" = load i64, i64* %"kind_ptr"
  store i64 %"kind.1", i64* %"kind"
  %"entry.5" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.6" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"size_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.6", i32 0, i32 1
  %"size.1" = load i64, i64* %"size_ptr"
  store i64 %"size.1", i64* %"size"
  %"entry.7" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.8" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"slab_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.8", i32 0, i32 3
  %"slab.1" = load i64, i64* %"slab_ptr"
  store i64 %"slab.1", i64* %"slab"
  %"kind.2" = load i64, i64* %"kind"
  %".20" = zext i32 1 to i64
  %".21" = icmp eq i64 %"kind.2", %".20"
  switch i1 %".21", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_case_0.1:
  ret void
switch_default.1:
  br label %"switch_merge.1"
switch_merge.2:
  %".29" = sext i32 3 to i64
  %"entry_ptr" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %".30" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry_ptr", i32 0, i32 2
  store i64 %".29", i64* %".30"
  %"size.2" = load i64, i64* %"size"
  %"ptr.5" = load i64, i64* %"ptr.addr"
  %"int_to_ptr.1" = inttoptr i64 %"ptr.5" to %"FreeNode"*
  call void @"standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1"(i64 %"size.2", %"FreeNode"* %"int_to_ptr.1")
  ret void
switch_case_0.2:
  %"ptr.3" = load i64, i64* %"ptr.addr"
  call void @"standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.3")
  %"g_large_used" = load i64, i64* @"standard__memory__allocators__stdheap__g_large_used"
  %".24" = sub i64 %"g_large_used", 1
  store i64 %".24", i64* @"standard__memory__allocators__stdheap__g_large_used"
  %"ptr.4" = load i64, i64* %"ptr.addr"
  %"slab.2" = load i64, i64* %"slab"
  call void @"standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(i64 %"ptr.4", i64 %"slab.2")
  ret void
switch_default.2:
  br label %"switch_merge.2"
}

define void @"standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1"(i8* %"ptr")
{
entry:
  %"ptr.addr" = alloca i8*
  store i8* %"ptr", i8** %"ptr.addr"
  %"ptr.1" = load i8*, i8** %"ptr.addr"
  %"ptr_to_int" = ptrtoint i8* %"ptr.1" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int")
  ret void
}

@"EC_NONE" = internal global i32 0
@"EC_NULLPTR" = internal global i32 1
@"EC_WILDPTR" = internal global i32 2
@"EC_PROTFAULT" = internal global i32 3
@"EC_STACKOVERFLOW" = internal global i32 4
@"EC_ILLEGALINSTR" = internal global i32 5
@"EC_DIVBYZERO" = internal global i32 6
@"EC_INTOVERFLOW" = internal global i32 7
@"EC_ALIGNFAULT" = internal global i32 8
@"EC_PRIVINSTR" = internal global i32 9
@"WIN_EXCEPTION_ACCESS_VIOLATION" = internal global i32 -1073741819
@"WIN_EXCEPTION_DATATYPE_MISALIGNMENT" = internal global i32 -2147483646
@"WIN_EXCEPTION_ILLEGAL_INSTRUCTION" = internal global i32 -1073741795
@"WIN_EXCEPTION_INT_DIVIDE_BY_ZERO" = internal global i32 -1073741676
@"WIN_EXCEPTION_INT_OVERFLOW" = internal global i32 -1073741675
@"WIN_EXCEPTION_PRIV_INSTRUCTION" = internal global i32 -1073741674
@"WIN_EXCEPTION_STACK_OVERFLOW" = internal global i32 -1073741571
@"WIN_EXCEPTION_CONTINUE_EXECUTION" = internal global i32 -1
@"WIN_EXCEPTION_CONTINUE_SEARCH" = internal global i32 0
@"FEXC_MEM_COMMIT_RESERVE" = internal global i32 12288
@"FEXC_PAGE_READWRITE" = internal global i32 4
@"FEXC_STACK_GUARANTEE_BYTES" = internal global i32 65536
@"FEXC_JMPSTACK_CAPACITY" = internal global i64 64
@"FEXC_JMPSTACK_BASE" = internal global %"IDEKAJmpBuf"* null
@"FEXC_JMPSTACK_TOP" = internal global i64 0
@"FEXC_INITIALIZED" = internal global i1 0
@"FEXC_PENDING" = internal global %"Exception" zeroinitializer
define i1 @"standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp eq i8 %"c.1", 32
  br i1 %".4", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp eq i8 %"c.2", 9
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".6", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"c.3" = load i8, i8* %"c.addr"
  %".9" = icmp eq i8 %"c.3", 10
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"sc_end"], [%".9", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"sc_end.2", label %"sc_rhs.2"
sc_rhs.2:
  %"c.4" = load i8, i8* %"c.addr"
  %".12" = icmp eq i8 %"c.4", 13
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [1, %"sc_end.1"], [%".12", %"sc_rhs.2"]
  ret i1 %"sc_result.2"
}

define i1 @"standard__strings__helpers__is_digit__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 48
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 57
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  ret i1 %"sc_result"
}

define i1 @"standard__strings__helpers__is_alpha__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 97
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 122
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"c.3" = load i8, i8* %"c.addr"
  %".9" = icmp sge i8 %"c.3", 65
  br i1 %".9", label %"sc_rhs.2", label %"sc_end.2"
sc_end.1:
  %"sc_result.2" = phi  i1 [1, %"sc_end"], [%"sc_result.1", %"sc_end.2"]
  ret i1 %"sc_result.2"
sc_rhs.2:
  %"c.4" = load i8, i8* %"c.addr"
  %".11" = icmp sle i8 %"c.4", 90
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.1" = phi  i1 [0, %"sc_rhs.1"], [%".11", %"sc_rhs.2"]
  br label %"sc_end.1"
}

define i1 @"standard__strings__helpers__is_upper__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 65
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 90
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  ret i1 %"sc_result"
}

define i1 @"standard__strings__helpers__is_lower__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 97
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 122
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  ret i1 %"sc_result"
}

define i1 @"standard__strings__helpers__is_alnum__1__charE1__ret_boolE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = call i1 @"standard__strings__helpers__is_alpha__1__charE1__ret_boolE1"(i8 %"c.1")
  br i1 %".4", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = call i1 @"standard__strings__helpers__is_digit__1__charE1__ret_boolE1"(i8 %"c.2")
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".6", %"sc_rhs"]
  ret i1 %"sc_result"
}

define i8 @"standard__strings__helpers__to_lower__1__charE1__ret_charE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 65
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 90
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  %"c.3" = load i8, i8* %"c.addr"
  %".9" = sext i8 %"c.3" to i32
  %".10" = add i32 %".9", 32
  %".11" = trunc i32 %".10" to i8
  ret i8 %".11"
else:
  br label %"ifcont"
ifcont:
  %"c.4" = load i8, i8* %"c.addr"
  ret i8 %"c.4"
}

define i8 @"standard__strings__helpers__to_upper__1__charE1__ret_charE1"(i8 %"c")
{
entry:
  %"c.addr" = alloca i8
  store i8 %"c", i8* %"c.addr"
  %"c.1" = load i8, i8* %"c.addr"
  %".4" = icmp sge i8 %"c.1", 97
  br i1 %".4", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.2" = load i8, i8* %"c.addr"
  %".6" = icmp sle i8 %"c.2", 122
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".6", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  %"c.3" = load i8, i8* %"c.addr"
  %".9" = sext i8 %"c.3" to i32
  %".10" = sub i32 %".9", 32
  %".11" = trunc i32 %".10" to i8
  ret i8 %".11"
else:
  br label %"ifcont"
ifcont:
  %"c.4" = load i8, i8* %"c.addr"
  ret i8 %"c.4"
}

define i32 @"standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1"(i8* %"str", i8 %"ch", i32 %"start_pos")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"ch.addr" = alloca i8
  store i8 %"ch", i8* %"ch.addr"
  %"start_pos.addr" = alloca i32
  store i32 %"start_pos", i32* %"start_pos.addr"
  %"i" = alloca i32
  %"start_pos.1" = load i32, i32* %"start_pos.addr"
  store i32 %"start_pos.1", i32* %"i"
  br label %"for.cond"
for.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".10" = zext i8 %"ptr_load" to i32
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %"for.body", label %"for.end"
for.body:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"ch.1" = load i8, i8* %"ch.addr"
  %".13" = icmp eq i8 %"ptr_load.1", %"ch.1"
  br i1 %".13", label %"then", label %"else"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".18" = add i32 %"i.4", 1
  store i32 %".18", i32* %"i"
  br label %"for.cond"
for.end:
  %".21" = sub i32 0, 1
  ret i32 %".21"
then:
  %"i.3" = load i32, i32* %"i"
  ret i32 %"i.3"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update"
}

define i32 @"standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1"(i8* %"str", i8* %"substr", i32 %"start_pos")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"substr.addr" = alloca i8*
  store i8* %"substr", i8** %"substr.addr"
  %"start_pos.addr" = alloca i32
  store i32 %"start_pos", i32* %"start_pos.addr"
  %"str_len" = alloca i32
  store i32 0, i32* %"str_len"
  %"substr_len" = alloca i32
  store i32 0, i32* %"substr_len"
  %"match" = alloca i1
  store i1 0, i1* %"match"
  %"i" = alloca i32
  %"j" = alloca i32
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"str_len.1" = load i32, i32* %"str_len"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"str_len.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".12" = zext i8 %"ptr_load" to i32
  %".13" = icmp ne i32 %".12", 0
  br i1 %".13", label %"while.body", label %"while.end"
while.body:
  %"str_len.2" = load i32, i32* %"str_len"
  %".15" = add i32 %"str_len.2", 1
  store i32 %".15", i32* %"str_len"
  br label %"while.cond"
while.end:
  br label %"while.cond.1"
while.cond.1:
  %"substr.1" = load i8*, i8** %"substr.addr"
  %"substr_len.1" = load i32, i32* %"substr_len"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"substr.1", i32 %"substr_len.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".19" = zext i8 %"ptr_load.1" to i32
  %".20" = icmp ne i32 %".19", 0
  br i1 %".20", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"substr_len.2" = load i32, i32* %"substr_len"
  %".22" = add i32 %"substr_len.2", 1
  store i32 %".22", i32* %"substr_len"
  br label %"while.cond.1"
while.end.1:
  %"substr_len.3" = load i32, i32* %"substr_len"
  %".25" = icmp eq i32 %"substr_len.3", 0
  br i1 %".25", label %"then", label %"else"
then:
  %"start_pos.1" = load i32, i32* %"start_pos.addr"
  ret i32 %"start_pos.1"
else:
  br label %"ifcont"
ifcont:
  %"start_pos.2" = load i32, i32* %"start_pos.addr"
  store i32 %"start_pos.2", i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"str_len.3" = load i32, i32* %"str_len"
  %"substr_len.4" = load i32, i32* %"substr_len"
  %".31" = sub i32 %"str_len.3", %"substr_len.4"
  %".32" = icmp sle i32 %"i.1", %".31"
  br i1 %".32", label %"for.body", label %"for.end"
for.body:
  store i1 true, i1* %"match"
  store i32 0, i32* %"j"
  br label %"for.cond.1"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".53" = add i32 %"i.4", 1
  store i32 %".53", i32* %"i"
  br label %"for.cond"
for.end:
  %".56" = sub i32 0, 1
  ret i32 %".56"
for.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"substr_len.5" = load i32, i32* %"substr_len"
  %".37" = icmp slt i32 %"j.1", %"substr_len.5"
  br i1 %".37", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"j.2" = load i32, i32* %"j"
  %".39" = add i32 %"i.2", %"j.2"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.2", i32 %".39"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %"substr.2" = load i8*, i8** %"substr.addr"
  %"j.3" = load i32, i32* %"j"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"substr.2", i32 %"j.3"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".40" = icmp ne i8 %"ptr_load.2", %"ptr_load.3"
  br i1 %".40", label %"then.1", label %"else.1"
for.update.1:
  %"j.4" = load i32, i32* %"j"
  %".46" = add i32 %"j.4", 1
  store i32 %".46", i32* %"j"
  br label %"for.cond.1"
for.end.1:
  %"match.1" = load i1, i1* %"match"
  br i1 %"match.1", label %"then.2", label %"else.2"
then.1:
  store i1 false, i1* %"match"
  br label %"for.end.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update.1"
then.2:
  %"i.3" = load i32, i32* %"i"
  ret i32 %"i.3"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"for.update"
}

define i32 @"standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1"(i8* %"s1", i8* %"s2")
{
entry:
  %"s1.addr" = alloca i8*
  store i8* %"s1", i8** %"s1.addr"
  %"s2.addr" = alloca i8*
  store i8* %"s2", i8** %"s2.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"c1" = alloca i8
  store i8 0, i8* %"c1"
  %"c2" = alloca i8
  store i8 0, i8* %"c2"
  br label %"while.cond"
while.cond:
  %"s1.1" = load i8*, i8** %"s1.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"s1.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".10" = zext i8 %"ptr_load" to i32
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %"sc_rhs", label %"sc_end"
while.body:
  %"s1.2" = load i8*, i8** %"s1.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"s1.2", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".17" = call i8 @"standard__strings__helpers__to_lower__1__charE1__ret_charE1"(i8 %"ptr_load.2")
  store i8 %".17", i8* %"c1"
  %"s2.2" = load i8*, i8** %"s2.addr"
  %"i.4" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"s2.2", i32 %"i.4"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".19" = call i8 @"standard__strings__helpers__to_lower__1__charE1__ret_charE1"(i8 %"ptr_load.3")
  store i8 %".19", i8* %"c2"
  %"c1.1" = load i8, i8* %"c1"
  %"c2.1" = load i8, i8* %"c2"
  %".21" = icmp ne i8 %"c1.1", %"c2.1"
  br i1 %".21", label %"then", label %"else"
while.end:
  %"s1.3" = load i8*, i8** %"s1.addr"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"s1.3", i32 %"i.6"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".30" = call i8 @"standard__strings__helpers__to_lower__1__charE1__ret_charE1"(i8 %"ptr_load.4")
  %"s2.3" = load i8*, i8** %"s2.addr"
  %"i.7" = load i32, i32* %"i"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"s2.3", i32 %"i.7"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".31" = call i8 @"standard__strings__helpers__to_lower__1__charE1__ret_charE1"(i8 %"ptr_load.5")
  %".32" = sub i8 %".30", %".31"
  %".33" = sext i8 %".32" to i32
  ret i32 %".33"
sc_rhs:
  %"s2.1" = load i8*, i8** %"s2.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"s2.1", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".13" = zext i8 %"ptr_load.1" to i32
  %".14" = icmp ne i32 %".13", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".14", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
then:
  %"c1.2" = load i8, i8* %"c1"
  %"c2.2" = load i8, i8* %"c2"
  %".23" = sub i8 %"c1.2", %"c2.2"
  %".24" = sext i8 %".23" to i32
  ret i32 %".24"
else:
  br label %"ifcont"
ifcont:
  %"i.5" = load i32, i32* %"i"
  %".27" = add i32 %"i.5", 1
  store i32 %".27", i32* %"i"
  br label %"while.cond"
}

define i1 @"standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1"(i8* %"str", i8* %"prefix")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"prefix.addr" = alloca i8*
  store i8* %"prefix", i8** %"prefix.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"prefix.1" = load i8*, i8** %"prefix.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"prefix.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".8" = zext i8 %"ptr_load" to i32
  %".9" = icmp ne i32 %".8", 0
  br i1 %".9", label %"while.body", label %"while.end"
while.body:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"prefix.2" = load i8*, i8** %"prefix.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"prefix.2", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".11" = icmp ne i8 %"ptr_load.1", %"ptr_load.2"
  br i1 %".11", label %"then", label %"else"
while.end:
  ret i1 true
then:
  ret i1 false
else:
  br label %"ifcont"
ifcont:
  %"i.4" = load i32, i32* %"i"
  %".15" = add i32 %"i.4", 1
  store i32 %".15", i32* %"i"
  br label %"while.cond"
}

define i1 @"standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1"(i8* %"str", i8* %"suffix")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"suffix.addr" = alloca i8*
  store i8* %"suffix", i8** %"suffix.addr"
  %"str_len" = alloca i32
  store i32 0, i32* %"str_len"
  %"suffix_len" = alloca i32
  store i32 0, i32* %"suffix_len"
  %"offset" = alloca i32
  %"i" = alloca i32
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"str_len.1" = load i32, i32* %"str_len"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"str_len.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".9" = zext i8 %"ptr_load" to i32
  %".10" = icmp ne i32 %".9", 0
  br i1 %".10", label %"while.body", label %"while.end"
while.body:
  %"str_len.2" = load i32, i32* %"str_len"
  %".12" = add i32 %"str_len.2", 1
  store i32 %".12", i32* %"str_len"
  br label %"while.cond"
while.end:
  br label %"while.cond.1"
while.cond.1:
  %"suffix.1" = load i8*, i8** %"suffix.addr"
  %"suffix_len.1" = load i32, i32* %"suffix_len"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"suffix.1", i32 %"suffix_len.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".16" = zext i8 %"ptr_load.1" to i32
  %".17" = icmp ne i32 %".16", 0
  br i1 %".17", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"suffix_len.2" = load i32, i32* %"suffix_len"
  %".19" = add i32 %"suffix_len.2", 1
  store i32 %".19", i32* %"suffix_len"
  br label %"while.cond.1"
while.end.1:
  %"suffix_len.3" = load i32, i32* %"suffix_len"
  %"str_len.3" = load i32, i32* %"str_len"
  %".22" = icmp sgt i32 %"suffix_len.3", %"str_len.3"
  br i1 %".22", label %"then", label %"else"
then:
  ret i1 false
else:
  br label %"ifcont"
ifcont:
  %"str_len.4" = load i32, i32* %"str_len"
  %"suffix_len.4" = load i32, i32* %"suffix_len"
  %".26" = sub i32 %"str_len.4", %"suffix_len.4"
  store i32 %".26", i32* %"offset"
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"suffix_len.5" = load i32, i32* %"suffix_len"
  %".30" = icmp slt i32 %"i.1", %"suffix_len.5"
  br i1 %".30", label %"for.body", label %"for.end"
for.body:
  %"str.2" = load i8*, i8** %"str.addr"
  %"offset.1" = load i32, i32* %"offset"
  %"i.2" = load i32, i32* %"i"
  %".32" = add i32 %"offset.1", %"i.2"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.2", i32 %".32"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %"suffix.2" = load i8*, i8** %"suffix.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"suffix.2", i32 %"i.3"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".33" = icmp ne i8 %"ptr_load.2", %"ptr_load.3"
  br i1 %".33", label %"then.1", label %"else.1"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".38" = add i32 %"i.4", 1
  store i32 %".38", i32* %"i"
  br label %"for.cond"
for.end:
  ret i1 true
then.1:
  ret i1 false
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update"
}

define i8* @"standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1"(i8* %"src")
{
entry:
  %"src.addr" = alloca i8*
  store i8* %"src", i8** %"src.addr"
  %"len" = alloca i32
  store i32 0, i32* %"len"
  %"dest" = alloca i8*
  %"i" = alloca i32
  br label %"while.cond"
while.cond:
  %"src.1" = load i8*, i8** %"src.addr"
  %"len.1" = load i32, i32* %"len"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"src.1", i32 %"len.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".6" = zext i8 %"ptr_load" to i32
  %".7" = icmp ne i32 %".6", 0
  br i1 %".7", label %"while.body", label %"while.end"
while.body:
  %"len.2" = load i32, i32* %"len"
  %".9" = add i32 %"len.2", 1
  store i32 %".9", i32* %"len"
  br label %"while.cond"
while.end:
  %"len.3" = load i32, i32* %"len"
  %".12" = zext i32 %"len.3" to i64
  %".13" = zext i32 1 to i64
  %".14" = add i64 %".12", %".13"
  %".15" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".14")
  %"int_to_ptr" = inttoptr i64 %".15" to i8*
  store i8* %"int_to_ptr", i8** %"dest"
  %"dest.1" = load i8*, i8** %"dest"
  %".17" = ptrtoint i8* %"dest.1" to i64
  %".18" = ptrtoint i8* null to i64
  %".19" = icmp eq i64 %".17", %".18"
  br i1 %".19", label %"then", label %"else"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr.1"
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"len.4" = load i32, i32* %"len"
  %".25" = icmp sle i32 %"i.1", %"len.4"
  br i1 %".25", label %"for.body", label %"for.end"
for.body:
  %"src.2" = load i8*, i8** %"src.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"src.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"dest.2" = load i8*, i8** %"dest"
  %"i.3" = load i32, i32* %"i"
  %".27" = getelementptr inbounds i8, i8* %"dest.2", i32 %"i.3"
  store i8 %"ptr_load.1", i8* %".27"
  br label %"for.update"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".30" = add i32 %"i.4", 1
  store i32 %".30", i32* %"i"
  br label %"for.cond"
for.end:
  %"dest.3" = load i8*, i8** %"dest"
  ret i8* %"dest.3"
}

define i8* @"standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1"(i8* %"src", i32 %"n")
{
entry:
  %"src.addr" = alloca i8*
  store i8* %"src", i8** %"src.addr"
  %"n.addr" = alloca i32
  store i32 %"n", i32* %"n.addr"
  %"dest" = alloca i8*
  %"n.1" = load i32, i32* %"n.addr"
  %".6" = zext i32 %"n.1" to i64
  %".7" = zext i32 1 to i64
  %".8" = add i64 %".6", %".7"
  %".9" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".8")
  %"int_to_ptr" = inttoptr i64 %".9" to i8*
  store i8* %"int_to_ptr", i8** %"dest"
  %"dest.1" = load i8*, i8** %"dest"
  %".11" = ptrtoint i8* %"dest.1" to i64
  %".12" = ptrtoint i8* null to i64
  %".13" = icmp eq i64 %".11", %".12"
  %"i" = alloca i32
  br i1 %".13", label %"then", label %"else"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr.1"
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.2" = load i32, i32* %"n.addr"
  %".19" = icmp slt i32 %"i.1", %"n.2"
  br i1 %".19", label %"sc_rhs", label %"sc_end"
for.body:
  %"src.2" = load i8*, i8** %"src.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"src.2", i32 %"i.3"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"dest.2" = load i8*, i8** %"dest"
  %"i.4" = load i32, i32* %"i"
  %".25" = getelementptr inbounds i8, i8* %"dest.2", i32 %"i.4"
  store i8 %"ptr_load.1", i8* %".25"
  br label %"for.update"
for.update:
  %"i.5" = load i32, i32* %"i"
  %".28" = add i32 %"i.5", 1
  store i32 %".28", i32* %"i"
  br label %"for.cond"
for.end:
  %".31" = trunc i32 0 to i8
  %"dest.3" = load i8*, i8** %"dest"
  %"n.3" = load i32, i32* %"n.addr"
  %".32" = getelementptr inbounds i8, i8* %"dest.3", i32 %"n.3"
  store i8 %".31", i8* %".32"
  %"dest.4" = load i8*, i8** %"dest"
  ret i8* %"dest.4"
sc_rhs:
  %"src.1" = load i8*, i8** %"src.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"src.1", i32 %"i.2"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".21" = zext i8 %"ptr_load" to i32
  %".22" = icmp ne i32 %".21", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"for.cond"], [%".22", %"sc_rhs"]
  br i1 %"sc_result", label %"for.body", label %"for.end"
}

define i8* @"standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1"(i8* %"str", i32 %"start", i32 %"length")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"start.addr" = alloca i32
  store i32 %"start", i32* %"start.addr"
  %"length.addr" = alloca i32
  store i32 %"length", i32* %"length.addr"
  %"result" = alloca i8*
  %"length.1" = load i32, i32* %"length.addr"
  %".8" = zext i32 %"length.1" to i64
  %".9" = zext i32 1 to i64
  %".10" = add i64 %".8", %".9"
  %".11" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".10")
  %"int_to_ptr" = inttoptr i64 %".11" to i8*
  store i8* %"int_to_ptr", i8** %"result"
  %"result.1" = load i8*, i8** %"result"
  %".13" = ptrtoint i8* %"result.1" to i64
  %".14" = ptrtoint i8* null to i64
  %".15" = icmp eq i64 %".13", %".14"
  %"i" = alloca i32
  br i1 %".15", label %"then", label %"else"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr.1"
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"length.2" = load i32, i32* %"length.addr"
  %".21" = icmp slt i32 %"i.1", %"length.2"
  br i1 %".21", label %"sc_rhs", label %"sc_end"
for.body:
  %"str.2" = load i8*, i8** %"str.addr"
  %"start.2" = load i32, i32* %"start.addr"
  %"i.3" = load i32, i32* %"i"
  %".28" = add i32 %"start.2", %"i.3"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %".28"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"result.2" = load i8*, i8** %"result"
  %"i.4" = load i32, i32* %"i"
  %".29" = getelementptr inbounds i8, i8* %"result.2", i32 %"i.4"
  store i8 %"ptr_load.1", i8* %".29"
  br label %"for.update"
for.update:
  %"i.5" = load i32, i32* %"i"
  %".32" = add i32 %"i.5", 1
  store i32 %".32", i32* %"i"
  br label %"for.cond"
for.end:
  %".35" = trunc i32 0 to i8
  %"result.3" = load i8*, i8** %"result"
  %"length.3" = load i32, i32* %"length.addr"
  %".36" = getelementptr inbounds i8, i8* %"result.3", i32 %"length.3"
  store i8 %".35", i8* %".36"
  %"result.4" = load i8*, i8** %"result"
  ret i8* %"result.4"
sc_rhs:
  %"str.1" = load i8*, i8** %"str.addr"
  %"start.1" = load i32, i32* %"start.addr"
  %"i.2" = load i32, i32* %"i"
  %".23" = add i32 %"start.1", %"i.2"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %".23"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".24" = zext i8 %"ptr_load" to i32
  %".25" = icmp ne i32 %".24", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"for.cond"], [%".25", %"sc_rhs"]
  br i1 %"sc_result", label %"for.body", label %"for.end"
}

define i8* @"standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1"(i8* %"s1", i8* %"s2")
{
entry:
  %"s1.addr" = alloca i8*
  store i8* %"s1", i8** %"s1.addr"
  %"s2.addr" = alloca i8*
  store i8* %"s2", i8** %"s2.addr"
  %"len1" = alloca i32
  store i32 0, i32* %"len1"
  %"len2" = alloca i32
  %"result" = alloca i8*
  %"i" = alloca i32
  %"i.5" = alloca i32
  br label %"while.cond"
while.cond:
  %"s1.1" = load i8*, i8** %"s1.addr"
  %"len1.1" = load i32, i32* %"len1"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"s1.1", i32 %"len1.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".8" = zext i8 %"ptr_load" to i32
  %".9" = icmp ne i32 %".8", 0
  br i1 %".9", label %"while.body", label %"while.end"
while.body:
  %"len1.2" = load i32, i32* %"len1"
  %".11" = add i32 %"len1.2", 1
  store i32 %".11", i32* %"len1"
  br label %"while.cond"
while.end:
  store i32 0, i32* %"len2"
  br label %"while.cond.1"
while.cond.1:
  %"s2.1" = load i8*, i8** %"s2.addr"
  %"len2.1" = load i32, i32* %"len2"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"s2.1", i32 %"len2.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".16" = zext i8 %"ptr_load.1" to i32
  %".17" = icmp ne i32 %".16", 0
  br i1 %".17", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"len2.2" = load i32, i32* %"len2"
  %".19" = add i32 %"len2.2", 1
  store i32 %".19", i32* %"len2"
  br label %"while.cond.1"
while.end.1:
  %"len1.3" = load i32, i32* %"len1"
  %".22" = zext i32 %"len1.3" to i64
  %"len2.3" = load i32, i32* %"len2"
  %".23" = zext i32 %"len2.3" to i64
  %".24" = add i64 %".22", %".23"
  %".25" = zext i32 1 to i64
  %".26" = add i64 %".24", %".25"
  %".27" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".26")
  %"int_to_ptr" = inttoptr i64 %".27" to i8*
  store i8* %"int_to_ptr", i8** %"result"
  %"result.1" = load i8*, i8** %"result"
  %".29" = ptrtoint i8* %"result.1" to i64
  %".30" = ptrtoint i8* null to i64
  %".31" = icmp eq i64 %".29", %".30"
  br i1 %".31", label %"then", label %"else"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr.1"
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"len1.4" = load i32, i32* %"len1"
  %".37" = icmp slt i32 %"i.1", %"len1.4"
  br i1 %".37", label %"for.body", label %"for.end"
for.body:
  %"s1.2" = load i8*, i8** %"s1.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"s1.2", i32 %"i.2"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %"result.2" = load i8*, i8** %"result"
  %"i.3" = load i32, i32* %"i"
  %".39" = getelementptr inbounds i8, i8* %"result.2", i32 %"i.3"
  store i8 %"ptr_load.2", i8* %".39"
  br label %"for.update"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".42" = add i32 %"i.4", 1
  store i32 %".42", i32* %"i"
  br label %"for.cond"
for.end:
  store i32 0, i32* %"i.5"
  br label %"for.cond.1"
for.cond.1:
  %"i.6" = load i32, i32* %"i.5"
  %"len2.4" = load i32, i32* %"len2"
  %".47" = icmp slt i32 %"i.6", %"len2.4"
  br i1 %".47", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"s2.2" = load i8*, i8** %"s2.addr"
  %"i.7" = load i32, i32* %"i.5"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"s2.2", i32 %"i.7"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %"result.3" = load i8*, i8** %"result"
  %"len1.5" = load i32, i32* %"len1"
  %"i.8" = load i32, i32* %"i.5"
  %".49" = add i32 %"len1.5", %"i.8"
  %".50" = getelementptr inbounds i8, i8* %"result.3", i32 %".49"
  store i8 %"ptr_load.3", i8* %".50"
  br label %"for.update.1"
for.update.1:
  %"i.9" = load i32, i32* %"i.5"
  %".53" = add i32 %"i.9", 1
  store i32 %".53", i32* %"i.5"
  br label %"for.cond.1"
for.end.1:
  %".56" = trunc i32 0 to i8
  %"result.4" = load i8*, i8** %"result"
  %"len1.6" = load i32, i32* %"len1"
  %"len2.5" = load i32, i32* %"len2"
  %".57" = add i32 %"len1.6", %"len2.5"
  %".58" = getelementptr inbounds i8, i8* %"result.4", i32 %".57"
  store i8 %".56", i8* %".58"
  %"result.5" = load i8*, i8** %"result"
  ret i8* %"result.5"
}

declare external i32 @"strcmp"(i8* %"x", i8* %"y")

declare external void @"printf"(i8* %"x", i8* %"y")

declare external i8* @"strncpy"(i8* %"dest", i8* %"src", i64 %"n")

declare external i8* @"strcat"(i8* %"dest", i8* %"src")

declare external i8* @"strncat"(i8* %"dest", i8* %"src", i64 %"n")

declare external i32 @"strncmp"(i8* %"s1", i8* %"s2", i64 %"n")

declare external i8* @"strtok"(i8* %"str", i8* %"delim")

declare external i8* @"strtok_s"(i8* %"str", i8* %"delim", i8** %"saveptr")

declare external i8* @"_strdup"(i8* %"str")

define i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"ps")
{
entry:
  %"ps.addr" = alloca i8*
  store i8* %"ps", i8** %"ps.addr"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"ch" = alloca i8*
  store i8* null, i8** %"ch"
  br label %"do.body"
do.body:
  %"ps.1" = load i8*, i8** %"ps.addr"
  %"ptr_inc" = getelementptr i8, i8* %"ps.1", i32 1
  store i8* %"ptr_inc", i8** %"ps.addr"
  store i8* %"ps.1", i8** %"ch"
  %"ch.1" = load i8*, i8** %"ch"
  %"deref" = load i8, i8* %"ch.1"
  switch i8 %"deref", label %"switch_default" [i8 0, label %"switch_case_0"]
do.end:
  %"c.2" = load i32, i32* %"c"
  ret i32 %"c.2"
switch_merge:
  %"c.1" = load i32, i32* %"c"
  %".12" = add i32 %"c.1", 1
  store i32 %".12", i32* %"c"
  br label %"do.body"
switch_case_0:
  br label %"do.end"
switch_default:
  br label %"switch_merge"
}

define i16 @"standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16"(i16 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i16
  store i16 %"value", i16* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i16, i16* %"value.addr"
  %".6" = sext i16 %"value.1" to i32
  %".7" = icmp eq i32 %".6", 0
  %"is_negative" = alloca i1
  %"pos" = alloca i16
  %"temp" = alloca [8 x i8]
  %"write_pos" = alloca i16
  %"i" = alloca i16
  br i1 %".7", label %"then", label %"else"
then:
  %".9" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".10" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".9", i8* %".10"
  %".12" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".13" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".12", i8* %".13"
  %".15" = trunc i32 1 to i16
  ret i16 %".15"
else:
  br label %"ifcont"
ifcont:
  store i1 0, i1* %"is_negative"
  %"value.2" = load i16, i16* %"value.addr"
  %".19" = trunc i32 0 to i16
  %".20" = icmp slt i16 %"value.2", %".19"
  br i1 %".20", label %"then.1", label %"else.1"
then.1:
  store i1 true, i1* %"is_negative"
  %"value.3" = load i16, i16* %"value.addr"
  %".23" = sub i16 0, %"value.3"
  store i16 %".23", i16* %"value.addr"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".27" = trunc i32 0 to i16
  store i16 %".27", i16* %"pos"
  store [8 x i8] zeroinitializer, [8 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.4" = load i16, i16* %"value.addr"
  %".31" = trunc i32 0 to i16
  %".32" = icmp sgt i16 %"value.4", %".31"
  br i1 %".32", label %"while.body", label %"while.end"
while.body:
  %"value.5" = load i16, i16* %"value.addr"
  %".34" = trunc i32 10 to i16
  %".35" = srem i16 %"value.5", %".34"
  %".36" = trunc i32 48 to i16
  %".37" = add i16 %".35", %".36"
  %".38" = trunc i16 %".37" to i8
  %"pos.1" = load i16, i16* %"pos"
  %".39" = getelementptr inbounds [8 x i8], [8 x i8]* %"temp", i32 0, i16 %"pos.1"
  store i8 %".38", i8* %".39"
  %"value.6" = load i16, i16* %"value.addr"
  %".41" = trunc i32 10 to i16
  %".42" = sdiv i16 %"value.6", %".41"
  store i16 %".42", i16* %"value.addr"
  %"pos.2" = load i16, i16* %"pos"
  %".44" = add i16 %"pos.2", 1
  store i16 %".44", i16* %"pos"
  br label %"while.cond"
while.end:
  %".47" = trunc i32 0 to i16
  store i16 %".47", i16* %"write_pos"
  %"is_negative.1" = load i1, i1* %"is_negative"
  br i1 %"is_negative.1", label %"then.2", label %"else.2"
then.2:
  %".50" = trunc i32 45 to i8
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %".51" = getelementptr inbounds i8, i8* %"buffer.3", i32 0
  store i8 %".50", i8* %".51"
  %".53" = trunc i32 1 to i16
  store i16 %".53", i16* %"write_pos"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"pos.3" = load i16, i16* %"pos"
  %".57" = trunc i32 1 to i16
  %".58" = sub i16 %"pos.3", %".57"
  store i16 %".58", i16* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i16, i16* %"i"
  %".61" = trunc i32 0 to i16
  %".62" = icmp sge i16 %"i.1", %".61"
  br i1 %".62", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i16, i16* %"i"
  %"idx_ext" = sext i16 %"i.2" to i32
  %"array_gep" = getelementptr inbounds [8 x i8], [8 x i8]* %"temp", i32 0, i32 %"idx_ext"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i16, i16* %"write_pos"
  %".64" = getelementptr inbounds i8, i8* %"buffer.4", i16 %"write_pos.1"
  store i8 %"array_load", i8* %".64"
  %"write_pos.2" = load i16, i16* %"write_pos"
  %".66" = add i16 %"write_pos.2", 1
  store i16 %".66", i16* %"write_pos"
  %"i.3" = load i16, i16* %"i"
  %".68" = sub i16 %"i.3", 1
  store i16 %".68", i16* %"i"
  br label %"while.cond.1"
while.end.1:
  %".71" = trunc i32 0 to i8
  %"buffer.5" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i16, i16* %"write_pos"
  %".72" = getelementptr inbounds i8, i8* %"buffer.5", i16 %"write_pos.3"
  store i8 %".71", i8* %".72"
  %"write_pos.4" = load i16, i16* %"write_pos"
  ret i16 %"write_pos.4"
}

define i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i32
  store i32 %"value", i32* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i32, i32* %"value.addr"
  %".6" = icmp eq i32 %"value.1", 0
  %"is_negative" = alloca i32
  %"pos" = alloca i32
  %"temp" = alloca [32 x i8]
  %"write_pos" = alloca i32
  %"i" = alloca i32
  br i1 %".6", label %"then", label %"else"
then:
  %".8" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".9" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".8", i8* %".9"
  %".11" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".12" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".11", i8* %".12"
  ret i32 1
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"is_negative"
  %"value.2" = load i32, i32* %"value.addr"
  %".17" = icmp slt i32 %"value.2", 0
  br i1 %".17", label %"then.1", label %"else.1"
then.1:
  store i32 1, i32* %"is_negative"
  %"value.3" = load i32, i32* %"value.addr"
  %".20" = sub i32 0, %"value.3"
  store i32 %".20", i32* %"value.addr"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  store i32 0, i32* %"pos"
  store [32 x i8] zeroinitializer, [32 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.4" = load i32, i32* %"value.addr"
  %".27" = icmp sgt i32 %"value.4", 0
  br i1 %".27", label %"while.body", label %"while.end"
while.body:
  %"value.5" = load i32, i32* %"value.addr"
  %".29" = srem i32 %"value.5", 10
  %".30" = add i32 %".29", 48
  %".31" = trunc i32 %".30" to i8
  %"pos.1" = load i32, i32* %"pos"
  %".32" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"pos.1"
  store i8 %".31", i8* %".32"
  %"value.6" = load i32, i32* %"value.addr"
  %".34" = sdiv i32 %"value.6", 10
  store i32 %".34", i32* %"value.addr"
  %"pos.2" = load i32, i32* %"pos"
  %".36" = add i32 %"pos.2", 1
  store i32 %".36", i32* %"pos"
  br label %"while.cond"
while.end:
  store i32 0, i32* %"write_pos"
  %"is_negative.1" = load i32, i32* %"is_negative"
  %".40" = icmp eq i32 %"is_negative.1", 1
  br i1 %".40", label %"then.2", label %"else.2"
then.2:
  %".42" = trunc i32 45 to i8
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %".43" = getelementptr inbounds i8, i8* %"buffer.3", i32 0
  store i8 %".42", i8* %".43"
  store i32 1, i32* %"write_pos"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"pos.3" = load i32, i32* %"pos"
  %".48" = sub i32 %"pos.3", 1
  store i32 %".48", i32* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".51" = icmp sge i32 %"i.1", 0
  br i1 %".51", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i32, i32* %"write_pos"
  %".53" = getelementptr inbounds i8, i8* %"buffer.4", i32 %"write_pos.1"
  store i8 %"array_load", i8* %".53"
  %"write_pos.2" = load i32, i32* %"write_pos"
  %".55" = add i32 %"write_pos.2", 1
  store i32 %".55", i32* %"write_pos"
  %"i.3" = load i32, i32* %"i"
  %".57" = sub i32 %"i.3", 1
  store i32 %".57", i32* %"i"
  br label %"while.cond.1"
while.end.1:
  %".60" = trunc i32 0 to i8
  %"buffer.5" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i32, i32* %"write_pos"
  %".61" = getelementptr inbounds i8, i8* %"buffer.5", i32 %"write_pos.3"
  store i8 %".60", i8* %".61"
  %"write_pos.4" = load i32, i32* %"write_pos"
  ret i32 %"write_pos.4"
}

define i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i64
  store i64 %"value", i64* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i64, i64* %"value.addr"
  %".6" = sext i32 0 to i64
  %".7" = icmp eq i64 %"value.1", %".6"
  %"is_negative" = alloca i64
  %"pos" = alloca i64
  %"temp" = alloca [32 x i8]
  %"write_pos" = alloca i64
  %"i" = alloca i64
  br i1 %".7", label %"then", label %"else"
then:
  %".9" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".10" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".9", i8* %".10"
  %".12" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".13" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".12", i8* %".13"
  %".15" = sext i32 1 to i64
  ret i64 %".15"
else:
  br label %"ifcont"
ifcont:
  %".18" = sext i32 0 to i64
  store i64 %".18", i64* %"is_negative"
  %"value.2" = load i64, i64* %"value.addr"
  %".20" = sext i32 0 to i64
  %".21" = icmp slt i64 %"value.2", %".20"
  br i1 %".21", label %"then.1", label %"else.1"
then.1:
  %".23" = sext i32 1 to i64
  store i64 %".23", i64* %"is_negative"
  %"value.3" = load i64, i64* %"value.addr"
  %".25" = sub i64 0, %"value.3"
  store i64 %".25", i64* %"value.addr"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".29" = sext i32 0 to i64
  store i64 %".29", i64* %"pos"
  store [32 x i8] zeroinitializer, [32 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.4" = load i64, i64* %"value.addr"
  %".33" = sext i32 0 to i64
  %".34" = icmp sgt i64 %"value.4", %".33"
  br i1 %".34", label %"while.body", label %"while.end"
while.body:
  %"value.5" = load i64, i64* %"value.addr"
  %".36" = sext i32 10 to i64
  %".37" = srem i64 %"value.5", %".36"
  %".38" = sext i32 48 to i64
  %".39" = add i64 %".37", %".38"
  %".40" = trunc i64 %".39" to i8
  %"pos.1" = load i64, i64* %"pos"
  %".41" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i64 %"pos.1"
  store i8 %".40", i8* %".41"
  %"value.6" = load i64, i64* %"value.addr"
  %".43" = sext i32 10 to i64
  %".44" = sdiv i64 %"value.6", %".43"
  store i64 %".44", i64* %"value.addr"
  %"pos.2" = load i64, i64* %"pos"
  %".46" = add i64 %"pos.2", 1
  store i64 %".46", i64* %"pos"
  br label %"while.cond"
while.end:
  %".49" = sext i32 0 to i64
  store i64 %".49", i64* %"write_pos"
  %"is_negative.1" = load i64, i64* %"is_negative"
  %".51" = sext i32 1 to i64
  %".52" = icmp eq i64 %"is_negative.1", %".51"
  br i1 %".52", label %"then.2", label %"else.2"
then.2:
  %".54" = trunc i32 45 to i8
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %".55" = getelementptr inbounds i8, i8* %"buffer.3", i32 0
  store i8 %".54", i8* %".55"
  %".57" = sext i32 1 to i64
  store i64 %".57", i64* %"write_pos"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"pos.3" = load i64, i64* %"pos"
  %".61" = sext i32 1 to i64
  %".62" = sub i64 %"pos.3", %".61"
  store i64 %".62", i64* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i64, i64* %"i"
  %".65" = sext i32 0 to i64
  %".66" = icmp sge i64 %"i.1", %".65"
  br i1 %".66", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.2" to i32
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"idx_trunc"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i64, i64* %"write_pos"
  %".68" = getelementptr inbounds i8, i8* %"buffer.4", i64 %"write_pos.1"
  store i8 %"array_load", i8* %".68"
  %"write_pos.2" = load i64, i64* %"write_pos"
  %".70" = add i64 %"write_pos.2", 1
  store i64 %".70", i64* %"write_pos"
  %"i.3" = load i64, i64* %"i"
  %".72" = sub i64 %"i.3", 1
  store i64 %".72", i64* %"i"
  br label %"while.cond.1"
while.end.1:
  %".75" = trunc i32 0 to i8
  %"buffer.5" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i64, i64* %"write_pos"
  %".76" = getelementptr inbounds i8, i8* %"buffer.5", i64 %"write_pos.3"
  store i8 %".75", i8* %".76"
  %"write_pos.4" = load i64, i64* %"write_pos"
  ret i64 %"write_pos.4"
}

define i16 @"standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16"(i16 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i16
  store i16 %"value", i16* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i16, i16* %"value.addr"
  %".6" = trunc i32 0 to i16
  %".7" = icmp eq i16 %"value.1", %".6"
  %"pos" = alloca i16
  %"temp" = alloca [8 x i8]
  %"write_pos" = alloca i16
  %"i" = alloca i16
  br i1 %".7", label %"then", label %"else"
then:
  %".9" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".10" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".9", i8* %".10"
  %".12" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".13" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".12", i8* %".13"
  %".15" = trunc i32 1 to i16
  ret i16 %".15"
else:
  br label %"ifcont"
ifcont:
  %".18" = trunc i32 0 to i16
  store i16 %".18", i16* %"pos"
  store [8 x i8] zeroinitializer, [8 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.2" = load i16, i16* %"value.addr"
  %".22" = trunc i32 0 to i16
  %".23" = icmp ugt i16 %"value.2", %".22"
  br i1 %".23", label %"while.body", label %"while.end"
while.body:
  %"value.3" = load i16, i16* %"value.addr"
  %".25" = trunc i32 10 to i16
  %".26" = urem i16 %"value.3", %".25"
  %".27" = trunc i32 48 to i16
  %".28" = add i16 %".26", %".27"
  %".29" = trunc i16 %".28" to i8
  %"pos.1" = load i16, i16* %"pos"
  %".30" = getelementptr inbounds [8 x i8], [8 x i8]* %"temp", i32 0, i16 %"pos.1"
  store i8 %".29", i8* %".30"
  %"value.4" = load i16, i16* %"value.addr"
  %".32" = trunc i32 10 to i16
  %".33" = udiv i16 %"value.4", %".32"
  store i16 %".33", i16* %"value.addr"
  %"pos.2" = load i16, i16* %"pos"
  %".35" = add i16 %"pos.2", 1
  store i16 %".35", i16* %"pos"
  br label %"while.cond"
while.end:
  %".38" = trunc i32 0 to i16
  store i16 %".38", i16* %"write_pos"
  %"pos.3" = load i16, i16* %"pos"
  store i16 %"pos.3", i16* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i16, i16* %"i"
  %".42" = trunc i32 0 to i16
  %".43" = icmp ugt i16 %"i.1", %".42"
  br i1 %".43", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i16, i16* %"i"
  %".45" = sub i16 %"i.2", 1
  store i16 %".45", i16* %"i"
  %"i.3" = load i16, i16* %"i"
  %"idx_ext" = sext i16 %"i.3" to i32
  %"array_gep" = getelementptr inbounds [8 x i8], [8 x i8]* %"temp", i32 0, i32 %"idx_ext"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i16, i16* %"write_pos"
  %".47" = getelementptr inbounds i8, i8* %"buffer.3", i16 %"write_pos.1"
  store i8 %"array_load", i8* %".47"
  %"write_pos.2" = load i16, i16* %"write_pos"
  %".49" = add i16 %"write_pos.2", 1
  store i16 %".49", i16* %"write_pos"
  br label %"while.cond.1"
while.end.1:
  %".52" = trunc i32 0 to i8
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i16, i16* %"write_pos"
  %".53" = getelementptr inbounds i8, i8* %"buffer.4", i16 %"write_pos.3"
  store i8 %".52", i8* %".53"
  %"write_pos.4" = load i16, i16* %"write_pos"
  ret i16 %"write_pos.4"
}

define i32 @"standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32"(i32 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i32
  store i32 %"value", i32* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i32, i32* %"value.addr"
  %".6" = icmp eq i32 %"value.1", 0
  %"pos" = alloca i32
  %"temp" = alloca [32 x i8]
  %"write_pos" = alloca i32
  %"i" = alloca i32
  br i1 %".6", label %"then", label %"else"
then:
  %".8" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".9" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".8", i8* %".9"
  %".11" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".12" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".11", i8* %".12"
  ret i32 1
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"pos"
  store [32 x i8] zeroinitializer, [32 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.2" = load i32, i32* %"value.addr"
  %".19" = icmp ugt i32 %"value.2", 0
  br i1 %".19", label %"while.body", label %"while.end"
while.body:
  %"value.3" = load i32, i32* %"value.addr"
  %".21" = urem i32 %"value.3", 10
  %".22" = add i32 %".21", 48
  %".23" = trunc i32 %".22" to i8
  %"pos.1" = load i32, i32* %"pos"
  %".24" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"pos.1"
  store i8 %".23", i8* %".24"
  %"value.4" = load i32, i32* %"value.addr"
  %".26" = udiv i32 %"value.4", 10
  store i32 %".26", i32* %"value.addr"
  %"pos.2" = load i32, i32* %"pos"
  %".28" = add i32 %"pos.2", 1
  store i32 %".28", i32* %"pos"
  br label %"while.cond"
while.end:
  store i32 0, i32* %"write_pos"
  %"pos.3" = load i32, i32* %"pos"
  store i32 %"pos.3", i32* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".34" = icmp ugt i32 %"i.1", 0
  br i1 %".34", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.2" = load i32, i32* %"i"
  %".36" = sub i32 %"i.2", 1
  store i32 %".36", i32* %"i"
  %"i.3" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"i.3"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i32, i32* %"write_pos"
  %".38" = getelementptr inbounds i8, i8* %"buffer.3", i32 %"write_pos.1"
  store i8 %"array_load", i8* %".38"
  %"write_pos.2" = load i32, i32* %"write_pos"
  %".40" = add i32 %"write_pos.2", 1
  store i32 %".40", i32* %"write_pos"
  br label %"while.cond.1"
while.end.1:
  %".43" = trunc i32 0 to i8
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i32, i32* %"write_pos"
  %".44" = getelementptr inbounds i8, i8* %"buffer.4", i32 %"write_pos.3"
  store i8 %".43", i8* %".44"
  %"write_pos.4" = load i32, i32* %"write_pos"
  ret i32 %"write_pos.4"
}

define i64 @"standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64"(i64 %"value", i8* %"buffer")
{
entry:
  %"value.addr" = alloca i64
  store i64 %"value", i64* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"value.1" = load i64, i64* %"value.addr"
  %".6" = sext i32 0 to i64
  %".7" = icmp eq i64 %"value.1", %".6"
  %"pos" = alloca i64
  %"temp" = alloca [32 x i8]
  %"write_pos" = alloca i64
  %"remaining" = alloca i64
  br i1 %".7", label %"then", label %"else"
then:
  %".9" = trunc i32 48 to i8
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".10" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 %".9", i8* %".10"
  %".12" = trunc i32 0 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %".13" = getelementptr inbounds i8, i8* %"buffer.2", i32 1
  store i8 %".12", i8* %".13"
  %".15" = sext i32 1 to i64
  ret i64 %".15"
else:
  br label %"ifcont"
ifcont:
  %".18" = sext i32 0 to i64
  store i64 %".18", i64* %"pos"
  store [32 x i8] zeroinitializer, [32 x i8]* %"temp"
  br label %"while.cond"
while.cond:
  %"value.2" = load i64, i64* %"value.addr"
  %".22" = sext i32 0 to i64
  %".23" = icmp ne i64 %"value.2", %".22"
  br i1 %".23", label %"while.body", label %"while.end"
while.body:
  %"value.3" = load i64, i64* %"value.addr"
  %".25" = sext i32 10 to i64
  %".26" = urem i64 %"value.3", %".25"
  %".27" = sext i32 48 to i64
  %".28" = add i64 %".26", %".27"
  %".29" = trunc i64 %".28" to i8
  %"pos.1" = load i64, i64* %"pos"
  %".30" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i64 %"pos.1"
  store i8 %".29", i8* %".30"
  %"value.4" = load i64, i64* %"value.addr"
  %".32" = sext i32 10 to i64
  %".33" = udiv i64 %"value.4", %".32"
  store i64 %".33", i64* %"value.addr"
  %"pos.2" = load i64, i64* %"pos"
  %".35" = add i64 %"pos.2", 1
  store i64 %".35", i64* %"pos"
  br label %"while.cond"
while.end:
  %".38" = sext i32 0 to i64
  store i64 %".38", i64* %"write_pos"
  %"pos.3" = load i64, i64* %"pos"
  store i64 %"pos.3", i64* %"remaining"
  br label %"while.cond.1"
while.cond.1:
  %"remaining.1" = load i64, i64* %"remaining"
  %".42" = sext i32 0 to i64
  %".43" = icmp ne i64 %"remaining.1", %".42"
  br i1 %".43", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"remaining.2" = load i64, i64* %"remaining"
  %".45" = sub i64 %"remaining.2", 1
  store i64 %".45", i64* %"remaining"
  %"remaining.3" = load i64, i64* %"remaining"
  %"idx_trunc" = trunc i64 %"remaining.3" to i32
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"temp", i32 0, i32 %"idx_trunc"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i64, i64* %"write_pos"
  %".47" = getelementptr inbounds i8, i8* %"buffer.3", i64 %"write_pos.1"
  store i8 %"array_load", i8* %".47"
  %"write_pos.2" = load i64, i64* %"write_pos"
  %".49" = add i64 %"write_pos.2", 1
  store i64 %".49", i64* %"write_pos"
  br label %"while.cond.1"
while.end.1:
  %".52" = trunc i32 0 to i8
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i64, i64* %"write_pos"
  %".53" = getelementptr inbounds i8, i8* %"buffer.4", i64 %"write_pos.3"
  store i8 %".52", i8* %".53"
  %"write_pos.4" = load i64, i64* %"write_pos"
  ret i64 %"write_pos.4"
}

define i32 @"standard__strings__str2i32__1__byteE1_ptr1__ret_intE1"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"result" = alloca i32
  store i32 0, i32* %"result"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"digit" = alloca i32
  store i32 0, i32* %"digit"
  %"sign" = alloca i32
  store i32 1, i32* %"sign"
  %"c" = alloca i8
  store i8 0, i8* %"c"
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".10" = zext i8 %"ptr_load" to i32
  %".11" = icmp eq i32 %".10", 32
  br i1 %".11", label %"sc_end", label %"sc_rhs"
while.body:
  %"i.5" = load i32, i32* %"i"
  %".25" = add i32 %"i.5", 1
  store i32 %".25", i32* %"i"
  br label %"while.cond"
while.end:
  %"str.5" = load i8*, i8** %"str.addr"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"str.5", i32 %"i.6"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".28" = zext i8 %"ptr_load.4" to i32
  %".29" = icmp eq i32 %".28", 45
  br i1 %".29", label %"then", label %"else"
sc_rhs:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".13" = zext i8 %"ptr_load.1" to i32
  %".14" = icmp eq i32 %".13", 9
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"while.cond"], [%".14", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".17" = zext i8 %"ptr_load.2" to i32
  %".18" = icmp eq i32 %".17", 10
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"sc_end"], [%".18", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"sc_end.2", label %"sc_rhs.2"
sc_rhs.2:
  %"str.4" = load i8*, i8** %"str.addr"
  %"i.4" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"i.4"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".21" = zext i8 %"ptr_load.3" to i32
  %".22" = icmp eq i32 %".21", 13
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [1, %"sc_end.1"], [%".22", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"while.body", label %"while.end"
then:
  %".31" = sub i32 0, 1
  store i32 %".31", i32* %"sign"
  %"i.7" = load i32, i32* %"i"
  %".33" = add i32 %"i.7", 1
  store i32 %".33", i32* %"i"
  br label %"ifcont"
else:
  %"str.6" = load i8*, i8** %"str.addr"
  %"i.8" = load i32, i32* %"i"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"str.6", i32 %"i.8"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".36" = zext i8 %"ptr_load.5" to i32
  %".37" = icmp eq i32 %".36", 43
  br i1 %".37", label %"elif_then_0", label %"elif_else_0"
ifcont:
  br label %"while.cond.1"
elif_then_0:
  %"i.9" = load i32, i32* %"i"
  %".39" = add i32 %"i.9", 1
  store i32 %".39", i32* %"i"
  br label %"ifcont"
elif_else_0:
  br label %"ifcont"
while.cond.1:
  %"str.7" = load i8*, i8** %"str.addr"
  %"i.10" = load i32, i32* %"i"
  %"ptr_gep.6" = getelementptr inbounds i8, i8* %"str.7", i32 %"i.10"
  %"ptr_load.6" = load i8, i8* %"ptr_gep.6"
  %".44" = zext i8 %"ptr_load.6" to i32
  %".45" = icmp ne i32 %".44", 0
  br i1 %".45", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"str.8" = load i8*, i8** %"str.addr"
  %"i.11" = load i32, i32* %"i"
  %"ptr_gep.7" = getelementptr inbounds i8, i8* %"str.8", i32 %"i.11"
  %"ptr_load.7" = load i8, i8* %"ptr_gep.7"
  store i8 %"ptr_load.7", i8* %"c"
  %"c.1" = load i8, i8* %"c"
  %".48" = zext i8 %"c.1" to i32
  %".49" = icmp uge i32 %".48", 48
  br i1 %".49", label %"sc_rhs.3", label %"sc_end.3"
while.end.1:
  %"result.2" = load i32, i32* %"result"
  %"sign.1" = load i32, i32* %"sign"
  %".66" = mul i32 %"result.2", %"sign.1"
  ret i32 %".66"
sc_rhs.3:
  %"c.2" = load i8, i8* %"c"
  %".51" = zext i8 %"c.2" to i32
  %".52" = icmp ule i32 %".51", 57
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"while.body.1"], [%".52", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"then.1", label %"else.1"
then.1:
  %"c.3" = load i8, i8* %"c"
  %".55" = zext i8 %"c.3" to i32
  %".56" = sub i32 %".55", 48
  store i32 %".56", i32* %"digit"
  %"result.1" = load i32, i32* %"result"
  %".58" = mul i32 %"result.1", 10
  %"digit.1" = load i32, i32* %"digit"
  %".59" = add i32 %".58", %"digit.1"
  store i32 %".59", i32* %"result"
  br label %"ifcont.1"
else.1:
  br label %"while.end.1"
ifcont.1:
  %"i.12" = load i32, i32* %"i"
  %".63" = add i32 %"i.12", 1
  store i32 %".63", i32* %"i"
  br label %"while.cond.1"
}

define i32 @"standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"result" = alloca i32
  store i32 0, i32* %"result"
  %"digit" = alloca i32
  store i32 0, i32* %"digit"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"c" = alloca i8
  store i8 0, i8* %"c"
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".9" = zext i8 %"ptr_load" to i32
  %".10" = icmp eq i32 %".9", 32
  br i1 %".10", label %"sc_end", label %"sc_rhs"
while.body:
  %"i.5" = load i32, i32* %"i"
  %".24" = add i32 %"i.5", 1
  store i32 %".24", i32* %"i"
  br label %"while.cond"
while.end:
  %"str.5" = load i8*, i8** %"str.addr"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"str.5", i32 %"i.6"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".27" = zext i8 %"ptr_load.4" to i32
  %".28" = icmp eq i32 %".27", 45
  br i1 %".28", label %"then", label %"else"
sc_rhs:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".12" = zext i8 %"ptr_load.1" to i32
  %".13" = icmp eq i32 %".12", 9
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"while.cond"], [%".13", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".16" = zext i8 %"ptr_load.2" to i32
  %".17" = icmp eq i32 %".16", 10
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"sc_end"], [%".17", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"sc_end.2", label %"sc_rhs.2"
sc_rhs.2:
  %"str.4" = load i8*, i8** %"str.addr"
  %"i.4" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"i.4"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".20" = zext i8 %"ptr_load.3" to i32
  %".21" = icmp eq i32 %".20", 13
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [1, %"sc_end.1"], [%".21", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"while.body", label %"while.end"
then:
  ret i32 0
else:
  %"str.6" = load i8*, i8** %"str.addr"
  %"i.7" = load i32, i32* %"i"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"str.6", i32 %"i.7"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".31" = zext i8 %"ptr_load.5" to i32
  %".32" = icmp eq i32 %".31", 43
  br i1 %".32", label %"elif_then_0", label %"elif_else_0"
ifcont:
  br label %"while.cond.1"
elif_then_0:
  %"i.8" = load i32, i32* %"i"
  %".34" = add i32 %"i.8", 1
  store i32 %".34", i32* %"i"
  br label %"ifcont"
elif_else_0:
  br label %"ifcont"
while.cond.1:
  %"str.7" = load i8*, i8** %"str.addr"
  %"i.9" = load i32, i32* %"i"
  %"ptr_gep.6" = getelementptr inbounds i8, i8* %"str.7", i32 %"i.9"
  %"ptr_load.6" = load i8, i8* %"ptr_gep.6"
  %".39" = zext i8 %"ptr_load.6" to i32
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"str.8" = load i8*, i8** %"str.addr"
  %"i.10" = load i32, i32* %"i"
  %"ptr_gep.7" = getelementptr inbounds i8, i8* %"str.8", i32 %"i.10"
  %"ptr_load.7" = load i8, i8* %"ptr_gep.7"
  store i8 %"ptr_load.7", i8* %"c"
  %"c.1" = load i8, i8* %"c"
  %".43" = zext i8 %"c.1" to i32
  %".44" = icmp uge i32 %".43", 48
  br i1 %".44", label %"sc_rhs.3", label %"sc_end.3"
while.end.1:
  %"result.2" = load i32, i32* %"result"
  ret i32 %"result.2"
sc_rhs.3:
  %"c.2" = load i8, i8* %"c"
  %".46" = zext i8 %"c.2" to i32
  %".47" = icmp ule i32 %".46", 57
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"while.body.1"], [%".47", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"then.1", label %"else.1"
then.1:
  %"c.3" = load i8, i8* %"c"
  %".50" = zext i8 %"c.3" to i32
  %".51" = sub i32 %".50", 48
  store i32 %".51", i32* %"digit"
  %"result.1" = load i32, i32* %"result"
  %".53" = mul i32 %"result.1", 10
  %"digit.1" = load i32, i32* %"digit"
  %".54" = add i32 %".53", %"digit.1"
  store i32 %".54", i32* %"result"
  br label %"ifcont.1"
else.1:
  br label %"while.end.1"
ifcont.1:
  %"i.11" = load i32, i32* %"i"
  %".58" = add i32 %"i.11", 1
  store i32 %".58", i32* %"i"
  br label %"while.cond.1"
}

define i64 @"standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"result" = alloca i64
  store i64 0, i64* %"result"
  %"digit" = alloca i64
  store i64 0, i64* %"digit"
  %"sign" = alloca i64
  %".6" = sext i32 1 to i64
  store i64 %".6", i64* %"sign"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"c" = alloca i8
  store i8 0, i8* %"c"
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".11" = zext i8 %"ptr_load" to i32
  %".12" = icmp eq i32 %".11", 32
  br i1 %".12", label %"sc_end", label %"sc_rhs"
while.body:
  %"i.5" = load i32, i32* %"i"
  %".26" = add i32 %"i.5", 1
  store i32 %".26", i32* %"i"
  br label %"while.cond"
while.end:
  %"str.5" = load i8*, i8** %"str.addr"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"str.5", i32 %"i.6"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".29" = zext i8 %"ptr_load.4" to i32
  %".30" = icmp eq i32 %".29", 45
  br i1 %".30", label %"then", label %"else"
sc_rhs:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".14" = zext i8 %"ptr_load.1" to i32
  %".15" = icmp eq i32 %".14", 9
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"while.cond"], [%".15", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".18" = zext i8 %"ptr_load.2" to i32
  %".19" = icmp eq i32 %".18", 10
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"sc_end"], [%".19", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"sc_end.2", label %"sc_rhs.2"
sc_rhs.2:
  %"str.4" = load i8*, i8** %"str.addr"
  %"i.4" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"i.4"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".22" = zext i8 %"ptr_load.3" to i32
  %".23" = icmp eq i32 %".22", 13
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [1, %"sc_end.1"], [%".23", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"while.body", label %"while.end"
then:
  %".32" = sub i32 0, 1
  %".33" = sext i32 %".32" to i64
  store i64 %".33", i64* %"sign"
  %"i.7" = load i32, i32* %"i"
  %".35" = add i32 %"i.7", 1
  store i32 %".35", i32* %"i"
  br label %"ifcont"
else:
  %"str.6" = load i8*, i8** %"str.addr"
  %"i.8" = load i32, i32* %"i"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"str.6", i32 %"i.8"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".38" = zext i8 %"ptr_load.5" to i32
  %".39" = icmp eq i32 %".38", 43
  br i1 %".39", label %"elif_then_0", label %"elif_else_0"
ifcont:
  br label %"while.cond.1"
elif_then_0:
  %"i.9" = load i32, i32* %"i"
  %".41" = add i32 %"i.9", 1
  store i32 %".41", i32* %"i"
  br label %"ifcont"
elif_else_0:
  br label %"ifcont"
while.cond.1:
  %"str.7" = load i8*, i8** %"str.addr"
  %"i.10" = load i32, i32* %"i"
  %"ptr_gep.6" = getelementptr inbounds i8, i8* %"str.7", i32 %"i.10"
  %"ptr_load.6" = load i8, i8* %"ptr_gep.6"
  %".46" = zext i8 %"ptr_load.6" to i32
  %".47" = icmp ne i32 %".46", 0
  br i1 %".47", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"str.8" = load i8*, i8** %"str.addr"
  %"i.11" = load i32, i32* %"i"
  %"ptr_gep.7" = getelementptr inbounds i8, i8* %"str.8", i32 %"i.11"
  %"ptr_load.7" = load i8, i8* %"ptr_gep.7"
  store i8 %"ptr_load.7", i8* %"c"
  %"c.1" = load i8, i8* %"c"
  %".50" = zext i8 %"c.1" to i32
  %".51" = icmp uge i32 %".50", 48
  br i1 %".51", label %"sc_rhs.3", label %"sc_end.3"
while.end.1:
  %"result.2" = load i64, i64* %"result"
  %"sign.1" = load i64, i64* %"sign"
  %".70" = mul i64 %"result.2", %"sign.1"
  ret i64 %".70"
sc_rhs.3:
  %"c.2" = load i8, i8* %"c"
  %".53" = zext i8 %"c.2" to i32
  %".54" = icmp ule i32 %".53", 57
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"while.body.1"], [%".54", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"then.1", label %"else.1"
then.1:
  %"c.3" = load i8, i8* %"c"
  %".57" = zext i8 %"c.3" to i32
  %".58" = sub i32 %".57", 48
  %".59" = zext i32 %".58" to i64
  store i64 %".59", i64* %"digit"
  %"result.1" = load i64, i64* %"result"
  %".61" = sext i32 10 to i64
  %".62" = mul i64 %"result.1", %".61"
  %"digit.1" = load i64, i64* %"digit"
  %".63" = add i64 %".62", %"digit.1"
  store i64 %".63", i64* %"result"
  br label %"ifcont.1"
else.1:
  br label %"while.end.1"
ifcont.1:
  %"i.12" = load i32, i32* %"i"
  %".67" = add i32 %"i.12", 1
  store i32 %".67", i32* %"i"
  br label %"while.cond.1"
}

define i64 @"standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"result" = alloca i64
  store i64 0, i64* %"result"
  %"digit" = alloca i64
  store i64 0, i64* %"digit"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"c" = alloca i8
  store i8 0, i8* %"c"
  br label %"while.cond"
while.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".9" = zext i8 %"ptr_load" to i32
  %".10" = icmp eq i32 %".9", 32
  br i1 %".10", label %"sc_end", label %"sc_rhs"
while.body:
  %"i.5" = load i32, i32* %"i"
  %".24" = add i32 %"i.5", 1
  store i32 %".24", i32* %"i"
  br label %"while.cond"
while.end:
  %"str.5" = load i8*, i8** %"str.addr"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"str.5", i32 %"i.6"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".27" = zext i8 %"ptr_load.4" to i32
  %".28" = icmp eq i32 %".27", 45
  br i1 %".28", label %"then", label %"else"
sc_rhs:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".12" = zext i8 %"ptr_load.1" to i32
  %".13" = icmp eq i32 %".12", 9
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"while.cond"], [%".13", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 %"i.3"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".16" = zext i8 %"ptr_load.2" to i32
  %".17" = icmp eq i32 %".16", 10
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"sc_end"], [%".17", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"sc_end.2", label %"sc_rhs.2"
sc_rhs.2:
  %"str.4" = load i8*, i8** %"str.addr"
  %"i.4" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"i.4"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".20" = zext i8 %"ptr_load.3" to i32
  %".21" = icmp eq i32 %".20", 13
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [1, %"sc_end.1"], [%".21", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"while.body", label %"while.end"
then:
  %".30" = sext i32 0 to i64
  ret i64 %".30"
else:
  %"str.6" = load i8*, i8** %"str.addr"
  %"i.7" = load i32, i32* %"i"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"str.6", i32 %"i.7"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".32" = zext i8 %"ptr_load.5" to i32
  %".33" = icmp eq i32 %".32", 43
  br i1 %".33", label %"elif_then_0", label %"elif_else_0"
ifcont:
  br label %"while.cond.1"
elif_then_0:
  %"i.8" = load i32, i32* %"i"
  %".35" = add i32 %"i.8", 1
  store i32 %".35", i32* %"i"
  br label %"ifcont"
elif_else_0:
  br label %"ifcont"
while.cond.1:
  %"str.7" = load i8*, i8** %"str.addr"
  %"i.9" = load i32, i32* %"i"
  %"ptr_gep.6" = getelementptr inbounds i8, i8* %"str.7", i32 %"i.9"
  %"ptr_load.6" = load i8, i8* %"ptr_gep.6"
  %".40" = zext i8 %"ptr_load.6" to i32
  %".41" = icmp ne i32 %".40", 0
  br i1 %".41", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"str.8" = load i8*, i8** %"str.addr"
  %"i.10" = load i32, i32* %"i"
  %"ptr_gep.7" = getelementptr inbounds i8, i8* %"str.8", i32 %"i.10"
  %"ptr_load.7" = load i8, i8* %"ptr_gep.7"
  store i8 %"ptr_load.7", i8* %"c"
  %"c.1" = load i8, i8* %"c"
  %".44" = zext i8 %"c.1" to i32
  %".45" = icmp uge i32 %".44", 48
  br i1 %".45", label %"sc_rhs.3", label %"sc_end.3"
while.end.1:
  %"result.2" = load i64, i64* %"result"
  ret i64 %"result.2"
sc_rhs.3:
  %"c.2" = load i8, i8* %"c"
  %".47" = zext i8 %"c.2" to i32
  %".48" = icmp ule i32 %".47", 57
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"while.body.1"], [%".48", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"then.1", label %"else.1"
then.1:
  %"c.3" = load i8, i8* %"c"
  %".51" = zext i8 %"c.3" to i32
  %".52" = sub i32 %".51", 48
  %".53" = zext i32 %".52" to i64
  store i64 %".53", i64* %"digit"
  %"result.1" = load i64, i64* %"result"
  %".55" = zext i32 10 to i64
  %".56" = mul i64 %"result.1", %".55"
  %"digit.1" = load i64, i64* %"digit"
  %".57" = add i64 %".56", %"digit.1"
  store i64 %".57", i64* %"result"
  br label %"ifcont.1"
else.1:
  br label %"while.end.1"
ifcont.1:
  %"i.11" = load i32, i32* %"i"
  %".61" = add i32 %"i.11", 1
  store i32 %".61", i32* %"i"
  br label %"while.cond.1"
}

define i32 @"standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(float %"value", i8* %"buffer", i32 %"precision")
{
entry:
  %"value.addr" = alloca float
  store float %"value", float* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"precision.addr" = alloca i32
  store i32 %"precision", i32* %"precision.addr"
  %"write_pos" = alloca i32
  store i32 0, i32* %"write_pos"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"value.1" = load float, float* %"value.addr"
  %".10" = fcmp olt float %"value.1",              0x0
  %"int_part" = alloca i32
  %"fractional" = alloca float
  %"frac_multiplier" = alloca i32
  %"j" = alloca i32
  %"scaled_frac" = alloca float
  %"frac_part" = alloca i32
  %"int_temp" = alloca [32 x i8]
  %"temp_pos" = alloca i32
  %"temp_int" = alloca i32
  %"k" = alloca i32
  %"m" = alloca i32
  %"frac_temp" = alloca [32 x i8]
  %"frac_digits" = alloca i32
  %"temp_frac" = alloca i32
  %"leading_zeros" = alloca i32
  %"n" = alloca i32
  %"p" = alloca i32
  br i1 %".10", label %"then", label %"else"
then:
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".12" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  %".13" = trunc i32 45 to i8
  store i8 %".13", i8* %".12"
  store i32 1, i32* %"write_pos"
  %"value.2" = load float, float* %"value.addr"
  %".16" = fsub float              0x0, %"value.2"
  store float %".16", float* %"value.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"value.3" = load float, float* %"value.addr"
  %".20" = fcmp oeq float %"value.3",              0x0
  br i1 %".20", label %"then.1", label %"else.1"
then.1:
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i32, i32* %"write_pos"
  %".22" = getelementptr inbounds i8, i8* %"buffer.2", i32 %"write_pos.1"
  %".23" = trunc i32 48 to i8
  store i8 %".23", i8* %".22"
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %"write_pos.2" = load i32, i32* %"write_pos"
  %".25" = add i32 %"write_pos.2", 1
  %".26" = getelementptr inbounds i8, i8* %"buffer.3", i32 %".25"
  %".27" = trunc i32 46 to i8
  store i8 %".27", i8* %".26"
  br label %"while.cond"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"value.4" = load float, float* %"value.addr"
  %".49" = fptosi float %"value.4" to i32
  store i32 %".49", i32* %"int_part"
  %"value.5" = load float, float* %"value.addr"
  %"int_part.1" = load i32, i32* %"int_part"
  %".51" = sitofp i32 %"int_part.1" to float
  %".52" = fsub float %"value.5", %".51"
  store float %".52", float* %"fractional"
  store i32 1, i32* %"frac_multiplier"
  store i32 0, i32* %"j"
  br label %"while.cond.1"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"precision.1" = load i32, i32* %"precision.addr"
  %".30" = icmp slt i32 %"i.1", %"precision.1"
  br i1 %".30", label %"while.body", label %"while.end"
while.body:
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i32, i32* %"write_pos"
  %".32" = add i32 %"write_pos.3", 2
  %"i.2" = load i32, i32* %"i"
  %".33" = add i32 %".32", %"i.2"
  %".34" = getelementptr inbounds i8, i8* %"buffer.4", i32 %".33"
  %".35" = trunc i32 48 to i8
  store i8 %".35", i8* %".34"
  %"i.3" = load i32, i32* %"i"
  %".37" = add i32 %"i.3", 1
  store i32 %".37", i32* %"i"
  br label %"while.cond"
while.end:
  %"buffer.5" = load i8*, i8** %"buffer.addr"
  %"write_pos.4" = load i32, i32* %"write_pos"
  %".40" = add i32 %"write_pos.4", 2
  %"precision.2" = load i32, i32* %"precision.addr"
  %".41" = add i32 %".40", %"precision.2"
  %".42" = getelementptr inbounds i8, i8* %"buffer.5", i32 %".41"
  %".43" = trunc i32 0 to i8
  store i8 %".43", i8* %".42"
  %"write_pos.5" = load i32, i32* %"write_pos"
  %".45" = add i32 %"write_pos.5", 1
  %"precision.3" = load i32, i32* %"precision.addr"
  %".46" = add i32 %".45", %"precision.3"
  ret i32 %".46"
while.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"precision.4" = load i32, i32* %"precision.addr"
  %".57" = icmp slt i32 %"j.1", %"precision.4"
  br i1 %".57", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"frac_multiplier.1" = load i32, i32* %"frac_multiplier"
  %".59" = mul i32 %"frac_multiplier.1", 10
  store i32 %".59", i32* %"frac_multiplier"
  %"j.2" = load i32, i32* %"j"
  %".61" = add i32 %"j.2", 1
  store i32 %".61", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  %"fractional.1" = load float, float* %"fractional"
  %"frac_multiplier.2" = load i32, i32* %"frac_multiplier"
  %".64" = sitofp i32 %"frac_multiplier.2" to float
  %".65" = fmul float %"fractional.1", %".64"
  store float %".65", float* %"scaled_frac"
  %"scaled_frac.1" = load float, float* %"scaled_frac"
  %".67" = fadd float %"scaled_frac.1", 0x3fe0000000000000
  %".68" = fptosi float %".67" to i32
  store i32 %".68", i32* %"frac_part"
  %"frac_part.1" = load i32, i32* %"frac_part"
  %"frac_multiplier.3" = load i32, i32* %"frac_multiplier"
  %".70" = icmp sge i32 %"frac_part.1", %"frac_multiplier.3"
  br i1 %".70", label %"then.2", label %"else.2"
then.2:
  %"int_part.2" = load i32, i32* %"int_part"
  %".72" = add i32 %"int_part.2", 1
  store i32 %".72", i32* %"int_part"
  store i32 0, i32* %"frac_part"
  %"int_part.3" = load i32, i32* %"int_part"
  %".75" = srem i32 %"int_part.3", 10
  %".76" = icmp eq i32 %".75", 0
  br i1 %".76", label %"sc_rhs", label %"sc_end"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"int_part.4" = load i32, i32* %"int_part"
  %".85" = icmp eq i32 %"int_part.4", 0
  br i1 %".85", label %"then.4", label %"else.4"
sc_rhs:
  %"precision.5" = load i32, i32* %"precision.addr"
  %".78" = icmp sgt i32 %"precision.5", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"then.2"], [%".78", %"sc_rhs"]
  br i1 %"sc_result", label %"then.3", label %"else.3"
then.3:
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  br label %"ifcont.2"
then.4:
  %".87" = trunc i32 48 to i8
  %"buffer.6" = load i8*, i8** %"buffer.addr"
  %"write_pos.6" = load i32, i32* %"write_pos"
  %".88" = getelementptr inbounds i8, i8* %"buffer.6", i32 %"write_pos.6"
  store i8 %".87", i8* %".88"
  %"write_pos.7" = load i32, i32* %"write_pos"
  %".90" = add i32 %"write_pos.7", 1
  store i32 %".90", i32* %"write_pos"
  br label %"ifcont.4"
else.4:
  store [32 x i8] zeroinitializer, [32 x i8]* %"int_temp"
  store i32 0, i32* %"temp_pos"
  %"int_part.5" = load i32, i32* %"int_part"
  store i32 %"int_part.5", i32* %"temp_int"
  br label %"while.cond.2"
ifcont.4:
  %"precision.6" = load i32, i32* %"precision.addr"
  %".122" = icmp sgt i32 %"precision.6", 0
  br i1 %".122", label %"then.5", label %"else.5"
while.cond.2:
  %"temp_int.1" = load i32, i32* %"temp_int"
  %".97" = icmp sgt i32 %"temp_int.1", 0
  br i1 %".97", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"temp_int.2" = load i32, i32* %"temp_int"
  %".99" = srem i32 %"temp_int.2", 10
  %".100" = add i32 %".99", 48
  %".101" = trunc i32 %".100" to i8
  %"temp_pos.1" = load i32, i32* %"temp_pos"
  %".102" = getelementptr inbounds [32 x i8], [32 x i8]* %"int_temp", i32 0, i32 %"temp_pos.1"
  store i8 %".101", i8* %".102"
  %"temp_int.3" = load i32, i32* %"temp_int"
  %".104" = sdiv i32 %"temp_int.3", 10
  store i32 %".104", i32* %"temp_int"
  %"temp_pos.2" = load i32, i32* %"temp_pos"
  %".106" = add i32 %"temp_pos.2", 1
  store i32 %".106", i32* %"temp_pos"
  br label %"while.cond.2"
while.end.2:
  %"temp_pos.3" = load i32, i32* %"temp_pos"
  %".109" = sub i32 %"temp_pos.3", 1
  store i32 %".109", i32* %"k"
  br label %"while.cond.3"
while.cond.3:
  %"k.1" = load i32, i32* %"k"
  %".112" = icmp sge i32 %"k.1", 0
  br i1 %".112", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"k.2" = load i32, i32* %"k"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"int_temp", i32 0, i32 %"k.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.7" = load i8*, i8** %"buffer.addr"
  %"write_pos.8" = load i32, i32* %"write_pos"
  %".114" = getelementptr inbounds i8, i8* %"buffer.7", i32 %"write_pos.8"
  store i8 %"array_load", i8* %".114"
  %"write_pos.9" = load i32, i32* %"write_pos"
  %".116" = add i32 %"write_pos.9", 1
  store i32 %".116", i32* %"write_pos"
  %"k.3" = load i32, i32* %"k"
  %".118" = sub i32 %"k.3", 1
  store i32 %".118", i32* %"k"
  br label %"while.cond.3"
while.end.3:
  br label %"ifcont.4"
then.5:
  %".124" = trunc i32 46 to i8
  %"buffer.8" = load i8*, i8** %"buffer.addr"
  %"write_pos.10" = load i32, i32* %"write_pos"
  %".125" = getelementptr inbounds i8, i8* %"buffer.8", i32 %"write_pos.10"
  store i8 %".124", i8* %".125"
  %"write_pos.11" = load i32, i32* %"write_pos"
  %".127" = add i32 %"write_pos.11", 1
  store i32 %".127", i32* %"write_pos"
  %"frac_part.2" = load i32, i32* %"frac_part"
  %".129" = icmp eq i32 %"frac_part.2", 0
  br i1 %".129", label %"then.6", label %"else.6"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %".189" = trunc i32 0 to i8
  %"buffer.12" = load i8*, i8** %"buffer.addr"
  %"write_pos.18" = load i32, i32* %"write_pos"
  %".190" = getelementptr inbounds i8, i8* %"buffer.12", i32 %"write_pos.18"
  store i8 %".189", i8* %".190"
  %"write_pos.19" = load i32, i32* %"write_pos"
  ret i32 %"write_pos.19"
then.6:
  store i32 0, i32* %"m"
  br label %"while.cond.4"
else.6:
  store [32 x i8] zeroinitializer, [32 x i8]* %"frac_temp"
  store i32 0, i32* %"frac_digits"
  %"frac_part.3" = load i32, i32* %"frac_part"
  store i32 %"frac_part.3", i32* %"temp_frac"
  br label %"while.cond.5"
ifcont.6:
  br label %"ifcont.5"
while.cond.4:
  %"m.1" = load i32, i32* %"m"
  %"precision.7" = load i32, i32* %"precision.addr"
  %".133" = icmp slt i32 %"m.1", %"precision.7"
  br i1 %".133", label %"while.body.4", label %"while.end.4"
while.body.4:
  %".135" = trunc i32 48 to i8
  %"buffer.9" = load i8*, i8** %"buffer.addr"
  %"write_pos.12" = load i32, i32* %"write_pos"
  %".136" = getelementptr inbounds i8, i8* %"buffer.9", i32 %"write_pos.12"
  store i8 %".135", i8* %".136"
  %"write_pos.13" = load i32, i32* %"write_pos"
  %".138" = add i32 %"write_pos.13", 1
  store i32 %".138", i32* %"write_pos"
  %"m.2" = load i32, i32* %"m"
  %".140" = add i32 %"m.2", 1
  store i32 %".140", i32* %"m"
  br label %"while.cond.4"
while.end.4:
  br label %"ifcont.6"
while.cond.5:
  %"temp_frac.1" = load i32, i32* %"temp_frac"
  %".148" = icmp sgt i32 %"temp_frac.1", 0
  br i1 %".148", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"temp_frac.2" = load i32, i32* %"temp_frac"
  %".150" = srem i32 %"temp_frac.2", 10
  %".151" = add i32 %".150", 48
  %".152" = trunc i32 %".151" to i8
  %"frac_digits.1" = load i32, i32* %"frac_digits"
  %".153" = getelementptr inbounds [32 x i8], [32 x i8]* %"frac_temp", i32 0, i32 %"frac_digits.1"
  store i8 %".152", i8* %".153"
  %"temp_frac.3" = load i32, i32* %"temp_frac"
  %".155" = sdiv i32 %"temp_frac.3", 10
  store i32 %".155", i32* %"temp_frac"
  %"frac_digits.2" = load i32, i32* %"frac_digits"
  %".157" = add i32 %"frac_digits.2", 1
  store i32 %".157", i32* %"frac_digits"
  br label %"while.cond.5"
while.end.5:
  %"precision.8" = load i32, i32* %"precision.addr"
  %"frac_digits.3" = load i32, i32* %"frac_digits"
  %".160" = sub i32 %"precision.8", %"frac_digits.3"
  store i32 %".160", i32* %"leading_zeros"
  store i32 0, i32* %"n"
  br label %"while.cond.6"
while.cond.6:
  %"n.1" = load i32, i32* %"n"
  %"leading_zeros.1" = load i32, i32* %"leading_zeros"
  %".164" = icmp slt i32 %"n.1", %"leading_zeros.1"
  br i1 %".164", label %"while.body.6", label %"while.end.6"
while.body.6:
  %".166" = trunc i32 48 to i8
  %"buffer.10" = load i8*, i8** %"buffer.addr"
  %"write_pos.14" = load i32, i32* %"write_pos"
  %".167" = getelementptr inbounds i8, i8* %"buffer.10", i32 %"write_pos.14"
  store i8 %".166", i8* %".167"
  %"write_pos.15" = load i32, i32* %"write_pos"
  %".169" = add i32 %"write_pos.15", 1
  store i32 %".169", i32* %"write_pos"
  %"n.2" = load i32, i32* %"n"
  %".171" = add i32 %"n.2", 1
  store i32 %".171", i32* %"n"
  br label %"while.cond.6"
while.end.6:
  %"frac_digits.4" = load i32, i32* %"frac_digits"
  %".174" = sub i32 %"frac_digits.4", 1
  store i32 %".174", i32* %"p"
  br label %"while.cond.7"
while.cond.7:
  %"p.1" = load i32, i32* %"p"
  %".177" = icmp sge i32 %"p.1", 0
  br i1 %".177", label %"while.body.7", label %"while.end.7"
while.body.7:
  %"p.2" = load i32, i32* %"p"
  %"array_gep.1" = getelementptr inbounds [32 x i8], [32 x i8]* %"frac_temp", i32 0, i32 %"p.2"
  %"array_load.1" = load i8, i8* %"array_gep.1"
  %"buffer.11" = load i8*, i8** %"buffer.addr"
  %"write_pos.16" = load i32, i32* %"write_pos"
  %".179" = getelementptr inbounds i8, i8* %"buffer.11", i32 %"write_pos.16"
  store i8 %"array_load.1", i8* %".179"
  %"write_pos.17" = load i32, i32* %"write_pos"
  %".181" = add i32 %"write_pos.17", 1
  store i32 %".181", i32* %"write_pos"
  %"p.3" = load i32, i32* %"p"
  %".183" = sub i32 %"p.3", 1
  store i32 %".183", i32* %"p"
  br label %"while.cond.7"
while.end.7:
  br label %"ifcont.6"
}

define i32 @"standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(double %"value", i8* %"buffer", i32 %"precision")
{
entry:
  %"value.addr" = alloca double
  store double %"value", double* %"value.addr"
  %"buffer.addr" = alloca i8*
  store i8* %"buffer", i8** %"buffer.addr"
  %"precision.addr" = alloca i32
  store i32 %"precision", i32* %"precision.addr"
  %"write_pos" = alloca i32
  store i32 0, i32* %"write_pos"
  %"value.1" = load double, double* %"value.addr"
  %".9" = fpext float              0x0 to double
  %".10" = fcmp olt double %"value.1", %".9"
  %"i" = alloca i32
  %"int_part" = alloca i64
  %"fractional" = alloca double
  %"frac_multiplier" = alloca i64
  %"j" = alloca i32
  %"scaled_frac" = alloca double
  %"frac_part" = alloca i64
  %"int_temp" = alloca [32 x i8]
  %"temp_pos" = alloca i32
  %"temp_int" = alloca i64
  %"k" = alloca i32
  %"m" = alloca i32
  %"frac_temp" = alloca [32 x i8]
  %"frac_digits" = alloca i32
  %"temp_frac" = alloca i64
  %"leading_zeros" = alloca i32
  %"n" = alloca i32
  %"p" = alloca i32
  br i1 %".10", label %"then", label %"else"
then:
  %"buffer.1" = load i8*, i8** %"buffer.addr"
  %".12" = getelementptr inbounds i8, i8* %"buffer.1", i32 0
  store i8 69, i8* %".12"
  store i32 1, i32* %"write_pos"
  %"value.2" = load double, double* %"value.addr"
  %".15" = fsub double              0x0, %"value.2"
  store double %".15", double* %"value.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"value.3" = load double, double* %"value.addr"
  %".19" = fpext float              0x0 to double
  %".20" = fcmp oeq double %"value.3", %".19"
  br i1 %".20", label %"then.1", label %"else.1"
then.1:
  %".22" = trunc i32 48 to i8
  %"buffer.2" = load i8*, i8** %"buffer.addr"
  %"write_pos.1" = load i32, i32* %"write_pos"
  %".23" = getelementptr inbounds i8, i8* %"buffer.2", i32 %"write_pos.1"
  store i8 %".22", i8* %".23"
  %".25" = trunc i32 46 to i8
  %"buffer.3" = load i8*, i8** %"buffer.addr"
  %"write_pos.2" = load i32, i32* %"write_pos"
  %".26" = add i32 %"write_pos.2", 1
  %".27" = getelementptr inbounds i8, i8* %"buffer.3", i32 %".26"
  store i8 %".25", i8* %".27"
  store i32 0, i32* %"i"
  br label %"while.cond"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"value.4" = load double, double* %"value.addr"
  %".50" = fptosi double %"value.4" to i64
  store i64 %".50", i64* %"int_part"
  %"value.5" = load double, double* %"value.addr"
  %"int_part.1" = load i64, i64* %"int_part"
  %".52" = sitofp i64 %"int_part.1" to double
  %".53" = fsub double %"value.5", %".52"
  store double %".53", double* %"fractional"
  %".55" = sext i32 1 to i64
  store i64 %".55", i64* %"frac_multiplier"
  store i32 0, i32* %"j"
  br label %"while.cond.1"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"precision.1" = load i32, i32* %"precision.addr"
  %".31" = icmp slt i32 %"i.1", %"precision.1"
  br i1 %".31", label %"while.body", label %"while.end"
while.body:
  %".33" = trunc i32 48 to i8
  %"buffer.4" = load i8*, i8** %"buffer.addr"
  %"write_pos.3" = load i32, i32* %"write_pos"
  %".34" = add i32 %"write_pos.3", 2
  %"i.2" = load i32, i32* %"i"
  %".35" = add i32 %".34", %"i.2"
  %".36" = getelementptr inbounds i8, i8* %"buffer.4", i32 %".35"
  store i8 %".33", i8* %".36"
  %"i.3" = load i32, i32* %"i"
  %".38" = add i32 %"i.3", 1
  store i32 %".38", i32* %"i"
  br label %"while.cond"
while.end:
  %".41" = trunc i32 0 to i8
  %"buffer.5" = load i8*, i8** %"buffer.addr"
  %"write_pos.4" = load i32, i32* %"write_pos"
  %".42" = add i32 %"write_pos.4", 2
  %"precision.2" = load i32, i32* %"precision.addr"
  %".43" = add i32 %".42", %"precision.2"
  %".44" = getelementptr inbounds i8, i8* %"buffer.5", i32 %".43"
  store i8 %".41", i8* %".44"
  %"write_pos.5" = load i32, i32* %"write_pos"
  %".46" = add i32 %"write_pos.5", 1
  %"precision.3" = load i32, i32* %"precision.addr"
  %".47" = add i32 %".46", %"precision.3"
  ret i32 %".47"
while.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"precision.4" = load i32, i32* %"precision.addr"
  %".59" = icmp slt i32 %"j.1", %"precision.4"
  br i1 %".59", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"frac_multiplier.1" = load i64, i64* %"frac_multiplier"
  %".61" = sext i32 10 to i64
  %".62" = mul i64 %"frac_multiplier.1", %".61"
  store i64 %".62", i64* %"frac_multiplier"
  %"j.2" = load i32, i32* %"j"
  %".64" = add i32 %"j.2", 1
  store i32 %".64", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  %"fractional.1" = load double, double* %"fractional"
  %"frac_multiplier.2" = load i64, i64* %"frac_multiplier"
  %".67" = sitofp i64 %"frac_multiplier.2" to double
  %".68" = fmul double %"fractional.1", %".67"
  store double %".68", double* %"scaled_frac"
  %"scaled_frac.1" = load double, double* %"scaled_frac"
  %".70" = fpext float 0x3fe0000000000000 to double
  %".71" = fadd double %"scaled_frac.1", %".70"
  %".72" = fptosi double %".71" to i64
  store i64 %".72", i64* %"frac_part"
  %"frac_part.1" = load i64, i64* %"frac_part"
  %"frac_multiplier.3" = load i64, i64* %"frac_multiplier"
  %".74" = icmp sge i64 %"frac_part.1", %"frac_multiplier.3"
  br i1 %".74", label %"then.2", label %"else.2"
then.2:
  %"int_part.2" = load i64, i64* %"int_part"
  %".76" = sext i32 1 to i64
  %".77" = add i64 %"int_part.2", %".76"
  store i64 %".77", i64* %"int_part"
  %".79" = sext i32 0 to i64
  store i64 %".79", i64* %"frac_part"
  %"int_part.3" = load i64, i64* %"int_part"
  %".81" = sext i32 10 to i64
  %".82" = srem i64 %"int_part.3", %".81"
  %".83" = sext i32 0 to i64
  %".84" = icmp eq i64 %".82", %".83"
  br i1 %".84", label %"sc_rhs", label %"sc_end"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"int_part.4" = load i64, i64* %"int_part"
  %".93" = sext i32 0 to i64
  %".94" = icmp eq i64 %"int_part.4", %".93"
  br i1 %".94", label %"then.4", label %"else.4"
sc_rhs:
  %"precision.5" = load i32, i32* %"precision.addr"
  %".86" = icmp sgt i32 %"precision.5", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"then.2"], [%".86", %"sc_rhs"]
  br i1 %"sc_result", label %"then.3", label %"else.3"
then.3:
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  br label %"ifcont.2"
then.4:
  %".96" = trunc i32 48 to i8
  %"buffer.6" = load i8*, i8** %"buffer.addr"
  %"write_pos.6" = load i32, i32* %"write_pos"
  %".97" = getelementptr inbounds i8, i8* %"buffer.6", i32 %"write_pos.6"
  store i8 %".96", i8* %".97"
  %"write_pos.7" = load i32, i32* %"write_pos"
  %".99" = add i32 %"write_pos.7", 1
  store i32 %".99", i32* %"write_pos"
  br label %"ifcont.4"
else.4:
  store [32 x i8] zeroinitializer, [32 x i8]* %"int_temp"
  store i32 0, i32* %"temp_pos"
  %"int_part.5" = load i64, i64* %"int_part"
  store i64 %"int_part.5", i64* %"temp_int"
  br label %"while.cond.2"
ifcont.4:
  %"precision.6" = load i32, i32* %"precision.addr"
  %".135" = icmp sgt i32 %"precision.6", 0
  br i1 %".135", label %"then.5", label %"else.5"
while.cond.2:
  %"temp_int.1" = load i64, i64* %"temp_int"
  %".106" = sext i32 0 to i64
  %".107" = icmp sgt i64 %"temp_int.1", %".106"
  br i1 %".107", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"temp_int.2" = load i64, i64* %"temp_int"
  %".109" = sext i32 10 to i64
  %".110" = srem i64 %"temp_int.2", %".109"
  %".111" = sext i32 48 to i64
  %".112" = add i64 %".110", %".111"
  %".113" = trunc i64 %".112" to i8
  %"temp_pos.1" = load i32, i32* %"temp_pos"
  %".114" = getelementptr inbounds [32 x i8], [32 x i8]* %"int_temp", i32 0, i32 %"temp_pos.1"
  store i8 %".113", i8* %".114"
  %"temp_int.3" = load i64, i64* %"temp_int"
  %".116" = sext i32 10 to i64
  %".117" = sdiv i64 %"temp_int.3", %".116"
  store i64 %".117", i64* %"temp_int"
  %"temp_pos.2" = load i32, i32* %"temp_pos"
  %".119" = add i32 %"temp_pos.2", 1
  store i32 %".119", i32* %"temp_pos"
  br label %"while.cond.2"
while.end.2:
  %"temp_pos.3" = load i32, i32* %"temp_pos"
  %".122" = sub i32 %"temp_pos.3", 1
  store i32 %".122", i32* %"k"
  br label %"while.cond.3"
while.cond.3:
  %"k.1" = load i32, i32* %"k"
  %".125" = icmp sge i32 %"k.1", 0
  br i1 %".125", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"k.2" = load i32, i32* %"k"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"int_temp", i32 0, i32 %"k.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buffer.7" = load i8*, i8** %"buffer.addr"
  %"write_pos.8" = load i32, i32* %"write_pos"
  %".127" = getelementptr inbounds i8, i8* %"buffer.7", i32 %"write_pos.8"
  store i8 %"array_load", i8* %".127"
  %"write_pos.9" = load i32, i32* %"write_pos"
  %".129" = add i32 %"write_pos.9", 1
  store i32 %".129", i32* %"write_pos"
  %"k.3" = load i32, i32* %"k"
  %".131" = sub i32 %"k.3", 1
  store i32 %".131", i32* %"k"
  br label %"while.cond.3"
while.end.3:
  br label %"ifcont.4"
then.5:
  %".137" = trunc i32 46 to i8
  %"buffer.8" = load i8*, i8** %"buffer.addr"
  %"write_pos.10" = load i32, i32* %"write_pos"
  %".138" = getelementptr inbounds i8, i8* %"buffer.8", i32 %"write_pos.10"
  store i8 %".137", i8* %".138"
  %"write_pos.11" = load i32, i32* %"write_pos"
  %".140" = add i32 %"write_pos.11", 1
  store i32 %".140", i32* %"write_pos"
  %"frac_part.2" = load i64, i64* %"frac_part"
  %".142" = sext i32 0 to i64
  %".143" = icmp eq i64 %"frac_part.2", %".142"
  br i1 %".143", label %"then.6", label %"else.6"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %".207" = trunc i32 0 to i8
  %"buffer.12" = load i8*, i8** %"buffer.addr"
  %"write_pos.18" = load i32, i32* %"write_pos"
  %".208" = getelementptr inbounds i8, i8* %"buffer.12", i32 %"write_pos.18"
  store i8 %".207", i8* %".208"
  %"write_pos.19" = load i32, i32* %"write_pos"
  ret i32 %"write_pos.19"
then.6:
  store i32 0, i32* %"m"
  br label %"while.cond.4"
else.6:
  store [32 x i8] zeroinitializer, [32 x i8]* %"frac_temp"
  store i32 0, i32* %"frac_digits"
  %"frac_part.3" = load i64, i64* %"frac_part"
  store i64 %"frac_part.3", i64* %"temp_frac"
  br label %"while.cond.5"
ifcont.6:
  br label %"ifcont.5"
while.cond.4:
  %"m.1" = load i32, i32* %"m"
  %"precision.7" = load i32, i32* %"precision.addr"
  %".147" = icmp slt i32 %"m.1", %"precision.7"
  br i1 %".147", label %"while.body.4", label %"while.end.4"
while.body.4:
  %".149" = trunc i32 48 to i8
  %"buffer.9" = load i8*, i8** %"buffer.addr"
  %"write_pos.12" = load i32, i32* %"write_pos"
  %".150" = getelementptr inbounds i8, i8* %"buffer.9", i32 %"write_pos.12"
  store i8 %".149", i8* %".150"
  %"write_pos.13" = load i32, i32* %"write_pos"
  %".152" = add i32 %"write_pos.13", 1
  store i32 %".152", i32* %"write_pos"
  %"m.2" = load i32, i32* %"m"
  %".154" = add i32 %"m.2", 1
  store i32 %".154", i32* %"m"
  br label %"while.cond.4"
while.end.4:
  br label %"ifcont.6"
while.cond.5:
  %"temp_frac.1" = load i64, i64* %"temp_frac"
  %".162" = sext i32 0 to i64
  %".163" = icmp sgt i64 %"temp_frac.1", %".162"
  br i1 %".163", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"temp_frac.2" = load i64, i64* %"temp_frac"
  %".165" = sext i32 10 to i64
  %".166" = srem i64 %"temp_frac.2", %".165"
  %".167" = sext i32 48 to i64
  %".168" = add i64 %".166", %".167"
  %".169" = trunc i64 %".168" to i8
  %"frac_digits.1" = load i32, i32* %"frac_digits"
  %".170" = getelementptr inbounds [32 x i8], [32 x i8]* %"frac_temp", i32 0, i32 %"frac_digits.1"
  store i8 %".169", i8* %".170"
  %"temp_frac.3" = load i64, i64* %"temp_frac"
  %".172" = sext i32 10 to i64
  %".173" = sdiv i64 %"temp_frac.3", %".172"
  store i64 %".173", i64* %"temp_frac"
  %"frac_digits.2" = load i32, i32* %"frac_digits"
  %".175" = add i32 %"frac_digits.2", 1
  store i32 %".175", i32* %"frac_digits"
  br label %"while.cond.5"
while.end.5:
  %"precision.8" = load i32, i32* %"precision.addr"
  %"frac_digits.3" = load i32, i32* %"frac_digits"
  %".178" = sub i32 %"precision.8", %"frac_digits.3"
  store i32 %".178", i32* %"leading_zeros"
  store i32 0, i32* %"n"
  br label %"while.cond.6"
while.cond.6:
  %"n.1" = load i32, i32* %"n"
  %"leading_zeros.1" = load i32, i32* %"leading_zeros"
  %".182" = icmp slt i32 %"n.1", %"leading_zeros.1"
  br i1 %".182", label %"while.body.6", label %"while.end.6"
while.body.6:
  %".184" = trunc i32 48 to i8
  %"buffer.10" = load i8*, i8** %"buffer.addr"
  %"write_pos.14" = load i32, i32* %"write_pos"
  %".185" = getelementptr inbounds i8, i8* %"buffer.10", i32 %"write_pos.14"
  store i8 %".184", i8* %".185"
  %"write_pos.15" = load i32, i32* %"write_pos"
  %".187" = add i32 %"write_pos.15", 1
  store i32 %".187", i32* %"write_pos"
  %"n.2" = load i32, i32* %"n"
  %".189" = add i32 %"n.2", 1
  store i32 %".189", i32* %"n"
  br label %"while.cond.6"
while.end.6:
  %"frac_digits.4" = load i32, i32* %"frac_digits"
  %".192" = sub i32 %"frac_digits.4", 1
  store i32 %".192", i32* %"p"
  br label %"while.cond.7"
while.cond.7:
  %"p.1" = load i32, i32* %"p"
  %".195" = icmp sge i32 %"p.1", 0
  br i1 %".195", label %"while.body.7", label %"while.end.7"
while.body.7:
  %"p.2" = load i32, i32* %"p"
  %"array_gep.1" = getelementptr inbounds [32 x i8], [32 x i8]* %"frac_temp", i32 0, i32 %"p.2"
  %"array_load.1" = load i8, i8* %"array_gep.1"
  %"buffer.11" = load i8*, i8** %"buffer.addr"
  %"write_pos.16" = load i32, i32* %"write_pos"
  %".197" = getelementptr inbounds i8, i8* %"buffer.11", i32 %"write_pos.16"
  store i8 %"array_load.1", i8* %".197"
  %"write_pos.17" = load i32, i32* %"write_pos"
  %".199" = add i32 %"write_pos.17", 1
  store i32 %".199", i32* %"write_pos"
  %"p.3" = load i32, i32* %"p"
  %".201" = sub i32 %"p.3", 1
  store i32 %".201", i32* %"p"
  br label %"while.cond.7"
while.end.7:
  br label %"ifcont.6"
}

define i32 @"standard__strings__count_lines__1__byteE1_ptr1__ret_intE1"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"count" = alloca i32
  store i32 0, i32* %"count"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".7" = zext i8 %"ptr_load" to i32
  %".8" = icmp ne i32 %".7", 0
  br i1 %".8", label %"for.body", label %"for.end"
for.body:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".10" = icmp eq i8 %"ptr_load.1", 10
  br i1 %".10", label %"then", label %"else"
for.update:
  %"i.3" = load i32, i32* %"i"
  %".17" = add i32 %"i.3", 1
  store i32 %".17", i32* %"i"
  br label %"for.cond"
for.end:
  %"count.2" = load i32, i32* %"count"
  %".20" = icmp sgt i32 %"count.2", 0
  br i1 %".20", label %"sc_end", label %"sc_rhs"
then:
  %"count.1" = load i32, i32* %"count"
  %".12" = add i32 %"count.1", 1
  store i32 %".12", i32* %"count"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update"
sc_rhs:
  %"str.3" = load i8*, i8** %"str.addr"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 0
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".22" = zext i8 %"ptr_load.2" to i32
  %".23" = icmp ne i32 %".22", 0
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"for.end"], [%".23", %"sc_rhs"]
  br i1 %"sc_result", label %"then.1", label %"else.1"
then.1:
  %"count.3" = load i32, i32* %"count"
  %".26" = add i32 %"count.3", 1
  store i32 %".26", i32* %"count"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"count.4" = load i32, i32* %"count"
  ret i32 %"count.4"
}

define i8* @"standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1"(i8* %"str", i32 %"line_num")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"line_num.addr" = alloca i32
  store i32 %"line_num", i32* %"line_num.addr"
  %"current_line" = alloca i32
  store i32 0, i32* %"current_line"
  %"line_start" = alloca i32
  store i32 0, i32* %"line_start"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"line_end" = alloca i32
  %"line_len" = alloca i32
  br label %"for.cond"
for.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".10" = zext i8 %"ptr_load" to i32
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %"for.body", label %"for.end"
for.body:
  %"current_line.1" = load i32, i32* %"current_line"
  %"line_num.1" = load i32, i32* %"line_num.addr"
  %".13" = icmp eq i32 %"current_line.1", %"line_num.1"
  br i1 %".13", label %"then", label %"else"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".25" = add i32 %"i.4", 1
  store i32 %".25", i32* %"i"
  br label %"for.cond"
for.end:
  %"current_line.3" = load i32, i32* %"current_line"
  %"line_num.2" = load i32, i32* %"line_num.addr"
  %".28" = icmp ne i32 %"current_line.3", %"line_num.2"
  br i1 %".28", label %"then.2", label %"else.2"
then:
  %"i.2" = load i32, i32* %"i"
  store i32 %"i.2", i32* %"line_start"
  br label %"for.end"
else:
  br label %"ifcont"
ifcont:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.3"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".18" = icmp eq i8 %"ptr_load.1", 10
  br i1 %".18", label %"then.1", label %"else.1"
then.1:
  %"current_line.2" = load i32, i32* %"current_line"
  %".20" = add i32 %"current_line.2", 1
  store i32 %".20", i32* %"current_line"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update"
then.2:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"line_start.1" = load i32, i32* %"line_start"
  store i32 %"line_start.1", i32* %"line_end"
  br label %"while.cond"
while.cond:
  %"str.3" = load i8*, i8** %"str.addr"
  %"line_end.1" = load i32, i32* %"line_end"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"str.3", i32 %"line_end.1"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".34" = zext i8 %"ptr_load.2" to i32
  %".35" = icmp ne i32 %".34", 0
  br i1 %".35", label %"sc_rhs", label %"sc_end"
while.body:
  %"line_end.3" = load i32, i32* %"line_end"
  %".40" = add i32 %"line_end.3", 1
  store i32 %".40", i32* %"line_end"
  br label %"while.cond"
while.end:
  %"line_end.4" = load i32, i32* %"line_end"
  %"line_start.2" = load i32, i32* %"line_start"
  %".43" = sub i32 %"line_end.4", %"line_start.2"
  store i32 %".43", i32* %"line_len"
  %"str.5" = load i8*, i8** %"str.addr"
  %"line_start.3" = load i32, i32* %"line_start"
  %"line_len.1" = load i32, i32* %"line_len"
  %".45" = call i8* @"standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1"(i8* %"str.5", i32 %"line_start.3", i32 %"line_len.1")
  ret i8* %".45"
sc_rhs:
  %"str.4" = load i8*, i8** %"str.addr"
  %"line_end.2" = load i32, i32* %"line_end"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"line_end.2"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".37" = icmp ne i8 %"ptr_load.3", 10
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".37", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
}

define i32 @"standard__strings__count_words__1__byteE1_ptr1__ret_intE1"(i8* %"str")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"count" = alloca i32
  store i32 0, i32* %"count"
  %"in_word" = alloca i1
  store i1 false, i1* %"in_word"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"str.1" = load i8*, i8** %"str.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".8" = zext i8 %"ptr_load" to i32
  %".9" = icmp ne i32 %".8", 0
  br i1 %".9", label %"for.body", label %"for.end"
for.body:
  %"str.2" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"str.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".11" = call i1 @"standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1"(i8 %"ptr_load.1")
  br i1 %".11", label %"then", label %"else"
for.update:
  %"i.3" = load i32, i32* %"i"
  %".23" = add i32 %"i.3", 1
  store i32 %".23", i32* %"i"
  br label %"for.cond"
for.end:
  %"count.2" = load i32, i32* %"count"
  ret i32 %"count.2"
then:
  store i1 false, i1* %"in_word"
  br label %"ifcont"
else:
  %"in_word.1" = load i1, i1* %"in_word"
  %".15" = xor i1 %"in_word.1", -1
  br i1 %".15", label %"elif_then_0", label %"elif_else_0"
ifcont:
  br label %"for.update"
elif_then_0:
  store i1 true, i1* %"in_word"
  %"count.1" = load i32, i32* %"count"
  %".18" = add i32 %"count.1", 1
  store i32 %".18", i32* %"count"
  br label %"ifcont"
elif_else_0:
  br label %"ifcont"
}

define i8* @"standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1"(i8* %"str", i8* %"find", i8* %"replace")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"find.addr" = alloca i8*
  store i8* %"find", i8** %"find.addr"
  %"replace.addr" = alloca i8*
  store i8* %"replace", i8** %"replace.addr"
  %"pos" = alloca i32
  %"str.1" = load i8*, i8** %"str.addr"
  %"find.1" = load i8*, i8** %"find.addr"
  %".8" = call i32 @"standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1"(i8* %"str.1", i8* %"find.1", i32 0)
  store i32 %".8", i32* %"pos"
  %"pos.1" = load i32, i32* %"pos"
  %".10" = sub i32 0, 1
  %".11" = icmp eq i32 %"pos.1", %".10"
  %"str_len" = alloca i32
  %"find_len" = alloca i32
  %"replace_len" = alloca i32
  %"new_len" = alloca i32
  %"result" = alloca i8*
  %"i" = alloca i32
  %"i.5" = alloca i32
  %"i.10" = alloca i32
  br i1 %".11", label %"then", label %"else"
then:
  %"str.2" = load i8*, i8** %"str.addr"
  %".13" = call i8* @"standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1"(i8* %"str.2")
  ret i8* %".13"
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* %"str_len"
  br label %"while.cond"
while.cond:
  %"str.3" = load i8*, i8** %"str.addr"
  %"str_len.1" = load i32, i32* %"str_len"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.3", i32 %"str_len.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".18" = zext i8 %"ptr_load" to i32
  %".19" = icmp ne i32 %".18", 0
  br i1 %".19", label %"while.body", label %"while.end"
while.body:
  %"str_len.2" = load i32, i32* %"str_len"
  %".21" = add i32 %"str_len.2", 1
  store i32 %".21", i32* %"str_len"
  br label %"while.cond"
while.end:
  store i32 0, i32* %"find_len"
  br label %"while.cond.1"
while.cond.1:
  %"find.2" = load i8*, i8** %"find.addr"
  %"find_len.1" = load i32, i32* %"find_len"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"find.2", i32 %"find_len.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".26" = zext i8 %"ptr_load.1" to i32
  %".27" = icmp ne i32 %".26", 0
  br i1 %".27", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"find_len.2" = load i32, i32* %"find_len"
  %".29" = add i32 %"find_len.2", 1
  store i32 %".29", i32* %"find_len"
  br label %"while.cond.1"
while.end.1:
  store i32 0, i32* %"replace_len"
  br label %"while.cond.2"
while.cond.2:
  %"replace.1" = load i8*, i8** %"replace.addr"
  %"replace_len.1" = load i32, i32* %"replace_len"
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"replace.1", i32 %"replace_len.1"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".34" = zext i8 %"ptr_load.2" to i32
  %".35" = icmp ne i32 %".34", 0
  br i1 %".35", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"replace_len.2" = load i32, i32* %"replace_len"
  %".37" = add i32 %"replace_len.2", 1
  store i32 %".37", i32* %"replace_len"
  br label %"while.cond.2"
while.end.2:
  %"str_len.3" = load i32, i32* %"str_len"
  %"find_len.3" = load i32, i32* %"find_len"
  %".40" = sub i32 %"str_len.3", %"find_len.3"
  %"replace_len.3" = load i32, i32* %"replace_len"
  %".41" = add i32 %".40", %"replace_len.3"
  store i32 %".41", i32* %"new_len"
  %"new_len.1" = load i32, i32* %"new_len"
  %".43" = zext i32 %"new_len.1" to i64
  %".44" = zext i32 1 to i64
  %".45" = add i64 %".43", %".44"
  %".46" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".45")
  %"int_to_ptr" = inttoptr i64 %".46" to i8*
  store i8* %"int_to_ptr", i8** %"result"
  %"result.1" = load i8*, i8** %"result"
  %".48" = ptrtoint i8* %"result.1" to i64
  %".49" = ptrtoint i8* null to i64
  %".50" = icmp eq i64 %".48", %".49"
  br i1 %".50", label %"then.1", label %"else.1"
then.1:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"pos.2" = load i32, i32* %"pos"
  %".56" = icmp slt i32 %"i.1", %"pos.2"
  br i1 %".56", label %"for.body", label %"for.end"
for.body:
  %"str.4" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"str.4", i32 %"i.2"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %"result.2" = load i8*, i8** %"result"
  %"i.3" = load i32, i32* %"i"
  %".58" = getelementptr inbounds i8, i8* %"result.2", i32 %"i.3"
  store i8 %"ptr_load.3", i8* %".58"
  br label %"for.update"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".61" = add i32 %"i.4", 1
  store i32 %".61", i32* %"i"
  br label %"for.cond"
for.end:
  store i32 0, i32* %"i.5"
  br label %"for.cond.1"
for.cond.1:
  %"i.6" = load i32, i32* %"i.5"
  %"replace_len.4" = load i32, i32* %"replace_len"
  %".66" = icmp slt i32 %"i.6", %"replace_len.4"
  br i1 %".66", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"replace.2" = load i8*, i8** %"replace.addr"
  %"i.7" = load i32, i32* %"i.5"
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"replace.2", i32 %"i.7"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %"result.3" = load i8*, i8** %"result"
  %"pos.3" = load i32, i32* %"pos"
  %"i.8" = load i32, i32* %"i.5"
  %".68" = add i32 %"pos.3", %"i.8"
  %".69" = getelementptr inbounds i8, i8* %"result.3", i32 %".68"
  store i8 %"ptr_load.4", i8* %".69"
  br label %"for.update.1"
for.update.1:
  %"i.9" = load i32, i32* %"i.5"
  %".72" = add i32 %"i.9", 1
  store i32 %".72", i32* %"i.5"
  br label %"for.cond.1"
for.end.1:
  %"pos.4" = load i32, i32* %"pos"
  %"find_len.4" = load i32, i32* %"find_len"
  %".75" = add i32 %"pos.4", %"find_len.4"
  store i32 %".75", i32* %"i.10"
  br label %"for.cond.2"
for.cond.2:
  %"i.11" = load i32, i32* %"i.10"
  %"str_len.4" = load i32, i32* %"str_len"
  %".78" = icmp sle i32 %"i.11", %"str_len.4"
  br i1 %".78", label %"for.body.2", label %"for.end.2"
for.body.2:
  %"str.5" = load i8*, i8** %"str.addr"
  %"i.12" = load i32, i32* %"i.10"
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"str.5", i32 %"i.12"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %"result.4" = load i8*, i8** %"result"
  %"i.13" = load i32, i32* %"i.10"
  %"find_len.5" = load i32, i32* %"find_len"
  %".80" = sub i32 %"i.13", %"find_len.5"
  %"replace_len.5" = load i32, i32* %"replace_len"
  %".81" = add i32 %".80", %"replace_len.5"
  %".82" = getelementptr inbounds i8, i8* %"result.4", i32 %".81"
  store i8 %"ptr_load.5", i8* %".82"
  br label %"for.update.2"
for.update.2:
  %"i.14" = load i32, i32* %"i.10"
  %".85" = add i32 %"i.14", 1
  store i32 %".85", i32* %"i.10"
  br label %"for.cond.2"
for.end.2:
  %"result.5" = load i8*, i8** %"result"
  ret i8* %"result.5"
}

define i32 @"standard__strings__fstr_append__3__dataE1_sbits16__byteE1_ptr1__intE1_ptr1__ret_intE1"(i16 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i16
  store i16 %"value", i16* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [8 x i8]
  store [8 x i8] zeroinitializer, [8 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i16, i16* %"value.addr"
  %".9" = getelementptr inbounds [8 x i8], [8 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i16 @"standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16"(i16 %"value.1", i8* %".9")
  %".11" = sext i16 %".10" to i32
  store i32 %".11", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".15" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".15", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [8 x i8], [8 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".17" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".17"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".19" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".19", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".21" = add i32 %"i.3", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__dataE1_sbits32__byteE1_ptr1__intE1_ptr1__ret_intE1"(i32 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i32
  store i32 %"value", i32* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i32, i32* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"value.1", i8* %".9")
  store i32 %".10", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".14" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".14", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".16" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".16"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".18" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".18", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".20" = add i32 %"i.3", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__dataE1_sbits64__byteE1_ptr1__intE1_ptr1__ret_intE1"(i64 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i64
  store i64 %"value", i64* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i64, i64* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"value.1", i8* %".9")
  %".11" = trunc i64 %".10" to i32
  store i32 %".11", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".15" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".15", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".17" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".17"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".19" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".19", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".21" = add i32 %"i.3", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__dataE1_ubits16__byteE1_ptr1__intE1_ptr1__ret_intE1"(i16 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i16
  store i16 %"value", i16* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [8 x i8]
  store [8 x i8] zeroinitializer, [8 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i16, i16* %"value.addr"
  %".9" = getelementptr inbounds [8 x i8], [8 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i16 @"standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16"(i16 %"value.1", i8* %".9")
  %".11" = sext i16 %".10" to i32
  store i32 %".11", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".15" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".15", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [8 x i8], [8 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".17" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".17"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".19" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".19", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".21" = add i32 %"i.3", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__dataE1_ubits32__byteE1_ptr1__intE1_ptr1__ret_intE1"(i32 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i32
  store i32 %"value", i32* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i32, i32* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i32 @"standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32"(i32 %"value.1", i8* %".9")
  store i32 %".10", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".14" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".14", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".16" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".16"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".18" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".18", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".20" = add i32 %"i.3", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__dataE1_ubits64__byteE1_ptr1__intE1_ptr1__ret_intE1"(i64 %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i64
  store i64 %"value", i64* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load i64, i64* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i64 @"standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64"(i64 %"value.1", i8* %".9")
  %".11" = trunc i64 %".10" to i32
  store i32 %".11", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".15" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".15", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".17" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".17"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".19" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".19", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".21" = add i32 %"i.3", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__floatE1__byteE1_ptr1__intE1_ptr1__ret_intE1"(float %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca float
  store float %"value", float* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load float, float* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i32 @"standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(float %"value.1", i8* %".9", i32 6)
  store i32 %".10", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".14" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".14", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".16" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".16"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".18" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".18", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".20" = add i32 %"i.3", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__doubleE1__byteE1_ptr1__intE1_ptr1__ret_intE1"(double %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca double
  store double %"value", double* %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"tmp" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"tmp"
  %"n" = alloca i32
  %"value.1" = load double, double* %"value.addr"
  %".9" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 0
  %".10" = call i32 @"standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(double %"value.1", i8* %".9", i32 14)
  store i32 %".10", i32* %"n"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".14" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".14", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [32 x i8], [32 x i8]* %"tmp", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".16" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"array_load", i8* %".16"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".18" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".18", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".20" = add i32 %"i.3", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  %"n.2" = load i32, i32* %"n"
  ret i32 %"n.2"
}

define i32 @"standard__strings__fstr_append__3__byteE1_ptr1__byteE1_ptr1__intE1_ptr1__ret_intE1"(i8* %"value", i8* %"buf", i32* %"pos")
{
entry:
  %"value.addr" = alloca i8*
  store i8* %"value", i8** %"value.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"pos.addr" = alloca i32*
  store i32* %"pos", i32** %"pos.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"value.1" = load i8*, i8** %"value.addr"
  %"i.1" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"value.1", i32 %"i.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".10" = zext i8 %"ptr_load" to i32
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %"while.body", label %"while.end"
while.body:
  %"value.2" = load i8*, i8** %"value.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"value.2", i32 %"i.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"buf.1" = load i8*, i8** %"buf.addr"
  %"pos.1" = load i32*, i32** %"pos.addr"
  %"deref" = load i32, i32* %"pos.1"
  %".13" = getelementptr inbounds i8, i8* %"buf.1", i32 %"deref"
  store i8 %"ptr_load.1", i8* %".13"
  %"pos.2" = load i32*, i32** %"pos.addr"
  %"deref.1" = load i32, i32* %"pos.2"
  %".15" = add i32 %"deref.1", 1
  %"pos.3" = load i32*, i32** %"pos.addr"
  store i32 %".15", i32* %"pos.3"
  %"i.3" = load i32, i32* %"i"
  %".17" = add i32 %"i.3", 1
  store i32 %".17", i32* %"i"
  br label %"while.cond"
while.end:
  %"i.4" = load i32, i32* %"i"
  ret i32 %"i.4"
}

define i32 @"find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1"(i8* %"str", i8* %"substr")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"substr.addr" = alloca i8*
  store i8* %"substr", i8** %"substr.addr"
  %"str.1" = load i8*, i8** %"str.addr"
  %".6" = ptrtoint i8* %"str.1" to i64
  %".7" = ptrtoint i8* null to i64
  %".8" = icmp eq i64 %".6", %".7"
  %"str_len" = alloca i32
  %"sub_len" = alloca i32
  %"found" = alloca i1
  %"i" = alloca i32
  %"j" = alloca i32
  br i1 %".8", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"substr.1" = load i8*, i8** %"substr.addr"
  %".10" = ptrtoint i8* %"substr.1" to i64
  %".11" = ptrtoint i8* null to i64
  %".12" = icmp eq i64 %".10", %".11"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".12", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  %".15" = sub i32 0, 1
  ret i32 %".15"
else:
  br label %"ifcont"
ifcont:
  %"str.2" = load i8*, i8** %"str.addr"
  %".18" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"str.2")
  store i32 %".18", i32* %"str_len"
  %"substr.2" = load i8*, i8** %"substr.addr"
  %".20" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"substr.2")
  store i32 %".20", i32* %"sub_len"
  %"sub_len.1" = load i32, i32* %"sub_len"
  %".22" = icmp eq i32 %"sub_len.1", 0
  br i1 %".22", label %"then.1", label %"else.1"
then.1:
  %"str_len.1" = load i32, i32* %"str_len"
  ret i32 %"str_len.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"sub_len.2" = load i32, i32* %"sub_len"
  %"str_len.2" = load i32, i32* %"str_len"
  %".26" = icmp sgt i32 %"sub_len.2", %"str_len.2"
  br i1 %".26", label %"then.2", label %"else.2"
then.2:
  %".28" = sub i32 0, 1
  ret i32 %".28"
else.2:
  br label %"ifcont.2"
ifcont.2:
  store i1 true, i1* %"found"
  %"str_len.3" = load i32, i32* %"str_len"
  %"sub_len.3" = load i32, i32* %"sub_len"
  %".32" = sub i32 %"str_len.3", %"sub_len.3"
  store i32 %".32", i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".35" = icmp sge i32 %"i.1", 0
  br i1 %".35", label %"for.body", label %"for.end"
for.body:
  store i1 true, i1* %"found"
  store i32 0, i32* %"j"
  br label %"for.cond.1"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".56" = sub i32 %"i.4", 1
  store i32 %".56", i32* %"i"
  br label %"for.cond"
for.end:
  %".59" = sub i32 0, 1
  ret i32 %".59"
for.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"sub_len.4" = load i32, i32* %"sub_len"
  %".40" = icmp slt i32 %"j.1", %"sub_len.4"
  br i1 %".40", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"j.2" = load i32, i32* %"j"
  %".42" = add i32 %"i.2", %"j.2"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.3", i32 %".42"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"substr.3" = load i8*, i8** %"substr.addr"
  %"j.3" = load i32, i32* %"j"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"substr.3", i32 %"j.3"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".43" = icmp ne i8 %"ptr_load", %"ptr_load.1"
  br i1 %".43", label %"then.3", label %"else.3"
for.update.1:
  %"j.4" = load i32, i32* %"j"
  %".49" = add i32 %"j.4", 1
  store i32 %".49", i32* %"j"
  br label %"for.cond.1"
for.end.1:
  %"found.1" = load i1, i1* %"found"
  br i1 %"found.1", label %"then.4", label %"else.4"
then.3:
  store i1 false, i1* %"found"
  br label %"for.end.1"
else.3:
  br label %"ifcont.3"
ifcont.3:
  br label %"for.update.1"
then.4:
  %"i.3" = load i32, i32* %"i"
  ret i32 %"i.3"
else.4:
  br label %"ifcont.4"
ifcont.4:
  br label %"for.update"
}

define i32 @"find_last_char__2__byteE1_ptr1__charE1__ret_intE1"(i8* %"str", i8 %"ch")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"ch.addr" = alloca i8
  store i8 %"ch", i8* %"ch.addr"
  %"str.1" = load i8*, i8** %"str.addr"
  %".6" = ptrtoint i8* %"str.1" to i64
  %".7" = ptrtoint i8* null to i64
  %".8" = icmp eq i64 %".6", %".7"
  %"len" = alloca i32
  %"i" = alloca i32
  br i1 %".8", label %"then", label %"else"
then:
  %".10" = sub i32 0, 1
  ret i32 %".10"
else:
  br label %"ifcont"
ifcont:
  %"str.2" = load i8*, i8** %"str.addr"
  %".13" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"str.2")
  store i32 %".13", i32* %"len"
  %"len.1" = load i32, i32* %"len"
  %".15" = sub i32 %"len.1", 1
  store i32 %".15", i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".18" = icmp sge i32 %"i.1", 0
  br i1 %".18", label %"for.body", label %"for.end"
for.body:
  %"str.3" = load i8*, i8** %"str.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.3", i32 %"i.2"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"ch.1" = load i8, i8* %"ch.addr"
  %".20" = icmp eq i8 %"ptr_load", %"ch.1"
  br i1 %".20", label %"then.1", label %"else.1"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".25" = sub i32 %"i.4", 1
  store i32 %".25", i32* %"i"
  br label %"for.cond"
for.end:
  %".28" = sub i32 0, 1
  ret i32 %".28"
then.1:
  %"i.3" = load i32, i32* %"i"
  ret i32 %"i.3"
else.1:
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update"
}

define i32 @"count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1"(i8* %"str", i8* %"substr")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"substr.addr" = alloca i8*
  store i8* %"substr", i8** %"substr.addr"
  %"str.1" = load i8*, i8** %"str.addr"
  %".6" = ptrtoint i8* %"str.1" to i64
  %".7" = ptrtoint i8* null to i64
  %".8" = icmp eq i64 %".6", %".7"
  %"str_len" = alloca i32
  %"sub_len" = alloca i32
  %"count" = alloca i32
  %"pos" = alloca i32
  %"found" = alloca i1
  %"j" = alloca i32
  br i1 %".8", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"substr.1" = load i8*, i8** %"substr.addr"
  %".10" = ptrtoint i8* %"substr.1" to i64
  %".11" = ptrtoint i8* null to i64
  %".12" = icmp eq i64 %".10", %".11"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".12", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  ret i32 0
else:
  br label %"ifcont"
ifcont:
  %"str.2" = load i8*, i8** %"str.addr"
  %".17" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"str.2")
  store i32 %".17", i32* %"str_len"
  %"substr.2" = load i8*, i8** %"substr.addr"
  %".19" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"substr.2")
  store i32 %".19", i32* %"sub_len"
  %"sub_len.1" = load i32, i32* %"sub_len"
  %".21" = icmp eq i32 %"sub_len.1", 0
  br i1 %".21", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"sub_len.2" = load i32, i32* %"sub_len"
  %"str_len.1" = load i32, i32* %"str_len"
  %".23" = icmp sgt i32 %"sub_len.2", %"str_len.1"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"ifcont"], [%".23", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"then.1", label %"else.1"
then.1:
  ret i32 0
else.1:
  br label %"ifcont.1"
ifcont.1:
  store i32 0, i32* %"count"
  store i32 0, i32* %"pos"
  store i1 true, i1* %"found"
  br label %"while.cond"
while.cond:
  %"pos.1" = load i32, i32* %"pos"
  %"str_len.2" = load i32, i32* %"str_len"
  %"sub_len.3" = load i32, i32* %"sub_len"
  %".32" = sub i32 %"str_len.2", %"sub_len.3"
  %".33" = icmp sle i32 %"pos.1", %".32"
  br i1 %".33", label %"while.body", label %"while.end"
while.body:
  store i1 true, i1* %"found"
  store i32 0, i32* %"j"
  br label %"for.cond"
while.end:
  %"count.2" = load i32, i32* %"count"
  ret i32 %"count.2"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"sub_len.4" = load i32, i32* %"sub_len"
  %".38" = icmp slt i32 %"j.1", %"sub_len.4"
  br i1 %".38", label %"for.body", label %"for.end"
for.body:
  %"str.3" = load i8*, i8** %"str.addr"
  %"pos.2" = load i32, i32* %"pos"
  %"j.2" = load i32, i32* %"j"
  %".40" = add i32 %"pos.2", %"j.2"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.3", i32 %".40"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"substr.3" = load i8*, i8** %"substr.addr"
  %"j.3" = load i32, i32* %"j"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"substr.3", i32 %"j.3"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".41" = icmp ne i8 %"ptr_load", %"ptr_load.1"
  br i1 %".41", label %"then.2", label %"else.2"
for.update:
  %"j.4" = load i32, i32* %"j"
  %".47" = add i32 %"j.4", 1
  store i32 %".47", i32* %"j"
  br label %"for.cond"
for.end:
  %"found.1" = load i1, i1* %"found"
  br i1 %"found.1", label %"then.3", label %"else.3"
then.2:
  store i1 false, i1* %"found"
  br label %"for.end"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"for.update"
then.3:
  %"count.1" = load i32, i32* %"count"
  %".51" = add i32 %"count.1", 1
  store i32 %".51", i32* %"count"
  %"pos.3" = load i32, i32* %"pos"
  %"sub_len.5" = load i32, i32* %"sub_len"
  %".53" = add i32 %"pos.3", %"sub_len.5"
  store i32 %".53", i32* %"pos"
  br label %"ifcont.3"
else.3:
  %"pos.4" = load i32, i32* %"pos"
  %".56" = add i32 %"pos.4", 1
  store i32 %".56", i32* %"pos"
  br label %"ifcont.3"
ifcont.3:
  br label %"while.cond"
}

define void @"standard__io__console__flush__0__ret_voidE1"()
{
entry:
  %"n" = alloca i32
  %"out_len" = load i32, i32* @"standard__io__console__out_len"
  store i32 %"out_len", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".3" = icmp eq i32 %"n.1", 0
  br i1 %".3", label %"then", label %"else"
then:
  ret void
else:
  br label %"ifcont"
ifcont:
  store i32 0, i32* @"standard__io__console__out_len"
  %".8" = getelementptr inbounds [8192 x i8], [8192 x i8]* @"standard__io__console__out_buf", i32 0, i32 0
  %"n.2" = load i32, i32* %"n"
  call void @"standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %".8", i32 %"n.2")
  ret void
}

define void @"standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"msg", i32 %"x")
{
entry:
  %"msg.addr" = alloca i8*
  store i8* %"msg", i8** %"msg.addr"
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"x.1" = load i32, i32* %"x.addr"
  %".7" = icmp sle i32 %"x.1", 0
  br i1 %".7", label %"then", label %"else"
then:
  ret void
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i32, i32* %"x.addr"
  %".11" = icmp sge i32 %"x.2", 8192
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  call void @"standard__io__console__flush__0__ret_voidE1"()
  %"msg.1" = load i8*, i8** %"msg.addr"
  %"x.3" = load i32, i32* %"x.addr"
  call void @"standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"msg.1", i32 %"x.3")
  ret void
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"out_len" = load i32, i32* @"standard__io__console__out_len"
  %"x.4" = load i32, i32* %"x.addr"
  %".16" = add i32 %"out_len", %"x.4"
  %".17" = icmp sgt i32 %".16", 8192
  br i1 %".17", label %"then.2", label %"else.2"
then.2:
  call void @"standard__io__console__flush__0__ret_voidE1"()
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"x.5" = load i32, i32* %"x.addr"
  %".22" = icmp slt i32 %"i.1", %"x.5"
  br i1 %".22", label %"while.body", label %"while.end"
while.body:
  %"msg.2" = load i8*, i8** %"msg.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"msg.2", i32 %"i.2"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"out_len.1" = load i32, i32* @"standard__io__console__out_len"
  %"i.3" = load i32, i32* %"i"
  %".24" = add i32 %"out_len.1", %"i.3"
  %".25" = getelementptr inbounds [8192 x i8], [8192 x i8]* @"standard__io__console__out_buf", i32 0, i32 %".24"
  store i8 %"ptr_load", i8* %".25"
  %"i.4" = load i32, i32* %"i"
  %".27" = add i32 %"i.4", 1
  store i32 %".27", i32* %"i"
  br label %"while.cond"
while.end:
  %"out_len.2" = load i32, i32* @"standard__io__console__out_len"
  %"x.6" = load i32, i32* %"x.addr"
  %".30" = add i32 %"out_len.2", %"x.6"
  store i32 %".30", i32* @"standard__io__console__out_len"
  ret void
}

define void @"standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"msg", i32 %"x")
{
entry:
  %"msg.addr" = alloca i8*
  store i8* %"msg", i8** %"msg.addr"
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"msg_load" = load i8*, i8** %"msg.addr"
  %"x_load" = load i32, i32* %"x.addr"
  call void asm sideeffect "movq $$-11, %rcx        
                    subq $$32, %rsp
                    call GetStdHandle
                    addq $$32, %rsp
                    movq %rax, %rcx         
                    movq $0, %rdx           
                    movl $1, %r8d           
                    xorq %r9, %r9           
                    subq $$40, %rsp         
                    movq %r9, 32(%rsp)      
                    call WriteFile
                    addq $$40, %rsp", "r,r,~{rax},~{rcx},~{rdx},~{r8},~{r9},~{r10},~{r11},~{memory}"
(i8* %"msg_load", i32 %"x_load")
  ret void
}

define void @"standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1"(i8* %"s", i32 %"len")
{
entry:
  %"s.addr" = alloca i8*
  store i8* %"s", i8** %"s.addr"
  %"len.addr" = alloca i32
  store i32 %"len", i32* %"len.addr"
  %"s_ptr" = load i8*, i8** %"s.addr"
  %"len.1" = load i32, i32* %"len.addr"
  call void @"standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"s_ptr", i32 %"len.1")
  ret void
}

define void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"s")
{
entry:
  %"s.addr" = alloca i8*
  store i8* %"s", i8** %"s.addr"
  %"len" = alloca i32
  %"s_ptr" = load i8*, i8** %"s.addr"
  %".4" = call i32 @"standard__strings__strlen__1__byteE1_ptr1__ret_intE1"(i8* %"s_ptr")
  store i32 %".4", i32* %"len"
  %"s_ptr.1" = load i8*, i8** %"s.addr"
  %"len.1" = load i32, i32* %"len"
  call void @"standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"s_ptr.1", i32 %"len.1")
  ret void
}

define void @"standard__io__console__print__1__boolE1__ret_voidE1"(i1 %"b")
{
entry:
  %"b.addr" = alloca i1
  store i1 %"b", i1* %"b.addr"
  %"b.1" = load i1, i1* %"b.addr"
  br i1 %"b.1", label %"then", label %"else"
then:
  %"str_stack" = alloca [5 x i8]
  %"str_char_0" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 0
  store i8 84, i8* %"str_char_0"
  %"str_char_1" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 1
  store i8 114, i8* %"str_char_1"
  %"str_char_2" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 2
  store i8 117, i8* %"str_char_2"
  %"str_char_3" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 3
  store i8 101, i8* %"str_char_3"
  %"str_char_4" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 4
  store i8 0, i8* %"str_char_4"
  %"arg0_decay" = getelementptr [5 x i8], [5 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  br label %"ifcont"
else:
  %"str_stack.1" = alloca [6 x i8]
  %"str_char_0.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 70, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 97, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 108, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 115, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 101, i8* %"str_char_4.1"
  %"str_char_5" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 0, i8* %"str_char_5"
  %"arg0_decay.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  br label %"ifcont"
ifcont:
  ret void
}

define void @"standard__io__console__print__1__charE1__ret_voidE1"(i8 %"s")
{
entry:
  %"s.addr" = alloca i8
  store i8 %"s", i8* %"s.addr"
  %"x" = alloca [2 x i8]
  %"s.1" = load i8, i8* %"s.addr"
  %"elem_0" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  store i8 %"s.1", i8* %"elem_0"
  %".5" = trunc i32 0 to i8
  %"elem_1" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 1
  store i8 %".5", i8* %"elem_1"
  %"arg0_decay" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %"s")
{
entry:
  %"s.addr" = alloca i8
  store i8 %"s", i8* %"s.addr"
  %"x" = alloca [2 x i8]
  %"s.1" = load i8, i8* %"s.addr"
  %"elem_0" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  store i8 %"s.1", i8* %"elem_0"
  %".5" = trunc i32 0 to i8
  %"elem_1" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 1
  store i8 %".5", i8* %"elem_1"
  %"arg0_decay" = getelementptr [2 x i8], [2 x i8]* %"x", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__dataE1_sbits8__ret_voidE1"(i8 %"s")
{
entry:
  %"s.addr" = alloca i8
  store i8 %"s", i8* %"s.addr"
  %"s.1" = load i8, i8* %"s.addr"
  call void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %"s.1")
  ret void
}

define void @"standard__io__console__print__1__dataE1_sbits16__ret_voidE1"(i16 %"x")
{
entry:
  %"x.addr" = alloca i16
  store i16 %"x", i16* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i16, i16* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i16 @"standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16"(i16 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__dataE1_ubits16__ret_voidE1"(i16 %"x")
{
entry:
  %"x.addr" = alloca i16
  store i16 %"x", i16* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i16, i16* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i16 @"standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16"(i16 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__intE1__ret_voidE1"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i32, i32* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__dataE1_sbits32__ret_voidE1"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i32, i32* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

declare void @"standard__io__console__print__1__uintE1__ret_voidE1"(i32 %".1")

define void @"standard__io__console__print__1__dataE1_ubits32__ret_voidE1"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i32, i32* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i32 @"standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32"(i32 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__dataE1_sbits64__ret_voidE1"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i64, i64* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__dataE1_ubits64__ret_voidE1"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"buf" = alloca [21 x i8]
  store [21 x i8] zeroinitializer, [21 x i8]* %"buf"
  %"x.1" = load i64, i64* %"x.addr"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  %".5" = call i64 @"standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64"(i64 %"x.1", i8* %"arg1_decay")
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__longE1__ret_voidE1"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  call void @"standard__io__console__print__1__dataE1_sbits64__ret_voidE1"(i64 %"x.1")
  ret void
}

define void @"standard__io__console__print__1__ulongE1__ret_voidE1"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  call void @"standard__io__console__print__1__dataE1_ubits64__ret_voidE1"(i64 %"x.1")
  ret void
}

define void @"standard__io__console__print__1__floatE1__ret_voidE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"buffer" = alloca [256 x i8]
  %"memset_ptr" = bitcast [256 x i8]* %"buffer" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 256, i1 0)
  %"x.1" = load float, float* %"x.addr"
  %"arg1_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  %".5" = call i32 @"standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(float %"x.1", i8* %"arg1_decay", i32 5)
  %"arg0_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__2__floatE1__intE1__ret_voidE1"(float %"x", i32 %"y")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"y.addr" = alloca i32
  store i32 %"y", i32* %"y.addr"
  %"buffer" = alloca [256 x i8]
  %"memset_ptr" = bitcast [256 x i8]* %"buffer" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 256, i1 0)
  %"y.1" = load i32, i32* %"y.addr"
  %".7" = icmp sgt i32 %"y.1", 5
  br i1 %".7", label %"then", label %"else"
then:
  store i32 5, i32* %"y.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"x.1" = load float, float* %"x.addr"
  %"y.2" = load i32, i32* %"y.addr"
  %"arg1_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  %".12" = call i32 @"standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(float %"x.1", i8* %"arg1_decay", i32 %"y.2")
  %"arg0_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__1__doubleE1__ret_voidE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"buffer" = alloca [256 x i8]
  %"memset_ptr" = bitcast [256 x i8]* %"buffer" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 256, i1 0)
  %"x.1" = load double, double* %"x.addr"
  %"arg1_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  %".5" = call i32 @"standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(double %"x.1", i8* %"arg1_decay", i32 14)
  %"arg0_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__print__2__doubleE1__intE1__ret_voidE1"(double %"x", i32 %"y")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"y.addr" = alloca i32
  store i32 %"y", i32* %"y.addr"
  %"buffer" = alloca [256 x i8]
  %"memset_ptr" = bitcast [256 x i8]* %"buffer" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 256, i1 0)
  %"y.1" = load i32, i32* %"y.addr"
  %".7" = icmp sgt i32 %"y.1", 14
  br i1 %".7", label %"then", label %"else"
then:
  store i32 14, i32* %"y.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"x.1" = load double, double* %"x.addr"
  %"y.2" = load i32, i32* %"y.addr"
  %"arg1_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  %".12" = call i32 @"standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32"(double %"x.1", i8* %"arg1_decay", i32 %"y.2")
  %"arg0_decay" = getelementptr [256 x i8], [256 x i8]* %"buffer", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  ret void
}

define void @"standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"msg", i32 %"x")
{
entry:
  %"msg.addr" = alloca i8*
  store i8* %"msg", i8** %"msg.addr"
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"msg.1" = load i8*, i8** %"msg.addr"
  %"x.1" = load i32, i32* %"x.addr"
  call void @"standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1"(i8* %"msg.1", i32 %"x.1")
  ret void
}

declare void @"llvm.memset.p0i8.i64"(i8* %".1", i8 %".2", i64 %".3", i1 %".4")

declare external i32 @"fread"(i8* %"arg0", i32 %"arg1", i32 %"arg2", i8* %"arg3")

declare external i32 @"fwrite"(i8* %"arg0", i32 %"arg1", i32 %"arg2", i8* %"arg3")

declare external i32 @"sscanf"(i8* %"arg0", i8* %"arg1", i8* %"arg2", i8* %"arg3", i8* %"arg4")

declare external i32 @"fseek"(i8* %"arg0", i32 %"arg1", i32 %"arg2")

declare external i32 @"ftell"(i8* %"arg0")

declare external void @"rewind"(i8* %"arg0")

declare external i32 @"feof"(i8* %"arg0")

declare external i32 @"ferror"(i8* %"arg0")

declare external i32 @"fflush"(i8* %"arg0")

declare external i32 @"remove"(i8* %"arg0")

declare external i32 @"rename"(i8* %"arg0", i8* %"arg1")

define i32 @"main__0__ret_intE1"()
{
entry:
  %"field_bytes" = alloca i64
  store i64 0, i64* %"field_bytes"
  %"dens_tex_bytes" = alloca i64
  store i64 0, i64* %"dens_tex_bytes"
  %"vel_tex_bytes" = alloca i64
  store i64 0, i64* %"vel_tex_bytes"
  %"hInstance" = alloca i64
  store i64 0, i64* %"hInstance"
  %"hwnd" = alloca i64
  store i64 0, i64* %"hwnd"
  %"hdc" = alloca i64
  store i64 0, i64* %"hdc"
  %"msg" = alloca %"standard__system__windows__MSG"
  store %"standard__system__windows__MSG" zeroinitializer, %"standard__system__windows__MSG"* %"msg"
  %"running" = alloca i1
  store i1 0, i1* %"running"
  %"tex_dens" = alloca i32
  store i32 0, i32* %"tex_dens"
  %"tex_vel" = alloca i32
  store i32 0, i32* %"tex_vel"
  %"vert_sh" = alloca i32
  store i32 0, i32* %"vert_sh"
  %"frag_sh" = alloca i32
  store i32 0, i32* %"frag_sh"
  %"prog" = alloca i32
  store i32 0, i32* %"prog"
  %"u_dens" = alloca i32
  store i32 0, i32* %"u_dens"
  %"u_vel" = alloca i32
  store i32 0, i32* %"u_vel"
  %"u_res" = alloca i32
  store i32 0, i32* %"u_res"
  %"u_palette" = alloca i32
  store i32 0, i32* %"u_palette"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"seg" = alloca i32
  store i32 0, i32* %"seg"
  %"px" = alloca float
  store float              0x0, float* %"px"
  %"py" = alloca float
  store float              0x0, float* %"py"
  %"ndcx" = alloca float
  store float              0x0, float* %"ndcx"
  %"ndcy" = alloca float
  store float              0x0, float* %"ndcy"
  %"pr" = alloca float
  store float              0x0, float* %"pr"
  %"ox" = alloca float
  store float              0x0, float* %"ox"
  %"oy" = alloca float
  store float              0x0, float* %"oy"
  %"angle" = alloca float
  store float              0x0, float* %"angle"
  %"step_a" = alloca float
  store float              0x0, float* %"step_a"
  %"dens_val" = alloca float
  store float              0x0, float* %"dens_val"
  %"fx" = alloca float
  store float              0x0, float* %"fx"
  %"fy" = alloca float
  store float              0x0, float* %"fy"
  %"client_rect" = alloca %"standard__system__windows__RECT"
  store %"standard__system__windows__RECT" zeroinitializer, %"standard__system__windows__RECT"* %"client_rect"
  %"sysinfo" = alloca %"SYSTEM_INFO_PARTIAL"
  store %"SYSTEM_INFO_PARTIAL" zeroinitializer, %"SYSTEM_INFO_PARTIAL"* %"sysinfo"
  %"to_void_ptr" = bitcast %"SYSTEM_INFO_PARTIAL"* %"sysinfo" to i8*
  call void @"GetSystemInfo"(i8* %"to_void_ptr")
  %"sysinfo.1" = load %"SYSTEM_INFO_PARTIAL", %"SYSTEM_INFO_PARTIAL"* %"sysinfo"
  %"sysinfo.2" = load %"SYSTEM_INFO_PARTIAL", %"SYSTEM_INFO_PARTIAL"* %"sysinfo"
  %"dwNumberOfProcessors_ptr" = getelementptr inbounds %"SYSTEM_INFO_PARTIAL", %"SYSTEM_INFO_PARTIAL"* %"sysinfo", i32 0, i32 5
  %"dwNumberOfProcessors" = load i32, i32* %"dwNumberOfProcessors_ptr"
  store i32 %"dwNumberOfProcessors", i32* @"g_num_threads"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".38" = icmp slt i32 %"g_num_threads", 1
  %"class_name" = alloca i8*
  %"win_title" = alloca i8*
  %"wc" = alloca %"standard__system__windows__WNDCLASSEXA"
  %"gl" = alloca %"OpenGL__GLContext"
  br i1 %".38", label %"then", label %"else"
then:
  store i32 1, i32* @"g_num_threads"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %"MAX_THREADS" = load i32, i32* @"MAX_THREADS"
  %".43" = icmp sgt i32 %"g_num_threads.1", %"MAX_THREADS"
  br i1 %".43", label %"then.1", label %"else.1"
then.1:
  %"MAX_THREADS.1" = load i32, i32* @"MAX_THREADS"
  store i32 %"MAX_THREADS.1", i32* @"g_num_threads"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".48" = mul i32 256, 192
  %".49" = mul i32 %".48", 8
  %".50" = zext i32 %".49" to i64
  store i64 %".50", i64* %"field_bytes"
  %".52" = mul i32 256, 192
  %".53" = mul i32 %".52", 4
  %".54" = zext i32 %".53" to i64
  store i64 %".54", i64* %"dens_tex_bytes"
  %".56" = mul i32 256, 192
  %".57" = mul i32 %".56", 4
  %".58" = mul i32 %".57", 2
  %".59" = zext i32 %".58" to i64
  store i64 %".59", i64* %"vel_tex_bytes"
  %"field_bytes.1" = load i64, i64* %"field_bytes"
  %".61" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.1")
  %"int_to_ptr" = inttoptr i64 %".61" to double*
  store double* %"int_to_ptr", double** @"g_dens"
  %"field_bytes.2" = load i64, i64* %"field_bytes"
  %".63" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.2")
  %"int_to_ptr.1" = inttoptr i64 %".63" to double*
  store double* %"int_to_ptr.1", double** @"g_dens_prev"
  %"field_bytes.3" = load i64, i64* %"field_bytes"
  %".65" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.3")
  %"int_to_ptr.2" = inttoptr i64 %".65" to double*
  store double* %"int_to_ptr.2", double** @"g_vx"
  %"field_bytes.4" = load i64, i64* %"field_bytes"
  %".67" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.4")
  %"int_to_ptr.3" = inttoptr i64 %".67" to double*
  store double* %"int_to_ptr.3", double** @"g_vy"
  %"field_bytes.5" = load i64, i64* %"field_bytes"
  %".69" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.5")
  %"int_to_ptr.4" = inttoptr i64 %".69" to double*
  store double* %"int_to_ptr.4", double** @"g_vx_prev"
  %"field_bytes.6" = load i64, i64* %"field_bytes"
  %".71" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"field_bytes.6")
  %"int_to_ptr.5" = inttoptr i64 %".71" to double*
  store double* %"int_to_ptr.5", double** @"g_vy_prev"
  %"dens_tex_bytes.1" = load i64, i64* %"dens_tex_bytes"
  %".73" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"dens_tex_bytes.1")
  %"int_to_ptr.6" = inttoptr i64 %".73" to float*
  store float* %"int_to_ptr.6", float** @"g_dens_tex"
  %"vel_tex_bytes.1" = load i64, i64* %"vel_tex_bytes"
  %".75" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"vel_tex_bytes.1")
  %"int_to_ptr.7" = inttoptr i64 %".75" to float*
  store float* %"int_to_ptr.7", float** @"g_vel_tex"
  %".77" = mul i32 7500, 4
  %".78" = zext i32 %".77" to i64
  %".79" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".78")
  %"int_to_ptr.8" = inttoptr i64 %".79" to float*
  store float* %"int_to_ptr.8", float** @"g_part_x"
  %".81" = mul i32 7500, 4
  %".82" = zext i32 %".81" to i64
  %".83" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".82")
  %"int_to_ptr.9" = inttoptr i64 %".83" to float*
  store float* %"int_to_ptr.9", float** @"g_part_y"
  call void @"particles_init__0__ret_voidE1"()
  %".85" = call i32 @"standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1"(%"Semaphore"* @"g_work_sem", i32 0)
  %".86" = call i32 @"standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1"(%"Semaphore"* @"g_done_sem", i32 0)
  %".87" = call i32 @"standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1"(%"Semaphore"* @"g_work_sem2", i32 0)
  %".88" = call i32 @"standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1"(%"Semaphore"* @"g_done_sem2", i32 0)
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".89" = sdiv i32 192, %"g_num_threads.2"
  store i32 %".89", i32* @"g_rows_per_thread"
  %"g_rows_per_thread" = load i32, i32* @"g_rows_per_thread"
  %".91" = icmp slt i32 %"g_rows_per_thread", 1
  br i1 %".91", label %"then.2", label %"else.2"
then.2:
  store i32 1, i32* @"g_rows_per_thread"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads.3" = load i32, i32* @"g_num_threads"
  %".98" = icmp slt i32 %"t.1", %"g_num_threads.3"
  br i1 %".98", label %"for.body", label %"for.end"
for.body:
  %"t.2" = load i32, i32* %"t"
  %"g_rows_per_thread.1" = load i32, i32* @"g_rows_per_thread"
  %".100" = mul i32 %"t.2", %"g_rows_per_thread.1"
  %"t.3" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".101" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 0
  store i32 %".100", i32* %".101"
  %"t.4" = load i32, i32* %"t"
  %"g_num_threads.4" = load i32, i32* @"g_num_threads"
  %".103" = sub i32 %"g_num_threads.4", 1
  %".104" = icmp eq i32 %"t.4", %".103"
  br i1 %".104", label %"ternary_true", label %"ternary_false"
for.update:
  %"t.18" = load i32, i32* %"t"
  %".135" = add i32 %"t.18", 1
  store i32 %".135", i32* %"t"
  br label %"for.cond"
for.end:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr.10" = inttoptr i64 %"int_to_ptr_zext" to i8*
  %".138" = call i64 @"GetModuleHandleA"(i8* %"int_to_ptr.10")
  store i64 %".138", i64* %"hInstance"
  %"str_data" = alloca [9 x i8]
  %".140" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 0
  store i8 70, i8* %".140"
  %".142" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 1
  store i8 108, i8* %".142"
  %".144" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 2
  store i8 117, i8* %".144"
  %".146" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 3
  store i8 105, i8* %".146"
  %".148" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 4
  store i8 100, i8* %".148"
  %".150" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 5
  store i8 83, i8* %".150"
  %".152" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 6
  store i8 105, i8* %".152"
  %".154" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 7
  store i8 109, i8* %".154"
  %".156" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 8
  store i8 0, i8* %".156"
  %"str_ptr" = getelementptr [9 x i8], [9 x i8]* %"str_data", i32 0, i32 0
  store i8* %"str_ptr", i8** %"class_name"
  %"str_data.1" = alloca [17 x i8]
  %".159" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 0
  store i8 70, i8* %".159"
  %".161" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 1
  store i8 108, i8* %".161"
  %".163" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 2
  store i8 117, i8* %".163"
  %".165" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 3
  store i8 105, i8* %".165"
  %".167" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 4
  store i8 100, i8* %".167"
  %".169" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 5
  store i8 32, i8* %".169"
  %".171" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 6
  store i8 83, i8* %".171"
  %".173" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 7
  store i8 105, i8* %".173"
  %".175" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 8
  store i8 109, i8* %".175"
  %".177" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 9
  store i8 117, i8* %".177"
  %".179" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 10
  store i8 108, i8* %".179"
  %".181" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 11
  store i8 97, i8* %".181"
  %".183" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 12
  store i8 116, i8* %".183"
  %".185" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 13
  store i8 105, i8* %".185"
  %".187" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 14
  store i8 111, i8* %".187"
  %".189" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 15
  store i8 110, i8* %".189"
  %".191" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 16
  store i8 0, i8* %".191"
  %"str_ptr.1" = getelementptr [17 x i8], [17 x i8]* %"str_data.1", i32 0, i32 0
  store i8* %"str_ptr.1", i8** %"win_title"
  store %"standard__system__windows__WNDCLASSEXA" zeroinitializer, %"standard__system__windows__WNDCLASSEXA"* %"wc"
  %".195" = sdiv i32 640, 8
  %".196" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 0
  store i32 %".195", i32* %".196"
  %"CS_HREDRAW" = load i32, i32* @"standard__system__windows__CS_HREDRAW"
  %"CS_VREDRAW" = load i32, i32* @"standard__system__windows__CS_VREDRAW"
  %".198" = or i32 %"CS_HREDRAW", %"CS_VREDRAW"
  %"CS_OWNDC" = load i32, i32* @"standard__system__windows__CS_OWNDC"
  %".199" = or i32 %".198", %"CS_OWNDC"
  %".200" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 1
  store i32 %".199", i32* %".200"
  %".202" = bitcast i64 (i64, i32, i64, i64)* @"FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64" to i64*
  %".203" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 2
  store i64* %".202", i64** %".203"
  %".205" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 3
  store i32 0, i32* %".205"
  %".207" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 4
  store i32 0, i32* %".207"
  %"hInstance.1" = load i64, i64* %"hInstance"
  %".209" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 5
  store i64 %"hInstance.1", i64* %".209"
  %".211" = sext i32 0 to i64
  %"int_to_ptr_zext.1" = zext i32 32512 to i64
  %"int_to_ptr.11" = inttoptr i64 %"int_to_ptr_zext.1" to i8*
  %".212" = call i64 @"LoadIconA"(i64 %".211", i8* %"int_to_ptr.11")
  %".213" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 6
  store i64 %".212", i64* %".213"
  %".215" = sext i32 0 to i64
  %"int_to_ptr_zext.2" = zext i32 32512 to i64
  %"int_to_ptr.12" = inttoptr i64 %"int_to_ptr_zext.2" to i8*
  %".216" = call i64 @"LoadCursorA"(i64 %".215", i8* %"int_to_ptr.12")
  %".217" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 7
  store i64 %".216", i64* %".217"
  %"BLACK_BRUSH" = load i32, i32* @"standard__system__windows__BLACK_BRUSH"
  %".219" = call i64 @"GetStockObject"(i32 %"BLACK_BRUSH")
  %".220" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 8
  store i64 %".219", i64* %".220"
  %"int_to_ptr_zext.3" = zext i32 0 to i64
  %"int_to_ptr.13" = inttoptr i64 %"int_to_ptr_zext.3" to i8*
  %".222" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 9
  store i8* %"int_to_ptr.13", i8** %".222"
  %"class_name.1" = load i8*, i8** %"class_name"
  %".224" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 10
  store i8* %"class_name.1", i8** %".224"
  %".226" = sext i32 0 to i64
  %".227" = getelementptr inbounds %"standard__system__windows__WNDCLASSEXA", %"standard__system__windows__WNDCLASSEXA"* %"wc", i32 0, i32 11
  store i64 %".226", i64* %".227"
  %".229" = call i16 @"RegisterClassExA"(%"standard__system__windows__WNDCLASSEXA"* %"wc")
  %"WS_EX_APPWINDOW" = load i32, i32* @"standard__system__windows__WS_EX_APPWINDOW"
  %"class_name.2" = load i8*, i8** %"class_name"
  %"win_title.1" = load i8*, i8** %"win_title"
  %"WS_OVERLAPPEDWINDOW" = load i32, i32* @"standard__system__windows__WS_OVERLAPPEDWINDOW"
  %"WS_VISIBLE" = load i32, i32* @"standard__system__windows__WS_VISIBLE"
  %".230" = or i32 %"WS_OVERLAPPEDWINDOW", %"WS_VISIBLE"
  %"WIN_W" = load i32, i32* @"WIN_W"
  %"WIN_H" = load i32, i32* @"WIN_H"
  %".231" = sext i32 0 to i64
  %".232" = sext i32 0 to i64
  %"hInstance.2" = load i64, i64* %"hInstance"
  %"STDLIB_GVP" = load i8*, i8** @"STDLIB_GVP"
  %".233" = call i64 @"CreateWindowExA"(i32 %"WS_EX_APPWINDOW", i8* %"class_name.2", i8* %"win_title.1", i32 %".230", i32 100, i32 100, i32 %"WIN_W", i32 %"WIN_H", i64 %".231", i64 %".232", i64 %"hInstance.2", i8* %"STDLIB_GVP")
  store i64 %".233", i64* %"hwnd"
  %"hwnd.1" = load i64, i64* %"hwnd"
  %".235" = call i64 @"GetDC"(i64 %"hwnd.1")
  store i64 %".235", i64* %"hdc"
  %"hdc.1" = load i64, i64* %"hdc"
  store %"OpenGL__GLContext" zeroinitializer, %"OpenGL__GLContext"* %"gl"
  %"hdc.2" = load i64, i64* %"hdc"
  %".238" = call %"OpenGL__GLContext"* @"OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1"(%"OpenGL__GLContext"* %"gl", i64 %"hdc.2")
  call void @"OpenGL__GLContext.load_extensions__0__ret_voidE1"(%"OpenGL__GLContext"* %"gl")
  %"_glCreateShader" = load i8*, i8** @"OpenGL___glCreateShader"
  %"void_ptr_to_typed" = bitcast i8* %"_glCreateShader" to i32 (i32)*
  store i32 (i32)* %"void_ptr_to_typed", i32 (i32)** @"glCreateShader_fp"
  %"_glShaderSource" = load i8*, i8** @"OpenGL___glShaderSource"
  %"void_ptr_to_typed.1" = bitcast i8* %"_glShaderSource" to void (i32, i32, i8**, i32*)*
  store void (i32, i32, i8**, i32*)* %"void_ptr_to_typed.1", void (i32, i32, i8**, i32*)** @"glShaderSource_fp"
  %"_glCompileShader" = load i8*, i8** @"OpenGL___glCompileShader"
  %"void_ptr_to_typed.2" = bitcast i8* %"_glCompileShader" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.2", void (i32)** @"glCompileShader_fp"
  %"_glCreateProgram" = load i8*, i8** @"OpenGL___glCreateProgram"
  %"void_ptr_to_typed.3" = bitcast i8* %"_glCreateProgram" to i32 ()*
  store i32 ()* %"void_ptr_to_typed.3", i32 ()** @"glCreateProgram_fp"
  %"_glAttachShader" = load i8*, i8** @"OpenGL___glAttachShader"
  %"void_ptr_to_typed.4" = bitcast i8* %"_glAttachShader" to void (i32, i32)*
  store void (i32, i32)* %"void_ptr_to_typed.4", void (i32, i32)** @"glAttachShader_fp"
  %"_glLinkProgram" = load i8*, i8** @"OpenGL___glLinkProgram"
  %"void_ptr_to_typed.5" = bitcast i8* %"_glLinkProgram" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.5", void (i32)** @"glLinkProgram_fp"
  %"_glUseProgram" = load i8*, i8** @"OpenGL___glUseProgram"
  %"void_ptr_to_typed.6" = bitcast i8* %"_glUseProgram" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.6", void (i32)** @"glUseProgram_fp"
  %"_glGetUniformLocation" = load i8*, i8** @"OpenGL___glGetUniformLocation"
  %"void_ptr_to_typed.7" = bitcast i8* %"_glGetUniformLocation" to i32 (i32, i8*)*
  store i32 (i32, i8*)* %"void_ptr_to_typed.7", i32 (i32, i8*)** @"glGetUniformLocation_fp"
  %"_glUniform1i" = load i8*, i8** @"OpenGL___glUniform1i"
  %"void_ptr_to_typed.8" = bitcast i8* %"_glUniform1i" to void (i32, i32)*
  store void (i32, i32)* %"void_ptr_to_typed.8", void (i32, i32)** @"glUniform1i_fp"
  %"_glUniform2f" = load i8*, i8** @"OpenGL___glUniform2f"
  %"void_ptr_to_typed.9" = bitcast i8* %"_glUniform2f" to void (i32, float, float)*
  store void (i32, float, float)* %"void_ptr_to_typed.9", void (i32, float, float)** @"glUniform2f_fp"
  %"_glActiveTexture" = load i8*, i8** @"OpenGL___glActiveTexture"
  %"void_ptr_to_typed.10" = bitcast i8* %"_glActiveTexture" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.10", void (i32)** @"glActiveTexture_fp"
  %"_glDeleteShader" = load i8*, i8** @"OpenGL___glDeleteShader"
  %"void_ptr_to_typed.11" = bitcast i8* %"_glDeleteShader" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.11", void (i32)** @"glDeleteShader_fp"
  %"_glDeleteProgram" = load i8*, i8** @"OpenGL___glDeleteProgram"
  %"void_ptr_to_typed.12" = bitcast i8* %"_glDeleteProgram" to void (i32)*
  store void (i32)* %"void_ptr_to_typed.12", void (i32)** @"glDeleteProgram_fp"
  %"GL_PROJECTION" = load i32, i32* @"GL_PROJECTION"
  call void @"glMatrixMode"(i32 %"GL_PROJECTION")
  call void @"glLoadIdentity"()
  %"GL_MODELVIEW" = load i32, i32* @"GL_MODELVIEW"
  call void @"glMatrixMode"(i32 %"GL_MODELVIEW")
  call void @"glLoadIdentity"()
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D")
  %"GL_VERTEX_SHADER" = load i32, i32* @"GL_VERTEX_SHADER"
  %".259" = getelementptr inbounds [102 x i8], [102 x i8]* @"VERT_SRC", i32 0, i32 0
  %".260" = call i32 @"OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1"(i32 %"GL_VERTEX_SHADER", i8* %".259")
  store i32 %".260", i32* %"vert_sh"
  %"GL_FRAGMENT_SHADER" = load i32, i32* @"GL_FRAGMENT_SHADER"
  %".262" = getelementptr inbounds [4187 x i8], [4187 x i8]* @"FRAG_SRC", i32 0, i32 0
  %".263" = call i32 @"OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1"(i32 %"GL_FRAGMENT_SHADER", i8* %".262")
  store i32 %".263", i32* %"frag_sh"
  %"vert_sh.1" = load i32, i32* %"vert_sh"
  %"frag_sh.1" = load i32, i32* %"frag_sh"
  %".265" = call i32 @"OpenGL__link_program__2__intE1__intE1__ret_intE1"(i32 %"vert_sh.1", i32 %"frag_sh.1")
  store i32 %".265", i32* %"prog"
  %"glGetUniformLocation_fp" = load i32 (i32, i8*)*, i32 (i32, i8*)** @"glGetUniformLocation_fp"
  %"prog.1" = load i32, i32* %"prog"
  %"str_stack" = alloca [7 x i8]
  %"str_char_0" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 0
  store i8 117, i8* %"str_char_0"
  %"str_char_1" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 1
  store i8 95, i8* %"str_char_1"
  %"str_char_2" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 2
  store i8 100, i8* %"str_char_2"
  %"str_char_3" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 3
  store i8 101, i8* %"str_char_3"
  %"str_char_4" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 4
  store i8 110, i8* %"str_char_4"
  %"str_char_5" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 5
  store i8 115, i8* %"str_char_5"
  %"str_char_6" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 6
  store i8 0, i8* %"str_char_6"
  %"arg1_decay" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 0
  %"fp_call" = call i32 %"glGetUniformLocation_fp"(i32 %"prog.1", i8* %"arg1_decay")
  store i32 %"fp_call", i32* %"u_dens"
  %"glGetUniformLocation_fp.1" = load i32 (i32, i8*)*, i32 (i32, i8*)** @"glGetUniformLocation_fp"
  %"prog.2" = load i32, i32* %"prog"
  %"str_stack.1" = alloca [6 x i8]
  %"str_char_0.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 117, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 95, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 118, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 101, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 0, i8* %"str_char_5.1"
  %"arg1_decay.1" = getelementptr [6 x i8], [6 x i8]* %"str_stack.1", i32 0, i32 0
  %"fp_call.1" = call i32 %"glGetUniformLocation_fp.1"(i32 %"prog.2", i8* %"arg1_decay.1")
  store i32 %"fp_call.1", i32* %"u_vel"
  %"glGetUniformLocation_fp.2" = load i32 (i32, i8*)*, i32 (i32, i8*)** @"glGetUniformLocation_fp"
  %"prog.3" = load i32, i32* %"prog"
  %"str_stack.2" = alloca [6 x i8]
  %"str_char_0.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 117, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 95, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 114, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 101, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 115, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 0, i8* %"str_char_5.2"
  %"arg1_decay.2" = getelementptr [6 x i8], [6 x i8]* %"str_stack.2", i32 0, i32 0
  %"fp_call.2" = call i32 %"glGetUniformLocation_fp.2"(i32 %"prog.3", i8* %"arg1_decay.2")
  store i32 %"fp_call.2", i32* %"u_res"
  %"glGetUniformLocation_fp.3" = load i32 (i32, i8*)*, i32 (i32, i8*)** @"glGetUniformLocation_fp"
  %"prog.4" = load i32, i32* %"prog"
  %"str_stack.3" = alloca [10 x i8]
  %"str_char_0.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 117, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 95, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 112, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 97, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 101, i8* %"str_char_5.3"
  %"str_char_6.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 116, i8* %"str_char_6.1"
  %"str_char_7" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 116, i8* %"str_char_7"
  %"str_char_8" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 0, i8* %"str_char_9"
  %"arg1_decay.3" = getelementptr [10 x i8], [10 x i8]* %"str_stack.3", i32 0, i32 0
  %"fp_call.3" = call i32 %"glGetUniformLocation_fp.3"(i32 %"prog.4", i8* %"arg1_decay.3")
  store i32 %"fp_call.3", i32* %"u_palette"
  store i32 0, i32* %"tex_dens"
  call void @"glGenTextures"(i32 1, i32* %"tex_dens")
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  %"tex_dens.1" = load i32, i32* %"tex_dens"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.1", i32 %"tex_dens.1")
  %"GL_TEXTURE_2D.2" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_MIN_FILTER" = load i32, i32* @"GL_TEXTURE_MIN_FILTER"
  %"GL_LINEAR" = load i32, i32* @"GL_LINEAR"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.2", i32 %"GL_TEXTURE_MIN_FILTER", i32 %"GL_LINEAR")
  %"GL_TEXTURE_2D.3" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_MAG_FILTER" = load i32, i32* @"GL_TEXTURE_MAG_FILTER"
  %"GL_LINEAR.1" = load i32, i32* @"GL_LINEAR"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.3", i32 %"GL_TEXTURE_MAG_FILTER", i32 %"GL_LINEAR.1")
  %"GL_TEXTURE_2D.4" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_WRAP_S" = load i32, i32* @"GL_TEXTURE_WRAP_S"
  %"GL_CLAMP_TO_EDGE" = load i32, i32* @"GL_CLAMP_TO_EDGE"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.4", i32 %"GL_TEXTURE_WRAP_S", i32 %"GL_CLAMP_TO_EDGE")
  %"GL_TEXTURE_2D.5" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_WRAP_T" = load i32, i32* @"GL_TEXTURE_WRAP_T"
  %"GL_CLAMP_TO_EDGE.1" = load i32, i32* @"GL_CLAMP_TO_EDGE"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.5", i32 %"GL_TEXTURE_WRAP_T", i32 %"GL_CLAMP_TO_EDGE.1")
  %"GL_TEXTURE_2D.6" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_LUMINANCE" = load i32, i32* @"GL_LUMINANCE"
  %"GL_LUMINANCE.1" = load i32, i32* @"GL_LUMINANCE"
  %"GL_FLOAT" = load i32, i32* @"GL_FLOAT"
  %"g_dens_tex" = load float*, float** @"g_dens_tex"
  %"to_void_ptr.5" = bitcast float* %"g_dens_tex" to i8*
  call void @"glTexImage2D"(i32 %"GL_TEXTURE_2D.6", i32 0, i32 %"GL_LUMINANCE", i32 256, i32 192, i32 0, i32 %"GL_LUMINANCE.1", i32 %"GL_FLOAT", i8* %"to_void_ptr.5")
  store i32 0, i32* %"tex_vel"
  call void @"glGenTextures"(i32 1, i32* %"tex_vel")
  %"GL_TEXTURE_2D.7" = load i32, i32* @"GL_TEXTURE_2D"
  %"tex_vel.1" = load i32, i32* %"tex_vel"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.7", i32 %"tex_vel.1")
  %"GL_TEXTURE_2D.8" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_MIN_FILTER.1" = load i32, i32* @"GL_TEXTURE_MIN_FILTER"
  %"GL_LINEAR.2" = load i32, i32* @"GL_LINEAR"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.8", i32 %"GL_TEXTURE_MIN_FILTER.1", i32 %"GL_LINEAR.2")
  %"GL_TEXTURE_2D.9" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_MAG_FILTER.1" = load i32, i32* @"GL_TEXTURE_MAG_FILTER"
  %"GL_LINEAR.3" = load i32, i32* @"GL_LINEAR"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.9", i32 %"GL_TEXTURE_MAG_FILTER.1", i32 %"GL_LINEAR.3")
  %"GL_TEXTURE_2D.10" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_WRAP_S.1" = load i32, i32* @"GL_TEXTURE_WRAP_S"
  %"GL_CLAMP_TO_EDGE.2" = load i32, i32* @"GL_CLAMP_TO_EDGE"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.10", i32 %"GL_TEXTURE_WRAP_S.1", i32 %"GL_CLAMP_TO_EDGE.2")
  %"GL_TEXTURE_2D.11" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_TEXTURE_WRAP_T.1" = load i32, i32* @"GL_TEXTURE_WRAP_T"
  %"GL_CLAMP_TO_EDGE.3" = load i32, i32* @"GL_CLAMP_TO_EDGE"
  call void @"glTexParameteri"(i32 %"GL_TEXTURE_2D.11", i32 %"GL_TEXTURE_WRAP_T.1", i32 %"GL_CLAMP_TO_EDGE.3")
  %"GL_TEXTURE_2D.12" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_LUMINANCE_ALPHA" = load i32, i32* @"GL_LUMINANCE_ALPHA"
  %"GL_LUMINANCE_ALPHA.1" = load i32, i32* @"GL_LUMINANCE_ALPHA"
  %"GL_FLOAT.1" = load i32, i32* @"GL_FLOAT"
  %"g_vel_tex" = load float*, float** @"g_vel_tex"
  %"to_void_ptr.6" = bitcast float* %"g_vel_tex" to i8*
  call void @"glTexImage2D"(i32 %"GL_TEXTURE_2D.12", i32 0, i32 %"GL_LUMINANCE_ALPHA", i32 256, i32 192, i32 0, i32 %"GL_LUMINANCE_ALPHA.1", i32 %"GL_FLOAT.1", i8* %"to_void_ptr.6")
  %"hwnd.2" = load i64, i64* %"hwnd"
  %"SW_SHOW" = load i32, i32* @"standard__system__windows__SW_SHOW"
  %".316" = call i1 @"ShowWindow"(i64 %"hwnd.2", i32 %"SW_SHOW")
  %"hwnd.3" = load i64, i64* %"hwnd"
  %".317" = call i1 @"UpdateWindow"(i64 %"hwnd.3")
  store i1 true, i1* %"running"
  br label %"while.cond"
ternary_true:
  br label %"ternary_merge"
ternary_false:
  %"t.5" = load i32, i32* %"t"
  %".107" = add i32 %"t.5", 1
  %"g_rows_per_thread.2" = load i32, i32* @"g_rows_per_thread"
  %".108" = mul i32 %".107", %"g_rows_per_thread.2"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  i32 [192, %"ternary_true"], [%".108", %"ternary_false"]
  %"t.6" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".110" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 1
  store i32 %"ternary_result", i32* %".110"
  %"PHASE_DECAY" = load i32, i32* @"PHASE_DECAY"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.7"
  %".112" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 2
  store i32 %"PHASE_DECAY", i32* %".112"
  %"t.8" = load i32, i32* %"t"
  %"g_rows_per_thread.3" = load i32, i32* @"g_rows_per_thread"
  %".114" = mul i32 %"t.8", %"g_rows_per_thread.3"
  %"t.9" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.9"
  %".115" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 0
  store i32 %".114", i32* %".115"
  %"t.10" = load i32, i32* %"t"
  %"g_num_threads.5" = load i32, i32* @"g_num_threads"
  %".117" = sub i32 %"g_num_threads.5", 1
  %".118" = icmp eq i32 %"t.10", %".117"
  br i1 %".118", label %"ternary_true.1", label %"ternary_false.1"
ternary_true.1:
  br label %"ternary_merge.1"
ternary_false.1:
  %"t.11" = load i32, i32* %"t"
  %".121" = add i32 %"t.11", 1
  %"g_rows_per_thread.4" = load i32, i32* @"g_rows_per_thread"
  %".122" = mul i32 %".121", %"g_rows_per_thread.4"
  br label %"ternary_merge.1"
ternary_merge.1:
  %"ternary_result.1" = phi  i32 [192, %"ternary_true.1"], [%".122", %"ternary_false.1"]
  %"t.12" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.12"
  %".124" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 1
  store i32 %"ternary_result.1", i32* %".124"
  %"PHASE_DECAY.1" = load i32, i32* @"PHASE_DECAY"
  %"t.13" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.13"
  %".126" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 2
  store i32 %"PHASE_DECAY.1", i32* %".126"
  %"to_void_ptr.1" = bitcast i8* (i8*)* @"worker__1__voidE1_ptr1__ret_voidE1_ptr1" to i8*
  %"t.14" = load i32, i32* %"t"
  %".128" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.14"
  %"to_void_ptr.2" = bitcast %"WorkSlice"* %".128" to i8*
  %"t.15" = load i32, i32* %"t"
  %".129" = getelementptr inbounds [64 x %"Thread"], [64 x %"Thread"]* @"g_threads", i32 0, i32 %"t.15"
  %".130" = call i32 @"standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1"(i8* %"to_void_ptr.1", i8* %"to_void_ptr.2", %"Thread"* %".129")
  %"to_void_ptr.3" = bitcast i8* (i8*)* @"worker2__1__voidE1_ptr1__ret_voidE1_ptr1" to i8*
  %"t.16" = load i32, i32* %"t"
  %".131" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.16"
  %"to_void_ptr.4" = bitcast %"WorkSlice"* %".131" to i8*
  %"t.17" = load i32, i32* %"t"
  %".132" = getelementptr inbounds [64 x %"Thread"], [64 x %"Thread"]* @"g_threads2", i32 0, i32 %"t.17"
  %".133" = call i32 @"standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1"(i8* %"to_void_ptr.3", i8* %"to_void_ptr.4", %"Thread"* %".132")
  br label %"for.update"
while.cond:
  %"running.1" = load i1, i1* %"running"
  br i1 %"running.1", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond.1"
while.end:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
while.cond.1:
  %".322" = sext i32 0 to i64
  %"PM_REMOVE" = load i32, i32* @"standard__system__windows__PM_REMOVE"
  %".323" = call i1 @"PeekMessageA"(%"standard__system__windows__MSG"* %"msg", i64 %".322", i32 0, i32 0, i32 %"PM_REMOVE")
  br i1 %".323", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"msg.1" = load %"standard__system__windows__MSG", %"standard__system__windows__MSG"* %"msg"
  %"msg.2" = load %"standard__system__windows__MSG", %"standard__system__windows__MSG"* %"msg"
  %"message_ptr" = getelementptr inbounds %"standard__system__windows__MSG", %"standard__system__windows__MSG"* %"msg", i32 0, i32 1
  %"message" = load i32, i32* %"message_ptr"
  %"WM_QUIT" = load i32, i32* @"standard__system__windows__WM_QUIT"
  %".325" = icmp eq i32 %"message", %"WM_QUIT"
  br i1 %".325", label %"then.3", label %"else.3"
while.end.1:
  %"running.2" = load i1, i1* %"running"
  %".333" = xor i1 %"running.2", -1
  br i1 %".333", label %"then.4", label %"else.4"
then.3:
  store i1 false, i1* %"running"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %".330" = call i1 @"TranslateMessage"(%"standard__system__windows__MSG"* %"msg")
  %".331" = call i64 @"DispatchMessageA"(%"standard__system__windows__MSG"* %"msg")
  br label %"while.cond.1"
then.4:
  br label %"while.end"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"hwnd.4" = load i64, i64* %"hwnd"
  %".337" = call i1 @"GetClientRect"(i64 %"hwnd.4", %"standard__system__windows__RECT"* %"client_rect")
  %"client_rect.1" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"client_rect.2" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"right_ptr" = getelementptr inbounds %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect", i32 0, i32 2
  %"right" = load i32, i32* %"right_ptr"
  %"client_rect.3" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"client_rect.4" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"left_ptr" = getelementptr inbounds %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect", i32 0, i32 0
  %"left" = load i32, i32* %"left_ptr"
  %".338" = sub i32 %"right", %"left"
  store i32 %".338", i32* @"cur_w"
  %"client_rect.5" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"client_rect.6" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"bottom_ptr" = getelementptr inbounds %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect", i32 0, i32 3
  %"bottom" = load i32, i32* %"bottom_ptr"
  %"client_rect.7" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"client_rect.8" = load %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect"
  %"top_ptr" = getelementptr inbounds %"standard__system__windows__RECT", %"standard__system__windows__RECT"* %"client_rect", i32 0, i32 1
  %"top" = load i32, i32* %"top_ptr"
  %".340" = sub i32 %"bottom", %"top"
  store i32 %".340", i32* @"cur_h"
  %"cur_w" = load i32, i32* @"cur_w"
  %".342" = icmp slt i32 %"cur_w", 1
  br i1 %".342", label %"then.5", label %"else.5"
then.5:
  store i32 1, i32* @"cur_w"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"cur_h" = load i32, i32* @"cur_h"
  %".347" = icmp slt i32 %"cur_h", 1
  br i1 %".347", label %"then.6", label %"else.6"
then.6:
  store i32 1, i32* @"cur_h"
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"cur_w.1" = load i32, i32* @"cur_w"
  %"cur_h.1" = load i32, i32* @"cur_h"
  call void @"glViewport"(i32 0, i32 0, i32 %"cur_w.1", i32 %"cur_h.1")
  %"g_game_state" = load i32, i32* @"g_game_state"
  %".353" = icmp eq i32 %"g_game_state", 1
  br i1 %".353", label %"then.7", label %"else.7"
then.7:
  %"g_ball_x" = load float, float* @"g_ball_x"
  %".355" = fcmp olt float %"g_ball_x",              0x0
  br i1 %".355", label %"then.8", label %"else.8"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"g_game_state.1" = load i32, i32* @"g_game_state"
  %".363" = icmp eq i32 %"g_game_state.1", 1
  br i1 %".363", label %"then.9", label %"else.9"
then.8:
  %"cur_w.2" = load i32, i32* @"cur_w"
  %"cur_h.2" = load i32, i32* @"cur_h"
  call void @"ball_reset__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.2", i32 %"cur_h.2")
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  call void @"paddle_update__0__ret_voidE1"()
  call void @"cpu_paddle_update__0__ret_voidE1"()
  %"cur_w.3" = load i32, i32* @"cur_w"
  %"cur_h.3" = load i32, i32* @"cur_h"
  call void @"ball_update__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.3", i32 %"cur_h.3")
  call void @"vel_step__0__ret_voidE1"()
  call void @"dens_step__0__ret_voidE1"()
  call void @"dispatch_decay__0__ret_voidE1"()
  br label %"ifcont.7"
then.9:
  call void @"particles_update__0__ret_voidE1"()
  br label %"ifcont.9"
else.9:
  br label %"ifcont.9"
ifcont.9:
  call void @"upload_textures__0__ret_voidE1"()
  %"glActiveTexture_fp" = load void (i32)*, void (i32)** @"glActiveTexture_fp"
  %"GL_TEXTURE0" = load i32, i32* @"GL_TEXTURE0"
  call void %"glActiveTexture_fp"(i32 %"GL_TEXTURE0")
  %"GL_TEXTURE_2D.13" = load i32, i32* @"GL_TEXTURE_2D"
  %"tex_dens.2" = load i32, i32* %"tex_dens"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.13", i32 %"tex_dens.2")
  %"GL_TEXTURE_2D.14" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_LUMINANCE.2" = load i32, i32* @"GL_LUMINANCE"
  %"GL_FLOAT.2" = load i32, i32* @"GL_FLOAT"
  %"g_dens_tex.1" = load float*, float** @"g_dens_tex"
  %"to_void_ptr.7" = bitcast float* %"g_dens_tex.1" to i8*
  call void @"glTexSubImage2D"(i32 %"GL_TEXTURE_2D.14", i32 0, i32 0, i32 0, i32 256, i32 192, i32 %"GL_LUMINANCE.2", i32 %"GL_FLOAT.2", i8* %"to_void_ptr.7")
  %"glActiveTexture_fp.1" = load void (i32)*, void (i32)** @"glActiveTexture_fp"
  %"GL_TEXTURE1" = load i32, i32* @"GL_TEXTURE1"
  call void %"glActiveTexture_fp.1"(i32 %"GL_TEXTURE1")
  %"GL_TEXTURE_2D.15" = load i32, i32* @"GL_TEXTURE_2D"
  %"tex_vel.2" = load i32, i32* %"tex_vel"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.15", i32 %"tex_vel.2")
  %"GL_TEXTURE_2D.16" = load i32, i32* @"GL_TEXTURE_2D"
  %"GL_LUMINANCE_ALPHA.2" = load i32, i32* @"GL_LUMINANCE_ALPHA"
  %"GL_FLOAT.3" = load i32, i32* @"GL_FLOAT"
  %"g_vel_tex.1" = load float*, float** @"g_vel_tex"
  %"to_void_ptr.8" = bitcast float* %"g_vel_tex.1" to i8*
  call void @"glTexSubImage2D"(i32 %"GL_TEXTURE_2D.16", i32 0, i32 0, i32 0, i32 256, i32 192, i32 %"GL_LUMINANCE_ALPHA.2", i32 %"GL_FLOAT.3", i8* %"to_void_ptr.8")
  call void @"glClearColor"(float              0x0, float              0x0, float              0x0, float 0x3ff0000000000000)
  %"GL_COLOR_BUFFER_BIT" = load i32, i32* @"GL_COLOR_BUFFER_BIT"
  call void @"glClear"(i32 %"GL_COLOR_BUFFER_BIT")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND")
  %"GL_SRC_ALPHA" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE_MINUS_SRC_ALPHA" = load i32, i32* @"GL_ONE_MINUS_SRC_ALPHA"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA", i32 %"GL_ONE_MINUS_SRC_ALPHA")
  %"glUseProgram_fp" = load void (i32)*, void (i32)** @"glUseProgram_fp"
  %"prog.5" = load i32, i32* %"prog"
  call void %"glUseProgram_fp"(i32 %"prog.5")
  %"glUniform1i_fp" = load void (i32, i32)*, void (i32, i32)** @"glUniform1i_fp"
  %"u_dens.1" = load i32, i32* %"u_dens"
  call void %"glUniform1i_fp"(i32 %"u_dens.1", i32 0)
  %"glUniform1i_fp.1" = load void (i32, i32)*, void (i32, i32)** @"glUniform1i_fp"
  %"u_vel.1" = load i32, i32* %"u_vel"
  call void %"glUniform1i_fp.1"(i32 %"u_vel.1", i32 1)
  %"glUniform2f_fp" = load void (i32, float, float)*, void (i32, float, float)** @"glUniform2f_fp"
  %"u_res.1" = load i32, i32* %"u_res"
  %".375" = sitofp i32 256 to float
  %".376" = sitofp i32 192 to float
  call void %"glUniform2f_fp"(i32 %"u_res.1", float %".375", float %".376")
  %"glUniform1i_fp.2" = load void (i32, i32)*, void (i32, i32)** @"glUniform1i_fp"
  %"u_palette.1" = load i32, i32* %"u_palette"
  %"g_palette" = load i32, i32* @"g_palette"
  call void %"glUniform1i_fp.2"(i32 %"u_palette.1", i32 %"g_palette")
  %"GL_TRIANGLES" = load i32, i32* @"GL_TRIANGLES"
  call void @"glBegin"(i32 %"GL_TRIANGLES")
  call void @"glTexCoord2f"(float              0x0, float              0x0)
  %".379" = fsub float              0x0, 0x3ff0000000000000
  %".380" = fsub float              0x0, 0x3ff0000000000000
  call void @"glVertex2f"(float %".379", float %".380")
  call void @"glTexCoord2f"(float 0x4000000000000000, float              0x0)
  %".383" = fsub float              0x0, 0x3ff0000000000000
  call void @"glVertex2f"(float 0x4008000000000000, float %".383")
  call void @"glTexCoord2f"(float              0x0, float 0x4000000000000000)
  %".386" = fsub float              0x0, 0x3ff0000000000000
  call void @"glVertex2f"(float %".386", float 0x4008000000000000)
  call void @"glEnd"()
  %"glUseProgram_fp.1" = load void (i32)*, void (i32)** @"glUseProgram_fp"
  call void %"glUseProgram_fp.1"(i32 0)
  %"GL_BLEND.1" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.1")
  %"glActiveTexture_fp.2" = load void (i32)*, void (i32)** @"glActiveTexture_fp"
  %"GL_TEXTURE0.1" = load i32, i32* @"GL_TEXTURE0"
  call void %"glActiveTexture_fp.2"(i32 %"GL_TEXTURE0.1")
  %"GL_TEXTURE_2D.17" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.17", i32 0)
  %"glActiveTexture_fp.3" = load void (i32)*, void (i32)** @"glActiveTexture_fp"
  %"GL_TEXTURE1.1" = load i32, i32* @"GL_TEXTURE1"
  call void %"glActiveTexture_fp.3"(i32 %"GL_TEXTURE1.1")
  %"GL_TEXTURE_2D.18" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glBindTexture"(i32 %"GL_TEXTURE_2D.18", i32 0)
  %"glActiveTexture_fp.4" = load void (i32)*, void (i32)** @"glActiveTexture_fp"
  %"GL_TEXTURE0.2" = load i32, i32* @"GL_TEXTURE0"
  call void %"glActiveTexture_fp.4"(i32 %"GL_TEXTURE0.2")
  %"GL_TEXTURE_2D.19" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D.19")
  %"GL_DEPTH_TEST.1" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST.1")
  %"GL_BLEND.2" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND.2")
  %"GL_SRC_ALPHA.1" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE" = load i32, i32* @"GL_ONE"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA.1", i32 %"GL_ONE")
  %"float_to_double_rhs" = fpext float 0x4028000000000000 to double
  %".396" = fdiv double 0x401921fb54442eea, %"float_to_double_rhs"
  %"f64_to_f32" = fptrunc double %".396" to float
  store float %"f64_to_f32", float* %"step_a"
  store i32 0, i32* %"i"
  br label %"for.cond.1"
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".400" = icmp slt i32 %"i.1", 7500
  br i1 %".400", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"g_part_x" = load float*, float** @"g_part_x"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds float, float* %"g_part_x", i32 %"i.2"
  %"ptr_load" = load float, float* %"ptr_gep"
  store float %"ptr_load", float* %"px"
  %"g_part_y" = load float*, float** @"g_part_y"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds float, float* %"g_part_y", i32 %"i.3"
  %"ptr_load.1" = load float, float* %"ptr_gep.1"
  store float %"ptr_load.1", float* %"py"
  %"g_dens" = load double*, double** @"g_dens"
  %"py.1" = load float, float* %"py"
  %".404" = fptosi float %"py.1" to i32
  %".405" = mul i32 %".404", 256
  %"px.1" = load float, float* %"px"
  %".406" = fptosi float %"px.1" to i32
  %".407" = add i32 %".405", %".406"
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_dens", i32 %".407"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".408" = fptrunc double %"ptr_load.2" to float
  store float %".408", float* %"dens_val"
  %"dens_val.1" = load float, float* %"dens_val"
  %".410" = fcmp ogt float %"dens_val.1", 0x4020000000000000
  br i1 %".410", label %"then.10", label %"else.10"
for.update.1:
  %"i.4" = load i32, i32* %"i"
  %".465" = add i32 %"i.4", 1
  store i32 %".465", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  %"GL_BLEND.3" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.3")
  %"GL_TEXTURE_2D.20" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.20")
  %"g_game_state.2" = load i32, i32* @"g_game_state"
  %".470" = icmp eq i32 %"g_game_state.2", 1
  br i1 %".470", label %"then.12", label %"else.12"
then.10:
  %"dens_val.2" = load float, float* %"dens_val"
  %".412" = fmul float %"dens_val.2", 0x3f926e9780000000
  %".413" = fadd float 0x3ff8000000000000, %".412"
  store float %".413", float* %"pr"
  %"pr.1" = load float, float* %"pr"
  %".415" = fcmp ogt float %"pr.1", 0x4016000000000000
  br i1 %".415", label %"then.11", label %"else.11"
else.10:
  br label %"ifcont.10"
ifcont.10:
  br label %"for.update.1"
then.11:
  store float 0x4016000000000000, float* %"pr"
  br label %"ifcont.11"
else.11:
  br label %"ifcont.11"
ifcont.11:
  %"px.2" = load float, float* %"px"
  %".420" = sitofp i32 256 to float
  %".421" = fdiv float %"px.2", %".420"
  %".422" = fmul float %".421", 0x4000000000000000
  %".423" = fsub float %".422", 0x3ff0000000000000
  store float %".423", float* %"ndcx"
  %"py.2" = load float, float* %"py"
  %".425" = sitofp i32 192 to float
  %".426" = fdiv float %"py.2", %".425"
  %".427" = fmul float %".426", 0x4000000000000000
  %".428" = fsub float %".427", 0x3ff0000000000000
  store float %".428", float* %"ndcy"
  %"pr.2" = load float, float* %"pr"
  %".430" = fmul float %"pr.2", 0x4000000000000000
  %"cur_w.4" = load i32, i32* @"cur_w"
  %".431" = sitofp i32 %"cur_w.4" to float
  %".432" = fdiv float %".430", %".431"
  store float %".432", float* %"ox"
  %"pr.3" = load float, float* %"pr"
  %".434" = fmul float %"pr.3", 0x4000000000000000
  %"cur_h.4" = load i32, i32* @"cur_h"
  %".435" = sitofp i32 %"cur_h.4" to float
  %".436" = fdiv float %".434", %".435"
  store float %".436", float* %"oy"
  %"GL_TRIANGLE_FAN" = load i32, i32* @"GL_TRIANGLE_FAN"
  call void @"glBegin"(i32 %"GL_TRIANGLE_FAN")
  call void @"glColor4f"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3fe19999a0000000)
  %"ndcx.1" = load float, float* %"ndcx"
  %"ndcy.1" = load float, float* %"ndcy"
  call void @"glVertex2f"(float %"ndcx.1", float %"ndcy.1")
  call void @"glColor4f"(float 0x3fe19999a0000000, float 0x3fe8000000000000, float 0x3ff0000000000000, float              0x0)
  store i32 0, i32* %"seg"
  br label %"while.cond.2"
while.cond.2:
  %"seg.1" = load i32, i32* %"seg"
  %".444" = icmp sle i32 %"seg.1", 12
  br i1 %".444", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"seg.2" = load i32, i32* %"seg"
  %".446" = sitofp i32 %"seg.2" to float
  %"step_a.1" = load float, float* %"step_a"
  %".447" = fmul float %".446", %"step_a.1"
  store float %".447", float* %"angle"
  %"ndcx.2" = load float, float* %"ndcx"
  %"ox.1" = load float, float* %"ox"
  %"angle.1" = load float, float* %"angle"
  %".449" = call float @"standard__math__cos__1__floatE1__ret_floatE1"(float %"angle.1")
  %".450" = fmul float %"ox.1", %".449"
  %".451" = fadd float %"ndcx.2", %".450"
  store float %".451", float* %"fx"
  %"ndcy.2" = load float, float* %"ndcy"
  %"oy.1" = load float, float* %"oy"
  %"angle.2" = load float, float* %"angle"
  %".453" = call float @"standard__math__sin__1__floatE1__ret_floatE1"(float %"angle.2")
  %".454" = fmul float %"oy.1", %".453"
  %".455" = fadd float %"ndcy.2", %".454"
  store float %".455", float* %"fy"
  %"fx.1" = load float, float* %"fx"
  %"fy.1" = load float, float* %"fy"
  call void @"glVertex2f"(float %"fx.1", float %"fy.1")
  %"seg.3" = load i32, i32* %"seg"
  %".458" = add i32 %"seg.3", 1
  store i32 %".458", i32* %"seg"
  br label %"while.cond.2"
while.end.2:
  call void @"glEnd"()
  br label %"ifcont.10"
then.12:
  %"cur_w.5" = load i32, i32* @"cur_w"
  %"cur_h.5" = load i32, i32* @"cur_h"
  %"g_paddle_gy" = load i32, i32* @"g_paddle_gy"
  call void @"draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1"(i32 %"cur_w.5", i32 %"cur_h.5", i32 4, i32 %"g_paddle_gy")
  %"cur_w.6" = load i32, i32* @"cur_w"
  %"cur_h.6" = load i32, i32* @"cur_h"
  %".473" = sub i32 256, 6
  %"g_cpu_paddle_gy" = load i32, i32* @"g_cpu_paddle_gy"
  call void @"draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1"(i32 %"cur_w.6", i32 %"cur_h.6", i32 %".473", i32 %"g_cpu_paddle_gy")
  %"cur_w.7" = load i32, i32* @"cur_w"
  %"cur_h.7" = load i32, i32* @"cur_h"
  call void @"draw_ball__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.7", i32 %"cur_h.7")
  %"cur_w.8" = load i32, i32* @"cur_w"
  %"cur_h.8" = load i32, i32* @"cur_h"
  call void @"draw_hud__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.8", i32 %"cur_h.8")
  br label %"ifcont.12"
else.12:
  br label %"ifcont.12"
ifcont.12:
  %"g_game_state.3" = load i32, i32* @"g_game_state"
  %".479" = icmp eq i32 %"g_game_state.3", 0
  br i1 %".479", label %"then.13", label %"else.13"
then.13:
  %"cur_w.9" = load i32, i32* @"cur_w"
  %"cur_h.9" = load i32, i32* @"cur_h"
  call void @"draw_gui__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.9", i32 %"cur_h.9")
  br label %"ifcont.13"
else.13:
  br label %"ifcont.13"
ifcont.13:
  %"g_game_state.4" = load i32, i32* @"g_game_state"
  %".484" = icmp eq i32 %"g_game_state.4", 2
  br i1 %".484", label %"then.14", label %"else.14"
then.14:
  %"cur_w.10" = load i32, i32* @"cur_w"
  %"cur_h.10" = load i32, i32* @"cur_h"
  call void @"draw_quit_dialog__2__intE1__intE1__ret_voidE1"(i32 %"cur_w.10", i32 %"cur_h.10")
  br label %"ifcont.14"
else.14:
  br label %"ifcont.14"
ifcont.14:
  call void @"OpenGL__GLContext.present__0__ret_voidE1"(%"OpenGL__GLContext"* %"gl")
  br label %"while.cond"
for.cond.2:
  %"t.19" = load i32, i32* %"t"
  %"g_num_threads.6" = load i32, i32* @"g_num_threads"
  %".493" = icmp slt i32 %"t.19", %"g_num_threads.6"
  br i1 %".493", label %"for.body.2", label %"for.end.2"
for.body.2:
  %"PHASE_EXIT" = load i32, i32* @"PHASE_EXIT"
  %"t.20" = load i32, i32* %"t"
  %"array_gep.6" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.20"
  %".495" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.6", i32 0, i32 2
  store i32 %"PHASE_EXIT", i32* %".495"
  %"PHASE_EXIT.1" = load i32, i32* @"PHASE_EXIT"
  %"t.21" = load i32, i32* %"t"
  %"array_gep.7" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.21"
  %".497" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.7", i32 0, i32 2
  store i32 %"PHASE_EXIT.1", i32* %".497"
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem2")
  br label %"for.update.2"
for.update.2:
  %"t.22" = load i32, i32* %"t"
  %".502" = add i32 %"t.22", 1
  store i32 %".502", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  store i32 0, i32* %"t"
  br label %"for.cond.3"
for.cond.3:
  %"t.23" = load i32, i32* %"t"
  %"g_num_threads.7" = load i32, i32* @"g_num_threads"
  %".507" = icmp slt i32 %"t.23", %"g_num_threads.7"
  br i1 %".507", label %"for.body.3", label %"for.end.3"
for.body.3:
  %"t.24" = load i32, i32* %"t"
  %".509" = getelementptr inbounds [64 x %"Thread"], [64 x %"Thread"]* @"g_threads", i32 0, i32 %"t.24"
  %".510" = call i32 @"standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1"(%"Thread"* %".509")
  %"t.25" = load i32, i32* %"t"
  %".511" = getelementptr inbounds [64 x %"Thread"], [64 x %"Thread"]* @"g_threads2", i32 0, i32 %"t.25"
  %".512" = call i32 @"standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1"(%"Thread"* %".511")
  br label %"for.update.3"
for.update.3:
  %"t.26" = load i32, i32* %"t"
  %".514" = add i32 %"t.26", 1
  store i32 %".514", i32* %"t"
  br label %"for.cond.3"
for.end.3:
  call void @"standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  call void @"standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  call void @"standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem2")
  call void @"standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem2")
  %"glDeleteShader_fp" = load void (i32)*, void (i32)** @"glDeleteShader_fp"
  %"vert_sh.2" = load i32, i32* %"vert_sh"
  call void %"glDeleteShader_fp"(i32 %"vert_sh.2")
  %"glDeleteShader_fp.1" = load void (i32)*, void (i32)** @"glDeleteShader_fp"
  %"frag_sh.2" = load i32, i32* %"frag_sh"
  call void %"glDeleteShader_fp.1"(i32 %"frag_sh.2")
  %"glDeleteProgram_fp" = load void (i32)*, void (i32)** @"glDeleteProgram_fp"
  %"prog.6" = load i32, i32* %"prog"
  call void %"glDeleteProgram_fp"(i32 %"prog.6")
  call void @"glDeleteTextures"(i32 1, i32* %"tex_dens")
  call void @"glDeleteTextures"(i32 1, i32* %"tex_vel")
  call void @"OpenGL__GLContext.__exit__0__ret_voidE1"(%"OpenGL__GLContext"* %"gl")
  %"hwnd.5" = load i64, i64* %"hwnd"
  %"hdc.3" = load i64, i64* %"hdc"
  %".524" = call i32 @"ReleaseDC"(i64 %"hwnd.5", i64 %"hdc.3")
  %"class_name.3" = load i8*, i8** %"class_name"
  %"hInstance.3" = load i64, i64* %"hInstance"
  %".525" = call i1 @"UnregisterClassA"(i8* %"class_name.3", i64 %"hInstance.3")
  %"g_part_y.1" = load float*, float** @"g_part_y"
  %"ptr_to_int" = ptrtoint float* %"g_part_y.1" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int")
  %"g_part_x.1" = load float*, float** @"g_part_x"
  %"ptr_to_int.1" = ptrtoint float* %"g_part_x.1" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.1")
  %"g_vel_tex.2" = load float*, float** @"g_vel_tex"
  %"ptr_to_int.2" = ptrtoint float* %"g_vel_tex.2" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.2")
  %"g_dens_tex.2" = load float*, float** @"g_dens_tex"
  %"ptr_to_int.3" = ptrtoint float* %"g_dens_tex.2" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.3")
  %"g_vy_prev" = load double*, double** @"g_vy_prev"
  %"ptr_to_int.4" = ptrtoint double* %"g_vy_prev" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.4")
  %"g_vx_prev" = load double*, double** @"g_vx_prev"
  %"ptr_to_int.5" = ptrtoint double* %"g_vx_prev" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.5")
  %"g_vy" = load double*, double** @"g_vy"
  %"ptr_to_int.6" = ptrtoint double* %"g_vy" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.6")
  %"g_vx" = load double*, double** @"g_vx"
  %"ptr_to_int.7" = ptrtoint double* %"g_vx" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.7")
  %"g_dens_prev" = load double*, double** @"g_dens_prev"
  %"ptr_to_int.8" = ptrtoint double* %"g_dens_prev" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.8")
  %"g_dens.1" = load double*, double** @"g_dens"
  %"ptr_to_int.9" = ptrtoint double* %"g_dens.1" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.9")
  ret i32 0
}

define i32 @"main__2__intE1__byteE1_ptr2__ret_intE1"(i32 %".1", i8** %".2")
{
entry:
  %".4" = call i32 @"main__0__ret_intE1"()
  ret i32 %".4"
}

define i32 @"FRTStartup"()
{
entry:
  %"return_code" = alloca i32
  store i32 0, i32* %"return_code"
  %"argc" = alloca i32
  store i32 0, i32* %"argc"
  %"argi" = alloca i32
  store i32 0, i32* %"argi"
  %"pos" = alloca i32
  store i32 0, i32* %"pos"
  %"start" = alloca i32
  store i32 0, i32* %"start"
  %"len" = alloca i32
  store i32 0, i32* %"len"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"k" = alloca i32
  store i32 0, i32* %"k"
  %"arg" = alloca i8*
  store i8* null, i8** %"arg"
  %"argv" = alloca i8**
  store i8** null, i8*** %"argv"
  %"quoted" = alloca i1
  store i1 0, i1* %"quoted"
  %"cmdLine" = alloca i16*
  store i16* null, i16** %"cmdLine"
  %"op_overload_result" = call i64 @"standard__system__cpu__l2_bytes__0__ret_ulongE1"()
  store i64 %"op_overload_result", i64* @"nt_threshold"
  %"op_overload_result.1" = call i1 @"standard__system__cpu__ermsb__0__ret_boolE1"()
  store i1 %"op_overload_result.1", i1* @"ermsb"
  %".16" = sub i32 0, 11
  %".17" = call i64 @"GetStdHandle"(i32 %".16")
  store i64 %".17", i64* @"WIN_STDOUT_HANDLE"
  %"op_overload_result.2" = call i1 @"standard__memory__allocators__stdheap__table_init__0__ret_boolE1"()
  %".19" = call i16* @"GetCommandLineW"()
  store i16* %".19", i16** %"cmdLine"
  br label %"while.cond"
while.cond:
  %"cmdLine.1" = load i16*, i16** %"cmdLine"
  %"pos.1" = load i32, i32* %"pos"
  %"ptr_gep" = getelementptr inbounds i16, i16* %"cmdLine.1", i32 %"pos.1"
  %"ptr_load" = load i16, i16* %"ptr_gep"
  %".22" = trunc i32 0 to i16
  %".23" = icmp ne i16 %"ptr_load", %".22"
  br i1 %".23", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond.1"
while.end:
  %"argc.2" = load i32, i32* %"argc"
  %".84" = zext i32 %"argc.2" to i64
  %".85" = sext i32 8 to i64
  %".86" = mul i64 %".84", %".85"
  %".87" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".86")
  %"int_to_ptr" = inttoptr i64 %".87" to i8**
  store i8** %"int_to_ptr", i8*** %"argv"
  store i32 0, i32* %"argi"
  store i32 0, i32* %"pos"
  br label %"while.cond.4"
while.cond.1:
  %"cmdLine.2" = load i16*, i16** %"cmdLine"
  %"pos.2" = load i32, i32* %"pos"
  %"ptr_gep.1" = getelementptr inbounds i16, i16* %"cmdLine.2", i32 %"pos.2"
  %"ptr_load.1" = load i16, i16* %"ptr_gep.1"
  %".26" = trunc i32 32 to i16
  %".27" = icmp eq i16 %"ptr_load.1", %".26"
  br i1 %".27", label %"sc_end", label %"sc_rhs"
while.body.1:
  %"pos.4" = load i32, i32* %"pos"
  %".33" = add i32 %"pos.4", 1
  store i32 %".33", i32* %"pos"
  br label %"while.cond.1"
while.end.1:
  %"cmdLine.4" = load i16*, i16** %"cmdLine"
  %"pos.5" = load i32, i32* %"pos"
  %"ptr_gep.3" = getelementptr inbounds i16, i16* %"cmdLine.4", i32 %"pos.5"
  %"ptr_load.3" = load i16, i16* %"ptr_gep.3"
  %".36" = trunc i32 0 to i16
  %".37" = icmp eq i16 %"ptr_load.3", %".36"
  br i1 %".37", label %"then", label %"else"
sc_rhs:
  %"cmdLine.3" = load i16*, i16** %"cmdLine"
  %"pos.3" = load i32, i32* %"pos"
  %"ptr_gep.2" = getelementptr inbounds i16, i16* %"cmdLine.3", i32 %"pos.3"
  %"ptr_load.2" = load i16, i16* %"ptr_gep.2"
  %".29" = trunc i32 9 to i16
  %".30" = icmp eq i16 %"ptr_load.2", %".29"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"while.cond.1"], [%".30", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body.1", label %"while.end.1"
then:
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"cmdLine.5" = load i16*, i16** %"cmdLine"
  %"pos.6" = load i32, i32* %"pos"
  %"ptr_gep.4" = getelementptr inbounds i16, i16* %"cmdLine.5", i32 %"pos.6"
  %"ptr_load.4" = load i16, i16* %"ptr_gep.4"
  %".41" = trunc i32 34 to i16
  %".42" = icmp eq i16 %"ptr_load.4", %".41"
  br i1 %".42", label %"then.1", label %"else.1"
then.1:
  %"pos.7" = load i32, i32* %"pos"
  %".44" = add i32 %"pos.7", 1
  store i32 %".44", i32* %"pos"
  br label %"while.cond.2"
else.1:
  br label %"while.cond.3"
ifcont.1:
  %"argc.1" = load i32, i32* %"argc"
  %".81" = add i32 %"argc.1", 1
  store i32 %".81", i32* %"argc"
  br label %"while.cond"
while.cond.2:
  %"cmdLine.6" = load i16*, i16** %"cmdLine"
  %"pos.8" = load i32, i32* %"pos"
  %"ptr_gep.5" = getelementptr inbounds i16, i16* %"cmdLine.6", i32 %"pos.8"
  %"ptr_load.5" = load i16, i16* %"ptr_gep.5"
  %".47" = trunc i32 0 to i16
  %".48" = icmp ne i16 %"ptr_load.5", %".47"
  br i1 %".48", label %"sc_rhs.1", label %"sc_end.1"
while.body.2:
  %"pos.10" = load i32, i32* %"pos"
  %".54" = add i32 %"pos.10", 1
  store i32 %".54", i32* %"pos"
  br label %"while.cond.2"
while.end.2:
  %"cmdLine.8" = load i16*, i16** %"cmdLine"
  %"pos.11" = load i32, i32* %"pos"
  %"ptr_gep.7" = getelementptr inbounds i16, i16* %"cmdLine.8", i32 %"pos.11"
  %"ptr_load.7" = load i16, i16* %"ptr_gep.7"
  %".57" = trunc i32 34 to i16
  %".58" = icmp eq i16 %"ptr_load.7", %".57"
  br i1 %".58", label %"then.2", label %"else.2"
sc_rhs.1:
  %"cmdLine.7" = load i16*, i16** %"cmdLine"
  %"pos.9" = load i32, i32* %"pos"
  %"ptr_gep.6" = getelementptr inbounds i16, i16* %"cmdLine.7", i32 %"pos.9"
  %"ptr_load.6" = load i16, i16* %"ptr_gep.6"
  %".50" = trunc i32 34 to i16
  %".51" = icmp ne i16 %"ptr_load.6", %".50"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [0, %"while.cond.2"], [%".51", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"while.body.2", label %"while.end.2"
then.2:
  %"pos.12" = load i32, i32* %"pos"
  %".60" = add i32 %"pos.12", 1
  store i32 %".60", i32* %"pos"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"ifcont.1"
while.cond.3:
  %"cmdLine.9" = load i16*, i16** %"cmdLine"
  %"pos.13" = load i32, i32* %"pos"
  %"ptr_gep.8" = getelementptr inbounds i16, i16* %"cmdLine.9", i32 %"pos.13"
  %"ptr_load.8" = load i16, i16* %"ptr_gep.8"
  %".66" = trunc i32 0 to i16
  %".67" = icmp ne i16 %"ptr_load.8", %".66"
  br i1 %".67", label %"sc_rhs.2", label %"sc_end.2"
while.body.3:
  %"pos.16" = load i32, i32* %"pos"
  %".77" = add i32 %"pos.16", 1
  store i32 %".77", i32* %"pos"
  br label %"while.cond.3"
while.end.3:
  br label %"ifcont.1"
sc_rhs.2:
  %"cmdLine.10" = load i16*, i16** %"cmdLine"
  %"pos.14" = load i32, i32* %"pos"
  %"ptr_gep.9" = getelementptr inbounds i16, i16* %"cmdLine.10", i32 %"pos.14"
  %"ptr_load.9" = load i16, i16* %"ptr_gep.9"
  %".69" = trunc i32 32 to i16
  %".70" = icmp ne i16 %"ptr_load.9", %".69"
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [0, %"while.cond.3"], [%".70", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"sc_rhs.3", label %"sc_end.3"
sc_rhs.3:
  %"cmdLine.11" = load i16*, i16** %"cmdLine"
  %"pos.15" = load i32, i32* %"pos"
  %"ptr_gep.10" = getelementptr inbounds i16, i16* %"cmdLine.11", i32 %"pos.15"
  %"ptr_load.10" = load i16, i16* %"ptr_gep.10"
  %".73" = trunc i32 9 to i16
  %".74" = icmp ne i16 %"ptr_load.10", %".73"
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"sc_end.2"], [%".74", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"while.body.3", label %"while.end.3"
while.cond.4:
  %"cmdLine.12" = load i16*, i16** %"cmdLine"
  %"pos.17" = load i32, i32* %"pos"
  %"ptr_gep.11" = getelementptr inbounds i16, i16* %"cmdLine.12", i32 %"pos.17"
  %"ptr_load.11" = load i16, i16* %"ptr_gep.11"
  %".92" = trunc i32 0 to i16
  %".93" = icmp ne i16 %"ptr_load.11", %".92"
  br i1 %".93", label %"while.body.4", label %"while.end.4"
while.body.4:
  br label %"while.cond.5"
while.end.4:
  %"argc.3" = load i32, i32* %"argc"
  %".183" = icmp sgt i32 %"argc.3", 1
  br i1 %".183", label %"then.6", label %"else.6"
while.cond.5:
  %"cmdLine.13" = load i16*, i16** %"cmdLine"
  %"pos.18" = load i32, i32* %"pos"
  %"ptr_gep.12" = getelementptr inbounds i16, i16* %"cmdLine.13", i32 %"pos.18"
  %"ptr_load.12" = load i16, i16* %"ptr_gep.12"
  %".96" = trunc i32 32 to i16
  %".97" = icmp eq i16 %"ptr_load.12", %".96"
  br i1 %".97", label %"sc_end.4", label %"sc_rhs.4"
while.body.5:
  %"pos.20" = load i32, i32* %"pos"
  %".103" = add i32 %"pos.20", 1
  store i32 %".103", i32* %"pos"
  br label %"while.cond.5"
while.end.5:
  %"cmdLine.15" = load i16*, i16** %"cmdLine"
  %"pos.21" = load i32, i32* %"pos"
  %"ptr_gep.14" = getelementptr inbounds i16, i16* %"cmdLine.15", i32 %"pos.21"
  %"ptr_load.14" = load i16, i16* %"ptr_gep.14"
  %".106" = trunc i32 0 to i16
  %".107" = icmp eq i16 %"ptr_load.14", %".106"
  br i1 %".107", label %"then.3", label %"else.3"
sc_rhs.4:
  %"cmdLine.14" = load i16*, i16** %"cmdLine"
  %"pos.19" = load i32, i32* %"pos"
  %"ptr_gep.13" = getelementptr inbounds i16, i16* %"cmdLine.14", i32 %"pos.19"
  %"ptr_load.13" = load i16, i16* %"ptr_gep.13"
  %".99" = trunc i32 9 to i16
  %".100" = icmp eq i16 %"ptr_load.13", %".99"
  br label %"sc_end.4"
sc_end.4:
  %"sc_result.4" = phi  i1 [1, %"while.cond.5"], [%".100", %"sc_rhs.4"]
  br i1 %"sc_result.4", label %"while.body.5", label %"while.end.5"
then.3:
  br label %"while.end.4"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"pos.22" = load i32, i32* %"pos"
  store i32 %"pos.22", i32* %"start"
  store i32 0, i32* %"len"
  %"cmdLine.16" = load i16*, i16** %"cmdLine"
  %"pos.23" = load i32, i32* %"pos"
  %"ptr_gep.15" = getelementptr inbounds i16, i16* %"cmdLine.16", i32 %"pos.23"
  %"ptr_load.15" = load i16, i16* %"ptr_gep.15"
  %".113" = trunc i32 34 to i16
  %".114" = icmp eq i16 %"ptr_load.15", %".113"
  br i1 %".114", label %"then.4", label %"else.4"
then.4:
  store i1 true, i1* %"quoted"
  %"pos.24" = load i32, i32* %"pos"
  %".117" = add i32 %"pos.24", 1
  store i32 %".117", i32* %"pos"
  %"pos.25" = load i32, i32* %"pos"
  store i32 %"pos.25", i32* %"start"
  br label %"while.cond.6"
else.4:
  br label %"while.cond.7"
ifcont.4:
  %"len.3" = load i32, i32* %"len"
  %".159" = zext i32 %"len.3" to i64
  %".160" = sext i32 1 to i64
  %".161" = add i64 %".159", %".160"
  %".162" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".161")
  %"int_to_ptr.1" = inttoptr i64 %".162" to i8*
  store i8* %"int_to_ptr.1", i8** %"arg"
  store i32 0, i32* %"j"
  br label %"while.cond.8"
while.cond.6:
  %"cmdLine.17" = load i16*, i16** %"cmdLine"
  %"pos.26" = load i32, i32* %"pos"
  %"ptr_gep.16" = getelementptr inbounds i16, i16* %"cmdLine.17", i32 %"pos.26"
  %"ptr_load.16" = load i16, i16* %"ptr_gep.16"
  %".121" = trunc i32 0 to i16
  %".122" = icmp ne i16 %"ptr_load.16", %".121"
  br i1 %".122", label %"sc_rhs.5", label %"sc_end.5"
while.body.6:
  %"len.1" = load i32, i32* %"len"
  %".128" = add i32 %"len.1", 1
  store i32 %".128", i32* %"len"
  %"pos.28" = load i32, i32* %"pos"
  %".130" = add i32 %"pos.28", 1
  store i32 %".130", i32* %"pos"
  br label %"while.cond.6"
while.end.6:
  %"cmdLine.19" = load i16*, i16** %"cmdLine"
  %"pos.29" = load i32, i32* %"pos"
  %"ptr_gep.18" = getelementptr inbounds i16, i16* %"cmdLine.19", i32 %"pos.29"
  %"ptr_load.18" = load i16, i16* %"ptr_gep.18"
  %".133" = trunc i32 34 to i16
  %".134" = icmp eq i16 %"ptr_load.18", %".133"
  br i1 %".134", label %"then.5", label %"else.5"
sc_rhs.5:
  %"cmdLine.18" = load i16*, i16** %"cmdLine"
  %"pos.27" = load i32, i32* %"pos"
  %"ptr_gep.17" = getelementptr inbounds i16, i16* %"cmdLine.18", i32 %"pos.27"
  %"ptr_load.17" = load i16, i16* %"ptr_gep.17"
  %".124" = trunc i32 34 to i16
  %".125" = icmp ne i16 %"ptr_load.17", %".124"
  br label %"sc_end.5"
sc_end.5:
  %"sc_result.5" = phi  i1 [0, %"while.cond.6"], [%".125", %"sc_rhs.5"]
  br i1 %"sc_result.5", label %"while.body.6", label %"while.end.6"
then.5:
  %"pos.30" = load i32, i32* %"pos"
  %".136" = add i32 %"pos.30", 1
  store i32 %".136", i32* %"pos"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  br label %"ifcont.4"
while.cond.7:
  %"cmdLine.20" = load i16*, i16** %"cmdLine"
  %"pos.31" = load i32, i32* %"pos"
  %"ptr_gep.19" = getelementptr inbounds i16, i16* %"cmdLine.20", i32 %"pos.31"
  %"ptr_load.19" = load i16, i16* %"ptr_gep.19"
  %".142" = trunc i32 0 to i16
  %".143" = icmp ne i16 %"ptr_load.19", %".142"
  br i1 %".143", label %"sc_rhs.6", label %"sc_end.6"
while.body.7:
  %"len.2" = load i32, i32* %"len"
  %".153" = add i32 %"len.2", 1
  store i32 %".153", i32* %"len"
  %"pos.34" = load i32, i32* %"pos"
  %".155" = add i32 %"pos.34", 1
  store i32 %".155", i32* %"pos"
  br label %"while.cond.7"
while.end.7:
  br label %"ifcont.4"
sc_rhs.6:
  %"cmdLine.21" = load i16*, i16** %"cmdLine"
  %"pos.32" = load i32, i32* %"pos"
  %"ptr_gep.20" = getelementptr inbounds i16, i16* %"cmdLine.21", i32 %"pos.32"
  %"ptr_load.20" = load i16, i16* %"ptr_gep.20"
  %".145" = trunc i32 32 to i16
  %".146" = icmp ne i16 %"ptr_load.20", %".145"
  br label %"sc_end.6"
sc_end.6:
  %"sc_result.6" = phi  i1 [0, %"while.cond.7"], [%".146", %"sc_rhs.6"]
  br i1 %"sc_result.6", label %"sc_rhs.7", label %"sc_end.7"
sc_rhs.7:
  %"cmdLine.22" = load i16*, i16** %"cmdLine"
  %"pos.33" = load i32, i32* %"pos"
  %"ptr_gep.21" = getelementptr inbounds i16, i16* %"cmdLine.22", i32 %"pos.33"
  %"ptr_load.21" = load i16, i16* %"ptr_gep.21"
  %".149" = trunc i32 9 to i16
  %".150" = icmp ne i16 %"ptr_load.21", %".149"
  br label %"sc_end.7"
sc_end.7:
  %"sc_result.7" = phi  i1 [0, %"sc_end.6"], [%".150", %"sc_rhs.7"]
  br i1 %"sc_result.7", label %"while.body.7", label %"while.end.7"
while.cond.8:
  %"j.1" = load i32, i32* %"j"
  %"len.4" = load i32, i32* %"len"
  %".166" = icmp slt i32 %"j.1", %"len.4"
  br i1 %".166", label %"while.body.8", label %"while.end.8"
while.body.8:
  %"cmdLine.23" = load i16*, i16** %"cmdLine"
  %"start.1" = load i32, i32* %"start"
  %"j.2" = load i32, i32* %"j"
  %".168" = add i32 %"start.1", %"j.2"
  %"ptr_gep.22" = getelementptr inbounds i16, i16* %"cmdLine.23", i32 %".168"
  %"ptr_load.22" = load i16, i16* %"ptr_gep.22"
  %".169" = trunc i16 %"ptr_load.22" to i8
  %"arg.1" = load i8*, i8** %"arg"
  %"j.3" = load i32, i32* %"j"
  %".170" = getelementptr inbounds i8, i8* %"arg.1", i32 %"j.3"
  store i8 %".169", i8* %".170"
  %"j.4" = load i32, i32* %"j"
  %".172" = add i32 %"j.4", 1
  store i32 %".172", i32* %"j"
  br label %"while.cond.8"
while.end.8:
  %".175" = trunc i32 0 to i8
  %"arg.2" = load i8*, i8** %"arg"
  %"len.5" = load i32, i32* %"len"
  %".176" = getelementptr inbounds i8, i8* %"arg.2", i32 %"len.5"
  store i8 %".175", i8* %".176"
  %"arg.3" = load i8*, i8** %"arg"
  %"argv.1" = load i8**, i8*** %"argv"
  %"argi.1" = load i32, i32* %"argi"
  %".178" = getelementptr inbounds i8*, i8** %"argv.1", i32 %"argi.1"
  store i8* %"arg.3", i8** %".178"
  %"argi.2" = load i32, i32* %"argi"
  %".180" = add i32 %"argi.2", 1
  store i32 %".180", i32* %"argi"
  br label %"while.cond.4"
then.6:
  %"argc.4" = load i32, i32* %"argc"
  %"argv.2" = load i8**, i8*** %"argv"
  %".185" = call i32 @"main__2__intE1__byteE1_ptr2__ret_intE1"(i32 %"argc.4", i8** %"argv.2")
  store i32 %".185", i32* %"return_code"
  br label %"ifcont.6"
else.6:
  %"op_overload_result.3" = call i32 @"main__0__ret_intE1"()
  store i32 %"op_overload_result.3", i32* %"return_code"
  br label %"ifcont.6"
ifcont.6:
  br label %"while.cond.9"
while.cond.9:
  %"k.1" = load i32, i32* %"k"
  %"argc.5" = load i32, i32* %"argc"
  %".191" = icmp slt i32 %"k.1", %"argc.5"
  br i1 %".191", label %"while.body.9", label %"while.end.9"
while.body.9:
  %"argv.3" = load i8**, i8*** %"argv"
  %"k.2" = load i32, i32* %"k"
  %"ptr_gep.23" = getelementptr inbounds i8*, i8** %"argv.3", i32 %"k.2"
  %"ptr_load.23" = load i8*, i8** %"ptr_gep.23"
  %"ptr_to_int" = ptrtoint i8* %"ptr_load.23" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int")
  %"k.3" = load i32, i32* %"k"
  %".194" = add i32 %"k.3", 1
  store i32 %".194", i32* %"k"
  br label %"while.cond.9"
while.end.9:
  %"return_code.1" = load i32, i32* %"return_code"
  %".197" = icmp ne i32 %"return_code.1", 0
  br i1 %".197", label %"then.7", label %"else.7"
then.7:
  %"return_code.2" = load i32, i32* %"return_code"
  %".199" = sub i32 0, 1073741819
  %".200" = icmp eq i32 %"return_code.2", %".199"
  br i1 %".200", label %"then.8", label %"else.8"
else.7:
  br label %"ifcont.7"
ifcont.7:
  call void @"standard__io__console__flush__0__ret_voidE1"()
  %"return_code.3" = load i32, i32* %"return_code"
  call void @"RtlExitUserProcess"(i32 %"return_code.3")
  %"return_code.4" = load i32, i32* %"return_code"
  %"argv.4" = load i8**, i8*** %"argv"
  %"ptr_to_int.1" = ptrtoint i8** %"argv.4" to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr_to_int.1")
  ret i32 %"return_code.4"
then.8:
  %"str_stack" = alloca [10 x i8]
  %"str_char_0" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 0
  store i8 83, i8* %"str_char_0"
  %"str_char_1" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 1
  store i8 69, i8* %"str_char_1"
  %"str_char_2" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 2
  store i8 71, i8* %"str_char_2"
  %"str_char_3" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 3
  store i8 70, i8* %"str_char_3"
  %"str_char_4" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 4
  store i8 65, i8* %"str_char_4"
  %"str_char_5" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 5
  store i8 85, i8* %"str_char_5"
  %"str_char_6" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 6
  store i8 76, i8* %"str_char_6"
  %"str_char_7" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 7
  store i8 84, i8* %"str_char_7"
  %"str_char_8" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 8
  store i8 10, i8* %"str_char_8"
  %"str_char_9" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 9
  store i8 0, i8* %"str_char_9"
  %"arg0_decay" = getelementptr [10 x i8], [10 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  br label %"ifcont.7"
}

define void @"__chkstk"() naked noinline noreturn
{
entry:
  call void asm sideeffect "subq $$16, %rsp
        movq %r10, (%rsp)
        movq %r11, 8(%rsp)
        xorq %r11, %r11
        leaq 24(%rsp), %r10
        subq %rax, %r10
        cmovbq %r11, %r10
        movq %gs:16, %r11
        cmpq %r11, %r10
        jae .Lchkstk_done
        andw $$-4096, %r10w
    .Lchkstk_probe:
        leaq -4096(%r11), %r11
        movb $$0, (%r11)
        cmpq %r11, %r10
        jne .Lchkstk_probe
    .Lchkstk_done:
        movq (%rsp), %r10
        movq 8(%rsp), %r11
        addq $$16, %rsp
        retq", "~{memory},~{cc}"
()
  unreachable
}

define i8 @"standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8"(i8 %"x")
{
entry:
  %"x.addr" = alloca i8
  store i8 %"x", i8* %"x.addr"
  %"x.1" = load i8, i8* %"x.addr"
  %".4" = sext i8 %"x.1" to i32
  %".5" = icmp sle i32 %".4", 0
  %"y" = alloca i8
  %"prev_y" = alloca i8
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 0 to i8
  ret i8 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i8, i8* %"x.addr"
  %".10" = sext i8 %"x.2" to i32
  %".11" = icmp eq i32 %".10", 1
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = trunc i32 1 to i8
  ret i8 %".13"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"x.3" = load i8, i8* %"x.addr"
  %".16" = sext i8 %"x.3" to i32
  %".17" = sdiv i32 %".16", 2
  %".18" = trunc i32 %".17" to i8
  store i8 %".18", i8* %"y"
  %"x.4" = load i8, i8* %"x.addr"
  store i8 %"x.4", i8* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i8, i8* %"y"
  %"prev_y.1" = load i8, i8* %"prev_y"
  %".22" = icmp ne i8 %"y.1", %"prev_y.1"
  br i1 %".22", label %"sc_rhs", label %"sc_end"
while.body:
  %"y.3" = load i8, i8* %"y"
  store i8 %"y.3", i8* %"prev_y"
  %"y.4" = load i8, i8* %"y"
  %"x.5" = load i8, i8* %"x.addr"
  %"y.5" = load i8, i8* %"y"
  %".28" = sdiv i8 %"x.5", %"y.5"
  %".29" = add i8 %"y.4", %".28"
  %".30" = sext i8 %".29" to i32
  %".31" = sdiv i32 %".30", 2
  %".32" = trunc i32 %".31" to i8
  store i8 %".32", i8* %"y"
  br label %"while.cond"
while.end:
  %"y.6" = load i8, i8* %"y"
  ret i8 %"y.6"
sc_rhs:
  %"y.2" = load i8, i8* %"y"
  %"prev_y.2" = load i8, i8* %"prev_y"
  %".24" = icmp slt i8 %"y.2", %"prev_y.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".24", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
}

define i16 @"standard__math__sqrt__1__dataE1_sbits16__ret_dataE1_sbits16"(i16 %"x")
{
entry:
  %"x.addr" = alloca i16
  store i16 %"x", i16* %"x.addr"
  %"x.1" = load i16, i16* %"x.addr"
  %".4" = sext i16 %"x.1" to i32
  %".5" = icmp sle i32 %".4", 0
  %"y" = alloca i16
  %"prev_y" = alloca i16
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 0 to i16
  ret i16 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i16, i16* %"x.addr"
  %".10" = sext i16 %"x.2" to i32
  %".11" = icmp eq i32 %".10", 1
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = trunc i32 1 to i16
  ret i16 %".13"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"x.3" = load i16, i16* %"x.addr"
  %".16" = sext i16 %"x.3" to i32
  %".17" = sdiv i32 %".16", 2
  %".18" = trunc i32 %".17" to i16
  store i16 %".18", i16* %"y"
  %"x.4" = load i16, i16* %"x.addr"
  store i16 %"x.4", i16* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i16, i16* %"y"
  %"prev_y.1" = load i16, i16* %"prev_y"
  %".22" = icmp ne i16 %"y.1", %"prev_y.1"
  br i1 %".22", label %"sc_rhs", label %"sc_end"
while.body:
  %"y.3" = load i16, i16* %"y"
  store i16 %"y.3", i16* %"prev_y"
  %"y.4" = load i16, i16* %"y"
  %"x.5" = load i16, i16* %"x.addr"
  %"y.5" = load i16, i16* %"y"
  %".28" = sdiv i16 %"x.5", %"y.5"
  %".29" = add i16 %"y.4", %".28"
  %".30" = sext i16 %".29" to i32
  %".31" = sdiv i32 %".30", 2
  %".32" = trunc i32 %".31" to i16
  store i16 %".32", i16* %"y"
  br label %"while.cond"
while.end:
  %"y.6" = load i16, i16* %"y"
  ret i16 %"y.6"
sc_rhs:
  %"y.2" = load i16, i16* %"y"
  %"prev_y.2" = load i16, i16* %"prev_y"
  %".24" = icmp slt i16 %"y.2", %"prev_y.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".24", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
}

define i32 @"standard__math__sqrt__1__dataE1_sbits32__ret_dataE1_sbits32"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"x.1" = load i32, i32* %"x.addr"
  %".4" = icmp sle i32 %"x.1", 0
  %"y" = alloca i32
  %"prev_y" = alloca i32
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 0
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i32, i32* %"x.addr"
  %".8" = sdiv i32 %"x.2", 2
  store i32 %".8", i32* %"y"
  %"x.3" = load i32, i32* %"x.addr"
  store i32 %"x.3", i32* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i32, i32* %"y"
  %"prev_y.1" = load i32, i32* %"prev_y"
  %".12" = icmp ne i32 %"y.1", %"prev_y.1"
  br i1 %".12", label %"sc_rhs", label %"sc_end"
while.body:
  %"y.3" = load i32, i32* %"y"
  store i32 %"y.3", i32* %"prev_y"
  %"y.4" = load i32, i32* %"y"
  %"x.4" = load i32, i32* %"x.addr"
  %"y.5" = load i32, i32* %"y"
  %".18" = sdiv i32 %"x.4", %"y.5"
  %".19" = add i32 %"y.4", %".18"
  %".20" = sdiv i32 %".19", 2
  store i32 %".20", i32* %"y"
  br label %"while.cond"
while.end:
  %"y.6" = load i32, i32* %"y"
  ret i32 %"y.6"
sc_rhs:
  %"y.2" = load i32, i32* %"y"
  %"prev_y.2" = load i32, i32* %"prev_y"
  %".14" = icmp slt i32 %"y.2", %"prev_y.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".14", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
}

define i64 @"standard__math__sqrt__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = sext i32 0 to i64
  %".5" = icmp sle i64 %"x.1", %".4"
  %"y" = alloca i64
  %"prev_y" = alloca i64
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = sext i32 0 to i64
  ret i64 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i64, i64* %"x.addr"
  %".10" = sext i32 1 to i64
  %".11" = icmp eq i64 %"x.2", %".10"
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = sext i32 1 to i64
  ret i64 %".13"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"x.3" = load i64, i64* %"x.addr"
  %".16" = sext i32 2 to i64
  %".17" = sdiv i64 %"x.3", %".16"
  store i64 %".17", i64* %"y"
  %"x.4" = load i64, i64* %"x.addr"
  store i64 %"x.4", i64* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i64, i64* %"y"
  %"prev_y.1" = load i64, i64* %"prev_y"
  %".21" = icmp ne i64 %"y.1", %"prev_y.1"
  br i1 %".21", label %"sc_rhs", label %"sc_end"
while.body:
  %"y.3" = load i64, i64* %"y"
  store i64 %"y.3", i64* %"prev_y"
  %"y.4" = load i64, i64* %"y"
  %"x.5" = load i64, i64* %"x.addr"
  %"y.5" = load i64, i64* %"y"
  %".27" = sdiv i64 %"x.5", %"y.5"
  %".28" = add i64 %"y.4", %".27"
  %".29" = sext i32 2 to i64
  %".30" = sdiv i64 %".28", %".29"
  store i64 %".30", i64* %"y"
  br label %"while.cond"
while.end:
  %"y.6" = load i64, i64* %"y"
  ret i64 %"y.6"
sc_rhs:
  %"y.2" = load i64, i64* %"y"
  %"prev_y.2" = load i64, i64* %"prev_y"
  %".23" = icmp slt i64 %"y.2", %"prev_y.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%".23", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
}

define i8 @"standard__math__sqrt__1__byteE1__ret_byteE1"(i8 %"x")
{
entry:
  %"x.addr" = alloca i8
  store i8 %"x", i8* %"x.addr"
  %"x.1" = load i8, i8* %"x.addr"
  %".4" = zext i8 %"x.1" to i32
  %".5" = icmp ule i32 %".4", 0
  %"y" = alloca i8
  %"prev_y" = alloca i8
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 0 to i8
  ret i8 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i8, i8* %"x.addr"
  store i8 %"x.2", i8* %"y"
  store i8 0, i8* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i8, i8* %"y"
  %"prev_y.1" = load i8, i8* %"prev_y"
  %".13" = icmp ne i8 %"y.1", %"prev_y.1"
  br i1 %".13", label %"while.body", label %"while.end"
while.body:
  %"y.2" = load i8, i8* %"y"
  store i8 %"y.2", i8* %"prev_y"
  %"y.3" = load i8, i8* %"y"
  %"x.3" = load i8, i8* %"x.addr"
  %"y.4" = load i8, i8* %"y"
  %".16" = udiv i8 %"x.3", %"y.4"
  %".17" = add i8 %"y.3", %".16"
  %".18" = zext i8 %".17" to i32
  %".19" = udiv i32 %".18", 2
  %".20" = trunc i32 %".19" to i8
  store i8 %".20", i8* %"y"
  br label %"while.cond"
while.end:
  %"y.5" = load i8, i8* %"y"
  ret i8 %"y.5"
}

define i16 @"standard__math__sqrt__1__dataE1_ubits16__ret_dataE1_ubits16"(i16 %"x")
{
entry:
  %"x.addr" = alloca i16
  store i16 %"x", i16* %"x.addr"
  %"x.1" = load i16, i16* %"x.addr"
  %".4" = zext i16 %"x.1" to i32
  %".5" = icmp ule i32 %".4", 0
  %"y" = alloca i16
  %"prev_y" = alloca i16
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 0 to i16
  ret i16 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i16, i16* %"x.addr"
  store i16 %"x.2", i16* %"y"
  store i16 0, i16* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i16, i16* %"y"
  %"prev_y.1" = load i16, i16* %"prev_y"
  %".13" = icmp ne i16 %"y.1", %"prev_y.1"
  br i1 %".13", label %"while.body", label %"while.end"
while.body:
  %"y.2" = load i16, i16* %"y"
  store i16 %"y.2", i16* %"prev_y"
  %"y.3" = load i16, i16* %"y"
  %"x.3" = load i16, i16* %"x.addr"
  %"y.4" = load i16, i16* %"y"
  %".16" = udiv i16 %"x.3", %"y.4"
  %".17" = add i16 %"y.3", %".16"
  %".18" = zext i16 %".17" to i32
  %".19" = udiv i32 %".18", 2
  %".20" = trunc i32 %".19" to i16
  store i16 %".20", i16* %"y"
  br label %"while.cond"
while.end:
  %"y.5" = load i16, i16* %"y"
  ret i16 %"y.5"
}

define i32 @"standard__math__sqrt__1__dataE1_ubits32__ret_dataE1_ubits32"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"x.1" = load i32, i32* %"x.addr"
  %".4" = icmp ule i32 %"x.1", 0
  %"y" = alloca i32
  %"prev_y" = alloca i32
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 0
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i32, i32* %"x.addr"
  store i32 %"x.2", i32* %"y"
  store i32 0, i32* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i32, i32* %"y"
  %"prev_y.1" = load i32, i32* %"prev_y"
  %".11" = icmp ne i32 %"y.1", %"prev_y.1"
  br i1 %".11", label %"while.body", label %"while.end"
while.body:
  %"y.2" = load i32, i32* %"y"
  store i32 %"y.2", i32* %"prev_y"
  %"y.3" = load i32, i32* %"y"
  %"x.3" = load i32, i32* %"x.addr"
  %"y.4" = load i32, i32* %"y"
  %".14" = udiv i32 %"x.3", %"y.4"
  %".15" = add i32 %"y.3", %".14"
  %".16" = udiv i32 %".15", 2
  store i32 %".16", i32* %"y"
  br label %"while.cond"
while.end:
  %"y.5" = load i32, i32* %"y"
  ret i32 %"y.5"
}

define i64 @"standard__math__sqrt__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = zext i32 0 to i64
  %".5" = icmp ule i64 %"x.1", %".4"
  %"y" = alloca i64
  %"prev_y" = alloca i64
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = sext i32 0 to i64
  ret i64 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i64, i64* %"x.addr"
  store i64 %"x.2", i64* %"y"
  store i64 0, i64* %"prev_y"
  br label %"while.cond"
while.cond:
  %"y.1" = load i64, i64* %"y"
  %"prev_y.1" = load i64, i64* %"prev_y"
  %".13" = icmp ne i64 %"y.1", %"prev_y.1"
  br i1 %".13", label %"while.body", label %"while.end"
while.body:
  %"y.2" = load i64, i64* %"y"
  store i64 %"y.2", i64* %"prev_y"
  %"y.3" = load i64, i64* %"y"
  %"x.3" = load i64, i64* %"x.addr"
  %"y.4" = load i64, i64* %"y"
  %".16" = udiv i64 %"x.3", %"y.4"
  %".17" = add i64 %"y.3", %".16"
  %".18" = zext i32 2 to i64
  %".19" = udiv i64 %".17", %".18"
  store i64 %".19", i64* %"y"
  br label %"while.cond"
while.end:
  %"y.5" = load i64, i64* %"y"
  ret i64 %"y.5"
}

define float @"standard__math__sqrt__1__floatE1__ret_floatE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"result" = alloca float
  store float              0x0, float* %"result"
  %"x_load" = load float, float* %"x.addr"
  %".5" = call float asm sideeffect "sqrtss $1, $0", "=x,x"
(float %"x_load")
  store float %".5", float* %"result"
  %"result.1" = load float, float* %"result"
  ret float %"result.1"
}

define double @"standard__math__sqrt__1__doubleE1__ret_doubleE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"result" = alloca double
  store double              0x0, double* %"result"
  %"x_load" = load double, double* %"x.addr"
  %".5" = call double asm sideeffect "sqrtsd $1, $0", "=x,x"
(double %"x_load")
  store double %".5", double* %"result"
  %"result.1" = load double, double* %"result"
  ret double %"result.1"
}

define double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"r")
{
entry:
  %"r.addr" = alloca double
  store double %"r", double* %"r.addr"
  %"r2" = alloca double
  store double              0x0, double* %"r2"
  %"r.1" = load double, double* %"r.addr"
  %"r.2" = load double, double* %"r.addr"
  %".5" = fmul double %"r.1", %"r.2"
  store double %".5", double* %"r2"
  %"r.3" = load double, double* %"r.addr"
  %"r.4" = load double, double* %"r.addr"
  %"r2.1" = load double, double* %"r2"
  %".7" = fmul double %"r.4", %"r2.1"
  %".8" = fsub float              0x0, 0x3fc5555560000000
  %"r2.2" = load double, double* %"r2"
  %"r2.3" = load double, double* %"r2"
  %".9" = fsub float              0x0, 0x3f2a01a020000000
  %"r2.4" = load double, double* %"r2"
  %"r2.5" = load double, double* %"r2"
  %".10" = fsub double              0x0, 0x3e5ae5e68a2ba852
  %"r2.6" = load double, double* %"r2"
  %".11" = fmul double %"r2.6", 0x3de5d93a5acfd57c
  %".12" = fadd double %".10", %".11"
  %".13" = fmul double %"r2.5", %".12"
  %".14" = fadd double 0x3ec71de357b1fe79, %".13"
  %".15" = fmul double %"r2.4", %".14"
  %"float_to_double_lhs" = fpext float %".9" to double
  %".16" = fadd double %"float_to_double_lhs", %".15"
  %".17" = fmul double %"r2.3", %".16"
  %"float_to_double_lhs.1" = fpext float 0x3f81111120000000 to double
  %".18" = fadd double %"float_to_double_lhs.1", %".17"
  %".19" = fmul double %"r2.2", %".18"
  %"float_to_double_lhs.2" = fpext float %".8" to double
  %".20" = fadd double %"float_to_double_lhs.2", %".19"
  %".21" = fmul double %".7", %".20"
  %".22" = fadd double %"r.3", %".21"
  ret double %".22"
}

define double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"r")
{
entry:
  %"r.addr" = alloca double
  store double %"r", double* %"r.addr"
  %"r2" = alloca double
  store double              0x0, double* %"r2"
  %"r.1" = load double, double* %"r.addr"
  %"r.2" = load double, double* %"r.addr"
  %".5" = fmul double %"r.1", %"r.2"
  store double %".5", double* %"r2"
  %"r2.1" = load double, double* %"r2"
  %"r2.2" = load double, double* %"r2"
  %"r2.3" = load double, double* %"r2"
  %"r2.4" = load double, double* %"r2"
  %"r2.5" = load double, double* %"r2"
  %"r2.6" = load double, double* %"r2"
  %"r2.7" = load double, double* %"r2"
  %".7" = fmul double %"r2.7", 0x3da8fae9be8838d4
  %".8" = fsub double 0x3e21ee9ebdb4b1cd, %".7"
  %".9" = fmul double %"r2.6", %".8"
  %".10" = fsub double 0x3e927e4f809c52ad, %".9"
  %".11" = fmul double %"r2.5", %".10"
  %"float_to_double_lhs" = fpext float 0x3efa01a020000000 to double
  %".12" = fsub double %"float_to_double_lhs", %".11"
  %".13" = fmul double %"r2.4", %".12"
  %"float_to_double_lhs.1" = fpext float 0x3f56c16c20000000 to double
  %".14" = fsub double %"float_to_double_lhs.1", %".13"
  %".15" = fmul double %"r2.3", %".14"
  %"float_to_double_lhs.2" = fpext float 0x3fa5555560000000 to double
  %".16" = fsub double %"float_to_double_lhs.2", %".15"
  %".17" = fmul double %"r2.2", %".16"
  %"float_to_double_lhs.3" = fpext float 0x3fe0000000000000 to double
  %".18" = fsub double %"float_to_double_lhs.3", %".17"
  %".19" = fmul double %"r2.1", %".18"
  %"float_to_double_lhs.4" = fpext float 0x3ff0000000000000 to double
  %".20" = fsub double %"float_to_double_lhs.4", %".19"
  ret double %".20"
}

define double @"standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1"(double %"x", i32* %"q")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"q.addr" = alloca i32*
  store i32* %"q", i32** %"q.addr"
  %"x.1" = load double, double* %"x.addr"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".6" = fcmp olt double %"x.1", %"float_to_double_rhs"
  %"fn" = alloca double
  %"n" = alloca i32
  br i1 %".6", label %"then", label %"else"
then:
  %"x.2" = load double, double* %"x.addr"
  %".8" = fsub double              0x0, %"x.2"
  store double %".8", double* %"x.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  store double              0x0, double* %"fn"
  store i32 0, i32* %"n"
  %"x.3" = load double, double* %"x.addr"
  %".14" = fmul double %"x.3", 0x3fe45f306dc9c883
  %"float_to_double_rhs.1" = fpext float 0x3fe0000000000000 to double
  %".15" = fadd double %".14", %"float_to_double_rhs.1"
  store double %".15", double* %"fn"
  %"fn.1" = load double, double* %"fn"
  %".17" = fptosi double %"fn.1" to i32
  store i32 %".17", i32* %"n"
  %"n.1" = load i32, i32* %"n"
  %".19" = sitofp i32 %"n.1" to double
  store double %".19", double* %"fn"
  %"x.4" = load double, double* %"x.addr"
  %"fn.2" = load double, double* %"fn"
  %"float_to_double_rhs.2" = fpext float 0x3ff921fb60000000 to double
  %".21" = fmul double %"fn.2", %"float_to_double_rhs.2"
  %".22" = fsub double %"x.4", %".21"
  store double %".22", double* %"x.addr"
  %"x.5" = load double, double* %"x.addr"
  %"fn.3" = load double, double* %"fn"
  %".24" = fmul double %"fn.3", 0x3dd0b4611a626331
  %".25" = fsub double %"x.5", %".24"
  store double %".25", double* %"x.addr"
  %"x.6" = load double, double* %"x.addr"
  %"fn.4" = load double, double* %"fn"
  %".27" = fmul double %"fn.4", 0x3b8722074e806e23
  %".28" = fsub double %"x.6", %".27"
  store double %".28", double* %"x.addr"
  %"n.2" = load i32, i32* %"n"
  %"q.1" = load i32*, i32** %"q.addr"
  store i32 %"n.2", i32* %"q.1"
  %"x.7" = load double, double* %"x.addr"
  ret double %"x.7"
}

define double @"standard__math__sin__1__doubleE1__ret_doubleE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"neg" = alloca i1
  store i1 0, i1* %"neg"
  %"r" = alloca double
  store double              0x0, double* %"r"
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %"x.1" = load double, double* %"x.addr"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".7" = fcmp olt double %"x.1", %"float_to_double_rhs"
  store i1 %".7", i1* %"neg"
  %"neg.1" = load i1, i1* %"neg"
  br i1 %"neg.1", label %"then", label %"else"
then:
  %"x.2" = load double, double* %"x.addr"
  %".10" = fsub double              0x0, %"x.2"
  store double %".10", double* %"x.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"x.3" = load double, double* %"x.addr"
  %"float_to_double_rhs.1" = fpext float 0x3fe921fb60000000 to double
  %".14" = fcmp ole double %"x.3", %"float_to_double_rhs.1"
  br i1 %".14", label %"then.1", label %"else.1"
then.1:
  %"x.4" = load double, double* %"x.addr"
  %".16" = call double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"x.4")
  store double %".16", double* %"r"
  %"neg.2" = load i1, i1* %"neg"
  br i1 %"neg.2", label %"then.2", label %"else.2"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"x.5" = load double, double* %"x.addr"
  %".25" = call double @"standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1"(double %"x.5", i32* %"q")
  store double %".25", double* %"r"
  %"q.1" = load i32, i32* %"q"
  %".27" = and i32 %"q.1", 3
  switch i32 %".27", label %"switch_default" [i32 0, label %"switch_case_0" i32 1, label %"switch_case_1" i32 2, label %"switch_case_2"]
then.2:
  %"r.1" = load double, double* %"r"
  %".19" = fsub double              0x0, %"r.1"
  store double %".19", double* %"r"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"r.2" = load double, double* %"r"
  ret double %"r.2"
switch_merge:
  %"neg.3" = load i1, i1* %"neg"
  br i1 %"neg.3", label %"then.3", label %"else.3"
switch_case_0:
  %"r.3" = load double, double* %"r"
  %".29" = call double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"r.3")
  store double %".29", double* %"r"
  br label %"switch_merge"
switch_case_1:
  %"r.4" = load double, double* %"r"
  %".32" = call double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"r.4")
  store double %".32", double* %"r"
  br label %"switch_merge"
switch_case_2:
  %"r.5" = load double, double* %"r"
  %".35" = call double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"r.5")
  %".36" = fsub double              0x0, %".35"
  store double %".36", double* %"r"
  br label %"switch_merge"
switch_default:
  %"r.6" = load double, double* %"r"
  %".39" = call double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"r.6")
  %".40" = fsub double              0x0, %".39"
  store double %".40", double* %"r"
  br label %"switch_merge"
then.3:
  %"r.7" = load double, double* %"r"
  %".44" = fsub double              0x0, %"r.7"
  store double %".44", double* %"r"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"r.8" = load double, double* %"r"
  ret double %"r.8"
}

define double @"standard__math__cos__1__doubleE1__ret_doubleE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"r" = alloca double
  store double              0x0, double* %"r"
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %"x.1" = load double, double* %"x.addr"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".6" = fcmp olt double %"x.1", %"float_to_double_rhs"
  br i1 %".6", label %"then", label %"else"
then:
  %"x.2" = load double, double* %"x.addr"
  %".8" = fsub double              0x0, %"x.2"
  store double %".8", double* %"x.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"x.3" = load double, double* %"x.addr"
  %"float_to_double_rhs.1" = fpext float 0x3fe921fb60000000 to double
  %".12" = fcmp ole double %"x.3", %"float_to_double_rhs.1"
  br i1 %".12", label %"then.1", label %"else.1"
then.1:
  %"x.4" = load double, double* %"x.addr"
  %".14" = call double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"x.4")
  ret double %".14"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"x.5" = load double, double* %"x.addr"
  %".17" = call double @"standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1"(double %"x.5", i32* %"q")
  store double %".17", double* %"r"
  %"q.1" = load i32, i32* %"q"
  %".19" = and i32 %"q.1", 3
  switch i32 %".19", label %"switch_default" [i32 0, label %"switch_case_0" i32 1, label %"switch_case_1" i32 2, label %"switch_case_2"]
switch_merge:
  %"r.5" = load double, double* %"r"
  ret double %"r.5"
switch_case_0:
  %"r.1" = load double, double* %"r"
  %".21" = call double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"r.1")
  store double %".21", double* %"r"
  br label %"switch_merge"
switch_case_1:
  %"r.2" = load double, double* %"r"
  %".24" = call double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"r.2")
  %".25" = fsub double              0x0, %".24"
  store double %".25", double* %"r"
  br label %"switch_merge"
switch_case_2:
  %"r.3" = load double, double* %"r"
  %".28" = call double @"standard__math___cos_kernel__1__doubleE1__ret_doubleE1"(double %"r.3")
  %".29" = fsub double              0x0, %".28"
  store double %".29", double* %"r"
  br label %"switch_merge"
switch_default:
  %"r.4" = load double, double* %"r"
  %".32" = call double @"standard__math___sin_kernel__1__doubleE1__ret_doubleE1"(double %"r.4")
  store double %".32", double* %"r"
  br label %"switch_merge"
}

define float @"standard__math__sin__1__floatE1__ret_floatE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"x.1" = load float, float* %"x.addr"
  %".4" = fpext float %"x.1" to double
  %".5" = call double @"standard__math__sin__1__doubleE1__ret_doubleE1"(double %".4")
  %".6" = fptrunc double %".5" to float
  ret float %".6"
}

define float @"standard__math__cos__1__floatE1__ret_floatE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"x.1" = load float, float* %"x.addr"
  %".4" = fpext float %"x.1" to double
  %".5" = call double @"standard__math__cos__1__doubleE1__ret_doubleE1"(double %".4")
  %".6" = fptrunc double %".5" to float
  ret float %".6"
}

define float @"standard__math__step__2__floatE1__floatE1__ret_floatE1"(float %"edge", float %"x")
{
entry:
  %"edge.addr" = alloca float
  store float %"edge", float* %"edge.addr"
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"x.1" = load float, float* %"x.addr"
  %"edge.1" = load float, float* %"edge.addr"
  %".6" = fcmp oge float %"x.1", %"edge.1"
  br i1 %".6", label %"ternary_true", label %"ternary_false"
ternary_true:
  br label %"ternary_merge"
ternary_false:
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  float [0x3ff0000000000000, %"ternary_true"], [             0x0, %"ternary_false"]
  ret float %"ternary_result"
}

define double @"standard__math__step__2__doubleE1__doubleE1__ret_doubleE1"(double %"edge", double %"x")
{
entry:
  %"edge.addr" = alloca double
  store double %"edge", double* %"edge.addr"
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"x.1" = load double, double* %"x.addr"
  %"edge.1" = load double, double* %"edge.addr"
  %".6" = fcmp oge double %"x.1", %"edge.1"
  br i1 %".6", label %"ternary_true", label %"ternary_false"
ternary_true:
  br label %"ternary_merge"
ternary_false:
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  float [0x3ff0000000000000, %"ternary_true"], [             0x0, %"ternary_false"]
  %".10" = fpext float %"ternary_result" to double
  ret double %".10"
}

define i8 @"standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8"(i8 %"x")
{
entry:
  %"x.addr" = alloca i8
  store i8 %"x", i8* %"x.addr"
  %"x.1" = load i8, i8* %"x.addr"
  %".4" = sext i8 %"x.1" to i32
  %".5" = icmp sgt i32 %".4", 0
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 1 to i8
  ret i8 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i8, i8* %"x.addr"
  %".10" = sext i8 %"x.2" to i32
  %".11" = icmp slt i32 %".10", 0
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = sub i32 0, 1
  %".14" = trunc i32 %".13" to i8
  ret i8 %".14"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".17" = trunc i32 0 to i8
  ret i8 %".17"
}

define i16 @"standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16"(i16 %"x")
{
entry:
  %"x.addr" = alloca i16
  store i16 %"x", i16* %"x.addr"
  %"x.1" = load i16, i16* %"x.addr"
  %".4" = sext i16 %"x.1" to i32
  %".5" = icmp sgt i32 %".4", 0
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = trunc i32 1 to i16
  ret i16 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i16, i16* %"x.addr"
  %".10" = sext i16 %"x.2" to i32
  %".11" = icmp slt i32 %".10", 0
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = sub i32 0, 1
  %".14" = trunc i32 %".13" to i16
  ret i16 %".14"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".17" = trunc i32 0 to i16
  ret i16 %".17"
}

define i32 @"standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32"(i32 %"x")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"x.1" = load i32, i32* %"x.addr"
  %".4" = icmp sgt i32 %"x.1", 0
  br i1 %".4", label %"then", label %"else"
then:
  ret i32 1
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i32, i32* %"x.addr"
  %".8" = icmp slt i32 %"x.2", 0
  br i1 %".8", label %"then.1", label %"else.1"
then.1:
  %".10" = sub i32 0, 1
  ret i32 %".10"
else.1:
  br label %"ifcont.1"
ifcont.1:
  ret i32 0
}

define i64 @"standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = sext i32 0 to i64
  %".5" = icmp sgt i64 %"x.1", %".4"
  br i1 %".5", label %"then", label %"else"
then:
  %".7" = sext i32 1 to i64
  ret i64 %".7"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load i64, i64* %"x.addr"
  %".10" = sext i32 0 to i64
  %".11" = icmp slt i64 %"x.2", %".10"
  br i1 %".11", label %"then.1", label %"else.1"
then.1:
  %".13" = sub i32 0, 1
  %".14" = sext i32 %".13" to i64
  ret i64 %".14"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".17" = sext i32 0 to i64
  ret i64 %".17"
}

define float @"standard__math__sign__1__floatE1__ret_floatE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"x.1" = load float, float* %"x.addr"
  %".4" = fcmp ogt float %"x.1",              0x0
  br i1 %".4", label %"then", label %"else"
then:
  ret float 0x3ff0000000000000
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load float, float* %"x.addr"
  %".8" = fcmp olt float %"x.2",              0x0
  br i1 %".8", label %"then.1", label %"else.1"
then.1:
  %".10" = fsub float              0x0, 0x3ff0000000000000
  ret float %".10"
else.1:
  br label %"ifcont.1"
ifcont.1:
  ret float              0x0
}

define double @"standard__math__sign__1__doubleE1__ret_doubleE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"x.1" = load double, double* %"x.addr"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".4" = fcmp ogt double %"x.1", %"float_to_double_rhs"
  br i1 %".4", label %"then", label %"else"
then:
  %".6" = fpext float 0x3ff0000000000000 to double
  ret double %".6"
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load double, double* %"x.addr"
  %"float_to_double_rhs.1" = fpext float              0x0 to double
  %".9" = fcmp olt double %"x.2", %"float_to_double_rhs.1"
  br i1 %".9", label %"then.1", label %"else.1"
then.1:
  %".11" = fsub float              0x0, 0x3ff0000000000000
  %".12" = fpext float %".11" to double
  ret double %".12"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".15" = fpext float              0x0 to double
  ret double %".15"
}

declare external i64 @"GetModuleHandleA"(i8* %"arg0")

declare external i16 @"RegisterClassExA"(%"standard__system__windows__WNDCLASSEXA"* %"arg0")

declare external i1 @"UnregisterClassA"(i8* %"arg0", i64 %"arg1")

declare external i64 @"CreateWindowExA"(i32 %"arg0", i8* %"arg1", i8* %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6", i32 %"arg7", i64 %"arg8", i64 %"arg9", i64 %"arg10", i8* %"arg11")

declare external i1 @"DestroyWindow"(i64 %"arg0")

declare external i1 @"ShowWindow"(i64 %"arg0", i32 %"arg1")

declare external i1 @"UpdateWindow"(i64 %"arg0")

declare external i1 @"SetWindowTextA"(i64 %"arg0", i8* %"arg1")

declare external i32 @"GetWindowTextA"(i64 %"arg0", i8* %"arg1", i32 %"arg2")

declare external i1 @"SetWindowPos"(i64 %"arg0", i64 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6")

declare external i1 @"SetForegroundWindow"(i64 %"arg0")

declare external i1 @"BringWindowToTop"(i64 %"arg0")

declare external i64 @"SetFocus"(i64 %"arg0")

declare external i1 @"InvalidateRect"(i64 %"arg0", %"standard__system__windows__RECT"* %"arg1", i1 %"arg2")

declare external i1 @"GetClientRect"(i64 %"arg0", %"standard__system__windows__RECT"* %"arg1")

declare external i1 @"GetWindowRect"(i64 %"arg0", %"standard__system__windows__RECT"* %"arg1")

declare external i1 @"GetMessageA"(%"standard__system__windows__MSG"* %"arg0", i64 %"arg1", i32 %"arg2", i32 %"arg3")

declare external i1 @"PeekMessageA"(%"standard__system__windows__MSG"* %"arg0", i64 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4")

declare external i1 @"TranslateMessage"(%"standard__system__windows__MSG"* %"arg0")

declare external i64 @"DispatchMessageA"(%"standard__system__windows__MSG"* %"arg0")

declare external void @"PostQuitMessage"(i32 %"arg0")

declare external i64 @"DefWindowProcA"(i64 %"arg0", i32 %"arg1", i64 %"arg2", i64 %"arg3")

declare external i64 @"BeginPaint"(i64 %"arg0.1", %"standard__system__windows__PAINTSTRUCT"* %"arg1.1")

declare external i1 @"EndPaint"(i64 %"arg0.1", %"standard__system__windows__PAINTSTRUCT"* %"arg1.1")

declare external i64 @"GetDC"(i64 %"arg0")

declare external i32 @"ReleaseDC"(i64 %"arg0", i64 %"arg1")

declare external i1 @"MoveToEx"(i64 %"arg0", i32 %"arg1", i32 %"arg2", %"standard__math__POINT"* %"arg3")

declare external i1 @"LineTo"(i64 %"arg0", i32 %"arg1", i32 %"arg2")

declare external i1 @"Ellipse"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4")

declare external i1 @"Rectangle"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4")

declare external i32 @"FillRect"(i64 %"arg0.1", %"standard__system__windows__RECT"* %"arg1.1", i64 %"arg2.1")

declare external i32 @"FrameRect"(i64 %"arg0", %"standard__system__windows__RECT"* %"arg1", i64 %"arg2")

declare external i32 @"SetPixel"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3")

declare external i1 @"Arc"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6", i32 %"arg7", i32 %"arg8")

declare external i1 @"Polyline"(i64 %"arg0", %"standard__math__POINT"* %"arg1", i32 %"arg2")

declare external i1 @"Polygon"(i64 %"arg0", %"standard__math__POINT"* %"arg1", i32 %"arg2")

declare external i32 @"IntersectClipRect"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4")

declare external i32 @"SelectClipRgn"(i64 %"arg0", i64 %"arg1")

declare external i64 @"CreatePen"(i32 %"arg0", i32 %"arg1", i32 %"arg2")

declare external i64 @"CreateSolidBrush"(i32 %"arg0")

declare external i64 @"SelectObject"(i64 %"arg0", i64 %"arg1")

declare external i1 @"DeleteObject"(i64 %"arg0.1")

declare external i64 @"CreateCompatibleDC"(i64 %"arg0.1")

declare external i64 @"CreateCompatibleBitmap"(i64 %"arg0.1", i32 %"arg1.1", i32 %"arg2.1")

declare external i1 @"BitBlt"(i64 %"arg0.1", i32 %"arg1.1", i32 %"arg2.1", i32 %"arg3.1", i32 %"arg4.1", i64 %"arg5.1", i32 %"arg6.1", i32 %"arg7.1", i32 %"arg8.1")

declare external i1 @"DeleteDC"(i64 %"arg0.1")

declare external i32 @"SetBkMode"(i64 %"arg0.1", i32 %"arg1.1")

declare external i32 @"SetBkColor"(i64 %"arg0.1", i32 %"arg1.1")

declare external i32 @"SetTextColor"(i64 %"arg0.1", i32 %"arg1.1")

declare external i1 @"TextOutA"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i8* %"arg3", i32 %"arg4")

declare external i64 @"GetConsoleWindow"()

declare external i64 @"GetStockObject"(i32 %"arg0")

declare external i1 @"GetCursorPos"(%"standard__math__POINT"* %"arg0")

declare external i64 @"LoadCursorA"(i64 %"arg0", i8* %"arg1")

declare external i64 @"LoadIconA"(i64 %"arg0", i8* %"arg1")

declare external i16 @"GetAsyncKeyState"(i32 %"arg0")

declare external i1 @"ScreenToClient"(i8* %"arg0", %"standard__math__POINT"* %"arg1")

declare external i64 @"CreateMenu"()

declare external i64 @"CreatePopupMenu"()

declare external i1 @"AppendMenuA"(i64 %"arg0", i32 %"arg1", i64 %"arg2", i8* %"arg3")

declare external i1 @"SetMenu"(i64 %"arg0", i64 %"arg1")

declare external i64 @"SendMessageA"(i64 %"arg0", i32 %"arg1", i64 %"arg2", i64 %"arg3")

declare external i32 @"GetWindowTextLengthA"(i64 %"arg0")

declare external i1 @"MoveWindow"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i1 %"arg5")

declare external i32 @"MessageBoxA"(i64 %"arg0", i8* %"arg1", i8* %"arg2", i32 %"arg3")

declare external i1 @"GetOpenFileNameA"(i8* %"arg0")

declare external i1 @"GetSaveFileNameA"(i8* %"arg0")

declare external i64 @"CreateFileA"(i8* %"arg0", i32 %"arg1", i32 %"arg2", i8* %"arg3", i32 %"arg4", i32 %"arg5", i64 %"arg6")

declare external i1 @"ReadFile"(i64 %"arg0", i8* %"arg1", i32 %"arg2", i32* %"arg3", i8* %"arg4")

declare external i1 @"WriteFile"(i64 %"arg0", i8* %"arg1", i32 %"arg2", i32* %"arg3", i8* %"arg4")

declare external i1 @"GetFileSizeEx"(i64 %"arg0", i64* %"arg1")

declare external i32 @"GetSystemMetrics"(i32 %"arg0")

declare external i1 @"FreeConsole"()

declare external i64 @"CreateFontA"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6", i32 %"arg7", i32 %"arg8", i32 %"arg9", i32 %"arg10", i32 %"arg11", i32 %"arg12", i8* %"arg13")

declare external i32 @"SetWindowTheme"(i64 %"arg0", i8* %"arg1", i8* %"arg2")

declare external i32 @"DwmSetWindowAttribute"(i64 %"arg0", i32 %"arg1", i8* %"arg2", i32 %"arg3")

declare external i1 @"GetTextMetricsA"(i64 %"arg0", i8* %"arg1")

declare external i32 @"SetScrollInfo"(i64 %"arg0", i32 %"arg1", i8* %"arg2", i1 %"arg3")

declare external i1 @"GetScrollInfo"(i64 %"arg0", i32 %"arg1", i8* %"arg2")

declare external i64 @"SetCapture"(i64 %"arg0")

declare external i1 @"ReleaseCapture"()

declare external i1 @"ExtTextOutA"(i64 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", %"standard__system__windows__RECT"* %"arg4", i8* %"arg5", i32 %"arg6", i8* %"arg7")

declare external i32 @"DrawTextA"(i64 %"arg0", i8* %"arg1", i32 %"arg2", %"standard__system__windows__RECT"* %"arg3", i32 %"arg4")

declare external i1 @"OpenClipboard"(i64 %"arg0")

declare external i1 @"CloseClipboard"()

declare external i1 @"EmptyClipboard"()

declare external i64 @"SetClipboardData"(i32 %"arg0", i64 %"arg1")

declare external i64 @"GetClipboardData"(i32 %"arg0")

declare external i64 @"GlobalAlloc"(i32 %"arg0", i64 %"arg1")

declare external i8* @"GlobalLock"(i64 %"arg0")

declare external i1 @"GlobalUnlock"(i64 %"arg0")

declare external i64 @"GlobalSize"(i64 %"arg0")

declare external i32 @"snprintf"(i8* %"arg0", i64 %"arg1", i8* %"arg2", i32 %"arg3")

define %"standard__math__POINT" @"standard__vectors__project__5__Vec3E1_ptr1__intE1__intE1__floatE1__floatE1__ret_POINTE1"(%"standard__vectors__Vec3"* %"v", i32 %"cx", i32 %"cy", float %"fov", float %"cam_z")
{
entry:
  %"v.addr" = alloca %"standard__vectors__Vec3"*
  store %"standard__vectors__Vec3"* %"v", %"standard__vectors__Vec3"** %"v.addr"
  %"cx.addr" = alloca i32
  store i32 %"cx", i32* %"cx.addr"
  %"cy.addr" = alloca i32
  store i32 %"cy", i32* %"cy.addr"
  %"fov.addr" = alloca float
  store float %"fov", float* %"fov.addr"
  %"cam_z.addr" = alloca float
  store float %"cam_z", float* %"cam_z.addr"
  %"dz" = alloca float
  %"v.1" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"v.2" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"z_ptr" = getelementptr inbounds %"standard__vectors__Vec3", %"standard__vectors__Vec3"* %"v.2", i32 0, i32 2
  %"z" = load float, float* %"z_ptr"
  %"cam_z.1" = load float, float* %"cam_z.addr"
  %".12" = fadd float %"z", %"cam_z.1"
  store float %".12", float* %"dz"
  %"p" = alloca %"standard__math__POINT"
  store %"standard__math__POINT" zeroinitializer, %"standard__math__POINT"* %"p"
  %"dz.1" = load float, float* %"dz"
  %".15" = fcmp olt float %"dz.1", 0x3f50624de0000000
  br i1 %".15", label %"then", label %"else"
then:
  %"cx.1" = load i32, i32* %"cx.addr"
  %".17" = getelementptr inbounds %"standard__math__POINT", %"standard__math__POINT"* %"p", i32 0, i32 0
  store i32 %"cx.1", i32* %".17"
  %"cy.1" = load i32, i32* %"cy.addr"
  %".19" = getelementptr inbounds %"standard__math__POINT", %"standard__math__POINT"* %"p", i32 0, i32 1
  store i32 %"cy.1", i32* %".19"
  %"p.1" = load %"standard__math__POINT", %"standard__math__POINT"* %"p"
  ret %"standard__math__POINT" %"p.1"
else:
  br label %"ifcont"
ifcont:
  %"cx.2" = load i32, i32* %"cx.addr"
  %"v.3" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"v.4" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"x_ptr" = getelementptr inbounds %"standard__vectors__Vec3", %"standard__vectors__Vec3"* %"v.4", i32 0, i32 0
  %"x" = load float, float* %"x_ptr"
  %"fov.1" = load float, float* %"fov.addr"
  %".23" = fmul float %"x", %"fov.1"
  %"dz.2" = load float, float* %"dz"
  %".24" = fdiv float %".23", %"dz.2"
  %".25" = fptosi float %".24" to i32
  %".26" = add i32 %"cx.2", %".25"
  %".27" = getelementptr inbounds %"standard__math__POINT", %"standard__math__POINT"* %"p", i32 0, i32 0
  store i32 %".26", i32* %".27"
  %"cy.2" = load i32, i32* %"cy.addr"
  %"v.5" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"v.6" = load %"standard__vectors__Vec3"*, %"standard__vectors__Vec3"** %"v.addr"
  %"y_ptr" = getelementptr inbounds %"standard__vectors__Vec3", %"standard__vectors__Vec3"* %"v.6", i32 0, i32 1
  %"y" = load float, float* %"y_ptr"
  %"fov.2" = load float, float* %"fov.addr"
  %".29" = fmul float %"y", %"fov.2"
  %"dz.3" = load float, float* %"dz"
  %".30" = fdiv float %".29", %"dz.3"
  %".31" = fptosi float %".30" to i32
  %".32" = sub i32 %"cy.2", %".31"
  %".33" = getelementptr inbounds %"standard__math__POINT", %"standard__math__POINT"* %"p", i32 0, i32 1
  store i32 %".32", i32* %".33"
  %"p.2" = load %"standard__math__POINT", %"standard__math__POINT"* %"p"
  ret %"standard__math__POINT" %"p.2"
}

@"glCreateShader_fp" = internal global i32 (i32)* null
@"glShaderSource_fp" = internal global void (i32, i32, i8**, i32*)* null
@"glCompileShader_fp" = internal global void (i32)* null
@"glCreateProgram_fp" = internal global i32 ()* null
@"glAttachShader_fp" = internal global void (i32, i32)* null
@"glLinkProgram_fp" = internal global void (i32)* null
@"glUseProgram_fp" = internal global void (i32)* null
@"glGetUniformLocation_fp" = internal global i32 (i32, i8*)* null
@"glUniform1i_fp" = internal global void (i32, i32)* null
@"glUniform2f_fp" = internal global void (i32, float, float)* null
@"glActiveTexture_fp" = internal global void (i32)* null
@"glDeleteShader_fp" = internal global void (i32)* null
@"glDeleteProgram_fp" = internal global void (i32)* null
@"PFD_DRAW_TO_WINDOW" = internal global i32 4
@"PFD_SUPPORT_OPENGL" = internal global i32 32
@"PFD_DOUBLEBUFFER" = internal global i32 1
@"PFD_TYPE_RGBA" = internal global i8 0
@"PFD_MAIN_PLANE" = internal global i8 0
@"GL_FALSE" = internal global i8 0
@"GL_TRUE" = internal global i8 1
@"GL_NO_ERROR" = internal global i8 0
@"GL_INVALID_ENUM" = internal global i8 0
@"GL_INVALID_VALUE" = internal global i8 0
@"GL_INVALID_OPERATION" = internal global i8 0
@"GL_OUT_OF_MEMORY" = internal global i8 0
@"GL_NO_ERROR_INT" = internal global i32 0
@"GL_INVALID_ENUM_INT" = internal global i32 1280
@"GL_INVALID_VALUE_INT" = internal global i32 1281
@"GL_INVALID_OPERATION_INT" = internal global i32 1282
@"GL_STACK_OVERFLOW_INT" = internal global i32 1283
@"GL_STACK_UNDERFLOW_INT" = internal global i32 1284
@"GL_OUT_OF_MEMORY_INT" = internal global i32 1285
@"GL_COLOR_BUFFER_BIT" = internal global i32 16384
@"GL_DEPTH_BUFFER_BIT" = internal global i32 256
@"GL_STENCIL_BUFFER_BIT" = internal global i32 1024
@"GL_ACCUM_BUFFER_BIT" = internal global i32 512
@"GL_POINTS" = internal global i32 0
@"GL_LINES" = internal global i32 1
@"GL_LINE_LOOP" = internal global i32 2
@"GL_LINE_STRIP" = internal global i32 3
@"GL_TRIANGLES" = internal global i32 4
@"GL_TRIANGLE_STRIP" = internal global i32 5
@"GL_TRIANGLE_FAN" = internal global i32 6
@"GL_QUADS" = internal global i32 7
@"GL_QUAD_STRIP" = internal global i32 8
@"GL_POLYGON" = internal global i32 9
@"GL_BYTE" = internal global i32 5120
@"GL_UNSIGNED_BYTE" = internal global i32 5121
@"GL_SHORT" = internal global i32 5122
@"GL_UNSIGNED_SHORT" = internal global i32 5123
@"GL_INT" = internal global i32 5124
@"GL_UNSIGNED_INT" = internal global i32 5125
@"GL_FLOAT" = internal global i32 5126
@"GL_DOUBLE" = internal global i32 5130
@"GL_MODELVIEW" = internal global i32 5888
@"GL_PROJECTION" = internal global i32 5889
@"GL_TEXTURE" = internal global i32 5890
@"GL_NEVER" = internal global i32 512
@"GL_LESS" = internal global i32 513
@"GL_EQUAL" = internal global i32 514
@"GL_LEQUAL" = internal global i32 515
@"GL_GREATER" = internal global i32 516
@"GL_NOTEQUAL" = internal global i32 517
@"GL_GEQUAL" = internal global i32 518
@"GL_ALWAYS" = internal global i32 519
@"GL_ZERO" = internal global i32 0
@"GL_ONE" = internal global i32 1
@"GL_SRC_COLOR" = internal global i32 768
@"GL_ONE_MINUS_SRC_COLOR" = internal global i32 769
@"GL_SRC_ALPHA" = internal global i32 770
@"GL_ONE_MINUS_SRC_ALPHA" = internal global i32 771
@"GL_DST_ALPHA" = internal global i32 772
@"GL_ONE_MINUS_DST_ALPHA" = internal global i32 773
@"GL_DST_COLOR" = internal global i32 774
@"GL_ONE_MINUS_DST_COLOR" = internal global i32 775
@"GL_DEPTH_TEST" = internal global i32 2929
@"GL_BLEND" = internal global i32 3042
@"GL_CULL_FACE" = internal global i32 2884
@"GL_LIGHTING" = internal global i32 2896
@"GL_TEXTURE_2D" = internal global i32 3553
@"GL_SCISSOR_TEST" = internal global i32 3089
@"GL_LINE_SMOOTH" = internal global i32 2848
@"GL_POINT_SMOOTH" = internal global i32 2832
@"GL_NORMALIZE" = internal global i32 2977
@"GL_FOG" = internal global i32 2912
@"GL_STENCIL_TEST" = internal global i32 2960
@"GL_ALPHA_TEST" = internal global i32 3008
@"GL_COLOR_LOGIC_OP" = internal global i32 3058
@"GL_POLYGON_OFFSET_FILL" = internal global i32 32823
@"GL_MULTISAMPLE" = internal global i32 32925
@"GL_FRONT" = internal global i32 1028
@"GL_BACK" = internal global i32 1029
@"GL_FRONT_AND_BACK" = internal global i32 1032
@"GL_CW" = internal global i32 2304
@"GL_CCW" = internal global i32 2305
@"GL_POINT" = internal global i32 6912
@"GL_LINE" = internal global i32 6913
@"GL_FILL" = internal global i32 6914
@"GL_FLAT" = internal global i32 7424
@"GL_SMOOTH" = internal global i32 7425
@"GL_TEXTURE_MAG_FILTER" = internal global i32 10240
@"GL_TEXTURE_MIN_FILTER" = internal global i32 10241
@"GL_TEXTURE_WRAP_S" = internal global i32 10242
@"GL_TEXTURE_WRAP_T" = internal global i32 10243
@"GL_NEAREST" = internal global i32 9728
@"GL_LINEAR" = internal global i32 9729
@"GL_NEAREST_MIPMAP_NEAREST" = internal global i32 9984
@"GL_LINEAR_MIPMAP_NEAREST" = internal global i32 9985
@"GL_NEAREST_MIPMAP_LINEAR" = internal global i32 9986
@"GL_LINEAR_MIPMAP_LINEAR" = internal global i32 9987
@"GL_CLAMP" = internal global i32 10496
@"GL_REPEAT" = internal global i32 10497
@"GL_CLAMP_TO_EDGE" = internal global i32 33071
@"GL_RGB" = internal global i32 6407
@"GL_RGBA" = internal global i32 6408
@"GL_LUMINANCE" = internal global i32 6409
@"GL_LUMINANCE_ALPHA" = internal global i32 6410
@"GL_DEPTH_COMPONENT" = internal global i32 6402
@"GL_ALPHA" = internal global i32 6406
@"GL_RGB8" = internal global i32 32849
@"GL_RGBA8" = internal global i32 32856
@"GL_DEPTH_COMPONENT16" = internal global i32 33189
@"GL_DEPTH_COMPONENT24" = internal global i32 33190
@"GL_ARRAY_BUFFER" = internal global i32 34962
@"GL_ELEMENT_ARRAY_BUFFER" = internal global i32 34963
@"GL_UNIFORM_BUFFER" = internal global i32 35345
@"GL_STREAM_DRAW" = internal global i32 35040
@"GL_STREAM_READ" = internal global i32 35041
@"GL_STATIC_DRAW" = internal global i32 35044
@"GL_STATIC_READ" = internal global i32 35045
@"GL_DYNAMIC_DRAW" = internal global i32 35048
@"GL_DYNAMIC_READ" = internal global i32 35049
@"GL_FRAGMENT_SHADER" = internal global i32 35632
@"GL_VERTEX_SHADER" = internal global i32 35633
@"GL_GEOMETRY_SHADER" = internal global i32 36313
@"GL_COMPILE_STATUS" = internal global i32 35713
@"GL_LINK_STATUS" = internal global i32 35714
@"GL_INFO_LOG_LENGTH" = internal global i32 35716
@"GL_SHADER_TYPE" = internal global i32 35663
@"GL_DELETE_STATUS" = internal global i32 35712
@"GL_FRAMEBUFFER" = internal global i32 36160
@"GL_RENDERBUFFER" = internal global i32 36161
@"GL_COLOR_ATTACHMENT0" = internal global i32 36064
@"GL_DEPTH_ATTACHMENT" = internal global i32 36096
@"GL_STENCIL_ATTACHMENT" = internal global i32 36128
@"GL_FRAMEBUFFER_COMPLETE" = internal global i32 36053
@"GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT" = internal global i32 36054
@"GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT" = internal global i32 36055
@"GL_FRAMEBUFFER_UNSUPPORTED" = internal global i32 36061
@"GL_VENDOR" = internal global i32 7936
@"GL_RENDERER" = internal global i32 7937
@"GL_VERSION" = internal global i32 7938
@"GL_EXTENSIONS" = internal global i32 7939
@"GL_TEXTURE0" = internal global i32 33984
@"GL_TEXTURE1" = internal global i32 33985
@"GL_TEXTURE2" = internal global i32 33986
@"GL_TEXTURE3" = internal global i32 33987
@"GL_TEXTURE4" = internal global i32 33988
@"GL_TEXTURE5" = internal global i32 33989
@"GL_TEXTURE6" = internal global i32 33990
@"GL_TEXTURE7" = internal global i32 33991
@"GL_LIGHT0" = internal global i32 16384
@"GL_LIGHT1" = internal global i32 16385
@"GL_LIGHT2" = internal global i32 16386
@"GL_LIGHT3" = internal global i32 16387
@"GL_AMBIENT" = internal global i32 4608
@"GL_DIFFUSE" = internal global i32 4609
@"GL_SPECULAR" = internal global i32 4610
@"GL_POSITION" = internal global i32 4611
@"GL_SHININESS" = internal global i32 5633
@"GL_EMISSION" = internal global i32 5632
@"GL_VIEWPORT" = internal global i32 2978
@"GL_MAX_TEXTURE_SIZE" = internal global i32 3379
@"GL_MAX_VIEWPORT_DIMS" = internal global i32 3386
declare external i32 @"ChoosePixelFormat"(i64 %"arg0", %"PIXELFORMATDESCRIPTOR"* %"arg1")

declare external i1 @"SetPixelFormat"(i64 %"arg0", i32 %"arg1", %"PIXELFORMATDESCRIPTOR"* %"arg2")

declare external i64 @"wglCreateContext"(i64 %"arg0")

declare external i1 @"wglMakeCurrent"(i64 %"arg0", i64 %"arg1")

declare external i1 @"wglDeleteContext"(i64 %"arg0")

declare external i8* @"wglGetProcAddress"(i8* %"arg0")

declare external i1 @"SwapBuffers"(i64 %"arg0")

declare external void @"glEnable"(i32 %"arg0")

declare external void @"glDisable"(i32 %"arg0")

declare external i8 @"glIsEnabled"(i32 %"arg0")

declare external i32 @"glGetError"()

declare external void @"glGetIntegerv"(i32 %"arg0", i32* %"arg1")

declare external void @"glGetFloatv"(i32 %"arg0", float* %"arg1")

declare external i8* @"glGetString"(i32 %"arg0")

declare external void @"glFinish"()

declare external void @"glFlush"()

declare external void @"glClear"(i32 %"arg0")

declare external void @"glClearColor"(float %"arg0", float %"arg1", float %"arg2", float %"arg3")

declare external void @"glClearDepth"(float %"arg0")

declare external void @"glClearStencil"(i32 %"arg0")

declare external void @"glViewport"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3")

declare external void @"glScissor"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3")

declare external void @"glDepthFunc"(i32 %"arg0")

declare external void @"glDepthMask"(i8 %"arg0")

declare external void @"glDepthRange"(float %"arg0", float %"arg1")

declare external void @"glBlendFunc"(i32 %"arg0", i32 %"arg1")

declare external void @"glBlendEquation"(i32 %"arg0")

declare external void @"glCullFace"(i32 %"arg0")

declare external void @"glFrontFace"(i32 %"arg0")

declare external void @"glPolygonMode"(i32 %"arg0", i32 %"arg1")

declare external void @"glPolygonOffset"(float %"arg0", float %"arg1")

declare external void @"glLineWidth"(float %"arg0")

declare external void @"glPointSize"(float %"arg0")

declare external void @"glColor4f"(float %"arg0", float %"arg1", float %"arg2", float %"arg3")

declare external void @"glColor3f"(float %"arg0", float %"arg1", float %"arg2")

declare external void @"glColor4ub"(i8 %"arg0", i8 %"arg1", i8 %"arg2", i8 %"arg3")

declare external void @"glShadeModel"(i32 %"arg0")

declare external void @"glMatrixMode"(i32 %"arg0")

declare external void @"glLoadIdentity"()

declare external void @"glLoadMatrixf"(float* %"arg0")

declare external void @"glMultMatrixf"(float* %"arg0")

declare external void @"glPushMatrix"()

declare external void @"glPopMatrix"()

declare external void @"glTranslatef"(float %"arg0", float %"arg1", float %"arg2")

declare external void @"glRotatef"(float %"arg0", float %"arg1", float %"arg2", float %"arg3")

declare external void @"glScalef"(float %"arg0", float %"arg1", float %"arg2")

declare external void @"glOrtho"(double %"arg0", double %"arg1", double %"arg2", double %"arg3", double %"arg4", double %"arg5")

declare external void @"glFrustum"(float %"arg0", float %"arg1", float %"arg2", float %"arg3", float %"arg4", float %"arg5")

declare external void @"glBegin"(i32 %"arg0")

declare external void @"glEnd"()

declare external void @"glVertex2f"(float %"arg0", float %"arg1")

declare external void @"glVertex3f"(float %"arg0", float %"arg1", float %"arg2")

declare external void @"glVertex4f"(float %"arg0", float %"arg1", float %"arg2", float %"arg3")

declare external void @"glVertex2i"(i32 %"arg0", i32 %"arg1")

declare external void @"glVertex3i"(i32 %"arg0", i32 %"arg1", i32 %"arg2")

declare external void @"glNormal3f"(float %"arg0", float %"arg1", float %"arg2")

declare external void @"glTexCoord2f"(float %"arg0", float %"arg1")

declare external void @"glGenTextures"(i32 %"arg0", i32* %"arg1")

declare external void @"glDeleteTextures"(i32 %"arg0", i32* %"arg1")

declare external void @"glBindTexture"(i32 %"arg0", i32 %"arg1")

declare external void @"glTexImage2D"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6", i32 %"arg7", i8* %"arg8")

declare external void @"glTexSubImage2D"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i32 %"arg6", i32 %"arg7", i8* %"arg8")

declare external void @"glTexParameteri"(i32 %"arg0", i32 %"arg1", i32 %"arg2")

declare external void @"glTexParameterf"(i32 %"arg0", i32 %"arg1", float %"arg2")

declare external void @"glNewList"(i32 %"arg0", i32 %"arg1")

declare external void @"glEndList"()

declare external void @"glCallList"(i32 %"arg0")

declare external i32 @"glGenLists"(i32 %"arg0")

declare external void @"glDeleteLists"(i32 %"arg0", i32 %"arg1")

declare external void @"glStencilFunc"(i32 %"arg0", i32 %"arg1", i32 %"arg2")

declare external void @"glStencilOp"(i32 %"arg0", i32 %"arg1", i32 %"arg2")

declare external void @"glStencilMask"(i32 %"arg0")

declare external void @"glColorMask"(i8 %"arg0", i8 %"arg1", i8 %"arg2", i8 %"arg3")

declare external void @"glReadPixels"(i32 %"arg0", i32 %"arg1", i32 %"arg2", i32 %"arg3", i32 %"arg4", i32 %"arg5", i8* %"arg6")

declare external void @"glLightfv"(i32 %"arg0", i32 %"arg1", float* %"arg2")

declare external void @"glLightf"(i32 %"arg0", i32 %"arg1", float %"arg2")

declare external void @"glMaterialfv"(i32 %"arg0", i32 %"arg1", float* %"arg2")

declare external void @"glMaterialf"(i32 %"arg0", i32 %"arg1", float %"arg2")

define i64 @"OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"device_context")
{
entry:
  %"device_context.addr" = alloca i64
  store i64 %"device_context", i64* %"device_context.addr"
  %"pfd" = alloca %"PIXELFORMATDESCRIPTOR"
  store %"PIXELFORMATDESCRIPTOR" zeroinitializer, %"PIXELFORMATDESCRIPTOR"* %"pfd"
  %".5" = sdiv i32 320, 8
  %".6" = trunc i32 %".5" to i16
  %".7" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 0
  store i16 %".6", i16* %".7"
  %".9" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 1
  %".10" = trunc i32 1 to i16
  store i16 %".10", i16* %".9"
  %"PFD_DRAW_TO_WINDOW" = load i32, i32* @"PFD_DRAW_TO_WINDOW"
  %"PFD_SUPPORT_OPENGL" = load i32, i32* @"PFD_SUPPORT_OPENGL"
  %".12" = or i32 %"PFD_DRAW_TO_WINDOW", %"PFD_SUPPORT_OPENGL"
  %"PFD_DOUBLEBUFFER" = load i32, i32* @"PFD_DOUBLEBUFFER"
  %".13" = or i32 %".12", %"PFD_DOUBLEBUFFER"
  %".14" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 2
  store i32 %".13", i32* %".14"
  %"PFD_TYPE_RGBA" = load i8, i8* @"PFD_TYPE_RGBA"
  %".16" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 3
  store i8 %"PFD_TYPE_RGBA", i8* %".16"
  %".18" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 4
  %".19" = trunc i32 32 to i8
  store i8 %".19", i8* %".18"
  %".21" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 18
  %".22" = trunc i32 24 to i8
  store i8 %".22", i8* %".21"
  %".24" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 19
  %".25" = trunc i32 8 to i8
  store i8 %".25", i8* %".24"
  %"PFD_MAIN_PLANE" = load i8, i8* @"PFD_MAIN_PLANE"
  %".27" = getelementptr inbounds %"PIXELFORMATDESCRIPTOR", %"PIXELFORMATDESCRIPTOR"* %"pfd", i32 0, i32 21
  store i8 %"PFD_MAIN_PLANE", i8* %".27"
  %"pixel_format" = alloca i32
  %"device_context.1" = load i64, i64* %"device_context.addr"
  %".29" = call i32 @"ChoosePixelFormat"(i64 %"device_context.1", %"PIXELFORMATDESCRIPTOR"* %"pfd")
  store i32 %".29", i32* %"pixel_format"
  %"device_context.2" = load i64, i64* %"device_context.addr"
  %"pixel_format.1" = load i32, i32* %"pixel_format"
  %".31" = call i1 @"SetPixelFormat"(i64 %"device_context.2", i32 %"pixel_format.1", %"PIXELFORMATDESCRIPTOR"* %"pfd")
  %"gl_context" = alloca i64
  %"device_context.3" = load i64, i64* %"device_context.addr"
  %".32" = call i64 @"wglCreateContext"(i64 %"device_context.3")
  store i64 %".32", i64* %"gl_context"
  %"device_context.4" = load i64, i64* %"device_context.addr"
  %"gl_context.1" = load i64, i64* %"gl_context"
  %".34" = call i1 @"wglMakeCurrent"(i64 %"device_context.4", i64 %"gl_context.1")
  %"gl_context.2" = load i64, i64* %"gl_context"
  ret i64 %"gl_context.2"
}

define void @"OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1"(i64 %"device_context")
{
entry:
  %"device_context.addr" = alloca i64
  store i64 %"device_context", i64* %"device_context.addr"
  %"device_context.1" = load i64, i64* %"device_context.addr"
  %".4" = call i1 @"SwapBuffers"(i64 %"device_context.1")
  ret void
}

define i32 @"OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1"(i32 %"shader_type", i8* %"src")
{
entry:
  %"shader_type.addr" = alloca i32
  store i32 %"shader_type", i32* %"shader_type.addr"
  %"src.addr" = alloca i8*
  store i8* %"src", i8** %"src.addr"
  %"shader" = alloca i32
  %"glCreateShader_fp" = load i32 (i32)*, i32 (i32)** @"glCreateShader_fp"
  %"shader_type.1" = load i32, i32* %"shader_type.addr"
  %"fp_call" = call i32 %"glCreateShader_fp"(i32 %"shader_type.1")
  store i32 %"fp_call", i32* %"shader"
  %"src_arr" = alloca [1 x i8*]
  %"src.1" = load i8*, i8** %"src.addr"
  %"elem_0" = getelementptr [1 x i8*], [1 x i8*]* %"src_arr", i32 0, i32 0
  store i8* %"src.1", i8** %"elem_0"
  %"len_arr" = alloca [1 x i32]
  %".8" = sub i32 0, 1
  %"elem_0.1" = getelementptr [1 x i32], [1 x i32]* %"len_arr", i32 0, i32 0
  store i32 %".8", i32* %"elem_0.1"
  %"glShaderSource_fp" = load void (i32, i32, i8**, i32*)*, void (i32, i32, i8**, i32*)** @"glShaderSource_fp"
  %"shader.1" = load i32, i32* %"shader"
  %".10" = getelementptr inbounds [1 x i8*], [1 x i8*]* %"src_arr", i32 0, i32 0
  %".11" = getelementptr inbounds [1 x i32], [1 x i32]* %"len_arr", i32 0, i32 0
  call void %"glShaderSource_fp"(i32 %"shader.1", i32 1, i8** %".10", i32* %".11")
  %"glCompileShader_fp" = load void (i32)*, void (i32)** @"glCompileShader_fp"
  %"shader.2" = load i32, i32* %"shader"
  call void %"glCompileShader_fp"(i32 %"shader.2")
  %"shader.3" = load i32, i32* %"shader"
  ret i32 %"shader.3"
}

define i32 @"OpenGL__link_program__2__intE1__intE1__ret_intE1"(i32 %"vert", i32 %"frag")
{
entry:
  %"vert.addr" = alloca i32
  store i32 %"vert", i32* %"vert.addr"
  %"frag.addr" = alloca i32
  store i32 %"frag", i32* %"frag.addr"
  %"prog" = alloca i32
  %"glCreateProgram_fp" = load i32 ()*, i32 ()** @"glCreateProgram_fp"
  %"fp_call" = call i32 %"glCreateProgram_fp"()
  store i32 %"fp_call", i32* %"prog"
  %"glAttachShader_fp" = load void (i32, i32)*, void (i32, i32)** @"glAttachShader_fp"
  %"prog.1" = load i32, i32* %"prog"
  %"vert.1" = load i32, i32* %"vert.addr"
  call void %"glAttachShader_fp"(i32 %"prog.1", i32 %"vert.1")
  %"glAttachShader_fp.1" = load void (i32, i32)*, void (i32, i32)** @"glAttachShader_fp"
  %"prog.2" = load i32, i32* %"prog"
  %"frag.1" = load i32, i32* %"frag.addr"
  call void %"glAttachShader_fp.1"(i32 %"prog.2", i32 %"frag.1")
  %"glLinkProgram_fp" = load void (i32)*, void (i32)** @"glLinkProgram_fp"
  %"prog.3" = load i32, i32* %"prog"
  call void %"glLinkProgram_fp"(i32 %"prog.3")
  %"prog.4" = load i32, i32* %"prog"
  ret i32 %"prog.4"
}

define void @"OpenGL__gl_load_extensions__0__ret_voidE1"()
{
entry:
  %"str_stack" = alloca [13 x i8]
  %"str_char_0" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 0
  store i8 103, i8* %"str_char_0"
  %"str_char_1" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 1
  store i8 108, i8* %"str_char_1"
  %"str_char_2" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 2
  store i8 71, i8* %"str_char_2"
  %"str_char_3" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 3
  store i8 101, i8* %"str_char_3"
  %"str_char_4" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 4
  store i8 110, i8* %"str_char_4"
  %"str_char_5" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 5
  store i8 66, i8* %"str_char_5"
  %"str_char_6" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 6
  store i8 117, i8* %"str_char_6"
  %"str_char_7" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 7
  store i8 102, i8* %"str_char_7"
  %"str_char_8" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 8
  store i8 102, i8* %"str_char_8"
  %"str_char_9" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 9
  store i8 101, i8* %"str_char_9"
  %"str_char_10" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 10
  store i8 114, i8* %"str_char_10"
  %"str_char_11" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 11
  store i8 115, i8* %"str_char_11"
  %"str_char_12" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 12
  store i8 0, i8* %"str_char_12"
  %"arg0_decay" = getelementptr [13 x i8], [13 x i8]* %"str_stack", i32 0, i32 0
  %".15" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay")
  store i8* %".15", i8** @"OpenGL___glGenBuffers"
  %"str_stack.1" = alloca [16 x i8]
  %"str_char_0.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 103, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 108, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 68, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 101, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 101, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 116, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 101, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 66, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 117, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 102, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 102, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 101, i8* %"str_char_12.1"
  %"str_char_13" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 114, i8* %"str_char_13"
  %"str_char_14" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 115, i8* %"str_char_14"
  %"str_char_15" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 0, i8* %"str_char_15"
  %"arg0_decay.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.1", i32 0, i32 0
  %".33" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.1")
  store i8* %".33", i8** @"OpenGL___glDeleteBuffers"
  %"str_stack.2" = alloca [13 x i8]
  %"str_char_0.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 103, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 108, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 66, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 105, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 110, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 100, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 66, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 117, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 102, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 102, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 101, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 114, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 0, i8* %"str_char_12.2"
  %"arg0_decay.2" = getelementptr [13 x i8], [13 x i8]* %"str_stack.2", i32 0, i32 0
  %".48" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.2")
  store i8* %".48", i8** @"OpenGL___glBindBuffer"
  %"str_stack.3" = alloca [13 x i8]
  %"str_char_0.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 103, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 108, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 66, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 117, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 102, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 102, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 101, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 114, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 68, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 97, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 116, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 97, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 0, i8* %"str_char_12.3"
  %"arg0_decay.3" = getelementptr [13 x i8], [13 x i8]* %"str_stack.3", i32 0, i32 0
  %".63" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.3")
  store i8* %".63", i8** @"OpenGL___glBufferData"
  %"str_stack.4" = alloca [16 x i8]
  %"str_char_0.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 103, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 108, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 66, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 117, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 102, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 102, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 101, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 114, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 83, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 117, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 98, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 68, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 97, i8* %"str_char_12.4"
  %"str_char_13.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 116, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 97, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 0, i8* %"str_char_15.1"
  %"arg0_decay.4" = getelementptr [16 x i8], [16 x i8]* %"str_stack.4", i32 0, i32 0
  %".81" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.4")
  store i8* %".81", i8** @"OpenGL___glBufferSubData"
  %"str_stack.5" = alloca [12 x i8]
  %"str_char_0.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 103, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 108, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 77, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 97, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 112, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 66, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 117, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 102, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 102, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 101, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 114, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 0, i8* %"str_char_11.5"
  %"arg0_decay.5" = getelementptr [12 x i8], [12 x i8]* %"str_stack.5", i32 0, i32 0
  %".95" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.5")
  store i8* %".95", i8** @"OpenGL___glMapBuffer"
  %"str_stack.6" = alloca [14 x i8]
  %"str_char_0.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 103, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 108, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 85, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 110, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 109, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 97, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 112, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 66, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 117, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 102, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 102, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 101, i8* %"str_char_11.6"
  %"str_char_12.5" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 114, i8* %"str_char_12.5"
  %"str_char_13.2" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 0, i8* %"str_char_13.2"
  %"arg0_decay.6" = getelementptr [14 x i8], [14 x i8]* %"str_stack.6", i32 0, i32 0
  %".111" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.6")
  store i8* %".111", i8** @"OpenGL___glUnmapBuffer"
  %"str_stack.7" = alloca [18 x i8]
  %"str_char_0.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 103, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 108, i8* %"str_char_1.7"
  %"str_char_2.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 71, i8* %"str_char_2.7"
  %"str_char_3.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 101, i8* %"str_char_3.7"
  %"str_char_4.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 110, i8* %"str_char_4.7"
  %"str_char_5.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 86, i8* %"str_char_5.7"
  %"str_char_6.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 101, i8* %"str_char_6.7"
  %"str_char_7.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 114, i8* %"str_char_7.7"
  %"str_char_8.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 116, i8* %"str_char_8.7"
  %"str_char_9.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 101, i8* %"str_char_9.7"
  %"str_char_10.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 120, i8* %"str_char_10.7"
  %"str_char_11.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 65, i8* %"str_char_11.7"
  %"str_char_12.6" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 114, i8* %"str_char_12.6"
  %"str_char_13.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 114, i8* %"str_char_13.3"
  %"str_char_14.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 97, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 15
  store i8 121, i8* %"str_char_15.2"
  %"str_char_16" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 16
  store i8 115, i8* %"str_char_16"
  %"str_char_17" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 17
  store i8 0, i8* %"str_char_17"
  %"arg0_decay.7" = getelementptr [18 x i8], [18 x i8]* %"str_stack.7", i32 0, i32 0
  %".131" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.7")
  store i8* %".131", i8** @"OpenGL___glGenVertexArrays"
  %"str_stack.8" = alloca [21 x i8]
  %"str_char_0.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 103, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 108, i8* %"str_char_1.8"
  %"str_char_2.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 2
  store i8 68, i8* %"str_char_2.8"
  %"str_char_3.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 3
  store i8 101, i8* %"str_char_3.8"
  %"str_char_4.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 4
  store i8 108, i8* %"str_char_4.8"
  %"str_char_5.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 5
  store i8 101, i8* %"str_char_5.8"
  %"str_char_6.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 6
  store i8 116, i8* %"str_char_6.8"
  %"str_char_7.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 7
  store i8 101, i8* %"str_char_7.8"
  %"str_char_8.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 8
  store i8 86, i8* %"str_char_8.8"
  %"str_char_9.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 9
  store i8 101, i8* %"str_char_9.8"
  %"str_char_10.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 10
  store i8 114, i8* %"str_char_10.8"
  %"str_char_11.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 11
  store i8 116, i8* %"str_char_11.8"
  %"str_char_12.7" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 12
  store i8 101, i8* %"str_char_12.7"
  %"str_char_13.4" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 13
  store i8 120, i8* %"str_char_13.4"
  %"str_char_14.3" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 14
  store i8 65, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 15
  store i8 114, i8* %"str_char_15.3"
  %"str_char_16.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 16
  store i8 114, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 17
  store i8 97, i8* %"str_char_17.1"
  %"str_char_18" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 18
  store i8 121, i8* %"str_char_18"
  %"str_char_19" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 19
  store i8 115, i8* %"str_char_19"
  %"str_char_20" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 20
  store i8 0, i8* %"str_char_20"
  %"arg0_decay.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.8", i32 0, i32 0
  %".154" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.8")
  store i8* %".154", i8** @"OpenGL___glDeleteVertexArrays"
  %"str_stack.9" = alloca [18 x i8]
  %"str_char_0.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 0
  store i8 103, i8* %"str_char_0.9"
  %"str_char_1.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 1
  store i8 108, i8* %"str_char_1.9"
  %"str_char_2.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 2
  store i8 66, i8* %"str_char_2.9"
  %"str_char_3.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 3
  store i8 105, i8* %"str_char_3.9"
  %"str_char_4.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 4
  store i8 110, i8* %"str_char_4.9"
  %"str_char_5.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 5
  store i8 100, i8* %"str_char_5.9"
  %"str_char_6.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 6
  store i8 86, i8* %"str_char_6.9"
  %"str_char_7.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 7
  store i8 101, i8* %"str_char_7.9"
  %"str_char_8.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 8
  store i8 114, i8* %"str_char_8.9"
  %"str_char_9.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 9
  store i8 116, i8* %"str_char_9.9"
  %"str_char_10.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 10
  store i8 101, i8* %"str_char_10.9"
  %"str_char_11.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 11
  store i8 120, i8* %"str_char_11.9"
  %"str_char_12.8" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 12
  store i8 65, i8* %"str_char_12.8"
  %"str_char_13.5" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 13
  store i8 114, i8* %"str_char_13.5"
  %"str_char_14.4" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 14
  store i8 114, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 15
  store i8 97, i8* %"str_char_15.4"
  %"str_char_16.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 16
  store i8 121, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 17
  store i8 0, i8* %"str_char_17.2"
  %"arg0_decay.9" = getelementptr [18 x i8], [18 x i8]* %"str_stack.9", i32 0, i32 0
  %".174" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.9")
  store i8* %".174", i8** @"OpenGL___glBindVertexArray"
  %"str_stack.10" = alloca [26 x i8]
  %"str_char_0.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 0
  store i8 103, i8* %"str_char_0.10"
  %"str_char_1.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 1
  store i8 108, i8* %"str_char_1.10"
  %"str_char_2.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 2
  store i8 69, i8* %"str_char_2.10"
  %"str_char_3.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 3
  store i8 110, i8* %"str_char_3.10"
  %"str_char_4.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 4
  store i8 97, i8* %"str_char_4.10"
  %"str_char_5.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 5
  store i8 98, i8* %"str_char_5.10"
  %"str_char_6.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 6
  store i8 108, i8* %"str_char_6.10"
  %"str_char_7.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 7
  store i8 101, i8* %"str_char_7.10"
  %"str_char_8.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 8
  store i8 86, i8* %"str_char_8.10"
  %"str_char_9.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 9
  store i8 101, i8* %"str_char_9.10"
  %"str_char_10.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 10
  store i8 114, i8* %"str_char_10.10"
  %"str_char_11.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 11
  store i8 116, i8* %"str_char_11.10"
  %"str_char_12.9" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 12
  store i8 101, i8* %"str_char_12.9"
  %"str_char_13.6" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 13
  store i8 120, i8* %"str_char_13.6"
  %"str_char_14.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 14
  store i8 65, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 15
  store i8 116, i8* %"str_char_15.5"
  %"str_char_16.3" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 16
  store i8 116, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 17
  store i8 114, i8* %"str_char_17.3"
  %"str_char_18.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 18
  store i8 105, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 19
  store i8 98, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 20
  store i8 65, i8* %"str_char_20.1"
  %"str_char_21" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 21
  store i8 114, i8* %"str_char_21"
  %"str_char_22" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 22
  store i8 114, i8* %"str_char_22"
  %"str_char_23" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 23
  store i8 97, i8* %"str_char_23"
  %"str_char_24" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 24
  store i8 121, i8* %"str_char_24"
  %"str_char_25" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 25
  store i8 0, i8* %"str_char_25"
  %"arg0_decay.10" = getelementptr [26 x i8], [26 x i8]* %"str_stack.10", i32 0, i32 0
  %".202" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.10")
  store i8* %".202", i8** @"OpenGL___glEnableVertexAttribArray"
  %"str_stack.11" = alloca [27 x i8]
  %"str_char_0.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 0
  store i8 103, i8* %"str_char_0.11"
  %"str_char_1.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 1
  store i8 108, i8* %"str_char_1.11"
  %"str_char_2.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 2
  store i8 68, i8* %"str_char_2.11"
  %"str_char_3.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 3
  store i8 105, i8* %"str_char_3.11"
  %"str_char_4.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 4
  store i8 115, i8* %"str_char_4.11"
  %"str_char_5.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 5
  store i8 97, i8* %"str_char_5.11"
  %"str_char_6.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 6
  store i8 98, i8* %"str_char_6.11"
  %"str_char_7.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 7
  store i8 108, i8* %"str_char_7.11"
  %"str_char_8.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 8
  store i8 101, i8* %"str_char_8.11"
  %"str_char_9.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 9
  store i8 86, i8* %"str_char_9.11"
  %"str_char_10.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 10
  store i8 101, i8* %"str_char_10.11"
  %"str_char_11.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 11
  store i8 114, i8* %"str_char_11.11"
  %"str_char_12.10" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 12
  store i8 116, i8* %"str_char_12.10"
  %"str_char_13.7" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 13
  store i8 101, i8* %"str_char_13.7"
  %"str_char_14.6" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 14
  store i8 120, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 15
  store i8 65, i8* %"str_char_15.6"
  %"str_char_16.4" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 16
  store i8 116, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 17
  store i8 116, i8* %"str_char_17.4"
  %"str_char_18.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 18
  store i8 114, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 19
  store i8 105, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 20
  store i8 98, i8* %"str_char_20.2"
  %"str_char_21.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 21
  store i8 65, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 22
  store i8 114, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 23
  store i8 114, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 24
  store i8 97, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 25
  store i8 121, i8* %"str_char_25.1"
  %"str_char_26" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 26
  store i8 0, i8* %"str_char_26"
  %"arg0_decay.11" = getelementptr [27 x i8], [27 x i8]* %"str_stack.11", i32 0, i32 0
  %".231" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.11")
  store i8* %".231", i8** @"OpenGL___glDisableVertexAttribArray"
  %"str_stack.12" = alloca [22 x i8]
  %"str_char_0.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 0
  store i8 103, i8* %"str_char_0.12"
  %"str_char_1.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 1
  store i8 108, i8* %"str_char_1.12"
  %"str_char_2.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 2
  store i8 86, i8* %"str_char_2.12"
  %"str_char_3.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 3
  store i8 101, i8* %"str_char_3.12"
  %"str_char_4.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 4
  store i8 114, i8* %"str_char_4.12"
  %"str_char_5.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 5
  store i8 116, i8* %"str_char_5.12"
  %"str_char_6.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 6
  store i8 101, i8* %"str_char_6.12"
  %"str_char_7.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 7
  store i8 120, i8* %"str_char_7.12"
  %"str_char_8.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 8
  store i8 65, i8* %"str_char_8.12"
  %"str_char_9.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 9
  store i8 116, i8* %"str_char_9.12"
  %"str_char_10.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 10
  store i8 116, i8* %"str_char_10.12"
  %"str_char_11.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 11
  store i8 114, i8* %"str_char_11.12"
  %"str_char_12.11" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 12
  store i8 105, i8* %"str_char_12.11"
  %"str_char_13.8" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 13
  store i8 98, i8* %"str_char_13.8"
  %"str_char_14.7" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 14
  store i8 80, i8* %"str_char_14.7"
  %"str_char_15.7" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 15
  store i8 111, i8* %"str_char_15.7"
  %"str_char_16.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 16
  store i8 105, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 17
  store i8 110, i8* %"str_char_17.5"
  %"str_char_18.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 18
  store i8 116, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 19
  store i8 101, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 20
  store i8 114, i8* %"str_char_20.3"
  %"str_char_21.2" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 21
  store i8 0, i8* %"str_char_21.2"
  %"arg0_decay.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.12", i32 0, i32 0
  %".255" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.12")
  store i8* %".255", i8** @"OpenGL___glVertexAttribPointer"
  %"str_stack.13" = alloca [15 x i8]
  %"str_char_0.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 0
  store i8 103, i8* %"str_char_0.13"
  %"str_char_1.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 1
  store i8 108, i8* %"str_char_1.13"
  %"str_char_2.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 2
  store i8 67, i8* %"str_char_2.13"
  %"str_char_3.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 3
  store i8 114, i8* %"str_char_3.13"
  %"str_char_4.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 4
  store i8 101, i8* %"str_char_4.13"
  %"str_char_5.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 5
  store i8 97, i8* %"str_char_5.13"
  %"str_char_6.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 6
  store i8 116, i8* %"str_char_6.13"
  %"str_char_7.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 7
  store i8 101, i8* %"str_char_7.13"
  %"str_char_8.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 8
  store i8 83, i8* %"str_char_8.13"
  %"str_char_9.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 9
  store i8 104, i8* %"str_char_9.13"
  %"str_char_10.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 10
  store i8 97, i8* %"str_char_10.13"
  %"str_char_11.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 11
  store i8 100, i8* %"str_char_11.13"
  %"str_char_12.12" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 12
  store i8 101, i8* %"str_char_12.12"
  %"str_char_13.9" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 13
  store i8 114, i8* %"str_char_13.9"
  %"str_char_14.8" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 14
  store i8 0, i8* %"str_char_14.8"
  %"arg0_decay.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.13", i32 0, i32 0
  %".272" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.13")
  store i8* %".272", i8** @"OpenGL___glCreateShader"
  %"str_stack.14" = alloca [15 x i8]
  %"str_char_0.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 0
  store i8 103, i8* %"str_char_0.14"
  %"str_char_1.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 1
  store i8 108, i8* %"str_char_1.14"
  %"str_char_2.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 2
  store i8 68, i8* %"str_char_2.14"
  %"str_char_3.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 3
  store i8 101, i8* %"str_char_3.14"
  %"str_char_4.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 4
  store i8 108, i8* %"str_char_4.14"
  %"str_char_5.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 5
  store i8 101, i8* %"str_char_5.14"
  %"str_char_6.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 6
  store i8 116, i8* %"str_char_6.14"
  %"str_char_7.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 7
  store i8 101, i8* %"str_char_7.14"
  %"str_char_8.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 8
  store i8 83, i8* %"str_char_8.14"
  %"str_char_9.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 9
  store i8 104, i8* %"str_char_9.14"
  %"str_char_10.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 10
  store i8 97, i8* %"str_char_10.14"
  %"str_char_11.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 11
  store i8 100, i8* %"str_char_11.14"
  %"str_char_12.13" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 12
  store i8 101, i8* %"str_char_12.13"
  %"str_char_13.10" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 13
  store i8 114, i8* %"str_char_13.10"
  %"str_char_14.9" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 14
  store i8 0, i8* %"str_char_14.9"
  %"arg0_decay.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.14", i32 0, i32 0
  %".289" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.14")
  store i8* %".289", i8** @"OpenGL___glDeleteShader"
  %"str_stack.15" = alloca [15 x i8]
  %"str_char_0.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 0
  store i8 103, i8* %"str_char_0.15"
  %"str_char_1.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 1
  store i8 108, i8* %"str_char_1.15"
  %"str_char_2.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 2
  store i8 83, i8* %"str_char_2.15"
  %"str_char_3.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 3
  store i8 104, i8* %"str_char_3.15"
  %"str_char_4.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 4
  store i8 97, i8* %"str_char_4.15"
  %"str_char_5.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 5
  store i8 100, i8* %"str_char_5.15"
  %"str_char_6.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 6
  store i8 101, i8* %"str_char_6.15"
  %"str_char_7.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 7
  store i8 114, i8* %"str_char_7.15"
  %"str_char_8.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 8
  store i8 83, i8* %"str_char_8.15"
  %"str_char_9.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 9
  store i8 111, i8* %"str_char_9.15"
  %"str_char_10.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 10
  store i8 117, i8* %"str_char_10.15"
  %"str_char_11.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 11
  store i8 114, i8* %"str_char_11.15"
  %"str_char_12.14" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 12
  store i8 99, i8* %"str_char_12.14"
  %"str_char_13.11" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 13
  store i8 101, i8* %"str_char_13.11"
  %"str_char_14.10" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 14
  store i8 0, i8* %"str_char_14.10"
  %"arg0_decay.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.15", i32 0, i32 0
  %".306" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.15")
  store i8* %".306", i8** @"OpenGL___glShaderSource"
  %"str_stack.16" = alloca [16 x i8]
  %"str_char_0.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 0
  store i8 103, i8* %"str_char_0.16"
  %"str_char_1.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 1
  store i8 108, i8* %"str_char_1.16"
  %"str_char_2.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 2
  store i8 67, i8* %"str_char_2.16"
  %"str_char_3.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 3
  store i8 111, i8* %"str_char_3.16"
  %"str_char_4.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 4
  store i8 109, i8* %"str_char_4.16"
  %"str_char_5.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 5
  store i8 112, i8* %"str_char_5.16"
  %"str_char_6.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 6
  store i8 105, i8* %"str_char_6.16"
  %"str_char_7.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 7
  store i8 108, i8* %"str_char_7.16"
  %"str_char_8.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 8
  store i8 101, i8* %"str_char_8.16"
  %"str_char_9.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 9
  store i8 83, i8* %"str_char_9.16"
  %"str_char_10.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 10
  store i8 104, i8* %"str_char_10.16"
  %"str_char_11.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 11
  store i8 97, i8* %"str_char_11.16"
  %"str_char_12.15" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 12
  store i8 100, i8* %"str_char_12.15"
  %"str_char_13.12" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 13
  store i8 101, i8* %"str_char_13.12"
  %"str_char_14.11" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 14
  store i8 114, i8* %"str_char_14.11"
  %"str_char_15.8" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 15
  store i8 0, i8* %"str_char_15.8"
  %"arg0_decay.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.16", i32 0, i32 0
  %".324" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.16")
  store i8* %".324", i8** @"OpenGL___glCompileShader"
  %"str_stack.17" = alloca [14 x i8]
  %"str_char_0.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 0
  store i8 103, i8* %"str_char_0.17"
  %"str_char_1.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 1
  store i8 108, i8* %"str_char_1.17"
  %"str_char_2.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 2
  store i8 71, i8* %"str_char_2.17"
  %"str_char_3.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 3
  store i8 101, i8* %"str_char_3.17"
  %"str_char_4.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 4
  store i8 116, i8* %"str_char_4.17"
  %"str_char_5.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 5
  store i8 83, i8* %"str_char_5.17"
  %"str_char_6.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 6
  store i8 104, i8* %"str_char_6.17"
  %"str_char_7.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 7
  store i8 97, i8* %"str_char_7.17"
  %"str_char_8.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 8
  store i8 100, i8* %"str_char_8.17"
  %"str_char_9.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 9
  store i8 101, i8* %"str_char_9.17"
  %"str_char_10.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 10
  store i8 114, i8* %"str_char_10.17"
  %"str_char_11.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 11
  store i8 105, i8* %"str_char_11.17"
  %"str_char_12.16" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 12
  store i8 118, i8* %"str_char_12.16"
  %"str_char_13.13" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 13
  store i8 0, i8* %"str_char_13.13"
  %"arg0_decay.17" = getelementptr [14 x i8], [14 x i8]* %"str_stack.17", i32 0, i32 0
  %".340" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.17")
  store i8* %".340", i8** @"OpenGL___glGetShaderiv"
  %"str_stack.18" = alloca [19 x i8]
  %"str_char_0.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 0
  store i8 103, i8* %"str_char_0.18"
  %"str_char_1.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 1
  store i8 108, i8* %"str_char_1.18"
  %"str_char_2.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 2
  store i8 71, i8* %"str_char_2.18"
  %"str_char_3.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 3
  store i8 101, i8* %"str_char_3.18"
  %"str_char_4.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 4
  store i8 116, i8* %"str_char_4.18"
  %"str_char_5.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 5
  store i8 83, i8* %"str_char_5.18"
  %"str_char_6.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 6
  store i8 104, i8* %"str_char_6.18"
  %"str_char_7.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 7
  store i8 97, i8* %"str_char_7.18"
  %"str_char_8.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 8
  store i8 100, i8* %"str_char_8.18"
  %"str_char_9.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 9
  store i8 101, i8* %"str_char_9.18"
  %"str_char_10.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 10
  store i8 114, i8* %"str_char_10.18"
  %"str_char_11.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 11
  store i8 73, i8* %"str_char_11.18"
  %"str_char_12.17" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 12
  store i8 110, i8* %"str_char_12.17"
  %"str_char_13.14" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 13
  store i8 102, i8* %"str_char_13.14"
  %"str_char_14.12" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 14
  store i8 111, i8* %"str_char_14.12"
  %"str_char_15.9" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 15
  store i8 76, i8* %"str_char_15.9"
  %"str_char_16.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 16
  store i8 111, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 17
  store i8 103, i8* %"str_char_17.6"
  %"str_char_18.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 18
  store i8 0, i8* %"str_char_18.4"
  %"arg0_decay.18" = getelementptr [19 x i8], [19 x i8]* %"str_stack.18", i32 0, i32 0
  %".361" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.18")
  store i8* %".361", i8** @"OpenGL___glGetShaderInfoLog"
  %"str_stack.19" = alloca [16 x i8]
  %"str_char_0.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 0
  store i8 103, i8* %"str_char_0.19"
  %"str_char_1.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 1
  store i8 108, i8* %"str_char_1.19"
  %"str_char_2.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 2
  store i8 67, i8* %"str_char_2.19"
  %"str_char_3.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 3
  store i8 114, i8* %"str_char_3.19"
  %"str_char_4.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 4
  store i8 101, i8* %"str_char_4.19"
  %"str_char_5.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 5
  store i8 97, i8* %"str_char_5.19"
  %"str_char_6.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 6
  store i8 116, i8* %"str_char_6.19"
  %"str_char_7.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 7
  store i8 101, i8* %"str_char_7.19"
  %"str_char_8.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 8
  store i8 80, i8* %"str_char_8.19"
  %"str_char_9.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 9
  store i8 114, i8* %"str_char_9.19"
  %"str_char_10.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 10
  store i8 111, i8* %"str_char_10.19"
  %"str_char_11.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 11
  store i8 103, i8* %"str_char_11.19"
  %"str_char_12.18" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 12
  store i8 114, i8* %"str_char_12.18"
  %"str_char_13.15" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 13
  store i8 97, i8* %"str_char_13.15"
  %"str_char_14.13" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 14
  store i8 109, i8* %"str_char_14.13"
  %"str_char_15.10" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 15
  store i8 0, i8* %"str_char_15.10"
  %"arg0_decay.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.19", i32 0, i32 0
  %".379" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.19")
  store i8* %".379", i8** @"OpenGL___glCreateProgram"
  %"str_stack.20" = alloca [16 x i8]
  %"str_char_0.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 0
  store i8 103, i8* %"str_char_0.20"
  %"str_char_1.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 1
  store i8 108, i8* %"str_char_1.20"
  %"str_char_2.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 2
  store i8 68, i8* %"str_char_2.20"
  %"str_char_3.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 3
  store i8 101, i8* %"str_char_3.20"
  %"str_char_4.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 4
  store i8 108, i8* %"str_char_4.20"
  %"str_char_5.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 5
  store i8 101, i8* %"str_char_5.20"
  %"str_char_6.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 6
  store i8 116, i8* %"str_char_6.20"
  %"str_char_7.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 7
  store i8 101, i8* %"str_char_7.20"
  %"str_char_8.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 8
  store i8 80, i8* %"str_char_8.20"
  %"str_char_9.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 9
  store i8 114, i8* %"str_char_9.20"
  %"str_char_10.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 10
  store i8 111, i8* %"str_char_10.20"
  %"str_char_11.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 11
  store i8 103, i8* %"str_char_11.20"
  %"str_char_12.19" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 12
  store i8 114, i8* %"str_char_12.19"
  %"str_char_13.16" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 13
  store i8 97, i8* %"str_char_13.16"
  %"str_char_14.14" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 14
  store i8 109, i8* %"str_char_14.14"
  %"str_char_15.11" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 15
  store i8 0, i8* %"str_char_15.11"
  %"arg0_decay.20" = getelementptr [16 x i8], [16 x i8]* %"str_stack.20", i32 0, i32 0
  %".397" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.20")
  store i8* %".397", i8** @"OpenGL___glDeleteProgram"
  %"str_stack.21" = alloca [15 x i8]
  %"str_char_0.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 0
  store i8 103, i8* %"str_char_0.21"
  %"str_char_1.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 1
  store i8 108, i8* %"str_char_1.21"
  %"str_char_2.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 2
  store i8 65, i8* %"str_char_2.21"
  %"str_char_3.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 3
  store i8 116, i8* %"str_char_3.21"
  %"str_char_4.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 4
  store i8 116, i8* %"str_char_4.21"
  %"str_char_5.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 5
  store i8 97, i8* %"str_char_5.21"
  %"str_char_6.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 6
  store i8 99, i8* %"str_char_6.21"
  %"str_char_7.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 7
  store i8 104, i8* %"str_char_7.21"
  %"str_char_8.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 8
  store i8 83, i8* %"str_char_8.21"
  %"str_char_9.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 9
  store i8 104, i8* %"str_char_9.21"
  %"str_char_10.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 10
  store i8 97, i8* %"str_char_10.21"
  %"str_char_11.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 11
  store i8 100, i8* %"str_char_11.21"
  %"str_char_12.20" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 12
  store i8 101, i8* %"str_char_12.20"
  %"str_char_13.17" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 13
  store i8 114, i8* %"str_char_13.17"
  %"str_char_14.15" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 14
  store i8 0, i8* %"str_char_14.15"
  %"arg0_decay.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.21", i32 0, i32 0
  %".414" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.21")
  store i8* %".414", i8** @"OpenGL___glAttachShader"
  %"str_stack.22" = alloca [15 x i8]
  %"str_char_0.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 0
  store i8 103, i8* %"str_char_0.22"
  %"str_char_1.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 1
  store i8 108, i8* %"str_char_1.22"
  %"str_char_2.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 2
  store i8 68, i8* %"str_char_2.22"
  %"str_char_3.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 3
  store i8 101, i8* %"str_char_3.22"
  %"str_char_4.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 4
  store i8 116, i8* %"str_char_4.22"
  %"str_char_5.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 5
  store i8 97, i8* %"str_char_5.22"
  %"str_char_6.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 6
  store i8 99, i8* %"str_char_6.22"
  %"str_char_7.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 7
  store i8 104, i8* %"str_char_7.22"
  %"str_char_8.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 8
  store i8 83, i8* %"str_char_8.22"
  %"str_char_9.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 9
  store i8 104, i8* %"str_char_9.22"
  %"str_char_10.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 10
  store i8 97, i8* %"str_char_10.22"
  %"str_char_11.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 11
  store i8 100, i8* %"str_char_11.22"
  %"str_char_12.21" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 12
  store i8 101, i8* %"str_char_12.21"
  %"str_char_13.18" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 13
  store i8 114, i8* %"str_char_13.18"
  %"str_char_14.16" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 14
  store i8 0, i8* %"str_char_14.16"
  %"arg0_decay.22" = getelementptr [15 x i8], [15 x i8]* %"str_stack.22", i32 0, i32 0
  %".431" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.22")
  store i8* %".431", i8** @"OpenGL___glDetachShader"
  %"str_stack.23" = alloca [14 x i8]
  %"str_char_0.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 0
  store i8 103, i8* %"str_char_0.23"
  %"str_char_1.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 1
  store i8 108, i8* %"str_char_1.23"
  %"str_char_2.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 2
  store i8 76, i8* %"str_char_2.23"
  %"str_char_3.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 3
  store i8 105, i8* %"str_char_3.23"
  %"str_char_4.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 4
  store i8 110, i8* %"str_char_4.23"
  %"str_char_5.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 5
  store i8 107, i8* %"str_char_5.23"
  %"str_char_6.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 6
  store i8 80, i8* %"str_char_6.23"
  %"str_char_7.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 7
  store i8 114, i8* %"str_char_7.23"
  %"str_char_8.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 8
  store i8 111, i8* %"str_char_8.23"
  %"str_char_9.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 9
  store i8 103, i8* %"str_char_9.23"
  %"str_char_10.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 10
  store i8 114, i8* %"str_char_10.23"
  %"str_char_11.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 11
  store i8 97, i8* %"str_char_11.23"
  %"str_char_12.22" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 12
  store i8 109, i8* %"str_char_12.22"
  %"str_char_13.19" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 13
  store i8 0, i8* %"str_char_13.19"
  %"arg0_decay.23" = getelementptr [14 x i8], [14 x i8]* %"str_stack.23", i32 0, i32 0
  %".447" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.23")
  store i8* %".447", i8** @"OpenGL___glLinkProgram"
  %"str_stack.24" = alloca [13 x i8]
  %"str_char_0.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 0
  store i8 103, i8* %"str_char_0.24"
  %"str_char_1.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 1
  store i8 108, i8* %"str_char_1.24"
  %"str_char_2.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 2
  store i8 85, i8* %"str_char_2.24"
  %"str_char_3.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 3
  store i8 115, i8* %"str_char_3.24"
  %"str_char_4.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 4
  store i8 101, i8* %"str_char_4.24"
  %"str_char_5.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 5
  store i8 80, i8* %"str_char_5.24"
  %"str_char_6.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 6
  store i8 114, i8* %"str_char_6.24"
  %"str_char_7.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 7
  store i8 111, i8* %"str_char_7.24"
  %"str_char_8.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 8
  store i8 103, i8* %"str_char_8.24"
  %"str_char_9.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 9
  store i8 114, i8* %"str_char_9.24"
  %"str_char_10.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 10
  store i8 97, i8* %"str_char_10.24"
  %"str_char_11.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 11
  store i8 109, i8* %"str_char_11.24"
  %"str_char_12.23" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 12
  store i8 0, i8* %"str_char_12.23"
  %"arg0_decay.24" = getelementptr [13 x i8], [13 x i8]* %"str_stack.24", i32 0, i32 0
  %".462" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.24")
  store i8* %".462", i8** @"OpenGL___glUseProgram"
  %"str_stack.25" = alloca [15 x i8]
  %"str_char_0.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 0
  store i8 103, i8* %"str_char_0.25"
  %"str_char_1.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 1
  store i8 108, i8* %"str_char_1.25"
  %"str_char_2.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 2
  store i8 71, i8* %"str_char_2.25"
  %"str_char_3.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 3
  store i8 101, i8* %"str_char_3.25"
  %"str_char_4.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 4
  store i8 116, i8* %"str_char_4.25"
  %"str_char_5.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 5
  store i8 80, i8* %"str_char_5.25"
  %"str_char_6.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 6
  store i8 114, i8* %"str_char_6.25"
  %"str_char_7.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 7
  store i8 111, i8* %"str_char_7.25"
  %"str_char_8.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 8
  store i8 103, i8* %"str_char_8.25"
  %"str_char_9.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 9
  store i8 114, i8* %"str_char_9.25"
  %"str_char_10.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 10
  store i8 97, i8* %"str_char_10.25"
  %"str_char_11.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 11
  store i8 109, i8* %"str_char_11.25"
  %"str_char_12.24" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 12
  store i8 105, i8* %"str_char_12.24"
  %"str_char_13.20" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 13
  store i8 118, i8* %"str_char_13.20"
  %"str_char_14.17" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 14
  store i8 0, i8* %"str_char_14.17"
  %"arg0_decay.25" = getelementptr [15 x i8], [15 x i8]* %"str_stack.25", i32 0, i32 0
  %".479" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.25")
  store i8* %".479", i8** @"OpenGL___glGetProgramiv"
  %"str_stack.26" = alloca [20 x i8]
  %"str_char_0.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 0
  store i8 103, i8* %"str_char_0.26"
  %"str_char_1.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 1
  store i8 108, i8* %"str_char_1.26"
  %"str_char_2.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 2
  store i8 71, i8* %"str_char_2.26"
  %"str_char_3.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 3
  store i8 101, i8* %"str_char_3.26"
  %"str_char_4.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 4
  store i8 116, i8* %"str_char_4.26"
  %"str_char_5.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 5
  store i8 80, i8* %"str_char_5.26"
  %"str_char_6.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 6
  store i8 114, i8* %"str_char_6.26"
  %"str_char_7.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 7
  store i8 111, i8* %"str_char_7.26"
  %"str_char_8.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 8
  store i8 103, i8* %"str_char_8.26"
  %"str_char_9.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 9
  store i8 114, i8* %"str_char_9.26"
  %"str_char_10.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 10
  store i8 97, i8* %"str_char_10.26"
  %"str_char_11.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 11
  store i8 109, i8* %"str_char_11.26"
  %"str_char_12.25" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 12
  store i8 73, i8* %"str_char_12.25"
  %"str_char_13.21" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 13
  store i8 110, i8* %"str_char_13.21"
  %"str_char_14.18" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 14
  store i8 102, i8* %"str_char_14.18"
  %"str_char_15.12" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 15
  store i8 111, i8* %"str_char_15.12"
  %"str_char_16.7" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 16
  store i8 76, i8* %"str_char_16.7"
  %"str_char_17.7" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 17
  store i8 111, i8* %"str_char_17.7"
  %"str_char_18.5" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 18
  store i8 103, i8* %"str_char_18.5"
  %"str_char_19.4" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 19
  store i8 0, i8* %"str_char_19.4"
  %"arg0_decay.26" = getelementptr [20 x i8], [20 x i8]* %"str_stack.26", i32 0, i32 0
  %".501" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.26")
  store i8* %".501", i8** @"OpenGL___glGetProgramInfoLog"
  %"str_stack.27" = alloca [21 x i8]
  %"str_char_0.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 0
  store i8 103, i8* %"str_char_0.27"
  %"str_char_1.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 1
  store i8 108, i8* %"str_char_1.27"
  %"str_char_2.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 2
  store i8 66, i8* %"str_char_2.27"
  %"str_char_3.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 3
  store i8 105, i8* %"str_char_3.27"
  %"str_char_4.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 4
  store i8 110, i8* %"str_char_4.27"
  %"str_char_5.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 5
  store i8 100, i8* %"str_char_5.27"
  %"str_char_6.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 6
  store i8 65, i8* %"str_char_6.27"
  %"str_char_7.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 7
  store i8 116, i8* %"str_char_7.27"
  %"str_char_8.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 8
  store i8 116, i8* %"str_char_8.27"
  %"str_char_9.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 9
  store i8 114, i8* %"str_char_9.27"
  %"str_char_10.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 10
  store i8 105, i8* %"str_char_10.27"
  %"str_char_11.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 11
  store i8 98, i8* %"str_char_11.27"
  %"str_char_12.26" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 12
  store i8 76, i8* %"str_char_12.26"
  %"str_char_13.22" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 13
  store i8 111, i8* %"str_char_13.22"
  %"str_char_14.19" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 14
  store i8 99, i8* %"str_char_14.19"
  %"str_char_15.13" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 15
  store i8 97, i8* %"str_char_15.13"
  %"str_char_16.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 16
  store i8 116, i8* %"str_char_16.8"
  %"str_char_17.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 17
  store i8 105, i8* %"str_char_17.8"
  %"str_char_18.6" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 18
  store i8 111, i8* %"str_char_18.6"
  %"str_char_19.5" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 19
  store i8 110, i8* %"str_char_19.5"
  %"str_char_20.4" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 20
  store i8 0, i8* %"str_char_20.4"
  %"arg0_decay.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.27", i32 0, i32 0
  %".524" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.27")
  store i8* %".524", i8** @"OpenGL___glBindAttribLocation"
  %"str_stack.28" = alloca [21 x i8]
  %"str_char_0.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 0
  store i8 103, i8* %"str_char_0.28"
  %"str_char_1.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 1
  store i8 108, i8* %"str_char_1.28"
  %"str_char_2.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 2
  store i8 71, i8* %"str_char_2.28"
  %"str_char_3.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 3
  store i8 101, i8* %"str_char_3.28"
  %"str_char_4.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 4
  store i8 116, i8* %"str_char_4.28"
  %"str_char_5.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 5
  store i8 85, i8* %"str_char_5.28"
  %"str_char_6.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 6
  store i8 110, i8* %"str_char_6.28"
  %"str_char_7.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 7
  store i8 105, i8* %"str_char_7.28"
  %"str_char_8.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 8
  store i8 102, i8* %"str_char_8.28"
  %"str_char_9.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 9
  store i8 111, i8* %"str_char_9.28"
  %"str_char_10.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 10
  store i8 114, i8* %"str_char_10.28"
  %"str_char_11.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 11
  store i8 109, i8* %"str_char_11.28"
  %"str_char_12.27" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 12
  store i8 76, i8* %"str_char_12.27"
  %"str_char_13.23" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 13
  store i8 111, i8* %"str_char_13.23"
  %"str_char_14.20" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 14
  store i8 99, i8* %"str_char_14.20"
  %"str_char_15.14" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 15
  store i8 97, i8* %"str_char_15.14"
  %"str_char_16.9" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 16
  store i8 116, i8* %"str_char_16.9"
  %"str_char_17.9" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 17
  store i8 105, i8* %"str_char_17.9"
  %"str_char_18.7" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 18
  store i8 111, i8* %"str_char_18.7"
  %"str_char_19.6" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 19
  store i8 110, i8* %"str_char_19.6"
  %"str_char_20.5" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 20
  store i8 0, i8* %"str_char_20.5"
  %"arg0_decay.28" = getelementptr [21 x i8], [21 x i8]* %"str_stack.28", i32 0, i32 0
  %".547" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.28")
  store i8* %".547", i8** @"OpenGL___glGetUniformLocation"
  %"str_stack.29" = alloca [12 x i8]
  %"str_char_0.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 0
  store i8 103, i8* %"str_char_0.29"
  %"str_char_1.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 1
  store i8 108, i8* %"str_char_1.29"
  %"str_char_2.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 2
  store i8 85, i8* %"str_char_2.29"
  %"str_char_3.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 3
  store i8 110, i8* %"str_char_3.29"
  %"str_char_4.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 4
  store i8 105, i8* %"str_char_4.29"
  %"str_char_5.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 5
  store i8 102, i8* %"str_char_5.29"
  %"str_char_6.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 6
  store i8 111, i8* %"str_char_6.29"
  %"str_char_7.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 7
  store i8 114, i8* %"str_char_7.29"
  %"str_char_8.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 8
  store i8 109, i8* %"str_char_8.29"
  %"str_char_9.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 9
  store i8 49, i8* %"str_char_9.29"
  %"str_char_10.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 10
  store i8 105, i8* %"str_char_10.29"
  %"str_char_11.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 11
  store i8 0, i8* %"str_char_11.29"
  %"arg0_decay.29" = getelementptr [12 x i8], [12 x i8]* %"str_stack.29", i32 0, i32 0
  %".561" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.29")
  store i8* %".561", i8** @"OpenGL___glUniform1i"
  %"str_stack.30" = alloca [12 x i8]
  %"str_char_0.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 0
  store i8 103, i8* %"str_char_0.30"
  %"str_char_1.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 1
  store i8 108, i8* %"str_char_1.30"
  %"str_char_2.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 2
  store i8 85, i8* %"str_char_2.30"
  %"str_char_3.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 3
  store i8 110, i8* %"str_char_3.30"
  %"str_char_4.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 4
  store i8 105, i8* %"str_char_4.30"
  %"str_char_5.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 5
  store i8 102, i8* %"str_char_5.30"
  %"str_char_6.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 6
  store i8 111, i8* %"str_char_6.30"
  %"str_char_7.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 7
  store i8 114, i8* %"str_char_7.30"
  %"str_char_8.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 8
  store i8 109, i8* %"str_char_8.30"
  %"str_char_9.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 9
  store i8 49, i8* %"str_char_9.30"
  %"str_char_10.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 10
  store i8 102, i8* %"str_char_10.30"
  %"str_char_11.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 11
  store i8 0, i8* %"str_char_11.30"
  %"arg0_decay.30" = getelementptr [12 x i8], [12 x i8]* %"str_stack.30", i32 0, i32 0
  %".575" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.30")
  store i8* %".575", i8** @"OpenGL___glUniform1f"
  %"str_stack.31" = alloca [12 x i8]
  %"str_char_0.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 0
  store i8 103, i8* %"str_char_0.31"
  %"str_char_1.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 1
  store i8 108, i8* %"str_char_1.31"
  %"str_char_2.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 2
  store i8 85, i8* %"str_char_2.31"
  %"str_char_3.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 3
  store i8 110, i8* %"str_char_3.31"
  %"str_char_4.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 4
  store i8 105, i8* %"str_char_4.31"
  %"str_char_5.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 5
  store i8 102, i8* %"str_char_5.31"
  %"str_char_6.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 6
  store i8 111, i8* %"str_char_6.31"
  %"str_char_7.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 7
  store i8 114, i8* %"str_char_7.31"
  %"str_char_8.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 8
  store i8 109, i8* %"str_char_8.31"
  %"str_char_9.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 9
  store i8 50, i8* %"str_char_9.31"
  %"str_char_10.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 10
  store i8 102, i8* %"str_char_10.31"
  %"str_char_11.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 11
  store i8 0, i8* %"str_char_11.31"
  %"arg0_decay.31" = getelementptr [12 x i8], [12 x i8]* %"str_stack.31", i32 0, i32 0
  %".589" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.31")
  store i8* %".589", i8** @"OpenGL___glUniform2f"
  %"str_stack.32" = alloca [12 x i8]
  %"str_char_0.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 0
  store i8 103, i8* %"str_char_0.32"
  %"str_char_1.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 1
  store i8 108, i8* %"str_char_1.32"
  %"str_char_2.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 2
  store i8 85, i8* %"str_char_2.32"
  %"str_char_3.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 3
  store i8 110, i8* %"str_char_3.32"
  %"str_char_4.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 4
  store i8 105, i8* %"str_char_4.32"
  %"str_char_5.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 5
  store i8 102, i8* %"str_char_5.32"
  %"str_char_6.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 6
  store i8 111, i8* %"str_char_6.32"
  %"str_char_7.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 7
  store i8 114, i8* %"str_char_7.32"
  %"str_char_8.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 8
  store i8 109, i8* %"str_char_8.32"
  %"str_char_9.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 9
  store i8 51, i8* %"str_char_9.32"
  %"str_char_10.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 10
  store i8 102, i8* %"str_char_10.32"
  %"str_char_11.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 11
  store i8 0, i8* %"str_char_11.32"
  %"arg0_decay.32" = getelementptr [12 x i8], [12 x i8]* %"str_stack.32", i32 0, i32 0
  %".603" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.32")
  store i8* %".603", i8** @"OpenGL___glUniform3f"
  %"str_stack.33" = alloca [12 x i8]
  %"str_char_0.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 0
  store i8 103, i8* %"str_char_0.33"
  %"str_char_1.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 1
  store i8 108, i8* %"str_char_1.33"
  %"str_char_2.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 2
  store i8 85, i8* %"str_char_2.33"
  %"str_char_3.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 3
  store i8 110, i8* %"str_char_3.33"
  %"str_char_4.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 4
  store i8 105, i8* %"str_char_4.33"
  %"str_char_5.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 5
  store i8 102, i8* %"str_char_5.33"
  %"str_char_6.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 6
  store i8 111, i8* %"str_char_6.33"
  %"str_char_7.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 7
  store i8 114, i8* %"str_char_7.33"
  %"str_char_8.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 8
  store i8 109, i8* %"str_char_8.33"
  %"str_char_9.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 9
  store i8 52, i8* %"str_char_9.33"
  %"str_char_10.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 10
  store i8 102, i8* %"str_char_10.33"
  %"str_char_11.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 11
  store i8 0, i8* %"str_char_11.33"
  %"arg0_decay.33" = getelementptr [12 x i8], [12 x i8]* %"str_stack.33", i32 0, i32 0
  %".617" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.33")
  store i8* %".617", i8** @"OpenGL___glUniform4f"
  %"str_stack.34" = alloca [13 x i8]
  %"str_char_0.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 0
  store i8 103, i8* %"str_char_0.34"
  %"str_char_1.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 1
  store i8 108, i8* %"str_char_1.34"
  %"str_char_2.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 2
  store i8 85, i8* %"str_char_2.34"
  %"str_char_3.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 3
  store i8 110, i8* %"str_char_3.34"
  %"str_char_4.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 4
  store i8 105, i8* %"str_char_4.34"
  %"str_char_5.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 5
  store i8 102, i8* %"str_char_5.34"
  %"str_char_6.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 6
  store i8 111, i8* %"str_char_6.34"
  %"str_char_7.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 7
  store i8 114, i8* %"str_char_7.34"
  %"str_char_8.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 8
  store i8 109, i8* %"str_char_8.34"
  %"str_char_9.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 9
  store i8 49, i8* %"str_char_9.34"
  %"str_char_10.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 10
  store i8 105, i8* %"str_char_10.34"
  %"str_char_11.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 11
  store i8 118, i8* %"str_char_11.34"
  %"str_char_12.28" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 12
  store i8 0, i8* %"str_char_12.28"
  %"arg0_decay.34" = getelementptr [13 x i8], [13 x i8]* %"str_stack.34", i32 0, i32 0
  %".632" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.34")
  store i8* %".632", i8** @"OpenGL___glUniform1iv"
  %"str_stack.35" = alloca [13 x i8]
  %"str_char_0.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 0
  store i8 103, i8* %"str_char_0.35"
  %"str_char_1.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 1
  store i8 108, i8* %"str_char_1.35"
  %"str_char_2.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 2
  store i8 85, i8* %"str_char_2.35"
  %"str_char_3.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 3
  store i8 110, i8* %"str_char_3.35"
  %"str_char_4.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 4
  store i8 105, i8* %"str_char_4.35"
  %"str_char_5.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 5
  store i8 102, i8* %"str_char_5.35"
  %"str_char_6.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 6
  store i8 111, i8* %"str_char_6.35"
  %"str_char_7.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 7
  store i8 114, i8* %"str_char_7.35"
  %"str_char_8.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 8
  store i8 109, i8* %"str_char_8.35"
  %"str_char_9.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 9
  store i8 50, i8* %"str_char_9.35"
  %"str_char_10.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 10
  store i8 102, i8* %"str_char_10.35"
  %"str_char_11.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 11
  store i8 118, i8* %"str_char_11.35"
  %"str_char_12.29" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 12
  store i8 0, i8* %"str_char_12.29"
  %"arg0_decay.35" = getelementptr [13 x i8], [13 x i8]* %"str_stack.35", i32 0, i32 0
  %".647" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.35")
  store i8* %".647", i8** @"OpenGL___glUniform2fv"
  %"str_stack.36" = alloca [13 x i8]
  %"str_char_0.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 0
  store i8 103, i8* %"str_char_0.36"
  %"str_char_1.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 1
  store i8 108, i8* %"str_char_1.36"
  %"str_char_2.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 2
  store i8 85, i8* %"str_char_2.36"
  %"str_char_3.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 3
  store i8 110, i8* %"str_char_3.36"
  %"str_char_4.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 4
  store i8 105, i8* %"str_char_4.36"
  %"str_char_5.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 5
  store i8 102, i8* %"str_char_5.36"
  %"str_char_6.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 6
  store i8 111, i8* %"str_char_6.36"
  %"str_char_7.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 7
  store i8 114, i8* %"str_char_7.36"
  %"str_char_8.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 8
  store i8 109, i8* %"str_char_8.36"
  %"str_char_9.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 9
  store i8 51, i8* %"str_char_9.36"
  %"str_char_10.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 10
  store i8 102, i8* %"str_char_10.36"
  %"str_char_11.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 11
  store i8 118, i8* %"str_char_11.36"
  %"str_char_12.30" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 12
  store i8 0, i8* %"str_char_12.30"
  %"arg0_decay.36" = getelementptr [13 x i8], [13 x i8]* %"str_stack.36", i32 0, i32 0
  %".662" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.36")
  store i8* %".662", i8** @"OpenGL___glUniform3fv"
  %"str_stack.37" = alloca [13 x i8]
  %"str_char_0.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 0
  store i8 103, i8* %"str_char_0.37"
  %"str_char_1.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 1
  store i8 108, i8* %"str_char_1.37"
  %"str_char_2.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 2
  store i8 85, i8* %"str_char_2.37"
  %"str_char_3.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 3
  store i8 110, i8* %"str_char_3.37"
  %"str_char_4.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 4
  store i8 105, i8* %"str_char_4.37"
  %"str_char_5.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 5
  store i8 102, i8* %"str_char_5.37"
  %"str_char_6.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 6
  store i8 111, i8* %"str_char_6.37"
  %"str_char_7.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 7
  store i8 114, i8* %"str_char_7.37"
  %"str_char_8.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 8
  store i8 109, i8* %"str_char_8.37"
  %"str_char_9.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 9
  store i8 52, i8* %"str_char_9.37"
  %"str_char_10.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 10
  store i8 102, i8* %"str_char_10.37"
  %"str_char_11.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 11
  store i8 118, i8* %"str_char_11.37"
  %"str_char_12.31" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 12
  store i8 0, i8* %"str_char_12.31"
  %"arg0_decay.37" = getelementptr [13 x i8], [13 x i8]* %"str_stack.37", i32 0, i32 0
  %".677" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.37")
  store i8* %".677", i8** @"OpenGL___glUniform4fv"
  %"str_stack.38" = alloca [16 x i8]
  %"str_char_0.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 0
  store i8 103, i8* %"str_char_0.38"
  %"str_char_1.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 1
  store i8 108, i8* %"str_char_1.38"
  %"str_char_2.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 2
  store i8 85, i8* %"str_char_2.38"
  %"str_char_3.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 3
  store i8 110, i8* %"str_char_3.38"
  %"str_char_4.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 4
  store i8 105, i8* %"str_char_4.38"
  %"str_char_5.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 5
  store i8 102, i8* %"str_char_5.38"
  %"str_char_6.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 6
  store i8 111, i8* %"str_char_6.38"
  %"str_char_7.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 7
  store i8 114, i8* %"str_char_7.38"
  %"str_char_8.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 8
  store i8 109, i8* %"str_char_8.38"
  %"str_char_9.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 9
  store i8 77, i8* %"str_char_9.38"
  %"str_char_10.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 10
  store i8 97, i8* %"str_char_10.38"
  %"str_char_11.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 11
  store i8 116, i8* %"str_char_11.38"
  %"str_char_12.32" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 12
  store i8 52, i8* %"str_char_12.32"
  %"str_char_13.24" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 13
  store i8 102, i8* %"str_char_13.24"
  %"str_char_14.21" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 14
  store i8 118, i8* %"str_char_14.21"
  %"str_char_15.15" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 15
  store i8 0, i8* %"str_char_15.15"
  %"arg0_decay.38" = getelementptr [16 x i8], [16 x i8]* %"str_stack.38", i32 0, i32 0
  %".695" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.38")
  store i8* %".695", i8** @"OpenGL___glUniformMat4fv"
  %"str_stack.39" = alloca [18 x i8]
  %"str_char_0.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 0
  store i8 103, i8* %"str_char_0.39"
  %"str_char_1.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 1
  store i8 108, i8* %"str_char_1.39"
  %"str_char_2.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 2
  store i8 71, i8* %"str_char_2.39"
  %"str_char_3.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 3
  store i8 101, i8* %"str_char_3.39"
  %"str_char_4.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 4
  store i8 110, i8* %"str_char_4.39"
  %"str_char_5.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 5
  store i8 70, i8* %"str_char_5.39"
  %"str_char_6.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 6
  store i8 114, i8* %"str_char_6.39"
  %"str_char_7.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 7
  store i8 97, i8* %"str_char_7.39"
  %"str_char_8.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 8
  store i8 109, i8* %"str_char_8.39"
  %"str_char_9.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 9
  store i8 101, i8* %"str_char_9.39"
  %"str_char_10.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 10
  store i8 98, i8* %"str_char_10.39"
  %"str_char_11.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 11
  store i8 117, i8* %"str_char_11.39"
  %"str_char_12.33" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 12
  store i8 102, i8* %"str_char_12.33"
  %"str_char_13.25" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 13
  store i8 102, i8* %"str_char_13.25"
  %"str_char_14.22" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 14
  store i8 101, i8* %"str_char_14.22"
  %"str_char_15.16" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 15
  store i8 114, i8* %"str_char_15.16"
  %"str_char_16.10" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 16
  store i8 115, i8* %"str_char_16.10"
  %"str_char_17.10" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 17
  store i8 0, i8* %"str_char_17.10"
  %"arg0_decay.39" = getelementptr [18 x i8], [18 x i8]* %"str_stack.39", i32 0, i32 0
  %".715" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.39")
  store i8* %".715", i8** @"OpenGL___glGenFramebuffers"
  %"str_stack.40" = alloca [21 x i8]
  %"str_char_0.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 0
  store i8 103, i8* %"str_char_0.40"
  %"str_char_1.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 1
  store i8 108, i8* %"str_char_1.40"
  %"str_char_2.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 2
  store i8 68, i8* %"str_char_2.40"
  %"str_char_3.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 3
  store i8 101, i8* %"str_char_3.40"
  %"str_char_4.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 4
  store i8 108, i8* %"str_char_4.40"
  %"str_char_5.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 5
  store i8 101, i8* %"str_char_5.40"
  %"str_char_6.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 6
  store i8 116, i8* %"str_char_6.40"
  %"str_char_7.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 7
  store i8 101, i8* %"str_char_7.40"
  %"str_char_8.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 8
  store i8 70, i8* %"str_char_8.40"
  %"str_char_9.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 9
  store i8 114, i8* %"str_char_9.40"
  %"str_char_10.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 10
  store i8 97, i8* %"str_char_10.40"
  %"str_char_11.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 11
  store i8 109, i8* %"str_char_11.40"
  %"str_char_12.34" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 12
  store i8 101, i8* %"str_char_12.34"
  %"str_char_13.26" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 13
  store i8 98, i8* %"str_char_13.26"
  %"str_char_14.23" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 14
  store i8 117, i8* %"str_char_14.23"
  %"str_char_15.17" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 15
  store i8 102, i8* %"str_char_15.17"
  %"str_char_16.11" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 16
  store i8 102, i8* %"str_char_16.11"
  %"str_char_17.11" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 17
  store i8 101, i8* %"str_char_17.11"
  %"str_char_18.8" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 18
  store i8 114, i8* %"str_char_18.8"
  %"str_char_19.7" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 19
  store i8 115, i8* %"str_char_19.7"
  %"str_char_20.6" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 20
  store i8 0, i8* %"str_char_20.6"
  %"arg0_decay.40" = getelementptr [21 x i8], [21 x i8]* %"str_stack.40", i32 0, i32 0
  %".738" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.40")
  store i8* %".738", i8** @"OpenGL___glDeleteFramebuffers"
  %"str_stack.41" = alloca [18 x i8]
  %"str_char_0.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 0
  store i8 103, i8* %"str_char_0.41"
  %"str_char_1.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 1
  store i8 108, i8* %"str_char_1.41"
  %"str_char_2.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 2
  store i8 66, i8* %"str_char_2.41"
  %"str_char_3.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 3
  store i8 105, i8* %"str_char_3.41"
  %"str_char_4.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 4
  store i8 110, i8* %"str_char_4.41"
  %"str_char_5.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 5
  store i8 100, i8* %"str_char_5.41"
  %"str_char_6.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 6
  store i8 70, i8* %"str_char_6.41"
  %"str_char_7.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 7
  store i8 114, i8* %"str_char_7.41"
  %"str_char_8.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 8
  store i8 97, i8* %"str_char_8.41"
  %"str_char_9.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 9
  store i8 109, i8* %"str_char_9.41"
  %"str_char_10.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 10
  store i8 101, i8* %"str_char_10.41"
  %"str_char_11.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 11
  store i8 98, i8* %"str_char_11.41"
  %"str_char_12.35" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 12
  store i8 117, i8* %"str_char_12.35"
  %"str_char_13.27" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 13
  store i8 102, i8* %"str_char_13.27"
  %"str_char_14.24" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 14
  store i8 102, i8* %"str_char_14.24"
  %"str_char_15.18" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 15
  store i8 101, i8* %"str_char_15.18"
  %"str_char_16.12" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 16
  store i8 114, i8* %"str_char_16.12"
  %"str_char_17.12" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 17
  store i8 0, i8* %"str_char_17.12"
  %"arg0_decay.41" = getelementptr [18 x i8], [18 x i8]* %"str_stack.41", i32 0, i32 0
  %".758" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.41")
  store i8* %".758", i8** @"OpenGL___glBindFramebuffer"
  %"str_stack.42" = alloca [23 x i8]
  %"str_char_0.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 0
  store i8 103, i8* %"str_char_0.42"
  %"str_char_1.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 1
  store i8 108, i8* %"str_char_1.42"
  %"str_char_2.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 2
  store i8 70, i8* %"str_char_2.42"
  %"str_char_3.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 3
  store i8 114, i8* %"str_char_3.42"
  %"str_char_4.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 4
  store i8 97, i8* %"str_char_4.42"
  %"str_char_5.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 5
  store i8 109, i8* %"str_char_5.42"
  %"str_char_6.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 6
  store i8 101, i8* %"str_char_6.42"
  %"str_char_7.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 7
  store i8 98, i8* %"str_char_7.42"
  %"str_char_8.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 8
  store i8 117, i8* %"str_char_8.42"
  %"str_char_9.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 9
  store i8 102, i8* %"str_char_9.42"
  %"str_char_10.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 10
  store i8 102, i8* %"str_char_10.42"
  %"str_char_11.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 11
  store i8 101, i8* %"str_char_11.42"
  %"str_char_12.36" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 12
  store i8 114, i8* %"str_char_12.36"
  %"str_char_13.28" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 13
  store i8 84, i8* %"str_char_13.28"
  %"str_char_14.25" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 14
  store i8 101, i8* %"str_char_14.25"
  %"str_char_15.19" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 15
  store i8 120, i8* %"str_char_15.19"
  %"str_char_16.13" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 16
  store i8 116, i8* %"str_char_16.13"
  %"str_char_17.13" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 17
  store i8 117, i8* %"str_char_17.13"
  %"str_char_18.9" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 18
  store i8 114, i8* %"str_char_18.9"
  %"str_char_19.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 19
  store i8 101, i8* %"str_char_19.8"
  %"str_char_20.7" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 20
  store i8 50, i8* %"str_char_20.7"
  %"str_char_21.3" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 21
  store i8 68, i8* %"str_char_21.3"
  %"str_char_22.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 22
  store i8 0, i8* %"str_char_22.2"
  %"arg0_decay.42" = getelementptr [23 x i8], [23 x i8]* %"str_stack.42", i32 0, i32 0
  %".783" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.42")
  store i8* %".783", i8** @"OpenGL___glFramebufferTexture2D"
  %"str_stack.43" = alloca [25 x i8]
  %"str_char_0.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 0
  store i8 103, i8* %"str_char_0.43"
  %"str_char_1.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 1
  store i8 108, i8* %"str_char_1.43"
  %"str_char_2.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 2
  store i8 67, i8* %"str_char_2.43"
  %"str_char_3.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 3
  store i8 104, i8* %"str_char_3.43"
  %"str_char_4.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 4
  store i8 101, i8* %"str_char_4.43"
  %"str_char_5.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 5
  store i8 99, i8* %"str_char_5.43"
  %"str_char_6.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 6
  store i8 107, i8* %"str_char_6.43"
  %"str_char_7.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 7
  store i8 70, i8* %"str_char_7.43"
  %"str_char_8.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 8
  store i8 114, i8* %"str_char_8.43"
  %"str_char_9.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 9
  store i8 97, i8* %"str_char_9.43"
  %"str_char_10.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 10
  store i8 109, i8* %"str_char_10.43"
  %"str_char_11.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 11
  store i8 101, i8* %"str_char_11.43"
  %"str_char_12.37" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 12
  store i8 98, i8* %"str_char_12.37"
  %"str_char_13.29" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 13
  store i8 117, i8* %"str_char_13.29"
  %"str_char_14.26" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 14
  store i8 102, i8* %"str_char_14.26"
  %"str_char_15.20" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 15
  store i8 102, i8* %"str_char_15.20"
  %"str_char_16.14" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 16
  store i8 101, i8* %"str_char_16.14"
  %"str_char_17.14" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 17
  store i8 114, i8* %"str_char_17.14"
  %"str_char_18.10" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 18
  store i8 83, i8* %"str_char_18.10"
  %"str_char_19.9" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 19
  store i8 116, i8* %"str_char_19.9"
  %"str_char_20.8" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 20
  store i8 97, i8* %"str_char_20.8"
  %"str_char_21.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 21
  store i8 116, i8* %"str_char_21.4"
  %"str_char_22.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 22
  store i8 117, i8* %"str_char_22.3"
  %"str_char_23.2" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 23
  store i8 115, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 24
  store i8 0, i8* %"str_char_24.2"
  %"arg0_decay.43" = getelementptr [25 x i8], [25 x i8]* %"str_stack.43", i32 0, i32 0
  %".810" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.43")
  store i8* %".810", i8** @"OpenGL___glCheckFramebufferStatus"
  %"str_stack.44" = alloca [19 x i8]
  %"str_char_0.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 0
  store i8 103, i8* %"str_char_0.44"
  %"str_char_1.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 1
  store i8 108, i8* %"str_char_1.44"
  %"str_char_2.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 2
  store i8 71, i8* %"str_char_2.44"
  %"str_char_3.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 3
  store i8 101, i8* %"str_char_3.44"
  %"str_char_4.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 4
  store i8 110, i8* %"str_char_4.44"
  %"str_char_5.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 5
  store i8 82, i8* %"str_char_5.44"
  %"str_char_6.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 6
  store i8 101, i8* %"str_char_6.44"
  %"str_char_7.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 7
  store i8 110, i8* %"str_char_7.44"
  %"str_char_8.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 8
  store i8 100, i8* %"str_char_8.44"
  %"str_char_9.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 9
  store i8 101, i8* %"str_char_9.44"
  %"str_char_10.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 10
  store i8 114, i8* %"str_char_10.44"
  %"str_char_11.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 11
  store i8 98, i8* %"str_char_11.44"
  %"str_char_12.38" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 12
  store i8 117, i8* %"str_char_12.38"
  %"str_char_13.30" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 13
  store i8 102, i8* %"str_char_13.30"
  %"str_char_14.27" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 14
  store i8 102, i8* %"str_char_14.27"
  %"str_char_15.21" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 15
  store i8 101, i8* %"str_char_15.21"
  %"str_char_16.15" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 16
  store i8 114, i8* %"str_char_16.15"
  %"str_char_17.15" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 17
  store i8 115, i8* %"str_char_17.15"
  %"str_char_18.11" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 18
  store i8 0, i8* %"str_char_18.11"
  %"arg0_decay.44" = getelementptr [19 x i8], [19 x i8]* %"str_stack.44", i32 0, i32 0
  %".831" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.44")
  store i8* %".831", i8** @"OpenGL___glGenRenderbuffers"
  %"str_stack.45" = alloca [22 x i8]
  %"str_char_0.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 0
  store i8 103, i8* %"str_char_0.45"
  %"str_char_1.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 1
  store i8 108, i8* %"str_char_1.45"
  %"str_char_2.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 2
  store i8 68, i8* %"str_char_2.45"
  %"str_char_3.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 3
  store i8 101, i8* %"str_char_3.45"
  %"str_char_4.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 4
  store i8 108, i8* %"str_char_4.45"
  %"str_char_5.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 5
  store i8 101, i8* %"str_char_5.45"
  %"str_char_6.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 6
  store i8 116, i8* %"str_char_6.45"
  %"str_char_7.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 7
  store i8 101, i8* %"str_char_7.45"
  %"str_char_8.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 8
  store i8 82, i8* %"str_char_8.45"
  %"str_char_9.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 9
  store i8 101, i8* %"str_char_9.45"
  %"str_char_10.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 10
  store i8 110, i8* %"str_char_10.45"
  %"str_char_11.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 11
  store i8 100, i8* %"str_char_11.45"
  %"str_char_12.39" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 12
  store i8 101, i8* %"str_char_12.39"
  %"str_char_13.31" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 13
  store i8 114, i8* %"str_char_13.31"
  %"str_char_14.28" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 14
  store i8 98, i8* %"str_char_14.28"
  %"str_char_15.22" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 15
  store i8 117, i8* %"str_char_15.22"
  %"str_char_16.16" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 16
  store i8 102, i8* %"str_char_16.16"
  %"str_char_17.16" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 17
  store i8 102, i8* %"str_char_17.16"
  %"str_char_18.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 18
  store i8 101, i8* %"str_char_18.12"
  %"str_char_19.10" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 19
  store i8 114, i8* %"str_char_19.10"
  %"str_char_20.9" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 20
  store i8 115, i8* %"str_char_20.9"
  %"str_char_21.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 21
  store i8 0, i8* %"str_char_21.5"
  %"arg0_decay.45" = getelementptr [22 x i8], [22 x i8]* %"str_stack.45", i32 0, i32 0
  %".855" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.45")
  store i8* %".855", i8** @"OpenGL___glDeleteRenderbuffers"
  %"str_stack.46" = alloca [19 x i8]
  %"str_char_0.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 0
  store i8 103, i8* %"str_char_0.46"
  %"str_char_1.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 1
  store i8 108, i8* %"str_char_1.46"
  %"str_char_2.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 2
  store i8 66, i8* %"str_char_2.46"
  %"str_char_3.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 3
  store i8 105, i8* %"str_char_3.46"
  %"str_char_4.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 4
  store i8 110, i8* %"str_char_4.46"
  %"str_char_5.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 5
  store i8 100, i8* %"str_char_5.46"
  %"str_char_6.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 6
  store i8 82, i8* %"str_char_6.46"
  %"str_char_7.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 7
  store i8 101, i8* %"str_char_7.46"
  %"str_char_8.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 8
  store i8 110, i8* %"str_char_8.46"
  %"str_char_9.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 9
  store i8 100, i8* %"str_char_9.46"
  %"str_char_10.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 10
  store i8 101, i8* %"str_char_10.46"
  %"str_char_11.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 11
  store i8 114, i8* %"str_char_11.46"
  %"str_char_12.40" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 12
  store i8 98, i8* %"str_char_12.40"
  %"str_char_13.32" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 13
  store i8 117, i8* %"str_char_13.32"
  %"str_char_14.29" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 14
  store i8 102, i8* %"str_char_14.29"
  %"str_char_15.23" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 15
  store i8 102, i8* %"str_char_15.23"
  %"str_char_16.17" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 16
  store i8 101, i8* %"str_char_16.17"
  %"str_char_17.17" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 17
  store i8 114, i8* %"str_char_17.17"
  %"str_char_18.13" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 18
  store i8 0, i8* %"str_char_18.13"
  %"arg0_decay.46" = getelementptr [19 x i8], [19 x i8]* %"str_stack.46", i32 0, i32 0
  %".876" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.46")
  store i8* %".876", i8** @"OpenGL___glBindRenderbuffer"
  %"str_stack.47" = alloca [22 x i8]
  %"str_char_0.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 0
  store i8 103, i8* %"str_char_0.47"
  %"str_char_1.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 1
  store i8 108, i8* %"str_char_1.47"
  %"str_char_2.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 2
  store i8 82, i8* %"str_char_2.47"
  %"str_char_3.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 3
  store i8 101, i8* %"str_char_3.47"
  %"str_char_4.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 4
  store i8 110, i8* %"str_char_4.47"
  %"str_char_5.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 5
  store i8 100, i8* %"str_char_5.47"
  %"str_char_6.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 6
  store i8 101, i8* %"str_char_6.47"
  %"str_char_7.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 7
  store i8 114, i8* %"str_char_7.47"
  %"str_char_8.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 8
  store i8 98, i8* %"str_char_8.47"
  %"str_char_9.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 9
  store i8 117, i8* %"str_char_9.47"
  %"str_char_10.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 10
  store i8 102, i8* %"str_char_10.47"
  %"str_char_11.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 11
  store i8 102, i8* %"str_char_11.47"
  %"str_char_12.41" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 12
  store i8 101, i8* %"str_char_12.41"
  %"str_char_13.33" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 13
  store i8 114, i8* %"str_char_13.33"
  %"str_char_14.30" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 14
  store i8 83, i8* %"str_char_14.30"
  %"str_char_15.24" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 15
  store i8 116, i8* %"str_char_15.24"
  %"str_char_16.18" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 16
  store i8 111, i8* %"str_char_16.18"
  %"str_char_17.18" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 17
  store i8 114, i8* %"str_char_17.18"
  %"str_char_18.14" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 18
  store i8 97, i8* %"str_char_18.14"
  %"str_char_19.11" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 19
  store i8 103, i8* %"str_char_19.11"
  %"str_char_20.10" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 20
  store i8 101, i8* %"str_char_20.10"
  %"str_char_21.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 21
  store i8 0, i8* %"str_char_21.6"
  %"arg0_decay.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.47", i32 0, i32 0
  %".900" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.47")
  store i8* %".900", i8** @"OpenGL___glRenderbufferStorage"
  %"str_stack.48" = alloca [26 x i8]
  %"str_char_0.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 0
  store i8 103, i8* %"str_char_0.48"
  %"str_char_1.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 1
  store i8 108, i8* %"str_char_1.48"
  %"str_char_2.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 2
  store i8 70, i8* %"str_char_2.48"
  %"str_char_3.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 3
  store i8 114, i8* %"str_char_3.48"
  %"str_char_4.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 4
  store i8 97, i8* %"str_char_4.48"
  %"str_char_5.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 5
  store i8 109, i8* %"str_char_5.48"
  %"str_char_6.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 6
  store i8 101, i8* %"str_char_6.48"
  %"str_char_7.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 7
  store i8 98, i8* %"str_char_7.48"
  %"str_char_8.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 8
  store i8 117, i8* %"str_char_8.48"
  %"str_char_9.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 9
  store i8 102, i8* %"str_char_9.48"
  %"str_char_10.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 10
  store i8 102, i8* %"str_char_10.48"
  %"str_char_11.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 11
  store i8 101, i8* %"str_char_11.48"
  %"str_char_12.42" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 12
  store i8 114, i8* %"str_char_12.42"
  %"str_char_13.34" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 13
  store i8 82, i8* %"str_char_13.34"
  %"str_char_14.31" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 14
  store i8 101, i8* %"str_char_14.31"
  %"str_char_15.25" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 15
  store i8 110, i8* %"str_char_15.25"
  %"str_char_16.19" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 16
  store i8 100, i8* %"str_char_16.19"
  %"str_char_17.19" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 17
  store i8 101, i8* %"str_char_17.19"
  %"str_char_18.15" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 18
  store i8 114, i8* %"str_char_18.15"
  %"str_char_19.12" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 19
  store i8 98, i8* %"str_char_19.12"
  %"str_char_20.11" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 20
  store i8 117, i8* %"str_char_20.11"
  %"str_char_21.7" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 21
  store i8 102, i8* %"str_char_21.7"
  %"str_char_22.4" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 22
  store i8 102, i8* %"str_char_22.4"
  %"str_char_23.3" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 23
  store i8 101, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 24
  store i8 114, i8* %"str_char_24.3"
  %"str_char_25.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 25
  store i8 0, i8* %"str_char_25.2"
  %"arg0_decay.48" = getelementptr [26 x i8], [26 x i8]* %"str_stack.48", i32 0, i32 0
  %".928" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.48")
  store i8* %".928", i8** @"OpenGL___glFramebufferRenderbuffer"
  %"str_stack.49" = alloca [17 x i8]
  %"str_char_0.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 0
  store i8 103, i8* %"str_char_0.49"
  %"str_char_1.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 1
  store i8 108, i8* %"str_char_1.49"
  %"str_char_2.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 2
  store i8 71, i8* %"str_char_2.49"
  %"str_char_3.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 3
  store i8 101, i8* %"str_char_3.49"
  %"str_char_4.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 4
  store i8 110, i8* %"str_char_4.49"
  %"str_char_5.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 5
  store i8 101, i8* %"str_char_5.49"
  %"str_char_6.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 6
  store i8 114, i8* %"str_char_6.49"
  %"str_char_7.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 7
  store i8 97, i8* %"str_char_7.49"
  %"str_char_8.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 8
  store i8 116, i8* %"str_char_8.49"
  %"str_char_9.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 9
  store i8 101, i8* %"str_char_9.49"
  %"str_char_10.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 10
  store i8 77, i8* %"str_char_10.49"
  %"str_char_11.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 11
  store i8 105, i8* %"str_char_11.49"
  %"str_char_12.43" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 12
  store i8 112, i8* %"str_char_12.43"
  %"str_char_13.35" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 13
  store i8 109, i8* %"str_char_13.35"
  %"str_char_14.32" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 14
  store i8 97, i8* %"str_char_14.32"
  %"str_char_15.26" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 15
  store i8 112, i8* %"str_char_15.26"
  %"str_char_16.20" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 16
  store i8 0, i8* %"str_char_16.20"
  %"arg0_decay.49" = getelementptr [17 x i8], [17 x i8]* %"str_stack.49", i32 0, i32 0
  %".947" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.49")
  store i8* %".947", i8** @"OpenGL___glGenerateMipmap"
  %"str_stack.50" = alloca [16 x i8]
  %"str_char_0.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 0
  store i8 103, i8* %"str_char_0.50"
  %"str_char_1.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 1
  store i8 108, i8* %"str_char_1.50"
  %"str_char_2.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 2
  store i8 65, i8* %"str_char_2.50"
  %"str_char_3.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 3
  store i8 99, i8* %"str_char_3.50"
  %"str_char_4.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 4
  store i8 116, i8* %"str_char_4.50"
  %"str_char_5.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 5
  store i8 105, i8* %"str_char_5.50"
  %"str_char_6.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 6
  store i8 118, i8* %"str_char_6.50"
  %"str_char_7.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 7
  store i8 101, i8* %"str_char_7.50"
  %"str_char_8.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 8
  store i8 84, i8* %"str_char_8.50"
  %"str_char_9.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 9
  store i8 101, i8* %"str_char_9.50"
  %"str_char_10.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 10
  store i8 120, i8* %"str_char_10.50"
  %"str_char_11.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 11
  store i8 116, i8* %"str_char_11.50"
  %"str_char_12.44" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 12
  store i8 117, i8* %"str_char_12.44"
  %"str_char_13.36" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 13
  store i8 114, i8* %"str_char_13.36"
  %"str_char_14.33" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 14
  store i8 101, i8* %"str_char_14.33"
  %"str_char_15.27" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 15
  store i8 0, i8* %"str_char_15.27"
  %"arg0_decay.50" = getelementptr [16 x i8], [16 x i8]* %"str_stack.50", i32 0, i32 0
  %".965" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.50")
  store i8* %".965", i8** @"OpenGL___glActiveTexture"
  %"str_stack.51" = alloca [13 x i8]
  %"str_char_0.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 0
  store i8 103, i8* %"str_char_0.51"
  %"str_char_1.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 1
  store i8 108, i8* %"str_char_1.51"
  %"str_char_2.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 2
  store i8 68, i8* %"str_char_2.51"
  %"str_char_3.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 3
  store i8 114, i8* %"str_char_3.51"
  %"str_char_4.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 4
  store i8 97, i8* %"str_char_4.51"
  %"str_char_5.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 5
  store i8 119, i8* %"str_char_5.51"
  %"str_char_6.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 6
  store i8 65, i8* %"str_char_6.51"
  %"str_char_7.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 7
  store i8 114, i8* %"str_char_7.51"
  %"str_char_8.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 8
  store i8 114, i8* %"str_char_8.51"
  %"str_char_9.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 9
  store i8 97, i8* %"str_char_9.51"
  %"str_char_10.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 10
  store i8 121, i8* %"str_char_10.51"
  %"str_char_11.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 11
  store i8 115, i8* %"str_char_11.51"
  %"str_char_12.45" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 12
  store i8 0, i8* %"str_char_12.45"
  %"arg0_decay.51" = getelementptr [13 x i8], [13 x i8]* %"str_stack.51", i32 0, i32 0
  %".980" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.51")
  store i8* %".980", i8** @"OpenGL___glDrawArrays"
  %"str_stack.52" = alloca [15 x i8]
  %"str_char_0.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 0
  store i8 103, i8* %"str_char_0.52"
  %"str_char_1.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 1
  store i8 108, i8* %"str_char_1.52"
  %"str_char_2.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 2
  store i8 68, i8* %"str_char_2.52"
  %"str_char_3.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 3
  store i8 114, i8* %"str_char_3.52"
  %"str_char_4.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 4
  store i8 97, i8* %"str_char_4.52"
  %"str_char_5.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 5
  store i8 119, i8* %"str_char_5.52"
  %"str_char_6.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 6
  store i8 69, i8* %"str_char_6.52"
  %"str_char_7.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 7
  store i8 108, i8* %"str_char_7.52"
  %"str_char_8.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 8
  store i8 101, i8* %"str_char_8.52"
  %"str_char_9.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 9
  store i8 109, i8* %"str_char_9.52"
  %"str_char_10.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 10
  store i8 101, i8* %"str_char_10.52"
  %"str_char_11.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 11
  store i8 110, i8* %"str_char_11.52"
  %"str_char_12.46" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 12
  store i8 116, i8* %"str_char_12.46"
  %"str_char_13.37" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 13
  store i8 115, i8* %"str_char_13.37"
  %"str_char_14.34" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 14
  store i8 0, i8* %"str_char_14.34"
  %"arg0_decay.52" = getelementptr [15 x i8], [15 x i8]* %"str_stack.52", i32 0, i32 0
  %".997" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.52")
  store i8* %".997", i8** @"OpenGL___glDrawElements"
  %"str_stack.53" = alloca [22 x i8]
  %"str_char_0.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 0
  store i8 103, i8* %"str_char_0.53"
  %"str_char_1.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 1
  store i8 108, i8* %"str_char_1.53"
  %"str_char_2.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 2
  store i8 68, i8* %"str_char_2.53"
  %"str_char_3.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 3
  store i8 114, i8* %"str_char_3.53"
  %"str_char_4.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 4
  store i8 97, i8* %"str_char_4.53"
  %"str_char_5.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 5
  store i8 119, i8* %"str_char_5.53"
  %"str_char_6.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 6
  store i8 65, i8* %"str_char_6.53"
  %"str_char_7.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 7
  store i8 114, i8* %"str_char_7.53"
  %"str_char_8.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 8
  store i8 114, i8* %"str_char_8.53"
  %"str_char_9.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 9
  store i8 97, i8* %"str_char_9.53"
  %"str_char_10.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 10
  store i8 121, i8* %"str_char_10.53"
  %"str_char_11.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 11
  store i8 115, i8* %"str_char_11.53"
  %"str_char_12.47" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 12
  store i8 73, i8* %"str_char_12.47"
  %"str_char_13.38" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 13
  store i8 110, i8* %"str_char_13.38"
  %"str_char_14.35" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 14
  store i8 115, i8* %"str_char_14.35"
  %"str_char_15.28" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 15
  store i8 116, i8* %"str_char_15.28"
  %"str_char_16.21" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 16
  store i8 97, i8* %"str_char_16.21"
  %"str_char_17.20" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 17
  store i8 110, i8* %"str_char_17.20"
  %"str_char_18.16" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 18
  store i8 99, i8* %"str_char_18.16"
  %"str_char_19.13" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 19
  store i8 101, i8* %"str_char_19.13"
  %"str_char_20.12" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 20
  store i8 100, i8* %"str_char_20.12"
  %"str_char_21.8" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 21
  store i8 0, i8* %"str_char_21.8"
  %"arg0_decay.53" = getelementptr [22 x i8], [22 x i8]* %"str_stack.53", i32 0, i32 0
  %".1021" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.53")
  store i8* %".1021", i8** @"OpenGL___glDrawArraysInstanced"
  %"str_stack.54" = alloca [24 x i8]
  %"str_char_0.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 0
  store i8 103, i8* %"str_char_0.54"
  %"str_char_1.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 1
  store i8 108, i8* %"str_char_1.54"
  %"str_char_2.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 2
  store i8 68, i8* %"str_char_2.54"
  %"str_char_3.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 3
  store i8 114, i8* %"str_char_3.54"
  %"str_char_4.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 4
  store i8 97, i8* %"str_char_4.54"
  %"str_char_5.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 5
  store i8 119, i8* %"str_char_5.54"
  %"str_char_6.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 6
  store i8 69, i8* %"str_char_6.54"
  %"str_char_7.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 7
  store i8 108, i8* %"str_char_7.54"
  %"str_char_8.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 8
  store i8 101, i8* %"str_char_8.54"
  %"str_char_9.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 9
  store i8 109, i8* %"str_char_9.54"
  %"str_char_10.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 10
  store i8 101, i8* %"str_char_10.54"
  %"str_char_11.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 11
  store i8 110, i8* %"str_char_11.54"
  %"str_char_12.48" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 12
  store i8 116, i8* %"str_char_12.48"
  %"str_char_13.39" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 13
  store i8 115, i8* %"str_char_13.39"
  %"str_char_14.36" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 14
  store i8 73, i8* %"str_char_14.36"
  %"str_char_15.29" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 15
  store i8 110, i8* %"str_char_15.29"
  %"str_char_16.22" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 16
  store i8 115, i8* %"str_char_16.22"
  %"str_char_17.21" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 17
  store i8 116, i8* %"str_char_17.21"
  %"str_char_18.17" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 18
  store i8 97, i8* %"str_char_18.17"
  %"str_char_19.14" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 19
  store i8 110, i8* %"str_char_19.14"
  %"str_char_20.13" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 20
  store i8 99, i8* %"str_char_20.13"
  %"str_char_21.9" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 21
  store i8 101, i8* %"str_char_21.9"
  %"str_char_22.5" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 22
  store i8 100, i8* %"str_char_22.5"
  %"str_char_23.4" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 23
  store i8 0, i8* %"str_char_23.4"
  %"arg0_decay.54" = getelementptr [24 x i8], [24 x i8]* %"str_stack.54", i32 0, i32 0
  %".1047" = call i8* @"wglGetProcAddress"(i8* %"arg0_decay.54")
  store i8* %".1047", i8** @"OpenGL___glDrawElementsInstanced"
  ret void
}

@"ATOMIC_RELAXED" = internal global i32 0
@"ATOMIC_ACQUIRE" = internal global i32 2
@"ATOMIC_RELEASE" = internal global i32 3
@"ATOMIC_ACQ_REL" = internal global i32 4
@"ATOMIC_SEQ_CST" = internal global i32 5
define void @"standard__atomic__load_fence__0__ret_voidE1"()
{
entry:
  call void asm sideeffect "lfence", "~{memory}"
()
  ret void
}

define void @"standard__atomic__store_fence__0__ret_voidE1"()
{
entry:
  call void asm sideeffect "sfence", "~{memory}"
()
  ret void
}

define void @"standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1"(i32* %"ptr", i32* %"out")
{
entry:
  %"ptr.addr" = alloca i32*
  store i32* %"ptr", i32** %"ptr.addr"
  %"out.addr" = alloca i32*
  store i32* %"out", i32** %"out.addr"
  %"ptr_load" = load i32*, i32** %"ptr.addr"
  %"out_load" = load i32*, i32** %"out.addr"
  call void asm sideeffect "movq $0, %rsi
                movq $1, %rdi
                movl (%rsi), %eax
                movl %eax, (%rdi)", "r,r,~{eax},~{rsi},~{rdi},~{memory}"
(i32* %"ptr_load", i32* %"out_load")
  ret void
}

define i32 @"standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32"(i32* %"ptr")
{
entry:
  %"ptr.addr" = alloca i32*
  store i32* %"ptr", i32** %"ptr.addr"
  %"result" = alloca i32
  store i32 0, i32* %"result"
  %"ptr.1" = load i32*, i32** %"ptr.addr"
  call void @"standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1"(i32* %"ptr.1", i32* %"result")
  %"result.1" = load i32, i32* %"result"
  ret i32 %"result.1"
}

define void @"standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1"(i32* %"ptr", i32 %"value")
{
entry:
  %"ptr.addr" = alloca i32*
  store i32* %"ptr", i32** %"ptr.addr"
  %"value.addr" = alloca i32
  store i32 %"value", i32* %"value.addr"
  %"ptr_load" = load i32*, i32** %"ptr.addr"
  %"value_load" = load i32, i32* %"value.addr"
  call void asm sideeffect "movq $0, %rsi
                movl $1, %eax
                xchgl %eax, (%rsi)", "r,r,~{eax},~{rsi},~{memory}"
(i32* %"ptr_load", i32 %"value_load")
  ret void
}

@"WIN32_INFINITE" = internal global i32 4294967295
@"THREAD_OPAQUE_BYTES" = internal global i32 8
@"MUTEX_OPAQUE_BYTES" = internal global i32 64
@"RWLOCK_OPAQUE_BYTES" = internal global i32 64
@"COND_OPAQUE_BYTES" = internal global i32 64
@"SEM_OPAQUE_BYTES" = internal global i32 32
@"TLS_KEY_OPAQUE_BYTES" = internal global i32 8
@"THREAD_OK" = internal global i32 0
@"THREAD_ERROR" = internal global i32 -1
@"THREAD_TIMEOUT" = internal global i32 -2
define i8* @"standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1"(i8* %"storage")
{
entry:
  %"storage.addr" = alloca i8*
  store i8* %"storage", i8** %"storage.addr"
  %"ip" = alloca i64*
  %"storage.1" = load i8*, i8** %"storage.addr"
  %"from_void_ptr" = bitcast i8* %"storage.1" to i64*
  store i64* %"from_void_ptr", i64** %"ip"
  %"ip.1" = load i64*, i64** %"ip"
  %"deref" = load i64, i64* %"ip.1"
  %"int_to_ptr" = inttoptr i64 %"deref" to i8*
  ret i8* %"int_to_ptr"
}

define void @"standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1"(i8* %"storage", i8* %"ptr")
{
entry:
  %"storage.addr" = alloca i8*
  store i8* %"storage", i8** %"storage.addr"
  %"ptr.addr" = alloca i8*
  store i8* %"ptr", i8** %"ptr.addr"
  %"ip" = alloca i64*
  %"storage.1" = load i8*, i8** %"storage.addr"
  %"from_void_ptr" = bitcast i8* %"storage.1" to i64*
  store i64* %"from_void_ptr", i64** %"ip"
  %"ptr.1" = load i8*, i8** %"ptr.addr"
  %"ptr_to_int" = ptrtoint i8* %"ptr.1" to i64
  %"ip.1" = load i64*, i64** %"ip"
  store i64 %"ptr_to_int", i64* %"ip.1"
  ret void
}

define i32 @"standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1"(i8* %"fn", i8* %"arg", %"Thread"* %"out")
{
entry:
  %"fn.addr" = alloca i8*
  store i8* %"fn", i8** %"fn.addr"
  %"arg.addr" = alloca i8*
  store i8* %"arg", i8** %"arg.addr"
  %"out.addr" = alloca %"Thread"*
  store %"Thread"* %"out", %"Thread"** %"out.addr"
  %"struct_ptr" = load %"Thread"*, %"Thread"** %"out.addr"
  %".8" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr", i32 0, i32 1
  call void @"standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1"(i32* %".8", i32 1)
  %"h" = alloca i8*
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i8*
  %"fn.1" = load i8*, i8** %"fn.addr"
  %"arg.1" = load i8*, i8** %"arg.addr"
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to i32*
  %".10" = sext i32 0 to i64
  %".11" = call i8* @"CreateThread"(i8* %"int_to_ptr", i64 %".10", i8* %"fn.1", i8* %"arg.1", i32 0, i32* %"int_to_ptr.1")
  store i8* %".11", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %"ptr_to_int" = ptrtoint i8* %"h.1" to i64
  %".13" = sext i32 0 to i64
  %".14" = icmp eq i64 %"ptr_to_int", %".13"
  br i1 %".14", label %"then", label %"else"
then:
  %"struct_ptr.1" = load %"Thread"*, %"Thread"** %"out.addr"
  %".16" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr.1", i32 0, i32 1
  call void @"standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1"(i32* %".16", i32 0)
  %"THREAD_ERROR" = load i32, i32* @"THREAD_ERROR"
  ret i32 %"THREAD_ERROR"
else:
  br label %"ifcont"
ifcont:
  %"struct_ptr.2" = load %"Thread"*, %"Thread"** %"out.addr"
  %".20" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr.2", i32 0, i32 0
  %".21" = getelementptr inbounds [8 x i8], [8 x i8]* %".20", i32 0, i32 0
  %"h.2" = load i8*, i8** %"h"
  call void @"standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1"(i8* %".21", i8* %"h.2")
  %"THREAD_OK" = load i32, i32* @"THREAD_OK"
  ret i32 %"THREAD_OK"
}

define i32 @"standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1"(%"Thread"* %"t")
{
entry:
  %"t.addr" = alloca %"Thread"*
  store %"Thread"* %"t", %"Thread"** %"t.addr"
  %"struct_ptr" = load %"Thread"*, %"Thread"** %"t.addr"
  %".4" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr", i32 0, i32 1
  %".5" = call i32 @"standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32"(i32* %".4")
  %".6" = icmp eq i32 %".5", 0
  %"h" = alloca i8*
  %"rc" = alloca i32
  br i1 %".6", label %"then", label %"else"
then:
  %"THREAD_OK" = load i32, i32* @"THREAD_OK"
  ret i32 %"THREAD_OK"
else:
  br label %"ifcont"
ifcont:
  %"struct_ptr.1" = load %"Thread"*, %"Thread"** %"t.addr"
  %".10" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr.1", i32 0, i32 0
  %".11" = getelementptr inbounds [8 x i8], [8 x i8]* %".10", i32 0, i32 0
  %".12" = call i8* @"standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1"(i8* %".11")
  store i8* %".12", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %"WIN32_INFINITE" = load i32, i32* @"WIN32_INFINITE"
  %".14" = call i32 @"WaitForSingleObject"(i8* %"h.1", i32 %"WIN32_INFINITE")
  store i32 %".14", i32* %"rc"
  %"h.2" = load i8*, i8** %"h"
  %".16" = call i32 @"CloseHandle"(i8* %"h.2")
  %"struct_ptr.2" = load %"Thread"*, %"Thread"** %"t.addr"
  %".17" = getelementptr inbounds %"Thread", %"Thread"* %"struct_ptr.2", i32 0, i32 1
  call void @"standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1"(i32* %".17", i32 0)
  %"rc.1" = load i32, i32* %"rc"
  %".19" = icmp eq i32 %"rc.1", 0
  br i1 %".19", label %"ternary_true", label %"ternary_false"
ternary_true:
  %"THREAD_OK.1" = load i32, i32* @"THREAD_OK"
  br label %"ternary_merge"
ternary_false:
  %"THREAD_ERROR" = load i32, i32* @"THREAD_ERROR"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  i32 [%"THREAD_OK.1", %"ternary_true"], [%"THREAD_ERROR", %"ternary_false"]
  ret i32 %"ternary_result"
}

define i32 @"standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1"(%"Semaphore"* %"s", i32 %"initial_value")
{
entry:
  %"s.addr" = alloca %"Semaphore"*
  store %"Semaphore"* %"s", %"Semaphore"** %"s.addr"
  %"initial_value.addr" = alloca i32
  store i32 %"initial_value", i32* %"initial_value.addr"
  %"h" = alloca i8*
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i8*
  %"initial_value.1" = load i32, i32* %"initial_value.addr"
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to i8*
  %".6" = call i8* @"CreateSemaphoreA"(i8* %"int_to_ptr", i32 %"initial_value.1", i32 2147483647, i8* %"int_to_ptr.1")
  store i8* %".6", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %"ptr_to_int" = ptrtoint i8* %"h.1" to i64
  %".8" = sext i32 0 to i64
  %".9" = icmp eq i64 %"ptr_to_int", %".8"
  br i1 %".9", label %"then", label %"else"
then:
  %"THREAD_ERROR" = load i32, i32* @"THREAD_ERROR"
  ret i32 %"THREAD_ERROR"
else:
  br label %"ifcont"
ifcont:
  %"struct_ptr" = load %"Semaphore"*, %"Semaphore"** %"s.addr"
  %".13" = getelementptr inbounds %"Semaphore", %"Semaphore"* %"struct_ptr", i32 0, i32 0
  %".14" = getelementptr inbounds [32 x i8], [32 x i8]* %".13", i32 0, i32 0
  %"h.2" = load i8*, i8** %"h"
  call void @"standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1"(i8* %".14", i8* %"h.2")
  %"THREAD_OK" = load i32, i32* @"THREAD_OK"
  ret i32 %"THREAD_OK"
}

define void @"standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* %"s")
{
entry:
  %"s.addr" = alloca %"Semaphore"*
  store %"Semaphore"* %"s", %"Semaphore"** %"s.addr"
  %"h" = alloca i8*
  %"struct_ptr" = load %"Semaphore"*, %"Semaphore"** %"s.addr"
  %".4" = getelementptr inbounds %"Semaphore", %"Semaphore"* %"struct_ptr", i32 0, i32 0
  %".5" = getelementptr inbounds [32 x i8], [32 x i8]* %".4", i32 0, i32 0
  %".6" = call i8* @"standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1"(i8* %".5")
  store i8* %".6", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %".8" = call i32 @"CloseHandle"(i8* %"h.1")
  ret void
}

define void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* %"s")
{
entry:
  %"s.addr" = alloca %"Semaphore"*
  store %"Semaphore"* %"s", %"Semaphore"** %"s.addr"
  %"h" = alloca i8*
  %"struct_ptr" = load %"Semaphore"*, %"Semaphore"** %"s.addr"
  %".4" = getelementptr inbounds %"Semaphore", %"Semaphore"* %"struct_ptr", i32 0, i32 0
  %".5" = getelementptr inbounds [32 x i8], [32 x i8]* %".4", i32 0, i32 0
  %".6" = call i8* @"standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1"(i8* %".5")
  store i8* %".6", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %"WIN32_INFINITE" = load i32, i32* @"WIN32_INFINITE"
  %".8" = call i32 @"WaitForSingleObject"(i8* %"h.1", i32 %"WIN32_INFINITE")
  ret void
}

define void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* %"s")
{
entry:
  %"s.addr" = alloca %"Semaphore"*
  store %"Semaphore"* %"s", %"Semaphore"** %"s.addr"
  %"h" = alloca i8*
  %"struct_ptr" = load %"Semaphore"*, %"Semaphore"** %"s.addr"
  %".4" = getelementptr inbounds %"Semaphore", %"Semaphore"* %"struct_ptr", i32 0, i32 0
  %".5" = getelementptr inbounds [32 x i8], [32 x i8]* %".4", i32 0, i32 0
  %".6" = call i8* @"standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1"(i8* %".5")
  store i8* %".6", i8** %"h"
  %"h.1" = load i8*, i8** %"h"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i32*
  %".8" = call i32 @"ReleaseSemaphore"(i8* %"h.1", i32 1, i32* %"int_to_ptr")
  ret void
}

@"WIN_W" = internal global i32 1024
@"WIN_H" = internal global i32 768
@"MAX_THREADS" = internal global i32 64
@"g_dens" = internal global double* null
@"g_dens_prev" = internal global double* null
@"g_vx" = internal global double* null
@"g_vy" = internal global double* null
@"g_vx_prev" = internal global double* null
@"g_vy_prev" = internal global double* null
@"g_dens_tex" = internal global float* null
@"g_vel_tex" = internal global float* null
@"g_part_x" = internal global float* null
@"g_part_y" = internal global float* null
@"g_rand_seed" = internal global i32 12345
@"PHASE_LINSOLVE_RED" = internal global i32 0
@"PHASE_LINSOLVE_BLACK" = internal global i32 1
@"PHASE_ADVECT" = internal global i32 2
@"PHASE_PROJECT_DIV" = internal global i32 3
@"PHASE_PROJECT_GRAD" = internal global i32 4
@"PHASE_DECAY" = internal global i32 5
@"PHASE_EXIT" = internal global i32 6
@"g_slices" = internal global [64 x %"WorkSlice"] zeroinitializer
@"g_slices2" = internal global [64 x %"WorkSlice"] zeroinitializer
@"g_threads" = internal global [64 x %"Thread"] zeroinitializer
@"g_threads2" = internal global [64 x %"Thread"] zeroinitializer
@"g_work_sem" = internal global %"Semaphore" zeroinitializer
@"g_done_sem" = internal global %"Semaphore" zeroinitializer
@"g_work_sem2" = internal global %"Semaphore" zeroinitializer
@"g_done_sem2" = internal global %"Semaphore" zeroinitializer
@"g_num_threads" = internal global i32 1
@"g_rows_per_thread" = internal global i32 1
@"mouse_down" = internal global i1 0
@"mouse_x" = internal global i32 0
@"mouse_y" = internal global i32 0
@"mouse_px" = internal global i32 0
@"mouse_py" = internal global i32 0
@"cur_w" = internal global i32 1024
@"cur_h" = internal global i32 768
@"g_palette" = internal global i32 0
@"g_game_state" = internal global i32 0
@"g_prev_state" = internal global i32 0
@"g_smooth_vx" = internal global double              0x0
@"g_smooth_vy" = internal global double              0x0
@"g_paddle_gy" = internal global i32 96
@"g_cpu_paddle_gy" = internal global i32 96
@"g_jetting" = internal global i1 0
@"g_sucking" = internal global i1 0
@"g_suck_charge" = internal global float              0x0
@"g_ball_x" = internal global float 0xbff0000000000000
@"g_ball_y" = internal global float              0x0
@"g_ball_vx" = internal global float              0x0
@"g_ball_vy" = internal global float              0x0
@"g_lives" = internal global i32 3
@"g_level" = internal global i32 1
define i1 @"btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1"(i32 %"mx", i32 %"my", i32 %"cx", i32 %"cy")
{
entry:
  %"mx.addr" = alloca i32
  store i32 %"mx", i32* %"mx.addr"
  %"my.addr" = alloca i32
  store i32 %"my", i32* %"my.addr"
  %"cx.addr" = alloca i32
  store i32 %"cx", i32* %"cx.addr"
  %"cy.addr" = alloca i32
  store i32 %"cy", i32* %"cy.addr"
  %"half_w" = alloca i32
  store i32 0, i32* %"half_w"
  %"half_h" = alloca i32
  store i32 0, i32* %"half_h"
  %"local_y" = alloca i32
  store i32 0, i32* %"local_y"
  %"x_offset" = alloca i32
  store i32 0, i32* %"x_offset"
  %"local_x" = alloca i32
  store i32 0, i32* %"local_x"
  %"fy" = alloca float
  store float              0x0, float* %"fy"
  %".16" = sdiv i32 220, 2
  store i32 %".16", i32* %"half_w"
  %".18" = sdiv i32 52, 2
  store i32 %".18", i32* %"half_h"
  %"my.1" = load i32, i32* %"my.addr"
  %"cy.1" = load i32, i32* %"cy.addr"
  %".20" = sub i32 %"my.1", %"cy.1"
  store i32 %".20", i32* %"local_y"
  %"local_y.1" = load i32, i32* %"local_y"
  %"half_h.1" = load i32, i32* %"half_h"
  %".22" = sub i32 0, %"half_h.1"
  %".23" = icmp slt i32 %"local_y.1", %".22"
  br i1 %".23", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"local_y.2" = load i32, i32* %"local_y"
  %"half_h.2" = load i32, i32* %"half_h"
  %".25" = icmp sgt i32 %"local_y.2", %"half_h.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".25", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  ret i1 false
else:
  br label %"ifcont"
ifcont:
  %"local_y.3" = load i32, i32* %"local_y"
  %"half_h.3" = load i32, i32* %"half_h"
  %".30" = add i32 %"local_y.3", %"half_h.3"
  %".31" = sitofp i32 %".30" to float
  %".32" = sitofp i32 52 to float
  %".33" = fdiv float %".31", %".32"
  store float %".33", float* %"fy"
  %"fy.1" = load float, float* %"fy"
  %".35" = fsub float %"fy.1", 0x3fe0000000000000
  %".36" = mul i32 18, 2
  %".37" = sitofp i32 %".36" to float
  %".38" = fmul float %".35", %".37"
  %".39" = fptosi float %".38" to i32
  store i32 %".39", i32* %"x_offset"
  %"mx.1" = load i32, i32* %"mx.addr"
  %"cx.1" = load i32, i32* %"cx.addr"
  %".41" = sub i32 %"mx.1", %"cx.1"
  %"x_offset.1" = load i32, i32* %"x_offset"
  %".42" = sub i32 %".41", %"x_offset.1"
  store i32 %".42", i32* %"local_x"
  %"local_x.1" = load i32, i32* %"local_x"
  %"half_w.1" = load i32, i32* %"half_w"
  %".44" = sub i32 0, %"half_w.1"
  %".45" = icmp slt i32 %"local_x.1", %".44"
  br i1 %".45", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"local_x.2" = load i32, i32* %"local_x"
  %"half_w.2" = load i32, i32* %"half_w"
  %".47" = icmp sgt i32 %"local_x.2", %"half_w.2"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"ifcont"], [%".47", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"then.1", label %"else.1"
then.1:
  ret i1 false
else.1:
  br label %"ifcont.1"
ifcont.1:
  ret i1 true
}

define i1 @"btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1"(i32 %"mx", i32 %"my", i32 %"cx", i32 %"cy", i32 %"half_w", i32 %"half_h")
{
entry:
  %"mx.addr" = alloca i32
  store i32 %"mx", i32* %"mx.addr"
  %"my.addr" = alloca i32
  store i32 %"my", i32* %"my.addr"
  %"cx.addr" = alloca i32
  store i32 %"cx", i32* %"cx.addr"
  %"cy.addr" = alloca i32
  store i32 %"cy", i32* %"cy.addr"
  %"half_w.addr" = alloca i32
  store i32 %"half_w", i32* %"half_w.addr"
  %"half_h.addr" = alloca i32
  store i32 %"half_h", i32* %"half_h.addr"
  %"local_y" = alloca i32
  store i32 0, i32* %"local_y"
  %"x_offset" = alloca i32
  store i32 0, i32* %"x_offset"
  %"local_x" = alloca i32
  store i32 0, i32* %"local_x"
  %"slant" = alloca i32
  store i32 0, i32* %"slant"
  %"fy" = alloca float
  store float              0x0, float* %"fy"
  %".19" = sdiv i32 18, 2
  store i32 %".19", i32* %"slant"
  %"my.1" = load i32, i32* %"my.addr"
  %"cy.1" = load i32, i32* %"cy.addr"
  %".21" = sub i32 %"my.1", %"cy.1"
  store i32 %".21", i32* %"local_y"
  %"local_y.1" = load i32, i32* %"local_y"
  %"half_h.1" = load i32, i32* %"half_h.addr"
  %".23" = sub i32 0, %"half_h.1"
  %".24" = icmp slt i32 %"local_y.1", %".23"
  br i1 %".24", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"local_y.2" = load i32, i32* %"local_y"
  %"half_h.2" = load i32, i32* %"half_h.addr"
  %".26" = icmp sgt i32 %"local_y.2", %"half_h.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"entry"], [%".26", %"sc_rhs"]
  br i1 %"sc_result", label %"then", label %"else"
then:
  ret i1 false
else:
  br label %"ifcont"
ifcont:
  %"local_y.3" = load i32, i32* %"local_y"
  %"half_h.3" = load i32, i32* %"half_h.addr"
  %".31" = add i32 %"local_y.3", %"half_h.3"
  %".32" = sitofp i32 %".31" to float
  %"half_h.4" = load i32, i32* %"half_h.addr"
  %".33" = mul i32 %"half_h.4", 2
  %".34" = sitofp i32 %".33" to float
  %".35" = fdiv float %".32", %".34"
  store float %".35", float* %"fy"
  %"fy.1" = load float, float* %"fy"
  %".37" = fsub float %"fy.1", 0x3fe0000000000000
  %"slant.1" = load i32, i32* %"slant"
  %".38" = mul i32 %"slant.1", 2
  %".39" = sitofp i32 %".38" to float
  %".40" = fmul float %".37", %".39"
  %".41" = fptosi float %".40" to i32
  store i32 %".41", i32* %"x_offset"
  %"mx.1" = load i32, i32* %"mx.addr"
  %"cx.1" = load i32, i32* %"cx.addr"
  %".43" = sub i32 %"mx.1", %"cx.1"
  %"x_offset.1" = load i32, i32* %"x_offset"
  %".44" = sub i32 %".43", %"x_offset.1"
  store i32 %".44", i32* %"local_x"
  %"local_x.1" = load i32, i32* %"local_x"
  %"half_w.1" = load i32, i32* %"half_w.addr"
  %".46" = sub i32 0, %"half_w.1"
  %".47" = icmp slt i32 %"local_x.1", %".46"
  br i1 %".47", label %"sc_end.1", label %"sc_rhs.1"
sc_rhs.1:
  %"local_x.2" = load i32, i32* %"local_x"
  %"half_w.2" = load i32, i32* %"half_w.addr"
  %".49" = icmp sgt i32 %"local_x.2", %"half_w.2"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [1, %"ifcont"], [%".49", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"then.1", label %"else.1"
then.1:
  ret i1 false
else.1:
  br label %"ifcont.1"
ifcont.1:
  ret i1 true
}

define void @"draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i32 %"cx", i32 %"cy", i32 %"half_w", i32 %"half_h", i32 %"slant", float %"inv_w", float %"inv_h")
{
entry:
  %"cx.addr" = alloca i32
  store i32 %"cx", i32* %"cx.addr"
  %"cy.addr" = alloca i32
  store i32 %"cy", i32* %"cy.addr"
  %"half_w.addr" = alloca i32
  store i32 %"half_w", i32* %"half_w.addr"
  %"half_h.addr" = alloca i32
  store i32 %"half_h", i32* %"half_h.addr"
  %"slant.addr" = alloca i32
  store i32 %"slant", i32* %"slant.addr"
  %"inv_w.addr" = alloca float
  store float %"inv_w", float* %"inv_w.addr"
  %"inv_h.addr" = alloca float
  store float %"inv_h", float* %"inv_h.addr"
  %"bx0" = alloca i32
  store i32 0, i32* %"bx0"
  %"bx1" = alloca i32
  store i32 0, i32* %"bx1"
  %"tx0" = alloca i32
  store i32 0, i32* %"tx0"
  %"tx1" = alloca i32
  store i32 0, i32* %"tx1"
  %"by0" = alloca i32
  store i32 0, i32* %"by0"
  %"ty0" = alloca i32
  store i32 0, i32* %"ty0"
  %"ny_bot" = alloca float
  store float              0x0, float* %"ny_bot"
  %"ny_top" = alloca float
  store float              0x0, float* %"ny_top"
  %"cx.1" = load i32, i32* %"cx.addr"
  %"half_w.1" = load i32, i32* %"half_w.addr"
  %".24" = sub i32 %"cx.1", %"half_w.1"
  %"slant.1" = load i32, i32* %"slant.addr"
  %".25" = sub i32 %".24", %"slant.1"
  store i32 %".25", i32* %"bx0"
  %"cx.2" = load i32, i32* %"cx.addr"
  %"half_w.2" = load i32, i32* %"half_w.addr"
  %".27" = add i32 %"cx.2", %"half_w.2"
  %"slant.2" = load i32, i32* %"slant.addr"
  %".28" = sub i32 %".27", %"slant.2"
  store i32 %".28", i32* %"bx1"
  %"cx.3" = load i32, i32* %"cx.addr"
  %"half_w.3" = load i32, i32* %"half_w.addr"
  %".30" = sub i32 %"cx.3", %"half_w.3"
  %"slant.3" = load i32, i32* %"slant.addr"
  %".31" = add i32 %".30", %"slant.3"
  store i32 %".31", i32* %"tx0"
  %"cx.4" = load i32, i32* %"cx.addr"
  %"half_w.4" = load i32, i32* %"half_w.addr"
  %".33" = add i32 %"cx.4", %"half_w.4"
  %"slant.4" = load i32, i32* %"slant.addr"
  %".34" = add i32 %".33", %"slant.4"
  store i32 %".34", i32* %"tx1"
  %"cy.1" = load i32, i32* %"cy.addr"
  %"half_h.1" = load i32, i32* %"half_h.addr"
  %".36" = sub i32 %"cy.1", %"half_h.1"
  store i32 %".36", i32* %"by0"
  %"cy.2" = load i32, i32* %"cy.addr"
  %"half_h.2" = load i32, i32* %"half_h.addr"
  %".38" = add i32 %"cy.2", %"half_h.2"
  store i32 %".38", i32* %"ty0"
  %"by0.1" = load i32, i32* %"by0"
  %".40" = sitofp i32 %"by0.1" to float
  %"inv_h.1" = load float, float* %"inv_h.addr"
  %".41" = fmul float %".40", %"inv_h.1"
  %".42" = fsub float %".41", 0x3ff0000000000000
  store float %".42", float* %"ny_bot"
  %"ty0.1" = load i32, i32* %"ty0"
  %".44" = sitofp i32 %"ty0.1" to float
  %"inv_h.2" = load float, float* %"inv_h.addr"
  %".45" = fmul float %".44", %"inv_h.2"
  %".46" = fsub float %".45", 0x3ff0000000000000
  store float %".46", float* %"ny_top"
  %"GL_QUADS" = load i32, i32* @"GL_QUADS"
  call void @"glBegin"(i32 %"GL_QUADS")
  call void @"glColor4f"(float              0x0, float              0x0, float              0x0, float 0x3fe0000000000000)
  %"bx0.1" = load i32, i32* %"bx0"
  %".50" = sitofp i32 %"bx0.1" to float
  %"inv_w.1" = load float, float* %"inv_w.addr"
  %".51" = fmul float %".50", %"inv_w.1"
  %".52" = fsub float %".51", 0x3ff0000000000000
  %".53" = fadd float %".52", 0x3f789374c0000000
  %"ny_bot.1" = load float, float* %"ny_bot"
  %".54" = fsub float %"ny_bot.1", 0x3f847ae140000000
  call void @"glVertex2f"(float %".53", float %".54")
  %"bx1.1" = load i32, i32* %"bx1"
  %".56" = sitofp i32 %"bx1.1" to float
  %"inv_w.2" = load float, float* %"inv_w.addr"
  %".57" = fmul float %".56", %"inv_w.2"
  %".58" = fsub float %".57", 0x3ff0000000000000
  %".59" = fadd float %".58", 0x3f789374c0000000
  %"ny_bot.2" = load float, float* %"ny_bot"
  %".60" = fsub float %"ny_bot.2", 0x3f847ae140000000
  call void @"glVertex2f"(float %".59", float %".60")
  %"tx1.1" = load i32, i32* %"tx1"
  %".62" = sitofp i32 %"tx1.1" to float
  %"inv_w.3" = load float, float* %"inv_w.addr"
  %".63" = fmul float %".62", %"inv_w.3"
  %".64" = fsub float %".63", 0x3ff0000000000000
  %".65" = fadd float %".64", 0x3f789374c0000000
  %"ny_top.1" = load float, float* %"ny_top"
  %".66" = fsub float %"ny_top.1", 0x3f847ae140000000
  call void @"glVertex2f"(float %".65", float %".66")
  %"tx0.1" = load i32, i32* %"tx0"
  %".68" = sitofp i32 %"tx0.1" to float
  %"inv_w.4" = load float, float* %"inv_w.addr"
  %".69" = fmul float %".68", %"inv_w.4"
  %".70" = fsub float %".69", 0x3ff0000000000000
  %".71" = fadd float %".70", 0x3f789374c0000000
  %"ny_top.2" = load float, float* %"ny_top"
  %".72" = fsub float %"ny_top.2", 0x3f847ae140000000
  call void @"glVertex2f"(float %".71", float %".72")
  call void @"glEnd"()
  %"GL_QUADS.1" = load i32, i32* @"GL_QUADS"
  call void @"glBegin"(i32 %"GL_QUADS.1")
  call void @"glColor4f"(float 0x3fa47ae140000000, float 0x3fb1eb8520000000, float 0x3fc70a3d80000000, float 0x3fed70a3e0000000)
  %"bx0.2" = load i32, i32* %"bx0"
  %".77" = sitofp i32 %"bx0.2" to float
  %"inv_w.5" = load float, float* %"inv_w.addr"
  %".78" = fmul float %".77", %"inv_w.5"
  %".79" = fsub float %".78", 0x3ff0000000000000
  %"ny_bot.3" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".79", float %"ny_bot.3")
  call void @"glColor4f"(float 0x3fa47ae140000000, float 0x3fb1eb8520000000, float 0x3fc70a3d80000000, float 0x3fed70a3e0000000)
  %"bx1.2" = load i32, i32* %"bx1"
  %".82" = sitofp i32 %"bx1.2" to float
  %"inv_w.6" = load float, float* %"inv_w.addr"
  %".83" = fmul float %".82", %"inv_w.6"
  %".84" = fsub float %".83", 0x3ff0000000000000
  %"ny_bot.4" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".84", float %"ny_bot.4")
  call void @"glColor4f"(float 0x3fb47ae140000000, float 0x3fc1eb8520000000, float 0x3fd5c28f60000000, float 0x3fed70a3e0000000)
  %"tx1.2" = load i32, i32* %"tx1"
  %".87" = sitofp i32 %"tx1.2" to float
  %"inv_w.7" = load float, float* %"inv_w.addr"
  %".88" = fmul float %".87", %"inv_w.7"
  %".89" = fsub float %".88", 0x3ff0000000000000
  %"ny_top.3" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".89", float %"ny_top.3")
  call void @"glColor4f"(float 0x3fb47ae140000000, float 0x3fc1eb8520000000, float 0x3fd5c28f60000000, float 0x3fed70a3e0000000)
  %"tx0.2" = load i32, i32* %"tx0"
  %".92" = sitofp i32 %"tx0.2" to float
  %"inv_w.8" = load float, float* %"inv_w.addr"
  %".93" = fmul float %".92", %"inv_w.8"
  %".94" = fsub float %".93", 0x3ff0000000000000
  %"ny_top.4" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".94", float %"ny_top.4")
  call void @"glEnd"()
  call void @"glLineWidth"(float 0x3ff8000000000000)
  %"GL_LINES" = load i32, i32* @"GL_LINES"
  call void @"glBegin"(i32 %"GL_LINES")
  call void @"glColor4f"(float 0x3fd99999a0000000, float 0x3fe6666660000000, float 0x3ff0000000000000, float 0x3fe99999a0000000)
  %"tx0.3" = load i32, i32* %"tx0"
  %".100" = sitofp i32 %"tx0.3" to float
  %"inv_w.9" = load float, float* %"inv_w.addr"
  %".101" = fmul float %".100", %"inv_w.9"
  %".102" = fsub float %".101", 0x3ff0000000000000
  %"ny_top.5" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".102", float %"ny_top.5")
  %"tx1.3" = load i32, i32* %"tx1"
  %".104" = sitofp i32 %"tx1.3" to float
  %"inv_w.10" = load float, float* %"inv_w.addr"
  %".105" = fmul float %".104", %"inv_w.10"
  %".106" = fsub float %".105", 0x3ff0000000000000
  %"ny_top.6" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".106", float %"ny_top.6")
  call void @"glEnd"()
  %"GL_LINES.1" = load i32, i32* @"GL_LINES"
  call void @"glBegin"(i32 %"GL_LINES.1")
  call void @"glColor4f"(float              0x0, float 0x3fa99999a0000000, float 0x3fc3333340000000, float 0x3fecccccc0000000)
  %"bx0.3" = load i32, i32* %"bx0"
  %".111" = sitofp i32 %"bx0.3" to float
  %"inv_w.11" = load float, float* %"inv_w.addr"
  %".112" = fmul float %".111", %"inv_w.11"
  %".113" = fsub float %".112", 0x3ff0000000000000
  %"ny_bot.5" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".113", float %"ny_bot.5")
  %"bx1.3" = load i32, i32* %"bx1"
  %".115" = sitofp i32 %"bx1.3" to float
  %"inv_w.12" = load float, float* %"inv_w.addr"
  %".116" = fmul float %".115", %"inv_w.12"
  %".117" = fsub float %".116", 0x3ff0000000000000
  %"ny_bot.6" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".117", float %"ny_bot.6")
  call void @"glEnd"()
  call void @"glLineWidth"(float 0x3ffcccccc0000000)
  %"GL_LINE_LOOP" = load i32, i32* @"GL_LINE_LOOP"
  call void @"glBegin"(i32 %"GL_LINE_LOOP")
  call void @"glColor4f"(float 0x3fd0000000000000, float 0x3fe19999a0000000, float 0x3ff0000000000000, float 0x3fee666660000000)
  %"bx0.4" = load i32, i32* %"bx0"
  %".123" = sitofp i32 %"bx0.4" to float
  %"inv_w.13" = load float, float* %"inv_w.addr"
  %".124" = fmul float %".123", %"inv_w.13"
  %".125" = fsub float %".124", 0x3ff0000000000000
  %"ny_bot.7" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".125", float %"ny_bot.7")
  %"bx1.4" = load i32, i32* %"bx1"
  %".127" = sitofp i32 %"bx1.4" to float
  %"inv_w.14" = load float, float* %"inv_w.addr"
  %".128" = fmul float %".127", %"inv_w.14"
  %".129" = fsub float %".128", 0x3ff0000000000000
  %"ny_bot.8" = load float, float* %"ny_bot"
  call void @"glVertex2f"(float %".129", float %"ny_bot.8")
  %"tx1.4" = load i32, i32* %"tx1"
  %".131" = sitofp i32 %"tx1.4" to float
  %"inv_w.15" = load float, float* %"inv_w.addr"
  %".132" = fmul float %".131", %"inv_w.15"
  %".133" = fsub float %".132", 0x3ff0000000000000
  %"ny_top.7" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".133", float %"ny_top.7")
  %"tx0.4" = load i32, i32* %"tx0"
  %".135" = sitofp i32 %"tx0.4" to float
  %"inv_w.16" = load float, float* %"inv_w.addr"
  %".136" = fmul float %".135", %"inv_w.16"
  %".137" = fsub float %".136", 0x3ff0000000000000
  %"ny_top.8" = load float, float* %"ny_top"
  call void @"glVertex2f"(float %".137", float %"ny_top.8")
  call void @"glEnd"()
  ret void
}

define i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"str", i32 %"scale")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"scale.addr" = alloca i32
  store i32 %"scale", i32* %"scale.addr"
  %"ci" = alloca i32
  store i32 0, i32* %"ci"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"count" = alloca i32
  store i32 0, i32* %"count"
  store i32 0, i32* %"ci"
  store i32 0, i32* %"count"
  br label %"while.cond"
while.cond:
  br i1 true, label %"while.body", label %"while.end"
while.body:
  %"str.1" = load i8*, i8** %"str.addr"
  %"ci.1" = load i32, i32* %"ci"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"ci.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".13" = zext i8 %"ptr_load" to i32
  store i32 %".13", i32* %"c"
  %"c.1" = load i32, i32* %"c"
  %".15" = icmp eq i32 %"c.1", 0
  br i1 %".15", label %"then", label %"else"
while.end:
  %"count.2" = load i32, i32* %"count"
  %".24" = icmp eq i32 %"count.2", 0
  br i1 %".24", label %"then.1", label %"else.1"
then:
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"count.1" = load i32, i32* %"count"
  %".19" = add i32 %"count.1", 1
  store i32 %".19", i32* %"count"
  %"ci.2" = load i32, i32* %"ci"
  %".21" = add i32 %"ci.2", 1
  store i32 %".21", i32* %"ci"
  br label %"while.cond"
then.1:
  ret i32 0
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"count.3" = load i32, i32* %"count"
  %".28" = mul i32 %"count.3", 6
  %"scale.1" = load i32, i32* %"scale.addr"
  %".29" = mul i32 %".28", %"scale.1"
  %"scale.2" = load i32, i32* %"scale.addr"
  %".30" = sub i32 %".29", %"scale.2"
  ret i32 %".30"
}

define void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"str", i32 %"px", i32 %"py", i32 %"scale", float %"inv_w", float %"inv_h")
{
entry:
  %"str.addr" = alloca i8*
  store i8* %"str", i8** %"str.addr"
  %"px.addr" = alloca i32
  store i32 %"px", i32* %"px.addr"
  %"py.addr" = alloca i32
  store i32 %"py", i32* %"py.addr"
  %"scale.addr" = alloca i32
  store i32 %"scale", i32* %"scale.addr"
  %"inv_w.addr" = alloca float
  store float %"inv_w", float* %"inv_w.addr"
  %"inv_h.addr" = alloca float
  store float %"inv_h", float* %"inv_h.addr"
  %"ci" = alloca i32
  store i32 0, i32* %"ci"
  %"cx" = alloca i32
  store i32 0, i32* %"cx"
  %"col" = alloca i32
  store i32 0, i32* %"col"
  %"row" = alloca i32
  store i32 0, i32* %"row"
  %"mask" = alloca i32
  store i32 0, i32* %"mask"
  %"qx0" = alloca i32
  store i32 0, i32* %"qx0"
  %"qy0" = alloca i32
  store i32 0, i32* %"qy0"
  %"qx1" = alloca i32
  store i32 0, i32* %"qx1"
  %"qy1" = alloca i32
  store i32 0, i32* %"qy1"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"glyph" = alloca i32*
  store i32* null, i32** %"glyph"
  %"fx0" = alloca float
  store float              0x0, float* %"fx0"
  %"fy0" = alloca float
  store float              0x0, float* %"fy0"
  %"fx1" = alloca float
  store float              0x0, float* %"fx1"
  %"fy1" = alloca float
  store float              0x0, float* %"fy1"
  store i32 0, i32* %"ci"
  %"px.1" = load i32, i32* %"px.addr"
  store i32 %"px.1", i32* %"cx"
  %"GL_QUADS" = load i32, i32* @"GL_QUADS"
  call void @"glBegin"(i32 %"GL_QUADS")
  br label %"while.cond"
while.cond:
  br i1 true, label %"while.body", label %"while.end"
while.body:
  %"str.1" = load i8*, i8** %"str.addr"
  %"ci.1" = load i32, i32* %"ci"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"str.1", i32 %"ci.1"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".34" = zext i8 %"ptr_load" to i32
  store i32 %".34", i32* %"c"
  %"c.1" = load i32, i32* %"c"
  %".36" = icmp eq i32 %"c.1", 0
  br i1 %".36", label %"then", label %"else"
while.end:
  call void @"glEnd"()
  ret void
then:
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"c.2" = load i32, i32* %"c"
  %".40" = icmp sge i32 %"c.2", 97
  br i1 %".40", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"c.3" = load i32, i32* %"c"
  %".42" = icmp sle i32 %"c.3", 122
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"ifcont"], [%".42", %"sc_rhs"]
  br i1 %"sc_result", label %"then.1", label %"else.1"
then.1:
  %"c.4" = load i32, i32* %"c"
  %".45" = sub i32 %"c.4", 32
  store i32 %".45", i32* %"c"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"c.5" = load i32, i32* %"c"
  %".49" = call i32* @"font_glyph__1__intE1__ret_dataE1_ptr1_ubits32"(i32 %"c.5")
  store i32* %".49", i32** %"glyph"
  store i32 0, i32* %"col"
  br label %"while.cond.1"
while.cond.1:
  %"col.1" = load i32, i32* %"col"
  %".53" = icmp slt i32 %"col.1", 5
  br i1 %".53", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"glyph.1" = load i32*, i32** %"glyph"
  %"col.2" = load i32, i32* %"col"
  %"ptr_gep.1" = getelementptr inbounds i32, i32* %"glyph.1", i32 %"col.2"
  %"ptr_load.1" = load i32, i32* %"ptr_gep.1"
  store i32 %"ptr_load.1", i32* %"mask"
  store i32 0, i32* %"row"
  br label %"while.cond.2"
while.end.1:
  %"cx.2" = load i32, i32* %"cx"
  %".102" = add i32 5, 1
  %"scale.5" = load i32, i32* %"scale.addr"
  %".103" = mul i32 %".102", %"scale.5"
  %".104" = add i32 %"cx.2", %".103"
  store i32 %".104", i32* %"cx"
  %"ci.2" = load i32, i32* %"ci"
  %".106" = add i32 %"ci.2", 1
  store i32 %".106", i32* %"ci"
  br label %"while.cond"
while.cond.2:
  %"row.1" = load i32, i32* %"row"
  %".58" = icmp slt i32 %"row.1", 7
  br i1 %".58", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"mask.1" = load i32, i32* %"mask"
  %"row.2" = load i32, i32* %"row"
  %".60" = shl i32 1, %"row.2"
  %".61" = and i32 %"mask.1", %".60"
  %"tobool" = icmp ne i32 %".61", 0
  br i1 %"tobool", label %"then.2", label %"else.2"
while.end.2:
  %"col.4" = load i32, i32* %"col"
  %".99" = add i32 %"col.4", 1
  store i32 %".99", i32* %"col"
  br label %"while.cond.1"
then.2:
  %"cx.1" = load i32, i32* %"cx"
  %"col.3" = load i32, i32* %"col"
  %"scale.1" = load i32, i32* %"scale.addr"
  %".63" = mul i32 %"col.3", %"scale.1"
  %".64" = add i32 %"cx.1", %".63"
  store i32 %".64", i32* %"qx0"
  %"py.1" = load i32, i32* %"py.addr"
  %"row.3" = load i32, i32* %"row"
  %".66" = sub i32 6, %"row.3"
  %"scale.2" = load i32, i32* %"scale.addr"
  %".67" = mul i32 %".66", %"scale.2"
  %".68" = add i32 %"py.1", %".67"
  store i32 %".68", i32* %"qy0"
  %"qx0.1" = load i32, i32* %"qx0"
  %"scale.3" = load i32, i32* %"scale.addr"
  %".70" = add i32 %"qx0.1", %"scale.3"
  store i32 %".70", i32* %"qx1"
  %"qy0.1" = load i32, i32* %"qy0"
  %"scale.4" = load i32, i32* %"scale.addr"
  %".72" = add i32 %"qy0.1", %"scale.4"
  store i32 %".72", i32* %"qy1"
  %"qx0.2" = load i32, i32* %"qx0"
  %".74" = sitofp i32 %"qx0.2" to float
  %"inv_w.1" = load float, float* %"inv_w.addr"
  %".75" = fmul float %".74", %"inv_w.1"
  %".76" = fsub float %".75", 0x3ff0000000000000
  store float %".76", float* %"fx0"
  %"qy0.2" = load i32, i32* %"qy0"
  %".78" = sitofp i32 %"qy0.2" to float
  %"inv_h.1" = load float, float* %"inv_h.addr"
  %".79" = fmul float %".78", %"inv_h.1"
  %".80" = fsub float %".79", 0x3ff0000000000000
  store float %".80", float* %"fy0"
  %"qx1.1" = load i32, i32* %"qx1"
  %".82" = sitofp i32 %"qx1.1" to float
  %"inv_w.2" = load float, float* %"inv_w.addr"
  %".83" = fmul float %".82", %"inv_w.2"
  %".84" = fsub float %".83", 0x3ff0000000000000
  store float %".84", float* %"fx1"
  %"qy1.1" = load i32, i32* %"qy1"
  %".86" = sitofp i32 %"qy1.1" to float
  %"inv_h.2" = load float, float* %"inv_h.addr"
  %".87" = fmul float %".86", %"inv_h.2"
  %".88" = fsub float %".87", 0x3ff0000000000000
  store float %".88", float* %"fy1"
  %"fx0.1" = load float, float* %"fx0"
  %"fy0.1" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx0.1", float %"fy0.1")
  %"fx1.1" = load float, float* %"fx1"
  %"fy0.2" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx1.1", float %"fy0.2")
  %"fx1.2" = load float, float* %"fx1"
  %"fy1.1" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx1.2", float %"fy1.1")
  %"fx0.2" = load float, float* %"fx0"
  %"fy1.2" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx0.2", float %"fy1.2")
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"row.4" = load i32, i32* %"row"
  %".96" = add i32 %"row.4", 1
  store i32 %".96", i32* %"row"
  br label %"while.cond.2"
}

define void @"draw_quit_dialog__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"cx" = alloca i32
  store i32 0, i32* %"cx"
  %"cy" = alloca i32
  store i32 0, i32* %"cy"
  %"panel_w" = alloca i32
  store i32 0, i32* %"panel_w"
  %"panel_h" = alloca i32
  store i32 0, i32* %"panel_h"
  %"px0" = alloca i32
  store i32 0, i32* %"px0"
  %"py0" = alloca i32
  store i32 0, i32* %"py0"
  %"px1" = alloca i32
  store i32 0, i32* %"px1"
  %"py1" = alloca i32
  store i32 0, i32* %"py1"
  %"tw" = alloca i32
  store i32 0, i32* %"tw"
  %"tx" = alloca i32
  store i32 0, i32* %"tx"
  %"ty" = alloca i32
  store i32 0, i32* %"ty"
  %"scale" = alloca i32
  store i32 0, i32* %"scale"
  %"inv_w" = alloca float
  store float              0x0, float* %"inv_w"
  %"inv_h" = alloca float
  store float              0x0, float* %"inv_h"
  %"fx0" = alloca float
  store float              0x0, float* %"fx0"
  %"fy0" = alloca float
  store float              0x0, float* %"fy0"
  %"fx1" = alloca float
  store float              0x0, float* %"fx1"
  %"fy1" = alloca float
  store float              0x0, float* %"fy1"
  %"msg_str" = alloca i8*
  store i8* null, i8** %"msg_str"
  %"yes_str" = alloca i8*
  store i8* null, i8** %"yes_str"
  %"no_str" = alloca i8*
  store i8* null, i8** %"no_str"
  %"w.1" = load i32, i32* %"w.addr"
  %".27" = sitofp i32 %"w.1" to float
  %".28" = fdiv float 0x4000000000000000, %".27"
  store float %".28", float* %"inv_w"
  %"h.1" = load i32, i32* %"h.addr"
  %".30" = sitofp i32 %"h.1" to float
  %".31" = fdiv float 0x4000000000000000, %".30"
  store float %".31", float* %"inv_h"
  %"w.2" = load i32, i32* %"w.addr"
  %".33" = sdiv i32 %"w.2", 2
  store i32 %".33", i32* %"cx"
  %"h.2" = load i32, i32* %"h.addr"
  %".35" = sdiv i32 %"h.2", 2
  store i32 %".35", i32* %"cy"
  store i32 420, i32* %"panel_w"
  store i32 160, i32* %"panel_h"
  store i32 2, i32* %"scale"
  %"cx.1" = load i32, i32* %"cx"
  %"panel_w.1" = load i32, i32* %"panel_w"
  %".40" = sdiv i32 %"panel_w.1", 2
  %".41" = sub i32 %"cx.1", %".40"
  store i32 %".41", i32* %"px0"
  %"cy.1" = load i32, i32* %"cy"
  %"panel_h.1" = load i32, i32* %"panel_h"
  %".43" = sdiv i32 %"panel_h.1", 2
  %".44" = sub i32 %"cy.1", %".43"
  store i32 %".44", i32* %"py0"
  %"cx.2" = load i32, i32* %"cx"
  %"panel_w.2" = load i32, i32* %"panel_w"
  %".46" = sdiv i32 %"panel_w.2", 2
  %".47" = add i32 %"cx.2", %".46"
  store i32 %".47", i32* %"px1"
  %"cy.2" = load i32, i32* %"cy"
  %"panel_h.2" = load i32, i32* %"panel_h"
  %".49" = sdiv i32 %"panel_h.2", 2
  %".50" = add i32 %"cy.2", %".49"
  store i32 %".50", i32* %"py1"
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D")
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND")
  %"GL_SRC_ALPHA" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE_MINUS_SRC_ALPHA" = load i32, i32* @"GL_ONE_MINUS_SRC_ALPHA"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA", i32 %"GL_ONE_MINUS_SRC_ALPHA")
  %"px0.1" = load i32, i32* %"px0"
  %".56" = sitofp i32 %"px0.1" to float
  %"inv_w.1" = load float, float* %"inv_w"
  %".57" = fmul float %".56", %"inv_w.1"
  %".58" = fsub float %".57", 0x3ff0000000000000
  store float %".58", float* %"fx0"
  %"py0.1" = load i32, i32* %"py0"
  %".60" = sitofp i32 %"py0.1" to float
  %"inv_h.1" = load float, float* %"inv_h"
  %".61" = fmul float %".60", %"inv_h.1"
  %".62" = fsub float %".61", 0x3ff0000000000000
  store float %".62", float* %"fy0"
  %"px1.1" = load i32, i32* %"px1"
  %".64" = sitofp i32 %"px1.1" to float
  %"inv_w.2" = load float, float* %"inv_w"
  %".65" = fmul float %".64", %"inv_w.2"
  %".66" = fsub float %".65", 0x3ff0000000000000
  store float %".66", float* %"fx1"
  %"py1.1" = load i32, i32* %"py1"
  %".68" = sitofp i32 %"py1.1" to float
  %"inv_h.2" = load float, float* %"inv_h"
  %".69" = fmul float %".68", %"inv_h.2"
  %".70" = fsub float %".69", 0x3ff0000000000000
  store float %".70", float* %"fy1"
  %"GL_QUADS" = load i32, i32* @"GL_QUADS"
  call void @"glBegin"(i32 %"GL_QUADS")
  call void @"glColor4f"(float 0x3f947ae140000000, float 0x3fa47ae140000000, float 0x3fbeb851e0000000, float 0x3feeb851e0000000)
  %"fx0.1" = load float, float* %"fx0"
  %"fy0.1" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx0.1", float %"fy0.1")
  %"fx1.1" = load float, float* %"fx1"
  %"fy0.2" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx1.1", float %"fy0.2")
  %"fx1.2" = load float, float* %"fx1"
  %"fy1.1" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx1.2", float %"fy1.1")
  %"fx0.2" = load float, float* %"fx0"
  %"fy1.2" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx0.2", float %"fy1.2")
  call void @"glEnd"()
  call void @"glLineWidth"(float 0x3ffcccccc0000000)
  %"GL_LINE_LOOP" = load i32, i32* @"GL_LINE_LOOP"
  call void @"glBegin"(i32 %"GL_LINE_LOOP")
  call void @"glColor4f"(float 0x3fd0000000000000, float 0x3fe19999a0000000, float 0x3ff0000000000000, float 0x3fee666660000000)
  %"fx0.3" = load float, float* %"fx0"
  %"fy0.3" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx0.3", float %"fy0.3")
  %"fx1.3" = load float, float* %"fx1"
  %"fy0.4" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fx1.3", float %"fy0.4")
  %"fx1.4" = load float, float* %"fx1"
  %"fy1.3" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx1.4", float %"fy1.3")
  %"fx0.4" = load float, float* %"fx0"
  %"fy1.4" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx0.4", float %"fy1.4")
  call void @"glEnd"()
  call void @"glLineWidth"(float 0x3ff0000000000000)
  %"GL_LINES" = load i32, i32* @"GL_LINES"
  call void @"glBegin"(i32 %"GL_LINES")
  call void @"glColor4f"(float 0x3fd99999a0000000, float 0x3fe6666660000000, float 0x3ff0000000000000, float 0x3fe3333340000000)
  %"fx0.5" = load float, float* %"fx0"
  %"fy1.5" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx0.5", float %"fy1.5")
  %"fx1.5" = load float, float* %"fx1"
  %"fy1.6" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fx1.5", float %"fy1.6")
  call void @"glEnd"()
  %"str_stack" = alloca [31 x i8]
  %"str_char_0" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 0
  store i8 65, i8* %"str_char_0"
  %"str_char_1" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 1
  store i8 82, i8* %"str_char_1"
  %"str_char_2" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 2
  store i8 69, i8* %"str_char_2"
  %"str_char_3" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 3
  store i8 32, i8* %"str_char_3"
  %"str_char_4" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 4
  store i8 89, i8* %"str_char_4"
  %"str_char_5" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 5
  store i8 79, i8* %"str_char_5"
  %"str_char_6" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 6
  store i8 85, i8* %"str_char_6"
  %"str_char_7" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 7
  store i8 32, i8* %"str_char_7"
  %"str_char_8" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 8
  store i8 83, i8* %"str_char_8"
  %"str_char_9" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 9
  store i8 85, i8* %"str_char_9"
  %"str_char_10" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 10
  store i8 82, i8* %"str_char_10"
  %"str_char_11" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 11
  store i8 69, i8* %"str_char_11"
  %"str_char_12" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 12
  store i8 32, i8* %"str_char_12"
  %"str_char_13" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 13
  store i8 89, i8* %"str_char_13"
  %"str_char_14" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 14
  store i8 79, i8* %"str_char_14"
  %"str_char_15" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 15
  store i8 85, i8* %"str_char_15"
  %"str_char_16" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 16
  store i8 32, i8* %"str_char_16"
  %"str_char_17" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 17
  store i8 87, i8* %"str_char_17"
  %"str_char_18" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 18
  store i8 65, i8* %"str_char_18"
  %"str_char_19" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 19
  store i8 78, i8* %"str_char_19"
  %"str_char_20" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 20
  store i8 84, i8* %"str_char_20"
  %"str_char_21" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 21
  store i8 32, i8* %"str_char_21"
  %"str_char_22" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 22
  store i8 84, i8* %"str_char_22"
  %"str_char_23" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 23
  store i8 79, i8* %"str_char_23"
  %"str_char_24" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 24
  store i8 32, i8* %"str_char_24"
  %"str_char_25" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 25
  store i8 81, i8* %"str_char_25"
  %"str_char_26" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 26
  store i8 85, i8* %"str_char_26"
  %"str_char_27" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 27
  store i8 73, i8* %"str_char_27"
  %"str_char_28" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 28
  store i8 84, i8* %"str_char_28"
  %"str_char_29" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 29
  store i8 63, i8* %"str_char_29"
  %"str_char_30" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 30
  store i8 0, i8* %"str_char_30"
  %"array_to_elem_ptr" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 0
  store i8* %"array_to_elem_ptr", i8** %"msg_str"
  %"msg_str.1" = load i8*, i8** %"msg_str"
  %"scale.1" = load i32, i32* %"scale"
  %".125" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"msg_str.1", i32 %"scale.1")
  store i32 %".125", i32* %"tw"
  %"cx.3" = load i32, i32* %"cx"
  %"tw.1" = load i32, i32* %"tw"
  %".127" = sdiv i32 %"tw.1", 2
  %".128" = sub i32 %"cx.3", %".127"
  store i32 %".128", i32* %"tx"
  %"cy.3" = load i32, i32* %"cy"
  %"panel_h.3" = load i32, i32* %"panel_h"
  %".130" = sdiv i32 %"panel_h.3", 2
  %".131" = add i32 %"cy.3", %".130"
  %".132" = sub i32 %".131", 36
  store i32 %".132", i32* %"ty"
  call void @"glColor4f"(float 0x3feb333340000000, float 0x3fed70a3e0000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %"msg_str.2" = load i8*, i8** %"msg_str"
  %"tx.1" = load i32, i32* %"tx"
  %"ty.1" = load i32, i32* %"ty"
  %"scale.2" = load i32, i32* %"scale"
  %"inv_w.3" = load float, float* %"inv_w"
  %"inv_h.3" = load float, float* %"inv_h"
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"msg_str.2", i32 %"tx.1", i32 %"ty.1", i32 %"scale.2", float %"inv_w.3", float %"inv_h.3")
  %"str_stack.1" = alloca [4 x i8]
  %"str_char_0.1" = getelementptr [4 x i8], [4 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 89, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [4 x i8], [4 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 69, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [4 x i8], [4 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 83, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [4 x i8], [4 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 0, i8* %"str_char_3.1"
  %"array_to_elem_ptr.1" = getelementptr [4 x i8], [4 x i8]* %"str_stack.1", i32 0, i32 0
  store i8* %"array_to_elem_ptr.1", i8** %"yes_str"
  %"cx.4" = load i32, i32* %"cx"
  %".141" = sub i32 %"cx.4", 80
  %"cy.4" = load i32, i32* %"cy"
  %".142" = sub i32 %"cy.4", 50
  %".143" = sdiv i32 220, 4
  %".144" = sdiv i32 52, 2
  %".145" = sdiv i32 18, 2
  %"inv_w.4" = load float, float* %"inv_w"
  %"inv_h.4" = load float, float* %"inv_h"
  call void @"draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i32 %".141", i32 %".142", i32 %".143", i32 %".144", i32 %".145", float %"inv_w.4", float %"inv_h.4")
  %"yes_str.1" = load i8*, i8** %"yes_str"
  %"scale.3" = load i32, i32* %"scale"
  %".147" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"yes_str.1", i32 %"scale.3")
  store i32 %".147", i32* %"tw"
  %"cx.5" = load i32, i32* %"cx"
  %".149" = sub i32 %"cx.5", 80
  %"tw.2" = load i32, i32* %"tw"
  %".150" = sdiv i32 %"tw.2", 2
  %".151" = sub i32 %".149", %".150"
  store i32 %".151", i32* %"tx"
  %"cy.5" = load i32, i32* %"cy"
  %".153" = sub i32 %"cy.5", 50
  %"scale.4" = load i32, i32* %"scale"
  %".154" = mul i32 7, %"scale.4"
  %".155" = sdiv i32 %".154", 2
  %".156" = sub i32 %".153", %".155"
  store i32 %".156", i32* %"ty"
  call void @"glColor4f"(float 0x3fe8000000000000, float 0x3fec28f5c0000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %"yes_str.2" = load i8*, i8** %"yes_str"
  %"tx.2" = load i32, i32* %"tx"
  %"ty.2" = load i32, i32* %"ty"
  %"scale.5" = load i32, i32* %"scale"
  %"inv_w.5" = load float, float* %"inv_w"
  %"inv_h.5" = load float, float* %"inv_h"
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"yes_str.2", i32 %"tx.2", i32 %"ty.2", i32 %"scale.5", float %"inv_w.5", float %"inv_h.5")
  %"str_stack.2" = alloca [3 x i8]
  %"str_char_0.2" = getelementptr [3 x i8], [3 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 78, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [3 x i8], [3 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 79, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [3 x i8], [3 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 0, i8* %"str_char_2.2"
  %"array_to_elem_ptr.2" = getelementptr [3 x i8], [3 x i8]* %"str_stack.2", i32 0, i32 0
  store i8* %"array_to_elem_ptr.2", i8** %"no_str"
  %"cx.6" = load i32, i32* %"cx"
  %".164" = add i32 %"cx.6", 80
  %"cy.6" = load i32, i32* %"cy"
  %".165" = sub i32 %"cy.6", 50
  %".166" = sdiv i32 220, 4
  %".167" = sdiv i32 52, 2
  %".168" = sdiv i32 18, 2
  %"inv_w.6" = load float, float* %"inv_w"
  %"inv_h.6" = load float, float* %"inv_h"
  call void @"draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i32 %".164", i32 %".165", i32 %".166", i32 %".167", i32 %".168", float %"inv_w.6", float %"inv_h.6")
  %"no_str.1" = load i8*, i8** %"no_str"
  %"scale.6" = load i32, i32* %"scale"
  %".170" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"no_str.1", i32 %"scale.6")
  store i32 %".170", i32* %"tw"
  %"cx.7" = load i32, i32* %"cx"
  %".172" = add i32 %"cx.7", 80
  %"tw.3" = load i32, i32* %"tw"
  %".173" = sdiv i32 %"tw.3", 2
  %".174" = sub i32 %".172", %".173"
  store i32 %".174", i32* %"tx"
  %"cy.7" = load i32, i32* %"cy"
  %".176" = sub i32 %"cy.7", 50
  %"scale.7" = load i32, i32* %"scale"
  %".177" = mul i32 7, %"scale.7"
  %".178" = sdiv i32 %".177", 2
  %".179" = sub i32 %".176", %".178"
  store i32 %".179", i32* %"ty"
  call void @"glColor4f"(float 0x3fe8000000000000, float 0x3fec28f5c0000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %"no_str.2" = load i8*, i8** %"no_str"
  %"tx.3" = load i32, i32* %"tx"
  %"ty.3" = load i32, i32* %"ty"
  %"scale.8" = load i32, i32* %"scale"
  %"inv_w.7" = load float, float* %"inv_w"
  %"inv_h.7" = load float, float* %"inv_h"
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"no_str.2", i32 %"tx.3", i32 %"ty.3", i32 %"scale.8", float %"inv_w.7", float %"inv_h.7")
  %"GL_BLEND.1" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.1")
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.1")
  ret void
}

define void @"paddle_update__0__ret_voidE1"()
{
entry:
  %"gy" = alloca i32
  store i32 0, i32* %"gy"
  %"jet_center" = alloca i32
  store i32 0, i32* %"jet_center"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"jet_x" = alloca i32
  store i32 0, i32* %"jet_x"
  %"jitter" = alloca i32
  store i32 0, i32* %"jitter"
  %"dy" = alloca double
  store double              0x0, double* %"dy"
  %"fall" = alloca double
  store double              0x0, double* %"fall"
  %"paddle_face_x" = alloca float
  store float              0x0, float* %"paddle_face_x"
  %"ball_dx" = alloca float
  store float              0x0, float* %"ball_dx"
  %"ball_dy" = alloca float
  store float              0x0, float* %"ball_dy"
  %"ball_dist" = alloca float
  store float              0x0, float* %"ball_dist"
  %"pull" = alloca float
  store float              0x0, float* %"pull"
  %"cur_h" = load i32, i32* @"cur_h"
  %".16" = sub i32 %"cur_h", 1
  %"mouse_y" = load i32, i32* @"mouse_y"
  %".17" = sub i32 %".16", %"mouse_y"
  %".18" = mul i32 %".17", 192
  %"cur_h.1" = load i32, i32* @"cur_h"
  %".19" = sdiv i32 %".18", %"cur_h.1"
  store i32 %".19", i32* %"gy"
  %"gy.1" = load i32, i32* %"gy"
  %".21" = add i32 14, 1
  %".22" = icmp slt i32 %"gy.1", %".21"
  br i1 %".22", label %"then", label %"else"
then:
  %".24" = add i32 14, 1
  store i32 %".24", i32* %"gy"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"gy.2" = load i32, i32* %"gy"
  %".28" = sub i32 192, 14
  %".29" = sub i32 %".28", 2
  %".30" = icmp sgt i32 %"gy.2", %".29"
  br i1 %".30", label %"then.1", label %"else.1"
then.1:
  %".32" = sub i32 192, 14
  %".33" = sub i32 %".32", 2
  store i32 %".33", i32* %"gy"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"gy.3" = load i32, i32* %"gy"
  store i32 %"gy.3", i32* @"g_paddle_gy"
  %"g_sucking" = load i1, i1* @"g_sucking"
  br i1 %"g_sucking", label %"then.2", label %"else.2"
then.2:
  %"g_suck_charge" = load float, float* @"g_suck_charge"
  %".39" = fadd float %"g_suck_charge", 0x3f926e9780000000
  store float %".39", float* @"g_suck_charge"
  %"g_suck_charge.1" = load float, float* @"g_suck_charge"
  %".41" = fcmp ogt float %"g_suck_charge.1", 0x3ff0000000000000
  br i1 %".41", label %"then.3", label %"else.3"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"g_suck_charge.3" = load float, float* @"g_suck_charge"
  %".135" = fcmp ogt float %"g_suck_charge.3",              0x0
  br i1 %".135", label %"then.8", label %"else.8"
then.3:
  store float 0x3ff0000000000000, float* @"g_suck_charge"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %".46" = add i32 4, 2
  %"cur_w" = load i32, i32* @"cur_w"
  %".47" = mul i32 %".46", %"cur_w"
  %".48" = sdiv i32 %".47", 256
  %".49" = sitofp i32 %".48" to float
  store float %".49", float* %"paddle_face_x"
  %"paddle_face_x.1" = load float, float* %"paddle_face_x"
  %"g_ball_x" = load float, float* @"g_ball_x"
  %".51" = fsub float %"paddle_face_x.1", %"g_ball_x"
  store float %".51", float* %"ball_dx"
  %"gy.4" = load i32, i32* %"gy"
  %"cur_h.2" = load i32, i32* @"cur_h"
  %".53" = mul i32 %"gy.4", %"cur_h.2"
  %".54" = sdiv i32 %".53", 192
  %".55" = sitofp i32 %".54" to float
  %"g_ball_y" = load float, float* @"g_ball_y"
  %".56" = fsub float %".55", %"g_ball_y"
  store float %".56", float* %"ball_dy"
  %"ball_dx.1" = load float, float* %"ball_dx"
  %"ball_dx.2" = load float, float* %"ball_dx"
  %".58" = fmul float %"ball_dx.1", %"ball_dx.2"
  %"ball_dy.1" = load float, float* %"ball_dy"
  %"ball_dy.2" = load float, float* %"ball_dy"
  %".59" = fmul float %"ball_dy.1", %"ball_dy.2"
  %".60" = fadd float %".58", %".59"
  %".61" = call float @"standard__math__sqrt__1__floatE1__ret_floatE1"(float %".60")
  store float %".61", float* %"ball_dist"
  %"ball_dist.1" = load float, float* %"ball_dist"
  %".63" = fcmp ogt float %"ball_dist.1", 0x3ff0000000000000
  br i1 %".63", label %"then.4", label %"else.4"
then.4:
  %"g_suck_charge.2" = load float, float* @"g_suck_charge"
  %".65" = fmul float %"g_suck_charge.2", 0x3ff3333340000000
  %".66" = fadd float 0x3fe3333340000000, %".65"
  store float %".66", float* %"pull"
  %"g_ball_vx" = load float, float* @"g_ball_vx"
  %"ball_dx.3" = load float, float* %"ball_dx"
  %"ball_dist.2" = load float, float* %"ball_dist"
  %".68" = fdiv float %"ball_dx.3", %"ball_dist.2"
  %"pull.1" = load float, float* %"pull"
  %".69" = fmul float %".68", %"pull.1"
  %".70" = fadd float %"g_ball_vx", %".69"
  store float %".70", float* @"g_ball_vx"
  %"g_ball_vy" = load float, float* @"g_ball_vy"
  %"ball_dy.3" = load float, float* %"ball_dy"
  %"ball_dist.3" = load float, float* %"ball_dist"
  %".72" = fdiv float %"ball_dy.3", %"ball_dist.3"
  %"pull.2" = load float, float* %"pull"
  %".73" = fmul float %".72", %"pull.2"
  %".74" = fadd float %"g_ball_vy", %".73"
  store float %".74", float* @"g_ball_vy"
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %".78" = add i32 4, 2
  store i32 %".78", i32* %"jet_x"
  %"gy.5" = load i32, i32* %"gy"
  %".80" = sub i32 %"gy.5", 14
  store i32 %".80", i32* %"jstart"
  %"gy.6" = load i32, i32* %"gy"
  %".82" = add i32 %"gy.6", 14
  store i32 %".82", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".84" = icmp slt i32 %"jstart.1", 1
  br i1 %".84", label %"then.5", label %"else.5"
then.5:
  store i32 1, i32* %"jstart"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"jend.1" = load i32, i32* %"jend"
  %".89" = sub i32 192, 2
  %".90" = icmp sgt i32 %"jend.1", %".89"
  br i1 %".90", label %"then.6", label %"else.6"
then.6:
  %".92" = sub i32 192, 2
  store i32 %".92", i32* %"jend"
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".98" = icmp sle i32 %"j.1", %"jend.2"
  br i1 %".98", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %"gy.7" = load i32, i32* %"gy"
  %".100" = sub i32 %"j.2", %"gy.7"
  %".101" = sitofp i32 %".100" to double
  store double %".101", double* %"dy"
  %"dy.1" = load double, double* %"dy"
  %"dy.2" = load double, double* %"dy"
  %".103" = fmul double %"dy.1", %"dy.2"
  %".104" = mul i32 14, 14
  %".105" = add i32 %".104", 1
  %".106" = sitofp i32 %".105" to double
  %".107" = fdiv double %".103", %".106"
  %"float_to_double_lhs" = fpext float 0x3ff0000000000000 to double
  %".108" = fsub double %"float_to_double_lhs", %".107"
  store double %".108", double* %"fall"
  %"fall.1" = load double, double* %"fall"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".110" = fcmp olt double %"fall.1", %"float_to_double_rhs"
  br i1 %".110", label %"then.7", label %"else.7"
for.update:
  %"j.7" = load i32, i32* %"j"
  %".130" = add i32 %"j.7", 1
  store i32 %".130", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
then.7:
  %"f32_to_f64" = fpext float              0x0 to double
  store double %"f32_to_f64", double* %"fall"
  br label %"ifcont.7"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"g_dens" = load double*, double** @"g_dens"
  %"jet_x.1" = load i32, i32* %"jet_x"
  %"j.3" = load i32, i32* %"j"
  %".115" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.1", i32 %"j.3")
  %"ptr_gep" = getelementptr inbounds double, double* %"g_dens", i32 %".115"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"fall.2" = load double, double* %"fall"
  %".116" = fmul float 0x4079000000000000, 0x3fd99999a0000000
  %"float_to_double_rhs.1" = fpext float %".116" to double
  %".117" = fmul double %"fall.2", %"float_to_double_rhs.1"
  %".118" = fadd double %"ptr_load", %".117"
  %"g_dens.1" = load double*, double** @"g_dens"
  %"jet_x.2" = load i32, i32* %"jet_x"
  %"j.4" = load i32, i32* %"j"
  %".119" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.2", i32 %"j.4")
  %".120" = getelementptr inbounds double, double* %"g_dens.1", i32 %".119"
  store double %".118", double* %".120"
  %"g_vx" = load double*, double** @"g_vx"
  %"jet_x.3" = load i32, i32* %"jet_x"
  %"j.5" = load i32, i32* %"j"
  %".122" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.3", i32 %"j.5")
  %"ptr_gep.1" = getelementptr inbounds double, double* %"g_vx", i32 %".122"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"fall.3" = load double, double* %"fall"
  %".123" = fmul float 0x4044000000000000, 0x3ff8000000000000
  %"float_to_double_rhs.2" = fpext float %".123" to double
  %".124" = fmul double %"fall.3", %"float_to_double_rhs.2"
  %".125" = fsub double %"ptr_load.1", %".124"
  %"g_vx.1" = load double*, double** @"g_vx"
  %"jet_x.4" = load i32, i32* %"jet_x"
  %"j.6" = load i32, i32* %"j"
  %".126" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.4", i32 %"j.6")
  %".127" = getelementptr inbounds double, double* %"g_vx.1", i32 %".126"
  store double %".125", double* %".127"
  br label %"for.update"
then.8:
  %"g_ball_vx.1" = load float, float* @"g_ball_vx"
  %"g_suck_charge.4" = load float, float* @"g_suck_charge"
  %".137" = fmul float %"g_suck_charge.4", 0x4036000000000000
  %".138" = fadd float %"g_ball_vx.1", %".137"
  store float %".138", float* @"g_ball_vx"
  %"g_ball_vy.1" = load float, float* @"g_ball_vy"
  %".140" = fmul float %"g_ball_vy.1", 0x3fd99999a0000000
  store float %".140", float* @"g_ball_vy"
  store float              0x0, float* @"g_suck_charge"
  ret void
else.8:
  br label %"ifcont.8"
ifcont.8:
  %"g_jetting" = load i1, i1* @"g_jetting"
  %".145" = xor i1 %"g_jetting", -1
  br i1 %".145", label %"then.9", label %"else.9"
then.9:
  ret void
else.9:
  br label %"ifcont.9"
ifcont.9:
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".149" = mul i32 %"g_rand_seed", 1664525
  %".150" = add i32 %".149", 1013904223
  store i32 %".150", i32* @"g_rand_seed"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".152" = and i32 %"g_rand_seed.1", 7
  %".153" = sub i32 %".152", 3
  store i32 %".153", i32* %"jitter"
  %"gy.8" = load i32, i32* %"gy"
  %"jitter.1" = load i32, i32* %"jitter"
  %".155" = add i32 %"gy.8", %"jitter.1"
  store i32 %".155", i32* %"jet_center"
  %".157" = add i32 4, 1
  store i32 %".157", i32* %"jet_x"
  %"jet_center.1" = load i32, i32* %"jet_center"
  %".159" = sub i32 %"jet_center.1", 14
  store i32 %".159", i32* %"jstart"
  %"jet_center.2" = load i32, i32* %"jet_center"
  %".161" = add i32 %"jet_center.2", 14
  store i32 %".161", i32* %"jend"
  %"jstart.3" = load i32, i32* %"jstart"
  %".163" = icmp slt i32 %"jstart.3", 1
  br i1 %".163", label %"then.10", label %"else.10"
then.10:
  store i32 1, i32* %"jstart"
  br label %"ifcont.10"
else.10:
  br label %"ifcont.10"
ifcont.10:
  %"jend.3" = load i32, i32* %"jend"
  %".168" = sub i32 192, 2
  %".169" = icmp sgt i32 %"jend.3", %".168"
  br i1 %".169", label %"then.11", label %"else.11"
then.11:
  %".171" = sub i32 192, 2
  store i32 %".171", i32* %"jend"
  br label %"ifcont.11"
else.11:
  br label %"ifcont.11"
ifcont.11:
  %"jstart.4" = load i32, i32* %"jstart"
  store i32 %"jstart.4", i32* %"j"
  br label %"for.cond.1"
for.cond.1:
  %"j.8" = load i32, i32* %"j"
  %"jend.4" = load i32, i32* %"jend"
  %".177" = icmp sle i32 %"j.8", %"jend.4"
  br i1 %".177", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"j.9" = load i32, i32* %"j"
  %"jet_center.3" = load i32, i32* %"jet_center"
  %".179" = sub i32 %"j.9", %"jet_center.3"
  %".180" = sitofp i32 %".179" to double
  store double %".180", double* %"dy"
  %"dy.3" = load double, double* %"dy"
  %"dy.4" = load double, double* %"dy"
  %".182" = fmul double %"dy.3", %"dy.4"
  %".183" = mul i32 14, 14
  %".184" = add i32 %".183", 1
  %".185" = sitofp i32 %".184" to double
  %".186" = fdiv double %".182", %".185"
  %"float_to_double_lhs.1" = fpext float 0x3ff0000000000000 to double
  %".187" = fsub double %"float_to_double_lhs.1", %".186"
  store double %".187", double* %"fall"
  %"fall.4" = load double, double* %"fall"
  %"float_to_double_rhs.3" = fpext float              0x0 to double
  %".189" = fcmp olt double %"fall.4", %"float_to_double_rhs.3"
  br i1 %".189", label %"then.12", label %"else.12"
for.update.1:
  %"j.14" = load i32, i32* %"j"
  %".207" = add i32 %"j.14", 1
  store i32 %".207", i32* %"j"
  br label %"for.cond.1"
for.end.1:
  ret void
then.12:
  %"f32_to_f64.1" = fpext float              0x0 to double
  store double %"f32_to_f64.1", double* %"fall"
  br label %"ifcont.12"
else.12:
  br label %"ifcont.12"
ifcont.12:
  %"g_dens.2" = load double*, double** @"g_dens"
  %"jet_x.5" = load i32, i32* %"jet_x"
  %"j.10" = load i32, i32* %"j"
  %".194" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.5", i32 %"j.10")
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_dens.2", i32 %".194"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"fall.5" = load double, double* %"fall"
  %"float_to_double_rhs.4" = fpext float 0x4079000000000000 to double
  %".195" = fmul double %"fall.5", %"float_to_double_rhs.4"
  %".196" = fadd double %"ptr_load.2", %".195"
  %"g_dens.3" = load double*, double** @"g_dens"
  %"jet_x.6" = load i32, i32* %"jet_x"
  %"j.11" = load i32, i32* %"j"
  %".197" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.6", i32 %"j.11")
  %".198" = getelementptr inbounds double, double* %"g_dens.3", i32 %".197"
  store double %".196", double* %".198"
  %"g_vx.2" = load double*, double** @"g_vx"
  %"jet_x.7" = load i32, i32* %"jet_x"
  %"j.12" = load i32, i32* %"j"
  %".200" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.7", i32 %"j.12")
  %"ptr_gep.3" = getelementptr inbounds double, double* %"g_vx.2", i32 %".200"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %"fall.6" = load double, double* %"fall"
  %"float_to_double_rhs.5" = fpext float 0x4044000000000000 to double
  %".201" = fmul double %"fall.6", %"float_to_double_rhs.5"
  %".202" = fadd double %"ptr_load.3", %".201"
  %"g_vx.3" = load double*, double** @"g_vx"
  %"jet_x.8" = load i32, i32* %"jet_x"
  %"j.13" = load i32, i32* %"j"
  %".203" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.8", i32 %"j.13")
  %".204" = getelementptr inbounds double, double* %"g_vx.3", i32 %".203"
  store double %".202", double* %".204"
  br label %"for.update.1"
}

define void @"cpu_paddle_update__0__ret_voidE1"()
{
entry:
  %"gy" = alloca i32
  store i32 0, i32* %"gy"
  %"ball_gy" = alloca i32
  store i32 0, i32* %"ball_gy"
  %"diff" = alloca i32
  store i32 0, i32* %"diff"
  %"jet_center" = alloca i32
  store i32 0, i32* %"jet_center"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"jet_x" = alloca i32
  store i32 0, i32* %"jet_x"
  %"jitter" = alloca i32
  store i32 0, i32* %"jitter"
  %"dy" = alloca double
  store double              0x0, double* %"dy"
  %"fall" = alloca double
  store double              0x0, double* %"fall"
  %"g_ball_y" = load float, float* @"g_ball_y"
  %"cur_h" = load i32, i32* @"cur_h"
  %".13" = sitofp i32 %"cur_h" to float
  %".14" = fdiv float %"g_ball_y", %".13"
  %".15" = sitofp i32 192 to float
  %".16" = fmul float %".14", %".15"
  %".17" = fptosi float %".16" to i32
  store i32 %".17", i32* %"ball_gy"
  %"ball_gy.1" = load i32, i32* %"ball_gy"
  %".19" = icmp slt i32 %"ball_gy.1", 0
  br i1 %".19", label %"then", label %"else"
then:
  store i32 0, i32* %"ball_gy"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"ball_gy.2" = load i32, i32* %"ball_gy"
  %".24" = icmp sgt i32 %"ball_gy.2", 192
  br i1 %".24", label %"then.1", label %"else.1"
then.1:
  store i32 192, i32* %"ball_gy"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"g_cpu_paddle_gy" = load i32, i32* @"g_cpu_paddle_gy"
  store i32 %"g_cpu_paddle_gy", i32* %"gy"
  %"ball_gy.3" = load i32, i32* %"ball_gy"
  %"gy.1" = load i32, i32* %"gy"
  %".30" = sub i32 %"ball_gy.3", %"gy.1"
  store i32 %".30", i32* %"diff"
  %"diff.1" = load i32, i32* %"diff"
  %".32" = fptosi float 0x3ff8000000000000 to i32
  %".33" = icmp sgt i32 %"diff.1", %".32"
  br i1 %".33", label %"then.2", label %"else.2"
then.2:
  %".35" = fptosi float 0x3ff8000000000000 to i32
  store i32 %".35", i32* %"diff"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"diff.2" = load i32, i32* %"diff"
  %".39" = fptosi float 0x3ff8000000000000 to i32
  %".40" = sub i32 0, %".39"
  %".41" = icmp slt i32 %"diff.2", %".40"
  br i1 %".41", label %"then.3", label %"else.3"
then.3:
  %".43" = fptosi float 0x3ff8000000000000 to i32
  %".44" = sub i32 0, %".43"
  store i32 %".44", i32* %"diff"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"gy.2" = load i32, i32* %"gy"
  %"diff.3" = load i32, i32* %"diff"
  %".48" = add i32 %"gy.2", %"diff.3"
  store i32 %".48", i32* %"gy"
  %"gy.3" = load i32, i32* %"gy"
  %".50" = add i32 14, 1
  %".51" = icmp slt i32 %"gy.3", %".50"
  br i1 %".51", label %"then.4", label %"else.4"
then.4:
  %".53" = add i32 14, 1
  store i32 %".53", i32* %"gy"
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"gy.4" = load i32, i32* %"gy"
  %".57" = sub i32 192, 14
  %".58" = sub i32 %".57", 2
  %".59" = icmp sgt i32 %"gy.4", %".58"
  br i1 %".59", label %"then.5", label %"else.5"
then.5:
  %".61" = sub i32 192, 14
  %".62" = sub i32 %".61", 2
  store i32 %".62", i32* %"gy"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"gy.5" = load i32, i32* %"gy"
  store i32 %"gy.5", i32* @"g_cpu_paddle_gy"
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".67" = mul i32 %"g_rand_seed", 1664525
  %".68" = add i32 %".67", 1013904223
  store i32 %".68", i32* @"g_rand_seed"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".70" = and i32 %"g_rand_seed.1", 7
  %".71" = sub i32 %".70", 3
  store i32 %".71", i32* %"jitter"
  %"gy.6" = load i32, i32* %"gy"
  %"jitter.1" = load i32, i32* %"jitter"
  %".73" = add i32 %"gy.6", %"jitter.1"
  store i32 %".73", i32* %"jet_center"
  %".75" = sub i32 256, 6
  %".76" = sub i32 %".75", 1
  store i32 %".76", i32* %"jet_x"
  %"jet_center.1" = load i32, i32* %"jet_center"
  %".78" = sub i32 %"jet_center.1", 14
  store i32 %".78", i32* %"jstart"
  %"jet_center.2" = load i32, i32* %"jet_center"
  %".80" = add i32 %"jet_center.2", 14
  store i32 %".80", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".82" = icmp slt i32 %"jstart.1", 1
  br i1 %".82", label %"then.6", label %"else.6"
then.6:
  store i32 1, i32* %"jstart"
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"jend.1" = load i32, i32* %"jend"
  %".87" = sub i32 192, 2
  %".88" = icmp sgt i32 %"jend.1", %".87"
  br i1 %".88", label %"then.7", label %"else.7"
then.7:
  %".90" = sub i32 192, 2
  store i32 %".90", i32* %"jend"
  br label %"ifcont.7"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".96" = icmp sle i32 %"j.1", %"jend.2"
  br i1 %".96", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %"jet_center.3" = load i32, i32* %"jet_center"
  %".98" = sub i32 %"j.2", %"jet_center.3"
  %".99" = sitofp i32 %".98" to double
  store double %".99", double* %"dy"
  %"dy.1" = load double, double* %"dy"
  %"dy.2" = load double, double* %"dy"
  %".101" = fmul double %"dy.1", %"dy.2"
  %".102" = mul i32 14, 14
  %".103" = add i32 %".102", 1
  %".104" = sitofp i32 %".103" to double
  %".105" = fdiv double %".101", %".104"
  %"float_to_double_lhs" = fpext float 0x3ff0000000000000 to double
  %".106" = fsub double %"float_to_double_lhs", %".105"
  store double %".106", double* %"fall"
  %"fall.1" = load double, double* %"fall"
  %"float_to_double_rhs" = fpext float              0x0 to double
  %".108" = fcmp olt double %"fall.1", %"float_to_double_rhs"
  br i1 %".108", label %"then.8", label %"else.8"
for.update:
  %"j.7" = load i32, i32* %"j"
  %".126" = add i32 %"j.7", 1
  store i32 %".126", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
then.8:
  %"f32_to_f64" = fpext float              0x0 to double
  store double %"f32_to_f64", double* %"fall"
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  %"g_dens" = load double*, double** @"g_dens"
  %"jet_x.1" = load i32, i32* %"jet_x"
  %"j.3" = load i32, i32* %"j"
  %".113" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.1", i32 %"j.3")
  %"ptr_gep" = getelementptr inbounds double, double* %"g_dens", i32 %".113"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"fall.2" = load double, double* %"fall"
  %"float_to_double_rhs.1" = fpext float 0x4079000000000000 to double
  %".114" = fmul double %"fall.2", %"float_to_double_rhs.1"
  %".115" = fadd double %"ptr_load", %".114"
  %"g_dens.1" = load double*, double** @"g_dens"
  %"jet_x.2" = load i32, i32* %"jet_x"
  %"j.4" = load i32, i32* %"j"
  %".116" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.2", i32 %"j.4")
  %".117" = getelementptr inbounds double, double* %"g_dens.1", i32 %".116"
  store double %".115", double* %".117"
  %"g_vx" = load double*, double** @"g_vx"
  %"jet_x.3" = load i32, i32* %"jet_x"
  %"j.5" = load i32, i32* %"j"
  %".119" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.3", i32 %"j.5")
  %"ptr_gep.1" = getelementptr inbounds double, double* %"g_vx", i32 %".119"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"fall.3" = load double, double* %"fall"
  %"float_to_double_rhs.2" = fpext float 0x4044000000000000 to double
  %".120" = fmul double %"fall.3", %"float_to_double_rhs.2"
  %".121" = fsub double %"ptr_load.1", %".120"
  %"g_vx.1" = load double*, double** @"g_vx"
  %"jet_x.4" = load i32, i32* %"jet_x"
  %"j.6" = load i32, i32* %"j"
  %".122" = call i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"jet_x.4", i32 %"j.6")
  %".123" = getelementptr inbounds double, double* %"g_vx.1", i32 %".122"
  store double %".121", double* %".123"
  br label %"for.update"
}

define void @"draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h", i32 %"grid_x", i32 %"center_gy")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"grid_x.addr" = alloca i32
  store i32 %"grid_x", i32* %"grid_x.addr"
  %"center_gy.addr" = alloca i32
  store i32 %"center_gy", i32* %"center_gy.addr"
  %"cols" = alloca i32
  store i32 0, i32* %"cols"
  %"rows" = alloca i32
  store i32 0, i32* %"rows"
  %"ci" = alloca i32
  store i32 0, i32* %"ci"
  %"ri" = alloca i32
  store i32 0, i32* %"ri"
  %"cx_px" = alloca i32
  store i32 0, i32* %"cx_px"
  %"cy_px" = alloca i32
  store i32 0, i32* %"cy_px"
  %"paddle_left_px" = alloca i32
  store i32 0, i32* %"paddle_left_px"
  %"paddle_bot_px" = alloca i32
  store i32 0, i32* %"paddle_bot_px"
  %"paddle_top_px" = alloca i32
  store i32 0, i32* %"paddle_top_px"
  %"paddle_w_px" = alloca i32
  store i32 0, i32* %"paddle_w_px"
  %"paddle_h_px" = alloca i32
  store i32 0, i32* %"paddle_h_px"
  %"seg" = alloca i32
  store i32 0, i32* %"seg"
  %"num_seg" = alloca i32
  store i32 0, i32* %"num_seg"
  %"inv_w" = alloca float
  store float              0x0, float* %"inv_w"
  %"inv_h" = alloca float
  store float              0x0, float* %"inv_h"
  %"cell_w" = alloca float
  store float              0x0, float* %"cell_w"
  %"cell_h" = alloca float
  store float              0x0, float* %"cell_h"
  %"radius" = alloca float
  store float              0x0, float* %"radius"
  %"ox" = alloca float
  store float              0x0, float* %"ox"
  %"oy" = alloca float
  store float              0x0, float* %"oy"
  %"fx" = alloca float
  store float              0x0, float* %"fx"
  %"fy" = alloca float
  store float              0x0, float* %"fy"
  %"angle" = alloca float
  store float              0x0, float* %"angle"
  %"step" = alloca float
  store float              0x0, float* %"step"
  %"ndcx" = alloca float
  store float              0x0, float* %"ndcx"
  %"ndcy" = alloca float
  store float              0x0, float* %"ndcy"
  store i32 5, i32* %"cols"
  store i32 20, i32* %"rows"
  store i32 16, i32* %"num_seg"
  %"w.1" = load i32, i32* %"w.addr"
  %".39" = sitofp i32 %"w.1" to float
  %".40" = fdiv float 0x4000000000000000, %".39"
  store float %".40", float* %"inv_w"
  %"h.1" = load i32, i32* %"h.addr"
  %".42" = sitofp i32 %"h.1" to float
  %".43" = fdiv float 0x4000000000000000, %".42"
  store float %".43", float* %"inv_h"
  %"grid_x.1" = load i32, i32* %"grid_x.addr"
  %"w.2" = load i32, i32* %"w.addr"
  %".45" = mul i32 %"grid_x.1", %"w.2"
  %".46" = sdiv i32 %".45", 256
  store i32 %".46", i32* %"paddle_left_px"
  %"center_gy.1" = load i32, i32* %"center_gy.addr"
  %".48" = sub i32 %"center_gy.1", 14
  %"h.2" = load i32, i32* %"h.addr"
  %".49" = mul i32 %".48", %"h.2"
  %".50" = sdiv i32 %".49", 192
  store i32 %".50", i32* %"paddle_bot_px"
  %"center_gy.2" = load i32, i32* %"center_gy.addr"
  %".52" = add i32 %"center_gy.2", 14
  %"h.3" = load i32, i32* %"h.addr"
  %".53" = mul i32 %".52", %"h.3"
  %".54" = sdiv i32 %".53", 192
  store i32 %".54", i32* %"paddle_top_px"
  %"grid_x.2" = load i32, i32* %"grid_x.addr"
  %".56" = add i32 %"grid_x.2", 2
  %"w.3" = load i32, i32* %"w.addr"
  %".57" = mul i32 %".56", %"w.3"
  %".58" = sdiv i32 %".57", 256
  %"paddle_left_px.1" = load i32, i32* %"paddle_left_px"
  %".59" = sub i32 %".58", %"paddle_left_px.1"
  store i32 %".59", i32* %"paddle_w_px"
  %"paddle_top_px.1" = load i32, i32* %"paddle_top_px"
  %"paddle_bot_px.1" = load i32, i32* %"paddle_bot_px"
  %".61" = sub i32 %"paddle_top_px.1", %"paddle_bot_px.1"
  store i32 %".61", i32* %"paddle_h_px"
  %"paddle_w_px.1" = load i32, i32* %"paddle_w_px"
  %".63" = sitofp i32 %"paddle_w_px.1" to float
  %"cols.1" = load i32, i32* %"cols"
  %".64" = sitofp i32 %"cols.1" to float
  %".65" = fdiv float %".63", %".64"
  store float %".65", float* %"cell_w"
  %"paddle_h_px.1" = load i32, i32* %"paddle_h_px"
  %".67" = sitofp i32 %"paddle_h_px.1" to float
  %"rows.1" = load i32, i32* %"rows"
  %".68" = sitofp i32 %"rows.1" to float
  %".69" = fdiv float %".67", %".68"
  store float %".69", float* %"cell_h"
  store float 0x4014000000000000, float* %"radius"
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D")
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND")
  %"GL_SRC_ALPHA" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE" = load i32, i32* @"GL_ONE"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA", i32 %"GL_ONE")
  %"num_seg.1" = load i32, i32* %"num_seg"
  %".76" = sitofp i32 %"num_seg.1" to float
  %"float_to_double_rhs" = fpext float %".76" to double
  %".77" = fdiv double 0x401921fb54442eea, %"float_to_double_rhs"
  %"f64_to_f32" = fptrunc double %".77" to float
  store float %"f64_to_f32", float* %"step"
  store i32 0, i32* %"ci"
  br label %"while.cond"
while.cond:
  %"ci.1" = load i32, i32* %"ci"
  %"cols.2" = load i32, i32* %"cols"
  %".81" = icmp slt i32 %"ci.1", %"cols.2"
  br i1 %".81", label %"while.body", label %"while.end"
while.body:
  store i32 0, i32* %"ri"
  br label %"while.cond.1"
while.end:
  %"GL_BLEND.1" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.1")
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.1")
  ret void
while.cond.1:
  %"ri.1" = load i32, i32* %"ri"
  %"rows.2" = load i32, i32* %"rows"
  %".85" = icmp slt i32 %"ri.1", %"rows.2"
  br i1 %".85", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"paddle_left_px.2" = load i32, i32* %"paddle_left_px"
  %"ci.2" = load i32, i32* %"ci"
  %".87" = sitofp i32 %"ci.2" to float
  %"cell_w.1" = load float, float* %"cell_w"
  %".88" = fmul float %".87", %"cell_w.1"
  %"cell_w.2" = load float, float* %"cell_w"
  %".89" = fmul float %"cell_w.2", 0x3fe0000000000000
  %".90" = fadd float %".88", %".89"
  %".91" = fptosi float %".90" to i32
  %".92" = add i32 %"paddle_left_px.2", %".91"
  store i32 %".92", i32* %"cx_px"
  %"paddle_bot_px.2" = load i32, i32* %"paddle_bot_px"
  %"ri.2" = load i32, i32* %"ri"
  %".94" = sitofp i32 %"ri.2" to float
  %"cell_h.1" = load float, float* %"cell_h"
  %".95" = fmul float %".94", %"cell_h.1"
  %"cell_h.2" = load float, float* %"cell_h"
  %".96" = fmul float %"cell_h.2", 0x3fe0000000000000
  %".97" = fadd float %".95", %".96"
  %".98" = fptosi float %".97" to i32
  %".99" = add i32 %"paddle_bot_px.2", %".98"
  store i32 %".99", i32* %"cy_px"
  %"cx_px.1" = load i32, i32* %"cx_px"
  %".101" = sitofp i32 %"cx_px.1" to float
  %"inv_w.1" = load float, float* %"inv_w"
  %".102" = fmul float %".101", %"inv_w.1"
  %".103" = fsub float %".102", 0x3ff0000000000000
  store float %".103", float* %"ndcx"
  %"cy_px.1" = load i32, i32* %"cy_px"
  %".105" = sitofp i32 %"cy_px.1" to float
  %"inv_h.1" = load float, float* %"inv_h"
  %".106" = fmul float %".105", %"inv_h.1"
  %".107" = fsub float %".106", 0x3ff0000000000000
  store float %".107", float* %"ndcy"
  %"radius.1" = load float, float* %"radius"
  %"inv_w.2" = load float, float* %"inv_w"
  %".109" = fmul float %"radius.1", %"inv_w.2"
  store float %".109", float* %"ox"
  %"radius.2" = load float, float* %"radius"
  %"inv_h.2" = load float, float* %"inv_h"
  %".111" = fmul float %"radius.2", %"inv_h.2"
  store float %".111", float* %"oy"
  %"GL_TRIANGLE_FAN" = load i32, i32* @"GL_TRIANGLE_FAN"
  call void @"glBegin"(i32 %"GL_TRIANGLE_FAN")
  call void @"glColor4f"(float 0x3fe3333340000000, float 0x3feb333340000000, float 0x3ff0000000000000, float 0x3fc99999a0000000)
  %"ndcx.1" = load float, float* %"ndcx"
  %"ndcy.1" = load float, float* %"ndcy"
  call void @"glVertex2f"(float %"ndcx.1", float %"ndcy.1")
  call void @"glColor4f"(float 0x3fd3333340000000, float 0x3fe3333340000000, float 0x3ff0000000000000, float 0x3fc99999a0000000)
  store i32 0, i32* %"seg"
  br label %"while.cond.2"
while.end.1:
  %"ci.3" = load i32, i32* %"ci"
  %".140" = add i32 %"ci.3", 1
  store i32 %".140", i32* %"ci"
  br label %"while.cond"
while.cond.2:
  %"seg.1" = load i32, i32* %"seg"
  %"num_seg.2" = load i32, i32* %"num_seg"
  %".119" = icmp sle i32 %"seg.1", %"num_seg.2"
  br i1 %".119", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"seg.2" = load i32, i32* %"seg"
  %".121" = sitofp i32 %"seg.2" to float
  %"step.1" = load float, float* %"step"
  %".122" = fmul float %".121", %"step.1"
  store float %".122", float* %"angle"
  %"ndcx.2" = load float, float* %"ndcx"
  %"ox.1" = load float, float* %"ox"
  %"angle.1" = load float, float* %"angle"
  %".124" = call float @"standard__math__cos__1__floatE1__ret_floatE1"(float %"angle.1")
  %".125" = fmul float %"ox.1", %".124"
  %".126" = fadd float %"ndcx.2", %".125"
  store float %".126", float* %"fx"
  %"ndcy.2" = load float, float* %"ndcy"
  %"oy.1" = load float, float* %"oy"
  %"angle.2" = load float, float* %"angle"
  %".128" = call float @"standard__math__sin__1__floatE1__ret_floatE1"(float %"angle.2")
  %".129" = fmul float %"oy.1", %".128"
  %".130" = fadd float %"ndcy.2", %".129"
  store float %".130", float* %"fy"
  %"fx.1" = load float, float* %"fx"
  %"fy.1" = load float, float* %"fy"
  call void @"glVertex2f"(float %"fx.1", float %"fy.1")
  %"seg.3" = load i32, i32* %"seg"
  %".133" = add i32 %"seg.3", 1
  store i32 %".133", i32* %"seg"
  br label %"while.cond.2"
while.end.2:
  call void @"glEnd"()
  %"ri.3" = load i32, i32* %"ri"
  %".137" = add i32 %"ri.3", 1
  store i32 %".137", i32* %"ri"
  br label %"while.cond.1"
}

define void @"ball_reset__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"w.1" = load i32, i32* %"w.addr"
  %".6" = sitofp i32 %"w.1" to float
  %".7" = fmul float %".6", 0x3fe0000000000000
  store float %".7", float* @"g_ball_x"
  %"h.1" = load i32, i32* %"h.addr"
  %".9" = sitofp i32 %"h.1" to float
  %".10" = fmul float %".9", 0x3fe0000000000000
  store float %".10", float* @"g_ball_y"
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".12" = mul i32 %"g_rand_seed", 1664525
  %".13" = add i32 %".12", 1013904223
  store i32 %".13", i32* @"g_rand_seed"
  store float 0x3ff4ccccc0000000, float* @"g_ball_vx"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".16" = and i32 %"g_rand_seed.1", 255
  %".17" = sub i32 %".16", 128
  %".18" = sitofp i32 %".17" to float
  %".19" = fdiv float %".18", 0x4060000000000000
  %".20" = fmul float %".19", 0x3ff4ccccc0000000
  store float %".20", float* @"g_ball_vy"
  %".22" = sdiv i32 192, 2
  store i32 %".22", i32* @"g_cpu_paddle_gy"
  store float              0x0, float* @"g_suck_charge"
  store i1 false, i1* @"g_sucking"
  ret void
}

define void @"ball_update__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"gx" = alloca i32
  store i32 0, i32* %"gx"
  %"gy" = alloca i32
  store i32 0, i32* %"gy"
  %"gx_l" = alloca i32
  store i32 0, i32* %"gx_l"
  %"gx_r" = alloca i32
  store i32 0, i32* %"gx_r"
  %"fluid_vx" = alloca float
  store float              0x0, float* %"fluid_vx"
  %"fluid_vy" = alloca float
  store float              0x0, float* %"fluid_vy"
  %"radius" = alloca float
  store float              0x0, float* %"radius"
  %"player_face_x" = alloca float
  store float              0x0, float* %"player_face_x"
  %"cpu_face_x" = alloca float
  store float              0x0, float* %"cpu_face_x"
  %"paddle_bot_px" = alloca float
  store float              0x0, float* %"paddle_bot_px"
  %"paddle_top_px" = alloca float
  store float              0x0, float* %"paddle_top_px"
  %"left_press" = alloca float
  store float              0x0, float* %"left_press"
  %"right_press" = alloca float
  store float              0x0, float* %"right_press"
  %"speed" = alloca float
  store float              0x0, float* %"speed"
  store float 0x4020000000000000, float* %"radius"
  %"g_ball_x" = load float, float* @"g_ball_x"
  %"w.1" = load i32, i32* %"w.addr"
  %".21" = sitofp i32 %"w.1" to float
  %".22" = fdiv float %"g_ball_x", %".21"
  %".23" = sitofp i32 256 to float
  %".24" = fmul float %".22", %".23"
  %".25" = fptosi float %".24" to i32
  store i32 %".25", i32* %"gx"
  %"g_ball_y" = load float, float* @"g_ball_y"
  %"h.1" = load i32, i32* %"h.addr"
  %".27" = sitofp i32 %"h.1" to float
  %".28" = fdiv float %"g_ball_y", %".27"
  %".29" = sitofp i32 192 to float
  %".30" = fmul float %".28", %".29"
  %".31" = fptosi float %".30" to i32
  store i32 %".31", i32* %"gy"
  %"gx.1" = load i32, i32* %"gx"
  %".33" = icmp slt i32 %"gx.1", 1
  br i1 %".33", label %"then", label %"else"
then:
  store i32 1, i32* %"gx"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"gx.2" = load i32, i32* %"gx"
  %".38" = sub i32 256, 2
  %".39" = icmp sgt i32 %"gx.2", %".38"
  br i1 %".39", label %"then.1", label %"else.1"
then.1:
  %".41" = sub i32 256, 2
  store i32 %".41", i32* %"gx"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"gy.1" = load i32, i32* %"gy"
  %".45" = icmp slt i32 %"gy.1", 1
  br i1 %".45", label %"then.2", label %"else.2"
then.2:
  store i32 1, i32* %"gy"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"gy.2" = load i32, i32* %"gy"
  %".50" = sub i32 192, 2
  %".51" = icmp sgt i32 %"gy.2", %".50"
  br i1 %".51", label %"then.3", label %"else.3"
then.3:
  %".53" = sub i32 192, 2
  store i32 %".53", i32* %"gy"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"g_vx" = load double*, double** @"g_vx"
  %"gy.3" = load i32, i32* %"gy"
  %".57" = mul i32 %"gy.3", 256
  %"gx.3" = load i32, i32* %"gx"
  %".58" = add i32 %".57", %"gx.3"
  %"ptr_gep" = getelementptr inbounds double, double* %"g_vx", i32 %".58"
  %"ptr_load" = load double, double* %"ptr_gep"
  %".59" = fptrunc double %"ptr_load" to float
  store float %".59", float* %"fluid_vx"
  %"g_vy" = load double*, double** @"g_vy"
  %"gy.4" = load i32, i32* %"gy"
  %".61" = mul i32 %"gy.4", 256
  %"gx.4" = load i32, i32* %"gx"
  %".62" = add i32 %".61", %"gx.4"
  %"ptr_gep.1" = getelementptr inbounds double, double* %"g_vy", i32 %".62"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %".63" = fptrunc double %"ptr_load.1" to float
  store float %".63", float* %"fluid_vy"
  %"g_ball_vx" = load float, float* @"g_ball_vx"
  %"fluid_vx.1" = load float, float* %"fluid_vx"
  %".65" = fmul float %"fluid_vx.1", 0x4000000000000000
  %".66" = fadd float %"g_ball_vx", %".65"
  store float %".66", float* @"g_ball_vx"
  %"g_ball_vy" = load float, float* @"g_ball_vy"
  %"fluid_vy.1" = load float, float* %"fluid_vy"
  %".68" = fmul float %"fluid_vy.1", 0x4000000000000000
  %".69" = fadd float %"g_ball_vy", %".68"
  store float %".69", float* @"g_ball_vy"
  %"gx.5" = load i32, i32* %"gx"
  %".71" = sub i32 %"gx.5", 4
  store i32 %".71", i32* %"gx_l"
  %"gx.6" = load i32, i32* %"gx"
  %".73" = add i32 %"gx.6", 4
  store i32 %".73", i32* %"gx_r"
  %"gx_l.1" = load i32, i32* %"gx_l"
  %".75" = icmp slt i32 %"gx_l.1", 1
  br i1 %".75", label %"then.4", label %"else.4"
then.4:
  store i32 1, i32* %"gx_l"
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"gx_r.1" = load i32, i32* %"gx_r"
  %".80" = sub i32 256, 2
  %".81" = icmp sgt i32 %"gx_r.1", %".80"
  br i1 %".81", label %"then.5", label %"else.5"
then.5:
  %".83" = sub i32 256, 2
  store i32 %".83", i32* %"gx_r"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"g_vx.1" = load double*, double** @"g_vx"
  %"gy.5" = load i32, i32* %"gy"
  %".87" = mul i32 %"gy.5", 256
  %"gx_l.2" = load i32, i32* %"gx_l"
  %".88" = add i32 %".87", %"gx_l.2"
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_vx.1", i32 %".88"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".89" = fptrunc double %"ptr_load.2" to float
  store float %".89", float* %"left_press"
  %"g_vx.2" = load double*, double** @"g_vx"
  %"gy.6" = load i32, i32* %"gy"
  %".91" = mul i32 %"gy.6", 256
  %"gx_r.2" = load i32, i32* %"gx_r"
  %".92" = add i32 %".91", %"gx_r.2"
  %"ptr_gep.3" = getelementptr inbounds double, double* %"g_vx.2", i32 %".92"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %".93" = fptrunc double %"ptr_load.3" to float
  %".94" = fsub float              0x0, %".93"
  store float %".94", float* %"right_press"
  %"g_ball_vx.1" = load float, float* @"g_ball_vx"
  %"g_ball_vx.2" = load float, float* @"g_ball_vx"
  %".96" = fmul float %"g_ball_vx.1", %"g_ball_vx.2"
  %"g_ball_vy.1" = load float, float* @"g_ball_vy"
  %"g_ball_vy.2" = load float, float* @"g_ball_vy"
  %".97" = fmul float %"g_ball_vy.1", %"g_ball_vy.2"
  %".98" = fadd float %".96", %".97"
  store float %".98", float* %"speed"
  %"left_press.1" = load float, float* %"left_press"
  %".100" = fcmp ogt float %"left_press.1", 0x3ff8000000000000
  br i1 %".100", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"right_press.1" = load float, float* %"right_press"
  %".102" = fcmp ogt float %"right_press.1", 0x3ff8000000000000
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"ifcont.5"], [%".102", %"sc_rhs"]
  br i1 %"sc_result", label %"sc_rhs.1", label %"sc_end.1"
sc_rhs.1:
  %"speed.1" = load float, float* %"speed"
  %".105" = fcmp olt float %"speed.1", 0x4010000000000000
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [0, %"sc_end"], [%".105", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"then.6", label %"else.6"
then.6:
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".108" = mul i32 %"g_rand_seed", 1664525
  %".109" = add i32 %".108", 1013904223
  store i32 %".109", i32* @"g_rand_seed"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".111" = and i32 %"g_rand_seed.1", 1
  %".112" = icmp eq i32 %".111", 0
  br i1 %".112", label %"then.7", label %"else.7"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"g_ball_vx.3" = load float, float* @"g_ball_vx"
  %".122" = fmul float %"g_ball_vx.3", 0x3fefae1480000000
  store float %".122", float* @"g_ball_vx"
  %"g_ball_vy.5" = load float, float* @"g_ball_vy"
  %".124" = fmul float %"g_ball_vy.5", 0x3fefae1480000000
  store float %".124", float* @"g_ball_vy"
  %"g_ball_x.1" = load float, float* @"g_ball_x"
  %"g_ball_vx.4" = load float, float* @"g_ball_vx"
  %".126" = fadd float %"g_ball_x.1", %"g_ball_vx.4"
  store float %".126", float* @"g_ball_x"
  %"g_ball_y.1" = load float, float* @"g_ball_y"
  %"g_ball_vy.6" = load float, float* @"g_ball_vy"
  %".128" = fadd float %"g_ball_y.1", %"g_ball_vy.6"
  store float %".128", float* @"g_ball_y"
  %".130" = add i32 4, 2
  %"w.2" = load i32, i32* %"w.addr"
  %".131" = mul i32 %".130", %"w.2"
  %".132" = sdiv i32 %".131", 256
  %".133" = sitofp i32 %".132" to float
  store float %".133", float* %"player_face_x"
  %"g_paddle_gy" = load i32, i32* @"g_paddle_gy"
  %".135" = sub i32 %"g_paddle_gy", 14
  %"h.2" = load i32, i32* %"h.addr"
  %".136" = mul i32 %".135", %"h.2"
  %".137" = sdiv i32 %".136", 192
  %".138" = sitofp i32 %".137" to float
  store float %".138", float* %"paddle_bot_px"
  %"g_paddle_gy.1" = load i32, i32* @"g_paddle_gy"
  %".140" = add i32 %"g_paddle_gy.1", 14
  %"h.3" = load i32, i32* %"h.addr"
  %".141" = mul i32 %".140", %"h.3"
  %".142" = sdiv i32 %".141", 192
  %".143" = sitofp i32 %".142" to float
  store float %".143", float* %"paddle_top_px"
  %"g_ball_x.2" = load float, float* @"g_ball_x"
  %"radius.1" = load float, float* %"radius"
  %".145" = fsub float %"g_ball_x.2", %"radius.1"
  %"player_face_x.1" = load float, float* %"player_face_x"
  %".146" = fcmp olt float %".145", %"player_face_x.1"
  br i1 %".146", label %"sc_rhs.2", label %"sc_end.2"
then.7:
  %"g_ball_vy.3" = load float, float* @"g_ball_vy"
  %".114" = fadd float %"g_ball_vy.3", 0x4016000000000000
  store float %".114", float* @"g_ball_vy"
  br label %"ifcont.7"
else.7:
  %"g_ball_vy.4" = load float, float* @"g_ball_vy"
  %".117" = fsub float %"g_ball_vy.4", 0x4016000000000000
  store float %".117", float* @"g_ball_vy"
  br label %"ifcont.7"
ifcont.7:
  br label %"ifcont.6"
sc_rhs.2:
  %"g_ball_x.3" = load float, float* @"g_ball_x"
  %"radius.2" = load float, float* %"radius"
  %".148" = fadd float %"g_ball_x.3", %"radius.2"
  %"player_face_x.2" = load float, float* %"player_face_x"
  %".149" = fsub float %"player_face_x.2", 0x4010000000000000
  %".150" = fcmp ogt float %".148", %".149"
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [0, %"ifcont.6"], [%".150", %"sc_rhs.2"]
  br i1 %"sc_result.2", label %"sc_rhs.3", label %"sc_end.3"
sc_rhs.3:
  %"g_ball_y.2" = load float, float* @"g_ball_y"
  %"paddle_bot_px.1" = load float, float* %"paddle_bot_px"
  %".153" = fcmp ogt float %"g_ball_y.2", %"paddle_bot_px.1"
  br label %"sc_end.3"
sc_end.3:
  %"sc_result.3" = phi  i1 [0, %"sc_end.2"], [%".153", %"sc_rhs.3"]
  br i1 %"sc_result.3", label %"sc_rhs.4", label %"sc_end.4"
sc_rhs.4:
  %"g_ball_y.3" = load float, float* @"g_ball_y"
  %"paddle_top_px.1" = load float, float* %"paddle_top_px"
  %".156" = fcmp olt float %"g_ball_y.3", %"paddle_top_px.1"
  br label %"sc_end.4"
sc_end.4:
  %"sc_result.4" = phi  i1 [0, %"sc_end.3"], [%".156", %"sc_rhs.4"]
  br i1 %"sc_result.4", label %"then.8", label %"else.8"
then.8:
  %"player_face_x.3" = load float, float* %"player_face_x"
  %"radius.3" = load float, float* %"radius"
  %".159" = fadd float %"player_face_x.3", %"radius.3"
  store float %".159", float* @"g_ball_x"
  %"g_ball_vx.5" = load float, float* @"g_ball_vx"
  %".161" = fsub float              0x0, 0x3fe70a3d80000000
  %".162" = fmul float %"g_ball_vx.5", %".161"
  store float %".162", float* @"g_ball_vx"
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  %".166" = sub i32 256, 6
  %"w.3" = load i32, i32* %"w.addr"
  %".167" = mul i32 %".166", %"w.3"
  %".168" = sdiv i32 %".167", 256
  %".169" = sitofp i32 %".168" to float
  store float %".169", float* %"cpu_face_x"
  %"g_cpu_paddle_gy" = load i32, i32* @"g_cpu_paddle_gy"
  %".171" = sub i32 %"g_cpu_paddle_gy", 14
  %"h.4" = load i32, i32* %"h.addr"
  %".172" = mul i32 %".171", %"h.4"
  %".173" = sdiv i32 %".172", 192
  %".174" = sitofp i32 %".173" to float
  store float %".174", float* %"paddle_bot_px"
  %"g_cpu_paddle_gy.1" = load i32, i32* @"g_cpu_paddle_gy"
  %".176" = add i32 %"g_cpu_paddle_gy.1", 14
  %"h.5" = load i32, i32* %"h.addr"
  %".177" = mul i32 %".176", %"h.5"
  %".178" = sdiv i32 %".177", 192
  %".179" = sitofp i32 %".178" to float
  store float %".179", float* %"paddle_top_px"
  %"g_ball_x.4" = load float, float* @"g_ball_x"
  %"radius.4" = load float, float* %"radius"
  %".181" = fadd float %"g_ball_x.4", %"radius.4"
  %"cpu_face_x.1" = load float, float* %"cpu_face_x"
  %".182" = fcmp ogt float %".181", %"cpu_face_x.1"
  br i1 %".182", label %"sc_rhs.5", label %"sc_end.5"
sc_rhs.5:
  %"g_ball_x.5" = load float, float* @"g_ball_x"
  %"radius.5" = load float, float* %"radius"
  %".184" = fsub float %"g_ball_x.5", %"radius.5"
  %"cpu_face_x.2" = load float, float* %"cpu_face_x"
  %".185" = fadd float %"cpu_face_x.2", 0x4010000000000000
  %".186" = fcmp olt float %".184", %".185"
  br label %"sc_end.5"
sc_end.5:
  %"sc_result.5" = phi  i1 [0, %"ifcont.8"], [%".186", %"sc_rhs.5"]
  br i1 %"sc_result.5", label %"sc_rhs.6", label %"sc_end.6"
sc_rhs.6:
  %"g_ball_y.4" = load float, float* @"g_ball_y"
  %"paddle_bot_px.2" = load float, float* %"paddle_bot_px"
  %".189" = fcmp ogt float %"g_ball_y.4", %"paddle_bot_px.2"
  br label %"sc_end.6"
sc_end.6:
  %"sc_result.6" = phi  i1 [0, %"sc_end.5"], [%".189", %"sc_rhs.6"]
  br i1 %"sc_result.6", label %"sc_rhs.7", label %"sc_end.7"
sc_rhs.7:
  %"g_ball_y.5" = load float, float* @"g_ball_y"
  %"paddle_top_px.2" = load float, float* %"paddle_top_px"
  %".192" = fcmp olt float %"g_ball_y.5", %"paddle_top_px.2"
  br label %"sc_end.7"
sc_end.7:
  %"sc_result.7" = phi  i1 [0, %"sc_end.6"], [%".192", %"sc_rhs.7"]
  br i1 %"sc_result.7", label %"then.9", label %"else.9"
then.9:
  %"cpu_face_x.3" = load float, float* %"cpu_face_x"
  %"radius.6" = load float, float* %"radius"
  %".195" = fsub float %"cpu_face_x.3", %"radius.6"
  store float %".195", float* @"g_ball_x"
  %"g_ball_vx.6" = load float, float* @"g_ball_vx"
  %".197" = fsub float              0x0, 0x3fe70a3d80000000
  %".198" = fmul float %"g_ball_vx.6", %".197"
  store float %".198", float* @"g_ball_vx"
  br label %"ifcont.9"
else.9:
  br label %"ifcont.9"
ifcont.9:
  %"g_ball_y.6" = load float, float* @"g_ball_y"
  %"radius.7" = load float, float* %"radius"
  %".202" = fsub float %"g_ball_y.6", %"radius.7"
  %".203" = fcmp olt float %".202",              0x0
  br i1 %".203", label %"then.10", label %"else.10"
then.10:
  %"radius.8" = load float, float* %"radius"
  store float %"radius.8", float* @"g_ball_y"
  %"g_ball_vy.7" = load float, float* @"g_ball_vy"
  %".206" = fsub float              0x0, 0x3fe70a3d80000000
  %".207" = fmul float %"g_ball_vy.7", %".206"
  store float %".207", float* @"g_ball_vy"
  br label %"ifcont.10"
else.10:
  br label %"ifcont.10"
ifcont.10:
  %"g_ball_y.7" = load float, float* @"g_ball_y"
  %"radius.9" = load float, float* %"radius"
  %".211" = fadd float %"g_ball_y.7", %"radius.9"
  %"h.6" = load i32, i32* %"h.addr"
  %".212" = sitofp i32 %"h.6" to float
  %".213" = fcmp ogt float %".211", %".212"
  br i1 %".213", label %"then.11", label %"else.11"
then.11:
  %"h.7" = load i32, i32* %"h.addr"
  %".215" = sitofp i32 %"h.7" to float
  %"radius.10" = load float, float* %"radius"
  %".216" = fsub float %".215", %"radius.10"
  store float %".216", float* @"g_ball_y"
  %"g_ball_vy.8" = load float, float* @"g_ball_vy"
  %".218" = fsub float              0x0, 0x3fe70a3d80000000
  %".219" = fmul float %"g_ball_vy.8", %".218"
  store float %".219", float* @"g_ball_vy"
  br label %"ifcont.11"
else.11:
  br label %"ifcont.11"
ifcont.11:
  %"g_ball_x.6" = load float, float* @"g_ball_x"
  %"radius.11" = load float, float* %"radius"
  %".223" = fsub float %"g_ball_x.6", %"radius.11"
  %".224" = fcmp olt float %".223",              0x0
  br i1 %".224", label %"then.12", label %"else.12"
then.12:
  %"g_lives" = load i32, i32* @"g_lives"
  %".226" = sub i32 %"g_lives", 1
  store i32 %".226", i32* @"g_lives"
  %"g_lives.1" = load i32, i32* @"g_lives"
  %".228" = icmp slt i32 %"g_lives.1", 1
  br i1 %".228", label %"then.13", label %"else.13"
else.12:
  br label %"ifcont.12"
ifcont.12:
  %"g_ball_x.7" = load float, float* @"g_ball_x"
  %"radius.12" = load float, float* %"radius"
  %".238" = fadd float %"g_ball_x.7", %"radius.12"
  %"w.5" = load i32, i32* %"w.addr"
  %".239" = sitofp i32 %"w.5" to float
  %".240" = fcmp ogt float %".238", %".239"
  br i1 %".240", label %"then.14", label %"else.14"
then.13:
  store i32 3, i32* @"g_lives"
  store i32 1, i32* @"g_level"
  store i32 0, i32* @"g_game_state"
  br label %"ifcont.13"
else.13:
  br label %"ifcont.13"
ifcont.13:
  %"w.4" = load i32, i32* %"w.addr"
  %"h.8" = load i32, i32* %"h.addr"
  call void @"ball_reset__2__intE1__intE1__ret_voidE1"(i32 %"w.4", i32 %"h.8")
  ret void
then.14:
  %"g_level" = load i32, i32* @"g_level"
  %".242" = add i32 %"g_level", 1
  store i32 %".242", i32* @"g_level"
  %"w.6" = load i32, i32* %"w.addr"
  %"h.9" = load i32, i32* %"h.addr"
  call void @"ball_reset__2__intE1__intE1__ret_voidE1"(i32 %"w.6", i32 %"h.9")
  ret void
else.14:
  br label %"ifcont.14"
ifcont.14:
  ret void
}

define void @"draw_ball__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"seg" = alloca i32
  store i32 0, i32* %"seg"
  %"num_seg" = alloca i32
  store i32 0, i32* %"num_seg"
  %"inv_w" = alloca float
  store float              0x0, float* %"inv_w"
  %"inv_h" = alloca float
  store float              0x0, float* %"inv_h"
  %"ndcx" = alloca float
  store float              0x0, float* %"ndcx"
  %"ndcy" = alloca float
  store float              0x0, float* %"ndcy"
  %"ox" = alloca float
  store float              0x0, float* %"ox"
  %"oy" = alloca float
  store float              0x0, float* %"oy"
  %"box" = alloca float
  store float              0x0, float* %"box"
  %"boy" = alloca float
  store float              0x0, float* %"boy"
  %"angle" = alloca float
  store float              0x0, float* %"angle"
  %"step_b" = alloca float
  store float              0x0, float* %"step_b"
  %"fx" = alloca float
  store float              0x0, float* %"fx"
  %"fy" = alloca float
  store float              0x0, float* %"fy"
  %"radius" = alloca float
  store float              0x0, float* %"radius"
  %"border" = alloca float
  store float              0x0, float* %"border"
  store i32 32, i32* %"num_seg"
  store float 0x4020000000000000, float* %"radius"
  store float 0x4010000000000000, float* %"border"
  %"w.1" = load i32, i32* %"w.addr"
  %".25" = sitofp i32 %"w.1" to float
  %".26" = fdiv float 0x4000000000000000, %".25"
  store float %".26", float* %"inv_w"
  %"h.1" = load i32, i32* %"h.addr"
  %".28" = sitofp i32 %"h.1" to float
  %".29" = fdiv float 0x4000000000000000, %".28"
  store float %".29", float* %"inv_h"
  %"g_ball_x" = load float, float* @"g_ball_x"
  %"inv_w.1" = load float, float* %"inv_w"
  %".31" = fmul float %"g_ball_x", %"inv_w.1"
  %".32" = fsub float %".31", 0x3ff0000000000000
  store float %".32", float* %"ndcx"
  %"g_ball_y" = load float, float* @"g_ball_y"
  %"inv_h.1" = load float, float* %"inv_h"
  %".34" = fmul float %"g_ball_y", %"inv_h.1"
  %".35" = fsub float %".34", 0x3ff0000000000000
  store float %".35", float* %"ndcy"
  %"radius.1" = load float, float* %"radius"
  %"border.1" = load float, float* %"border"
  %".37" = fadd float %"radius.1", %"border.1"
  %"inv_w.2" = load float, float* %"inv_w"
  %".38" = fmul float %".37", %"inv_w.2"
  store float %".38", float* %"ox"
  %"radius.2" = load float, float* %"radius"
  %"border.2" = load float, float* %"border"
  %".40" = fadd float %"radius.2", %"border.2"
  %"inv_h.2" = load float, float* %"inv_h"
  %".41" = fmul float %".40", %"inv_h.2"
  store float %".41", float* %"oy"
  %"radius.3" = load float, float* %"radius"
  %"inv_w.3" = load float, float* %"inv_w"
  %".43" = fmul float %"radius.3", %"inv_w.3"
  store float %".43", float* %"box"
  %"radius.4" = load float, float* %"radius"
  %"inv_h.3" = load float, float* %"inv_h"
  %".45" = fmul float %"radius.4", %"inv_h.3"
  store float %".45", float* %"boy"
  %"num_seg.1" = load i32, i32* %"num_seg"
  %".47" = sitofp i32 %"num_seg.1" to float
  %"float_to_double_rhs" = fpext float %".47" to double
  %".48" = fdiv double 0x401921fb54442eea, %"float_to_double_rhs"
  %"f64_to_f32" = fptrunc double %".48" to float
  store float %"f64_to_f32", float* %"step_b"
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D")
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND")
  %"GL_TRIANGLE_FAN" = load i32, i32* @"GL_TRIANGLE_FAN"
  call void @"glBegin"(i32 %"GL_TRIANGLE_FAN")
  call void @"glColor3f"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %"ndcx.1" = load float, float* %"ndcx"
  %"ndcy.1" = load float, float* %"ndcy"
  call void @"glVertex2f"(float %"ndcx.1", float %"ndcy.1")
  store i32 0, i32* %"seg"
  br label %"while.cond"
while.cond:
  %"seg.1" = load i32, i32* %"seg"
  %"num_seg.2" = load i32, i32* %"num_seg"
  %".58" = icmp sle i32 %"seg.1", %"num_seg.2"
  br i1 %".58", label %"while.body", label %"while.end"
while.body:
  %"seg.2" = load i32, i32* %"seg"
  %".60" = sitofp i32 %"seg.2" to float
  %"step_b.1" = load float, float* %"step_b"
  %".61" = fmul float %".60", %"step_b.1"
  store float %".61", float* %"angle"
  %"ndcx.2" = load float, float* %"ndcx"
  %"ox.1" = load float, float* %"ox"
  %"angle.1" = load float, float* %"angle"
  %".63" = call float @"standard__math__cos__1__floatE1__ret_floatE1"(float %"angle.1")
  %".64" = fmul float %"ox.1", %".63"
  %".65" = fadd float %"ndcx.2", %".64"
  store float %".65", float* %"fx"
  %"ndcy.2" = load float, float* %"ndcy"
  %"oy.1" = load float, float* %"oy"
  %"angle.2" = load float, float* %"angle"
  %".67" = call float @"standard__math__sin__1__floatE1__ret_floatE1"(float %"angle.2")
  %".68" = fmul float %"oy.1", %".67"
  %".69" = fadd float %"ndcy.2", %".68"
  store float %".69", float* %"fy"
  %"fx.1" = load float, float* %"fx"
  %"fy.1" = load float, float* %"fy"
  call void @"glVertex2f"(float %"fx.1", float %"fy.1")
  %"seg.3" = load i32, i32* %"seg"
  %".72" = add i32 %"seg.3", 1
  store i32 %".72", i32* %"seg"
  br label %"while.cond"
while.end:
  call void @"glEnd"()
  %"GL_TRIANGLE_FAN.1" = load i32, i32* @"GL_TRIANGLE_FAN"
  call void @"glBegin"(i32 %"GL_TRIANGLE_FAN.1")
  call void @"glColor3f"(float              0x0, float              0x0, float              0x0)
  %"ndcx.3" = load float, float* %"ndcx"
  %"ndcy.3" = load float, float* %"ndcy"
  call void @"glVertex2f"(float %"ndcx.3", float %"ndcy.3")
  store i32 0, i32* %"seg"
  br label %"while.cond.1"
while.cond.1:
  %"seg.4" = load i32, i32* %"seg"
  %"num_seg.3" = load i32, i32* %"num_seg"
  %".81" = icmp sle i32 %"seg.4", %"num_seg.3"
  br i1 %".81", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"seg.5" = load i32, i32* %"seg"
  %".83" = sitofp i32 %"seg.5" to float
  %"step_b.2" = load float, float* %"step_b"
  %".84" = fmul float %".83", %"step_b.2"
  store float %".84", float* %"angle"
  %"ndcx.4" = load float, float* %"ndcx"
  %"box.1" = load float, float* %"box"
  %"angle.3" = load float, float* %"angle"
  %".86" = call float @"standard__math__cos__1__floatE1__ret_floatE1"(float %"angle.3")
  %".87" = fmul float %"box.1", %".86"
  %".88" = fadd float %"ndcx.4", %".87"
  store float %".88", float* %"fx"
  %"ndcy.4" = load float, float* %"ndcy"
  %"boy.1" = load float, float* %"boy"
  %"angle.4" = load float, float* %"angle"
  %".90" = call float @"standard__math__sin__1__floatE1__ret_floatE1"(float %"angle.4")
  %".91" = fmul float %"boy.1", %".90"
  %".92" = fadd float %"ndcy.4", %".91"
  store float %".92", float* %"fy"
  %"fx.2" = load float, float* %"fx"
  %"fy.2" = load float, float* %"fy"
  call void @"glVertex2f"(float %"fx.2", float %"fy.2")
  %"seg.6" = load i32, i32* %"seg"
  %".95" = add i32 %"seg.6", 1
  store i32 %".95", i32* %"seg"
  br label %"while.cond.1"
while.end.1:
  call void @"glEnd"()
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.1")
  ret void
}

define void @"draw_hud__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"scale" = alloca i32
  store i32 0, i32* %"scale"
  %"tx" = alloca i32
  store i32 0, i32* %"tx"
  %"ty" = alloca i32
  store i32 0, i32* %"ty"
  %"tw" = alloca i32
  store i32 0, i32* %"tw"
  %"lv" = alloca i32
  store i32 0, i32* %"lv"
  %"li" = alloca i32
  store i32 0, i32* %"li"
  %"hx" = alloca i32
  store i32 0, i32* %"hx"
  %"hy" = alloca i32
  store i32 0, i32* %"hy"
  %"hs" = alloca i32
  store i32 0, i32* %"hs"
  %"inv_w" = alloca float
  store float              0x0, float* %"inv_w"
  %"inv_h" = alloca float
  store float              0x0, float* %"inv_h"
  %"fx0" = alloca float
  store float              0x0, float* %"fx0"
  %"fy0" = alloca float
  store float              0x0, float* %"fy0"
  %"fx1" = alloca float
  store float              0x0, float* %"fx1"
  %"fy1" = alloca float
  store float              0x0, float* %"fy1"
  %"fxm" = alloca float
  store float              0x0, float* %"fxm"
  %"fyt" = alloca float
  store float              0x0, float* %"fyt"
  %"num_buf" = alloca [16 x i8]
  store [16 x i8] zeroinitializer, [16 x i8]* %"num_buf"
  store i32 2, i32* %"scale"
  %"w.1" = load i32, i32* %"w.addr"
  %".25" = sitofp i32 %"w.1" to float
  %".26" = fdiv float 0x4000000000000000, %".25"
  store float %".26", float* %"inv_w"
  %"h.1" = load i32, i32* %"h.addr"
  %".28" = sitofp i32 %"h.1" to float
  %".29" = fdiv float 0x4000000000000000, %".28"
  store float %".29", float* %"inv_h"
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D")
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND")
  %"GL_SRC_ALPHA" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE_MINUS_SRC_ALPHA" = load i32, i32* @"GL_ONE_MINUS_SRC_ALPHA"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA", i32 %"GL_ONE_MINUS_SRC_ALPHA")
  %"g_level" = load i32, i32* @"g_level"
  %".35" = getelementptr inbounds [16 x i8], [16 x i8]* %"num_buf", i32 0, i32 0
  %".36" = call i32 @"int_to_str__2__intE1__byteE1_ptr1__ret_intE1"(i32 %"g_level", i8* %".35")
  %"str_stack" = alloca [7 x i8]
  %"str_char_0" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 0
  store i8 76, i8* %"str_char_0"
  %"str_char_1" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 1
  store i8 69, i8* %"str_char_1"
  %"str_char_2" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 2
  store i8 86, i8* %"str_char_2"
  %"str_char_3" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 3
  store i8 69, i8* %"str_char_3"
  %"str_char_4" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 4
  store i8 76, i8* %"str_char_4"
  %"str_char_5" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 5
  store i8 32, i8* %"str_char_5"
  %"str_char_6" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 6
  store i8 0, i8* %"str_char_6"
  %"scale.1" = load i32, i32* %"scale"
  %"arg0_decay" = getelementptr [7 x i8], [7 x i8]* %"str_stack", i32 0, i32 0
  %".44" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"arg0_decay", i32 %"scale.1")
  %".45" = getelementptr inbounds [16 x i8], [16 x i8]* %"num_buf", i32 0, i32 0
  %"scale.2" = load i32, i32* %"scale"
  %".46" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %".45", i32 %"scale.2")
  %".47" = add i32 %".44", %".46"
  store i32 %".47", i32* %"tw"
  %"w.2" = load i32, i32* %"w.addr"
  %".49" = sdiv i32 %"w.2", 2
  %"tw.1" = load i32, i32* %"tw"
  %".50" = sdiv i32 %"tw.1", 2
  %".51" = sub i32 %".49", %".50"
  store i32 %".51", i32* %"tx"
  %"h.2" = load i32, i32* %"h.addr"
  %".53" = sub i32 %"h.2", 28
  store i32 %".53", i32* %"ty"
  call void @"glColor4f"(float 0x3fe3333340000000, float 0x3fe99999a0000000, float 0x3ff0000000000000, float 0x3fecccccc0000000)
  %"str_stack.1" = alloca [7 x i8]
  %"str_char_0.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 76, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 69, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 86, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 69, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 76, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 32, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 0, i8* %"str_char_6.1"
  %"tx.1" = load i32, i32* %"tx"
  %"ty.1" = load i32, i32* %"ty"
  %"scale.3" = load i32, i32* %"scale"
  %"inv_w.1" = load float, float* %"inv_w"
  %"inv_h.1" = load float, float* %"inv_h"
  %"arg0_decay.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"arg0_decay.1", i32 %"tx.1", i32 %"ty.1", i32 %"scale.3", float %"inv_w.1", float %"inv_h.1")
  %"tx.2" = load i32, i32* %"tx"
  %"str_stack.2" = alloca [7 x i8]
  %"str_char_0.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 76, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 69, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 86, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 69, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 76, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 32, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 0, i8* %"str_char_6.2"
  %"scale.4" = load i32, i32* %"scale"
  %"arg0_decay.2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.2", i32 0, i32 0
  %".71" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"arg0_decay.2", i32 %"scale.4")
  %".72" = add i32 %"tx.2", %".71"
  store i32 %".72", i32* %"tx"
  call void @"glColor4f"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %".75" = getelementptr inbounds [16 x i8], [16 x i8]* %"num_buf", i32 0, i32 0
  %"tx.3" = load i32, i32* %"tx"
  %"ty.2" = load i32, i32* %"ty"
  %"scale.5" = load i32, i32* %"scale"
  %"inv_w.2" = load float, float* %"inv_w"
  %"inv_h.2" = load float, float* %"inv_h"
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %".75", i32 %"tx.3", i32 %"ty.2", i32 %"scale.5", float %"inv_w.2", float %"inv_h.2")
  store i32 7, i32* %"hs"
  call void @"glColor4f"(float 0x3ff0000000000000, float 0x3fd1eb8520000000, float 0x3fd1eb8520000000, float 0x3fee666660000000)
  store i32 0, i32* %"li"
  br label %"while.cond"
while.cond:
  %"li.1" = load i32, i32* %"li"
  %"g_lives" = load i32, i32* @"g_lives"
  %".81" = icmp slt i32 %"li.1", %"g_lives"
  br i1 %".81", label %"while.body", label %"while.end"
while.body:
  %"li.2" = load i32, i32* %"li"
  %"hs.1" = load i32, i32* %"hs"
  %".83" = mul i32 %"hs.1", 2
  %".84" = add i32 %".83", 6
  %".85" = mul i32 %"li.2", %".84"
  %".86" = add i32 20, %".85"
  store i32 %".86", i32* %"hx"
  %"h.3" = load i32, i32* %"h.addr"
  %".88" = sub i32 %"h.3", 22
  store i32 %".88", i32* %"hy"
  %"hx.1" = load i32, i32* %"hx"
  %".90" = sitofp i32 %"hx.1" to float
  %"inv_w.3" = load float, float* %"inv_w"
  %".91" = fmul float %".90", %"inv_w.3"
  %".92" = fsub float %".91", 0x3ff0000000000000
  store float %".92", float* %"fxm"
  %"hy.1" = load i32, i32* %"hy"
  %".94" = sitofp i32 %"hy.1" to float
  %"inv_h.3" = load float, float* %"inv_h"
  %".95" = fmul float %".94", %"inv_h.3"
  %".96" = fsub float %".95", 0x3ff0000000000000
  store float %".96", float* %"fyt"
  %"hx.2" = load i32, i32* %"hx"
  %"hs.2" = load i32, i32* %"hs"
  %".98" = sub i32 %"hx.2", %"hs.2"
  %".99" = sitofp i32 %".98" to float
  %"inv_w.4" = load float, float* %"inv_w"
  %".100" = fmul float %".99", %"inv_w.4"
  %".101" = fsub float %".100", 0x3ff0000000000000
  store float %".101", float* %"fx0"
  %"hx.3" = load i32, i32* %"hx"
  %"hs.3" = load i32, i32* %"hs"
  %".103" = add i32 %"hx.3", %"hs.3"
  %".104" = sitofp i32 %".103" to float
  %"inv_w.5" = load float, float* %"inv_w"
  %".105" = fmul float %".104", %"inv_w.5"
  %".106" = fsub float %".105", 0x3ff0000000000000
  store float %".106", float* %"fx1"
  %"hy.2" = load i32, i32* %"hy"
  %"hs.4" = load i32, i32* %"hs"
  %".108" = sub i32 %"hy.2", %"hs.4"
  %".109" = sitofp i32 %".108" to float
  %"inv_h.4" = load float, float* %"inv_h"
  %".110" = fmul float %".109", %"inv_h.4"
  %".111" = fsub float %".110", 0x3ff0000000000000
  store float %".111", float* %"fy0"
  %"hy.3" = load i32, i32* %"hy"
  %"hs.5" = load i32, i32* %"hs"
  %".113" = add i32 %"hy.3", %"hs.5"
  %".114" = sitofp i32 %".113" to float
  %"inv_h.5" = load float, float* %"inv_h"
  %".115" = fmul float %".114", %"inv_h.5"
  %".116" = fsub float %".115", 0x3ff0000000000000
  store float %".116", float* %"fy1"
  %"GL_QUADS" = load i32, i32* @"GL_QUADS"
  call void @"glBegin"(i32 %"GL_QUADS")
  %"fxm.1" = load float, float* %"fxm"
  %"fy1.1" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fxm.1", float %"fy1.1")
  %"fx1.1" = load float, float* %"fx1"
  %"fyt.1" = load float, float* %"fyt"
  call void @"glVertex2f"(float %"fx1.1", float %"fyt.1")
  %"fxm.2" = load float, float* %"fxm"
  %"fy0.1" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fxm.2", float %"fy0.1")
  %"fx0.1" = load float, float* %"fx0"
  %"fyt.2" = load float, float* %"fyt"
  call void @"glVertex2f"(float %"fx0.1", float %"fyt.2")
  call void @"glEnd"()
  %"li.3" = load i32, i32* %"li"
  %".124" = add i32 %"li.3", 1
  store i32 %".124", i32* %"li"
  br label %"while.cond"
while.end:
  call void @"glColor4f"(float 0x3fe0000000000000, float 0x3fc3333340000000, float 0x3fc3333340000000, float 0x3fe3333340000000)
  store i32 3, i32* %"lv"
  br label %"while.cond.1"
while.cond.1:
  %"li.4" = load i32, i32* %"li"
  %"lv.1" = load i32, i32* %"lv"
  %".130" = icmp slt i32 %"li.4", %"lv.1"
  br i1 %".130", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"li.5" = load i32, i32* %"li"
  %"hs.6" = load i32, i32* %"hs"
  %".132" = mul i32 %"hs.6", 2
  %".133" = add i32 %".132", 6
  %".134" = mul i32 %"li.5", %".133"
  %".135" = add i32 20, %".134"
  store i32 %".135", i32* %"hx"
  %"h.4" = load i32, i32* %"h.addr"
  %".137" = sub i32 %"h.4", 22
  store i32 %".137", i32* %"hy"
  %"hx.4" = load i32, i32* %"hx"
  %".139" = sitofp i32 %"hx.4" to float
  %"inv_w.6" = load float, float* %"inv_w"
  %".140" = fmul float %".139", %"inv_w.6"
  %".141" = fsub float %".140", 0x3ff0000000000000
  store float %".141", float* %"fxm"
  %"hy.4" = load i32, i32* %"hy"
  %".143" = sitofp i32 %"hy.4" to float
  %"inv_h.6" = load float, float* %"inv_h"
  %".144" = fmul float %".143", %"inv_h.6"
  %".145" = fsub float %".144", 0x3ff0000000000000
  store float %".145", float* %"fyt"
  %"hx.5" = load i32, i32* %"hx"
  %"hs.7" = load i32, i32* %"hs"
  %".147" = sub i32 %"hx.5", %"hs.7"
  %".148" = sitofp i32 %".147" to float
  %"inv_w.7" = load float, float* %"inv_w"
  %".149" = fmul float %".148", %"inv_w.7"
  %".150" = fsub float %".149", 0x3ff0000000000000
  store float %".150", float* %"fx0"
  %"hx.6" = load i32, i32* %"hx"
  %"hs.8" = load i32, i32* %"hs"
  %".152" = add i32 %"hx.6", %"hs.8"
  %".153" = sitofp i32 %".152" to float
  %"inv_w.8" = load float, float* %"inv_w"
  %".154" = fmul float %".153", %"inv_w.8"
  %".155" = fsub float %".154", 0x3ff0000000000000
  store float %".155", float* %"fx1"
  %"hy.5" = load i32, i32* %"hy"
  %"hs.9" = load i32, i32* %"hs"
  %".157" = sub i32 %"hy.5", %"hs.9"
  %".158" = sitofp i32 %".157" to float
  %"inv_h.7" = load float, float* %"inv_h"
  %".159" = fmul float %".158", %"inv_h.7"
  %".160" = fsub float %".159", 0x3ff0000000000000
  store float %".160", float* %"fy0"
  %"hy.6" = load i32, i32* %"hy"
  %"hs.10" = load i32, i32* %"hs"
  %".162" = add i32 %"hy.6", %"hs.10"
  %".163" = sitofp i32 %".162" to float
  %"inv_h.8" = load float, float* %"inv_h"
  %".164" = fmul float %".163", %"inv_h.8"
  %".165" = fsub float %".164", 0x3ff0000000000000
  store float %".165", float* %"fy1"
  call void @"glLineWidth"(float 0x3ff0000000000000)
  %"GL_LINE_LOOP" = load i32, i32* @"GL_LINE_LOOP"
  call void @"glBegin"(i32 %"GL_LINE_LOOP")
  %"fxm.3" = load float, float* %"fxm"
  %"fy1.2" = load float, float* %"fy1"
  call void @"glVertex2f"(float %"fxm.3", float %"fy1.2")
  %"fx1.2" = load float, float* %"fx1"
  %"fyt.3" = load float, float* %"fyt"
  call void @"glVertex2f"(float %"fx1.2", float %"fyt.3")
  %"fxm.4" = load float, float* %"fxm"
  %"fy0.2" = load float, float* %"fy0"
  call void @"glVertex2f"(float %"fxm.4", float %"fy0.2")
  %"fx0.2" = load float, float* %"fx0"
  %"fyt.4" = load float, float* %"fyt"
  call void @"glVertex2f"(float %"fx0.2", float %"fyt.4")
  call void @"glEnd"()
  %"li.6" = load i32, i32* %"li"
  %".174" = add i32 %"li.6", 1
  store i32 %".174", i32* %"li"
  br label %"while.cond.1"
while.end.1:
  call void @"glColor4f"(float 0x3fe3333340000000, float 0x3fe99999a0000000, float 0x3ff0000000000000, float 0x3fe6666660000000)
  %"h.5" = load i32, i32* %"h.addr"
  %".178" = sub i32 %"h.5", 44
  store i32 %".178", i32* %"ty"
  %"str_stack.3" = alloca [6 x i8]
  %"str_char_0.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 76, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 73, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 86, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 69, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 83, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 0, i8* %"str_char_5.3"
  %"ty.3" = load i32, i32* %"ty"
  %"scale.6" = load i32, i32* %"scale"
  %"inv_w.9" = load float, float* %"inv_w"
  %"inv_h.9" = load float, float* %"inv_h"
  %"arg0_decay.3" = getelementptr [6 x i8], [6 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"arg0_decay.3", i32 8, i32 %"ty.3", i32 %"scale.6", float %"inv_w.9", float %"inv_h.9")
  %"GL_BLEND.1" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.1")
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.1")
  ret void
}

define void @"vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"vx", double* %"vy")
{
entry:
  %"vx.addr" = alloca double*
  store double* %"vx", double** %"vx.addr"
  %"vy.addr" = alloca double*
  store double* %"vy", double** %"vy.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"curl" = alloca double
  store double              0x0, double* %"curl"
  %"grad_x" = alloca double
  store double              0x0, double* %"grad_x"
  %"grad_y" = alloca double
  store double              0x0, double* %"grad_y"
  %"grad_len" = alloca double
  store double              0x0, double* %"grad_len"
  %"fx" = alloca double
  store double              0x0, double* %"fx"
  %"fy" = alloca double
  store double              0x0, double* %"fy"
  store i32 1, i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %".17" = sub i32 192, 1
  %".18" = icmp slt i32 %"j.1", %".17"
  br i1 %".18", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".20" = mul i32 %"j.2", 256
  store i32 %".20", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.3" = load i32, i32* %"j"
  %".56" = add i32 %"j.3", 1
  store i32 %".56", i32* %"j"
  br label %"for.cond"
for.end:
  store i32 1, i32* %"j"
  br label %"for.cond.2"
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".24" = sub i32 256, 1
  %".25" = icmp slt i32 %"i.1", %".24"
  br i1 %".25", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"vy.1" = load double*, double** %"vy.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".27" = add i32 %"base.1", %"i.2"
  %".28" = add i32 %".27", 1
  %"ptr_gep" = getelementptr inbounds double, double* %"vy.1", i32 %".28"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"vy.2" = load double*, double** %"vy.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".29" = add i32 %"base.2", %"i.3"
  %".30" = sub i32 %".29", 1
  %"ptr_gep.1" = getelementptr inbounds double, double* %"vy.2", i32 %".30"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %".31" = fsub double %"ptr_load", %"ptr_load.1"
  %"vx.1" = load double*, double** %"vx.addr"
  %"base.3" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".32" = add i32 %"base.3", %"i.4"
  %".33" = add i32 %".32", 256
  %"ptr_gep.2" = getelementptr inbounds double, double* %"vx.1", i32 %".33"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".34" = fsub double %".31", %"ptr_load.2"
  %"vx.2" = load double*, double** %"vx.addr"
  %"base.4" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".35" = add i32 %"base.4", %"i.5"
  %".36" = sub i32 %".35", 256
  %"ptr_gep.3" = getelementptr inbounds double, double* %"vx.2", i32 %".36"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %".37" = fadd double %".34", %"ptr_load.3"
  %"float_to_double_rhs" = fpext float 0x3fe0000000000000 to double
  %".38" = fmul double %".37", %"float_to_double_rhs"
  store double %".38", double* %"curl"
  %"curl.1" = load double, double* %"curl"
  %"float_to_double_rhs.1" = fpext float              0x0 to double
  %".40" = fcmp olt double %"curl.1", %"float_to_double_rhs.1"
  br i1 %".40", label %"ternary_true", label %"ternary_false"
for.update.1:
  %"i.8" = load i32, i32* %"i"
  %".52" = add i32 %"i.8", 1
  store i32 %".52", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
ternary_true:
  %"curl.2" = load double, double* %"curl"
  %"float_to_double_lhs" = fpext float              0x0 to double
  %".42" = fsub double %"float_to_double_lhs", %"curl.2"
  br label %"ternary_merge"
ternary_false:
  %"curl.3" = load double, double* %"curl"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  double [%".42", %"ternary_true"], [%"curl.3", %"ternary_false"]
  %"g_dens_prev" = load double*, double** @"g_dens_prev"
  %"base.5" = load i32, i32* %"base"
  %"i.6" = load i32, i32* %"i"
  %".45" = add i32 %"base.5", %"i.6"
  %".46" = getelementptr inbounds double, double* %"g_dens_prev", i32 %".45"
  store double %"ternary_result", double* %".46"
  %"curl.4" = load double, double* %"curl"
  %"g_vx_prev" = load double*, double** @"g_vx_prev"
  %"base.6" = load i32, i32* %"base"
  %"i.7" = load i32, i32* %"i"
  %".48" = add i32 %"base.6", %"i.7"
  %".49" = getelementptr inbounds double, double* %"g_vx_prev", i32 %".48"
  store double %"curl.4", double* %".49"
  br label %"for.update.1"
for.cond.2:
  %"j.4" = load i32, i32* %"j"
  %".61" = sub i32 192, 1
  %".62" = icmp slt i32 %"j.4", %".61"
  br i1 %".62", label %"for.body.2", label %"for.end.2"
for.body.2:
  %"j.5" = load i32, i32* %"j"
  %".64" = mul i32 %"j.5", 256
  store i32 %".64", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.3"
for.update.2:
  %"j.6" = load i32, i32* %"j"
  %".121" = add i32 %"j.6", 1
  store i32 %".121", i32* %"j"
  br label %"for.cond.2"
for.end.2:
  ret void
for.cond.3:
  %"i.9" = load i32, i32* %"i"
  %".68" = sub i32 256, 1
  %".69" = icmp slt i32 %"i.9", %".68"
  br i1 %".69", label %"for.body.3", label %"for.end.3"
for.body.3:
  %"g_dens_prev.1" = load double*, double** @"g_dens_prev"
  %"base.7" = load i32, i32* %"base"
  %"i.10" = load i32, i32* %"i"
  %".71" = add i32 %"base.7", %"i.10"
  %".72" = add i32 %".71", 1
  %"ptr_gep.4" = getelementptr inbounds double, double* %"g_dens_prev.1", i32 %".72"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %"g_dens_prev.2" = load double*, double** @"g_dens_prev"
  %"base.8" = load i32, i32* %"base"
  %"i.11" = load i32, i32* %"i"
  %".73" = add i32 %"base.8", %"i.11"
  %".74" = sub i32 %".73", 1
  %"ptr_gep.5" = getelementptr inbounds double, double* %"g_dens_prev.2", i32 %".74"
  %"ptr_load.5" = load double, double* %"ptr_gep.5"
  %".75" = fsub double %"ptr_load.4", %"ptr_load.5"
  %"float_to_double_rhs.2" = fpext float 0x3fe0000000000000 to double
  %".76" = fmul double %".75", %"float_to_double_rhs.2"
  store double %".76", double* %"grad_x"
  %"g_dens_prev.3" = load double*, double** @"g_dens_prev"
  %"base.9" = load i32, i32* %"base"
  %"i.12" = load i32, i32* %"i"
  %".78" = add i32 %"base.9", %"i.12"
  %".79" = add i32 %".78", 256
  %"ptr_gep.6" = getelementptr inbounds double, double* %"g_dens_prev.3", i32 %".79"
  %"ptr_load.6" = load double, double* %"ptr_gep.6"
  %"g_dens_prev.4" = load double*, double** @"g_dens_prev"
  %"base.10" = load i32, i32* %"base"
  %"i.13" = load i32, i32* %"i"
  %".80" = add i32 %"base.10", %"i.13"
  %".81" = sub i32 %".80", 256
  %"ptr_gep.7" = getelementptr inbounds double, double* %"g_dens_prev.4", i32 %".81"
  %"ptr_load.7" = load double, double* %"ptr_gep.7"
  %".82" = fsub double %"ptr_load.6", %"ptr_load.7"
  %"float_to_double_rhs.3" = fpext float 0x3fe0000000000000 to double
  %".83" = fmul double %".82", %"float_to_double_rhs.3"
  store double %".83", double* %"grad_y"
  %"grad_x.1" = load double, double* %"grad_x"
  %"grad_x.2" = load double, double* %"grad_x"
  %".85" = fmul double %"grad_x.1", %"grad_x.2"
  %"grad_y.1" = load double, double* %"grad_y"
  %"grad_y.2" = load double, double* %"grad_y"
  %".86" = fmul double %"grad_y.1", %"grad_y.2"
  %".87" = fadd double %".85", %".86"
  %".88" = call double @"standard__math__sqrt__1__doubleE1__ret_doubleE1"(double %".87")
  %"float_to_double_rhs.4" = fpext float 0x3f1a36e2e0000000 to double
  %".89" = fadd double %".88", %"float_to_double_rhs.4"
  store double %".89", double* %"grad_len"
  %"grad_x.3" = load double, double* %"grad_x"
  %"grad_len.1" = load double, double* %"grad_len"
  %".91" = fdiv double %"grad_x.3", %"grad_len.1"
  store double %".91", double* %"grad_x"
  %"grad_y.3" = load double, double* %"grad_y"
  %"grad_len.2" = load double, double* %"grad_len"
  %".93" = fdiv double %"grad_y.3", %"grad_len.2"
  store double %".93", double* %"grad_y"
  %"g_vx_prev.1" = load double*, double** @"g_vx_prev"
  %"base.11" = load i32, i32* %"base"
  %"i.14" = load i32, i32* %"i"
  %".95" = add i32 %"base.11", %"i.14"
  %"ptr_gep.8" = getelementptr inbounds double, double* %"g_vx_prev.1", i32 %".95"
  %"ptr_load.8" = load double, double* %"ptr_gep.8"
  store double %"ptr_load.8", double* %"curl"
  %"grad_y.4" = load double, double* %"grad_y"
  %"curl.5" = load double, double* %"curl"
  %".97" = fmul double %"grad_y.4", %"curl.5"
  %".98" = fsub float              0x0, 0x3fe99999a0000000
  %"float_to_double_rhs.5" = fpext float %".98" to double
  %".99" = fmul double %".97", %"float_to_double_rhs.5"
  store double %".99", double* %"fx"
  %"grad_x.4" = load double, double* %"grad_x"
  %"curl.6" = load double, double* %"curl"
  %".101" = fmul double %"grad_x.4", %"curl.6"
  %"float_to_double_rhs.6" = fpext float 0x3fe99999a0000000 to double
  %".102" = fmul double %".101", %"float_to_double_rhs.6"
  store double %".102", double* %"fy"
  %"vx.3" = load double*, double** %"vx.addr"
  %"base.12" = load i32, i32* %"base"
  %"i.15" = load i32, i32* %"i"
  %".104" = add i32 %"base.12", %"i.15"
  %"ptr_gep.9" = getelementptr inbounds double, double* %"vx.3", i32 %".104"
  %"ptr_load.9" = load double, double* %"ptr_gep.9"
  %"fx.1" = load double, double* %"fx"
  %"float_to_double_lhs.1" = fpext float 0x3fb99999a0000000 to double
  %".105" = fmul double %"float_to_double_lhs.1", %"fx.1"
  %".106" = fadd double %"ptr_load.9", %".105"
  %"vx.4" = load double*, double** %"vx.addr"
  %"base.13" = load i32, i32* %"base"
  %"i.16" = load i32, i32* %"i"
  %".107" = add i32 %"base.13", %"i.16"
  %".108" = getelementptr inbounds double, double* %"vx.4", i32 %".107"
  store double %".106", double* %".108"
  %"vy.3" = load double*, double** %"vy.addr"
  %"base.14" = load i32, i32* %"base"
  %"i.17" = load i32, i32* %"i"
  %".110" = add i32 %"base.14", %"i.17"
  %"ptr_gep.10" = getelementptr inbounds double, double* %"vy.3", i32 %".110"
  %"ptr_load.10" = load double, double* %"ptr_gep.10"
  %"fy.1" = load double, double* %"fy"
  %"float_to_double_lhs.2" = fpext float 0x3fb99999a0000000 to double
  %".111" = fmul double %"float_to_double_lhs.2", %"fy.1"
  %".112" = fadd double %"ptr_load.10", %".111"
  %"vy.4" = load double*, double** %"vy.addr"
  %"base.15" = load i32, i32* %"base"
  %"i.18" = load i32, i32* %"i"
  %".113" = add i32 %"base.15", %"i.18"
  %".114" = getelementptr inbounds double, double* %"vy.4", i32 %".113"
  store double %".112", double* %".114"
  br label %"for.update.3"
for.update.3:
  %"i.19" = load i32, i32* %"i"
  %".117" = add i32 %"i.19", 1
  store i32 %".117", i32* %"i"
  br label %"for.cond.3"
for.end.3:
  br label %"for.update.2"
}

define i64 @"FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"hwnd", i32 %"msg", i64 %"wParam", i64 %"lParam")
{
entry:
  %"hwnd.addr" = alloca i64
  store i64 %"hwnd", i64* %"hwnd.addr"
  %"msg.addr" = alloca i32
  store i32 %"msg", i32* %"msg.addr"
  %"wParam.addr" = alloca i64
  store i64 %"wParam", i64* %"wParam.addr"
  %"lParam.addr" = alloca i64
  store i64 %"lParam", i64* %"lParam.addr"
  %"nx" = alloca i32
  store i32 0, i32* %"nx"
  %"ny" = alloca i32
  store i32 0, i32* %"ny"
  %"click_x" = alloca i32
  store i32 0, i32* %"click_x"
  %"click_y" = alloca i32
  store i32 0, i32* %"click_y"
  %"msg.1" = load i32, i32* %"msg.addr"
  %"WM_CLOSE" = load i32, i32* @"standard__system__windows__WM_CLOSE"
  %".14" = icmp eq i32 %"msg.1", %"WM_CLOSE"
  %"ps" = alloca %"standard__system__windows__PAINTSTRUCT"
  br i1 %".14", label %"then", label %"else"
then:
  %"hwnd.1" = load i64, i64* %"hwnd.addr"
  %".16" = call i1 @"DestroyWindow"(i64 %"hwnd.1")
  %".17" = sext i32 0 to i64
  ret i64 %".17"
else:
  br label %"ifcont"
ifcont:
  %"msg.2" = load i32, i32* %"msg.addr"
  %"WM_DESTROY" = load i32, i32* @"standard__system__windows__WM_DESTROY"
  %".20" = icmp eq i32 %"msg.2", %"WM_DESTROY"
  br i1 %".20", label %"then.1", label %"else.1"
then.1:
  call void @"PostQuitMessage"(i32 0)
  %".23" = sext i32 0 to i64
  ret i64 %".23"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"msg.3" = load i32, i32* %"msg.addr"
  %"WM_ERASEBKGND" = load i32, i32* @"standard__system__windows__WM_ERASEBKGND"
  %".26" = icmp eq i32 %"msg.3", %"WM_ERASEBKGND"
  br i1 %".26", label %"then.2", label %"else.2"
then.2:
  %".28" = sext i32 1 to i64
  ret i64 %".28"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"msg.4" = load i32, i32* %"msg.addr"
  %"WM_PAINT" = load i32, i32* @"standard__system__windows__WM_PAINT"
  %".31" = icmp eq i32 %"msg.4", %"WM_PAINT"
  br i1 %".31", label %"then.3", label %"else.3"
then.3:
  store %"standard__system__windows__PAINTSTRUCT" zeroinitializer, %"standard__system__windows__PAINTSTRUCT"* %"ps"
  %"hwnd.2" = load i64, i64* %"hwnd.addr"
  %".34" = call i64 @"BeginPaint"(i64 %"hwnd.2", %"standard__system__windows__PAINTSTRUCT"* %"ps")
  %"hwnd.3" = load i64, i64* %"hwnd.addr"
  %".35" = call i1 @"EndPaint"(i64 %"hwnd.3", %"standard__system__windows__PAINTSTRUCT"* %"ps")
  %".36" = sext i32 0 to i64
  ret i64 %".36"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"msg.5" = load i32, i32* %"msg.addr"
  %"WM_LBUTTONDOWN" = load i32, i32* @"standard__system__windows__WM_LBUTTONDOWN"
  %".39" = icmp eq i32 %"msg.5", %"WM_LBUTTONDOWN"
  br i1 %".39", label %"then.4", label %"else.4"
then.4:
  %"lParam.1" = load i64, i64* %"lParam.addr"
  %".41" = zext i32 65535 to i64
  %".42" = and i64 %"lParam.1", %".41"
  %".43" = trunc i64 %".42" to i32
  store i32 %".43", i32* %"click_x"
  %"lParam.2" = load i64, i64* %"lParam.addr"
  %".45" = zext i32 16 to i64
  %".46" = lshr i64 %"lParam.2", %".45"
  %".47" = zext i32 65535 to i64
  %".48" = and i64 %".46", %".47"
  %".49" = trunc i64 %".48" to i32
  store i32 %".49", i32* %"click_y"
  %"g_game_state" = load i32, i32* @"g_game_state"
  %".51" = icmp eq i32 %"g_game_state", 0
  br i1 %".51", label %"then.5", label %"else.5"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"msg.6" = load i32, i32* %"msg.addr"
  %"WM_LBUTTONUP" = load i32, i32* @"standard__system__windows__WM_LBUTTONUP"
  %".107" = icmp eq i32 %"msg.6", %"WM_LBUTTONUP"
  br i1 %".107", label %"then.11", label %"else.11"
then.5:
  %"click_x.1" = load i32, i32* %"click_x"
  %"click_y.1" = load i32, i32* %"click_y"
  %"cur_w" = load i32, i32* @"cur_w"
  %".53" = sdiv i32 %"cur_w", 2
  %"cur_h" = load i32, i32* @"cur_h"
  %".54" = sdiv i32 %"cur_h", 2
  %".55" = call i1 @"btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1"(i32 %"click_x.1", i32 %"click_y.1", i32 %".53", i32 %".54")
  br i1 %".55", label %"then.6", label %"else.6"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"g_game_state.1" = load i32, i32* @"g_game_state"
  %".67" = icmp eq i32 %"g_game_state.1", 2
  br i1 %".67", label %"then.7", label %"else.7"
then.6:
  store i32 3, i32* @"g_lives"
  store i32 1, i32* @"g_level"
  %".59" = fsub float              0x0, 0x3ff0000000000000
  store float %".59", float* @"g_ball_x"
  store i32 1, i32* @"g_game_state"
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %".64" = sext i32 0 to i64
  ret i64 %".64"
then.7:
  %"click_x.2" = load i32, i32* %"click_x"
  %"click_y.2" = load i32, i32* %"click_y"
  %"cur_w.1" = load i32, i32* @"cur_w"
  %".69" = sdiv i32 %"cur_w.1", 2
  %".70" = sub i32 %".69", 80
  %"cur_h.1" = load i32, i32* @"cur_h"
  %".71" = sdiv i32 %"cur_h.1", 2
  %".72" = add i32 %".71", 50
  %".73" = sdiv i32 220, 4
  %".74" = sdiv i32 52, 2
  %".75" = call i1 @"btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1"(i32 %"click_x.2", i32 %"click_y.2", i32 %".70", i32 %".72", i32 %".73", i32 %".74")
  br i1 %".75", label %"then.8", label %"else.8"
else.7:
  br label %"ifcont.7"
ifcont.7:
  store i1 true, i1* @"mouse_down"
  %"g_game_state.2" = load i32, i32* @"g_game_state"
  %".95" = icmp eq i32 %"g_game_state.2", 1
  br i1 %".95", label %"then.10", label %"else.10"
then.8:
  call void @"PostQuitMessage"(i32 0)
  br label %"ifcont.8"
else.8:
  br label %"ifcont.8"
ifcont.8:
  %"click_x.3" = load i32, i32* %"click_x"
  %"click_y.3" = load i32, i32* %"click_y"
  %"cur_w.2" = load i32, i32* @"cur_w"
  %".80" = sdiv i32 %"cur_w.2", 2
  %".81" = add i32 %".80", 80
  %"cur_h.2" = load i32, i32* @"cur_h"
  %".82" = sdiv i32 %"cur_h.2", 2
  %".83" = add i32 %".82", 50
  %".84" = sdiv i32 220, 4
  %".85" = sdiv i32 52, 2
  %".86" = call i1 @"btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1"(i32 %"click_x.3", i32 %"click_y.3", i32 %".81", i32 %".83", i32 %".84", i32 %".85")
  br i1 %".86", label %"then.9", label %"else.9"
then.9:
  %"g_prev_state" = load i32, i32* @"g_prev_state"
  store i32 %"g_prev_state", i32* @"g_game_state"
  br label %"ifcont.9"
else.9:
  br label %"ifcont.9"
ifcont.9:
  %".91" = sext i32 0 to i64
  ret i64 %".91"
then.10:
  store i1 true, i1* @"g_jetting"
  br label %"ifcont.10"
else.10:
  br label %"ifcont.10"
ifcont.10:
  %"click_x.4" = load i32, i32* %"click_x"
  store i32 %"click_x.4", i32* @"mouse_px"
  %"click_y.4" = load i32, i32* %"click_y"
  store i32 %"click_y.4", i32* @"mouse_py"
  %"mouse_px" = load i32, i32* @"mouse_px"
  store i32 %"mouse_px", i32* @"mouse_x"
  %"mouse_py" = load i32, i32* @"mouse_py"
  store i32 %"mouse_py", i32* @"mouse_y"
  %".104" = sext i32 0 to i64
  ret i64 %".104"
then.11:
  store i1 false, i1* @"mouse_down"
  store i1 false, i1* @"g_jetting"
  %".111" = sext i32 0 to i64
  ret i64 %".111"
else.11:
  br label %"ifcont.11"
ifcont.11:
  %"msg.7" = load i32, i32* %"msg.addr"
  %"WM_RBUTTONDOWN" = load i32, i32* @"standard__system__windows__WM_RBUTTONDOWN"
  %".114" = icmp eq i32 %"msg.7", %"WM_RBUTTONDOWN"
  br i1 %".114", label %"then.12", label %"else.12"
then.12:
  %"g_game_state.3" = load i32, i32* @"g_game_state"
  %".116" = icmp eq i32 %"g_game_state.3", 1
  br i1 %".116", label %"then.13", label %"else.13"
else.12:
  br label %"ifcont.12"
ifcont.12:
  %"msg.8" = load i32, i32* %"msg.addr"
  %"WM_RBUTTONUP" = load i32, i32* @"standard__system__windows__WM_RBUTTONUP"
  %".126" = icmp eq i32 %"msg.8", %"WM_RBUTTONUP"
  br i1 %".126", label %"then.14", label %"else.14"
then.13:
  store i1 true, i1* @"g_sucking"
  store i1 false, i1* @"g_jetting"
  store float              0x0, float* @"g_suck_charge"
  br label %"ifcont.13"
else.13:
  br label %"ifcont.13"
ifcont.13:
  %".123" = sext i32 0 to i64
  ret i64 %".123"
then.14:
  store i1 false, i1* @"g_sucking"
  %".129" = sext i32 0 to i64
  ret i64 %".129"
else.14:
  br label %"ifcont.14"
ifcont.14:
  %"msg.9" = load i32, i32* %"msg.addr"
  %"WM_MOUSEMOVE" = load i32, i32* @"standard__system__windows__WM_MOUSEMOVE"
  %".132" = icmp eq i32 %"msg.9", %"WM_MOUSEMOVE"
  br i1 %".132", label %"then.15", label %"else.15"
then.15:
  %"lParam.3" = load i64, i64* %"lParam.addr"
  %".134" = zext i32 65535 to i64
  %".135" = and i64 %"lParam.3", %".134"
  %".136" = trunc i64 %".135" to i32
  store i32 %".136", i32* %"nx"
  %"lParam.4" = load i64, i64* %"lParam.addr"
  %".138" = zext i32 16 to i64
  %".139" = lshr i64 %"lParam.4", %".138"
  %".140" = zext i32 65535 to i64
  %".141" = and i64 %".139", %".140"
  %".142" = trunc i64 %".141" to i32
  store i32 %".142", i32* %"ny"
  %"mouse_x" = load i32, i32* @"mouse_x"
  store i32 %"mouse_x", i32* @"mouse_px"
  %"mouse_y" = load i32, i32* @"mouse_y"
  store i32 %"mouse_y", i32* @"mouse_py"
  %"nx.1" = load i32, i32* %"nx"
  store i32 %"nx.1", i32* @"mouse_x"
  %"ny.1" = load i32, i32* %"ny"
  store i32 %"ny.1", i32* @"mouse_y"
  %".148" = sext i32 0 to i64
  ret i64 %".148"
else.15:
  br label %"ifcont.15"
ifcont.15:
  %"msg.10" = load i32, i32* %"msg.addr"
  %"WM_KEYDOWN" = load i32, i32* @"standard__system__windows__WM_KEYDOWN"
  %".151" = icmp eq i32 %"msg.10", %"WM_KEYDOWN"
  br i1 %".151", label %"then.16", label %"else.16"
then.16:
  %"wParam.1" = load i64, i64* %"wParam.addr"
  %".153" = zext i32 27 to i64
  %".154" = icmp eq i64 %"wParam.1", %".153"
  br i1 %".154", label %"then.17", label %"else.17"
else.16:
  br label %"ifcont.16"
ifcont.16:
  %"hwnd.4" = load i64, i64* %"hwnd.addr"
  %"msg.11" = load i32, i32* %"msg.addr"
  %"wParam.12" = load i64, i64* %"wParam.addr"
  %"lParam.5" = load i64, i64* %"lParam.addr"
  %".241" = call i64 @"DefWindowProcA"(i64 %"hwnd.4", i32 %"msg.11", i64 %"wParam.12", i64 %"lParam.5")
  ret i64 %".241"
then.17:
  %"g_game_state.4" = load i32, i32* @"g_game_state"
  %".156" = icmp ne i32 %"g_game_state.4", 2
  br i1 %".156", label %"then.18", label %"else.18"
else.17:
  br label %"ifcont.17"
ifcont.17:
  %"wParam.2" = load i64, i64* %"wParam.addr"
  %".168" = zext i32 49 to i64
  %".169" = icmp eq i64 %"wParam.2", %".168"
  br i1 %".169", label %"then.19", label %"else.19"
then.18:
  %"g_game_state.5" = load i32, i32* @"g_game_state"
  store i32 %"g_game_state.5", i32* @"g_prev_state"
  store i32 2, i32* @"g_game_state"
  store i1 false, i1* @"g_jetting"
  store i1 false, i1* @"g_sucking"
  store float              0x0, float* @"g_suck_charge"
  br label %"ifcont.18"
else.18:
  br label %"ifcont.18"
ifcont.18:
  %".165" = sext i32 0 to i64
  ret i64 %".165"
then.19:
  store i32 0, i32* @"g_palette"
  %".172" = sext i32 0 to i64
  ret i64 %".172"
else.19:
  br label %"ifcont.19"
ifcont.19:
  %"wParam.3" = load i64, i64* %"wParam.addr"
  %".175" = zext i32 50 to i64
  %".176" = icmp eq i64 %"wParam.3", %".175"
  br i1 %".176", label %"then.20", label %"else.20"
then.20:
  store i32 1, i32* @"g_palette"
  %".179" = sext i32 0 to i64
  ret i64 %".179"
else.20:
  br label %"ifcont.20"
ifcont.20:
  %"wParam.4" = load i64, i64* %"wParam.addr"
  %".182" = zext i32 51 to i64
  %".183" = icmp eq i64 %"wParam.4", %".182"
  br i1 %".183", label %"then.21", label %"else.21"
then.21:
  store i32 2, i32* @"g_palette"
  %".186" = sext i32 0 to i64
  ret i64 %".186"
else.21:
  br label %"ifcont.21"
ifcont.21:
  %"wParam.5" = load i64, i64* %"wParam.addr"
  %".189" = zext i32 52 to i64
  %".190" = icmp eq i64 %"wParam.5", %".189"
  br i1 %".190", label %"then.22", label %"else.22"
then.22:
  store i32 3, i32* @"g_palette"
  %".193" = sext i32 0 to i64
  ret i64 %".193"
else.22:
  br label %"ifcont.22"
ifcont.22:
  %"wParam.6" = load i64, i64* %"wParam.addr"
  %".196" = zext i32 53 to i64
  %".197" = icmp eq i64 %"wParam.6", %".196"
  br i1 %".197", label %"then.23", label %"else.23"
then.23:
  store i32 4, i32* @"g_palette"
  %".200" = sext i32 0 to i64
  ret i64 %".200"
else.23:
  br label %"ifcont.23"
ifcont.23:
  %"wParam.7" = load i64, i64* %"wParam.addr"
  %".203" = zext i32 54 to i64
  %".204" = icmp eq i64 %"wParam.7", %".203"
  br i1 %".204", label %"then.24", label %"else.24"
then.24:
  store i32 5, i32* @"g_palette"
  %".207" = sext i32 0 to i64
  ret i64 %".207"
else.24:
  br label %"ifcont.24"
ifcont.24:
  %"wParam.8" = load i64, i64* %"wParam.addr"
  %".210" = zext i32 55 to i64
  %".211" = icmp eq i64 %"wParam.8", %".210"
  br i1 %".211", label %"then.25", label %"else.25"
then.25:
  store i32 6, i32* @"g_palette"
  %".214" = sext i32 0 to i64
  ret i64 %".214"
else.25:
  br label %"ifcont.25"
ifcont.25:
  %"wParam.9" = load i64, i64* %"wParam.addr"
  %".217" = zext i32 56 to i64
  %".218" = icmp eq i64 %"wParam.9", %".217"
  br i1 %".218", label %"then.26", label %"else.26"
then.26:
  store i32 7, i32* @"g_palette"
  %".221" = sext i32 0 to i64
  ret i64 %".221"
else.26:
  br label %"ifcont.26"
ifcont.26:
  %"wParam.10" = load i64, i64* %"wParam.addr"
  %".224" = zext i32 57 to i64
  %".225" = icmp eq i64 %"wParam.10", %".224"
  br i1 %".225", label %"then.27", label %"else.27"
then.27:
  store i32 8, i32* @"g_palette"
  %".228" = sext i32 0 to i64
  ret i64 %".228"
else.27:
  br label %"ifcont.27"
ifcont.27:
  %"wParam.11" = load i64, i64* %"wParam.addr"
  %".231" = zext i32 48 to i64
  %".232" = icmp eq i64 %"wParam.11", %".231"
  br i1 %".232", label %"then.28", label %"else.28"
then.28:
  store i32 9, i32* @"g_palette"
  %".235" = sext i32 0 to i64
  ret i64 %".235"
else.28:
  br label %"ifcont.28"
ifcont.28:
  %".238" = sext i32 0 to i64
  ret i64 %".238"
}

define i32 @"IX__2__intE1__intE1__ret_intE1"(i32 %"x", i32 %"y")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"y.addr" = alloca i32
  store i32 %"y", i32* %"y.addr"
  %"y.1" = load i32, i32* %"y.addr"
  %".6" = mul i32 %"y.1", 256
  %"x.1" = load i32, i32* %"x.addr"
  %".7" = add i32 %".6", %"x.1"
  ret i32 %".7"
}

define void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"b", double* %"x")
{
entry:
  %"b.addr" = alloca i32
  store i32 %"b", i32* %"b.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  store i32 1, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".9" = sub i32 192, 1
  %".10" = icmp slt i32 %"i.1", %".9"
  br i1 %".10", label %"for.body", label %"for.end"
for.body:
  %"b.1" = load i32, i32* %"b.addr"
  %".12" = icmp eq i32 %"b.1", 1
  br i1 %".12", label %"then", label %"else"
for.update:
  %"i.10" = load i32, i32* %"i"
  %".45" = add i32 %"i.10", 1
  store i32 %".45", i32* %"i"
  br label %"for.cond"
for.end:
  store i32 1, i32* %"i"
  br label %"for.cond.1"
then:
  %"x.1" = load double*, double** %"x.addr"
  %"i.2" = load i32, i32* %"i"
  %".14" = mul i32 %"i.2", 256
  %".15" = add i32 %".14", 1
  %"ptr_gep" = getelementptr inbounds double, double* %"x.1", i32 %".15"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"float_to_double_lhs" = fpext float              0x0 to double
  %".16" = fsub double %"float_to_double_lhs", %"ptr_load"
  %"x.2" = load double*, double** %"x.addr"
  %"i.3" = load i32, i32* %"i"
  %".17" = mul i32 %"i.3", 256
  %".18" = getelementptr inbounds double, double* %"x.2", i32 %".17"
  store double %".16", double* %".18"
  %"x.3" = load double*, double** %"x.addr"
  %"i.4" = load i32, i32* %"i"
  %".20" = mul i32 %"i.4", 256
  %".21" = add i32 %".20", 256
  %".22" = sub i32 %".21", 2
  %"ptr_gep.1" = getelementptr inbounds double, double* %"x.3", i32 %".22"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"float_to_double_lhs.1" = fpext float              0x0 to double
  %".23" = fsub double %"float_to_double_lhs.1", %"ptr_load.1"
  %"x.4" = load double*, double** %"x.addr"
  %"i.5" = load i32, i32* %"i"
  %".24" = mul i32 %"i.5", 256
  %".25" = add i32 %".24", 256
  %".26" = sub i32 %".25", 1
  %".27" = getelementptr inbounds double, double* %"x.4", i32 %".26"
  store double %".23", double* %".27"
  br label %"ifcont"
else:
  %"x.5" = load double*, double** %"x.addr"
  %"i.6" = load i32, i32* %"i"
  %".30" = mul i32 %"i.6", 256
  %".31" = add i32 %".30", 1
  %"ptr_gep.2" = getelementptr inbounds double, double* %"x.5", i32 %".31"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"x.6" = load double*, double** %"x.addr"
  %"i.7" = load i32, i32* %"i"
  %".32" = mul i32 %"i.7", 256
  %".33" = getelementptr inbounds double, double* %"x.6", i32 %".32"
  store double %"ptr_load.2", double* %".33"
  %"x.7" = load double*, double** %"x.addr"
  %"i.8" = load i32, i32* %"i"
  %".35" = mul i32 %"i.8", 256
  %".36" = add i32 %".35", 256
  %".37" = sub i32 %".36", 2
  %"ptr_gep.3" = getelementptr inbounds double, double* %"x.7", i32 %".37"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %"x.8" = load double*, double** %"x.addr"
  %"i.9" = load i32, i32* %"i"
  %".38" = mul i32 %"i.9", 256
  %".39" = add i32 %".38", 256
  %".40" = sub i32 %".39", 1
  %".41" = getelementptr inbounds double, double* %"x.8", i32 %".40"
  store double %"ptr_load.3", double* %".41"
  br label %"ifcont"
ifcont:
  br label %"for.update"
for.cond.1:
  %"i.11" = load i32, i32* %"i"
  %".50" = sub i32 256, 1
  %".51" = icmp slt i32 %"i.11", %".50"
  br i1 %".51", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"b.2" = load i32, i32* %"b.addr"
  %".53" = icmp eq i32 %"b.2", 2
  br i1 %".53", label %"then.1", label %"else.1"
for.update.1:
  %"i.20" = load i32, i32* %"i"
  %".82" = add i32 %"i.20", 1
  store i32 %".82", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  %"x.17" = load double*, double** %"x.addr"
  %"ptr_gep.8" = getelementptr inbounds double, double* %"x.17", i32 1
  %"ptr_load.8" = load double, double* %"ptr_gep.8"
  %"x.18" = load double*, double** %"x.addr"
  %"ptr_gep.9" = getelementptr inbounds double, double* %"x.18", i32 256
  %"ptr_load.9" = load double, double* %"ptr_gep.9"
  %".85" = fadd double %"ptr_load.8", %"ptr_load.9"
  %"float_to_double_lhs.4" = fpext float 0x3fe0000000000000 to double
  %".86" = fmul double %"float_to_double_lhs.4", %".85"
  %"x.19" = load double*, double** %"x.addr"
  %".87" = getelementptr inbounds double, double* %"x.19", i32 0
  store double %".86", double* %".87"
  %"x.20" = load double*, double** %"x.addr"
  %".89" = sub i32 256, 2
  %"ptr_gep.10" = getelementptr inbounds double, double* %"x.20", i32 %".89"
  %"ptr_load.10" = load double, double* %"ptr_gep.10"
  %"x.21" = load double*, double** %"x.addr"
  %".90" = add i32 256, 256
  %".91" = sub i32 %".90", 1
  %"ptr_gep.11" = getelementptr inbounds double, double* %"x.21", i32 %".91"
  %"ptr_load.11" = load double, double* %"ptr_gep.11"
  %".92" = fadd double %"ptr_load.10", %"ptr_load.11"
  %"float_to_double_lhs.5" = fpext float 0x3fe0000000000000 to double
  %".93" = fmul double %"float_to_double_lhs.5", %".92"
  %"x.22" = load double*, double** %"x.addr"
  %".94" = sub i32 256, 1
  %".95" = getelementptr inbounds double, double* %"x.22", i32 %".94"
  store double %".93", double* %".95"
  %"x.23" = load double*, double** %"x.addr"
  %".97" = sub i32 192, 1
  %".98" = mul i32 %".97", 256
  %".99" = add i32 %".98", 1
  %"ptr_gep.12" = getelementptr inbounds double, double* %"x.23", i32 %".99"
  %"ptr_load.12" = load double, double* %"ptr_gep.12"
  %"x.24" = load double*, double** %"x.addr"
  %".100" = sub i32 192, 2
  %".101" = mul i32 %".100", 256
  %"ptr_gep.13" = getelementptr inbounds double, double* %"x.24", i32 %".101"
  %"ptr_load.13" = load double, double* %"ptr_gep.13"
  %".102" = fadd double %"ptr_load.12", %"ptr_load.13"
  %"float_to_double_lhs.6" = fpext float 0x3fe0000000000000 to double
  %".103" = fmul double %"float_to_double_lhs.6", %".102"
  %"x.25" = load double*, double** %"x.addr"
  %".104" = sub i32 192, 1
  %".105" = mul i32 %".104", 256
  %".106" = getelementptr inbounds double, double* %"x.25", i32 %".105"
  store double %".103", double* %".106"
  %"x.26" = load double*, double** %"x.addr"
  %".108" = sub i32 192, 1
  %".109" = mul i32 %".108", 256
  %".110" = add i32 %".109", 256
  %".111" = sub i32 %".110", 2
  %"ptr_gep.14" = getelementptr inbounds double, double* %"x.26", i32 %".111"
  %"ptr_load.14" = load double, double* %"ptr_gep.14"
  %"x.27" = load double*, double** %"x.addr"
  %".112" = sub i32 192, 2
  %".113" = mul i32 %".112", 256
  %".114" = add i32 %".113", 256
  %".115" = sub i32 %".114", 1
  %"ptr_gep.15" = getelementptr inbounds double, double* %"x.27", i32 %".115"
  %"ptr_load.15" = load double, double* %"ptr_gep.15"
  %".116" = fadd double %"ptr_load.14", %"ptr_load.15"
  %"float_to_double_lhs.7" = fpext float 0x3fe0000000000000 to double
  %".117" = fmul double %"float_to_double_lhs.7", %".116"
  %"x.28" = load double*, double** %"x.addr"
  %".118" = sub i32 192, 1
  %".119" = mul i32 %".118", 256
  %".120" = add i32 %".119", 256
  %".121" = sub i32 %".120", 1
  %".122" = getelementptr inbounds double, double* %"x.28", i32 %".121"
  store double %".117", double* %".122"
  ret void
then.1:
  %"x.9" = load double*, double** %"x.addr"
  %"i.12" = load i32, i32* %"i"
  %".55" = add i32 %"i.12", 256
  %"ptr_gep.4" = getelementptr inbounds double, double* %"x.9", i32 %".55"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %"float_to_double_lhs.2" = fpext float              0x0 to double
  %".56" = fsub double %"float_to_double_lhs.2", %"ptr_load.4"
  %"x.10" = load double*, double** %"x.addr"
  %"i.13" = load i32, i32* %"i"
  %".57" = getelementptr inbounds double, double* %"x.10", i32 %"i.13"
  store double %".56", double* %".57"
  %"x.11" = load double*, double** %"x.addr"
  %".59" = sub i32 192, 2
  %".60" = mul i32 %".59", 256
  %"i.14" = load i32, i32* %"i"
  %".61" = add i32 %".60", %"i.14"
  %"ptr_gep.5" = getelementptr inbounds double, double* %"x.11", i32 %".61"
  %"ptr_load.5" = load double, double* %"ptr_gep.5"
  %"float_to_double_lhs.3" = fpext float              0x0 to double
  %".62" = fsub double %"float_to_double_lhs.3", %"ptr_load.5"
  %"x.12" = load double*, double** %"x.addr"
  %".63" = sub i32 192, 1
  %".64" = mul i32 %".63", 256
  %"i.15" = load i32, i32* %"i"
  %".65" = add i32 %".64", %"i.15"
  %".66" = getelementptr inbounds double, double* %"x.12", i32 %".65"
  store double %".62", double* %".66"
  br label %"ifcont.1"
else.1:
  %"x.13" = load double*, double** %"x.addr"
  %"i.16" = load i32, i32* %"i"
  %".69" = add i32 %"i.16", 256
  %"ptr_gep.6" = getelementptr inbounds double, double* %"x.13", i32 %".69"
  %"ptr_load.6" = load double, double* %"ptr_gep.6"
  %"x.14" = load double*, double** %"x.addr"
  %"i.17" = load i32, i32* %"i"
  %".70" = getelementptr inbounds double, double* %"x.14", i32 %"i.17"
  store double %"ptr_load.6", double* %".70"
  %"x.15" = load double*, double** %"x.addr"
  %".72" = sub i32 192, 2
  %".73" = mul i32 %".72", 256
  %"i.18" = load i32, i32* %"i"
  %".74" = add i32 %".73", %"i.18"
  %"ptr_gep.7" = getelementptr inbounds double, double* %"x.15", i32 %".74"
  %"ptr_load.7" = load double, double* %"ptr_gep.7"
  %"x.16" = load double*, double** %"x.addr"
  %".75" = sub i32 192, 1
  %".76" = mul i32 %".75", 256
  %"i.19" = load i32, i32* %"i"
  %".77" = add i32 %".76", %"i.19"
  %".78" = getelementptr inbounds double, double* %"x.16", i32 %".77"
  store double %"ptr_load.7", double* %".78"
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update.1"
}

define void @"linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start", i32 %"row_end", i32 %"color", double* %"x", double* %"x0", double %"a", double %"c_inv")
{
entry:
  %"row_start.addr" = alloca i32
  store i32 %"row_start", i32* %"row_start.addr"
  %"row_end.addr" = alloca i32
  store i32 %"row_end", i32* %"row_end.addr"
  %"color.addr" = alloca i32
  store i32 %"color", i32* %"color.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"a.addr" = alloca double
  store double %"a", double* %"a.addr"
  %"c_inv.addr" = alloca double
  store double %"c_inv", double* %"c_inv.addr"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"i_start" = alloca i32
  store i32 0, i32* %"i_start"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"row_start.1" = load i32, i32* %"row_start.addr"
  store i32 %"row_start.1", i32* %"jstart"
  %"row_end.1" = load i32, i32* %"row_end.addr"
  store i32 %"row_end.1", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".24" = icmp slt i32 %"jstart.1", 1
  br i1 %".24", label %"then", label %"else"
then:
  store i32 1, i32* %"jstart"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"jend.1" = load i32, i32* %"jend"
  %".29" = sub i32 192, 1
  %".30" = icmp sgt i32 %"jend.1", %".29"
  br i1 %".30", label %"then.1", label %"else.1"
then.1:
  %".32" = sub i32 192, 1
  store i32 %".32", i32* %"jend"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".38" = icmp slt i32 %"j.1", %"jend.2"
  br i1 %".38", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".40" = mul i32 %"j.2", 256
  store i32 %".40", i32* %"base"
  %"j.3" = load i32, i32* %"j"
  %"color.1" = load i32, i32* %"color.addr"
  %".42" = add i32 %"j.3", %"color.1"
  %".43" = add i32 %".42", 1
  %".44" = and i32 %".43", 1
  %".45" = add i32 1, %".44"
  store i32 %".45", i32* %"i_start"
  %"i_start.1" = load i32, i32* %"i_start"
  store i32 %"i_start.1", i32* %"i"
  br label %"while.cond"
for.update:
  %"j.4" = load i32, i32* %"j"
  %".74" = add i32 %"j.4", 1
  store i32 %".74", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".49" = sub i32 256, 1
  %".50" = icmp slt i32 %"i.1", %".49"
  br i1 %".50", label %"while.body", label %"while.end"
while.body:
  %"x0.1" = load double*, double** %"x0.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".52" = add i32 %"base.1", %"i.2"
  %"ptr_gep" = getelementptr inbounds double, double* %"x0.1", i32 %".52"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"a.1" = load double, double* %"a.addr"
  %"x.1" = load double*, double** %"x.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".53" = add i32 %"base.2", %"i.3"
  %".54" = sub i32 %".53", 1
  %"ptr_gep.1" = getelementptr inbounds double, double* %"x.1", i32 %".54"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"x.2" = load double*, double** %"x.addr"
  %"base.3" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".55" = add i32 %"base.3", %"i.4"
  %".56" = add i32 %".55", 1
  %"ptr_gep.2" = getelementptr inbounds double, double* %"x.2", i32 %".56"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".57" = fadd double %"ptr_load.1", %"ptr_load.2"
  %"x.3" = load double*, double** %"x.addr"
  %"base.4" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".58" = add i32 %"base.4", %"i.5"
  %".59" = sub i32 %".58", 256
  %"ptr_gep.3" = getelementptr inbounds double, double* %"x.3", i32 %".59"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %".60" = fadd double %".57", %"ptr_load.3"
  %"x.4" = load double*, double** %"x.addr"
  %"base.5" = load i32, i32* %"base"
  %"i.6" = load i32, i32* %"i"
  %".61" = add i32 %"base.5", %"i.6"
  %".62" = add i32 %".61", 256
  %"ptr_gep.4" = getelementptr inbounds double, double* %"x.4", i32 %".62"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %".63" = fadd double %".60", %"ptr_load.4"
  %".64" = fmul double %"a.1", %".63"
  %".65" = fadd double %"ptr_load", %".64"
  %"c_inv.1" = load double, double* %"c_inv.addr"
  %".66" = fmul double %".65", %"c_inv.1"
  %"x.5" = load double*, double** %"x.addr"
  %"base.6" = load i32, i32* %"base"
  %"i.7" = load i32, i32* %"i"
  %".67" = add i32 %"base.6", %"i.7"
  %".68" = getelementptr inbounds double, double* %"x.5", i32 %".67"
  store double %".66", double* %".68"
  %"i.8" = load i32, i32* %"i"
  %".70" = add i32 %"i.8", 2
  store i32 %".70", i32* %"i"
  br label %"while.cond"
while.end:
  br label %"for.update"
}

define void @"advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start", i32 %"row_end", double* %"d", double* %"d0", double* %"u", double* %"v")
{
entry:
  %"row_start.addr" = alloca i32
  store i32 %"row_start", i32* %"row_start.addr"
  %"row_end.addr" = alloca i32
  store i32 %"row_end", i32* %"row_end.addr"
  %"d.addr" = alloca double*
  store double* %"d", double** %"d.addr"
  %"d0.addr" = alloca double*
  store double* %"d0", double** %"d0.addr"
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"dt0x" = alloca double
  store double              0x0, double* %"dt0x"
  %"dt0y" = alloca double
  store double              0x0, double* %"dt0y"
  %"max_x" = alloca double
  store double              0x0, double* %"max_x"
  %"max_y" = alloca double
  store double              0x0, double* %"max_y"
  %"bx" = alloca double
  store double              0x0, double* %"bx"
  %"by" = alloca double
  store double              0x0, double* %"by"
  %"s0" = alloca double
  store double              0x0, double* %"s0"
  %"s1" = alloca double
  store double              0x0, double* %"s1"
  %"t0" = alloca double
  store double              0x0, double* %"t0"
  %"t1" = alloca double
  store double              0x0, double* %"t1"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"i0" = alloca i32
  store i32 0, i32* %"i0"
  %"j0" = alloca i32
  store i32 0, i32* %"j0"
  %"i1" = alloca i32
  store i32 0, i32* %"i1"
  %"j1" = alloca i32
  store i32 0, i32* %"j1"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"base00" = alloca i32
  store i32 0, i32* %"base00"
  %"base01" = alloca i32
  store i32 0, i32* %"base01"
  %".35" = sub i32 256, 2
  %".36" = sitofp i32 %".35" to double
  %"float_to_double_lhs" = fpext float 0x3fb99999a0000000 to double
  %".37" = fmul double %"float_to_double_lhs", %".36"
  store double %".37", double* %"dt0x"
  %".39" = sub i32 192, 2
  %".40" = sitofp i32 %".39" to double
  %"float_to_double_lhs.1" = fpext float 0x3fb99999a0000000 to double
  %".41" = fmul double %"float_to_double_lhs.1", %".40"
  store double %".41", double* %"dt0y"
  %".43" = sub i32 256, 2
  %".44" = sitofp i32 %".43" to double
  %"float_to_double_rhs" = fpext float 0x3fe0000000000000 to double
  %".45" = fadd double %".44", %"float_to_double_rhs"
  store double %".45", double* %"max_x"
  %".47" = sub i32 192, 2
  %".48" = sitofp i32 %".47" to double
  %"float_to_double_rhs.1" = fpext float 0x3fe0000000000000 to double
  %".49" = fadd double %".48", %"float_to_double_rhs.1"
  store double %".49", double* %"max_y"
  %"row_start.1" = load i32, i32* %"row_start.addr"
  store i32 %"row_start.1", i32* %"jstart"
  %"row_end.1" = load i32, i32* %"row_end.addr"
  store i32 %"row_end.1", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".53" = icmp slt i32 %"jstart.1", 1
  br i1 %".53", label %"then", label %"else"
then:
  store i32 1, i32* %"jstart"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"jend.1" = load i32, i32* %"jend"
  %".58" = sub i32 192, 1
  %".59" = icmp sgt i32 %"jend.1", %".58"
  br i1 %".59", label %"then.1", label %"else.1"
then.1:
  %".61" = sub i32 192, 1
  store i32 %".61", i32* %"jend"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".67" = icmp slt i32 %"j.1", %"jend.2"
  br i1 %".67", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".69" = mul i32 %"j.2", 256
  store i32 %".69", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.4" = load i32, i32* %"j"
  %".149" = add i32 %"j.4", 1
  store i32 %".149", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".73" = sub i32 256, 1
  %".74" = icmp slt i32 %"i.1", %".73"
  br i1 %".74", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"i.2" = load i32, i32* %"i"
  %".76" = sitofp i32 %"i.2" to double
  %"dt0x.1" = load double, double* %"dt0x"
  %"u.1" = load double*, double** %"u.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".77" = add i32 %"base.1", %"i.3"
  %"ptr_gep" = getelementptr inbounds double, double* %"u.1", i32 %".77"
  %"ptr_load" = load double, double* %"ptr_gep"
  %".78" = fmul double %"dt0x.1", %"ptr_load"
  %".79" = fsub double %".76", %".78"
  store double %".79", double* %"bx"
  %"j.3" = load i32, i32* %"j"
  %".81" = sitofp i32 %"j.3" to double
  %"dt0y.1" = load double, double* %"dt0y"
  %"v.1" = load double*, double** %"v.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".82" = add i32 %"base.2", %"i.4"
  %"ptr_gep.1" = getelementptr inbounds double, double* %"v.1", i32 %".82"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %".83" = fmul double %"dt0y.1", %"ptr_load.1"
  %".84" = fsub double %".81", %".83"
  store double %".84", double* %"by"
  %"bx.1" = load double, double* %"bx"
  %"float_to_double_rhs.2" = fpext float 0x3fe0000000000000 to double
  %".86" = fcmp olt double %"bx.1", %"float_to_double_rhs.2"
  br i1 %".86", label %"then.2", label %"else.2"
for.update.1:
  %"i.6" = load i32, i32* %"i"
  %".145" = add i32 %"i.6", 1
  store i32 %".145", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
then.2:
  %"f32_to_f64" = fpext float 0x3fe0000000000000 to double
  store double %"f32_to_f64", double* %"bx"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"bx.2" = load double, double* %"bx"
  %"max_x.1" = load double, double* %"max_x"
  %".91" = fcmp ogt double %"bx.2", %"max_x.1"
  br i1 %".91", label %"then.3", label %"else.3"
then.3:
  %"max_x.2" = load double, double* %"max_x"
  store double %"max_x.2", double* %"bx"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"by.1" = load double, double* %"by"
  %"float_to_double_rhs.3" = fpext float 0x3fe0000000000000 to double
  %".96" = fcmp olt double %"by.1", %"float_to_double_rhs.3"
  br i1 %".96", label %"then.4", label %"else.4"
then.4:
  %"f32_to_f64.1" = fpext float 0x3fe0000000000000 to double
  store double %"f32_to_f64.1", double* %"by"
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"by.2" = load double, double* %"by"
  %"max_y.1" = load double, double* %"max_y"
  %".101" = fcmp ogt double %"by.2", %"max_y.1"
  br i1 %".101", label %"then.5", label %"else.5"
then.5:
  %"max_y.2" = load double, double* %"max_y"
  store double %"max_y.2", double* %"by"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"bx.3" = load double, double* %"bx"
  %".106" = fptosi double %"bx.3" to i32
  store i32 %".106", i32* %"i0"
  %"by.3" = load double, double* %"by"
  %".108" = fptosi double %"by.3" to i32
  store i32 %".108", i32* %"j0"
  %"i0.1" = load i32, i32* %"i0"
  %".110" = add i32 %"i0.1", 1
  store i32 %".110", i32* %"i1"
  %"j0.1" = load i32, i32* %"j0"
  %".112" = add i32 %"j0.1", 1
  store i32 %".112", i32* %"j1"
  %"bx.4" = load double, double* %"bx"
  %"i0.2" = load i32, i32* %"i0"
  %".114" = sitofp i32 %"i0.2" to double
  %".115" = fsub double %"bx.4", %".114"
  store double %".115", double* %"s1"
  %"s1.1" = load double, double* %"s1"
  %"float_to_double_lhs.2" = fpext float 0x3ff0000000000000 to double
  %".117" = fsub double %"float_to_double_lhs.2", %"s1.1"
  store double %".117", double* %"s0"
  %"by.4" = load double, double* %"by"
  %"j0.2" = load i32, i32* %"j0"
  %".119" = sitofp i32 %"j0.2" to double
  %".120" = fsub double %"by.4", %".119"
  store double %".120", double* %"t1"
  %"t1.1" = load double, double* %"t1"
  %"float_to_double_lhs.3" = fpext float 0x3ff0000000000000 to double
  %".122" = fsub double %"float_to_double_lhs.3", %"t1.1"
  store double %".122", double* %"t0"
  %"j0.3" = load i32, i32* %"j0"
  %".124" = mul i32 %"j0.3", 256
  store i32 %".124", i32* %"base00"
  %"j1.1" = load i32, i32* %"j1"
  %".126" = mul i32 %"j1.1", 256
  store i32 %".126", i32* %"base01"
  %"s0.1" = load double, double* %"s0"
  %"t0.1" = load double, double* %"t0"
  %"d0.1" = load double*, double** %"d0.addr"
  %"base00.1" = load i32, i32* %"base00"
  %"i0.3" = load i32, i32* %"i0"
  %".128" = add i32 %"base00.1", %"i0.3"
  %"ptr_gep.2" = getelementptr inbounds double, double* %"d0.1", i32 %".128"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".129" = fmul double %"t0.1", %"ptr_load.2"
  %"t1.2" = load double, double* %"t1"
  %"d0.2" = load double*, double** %"d0.addr"
  %"base01.1" = load i32, i32* %"base01"
  %"i0.4" = load i32, i32* %"i0"
  %".130" = add i32 %"base01.1", %"i0.4"
  %"ptr_gep.3" = getelementptr inbounds double, double* %"d0.2", i32 %".130"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %".131" = fmul double %"t1.2", %"ptr_load.3"
  %".132" = fadd double %".129", %".131"
  %".133" = fmul double %"s0.1", %".132"
  %"s1.2" = load double, double* %"s1"
  %"t0.2" = load double, double* %"t0"
  %"d0.3" = load double*, double** %"d0.addr"
  %"base00.2" = load i32, i32* %"base00"
  %"i1.1" = load i32, i32* %"i1"
  %".134" = add i32 %"base00.2", %"i1.1"
  %"ptr_gep.4" = getelementptr inbounds double, double* %"d0.3", i32 %".134"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %".135" = fmul double %"t0.2", %"ptr_load.4"
  %"t1.3" = load double, double* %"t1"
  %"d0.4" = load double*, double** %"d0.addr"
  %"base01.2" = load i32, i32* %"base01"
  %"i1.2" = load i32, i32* %"i1"
  %".136" = add i32 %"base01.2", %"i1.2"
  %"ptr_gep.5" = getelementptr inbounds double, double* %"d0.4", i32 %".136"
  %"ptr_load.5" = load double, double* %"ptr_gep.5"
  %".137" = fmul double %"t1.3", %"ptr_load.5"
  %".138" = fadd double %".135", %".137"
  %".139" = fmul double %"s1.2", %".138"
  %".140" = fadd double %".133", %".139"
  %"d.1" = load double*, double** %"d.addr"
  %"base.3" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".141" = add i32 %"base.3", %"i.5"
  %".142" = getelementptr inbounds double, double* %"d.1", i32 %".141"
  store double %".140", double* %".142"
  br label %"for.update.1"
}

define void @"project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start", i32 %"row_end", double* %"u", double* %"v", double* %"p", double* %"div", double %"hx", double %"hy")
{
entry:
  %"row_start.addr" = alloca i32
  store i32 %"row_start", i32* %"row_start.addr"
  %"row_end.addr" = alloca i32
  store i32 %"row_end", i32* %"row_end.addr"
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"p.addr" = alloca double*
  store double* %"p", double** %"p.addr"
  %"div.addr" = alloca double*
  store double* %"div", double** %"div.addr"
  %"hx.addr" = alloca double
  store double %"hx", double* %"hx.addr"
  %"hy.addr" = alloca double
  store double %"hy", double* %"hy.addr"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"row_start.1" = load i32, i32* %"row_start.addr"
  store i32 %"row_start.1", i32* %"jstart"
  %"row_end.1" = load i32, i32* %"row_end.addr"
  store i32 %"row_end.1", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".25" = icmp slt i32 %"jstart.1", 1
  br i1 %".25", label %"then", label %"else"
then:
  store i32 1, i32* %"jstart"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"jend.1" = load i32, i32* %"jend"
  %".30" = sub i32 192, 1
  %".31" = icmp sgt i32 %"jend.1", %".30"
  br i1 %".31", label %"then.1", label %"else.1"
then.1:
  %".33" = sub i32 192, 1
  store i32 %".33", i32* %"jend"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".39" = icmp slt i32 %"j.1", %"jend.2"
  br i1 %".39", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".41" = mul i32 %"j.2", 256
  store i32 %".41", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.3" = load i32, i32* %"j"
  %".74" = add i32 %"j.3", 1
  store i32 %".74", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".45" = sub i32 256, 1
  %".46" = icmp slt i32 %"i.1", %".45"
  br i1 %".46", label %"for.body.1", label %"for.end.1"
for.body.1:
  %".48" = fsub float              0x0, 0x3fe0000000000000
  %"hx.1" = load double, double* %"hx.addr"
  %"u.1" = load double*, double** %"u.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".49" = add i32 %"base.1", %"i.2"
  %".50" = add i32 %".49", 1
  %"ptr_gep" = getelementptr inbounds double, double* %"u.1", i32 %".50"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"u.2" = load double*, double** %"u.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".51" = add i32 %"base.2", %"i.3"
  %".52" = sub i32 %".51", 1
  %"ptr_gep.1" = getelementptr inbounds double, double* %"u.2", i32 %".52"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %".53" = fsub double %"ptr_load", %"ptr_load.1"
  %".54" = fmul double %"hx.1", %".53"
  %"hy.1" = load double, double* %"hy.addr"
  %"v.1" = load double*, double** %"v.addr"
  %"base.3" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".55" = add i32 %"base.3", %"i.4"
  %".56" = add i32 %".55", 256
  %"ptr_gep.2" = getelementptr inbounds double, double* %"v.1", i32 %".56"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"v.2" = load double*, double** %"v.addr"
  %"base.4" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".57" = add i32 %"base.4", %"i.5"
  %".58" = sub i32 %".57", 256
  %"ptr_gep.3" = getelementptr inbounds double, double* %"v.2", i32 %".58"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %".59" = fsub double %"ptr_load.2", %"ptr_load.3"
  %".60" = fmul double %"hy.1", %".59"
  %".61" = fadd double %".54", %".60"
  %"float_to_double_lhs" = fpext float %".48" to double
  %".62" = fmul double %"float_to_double_lhs", %".61"
  %"div.1" = load double*, double** %"div.addr"
  %"base.5" = load i32, i32* %"base"
  %"i.6" = load i32, i32* %"i"
  %".63" = add i32 %"base.5", %"i.6"
  %".64" = getelementptr inbounds double, double* %"div.1", i32 %".63"
  store double %".62", double* %".64"
  %"p.1" = load double*, double** %"p.addr"
  %"base.6" = load i32, i32* %"base"
  %"i.7" = load i32, i32* %"i"
  %".66" = add i32 %"base.6", %"i.7"
  %".67" = getelementptr inbounds double, double* %"p.1", i32 %".66"
  %"f32_to_f64" = fpext float              0x0 to double
  store double %"f32_to_f64", double* %".67"
  br label %"for.update.1"
for.update.1:
  %"i.8" = load i32, i32* %"i"
  %".70" = add i32 %"i.8", 1
  store i32 %".70", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
}

define void @"project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start", i32 %"row_end", double* %"u", double* %"v", double* %"p", double %"hx_inv", double %"hy_inv")
{
entry:
  %"row_start.addr" = alloca i32
  store i32 %"row_start", i32* %"row_start.addr"
  %"row_end.addr" = alloca i32
  store i32 %"row_end", i32* %"row_end.addr"
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"p.addr" = alloca double*
  store double* %"p", double** %"p.addr"
  %"hx_inv.addr" = alloca double
  store double %"hx_inv", double* %"hx_inv.addr"
  %"hy_inv.addr" = alloca double
  store double %"hy_inv", double* %"hy_inv.addr"
  %"jstart" = alloca i32
  store i32 0, i32* %"jstart"
  %"jend" = alloca i32
  store i32 0, i32* %"jend"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"row_start.1" = load i32, i32* %"row_start.addr"
  store i32 %"row_start.1", i32* %"jstart"
  %"row_end.1" = load i32, i32* %"row_end.addr"
  store i32 %"row_end.1", i32* %"jend"
  %"jstart.1" = load i32, i32* %"jstart"
  %".23" = icmp slt i32 %"jstart.1", 1
  br i1 %".23", label %"then", label %"else"
then:
  store i32 1, i32* %"jstart"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"jend.1" = load i32, i32* %"jend"
  %".28" = sub i32 192, 1
  %".29" = icmp sgt i32 %"jend.1", %".28"
  br i1 %".29", label %"then.1", label %"else.1"
then.1:
  %".31" = sub i32 192, 1
  store i32 %".31", i32* %"jend"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"jstart.2" = load i32, i32* %"jstart"
  store i32 %"jstart.2", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"jend.2" = load i32, i32* %"jend"
  %".37" = icmp slt i32 %"j.1", %"jend.2"
  br i1 %".37", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".39" = mul i32 %"j.2", 256
  store i32 %".39", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.3" = load i32, i32* %"j"
  %".75" = add i32 %"j.3", 1
  store i32 %".75", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".43" = sub i32 256, 1
  %".44" = icmp slt i32 %"i.1", %".43"
  br i1 %".44", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"u.1" = load double*, double** %"u.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".46" = add i32 %"base.1", %"i.2"
  %"ptr_gep" = getelementptr inbounds double, double* %"u.1", i32 %".46"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"p.1" = load double*, double** %"p.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".47" = add i32 %"base.2", %"i.3"
  %".48" = add i32 %".47", 1
  %"ptr_gep.1" = getelementptr inbounds double, double* %"p.1", i32 %".48"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"p.2" = load double*, double** %"p.addr"
  %"base.3" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".49" = add i32 %"base.3", %"i.4"
  %".50" = sub i32 %".49", 1
  %"ptr_gep.2" = getelementptr inbounds double, double* %"p.2", i32 %".50"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %".51" = fsub double %"ptr_load.1", %"ptr_load.2"
  %"float_to_double_lhs" = fpext float 0x3fe0000000000000 to double
  %".52" = fmul double %"float_to_double_lhs", %".51"
  %"hx_inv.1" = load double, double* %"hx_inv.addr"
  %".53" = fmul double %".52", %"hx_inv.1"
  %".54" = fsub double %"ptr_load", %".53"
  %"u.2" = load double*, double** %"u.addr"
  %"base.4" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".55" = add i32 %"base.4", %"i.5"
  %".56" = getelementptr inbounds double, double* %"u.2", i32 %".55"
  store double %".54", double* %".56"
  %"v.1" = load double*, double** %"v.addr"
  %"base.5" = load i32, i32* %"base"
  %"i.6" = load i32, i32* %"i"
  %".58" = add i32 %"base.5", %"i.6"
  %"ptr_gep.3" = getelementptr inbounds double, double* %"v.1", i32 %".58"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %"p.3" = load double*, double** %"p.addr"
  %"base.6" = load i32, i32* %"base"
  %"i.7" = load i32, i32* %"i"
  %".59" = add i32 %"base.6", %"i.7"
  %".60" = add i32 %".59", 256
  %"ptr_gep.4" = getelementptr inbounds double, double* %"p.3", i32 %".60"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %"p.4" = load double*, double** %"p.addr"
  %"base.7" = load i32, i32* %"base"
  %"i.8" = load i32, i32* %"i"
  %".61" = add i32 %"base.7", %"i.8"
  %".62" = sub i32 %".61", 256
  %"ptr_gep.5" = getelementptr inbounds double, double* %"p.4", i32 %".62"
  %"ptr_load.5" = load double, double* %"ptr_gep.5"
  %".63" = fsub double %"ptr_load.4", %"ptr_load.5"
  %"float_to_double_lhs.1" = fpext float 0x3fe0000000000000 to double
  %".64" = fmul double %"float_to_double_lhs.1", %".63"
  %"hy_inv.1" = load double, double* %"hy_inv.addr"
  %".65" = fmul double %".64", %"hy_inv.1"
  %".66" = fsub double %"ptr_load.3", %".65"
  %"v.2" = load double*, double** %"v.addr"
  %"base.8" = load i32, i32* %"base"
  %"i.9" = load i32, i32* %"i"
  %".67" = add i32 %"base.8", %"i.9"
  %".68" = getelementptr inbounds double, double* %"v.2", i32 %".67"
  store double %".66", double* %".68"
  br label %"for.update.1"
for.update.1:
  %"i.10" = load i32, i32* %"i"
  %".71" = add i32 %"i.10", 1
  store i32 %".71", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
}

define void @"decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start", i32 %"row_end", double* %"dens")
{
entry:
  %"row_start.addr" = alloca i32
  store i32 %"row_start", i32* %"row_start.addr"
  %"row_end.addr" = alloca i32
  store i32 %"row_end", i32* %"row_end.addr"
  %"dens.addr" = alloca double*
  store double* %"dens", double** %"dens.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"d" = alloca double
  store double              0x0, double* %"d"
  %"row_start.1" = load i32, i32* %"row_start.addr"
  store i32 %"row_start.1", i32* %"j"
  br label %"for.cond"
for.cond:
  %"j.1" = load i32, i32* %"j"
  %"row_end.1" = load i32, i32* %"row_end.addr"
  %".14" = icmp slt i32 %"j.1", %"row_end.1"
  br i1 %".14", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".16" = mul i32 %"j.2", 256
  store i32 %".16", i32* %"base"
  store i32 0, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.3" = load i32, i32* %"j"
  %".38" = add i32 %"j.3", 1
  store i32 %".38", i32* %"j"
  br label %"for.cond"
for.end:
  ret void
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".20" = icmp slt i32 %"i.1", 256
  br i1 %".20", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"dens.1" = load double*, double** %"dens.addr"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".22" = add i32 %"base.1", %"i.2"
  %"ptr_gep" = getelementptr inbounds double, double* %"dens.1", i32 %".22"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"float_to_double_rhs" = fpext float 0x3feffe5ca0000000 to double
  %".23" = fmul double %"ptr_load", %"float_to_double_rhs"
  store double %".23", double* %"d"
  %"d.1" = load double, double* %"d"
  %"float_to_double_rhs.1" = fpext float 0x3f1a36e2e0000000 to double
  %".25" = fcmp olt double %"d.1", %"float_to_double_rhs.1"
  br i1 %".25", label %"then", label %"else"
for.update.1:
  %"i.4" = load i32, i32* %"i"
  %".34" = add i32 %"i.4", 1
  store i32 %".34", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
then:
  %"f32_to_f64" = fpext float              0x0 to double
  store double %"f32_to_f64", double* %"d"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"d.2" = load double, double* %"d"
  %"dens.2" = load double*, double** %"dens.addr"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".30" = add i32 %"base.2", %"i.3"
  %".31" = getelementptr inbounds double, double* %"dens.2", i32 %".30"
  store double %"d.2", double* %".31"
  br label %"for.update.1"
}

define void @"particles_init__0__ret_voidE1"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".5" = icmp slt i32 %"i.1", 7500
  br i1 %".5", label %"for.body", label %"for.end"
for.body:
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".7" = mul i32 %"g_rand_seed", 1664525
  %".8" = add i32 %".7", 1013904223
  store i32 %".8", i32* @"g_rand_seed"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".10" = and i32 %"g_rand_seed.1", 2147483647
  %".11" = sitofp i32 %".10" to float
  %".12" = sitofp i32 2147483647 to float
  %".13" = fdiv float %".11", %".12"
  %".14" = sitofp i32 256 to float
  %".15" = fmul float %".13", %".14"
  %"g_part_x" = load float*, float** @"g_part_x"
  %"i.2" = load i32, i32* %"i"
  %".16" = getelementptr inbounds float, float* %"g_part_x", i32 %"i.2"
  store float %".15", float* %".16"
  %"g_rand_seed.2" = load i32, i32* @"g_rand_seed"
  %".18" = mul i32 %"g_rand_seed.2", 1664525
  %".19" = add i32 %".18", 1013904223
  store i32 %".19", i32* @"g_rand_seed"
  %"g_rand_seed.3" = load i32, i32* @"g_rand_seed"
  %".21" = and i32 %"g_rand_seed.3", 2147483647
  %".22" = sitofp i32 %".21" to float
  %".23" = sitofp i32 2147483647 to float
  %".24" = fdiv float %".22", %".23"
  %".25" = sitofp i32 192 to float
  %".26" = fmul float %".24", %".25"
  %"g_part_y" = load float*, float** @"g_part_y"
  %"i.3" = load i32, i32* %"i"
  %".27" = getelementptr inbounds float, float* %"g_part_y", i32 %"i.3"
  store float %".26", float* %".27"
  br label %"for.update"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".30" = add i32 %"i.4", 1
  store i32 %".30", i32* %"i"
  br label %"for.cond"
for.end:
  ret void
}

define void @"particles_update__0__ret_voidE1"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"pi" = alloca i32
  store i32 0, i32* %"pi"
  %"pj" = alloca i32
  store i32 0, i32* %"pj"
  %"px" = alloca float
  store float              0x0, float* %"px"
  %"py" = alloca float
  store float              0x0, float* %"py"
  %"vx" = alloca float
  store float              0x0, float* %"vx"
  %"vy" = alloca float
  store float              0x0, float* %"vy"
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".11" = icmp slt i32 %"i.1", 7500
  br i1 %".11", label %"for.body", label %"for.end"
for.body:
  %"g_part_x" = load float*, float** @"g_part_x"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds float, float* %"g_part_x", i32 %"i.2"
  %"ptr_load" = load float, float* %"ptr_gep"
  store float %"ptr_load", float* %"px"
  %"g_part_y" = load float*, float** @"g_part_y"
  %"i.3" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds float, float* %"g_part_y", i32 %"i.3"
  %"ptr_load.1" = load float, float* %"ptr_gep.1"
  store float %"ptr_load.1", float* %"py"
  %"px.1" = load float, float* %"px"
  %".15" = fptosi float %"px.1" to i32
  store i32 %".15", i32* %"pi"
  %"py.1" = load float, float* %"py"
  %".17" = fptosi float %"py.1" to i32
  store i32 %".17", i32* %"pj"
  %"pi.1" = load i32, i32* %"pi"
  %".19" = icmp slt i32 %"pi.1", 1
  br i1 %".19", label %"then", label %"else"
for.update:
  %"i.6" = load i32, i32* %"i"
  %".110" = add i32 %"i.6", 1
  store i32 %".110", i32* %"i"
  br label %"for.cond"
for.end:
  ret void
then:
  store i32 1, i32* %"pi"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"pi.2" = load i32, i32* %"pi"
  %".24" = sub i32 256, 2
  %".25" = icmp sgt i32 %"pi.2", %".24"
  br i1 %".25", label %"then.1", label %"else.1"
then.1:
  %".27" = sub i32 256, 2
  store i32 %".27", i32* %"pi"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"pj.1" = load i32, i32* %"pj"
  %".31" = icmp slt i32 %"pj.1", 1
  br i1 %".31", label %"then.2", label %"else.2"
then.2:
  store i32 1, i32* %"pj"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"pj.2" = load i32, i32* %"pj"
  %".36" = sub i32 192, 2
  %".37" = icmp sgt i32 %"pj.2", %".36"
  br i1 %".37", label %"then.3", label %"else.3"
then.3:
  %".39" = sub i32 192, 2
  store i32 %".39", i32* %"pj"
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"g_vx" = load double*, double** @"g_vx"
  %"pj.3" = load i32, i32* %"pj"
  %".43" = mul i32 %"pj.3", 256
  %"pi.3" = load i32, i32* %"pi"
  %".44" = add i32 %".43", %"pi.3"
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_vx", i32 %".44"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"float_to_double_rhs" = fpext float 0x402e000000000000 to double
  %".45" = fmul double %"ptr_load.2", %"float_to_double_rhs"
  %".46" = fptrunc double %".45" to float
  store float %".46", float* %"vx"
  %"g_vy" = load double*, double** @"g_vy"
  %"pj.4" = load i32, i32* %"pj"
  %".48" = mul i32 %"pj.4", 256
  %"pi.4" = load i32, i32* %"pi"
  %".49" = add i32 %".48", %"pi.4"
  %"ptr_gep.3" = getelementptr inbounds double, double* %"g_vy", i32 %".49"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %"float_to_double_rhs.1" = fpext float 0x402e000000000000 to double
  %".50" = fmul double %"ptr_load.3", %"float_to_double_rhs.1"
  %".51" = fptrunc double %".50" to float
  store float %".51", float* %"vy"
  %"g_rand_seed" = load i32, i32* @"g_rand_seed"
  %".53" = mul i32 %"g_rand_seed", 1664525
  %".54" = add i32 %".53", 1013904223
  store i32 %".54", i32* @"g_rand_seed"
  %"vx.1" = load float, float* %"vx"
  %"g_rand_seed.1" = load i32, i32* @"g_rand_seed"
  %".56" = and i32 %"g_rand_seed.1", 255
  %".57" = sub i32 %".56", 128
  %".58" = sitofp i32 %".57" to float
  %".59" = fmul float %".58", 0x3f50624de0000000
  %".60" = fadd float %"vx.1", %".59"
  store float %".60", float* %"vx"
  %"g_rand_seed.2" = load i32, i32* @"g_rand_seed"
  %".62" = mul i32 %"g_rand_seed.2", 1664525
  %".63" = add i32 %".62", 1013904223
  store i32 %".63", i32* @"g_rand_seed"
  %"vy.1" = load float, float* %"vy"
  %"g_rand_seed.3" = load i32, i32* @"g_rand_seed"
  %".65" = and i32 %"g_rand_seed.3", 255
  %".66" = sub i32 %".65", 128
  %".67" = sitofp i32 %".66" to float
  %".68" = fmul float %".67", 0x3f50624de0000000
  %".69" = fadd float %"vy.1", %".68"
  store float %".69", float* %"vy"
  %"px.2" = load float, float* %"px"
  %"vx.2" = load float, float* %"vx"
  %".71" = fadd float %"px.2", %"vx.2"
  store float %".71", float* %"px"
  %"py.2" = load float, float* %"py"
  %"vy.2" = load float, float* %"vy"
  %".73" = fadd float %"py.2", %"vy.2"
  store float %".73", float* %"py"
  %"px.3" = load float, float* %"px"
  %".75" = fcmp olt float %"px.3",              0x0
  br i1 %".75", label %"then.4", label %"else.4"
then.4:
  %"px.4" = load float, float* %"px"
  %".77" = sitofp i32 256 to float
  %".78" = fadd float %"px.4", %".77"
  store float %".78", float* %"px"
  br label %"ifcont.4"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"px.5" = load float, float* %"px"
  %".82" = sitofp i32 256 to float
  %".83" = fcmp oge float %"px.5", %".82"
  br i1 %".83", label %"then.5", label %"else.5"
then.5:
  %"px.6" = load float, float* %"px"
  %".85" = sitofp i32 256 to float
  %".86" = fsub float %"px.6", %".85"
  store float %".86", float* %"px"
  br label %"ifcont.5"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"py.3" = load float, float* %"py"
  %".90" = fcmp olt float %"py.3",              0x0
  br i1 %".90", label %"then.6", label %"else.6"
then.6:
  %"py.4" = load float, float* %"py"
  %".92" = sitofp i32 192 to float
  %".93" = fadd float %"py.4", %".92"
  store float %".93", float* %"py"
  br label %"ifcont.6"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"py.5" = load float, float* %"py"
  %".97" = sitofp i32 192 to float
  %".98" = fcmp oge float %"py.5", %".97"
  br i1 %".98", label %"then.7", label %"else.7"
then.7:
  %"py.6" = load float, float* %"py"
  %".100" = sitofp i32 192 to float
  %".101" = fsub float %"py.6", %".100"
  store float %".101", float* %"py"
  br label %"ifcont.7"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"px.7" = load float, float* %"px"
  %"g_part_x.1" = load float*, float** @"g_part_x"
  %"i.4" = load i32, i32* %"i"
  %".105" = getelementptr inbounds float, float* %"g_part_x.1", i32 %"i.4"
  store float %"px.7", float* %".105"
  %"py.7" = load float, float* %"py"
  %"g_part_y.1" = load float*, float** @"g_part_y"
  %"i.5" = load i32, i32* %"i"
  %".107" = getelementptr inbounds float, float* %"g_part_y.1", i32 %"i.5"
  store float %"py.7", float* %".107"
  br label %"for.update"
}

define i8* @"worker__1__voidE1_ptr1__ret_voidE1_ptr1"(i8* %"arg")
{
entry:
  %"arg.addr" = alloca i8*
  store i8* %"arg", i8** %"arg.addr"
  %"sl" = alloca %"WorkSlice"*
  store %"WorkSlice"* null, %"WorkSlice"** %"sl"
  %"arg.1" = load i8*, i8** %"arg.addr"
  %"from_void_ptr" = bitcast i8* %"arg.1" to %"WorkSlice"*
  store %"WorkSlice"* %"from_void_ptr", %"WorkSlice"** %"sl"
  br label %"while.cond"
while.cond:
  br i1 true, label %"while.body", label %"while.end"
while.body:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  call void @"standard__atomic__load_fence__0__ret_voidE1"()
  %"sl.1" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.2" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.2", i32 0, i32 2
  %"phase" = load i32, i32* %"phase_ptr"
  %"PHASE_EXIT" = load i32, i32* @"PHASE_EXIT"
  %".9" = icmp eq i32 %"phase", %"PHASE_EXIT"
  br i1 %".9", label %"then", label %"else"
while.end:
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to i8*
  ret i8* %"int_to_ptr.1"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr"
else:
  br label %"ifcont"
ifcont:
  %"sl.3" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.4" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.4", i32 0, i32 2
  %"phase.1" = load i32, i32* %"phase_ptr.1"
  %"PHASE_LINSOLVE_RED" = load i32, i32* @"PHASE_LINSOLVE_RED"
  %".13" = icmp eq i32 %"phase.1", %"PHASE_LINSOLVE_RED"
  br i1 %".13", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"sl.5" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.6" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.6", i32 0, i32 2
  %"phase.2" = load i32, i32* %"phase_ptr.2"
  %"PHASE_LINSOLVE_BLACK" = load i32, i32* @"PHASE_LINSOLVE_BLACK"
  %".15" = icmp eq i32 %"phase.2", %"PHASE_LINSOLVE_BLACK"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"ifcont"], [%".15", %"sc_rhs"]
  br i1 %"sc_result", label %"then.1", label %"else.1"
then.1:
  %"sl.7" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.8" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.8", i32 0, i32 0
  %"row_start" = load i32, i32* %"row_start_ptr"
  %"sl.9" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.10" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.10", i32 0, i32 1
  %"row_end" = load i32, i32* %"row_end_ptr"
  %"sl.11" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.12" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_color_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.12", i32 0, i32 3
  %"ls_color" = load i32, i32* %"ls_color_ptr"
  %"sl.13" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.14" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_x_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.14", i32 0, i32 4
  %"ls_x" = load double*, double** %"ls_x_ptr"
  %"sl.15" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.16" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_x0_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.16", i32 0, i32 5
  %"ls_x0" = load double*, double** %"ls_x0_ptr"
  %"sl.17" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.18" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_a_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.18", i32 0, i32 6
  %"ls_a" = load double, double* %"ls_a_ptr"
  %"sl.19" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.20" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_c_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.20", i32 0, i32 7
  %"ls_c_inv" = load double, double* %"ls_c_inv_ptr"
  call void @"linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start", i32 %"row_end", i32 %"ls_color", double* %"ls_x", double* %"ls_x0", double %"ls_a", double %"ls_c_inv")
  br label %"ifcont.1"
else.1:
  %"sl.21" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.22" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.22", i32 0, i32 2
  %"phase.3" = load i32, i32* %"phase_ptr.3"
  %"PHASE_ADVECT" = load i32, i32* @"PHASE_ADVECT"
  %".20" = icmp eq i32 %"phase.3", %"PHASE_ADVECT"
  br i1 %".20", label %"elif_then_0", label %"elif_else_0"
ifcont.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"while.cond"
elif_then_0:
  %"sl.23" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.24" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.24", i32 0, i32 0
  %"row_start.1" = load i32, i32* %"row_start_ptr.1"
  %"sl.25" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.26" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.26", i32 0, i32 1
  %"row_end.1" = load i32, i32* %"row_end_ptr.1"
  %"sl.27" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.28" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_dst_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.28", i32 0, i32 8
  %"adv_dst" = load double*, double** %"adv_dst_ptr"
  %"sl.29" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.30" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_src_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.30", i32 0, i32 9
  %"adv_src" = load double*, double** %"adv_src_ptr"
  %"sl.31" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.32" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_u_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.32", i32 0, i32 10
  %"adv_u" = load double*, double** %"adv_u_ptr"
  %"sl.33" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.34" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_v_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.34", i32 0, i32 11
  %"adv_v" = load double*, double** %"adv_v_ptr"
  call void @"advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start.1", i32 %"row_end.1", double* %"adv_dst", double* %"adv_src", double* %"adv_u", double* %"adv_v")
  br label %"ifcont.1"
elif_else_0:
  %"sl.35" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.36" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.36", i32 0, i32 2
  %"phase.4" = load i32, i32* %"phase_ptr.4"
  %"PHASE_PROJECT_DIV" = load i32, i32* @"PHASE_PROJECT_DIV"
  %".24" = icmp eq i32 %"phase.4", %"PHASE_PROJECT_DIV"
  br i1 %".24", label %"elif_then_1", label %"elif_else_1"
elif_then_1:
  %"sl.37" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.38" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.38", i32 0, i32 0
  %"row_start.2" = load i32, i32* %"row_start_ptr.2"
  %"sl.39" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.40" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.40", i32 0, i32 1
  %"row_end.2" = load i32, i32* %"row_end_ptr.2"
  %"sl.41" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.42" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_u_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.42", i32 0, i32 12
  %"proj_u" = load double*, double** %"proj_u_ptr"
  %"sl.43" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.44" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_v_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.44", i32 0, i32 13
  %"proj_v" = load double*, double** %"proj_v_ptr"
  %"sl.45" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.46" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_p_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.46", i32 0, i32 14
  %"proj_p" = load double*, double** %"proj_p_ptr"
  %"sl.47" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.48" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_div_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.48", i32 0, i32 15
  %"proj_div" = load double*, double** %"proj_div_ptr"
  %"sl.49" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.50" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hx_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.50", i32 0, i32 16
  %"proj_hx" = load double, double* %"proj_hx_ptr"
  %"sl.51" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.52" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hy_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.52", i32 0, i32 17
  %"proj_hy" = load double, double* %"proj_hy_ptr"
  call void @"project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start.2", i32 %"row_end.2", double* %"proj_u", double* %"proj_v", double* %"proj_p", double* %"proj_div", double %"proj_hx", double %"proj_hy")
  br label %"ifcont.1"
elif_else_1:
  %"sl.53" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.54" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.5" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.54", i32 0, i32 2
  %"phase.5" = load i32, i32* %"phase_ptr.5"
  %"PHASE_PROJECT_GRAD" = load i32, i32* @"PHASE_PROJECT_GRAD"
  %".28" = icmp eq i32 %"phase.5", %"PHASE_PROJECT_GRAD"
  br i1 %".28", label %"elif_then_2", label %"elif_else_2"
elif_then_2:
  %"sl.55" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.56" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.56", i32 0, i32 0
  %"row_start.3" = load i32, i32* %"row_start_ptr.3"
  %"sl.57" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.58" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.58", i32 0, i32 1
  %"row_end.3" = load i32, i32* %"row_end_ptr.3"
  %"sl.59" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.60" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_u_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.60", i32 0, i32 12
  %"proj_u.1" = load double*, double** %"proj_u_ptr.1"
  %"sl.61" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.62" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_v_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.62", i32 0, i32 13
  %"proj_v.1" = load double*, double** %"proj_v_ptr.1"
  %"sl.63" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.64" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_p_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.64", i32 0, i32 14
  %"proj_p.1" = load double*, double** %"proj_p_ptr.1"
  %"sl.65" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.66" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hx_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.66", i32 0, i32 18
  %"proj_hx_inv" = load double, double* %"proj_hx_inv_ptr"
  %"sl.67" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.68" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hy_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.68", i32 0, i32 19
  %"proj_hy_inv" = load double, double* %"proj_hy_inv_ptr"
  call void @"project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start.3", i32 %"row_end.3", double* %"proj_u.1", double* %"proj_v.1", double* %"proj_p.1", double %"proj_hx_inv", double %"proj_hy_inv")
  br label %"ifcont.1"
elif_else_2:
  %"sl.69" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.70" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.6" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.70", i32 0, i32 2
  %"phase.6" = load i32, i32* %"phase_ptr.6"
  %"PHASE_DECAY" = load i32, i32* @"PHASE_DECAY"
  %".32" = icmp eq i32 %"phase.6", %"PHASE_DECAY"
  br i1 %".32", label %"elif_then_3", label %"elif_else_3"
elif_then_3:
  %"sl.71" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.72" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.72", i32 0, i32 0
  %"row_start.4" = load i32, i32* %"row_start_ptr.4"
  %"sl.73" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.74" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.74", i32 0, i32 1
  %"row_end.4" = load i32, i32* %"row_end_ptr.4"
  %"sl.75" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.76" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"dp_dens_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.76", i32 0, i32 20
  %"dp_dens" = load double*, double** %"dp_dens_ptr"
  call void @"decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start.4", i32 %"row_end.4", double* %"dp_dens")
  br label %"ifcont.1"
elif_else_3:
  br label %"ifcont.1"
}

define i8* @"worker2__1__voidE1_ptr1__ret_voidE1_ptr1"(i8* %"arg")
{
entry:
  %"arg.addr" = alloca i8*
  store i8* %"arg", i8** %"arg.addr"
  %"sl" = alloca %"WorkSlice"*
  store %"WorkSlice"* null, %"WorkSlice"** %"sl"
  %"arg.1" = load i8*, i8** %"arg.addr"
  %"from_void_ptr" = bitcast i8* %"arg.1" to %"WorkSlice"*
  store %"WorkSlice"* %"from_void_ptr", %"WorkSlice"** %"sl"
  br label %"while.cond"
while.cond:
  br i1 true, label %"while.body", label %"while.end"
while.body:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem2")
  call void @"standard__atomic__load_fence__0__ret_voidE1"()
  %"sl.1" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.2" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.2", i32 0, i32 2
  %"phase" = load i32, i32* %"phase_ptr"
  %"PHASE_EXIT" = load i32, i32* @"PHASE_EXIT"
  %".9" = icmp eq i32 %"phase", %"PHASE_EXIT"
  br i1 %".9", label %"then", label %"else"
while.end:
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to i8*
  ret i8* %"int_to_ptr.1"
then:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to i8*
  ret i8* %"int_to_ptr"
else:
  br label %"ifcont"
ifcont:
  %"sl.3" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.4" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.4", i32 0, i32 2
  %"phase.1" = load i32, i32* %"phase_ptr.1"
  %"PHASE_LINSOLVE_RED" = load i32, i32* @"PHASE_LINSOLVE_RED"
  %".13" = icmp eq i32 %"phase.1", %"PHASE_LINSOLVE_RED"
  br i1 %".13", label %"sc_end", label %"sc_rhs"
sc_rhs:
  %"sl.5" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.6" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.6", i32 0, i32 2
  %"phase.2" = load i32, i32* %"phase_ptr.2"
  %"PHASE_LINSOLVE_BLACK" = load i32, i32* @"PHASE_LINSOLVE_BLACK"
  %".15" = icmp eq i32 %"phase.2", %"PHASE_LINSOLVE_BLACK"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [1, %"ifcont"], [%".15", %"sc_rhs"]
  br i1 %"sc_result", label %"then.1", label %"else.1"
then.1:
  %"sl.7" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.8" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.8", i32 0, i32 0
  %"row_start" = load i32, i32* %"row_start_ptr"
  %"sl.9" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.10" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.10", i32 0, i32 1
  %"row_end" = load i32, i32* %"row_end_ptr"
  %"sl.11" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.12" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_color_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.12", i32 0, i32 3
  %"ls_color" = load i32, i32* %"ls_color_ptr"
  %"sl.13" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.14" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_x_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.14", i32 0, i32 4
  %"ls_x" = load double*, double** %"ls_x_ptr"
  %"sl.15" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.16" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_x0_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.16", i32 0, i32 5
  %"ls_x0" = load double*, double** %"ls_x0_ptr"
  %"sl.17" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.18" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_a_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.18", i32 0, i32 6
  %"ls_a" = load double, double* %"ls_a_ptr"
  %"sl.19" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.20" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"ls_c_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.20", i32 0, i32 7
  %"ls_c_inv" = load double, double* %"ls_c_inv_ptr"
  call void @"linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start", i32 %"row_end", i32 %"ls_color", double* %"ls_x", double* %"ls_x0", double %"ls_a", double %"ls_c_inv")
  br label %"ifcont.1"
else.1:
  %"sl.21" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.22" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.22", i32 0, i32 2
  %"phase.3" = load i32, i32* %"phase_ptr.3"
  %"PHASE_ADVECT" = load i32, i32* @"PHASE_ADVECT"
  %".20" = icmp eq i32 %"phase.3", %"PHASE_ADVECT"
  br i1 %".20", label %"elif_then_0", label %"elif_else_0"
ifcont.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem2")
  br label %"while.cond"
elif_then_0:
  %"sl.23" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.24" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.24", i32 0, i32 0
  %"row_start.1" = load i32, i32* %"row_start_ptr.1"
  %"sl.25" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.26" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.26", i32 0, i32 1
  %"row_end.1" = load i32, i32* %"row_end_ptr.1"
  %"sl.27" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.28" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_dst_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.28", i32 0, i32 8
  %"adv_dst" = load double*, double** %"adv_dst_ptr"
  %"sl.29" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.30" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_src_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.30", i32 0, i32 9
  %"adv_src" = load double*, double** %"adv_src_ptr"
  %"sl.31" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.32" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_u_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.32", i32 0, i32 10
  %"adv_u" = load double*, double** %"adv_u_ptr"
  %"sl.33" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.34" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"adv_v_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.34", i32 0, i32 11
  %"adv_v" = load double*, double** %"adv_v_ptr"
  call void @"advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start.1", i32 %"row_end.1", double* %"adv_dst", double* %"adv_src", double* %"adv_u", double* %"adv_v")
  br label %"ifcont.1"
elif_else_0:
  %"sl.35" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.36" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.36", i32 0, i32 2
  %"phase.4" = load i32, i32* %"phase_ptr.4"
  %"PHASE_PROJECT_DIV" = load i32, i32* @"PHASE_PROJECT_DIV"
  %".24" = icmp eq i32 %"phase.4", %"PHASE_PROJECT_DIV"
  br i1 %".24", label %"elif_then_1", label %"elif_else_1"
elif_then_1:
  %"sl.37" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.38" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.38", i32 0, i32 0
  %"row_start.2" = load i32, i32* %"row_start_ptr.2"
  %"sl.39" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.40" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.2" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.40", i32 0, i32 1
  %"row_end.2" = load i32, i32* %"row_end_ptr.2"
  %"sl.41" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.42" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_u_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.42", i32 0, i32 12
  %"proj_u" = load double*, double** %"proj_u_ptr"
  %"sl.43" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.44" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_v_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.44", i32 0, i32 13
  %"proj_v" = load double*, double** %"proj_v_ptr"
  %"sl.45" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.46" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_p_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.46", i32 0, i32 14
  %"proj_p" = load double*, double** %"proj_p_ptr"
  %"sl.47" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.48" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_div_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.48", i32 0, i32 15
  %"proj_div" = load double*, double** %"proj_div_ptr"
  %"sl.49" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.50" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hx_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.50", i32 0, i32 16
  %"proj_hx" = load double, double* %"proj_hx_ptr"
  %"sl.51" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.52" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hy_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.52", i32 0, i32 17
  %"proj_hy" = load double, double* %"proj_hy_ptr"
  call void @"project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start.2", i32 %"row_end.2", double* %"proj_u", double* %"proj_v", double* %"proj_p", double* %"proj_div", double %"proj_hx", double %"proj_hy")
  br label %"ifcont.1"
elif_else_1:
  %"sl.53" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.54" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.5" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.54", i32 0, i32 2
  %"phase.5" = load i32, i32* %"phase_ptr.5"
  %"PHASE_PROJECT_GRAD" = load i32, i32* @"PHASE_PROJECT_GRAD"
  %".28" = icmp eq i32 %"phase.5", %"PHASE_PROJECT_GRAD"
  br i1 %".28", label %"elif_then_2", label %"elif_else_2"
elif_then_2:
  %"sl.55" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.56" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.56", i32 0, i32 0
  %"row_start.3" = load i32, i32* %"row_start_ptr.3"
  %"sl.57" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.58" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.3" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.58", i32 0, i32 1
  %"row_end.3" = load i32, i32* %"row_end_ptr.3"
  %"sl.59" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.60" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_u_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.60", i32 0, i32 12
  %"proj_u.1" = load double*, double** %"proj_u_ptr.1"
  %"sl.61" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.62" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_v_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.62", i32 0, i32 13
  %"proj_v.1" = load double*, double** %"proj_v_ptr.1"
  %"sl.63" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.64" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_p_ptr.1" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.64", i32 0, i32 14
  %"proj_p.1" = load double*, double** %"proj_p_ptr.1"
  %"sl.65" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.66" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hx_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.66", i32 0, i32 18
  %"proj_hx_inv" = load double, double* %"proj_hx_inv_ptr"
  %"sl.67" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.68" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"proj_hy_inv_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.68", i32 0, i32 19
  %"proj_hy_inv" = load double, double* %"proj_hy_inv_ptr"
  call void @"project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"row_start.3", i32 %"row_end.3", double* %"proj_u.1", double* %"proj_v.1", double* %"proj_p.1", double %"proj_hx_inv", double %"proj_hy_inv")
  br label %"ifcont.1"
elif_else_2:
  %"sl.69" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.70" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"phase_ptr.6" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.70", i32 0, i32 2
  %"phase.6" = load i32, i32* %"phase_ptr.6"
  %"PHASE_DECAY" = load i32, i32* @"PHASE_DECAY"
  %".32" = icmp eq i32 %"phase.6", %"PHASE_DECAY"
  br i1 %".32", label %"elif_then_3", label %"elif_else_3"
elif_then_3:
  %"sl.71" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.72" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_start_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.72", i32 0, i32 0
  %"row_start.4" = load i32, i32* %"row_start_ptr.4"
  %"sl.73" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.74" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"row_end_ptr.4" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.74", i32 0, i32 1
  %"row_end.4" = load i32, i32* %"row_end_ptr.4"
  %"sl.75" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"sl.76" = load %"WorkSlice"*, %"WorkSlice"** %"sl"
  %"dp_dens_ptr" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"sl.76", i32 0, i32 20
  %"dp_dens" = load double*, double** %"dp_dens_ptr"
  call void @"decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"row_start.4", i32 %"row_end.4", double* %"dp_dens")
  br label %"ifcont.1"
elif_else_3:
  br label %"ifcont.1"
}

define void @"dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"color", double* %"x", double* %"x0", double %"a", double %"c_inv")
{
entry:
  %"color.addr" = alloca i32
  store i32 %"color", i32* %"color.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"a.addr" = alloca double
  store double %"a", double* %"a.addr"
  %"c_inv.addr" = alloca double
  store double %"c_inv", double* %"c_inv.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".15" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".15", label %"for.body", label %"for.end"
for.body:
  %"color.1" = load i32, i32* %"color.addr"
  %".17" = icmp eq i32 %"color.1", 0
  br i1 %".17", label %"ternary_true", label %"ternary_false"
for.update:
  %"t.8" = load i32, i32* %"t"
  %".34" = add i32 %"t.8", 1
  store i32 %".34", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
ternary_true:
  %"PHASE_LINSOLVE_RED" = load i32, i32* @"PHASE_LINSOLVE_RED"
  br label %"ternary_merge"
ternary_false:
  %"PHASE_LINSOLVE_BLACK" = load i32, i32* @"PHASE_LINSOLVE_BLACK"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  i32 [%"PHASE_LINSOLVE_RED", %"ternary_true"], [%"PHASE_LINSOLVE_BLACK", %"ternary_false"]
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.2"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"ternary_result", i32* %".21"
  %"x.1" = load double*, double** %"x.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.3"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 4
  store double* %"x.1", double** %".23"
  %"x0.1" = load double*, double** %"x0.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.4"
  %".25" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 5
  store double* %"x0.1", double** %".25"
  %"a.1" = load double, double* %"a.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.5"
  %".27" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 6
  store double %"a.1", double* %".27"
  %"c_inv.1" = load double, double* %"c_inv.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.6"
  %".29" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 7
  store double %"c_inv.1", double* %".29"
  %"color.2" = load i32, i32* %"color.addr"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices2", i32 0, i32 %"t.7"
  %".31" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 3
  store i32 %"color.2", i32* %".31"
  br label %"for.update"
for.cond.1:
  %"t.9" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".39" = icmp slt i32 %"t.9", %"g_num_threads.1"
  br i1 %".39", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem2")
  br label %"for.update.1"
for.update.1:
  %"t.10" = load i32, i32* %"t"
  %".43" = add i32 %"t.10", 1
  store i32 %".43", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  ret void
}

define void @"collect2__0__ret_voidE1"()
{
entry:
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".5" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".5", label %"for.body", label %"for.end"
for.body:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem2")
  br label %"for.update"
for.update:
  %"t.2" = load i32, i32* %"t"
  %".9" = add i32 %"t.2", 1
  store i32 %".9", i32* %"t"
  br label %"for.cond"
for.end:
  ret void
}

define void @"dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"color", double* %"x", double* %"x0", double %"a", double %"c_inv")
{
entry:
  %"color.addr" = alloca i32
  store i32 %"color", i32* %"color.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"a.addr" = alloca double
  store double %"a", double* %"a.addr"
  %"c_inv.addr" = alloca double
  store double %"c_inv", double* %"c_inv.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".15" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".15", label %"for.body", label %"for.end"
for.body:
  %"color.1" = load i32, i32* %"color.addr"
  %".17" = icmp eq i32 %"color.1", 0
  br i1 %".17", label %"ternary_true", label %"ternary_false"
for.update:
  %"t.8" = load i32, i32* %"t"
  %".34" = add i32 %"t.8", 1
  store i32 %".34", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
ternary_true:
  %"PHASE_LINSOLVE_RED" = load i32, i32* @"PHASE_LINSOLVE_RED"
  br label %"ternary_merge"
ternary_false:
  %"PHASE_LINSOLVE_BLACK" = load i32, i32* @"PHASE_LINSOLVE_BLACK"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  i32 [%"PHASE_LINSOLVE_RED", %"ternary_true"], [%"PHASE_LINSOLVE_BLACK", %"ternary_false"]
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"ternary_result", i32* %".21"
  %"x.1" = load double*, double** %"x.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 4
  store double* %"x.1", double** %".23"
  %"x0.1" = load double*, double** %"x0.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.4"
  %".25" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 5
  store double* %"x0.1", double** %".25"
  %"a.1" = load double, double* %"a.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.5"
  %".27" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 6
  store double %"a.1", double* %".27"
  %"c_inv.1" = load double, double* %"c_inv.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".29" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 7
  store double %"c_inv.1", double* %".29"
  %"color.2" = load i32, i32* %"color.addr"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.7"
  %".31" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 3
  store i32 %"color.2", i32* %".31"
  br label %"for.update"
for.cond.1:
  %"t.9" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".39" = icmp slt i32 %"t.9", %"g_num_threads.1"
  br i1 %".39", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.10" = load i32, i32* %"t"
  %".43" = add i32 %"t.10", 1
  store i32 %".43", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  ret void
}

define void @"collect1__0__ret_voidE1"()
{
entry:
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".5" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".5", label %"for.body", label %"for.end"
for.body:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update"
for.update:
  %"t.2" = load i32, i32* %"t"
  %".9" = add i32 %"t.2", 1
  store i32 %".9", i32* %"t"
  br label %"for.cond"
for.end:
  ret void
}

define void @"dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"color", double* %"x", double* %"x0", double %"a", double %"c_inv")
{
entry:
  %"color.addr" = alloca i32
  store i32 %"color", i32* %"color.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"a.addr" = alloca double
  store double %"a", double* %"a.addr"
  %"c_inv.addr" = alloca double
  store double %"c_inv", double* %"c_inv.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".15" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".15", label %"for.body", label %"for.end"
for.body:
  %"color.1" = load i32, i32* %"color.addr"
  %".17" = icmp eq i32 %"color.1", 0
  br i1 %".17", label %"ternary_true", label %"ternary_false"
for.update:
  %"t.8" = load i32, i32* %"t"
  %".34" = add i32 %"t.8", 1
  store i32 %".34", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
ternary_true:
  %"PHASE_LINSOLVE_RED" = load i32, i32* @"PHASE_LINSOLVE_RED"
  br label %"ternary_merge"
ternary_false:
  %"PHASE_LINSOLVE_BLACK" = load i32, i32* @"PHASE_LINSOLVE_BLACK"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  i32 [%"PHASE_LINSOLVE_RED", %"ternary_true"], [%"PHASE_LINSOLVE_BLACK", %"ternary_false"]
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"ternary_result", i32* %".21"
  %"x.1" = load double*, double** %"x.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 4
  store double* %"x.1", double** %".23"
  %"x0.1" = load double*, double** %"x0.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.4"
  %".25" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 5
  store double* %"x0.1", double** %".25"
  %"a.1" = load double, double* %"a.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.5"
  %".27" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 6
  store double %"a.1", double* %".27"
  %"c_inv.1" = load double, double* %"c_inv.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".29" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 7
  store double %"c_inv.1", double* %".29"
  %"color.2" = load i32, i32* %"color.addr"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.7"
  %".31" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 3
  store i32 %"color.2", i32* %".31"
  br label %"for.update"
for.cond.1:
  %"t.9" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".39" = icmp slt i32 %"t.9", %"g_num_threads.1"
  br i1 %".39", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.10" = load i32, i32* %"t"
  %".43" = add i32 %"t.10", 1
  store i32 %".43", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
for.cond.2:
  %"t.11" = load i32, i32* %"t"
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".48" = icmp slt i32 %"t.11", %"g_num_threads.2"
  br i1 %".48", label %"for.body.2", label %"for.end.2"
for.body.2:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update.2"
for.update.2:
  %"t.12" = load i32, i32* %"t"
  %".52" = add i32 %"t.12", 1
  store i32 %".52", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  ret void
}

define void @"dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"dst", double* %"src", double* %"u", double* %"v")
{
entry:
  %"dst.addr" = alloca double*
  store double* %"dst", double** %"dst.addr"
  %"src.addr" = alloca double*
  store double* %"src", double** %"src.addr"
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".13" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".13", label %"for.body", label %"for.end"
for.body:
  %"PHASE_ADVECT" = load i32, i32* @"PHASE_ADVECT"
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".15" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"PHASE_ADVECT", i32* %".15"
  %"dst.1" = load double*, double** %"dst.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".17" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 8
  store double* %"dst.1", double** %".17"
  %"src.1" = load double*, double** %"src.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.4"
  %".19" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 9
  store double* %"src.1", double** %".19"
  %"u.1" = load double*, double** %"u.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.5"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 10
  store double* %"u.1", double** %".21"
  %"v.1" = load double*, double** %"v.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 11
  store double* %"v.1", double** %".23"
  br label %"for.update"
for.update:
  %"t.7" = load i32, i32* %"t"
  %".26" = add i32 %"t.7", 1
  store i32 %".26", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
for.cond.1:
  %"t.8" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".31" = icmp slt i32 %"t.8", %"g_num_threads.1"
  br i1 %".31", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.9" = load i32, i32* %"t"
  %".35" = add i32 %"t.9", 1
  store i32 %".35", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
for.cond.2:
  %"t.10" = load i32, i32* %"t"
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".40" = icmp slt i32 %"t.10", %"g_num_threads.2"
  br i1 %".40", label %"for.body.2", label %"for.end.2"
for.body.2:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update.2"
for.update.2:
  %"t.11" = load i32, i32* %"t"
  %".44" = add i32 %"t.11", 1
  store i32 %".44", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  ret void
}

define void @"dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(double* %"u", double* %"v", double* %"p", double* %"div", double %"hx", double %"hy")
{
entry:
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"p.addr" = alloca double*
  store double* %"p", double** %"p.addr"
  %"div.addr" = alloca double*
  store double* %"div", double** %"div.addr"
  %"hx.addr" = alloca double
  store double %"hx", double* %"hx.addr"
  %"hy.addr" = alloca double
  store double %"hy", double* %"hy.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".17" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".17", label %"for.body", label %"for.end"
for.body:
  %"PHASE_PROJECT_DIV" = load i32, i32* @"PHASE_PROJECT_DIV"
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".19" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"PHASE_PROJECT_DIV", i32* %".19"
  %"u.1" = load double*, double** %"u.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 12
  store double* %"u.1", double** %".21"
  %"v.1" = load double*, double** %"v.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.4"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 13
  store double* %"v.1", double** %".23"
  %"p.1" = load double*, double** %"p.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.5"
  %".25" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 14
  store double* %"p.1", double** %".25"
  %"div.1" = load double*, double** %"div.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".27" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 15
  store double* %"div.1", double** %".27"
  %"hx.1" = load double, double* %"hx.addr"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.7"
  %".29" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 16
  store double %"hx.1", double* %".29"
  %"hy.1" = load double, double* %"hy.addr"
  %"t.8" = load i32, i32* %"t"
  %"array_gep.6" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.8"
  %".31" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.6", i32 0, i32 17
  store double %"hy.1", double* %".31"
  br label %"for.update"
for.update:
  %"t.9" = load i32, i32* %"t"
  %".34" = add i32 %"t.9", 1
  store i32 %".34", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
for.cond.1:
  %"t.10" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".39" = icmp slt i32 %"t.10", %"g_num_threads.1"
  br i1 %".39", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.11" = load i32, i32* %"t"
  %".43" = add i32 %"t.11", 1
  store i32 %".43", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
for.cond.2:
  %"t.12" = load i32, i32* %"t"
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".48" = icmp slt i32 %"t.12", %"g_num_threads.2"
  br i1 %".48", label %"for.body.2", label %"for.end.2"
for.body.2:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update.2"
for.update.2:
  %"t.13" = load i32, i32* %"t"
  %".52" = add i32 %"t.13", 1
  store i32 %".52", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  ret void
}

define void @"dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(double* %"u", double* %"v", double* %"p", double %"hx_inv", double %"hy_inv")
{
entry:
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"p.addr" = alloca double*
  store double* %"p", double** %"p.addr"
  %"hx_inv.addr" = alloca double
  store double %"hx_inv", double* %"hx_inv.addr"
  %"hy_inv.addr" = alloca double
  store double %"hy_inv", double* %"hy_inv.addr"
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".15" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".15", label %"for.body", label %"for.end"
for.body:
  %"PHASE_PROJECT_GRAD" = load i32, i32* @"PHASE_PROJECT_GRAD"
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".17" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"PHASE_PROJECT_GRAD", i32* %".17"
  %"u.1" = load double*, double** %"u.addr"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".19" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 12
  store double* %"u.1", double** %".19"
  %"v.1" = load double*, double** %"v.addr"
  %"t.4" = load i32, i32* %"t"
  %"array_gep.2" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.4"
  %".21" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.2", i32 0, i32 13
  store double* %"v.1", double** %".21"
  %"p.1" = load double*, double** %"p.addr"
  %"t.5" = load i32, i32* %"t"
  %"array_gep.3" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.5"
  %".23" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.3", i32 0, i32 14
  store double* %"p.1", double** %".23"
  %"hx_inv.1" = load double, double* %"hx_inv.addr"
  %"t.6" = load i32, i32* %"t"
  %"array_gep.4" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.6"
  %".25" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.4", i32 0, i32 18
  store double %"hx_inv.1", double* %".25"
  %"hy_inv.1" = load double, double* %"hy_inv.addr"
  %"t.7" = load i32, i32* %"t"
  %"array_gep.5" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.7"
  %".27" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.5", i32 0, i32 19
  store double %"hy_inv.1", double* %".27"
  br label %"for.update"
for.update:
  %"t.8" = load i32, i32* %"t"
  %".30" = add i32 %"t.8", 1
  store i32 %".30", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
for.cond.1:
  %"t.9" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".35" = icmp slt i32 %"t.9", %"g_num_threads.1"
  br i1 %".35", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.10" = load i32, i32* %"t"
  %".39" = add i32 %"t.10", 1
  store i32 %".39", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
for.cond.2:
  %"t.11" = load i32, i32* %"t"
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".44" = icmp slt i32 %"t.11", %"g_num_threads.2"
  br i1 %".44", label %"for.body.2", label %"for.end.2"
for.body.2:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update.2"
for.update.2:
  %"t.12" = load i32, i32* %"t"
  %".48" = add i32 %"t.12", 1
  store i32 %".48", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  ret void
}

define void @"dispatch_decay__0__ret_voidE1"()
{
entry:
  %"t" = alloca i32
  store i32 0, i32* %"t"
  store i32 0, i32* %"t"
  br label %"for.cond"
for.cond:
  %"t.1" = load i32, i32* %"t"
  %"g_num_threads" = load i32, i32* @"g_num_threads"
  %".5" = icmp slt i32 %"t.1", %"g_num_threads"
  br i1 %".5", label %"for.body", label %"for.end"
for.body:
  %"PHASE_DECAY" = load i32, i32* @"PHASE_DECAY"
  %"t.2" = load i32, i32* %"t"
  %"array_gep" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.2"
  %".7" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep", i32 0, i32 2
  store i32 %"PHASE_DECAY", i32* %".7"
  %"g_dens" = load double*, double** @"g_dens"
  %"t.3" = load i32, i32* %"t"
  %"array_gep.1" = getelementptr inbounds [64 x %"WorkSlice"], [64 x %"WorkSlice"]* @"g_slices", i32 0, i32 %"t.3"
  %".9" = getelementptr inbounds %"WorkSlice", %"WorkSlice"* %"array_gep.1", i32 0, i32 20
  store double* %"g_dens", double** %".9"
  br label %"for.update"
for.update:
  %"t.4" = load i32, i32* %"t"
  %".12" = add i32 %"t.4", 1
  store i32 %".12", i32* %"t"
  br label %"for.cond"
for.end:
  call void @"standard__atomic__store_fence__0__ret_voidE1"()
  store i32 0, i32* %"t"
  br label %"for.cond.1"
for.cond.1:
  %"t.5" = load i32, i32* %"t"
  %"g_num_threads.1" = load i32, i32* @"g_num_threads"
  %".17" = icmp slt i32 %"t.5", %"g_num_threads.1"
  br i1 %".17", label %"for.body.1", label %"for.end.1"
for.body.1:
  call void @"standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_work_sem")
  br label %"for.update.1"
for.update.1:
  %"t.6" = load i32, i32* %"t"
  %".21" = add i32 %"t.6", 1
  store i32 %".21", i32* %"t"
  br label %"for.cond.1"
for.end.1:
  store i32 0, i32* %"t"
  br label %"for.cond.2"
for.cond.2:
  %"t.7" = load i32, i32* %"t"
  %"g_num_threads.2" = load i32, i32* @"g_num_threads"
  %".26" = icmp slt i32 %"t.7", %"g_num_threads.2"
  br i1 %".26", label %"for.body.2", label %"for.end.2"
for.body.2:
  call void @"standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1"(%"Semaphore"* @"g_done_sem")
  br label %"for.update.2"
for.update.2:
  %"t.8" = load i32, i32* %"t"
  %".30" = add i32 %"t.8", 1
  store i32 %".30", i32* %"t"
  br label %"for.cond.2"
for.end.2:
  ret void
}

define void @"upload_textures__0__ret_voidE1"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"n" = alloca i32
  store i32 0, i32* %"n"
  %"vidx" = alloca i32
  store i32 0, i32* %"vidx"
  %"d" = alloca float
  store float              0x0, float* %"d"
  %"scale" = alloca float
  store float              0x0, float* %"scale"
  store float 0x4010000000000000, float* %"scale"
  %".8" = mul i32 256, 192
  store i32 %".8", i32* %"n"
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".12" = icmp slt i32 %"i.1", %"n.1"
  br i1 %".12", label %"for.body", label %"for.end"
for.body:
  %"g_dens" = load double*, double** @"g_dens"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds double, double* %"g_dens", i32 %"i.2"
  %"ptr_load" = load double, double* %"ptr_gep"
  %".14" = fmul double %"ptr_load", 0x3f70101010101010
  %".15" = fptrunc double %".14" to float
  store float %".15", float* %"d"
  %"d.1" = load float, float* %"d"
  %".17" = fcmp ogt float %"d.1", 0x3ff0000000000000
  br i1 %".17", label %"then", label %"else"
for.update:
  %"i.7" = load i32, i32* %"i"
  %".38" = add i32 %"i.7", 1
  store i32 %".38", i32* %"i"
  br label %"for.cond"
for.end:
  ret void
then:
  store float 0x3ff0000000000000, float* %"d"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"d.2" = load float, float* %"d"
  %"g_dens_tex" = load float*, float** @"g_dens_tex"
  %"i.3" = load i32, i32* %"i"
  %".22" = getelementptr inbounds float, float* %"g_dens_tex", i32 %"i.3"
  store float %"d.2", float* %".22"
  %"i.4" = load i32, i32* %"i"
  %".24" = mul i32 %"i.4", 2
  store i32 %".24", i32* %"vidx"
  %"g_vx" = load double*, double** @"g_vx"
  %"i.5" = load i32, i32* %"i"
  %"ptr_gep.1" = getelementptr inbounds double, double* %"g_vx", i32 %"i.5"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"scale.1" = load float, float* %"scale"
  %"float_to_double_rhs" = fpext float %"scale.1" to double
  %".26" = fmul double %"ptr_load.1", %"float_to_double_rhs"
  %".27" = fptrunc double %".26" to float
  %".28" = fadd float %".27", 0x3fe0000000000000
  %"g_vel_tex" = load float*, float** @"g_vel_tex"
  %"vidx.1" = load i32, i32* %"vidx"
  %".29" = getelementptr inbounds float, float* %"g_vel_tex", i32 %"vidx.1"
  store float %".28", float* %".29"
  %"g_vy" = load double*, double** @"g_vy"
  %"i.6" = load i32, i32* %"i"
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_vy", i32 %"i.6"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"scale.2" = load float, float* %"scale"
  %"float_to_double_rhs.1" = fpext float %"scale.2" to double
  %".31" = fmul double %"ptr_load.2", %"float_to_double_rhs.1"
  %".32" = fptrunc double %".31" to float
  %".33" = fadd float %".32", 0x3fe0000000000000
  %"g_vel_tex.1" = load float*, float** @"g_vel_tex"
  %"vidx.2" = load i32, i32* %"vidx"
  %".34" = add i32 %"vidx.2", 1
  %".35" = getelementptr inbounds float, float* %"g_vel_tex.1", i32 %".34"
  store float %".33", float* %".35"
  br label %"for.update"
}

define void @"lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"b", double* %"x", double* %"x0", double %"a", double %"c")
{
entry:
  %"b.addr" = alloca i32
  store i32 %"b", i32* %"b.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"a.addr" = alloca double
  store double %"a", double* %"a.addr"
  %"c.addr" = alloca double
  store double %"c", double* %"c.addr"
  %"c_inv" = alloca double
  store double              0x0, double* %"c_inv"
  %"k" = alloca i32
  store i32 0, i32* %"k"
  %"c.1" = load double, double* %"c.addr"
  %"float_to_double_lhs" = fpext float 0x3ff0000000000000 to double
  %".14" = fdiv double %"float_to_double_lhs", %"c.1"
  store double %".14", double* %"c_inv"
  store i32 0, i32* %"k"
  br label %"for.cond"
for.cond:
  %"k.1" = load i32, i32* %"k"
  %".18" = icmp slt i32 %"k.1", 20
  br i1 %".18", label %"for.body", label %"for.end"
for.body:
  %"x.1" = load double*, double** %"x.addr"
  %"x0.1" = load double*, double** %"x0.addr"
  %"a.1" = load double, double* %"a.addr"
  %"c_inv.1" = load double, double* %"c_inv"
  call void @"dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 0, double* %"x.1", double* %"x0.1", double %"a.1", double %"c_inv.1")
  %"x.2" = load double*, double** %"x.addr"
  %"x0.2" = load double*, double** %"x0.addr"
  %"a.2" = load double, double* %"a.addr"
  %"c_inv.2" = load double, double* %"c_inv"
  call void @"dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 1, double* %"x.2", double* %"x0.2", double %"a.2", double %"c_inv.2")
  %"k.2" = load i32, i32* %"k"
  %".22" = sub i32 20, 1
  %".23" = icmp eq i32 %"k.2", %".22"
  br i1 %".23", label %"then", label %"else"
for.update:
  %"k.3" = load i32, i32* %"k"
  %".29" = add i32 %"k.3", 1
  store i32 %".29", i32* %"k"
  br label %"for.cond"
for.end:
  ret void
then:
  %"b.1" = load i32, i32* %"b.addr"
  %"x.3" = load double*, double** %"x.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"b.1", double* %"x.3")
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update"
}

define void @"diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1"(i32 %"b", double* %"x", double* %"x0", double %"diff")
{
entry:
  %"b.addr" = alloca i32
  store i32 %"b", i32* %"b.addr"
  %"x.addr" = alloca double*
  store double* %"x", double** %"x.addr"
  %"x0.addr" = alloca double*
  store double* %"x0", double** %"x0.addr"
  %"diff.addr" = alloca double
  store double %"diff", double* %"diff.addr"
  %"a" = alloca double
  store double              0x0, double* %"a"
  %"diff.1" = load double, double* %"diff.addr"
  %"float_to_double_lhs" = fpext float 0x3fb99999a0000000 to double
  %".11" = fmul double %"float_to_double_lhs", %"diff.1"
  %".12" = sub i32 256, 2
  %".13" = sitofp i32 %".12" to double
  %".14" = fmul double %".11", %".13"
  %".15" = sub i32 192, 2
  %".16" = sitofp i32 %".15" to double
  %".17" = fmul double %".14", %".16"
  store double %".17", double* %"a"
  %"b.1" = load i32, i32* %"b.addr"
  %"x.1" = load double*, double** %"x.addr"
  %"x0.1" = load double*, double** %"x0.addr"
  %"a.1" = load double, double* %"a"
  %"a.2" = load double, double* %"a"
  %"float_to_double_lhs.1" = fpext float 0x4010000000000000 to double
  %".19" = fmul double %"float_to_double_lhs.1", %"a.2"
  %"float_to_double_lhs.2" = fpext float 0x3ff0000000000000 to double
  %".20" = fadd double %"float_to_double_lhs.2", %".19"
  call void @"lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 %"b.1", double* %"x.1", double* %"x0.1", double %"a.1", double %".20")
  ret void
}

define void @"project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"u", double* %"v", double* %"p", double* %"div")
{
entry:
  %"u.addr" = alloca double*
  store double* %"u", double** %"u.addr"
  %"v.addr" = alloca double*
  store double* %"v", double** %"v.addr"
  %"p.addr" = alloca double*
  store double* %"p", double** %"p.addr"
  %"div.addr" = alloca double*
  store double* %"div", double** %"div.addr"
  %"hx" = alloca double
  store double              0x0, double* %"hx"
  %"hy" = alloca double
  store double              0x0, double* %"hy"
  %"hx_inv" = alloca double
  store double              0x0, double* %"hx_inv"
  %"hy_inv" = alloca double
  store double              0x0, double* %"hy_inv"
  %".14" = sub i32 256, 2
  %".15" = sitofp i32 %".14" to double
  %"float_to_double_lhs" = fpext float 0x3ff0000000000000 to double
  %".16" = fdiv double %"float_to_double_lhs", %".15"
  store double %".16", double* %"hx"
  %".18" = sub i32 192, 2
  %".19" = sitofp i32 %".18" to double
  %"float_to_double_lhs.1" = fpext float 0x3ff0000000000000 to double
  %".20" = fdiv double %"float_to_double_lhs.1", %".19"
  store double %".20", double* %"hy"
  %".22" = sub i32 256, 2
  %".23" = sitofp i32 %".22" to double
  store double %".23", double* %"hx_inv"
  %".25" = sub i32 192, 2
  %".26" = sitofp i32 %".25" to double
  store double %".26", double* %"hy_inv"
  %"u.1" = load double*, double** %"u.addr"
  %"v.1" = load double*, double** %"v.addr"
  %"p.1" = load double*, double** %"p.addr"
  %"div.1" = load double*, double** %"div.addr"
  %"hx.1" = load double, double* %"hx"
  %"hy.1" = load double, double* %"hy"
  call void @"dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(double* %"u.1", double* %"v.1", double* %"p.1", double* %"div.1", double %"hx.1", double %"hy.1")
  %"div.2" = load double*, double** %"div.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 0, double* %"div.2")
  %"p.2" = load double*, double** %"p.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 0, double* %"p.2")
  %"p.3" = load double*, double** %"p.addr"
  %"div.3" = load double*, double** %"div.addr"
  %"arg3_float_to_double" = fpext float 0x3ff0000000000000 to double
  %"arg4_float_to_double" = fpext float 0x4010000000000000 to double
  call void @"lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 0, double* %"p.3", double* %"div.3", double %"arg3_float_to_double", double %"arg4_float_to_double")
  %"u.2" = load double*, double** %"u.addr"
  %"v.2" = load double*, double** %"v.addr"
  %"p.4" = load double*, double** %"p.addr"
  %"hx_inv.1" = load double, double* %"hx_inv"
  %"hy_inv.1" = load double, double* %"hy_inv"
  call void @"dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(double* %"u.2", double* %"v.2", double* %"p.4", double %"hx_inv.1", double %"hy_inv.1")
  %"u.3" = load double*, double** %"u.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 1, double* %"u.3")
  %"v.3" = load double*, double** %"v.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 2, double* %"v.3")
  ret void
}

define void @"diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1"(i32 %"b1", double* %"x1", double* %"x10", double %"diff1", i32 %"b2", double* %"x2", double* %"x20", double %"diff2")
{
entry:
  %"b1.addr" = alloca i32
  store i32 %"b1", i32* %"b1.addr"
  %"x1.addr" = alloca double*
  store double* %"x1", double** %"x1.addr"
  %"x10.addr" = alloca double*
  store double* %"x10", double** %"x10.addr"
  %"diff1.addr" = alloca double
  store double %"diff1", double* %"diff1.addr"
  %"b2.addr" = alloca i32
  store i32 %"b2", i32* %"b2.addr"
  %"x2.addr" = alloca double*
  store double* %"x2", double** %"x2.addr"
  %"x20.addr" = alloca double*
  store double* %"x20", double** %"x20.addr"
  %"diff2.addr" = alloca double
  store double %"diff2", double* %"diff2.addr"
  %"a1" = alloca double
  store double              0x0, double* %"a1"
  %"a2" = alloca double
  store double              0x0, double* %"a2"
  %"c_inv1" = alloca double
  store double              0x0, double* %"c_inv1"
  %"c_inv2" = alloca double
  store double              0x0, double* %"c_inv2"
  %"k" = alloca i32
  store i32 0, i32* %"k"
  %"diff1.1" = load double, double* %"diff1.addr"
  %"float_to_double_lhs" = fpext float 0x3fb99999a0000000 to double
  %".23" = fmul double %"float_to_double_lhs", %"diff1.1"
  %".24" = sub i32 256, 2
  %".25" = sitofp i32 %".24" to double
  %".26" = fmul double %".23", %".25"
  %".27" = sub i32 192, 2
  %".28" = sitofp i32 %".27" to double
  %".29" = fmul double %".26", %".28"
  store double %".29", double* %"a1"
  %"diff2.1" = load double, double* %"diff2.addr"
  %"float_to_double_lhs.1" = fpext float 0x3fb99999a0000000 to double
  %".31" = fmul double %"float_to_double_lhs.1", %"diff2.1"
  %".32" = sub i32 256, 2
  %".33" = sitofp i32 %".32" to double
  %".34" = fmul double %".31", %".33"
  %".35" = sub i32 192, 2
  %".36" = sitofp i32 %".35" to double
  %".37" = fmul double %".34", %".36"
  store double %".37", double* %"a2"
  %"a1.1" = load double, double* %"a1"
  %"float_to_double_lhs.2" = fpext float 0x4010000000000000 to double
  %".39" = fmul double %"float_to_double_lhs.2", %"a1.1"
  %"float_to_double_lhs.3" = fpext float 0x3ff0000000000000 to double
  %".40" = fadd double %"float_to_double_lhs.3", %".39"
  %"float_to_double_lhs.4" = fpext float 0x3ff0000000000000 to double
  %".41" = fdiv double %"float_to_double_lhs.4", %".40"
  store double %".41", double* %"c_inv1"
  %"a2.1" = load double, double* %"a2"
  %"float_to_double_lhs.5" = fpext float 0x4010000000000000 to double
  %".43" = fmul double %"float_to_double_lhs.5", %"a2.1"
  %"float_to_double_lhs.6" = fpext float 0x3ff0000000000000 to double
  %".44" = fadd double %"float_to_double_lhs.6", %".43"
  %"float_to_double_lhs.7" = fpext float 0x3ff0000000000000 to double
  %".45" = fdiv double %"float_to_double_lhs.7", %".44"
  store double %".45", double* %"c_inv2"
  store i32 0, i32* %"k"
  br label %"for.cond"
for.cond:
  %"k.1" = load i32, i32* %"k"
  %".49" = icmp slt i32 %"k.1", 20
  br i1 %".49", label %"for.body", label %"for.end"
for.body:
  %"x1.1" = load double*, double** %"x1.addr"
  %"x10.1" = load double*, double** %"x10.addr"
  %"a1.2" = load double, double* %"a1"
  %"c_inv1.1" = load double, double* %"c_inv1"
  call void @"dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 0, double* %"x1.1", double* %"x10.1", double %"a1.2", double %"c_inv1.1")
  %"x2.1" = load double*, double** %"x2.addr"
  %"x20.1" = load double*, double** %"x20.addr"
  %"a2.2" = load double, double* %"a2"
  %"c_inv2.1" = load double, double* %"c_inv2"
  call void @"dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 0, double* %"x2.1", double* %"x20.1", double %"a2.2", double %"c_inv2.1")
  call void @"collect1__0__ret_voidE1"()
  call void @"collect2__0__ret_voidE1"()
  %"x1.2" = load double*, double** %"x1.addr"
  %"x10.2" = load double*, double** %"x10.addr"
  %"a1.3" = load double, double* %"a1"
  %"c_inv1.2" = load double, double* %"c_inv1"
  call void @"dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 1, double* %"x1.2", double* %"x10.2", double %"a1.3", double %"c_inv1.2")
  %"x2.2" = load double*, double** %"x2.addr"
  %"x20.2" = load double*, double** %"x20.addr"
  %"a2.3" = load double, double* %"a2"
  %"c_inv2.2" = load double, double* %"c_inv2"
  call void @"dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1"(i32 1, double* %"x2.2", double* %"x20.2", double %"a2.3", double %"c_inv2.2")
  call void @"collect1__0__ret_voidE1"()
  call void @"collect2__0__ret_voidE1"()
  %"k.2" = load i32, i32* %"k"
  %".55" = sub i32 20, 1
  %".56" = icmp eq i32 %"k.2", %".55"
  br i1 %".56", label %"then", label %"else"
for.update:
  %"k.3" = load i32, i32* %"k"
  %".63" = add i32 %"k.3", 1
  store i32 %".63", i32* %"k"
  br label %"for.cond"
for.end:
  ret void
then:
  %"b1.1" = load i32, i32* %"b1.addr"
  %"x1.3" = load double*, double** %"x1.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"b1.1", double* %"x1.3")
  %"b2.1" = load i32, i32* %"b2.addr"
  %"x2.3" = load double*, double** %"x2.addr"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 %"b2.1", double* %"x2.3")
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update"
}

define void @"vel_step__0__ret_voidE1"()
{
entry:
  %"g_vx_prev" = load double*, double** @"g_vx_prev"
  %"g_vx" = load double*, double** @"g_vx"
  %"g_vy_prev" = load double*, double** @"g_vy_prev"
  %"g_vy" = load double*, double** @"g_vy"
  %"arg3_float_to_double" = fpext float 0x3f50624de0000000 to double
  %"arg7_float_to_double" = fpext float 0x3f50624de0000000 to double
  call void @"diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1"(i32 1, double* %"g_vx_prev", double* %"g_vx", double %"arg3_float_to_double", i32 2, double* %"g_vy_prev", double* %"g_vy", double %"arg7_float_to_double")
  %"g_vx_prev.1" = load double*, double** @"g_vx_prev"
  %"g_vy_prev.1" = load double*, double** @"g_vy_prev"
  %"g_vx.1" = load double*, double** @"g_vx"
  %"g_vy.1" = load double*, double** @"g_vy"
  call void @"project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_vx_prev.1", double* %"g_vy_prev.1", double* %"g_vx.1", double* %"g_vy.1")
  %"g_vx.2" = load double*, double** @"g_vx"
  %"g_vx_prev.2" = load double*, double** @"g_vx_prev"
  %"g_vx_prev.3" = load double*, double** @"g_vx_prev"
  %"g_vy_prev.2" = load double*, double** @"g_vy_prev"
  call void @"dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_vx.2", double* %"g_vx_prev.2", double* %"g_vx_prev.3", double* %"g_vy_prev.2")
  %"g_vx.3" = load double*, double** @"g_vx"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 1, double* %"g_vx.3")
  %"g_vy.2" = load double*, double** @"g_vy"
  %"g_vy_prev.3" = load double*, double** @"g_vy_prev"
  %"g_vx_prev.4" = load double*, double** @"g_vx_prev"
  %"g_vy_prev.4" = load double*, double** @"g_vy_prev"
  call void @"dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_vy.2", double* %"g_vy_prev.3", double* %"g_vx_prev.4", double* %"g_vy_prev.4")
  %"g_vy.3" = load double*, double** @"g_vy"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 2, double* %"g_vy.3")
  %"g_vx.4" = load double*, double** @"g_vx"
  %"g_vy.4" = load double*, double** @"g_vy"
  call void @"vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_vx.4", double* %"g_vy.4")
  %"g_vx.5" = load double*, double** @"g_vx"
  %"g_vy.5" = load double*, double** @"g_vy"
  %"g_vx_prev.5" = load double*, double** @"g_vx_prev"
  %"g_vy_prev.5" = load double*, double** @"g_vy_prev"
  call void @"project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_vx.5", double* %"g_vy.5", double* %"g_vx_prev.5", double* %"g_vy_prev.5")
  ret void
}

define void @"dens_step__0__ret_voidE1"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"base" = alloca i32
  store i32 0, i32* %"base"
  %"pass" = alloca i32
  store i32 0, i32* %"pass"
  %"excess" = alloca double
  store double              0x0, double* %"excess"
  %"share" = alloca double
  store double              0x0, double* %"share"
  %"g_dens_prev" = load double*, double** @"g_dens_prev"
  %"g_dens" = load double*, double** @"g_dens"
  %"arg3_float_to_double" = fpext float 0x3f1a36e2e0000000 to double
  call void @"diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1"(i32 0, double* %"g_dens_prev", double* %"g_dens", double %"arg3_float_to_double")
  %"g_dens.1" = load double*, double** @"g_dens"
  %"g_dens_prev.1" = load double*, double** @"g_dens_prev"
  %"g_vx" = load double*, double** @"g_vx"
  %"g_vy" = load double*, double** @"g_vy"
  call void @"dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1"(double* %"g_dens.1", double* %"g_dens_prev.1", double* %"g_vx", double* %"g_vy")
  %"g_dens.2" = load double*, double** @"g_dens"
  call void @"set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1"(i32 0, double* %"g_dens.2")
  store i32 0, i32* %"pass"
  br label %"while.cond"
while.cond:
  %"pass.1" = load i32, i32* %"pass"
  %".13" = icmp slt i32 %"pass.1", 2
  br i1 %".13", label %"while.body", label %"while.end"
while.body:
  store i32 1, i32* %"j"
  br label %"for.cond"
while.end:
  ret void
for.cond:
  %"j.1" = load i32, i32* %"j"
  %".17" = sub i32 192, 1
  %".18" = icmp slt i32 %"j.1", %".17"
  br i1 %".18", label %"for.body", label %"for.end"
for.body:
  %"j.2" = load i32, i32* %"j"
  %".20" = mul i32 %"j.2", 256
  store i32 %".20", i32* %"base"
  store i32 1, i32* %"i"
  br label %"for.cond.1"
for.update:
  %"j.3" = load i32, i32* %"j"
  %".73" = add i32 %"j.3", 1
  store i32 %".73", i32* %"j"
  br label %"for.cond"
for.end:
  %"pass.2" = load i32, i32* %"pass"
  %".76" = add i32 %"pass.2", 1
  store i32 %".76", i32* %"pass"
  br label %"while.cond"
for.cond.1:
  %"i.1" = load i32, i32* %"i"
  %".24" = sub i32 256, 1
  %".25" = icmp slt i32 %"i.1", %".24"
  br i1 %".25", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"g_dens.3" = load double*, double** @"g_dens"
  %"base.1" = load i32, i32* %"base"
  %"i.2" = load i32, i32* %"i"
  %".27" = add i32 %"base.1", %"i.2"
  %"ptr_gep" = getelementptr inbounds double, double* %"g_dens.3", i32 %".27"
  %"ptr_load" = load double, double* %"ptr_gep"
  %"float_to_double_rhs" = fpext float 0x4056000000000000 to double
  %".28" = fcmp ogt double %"ptr_load", %"float_to_double_rhs"
  br i1 %".28", label %"then", label %"else"
for.update.1:
  %"i.13" = load i32, i32* %"i"
  %".69" = add i32 %"i.13", 1
  store i32 %".69", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  br label %"for.update"
then:
  %"g_dens.4" = load double*, double** @"g_dens"
  %"base.2" = load i32, i32* %"base"
  %"i.3" = load i32, i32* %"i"
  %".30" = add i32 %"base.2", %"i.3"
  %"ptr_gep.1" = getelementptr inbounds double, double* %"g_dens.4", i32 %".30"
  %"ptr_load.1" = load double, double* %"ptr_gep.1"
  %"float_to_double_rhs.1" = fpext float 0x4056000000000000 to double
  %".31" = fsub double %"ptr_load.1", %"float_to_double_rhs.1"
  store double %".31", double* %"excess"
  %"excess.1" = load double, double* %"excess"
  %"float_to_double_rhs.2" = fpext float 0x3fcc28f5c0000000 to double
  %".33" = fmul double %"excess.1", %"float_to_double_rhs.2"
  store double %".33", double* %"share"
  %"g_dens.5" = load double*, double** @"g_dens"
  %"base.3" = load i32, i32* %"base"
  %"i.4" = load i32, i32* %"i"
  %".35" = add i32 %"base.3", %"i.4"
  %".36" = getelementptr inbounds double, double* %"g_dens.5", i32 %".35"
  %"f32_to_f64" = fpext float 0x4056000000000000 to double
  store double %"f32_to_f64", double* %".36"
  %"g_dens.6" = load double*, double** @"g_dens"
  %"base.4" = load i32, i32* %"base"
  %"i.5" = load i32, i32* %"i"
  %".38" = add i32 %"base.4", %"i.5"
  %".39" = add i32 %".38", 1
  %"ptr_gep.2" = getelementptr inbounds double, double* %"g_dens.6", i32 %".39"
  %"ptr_load.2" = load double, double* %"ptr_gep.2"
  %"share.1" = load double, double* %"share"
  %".40" = fadd double %"ptr_load.2", %"share.1"
  %"g_dens.7" = load double*, double** @"g_dens"
  %"base.5" = load i32, i32* %"base"
  %"i.6" = load i32, i32* %"i"
  %".41" = add i32 %"base.5", %"i.6"
  %".42" = add i32 %".41", 1
  %".43" = getelementptr inbounds double, double* %"g_dens.7", i32 %".42"
  store double %".40", double* %".43"
  %"g_dens.8" = load double*, double** @"g_dens"
  %"base.6" = load i32, i32* %"base"
  %"i.7" = load i32, i32* %"i"
  %".45" = add i32 %"base.6", %"i.7"
  %".46" = sub i32 %".45", 1
  %"ptr_gep.3" = getelementptr inbounds double, double* %"g_dens.8", i32 %".46"
  %"ptr_load.3" = load double, double* %"ptr_gep.3"
  %"share.2" = load double, double* %"share"
  %".47" = fadd double %"ptr_load.3", %"share.2"
  %"g_dens.9" = load double*, double** @"g_dens"
  %"base.7" = load i32, i32* %"base"
  %"i.8" = load i32, i32* %"i"
  %".48" = add i32 %"base.7", %"i.8"
  %".49" = sub i32 %".48", 1
  %".50" = getelementptr inbounds double, double* %"g_dens.9", i32 %".49"
  store double %".47", double* %".50"
  %"g_dens.10" = load double*, double** @"g_dens"
  %"base.8" = load i32, i32* %"base"
  %"i.9" = load i32, i32* %"i"
  %".52" = add i32 %"base.8", %"i.9"
  %".53" = add i32 %".52", 256
  %"ptr_gep.4" = getelementptr inbounds double, double* %"g_dens.10", i32 %".53"
  %"ptr_load.4" = load double, double* %"ptr_gep.4"
  %"share.3" = load double, double* %"share"
  %".54" = fadd double %"ptr_load.4", %"share.3"
  %"g_dens.11" = load double*, double** @"g_dens"
  %"base.9" = load i32, i32* %"base"
  %"i.10" = load i32, i32* %"i"
  %".55" = add i32 %"base.9", %"i.10"
  %".56" = add i32 %".55", 256
  %".57" = getelementptr inbounds double, double* %"g_dens.11", i32 %".56"
  store double %".54", double* %".57"
  %"g_dens.12" = load double*, double** @"g_dens"
  %"base.10" = load i32, i32* %"base"
  %"i.11" = load i32, i32* %"i"
  %".59" = add i32 %"base.10", %"i.11"
  %".60" = sub i32 %".59", 256
  %"ptr_gep.5" = getelementptr inbounds double, double* %"g_dens.12", i32 %".60"
  %"ptr_load.5" = load double, double* %"ptr_gep.5"
  %"share.4" = load double, double* %"share"
  %".61" = fadd double %"ptr_load.5", %"share.4"
  %"g_dens.13" = load double*, double** @"g_dens"
  %"base.11" = load i32, i32* %"base"
  %"i.12" = load i32, i32* %"i"
  %".62" = add i32 %"base.11", %"i.12"
  %".63" = sub i32 %".62", 256
  %".64" = getelementptr inbounds double, double* %"g_dens.13", i32 %".63"
  store double %".61", double* %".64"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update.1"
}

define i32 @"int_to_str__2__intE1__byteE1_ptr1__ret_intE1"(i32 %"val", i8* %"buf")
{
entry:
  %"val.addr" = alloca i32
  store i32 %"val", i32* %"val.addr"
  %"buf.addr" = alloca i8*
  store i8* %"buf", i8** %"buf.addr"
  %"tmp" = alloca i32
  store i32 0, i32* %"tmp"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  store i32 0, i32* %"j"
  %"len" = alloca i32
  store i32 0, i32* %"len"
  %"t" = alloca i8
  store i8 0, i8* %"t"
  %"val.1" = load i32, i32* %"val.addr"
  %".11" = icmp slt i32 %"val.1", 0
  br i1 %".11", label %"then", label %"else"
then:
  store i32 0, i32* %"val.addr"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"val.2" = load i32, i32* %"val.addr"
  %".16" = icmp eq i32 %"val.2", 0
  br i1 %".16", label %"then.1", label %"else.1"
then.1:
  %"buf.1" = load i8*, i8** %"buf.addr"
  %".18" = getelementptr inbounds i8, i8* %"buf.1", i32 0
  %".19" = trunc i32 48 to i8
  store i8 %".19", i8* %".18"
  %"buf.2" = load i8*, i8** %"buf.addr"
  %".21" = getelementptr inbounds i8, i8* %"buf.2", i32 1
  %".22" = trunc i32 0 to i8
  store i8 %".22", i8* %".21"
  ret i32 1
else.1:
  br label %"ifcont.1"
ifcont.1:
  store i32 0, i32* %"len"
  %"val.3" = load i32, i32* %"val.addr"
  store i32 %"val.3", i32* %"tmp"
  br label %"while.cond"
while.cond:
  %"tmp.1" = load i32, i32* %"tmp"
  %".29" = icmp sgt i32 %"tmp.1", 0
  br i1 %".29", label %"while.body", label %"while.end"
while.body:
  %"tmp.2" = load i32, i32* %"tmp"
  %".31" = srem i32 %"tmp.2", 10
  %".32" = add i32 48, %".31"
  %".33" = trunc i32 %".32" to i8
  %"buf.3" = load i8*, i8** %"buf.addr"
  %"len.1" = load i32, i32* %"len"
  %".34" = getelementptr inbounds i8, i8* %"buf.3", i32 %"len.1"
  store i8 %".33", i8* %".34"
  %"tmp.3" = load i32, i32* %"tmp"
  %".36" = sdiv i32 %"tmp.3", 10
  store i32 %".36", i32* %"tmp"
  %"len.2" = load i32, i32* %"len"
  %".38" = add i32 %"len.2", 1
  store i32 %".38", i32* %"len"
  br label %"while.cond"
while.end:
  %"buf.4" = load i8*, i8** %"buf.addr"
  %"len.3" = load i32, i32* %"len"
  %".41" = getelementptr inbounds i8, i8* %"buf.4", i32 %"len.3"
  %".42" = trunc i32 0 to i8
  store i8 %".42", i8* %".41"
  store i32 0, i32* %"i"
  %"len.4" = load i32, i32* %"len"
  %".45" = sub i32 %"len.4", 1
  store i32 %".45", i32* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i32, i32* %"i"
  %"j.1" = load i32, i32* %"j"
  %".48" = icmp slt i32 %"i.1", %"j.1"
  br i1 %".48", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"buf.5" = load i8*, i8** %"buf.addr"
  %"i.2" = load i32, i32* %"i"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"buf.5", i32 %"i.2"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  store i8 %"ptr_load", i8* %"t"
  %"buf.6" = load i8*, i8** %"buf.addr"
  %"j.2" = load i32, i32* %"j"
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"buf.6", i32 %"j.2"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"buf.7" = load i8*, i8** %"buf.addr"
  %"i.3" = load i32, i32* %"i"
  %".51" = getelementptr inbounds i8, i8* %"buf.7", i32 %"i.3"
  store i8 %"ptr_load.1", i8* %".51"
  %"t.1" = load i8, i8* %"t"
  %"buf.8" = load i8*, i8** %"buf.addr"
  %"j.3" = load i32, i32* %"j"
  %".53" = getelementptr inbounds i8, i8* %"buf.8", i32 %"j.3"
  store i8 %"t.1", i8* %".53"
  %"i.4" = load i32, i32* %"i"
  %".55" = add i32 %"i.4", 1
  store i32 %".55", i32* %"i"
  %"j.4" = load i32, i32* %"j"
  %".57" = sub i32 %"j.4", 1
  store i32 %".57", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  %"len.5" = load i32, i32* %"len"
  ret i32 %"len.5"
}

@"VERT_SRC" = internal global [102 x i8] [i8 35, i8 118, i8 101, i8 114, i8 115, i8 105, i8 111, i8 110, i8 32, i8 49, i8 50, i8 48, i8 10, i8 118, i8 111, i8 105, i8 100, i8 32, i8 109, i8 97, i8 105, i8 110, i8 40, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 103, i8 108, i8 95, i8 84, i8 101, i8 120, i8 67, i8 111, i8 111, i8 114, i8 100, i8 91, i8 48, i8 93, i8 32, i8 61, i8 32, i8 103, i8 108, i8 95, i8 77, i8 117, i8 108, i8 116, i8 105, i8 84, i8 101, i8 120, i8 67, i8 111, i8 111, i8 114, i8 100, i8 48, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 103, i8 108, i8 95, i8 80, i8 111, i8 115, i8 105, i8 116, i8 105, i8 111, i8 110, i8 32, i8 32, i8 32, i8 32, i8 61, i8 32, i8 103, i8 108, i8 95, i8 86, i8 101, i8 114, i8 116, i8 101, i8 120, i8 59, i8 10, i8 125, i8 10, i8 0]
@"FRAG_SRC" = internal global [4187 x i8] [i8 35, i8 118, i8 101, i8 114, i8 115, i8 105, i8 111, i8 110, i8 32, i8 49, i8 50, i8 48, i8 10, i8 117, i8 110, i8 105, i8 102, i8 111, i8 114, i8 109, i8 32, i8 115, i8 97, i8 109, i8 112, i8 108, i8 101, i8 114, i8 50, i8 68, i8 32, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 59, i8 10, i8 117, i8 110, i8 105, i8 102, i8 111, i8 114, i8 109, i8 32, i8 115, i8 97, i8 109, i8 112, i8 108, i8 101, i8 114, i8 50, i8 68, i8 32, i8 117, i8 95, i8 118, i8 101, i8 108, i8 59, i8 10, i8 117, i8 110, i8 105, i8 102, i8 111, i8 114, i8 109, i8 32, i8 118, i8 101, i8 99, i8 50, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 117, i8 95, i8 114, i8 101, i8 115, i8 59, i8 10, i8 117, i8 110, i8 105, i8 102, i8 111, i8 114, i8 109, i8 32, i8 105, i8 110, i8 116, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 59, i8 10, i8 10, i8 118, i8 111, i8 105, i8 100, i8 32, i8 109, i8 97, i8 105, i8 110, i8 40, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 118, i8 101, i8 99, i8 50, i8 32, i8 117, i8 118, i8 32, i8 61, i8 32, i8 103, i8 108, i8 95, i8 84, i8 101, i8 120, i8 67, i8 111, i8 111, i8 114, i8 100, i8 91, i8 48, i8 93, i8 46, i8 120, i8 121, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 100, i8 32, i8 32, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 118, i8 101, i8 99, i8 50, i8 32, i8 32, i8 118, i8 32, i8 32, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 118, i8 101, i8 108, i8 44, i8 32, i8 32, i8 117, i8 118, i8 41, i8 46, i8 114, i8 97, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 118, i8 109, i8 32, i8 61, i8 32, i8 108, i8 101, i8 110, i8 103, i8 116, i8 104, i8 40, i8 118, i8 41, i8 32, i8 42, i8 32, i8 50, i8 46, i8 48, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 116, i8 32, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 100, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 87, i8 105, i8 100, i8 101, i8 32, i8 98, i8 108, i8 111, i8 111, i8 109, i8 32, i8 45, i8 32, i8 56, i8 45, i8 116, i8 97, i8 112, i8 32, i8 103, i8 97, i8 116, i8 104, i8 101, i8 114, i8 32, i8 97, i8 116, i8 32, i8 116, i8 119, i8 111, i8 32, i8 114, i8 97, i8 100, i8 105, i8 105, i8 10, i8 32, i8 32, i8 32, i8 32, i8 118, i8 101, i8 99, i8 50, i8 32, i8 32, i8 112, i8 120, i8 32, i8 32, i8 32, i8 61, i8 32, i8 49, i8 46, i8 48, i8 32, i8 47, i8 32, i8 117, i8 95, i8 114, i8 101, i8 115, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 48, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 45, i8 112, i8 120, i8 46, i8 120, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 32, i8 112, i8 120, i8 46, i8 120, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 45, i8 112, i8 120, i8 46, i8 121, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 112, i8 120, i8 46, i8 121, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 45, i8 112, i8 120, i8 46, i8 120, i8 42, i8 50, i8 46, i8 53, i8 44, i8 32, i8 32, i8 45, i8 112, i8 120, i8 46, i8 121, i8 42, i8 50, i8 46, i8 53, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 32, i8 112, i8 120, i8 46, i8 120, i8 42, i8 50, i8 46, i8 53, i8 44, i8 32, i8 32, i8 45, i8 112, i8 120, i8 46, i8 121, i8 42, i8 50, i8 46, i8 53, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 45, i8 112, i8 120, i8 46, i8 120, i8 42, i8 50, i8 46, i8 53, i8 44, i8 32, i8 32, i8 32, i8 112, i8 120, i8 46, i8 121, i8 42, i8 50, i8 46, i8 53, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 43, i8 61, i8 32, i8 116, i8 101, i8 120, i8 116, i8 117, i8 114, i8 101, i8 50, i8 68, i8 40, i8 117, i8 95, i8 100, i8 101, i8 110, i8 115, i8 44, i8 32, i8 117, i8 118, i8 32, i8 43, i8 32, i8 118, i8 101, i8 99, i8 50, i8 40, i8 32, i8 112, i8 120, i8 46, i8 120, i8 42, i8 50, i8 46, i8 53, i8 44, i8 32, i8 32, i8 32, i8 112, i8 120, i8 46, i8 121, i8 42, i8 50, i8 46, i8 53, i8 32, i8 41, i8 41, i8 46, i8 114, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 98, i8 108, i8 117, i8 114, i8 32, i8 42, i8 61, i8 32, i8 48, i8 46, i8 49, i8 50, i8 53, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 103, i8 108, i8 111, i8 119, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 98, i8 108, i8 117, i8 114, i8 32, i8 42, i8 32, i8 51, i8 46, i8 48, i8 32, i8 43, i8 32, i8 118, i8 109, i8 32, i8 42, i8 32, i8 116, i8 32, i8 42, i8 32, i8 48, i8 46, i8 53, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 118, i8 101, i8 99, i8 51, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 48, i8 46, i8 48, i8 41, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 49, i8 58, i8 32, i8 67, i8 108, i8 97, i8 115, i8 115, i8 105, i8 99, i8 32, i8 112, i8 108, i8 97, i8 115, i8 109, i8 97, i8 32, i8 45, i8 32, i8 98, i8 108, i8 117, i8 101, i8 47, i8 99, i8 121, i8 97, i8 110, i8 47, i8 109, i8 97, i8 103, i8 101, i8 110, i8 116, i8 97, i8 10, i8 32, i8 32, i8 32, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 48, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 48, i8 46, i8 48, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 48, i8 46, i8 52, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 48, i8 46, i8 56, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 50, i8 58, i8 32, i8 70, i8 105, i8 114, i8 101, i8 32, i8 45, i8 32, i8 98, i8 108, i8 97, i8 99, i8 107, i8 32, i8 45, i8 62, i8 32, i8 114, i8 101, i8 100, i8 32, i8 45, i8 62, i8 32, i8 111, i8 114, i8 97, i8 110, i8 103, i8 101, i8 32, i8 45, i8 62, i8 32, i8 121, i8 101, i8 108, i8 108, i8 111, i8 119, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 49, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 51, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 51, i8 46, i8 48, i8 32, i8 45, i8 32, i8 49, i8 46, i8 48, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 51, i8 46, i8 48, i8 32, i8 45, i8 32, i8 50, i8 46, i8 48, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 51, i8 58, i8 32, i8 84, i8 111, i8 120, i8 105, i8 99, i8 32, i8 45, i8 32, i8 103, i8 114, i8 101, i8 101, i8 110, i8 47, i8 121, i8 101, i8 108, i8 108, i8 111, i8 119, i8 45, i8 103, i8 114, i8 101, i8 101, i8 110, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 50, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 48, i8 46, i8 57, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 48, i8 46, i8 51, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 50, i8 32, i8 43, i8 32, i8 49, i8 46, i8 51, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 52, i8 58, i8 32, i8 73, i8 99, i8 101, i8 32, i8 45, i8 32, i8 100, i8 101, i8 101, i8 112, i8 32, i8 98, i8 108, i8 117, i8 101, i8 32, i8 45, i8 62, i8 32, i8 99, i8 121, i8 97, i8 110, i8 32, i8 45, i8 62, i8 32, i8 119, i8 104, i8 105, i8 116, i8 101, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 51, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 48, i8 32, i8 43, i8 32, i8 49, i8 46, i8 48, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 48, i8 32, i8 43, i8 32, i8 48, i8 46, i8 54, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 48, i8 32, i8 43, i8 32, i8 48, i8 46, i8 49, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 53, i8 58, i8 32, i8 83, i8 117, i8 110, i8 115, i8 101, i8 116, i8 32, i8 45, i8 32, i8 112, i8 117, i8 114, i8 112, i8 108, i8 101, i8 32, i8 45, i8 62, i8 32, i8 109, i8 97, i8 103, i8 101, i8 110, i8 116, i8 97, i8 32, i8 45, i8 62, i8 32, i8 111, i8 114, i8 97, i8 110, i8 103, i8 101, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 52, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 49, i8 32, i8 43, i8 32, i8 48, i8 46, i8 49, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 49, i8 32, i8 43, i8 32, i8 48, i8 46, i8 57, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 49, i8 32, i8 43, i8 32, i8 48, i8 46, i8 53, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 54, i8 58, i8 32, i8 68, i8 101, i8 101, i8 112, i8 32, i8 111, i8 99, i8 101, i8 97, i8 110, i8 32, i8 45, i8 32, i8 110, i8 97, i8 118, i8 121, i8 32, i8 45, i8 62, i8 32, i8 116, i8 101, i8 97, i8 108, i8 32, i8 45, i8 62, i8 32, i8 115, i8 101, i8 97, i8 102, i8 111, i8 97, i8 109, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 53, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 51, i8 32, i8 43, i8 32, i8 49, i8 46, i8 50, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 51, i8 32, i8 43, i8 32, i8 48, i8 46, i8 55, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 51, i8 32, i8 43, i8 32, i8 48, i8 46, i8 50, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 55, i8 58, i8 32, i8 78, i8 101, i8 111, i8 110, i8 32, i8 45, i8 32, i8 104, i8 111, i8 116, i8 32, i8 112, i8 105, i8 110, i8 107, i8 32, i8 45, i8 62, i8 32, i8 112, i8 117, i8 114, i8 112, i8 108, i8 101, i8 32, i8 45, i8 62, i8 32, i8 101, i8 108, i8 101, i8 99, i8 116, i8 114, i8 105, i8 99, i8 32, i8 98, i8 108, i8 117, i8 101, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 54, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 52, i8 32, i8 43, i8 32, i8 48, i8 46, i8 50, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 52, i8 32, i8 43, i8 32, i8 49, i8 46, i8 49, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 48, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 53, i8 32, i8 42, i8 32, i8 99, i8 111, i8 115, i8 40, i8 51, i8 46, i8 49, i8 52, i8 49, i8 53, i8 57, i8 32, i8 42, i8 32, i8 40, i8 116, i8 32, i8 42, i8 32, i8 49, i8 46, i8 52, i8 32, i8 43, i8 32, i8 48, i8 46, i8 54, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 56, i8 58, i8 32, i8 71, i8 111, i8 108, i8 100, i8 32, i8 45, i8 32, i8 98, i8 114, i8 111, i8 119, i8 110, i8 32, i8 45, i8 62, i8 32, i8 103, i8 111, i8 108, i8 100, i8 32, i8 45, i8 62, i8 32, i8 98, i8 114, i8 105, i8 103, i8 104, i8 116, i8 32, i8 121, i8 101, i8 108, i8 108, i8 111, i8 119, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 55, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 114, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 50, i8 46, i8 53, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 103, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 50, i8 46, i8 53, i8 32, i8 45, i8 32, i8 48, i8 46, i8 52, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 46, i8 98, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 51, i8 46, i8 48, i8 32, i8 45, i8 32, i8 50, i8 46, i8 50, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 48, i8 46, i8 51, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 57, i8 58, i8 32, i8 77, i8 111, i8 110, i8 111, i8 99, i8 104, i8 114, i8 111, i8 109, i8 101, i8 32, i8 45, i8 32, i8 119, i8 104, i8 105, i8 116, i8 101, i8 32, i8 99, i8 111, i8 114, i8 101, i8 32, i8 119, i8 105, i8 116, i8 104, i8 32, i8 115, i8 111, i8 102, i8 116, i8 32, i8 104, i8 97, i8 108, i8 111, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 117, i8 95, i8 112, i8 97, i8 108, i8 101, i8 116, i8 116, i8 101, i8 32, i8 61, i8 61, i8 32, i8 56, i8 41, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 108, i8 117, i8 109, i8 32, i8 61, i8 32, i8 116, i8 32, i8 42, i8 32, i8 116, i8 32, i8 42, i8 32, i8 50, i8 46, i8 48, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 108, i8 117, i8 109, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 48, i8 58, i8 32, i8 82, i8 97, i8 105, i8 110, i8 98, i8 111, i8 119, i8 32, i8 45, i8 32, i8 102, i8 117, i8 108, i8 108, i8 32, i8 104, i8 117, i8 101, i8 32, i8 99, i8 121, i8 99, i8 108, i8 101, i8 32, i8 97, i8 99, i8 114, i8 111, i8 115, i8 115, i8 32, i8 100, i8 101, i8 110, i8 115, i8 105, i8 116, i8 121, i8 10, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 123, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 104, i8 32, i8 61, i8 32, i8 116, i8 32, i8 42, i8 32, i8 54, i8 46, i8 48, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 102, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 104, i8 32, i8 45, i8 32, i8 102, i8 108, i8 111, i8 111, i8 114, i8 40, i8 104, i8 41, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 105, i8 102, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 40, i8 104, i8 32, i8 60, i8 32, i8 49, i8 46, i8 48, i8 41, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 49, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 102, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 104, i8 32, i8 60, i8 32, i8 50, i8 46, i8 48, i8 41, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 49, i8 46, i8 48, i8 45, i8 102, i8 44, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 104, i8 32, i8 60, i8 32, i8 51, i8 46, i8 48, i8 41, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 102, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 104, i8 32, i8 60, i8 32, i8 52, i8 46, i8 48, i8 41, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 45, i8 102, i8 44, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 105, i8 102, i8 32, i8 40, i8 104, i8 32, i8 60, i8 32, i8 53, i8 46, i8 48, i8 41, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 102, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 32, i8 32, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 101, i8 108, i8 115, i8 101, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 123, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 49, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 32, i8 32, i8 32, i8 32, i8 49, i8 46, i8 48, i8 45, i8 102, i8 32, i8 32, i8 32, i8 41, i8 59, i8 32, i8 125, i8 10, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 42, i8 61, i8 32, i8 116, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 125, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 83, i8 97, i8 116, i8 117, i8 114, i8 97, i8 116, i8 105, i8 111, i8 110, i8 32, i8 98, i8 111, i8 111, i8 115, i8 116, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 103, i8 114, i8 101, i8 121, i8 32, i8 61, i8 32, i8 100, i8 111, i8 116, i8 40, i8 99, i8 111, i8 108, i8 44, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 48, i8 46, i8 50, i8 57, i8 57, i8 44, i8 32, i8 48, i8 46, i8 53, i8 56, i8 55, i8 44, i8 32, i8 48, i8 46, i8 49, i8 49, i8 52, i8 41, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 61, i8 32, i8 109, i8 105, i8 120, i8 40, i8 118, i8 101, i8 99, i8 51, i8 40, i8 103, i8 114, i8 101, i8 121, i8 41, i8 44, i8 32, i8 99, i8 111, i8 108, i8 44, i8 32, i8 49, i8 46, i8 56, i8 41, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 65, i8 100, i8 100, i8 105, i8 116, i8 105, i8 118, i8 101, i8 32, i8 103, i8 108, i8 111, i8 119, i8 32, i8 104, i8 97, i8 108, i8 111, i8 10, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 43, i8 61, i8 32, i8 99, i8 111, i8 108, i8 32, i8 42, i8 32, i8 103, i8 108, i8 111, i8 119, i8 32, i8 42, i8 32, i8 49, i8 46, i8 52, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 47, i8 47, i8 32, i8 86, i8 101, i8 108, i8 111, i8 99, i8 105, i8 116, i8 121, i8 32, i8 115, i8 104, i8 105, i8 109, i8 109, i8 101, i8 114, i8 10, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 43, i8 61, i8 32, i8 118, i8 101, i8 99, i8 51, i8 40, i8 48, i8 46, i8 48, i8 56, i8 44, i8 32, i8 48, i8 46, i8 50, i8 44, i8 32, i8 48, i8 46, i8 52, i8 41, i8 32, i8 42, i8 32, i8 118, i8 109, i8 32, i8 42, i8 32, i8 100, i8 32, i8 42, i8 32, i8 48, i8 46, i8 54, i8 59, i8 10, i8 10, i8 32, i8 32, i8 32, i8 32, i8 99, i8 111, i8 108, i8 32, i8 42, i8 61, i8 32, i8 116, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 102, i8 108, i8 111, i8 97, i8 116, i8 32, i8 97, i8 108, i8 112, i8 104, i8 97, i8 32, i8 61, i8 32, i8 99, i8 108, i8 97, i8 109, i8 112, i8 40, i8 116, i8 32, i8 42, i8 32, i8 56, i8 46, i8 48, i8 44, i8 32, i8 48, i8 46, i8 48, i8 44, i8 32, i8 49, i8 46, i8 48, i8 41, i8 59, i8 10, i8 32, i8 32, i8 32, i8 32, i8 103, i8 108, i8 95, i8 70, i8 114, i8 97, i8 103, i8 67, i8 111, i8 108, i8 111, i8 114, i8 32, i8 61, i8 32, i8 118, i8 101, i8 99, i8 52, i8 40, i8 99, i8 111, i8 108, i8 44, i8 32, i8 97, i8 108, i8 112, i8 104, i8 97, i8 41, i8 59, i8 10, i8 125, i8 10, i8 0]
@"FONT_SPACE" = internal global [5 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0]
@"FONT_EXCL" = internal global [5 x i32] [i32 0, i32 0, i32 95, i32 0, i32 0]
@"FONT_QUOT" = internal global [5 x i32] [i32 0, i32 7, i32 0, i32 7, i32 0]
@"FONT_HASH" = internal global [5 x i32] [i32 20, i32 127, i32 20, i32 127, i32 20]
@"FONT_DOLL" = internal global [5 x i32] [i32 36, i32 42, i32 127, i32 42, i32 18]
@"FONT_PERC" = internal global [5 x i32] [i32 35, i32 19, i32 8, i32 100, i32 98]
@"FONT_AMP" = internal global [5 x i32] [i32 54, i32 73, i32 85, i32 34, i32 80]
@"FONT_APOS" = internal global [5 x i32] [i32 0, i32 5, i32 3, i32 0, i32 0]
@"FONT_LPAREN" = internal global [5 x i32] [i32 0, i32 28, i32 34, i32 65, i32 0]
@"FONT_RPAREN" = internal global [5 x i32] [i32 0, i32 65, i32 34, i32 28, i32 0]
@"FONT_STAR" = internal global [5 x i32] [i32 20, i32 8, i32 62, i32 8, i32 20]
@"FONT_PLUS" = internal global [5 x i32] [i32 8, i32 8, i32 62, i32 8, i32 8]
@"FONT_COMMA" = internal global [5 x i32] [i32 0, i32 80, i32 48, i32 0, i32 0]
@"FONT_MINUS" = internal global [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8]
@"FONT_PERIOD" = internal global [5 x i32] [i32 0, i32 96, i32 96, i32 0, i32 0]
@"FONT_SLASH" = internal global [5 x i32] [i32 32, i32 16, i32 8, i32 4, i32 2]
@"FONT_0" = internal global [5 x i32] [i32 62, i32 81, i32 73, i32 69, i32 62]
@"FONT_1" = internal global [5 x i32] [i32 0, i32 66, i32 127, i32 64, i32 0]
@"FONT_2" = internal global [5 x i32] [i32 66, i32 97, i32 81, i32 73, i32 70]
@"FONT_3" = internal global [5 x i32] [i32 33, i32 65, i32 69, i32 75, i32 49]
@"FONT_4" = internal global [5 x i32] [i32 24, i32 20, i32 18, i32 127, i32 16]
@"FONT_5" = internal global [5 x i32] [i32 39, i32 69, i32 69, i32 69, i32 57]
@"FONT_6" = internal global [5 x i32] [i32 60, i32 74, i32 73, i32 73, i32 48]
@"FONT_7" = internal global [5 x i32] [i32 1, i32 113, i32 9, i32 5, i32 3]
@"FONT_8" = internal global [5 x i32] [i32 54, i32 73, i32 73, i32 73, i32 54]
@"FONT_9" = internal global [5 x i32] [i32 6, i32 73, i32 73, i32 41, i32 30]
@"FONT_COLON" = internal global [5 x i32] [i32 0, i32 54, i32 54, i32 0, i32 0]
@"FONT_SEMIC" = internal global [5 x i32] [i32 0, i32 86, i32 54, i32 0, i32 0]
@"FONT_LT" = internal global [5 x i32] [i32 8, i32 20, i32 34, i32 65, i32 0]
@"FONT_EQ" = internal global [5 x i32] [i32 20, i32 20, i32 20, i32 20, i32 20]
@"FONT_GT" = internal global [5 x i32] [i32 0, i32 65, i32 34, i32 20, i32 8]
@"FONT_QUEST" = internal global [5 x i32] [i32 2, i32 1, i32 81, i32 9, i32 6]
@"FONT_AT" = internal global [5 x i32] [i32 50, i32 73, i32 121, i32 65, i32 62]
@"FONT_A" = internal global [5 x i32] [i32 126, i32 17, i32 17, i32 17, i32 126]
@"FONT_B" = internal global [5 x i32] [i32 127, i32 73, i32 73, i32 73, i32 54]
@"FONT_C" = internal global [5 x i32] [i32 62, i32 65, i32 65, i32 65, i32 34]
@"FONT_D" = internal global [5 x i32] [i32 127, i32 65, i32 65, i32 34, i32 28]
@"FONT_E" = internal global [5 x i32] [i32 127, i32 73, i32 73, i32 73, i32 65]
@"FONT_F" = internal global [5 x i32] [i32 127, i32 9, i32 9, i32 9, i32 1]
@"FONT_G" = internal global [5 x i32] [i32 62, i32 65, i32 73, i32 73, i32 122]
@"FONT_H" = internal global [5 x i32] [i32 127, i32 8, i32 8, i32 8, i32 127]
@"FONT_I" = internal global [5 x i32] [i32 0, i32 65, i32 127, i32 65, i32 0]
@"FONT_J" = internal global [5 x i32] [i32 32, i32 64, i32 65, i32 63, i32 1]
@"FONT_K" = internal global [5 x i32] [i32 127, i32 8, i32 20, i32 34, i32 65]
@"FONT_L" = internal global [5 x i32] [i32 127, i32 64, i32 64, i32 64, i32 64]
@"FONT_M" = internal global [5 x i32] [i32 127, i32 2, i32 12, i32 2, i32 127]
@"FONT_N" = internal global [5 x i32] [i32 127, i32 4, i32 8, i32 16, i32 127]
@"FONT_O" = internal global [5 x i32] [i32 62, i32 65, i32 65, i32 65, i32 62]
@"FONT_P" = internal global [5 x i32] [i32 127, i32 9, i32 9, i32 9, i32 6]
@"FONT_Q" = internal global [5 x i32] [i32 62, i32 65, i32 81, i32 33, i32 94]
@"FONT_R" = internal global [5 x i32] [i32 127, i32 9, i32 25, i32 41, i32 70]
@"FONT_S" = internal global [5 x i32] [i32 70, i32 73, i32 73, i32 73, i32 49]
@"FONT_T" = internal global [5 x i32] [i32 1, i32 1, i32 127, i32 1, i32 1]
@"FONT_U" = internal global [5 x i32] [i32 63, i32 64, i32 64, i32 64, i32 63]
@"FONT_V" = internal global [5 x i32] [i32 31, i32 32, i32 64, i32 32, i32 31]
@"FONT_W" = internal global [5 x i32] [i32 63, i32 64, i32 56, i32 64, i32 63]
@"FONT_X" = internal global [5 x i32] [i32 99, i32 20, i32 8, i32 20, i32 99]
@"FONT_Y" = internal global [5 x i32] [i32 7, i32 8, i32 112, i32 8, i32 7]
@"FONT_Z" = internal global [5 x i32] [i32 97, i32 81, i32 73, i32 69, i32 67]
define i32* @"font_glyph__1__intE1__ret_dataE1_ptr1_ubits32"(i32 %"c")
{
entry:
  %"c.addr" = alloca i32
  store i32 %"c", i32* %"c.addr"
  %"c.1" = load i32, i32* %"c.addr"
  %".4" = icmp eq i32 %"c.1", 32
  br i1 %".4", label %"then", label %"else"
then:
  %".6" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_SPACE", i32 0, i32 0
  ret i32* %".6"
else:
  br label %"ifcont"
ifcont:
  %"c.2" = load i32, i32* %"c.addr"
  %".9" = icmp eq i32 %"c.2", 33
  br i1 %".9", label %"then.1", label %"else.1"
then.1:
  %".11" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_EXCL", i32 0, i32 0
  ret i32* %".11"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"c.3" = load i32, i32* %"c.addr"
  %".14" = icmp eq i32 %"c.3", 34
  br i1 %".14", label %"then.2", label %"else.2"
then.2:
  %".16" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_QUOT", i32 0, i32 0
  ret i32* %".16"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"c.4" = load i32, i32* %"c.addr"
  %".19" = icmp eq i32 %"c.4", 35
  br i1 %".19", label %"then.3", label %"else.3"
then.3:
  %".21" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_HASH", i32 0, i32 0
  ret i32* %".21"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"c.5" = load i32, i32* %"c.addr"
  %".24" = icmp eq i32 %"c.5", 36
  br i1 %".24", label %"then.4", label %"else.4"
then.4:
  %".26" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_DOLL", i32 0, i32 0
  ret i32* %".26"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"c.6" = load i32, i32* %"c.addr"
  %".29" = icmp eq i32 %"c.6", 37
  br i1 %".29", label %"then.5", label %"else.5"
then.5:
  %".31" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_PERC", i32 0, i32 0
  ret i32* %".31"
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"c.7" = load i32, i32* %"c.addr"
  %".34" = icmp eq i32 %"c.7", 38
  br i1 %".34", label %"then.6", label %"else.6"
then.6:
  %".36" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_AMP", i32 0, i32 0
  ret i32* %".36"
else.6:
  br label %"ifcont.6"
ifcont.6:
  %"c.8" = load i32, i32* %"c.addr"
  %".39" = icmp eq i32 %"c.8", 39
  br i1 %".39", label %"then.7", label %"else.7"
then.7:
  %".41" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_APOS", i32 0, i32 0
  ret i32* %".41"
else.7:
  br label %"ifcont.7"
ifcont.7:
  %"c.9" = load i32, i32* %"c.addr"
  %".44" = icmp eq i32 %"c.9", 40
  br i1 %".44", label %"then.8", label %"else.8"
then.8:
  %".46" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_LPAREN", i32 0, i32 0
  ret i32* %".46"
else.8:
  br label %"ifcont.8"
ifcont.8:
  %"c.10" = load i32, i32* %"c.addr"
  %".49" = icmp eq i32 %"c.10", 41
  br i1 %".49", label %"then.9", label %"else.9"
then.9:
  %".51" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_RPAREN", i32 0, i32 0
  ret i32* %".51"
else.9:
  br label %"ifcont.9"
ifcont.9:
  %"c.11" = load i32, i32* %"c.addr"
  %".54" = icmp eq i32 %"c.11", 42
  br i1 %".54", label %"then.10", label %"else.10"
then.10:
  %".56" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_STAR", i32 0, i32 0
  ret i32* %".56"
else.10:
  br label %"ifcont.10"
ifcont.10:
  %"c.12" = load i32, i32* %"c.addr"
  %".59" = icmp eq i32 %"c.12", 43
  br i1 %".59", label %"then.11", label %"else.11"
then.11:
  %".61" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_PLUS", i32 0, i32 0
  ret i32* %".61"
else.11:
  br label %"ifcont.11"
ifcont.11:
  %"c.13" = load i32, i32* %"c.addr"
  %".64" = icmp eq i32 %"c.13", 44
  br i1 %".64", label %"then.12", label %"else.12"
then.12:
  %".66" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_COMMA", i32 0, i32 0
  ret i32* %".66"
else.12:
  br label %"ifcont.12"
ifcont.12:
  %"c.14" = load i32, i32* %"c.addr"
  %".69" = icmp eq i32 %"c.14", 45
  br i1 %".69", label %"then.13", label %"else.13"
then.13:
  %".71" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_MINUS", i32 0, i32 0
  ret i32* %".71"
else.13:
  br label %"ifcont.13"
ifcont.13:
  %"c.15" = load i32, i32* %"c.addr"
  %".74" = icmp eq i32 %"c.15", 46
  br i1 %".74", label %"then.14", label %"else.14"
then.14:
  %".76" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_PERIOD", i32 0, i32 0
  ret i32* %".76"
else.14:
  br label %"ifcont.14"
ifcont.14:
  %"c.16" = load i32, i32* %"c.addr"
  %".79" = icmp eq i32 %"c.16", 47
  br i1 %".79", label %"then.15", label %"else.15"
then.15:
  %".81" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_SLASH", i32 0, i32 0
  ret i32* %".81"
else.15:
  br label %"ifcont.15"
ifcont.15:
  %"c.17" = load i32, i32* %"c.addr"
  %".84" = icmp eq i32 %"c.17", 48
  br i1 %".84", label %"then.16", label %"else.16"
then.16:
  %".86" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_0", i32 0, i32 0
  ret i32* %".86"
else.16:
  br label %"ifcont.16"
ifcont.16:
  %"c.18" = load i32, i32* %"c.addr"
  %".89" = icmp eq i32 %"c.18", 49
  br i1 %".89", label %"then.17", label %"else.17"
then.17:
  %".91" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_1", i32 0, i32 0
  ret i32* %".91"
else.17:
  br label %"ifcont.17"
ifcont.17:
  %"c.19" = load i32, i32* %"c.addr"
  %".94" = icmp eq i32 %"c.19", 50
  br i1 %".94", label %"then.18", label %"else.18"
then.18:
  %".96" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_2", i32 0, i32 0
  ret i32* %".96"
else.18:
  br label %"ifcont.18"
ifcont.18:
  %"c.20" = load i32, i32* %"c.addr"
  %".99" = icmp eq i32 %"c.20", 51
  br i1 %".99", label %"then.19", label %"else.19"
then.19:
  %".101" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_3", i32 0, i32 0
  ret i32* %".101"
else.19:
  br label %"ifcont.19"
ifcont.19:
  %"c.21" = load i32, i32* %"c.addr"
  %".104" = icmp eq i32 %"c.21", 52
  br i1 %".104", label %"then.20", label %"else.20"
then.20:
  %".106" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_4", i32 0, i32 0
  ret i32* %".106"
else.20:
  br label %"ifcont.20"
ifcont.20:
  %"c.22" = load i32, i32* %"c.addr"
  %".109" = icmp eq i32 %"c.22", 53
  br i1 %".109", label %"then.21", label %"else.21"
then.21:
  %".111" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_5", i32 0, i32 0
  ret i32* %".111"
else.21:
  br label %"ifcont.21"
ifcont.21:
  %"c.23" = load i32, i32* %"c.addr"
  %".114" = icmp eq i32 %"c.23", 54
  br i1 %".114", label %"then.22", label %"else.22"
then.22:
  %".116" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_6", i32 0, i32 0
  ret i32* %".116"
else.22:
  br label %"ifcont.22"
ifcont.22:
  %"c.24" = load i32, i32* %"c.addr"
  %".119" = icmp eq i32 %"c.24", 55
  br i1 %".119", label %"then.23", label %"else.23"
then.23:
  %".121" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_7", i32 0, i32 0
  ret i32* %".121"
else.23:
  br label %"ifcont.23"
ifcont.23:
  %"c.25" = load i32, i32* %"c.addr"
  %".124" = icmp eq i32 %"c.25", 56
  br i1 %".124", label %"then.24", label %"else.24"
then.24:
  %".126" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_8", i32 0, i32 0
  ret i32* %".126"
else.24:
  br label %"ifcont.24"
ifcont.24:
  %"c.26" = load i32, i32* %"c.addr"
  %".129" = icmp eq i32 %"c.26", 57
  br i1 %".129", label %"then.25", label %"else.25"
then.25:
  %".131" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_9", i32 0, i32 0
  ret i32* %".131"
else.25:
  br label %"ifcont.25"
ifcont.25:
  %"c.27" = load i32, i32* %"c.addr"
  %".134" = icmp eq i32 %"c.27", 58
  br i1 %".134", label %"then.26", label %"else.26"
then.26:
  %".136" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_COLON", i32 0, i32 0
  ret i32* %".136"
else.26:
  br label %"ifcont.26"
ifcont.26:
  %"c.28" = load i32, i32* %"c.addr"
  %".139" = icmp eq i32 %"c.28", 59
  br i1 %".139", label %"then.27", label %"else.27"
then.27:
  %".141" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_SEMIC", i32 0, i32 0
  ret i32* %".141"
else.27:
  br label %"ifcont.27"
ifcont.27:
  %"c.29" = load i32, i32* %"c.addr"
  %".144" = icmp eq i32 %"c.29", 60
  br i1 %".144", label %"then.28", label %"else.28"
then.28:
  %".146" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_LT", i32 0, i32 0
  ret i32* %".146"
else.28:
  br label %"ifcont.28"
ifcont.28:
  %"c.30" = load i32, i32* %"c.addr"
  %".149" = icmp eq i32 %"c.30", 61
  br i1 %".149", label %"then.29", label %"else.29"
then.29:
  %".151" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_EQ", i32 0, i32 0
  ret i32* %".151"
else.29:
  br label %"ifcont.29"
ifcont.29:
  %"c.31" = load i32, i32* %"c.addr"
  %".154" = icmp eq i32 %"c.31", 62
  br i1 %".154", label %"then.30", label %"else.30"
then.30:
  %".156" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_GT", i32 0, i32 0
  ret i32* %".156"
else.30:
  br label %"ifcont.30"
ifcont.30:
  %"c.32" = load i32, i32* %"c.addr"
  %".159" = icmp eq i32 %"c.32", 63
  br i1 %".159", label %"then.31", label %"else.31"
then.31:
  %".161" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_QUEST", i32 0, i32 0
  ret i32* %".161"
else.31:
  br label %"ifcont.31"
ifcont.31:
  %"c.33" = load i32, i32* %"c.addr"
  %".164" = icmp eq i32 %"c.33", 64
  br i1 %".164", label %"then.32", label %"else.32"
then.32:
  %".166" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_AT", i32 0, i32 0
  ret i32* %".166"
else.32:
  br label %"ifcont.32"
ifcont.32:
  %"c.34" = load i32, i32* %"c.addr"
  %".169" = icmp eq i32 %"c.34", 65
  br i1 %".169", label %"then.33", label %"else.33"
then.33:
  %".171" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_A", i32 0, i32 0
  ret i32* %".171"
else.33:
  br label %"ifcont.33"
ifcont.33:
  %"c.35" = load i32, i32* %"c.addr"
  %".174" = icmp eq i32 %"c.35", 66
  br i1 %".174", label %"then.34", label %"else.34"
then.34:
  %".176" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_B", i32 0, i32 0
  ret i32* %".176"
else.34:
  br label %"ifcont.34"
ifcont.34:
  %"c.36" = load i32, i32* %"c.addr"
  %".179" = icmp eq i32 %"c.36", 67
  br i1 %".179", label %"then.35", label %"else.35"
then.35:
  %".181" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_C", i32 0, i32 0
  ret i32* %".181"
else.35:
  br label %"ifcont.35"
ifcont.35:
  %"c.37" = load i32, i32* %"c.addr"
  %".184" = icmp eq i32 %"c.37", 68
  br i1 %".184", label %"then.36", label %"else.36"
then.36:
  %".186" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_D", i32 0, i32 0
  ret i32* %".186"
else.36:
  br label %"ifcont.36"
ifcont.36:
  %"c.38" = load i32, i32* %"c.addr"
  %".189" = icmp eq i32 %"c.38", 69
  br i1 %".189", label %"then.37", label %"else.37"
then.37:
  %".191" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_E", i32 0, i32 0
  ret i32* %".191"
else.37:
  br label %"ifcont.37"
ifcont.37:
  %"c.39" = load i32, i32* %"c.addr"
  %".194" = icmp eq i32 %"c.39", 70
  br i1 %".194", label %"then.38", label %"else.38"
then.38:
  %".196" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_F", i32 0, i32 0
  ret i32* %".196"
else.38:
  br label %"ifcont.38"
ifcont.38:
  %"c.40" = load i32, i32* %"c.addr"
  %".199" = icmp eq i32 %"c.40", 71
  br i1 %".199", label %"then.39", label %"else.39"
then.39:
  %".201" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_G", i32 0, i32 0
  ret i32* %".201"
else.39:
  br label %"ifcont.39"
ifcont.39:
  %"c.41" = load i32, i32* %"c.addr"
  %".204" = icmp eq i32 %"c.41", 72
  br i1 %".204", label %"then.40", label %"else.40"
then.40:
  %".206" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_H", i32 0, i32 0
  ret i32* %".206"
else.40:
  br label %"ifcont.40"
ifcont.40:
  %"c.42" = load i32, i32* %"c.addr"
  %".209" = icmp eq i32 %"c.42", 73
  br i1 %".209", label %"then.41", label %"else.41"
then.41:
  %".211" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_I", i32 0, i32 0
  ret i32* %".211"
else.41:
  br label %"ifcont.41"
ifcont.41:
  %"c.43" = load i32, i32* %"c.addr"
  %".214" = icmp eq i32 %"c.43", 74
  br i1 %".214", label %"then.42", label %"else.42"
then.42:
  %".216" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_J", i32 0, i32 0
  ret i32* %".216"
else.42:
  br label %"ifcont.42"
ifcont.42:
  %"c.44" = load i32, i32* %"c.addr"
  %".219" = icmp eq i32 %"c.44", 75
  br i1 %".219", label %"then.43", label %"else.43"
then.43:
  %".221" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_K", i32 0, i32 0
  ret i32* %".221"
else.43:
  br label %"ifcont.43"
ifcont.43:
  %"c.45" = load i32, i32* %"c.addr"
  %".224" = icmp eq i32 %"c.45", 76
  br i1 %".224", label %"then.44", label %"else.44"
then.44:
  %".226" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_L", i32 0, i32 0
  ret i32* %".226"
else.44:
  br label %"ifcont.44"
ifcont.44:
  %"c.46" = load i32, i32* %"c.addr"
  %".229" = icmp eq i32 %"c.46", 77
  br i1 %".229", label %"then.45", label %"else.45"
then.45:
  %".231" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_M", i32 0, i32 0
  ret i32* %".231"
else.45:
  br label %"ifcont.45"
ifcont.45:
  %"c.47" = load i32, i32* %"c.addr"
  %".234" = icmp eq i32 %"c.47", 78
  br i1 %".234", label %"then.46", label %"else.46"
then.46:
  %".236" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_N", i32 0, i32 0
  ret i32* %".236"
else.46:
  br label %"ifcont.46"
ifcont.46:
  %"c.48" = load i32, i32* %"c.addr"
  %".239" = icmp eq i32 %"c.48", 79
  br i1 %".239", label %"then.47", label %"else.47"
then.47:
  %".241" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_O", i32 0, i32 0
  ret i32* %".241"
else.47:
  br label %"ifcont.47"
ifcont.47:
  %"c.49" = load i32, i32* %"c.addr"
  %".244" = icmp eq i32 %"c.49", 80
  br i1 %".244", label %"then.48", label %"else.48"
then.48:
  %".246" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_P", i32 0, i32 0
  ret i32* %".246"
else.48:
  br label %"ifcont.48"
ifcont.48:
  %"c.50" = load i32, i32* %"c.addr"
  %".249" = icmp eq i32 %"c.50", 81
  br i1 %".249", label %"then.49", label %"else.49"
then.49:
  %".251" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_Q", i32 0, i32 0
  ret i32* %".251"
else.49:
  br label %"ifcont.49"
ifcont.49:
  %"c.51" = load i32, i32* %"c.addr"
  %".254" = icmp eq i32 %"c.51", 82
  br i1 %".254", label %"then.50", label %"else.50"
then.50:
  %".256" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_R", i32 0, i32 0
  ret i32* %".256"
else.50:
  br label %"ifcont.50"
ifcont.50:
  %"c.52" = load i32, i32* %"c.addr"
  %".259" = icmp eq i32 %"c.52", 83
  br i1 %".259", label %"then.51", label %"else.51"
then.51:
  %".261" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_S", i32 0, i32 0
  ret i32* %".261"
else.51:
  br label %"ifcont.51"
ifcont.51:
  %"c.53" = load i32, i32* %"c.addr"
  %".264" = icmp eq i32 %"c.53", 84
  br i1 %".264", label %"then.52", label %"else.52"
then.52:
  %".266" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_T", i32 0, i32 0
  ret i32* %".266"
else.52:
  br label %"ifcont.52"
ifcont.52:
  %"c.54" = load i32, i32* %"c.addr"
  %".269" = icmp eq i32 %"c.54", 85
  br i1 %".269", label %"then.53", label %"else.53"
then.53:
  %".271" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_U", i32 0, i32 0
  ret i32* %".271"
else.53:
  br label %"ifcont.53"
ifcont.53:
  %"c.55" = load i32, i32* %"c.addr"
  %".274" = icmp eq i32 %"c.55", 86
  br i1 %".274", label %"then.54", label %"else.54"
then.54:
  %".276" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_V", i32 0, i32 0
  ret i32* %".276"
else.54:
  br label %"ifcont.54"
ifcont.54:
  %"c.56" = load i32, i32* %"c.addr"
  %".279" = icmp eq i32 %"c.56", 87
  br i1 %".279", label %"then.55", label %"else.55"
then.55:
  %".281" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_W", i32 0, i32 0
  ret i32* %".281"
else.55:
  br label %"ifcont.55"
ifcont.55:
  %"c.57" = load i32, i32* %"c.addr"
  %".284" = icmp eq i32 %"c.57", 88
  br i1 %".284", label %"then.56", label %"else.56"
then.56:
  %".286" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_X", i32 0, i32 0
  ret i32* %".286"
else.56:
  br label %"ifcont.56"
ifcont.56:
  %"c.58" = load i32, i32* %"c.addr"
  %".289" = icmp eq i32 %"c.58", 89
  br i1 %".289", label %"then.57", label %"else.57"
then.57:
  %".291" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_Y", i32 0, i32 0
  ret i32* %".291"
else.57:
  br label %"ifcont.57"
ifcont.57:
  %"c.59" = load i32, i32* %"c.addr"
  %".294" = icmp eq i32 %"c.59", 90
  br i1 %".294", label %"then.58", label %"else.58"
then.58:
  %".296" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_Z", i32 0, i32 0
  ret i32* %".296"
else.58:
  br label %"ifcont.58"
ifcont.58:
  %".299" = getelementptr inbounds [5 x i32], [5 x i32]* @"FONT_SPACE", i32 0, i32 0
  ret i32* %".299"
}

define void @"draw_gui__2__intE1__intE1__ret_voidE1"(i32 %"w", i32 %"h")
{
entry:
  %"w.addr" = alloca i32
  store i32 %"w", i32* %"w.addr"
  %"h.addr" = alloca i32
  store i32 %"h", i32* %"h.addr"
  %"cx" = alloca i32
  store i32 0, i32* %"cx"
  %"cy" = alloca i32
  store i32 0, i32* %"cy"
  %"tw" = alloca i32
  store i32 0, i32* %"tw"
  %"tx" = alloca i32
  store i32 0, i32* %"tx"
  %"ty" = alloca i32
  store i32 0, i32* %"ty"
  %"scale" = alloca i32
  store i32 0, i32* %"scale"
  %"inv_w" = alloca float
  store float              0x0, float* %"inv_w"
  %"inv_h" = alloca float
  store float              0x0, float* %"inv_h"
  %"labelx" = alloca i8*
  store i8* null, i8** %"labelx"
  %"w.1" = load i32, i32* %"w.addr"
  %".15" = sitofp i32 %"w.1" to float
  %".16" = fdiv float 0x4000000000000000, %".15"
  store float %".16", float* %"inv_w"
  %"h.1" = load i32, i32* %"h.addr"
  %".18" = sitofp i32 %"h.1" to float
  %".19" = fdiv float 0x4000000000000000, %".18"
  store float %".19", float* %"inv_h"
  %"w.2" = load i32, i32* %"w.addr"
  %".21" = sdiv i32 %"w.2", 2
  store i32 %".21", i32* %"cx"
  %"h.2" = load i32, i32* %"h.addr"
  %".23" = sdiv i32 %"h.2", 2
  store i32 %".23", i32* %"cy"
  store i32 2, i32* %"scale"
  %"GL_TEXTURE_2D" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glDisable"(i32 %"GL_TEXTURE_2D")
  %"GL_DEPTH_TEST" = load i32, i32* @"GL_DEPTH_TEST"
  call void @"glDisable"(i32 %"GL_DEPTH_TEST")
  %"GL_BLEND" = load i32, i32* @"GL_BLEND"
  call void @"glEnable"(i32 %"GL_BLEND")
  %"GL_SRC_ALPHA" = load i32, i32* @"GL_SRC_ALPHA"
  %"GL_ONE_MINUS_SRC_ALPHA" = load i32, i32* @"GL_ONE_MINUS_SRC_ALPHA"
  call void @"glBlendFunc"(i32 %"GL_SRC_ALPHA", i32 %"GL_ONE_MINUS_SRC_ALPHA")
  %"cx.1" = load i32, i32* %"cx"
  %"cy.1" = load i32, i32* %"cy"
  %".30" = sdiv i32 220, 2
  %".31" = sdiv i32 52, 2
  %"inv_w.1" = load float, float* %"inv_w"
  %"inv_h.1" = load float, float* %"inv_h"
  call void @"draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i32 %"cx.1", i32 %"cy.1", i32 %".30", i32 %".31", i32 18, float %"inv_w.1", float %"inv_h.1")
  %"str_stack" = alloca [11 x i8]
  %"str_char_0" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 0
  store i8 83, i8* %"str_char_0"
  %"str_char_1" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 1
  store i8 84, i8* %"str_char_1"
  %"str_char_2" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 2
  store i8 65, i8* %"str_char_2"
  %"str_char_3" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 3
  store i8 82, i8* %"str_char_3"
  %"str_char_4" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 4
  store i8 84, i8* %"str_char_4"
  %"str_char_5" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 5
  store i8 32, i8* %"str_char_5"
  %"str_char_6" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 6
  store i8 71, i8* %"str_char_6"
  %"str_char_7" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 7
  store i8 65, i8* %"str_char_7"
  %"str_char_8" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 8
  store i8 77, i8* %"str_char_8"
  %"str_char_9" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 9
  store i8 69, i8* %"str_char_9"
  %"str_char_10" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 10
  store i8 0, i8* %"str_char_10"
  %"array_to_elem_ptr" = getelementptr [11 x i8], [11 x i8]* %"str_stack", i32 0, i32 0
  store i8* %"array_to_elem_ptr", i8** %"labelx"
  %"labelx.1" = load i8*, i8** %"labelx"
  %"scale.1" = load i32, i32* %"scale"
  %".45" = call i32 @"text_width__2__byteE1_ptr1__intE1__ret_intE1"(i8* %"labelx.1", i32 %"scale.1")
  store i32 %".45", i32* %"tw"
  %"cx.2" = load i32, i32* %"cx"
  %"tw.1" = load i32, i32* %"tw"
  %".47" = sdiv i32 %"tw.1", 2
  %".48" = sub i32 %"cx.2", %".47"
  store i32 %".48", i32* %"tx"
  %"cy.2" = load i32, i32* %"cy"
  %"scale.2" = load i32, i32* %"scale"
  %".50" = mul i32 7, %"scale.2"
  %".51" = sdiv i32 %".50", 2
  %".52" = sub i32 %"cy.2", %".51"
  store i32 %".52", i32* %"ty"
  call void @"glColor4f"(float 0x3fe8000000000000, float 0x3fec28f5c0000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %"labelx.2" = load i8*, i8** %"labelx"
  %"tx.1" = load i32, i32* %"tx"
  %"ty.1" = load i32, i32* %"ty"
  %"scale.3" = load i32, i32* %"scale"
  %"inv_w.2" = load float, float* %"inv_w"
  %"inv_h.2" = load float, float* %"inv_h"
  call void @"draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1"(i8* %"labelx.2", i32 %"tx.1", i32 %"ty.1", i32 %"scale.3", float %"inv_w.2", float %"inv_h.2")
  %"GL_BLEND.1" = load i32, i32* @"GL_BLEND"
  call void @"glDisable"(i32 %"GL_BLEND.1")
  %"GL_TEXTURE_2D.1" = load i32, i32* @"GL_TEXTURE_2D"
  call void @"glEnable"(i32 %"GL_TEXTURE_2D.1")
  ret void
}
