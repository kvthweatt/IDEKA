; ModuleID = "IDEKA_module"
target triple = "x86_64-pc-windows-msvc"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

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
%"PCG32" = type {i64, i64}
@"standard__system__cpu__g_l2_bytes" = internal global i64 0
@"standard__system__cpu__g_ermsb" = internal global i1 0
@"standard__system__cpu__g_cpuid_run" = internal global i1 0
@"standard__memory__allocators__stdheap__g_next_slab_size" = internal global i64 4194304
@"standard__memory__allocators__stdheap__g_slab_size_cap" = internal global i64 67108864
@"standard__memory__allocators__stdheap__g_large_used" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_cap" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_count" = internal global i64 0
@"standard__memory__allocators__stdheap__g_table_slab_cap" = internal global i64 0
@"standard__time__TIME_NS_PER_US" = internal global i64 1000
@"standard__time__TIME_NS_PER_MS" = internal global i64 1000000
@"standard__time__TIME_NS_PER_SEC" = internal global i64 1000000000
@"standard__io__console__out_buf" = internal global [8192 x i8] zeroinitializer
@"standard__io__console__out_len" = internal global i32 0
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
@"PCG32.TLD" = internal constant {i32, i32, [2 x {i32, i32, i32}]} {i32 128, i32 2, [2 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 64, i32 1}, {i32, i32, i32} {i32 64, i32 64, i32 1}]}
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

declare external void @"Sleep"(i32 %"arg0")

declare external i8* @"fgets"(i8* %"arg0", i32 %"arg1", i8* %"arg2")

declare external i8* @"fopen"(i8* %"arg0", i8* %"arg1")

declare external i32 @"fclose"(i8* %"arg0")

declare external i64 @"GetStdHandle"(i32 %"nStdHandle")

declare external i16* @"GetCommandLineW"()

declare external i8* @"LocalFree"(i8* %"x")

declare external void @"RtlExitUserProcess"(i32 %"code")

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

define i64 @"standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"size") alwaysinline
{
entry:
  %"size.addr" = alloca i64
  store i64 %"size", i64* %"size.addr"
  %"size.1" = load i64, i64* %"size.addr"
  %".4" = zext i32 4096 to i64
  %".5" = icmp ugt i64 %"size.1", %".4"
  switch i1 %".5", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"size.2" = load i64, i64* %"size.addr"
  %".10" = zext i32 16 to i64
  %".11" = icmp ule i64 %"size.2", %".10"
  switch i1 %".11", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  %".7" = sext i32 9 to i64
  ret i64 %".7"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"size.3" = load i64, i64* %"size.addr"
  %".16" = zext i32 1 to i64
  %".17" = sub i64 %"size.3", %".16"
  %".18" = call i64 @"standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".17")
  %".19" = sext i32 3 to i64
  %".20" = sub i64 %".18", %".19"
  ret i64 %".20"
switch_case_0.1:
  %".13" = sext i32 0 to i64
  ret i64 %".13"
switch_default.1:
  br label %"switch_merge.1"
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

define %"FreeNode"* @"standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1"(i64 %"cls") alwaysinline
{
entry:
  %"cls.addr" = alloca i64
  store i64 %"cls", i64* %"cls.addr"
  %"cls.1" = load i64, i64* %"cls.addr"
  %".4" = zext i32 8 to i64
  %".5" = icmp ugt i64 %"cls.1", %".4"
  %"n" = alloca %"FreeNode"*
  switch i1 %".5", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"cls.2" = load i64, i64* %"cls.addr"
  %"idx_trunc" = trunc i64 %"cls.2" to i32
  %"array_gep" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i32 %"idx_trunc"
  %"array_load" = load %"FreeNode"*, %"FreeNode"** %"array_gep"
  store %"FreeNode"* %"array_load", %"FreeNode"** %"n"
  %"obj_this" = load %"FreeNode"*, %"FreeNode"** %"n"
  %"n.1" = load %"FreeNode"*, %"FreeNode"** %"n"
  %"not_null" = icmp ne %"FreeNode"* %"n.1", null
  %"not_null_result" = zext i1 %"not_null" to i8
  switch i8 %"not_null_result", label %"switch_default.1" [i8 1, label %"switch_case_0.1"]
switch_case_0:
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"FreeNode"*
  ret %"FreeNode"* %"int_to_ptr"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"obj_this.1" = load %"FreeNode"*, %"FreeNode"** %"n"
  %"n.4" = load %"FreeNode"*, %"FreeNode"** %"n"
  ret %"FreeNode"* %"n.4"
switch_case_0.1:
  %"n.2" = load %"FreeNode"*, %"FreeNode"** %"n"
  %"n.3" = load %"FreeNode"*, %"FreeNode"** %"n"
  %"next_ptr" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"n.3", i32 0, i32 0
  %"next" = load %"FreeNode"*, %"FreeNode"** %"next_ptr"
  %"cls.3" = load i64, i64* %"cls.addr"
  %".11" = getelementptr inbounds [9 x %"FreeNode"*], [9 x %"FreeNode"*]* @"standard__memory__allocators__stdheap__g_bins", i32 0, i64 %"cls.3"
  store %"FreeNode"* %"next", %"FreeNode"** %".11"
  br label %"switch_merge.1"
switch_default.1:
  br label %"switch_merge.1"
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

define i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr", i64 %"new_size")
{
entry:
  %"ptr.addr" = alloca i64
  store i64 %"ptr", i64* %"ptr.addr"
  %"new_size.addr" = alloca i64
  store i64 %"new_size", i64* %"new_size.addr"
  %"ptr.1" = load i64, i64* %"ptr.addr"
  %".6" = zext i1 0 to i64
  %".7" = icmp eq i64 %"ptr.1", %".6"
  %"entry.1" = alloca %"BlockEntry"*
  %"kind" = alloca i64
  %"new_ptr" = alloca i64
  %"old_size" = alloca i64
  %"copy_size" = alloca i64
  %"i" = alloca i64
  %"src" = alloca i8*
  %"dst" = alloca i8*
  %"same" = alloca i1
  %"shrink" = alloca i1
  %"has_reuse" = alloca i1
  %"reuse" = alloca %"FreeNode"*
  %"old_owner" = alloca %"Slab"*
  %"new_owner" = alloca %"Slab"*
  %"ws" = alloca %"Slab"*
  %"old_cls" = alloca i64
  %"new_cls" = alloca i64
  %"reuse_entry" = alloca %"BlockEntry"*
  switch i1 %".7", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"new_size.2" = load i64, i64* %"new_size.addr"
  %".12" = zext i32 0 to i64
  %".13" = icmp eq i64 %"new_size.2", %".12"
  switch i1 %".13", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_case_0:
  %"new_size.1" = load i64, i64* %"new_size.addr"
  %".9" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"new_size.1")
  ret i64 %".9"
switch_default:
  br label %"switch_merge"
switch_merge.1:
  %"ptr.3" = load i64, i64* %"ptr.addr"
  %".19" = call %"BlockEntry"* @"standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1"(i64 %"ptr.3")
  store %"BlockEntry"* %".19", %"BlockEntry"** %"entry.1"
  %"obj_this" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.2" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"BlockEntry"*
  %".21" = ptrtoint %"BlockEntry"* %"entry.2" to i64
  %".22" = ptrtoint %"BlockEntry"* %"int_to_ptr" to i64
  %".23" = icmp eq i64 %".21", %".22"
  switch i1 %".23", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_case_0.1:
  %"ptr.2" = load i64, i64* %"ptr.addr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.2")
  %".16" = sext i32 0 to i64
  ret i64 %".16"
switch_default.1:
  br label %"switch_merge.1"
switch_merge.2:
  %"entry.3" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.4" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"kind_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.4", i32 0, i32 2
  %"kind.1" = load i64, i64* %"kind_ptr"
  store i64 %"kind.1", i64* %"kind"
  store i64 0, i64* %"new_ptr"
  %"entry.5" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.6" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"size_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.6", i32 0, i32 1
  %"size" = load i64, i64* %"size_ptr"
  store i64 %"size", i64* %"old_size"
  store i64 0, i64* %"copy_size"
  store i64 0, i64* %"i"
  store i8* null, i8** %"src"
  store i8* null, i8** %"dst"
  store i1 0, i1* %"same"
  store i1 0, i1* %"shrink"
  store i1 0, i1* %"has_reuse"
  store %"FreeNode"* null, %"FreeNode"** %"reuse"
  store %"Slab"* null, %"Slab"** %"old_owner"
  store %"Slab"* null, %"Slab"** %"new_owner"
  store %"Slab"* null, %"Slab"** %"ws"
  %"kind.2" = load i64, i64* %"kind"
  %".42" = zext i32 1 to i64
  %".43" = icmp eq i64 %"kind.2", %".42"
  switch i1 %".43", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
switch_case_0.2:
  %".25" = sext i32 0 to i64
  ret i64 %".25"
switch_default.2:
  br label %"switch_merge.2"
switch_merge.3:
  %"new_size.8" = load i64, i64* %"new_size.addr"
  %".144" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"new_size.8")
  store i64 %".144", i64* %"new_ptr"
  %"new_ptr.7" = load i64, i64* %"new_ptr"
  %".146" = zext i1 0 to i64
  %".147" = icmp eq i64 %"new_ptr.7", %".146"
  switch i1 %".147", label %"switch_default.14" [i1 1, label %"switch_case_0.14"]
switch_case_0.3:
  %"old_size.1" = load i64, i64* %"old_size"
  %"new_size.3" = load i64, i64* %"new_size.addr"
  %".45" = icmp eq i64 %"old_size.1", %"new_size.3"
  store i1 %".45", i1* %"same"
  %"same.1" = load i1, i1* %"same"
  switch i1 %"same.1", label %"switch_default.4" [i1 1, label %"switch_case_0.4"]
switch_default.3:
  %"old_size.2" = load i64, i64* %"old_size"
  store i64 %"old_size.2", i64* %"old_cls"
  %"new_size.4" = load i64, i64* %"new_size.addr"
  %".52" = call i64 @"standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"new_size.4")
  store i64 %".52", i64* %"new_cls"
  %"new_cls.1" = load i64, i64* %"new_cls"
  %"old_cls.1" = load i64, i64* %"old_cls"
  %".54" = icmp eq i64 %"new_cls.1", %"old_cls.1"
  store i1 %".54", i1* %"same"
  %"same.2" = load i1, i1* %"same"
  switch i1 %"same.2", label %"switch_default.5" [i1 1, label %"switch_case_0.5"]
switch_merge.4:
  br label %"switch_merge.3"
switch_case_0.4:
  %"ptr.4" = load i64, i64* %"ptr.addr"
  ret i64 %"ptr.4"
switch_default.4:
  br label %"switch_merge.4"
switch_merge.5:
  %"new_cls.2" = load i64, i64* %"new_cls"
  %"old_cls.2" = load i64, i64* %"old_cls"
  %".59" = icmp ult i64 %"new_cls.2", %"old_cls.2"
  store i1 %".59", i1* %"shrink"
  %"shrink.1" = load i1, i1* %"shrink"
  switch i1 %"shrink.1", label %"switch_default.6" [i1 1, label %"switch_case_0.6"]
switch_case_0.5:
  %"ptr.5" = load i64, i64* %"ptr.addr"
  ret i64 %"ptr.5"
switch_default.5:
  br label %"switch_merge.5"
switch_merge.6:
  %"old_cls.3" = load i64, i64* %"old_cls"
  %".64" = call i64 @"standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"old_cls.3")
  store i64 %".64", i64* %"copy_size"
  %"new_size.5" = load i64, i64* %"new_size.addr"
  %"copy_size.1" = load i64, i64* %"copy_size"
  %".66" = icmp ult i64 %"new_size.5", %"copy_size.1"
  switch i1 %".66", label %"switch_default.7" [i1 1, label %"switch_case_0.7"]
switch_case_0.6:
  %"ptr.6" = load i64, i64* %"ptr.addr"
  ret i64 %"ptr.6"
switch_default.6:
  br label %"switch_merge.6"
switch_merge.7:
  %"new_cls.3" = load i64, i64* %"new_cls"
  %".71" = call %"FreeNode"* @"standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1"(i64 %"new_cls.3")
  store %"FreeNode"* %".71", %"FreeNode"** %"reuse"
  %"obj_this.1" = load %"FreeNode"*, %"FreeNode"** %"reuse"
  %"reuse.1" = load %"FreeNode"*, %"FreeNode"** %"reuse"
  %"not_null" = icmp ne %"FreeNode"* %"reuse.1", null
  %"not_null_result" = zext i1 %"not_null" to i8
  %".73" = trunc i8 %"not_null_result" to i1
  store i1 %".73", i1* %"has_reuse"
  %"has_reuse.1" = load i1, i1* %"has_reuse"
  switch i1 %"has_reuse.1", label %"switch_default.8" [i1 1, label %"switch_case_0.8"]
switch_case_0.7:
  %"new_size.6" = load i64, i64* %"new_size.addr"
  store i64 %"new_size.6", i64* %"copy_size"
  br label %"switch_merge.7"
switch_default.7:
  br label %"switch_merge.7"
switch_merge.8:
  %"new_size.7" = load i64, i64* %"new_size.addr"
  %".122" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"new_size.7")
  store i64 %".122", i64* %"new_ptr"
  %"new_ptr.4" = load i64, i64* %"new_ptr"
  %".124" = zext i1 0 to i64
  %".125" = icmp eq i64 %"new_ptr.4", %".124"
  switch i1 %".125", label %"switch_default.13" [i1 1, label %"switch_case_0.13"]
switch_case_0.8:
  %"obj_this.2" = load %"FreeNode"*, %"FreeNode"** %"reuse"
  %"reuse.2" = load %"FreeNode"*, %"FreeNode"** %"reuse"
  %"ptr_to_int" = ptrtoint %"FreeNode"* %"reuse.2" to i64
  store i64 %"ptr_to_int", i64* %"new_ptr"
  %"new_ptr.1" = load i64, i64* %"new_ptr"
  %".77" = call %"BlockEntry"* @"standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1"(i64 %"new_ptr.1")
  store %"BlockEntry"* %".77", %"BlockEntry"** %"reuse_entry"
  %"obj_this.3" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %"reuse_entry.1" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %"not_null.1" = icmp ne %"BlockEntry"* %"reuse_entry.1", null
  %"not_null_result.1" = zext i1 %"not_null.1" to i8
  switch i8 %"not_null_result.1", label %"switch_default.9" [i8 1, label %"switch_case_0.9"]
switch_default.8:
  br label %"switch_merge.8"
switch_merge.9:
  %"ptr.7" = load i64, i64* %"ptr.addr"
  %"int_to_ptr.2" = inttoptr i64 %"ptr.7" to i8*
  store i8* %"int_to_ptr.2", i8** %"src"
  %"new_ptr.2" = load i64, i64* %"new_ptr"
  %"int_to_ptr.3" = inttoptr i64 %"new_ptr.2" to i8*
  store i8* %"int_to_ptr.3", i8** %"dst"
  br label %"while.cond"
switch_case_0.9:
  %"reuse_entry.2" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %"reuse_entry.3" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %"slab_ptr" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"reuse_entry.3", i32 0, i32 3
  %"slab" = load i64, i64* %"slab_ptr"
  %"int_to_ptr.1" = inttoptr i64 %"slab" to %"Slab"*
  store %"Slab"* %"int_to_ptr.1", %"Slab"** %"new_owner"
  %"new_cls.4" = load i64, i64* %"new_cls"
  %"reuse_entry_ptr" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %".81" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"reuse_entry_ptr", i32 0, i32 1
  store i64 %"new_cls.4", i64* %".81"
  %"reuse_entry_ptr.1" = load %"BlockEntry"*, %"BlockEntry"** %"reuse_entry"
  %".83" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"reuse_entry_ptr.1", i32 0, i32 2
  %".84" = sext i32 0 to i64
  store i64 %".84", i64* %".83"
  %"obj_this.4" = load %"Slab"*, %"Slab"** %"new_owner"
  %"new_owner.1" = load %"Slab"*, %"Slab"** %"new_owner"
  %"not_null.2" = icmp ne %"Slab"* %"new_owner.1", null
  %"not_null_result.2" = zext i1 %"not_null.2" to i8
  switch i8 %"not_null_result.2", label %"switch_default.10" [i8 1, label %"switch_case_0.10"]
switch_default.9:
  br label %"switch_merge.9"
switch_merge.10:
  br label %"switch_merge.9"
switch_case_0.10:
  %"new_owner.2" = load %"Slab"*, %"Slab"** %"new_owner"
  %"new_owner.3" = load %"Slab"*, %"Slab"** %"new_owner"
  %"used_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"new_owner.3", i32 0, i32 3
  %"used" = load i64, i64* %"used_ptr"
  %".87" = add i64 %"used", 1
  %"struct_ptr" = load %"Slab"*, %"Slab"** %"new_owner"
  %".88" = getelementptr inbounds %"Slab", %"Slab"* %"struct_ptr", i32 0, i32 3
  store i64 %".87", i64* %".88"
  br label %"switch_merge.10"
switch_default.10:
  br label %"switch_merge.10"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"copy_size.2" = load i64, i64* %"copy_size"
  %".97" = icmp ult i64 %"i.1", %"copy_size.2"
  br i1 %".97", label %"while.body", label %"while.end"
while.body:
  %"src.1" = load i8*, i8** %"src"
  %"i.2" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.2" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"src.1", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"dst.1" = load i8*, i8** %"dst"
  %"i.3" = load i64, i64* %"i"
  %".99" = getelementptr inbounds i8, i8* %"dst.1", i64 %"i.3"
  store i8 %"ptr_load", i8* %".99"
  %"i.4" = load i64, i64* %"i"
  %".101" = add i64 %"i.4", 1
  store i64 %".101", i64* %"i"
  br label %"while.cond"
while.end:
  %"entry.7" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"entry.8" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %"slab_ptr.1" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry.8", i32 0, i32 3
  %"slab.1" = load i64, i64* %"slab_ptr.1"
  %"int_to_ptr.4" = inttoptr i64 %"slab.1" to %"Slab"*
  store %"Slab"* %"int_to_ptr.4", %"Slab"** %"old_owner"
  %"obj_this.5" = load %"Slab"*, %"Slab"** %"old_owner"
  %"old_owner.1" = load %"Slab"*, %"Slab"** %"old_owner"
  %"not_null.3" = icmp ne %"Slab"* %"old_owner.1", null
  %"not_null_result.3" = zext i1 %"not_null.3" to i8
  switch i8 %"not_null_result.3", label %"switch_default.11" [i8 1, label %"switch_case_0.11"]
switch_merge.11:
  %".116" = sext i32 3 to i64
  %"entry_ptr" = load %"BlockEntry"*, %"BlockEntry"** %"entry.1"
  %".117" = getelementptr inbounds %"BlockEntry", %"BlockEntry"* %"entry_ptr", i32 0, i32 2
  store i64 %".116", i64* %".117"
  %"old_cls.4" = load i64, i64* %"old_cls"
  %"ptr.8" = load i64, i64* %"ptr.addr"
  %"int_to_ptr.5" = inttoptr i64 %"ptr.8" to %"FreeNode"*
  call void @"standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1"(i64 %"old_cls.4", %"FreeNode"* %"int_to_ptr.5")
  %"new_ptr.3" = load i64, i64* %"new_ptr"
  ret i64 %"new_ptr.3"
switch_case_0.11:
  %"old_owner.2" = load %"Slab"*, %"Slab"** %"old_owner"
  %"old_owner.3" = load %"Slab"*, %"Slab"** %"old_owner"
  %"used_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"old_owner.3", i32 0, i32 3
  %"used.1" = load i64, i64* %"used_ptr.1"
  %".106" = zext i32 0 to i64
  %".107" = icmp ugt i64 %"used.1", %".106"
  switch i1 %".107", label %"switch_default.12" [i1 1, label %"switch_case_0.12"]
switch_default.11:
  br label %"switch_merge.11"
switch_merge.12:
  br label %"switch_merge.11"
switch_case_0.12:
  %"old_owner.4" = load %"Slab"*, %"Slab"** %"old_owner"
  %"old_owner.5" = load %"Slab"*, %"Slab"** %"old_owner"
  %"used_ptr.2" = getelementptr inbounds %"Slab", %"Slab"* %"old_owner.5", i32 0, i32 3
  %"used.2" = load i64, i64* %"used_ptr.2"
  %".109" = sub i64 %"used.2", 1
  %"struct_ptr.1" = load %"Slab"*, %"Slab"** %"old_owner"
  %".110" = getelementptr inbounds %"Slab", %"Slab"* %"struct_ptr.1", i32 0, i32 3
  store i64 %".109", i64* %".110"
  br label %"switch_merge.12"
switch_default.12:
  br label %"switch_merge.12"
switch_merge.13:
  %"ptr.9" = load i64, i64* %"ptr.addr"
  %"int_to_ptr.6" = inttoptr i64 %"ptr.9" to i8*
  store i8* %"int_to_ptr.6", i8** %"src"
  %"new_ptr.5" = load i64, i64* %"new_ptr"
  %"int_to_ptr.7" = inttoptr i64 %"new_ptr.5" to i8*
  store i8* %"int_to_ptr.7", i8** %"dst"
  %".132" = sext i32 0 to i64
  store i64 %".132", i64* %"i"
  br label %"while.cond.1"
switch_case_0.13:
  %".127" = sext i32 0 to i64
  ret i64 %".127"
switch_default.13:
  br label %"switch_merge.13"
while.cond.1:
  %"i.5" = load i64, i64* %"i"
  %"copy_size.3" = load i64, i64* %"copy_size"
  %".135" = icmp ult i64 %"i.5", %"copy_size.3"
  br i1 %".135", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"src.2" = load i8*, i8** %"src"
  %"i.6" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.6" to i32
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"src.2", i32 %"idx_trunc.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"dst.2" = load i8*, i8** %"dst"
  %"i.7" = load i64, i64* %"i"
  %".137" = getelementptr inbounds i8, i8* %"dst.2", i64 %"i.7"
  store i8 %"ptr_load.1", i8* %".137"
  %"i.8" = load i64, i64* %"i"
  %".139" = add i64 %"i.8", 1
  store i64 %".139", i64* %"i"
  br label %"while.cond.1"
while.end.1:
  %"ptr.10" = load i64, i64* %"ptr.addr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.10")
  %"new_ptr.6" = load i64, i64* %"new_ptr"
  ret i64 %"new_ptr.6"
switch_merge.14:
  %"ptr.11" = load i64, i64* %"ptr.addr"
  %"int_to_ptr.8" = inttoptr i64 %"ptr.11" to i8*
  store i8* %"int_to_ptr.8", i8** %"src"
  %"new_ptr.8" = load i64, i64* %"new_ptr"
  %"int_to_ptr.9" = inttoptr i64 %"new_ptr.8" to i8*
  store i8* %"int_to_ptr.9", i8** %"dst"
  %"old_size.3" = load i64, i64* %"old_size"
  store i64 %"old_size.3", i64* %"copy_size"
  %"new_size.9" = load i64, i64* %"new_size.addr"
  %"old_size.4" = load i64, i64* %"old_size"
  %".155" = icmp ult i64 %"new_size.9", %"old_size.4"
  switch i1 %".155", label %"switch_default.15" [i1 1, label %"switch_case_0.15"]
switch_case_0.14:
  %".149" = sext i32 0 to i64
  ret i64 %".149"
switch_default.14:
  br label %"switch_merge.14"
switch_merge.15:
  %".160" = sext i32 0 to i64
  store i64 %".160", i64* %"i"
  br label %"while.cond.2"
switch_case_0.15:
  %"new_size.10" = load i64, i64* %"new_size.addr"
  store i64 %"new_size.10", i64* %"copy_size"
  br label %"switch_merge.15"
switch_default.15:
  br label %"switch_merge.15"
while.cond.2:
  %"i.9" = load i64, i64* %"i"
  %"copy_size.4" = load i64, i64* %"copy_size"
  %".163" = icmp ult i64 %"i.9", %"copy_size.4"
  br i1 %".163", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"src.3" = load i8*, i8** %"src"
  %"i.10" = load i64, i64* %"i"
  %"idx_trunc.2" = trunc i64 %"i.10" to i32
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"src.3", i32 %"idx_trunc.2"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %"dst.3" = load i8*, i8** %"dst"
  %"i.11" = load i64, i64* %"i"
  %".165" = getelementptr inbounds i8, i8* %"dst.3", i64 %"i.11"
  store i8 %"ptr_load.2", i8* %".165"
  %"i.12" = load i64, i64* %"i"
  %".167" = add i64 %"i.12", 1
  store i64 %".167", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  %"ptr.12" = load i64, i64* %"ptr.addr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.12")
  %"new_ptr.9" = load i64, i64* %"new_ptr"
  ret i64 %"new_ptr.9"
}

define void @"standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1"()
{
entry:
  %"bin_idx" = alloca i64
  store i64 0, i64* %"bin_idx"
  %"addr" = alloca i64
  store i64 0, i64* %"addr"
  %"slab" = alloca %"Slab"*
  %"obj_this" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  store %"Slab"* %"g_slab_head", %"Slab"** %"slab"
  %"prev" = alloca %"Slab"*
  store %"Slab"* null, %"Slab"** %"prev"
  %"next" = alloca %"Slab"*
  store %"Slab"* null, %"Slab"** %"next"
  %"node" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"node"
  %"node_next" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"node_next"
  %"keep_head" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"keep_head"
  %"keep_tail" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"keep_tail"
  %"reinsert" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"reinsert"
  %"reinsert_next" = alloca %"FreeNode"*
  store %"FreeNode"* null, %"FreeNode"** %"reinsert_next"
  br label %"while.cond"
while.cond:
  %"obj_this.1" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.1" = load %"Slab"*, %"Slab"** %"slab"
  %"not_null" = icmp ne %"Slab"* %"slab.1", null
  %"not_null_result" = zext i1 %"not_null" to i8
  %"tobool" = icmp ne i8 %"not_null_result", 0
  br i1 %"tobool", label %"while.body", label %"while.end"
while.body:
  %"slab.2" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.3" = load %"Slab"*, %"Slab"** %"slab"
  %"next_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.3", i32 0, i32 4
  %"next.1" = load %"Slab"*, %"Slab"** %"next_ptr"
  store %"Slab"* %"next.1", %"Slab"** %"next"
  %"slab.4" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.5" = load %"Slab"*, %"Slab"** %"slab"
  %"used_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.5", i32 0, i32 3
  %"used" = load i64, i64* %"used_ptr"
  %".16" = zext i32 0 to i64
  %".17" = icmp eq i64 %"used", %".16"
  switch i1 %".17", label %"switch_default" [i1 1, label %"switch_case_0"]
while.end:
  ret void
switch_merge:
  %"obj_this.18" = load %"Slab"*, %"Slab"** %"next"
  %"next.6" = load %"Slab"*, %"Slab"** %"next"
  store %"Slab"* %"next.6", %"Slab"** %"slab"
  br label %"while.cond"
switch_case_0:
  br label %"while.cond.1"
switch_default:
  %"obj_this.17" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.16" = load %"Slab"*, %"Slab"** %"slab"
  store %"Slab"* %"slab.16", %"Slab"** %"prev"
  br label %"switch_merge"
while.cond.1:
  %"bin_idx.1" = load i64, i64* %"bin_idx"
  %".20" = zext i32 8 to i64
  %".21" = icmp ule i64 %"bin_idx.1", %".20"
  br i1 %".21", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"bin_idx.2" = load i64, i64* %"bin_idx"
  %".23" = call %"FreeNode"* @"standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1"(i64 %"bin_idx.2")
  store %"FreeNode"* %".23", %"FreeNode"** %"node"
  %"int_to_ptr_zext" = zext i32 0 to i64
  %"int_to_ptr" = inttoptr i64 %"int_to_ptr_zext" to %"FreeNode"*
  store %"FreeNode"* %"int_to_ptr", %"FreeNode"** %"keep_head"
  %"int_to_ptr_zext.1" = zext i32 0 to i64
  %"int_to_ptr.1" = inttoptr i64 %"int_to_ptr_zext.1" to %"FreeNode"*
  store %"FreeNode"* %"int_to_ptr.1", %"FreeNode"** %"keep_tail"
  br label %"while.cond.2"
while.end.1:
  %"obj_this.14" = load %"Slab"*, %"Slab"** %"prev"
  %"prev.1" = load %"Slab"*, %"Slab"** %"prev"
  %"int_to_ptr_zext.4" = zext i32 0 to i64
  %"int_to_ptr.4" = inttoptr i64 %"int_to_ptr_zext.4" to %"Slab"*
  %".64" = ptrtoint %"Slab"* %"prev.1" to i64
  %".65" = ptrtoint %"Slab"* %"int_to_ptr.4" to i64
  %".66" = icmp eq i64 %".64", %".65"
  switch i1 %".66", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
while.cond.2:
  %"obj_this.2" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.1" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"not_null.1" = icmp ne %"FreeNode"* %"node.1", null
  %"not_null_result.1" = zext i1 %"not_null.1" to i8
  %"tobool.1" = icmp ne i8 %"not_null_result.1", 0
  br i1 %"tobool.1", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"obj_this.3" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.2" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"ptr_to_int" = ptrtoint %"FreeNode"* %"node.2" to i64
  store i64 %"ptr_to_int", i64* %"addr"
  %"node.3" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.4" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"next_ptr.1" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"node.4", i32 0, i32 0
  %"next.2" = load %"FreeNode"*, %"FreeNode"** %"next_ptr.1"
  store %"FreeNode"* %"next.2", %"FreeNode"** %"node_next"
  %"addr.1" = load i64, i64* %"addr"
  %"slab.6" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.7" = load %"Slab"*, %"Slab"** %"slab"
  %"base_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.7", i32 0, i32 0
  %"base" = load i64, i64* %"base_ptr"
  %".31" = icmp uge i64 %"addr.1", %"base"
  br i1 %".31", label %"sc_rhs", label %"sc_end"
while.end.2:
  %"obj_this.10" = load %"FreeNode"*, %"FreeNode"** %"keep_head"
  %"keep_head.1" = load %"FreeNode"*, %"FreeNode"** %"keep_head"
  store %"FreeNode"* %"keep_head.1", %"FreeNode"** %"reinsert"
  br label %"while.cond.3"
sc_rhs:
  %"addr.2" = load i64, i64* %"addr"
  %"slab.8" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.9" = load %"Slab"*, %"Slab"** %"slab"
  %"base_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.9", i32 0, i32 0
  %"base.1" = load i64, i64* %"base_ptr.1"
  %"slab.10" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.11" = load %"Slab"*, %"Slab"** %"slab"
  %"capacity_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.11", i32 0, i32 1
  %"capacity" = load i64, i64* %"capacity_ptr"
  %".33" = add i64 %"base.1", %"capacity"
  %".34" = icmp ult i64 %"addr.2", %".33"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.body.2"], [%".34", %"sc_rhs"]
  switch i1 %"sc_result", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_merge.1:
  %"obj_this.9" = load %"FreeNode"*, %"FreeNode"** %"node_next"
  %"node_next.1" = load %"FreeNode"*, %"FreeNode"** %"node_next"
  store %"FreeNode"* %"node_next.1", %"FreeNode"** %"node"
  br label %"while.cond.2"
switch_case_0.1:
  br label %"switch_merge.1"
switch_default.1:
  %"int_to_ptr_zext.2" = zext i32 0 to i64
  %"int_to_ptr.2" = inttoptr i64 %"int_to_ptr_zext.2" to %"FreeNode"*
  %"node_ptr" = load %"FreeNode"*, %"FreeNode"** %"node"
  %".38" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"node_ptr", i32 0, i32 0
  store %"FreeNode"* %"int_to_ptr.2", %"FreeNode"** %".38"
  %"obj_this.4" = load %"FreeNode"*, %"FreeNode"** %"keep_tail"
  %"keep_tail.1" = load %"FreeNode"*, %"FreeNode"** %"keep_tail"
  %"int_to_ptr_zext.3" = zext i32 0 to i64
  %"int_to_ptr.3" = inttoptr i64 %"int_to_ptr_zext.3" to %"FreeNode"*
  %".40" = ptrtoint %"FreeNode"* %"keep_tail.1" to i64
  %".41" = ptrtoint %"FreeNode"* %"int_to_ptr.3" to i64
  %".42" = icmp eq i64 %".40", %".41"
  switch i1 %".42", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_merge.2:
  br label %"switch_merge.1"
switch_case_0.2:
  %"obj_this.5" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.5" = load %"FreeNode"*, %"FreeNode"** %"node"
  store %"FreeNode"* %"node.5", %"FreeNode"** %"keep_head"
  %"obj_this.6" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.6" = load %"FreeNode"*, %"FreeNode"** %"node"
  store %"FreeNode"* %"node.6", %"FreeNode"** %"keep_tail"
  br label %"switch_merge.2"
switch_default.2:
  %"obj_this.7" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.7" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"keep_tail_ptr" = load %"FreeNode"*, %"FreeNode"** %"keep_tail"
  %".47" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"keep_tail_ptr", i32 0, i32 0
  store %"FreeNode"* %"node.7", %"FreeNode"** %".47"
  %"obj_this.8" = load %"FreeNode"*, %"FreeNode"** %"node"
  %"node.8" = load %"FreeNode"*, %"FreeNode"** %"node"
  store %"FreeNode"* %"node.8", %"FreeNode"** %"keep_tail"
  br label %"switch_merge.2"
while.cond.3:
  %"obj_this.11" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  %"reinsert.1" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  %"not_null.2" = icmp ne %"FreeNode"* %"reinsert.1", null
  %"not_null_result.2" = zext i1 %"not_null.2" to i8
  %"tobool.2" = icmp ne i8 %"not_null_result.2", 0
  br i1 %"tobool.2", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"reinsert.2" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  %"reinsert.3" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  %"next_ptr.2" = getelementptr inbounds %"FreeNode", %"FreeNode"* %"reinsert.3", i32 0, i32 0
  %"next.3" = load %"FreeNode"*, %"FreeNode"** %"next_ptr.2"
  store %"FreeNode"* %"next.3", %"FreeNode"** %"reinsert_next"
  %"bin_idx.3" = load i64, i64* %"bin_idx"
  %"obj_this.12" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  %"reinsert.4" = load %"FreeNode"*, %"FreeNode"** %"reinsert"
  call void @"standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1"(i64 %"bin_idx.3", %"FreeNode"* %"reinsert.4")
  %"obj_this.13" = load %"FreeNode"*, %"FreeNode"** %"reinsert_next"
  %"reinsert_next.1" = load %"FreeNode"*, %"FreeNode"** %"reinsert_next"
  store %"FreeNode"* %"reinsert_next.1", %"FreeNode"** %"reinsert"
  br label %"while.cond.3"
while.end.3:
  %"bin_idx.4" = load i64, i64* %"bin_idx"
  %".61" = add i64 %"bin_idx.4", 1
  store i64 %".61", i64* %"bin_idx"
  br label %"while.cond.1"
switch_merge.3:
  %"slab.12" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.13" = load %"Slab"*, %"Slab"** %"slab"
  %"base_ptr.2" = getelementptr inbounds %"Slab", %"Slab"* %"slab.13", i32 0, i32 0
  %"base.2" = load i64, i64* %"base_ptr.2"
  %"slab.14" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.15" = load %"Slab"*, %"Slab"** %"slab"
  %"capacity_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.15", i32 0, i32 1
  %"capacity.1" = load i64, i64* %"capacity_ptr.1"
  call void @"standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(i64 %"base.2", i64 %"capacity.1")
  br label %"switch_merge"
switch_case_0.3:
  %"obj_this.15" = load %"Slab"*, %"Slab"** %"next"
  %"next.4" = load %"Slab"*, %"Slab"** %"next"
  store %"Slab"* %"next.4", %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  br label %"switch_merge.3"
switch_default.3:
  %"obj_this.16" = load %"Slab"*, %"Slab"** %"next"
  %"next.5" = load %"Slab"*, %"Slab"** %"next"
  %"prev_ptr" = load %"Slab"*, %"Slab"** %"prev"
  %".70" = getelementptr inbounds %"Slab", %"Slab"* %"prev_ptr", i32 0, i32 4
  store %"Slab"* %"next.5", %"Slab"** %".70"
  br label %"switch_merge.3"
}

define float @"standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1"()
{
entry:
  %"total_capacity" = alloca i64
  store i64 0, i64* %"total_capacity"
  %"total_used" = alloca i64
  store i64 0, i64* %"total_used"
  %"usable" = alloca i64
  store i64 0, i64* %"usable"
  %"committed" = alloca i64
  store i64 0, i64* %"committed"
  %"all_used" = alloca i64
  store i64 0, i64* %"all_used"
  %"used_bytes" = alloca i64
  store i64 0, i64* %"used_bytes"
  %"free_bytes" = alloca i64
  store i64 0, i64* %"free_bytes"
  %"slab" = alloca %"Slab"*
  %"obj_this" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  store %"Slab"* %"g_slab_head", %"Slab"** %"slab"
  br label %"while.cond"
while.cond:
  %"obj_this.1" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.1" = load %"Slab"*, %"Slab"** %"slab"
  %"not_null" = icmp ne %"Slab"* %"slab.1", null
  %"not_null_result" = zext i1 %"not_null" to i8
  %"tobool" = icmp ne i8 %"not_null_result", 0
  br i1 %"tobool", label %"while.body", label %"while.end"
while.body:
  %"slab.2" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.3" = load %"Slab"*, %"Slab"** %"slab"
  %"capacity_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.3", i32 0, i32 1
  %"capacity" = load i64, i64* %"capacity_ptr"
  %".12" = zext i32 40 to i64
  %".13" = sub i64 %"capacity", %".12"
  store i64 %".13", i64* %"usable"
  %"total_capacity.1" = load i64, i64* %"total_capacity"
  %"usable.1" = load i64, i64* %"usable"
  %"total_capacity.2" = load i64, i64* %"total_capacity"
  %"usable.2" = load i64, i64* %"usable"
  %".15" = add i64 %"total_capacity.2", %"usable.2"
  store i64 %".15", i64* %"total_capacity"
  %"total_used.1" = load i64, i64* %"total_used"
  %"slab.4" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.5" = load %"Slab"*, %"Slab"** %"slab"
  %"used_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.5", i32 0, i32 3
  %"used" = load i64, i64* %"used_ptr"
  %"total_used.2" = load i64, i64* %"total_used"
  %"slab.6" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.7" = load %"Slab"*, %"Slab"** %"slab"
  %"used_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.7", i32 0, i32 3
  %"used.1" = load i64, i64* %"used_ptr.1"
  %".17" = add i64 %"total_used.2", %"used.1"
  store i64 %".17", i64* %"total_used"
  %"slab.8" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.9" = load %"Slab"*, %"Slab"** %"slab"
  %"next_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.9", i32 0, i32 4
  %"next" = load %"Slab"*, %"Slab"** %"next_ptr"
  store %"Slab"* %"next", %"Slab"** %"slab"
  br label %"while.cond"
while.end:
  %"total_capacity.3" = load i64, i64* %"total_capacity"
  %".21" = zext i32 0 to i64
  %".22" = icmp eq i64 %"total_capacity.3", %".21"
  switch i1 %".22", label %"switch_default" [i1 1, label %"switch_case_0"]
switch_merge:
  %"obj_this.2" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  %"g_slab_head.1" = load %"Slab"*, %"Slab"** @"standard__memory__allocators__stdheap__g_slab_head"
  store %"Slab"* %"g_slab_head.1", %"Slab"** %"slab"
  br label %"while.cond.1"
switch_case_0:
  %"g_large_used" = load i64, i64* @"standard__memory__allocators__stdheap__g_large_used"
  %".24" = zext i32 0 to i64
  %".25" = icmp ugt i64 %"g_large_used", %".24"
  switch i1 %".25", label %"switch_default.1" [i1 1, label %"switch_case_0.1"]
switch_default:
  br label %"switch_merge"
switch_merge.1:
  unreachable
switch_case_0.1:
  ret float 0x3ff0000000000000
switch_default.1:
  ret float              0x0
while.cond.1:
  %"obj_this.3" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.10" = load %"Slab"*, %"Slab"** %"slab"
  %"not_null.1" = icmp ne %"Slab"* %"slab.10", null
  %"not_null_result.1" = zext i1 %"not_null.1" to i8
  %"tobool.1" = icmp ne i8 %"not_null_result.1", 0
  br i1 %"tobool.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"committed.1" = load i64, i64* %"committed"
  %"slab.11" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.12" = load %"Slab"*, %"Slab"** %"slab"
  %"frontier_ptr" = getelementptr inbounds %"Slab", %"Slab"* %"slab.12", i32 0, i32 2
  %"frontier" = load i64, i64* %"frontier_ptr"
  %".34" = zext i32 40 to i64
  %".35" = sub i64 %"frontier", %".34"
  %"committed.2" = load i64, i64* %"committed"
  %"slab.13" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.14" = load %"Slab"*, %"Slab"** %"slab"
  %"frontier_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.14", i32 0, i32 2
  %"frontier.1" = load i64, i64* %"frontier_ptr.1"
  %".36" = zext i32 40 to i64
  %".37" = sub i64 %"frontier.1", %".36"
  %".38" = add i64 %"committed.2", %".37"
  store i64 %".38", i64* %"committed"
  %"slab.15" = load %"Slab"*, %"Slab"** %"slab"
  %"slab.16" = load %"Slab"*, %"Slab"** %"slab"
  %"next_ptr.1" = getelementptr inbounds %"Slab", %"Slab"* %"slab.16", i32 0, i32 4
  %"next.1" = load %"Slab"*, %"Slab"** %"next_ptr.1"
  store %"Slab"* %"next.1", %"Slab"** %"slab"
  br label %"while.cond.1"
while.end.1:
  %"total_used.3" = load i64, i64* %"total_used"
  %"g_large_used.1" = load i64, i64* @"standard__memory__allocators__stdheap__g_large_used"
  %".42" = add i64 %"total_used.3", %"g_large_used.1"
  store i64 %".42", i64* %"all_used"
  %"committed.3" = load i64, i64* %"committed"
  %".44" = zext i32 0 to i64
  %".45" = icmp eq i64 %"committed.3", %".44"
  switch i1 %".45", label %"switch_default.2" [i1 1, label %"switch_case_0.2"]
switch_merge.2:
  %"all_used.1" = load i64, i64* %"all_used"
  %".49" = zext i32 16 to i64
  %".50" = mul i64 %"all_used.1", %".49"
  store i64 %".50", i64* %"used_bytes"
  %"used_bytes.1" = load i64, i64* %"used_bytes"
  %"committed.4" = load i64, i64* %"committed"
  %".52" = icmp ugt i64 %"used_bytes.1", %"committed.4"
  switch i1 %".52", label %"switch_default.3" [i1 1, label %"switch_case_0.3"]
switch_case_0.2:
  ret float              0x0
switch_default.2:
  br label %"switch_merge.2"
switch_merge.3:
  %"committed.6" = load i64, i64* %"committed"
  %"used_bytes.2" = load i64, i64* %"used_bytes"
  %".57" = sub i64 %"committed.6", %"used_bytes.2"
  store i64 %".57", i64* %"free_bytes"
  %"free_bytes.1" = load i64, i64* %"free_bytes"
  %".59" = sitofp i64 %"free_bytes.1" to float
  %"committed.7" = load i64, i64* %"committed"
  %".60" = sitofp i64 %"committed.7" to float
  %".61" = fdiv float %".59", %".60"
  ret float %".61"
switch_case_0.3:
  %"committed.5" = load i64, i64* %"committed"
  store i64 %"committed.5", i64* %"used_bytes"
  br label %"switch_merge.3"
switch_default.3:
  br label %"switch_merge.3"
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

define i64 @"standard__time__win_time_now__0__ret_dataE1_sbits64"()
{
entry:
  %"counter" = alloca i64
  store i64 0, i64* %"counter"
  %"freq" = alloca i64
  store i64 0, i64* %"freq"
  %".4" = call i1 @"QueryPerformanceCounter"(i64* %"counter")
  %".5" = call i1 @"QueryPerformanceFrequency"(i64* %"freq")
  %"freq.1" = load i64, i64* %"freq"
  %".6" = sext i32 0 to i64
  %".7" = icmp eq i64 %"freq.1", %".6"
  br i1 %".7", label %"then", label %"else"
then:
  %".9" = sext i32 0 to i64
  ret i64 %".9"
else:
  br label %"ifcont"
ifcont:
  %"counter.1" = load i64, i64* %"counter"
  %"freq.2" = load i64, i64* %"freq"
  %".12" = sdiv i64 %"counter.1", %"freq.2"
  %"TIME_NS_PER_SEC" = load i64, i64* @"standard__time__TIME_NS_PER_SEC"
  %".13" = mul i64 %".12", %"TIME_NS_PER_SEC"
  %"counter.2" = load i64, i64* %"counter"
  %"freq.3" = load i64, i64* %"freq"
  %".14" = srem i64 %"counter.2", %"freq.3"
  %"TIME_NS_PER_SEC.1" = load i64, i64* @"standard__time__TIME_NS_PER_SEC"
  %".15" = mul i64 %".14", %"TIME_NS_PER_SEC.1"
  %"freq.4" = load i64, i64* %"freq"
  %".16" = sdiv i64 %".15", %"freq.4"
  %".17" = add i64 %".13", %".16"
  ret i64 %".17"
}

define i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
{
entry:
  switch i32 1, label %"switch_default" [i32 1, label %"switch_case_0"]
switch_merge:
  unreachable
switch_case_0:
  %"op_overload_result" = call i64 @"standard__time__win_time_now__0__ret_dataE1_sbits64"()
  ret i64 %"op_overload_result"
switch_default:
  %".4" = sext i32 0 to i64
  ret i64 %".4"
}

define i64 @"standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns")
{
entry:
  %"ns.addr" = alloca i64
  store i64 %"ns", i64* %"ns.addr"
  %"ns.1" = load i64, i64* %"ns.addr"
  %"TIME_NS_PER_US" = load i64, i64* @"standard__time__TIME_NS_PER_US"
  %".4" = sdiv i64 %"ns.1", %"TIME_NS_PER_US"
  ret i64 %".4"
}

define i64 @"standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns")
{
entry:
  %"ns.addr" = alloca i64
  store i64 %"ns", i64* %"ns.addr"
  %"ns.1" = load i64, i64* %"ns.addr"
  %"TIME_NS_PER_MS" = load i64, i64* @"standard__time__TIME_NS_PER_MS"
  %".4" = sdiv i64 %"ns.1", %"TIME_NS_PER_MS"
  ret i64 %".4"
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
  %"buf" = alloca [32 x i8]
  store [32 x i8] zeroinitializer, [32 x i8]* %"buf"
  %"str_stack" = alloca [30 x i8]
  %"str_char_0" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 0
  store i8 61, i8* %"str_char_0"
  %"str_char_1" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 1
  store i8 61, i8* %"str_char_1"
  %"str_char_2" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 2
  store i8 61, i8* %"str_char_2"
  %"str_char_3" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 3
  store i8 32, i8* %"str_char_3"
  %"str_char_4" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 4
  store i8 115, i8* %"str_char_4"
  %"str_char_5" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 5
  store i8 116, i8* %"str_char_5"
  %"str_char_6" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 6
  store i8 100, i8* %"str_char_6"
  %"str_char_7" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 7
  store i8 104, i8* %"str_char_7"
  %"str_char_8" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 9
  store i8 97, i8* %"str_char_9"
  %"str_char_10" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 10
  store i8 112, i8* %"str_char_10"
  %"str_char_11" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 12
  store i8 115, i8* %"str_char_12"
  %"str_char_13" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 13
  store i8 116, i8* %"str_char_13"
  %"str_char_14" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 14
  store i8 114, i8* %"str_char_14"
  %"str_char_15" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 15
  store i8 101, i8* %"str_char_15"
  %"str_char_16" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 16
  store i8 115, i8* %"str_char_16"
  %"str_char_17" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 17
  store i8 115, i8* %"str_char_17"
  %"str_char_18" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 18
  store i8 32, i8* %"str_char_18"
  %"str_char_19" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 19
  store i8 116, i8* %"str_char_19"
  %"str_char_20" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 20
  store i8 101, i8* %"str_char_20"
  %"str_char_21" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 21
  store i8 115, i8* %"str_char_21"
  %"str_char_22" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 22
  store i8 116, i8* %"str_char_22"
  %"str_char_23" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 23
  store i8 32, i8* %"str_char_23"
  %"str_char_24" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 24
  store i8 61, i8* %"str_char_24"
  %"str_char_25" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 25
  store i8 61, i8* %"str_char_25"
  %"str_char_26" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 26
  store i8 61, i8* %"str_char_26"
  %"str_char_27" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 27
  store i8 10, i8* %"str_char_27"
  %"str_char_28" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 28
  store i8 10, i8* %"str_char_28"
  %"str_char_29" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 29
  store i8 0, i8* %"str_char_29"
  %"arg0_decay" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  call void @"test_edge_cases__0__ret_voidE1"()
  call void @"test_all_size_classes__0__ret_voidE1"()
  call void @"test_large_alloc__0__ret_voidE1"()
  call void @"test_bin_reuse__0__ret_voidE1"()
  call void @"test_write_read__0__ret_voidE1"()
  call void @"test_no_overlap__0__ret_voidE1"()
  call void @"test_frealloc_same_class__0__ret_voidE1"()
  call void @"test_frealloc_grow__0__ret_voidE1"()
  call void @"test_frealloc_large_identity__0__ret_voidE1"()
  call void @"test_frealloc_chain__0__ret_voidE1"()
  call void @"test_coalesce__0__ret_voidE1"()
  call void @"test_coalesce_bin_integrity__0__ret_voidE1"()
  call void @"test_fragmentation__0__ret_voidE1"()
  call void @"test_mixed_pattern__0__ret_voidE1"()
  call void @"test_table_stress__0__ret_voidE1"()
  call void @"test_double_free_guard__0__ret_voidE1"()
  call void @"test_throughput_small__0__ret_voidE1"()
  call void @"test_throughput_mixed__0__ret_voidE1"()
  call void @"test_throughput_fastpath__0__ret_voidE1"()
  call void @"test_bandwidth__0__ret_voidE1"()
  call void @"test_frealloc_pressure__0__ret_voidE1"()
  call void @"test_slab_exhaustion_recovery__0__ret_voidE1"()
  %"str_stack.1" = alloca [2 x i8]
  %"str_char_0.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 10, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 0, i8* %"str_char_1.1"
  %"arg0_decay.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"g_pass" = load i32, i32* @"g_pass"
  %".37" = getelementptr inbounds [32 x i8], [32 x i8]* %"buf", i32 0, i32 0
  %".38" = call i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"g_pass", i8* %".37")
  %".39" = getelementptr inbounds [32 x i8], [32 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".39")
  %"str_stack.2" = alloca [10 x i8]
  %"str_char_0.2" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 32, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 112, i8* %"str_char_1.2"
  %"str_char_2.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 115, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 115, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 100, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 44, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 0, i8* %"str_char_9.1"
  %"arg0_decay.2" = getelementptr [10 x i8], [10 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.2")
  %"g_fail" = load i32, i32* @"g_fail"
  %".52" = getelementptr inbounds [32 x i8], [32 x i8]* %"buf", i32 0, i32 0
  %".53" = call i32 @"standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32"(i32 %"g_fail", i8* %".52")
  %".54" = getelementptr inbounds [32 x i8], [32 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".54")
  %"str_stack.3" = alloca [9 x i8]
  %"str_char_0.3" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 32, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 102, i8* %"str_char_1.3"
  %"str_char_2.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 97, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 105, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 100, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 10, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 0, i8* %"str_char_8.2"
  %"arg0_decay.3" = getelementptr [9 x i8], [9 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.3")
  %"g_fail.1" = load i32, i32* @"g_fail"
  ret i32 %"g_fail.1"
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

@"global_rng" = internal global %"PCG32" zeroinitializer
@"global_rng_initialized" = internal global i1 0
define i64 @"standard__random__get_rdtsc__0__ret_dataE1_ubits64"()
{
entry:
  %"result" = alloca i64
  %".2" = sext i32 0 to i64
  store i64 %".2", i64* %"result"
  %".4" = call i64 asm sideeffect "rdtsc                    
                shlq $$32, %rdx          
                orq %rdx, %rax", "={rax},~{rdx}"
()
  store i64 %".4", i64* %"result"
  %"result.1" = load i64, i64* %"result"
  ret i64 %"result.1"
}

define i64 @"standard__random__get_entropy__0__ret_dataE1_ubits64"()
{
entry:
  %"t1" = alloca i64
  %"op_overload_result" = call i64 @"standard__random__get_rdtsc__0__ret_dataE1_ubits64"()
  store i64 %"op_overload_result", i64* %"t1"
  %"t2" = alloca i64
  %"op_overload_result.1" = call i64 @"standard__random__get_rdtsc__0__ret_dataE1_ubits64"()
  store i64 %"op_overload_result.1", i64* %"t2"
  %"t3" = alloca i64
  %"op_overload_result.2" = call i64 @"standard__random__get_rdtsc__0__ret_dataE1_ubits64"()
  store i64 %"op_overload_result.2", i64* %"t3"
  %"t1.1" = load i64, i64* %"t1"
  %"t2.1" = load i64, i64* %"t2"
  %".5" = zext i32 21 to i64
  %".6" = shl i64 %"t2.1", %".5"
  %".7" = xor i64 %"t1.1", %".6"
  %"t3.1" = load i64, i64* %"t3"
  %".8" = zext i32 17 to i64
  %".9" = lshr i64 %"t3.1", %".8"
  %".10" = xor i64 %".7", %".9"
  ret i64 %".10"
}

define void @"standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"PCG32"* %"rng", i64 %"seed", i64 %"seq")
{
entry:
  %"rng.addr" = alloca %"PCG32"*
  store %"PCG32"* %"rng", %"PCG32"** %"rng.addr"
  %"seed.addr" = alloca i64
  store i64 %"seed", i64* %"seed.addr"
  %"seq.addr" = alloca i64
  store i64 %"seq", i64* %"seq.addr"
  %"rng_ptr" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".8" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr", i32 0, i32 0
  %".9" = sext i32 0 to i64
  store i64 %".9", i64* %".8"
  %"seq.1" = load i64, i64* %"seq.addr"
  %".11" = zext i32 1 to i64
  %".12" = shl i64 %"seq.1", %".11"
  %".13" = zext i32 1 to i64
  %".14" = or i64 %".12", %".13"
  %"rng_ptr.1" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".15" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr.1", i32 0, i32 1
  store i64 %".14", i64* %".15"
  %"dummy" = alloca i64
  %".17" = sext i32 0 to i64
  store i64 %".17", i64* %"dummy"
  %"rng.1" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.2" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"state_ptr" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.2", i32 0, i32 0
  %"state" = load i64, i64* %"state_ptr"
  %".19" = mul i64 %"state", 6364136223846793005
  %"rng.3" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.4" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"inc_ptr" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.4", i32 0, i32 1
  %"inc" = load i64, i64* %"inc_ptr"
  %".20" = add i64 %".19", %"inc"
  %"rng_ptr.2" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".21" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr.2", i32 0, i32 0
  store i64 %".20", i64* %".21"
  %"rng.5" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.6" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"state_ptr.1" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.6", i32 0, i32 0
  %"state.1" = load i64, i64* %"state_ptr.1"
  %"seed.1" = load i64, i64* %"seed.addr"
  %".23" = add i64 %"state.1", %"seed.1"
  %"rng_ptr.3" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".24" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr.3", i32 0, i32 0
  store i64 %".23", i64* %".24"
  %"rng.7" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.8" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"state_ptr.2" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.8", i32 0, i32 0
  %"state.2" = load i64, i64* %"state_ptr.2"
  %".26" = mul i64 %"state.2", 6364136223846793005
  %"rng.9" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.10" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"inc_ptr.1" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.10", i32 0, i32 1
  %"inc.1" = load i64, i64* %"inc_ptr.1"
  %".27" = add i64 %".26", %"inc.1"
  %"rng_ptr.4" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".28" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr.4", i32 0, i32 0
  store i64 %".27", i64* %".28"
  ret void
}

define void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
{
entry:
  %"rng.addr" = alloca %"PCG32"*
  store %"PCG32"* %"rng", %"PCG32"** %"rng.addr"
  %"seed" = alloca i64
  %"op_overload_result" = call i64 @"standard__random__get_entropy__0__ret_dataE1_ubits64"()
  store i64 %"op_overload_result", i64* %"seed"
  %"seq" = alloca i64
  %"op_overload_result.1" = call i64 @"standard__random__get_entropy__0__ret_dataE1_ubits64"()
  store i64 %"op_overload_result.1", i64* %"seq"
  %"obj_this" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.1" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"seed.1" = load i64, i64* %"seed"
  %"seq.1" = load i64, i64* %"seq"
  call void @"standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1"(%"PCG32"* %"rng.1", i64 %"seed.1", i64 %"seq.1")
  ret void
}

define i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
{
entry:
  %"rng.addr" = alloca %"PCG32"*
  store %"PCG32"* %"rng", %"PCG32"** %"rng.addr"
  %"oldstate" = alloca i64
  %"rng.1" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.2" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"state_ptr" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.2", i32 0, i32 0
  %"state" = load i64, i64* %"state_ptr"
  store i64 %"state", i64* %"oldstate"
  %"oldstate.1" = load i64, i64* %"oldstate"
  %".5" = mul i64 %"oldstate.1", 6364136223846793005
  %"rng.3" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"rng.4" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %"inc_ptr" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng.4", i32 0, i32 1
  %"inc" = load i64, i64* %"inc_ptr"
  %".6" = add i64 %".5", %"inc"
  %"rng_ptr" = load %"PCG32"*, %"PCG32"** %"rng.addr"
  %".7" = getelementptr inbounds %"PCG32", %"PCG32"* %"rng_ptr", i32 0, i32 0
  store i64 %".6", i64* %".7"
  %"xorshifted" = alloca i32
  %"oldstate.2" = load i64, i64* %"oldstate"
  %".9" = zext i32 18 to i64
  %".10" = lshr i64 %"oldstate.2", %".9"
  %"oldstate.3" = load i64, i64* %"oldstate"
  %".11" = xor i64 %".10", %"oldstate.3"
  %".12" = zext i32 27 to i64
  %".13" = lshr i64 %".11", %".12"
  %".14" = trunc i64 %".13" to i32
  store i32 %".14", i32* %"xorshifted"
  %"rot" = alloca i32
  %"oldstate.4" = load i64, i64* %"oldstate"
  %".16" = zext i32 59 to i64
  %".17" = lshr i64 %"oldstate.4", %".16"
  %".18" = trunc i64 %".17" to i32
  store i32 %".18", i32* %"rot"
  %"xorshifted.1" = load i32, i32* %"xorshifted"
  %"rot.1" = load i32, i32* %"rot"
  %".20" = lshr i32 %"xorshifted.1", %"rot.1"
  %"xorshifted.2" = load i32, i32* %"xorshifted"
  %"rot.2" = load i32, i32* %"rot"
  %".21" = sub i32 0, %"rot.2"
  %".22" = shl i32 %"xorshifted.2", %".21"
  %".23" = or i32 %".20", %".22"
  ret i32 %".23"
}

@"g_pass" = internal global i32 0
@"g_fail" = internal global i32 0
define void @"pass__1__byteE1_ptr1__ret_voidE1"(i8* %"name")
{
entry:
  %"name.addr" = alloca i8*
  store i8* %"name", i8** %"name.addr"
  %"str_stack" = alloca [8 x i8]
  %"str_char_0" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 0
  store i8 91, i8* %"str_char_0"
  %"str_char_1" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 1
  store i8 80, i8* %"str_char_1"
  %"str_char_2" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 2
  store i8 65, i8* %"str_char_2"
  %"str_char_3" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 3
  store i8 83, i8* %"str_char_3"
  %"str_char_4" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 4
  store i8 83, i8* %"str_char_4"
  %"str_char_5" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 5
  store i8 93, i8* %"str_char_5"
  %"str_char_6" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 6
  store i8 32, i8* %"str_char_6"
  %"str_char_7" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 7
  store i8 0, i8* %"str_char_7"
  %"arg0_decay" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %"name.1" = load i8*, i8** %"name.addr"
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"name.1")
  %"str_stack.1" = alloca [2 x i8]
  %"str_char_0.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 10, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 0, i8* %"str_char_1.1"
  %"arg0_decay.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"g_pass" = load i32, i32* @"g_pass"
  %".17" = add i32 %"g_pass", 1
  store i32 %".17", i32* @"g_pass"
  ret void
}

define void @"fail__1__byteE1_ptr1__ret_voidE1"(i8* %"name")
{
entry:
  %"name.addr" = alloca i8*
  store i8* %"name", i8** %"name.addr"
  %"str_stack" = alloca [8 x i8]
  %"str_char_0" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 0
  store i8 91, i8* %"str_char_0"
  %"str_char_1" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 1
  store i8 70, i8* %"str_char_1"
  %"str_char_2" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 2
  store i8 65, i8* %"str_char_2"
  %"str_char_3" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 3
  store i8 73, i8* %"str_char_3"
  %"str_char_4" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 4
  store i8 76, i8* %"str_char_4"
  %"str_char_5" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 5
  store i8 93, i8* %"str_char_5"
  %"str_char_6" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 6
  store i8 32, i8* %"str_char_6"
  %"str_char_7" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 7
  store i8 0, i8* %"str_char_7"
  %"arg0_decay" = getelementptr [8 x i8], [8 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %"name.1" = load i8*, i8** %"name.addr"
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"name.1")
  %"str_stack.1" = alloca [2 x i8]
  %"str_char_0.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 10, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 0, i8* %"str_char_1.1"
  %"arg0_decay.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"g_fail" = load i32, i32* @"g_fail"
  %".17" = add i32 %"g_fail", 1
  store i32 %".17", i32* @"g_fail"
  ret void
}

define void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok", i8* %"name")
{
entry:
  %"ok.addr" = alloca i1
  store i1 %"ok", i1* %"ok.addr"
  %"name.addr" = alloca i8*
  store i8* %"name", i8** %"name.addr"
  %"ok.1" = load i1, i1* %"ok.addr"
  br i1 %"ok.1", label %"then", label %"else"
then:
  %"name.1" = load i8*, i8** %"name.addr"
  call void @"pass__1__byteE1_ptr1__ret_voidE1"(i8* %"name.1")
  br label %"ifcont"
else:
  %"name.2" = load i8*, i8** %"name.addr"
  call void @"fail__1__byteE1_ptr1__ret_voidE1"(i8* %"name.2")
  br label %"ifcont"
ifcont:
  ret void
}

define void @"test_edge_cases__0__ret_voidE1"()
{
entry:
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"str_stack" = alloca [18 x i8]
  %"str_char_0" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 3
  store i8 101, i8* %"str_char_3"
  %"str_char_4" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 4
  store i8 100, i8* %"str_char_4"
  %"str_char_5" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 5
  store i8 103, i8* %"str_char_5"
  %"str_char_6" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 6
  store i8 101, i8* %"str_char_6"
  %"str_char_7" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 7
  store i8 32, i8* %"str_char_7"
  %"str_char_8" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 8
  store i8 99, i8* %"str_char_8"
  %"str_char_9" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 9
  store i8 97, i8* %"str_char_9"
  %"str_char_10" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 10
  store i8 115, i8* %"str_char_10"
  %"str_char_11" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 11
  store i8 101, i8* %"str_char_11"
  %"str_char_12" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 12
  store i8 115, i8* %"str_char_12"
  %"str_char_13" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 13
  store i8 32, i8* %"str_char_13"
  %"str_char_14" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 14
  store i8 45, i8* %"str_char_14"
  %"str_char_15" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 15
  store i8 45, i8* %"str_char_15"
  %"str_char_16" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 16
  store i8 10, i8* %"str_char_16"
  %"str_char_17" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 17
  store i8 0, i8* %"str_char_17"
  %"arg0_decay" = getelementptr [18 x i8], [18 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".22" = sext i32 0 to i64
  %".23" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".22")
  store i64 %".23", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.1" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  %"str_stack.1" = alloca [24 x i8]
  %"str_char_0.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 109, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 108, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 40, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 48, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 41, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 114, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 101, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 116, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 117, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 114, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 110, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 115, i8* %"str_char_17.1"
  %"str_char_18" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 32, i8* %"str_char_18"
  %"str_char_19" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 110, i8* %"str_char_19"
  %"str_char_20" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 117, i8* %"str_char_20"
  %"str_char_21" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 108, i8* %"str_char_21"
  %"str_char_22" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 108, i8* %"str_char_22"
  %"str_char_23" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 0, i8* %"str_char_23"
  %"arg1_decay" = getelementptr [24 x i8], [24 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"is_null", i8* %"arg1_decay")
  %".50" = sext i32 0 to i64
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %".50")
  %"str_stack.2" = alloca [27 x i8]
  %"str_char_0.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 102, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 114, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 101, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 101, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 40, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 110, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 117, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 108, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 108, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 41, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 100, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 111, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 101, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 115, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 110, i8* %"str_char_17.2"
  %"str_char_18.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 111, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 116, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 32, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 99, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 114, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 97, i8* %"str_char_23.1"
  %"str_char_24" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 115, i8* %"str_char_24"
  %"str_char_25" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 104, i8* %"str_char_25"
  %"str_char_26" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 0, i8* %"str_char_26"
  %"arg1_decay.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 true, i8* %"arg1_decay.1")
  %".80" = sext i32 0 to i64
  %".81" = sext i32 0 to i64
  %".82" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".80", i64 %".81")
  store i64 %".82", i64* %"p"
  %"p.2" = load i64, i64* %"p"
  %"int_to_ptr.1" = inttoptr i64 %"p.2" to i8*
  %"is_null.1" = icmp eq i8* %"int_to_ptr.1", null
  %"str_stack.3" = alloca [31 x i8]
  %"str_char_0.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 114, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 101, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 97, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 108, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 111, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 99, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 40, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 110, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 117, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 108, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 108, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 44, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 32, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 48, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 41, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 32, i8* %"str_char_17.3"
  %"str_char_18.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 114, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 101, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 116, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 117, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 114, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 110, i8* %"str_char_23.2"
  %"str_char_24.1" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 32, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 110, i8* %"str_char_26.1"
  %"str_char_27" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 117, i8* %"str_char_27"
  %"str_char_28" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 108, i8* %"str_char_28"
  %"str_char_29" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 108, i8* %"str_char_29"
  %"str_char_30" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 0, i8* %"str_char_30"
  %"arg1_decay.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"is_null.1", i8* %"arg1_decay.2")
  %".116" = sext i32 0 to i64
  %".117" = sext i32 64 to i64
  %".118" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".116", i64 %".117")
  store i64 %".118", i64* %"p"
  %"p.3" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.3", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.4" = alloca [35 x i8]
  %"str_char_0.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 114, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 101, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 97, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 108, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 108, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 111, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 99, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 40, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 110, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 117, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 108, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 108, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 44, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 32, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 54, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 52, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 41, i8* %"str_char_17.4"
  %"str_char_18.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 32, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 97, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 99, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 116, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 115, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 32, i8* %"str_char_23.3"
  %"str_char_24.2" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 97, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 115, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 102, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 109, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 29
  store i8 97, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 30
  store i8 108, i8* %"str_char_30.1"
  %"str_char_31" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 31
  store i8 108, i8* %"str_char_31"
  %"str_char_32" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 32
  store i8 111, i8* %"str_char_32"
  %"str_char_33" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 33
  store i8 99, i8* %"str_char_33"
  %"str_char_34" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 34
  store i8 0, i8* %"str_char_34"
  %".155" = trunc i8 %"not_null_result" to i1
  %"arg1_decay.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".155", i8* %"arg1_decay.3")
  %"p.4" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.4")
  %".158" = sext i32 64 to i64
  %".159" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".158")
  store i64 %".159", i64* %"p"
  %"p.5" = load i64, i64* %"p"
  %"not_zero.1" = icmp ne i64 %"p.5", 0
  %"not_null_result.1" = zext i1 %"not_zero.1" to i8
  %"str_stack.5" = alloca [32 x i8]
  %"str_char_0.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 115, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 101, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 116, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 117, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 112, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 32, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 97, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 108, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 108, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 111, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 99, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 32, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 102, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 111, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 114, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 32, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 102, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 114, i8* %"str_char_17.5"
  %"str_char_18.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 101, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 97, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 108, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 108, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 111, i8* %"str_char_22.4"
  %"str_char_23.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 99, i8* %"str_char_23.4"
  %"str_char_24.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 40, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 112, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 26
  store i8 116, i8* %"str_char_26.3"
  %"str_char_27.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 27
  store i8 114, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 28
  store i8 44, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 29
  store i8 48, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 30
  store i8 41, i8* %"str_char_30.2"
  %"str_char_31.1" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 31
  store i8 0, i8* %"str_char_31.1"
  %".193" = trunc i8 %"not_null_result.1" to i1
  %"arg1_decay.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".193", i8* %"arg1_decay.4")
  %"r" = alloca i64
  %"p.6" = load i64, i64* %"p"
  %".195" = sext i32 0 to i64
  %".196" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p.6", i64 %".195")
  store i64 %".196", i64* %"r"
  %"r.1" = load i64, i64* %"r"
  %".198" = zext i32 0 to i64
  %".199" = icmp eq i64 %"r.1", %".198"
  %"str_stack.6" = alloca [45 x i8]
  %"str_char_0.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 102, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 114, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 101, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 97, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 108, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 108, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 111, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 99, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 40, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 112, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 116, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 114, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 44, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 32, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 48, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 41, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 32, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 97, i8* %"str_char_17.6"
  %"str_char_18.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 99, i8* %"str_char_18.5"
  %"str_char_19.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 116, i8* %"str_char_19.5"
  %"str_char_20.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 115, i8* %"str_char_20.5"
  %"str_char_21.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 32, i8* %"str_char_21.5"
  %"str_char_22.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 22
  store i8 97, i8* %"str_char_22.5"
  %"str_char_23.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 23
  store i8 115, i8* %"str_char_23.5"
  %"str_char_24.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 24
  store i8 32, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 25
  store i8 102, i8* %"str_char_25.4"
  %"str_char_26.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 26
  store i8 102, i8* %"str_char_26.4"
  %"str_char_27.3" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 27
  store i8 114, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 28
  store i8 101, i8* %"str_char_28.3"
  %"str_char_29.3" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 29
  store i8 101, i8* %"str_char_29.3"
  %"str_char_30.3" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 30
  store i8 44, i8* %"str_char_30.3"
  %"str_char_31.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 31
  store i8 32, i8* %"str_char_31.2"
  %"str_char_32.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 32
  store i8 114, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 33
  store i8 101, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 34
  store i8 116, i8* %"str_char_34.1"
  %"str_char_35" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 35
  store i8 117, i8* %"str_char_35"
  %"str_char_36" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 36
  store i8 114, i8* %"str_char_36"
  %"str_char_37" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 37
  store i8 110, i8* %"str_char_37"
  %"str_char_38" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 38
  store i8 115, i8* %"str_char_38"
  %"str_char_39" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 39
  store i8 32, i8* %"str_char_39"
  %"str_char_40" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 40
  store i8 110, i8* %"str_char_40"
  %"str_char_41" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 41
  store i8 117, i8* %"str_char_41"
  %"str_char_42" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 42
  store i8 108, i8* %"str_char_42"
  %"str_char_43" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 43
  store i8 108, i8* %"str_char_43"
  %"str_char_44" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 44
  store i8 0, i8* %"str_char_44"
  %"arg1_decay.5" = getelementptr [45 x i8], [45 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".199", i8* %"arg1_decay.5")
  ret void
}

define void @"test_all_size_classes__0__ret_voidE1"()
{
entry:
  %"sizes" = alloca [18 x i64]
  store [18 x i64] zeroinitializer, [18 x i64]* %"sizes"
  %"ptrs" = alloca [18 x i64]
  store [18 x i64] zeroinitializer, [18 x i64]* %"ptrs"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"str_stack" = alloca [24 x i8]
  %"str_char_0" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 3
  store i8 97, i8* %"str_char_3"
  %"str_char_4" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 4
  store i8 108, i8* %"str_char_4"
  %"str_char_5" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 5
  store i8 108, i8* %"str_char_5"
  %"str_char_6" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 6
  store i8 32, i8* %"str_char_6"
  %"str_char_7" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 7
  store i8 115, i8* %"str_char_7"
  %"str_char_8" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 8
  store i8 105, i8* %"str_char_8"
  %"str_char_9" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 9
  store i8 122, i8* %"str_char_9"
  %"str_char_10" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 10
  store i8 101, i8* %"str_char_10"
  %"str_char_11" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 12
  store i8 99, i8* %"str_char_12"
  %"str_char_13" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 13
  store i8 108, i8* %"str_char_13"
  %"str_char_14" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 14
  store i8 97, i8* %"str_char_14"
  %"str_char_15" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 15
  store i8 115, i8* %"str_char_15"
  %"str_char_16" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 16
  store i8 115, i8* %"str_char_16"
  %"str_char_17" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 17
  store i8 101, i8* %"str_char_17"
  %"str_char_18" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 18
  store i8 115, i8* %"str_char_18"
  %"str_char_19" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 20
  store i8 45, i8* %"str_char_20"
  %"str_char_21" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 21
  store i8 45, i8* %"str_char_21"
  %"str_char_22" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 22
  store i8 10, i8* %"str_char_22"
  %"str_char_23" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 23
  store i8 0, i8* %"str_char_23"
  %"arg0_decay" = getelementptr [24 x i8], [24 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".31" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 0
  %".32" = sext i32 1 to i64
  store i64 %".32", i64* %".31"
  %".34" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 1
  %".35" = sext i32 16 to i64
  store i64 %".35", i64* %".34"
  %".37" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 2
  %".38" = sext i32 17 to i64
  store i64 %".38", i64* %".37"
  %".40" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 3
  %".41" = sext i32 32 to i64
  store i64 %".41", i64* %".40"
  %".43" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 4
  %".44" = sext i32 33 to i64
  store i64 %".44", i64* %".43"
  %".46" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 5
  %".47" = sext i32 64 to i64
  store i64 %".47", i64* %".46"
  %".49" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 6
  %".50" = sext i32 65 to i64
  store i64 %".50", i64* %".49"
  %".52" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 7
  %".53" = sext i32 128 to i64
  store i64 %".53", i64* %".52"
  %".55" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 8
  %".56" = sext i32 129 to i64
  store i64 %".56", i64* %".55"
  %".58" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 9
  %".59" = sext i32 256 to i64
  store i64 %".59", i64* %".58"
  %".61" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 10
  %".62" = sext i32 257 to i64
  store i64 %".62", i64* %".61"
  %".64" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 11
  %".65" = sext i32 512 to i64
  store i64 %".65", i64* %".64"
  %".67" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 12
  %".68" = sext i32 513 to i64
  store i64 %".68", i64* %".67"
  %".70" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 13
  %".71" = sext i32 1024 to i64
  store i64 %".71", i64* %".70"
  %".73" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 14
  %".74" = sext i32 1025 to i64
  store i64 %".74", i64* %".73"
  %".76" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 15
  %".77" = sext i32 2048 to i64
  store i64 %".77", i64* %".76"
  %".79" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 16
  %".80" = sext i32 2049 to i64
  store i64 %".80", i64* %".79"
  %".82" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 17
  %".83" = sext i32 4096 to i64
  store i64 %".83", i64* %".82"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %".86" = zext i32 18 to i64
  %".87" = icmp ult i64 %"i.1", %".86"
  br i1 %".87", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.2" to i32
  %"array_gep" = getelementptr inbounds [18 x i64], [18 x i64]* %"sizes", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  %".89" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"array_load")
  %"i.3" = load i64, i64* %"i"
  %".90" = getelementptr inbounds [18 x i64], [18 x i64]* %"ptrs", i32 0, i64 %"i.3"
  store i64 %".89", i64* %".90"
  %"i.4" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.4" to i32
  %"array_gep.1" = getelementptr inbounds [18 x i64], [18 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  %".92" = zext i32 0 to i64
  %".93" = icmp ne i64 %"array_load.1", %".92"
  %"str_stack.1" = alloca [26 x i8]
  %"str_char_0.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 115, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 105, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 122, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 101, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 32, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 99, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 108, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 97, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 115, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 115, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 97, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 108, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 108, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 111, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 99, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 32, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 110, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 111, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 110, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 45, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 110, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 117, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 108, i8* %"str_char_23.1"
  %"str_char_24" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 108, i8* %"str_char_24"
  %"str_char_25" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 0, i8* %"str_char_25"
  %"arg1_decay" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".93", i8* %"arg1_decay")
  %"i.5" = load i64, i64* %"i"
  %"idx_trunc.2" = trunc i64 %"i.5" to i32
  %"array_gep.2" = getelementptr inbounds [18 x i64], [18 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.2"
  %"array_load.2" = load i64, i64* %"array_gep.2"
  %".121" = zext i32 15 to i64
  %".122" = and i64 %"array_load.2", %".121"
  %".123" = zext i32 0 to i64
  %".124" = icmp eq i64 %".122", %".123"
  %"str_stack.2" = alloca [33 x i8]
  %"str_char_0.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 115, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 105, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 122, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 101, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 32, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 99, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 108, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 97, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 115, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 115, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 32, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 97, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 108, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 108, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 111, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 99, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 49, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 54, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 45, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 98, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 121, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 116, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 101, i8* %"str_char_23.2"
  %"str_char_24.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 32, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 97, i8* %"str_char_25.1"
  %"str_char_26" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 108, i8* %"str_char_26"
  %"str_char_27" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 105, i8* %"str_char_27"
  %"str_char_28" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 103, i8* %"str_char_28"
  %"str_char_29" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 110, i8* %"str_char_29"
  %"str_char_30" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 101, i8* %"str_char_30"
  %"str_char_31" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 100, i8* %"str_char_31"
  %"str_char_32" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 0, i8* %"str_char_32"
  %"arg1_decay.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".124", i8* %"arg1_decay.1")
  %"i.6" = load i64, i64* %"i"
  %".159" = add i64 %"i.6", 1
  store i64 %".159", i64* %"i"
  br label %"while.cond"
while.end:
  %".162" = sext i32 0 to i64
  store i64 %".162", i64* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.7" = load i64, i64* %"i"
  %".165" = zext i32 18 to i64
  %".166" = icmp ult i64 %"i.7", %".165"
  br i1 %".166", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.8" = load i64, i64* %"i"
  %"idx_trunc.3" = trunc i64 %"i.8" to i32
  %"array_gep.3" = getelementptr inbounds [18 x i64], [18 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.3"
  %"array_load.3" = load i64, i64* %"array_gep.3"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.3")
  %"i.9" = load i64, i64* %"i"
  %".169" = add i64 %"i.9", 1
  store i64 %".169", i64* %"i"
  br label %"while.cond.1"
while.end.1:
  ret void
}

define void @"test_large_alloc__0__ret_voidE1"()
{
entry:
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"str_stack" = alloca [27 x i8]
  %"str_char_0" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 3
  store i8 108, i8* %"str_char_3"
  %"str_char_4" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 4
  store i8 97, i8* %"str_char_4"
  %"str_char_5" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 5
  store i8 114, i8* %"str_char_5"
  %"str_char_6" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 6
  store i8 103, i8* %"str_char_6"
  %"str_char_7" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 7
  store i8 101, i8* %"str_char_7"
  %"str_char_8" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 8
  store i8 32, i8* %"str_char_8"
  %"str_char_9" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 9
  store i8 97, i8* %"str_char_9"
  %"str_char_10" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 10
  store i8 108, i8* %"str_char_10"
  %"str_char_11" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 11
  store i8 108, i8* %"str_char_11"
  %"str_char_12" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 12
  store i8 111, i8* %"str_char_12"
  %"str_char_13" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 13
  store i8 99, i8* %"str_char_13"
  %"str_char_14" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 14
  store i8 32, i8* %"str_char_14"
  %"str_char_15" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 15
  store i8 40, i8* %"str_char_15"
  %"str_char_16" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 16
  store i8 62, i8* %"str_char_16"
  %"str_char_17" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 17
  store i8 52, i8* %"str_char_17"
  %"str_char_18" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 18
  store i8 48, i8* %"str_char_18"
  %"str_char_19" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 19
  store i8 57, i8* %"str_char_19"
  %"str_char_20" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 20
  store i8 54, i8* %"str_char_20"
  %"str_char_21" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 21
  store i8 41, i8* %"str_char_21"
  %"str_char_22" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 22
  store i8 32, i8* %"str_char_22"
  %"str_char_23" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 23
  store i8 45, i8* %"str_char_23"
  %"str_char_24" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 24
  store i8 45, i8* %"str_char_24"
  %"str_char_25" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 25
  store i8 10, i8* %"str_char_25"
  %"str_char_26" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 26
  store i8 0, i8* %"str_char_26"
  %"arg0_decay" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".34" = sext i32 4097 to i64
  %".35" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".34")
  store i64 %".35", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.1", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.1" = alloca [23 x i8]
  %"str_char_0.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 109, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 108, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 40, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 52, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 48, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 57, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 55, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 41, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 32, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 110, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 111, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 110, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 45, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 110, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 117, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 108, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 108, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 0, i8* %"str_char_22.1"
  %".60" = trunc i8 %"not_null_result" to i1
  %"arg1_decay" = getelementptr [23 x i8], [23 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".60", i8* %"arg1_decay")
  %"p.2" = load i64, i64* %"p"
  %".62" = zext i32 15 to i64
  %".63" = and i64 %"p.2", %".62"
  %".64" = zext i32 0 to i64
  %".65" = icmp eq i64 %".63", %".64"
  %"str_stack.2" = alloca [30 x i8]
  %"str_char_0.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 109, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 97, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 108, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 111, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 99, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 40, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 52, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 48, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 57, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 55, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 41, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 49, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 54, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 45, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 98, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 121, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 116, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 101, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 32, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 97, i8* %"str_char_22.2"
  %"str_char_23.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 108, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 105, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 103, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 110, i8* %"str_char_26.1"
  %"str_char_27" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 101, i8* %"str_char_27"
  %"str_char_28" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 100, i8* %"str_char_28"
  %"str_char_29" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 0, i8* %"str_char_29"
  %"arg1_decay.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".65", i8* %"arg1_decay.1")
  %"p.3" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.3")
  %".98" = sext i32 1048576 to i64
  %".99" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".98")
  store i64 %".99", i64* %"p"
  %"p.4" = load i64, i64* %"p"
  %"not_zero.1" = icmp ne i64 %"p.4", 0
  %"not_null_result.1" = zext i1 %"not_zero.1" to i8
  %"str_stack.3" = alloca [22 x i8]
  %"str_char_0.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 109, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 97, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 108, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 111, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 99, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 40, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 49, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 77, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 66, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 41, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 32, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 110, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 111, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 110, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 45, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 110, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 117, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 108, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 108, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 0, i8* %"str_char_21.3"
  %".123" = trunc i8 %"not_null_result.1" to i1
  %"arg1_decay.2" = getelementptr [22 x i8], [22 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".123", i8* %"arg1_decay.2")
  %"p.5" = load i64, i64* %"p"
  %".125" = zext i32 15 to i64
  %".126" = and i64 %"p.5", %".125"
  %".127" = zext i32 0 to i64
  %".128" = icmp eq i64 %".126", %".127"
  %"str_stack.4" = alloca [29 x i8]
  %"str_char_0.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 109, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 97, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 108, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 108, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 111, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 99, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 40, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 49, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 77, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 66, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 41, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 32, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 49, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 54, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 45, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 98, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 121, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 116, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 101, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 32, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 97, i8* %"str_char_21.4"
  %"str_char_22.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 108, i8* %"str_char_22.3"
  %"str_char_23.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 105, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 103, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 110, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 101, i8* %"str_char_26.2"
  %"str_char_27.1" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 100, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 0, i8* %"str_char_28.1"
  %"arg1_decay.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".128", i8* %"arg1_decay.3")
  %"p.6" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.6" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  store i1 true, i1* %"ok"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %".162" = zext i32 1048576 to i64
  %".163" = icmp ult i64 %"i.1", %".162"
  br i1 %".163", label %"while.body", label %"while.end"
while.body:
  %".165" = trunc i32 205 to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"i.2" = load i64, i64* %"i"
  %".166" = getelementptr inbounds i8, i8* %"bp.1", i64 %"i.2"
  store i8 %".165", i8* %".166"
  %"i.3" = load i64, i64* %"i"
  %".168" = add i64 %"i.3", 1
  store i64 %".168", i64* %"i"
  br label %"while.cond"
while.end:
  %".171" = sext i32 0 to i64
  store i64 %".171", i64* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.4" = load i64, i64* %"i"
  %".174" = zext i32 1048576 to i64
  %".175" = icmp ult i64 %"i.4", %".174"
  br i1 %".175", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"bp.2" = load i8*, i8** %"bp"
  %"i.5" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.5" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"bp.2", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".177" = trunc i32 205 to i8
  %".178" = icmp ne i8 %"ptr_load", %".177"
  br i1 %".178", label %"then", label %"else"
while.end.1:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.5" = alloca [32 x i8]
  %"str_char_0.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 102, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 109, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 97, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 108, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 108, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 111, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 99, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 40, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 49, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 77, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 66, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 41, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 32, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 119, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 114, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 105, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 116, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 101, i8* %"str_char_17.5"
  %"str_char_18.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 47, i8* %"str_char_18.5"
  %"str_char_19.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 114, i8* %"str_char_19.5"
  %"str_char_20.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 101, i8* %"str_char_20.5"
  %"str_char_21.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 97, i8* %"str_char_21.5"
  %"str_char_22.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 100, i8* %"str_char_22.4"
  %"str_char_23.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 32, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 99, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 111, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 26
  store i8 114, i8* %"str_char_26.3"
  %"str_char_27.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 27
  store i8 114, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 28
  store i8 101, i8* %"str_char_28.2"
  %"str_char_29.1" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 29
  store i8 99, i8* %"str_char_29.1"
  %"str_char_30" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 30
  store i8 116, i8* %"str_char_30"
  %"str_char_31" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 31
  store i8 0, i8* %"str_char_31"
  %"arg1_decay.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay.4")
  %"p.7" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.7")
  %".220" = sext i32 8388608 to i64
  %".221" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".220")
  store i64 %".221", i64* %"p"
  %"p.8" = load i64, i64* %"p"
  %"not_zero.2" = icmp ne i64 %"p.8", 0
  %"not_null_result.2" = zext i1 %"not_zero.2" to i8
  %"str_stack.6" = alloca [22 x i8]
  %"str_char_0.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 102, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 109, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 97, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 108, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 108, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 111, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 99, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 40, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 56, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 77, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 66, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 41, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 32, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 110, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 111, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 110, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 45, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 110, i8* %"str_char_17.6"
  %"str_char_18.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 117, i8* %"str_char_18.6"
  %"str_char_19.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 108, i8* %"str_char_19.6"
  %"str_char_20.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 108, i8* %"str_char_20.6"
  %"str_char_21.6" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 0, i8* %"str_char_21.6"
  %".245" = trunc i8 %"not_null_result.2" to i1
  %"arg1_decay.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".245", i8* %"arg1_decay.5")
  store i1 true, i1* %"ok"
  %"p.9" = load i64, i64* %"p"
  %"int_to_ptr.1" = inttoptr i64 %"p.9" to i8*
  store i8* %"int_to_ptr.1", i8** %"bp"
  %".249" = sext i32 0 to i64
  store i64 %".249", i64* %"i"
  br label %"while.cond.2"
then:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else:
  br label %"ifcont"
ifcont:
  %"i.6" = load i64, i64* %"i"
  %".183" = add i64 %"i.6", 1
  store i64 %".183", i64* %"i"
  br label %"while.cond.1"
while.cond.2:
  %"i.7" = load i64, i64* %"i"
  %".252" = zext i32 8388608 to i64
  %".253" = icmp ult i64 %"i.7", %".252"
  br i1 %".253", label %"while.body.2", label %"while.end.2"
while.body.2:
  %".255" = trunc i32 171 to i8
  %"bp.3" = load i8*, i8** %"bp"
  %"i.8" = load i64, i64* %"i"
  %".256" = getelementptr inbounds i8, i8* %"bp.3", i64 %"i.8"
  store i8 %".255", i8* %".256"
  %"i.9" = load i64, i64* %"i"
  %".258" = add i64 %"i.9", 1
  store i64 %".258", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  %".261" = sext i32 0 to i64
  store i64 %".261", i64* %"i"
  br label %"while.cond.3"
while.cond.3:
  %"i.10" = load i64, i64* %"i"
  %".264" = zext i32 8388608 to i64
  %".265" = icmp ult i64 %"i.10", %".264"
  br i1 %".265", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"bp.4" = load i8*, i8** %"bp"
  %"i.11" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.11" to i32
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"bp.4", i32 %"idx_trunc.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".267" = trunc i32 171 to i8
  %".268" = icmp ne i8 %"ptr_load.1", %".267"
  br i1 %".268", label %"then.1", label %"else.1"
while.end.3:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.7" = alloca [32 x i8]
  %"str_char_0.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 102, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 109, i8* %"str_char_1.7"
  %"str_char_2.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 97, i8* %"str_char_2.7"
  %"str_char_3.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 108, i8* %"str_char_3.7"
  %"str_char_4.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 108, i8* %"str_char_4.7"
  %"str_char_5.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 111, i8* %"str_char_5.7"
  %"str_char_6.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 99, i8* %"str_char_6.7"
  %"str_char_7.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 40, i8* %"str_char_7.7"
  %"str_char_8.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 56, i8* %"str_char_8.7"
  %"str_char_9.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 77, i8* %"str_char_9.7"
  %"str_char_10.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 66, i8* %"str_char_10.7"
  %"str_char_11.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 41, i8* %"str_char_11.7"
  %"str_char_12.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 32, i8* %"str_char_12.7"
  %"str_char_13.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 119, i8* %"str_char_13.7"
  %"str_char_14.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 114, i8* %"str_char_14.7"
  %"str_char_15.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 15
  store i8 105, i8* %"str_char_15.7"
  %"str_char_16.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 16
  store i8 116, i8* %"str_char_16.7"
  %"str_char_17.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 17
  store i8 101, i8* %"str_char_17.7"
  %"str_char_18.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 18
  store i8 47, i8* %"str_char_18.7"
  %"str_char_19.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 19
  store i8 114, i8* %"str_char_19.7"
  %"str_char_20.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 20
  store i8 101, i8* %"str_char_20.7"
  %"str_char_21.7" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 21
  store i8 97, i8* %"str_char_21.7"
  %"str_char_22.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 22
  store i8 100, i8* %"str_char_22.5"
  %"str_char_23.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 23
  store i8 32, i8* %"str_char_23.4"
  %"str_char_24.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 24
  store i8 99, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 25
  store i8 111, i8* %"str_char_25.4"
  %"str_char_26.4" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 26
  store i8 114, i8* %"str_char_26.4"
  %"str_char_27.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 27
  store i8 114, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 28
  store i8 101, i8* %"str_char_28.3"
  %"str_char_29.2" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 29
  store i8 99, i8* %"str_char_29.2"
  %"str_char_30.1" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 30
  store i8 116, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 31
  store i8 0, i8* %"str_char_31.1"
  %"arg1_decay.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.6")
  %"p.10" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.10")
  ret void
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.3"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i.12" = load i64, i64* %"i"
  %".273" = add i64 %"i.12", 1
  store i64 %".273", i64* %"i"
  br label %"while.cond.3"
}

define void @"test_bin_reuse__0__ret_voidE1"()
{
entry:
  %"p1" = alloca i64
  store i64 0, i64* %"p1"
  %"p2" = alloca i64
  store i64 0, i64* %"p2"
  %"p3" = alloca i64
  store i64 0, i64* %"p3"
  %"str_stack" = alloca [17 x i8]
  %"str_char_0" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 3
  store i8 98, i8* %"str_char_3"
  %"str_char_4" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 4
  store i8 105, i8* %"str_char_4"
  %"str_char_5" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 5
  store i8 110, i8* %"str_char_5"
  %"str_char_6" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 6
  store i8 32, i8* %"str_char_6"
  %"str_char_7" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 7
  store i8 114, i8* %"str_char_7"
  %"str_char_8" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 9
  store i8 117, i8* %"str_char_9"
  %"str_char_10" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 10
  store i8 115, i8* %"str_char_10"
  %"str_char_11" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 11
  store i8 101, i8* %"str_char_11"
  %"str_char_12" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 12
  store i8 32, i8* %"str_char_12"
  %"str_char_13" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 13
  store i8 45, i8* %"str_char_13"
  %"str_char_14" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 14
  store i8 45, i8* %"str_char_14"
  %"str_char_15" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 15
  store i8 10, i8* %"str_char_15"
  %"str_char_16" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 16
  store i8 0, i8* %"str_char_16"
  %"arg0_decay" = getelementptr [17 x i8], [17 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".23" = sext i32 64 to i64
  %".24" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".23")
  store i64 %".24", i64* %"p1"
  %".26" = sext i32 64 to i64
  %".27" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".26")
  store i64 %".27", i64* %"p2"
  %"p1.1" = load i64, i64* %"p1"
  %".29" = zext i32 0 to i64
  %".30" = icmp ne i64 %"p1.1", %".29"
  %"str_stack.1" = alloca [26 x i8]
  %"str_char_0.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 105, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 114, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 115, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 116, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 32, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 32, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 97, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 108, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 108, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 111, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 99, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 40, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 54, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 52, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 41, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 32, i8* %"str_char_16.1"
  %"str_char_17" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 110, i8* %"str_char_17"
  %"str_char_18" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 111, i8* %"str_char_18"
  %"str_char_19" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 110, i8* %"str_char_19"
  %"str_char_20" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 45, i8* %"str_char_20"
  %"str_char_21" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 110, i8* %"str_char_21"
  %"str_char_22" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 117, i8* %"str_char_22"
  %"str_char_23" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 108, i8* %"str_char_23"
  %"str_char_24" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 108, i8* %"str_char_24"
  %"str_char_25" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 0, i8* %"str_char_25"
  %"arg1_decay" = getelementptr [26 x i8], [26 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".30", i8* %"arg1_decay")
  %"p2.1" = load i64, i64* %"p2"
  %".58" = zext i32 0 to i64
  %".59" = icmp ne i64 %"p2.1", %".58"
  %"str_stack.2" = alloca [26 x i8]
  %"str_char_0.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 115, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 101, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 99, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 111, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 110, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 100, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 32, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 97, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 108, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 108, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 111, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 99, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 40, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 54, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 52, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 41, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 110, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 111, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 110, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 45, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 110, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 117, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 108, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 108, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 0, i8* %"str_char_25.1"
  %"arg1_decay.1" = getelementptr [26 x i8], [26 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".59", i8* %"arg1_decay.1")
  %"p1.2" = load i64, i64* %"p1"
  %"p2.2" = load i64, i64* %"p2"
  %".87" = icmp ne i64 %"p1.2", %"p2.2"
  %"str_stack.3" = alloca [18 x i8]
  %"str_char_0.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 116, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 119, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 111, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 32, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 97, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 108, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 108, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 111, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 99, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 115, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 32, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 100, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 105, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 102, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 102, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 101, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 114, i8* %"str_char_16.3"
  %"str_char_17.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 0, i8* %"str_char_17.2"
  %"arg1_decay.2" = getelementptr [18 x i8], [18 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".87", i8* %"arg1_decay.2")
  %"p1.3" = load i64, i64* %"p1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p1.3")
  %".108" = sext i32 64 to i64
  %".109" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".108")
  store i64 %".109", i64* %"p3"
  %"p3.1" = load i64, i64* %"p3"
  %"p1.4" = load i64, i64* %"p1"
  %".111" = icmp eq i64 %"p3.1", %"p1.4"
  %"str_stack.4" = alloca [41 x i8]
  %"str_char_0.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 98, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 105, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 110, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 32, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 114, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 101, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 117, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 115, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 101, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 32, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 114, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 101, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 116, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 117, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 114, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 110, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 115, i8* %"str_char_16.4"
  %"str_char_17.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 32, i8* %"str_char_17.3"
  %"str_char_18.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 112, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 114, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 101, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 118, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 105, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 111, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 117, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 115, i8* %"str_char_25.2"
  %"str_char_26" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 108, i8* %"str_char_26"
  %"str_char_27" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 121, i8* %"str_char_27"
  %"str_char_28" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 32, i8* %"str_char_28"
  %"str_char_29" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 29
  store i8 102, i8* %"str_char_29"
  %"str_char_30" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 30
  store i8 114, i8* %"str_char_30"
  %"str_char_31" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 31
  store i8 101, i8* %"str_char_31"
  %"str_char_32" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 32
  store i8 101, i8* %"str_char_32"
  %"str_char_33" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 33
  store i8 100, i8* %"str_char_33"
  %"str_char_34" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 34
  store i8 32, i8* %"str_char_34"
  %"str_char_35" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 35
  store i8 98, i8* %"str_char_35"
  %"str_char_36" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 36
  store i8 108, i8* %"str_char_36"
  %"str_char_37" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 37
  store i8 111, i8* %"str_char_37"
  %"str_char_38" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 38
  store i8 99, i8* %"str_char_38"
  %"str_char_39" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 39
  store i8 107, i8* %"str_char_39"
  %"str_char_40" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 40
  store i8 0, i8* %"str_char_40"
  %"arg1_decay.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".111", i8* %"arg1_decay.3")
  %"p2.3" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.3")
  %"p3.2" = load i64, i64* %"p3"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p3.2")
  %".156" = sext i32 128 to i64
  %".157" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".156")
  store i64 %".157", i64* %"p1"
  %"p1.5" = load i64, i64* %"p1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p1.5")
  %".160" = sext i32 128 to i64
  %".161" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".160")
  store i64 %".161", i64* %"p2"
  %"p2.4" = load i64, i64* %"p2"
  %"p1.6" = load i64, i64* %"p1"
  %".163" = icmp eq i64 %"p2.4", %"p1.6"
  %"str_stack.5" = alloca [30 x i8]
  %"str_char_0.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 98, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 105, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 110, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 32, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 114, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 101, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 117, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 115, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 101, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 32, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 99, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 108, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 97, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 115, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 115, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 45, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 51, i8* %"str_char_16.5"
  %"str_char_17.4" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 32, i8* %"str_char_17.4"
  %"str_char_18.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 40, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 49, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 50, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 56, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 32, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 98, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 121, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 116, i8* %"str_char_25.3"
  %"str_char_26.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 26
  store i8 101, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 27
  store i8 115, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 28
  store i8 41, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 29
  store i8 0, i8* %"str_char_29.1"
  %"arg1_decay.4" = getelementptr [30 x i8], [30 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".163", i8* %"arg1_decay.4")
  %"p2.5" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.5")
  %".196" = sext i32 16 to i64
  %".197" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".196")
  store i64 %".197", i64* %"p1"
  %"p1.7" = load i64, i64* %"p1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p1.7")
  %".200" = sext i32 16 to i64
  %".201" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".200")
  store i64 %".201", i64* %"p2"
  %"p2.6" = load i64, i64* %"p2"
  %"p1.8" = load i64, i64* %"p1"
  %".203" = icmp eq i64 %"p2.6", %"p1.8"
  %"str_stack.6" = alloca [29 x i8]
  %"str_char_0.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 98, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 105, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 110, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 32, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 114, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 101, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 117, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 115, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 101, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 32, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 99, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 108, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 97, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 115, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 115, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 45, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 48, i8* %"str_char_16.6"
  %"str_char_17.5" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 32, i8* %"str_char_17.5"
  %"str_char_18.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 40, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 49, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 54, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 32, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 22
  store i8 98, i8* %"str_char_22.4"
  %"str_char_23.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 23
  store i8 121, i8* %"str_char_23.4"
  %"str_char_24.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 24
  store i8 116, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 25
  store i8 101, i8* %"str_char_25.4"
  %"str_char_26.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 26
  store i8 115, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 27
  store i8 41, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 28
  store i8 0, i8* %"str_char_28.2"
  %"arg1_decay.5" = getelementptr [29 x i8], [29 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".203", i8* %"arg1_decay.5")
  %"p2.7" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.7")
  ret void
}

define void @"test_write_read__0__ret_voidE1"()
{
entry:
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"p" = alloca i8*
  store i8* null, i8** %"p"
  %"tag" = alloca i8
  store i8 0, i8* %"tag"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"ptr" = alloca i64
  store i64 0, i64* %"ptr"
  %"str_stack" = alloca [51 x i8]
  %"str_char_0" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 3
  store i8 119, i8* %"str_char_3"
  %"str_char_4" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 5
  store i8 105, i8* %"str_char_5"
  %"str_char_6" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 6
  store i8 116, i8* %"str_char_6"
  %"str_char_7" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 7
  store i8 101, i8* %"str_char_7"
  %"str_char_8" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 8
  store i8 47, i8* %"str_char_8"
  %"str_char_9" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 9
  store i8 114, i8* %"str_char_9"
  %"str_char_10" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 10
  store i8 101, i8* %"str_char_10"
  %"str_char_11" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 11
  store i8 97, i8* %"str_char_11"
  %"str_char_12" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 12
  store i8 100, i8* %"str_char_12"
  %"str_char_13" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 13
  store i8 32, i8* %"str_char_13"
  %"str_char_14" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 14
  store i8 99, i8* %"str_char_14"
  %"str_char_15" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 15
  store i8 111, i8* %"str_char_15"
  %"str_char_16" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 16
  store i8 114, i8* %"str_char_16"
  %"str_char_17" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 17
  store i8 114, i8* %"str_char_17"
  %"str_char_18" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 18
  store i8 101, i8* %"str_char_18"
  %"str_char_19" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 19
  store i8 99, i8* %"str_char_19"
  %"str_char_20" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 20
  store i8 116, i8* %"str_char_20"
  %"str_char_21" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 21
  store i8 110, i8* %"str_char_21"
  %"str_char_22" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 22
  store i8 101, i8* %"str_char_22"
  %"str_char_23" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 23
  store i8 115, i8* %"str_char_23"
  %"str_char_24" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 24
  store i8 115, i8* %"str_char_24"
  %"str_char_25" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 25
  store i8 32, i8* %"str_char_25"
  %"str_char_26" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 26
  store i8 40, i8* %"str_char_26"
  %"str_char_27" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 27
  store i8 49, i8* %"str_char_27"
  %"str_char_28" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 28
  store i8 48, i8* %"str_char_28"
  %"str_char_29" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 29
  store i8 48, i8* %"str_char_29"
  %"str_char_30" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 30
  store i8 48, i8* %"str_char_30"
  %"str_char_31" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 31
  store i8 48, i8* %"str_char_31"
  %"str_char_32" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 32
  store i8 32, i8* %"str_char_32"
  %"str_char_33" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 33
  store i8 97, i8* %"str_char_33"
  %"str_char_34" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 34
  store i8 108, i8* %"str_char_34"
  %"str_char_35" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 35
  store i8 108, i8* %"str_char_35"
  %"str_char_36" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 36
  store i8 111, i8* %"str_char_36"
  %"str_char_37" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 37
  store i8 99, i8* %"str_char_37"
  %"str_char_38" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 38
  store i8 115, i8* %"str_char_38"
  %"str_char_39" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 39
  store i8 47, i8* %"str_char_39"
  %"str_char_40" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 40
  store i8 102, i8* %"str_char_40"
  %"str_char_41" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 41
  store i8 114, i8* %"str_char_41"
  %"str_char_42" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 42
  store i8 101, i8* %"str_char_42"
  %"str_char_43" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 43
  store i8 101, i8* %"str_char_43"
  %"str_char_44" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 44
  store i8 115, i8* %"str_char_44"
  %"str_char_45" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 45
  store i8 41, i8* %"str_char_45"
  %"str_char_46" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 46
  store i8 32, i8* %"str_char_46"
  %"str_char_47" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 47
  store i8 45, i8* %"str_char_47"
  %"str_char_48" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 48
  store i8 45, i8* %"str_char_48"
  %"str_char_49" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 49
  store i8 10, i8* %"str_char_49"
  %"str_char_50" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 50
  store i8 0, i8* %"str_char_50"
  %"arg0_decay" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %".66" = sext i32 10000 to i64
  store i64 %".66", i64* %"n"
  store i1 true, i1* %"ok"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".70" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".70", label %"while.body", label %"while.end"
while.body:
  %".72" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".72", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".74" = zext i32 %"rval.1" to i64
  store i64 %".74", i64* %"rval64"
  %"rval64.1" = load i64, i64* %"rval64"
  %".76" = zext i32 4096 to i64
  %".77" = urem i64 %"rval64.1", %".76"
  %".78" = zext i32 1 to i64
  %".79" = add i64 %".77", %".78"
  store i64 %".79", i64* %"sz"
  %"i.2" = load i64, i64* %"i"
  %".81" = zext i32 255 to i64
  %".82" = and i64 %"i.2", %".81"
  %".83" = trunc i64 %".82" to i8
  store i8 %".83", i8* %"tag"
  %"sz.1" = load i64, i64* %"sz"
  %".85" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.1")
  store i64 %".85", i64* %"ptr"
  %"ptr.1" = load i64, i64* %"ptr"
  %".87" = zext i32 0 to i64
  %".88" = icmp eq i64 %"ptr.1", %".87"
  br i1 %".88", label %"then", label %"else"
while.end:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [63 x i8]
  %"str_char_0.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 119, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 114, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 105, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 116, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 101, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 47, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 114, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 101, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 97, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 100, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 99, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 111, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 114, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 114, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 101, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 99, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 116, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 32, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 97, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 99, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 114, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 111, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 115, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 32, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 49, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 48, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 48, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 48, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 48, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 32, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 114, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 97, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 110, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 100, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 111, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 109, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 45, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 115, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 40
  store i8 105, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 41
  store i8 122, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 42
  store i8 101, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 43
  store i8 100, i8* %"str_char_43.1"
  %"str_char_44.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 44
  store i8 32, i8* %"str_char_44.1"
  %"str_char_45.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 45
  store i8 97, i8* %"str_char_45.1"
  %"str_char_46.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 46
  store i8 108, i8* %"str_char_46.1"
  %"str_char_47.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 47
  store i8 108, i8* %"str_char_47.1"
  %"str_char_48.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 48
  store i8 111, i8* %"str_char_48.1"
  %"str_char_49.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 49
  store i8 99, i8* %"str_char_49.1"
  %"str_char_50.1" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 50
  store i8 47, i8* %"str_char_50.1"
  %"str_char_51" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 51
  store i8 102, i8* %"str_char_51"
  %"str_char_52" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 52
  store i8 114, i8* %"str_char_52"
  %"str_char_53" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 53
  store i8 101, i8* %"str_char_53"
  %"str_char_54" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 54
  store i8 101, i8* %"str_char_54"
  %"str_char_55" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 55
  store i8 32, i8* %"str_char_55"
  %"str_char_56" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 56
  store i8 99, i8* %"str_char_56"
  %"str_char_57" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 57
  store i8 121, i8* %"str_char_57"
  %"str_char_58" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 58
  store i8 99, i8* %"str_char_58"
  %"str_char_59" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 59
  store i8 108, i8* %"str_char_59"
  %"str_char_60" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 60
  store i8 101, i8* %"str_char_60"
  %"str_char_61" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 61
  store i8 115, i8* %"str_char_61"
  %"str_char_62" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 62
  store i8 0, i8* %"str_char_62"
  %"arg1_decay" = getelementptr [63 x i8], [63 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay")
  ret void
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"ptr.2" = load i64, i64* %"ptr"
  %"int_to_ptr" = inttoptr i64 %"ptr.2" to i8*
  store i8* %"int_to_ptr", i8** %"p"
  %".94" = sext i32 0 to i64
  store i64 %".94", i64* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j.1" = load i64, i64* %"j"
  %"sz.2" = load i64, i64* %"sz"
  %".97" = icmp ult i64 %"j.1", %"sz.2"
  br i1 %".97", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"tag.1" = load i8, i8* %"tag"
  %"p.1" = load i8*, i8** %"p"
  %"j.2" = load i64, i64* %"j"
  %".99" = getelementptr inbounds i8, i8* %"p.1", i64 %"j.2"
  store i8 %"tag.1", i8* %".99"
  %"j.3" = load i64, i64* %"j"
  %".101" = add i64 %"j.3", 1
  store i64 %".101", i64* %"j"
  br label %"while.cond.1"
while.end.1:
  %".104" = sext i32 0 to i64
  store i64 %".104", i64* %"j"
  br label %"while.cond.2"
while.cond.2:
  %"j.4" = load i64, i64* %"j"
  %"sz.3" = load i64, i64* %"sz"
  %".107" = icmp ult i64 %"j.4", %"sz.3"
  br i1 %".107", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"p.2" = load i8*, i8** %"p"
  %"j.5" = load i64, i64* %"j"
  %"idx_trunc" = trunc i64 %"j.5" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"p.2", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"tag.2" = load i8, i8* %"tag"
  %".109" = icmp ne i8 %"ptr_load", %"tag.2"
  br i1 %".109", label %"then.1", label %"else.1"
while.end.2:
  %"ok.1" = load i1, i1* %"ok"
  %".117" = xor i1 %"ok.1", -1
  br i1 %".117", label %"then.2", label %"else.2"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.2"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"j.6" = load i64, i64* %"j"
  %".114" = add i64 %"j.6", 1
  store i64 %".114", i64* %"j"
  br label %"while.cond.2"
then.2:
  br label %"while.end"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"ptr.3" = load i64, i64* %"ptr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.3")
  %"i.3" = load i64, i64* %"i"
  %".122" = add i64 %"i.3", 1
  store i64 %".122", i64* %"i"
  br label %"while.cond"
}

define void @"test_no_overlap__0__ret_voidE1"()
{
entry:
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"ptrs" = alloca [512 x i64]
  %"memset_ptr" = bitcast [512 x i64]* %"ptrs" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 4096, i1 0)
  %"tags" = alloca [512 x i8]
  %"memset_ptr.1" = bitcast [512 x i8]* %"tags" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr.1", i8 0, i64 512, i1 0)
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"str_stack" = alloca [40 x i8]
  %"str_char_0" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 3
  store i8 110, i8* %"str_char_3"
  %"str_char_4" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 4
  store i8 111, i8* %"str_char_4"
  %"str_char_5" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 5
  store i8 45, i8* %"str_char_5"
  %"str_char_6" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 6
  store i8 111, i8* %"str_char_6"
  %"str_char_7" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 7
  store i8 118, i8* %"str_char_7"
  %"str_char_8" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 9
  store i8 114, i8* %"str_char_9"
  %"str_char_10" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 10
  store i8 108, i8* %"str_char_10"
  %"str_char_11" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 11
  store i8 97, i8* %"str_char_11"
  %"str_char_12" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 12
  store i8 112, i8* %"str_char_12"
  %"str_char_13" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 13
  store i8 32, i8* %"str_char_13"
  %"str_char_14" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 14
  store i8 117, i8* %"str_char_14"
  %"str_char_15" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 15
  store i8 110, i8* %"str_char_15"
  %"str_char_16" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 16
  store i8 100, i8* %"str_char_16"
  %"str_char_17" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 17
  store i8 101, i8* %"str_char_17"
  %"str_char_18" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 18
  store i8 114, i8* %"str_char_18"
  %"str_char_19" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 20
  store i8 53, i8* %"str_char_20"
  %"str_char_21" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 21
  store i8 49, i8* %"str_char_21"
  %"str_char_22" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 22
  store i8 50, i8* %"str_char_22"
  %"str_char_23" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 23
  store i8 32, i8* %"str_char_23"
  %"str_char_24" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 24
  store i8 108, i8* %"str_char_24"
  %"str_char_25" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 25
  store i8 105, i8* %"str_char_25"
  %"str_char_26" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 26
  store i8 118, i8* %"str_char_26"
  %"str_char_27" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 27
  store i8 101, i8* %"str_char_27"
  %"str_char_28" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 28
  store i8 32, i8* %"str_char_28"
  %"str_char_29" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 29
  store i8 98, i8* %"str_char_29"
  %"str_char_30" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 30
  store i8 108, i8* %"str_char_30"
  %"str_char_31" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 31
  store i8 111, i8* %"str_char_31"
  %"str_char_32" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 32
  store i8 99, i8* %"str_char_32"
  %"str_char_33" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 33
  store i8 107, i8* %"str_char_33"
  %"str_char_34" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 34
  store i8 115, i8* %"str_char_34"
  %"str_char_35" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 35
  store i8 32, i8* %"str_char_35"
  %"str_char_36" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 36
  store i8 45, i8* %"str_char_36"
  %"str_char_37" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 37
  store i8 45, i8* %"str_char_37"
  %"str_char_38" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 38
  store i8 10, i8* %"str_char_38"
  %"str_char_39" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 39
  store i8 0, i8* %"str_char_39"
  %"arg0_decay" = getelementptr [40 x i8], [40 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %".55" = sext i32 512 to i64
  store i64 %".55", i64* %"n"
  store i1 true, i1* %"ok"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".59" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".59", label %"while.body", label %"while.end"
while.body:
  %".61" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".61", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".63" = zext i32 %"rval.1" to i64
  store i64 %".63", i64* %"rval64"
  %"rval64.1" = load i64, i64* %"rval64"
  %".65" = zext i32 256 to i64
  %".66" = urem i64 %"rval64.1", %".65"
  %".67" = zext i32 1 to i64
  %".68" = add i64 %".66", %".67"
  store i64 %".68", i64* %"sz"
  %"sz.1" = load i64, i64* %"sz"
  %".70" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.1")
  %"i.2" = load i64, i64* %"i"
  %".71" = getelementptr inbounds [512 x i64], [512 x i64]* %"ptrs", i32 0, i64 %"i.2"
  store i64 %".70", i64* %".71"
  %"i.3" = load i64, i64* %"i"
  %".73" = zext i32 255 to i64
  %".74" = and i64 %"i.3", %".73"
  %".75" = trunc i64 %".74" to i8
  %"i.4" = load i64, i64* %"i"
  %".76" = getelementptr inbounds [512 x i8], [512 x i8]* %"tags", i32 0, i64 %"i.4"
  store i8 %".75", i8* %".76"
  %"i.5" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.5" to i32
  %"array_gep" = getelementptr inbounds [512 x i64], [512 x i64]* %"ptrs", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  %".78" = zext i32 0 to i64
  %".79" = icmp eq i64 %"array_load", %".78"
  br i1 %".79", label %"then", label %"else"
while.end:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [34 x i8]
  %"str_char_0.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 97, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 108, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 108, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 32, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 53, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 49, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 50, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 32, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 98, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 108, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 111, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 99, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 107, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 115, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 32, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 97, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 108, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 108, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 111, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 99, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 97, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 116, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 101, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 100, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 32, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 110, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 111, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 110, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 45, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 110, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 117, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 108, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 108, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 0, i8* %"str_char_33.1"
  %"arg1_decay" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  store i1 true, i1* %"ok"
  %".138" = sext i32 0 to i64
  store i64 %".138", i64* %"i"
  br label %"while.cond.2"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"i.6" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.6" to i32
  %"array_gep.1" = getelementptr inbounds [512 x i64], [512 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  %"int_to_ptr" = inttoptr i64 %"array_load.1" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".85" = sext i32 0 to i64
  store i64 %".85", i64* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j.1" = load i64, i64* %"j"
  %".88" = zext i32 16 to i64
  %".89" = icmp ult i64 %"j.1", %".88"
  br i1 %".89", label %"sc_rhs", label %"sc_end"
while.body.1:
  %"i.7" = load i64, i64* %"i"
  %"idx_trunc.2" = trunc i64 %"i.7" to i32
  %"array_gep.2" = getelementptr inbounds [512 x i8], [512 x i8]* %"tags", i32 0, i32 %"idx_trunc.2"
  %"array_load.2" = load i8, i8* %"array_gep.2"
  %"bp.1" = load i8*, i8** %"bp"
  %"j.3" = load i64, i64* %"j"
  %".94" = getelementptr inbounds i8, i8* %"bp.1", i64 %"j.3"
  store i8 %"array_load.2", i8* %".94"
  %"j.4" = load i64, i64* %"j"
  %".96" = add i64 %"j.4", 1
  store i64 %".96", i64* %"j"
  br label %"while.cond.1"
while.end.1:
  %"i.8" = load i64, i64* %"i"
  %".99" = add i64 %"i.8", 1
  store i64 %".99", i64* %"i"
  br label %"while.cond"
sc_rhs:
  %"j.2" = load i64, i64* %"j"
  %"sz.2" = load i64, i64* %"sz"
  %".91" = icmp ult i64 %"j.2", %"sz.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond.1"], [%".91", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body.1", label %"while.end.1"
while.cond.2:
  %"i.9" = load i64, i64* %"i"
  %"n.2" = load i64, i64* %"n"
  %".141" = icmp ult i64 %"i.9", %"n.2"
  br i1 %".141", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"i.10" = load i64, i64* %"i"
  %"idx_trunc.3" = trunc i64 %"i.10" to i32
  %"array_gep.3" = getelementptr inbounds [512 x i64], [512 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.3"
  %"array_load.3" = load i64, i64* %"array_gep.3"
  %"int_to_ptr.1" = inttoptr i64 %"array_load.3" to i8*
  store i8* %"int_to_ptr.1", i8** %"bp"
  %"bp.2" = load i8*, i8** %"bp"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"bp.2", i32 0
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"i.11" = load i64, i64* %"i"
  %"idx_trunc.4" = trunc i64 %"i.11" to i32
  %"array_gep.4" = getelementptr inbounds [512 x i8], [512 x i8]* %"tags", i32 0, i32 %"idx_trunc.4"
  %"array_load.4" = load i8, i8* %"array_gep.4"
  %".144" = icmp ne i8 %"ptr_load", %"array_load.4"
  br i1 %".144", label %"then.1", label %"else.1"
while.end.2:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.2" = alloca [39 x i8]
  %"str_char_0.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 110, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 111, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 32, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 98, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 111, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 99, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 107, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 97, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 108, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 105, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 97, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 115, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 105, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 110, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 103, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 58, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 32, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 97, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 108, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 108, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 32, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 116, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 97, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 103, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 99, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 104, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 101, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 99, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 107, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 115, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 32, i8* %"str_char_33.2"
  %"str_char_34.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 112, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 97, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 115, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 115, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 38
  store i8 0, i8* %"str_char_38.1"
  %"arg1_decay.1" = getelementptr [39 x i8], [39 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.1")
  %".192" = sext i32 0 to i64
  store i64 %".192", i64* %"i"
  br label %"while.cond.3"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.2"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i.12" = load i64, i64* %"i"
  %".149" = add i64 %"i.12", 1
  store i64 %".149", i64* %"i"
  br label %"while.cond.2"
while.cond.3:
  %"i.13" = load i64, i64* %"i"
  %"n.3" = load i64, i64* %"n"
  %".195" = icmp ult i64 %"i.13", %"n.3"
  br i1 %".195", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i.14" = load i64, i64* %"i"
  %"idx_trunc.5" = trunc i64 %"i.14" to i32
  %"array_gep.5" = getelementptr inbounds [512 x i64], [512 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.5"
  %"array_load.5" = load i64, i64* %"array_gep.5"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.5")
  %"i.15" = load i64, i64* %"i"
  %".198" = add i64 %"i.15", 1
  store i64 %".198", i64* %"i"
  br label %"while.cond.3"
while.end.3:
  ret void
}

define void @"test_frealloc_same_class__0__ret_voidE1"()
{
entry:
  %"p1" = alloca i64
  store i64 0, i64* %"p1"
  %"p2" = alloca i64
  store i64 0, i64* %"p2"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"str_stack" = alloca [36 x i8]
  %"str_char_0" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 3
  store i8 102, i8* %"str_char_3"
  %"str_char_4" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 6
  store i8 97, i8* %"str_char_6"
  %"str_char_7" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 8
  store i8 108, i8* %"str_char_8"
  %"str_char_9" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 9
  store i8 111, i8* %"str_char_9"
  %"str_char_10" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 10
  store i8 99, i8* %"str_char_10"
  %"str_char_11" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 12
  store i8 115, i8* %"str_char_12"
  %"str_char_13" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 13
  store i8 97, i8* %"str_char_13"
  %"str_char_14" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 14
  store i8 109, i8* %"str_char_14"
  %"str_char_15" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 15
  store i8 101, i8* %"str_char_15"
  %"str_char_16" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 16
  store i8 45, i8* %"str_char_16"
  %"str_char_17" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 17
  store i8 99, i8* %"str_char_17"
  %"str_char_18" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 18
  store i8 108, i8* %"str_char_18"
  %"str_char_19" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 19
  store i8 97, i8* %"str_char_19"
  %"str_char_20" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 20
  store i8 115, i8* %"str_char_20"
  %"str_char_21" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 21
  store i8 115, i8* %"str_char_21"
  %"str_char_22" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 22
  store i8 32, i8* %"str_char_22"
  %"str_char_23" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 23
  store i8 105, i8* %"str_char_23"
  %"str_char_24" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 24
  store i8 110, i8* %"str_char_24"
  %"str_char_25" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 25
  store i8 45, i8* %"str_char_25"
  %"str_char_26" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 26
  store i8 112, i8* %"str_char_26"
  %"str_char_27" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 27
  store i8 108, i8* %"str_char_27"
  %"str_char_28" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 28
  store i8 97, i8* %"str_char_28"
  %"str_char_29" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 29
  store i8 99, i8* %"str_char_29"
  %"str_char_30" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 30
  store i8 101, i8* %"str_char_30"
  %"str_char_31" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 31
  store i8 32, i8* %"str_char_31"
  %"str_char_32" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 32
  store i8 45, i8* %"str_char_32"
  %"str_char_33" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 33
  store i8 45, i8* %"str_char_33"
  %"str_char_34" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 34
  store i8 10, i8* %"str_char_34"
  %"str_char_35" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 35
  store i8 0, i8* %"str_char_35"
  %"arg0_decay" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".44" = sext i32 33 to i64
  %".45" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".44")
  store i64 %".45", i64* %"p1"
  %"p1.1" = load i64, i64* %"p1"
  %".47" = zext i32 0 to i64
  %".48" = icmp ne i64 %"p1.1", %".47"
  %"str_stack.1" = alloca [21 x i8]
  %"str_char_0.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 109, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 108, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 40, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 51, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 51, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 41, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 32, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 110, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 110, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 45, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 110, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 117, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 108, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 108, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 0, i8* %"str_char_20.1"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".48", i8* %"arg1_decay")
  %"p1.2" = load i64, i64* %"p1"
  %"int_to_ptr" = inttoptr i64 %"p1.2" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".72" = sext i32 0 to i64
  store i64 %".72", i64* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %".75" = zext i32 33 to i64
  %".76" = icmp ult i64 %"i.1", %".75"
  br i1 %".76", label %"while.body", label %"while.end"
while.body:
  %".78" = trunc i32 170 to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"i.2" = load i64, i64* %"i"
  %".79" = getelementptr inbounds i8, i8* %"bp.1", i64 %"i.2"
  store i8 %".78", i8* %".79"
  %"i.3" = load i64, i64* %"i"
  %".81" = add i64 %"i.3", 1
  store i64 %".81", i64* %"i"
  br label %"while.cond"
while.end:
  %"p1.3" = load i64, i64* %"p1"
  %".84" = sext i32 64 to i64
  %".85" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.3", i64 %".84")
  store i64 %".85", i64* %"p2"
  %"p2.1" = load i64, i64* %"p2"
  %"p1.4" = load i64, i64* %"p1"
  %".87" = icmp eq i64 %"p2.1", %"p1.4"
  %"str_stack.2" = alloca [45 x i8]
  %"str_char_0.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 114, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 101, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 97, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 108, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 111, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 99, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 119, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 105, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 116, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 104, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 105, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 110, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 32, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 99, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 108, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 97, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 115, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 115, i8* %"str_char_20.2"
  %"str_char_21.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 58, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 32, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 115, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 97, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 109, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 101, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 32, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 112, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 111, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 105, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 110, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 116, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 101, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 114, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 32, i8* %"str_char_35.1"
  %"str_char_36" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 114, i8* %"str_char_36"
  %"str_char_37" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 101, i8* %"str_char_37"
  %"str_char_38" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 38
  store i8 116, i8* %"str_char_38"
  %"str_char_39" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 39
  store i8 117, i8* %"str_char_39"
  %"str_char_40" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 40
  store i8 114, i8* %"str_char_40"
  %"str_char_41" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 41
  store i8 110, i8* %"str_char_41"
  %"str_char_42" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 42
  store i8 101, i8* %"str_char_42"
  %"str_char_43" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 43
  store i8 100, i8* %"str_char_43"
  %"str_char_44" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 44
  store i8 0, i8* %"str_char_44"
  %"arg1_decay.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".87", i8* %"arg1_decay.1")
  store i1 true, i1* %"ok"
  %".135" = sext i32 0 to i64
  store i64 %".135", i64* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.4" = load i64, i64* %"i"
  %".138" = zext i32 33 to i64
  %".139" = icmp ult i64 %"i.4", %".138"
  br i1 %".139", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"p2.2" = load i64, i64* %"p2"
  %"int_to_ptr.1" = inttoptr i64 %"p2.2" to i8*
  %"i.5" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.5" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"int_to_ptr.1", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".141" = trunc i32 170 to i8
  %".142" = icmp ne i8 %"ptr_load", %".141"
  br i1 %".142", label %"then", label %"else"
while.end.1:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.3" = alloca [38 x i8]
  %"str_char_0.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 114, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 101, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 97, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 108, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 111, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 99, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 32, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 119, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 105, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 116, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 104, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 105, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 110, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 32, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 99, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 108, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 97, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 115, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 115, i8* %"str_char_20.3"
  %"str_char_21.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 58, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 32, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 100, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 97, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 116, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 97, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 32, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 112, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 114, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 101, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 115, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 101, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 33
  store i8 114, i8* %"str_char_33.2"
  %"str_char_34.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 34
  store i8 118, i8* %"str_char_34.2"
  %"str_char_35.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 35
  store i8 101, i8* %"str_char_35.2"
  %"str_char_36.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 36
  store i8 100, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 37
  store i8 0, i8* %"str_char_37.1"
  %"arg1_decay.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay.2")
  %"p2.3" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.3")
  %".190" = sext i32 128 to i64
  %".191" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".190")
  store i64 %".191", i64* %"p1"
  %"p1.5" = load i64, i64* %"p1"
  %".193" = zext i32 0 to i64
  %".194" = icmp ne i64 %"p1.5", %".193"
  %"str_stack.4" = alloca [38 x i8]
  %"str_char_0.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 109, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 97, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 108, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 108, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 111, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 99, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 40, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 49, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 50, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 56, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 41, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 32, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 110, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 111, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 110, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 45, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 110, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 117, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 108, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 108, i8* %"str_char_20.4"
  %"str_char_21.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 32, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 102, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 111, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 114, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 32, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 115, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 104, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 114, i8* %"str_char_28.3"
  %"str_char_29.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 29
  store i8 105, i8* %"str_char_29.3"
  %"str_char_30.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 30
  store i8 110, i8* %"str_char_30.3"
  %"str_char_31.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 31
  store i8 107, i8* %"str_char_31.3"
  %"str_char_32.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 32
  store i8 32, i8* %"str_char_32.3"
  %"str_char_33.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 33
  store i8 116, i8* %"str_char_33.3"
  %"str_char_34.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 34
  store i8 101, i8* %"str_char_34.3"
  %"str_char_35.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 35
  store i8 115, i8* %"str_char_35.3"
  %"str_char_36.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 36
  store i8 116, i8* %"str_char_36.2"
  %"str_char_37.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 37
  store i8 0, i8* %"str_char_37.2"
  %"arg1_decay.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".194", i8* %"arg1_decay.3")
  %"p1.6" = load i64, i64* %"p1"
  %"int_to_ptr.2" = inttoptr i64 %"p1.6" to i8*
  store i8* %"int_to_ptr.2", i8** %"bp"
  %".235" = sext i32 0 to i64
  store i64 %".235", i64* %"i"
  br label %"while.cond.2"
then:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else:
  br label %"ifcont"
ifcont:
  %"i.6" = load i64, i64* %"i"
  %".147" = add i64 %"i.6", 1
  store i64 %".147", i64* %"i"
  br label %"while.cond.1"
while.cond.2:
  %"i.7" = load i64, i64* %"i"
  %".238" = zext i32 64 to i64
  %".239" = icmp ult i64 %"i.7", %".238"
  br i1 %".239", label %"while.body.2", label %"while.end.2"
while.body.2:
  %".241" = trunc i32 187 to i8
  %"bp.2" = load i8*, i8** %"bp"
  %"i.8" = load i64, i64* %"i"
  %".242" = getelementptr inbounds i8, i8* %"bp.2", i64 %"i.8"
  store i8 %".241", i8* %".242"
  %"i.9" = load i64, i64* %"i"
  %".244" = add i64 %"i.9", 1
  store i64 %".244", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  %"p1.7" = load i64, i64* %"p1"
  %".247" = sext i32 60 to i64
  %".248" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.7", i64 %".247")
  store i64 %".248", i64* %"p2"
  %"p2.4" = load i64, i64* %"p2"
  %"p1.8" = load i64, i64* %"p1"
  %".250" = icmp eq i64 %"p2.4", %"p1.8"
  %"str_stack.5" = alloca [47 x i8]
  %"str_char_0.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 102, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 114, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 101, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 97, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 108, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 108, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 111, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 99, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 32, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 115, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 104, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 114, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 105, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 110, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 107, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 32, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 116, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 111, i8* %"str_char_17.5"
  %"str_char_18.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 32, i8* %"str_char_18.5"
  %"str_char_19.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 115, i8* %"str_char_19.5"
  %"str_char_20.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 109, i8* %"str_char_20.5"
  %"str_char_21.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 97, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 108, i8* %"str_char_22.4"
  %"str_char_23.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 108, i8* %"str_char_23.4"
  %"str_char_24.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 101, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 114, i8* %"str_char_25.4"
  %"str_char_26.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 26
  store i8 32, i8* %"str_char_26.4"
  %"str_char_27.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 27
  store i8 99, i8* %"str_char_27.4"
  %"str_char_28.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 28
  store i8 108, i8* %"str_char_28.4"
  %"str_char_29.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 29
  store i8 97, i8* %"str_char_29.4"
  %"str_char_30.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 30
  store i8 115, i8* %"str_char_30.4"
  %"str_char_31.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 31
  store i8 115, i8* %"str_char_31.4"
  %"str_char_32.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 32
  store i8 58, i8* %"str_char_32.4"
  %"str_char_33.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 33
  store i8 32, i8* %"str_char_33.4"
  %"str_char_34.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 34
  store i8 115, i8* %"str_char_34.4"
  %"str_char_35.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 35
  store i8 97, i8* %"str_char_35.4"
  %"str_char_36.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 36
  store i8 109, i8* %"str_char_36.3"
  %"str_char_37.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 37
  store i8 101, i8* %"str_char_37.3"
  %"str_char_38.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 38
  store i8 32, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 39
  store i8 112, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 40
  store i8 111, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 41
  store i8 105, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 42
  store i8 110, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 43
  store i8 116, i8* %"str_char_43.1"
  %"str_char_44.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 44
  store i8 101, i8* %"str_char_44.1"
  %"str_char_45" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 45
  store i8 114, i8* %"str_char_45"
  %"str_char_46" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 46
  store i8 0, i8* %"str_char_46"
  %"arg1_decay.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".250", i8* %"arg1_decay.4")
  store i1 true, i1* %"ok"
  %".300" = sext i32 0 to i64
  store i64 %".300", i64* %"i"
  br label %"while.cond.3"
while.cond.3:
  %"i.10" = load i64, i64* %"i"
  %".303" = zext i32 60 to i64
  %".304" = icmp ult i64 %"i.10", %".303"
  br i1 %".304", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"p2.5" = load i64, i64* %"p2"
  %"int_to_ptr.3" = inttoptr i64 %"p2.5" to i8*
  %"i.11" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.11" to i32
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"int_to_ptr.3", i32 %"idx_trunc.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".306" = trunc i32 187 to i8
  %".307" = icmp ne i8 %"ptr_load.1", %".306"
  br i1 %".307", label %"then.1", label %"else.1"
while.end.3:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.6" = alloca [32 x i8]
  %"str_char_0.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 102, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 114, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 101, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 97, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 108, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 108, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 111, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 99, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 32, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 115, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 104, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 114, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 105, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 110, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 107, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 58, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 32, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 100, i8* %"str_char_17.6"
  %"str_char_18.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 97, i8* %"str_char_18.6"
  %"str_char_19.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 116, i8* %"str_char_19.6"
  %"str_char_20.6" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 97, i8* %"str_char_20.6"
  %"str_char_21.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 32, i8* %"str_char_21.5"
  %"str_char_22.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 22
  store i8 112, i8* %"str_char_22.5"
  %"str_char_23.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 23
  store i8 114, i8* %"str_char_23.5"
  %"str_char_24.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 24
  store i8 101, i8* %"str_char_24.5"
  %"str_char_25.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 25
  store i8 115, i8* %"str_char_25.5"
  %"str_char_26.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 26
  store i8 101, i8* %"str_char_26.5"
  %"str_char_27.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 27
  store i8 114, i8* %"str_char_27.5"
  %"str_char_28.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 28
  store i8 118, i8* %"str_char_28.5"
  %"str_char_29.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 29
  store i8 101, i8* %"str_char_29.5"
  %"str_char_30.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 30
  store i8 100, i8* %"str_char_30.5"
  %"str_char_31.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 31
  store i8 0, i8* %"str_char_31.5"
  %"arg1_decay.5" = getelementptr [32 x i8], [32 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.5")
  %"p2.6" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.6")
  ret void
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.3"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i.12" = load i64, i64* %"i"
  %".312" = add i64 %"i.12", 1
  store i64 %".312", i64* %"i"
  br label %"while.cond.3"
}

define void @"test_frealloc_grow__0__ret_voidE1"()
{
entry:
  %"p1" = alloca i64
  store i64 0, i64* %"p1"
  %"p2" = alloca i64
  store i64 0, i64* %"p2"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"str_stack" = alloca [21 x i8]
  %"str_char_0" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 3
  store i8 102, i8* %"str_char_3"
  %"str_char_4" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 6
  store i8 97, i8* %"str_char_6"
  %"str_char_7" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 8
  store i8 108, i8* %"str_char_8"
  %"str_char_9" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 9
  store i8 111, i8* %"str_char_9"
  %"str_char_10" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 10
  store i8 99, i8* %"str_char_10"
  %"str_char_11" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 12
  store i8 103, i8* %"str_char_12"
  %"str_char_13" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 13
  store i8 114, i8* %"str_char_13"
  %"str_char_14" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 14
  store i8 111, i8* %"str_char_14"
  %"str_char_15" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 15
  store i8 119, i8* %"str_char_15"
  %"str_char_16" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 16
  store i8 32, i8* %"str_char_16"
  %"str_char_17" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 17
  store i8 45, i8* %"str_char_17"
  %"str_char_18" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 18
  store i8 45, i8* %"str_char_18"
  %"str_char_19" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 19
  store i8 10, i8* %"str_char_19"
  %"str_char_20" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 20
  store i8 0, i8* %"str_char_20"
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".29" = sext i32 32 to i64
  %".30" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".29")
  store i64 %".30", i64* %"p1"
  %"p1.1" = load i64, i64* %"p1"
  %".32" = zext i32 0 to i64
  %".33" = icmp ne i64 %"p1.1", %".32"
  %"str_stack.1" = alloca [21 x i8]
  %"str_char_0.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 109, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 108, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 40, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 51, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 50, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 41, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 32, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 110, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 110, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 45, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 110, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 117, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 108, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 108, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 0, i8* %"str_char_20.1"
  %"arg1_decay" = getelementptr [21 x i8], [21 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".33", i8* %"arg1_decay")
  %"p1.2" = load i64, i64* %"p1"
  %"int_to_ptr" = inttoptr i64 %"p1.2" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".57" = sext i32 0 to i64
  store i64 %".57", i64* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %".60" = zext i32 32 to i64
  %".61" = icmp ult i64 %"i.1", %".60"
  br i1 %".61", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i64, i64* %"i"
  %".63" = zext i32 255 to i64
  %".64" = and i64 %"i.2", %".63"
  %".65" = trunc i64 %".64" to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"i.3" = load i64, i64* %"i"
  %".66" = getelementptr inbounds i8, i8* %"bp.1", i64 %"i.3"
  store i8 %".65", i8* %".66"
  %"i.4" = load i64, i64* %"i"
  %".68" = add i64 %"i.4", 1
  store i64 %".68", i64* %"i"
  br label %"while.cond"
while.end:
  %"p1.3" = load i64, i64* %"p1"
  %".71" = sext i32 128 to i64
  %".72" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.3", i64 %".71")
  store i64 %".72", i64* %"p2"
  %"p2.1" = load i64, i64* %"p2"
  %".74" = zext i32 0 to i64
  %".75" = icmp ne i64 %"p2.1", %".74"
  %"str_stack.2" = alloca [23 x i8]
  %"str_char_0.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 114, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 101, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 97, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 108, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 111, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 99, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 103, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 114, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 111, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 119, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 110, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 111, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 110, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 45, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 110, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 117, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 108, i8* %"str_char_20.2"
  %"str_char_21" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 108, i8* %"str_char_21"
  %"str_char_22" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 0, i8* %"str_char_22"
  %"arg1_decay.1" = getelementptr [23 x i8], [23 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".75", i8* %"arg1_decay.1")
  store i1 true, i1* %"ok"
  %".101" = sext i32 0 to i64
  store i64 %".101", i64* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.5" = load i64, i64* %"i"
  %".104" = zext i32 32 to i64
  %".105" = icmp ult i64 %"i.5", %".104"
  br i1 %".105", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"p2.2" = load i64, i64* %"p2"
  %"int_to_ptr.1" = inttoptr i64 %"p2.2" to i8*
  %"i.6" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.6" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"int_to_ptr.1", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"i.7" = load i64, i64* %"i"
  %".107" = zext i32 255 to i64
  %".108" = and i64 %"i.7", %".107"
  %".109" = trunc i64 %".108" to i8
  %".110" = icmp ne i8 %"ptr_load", %".109"
  br i1 %".110", label %"then", label %"else"
while.end.1:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.3" = alloca [40 x i8]
  %"str_char_0.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 114, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 101, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 97, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 108, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 111, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 99, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 32, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 103, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 114, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 111, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 119, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 58, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 32, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 111, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 114, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 105, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 103, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 105, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 110, i8* %"str_char_20.3"
  %"str_char_21.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 97, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 108, i8* %"str_char_22.1"
  %"str_char_23" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 32, i8* %"str_char_23"
  %"str_char_24" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 98, i8* %"str_char_24"
  %"str_char_25" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 121, i8* %"str_char_25"
  %"str_char_26" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 116, i8* %"str_char_26"
  %"str_char_27" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 101, i8* %"str_char_27"
  %"str_char_28" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 115, i8* %"str_char_28"
  %"str_char_29" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 32, i8* %"str_char_29"
  %"str_char_30" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 112, i8* %"str_char_30"
  %"str_char_31" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 114, i8* %"str_char_31"
  %"str_char_32" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 101, i8* %"str_char_32"
  %"str_char_33" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 33
  store i8 115, i8* %"str_char_33"
  %"str_char_34" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 34
  store i8 101, i8* %"str_char_34"
  %"str_char_35" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 35
  store i8 114, i8* %"str_char_35"
  %"str_char_36" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 36
  store i8 118, i8* %"str_char_36"
  %"str_char_37" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 37
  store i8 101, i8* %"str_char_37"
  %"str_char_38" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 38
  store i8 100, i8* %"str_char_38"
  %"str_char_39" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 39
  store i8 0, i8* %"str_char_39"
  %"arg1_decay.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay.2")
  %"p2.3" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.3")
  %".160" = sext i32 64 to i64
  %".161" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".160")
  store i64 %".161", i64* %"p1"
  %"p1.4" = load i64, i64* %"p1"
  %".163" = zext i32 0 to i64
  %".164" = icmp ne i64 %"p1.4", %".163"
  %"str_stack.4" = alloca [45 x i8]
  %"str_char_0.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 109, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 97, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 108, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 108, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 111, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 99, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 40, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 54, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 52, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 41, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 32, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 110, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 111, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 110, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 45, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 110, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 117, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 108, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 108, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 32, i8* %"str_char_20.4"
  %"str_char_21.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 102, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 111, i8* %"str_char_22.2"
  %"str_char_23.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 114, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 32, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 99, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 114, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 111, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 115, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 29
  store i8 115, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 30
  store i8 45, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 31
  store i8 98, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 32
  store i8 111, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 33
  store i8 117, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 34
  store i8 110, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 35
  store i8 100, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 36
  store i8 97, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 37
  store i8 114, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 38
  store i8 121, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 39
  store i8 32, i8* %"str_char_39.1"
  %"str_char_40" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 40
  store i8 103, i8* %"str_char_40"
  %"str_char_41" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 41
  store i8 114, i8* %"str_char_41"
  %"str_char_42" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 42
  store i8 111, i8* %"str_char_42"
  %"str_char_43" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 43
  store i8 119, i8* %"str_char_43"
  %"str_char_44" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 44
  store i8 0, i8* %"str_char_44"
  %"arg1_decay.3" = getelementptr [45 x i8], [45 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".164", i8* %"arg1_decay.3")
  %"p1.5" = load i64, i64* %"p1"
  %"int_to_ptr.2" = inttoptr i64 %"p1.5" to i8*
  store i8* %"int_to_ptr.2", i8** %"bp"
  %".212" = sext i32 0 to i64
  store i64 %".212", i64* %"i"
  br label %"while.cond.2"
then:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else:
  br label %"ifcont"
ifcont:
  %"i.8" = load i64, i64* %"i"
  %".115" = add i64 %"i.8", 1
  store i64 %".115", i64* %"i"
  br label %"while.cond.1"
while.cond.2:
  %"i.9" = load i64, i64* %"i"
  %".215" = zext i32 64 to i64
  %".216" = icmp ult i64 %"i.9", %".215"
  br i1 %".216", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"i.10" = load i64, i64* %"i"
  %".218" = zext i32 255 to i64
  %".219" = sub i64 %".218", %"i.10"
  %".220" = trunc i64 %".219" to i8
  %"bp.2" = load i8*, i8** %"bp"
  %"i.11" = load i64, i64* %"i"
  %".221" = getelementptr inbounds i8, i8* %"bp.2", i64 %"i.11"
  store i8 %".220", i8* %".221"
  %"i.12" = load i64, i64* %"i"
  %".223" = add i64 %"i.12", 1
  store i64 %".223", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  %"p1.6" = load i64, i64* %"p1"
  %".226" = sext i32 8192 to i64
  %".227" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.6", i64 %".226")
  store i64 %".227", i64* %"p2"
  %"p2.4" = load i64, i64* %"p2"
  %".229" = zext i32 0 to i64
  %".230" = icmp ne i64 %"p2.4", %".229"
  %"str_stack.5" = alloca [31 x i8]
  %"str_char_0.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 102, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 114, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 101, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 97, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 108, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 108, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 111, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 99, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 32, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 115, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 109, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 97, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 108, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 108, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 45, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 62, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 108, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 97, i8* %"str_char_17.5"
  %"str_char_18.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 114, i8* %"str_char_18.5"
  %"str_char_19.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 103, i8* %"str_char_19.5"
  %"str_char_20.5" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 101, i8* %"str_char_20.5"
  %"str_char_21.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 32, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 110, i8* %"str_char_22.3"
  %"str_char_23.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 111, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 110, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 45, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 26
  store i8 110, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 27
  store i8 117, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 28
  store i8 108, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 29
  store i8 108, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 30
  store i8 0, i8* %"str_char_30.2"
  %"arg1_decay.4" = getelementptr [31 x i8], [31 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".230", i8* %"arg1_decay.4")
  %"p2.5" = load i64, i64* %"p2"
  %"p1.7" = load i64, i64* %"p1"
  %".263" = icmp ne i64 %"p2.5", %"p1.7"
  %"str_stack.6" = alloca [36 x i8]
  %"str_char_0.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 102, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 114, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 101, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 97, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 108, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 108, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 111, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 99, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 32, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 115, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 109, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 97, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 108, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 108, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 45, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 62, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 108, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 97, i8* %"str_char_17.6"
  %"str_char_18.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 114, i8* %"str_char_18.6"
  %"str_char_19.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 103, i8* %"str_char_19.6"
  %"str_char_20.6" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 101, i8* %"str_char_20.6"
  %"str_char_21.4" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 32, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 22
  store i8 109, i8* %"str_char_22.4"
  %"str_char_23.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 23
  store i8 111, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 24
  store i8 118, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 25
  store i8 101, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 26
  store i8 100, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 27
  store i8 32, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 28
  store i8 112, i8* %"str_char_28.3"
  %"str_char_29.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 29
  store i8 111, i8* %"str_char_29.3"
  %"str_char_30.3" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 30
  store i8 105, i8* %"str_char_30.3"
  %"str_char_31.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 31
  store i8 110, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 32
  store i8 116, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 33
  store i8 101, i8* %"str_char_33.2"
  %"str_char_34.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 34
  store i8 114, i8* %"str_char_34.2"
  %"str_char_35.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 35
  store i8 0, i8* %"str_char_35.2"
  %"arg1_decay.5" = getelementptr [36 x i8], [36 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".263", i8* %"arg1_decay.5")
  store i1 true, i1* %"ok"
  %".302" = sext i32 0 to i64
  store i64 %".302", i64* %"i"
  br label %"while.cond.3"
while.cond.3:
  %"i.13" = load i64, i64* %"i"
  %".305" = zext i32 64 to i64
  %".306" = icmp ult i64 %"i.13", %".305"
  br i1 %".306", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"p2.6" = load i64, i64* %"p2"
  %"int_to_ptr.3" = inttoptr i64 %"p2.6" to i8*
  %"i.14" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.14" to i32
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"int_to_ptr.3", i32 %"idx_trunc.1"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %"i.15" = load i64, i64* %"i"
  %".308" = zext i32 255 to i64
  %".309" = sub i64 %".308", %"i.15"
  %".310" = trunc i64 %".309" to i8
  %".311" = icmp ne i8 %"ptr_load.1", %".310"
  br i1 %".311", label %"then.1", label %"else.1"
while.end.3:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.7" = alloca [48 x i8]
  %"str_char_0.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 102, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 114, i8* %"str_char_1.7"
  %"str_char_2.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 101, i8* %"str_char_2.7"
  %"str_char_3.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 97, i8* %"str_char_3.7"
  %"str_char_4.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 108, i8* %"str_char_4.7"
  %"str_char_5.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 108, i8* %"str_char_5.7"
  %"str_char_6.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 111, i8* %"str_char_6.7"
  %"str_char_7.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 99, i8* %"str_char_7.7"
  %"str_char_8.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 32, i8* %"str_char_8.7"
  %"str_char_9.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 115, i8* %"str_char_9.7"
  %"str_char_10.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 109, i8* %"str_char_10.7"
  %"str_char_11.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 97, i8* %"str_char_11.7"
  %"str_char_12.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 108, i8* %"str_char_12.7"
  %"str_char_13.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 108, i8* %"str_char_13.7"
  %"str_char_14.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 45, i8* %"str_char_14.7"
  %"str_char_15.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 15
  store i8 62, i8* %"str_char_15.7"
  %"str_char_16.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 16
  store i8 108, i8* %"str_char_16.7"
  %"str_char_17.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 17
  store i8 97, i8* %"str_char_17.7"
  %"str_char_18.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 18
  store i8 114, i8* %"str_char_18.7"
  %"str_char_19.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 19
  store i8 103, i8* %"str_char_19.7"
  %"str_char_20.7" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 20
  store i8 101, i8* %"str_char_20.7"
  %"str_char_21.5" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 21
  store i8 58, i8* %"str_char_21.5"
  %"str_char_22.5" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 22
  store i8 32, i8* %"str_char_22.5"
  %"str_char_23.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 23
  store i8 111, i8* %"str_char_23.4"
  %"str_char_24.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 24
  store i8 114, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 25
  store i8 105, i8* %"str_char_25.4"
  %"str_char_26.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 26
  store i8 103, i8* %"str_char_26.4"
  %"str_char_27.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 27
  store i8 105, i8* %"str_char_27.4"
  %"str_char_28.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 28
  store i8 110, i8* %"str_char_28.4"
  %"str_char_29.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 29
  store i8 97, i8* %"str_char_29.4"
  %"str_char_30.4" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 30
  store i8 108, i8* %"str_char_30.4"
  %"str_char_31.3" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 31
  store i8 32, i8* %"str_char_31.3"
  %"str_char_32.3" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 32
  store i8 98, i8* %"str_char_32.3"
  %"str_char_33.3" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 33
  store i8 121, i8* %"str_char_33.3"
  %"str_char_34.3" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 34
  store i8 116, i8* %"str_char_34.3"
  %"str_char_35.3" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 35
  store i8 101, i8* %"str_char_35.3"
  %"str_char_36.2" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 36
  store i8 115, i8* %"str_char_36.2"
  %"str_char_37.2" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 37
  store i8 32, i8* %"str_char_37.2"
  %"str_char_38.2" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 38
  store i8 112, i8* %"str_char_38.2"
  %"str_char_39.2" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 39
  store i8 114, i8* %"str_char_39.2"
  %"str_char_40.1" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 40
  store i8 101, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 41
  store i8 115, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 42
  store i8 101, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 43
  store i8 114, i8* %"str_char_43.1"
  %"str_char_44.1" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 44
  store i8 118, i8* %"str_char_44.1"
  %"str_char_45" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 45
  store i8 101, i8* %"str_char_45"
  %"str_char_46" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 46
  store i8 100, i8* %"str_char_46"
  %"str_char_47" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 47
  store i8 0, i8* %"str_char_47"
  %"arg1_decay.6" = getelementptr [48 x i8], [48 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.6")
  %"p2.7" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.7")
  %".369" = sext i32 8192 to i64
  %".370" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".369")
  store i64 %".370", i64* %"p1"
  %"p1.8" = load i64, i64* %"p1"
  %".372" = zext i32 0 to i64
  %".373" = icmp ne i64 %"p1.8", %".372"
  %"str_stack.8" = alloca [47 x i8]
  %"str_char_0.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 102, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 109, i8* %"str_char_1.8"
  %"str_char_2.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 2
  store i8 97, i8* %"str_char_2.8"
  %"str_char_3.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 3
  store i8 108, i8* %"str_char_3.8"
  %"str_char_4.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 4
  store i8 108, i8* %"str_char_4.8"
  %"str_char_5.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 5
  store i8 111, i8* %"str_char_5.8"
  %"str_char_6.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 6
  store i8 99, i8* %"str_char_6.8"
  %"str_char_7.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 7
  store i8 40, i8* %"str_char_7.8"
  %"str_char_8.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 8
  store i8 56, i8* %"str_char_8.8"
  %"str_char_9.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 9
  store i8 49, i8* %"str_char_9.8"
  %"str_char_10.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 10
  store i8 57, i8* %"str_char_10.8"
  %"str_char_11.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 11
  store i8 50, i8* %"str_char_11.8"
  %"str_char_12.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 12
  store i8 41, i8* %"str_char_12.8"
  %"str_char_13.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 13
  store i8 32, i8* %"str_char_13.8"
  %"str_char_14.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 14
  store i8 110, i8* %"str_char_14.8"
  %"str_char_15.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 15
  store i8 111, i8* %"str_char_15.8"
  %"str_char_16.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 16
  store i8 110, i8* %"str_char_16.8"
  %"str_char_17.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 17
  store i8 45, i8* %"str_char_17.8"
  %"str_char_18.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 18
  store i8 110, i8* %"str_char_18.8"
  %"str_char_19.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 19
  store i8 117, i8* %"str_char_19.8"
  %"str_char_20.8" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 20
  store i8 108, i8* %"str_char_20.8"
  %"str_char_21.6" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 21
  store i8 108, i8* %"str_char_21.6"
  %"str_char_22.6" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 22
  store i8 32, i8* %"str_char_22.6"
  %"str_char_23.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 23
  store i8 102, i8* %"str_char_23.5"
  %"str_char_24.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 24
  store i8 111, i8* %"str_char_24.5"
  %"str_char_25.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 25
  store i8 114, i8* %"str_char_25.5"
  %"str_char_26.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 26
  store i8 32, i8* %"str_char_26.5"
  %"str_char_27.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 27
  store i8 108, i8* %"str_char_27.5"
  %"str_char_28.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 28
  store i8 97, i8* %"str_char_28.5"
  %"str_char_29.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 29
  store i8 114, i8* %"str_char_29.5"
  %"str_char_30.5" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 30
  store i8 103, i8* %"str_char_30.5"
  %"str_char_31.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 31
  store i8 101, i8* %"str_char_31.4"
  %"str_char_32.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 32
  store i8 45, i8* %"str_char_32.4"
  %"str_char_33.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 33
  store i8 62, i8* %"str_char_33.4"
  %"str_char_34.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 34
  store i8 115, i8* %"str_char_34.4"
  %"str_char_35.4" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 35
  store i8 109, i8* %"str_char_35.4"
  %"str_char_36.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 36
  store i8 97, i8* %"str_char_36.3"
  %"str_char_37.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 37
  store i8 108, i8* %"str_char_37.3"
  %"str_char_38.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 38
  store i8 108, i8* %"str_char_38.3"
  %"str_char_39.3" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 39
  store i8 32, i8* %"str_char_39.3"
  %"str_char_40.2" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 40
  store i8 115, i8* %"str_char_40.2"
  %"str_char_41.2" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 41
  store i8 104, i8* %"str_char_41.2"
  %"str_char_42.2" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 42
  store i8 114, i8* %"str_char_42.2"
  %"str_char_43.2" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 43
  store i8 105, i8* %"str_char_43.2"
  %"str_char_44.2" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 44
  store i8 110, i8* %"str_char_44.2"
  %"str_char_45.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 45
  store i8 107, i8* %"str_char_45.1"
  %"str_char_46.1" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 46
  store i8 0, i8* %"str_char_46.1"
  %"arg1_decay.7" = getelementptr [47 x i8], [47 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".373", i8* %"arg1_decay.7")
  %"p1.9" = load i64, i64* %"p1"
  %"int_to_ptr.4" = inttoptr i64 %"p1.9" to i8*
  store i8* %"int_to_ptr.4", i8** %"bp"
  %".423" = sext i32 0 to i64
  store i64 %".423", i64* %"i"
  br label %"while.cond.4"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.3"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i.16" = load i64, i64* %"i"
  %".316" = add i64 %"i.16", 1
  store i64 %".316", i64* %"i"
  br label %"while.cond.3"
while.cond.4:
  %"i.17" = load i64, i64* %"i"
  %".426" = zext i32 64 to i64
  %".427" = icmp ult i64 %"i.17", %".426"
  br i1 %".427", label %"while.body.4", label %"while.end.4"
while.body.4:
  %"i.18" = load i64, i64* %"i"
  %".429" = zext i32 3 to i64
  %".430" = mul i64 %"i.18", %".429"
  %".431" = trunc i64 %".430" to i8
  %"bp.3" = load i8*, i8** %"bp"
  %"i.19" = load i64, i64* %"i"
  %".432" = getelementptr inbounds i8, i8* %"bp.3", i64 %"i.19"
  store i8 %".431", i8* %".432"
  %"i.20" = load i64, i64* %"i"
  %".434" = add i64 %"i.20", 1
  store i64 %".434", i64* %"i"
  br label %"while.cond.4"
while.end.4:
  %"p1.10" = load i64, i64* %"p1"
  %".437" = sext i32 64 to i64
  %".438" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.10", i64 %".437")
  store i64 %".438", i64* %"p2"
  %"p2.8" = load i64, i64* %"p2"
  %".440" = zext i32 0 to i64
  %".441" = icmp ne i64 %"p2.8", %".440"
  %"str_stack.9" = alloca [31 x i8]
  %"str_char_0.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 0
  store i8 102, i8* %"str_char_0.9"
  %"str_char_1.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 1
  store i8 114, i8* %"str_char_1.9"
  %"str_char_2.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 2
  store i8 101, i8* %"str_char_2.9"
  %"str_char_3.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 3
  store i8 97, i8* %"str_char_3.9"
  %"str_char_4.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 4
  store i8 108, i8* %"str_char_4.9"
  %"str_char_5.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 5
  store i8 108, i8* %"str_char_5.9"
  %"str_char_6.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 6
  store i8 111, i8* %"str_char_6.9"
  %"str_char_7.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 7
  store i8 99, i8* %"str_char_7.9"
  %"str_char_8.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 8
  store i8 32, i8* %"str_char_8.9"
  %"str_char_9.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 9
  store i8 108, i8* %"str_char_9.9"
  %"str_char_10.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 10
  store i8 97, i8* %"str_char_10.9"
  %"str_char_11.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 11
  store i8 114, i8* %"str_char_11.9"
  %"str_char_12.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 12
  store i8 103, i8* %"str_char_12.9"
  %"str_char_13.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 13
  store i8 101, i8* %"str_char_13.9"
  %"str_char_14.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 14
  store i8 45, i8* %"str_char_14.9"
  %"str_char_15.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 15
  store i8 62, i8* %"str_char_15.9"
  %"str_char_16.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 16
  store i8 115, i8* %"str_char_16.9"
  %"str_char_17.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 17
  store i8 109, i8* %"str_char_17.9"
  %"str_char_18.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 18
  store i8 97, i8* %"str_char_18.9"
  %"str_char_19.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 19
  store i8 108, i8* %"str_char_19.9"
  %"str_char_20.9" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 20
  store i8 108, i8* %"str_char_20.9"
  %"str_char_21.7" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 21
  store i8 32, i8* %"str_char_21.7"
  %"str_char_22.7" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 22
  store i8 110, i8* %"str_char_22.7"
  %"str_char_23.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 23
  store i8 111, i8* %"str_char_23.6"
  %"str_char_24.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 24
  store i8 110, i8* %"str_char_24.6"
  %"str_char_25.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 25
  store i8 45, i8* %"str_char_25.6"
  %"str_char_26.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 26
  store i8 110, i8* %"str_char_26.6"
  %"str_char_27.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 27
  store i8 117, i8* %"str_char_27.6"
  %"str_char_28.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 28
  store i8 108, i8* %"str_char_28.6"
  %"str_char_29.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 29
  store i8 108, i8* %"str_char_29.6"
  %"str_char_30.6" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 30
  store i8 0, i8* %"str_char_30.6"
  %"arg1_decay.8" = getelementptr [31 x i8], [31 x i8]* %"str_stack.9", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".441", i8* %"arg1_decay.8")
  store i1 true, i1* %"ok"
  %".475" = sext i32 0 to i64
  store i64 %".475", i64* %"i"
  br label %"while.cond.5"
while.cond.5:
  %"i.21" = load i64, i64* %"i"
  %".478" = zext i32 64 to i64
  %".479" = icmp ult i64 %"i.21", %".478"
  br i1 %".479", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"p2.9" = load i64, i64* %"p2"
  %"int_to_ptr.5" = inttoptr i64 %"p2.9" to i8*
  %"i.22" = load i64, i64* %"i"
  %"idx_trunc.2" = trunc i64 %"i.22" to i32
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"int_to_ptr.5", i32 %"idx_trunc.2"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %"i.23" = load i64, i64* %"i"
  %".481" = zext i32 3 to i64
  %".482" = mul i64 %"i.23", %".481"
  %".483" = trunc i64 %".482" to i8
  %".484" = icmp ne i8 %"ptr_load.2", %".483"
  br i1 %".484", label %"then.2", label %"else.2"
while.end.5:
  %"ok.3" = load i1, i1* %"ok"
  %"str_stack.10" = alloca [39 x i8]
  %"str_char_0.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 0
  store i8 102, i8* %"str_char_0.10"
  %"str_char_1.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 1
  store i8 114, i8* %"str_char_1.10"
  %"str_char_2.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 2
  store i8 101, i8* %"str_char_2.10"
  %"str_char_3.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 3
  store i8 97, i8* %"str_char_3.10"
  %"str_char_4.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 4
  store i8 108, i8* %"str_char_4.10"
  %"str_char_5.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 5
  store i8 108, i8* %"str_char_5.10"
  %"str_char_6.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 6
  store i8 111, i8* %"str_char_6.10"
  %"str_char_7.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 7
  store i8 99, i8* %"str_char_7.10"
  %"str_char_8.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 8
  store i8 32, i8* %"str_char_8.10"
  %"str_char_9.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 9
  store i8 108, i8* %"str_char_9.10"
  %"str_char_10.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 10
  store i8 97, i8* %"str_char_10.10"
  %"str_char_11.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 11
  store i8 114, i8* %"str_char_11.10"
  %"str_char_12.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 12
  store i8 103, i8* %"str_char_12.10"
  %"str_char_13.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 13
  store i8 101, i8* %"str_char_13.10"
  %"str_char_14.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 14
  store i8 45, i8* %"str_char_14.10"
  %"str_char_15.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 15
  store i8 62, i8* %"str_char_15.10"
  %"str_char_16.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 16
  store i8 115, i8* %"str_char_16.10"
  %"str_char_17.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 17
  store i8 109, i8* %"str_char_17.10"
  %"str_char_18.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 18
  store i8 97, i8* %"str_char_18.10"
  %"str_char_19.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 19
  store i8 108, i8* %"str_char_19.10"
  %"str_char_20.10" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 20
  store i8 108, i8* %"str_char_20.10"
  %"str_char_21.8" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 21
  store i8 58, i8* %"str_char_21.8"
  %"str_char_22.8" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 22
  store i8 32, i8* %"str_char_22.8"
  %"str_char_23.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 23
  store i8 98, i8* %"str_char_23.7"
  %"str_char_24.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 24
  store i8 121, i8* %"str_char_24.7"
  %"str_char_25.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 25
  store i8 116, i8* %"str_char_25.7"
  %"str_char_26.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 26
  store i8 101, i8* %"str_char_26.7"
  %"str_char_27.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 27
  store i8 115, i8* %"str_char_27.7"
  %"str_char_28.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 28
  store i8 32, i8* %"str_char_28.7"
  %"str_char_29.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 29
  store i8 112, i8* %"str_char_29.7"
  %"str_char_30.7" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 30
  store i8 114, i8* %"str_char_30.7"
  %"str_char_31.5" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 31
  store i8 101, i8* %"str_char_31.5"
  %"str_char_32.5" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 32
  store i8 115, i8* %"str_char_32.5"
  %"str_char_33.5" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 33
  store i8 101, i8* %"str_char_33.5"
  %"str_char_34.5" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 34
  store i8 114, i8* %"str_char_34.5"
  %"str_char_35.5" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 35
  store i8 118, i8* %"str_char_35.5"
  %"str_char_36.4" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 36
  store i8 101, i8* %"str_char_36.4"
  %"str_char_37.4" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 37
  store i8 100, i8* %"str_char_37.4"
  %"str_char_38.4" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 38
  store i8 0, i8* %"str_char_38.4"
  %"arg1_decay.9" = getelementptr [39 x i8], [39 x i8]* %"str_stack.10", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.3", i8* %"arg1_decay.9")
  %"p2.10" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.10")
  ret void
then.2:
  store i1 false, i1* %"ok"
  br label %"while.end.5"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"i.24" = load i64, i64* %"i"
  %".489" = add i64 %"i.24", 1
  store i64 %".489", i64* %"i"
  br label %"while.cond.5"
}

define void @"test_frealloc_large_identity__0__ret_voidE1"()
{
entry:
  %"p1" = alloca i64
  store i64 0, i64* %"p1"
  %"p2" = alloca i64
  store i64 0, i64* %"p2"
  %"str_stack" = alloca [37 x i8]
  %"str_char_0" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 3
  store i8 102, i8* %"str_char_3"
  %"str_char_4" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 6
  store i8 97, i8* %"str_char_6"
  %"str_char_7" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 8
  store i8 108, i8* %"str_char_8"
  %"str_char_9" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 9
  store i8 111, i8* %"str_char_9"
  %"str_char_10" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 10
  store i8 99, i8* %"str_char_10"
  %"str_char_11" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 12
  store i8 108, i8* %"str_char_12"
  %"str_char_13" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 13
  store i8 97, i8* %"str_char_13"
  %"str_char_14" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 14
  store i8 114, i8* %"str_char_14"
  %"str_char_15" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 15
  store i8 103, i8* %"str_char_15"
  %"str_char_16" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 16
  store i8 101, i8* %"str_char_16"
  %"str_char_17" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 17
  store i8 45, i8* %"str_char_17"
  %"str_char_18" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 18
  store i8 98, i8* %"str_char_18"
  %"str_char_19" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 19
  store i8 108, i8* %"str_char_19"
  %"str_char_20" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 20
  store i8 111, i8* %"str_char_20"
  %"str_char_21" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 21
  store i8 99, i8* %"str_char_21"
  %"str_char_22" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 22
  store i8 107, i8* %"str_char_22"
  %"str_char_23" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 23
  store i8 32, i8* %"str_char_23"
  %"str_char_24" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 24
  store i8 105, i8* %"str_char_24"
  %"str_char_25" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 25
  store i8 100, i8* %"str_char_25"
  %"str_char_26" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 26
  store i8 101, i8* %"str_char_26"
  %"str_char_27" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 27
  store i8 110, i8* %"str_char_27"
  %"str_char_28" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 28
  store i8 116, i8* %"str_char_28"
  %"str_char_29" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 29
  store i8 105, i8* %"str_char_29"
  %"str_char_30" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 30
  store i8 116, i8* %"str_char_30"
  %"str_char_31" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 31
  store i8 121, i8* %"str_char_31"
  %"str_char_32" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 32
  store i8 32, i8* %"str_char_32"
  %"str_char_33" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 33
  store i8 45, i8* %"str_char_33"
  %"str_char_34" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 34
  store i8 45, i8* %"str_char_34"
  %"str_char_35" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 35
  store i8 10, i8* %"str_char_35"
  %"str_char_36" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 36
  store i8 0, i8* %"str_char_36"
  %"arg0_decay" = getelementptr [37 x i8], [37 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".42" = sext i32 65536 to i64
  %".43" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".42")
  store i64 %".43", i64* %"p1"
  %"p1.1" = load i64, i64* %"p1"
  %".45" = zext i32 0 to i64
  %".46" = icmp ne i64 %"p1.1", %".45"
  %"str_stack.1" = alloca [22 x i8]
  %"str_char_0.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 109, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 108, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 40, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 54, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 52, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 75, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 41, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 32, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 110, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 111, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 110, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 45, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 110, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 117, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 108, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 108, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 0, i8* %"str_char_21.1"
  %"arg1_decay" = getelementptr [22 x i8], [22 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".46", i8* %"arg1_decay")
  %"p1.2" = load i64, i64* %"p1"
  %".70" = sext i32 65536 to i64
  %".71" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"p1.2", i64 %".70")
  store i64 %".71", i64* %"p2"
  %"p2.1" = load i64, i64* %"p2"
  %"p1.3" = load i64, i64* %"p1"
  %".73" = icmp eq i64 %"p2.1", %"p1.3"
  %"str_stack.2" = alloca [46 x i8]
  %"str_char_0.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 114, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 101, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 97, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 108, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 111, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 99, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 108, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 97, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 114, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 103, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 101, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 32, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 115, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 97, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 109, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 101, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 45, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 115, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 105, i8* %"str_char_21.2"
  %"str_char_22.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 122, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 101, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 32, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 114, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 101, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 116, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 117, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 114, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 110, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 115, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 32, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 115, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 97, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 109, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 101, i8* %"str_char_36.1"
  %"str_char_37" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 32, i8* %"str_char_37"
  %"str_char_38" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 38
  store i8 112, i8* %"str_char_38"
  %"str_char_39" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 39
  store i8 111, i8* %"str_char_39"
  %"str_char_40" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 40
  store i8 105, i8* %"str_char_40"
  %"str_char_41" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 41
  store i8 110, i8* %"str_char_41"
  %"str_char_42" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 42
  store i8 116, i8* %"str_char_42"
  %"str_char_43" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 43
  store i8 101, i8* %"str_char_43"
  %"str_char_44" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 44
  store i8 114, i8* %"str_char_44"
  %"str_char_45" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 45
  store i8 0, i8* %"str_char_45"
  %"arg1_decay.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".73", i8* %"arg1_decay.1")
  %"p2.2" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.2")
  ret void
}

define void @"test_frealloc_chain__0__ret_voidE1"()
{
entry:
  %"ptr" = alloca i64
  store i64 0, i64* %"ptr"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"str_stack" = alloca [31 x i8]
  %"str_char_0" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 3
  store i8 102, i8* %"str_char_3"
  %"str_char_4" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 6
  store i8 97, i8* %"str_char_6"
  %"str_char_7" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 8
  store i8 108, i8* %"str_char_8"
  %"str_char_9" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 9
  store i8 111, i8* %"str_char_9"
  %"str_char_10" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 10
  store i8 99, i8* %"str_char_10"
  %"str_char_11" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 12
  store i8 99, i8* %"str_char_12"
  %"str_char_13" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 13
  store i8 104, i8* %"str_char_13"
  %"str_char_14" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 14
  store i8 97, i8* %"str_char_14"
  %"str_char_15" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 15
  store i8 105, i8* %"str_char_15"
  %"str_char_16" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 16
  store i8 110, i8* %"str_char_16"
  %"str_char_17" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 17
  store i8 101, i8* %"str_char_17"
  %"str_char_18" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 18
  store i8 100, i8* %"str_char_18"
  %"str_char_19" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 20
  store i8 103, i8* %"str_char_20"
  %"str_char_21" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 21
  store i8 114, i8* %"str_char_21"
  %"str_char_22" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 22
  store i8 111, i8* %"str_char_22"
  %"str_char_23" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 23
  store i8 119, i8* %"str_char_23"
  %"str_char_24" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 24
  store i8 116, i8* %"str_char_24"
  %"str_char_25" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 25
  store i8 104, i8* %"str_char_25"
  %"str_char_26" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 26
  store i8 32, i8* %"str_char_26"
  %"str_char_27" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 27
  store i8 45, i8* %"str_char_27"
  %"str_char_28" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 28
  store i8 45, i8* %"str_char_28"
  %"str_char_29" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 29
  store i8 10, i8* %"str_char_29"
  %"str_char_30" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 30
  store i8 0, i8* %"str_char_30"
  %"arg0_decay" = getelementptr [31 x i8], [31 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".38" = sext i32 8 to i64
  %".39" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".38")
  store i64 %".39", i64* %"ptr"
  %"ptr.1" = load i64, i64* %"ptr"
  %".41" = zext i32 0 to i64
  %".42" = icmp ne i64 %"ptr.1", %".41"
  %"str_stack.1" = alloca [28 x i8]
  %"str_char_0.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 105, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 110, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 105, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 116, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 105, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 97, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 108, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 32, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 102, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 109, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 97, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 108, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 108, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 99, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 40, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 56, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 41, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 32, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 110, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 111, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 110, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 45, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 110, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 117, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 108, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 108, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 0, i8* %"str_char_27.1"
  %"arg1_decay" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".42", i8* %"arg1_decay")
  %".72" = trunc i32 66 to i8
  %"ptr.2" = load i64, i64* %"ptr"
  %"int_to_ptr" = inttoptr i64 %"ptr.2" to i8*
  %".73" = getelementptr inbounds i8, i8* %"int_to_ptr", i32 0
  store i8 %".72", i8* %".73"
  %"ptr.3" = load i64, i64* %"ptr"
  %".75" = sext i32 32 to i64
  %".76" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.3", i64 %".75")
  store i64 %".76", i64* %"ptr"
  %"ptr.4" = load i64, i64* %"ptr"
  %".78" = zext i32 0 to i64
  %".79" = icmp ne i64 %"ptr.4", %".78"
  %"str_stack.2" = alloca [24 x i8]
  %"str_char_0.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 114, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 101, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 97, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 108, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 111, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 99, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 45, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 62, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 51, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 50, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 32, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 110, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 111, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 110, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 45, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 110, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 117, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 108, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 108, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 0, i8* %"str_char_23.2"
  %"arg1_decay.1" = getelementptr [24 x i8], [24 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".79", i8* %"arg1_decay.1")
  %"ptr.5" = load i64, i64* %"ptr"
  %".105" = sext i32 128 to i64
  %".106" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.5", i64 %".105")
  store i64 %".106", i64* %"ptr"
  %"ptr.6" = load i64, i64* %"ptr"
  %".108" = zext i32 0 to i64
  %".109" = icmp ne i64 %"ptr.6", %".108"
  %"str_stack.3" = alloca [25 x i8]
  %"str_char_0.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 114, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 101, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 97, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 108, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 108, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 111, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 99, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 32, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 45, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 62, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 32, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 49, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 50, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 56, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 32, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 110, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 111, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 110, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 45, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 110, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 117, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 108, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 108, i8* %"str_char_23.3"
  %"str_char_24.2" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 0, i8* %"str_char_24.2"
  %"arg1_decay.2" = getelementptr [25 x i8], [25 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".109", i8* %"arg1_decay.2")
  %"ptr.7" = load i64, i64* %"ptr"
  %".136" = sext i32 512 to i64
  %".137" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.7", i64 %".136")
  store i64 %".137", i64* %"ptr"
  %"ptr.8" = load i64, i64* %"ptr"
  %".139" = zext i32 0 to i64
  %".140" = icmp ne i64 %"ptr.8", %".139"
  %"str_stack.4" = alloca [25 x i8]
  %"str_char_0.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 114, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 101, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 97, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 108, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 108, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 111, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 99, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 32, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 45, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 62, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 32, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 53, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 49, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 50, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 32, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 110, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 111, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 110, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 45, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 110, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 117, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 108, i8* %"str_char_22.4"
  %"str_char_23.4" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 108, i8* %"str_char_23.4"
  %"str_char_24.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 0, i8* %"str_char_24.3"
  %"arg1_decay.3" = getelementptr [25 x i8], [25 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".140", i8* %"arg1_decay.3")
  %"ptr.9" = load i64, i64* %"ptr"
  %".167" = sext i32 4096 to i64
  %".168" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.9", i64 %".167")
  store i64 %".168", i64* %"ptr"
  %"ptr.10" = load i64, i64* %"ptr"
  %".170" = zext i32 0 to i64
  %".171" = icmp ne i64 %"ptr.10", %".170"
  %"str_stack.5" = alloca [26 x i8]
  %"str_char_0.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 102, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 114, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 101, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 97, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 108, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 108, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 111, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 99, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 32, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 45, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 62, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 32, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 52, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 48, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 57, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 54, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 32, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 110, i8* %"str_char_17.5"
  %"str_char_18.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 111, i8* %"str_char_18.5"
  %"str_char_19.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 110, i8* %"str_char_19.5"
  %"str_char_20.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 45, i8* %"str_char_20.5"
  %"str_char_21.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 110, i8* %"str_char_21.5"
  %"str_char_22.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 22
  store i8 117, i8* %"str_char_22.5"
  %"str_char_23.5" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 23
  store i8 108, i8* %"str_char_23.5"
  %"str_char_24.4" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 24
  store i8 108, i8* %"str_char_24.4"
  %"str_char_25.2" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 25
  store i8 0, i8* %"str_char_25.2"
  %"arg1_decay.4" = getelementptr [26 x i8], [26 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".171", i8* %"arg1_decay.4")
  %"ptr.11" = load i64, i64* %"ptr"
  %".199" = sext i32 65536 to i64
  %".200" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.11", i64 %".199")
  store i64 %".200", i64* %"ptr"
  %"ptr.12" = load i64, i64* %"ptr"
  %".202" = zext i32 0 to i64
  %".203" = icmp ne i64 %"ptr.12", %".202"
  %"str_stack.6" = alloca [35 x i8]
  %"str_char_0.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 102, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 114, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 101, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 97, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 108, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 108, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 111, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 99, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 32, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 45, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 62, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 32, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 54, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 53, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 53, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 51, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 54, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 32, i8* %"str_char_17.6"
  %"str_char_18.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 40, i8* %"str_char_18.6"
  %"str_char_19.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 19
  store i8 108, i8* %"str_char_19.6"
  %"str_char_20.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 20
  store i8 97, i8* %"str_char_20.6"
  %"str_char_21.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 21
  store i8 114, i8* %"str_char_21.6"
  %"str_char_22.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 22
  store i8 103, i8* %"str_char_22.6"
  %"str_char_23.6" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 23
  store i8 101, i8* %"str_char_23.6"
  %"str_char_24.5" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 24
  store i8 41, i8* %"str_char_24.5"
  %"str_char_25.3" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 25
  store i8 32, i8* %"str_char_25.3"
  %"str_char_26.2" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 26
  store i8 110, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 27
  store i8 111, i8* %"str_char_27.2"
  %"str_char_28.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 28
  store i8 110, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 29
  store i8 45, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 30
  store i8 110, i8* %"str_char_30.1"
  %"str_char_31" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 31
  store i8 117, i8* %"str_char_31"
  %"str_char_32" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 32
  store i8 108, i8* %"str_char_32"
  %"str_char_33" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 33
  store i8 108, i8* %"str_char_33"
  %"str_char_34" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 34
  store i8 0, i8* %"str_char_34"
  %"arg1_decay.5" = getelementptr [35 x i8], [35 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".203", i8* %"arg1_decay.5")
  %"ptr.13" = load i64, i64* %"ptr"
  %".240" = sext i32 4096 to i64
  %".241" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.13", i64 %".240")
  store i64 %".241", i64* %"ptr"
  %"ptr.14" = load i64, i64* %"ptr"
  %".243" = zext i32 0 to i64
  %".244" = icmp ne i64 %"ptr.14", %".243"
  %"str_stack.7" = alloca [30 x i8]
  %"str_char_0.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 102, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 114, i8* %"str_char_1.7"
  %"str_char_2.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 101, i8* %"str_char_2.7"
  %"str_char_3.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 97, i8* %"str_char_3.7"
  %"str_char_4.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 108, i8* %"str_char_4.7"
  %"str_char_5.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 108, i8* %"str_char_5.7"
  %"str_char_6.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 111, i8* %"str_char_6.7"
  %"str_char_7.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 99, i8* %"str_char_7.7"
  %"str_char_8.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 32, i8* %"str_char_8.7"
  %"str_char_9.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 108, i8* %"str_char_9.7"
  %"str_char_10.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 97, i8* %"str_char_10.7"
  %"str_char_11.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 114, i8* %"str_char_11.7"
  %"str_char_12.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 103, i8* %"str_char_12.7"
  %"str_char_13.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 101, i8* %"str_char_13.7"
  %"str_char_14.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 45, i8* %"str_char_14.7"
  %"str_char_15.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 15
  store i8 62, i8* %"str_char_15.7"
  %"str_char_16.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 16
  store i8 52, i8* %"str_char_16.7"
  %"str_char_17.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 17
  store i8 48, i8* %"str_char_17.7"
  %"str_char_18.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 18
  store i8 57, i8* %"str_char_18.7"
  %"str_char_19.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 19
  store i8 54, i8* %"str_char_19.7"
  %"str_char_20.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 20
  store i8 32, i8* %"str_char_20.7"
  %"str_char_21.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 21
  store i8 110, i8* %"str_char_21.7"
  %"str_char_22.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 22
  store i8 111, i8* %"str_char_22.7"
  %"str_char_23.7" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 23
  store i8 110, i8* %"str_char_23.7"
  %"str_char_24.6" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 24
  store i8 45, i8* %"str_char_24.6"
  %"str_char_25.4" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 25
  store i8 110, i8* %"str_char_25.4"
  %"str_char_26.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 26
  store i8 117, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 27
  store i8 108, i8* %"str_char_27.3"
  %"str_char_28.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 28
  store i8 108, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 29
  store i8 0, i8* %"str_char_29.2"
  %"arg1_decay.6" = getelementptr [30 x i8], [30 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".244", i8* %"arg1_decay.6")
  %"ptr.15" = load i64, i64* %"ptr"
  %".276" = sext i32 64 to i64
  %".277" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.15", i64 %".276")
  store i64 %".277", i64* %"ptr"
  %"ptr.16" = load i64, i64* %"ptr"
  %".279" = zext i32 0 to i64
  %".280" = icmp ne i64 %"ptr.16", %".279"
  %"str_stack.8" = alloca [23 x i8]
  %"str_char_0.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 102, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 114, i8* %"str_char_1.8"
  %"str_char_2.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 2
  store i8 101, i8* %"str_char_2.8"
  %"str_char_3.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 3
  store i8 97, i8* %"str_char_3.8"
  %"str_char_4.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 4
  store i8 108, i8* %"str_char_4.8"
  %"str_char_5.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 5
  store i8 108, i8* %"str_char_5.8"
  %"str_char_6.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 6
  store i8 111, i8* %"str_char_6.8"
  %"str_char_7.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 7
  store i8 99, i8* %"str_char_7.8"
  %"str_char_8.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 8
  store i8 32, i8* %"str_char_8.8"
  %"str_char_9.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 9
  store i8 45, i8* %"str_char_9.8"
  %"str_char_10.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 10
  store i8 62, i8* %"str_char_10.8"
  %"str_char_11.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 11
  store i8 54, i8* %"str_char_11.8"
  %"str_char_12.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 12
  store i8 52, i8* %"str_char_12.8"
  %"str_char_13.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 13
  store i8 32, i8* %"str_char_13.8"
  %"str_char_14.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 14
  store i8 110, i8* %"str_char_14.8"
  %"str_char_15.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 15
  store i8 111, i8* %"str_char_15.8"
  %"str_char_16.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 16
  store i8 110, i8* %"str_char_16.8"
  %"str_char_17.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 17
  store i8 45, i8* %"str_char_17.8"
  %"str_char_18.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 18
  store i8 110, i8* %"str_char_18.8"
  %"str_char_19.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 19
  store i8 117, i8* %"str_char_19.8"
  %"str_char_20.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 20
  store i8 108, i8* %"str_char_20.8"
  %"str_char_21.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 21
  store i8 108, i8* %"str_char_21.8"
  %"str_char_22.8" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 22
  store i8 0, i8* %"str_char_22.8"
  %"arg1_decay.7" = getelementptr [23 x i8], [23 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".280", i8* %"arg1_decay.7")
  %"ptr.17" = load i64, i64* %"ptr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.17")
  ret void
}

define void @"test_coalesce__0__ret_voidE1"()
{
entry:
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"ptrs" = alloca [64 x i64]
  store [64 x i64] zeroinitializer, [64 x i64]* %"ptrs"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"str_stack" = alloca [21 x i8]
  %"str_char_0" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 3
  store i8 99, i8* %"str_char_3"
  %"str_char_4" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 4
  store i8 111, i8* %"str_char_4"
  %"str_char_5" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 5
  store i8 97, i8* %"str_char_5"
  %"str_char_6" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 6
  store i8 108, i8* %"str_char_6"
  %"str_char_7" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 7
  store i8 101, i8* %"str_char_7"
  %"str_char_8" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 8
  store i8 115, i8* %"str_char_8"
  %"str_char_9" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 9
  store i8 99, i8* %"str_char_9"
  %"str_char_10" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 10
  store i8 101, i8* %"str_char_10"
  %"str_char_11" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 11
  store i8 95, i8* %"str_char_11"
  %"str_char_12" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 12
  store i8 104, i8* %"str_char_12"
  %"str_char_13" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 13
  store i8 101, i8* %"str_char_13"
  %"str_char_14" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 14
  store i8 97, i8* %"str_char_14"
  %"str_char_15" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 15
  store i8 112, i8* %"str_char_15"
  %"str_char_16" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 16
  store i8 32, i8* %"str_char_16"
  %"str_char_17" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 17
  store i8 45, i8* %"str_char_17"
  %"str_char_18" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 18
  store i8 45, i8* %"str_char_18"
  %"str_char_19" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 19
  store i8 10, i8* %"str_char_19"
  %"str_char_20" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 20
  store i8 0, i8* %"str_char_20"
  %"arg0_decay" = getelementptr [21 x i8], [21 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".28" = sext i32 64 to i64
  store i64 %".28", i64* %"n"
  store i1 true, i1* %"ok"
  %"p" = alloca i64
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".32" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".32", label %"while.body", label %"while.end"
while.body:
  %".34" = sext i32 32 to i64
  %".35" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".34")
  %"i.2" = load i64, i64* %"i"
  %".36" = getelementptr inbounds [64 x i64], [64 x i64]* %"ptrs", i32 0, i64 %"i.2"
  store i64 %".35", i64* %".36"
  %"i.3" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.3" to i32
  %"array_gep" = getelementptr inbounds [64 x i64], [64 x i64]* %"ptrs", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  %".38" = zext i32 0 to i64
  %".39" = icmp eq i64 %"array_load", %".38"
  br i1 %".39", label %"then", label %"else"
while.end:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [38 x i8]
  %"str_char_0.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 54, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 52, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 32, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 98, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 111, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 99, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 107, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 115, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 32, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 97, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 108, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 108, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 99, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 97, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 116, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 101, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 100, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 32, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 102, i8* %"str_char_20.1"
  %"str_char_21" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 111, i8* %"str_char_21"
  %"str_char_22" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 114, i8* %"str_char_22"
  %"str_char_23" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 32, i8* %"str_char_23"
  %"str_char_24" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 99, i8* %"str_char_24"
  %"str_char_25" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 111, i8* %"str_char_25"
  %"str_char_26" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 97, i8* %"str_char_26"
  %"str_char_27" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 108, i8* %"str_char_27"
  %"str_char_28" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 101, i8* %"str_char_28"
  %"str_char_29" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 115, i8* %"str_char_29"
  %"str_char_30" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 99, i8* %"str_char_30"
  %"str_char_31" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 101, i8* %"str_char_31"
  %"str_char_32" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 32, i8* %"str_char_32"
  %"str_char_33" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 116, i8* %"str_char_33"
  %"str_char_34" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 101, i8* %"str_char_34"
  %"str_char_35" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 115, i8* %"str_char_35"
  %"str_char_36" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 116, i8* %"str_char_36"
  %"str_char_37" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 0, i8* %"str_char_37"
  %"arg1_decay" = getelementptr [38 x i8], [38 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  %".86" = sext i32 0 to i64
  store i64 %".86", i64* %"i"
  br label %"while.cond.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"i.4" = load i64, i64* %"i"
  %".44" = add i64 %"i.4", 1
  store i64 %".44", i64* %"i"
  br label %"while.cond"
while.cond.1:
  %"i.5" = load i64, i64* %"i"
  %"n.2" = load i64, i64* %"n"
  %".89" = icmp ult i64 %"i.5", %"n.2"
  br i1 %".89", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.6" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.6" to i32
  %"array_gep.1" = getelementptr inbounds [64 x i64], [64 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.1")
  %"i.7" = load i64, i64* %"i"
  %".92" = add i64 %"i.7", 1
  store i64 %".92", i64* %"i"
  br label %"while.cond.1"
while.end.1:
  call void @"standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1"()
  %"str_stack.2" = alloca [38 x i8]
  %"str_char_0.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 99, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 111, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 97, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 108, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 101, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 115, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 99, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 101, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 95, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 104, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 101, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 97, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 112, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 99, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 111, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 109, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 112, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 108, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 101, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 116, i8* %"str_char_20.2"
  %"str_char_21.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 101, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 100, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 32, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 119, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 105, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 116, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 104, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 111, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 117, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 116, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 32, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 99, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 114, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 97, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 115, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 104, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 0, i8* %"str_char_37.1"
  %"arg1_decay.1" = getelementptr [38 x i8], [38 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 true, i8* %"arg1_decay.1")
  %".134" = sext i32 32 to i64
  %".135" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".134")
  store i64 %".135", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.1", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.3" = alloca [30 x i8]
  %"str_char_0.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 97, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 108, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 108, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 111, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 99, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 32, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 97, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 102, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 116, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 101, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 114, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 32, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 99, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 111, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 97, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 108, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 101, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 115, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 99, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 101, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 32, i8* %"str_char_20.3"
  %"str_char_21.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 115, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 117, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 99, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 99, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 101, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 101, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 100, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 115, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 0, i8* %"str_char_29.2"
  %".167" = trunc i8 %"not_null_result" to i1
  %"arg1_decay.2" = getelementptr [30 x i8], [30 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".167", i8* %"arg1_decay.2")
  %"p.2" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.2")
  ret void
}

define void @"test_coalesce_bin_integrity__0__ret_voidE1"()
{
entry:
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"ptrs" = alloca [32 x i64]
  store [32 x i64] zeroinitializer, [32 x i64]* %"ptrs"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"str_stack" = alloca [30 x i8]
  %"str_char_0" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 3
  store i8 99, i8* %"str_char_3"
  %"str_char_4" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 4
  store i8 111, i8* %"str_char_4"
  %"str_char_5" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 5
  store i8 97, i8* %"str_char_5"
  %"str_char_6" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 6
  store i8 108, i8* %"str_char_6"
  %"str_char_7" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 7
  store i8 101, i8* %"str_char_7"
  %"str_char_8" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 8
  store i8 115, i8* %"str_char_8"
  %"str_char_9" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 9
  store i8 99, i8* %"str_char_9"
  %"str_char_10" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 10
  store i8 101, i8* %"str_char_10"
  %"str_char_11" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 12
  store i8 98, i8* %"str_char_12"
  %"str_char_13" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 13
  store i8 105, i8* %"str_char_13"
  %"str_char_14" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 14
  store i8 110, i8* %"str_char_14"
  %"str_char_15" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 15
  store i8 32, i8* %"str_char_15"
  %"str_char_16" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 16
  store i8 105, i8* %"str_char_16"
  %"str_char_17" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 17
  store i8 110, i8* %"str_char_17"
  %"str_char_18" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 18
  store i8 116, i8* %"str_char_18"
  %"str_char_19" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 19
  store i8 101, i8* %"str_char_19"
  %"str_char_20" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 20
  store i8 103, i8* %"str_char_20"
  %"str_char_21" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 21
  store i8 114, i8* %"str_char_21"
  %"str_char_22" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 22
  store i8 105, i8* %"str_char_22"
  %"str_char_23" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 23
  store i8 116, i8* %"str_char_23"
  %"str_char_24" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 24
  store i8 121, i8* %"str_char_24"
  %"str_char_25" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 25
  store i8 32, i8* %"str_char_25"
  %"str_char_26" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 26
  store i8 45, i8* %"str_char_26"
  %"str_char_27" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 27
  store i8 45, i8* %"str_char_27"
  %"str_char_28" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 28
  store i8 10, i8* %"str_char_28"
  %"str_char_29" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 29
  store i8 0, i8* %"str_char_29"
  %"arg0_decay" = getelementptr [30 x i8], [30 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".39" = sext i32 32 to i64
  store i64 %".39", i64* %"n"
  %".41" = sext i32 0 to i64
  store i64 %".41", i64* %"i"
  store i1 true, i1* %"ok"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".45" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".45", label %"while.body", label %"while.end"
while.body:
  %".47" = sext i32 64 to i64
  %".48" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".47")
  %"i.2" = load i64, i64* %"i"
  %".49" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i64 %"i.2"
  store i64 %".48", i64* %".49"
  %"i.3" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.3" to i32
  %"array_gep" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  %".51" = zext i32 0 to i64
  %".52" = icmp eq i64 %"array_load", %".51"
  br i1 %".52", label %"then", label %"else"
while.end:
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [28 x i8]
  %"str_char_0.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 51, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 50, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 32, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 99, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 97, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 115, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 115, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 45, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 50, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 98, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 108, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 99, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 107, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 115, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 32, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 97, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 108, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 108, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 111, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 99, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 97, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 116, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 101, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 100, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 0, i8* %"str_char_27.1"
  %"arg1_decay" = getelementptr [28 x i8], [28 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  %".89" = sext i32 0 to i64
  store i64 %".89", i64* %"i"
  br label %"while.cond.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"i.4" = load i64, i64* %"i"
  %".57" = add i64 %"i.4", 1
  store i64 %".57", i64* %"i"
  br label %"while.cond"
while.cond.1:
  %"i.5" = load i64, i64* %"i"
  %"n.2" = load i64, i64* %"n"
  %".92" = icmp ult i64 %"i.5", %"n.2"
  br i1 %".92", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.6" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.6" to i32
  %"array_gep.1" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.1")
  %"i.7" = load i64, i64* %"i"
  %".95" = add i64 %"i.7", 1
  store i64 %".95", i64* %"i"
  br label %"while.cond.1"
while.end.1:
  call void @"standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1"()
  store i1 true, i1* %"ok"
  %".99" = sext i32 0 to i64
  store i64 %".99", i64* %"i"
  br label %"while.cond.2"
while.cond.2:
  %"i.8" = load i64, i64* %"i"
  %"n.3" = load i64, i64* %"n"
  %".102" = icmp ult i64 %"i.8", %"n.3"
  br i1 %".102", label %"while.body.2", label %"while.end.2"
while.body.2:
  %".104" = sext i32 64 to i64
  %".105" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".104")
  %"i.9" = load i64, i64* %"i"
  %".106" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i64 %"i.9"
  store i64 %".105", i64* %".106"
  %"i.10" = load i64, i64* %"i"
  %"idx_trunc.2" = trunc i64 %"i.10" to i32
  %"array_gep.2" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.2"
  %"array_load.2" = load i64, i64* %"array_gep.2"
  %".108" = zext i32 0 to i64
  %".109" = icmp eq i64 %"array_load.2", %".108"
  br i1 %".109", label %"then.1", label %"else.1"
while.end.2:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.2" = alloca [34 x i8]
  %"str_char_0.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 112, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 111, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 115, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 116, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 45, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 99, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 111, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 97, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 108, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 101, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 115, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 99, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 101, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 97, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 108, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 108, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 111, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 99, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 115, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 32, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 97, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 108, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 108, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 32, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 110, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 111, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 110, i8* %"str_char_27.2"
  %"str_char_28.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 45, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 110, i8* %"str_char_29.1"
  %"str_char_30" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 117, i8* %"str_char_30"
  %"str_char_31" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 108, i8* %"str_char_31"
  %"str_char_32" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 108, i8* %"str_char_32"
  %"str_char_33" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 0, i8* %"str_char_33"
  %"arg1_decay.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.1")
  store i1 true, i1* %"ok"
  %".168" = sext i32 0 to i64
  store i64 %".168", i64* %"i"
  br label %"while.cond.4"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.2"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"i.11" = load i64, i64* %"i"
  %"idx_trunc.3" = trunc i64 %"i.11" to i32
  %"array_gep.3" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.3"
  %"array_load.3" = load i64, i64* %"array_gep.3"
  %"int_to_ptr" = inttoptr i64 %"array_load.3" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".115" = sext i32 0 to i64
  store i64 %".115", i64* %"j"
  br label %"while.cond.3"
while.cond.3:
  %"j.1" = load i64, i64* %"j"
  %".118" = zext i32 64 to i64
  %".119" = icmp ult i64 %"j.1", %".118"
  br i1 %".119", label %"while.body.3", label %"while.end.3"
while.body.3:
  %"i.12" = load i64, i64* %"i"
  %".121" = zext i32 255 to i64
  %".122" = and i64 %"i.12", %".121"
  %".123" = trunc i64 %".122" to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"j.2" = load i64, i64* %"j"
  %".124" = getelementptr inbounds i8, i8* %"bp.1", i64 %"j.2"
  store i8 %".123", i8* %".124"
  %"j.3" = load i64, i64* %"j"
  %".126" = add i64 %"j.3", 1
  store i64 %".126", i64* %"j"
  br label %"while.cond.3"
while.end.3:
  %"i.13" = load i64, i64* %"i"
  %".129" = add i64 %"i.13", 1
  store i64 %".129", i64* %"i"
  br label %"while.cond.2"
while.cond.4:
  %"i.14" = load i64, i64* %"i"
  %"n.4" = load i64, i64* %"n"
  %".171" = icmp ult i64 %"i.14", %"n.4"
  br i1 %".171", label %"while.body.4", label %"while.end.4"
while.body.4:
  %"i.15" = load i64, i64* %"i"
  %"idx_trunc.4" = trunc i64 %"i.15" to i32
  %"array_gep.4" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.4"
  %"array_load.4" = load i64, i64* %"array_gep.4"
  %"int_to_ptr.1" = inttoptr i64 %"array_load.4" to i8*
  store i8* %"int_to_ptr.1", i8** %"bp"
  %"bp.2" = load i8*, i8** %"bp"
  %"ptr_gep" = getelementptr inbounds i8, i8* %"bp.2", i32 0
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"i.16" = load i64, i64* %"i"
  %".174" = zext i32 255 to i64
  %".175" = and i64 %"i.16", %".174"
  %".176" = trunc i64 %".175" to i8
  %".177" = icmp ne i8 %"ptr_load", %".176"
  br i1 %".177", label %"then.2", label %"else.2"
while.end.4:
  %"ok.3" = load i1, i1* %"ok"
  %"str_stack.3" = alloca [33 x i8]
  %"str_char_0.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 112, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 111, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 115, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 116, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 45, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 99, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 111, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 97, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 108, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 101, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 115, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 99, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 101, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 32, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 119, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 114, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 105, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 116, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 101, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 47, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 114, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 101, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 97, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 100, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 32, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 99, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 111, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 114, i8* %"str_char_27.3"
  %"str_char_28.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 114, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 101, i8* %"str_char_29.2"
  %"str_char_30.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 99, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 116, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 0, i8* %"str_char_32.1"
  %"arg1_decay.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.3", i8* %"arg1_decay.2")
  %".219" = sext i32 0 to i64
  store i64 %".219", i64* %"i"
  br label %"while.cond.5"
then.2:
  store i1 false, i1* %"ok"
  br label %"while.end.4"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"i.17" = load i64, i64* %"i"
  %".182" = add i64 %"i.17", 1
  store i64 %".182", i64* %"i"
  br label %"while.cond.4"
while.cond.5:
  %"i.18" = load i64, i64* %"i"
  %"n.5" = load i64, i64* %"n"
  %".222" = icmp ult i64 %"i.18", %"n.5"
  br i1 %".222", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"i.19" = load i64, i64* %"i"
  %"idx_trunc.5" = trunc i64 %"i.19" to i32
  %"array_gep.5" = getelementptr inbounds [32 x i64], [32 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.5"
  %"array_load.5" = load i64, i64* %"array_gep.5"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.5")
  %"i.20" = load i64, i64* %"i"
  %".225" = add i64 %"i.20", 1
  store i64 %".225", i64* %"i"
  br label %"while.cond.5"
while.end.5:
  ret void
}

define void @"test_fragmentation__0__ret_voidE1"()
{
entry:
  %"f0" = alloca float
  store float              0x0, float* %"f0"
  %"f1" = alloca float
  store float              0x0, float* %"f1"
  %"f2" = alloca float
  store float              0x0, float* %"f2"
  %"p1" = alloca i64
  store i64 0, i64* %"p1"
  %"p2" = alloca i64
  store i64 0, i64* %"p2"
  %"p3" = alloca i64
  store i64 0, i64* %"p3"
  %"p4" = alloca i64
  store i64 0, i64* %"p4"
  %"str_stack" = alloca [27 x i8]
  %"str_char_0" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 3
  store i8 99, i8* %"str_char_3"
  %"str_char_4" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 4
  store i8 104, i8* %"str_char_4"
  %"str_char_5" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 6
  store i8 99, i8* %"str_char_6"
  %"str_char_7" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 7
  store i8 107, i8* %"str_char_7"
  %"str_char_8" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 8
  store i8 95, i8* %"str_char_8"
  %"str_char_9" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 9
  store i8 102, i8* %"str_char_9"
  %"str_char_10" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 10
  store i8 114, i8* %"str_char_10"
  %"str_char_11" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 11
  store i8 97, i8* %"str_char_11"
  %"str_char_12" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 12
  store i8 103, i8* %"str_char_12"
  %"str_char_13" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 13
  store i8 109, i8* %"str_char_13"
  %"str_char_14" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 14
  store i8 101, i8* %"str_char_14"
  %"str_char_15" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 15
  store i8 110, i8* %"str_char_15"
  %"str_char_16" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 16
  store i8 116, i8* %"str_char_16"
  %"str_char_17" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 17
  store i8 97, i8* %"str_char_17"
  %"str_char_18" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 18
  store i8 116, i8* %"str_char_18"
  %"str_char_19" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 19
  store i8 105, i8* %"str_char_19"
  %"str_char_20" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 20
  store i8 111, i8* %"str_char_20"
  %"str_char_21" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 21
  store i8 110, i8* %"str_char_21"
  %"str_char_22" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 22
  store i8 32, i8* %"str_char_22"
  %"str_char_23" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 23
  store i8 45, i8* %"str_char_23"
  %"str_char_24" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 24
  store i8 45, i8* %"str_char_24"
  %"str_char_25" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 25
  store i8 10, i8* %"str_char_25"
  %"str_char_26" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 26
  store i8 0, i8* %"str_char_26"
  %"arg0_decay" = getelementptr [27 x i8], [27 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %"op_overload_result" = call float @"standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1"()
  store float %"op_overload_result", float* %"f0"
  %"f0.1" = load float, float* %"f0"
  %".38" = fcmp oge float %"f0.1",              0x0
  br i1 %".38", label %"sc_rhs", label %"sc_end"
sc_rhs:
  %"f0.2" = load float, float* %"f0"
  %".40" = fcmp ole float %"f0.2", 0x3ff0000000000000
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"entry"], [%".40", %"sc_rhs"]
  %"str_stack.1" = alloca [40 x i8]
  %"str_char_0.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 102, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 114, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 97, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 103, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 109, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 101, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 110, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 116, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 97, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 116, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 105, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 111, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 110, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 32, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 105, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 110, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 32, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 91, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 48, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 44, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 49, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 93, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 32, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 98, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 101, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 102, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 111, i8* %"str_char_26.1"
  %"str_char_27" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 114, i8* %"str_char_27"
  %"str_char_28" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 101, i8* %"str_char_28"
  %"str_char_29" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 32, i8* %"str_char_29"
  %"str_char_30" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 97, i8* %"str_char_30"
  %"str_char_31" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 110, i8* %"str_char_31"
  %"str_char_32" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 121, i8* %"str_char_32"
  %"str_char_33" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 32, i8* %"str_char_33"
  %"str_char_34" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 97, i8* %"str_char_34"
  %"str_char_35" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 108, i8* %"str_char_35"
  %"str_char_36" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 108, i8* %"str_char_36"
  %"str_char_37" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 111, i8* %"str_char_37"
  %"str_char_38" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 99, i8* %"str_char_38"
  %"str_char_39" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 0, i8* %"str_char_39"
  %"arg1_decay" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"sc_result", i8* %"arg1_decay")
  %".83" = sext i32 64 to i64
  %".84" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".83")
  store i64 %".84", i64* %"p1"
  %".86" = sext i32 128 to i64
  %".87" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".86")
  store i64 %".87", i64* %"p2"
  %".89" = sext i32 256 to i64
  %".90" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".89")
  store i64 %".90", i64* %"p3"
  %".92" = sext i32 512 to i64
  %".93" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".92")
  store i64 %".93", i64* %"p4"
  %"op_overload_result.1" = call float @"standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1"()
  store float %"op_overload_result.1", float* %"f1"
  %"f1.1" = load float, float* %"f1"
  %".96" = fcmp oge float %"f1.1",              0x0
  br i1 %".96", label %"sc_rhs.1", label %"sc_end.1"
sc_rhs.1:
  %"f1.2" = load float, float* %"f1"
  %".98" = fcmp ole float %"f1.2", 0x3ff0000000000000
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [0, %"sc_end"], [%".98", %"sc_rhs.1"]
  %"str_stack.2" = alloca [40 x i8]
  %"str_char_0.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 102, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 114, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 97, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 103, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 109, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 110, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 116, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 97, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 116, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 105, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 111, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 110, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 105, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 110, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 91, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 48, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 44, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 49, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 93, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 32, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 119, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 105, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 116, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 104, i8* %"str_char_26.2"
  %"str_char_27.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 32, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 108, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 105, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 118, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 101, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 32, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 98, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 108, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 111, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 99, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 107, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 38
  store i8 115, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 39
  store i8 0, i8* %"str_char_39.1"
  %"arg1_decay.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"sc_result.1", i8* %"arg1_decay.1")
  %"p1.1" = load i64, i64* %"p1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p1.1")
  %"p2.1" = load i64, i64* %"p2"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p2.1")
  %"p3.1" = load i64, i64* %"p3"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p3.1")
  %"p4.1" = load i64, i64* %"p4"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p4.1")
  %"op_overload_result.2" = call float @"standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1"()
  store float %"op_overload_result.2", float* %"f2"
  %"f2.1" = load float, float* %"f2"
  %".146" = fcmp oge float %"f2.1",              0x0
  br i1 %".146", label %"sc_rhs.2", label %"sc_end.2"
sc_rhs.2:
  %"f2.2" = load float, float* %"f2"
  %".148" = fcmp ole float %"f2.2", 0x3ff0000000000000
  br label %"sc_end.2"
sc_end.2:
  %"sc_result.2" = phi  i1 [0, %"sc_end.1"], [%".148", %"sc_rhs.2"]
  %"str_stack.3" = alloca [41 x i8]
  %"str_char_0.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 102, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 114, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 97, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 103, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 109, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 101, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 110, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 116, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 97, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 116, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 105, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 111, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 110, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 32, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 105, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 110, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 32, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 91, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 48, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 44, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 49, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 93, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 32, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 97, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 102, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 116, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 101, i8* %"str_char_26.3"
  %"str_char_27.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 114, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 32, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 102, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 114, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 101, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 101, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 33
  store i8 105, i8* %"str_char_33.2"
  %"str_char_34.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 34
  store i8 110, i8* %"str_char_34.2"
  %"str_char_35.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 35
  store i8 103, i8* %"str_char_35.2"
  %"str_char_36.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 36
  store i8 32, i8* %"str_char_36.2"
  %"str_char_37.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 37
  store i8 97, i8* %"str_char_37.2"
  %"str_char_38.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 38
  store i8 108, i8* %"str_char_38.2"
  %"str_char_39.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 39
  store i8 108, i8* %"str_char_39.2"
  %"str_char_40" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 40
  store i8 0, i8* %"str_char_40"
  %"arg1_decay.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"sc_result.2", i8* %"arg1_decay.2")
  %"f2.3" = load float, float* %"f2"
  %"f1.3" = load float, float* %"f1"
  %".192" = fcmp oge float %"f2.3", %"f1.3"
  %"str_stack.4" = alloca [46 x i8]
  %"str_char_0.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 102, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 114, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 97, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 103, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 109, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 101, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 110, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 116, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 97, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 116, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 105, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 111, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 110, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 32, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 114, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 105, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 115, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 101, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 115, i8* %"str_char_18.4"
  %"str_char_19.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 19
  store i8 32, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 20
  store i8 97, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 21
  store i8 102, i8* %"str_char_21.4"
  %"str_char_22.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 22
  store i8 116, i8* %"str_char_22.4"
  %"str_char_23.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 23
  store i8 101, i8* %"str_char_23.4"
  %"str_char_24.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 24
  store i8 114, i8* %"str_char_24.4"
  %"str_char_25.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 25
  store i8 32, i8* %"str_char_25.4"
  %"str_char_26.4" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 26
  store i8 102, i8* %"str_char_26.4"
  %"str_char_27.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 27
  store i8 114, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 28
  store i8 101, i8* %"str_char_28.3"
  %"str_char_29.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 29
  store i8 101, i8* %"str_char_29.3"
  %"str_char_30.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 30
  store i8 105, i8* %"str_char_30.3"
  %"str_char_31.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 31
  store i8 110, i8* %"str_char_31.3"
  %"str_char_32.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 32
  store i8 103, i8* %"str_char_32.3"
  %"str_char_33.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 33
  store i8 32, i8* %"str_char_33.3"
  %"str_char_34.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 34
  store i8 108, i8* %"str_char_34.3"
  %"str_char_35.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 35
  store i8 105, i8* %"str_char_35.3"
  %"str_char_36.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 36
  store i8 118, i8* %"str_char_36.3"
  %"str_char_37.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 37
  store i8 101, i8* %"str_char_37.3"
  %"str_char_38.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 38
  store i8 32, i8* %"str_char_38.3"
  %"str_char_39.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 39
  store i8 98, i8* %"str_char_39.3"
  %"str_char_40.1" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 40
  store i8 108, i8* %"str_char_40.1"
  %"str_char_41" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 41
  store i8 111, i8* %"str_char_41"
  %"str_char_42" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 42
  store i8 99, i8* %"str_char_42"
  %"str_char_43" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 43
  store i8 107, i8* %"str_char_43"
  %"str_char_44" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 44
  store i8 115, i8* %"str_char_44"
  %"str_char_45" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 45
  store i8 0, i8* %"str_char_45"
  %"arg1_decay.3" = getelementptr [46 x i8], [46 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".192", i8* %"arg1_decay.3")
  call void @"standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1"()
  ret void
}

define void @"test_mixed_pattern__0__ret_voidE1"()
{
entry:
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"live" = alloca [256 x i64]
  %"memset_ptr" = bitcast [256 x i64]* %"live" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 2048, i1 0)
  %"live_sz" = alloca [256 x i64]
  %"memset_ptr.1" = bitcast [256 x i64]* %"live_sz" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr.1", i8 0, i64 2048, i1 0)
  %"live_count" = alloca i64
  store i64 0, i64* %"live_count"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"ptr" = alloca i64
  store i64 0, i64* %"ptr"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"do_alloc" = alloca i1
  store i1 0, i1* %"do_alloc"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"victim" = alloca i64
  store i64 0, i64* %"victim"
  %"str_stack" = alloca [51 x i8]
  %"str_char_0" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 3
  store i8 109, i8* %"str_char_3"
  %"str_char_4" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 4
  store i8 105, i8* %"str_char_4"
  %"str_char_5" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 5
  store i8 120, i8* %"str_char_5"
  %"str_char_6" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 6
  store i8 101, i8* %"str_char_6"
  %"str_char_7" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 7
  store i8 100, i8* %"str_char_7"
  %"str_char_8" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 8
  store i8 32, i8* %"str_char_8"
  %"str_char_9" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 9
  store i8 97, i8* %"str_char_9"
  %"str_char_10" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 10
  store i8 108, i8* %"str_char_10"
  %"str_char_11" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 11
  store i8 108, i8* %"str_char_11"
  %"str_char_12" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 12
  store i8 111, i8* %"str_char_12"
  %"str_char_13" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 13
  store i8 99, i8* %"str_char_13"
  %"str_char_14" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 14
  store i8 47, i8* %"str_char_14"
  %"str_char_15" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 15
  store i8 102, i8* %"str_char_15"
  %"str_char_16" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 16
  store i8 114, i8* %"str_char_16"
  %"str_char_17" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 17
  store i8 101, i8* %"str_char_17"
  %"str_char_18" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 18
  store i8 101, i8* %"str_char_18"
  %"str_char_19" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 20
  store i8 40, i8* %"str_char_20"
  %"str_char_21" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 21
  store i8 53, i8* %"str_char_21"
  %"str_char_22" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 22
  store i8 48, i8* %"str_char_22"
  %"str_char_23" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 23
  store i8 48, i8* %"str_char_23"
  %"str_char_24" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 24
  store i8 48, i8* %"str_char_24"
  %"str_char_25" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 25
  store i8 32, i8* %"str_char_25"
  %"str_char_26" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 26
  store i8 111, i8* %"str_char_26"
  %"str_char_27" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 27
  store i8 112, i8* %"str_char_27"
  %"str_char_28" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 28
  store i8 115, i8* %"str_char_28"
  %"str_char_29" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 29
  store i8 44, i8* %"str_char_29"
  %"str_char_30" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 30
  store i8 32, i8* %"str_char_30"
  %"str_char_31" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 31
  store i8 117, i8* %"str_char_31"
  %"str_char_32" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 32
  store i8 112, i8* %"str_char_32"
  %"str_char_33" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 33
  store i8 32, i8* %"str_char_33"
  %"str_char_34" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 34
  store i8 116, i8* %"str_char_34"
  %"str_char_35" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 35
  store i8 111, i8* %"str_char_35"
  %"str_char_36" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 36
  store i8 32, i8* %"str_char_36"
  %"str_char_37" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 37
  store i8 50, i8* %"str_char_37"
  %"str_char_38" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 38
  store i8 53, i8* %"str_char_38"
  %"str_char_39" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 39
  store i8 54, i8* %"str_char_39"
  %"str_char_40" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 40
  store i8 32, i8* %"str_char_40"
  %"str_char_41" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 41
  store i8 108, i8* %"str_char_41"
  %"str_char_42" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 42
  store i8 105, i8* %"str_char_42"
  %"str_char_43" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 43
  store i8 118, i8* %"str_char_43"
  %"str_char_44" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 44
  store i8 101, i8* %"str_char_44"
  %"str_char_45" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 45
  store i8 41, i8* %"str_char_45"
  %"str_char_46" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 46
  store i8 32, i8* %"str_char_46"
  %"str_char_47" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 47
  store i8 45, i8* %"str_char_47"
  %"str_char_48" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 48
  store i8 45, i8* %"str_char_48"
  %"str_char_49" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 49
  store i8 10, i8* %"str_char_49"
  %"str_char_50" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 50
  store i8 0, i8* %"str_char_50"
  %"arg0_decay" = getelementptr [51 x i8], [51 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %".70" = sext i32 5000 to i64
  store i64 %".70", i64* %"n"
  %".72" = sext i32 0 to i64
  store i64 %".72", i64* %"live_count"
  store i1 true, i1* %"ok"
  br label %"while.cond"
while.cond:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".76" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".76", label %"while.body", label %"while.end"
while.body:
  %".78" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".78", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".80" = zext i32 %"rval.1" to i64
  store i64 %".80", i64* %"rval64"
  %"live_count.1" = load i64, i64* %"live_count"
  %".82" = zext i32 256 to i64
  %".83" = icmp eq i64 %"live_count.1", %".82"
  br i1 %".83", label %"then", label %"else"
while.end:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [36 x i8]
  %"str_char_0.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 53, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 48, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 48, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 48, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 32, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 109, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 105, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 120, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 101, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 100, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 111, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 112, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 115, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 58, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 32, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 97, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 108, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 108, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 32, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 97, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 108, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 108, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 111, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 99, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 115, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 32, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 110, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 111, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 110, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 45, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 110, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 117, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 108, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 108, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 0, i8* %"str_char_35.1"
  %"arg1_decay" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay")
  %".191" = sext i32 0 to i64
  store i64 %".191", i64* %"j"
  br label %"while.cond.2"
then:
  store i1 false, i1* %"do_alloc"
  br label %"ifcont"
else:
  %"live_count.2" = load i64, i64* %"live_count"
  %".87" = zext i32 0 to i64
  %".88" = icmp eq i64 %"live_count.2", %".87"
  br i1 %".88", label %"elif_then_0", label %"elif_else_0"
ifcont:
  %"do_alloc.1" = load i1, i1* %"do_alloc"
  switch i1 %"do_alloc.1", label %"switch_default" [i1 1, label %"switch_case_0"]
elif_then_0:
  store i1 true, i1* %"do_alloc"
  br label %"ifcont"
elif_else_0:
  %"rval64.1" = load i64, i64* %"rval64"
  %".92" = zext i32 255 to i64
  %".93" = and i64 %"rval64.1", %".92"
  %".94" = zext i32 153 to i64
  %".95" = icmp ult i64 %".93", %".94"
  store i1 %".95", i1* %"do_alloc"
  br label %"ifcont"
switch_merge:
  %"ok.1" = load i1, i1* %"ok"
  %".147" = xor i1 %"ok.1", -1
  br i1 %".147", label %"then.2", label %"else.2"
switch_case_0:
  %"rval64.2" = load i64, i64* %"rval64"
  %".99" = zext i32 4096 to i64
  %".100" = urem i64 %"rval64.2", %".99"
  %".101" = zext i32 1 to i64
  %".102" = add i64 %".100", %".101"
  store i64 %".102", i64* %"sz"
  %"sz.1" = load i64, i64* %"sz"
  %".104" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.1")
  store i64 %".104", i64* %"ptr"
  %"ptr.1" = load i64, i64* %"ptr"
  %".106" = zext i32 0 to i64
  %".107" = icmp eq i64 %"ptr.1", %".106"
  br i1 %".107", label %"then.1", label %"else.1"
switch_default:
  %"rval64.3" = load i64, i64* %"rval64"
  %"live_count.7" = load i64, i64* %"live_count"
  %".137" = urem i64 %"rval64.3", %"live_count.7"
  store i64 %".137", i64* %"victim"
  %"victim.1" = load i64, i64* %"victim"
  %"idx_trunc" = trunc i64 %"victim.1" to i32
  %"array_gep" = getelementptr inbounds [256 x i64], [256 x i64]* %"live", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load")
  %"live_count.8" = load i64, i64* %"live_count"
  %".140" = sub i64 %"live_count.8", 1
  store i64 %".140", i64* %"live_count"
  %"live_count.9" = load i64, i64* %"live_count"
  %"idx_trunc.1" = trunc i64 %"live_count.9" to i32
  %"array_gep.1" = getelementptr inbounds [256 x i64], [256 x i64]* %"live", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  %"victim.2" = load i64, i64* %"victim"
  %".142" = getelementptr inbounds [256 x i64], [256 x i64]* %"live", i32 0, i64 %"victim.2"
  store i64 %"array_load.1", i64* %".142"
  %"live_count.10" = load i64, i64* %"live_count"
  %"idx_trunc.2" = trunc i64 %"live_count.10" to i32
  %"array_gep.2" = getelementptr inbounds [256 x i64], [256 x i64]* %"live_sz", i32 0, i32 %"idx_trunc.2"
  %"array_load.2" = load i64, i64* %"array_gep.2"
  %"victim.3" = load i64, i64* %"victim"
  %".144" = getelementptr inbounds [256 x i64], [256 x i64]* %"live_sz", i32 0, i64 %"victim.3"
  store i64 %"array_load.2", i64* %".144"
  br label %"switch_merge"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"ptr.2" = load i64, i64* %"ptr"
  %"int_to_ptr" = inttoptr i64 %"ptr.2" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".113" = sext i32 0 to i64
  store i64 %".113", i64* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j.1" = load i64, i64* %"j"
  %".116" = zext i32 8 to i64
  %".117" = icmp ult i64 %"j.1", %".116"
  br i1 %".117", label %"sc_rhs", label %"sc_end"
while.body.1:
  %"live_count.3" = load i64, i64* %"live_count"
  %".122" = zext i32 255 to i64
  %".123" = and i64 %"live_count.3", %".122"
  %".124" = trunc i64 %".123" to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"j.3" = load i64, i64* %"j"
  %".125" = getelementptr inbounds i8, i8* %"bp.1", i64 %"j.3"
  store i8 %".124", i8* %".125"
  %"j.4" = load i64, i64* %"j"
  %".127" = add i64 %"j.4", 1
  store i64 %".127", i64* %"j"
  br label %"while.cond.1"
while.end.1:
  %"ptr.3" = load i64, i64* %"ptr"
  %"live_count.4" = load i64, i64* %"live_count"
  %".130" = getelementptr inbounds [256 x i64], [256 x i64]* %"live", i32 0, i64 %"live_count.4"
  store i64 %"ptr.3", i64* %".130"
  %"sz.3" = load i64, i64* %"sz"
  %"live_count.5" = load i64, i64* %"live_count"
  %".132" = getelementptr inbounds [256 x i64], [256 x i64]* %"live_sz", i32 0, i64 %"live_count.5"
  store i64 %"sz.3", i64* %".132"
  %"live_count.6" = load i64, i64* %"live_count"
  %".134" = add i64 %"live_count.6", 1
  store i64 %".134", i64* %"live_count"
  br label %"switch_merge"
sc_rhs:
  %"j.2" = load i64, i64* %"j"
  %"sz.2" = load i64, i64* %"sz"
  %".119" = icmp ult i64 %"j.2", %"sz.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond.1"], [%".119", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body.1", label %"while.end.1"
then.2:
  br label %"while.end"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"i.2" = load i64, i64* %"i"
  %".151" = add i64 %"i.2", 1
  store i64 %".151", i64* %"i"
  br label %"while.cond"
while.cond.2:
  %"j.5" = load i64, i64* %"j"
  %"live_count.11" = load i64, i64* %"live_count"
  %".194" = icmp ult i64 %"j.5", %"live_count.11"
  br i1 %".194", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"j.6" = load i64, i64* %"j"
  %"idx_trunc.3" = trunc i64 %"j.6" to i32
  %"array_gep.3" = getelementptr inbounds [256 x i64], [256 x i64]* %"live", i32 0, i32 %"idx_trunc.3"
  %"array_load.3" = load i64, i64* %"array_gep.3"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.3")
  %"j.7" = load i64, i64* %"j"
  %".197" = add i64 %"j.7", 1
  store i64 %".197", i64* %"j"
  br label %"while.cond.2"
while.end.2:
  ret void
}

define void @"test_table_stress__0__ret_voidE1"()
{
entry:
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %".6" = sext i32 2048 to i64
  store i64 %".6", i64* %"n"
  store i1 true, i1* %"ok"
  %"str_stack" = alloca [44 x i8]
  %"str_char_0" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 3
  store i8 116, i8* %"str_char_3"
  %"str_char_4" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 4
  store i8 97, i8* %"str_char_4"
  %"str_char_5" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 5
  store i8 98, i8* %"str_char_5"
  %"str_char_6" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 6
  store i8 108, i8* %"str_char_6"
  %"str_char_7" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 7
  store i8 101, i8* %"str_char_7"
  %"str_char_8" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 8
  store i8 32, i8* %"str_char_8"
  %"str_char_9" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 9
  store i8 115, i8* %"str_char_9"
  %"str_char_10" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 10
  store i8 116, i8* %"str_char_10"
  %"str_char_11" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 11
  store i8 114, i8* %"str_char_11"
  %"str_char_12" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 12
  store i8 101, i8* %"str_char_12"
  %"str_char_13" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 13
  store i8 115, i8* %"str_char_13"
  %"str_char_14" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 14
  store i8 115, i8* %"str_char_14"
  %"str_char_15" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 15
  store i8 58, i8* %"str_char_15"
  %"str_char_16" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 16
  store i8 32, i8* %"str_char_16"
  %"str_char_17" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 17
  store i8 50, i8* %"str_char_17"
  %"str_char_18" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 18
  store i8 48, i8* %"str_char_18"
  %"str_char_19" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 19
  store i8 52, i8* %"str_char_19"
  %"str_char_20" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 20
  store i8 56, i8* %"str_char_20"
  %"str_char_21" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 21
  store i8 32, i8* %"str_char_21"
  %"str_char_22" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 22
  store i8 108, i8* %"str_char_22"
  %"str_char_23" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 23
  store i8 105, i8* %"str_char_23"
  %"str_char_24" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 24
  store i8 118, i8* %"str_char_24"
  %"str_char_25" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 25
  store i8 101, i8* %"str_char_25"
  %"str_char_26" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 26
  store i8 32, i8* %"str_char_26"
  %"str_char_27" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 27
  store i8 108, i8* %"str_char_27"
  %"str_char_28" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 28
  store i8 97, i8* %"str_char_28"
  %"str_char_29" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 29
  store i8 114, i8* %"str_char_29"
  %"str_char_30" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 30
  store i8 103, i8* %"str_char_30"
  %"str_char_31" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 31
  store i8 101, i8* %"str_char_31"
  %"str_char_32" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 32
  store i8 32, i8* %"str_char_32"
  %"str_char_33" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 33
  store i8 98, i8* %"str_char_33"
  %"str_char_34" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 34
  store i8 108, i8* %"str_char_34"
  %"str_char_35" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 35
  store i8 111, i8* %"str_char_35"
  %"str_char_36" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 36
  store i8 99, i8* %"str_char_36"
  %"str_char_37" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 37
  store i8 107, i8* %"str_char_37"
  %"str_char_38" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 38
  store i8 115, i8* %"str_char_38"
  %"str_char_39" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 39
  store i8 32, i8* %"str_char_39"
  %"str_char_40" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 40
  store i8 45, i8* %"str_char_40"
  %"str_char_41" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 41
  store i8 45, i8* %"str_char_41"
  %"str_char_42" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 42
  store i8 10, i8* %"str_char_42"
  %"str_char_43" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 43
  store i8 0, i8* %"str_char_43"
  %"arg0_decay" = getelementptr [44 x i8], [44 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %"batch" = alloca i64
  store i64 0, i64* %"batch"
  %"b" = alloca i64
  store i64 0, i64* %"b"
  %"total_freed" = alloca i64
  store i64 0, i64* %"total_freed"
  %"ptrs" = alloca [256 x i64]
  %"memset_ptr" = bitcast [256 x i64]* %"ptrs" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 2048, i1 0)
  %".58" = sext i32 256 to i64
  store i64 %".58", i64* %"batch"
  %".60" = sext i32 0 to i64
  store i64 %".60", i64* %"total_freed"
  br label %"while.cond"
while.cond:
  %"total_freed.1" = load i64, i64* %"total_freed"
  %"n.1" = load i64, i64* %"n"
  %".63" = icmp ult i64 %"total_freed.1", %"n.1"
  br i1 %".63", label %"while.body", label %"while.end"
while.body:
  %".65" = sext i32 0 to i64
  store i64 %".65", i64* %"i"
  br label %"while.cond.1"
while.end:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [57 x i8]
  %"str_char_0.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 50, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 48, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 52, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 56, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 32, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 108, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 97, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 114, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 103, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 101, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 32, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 98, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 108, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 111, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 99, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 107, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 115, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 32, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 40, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 56, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 32, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 98, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 97, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 116, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 99, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 104, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 101, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 115, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 32, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 111, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 102, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 32, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 50, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 53, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 54, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 41, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 32, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 97, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 108, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 108, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 40
  store i8 111, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 41
  store i8 99, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 42
  store i8 97, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 43
  store i8 116, i8* %"str_char_43.1"
  %"str_char_44" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 44
  store i8 101, i8* %"str_char_44"
  %"str_char_45" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 45
  store i8 100, i8* %"str_char_45"
  %"str_char_46" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 46
  store i8 32, i8* %"str_char_46"
  %"str_char_47" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 47
  store i8 97, i8* %"str_char_47"
  %"str_char_48" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 48
  store i8 110, i8* %"str_char_48"
  %"str_char_49" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 49
  store i8 100, i8* %"str_char_49"
  %"str_char_50" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 50
  store i8 32, i8* %"str_char_50"
  %"str_char_51" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 51
  store i8 102, i8* %"str_char_51"
  %"str_char_52" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 52
  store i8 114, i8* %"str_char_52"
  %"str_char_53" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 53
  store i8 101, i8* %"str_char_53"
  %"str_char_54" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 54
  store i8 101, i8* %"str_char_54"
  %"str_char_55" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 55
  store i8 100, i8* %"str_char_55"
  %"str_char_56" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 56
  store i8 0, i8* %"str_char_56"
  %"arg1_decay" = getelementptr [57 x i8], [57 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay")
  %".156" = sext i32 64 to i64
  %".157" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".156")
  store i64 %".157", i64* %"p"
  %"p.3" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.3", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.2" = alloca [34 x i8]
  %"str_char_0.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 97, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 108, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 108, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 111, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 99, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 32, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 115, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 117, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 99, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 99, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 101, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 101, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 100, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 115, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 32, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 97, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 102, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 116, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 101, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 114, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 32, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 116, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 97, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 98, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 108, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 101, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 115, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 116, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 114, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 101, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 115, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 115, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 0, i8* %"str_char_33.2"
  %".193" = trunc i8 %"not_null_result" to i1
  %"arg1_decay.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".193", i8* %"arg1_decay.1")
  %"p.4" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.4")
  ret void
while.cond.1:
  %"i.1" = load i64, i64* %"i"
  %"batch.1" = load i64, i64* %"batch"
  %".68" = icmp ult i64 %"i.1", %"batch.1"
  br i1 %".68", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".70" = sext i32 8192 to i64
  %".71" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".70")
  store i64 %".71", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.1" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  br i1 %"is_null", label %"then", label %"else"
while.end.1:
  %"ok.1" = load i1, i1* %"ok"
  %".82" = xor i1 %"ok.1", -1
  br i1 %".82", label %"then.1", label %"else.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else:
  br label %"ifcont"
ifcont:
  %"p.2" = load i64, i64* %"p"
  %"i.2" = load i64, i64* %"i"
  %".77" = getelementptr inbounds [256 x i64], [256 x i64]* %"ptrs", i32 0, i64 %"i.2"
  store i64 %"p.2", i64* %".77"
  %"i.3" = load i64, i64* %"i"
  %".79" = add i64 %"i.3", 1
  store i64 %".79", i64* %"i"
  br label %"while.cond.1"
then.1:
  br label %"while.end"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %".86" = sext i32 0 to i64
  store i64 %".86", i64* %"i"
  br label %"while.cond.2"
while.cond.2:
  %"i.4" = load i64, i64* %"i"
  %"batch.2" = load i64, i64* %"batch"
  %".89" = icmp ult i64 %"i.4", %"batch.2"
  br i1 %".89", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"i.5" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.5" to i32
  %"array_gep" = getelementptr inbounds [256 x i64], [256 x i64]* %"ptrs", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load")
  %"i.6" = load i64, i64* %"i"
  %".92" = add i64 %"i.6", 1
  store i64 %".92", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  %"total_freed.2" = load i64, i64* %"total_freed"
  %"batch.3" = load i64, i64* %"batch"
  %".95" = add i64 %"total_freed.2", %"batch.3"
  store i64 %".95", i64* %"total_freed"
  br label %"while.cond"
}

define void @"test_double_free_guard__0__ret_voidE1"()
{
entry:
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"str_stack" = alloca [25 x i8]
  %"str_char_0" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 3
  store i8 100, i8* %"str_char_3"
  %"str_char_4" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 4
  store i8 111, i8* %"str_char_4"
  %"str_char_5" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 5
  store i8 117, i8* %"str_char_5"
  %"str_char_6" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 6
  store i8 98, i8* %"str_char_6"
  %"str_char_7" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 9
  store i8 45, i8* %"str_char_9"
  %"str_char_10" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 10
  store i8 102, i8* %"str_char_10"
  %"str_char_11" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 11
  store i8 114, i8* %"str_char_11"
  %"str_char_12" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 12
  store i8 101, i8* %"str_char_12"
  %"str_char_13" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 13
  store i8 101, i8* %"str_char_13"
  %"str_char_14" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 14
  store i8 32, i8* %"str_char_14"
  %"str_char_15" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 15
  store i8 103, i8* %"str_char_15"
  %"str_char_16" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 16
  store i8 117, i8* %"str_char_16"
  %"str_char_17" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 17
  store i8 97, i8* %"str_char_17"
  %"str_char_18" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 18
  store i8 114, i8* %"str_char_18"
  %"str_char_19" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 19
  store i8 100, i8* %"str_char_19"
  %"str_char_20" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 20
  store i8 32, i8* %"str_char_20"
  %"str_char_21" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 21
  store i8 45, i8* %"str_char_21"
  %"str_char_22" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 22
  store i8 45, i8* %"str_char_22"
  %"str_char_23" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 23
  store i8 10, i8* %"str_char_23"
  %"str_char_24" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 24
  store i8 0, i8* %"str_char_24"
  %"arg0_decay" = getelementptr [25 x i8], [25 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".29" = sext i32 64 to i64
  %".30" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".29")
  store i64 %".30", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.1", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.1" = alloca [27 x i8]
  %"str_char_0.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 97, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 108, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 108, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 111, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 99, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 32, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 102, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 111, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 114, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 32, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 100, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 111, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 117, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 98, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 108, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 101, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 45, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 102, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 114, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 101, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 101, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 32, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 116, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 101, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 116, i8* %"str_char_25"
  %"str_char_26" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 0, i8* %"str_char_26"
  %".59" = trunc i8 %"not_null_result" to i1
  %"arg1_decay" = getelementptr [27 x i8], [27 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".59", i8* %"arg1_decay")
  %"p.2" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.2")
  %"p.3" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.3")
  %"str_stack.2" = alloca [27 x i8]
  %"str_char_0.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 100, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 111, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 117, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 98, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 108, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 45, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 102, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 114, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 101, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 101, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 100, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 111, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 101, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 115, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 110, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 111, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 116, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 32, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 99, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 114, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 97, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 115, i8* %"str_char_24.2"
  %"str_char_25.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 104, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 0, i8* %"str_char_26.1"
  %"arg1_decay.1" = getelementptr [27 x i8], [27 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 true, i8* %"arg1_decay.1")
  %".91" = sext i32 64 to i64
  %".92" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".91")
  store i64 %".92", i64* %"p"
  %"p.4" = load i64, i64* %"p"
  %"not_zero.1" = icmp ne i64 %"p.4", 0
  %"not_null_result.1" = zext i1 %"not_zero.1" to i8
  %"str_stack.3" = alloca [38 x i8]
  %"str_char_0.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 97, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 108, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 108, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 111, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 99, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 32, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 97, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 102, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 116, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 101, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 114, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 32, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 100, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 111, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 117, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 98, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 108, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 101, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 45, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 102, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 114, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 101, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 101, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 32, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 105, i8* %"str_char_24.3"
  %"str_char_25.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 115, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 102, i8* %"str_char_27"
  %"str_char_28" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 117, i8* %"str_char_28"
  %"str_char_29" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 110, i8* %"str_char_29"
  %"str_char_30" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 99, i8* %"str_char_30"
  %"str_char_31" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 116, i8* %"str_char_31"
  %"str_char_32" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 105, i8* %"str_char_32"
  %"str_char_33" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 33
  store i8 111, i8* %"str_char_33"
  %"str_char_34" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 34
  store i8 110, i8* %"str_char_34"
  %"str_char_35" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 35
  store i8 97, i8* %"str_char_35"
  %"str_char_36" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 36
  store i8 108, i8* %"str_char_36"
  %"str_char_37" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 37
  store i8 0, i8* %"str_char_37"
  %".132" = trunc i8 %"not_null_result.1" to i1
  %"arg1_decay.2" = getelementptr [38 x i8], [38 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".132", i8* %"arg1_decay.2")
  %"p.5" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.5")
  ret void
}

define void @"test_throughput_small__0__ret_voidE1"()
{
entry:
  %"t0" = alloca i64
  store i64 0, i64* %"t0"
  %"t1" = alloca i64
  store i64 0, i64* %"t1"
  %"ns" = alloca i64
  store i64 0, i64* %"ns"
  %"ms" = alloca i64
  store i64 0, i64* %"ms"
  %"us" = alloca i64
  store i64 0, i64* %"us"
  %"mbs" = alloca i64
  store i64 0, i64* %"mbs"
  %"mbs_frac" = alloca i64
  store i64 0, i64* %"mbs_frac"
  %"kb_per_s" = alloca i64
  store i64 0, i64* %"kb_per_s"
  %"us_elapsed" = alloca i64
  store i64 0, i64* %"us_elapsed"
  %"k" = alloca i64
  store i64 0, i64* %"k"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"str_stack" = alloca [49 x i8]
  %"str_char_0" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 3
  store i8 116, i8* %"str_char_3"
  %"str_char_4" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 4
  store i8 104, i8* %"str_char_4"
  %"str_char_5" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 5
  store i8 114, i8* %"str_char_5"
  %"str_char_6" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 6
  store i8 111, i8* %"str_char_6"
  %"str_char_7" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 7
  store i8 117, i8* %"str_char_7"
  %"str_char_8" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 8
  store i8 103, i8* %"str_char_8"
  %"str_char_9" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 9
  store i8 104, i8* %"str_char_9"
  %"str_char_10" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 10
  store i8 112, i8* %"str_char_10"
  %"str_char_11" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 11
  store i8 117, i8* %"str_char_11"
  %"str_char_12" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 12
  store i8 116, i8* %"str_char_12"
  %"str_char_13" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 13
  store i8 58, i8* %"str_char_13"
  %"str_char_14" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 14
  store i8 32, i8* %"str_char_14"
  %"str_char_15" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 15
  store i8 49, i8* %"str_char_15"
  %"str_char_16" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 16
  store i8 77, i8* %"str_char_16"
  %"str_char_17" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 17
  store i8 32, i8* %"str_char_17"
  %"str_char_18" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 18
  store i8 120, i8* %"str_char_18"
  %"str_char_19" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 20
  store i8 54, i8* %"str_char_20"
  %"str_char_21" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 21
  store i8 52, i8* %"str_char_21"
  %"str_char_22" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 22
  store i8 45, i8* %"str_char_22"
  %"str_char_23" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 23
  store i8 98, i8* %"str_char_23"
  %"str_char_24" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 24
  store i8 121, i8* %"str_char_24"
  %"str_char_25" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 25
  store i8 116, i8* %"str_char_25"
  %"str_char_26" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 26
  store i8 101, i8* %"str_char_26"
  %"str_char_27" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 27
  store i8 32, i8* %"str_char_27"
  %"str_char_28" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 28
  store i8 97, i8* %"str_char_28"
  %"str_char_29" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 29
  store i8 108, i8* %"str_char_29"
  %"str_char_30" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 30
  store i8 108, i8* %"str_char_30"
  %"str_char_31" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 31
  store i8 111, i8* %"str_char_31"
  %"str_char_32" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 32
  store i8 99, i8* %"str_char_32"
  %"str_char_33" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 33
  store i8 43, i8* %"str_char_33"
  %"str_char_34" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 34
  store i8 102, i8* %"str_char_34"
  %"str_char_35" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 35
  store i8 114, i8* %"str_char_35"
  %"str_char_36" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 36
  store i8 101, i8* %"str_char_36"
  %"str_char_37" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 37
  store i8 101, i8* %"str_char_37"
  %"str_char_38" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 38
  store i8 32, i8* %"str_char_38"
  %"str_char_39" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 39
  store i8 112, i8* %"str_char_39"
  %"str_char_40" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 40
  store i8 97, i8* %"str_char_40"
  %"str_char_41" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 41
  store i8 105, i8* %"str_char_41"
  %"str_char_42" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 42
  store i8 114, i8* %"str_char_42"
  %"str_char_43" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 43
  store i8 115, i8* %"str_char_43"
  %"str_char_44" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 44
  store i8 32, i8* %"str_char_44"
  %"str_char_45" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 45
  store i8 45, i8* %"str_char_45"
  %"str_char_46" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 46
  store i8 45, i8* %"str_char_46"
  %"str_char_47" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 47
  store i8 10, i8* %"str_char_47"
  %"str_char_48" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 48
  store i8 0, i8* %"str_char_48"
  %"arg0_decay" = getelementptr [49 x i8], [49 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".66" = sext i32 1000000 to i64
  store i64 %".66", i64* %"n"
  store i1 true, i1* %"ok"
  %".69" = sext i32 0 to i64
  store i64 %".69", i64* %"k"
  %"op_overload_result" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result", i64* %"t0"
  br label %"while.cond"
while.cond:
  %"k.1" = load i64, i64* %"k"
  %"n.1" = load i64, i64* %"n"
  %".73" = icmp ult i64 %"k.1", %"n.1"
  br i1 %".73", label %"while.body", label %"while.end"
while.body:
  %".75" = sext i32 64 to i64
  %".76" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".75")
  store i64 %".76", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.1" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  br i1 %"is_null", label %"then", label %"else"
while.end:
  %"op_overload_result.1" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.1", i64* %"t1"
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [34 x i8]
  %"str_char_0.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 49, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 77, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 32, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 97, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 108, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 108, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 111, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 99, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 43, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 102, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 114, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 101, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 101, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 32, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 112, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 97, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 105, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 114, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 115, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 32, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 97, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 108, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 108, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 32, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 117, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 99, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 99, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 101, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 101, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 100, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 101, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 100, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 0, i8* %"str_char_33.1"
  %"arg1_decay" = getelementptr [34 x i8], [34 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  %"t1.1" = load i64, i64* %"t1"
  %"t0.1" = load i64, i64* %"t0"
  %".122" = sub i64 %"t1.1", %"t0.1"
  store i64 %".122", i64* %"ns"
  %"ns.1" = load i64, i64* %"ns"
  %".124" = call i64 @"standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.1")
  store i64 %".124", i64* %"ms"
  %"ns.2" = load i64, i64* %"ns"
  %".126" = call i64 @"standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.2")
  %".127" = sext i32 1000 to i64
  %".128" = srem i64 %".126", %".127"
  store i64 %".128", i64* %"us"
  %"ns.3" = load i64, i64* %"ns"
  %".130" = sext i32 1000 to i64
  %".131" = sdiv i64 %"ns.3", %".130"
  store i64 %".131", i64* %"us_elapsed"
  %"us_elapsed.1" = load i64, i64* %"us_elapsed"
  %".133" = sext i32 0 to i64
  %".134" = icmp sle i64 %"us_elapsed.1", %".133"
  br i1 %".134", label %"then.1", label %"else.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"p.2" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.2")
  %"k.2" = load i64, i64* %"k"
  %".83" = add i64 %"k.2", 1
  store i64 %".83", i64* %"k"
  br label %"while.cond"
then.1:
  %".136" = sext i32 1 to i64
  store i64 %".136", i64* %"us_elapsed"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"n.2" = load i64, i64* %"n"
  %".140" = sext i32 64 to i64
  %".141" = mul i64 %"n.2", %".140"
  %".142" = sext i32 1000 to i64
  %".143" = mul i64 %".141", %".142"
  %"us_elapsed.2" = load i64, i64* %"us_elapsed"
  %".144" = sdiv i64 %".143", %"us_elapsed.2"
  store i64 %".144", i64* %"kb_per_s"
  %"kb_per_s.1" = load i64, i64* %"kb_per_s"
  %".146" = sext i32 1024 to i64
  %".147" = sdiv i64 %"kb_per_s.1", %".146"
  store i64 %".147", i64* %"mbs"
  %"kb_per_s.2" = load i64, i64* %"kb_per_s"
  %".149" = sext i32 1024 to i64
  %".150" = srem i64 %"kb_per_s.2", %".149"
  %".151" = sext i32 10 to i64
  %".152" = mul i64 %".150", %".151"
  %".153" = sext i32 1024 to i64
  %".154" = sdiv i64 %".152", %".153"
  store i64 %".154", i64* %"mbs_frac"
  %"str_stack.2" = alloca [15 x i8]
  %"str_char_0.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 32, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 32, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 116, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 105, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 109, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 58, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 32, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 32, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 32, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 32, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 0, i8* %"str_char_14.2"
  %"arg0_decay.1" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"ms.1" = load i64, i64* %"ms"
  %".172" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".173" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"ms.1", i8* %".172")
  %".174" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".174")
  %"str_stack.3" = alloca [2 x i8]
  %"str_char_0.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 46, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 0, i8* %"str_char_1.3"
  %"arg0_decay.2" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.2")
  %"us.1" = load i64, i64* %"us"
  %".179" = sext i32 100 to i64
  %".180" = icmp slt i64 %"us.1", %".179"
  br i1 %".180", label %"then.2", label %"else.2"
then.2:
  %"str_stack.4" = alloca [2 x i8]
  %"str_char_0.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 48, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 0, i8* %"str_char_1.4"
  %"arg0_decay.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.3")
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"us.2" = load i64, i64* %"us"
  %".187" = sext i32 10 to i64
  %".188" = icmp slt i64 %"us.2", %".187"
  br i1 %".188", label %"then.3", label %"else.3"
then.3:
  %"str_stack.5" = alloca [2 x i8]
  %"str_char_0.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 48, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 0, i8* %"str_char_1.5"
  %"arg0_decay.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.4")
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"us.3" = load i64, i64* %"us"
  %".195" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".196" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"us.3", i8* %".195")
  %".197" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".197")
  %"str_stack.6" = alloca [5 x i8]
  %"str_char_0.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 32, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 109, i8* %"str_char_1.6"
  %"str_char_2.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 115, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 10, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 0, i8* %"str_char_4.3"
  %"arg0_decay.5" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.5")
  %"str_stack.7" = alloca [15 x i8]
  %"str_char_0.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 32, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 32, i8* %"str_char_1.7"
  %"str_char_2.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 116, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 104, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 114, i8* %"str_char_4.4"
  %"str_char_5.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 111, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 117, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 103, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 104, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 112, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 117, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 116, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 58, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 32, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 0, i8* %"str_char_14.3"
  %"arg0_decay.6" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.6")
  %"mbs.1" = load i64, i64* %"mbs"
  %".221" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".222" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs.1", i8* %".221")
  %".223" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".223")
  %"str_stack.8" = alloca [2 x i8]
  %"str_char_0.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 46, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 0, i8* %"str_char_1.8"
  %"arg0_decay.7" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.7")
  %"mbs_frac.1" = load i64, i64* %"mbs_frac"
  %".228" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".229" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs_frac.1", i8* %".228")
  %".230" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".230")
  %"str_stack.9" = alloca [7 x i8]
  %"str_char_0.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  store i8 32, i8* %"str_char_0.9"
  %"str_char_1.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 1
  store i8 77, i8* %"str_char_1.9"
  %"str_char_2.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 2
  store i8 66, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 3
  store i8 47, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 4
  store i8 115, i8* %"str_char_4.5"
  %"str_char_5.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 5
  store i8 10, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 6
  store i8 0, i8* %"str_char_6.4"
  %"arg0_decay.8" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.8")
  ret void
}

define void @"test_throughput_mixed__0__ret_voidE1"()
{
entry:
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"t0" = alloca i64
  store i64 0, i64* %"t0"
  %"t1" = alloca i64
  store i64 0, i64* %"t1"
  %"ns" = alloca i64
  store i64 0, i64* %"ns"
  %"ms" = alloca i64
  store i64 0, i64* %"ms"
  %"us" = alloca i64
  store i64 0, i64* %"us"
  %"mbs" = alloca i64
  store i64 0, i64* %"mbs"
  %"mbs_frac" = alloca i64
  store i64 0, i64* %"mbs_frac"
  %"kb_per_s" = alloca i64
  store i64 0, i64* %"kb_per_s"
  %"us_elapsed" = alloca i64
  store i64 0, i64* %"us_elapsed"
  %"total_bytes" = alloca i64
  store i64 0, i64* %"total_bytes"
  %"k" = alloca i64
  store i64 0, i64* %"k"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"str_stack" = alloca [65 x i8]
  %"str_char_0" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 3
  store i8 116, i8* %"str_char_3"
  %"str_char_4" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 4
  store i8 104, i8* %"str_char_4"
  %"str_char_5" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 5
  store i8 114, i8* %"str_char_5"
  %"str_char_6" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 6
  store i8 111, i8* %"str_char_6"
  %"str_char_7" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 7
  store i8 117, i8* %"str_char_7"
  %"str_char_8" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 8
  store i8 103, i8* %"str_char_8"
  %"str_char_9" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 9
  store i8 104, i8* %"str_char_9"
  %"str_char_10" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 10
  store i8 112, i8* %"str_char_10"
  %"str_char_11" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 11
  store i8 117, i8* %"str_char_11"
  %"str_char_12" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 12
  store i8 116, i8* %"str_char_12"
  %"str_char_13" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 13
  store i8 58, i8* %"str_char_13"
  %"str_char_14" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 14
  store i8 32, i8* %"str_char_14"
  %"str_char_15" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 15
  store i8 49, i8* %"str_char_15"
  %"str_char_16" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 16
  store i8 77, i8* %"str_char_16"
  %"str_char_17" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 17
  store i8 32, i8* %"str_char_17"
  %"str_char_18" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 18
  store i8 109, i8* %"str_char_18"
  %"str_char_19" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 19
  store i8 105, i8* %"str_char_19"
  %"str_char_20" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 20
  store i8 120, i8* %"str_char_20"
  %"str_char_21" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 21
  store i8 101, i8* %"str_char_21"
  %"str_char_22" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 22
  store i8 100, i8* %"str_char_22"
  %"str_char_23" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 23
  store i8 45, i8* %"str_char_23"
  %"str_char_24" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 24
  store i8 115, i8* %"str_char_24"
  %"str_char_25" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 25
  store i8 105, i8* %"str_char_25"
  %"str_char_26" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 26
  store i8 122, i8* %"str_char_26"
  %"str_char_27" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 27
  store i8 101, i8* %"str_char_27"
  %"str_char_28" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 28
  store i8 32, i8* %"str_char_28"
  %"str_char_29" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 29
  store i8 40, i8* %"str_char_29"
  %"str_char_30" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 30
  store i8 49, i8* %"str_char_30"
  %"str_char_31" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 31
  store i8 45, i8* %"str_char_31"
  %"str_char_32" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 32
  store i8 52, i8* %"str_char_32"
  %"str_char_33" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 33
  store i8 48, i8* %"str_char_33"
  %"str_char_34" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 34
  store i8 57, i8* %"str_char_34"
  %"str_char_35" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 35
  store i8 54, i8* %"str_char_35"
  %"str_char_36" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 36
  store i8 32, i8* %"str_char_36"
  %"str_char_37" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 37
  store i8 98, i8* %"str_char_37"
  %"str_char_38" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 38
  store i8 121, i8* %"str_char_38"
  %"str_char_39" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 39
  store i8 116, i8* %"str_char_39"
  %"str_char_40" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 40
  store i8 101, i8* %"str_char_40"
  %"str_char_41" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 41
  store i8 115, i8* %"str_char_41"
  %"str_char_42" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 42
  store i8 41, i8* %"str_char_42"
  %"str_char_43" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 43
  store i8 32, i8* %"str_char_43"
  %"str_char_44" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 44
  store i8 97, i8* %"str_char_44"
  %"str_char_45" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 45
  store i8 108, i8* %"str_char_45"
  %"str_char_46" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 46
  store i8 108, i8* %"str_char_46"
  %"str_char_47" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 47
  store i8 111, i8* %"str_char_47"
  %"str_char_48" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 48
  store i8 99, i8* %"str_char_48"
  %"str_char_49" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 49
  store i8 43, i8* %"str_char_49"
  %"str_char_50" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 50
  store i8 102, i8* %"str_char_50"
  %"str_char_51" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 51
  store i8 114, i8* %"str_char_51"
  %"str_char_52" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 52
  store i8 101, i8* %"str_char_52"
  %"str_char_53" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 53
  store i8 101, i8* %"str_char_53"
  %"str_char_54" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 54
  store i8 32, i8* %"str_char_54"
  %"str_char_55" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 55
  store i8 112, i8* %"str_char_55"
  %"str_char_56" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 56
  store i8 97, i8* %"str_char_56"
  %"str_char_57" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 57
  store i8 105, i8* %"str_char_57"
  %"str_char_58" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 58
  store i8 114, i8* %"str_char_58"
  %"str_char_59" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 59
  store i8 115, i8* %"str_char_59"
  %"str_char_60" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 60
  store i8 32, i8* %"str_char_60"
  %"str_char_61" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 61
  store i8 45, i8* %"str_char_61"
  %"str_char_62" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 62
  store i8 45, i8* %"str_char_62"
  %"str_char_63" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 63
  store i8 10, i8* %"str_char_63"
  %"str_char_64" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 64
  store i8 0, i8* %"str_char_64"
  %"arg0_decay" = getelementptr [65 x i8], [65 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".87" = sext i32 1000000 to i64
  store i64 %".87", i64* %"n"
  store i1 true, i1* %"ok"
  %".90" = sext i32 0 to i64
  store i64 %".90", i64* %"k"
  %".92" = sext i32 0 to i64
  store i64 %".92", i64* %"total_bytes"
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %"op_overload_result" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result", i64* %"t0"
  br label %"while.cond"
while.cond:
  %"k.1" = load i64, i64* %"k"
  %"n.1" = load i64, i64* %"n"
  %".97" = icmp ult i64 %"k.1", %"n.1"
  br i1 %".97", label %"while.body", label %"while.end"
while.body:
  %".99" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".99", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".101" = zext i32 %"rval.1" to i64
  store i64 %".101", i64* %"rval64"
  %"rval64.1" = load i64, i64* %"rval64"
  %".103" = zext i32 4096 to i64
  %".104" = urem i64 %"rval64.1", %".103"
  %".105" = zext i32 1 to i64
  %".106" = add i64 %".104", %".105"
  store i64 %".106", i64* %"sz"
  %"sz.1" = load i64, i64* %"sz"
  %".108" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.1")
  store i64 %".108", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.1" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  br i1 %"is_null", label %"then", label %"else"
while.end:
  %"op_overload_result.1" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.1", i64* %"t1"
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [40 x i8]
  %"str_char_0.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 49, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 77, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 32, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 109, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 105, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 120, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 101, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 100, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 32, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 97, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 108, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 108, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 111, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 99, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 43, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 102, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 114, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 101, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 101, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 32, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 112, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 97, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 105, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 114, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 32, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 97, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 108, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 108, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 32, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 115, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 117, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 99, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 99, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 101, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 101, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 100, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 101, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 100, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 0, i8* %"str_char_39.1"
  %"arg1_decay" = getelementptr [40 x i8], [40 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  %"t1.1" = load i64, i64* %"t1"
  %"t0.1" = load i64, i64* %"t0"
  %".162" = sub i64 %"t1.1", %"t0.1"
  store i64 %".162", i64* %"ns"
  %"ns.1" = load i64, i64* %"ns"
  %".164" = call i64 @"standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.1")
  store i64 %".164", i64* %"ms"
  %"ns.2" = load i64, i64* %"ns"
  %".166" = call i64 @"standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.2")
  %".167" = sext i32 1000 to i64
  %".168" = srem i64 %".166", %".167"
  store i64 %".168", i64* %"us"
  %"ns.3" = load i64, i64* %"ns"
  %".170" = sext i32 1000 to i64
  %".171" = sdiv i64 %"ns.3", %".170"
  store i64 %".171", i64* %"us_elapsed"
  %"us_elapsed.1" = load i64, i64* %"us_elapsed"
  %".173" = sext i32 0 to i64
  %".174" = icmp sle i64 %"us_elapsed.1", %".173"
  br i1 %".174", label %"then.1", label %"else.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"total_bytes.1" = load i64, i64* %"total_bytes"
  %"sz.2" = load i64, i64* %"sz"
  %".114" = add i64 %"total_bytes.1", %"sz.2"
  store i64 %".114", i64* %"total_bytes"
  %"p.2" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.2")
  %"k.2" = load i64, i64* %"k"
  %".117" = add i64 %"k.2", 1
  store i64 %".117", i64* %"k"
  br label %"while.cond"
then.1:
  %".176" = sext i32 1 to i64
  store i64 %".176", i64* %"us_elapsed"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"total_bytes.2" = load i64, i64* %"total_bytes"
  %".180" = sext i32 1000 to i64
  %".181" = mul i64 %"total_bytes.2", %".180"
  %"us_elapsed.2" = load i64, i64* %"us_elapsed"
  %".182" = sdiv i64 %".181", %"us_elapsed.2"
  store i64 %".182", i64* %"kb_per_s"
  %"kb_per_s.1" = load i64, i64* %"kb_per_s"
  %".184" = sext i32 1024 to i64
  %".185" = sdiv i64 %"kb_per_s.1", %".184"
  store i64 %".185", i64* %"mbs"
  %"kb_per_s.2" = load i64, i64* %"kb_per_s"
  %".187" = sext i32 1024 to i64
  %".188" = srem i64 %"kb_per_s.2", %".187"
  %".189" = sext i32 10 to i64
  %".190" = mul i64 %".188", %".189"
  %".191" = sext i32 1024 to i64
  %".192" = sdiv i64 %".190", %".191"
  store i64 %".192", i64* %"mbs_frac"
  %"str_stack.2" = alloca [15 x i8]
  %"str_char_0.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 32, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 32, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 116, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 105, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 109, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 58, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 32, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 32, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 32, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 32, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 0, i8* %"str_char_14.2"
  %"arg0_decay.1" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"ms.1" = load i64, i64* %"ms"
  %".210" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".211" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"ms.1", i8* %".210")
  %".212" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".212")
  %"str_stack.3" = alloca [2 x i8]
  %"str_char_0.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 46, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 0, i8* %"str_char_1.3"
  %"arg0_decay.2" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.2")
  %"us.1" = load i64, i64* %"us"
  %".217" = sext i32 100 to i64
  %".218" = icmp slt i64 %"us.1", %".217"
  br i1 %".218", label %"then.2", label %"else.2"
then.2:
  %"str_stack.4" = alloca [2 x i8]
  %"str_char_0.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 48, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 0, i8* %"str_char_1.4"
  %"arg0_decay.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.3")
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"us.2" = load i64, i64* %"us"
  %".225" = sext i32 10 to i64
  %".226" = icmp slt i64 %"us.2", %".225"
  br i1 %".226", label %"then.3", label %"else.3"
then.3:
  %"str_stack.5" = alloca [2 x i8]
  %"str_char_0.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 48, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 0, i8* %"str_char_1.5"
  %"arg0_decay.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.4")
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"us.3" = load i64, i64* %"us"
  %".233" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".234" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"us.3", i8* %".233")
  %".235" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".235")
  %"str_stack.6" = alloca [5 x i8]
  %"str_char_0.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 32, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 109, i8* %"str_char_1.6"
  %"str_char_2.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 115, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 10, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 0, i8* %"str_char_4.3"
  %"arg0_decay.5" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.5")
  %"str_stack.7" = alloca [15 x i8]
  %"str_char_0.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 32, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 32, i8* %"str_char_1.7"
  %"str_char_2.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 116, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 104, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 114, i8* %"str_char_4.4"
  %"str_char_5.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 111, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 117, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 103, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 104, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 112, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 117, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 116, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 58, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 32, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 0, i8* %"str_char_14.3"
  %"arg0_decay.6" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.6")
  %"mbs.1" = load i64, i64* %"mbs"
  %".259" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".260" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs.1", i8* %".259")
  %".261" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".261")
  %"str_stack.8" = alloca [2 x i8]
  %"str_char_0.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 46, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 0, i8* %"str_char_1.8"
  %"arg0_decay.7" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.7")
  %"mbs_frac.1" = load i64, i64* %"mbs_frac"
  %".266" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".267" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs_frac.1", i8* %".266")
  %".268" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".268")
  %"str_stack.9" = alloca [7 x i8]
  %"str_char_0.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  store i8 32, i8* %"str_char_0.9"
  %"str_char_1.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 1
  store i8 77, i8* %"str_char_1.9"
  %"str_char_2.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 2
  store i8 66, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 3
  store i8 47, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 4
  store i8 115, i8* %"str_char_4.5"
  %"str_char_5.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 5
  store i8 10, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 6
  store i8 0, i8* %"str_char_6.4"
  %"arg0_decay.8" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.8")
  ret void
}

define void @"test_throughput_fastpath__0__ret_voidE1"()
{
entry:
  %"t0" = alloca i64
  store i64 0, i64* %"t0"
  %"t1" = alloca i64
  store i64 0, i64* %"t1"
  %"ns" = alloca i64
  store i64 0, i64* %"ns"
  %"ms" = alloca i64
  store i64 0, i64* %"ms"
  %"us" = alloca i64
  store i64 0, i64* %"us"
  %"mbs" = alloca i64
  store i64 0, i64* %"mbs"
  %"mbs_frac" = alloca i64
  store i64 0, i64* %"mbs_frac"
  %"kb_per_s" = alloca i64
  store i64 0, i64* %"kb_per_s"
  %"us_elapsed" = alloca i64
  store i64 0, i64* %"us_elapsed"
  %"k" = alloca i64
  store i64 0, i64* %"k"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"str_stack" = alloca [64 x i8]
  %"str_char_0" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 3
  store i8 116, i8* %"str_char_3"
  %"str_char_4" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 4
  store i8 104, i8* %"str_char_4"
  %"str_char_5" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 5
  store i8 114, i8* %"str_char_5"
  %"str_char_6" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 6
  store i8 111, i8* %"str_char_6"
  %"str_char_7" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 7
  store i8 117, i8* %"str_char_7"
  %"str_char_8" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 8
  store i8 103, i8* %"str_char_8"
  %"str_char_9" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 9
  store i8 104, i8* %"str_char_9"
  %"str_char_10" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 10
  store i8 112, i8* %"str_char_10"
  %"str_char_11" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 11
  store i8 117, i8* %"str_char_11"
  %"str_char_12" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 12
  store i8 116, i8* %"str_char_12"
  %"str_char_13" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 13
  store i8 58, i8* %"str_char_13"
  %"str_char_14" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 14
  store i8 32, i8* %"str_char_14"
  %"str_char_15" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 15
  store i8 102, i8* %"str_char_15"
  %"str_char_16" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 16
  store i8 97, i8* %"str_char_16"
  %"str_char_17" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 17
  store i8 115, i8* %"str_char_17"
  %"str_char_18" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 18
  store i8 116, i8* %"str_char_18"
  %"str_char_19" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 19
  store i8 45, i8* %"str_char_19"
  %"str_char_20" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 20
  store i8 112, i8* %"str_char_20"
  %"str_char_21" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 21
  store i8 97, i8* %"str_char_21"
  %"str_char_22" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 22
  store i8 116, i8* %"str_char_22"
  %"str_char_23" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 23
  store i8 104, i8* %"str_char_23"
  %"str_char_24" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 24
  store i8 32, i8* %"str_char_24"
  %"str_char_25" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 25
  store i8 98, i8* %"str_char_25"
  %"str_char_26" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 26
  store i8 105, i8* %"str_char_26"
  %"str_char_27" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 27
  store i8 110, i8* %"str_char_27"
  %"str_char_28" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 28
  store i8 32, i8* %"str_char_28"
  %"str_char_29" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 29
  store i8 114, i8* %"str_char_29"
  %"str_char_30" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 30
  store i8 101, i8* %"str_char_30"
  %"str_char_31" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 31
  store i8 117, i8* %"str_char_31"
  %"str_char_32" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 32
  store i8 115, i8* %"str_char_32"
  %"str_char_33" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 33
  store i8 101, i8* %"str_char_33"
  %"str_char_34" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 34
  store i8 32, i8* %"str_char_34"
  %"str_char_35" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 35
  store i8 40, i8* %"str_char_35"
  %"str_char_36" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 36
  store i8 49, i8* %"str_char_36"
  %"str_char_37" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 37
  store i8 77, i8* %"str_char_37"
  %"str_char_38" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 38
  store i8 32, i8* %"str_char_38"
  %"str_char_39" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 39
  store i8 120, i8* %"str_char_39"
  %"str_char_40" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 40
  store i8 32, i8* %"str_char_40"
  %"str_char_41" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 41
  store i8 54, i8* %"str_char_41"
  %"str_char_42" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 42
  store i8 52, i8* %"str_char_42"
  %"str_char_43" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 43
  store i8 45, i8* %"str_char_43"
  %"str_char_44" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 44
  store i8 98, i8* %"str_char_44"
  %"str_char_45" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 45
  store i8 121, i8* %"str_char_45"
  %"str_char_46" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 46
  store i8 116, i8* %"str_char_46"
  %"str_char_47" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 47
  store i8 101, i8* %"str_char_47"
  %"str_char_48" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 48
  store i8 44, i8* %"str_char_48"
  %"str_char_49" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 49
  store i8 32, i8* %"str_char_49"
  %"str_char_50" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 50
  store i8 119, i8* %"str_char_50"
  %"str_char_51" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 51
  store i8 97, i8* %"str_char_51"
  %"str_char_52" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 52
  store i8 114, i8* %"str_char_52"
  %"str_char_53" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 53
  store i8 109, i8* %"str_char_53"
  %"str_char_54" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 54
  store i8 32, i8* %"str_char_54"
  %"str_char_55" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 55
  store i8 98, i8* %"str_char_55"
  %"str_char_56" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 56
  store i8 105, i8* %"str_char_56"
  %"str_char_57" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 57
  store i8 110, i8* %"str_char_57"
  %"str_char_58" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 58
  store i8 41, i8* %"str_char_58"
  %"str_char_59" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 59
  store i8 32, i8* %"str_char_59"
  %"str_char_60" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 60
  store i8 45, i8* %"str_char_60"
  %"str_char_61" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 61
  store i8 45, i8* %"str_char_61"
  %"str_char_62" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 62
  store i8 10, i8* %"str_char_62"
  %"str_char_63" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 63
  store i8 0, i8* %"str_char_63"
  %"arg0_decay" = getelementptr [64 x i8], [64 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".81" = sext i32 1000000 to i64
  store i64 %".81", i64* %"n"
  store i1 true, i1* %"ok"
  %".84" = sext i32 0 to i64
  store i64 %".84", i64* %"k"
  %".86" = sext i32 64 to i64
  %".87" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".86")
  store i64 %".87", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.1")
  %"op_overload_result" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result", i64* %"t0"
  br label %"while.cond"
while.cond:
  %"k.1" = load i64, i64* %"k"
  %"n.1" = load i64, i64* %"n"
  %".92" = icmp ult i64 %"k.1", %"n.1"
  br i1 %".92", label %"while.body", label %"while.end"
while.body:
  %".94" = sext i32 64 to i64
  %".95" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".94")
  store i64 %".95", i64* %"p"
  %"p.2" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.2" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  br i1 %"is_null", label %"then", label %"else"
while.end:
  %"op_overload_result.1" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.1", i64* %"t1"
  %"ok.1" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [44 x i8]
  %"str_char_0.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 49, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 77, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 32, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 102, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 97, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 115, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 116, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 45, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 112, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 97, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 116, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 104, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 32, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 98, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 105, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 110, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 45, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 114, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 101, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 117, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 115, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 101, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 32, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 99, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 121, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 99, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 108, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 101, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 115, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 32, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 97, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 108, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 108, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 32, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 115, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 117, i8* %"str_char_35.1"
  %"str_char_36.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 99, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 99, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 101, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 101, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 40
  store i8 100, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 41
  store i8 101, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 42
  store i8 100, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 43
  store i8 0, i8* %"str_char_43.1"
  %"arg1_decay" = getelementptr [44 x i8], [44 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.1", i8* %"arg1_decay")
  %"t1.1" = load i64, i64* %"t1"
  %"t0.1" = load i64, i64* %"t0"
  %".151" = sub i64 %"t1.1", %"t0.1"
  store i64 %".151", i64* %"ns"
  %"ns.1" = load i64, i64* %"ns"
  %".153" = call i64 @"standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.1")
  store i64 %".153", i64* %"ms"
  %"ns.2" = load i64, i64* %"ns"
  %".155" = call i64 @"standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64"(i64 %"ns.2")
  %".156" = sext i32 1000 to i64
  %".157" = srem i64 %".155", %".156"
  store i64 %".157", i64* %"us"
  %"ns.3" = load i64, i64* %"ns"
  %".159" = sext i32 1000 to i64
  %".160" = sdiv i64 %"ns.3", %".159"
  store i64 %".160", i64* %"us_elapsed"
  %"us_elapsed.1" = load i64, i64* %"us_elapsed"
  %".162" = sext i32 0 to i64
  %".163" = icmp sle i64 %"us_elapsed.1", %".162"
  br i1 %".163", label %"then.1", label %"else.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"p.3" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.3")
  %"k.2" = load i64, i64* %"k"
  %".102" = add i64 %"k.2", 1
  store i64 %".102", i64* %"k"
  br label %"while.cond"
then.1:
  %".165" = sext i32 1 to i64
  store i64 %".165", i64* %"us_elapsed"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"n.2" = load i64, i64* %"n"
  %".169" = sext i32 64 to i64
  %".170" = mul i64 %"n.2", %".169"
  %".171" = sext i32 1000 to i64
  %".172" = mul i64 %".170", %".171"
  %"us_elapsed.2" = load i64, i64* %"us_elapsed"
  %".173" = sdiv i64 %".172", %"us_elapsed.2"
  store i64 %".173", i64* %"kb_per_s"
  %"kb_per_s.1" = load i64, i64* %"kb_per_s"
  %".175" = sext i32 1024 to i64
  %".176" = sdiv i64 %"kb_per_s.1", %".175"
  store i64 %".176", i64* %"mbs"
  %"kb_per_s.2" = load i64, i64* %"kb_per_s"
  %".178" = sext i32 1024 to i64
  %".179" = srem i64 %"kb_per_s.2", %".178"
  %".180" = sext i32 10 to i64
  %".181" = mul i64 %".179", %".180"
  %".182" = sext i32 1024 to i64
  %".183" = sdiv i64 %".181", %".182"
  store i64 %".183", i64* %"mbs_frac"
  %"str_stack.2" = alloca [15 x i8]
  %"str_char_0.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 32, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 32, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 116, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 105, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 109, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 101, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 58, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 32, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 32, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 32, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 32, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 32, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 0, i8* %"str_char_14.2"
  %"arg0_decay.1" = getelementptr [15 x i8], [15 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  %"ms.1" = load i64, i64* %"ms"
  %".201" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".202" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"ms.1", i8* %".201")
  %".203" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".203")
  %"str_stack.3" = alloca [2 x i8]
  %"str_char_0.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 46, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 0, i8* %"str_char_1.3"
  %"arg0_decay.2" = getelementptr [2 x i8], [2 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.2")
  %"us.1" = load i64, i64* %"us"
  %".208" = sext i32 100 to i64
  %".209" = icmp slt i64 %"us.1", %".208"
  br i1 %".209", label %"then.2", label %"else.2"
then.2:
  %"str_stack.4" = alloca [2 x i8]
  %"str_char_0.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 48, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 0, i8* %"str_char_1.4"
  %"arg0_decay.3" = getelementptr [2 x i8], [2 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.3")
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"us.2" = load i64, i64* %"us"
  %".216" = sext i32 10 to i64
  %".217" = icmp slt i64 %"us.2", %".216"
  br i1 %".217", label %"then.3", label %"else.3"
then.3:
  %"str_stack.5" = alloca [2 x i8]
  %"str_char_0.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 48, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 0, i8* %"str_char_1.5"
  %"arg0_decay.4" = getelementptr [2 x i8], [2 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.4")
  br label %"ifcont.3"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %"us.3" = load i64, i64* %"us"
  %".224" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".225" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"us.3", i8* %".224")
  %".226" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".226")
  %"str_stack.6" = alloca [5 x i8]
  %"str_char_0.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 32, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 109, i8* %"str_char_1.6"
  %"str_char_2.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 115, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 10, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 0, i8* %"str_char_4.3"
  %"arg0_decay.5" = getelementptr [5 x i8], [5 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.5")
  %"str_stack.7" = alloca [15 x i8]
  %"str_char_0.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 32, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 32, i8* %"str_char_1.7"
  %"str_char_2.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 116, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 104, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 114, i8* %"str_char_4.4"
  %"str_char_5.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 111, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 117, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 103, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 104, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 112, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 117, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 116, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 58, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 32, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 0, i8* %"str_char_14.3"
  %"arg0_decay.6" = getelementptr [15 x i8], [15 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.6")
  %"mbs.1" = load i64, i64* %"mbs"
  %".250" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".251" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs.1", i8* %".250")
  %".252" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".252")
  %"str_stack.8" = alloca [2 x i8]
  %"str_char_0.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 46, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 0, i8* %"str_char_1.8"
  %"arg0_decay.7" = getelementptr [2 x i8], [2 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.7")
  %"mbs_frac.1" = load i64, i64* %"mbs_frac"
  %".257" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".258" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs_frac.1", i8* %".257")
  %".259" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".259")
  %"str_stack.9" = alloca [7 x i8]
  %"str_char_0.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  store i8 32, i8* %"str_char_0.9"
  %"str_char_1.9" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 1
  store i8 77, i8* %"str_char_1.9"
  %"str_char_2.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 2
  store i8 66, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 3
  store i8 47, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 4
  store i8 115, i8* %"str_char_4.5"
  %"str_char_5.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 5
  store i8 10, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 6
  store i8 0, i8* %"str_char_6.4"
  %"arg0_decay.8" = getelementptr [7 x i8], [7 x i8]* %"str_stack.9", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.8")
  ret void
}

define void @"bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1"(i8* %"what", i64 %"bytes", i64 %"ns")
{
entry:
  %"what.addr" = alloca i8*
  store i8* %"what", i8** %"what.addr"
  %"bytes.addr" = alloca i64
  store i64 %"bytes", i64* %"bytes.addr"
  %"ns.addr" = alloca i64
  store i64 %"ns", i64* %"ns.addr"
  %"us" = alloca i64
  store i64 0, i64* %"us"
  %"mbs" = alloca i64
  store i64 0, i64* %"mbs"
  %"frac" = alloca i64
  store i64 0, i64* %"frac"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"ns.1" = load i64, i64* %"ns.addr"
  %".12" = sext i32 1000 to i64
  %".13" = sdiv i64 %"ns.1", %".12"
  store i64 %".13", i64* %"us"
  %"us.1" = load i64, i64* %"us"
  %".15" = sext i32 0 to i64
  %".16" = icmp sle i64 %"us.1", %".15"
  br i1 %".16", label %"then", label %"else"
then:
  %".18" = sext i32 1 to i64
  store i64 %".18", i64* %"us"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"bytes.1" = load i64, i64* %"bytes.addr"
  %".22" = sext i32 1000000 to i64
  %".23" = mul i64 %"bytes.1", %".22"
  %"us.2" = load i64, i64* %"us"
  %".24" = sdiv i64 %".23", %"us.2"
  %".25" = sext i32 1048576 to i64
  %".26" = sdiv i64 %".24", %".25"
  store i64 %".26", i64* %"mbs"
  %"bytes.2" = load i64, i64* %"bytes.addr"
  %".28" = sext i32 1000000 to i64
  %".29" = mul i64 %"bytes.2", %".28"
  %"us.3" = load i64, i64* %"us"
  %".30" = sdiv i64 %".29", %"us.3"
  %".31" = sext i32 1048576 to i64
  %".32" = srem i64 %".30", %".31"
  %".33" = sext i32 10 to i64
  %".34" = mul i64 %".32", %".33"
  %".35" = sext i32 1048576 to i64
  %".36" = sdiv i64 %".34", %".35"
  store i64 %".36", i64* %"frac"
  %"what.1" = load i8*, i8** %"what.addr"
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"what.1")
  %"mbs.1" = load i64, i64* %"mbs"
  %".39" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".40" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"mbs.1", i8* %".39")
  %".41" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".41")
  %"str_stack" = alloca [2 x i8]
  %"str_char_0" = getelementptr [2 x i8], [2 x i8]* %"str_stack", i32 0, i32 0
  store i8 46, i8* %"str_char_0"
  %"str_char_1" = getelementptr [2 x i8], [2 x i8]* %"str_stack", i32 0, i32 1
  store i8 0, i8* %"str_char_1"
  %"arg0_decay" = getelementptr [2 x i8], [2 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %"frac.1" = load i64, i64* %"frac"
  %".46" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  %".47" = call i64 @"standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64"(i64 %"frac.1", i8* %".46")
  %".48" = getelementptr inbounds [64 x i8], [64 x i8]* %"buf", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %".48")
  %"str_stack.1" = alloca [7 x i8]
  %"str_char_0.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 32, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 77, i8* %"str_char_1.1"
  %"str_char_2" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 66, i8* %"str_char_2"
  %"str_char_3" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 47, i8* %"str_char_3"
  %"str_char_4" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 115, i8* %"str_char_4"
  %"str_char_5" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 10, i8* %"str_char_5"
  %"str_char_6" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 0, i8* %"str_char_6"
  %"arg0_decay.1" = getelementptr [7 x i8], [7 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  ret void
}

define void @"test_bandwidth__0__ret_voidE1"()
{
entry:
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"t0" = alloca i64
  store i64 0, i64* %"t0"
  %"t1" = alloca i64
  store i64 0, i64* %"t1"
  %"touched" = alloca i64
  store i64 0, i64* %"touched"
  %"ns" = alloca i64
  store i64 0, i64* %"ns"
  %"k" = alloca i64
  store i64 0, i64* %"k"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"w" = alloca i64
  store i64 0, i64* %"w"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"rounds" = alloca i64
  store i64 0, i64* %"rounds"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"sum" = alloca i64
  store i64 0, i64* %"sum"
  %"expect" = alloca i64
  store i64 0, i64* %"expect"
  %"q" = alloca i64*
  store i64* null, i64** %"q"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"buf" = alloca [64 x i8]
  store [64 x i8] zeroinitializer, [64 x i8]* %"buf"
  %"str_stack" = alloca [46 x i8]
  %"str_char_0" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 3
  store i8 98, i8* %"str_char_3"
  %"str_char_4" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 4
  store i8 97, i8* %"str_char_4"
  %"str_char_5" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 5
  store i8 110, i8* %"str_char_5"
  %"str_char_6" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 6
  store i8 100, i8* %"str_char_6"
  %"str_char_7" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 7
  store i8 119, i8* %"str_char_7"
  %"str_char_8" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 8
  store i8 105, i8* %"str_char_8"
  %"str_char_9" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 9
  store i8 100, i8* %"str_char_9"
  %"str_char_10" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 10
  store i8 116, i8* %"str_char_10"
  %"str_char_11" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 11
  store i8 104, i8* %"str_char_11"
  %"str_char_12" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 12
  store i8 58, i8* %"str_char_12"
  %"str_char_13" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 13
  store i8 32, i8* %"str_char_13"
  %"str_char_14" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 14
  store i8 98, i8* %"str_char_14"
  %"str_char_15" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 15
  store i8 121, i8* %"str_char_15"
  %"str_char_16" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 16
  store i8 116, i8* %"str_char_16"
  %"str_char_17" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 17
  store i8 101, i8* %"str_char_17"
  %"str_char_18" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 18
  store i8 115, i8* %"str_char_18"
  %"str_char_19" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 19
  store i8 32, i8* %"str_char_19"
  %"str_char_20" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 20
  store i8 119, i8* %"str_char_20"
  %"str_char_21" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 21
  store i8 114, i8* %"str_char_21"
  %"str_char_22" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 22
  store i8 105, i8* %"str_char_22"
  %"str_char_23" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 23
  store i8 116, i8* %"str_char_23"
  %"str_char_24" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 24
  store i8 116, i8* %"str_char_24"
  %"str_char_25" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 25
  store i8 101, i8* %"str_char_25"
  %"str_char_26" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 26
  store i8 110, i8* %"str_char_26"
  %"str_char_27" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 27
  store i8 32, i8* %"str_char_27"
  %"str_char_28" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 28
  store i8 97, i8* %"str_char_28"
  %"str_char_29" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 29
  store i8 110, i8* %"str_char_29"
  %"str_char_30" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 30
  store i8 100, i8* %"str_char_30"
  %"str_char_31" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 31
  store i8 32, i8* %"str_char_31"
  %"str_char_32" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 32
  store i8 114, i8* %"str_char_32"
  %"str_char_33" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 33
  store i8 101, i8* %"str_char_33"
  %"str_char_34" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 34
  store i8 97, i8* %"str_char_34"
  %"str_char_35" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 35
  store i8 100, i8* %"str_char_35"
  %"str_char_36" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 36
  store i8 32, i8* %"str_char_36"
  %"str_char_37" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 37
  store i8 98, i8* %"str_char_37"
  %"str_char_38" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 38
  store i8 97, i8* %"str_char_38"
  %"str_char_39" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 39
  store i8 99, i8* %"str_char_39"
  %"str_char_40" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 40
  store i8 107, i8* %"str_char_40"
  %"str_char_41" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 41
  store i8 32, i8* %"str_char_41"
  %"str_char_42" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 42
  store i8 45, i8* %"str_char_42"
  %"str_char_43" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 43
  store i8 45, i8* %"str_char_43"
  %"str_char_44" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 44
  store i8 10, i8* %"str_char_44"
  %"str_char_45" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 45
  store i8 0, i8* %"str_char_45"
  %"arg0_decay" = getelementptr [46 x i8], [46 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".68" = sext i32 1000000 to i64
  store i64 %".68", i64* %"n"
  store i1 true, i1* %"ok"
  %".71" = sext i32 0 to i64
  store i64 %".71", i64* %"k"
  %".73" = sext i32 0 to i64
  store i64 %".73", i64* %"sum"
  %".75" = sext i32 0 to i64
  store i64 %".75", i64* %"expect"
  %".77" = sext i32 0 to i64
  store i64 %".77", i64* %"touched"
  %"op_overload_result" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result", i64* %"t0"
  br label %"while.cond"
while.cond:
  %"k.1" = load i64, i64* %"k"
  %"n.1" = load i64, i64* %"n"
  %".81" = icmp ult i64 %"k.1", %"n.1"
  br i1 %".81", label %"while.body", label %"while.end"
while.body:
  %".83" = sext i32 64 to i64
  %".84" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".83")
  store i64 %".84", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"int_to_ptr" = inttoptr i64 %"p.1" to i8*
  %"is_null" = icmp eq i8* %"int_to_ptr", null
  br i1 %"is_null", label %"then", label %"else"
while.end:
  %"op_overload_result.1" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.1", i64* %"t1"
  %"ok.1" = load i1, i1* %"ok"
  br i1 %"ok.1", label %"sc_rhs", label %"sc_end"
then:
  store i1 false, i1* %"ok"
  br label %"while.end"
else:
  br label %"ifcont"
ifcont:
  %"p.2" = load i64, i64* %"p"
  %"int_to_ptr.1" = inttoptr i64 %"p.2" to i64*
  store i64* %"int_to_ptr.1", i64** %"q"
  %".91" = sext i32 0 to i64
  store i64 %".91", i64* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j.1" = load i64, i64* %"j"
  %".94" = zext i32 8 to i64
  %".95" = icmp ult i64 %"j.1", %".94"
  br i1 %".95", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"k.2" = load i64, i64* %"k"
  %"j.2" = load i64, i64* %"j"
  %".97" = add i64 %"k.2", %"j.2"
  %"q.1" = load i64*, i64** %"q"
  %"j.3" = load i64, i64* %"j"
  %".98" = getelementptr inbounds i64, i64* %"q.1", i64 %"j.3"
  store i64 %".97", i64* %".98"
  %"j.4" = load i64, i64* %"j"
  %".100" = add i64 %"j.4", 1
  store i64 %".100", i64* %"j"
  br label %"while.cond.1"
while.end.1:
  %".103" = sext i32 0 to i64
  store i64 %".103", i64* %"j"
  br label %"while.cond.2"
while.cond.2:
  %"j.5" = load i64, i64* %"j"
  %".106" = zext i32 8 to i64
  %".107" = icmp ult i64 %"j.5", %".106"
  br i1 %".107", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"sum.1" = load i64, i64* %"sum"
  %"q.2" = load i64*, i64** %"q"
  %"j.6" = load i64, i64* %"j"
  %"idx_trunc" = trunc i64 %"j.6" to i32
  %"ptr_gep" = getelementptr inbounds i64, i64* %"q.2", i32 %"idx_trunc"
  %"ptr_load" = load i64, i64* %"ptr_gep"
  %".109" = add i64 %"sum.1", %"ptr_load"
  store i64 %".109", i64* %"sum"
  %"j.7" = load i64, i64* %"j"
  %".111" = add i64 %"j.7", 1
  store i64 %".111", i64* %"j"
  br label %"while.cond.2"
while.end.2:
  %"expect.1" = load i64, i64* %"expect"
  %"k.3" = load i64, i64* %"k"
  %".114" = zext i32 8 to i64
  %".115" = mul i64 %"k.3", %".114"
  %".116" = add i64 %"expect.1", %".115"
  %".117" = zext i32 28 to i64
  %".118" = add i64 %".116", %".117"
  store i64 %".118", i64* %"expect"
  %"p.3" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.3")
  %"touched.1" = load i64, i64* %"touched"
  %".121" = sext i32 128 to i64
  %".122" = add i64 %"touched.1", %".121"
  store i64 %".122", i64* %"touched"
  %"k.4" = load i64, i64* %"k"
  %".124" = add i64 %"k.4", 1
  store i64 %".124", i64* %"k"
  br label %"while.cond"
sc_rhs:
  %"sum.2" = load i64, i64* %"sum"
  %"expect.2" = load i64, i64* %"expect"
  %".129" = icmp eq i64 %"sum.2", %"expect.2"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.end"], [%".129", %"sc_rhs"]
  %"str_stack.1" = alloca [35 x i8]
  %"str_char_0.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 54, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 52, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 45, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 98, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 121, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 116, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 101, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 32, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 119, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 114, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 105, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 116, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 101, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 47, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 114, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 101, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 97, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 100, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 45, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 98, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 97, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 99, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 107, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 32, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 115, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 117, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 109, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 115, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 32, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 109, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 97, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 116, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 99, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 104, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 0, i8* %"str_char_34.1"
  %"arg1_decay" = getelementptr [35 x i8], [35 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"sc_result", i8* %"arg1_decay")
  %"str_stack.2" = alloca [19 x i8]
  %"str_char_0.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 32, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 32, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 54, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 52, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 45, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 98, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 121, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 116, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 101, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 32, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 112, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 97, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 105, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 114, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 115, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 58, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 32, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 32, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 0, i8* %"str_char_18.2"
  %"touched.2" = load i64, i64* %"touched"
  %"t1.1" = load i64, i64* %"t1"
  %"t0.1" = load i64, i64* %"t0"
  %".186" = sub i64 %"t1.1", %"t0.1"
  %"arg0_decay.1" = getelementptr [19 x i8], [19 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1"(i8* %"arg0_decay.1", i64 %"touched.2", i64 %".186")
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %".189" = sext i32 0 to i64
  store i64 %".189", i64* %"k"
  %".191" = sext i32 0 to i64
  store i64 %".191", i64* %"sum"
  %".193" = sext i32 0 to i64
  store i64 %".193", i64* %"expect"
  %".195" = sext i32 0 to i64
  store i64 %".195", i64* %"touched"
  %"op_overload_result.2" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.2", i64* %"t0"
  br label %"while.cond.3"
while.cond.3:
  %"k.5" = load i64, i64* %"k"
  %"n.2" = load i64, i64* %"n"
  %".199" = icmp ult i64 %"k.5", %"n.2"
  br i1 %".199", label %"while.body.3", label %"while.end.3"
while.body.3:
  %".201" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".201", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".203" = zext i32 %"rval.1" to i64
  store i64 %".203", i64* %"rval64"
  %"rval64.1" = load i64, i64* %"rval64"
  %".205" = zext i32 4096 to i64
  %".206" = urem i64 %"rval64.1", %".205"
  %".207" = zext i32 1 to i64
  %".208" = add i64 %".206", %".207"
  store i64 %".208", i64* %"sz"
  %"sz.1" = load i64, i64* %"sz"
  %".210" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.1")
  store i64 %".210", i64* %"p"
  %"p.4" = load i64, i64* %"p"
  %"int_to_ptr.2" = inttoptr i64 %"p.4" to i8*
  %"is_null.1" = icmp eq i8* %"int_to_ptr.2", null
  br i1 %"is_null.1", label %"then.1", label %"else.1"
while.end.3:
  %"op_overload_result.3" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.3", i64* %"t1"
  %"ok.2" = load i1, i1* %"ok"
  br i1 %"ok.2", label %"sc_rhs.1", label %"sc_end.1"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.3"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"p.5" = load i64, i64* %"p"
  %"int_to_ptr.3" = inttoptr i64 %"p.5" to i64*
  store i64* %"int_to_ptr.3", i64** %"q"
  %"sz.2" = load i64, i64* %"sz"
  %".217" = zext i32 8 to i64
  %".218" = udiv i64 %"sz.2", %".217"
  store i64 %".218", i64* %"w"
  %"w.1" = load i64, i64* %"w"
  %".220" = zext i32 0 to i64
  %".221" = icmp eq i64 %"w.1", %".220"
  br i1 %".221", label %"then.2", label %"else.2"
then.2:
  %".223" = sext i32 1 to i64
  store i64 %".223", i64* %"w"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %".227" = sext i32 0 to i64
  store i64 %".227", i64* %"j"
  br label %"while.cond.4"
while.cond.4:
  %"j.8" = load i64, i64* %"j"
  %"w.2" = load i64, i64* %"w"
  %".230" = icmp ult i64 %"j.8", %"w.2"
  br i1 %".230", label %"while.body.4", label %"while.end.4"
while.body.4:
  %"k.6" = load i64, i64* %"k"
  %"j.9" = load i64, i64* %"j"
  %".232" = add i64 %"k.6", %"j.9"
  %"q.3" = load i64*, i64** %"q"
  %"j.10" = load i64, i64* %"j"
  %".233" = getelementptr inbounds i64, i64* %"q.3", i64 %"j.10"
  store i64 %".232", i64* %".233"
  %"j.11" = load i64, i64* %"j"
  %".235" = add i64 %"j.11", 1
  store i64 %".235", i64* %"j"
  br label %"while.cond.4"
while.end.4:
  %".238" = sext i32 0 to i64
  store i64 %".238", i64* %"j"
  br label %"while.cond.5"
while.cond.5:
  %"j.12" = load i64, i64* %"j"
  %"w.3" = load i64, i64* %"w"
  %".241" = icmp ult i64 %"j.12", %"w.3"
  br i1 %".241", label %"while.body.5", label %"while.end.5"
while.body.5:
  %"sum.3" = load i64, i64* %"sum"
  %"q.4" = load i64*, i64** %"q"
  %"j.13" = load i64, i64* %"j"
  %"idx_trunc.1" = trunc i64 %"j.13" to i32
  %"ptr_gep.1" = getelementptr inbounds i64, i64* %"q.4", i32 %"idx_trunc.1"
  %"ptr_load.1" = load i64, i64* %"ptr_gep.1"
  %".243" = add i64 %"sum.3", %"ptr_load.1"
  store i64 %".243", i64* %"sum"
  %"j.14" = load i64, i64* %"j"
  %".245" = add i64 %"j.14", 1
  store i64 %".245", i64* %"j"
  br label %"while.cond.5"
while.end.5:
  %"expect.3" = load i64, i64* %"expect"
  %"k.7" = load i64, i64* %"k"
  %"w.4" = load i64, i64* %"w"
  %".248" = mul i64 %"k.7", %"w.4"
  %".249" = add i64 %"expect.3", %".248"
  %"w.5" = load i64, i64* %"w"
  %"w.6" = load i64, i64* %"w"
  %".250" = zext i32 1 to i64
  %".251" = sub i64 %"w.6", %".250"
  %".252" = mul i64 %"w.5", %".251"
  %".253" = zext i32 2 to i64
  %".254" = udiv i64 %".252", %".253"
  %".255" = add i64 %".249", %".254"
  store i64 %".255", i64* %"expect"
  %"p.6" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.6")
  %"touched.3" = load i64, i64* %"touched"
  %"w.7" = load i64, i64* %"w"
  %".258" = sext i32 16 to i64
  %".259" = mul i64 %"w.7", %".258"
  %".260" = add i64 %"touched.3", %".259"
  store i64 %".260", i64* %"touched"
  %"k.8" = load i64, i64* %"k"
  %".262" = add i64 %"k.8", 1
  store i64 %".262", i64* %"k"
  br label %"while.cond.3"
sc_rhs.1:
  %"sum.4" = load i64, i64* %"sum"
  %"expect.4" = load i64, i64* %"expect"
  %".267" = icmp eq i64 %"sum.4", %"expect.4"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [0, %"while.end.3"], [%".267", %"sc_rhs.1"]
  %"str_stack.3" = alloca [33 x i8]
  %"str_char_0.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 109, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 105, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 120, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 101, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 100, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 32, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 119, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 114, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 105, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 116, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 101, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 47, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 114, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 101, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 97, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 100, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 45, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 98, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 97, i8* %"str_char_18.3"
  %"str_char_19.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 99, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 107, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 32, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 115, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 117, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 109, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 115, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 109, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 97, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 116, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 99, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 104, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 0, i8* %"str_char_32.2"
  %"arg1_decay.1" = getelementptr [33 x i8], [33 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"sc_result.1", i8* %"arg1_decay.1")
  %"str_stack.4" = alloca [19 x i8]
  %"str_char_0.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 0
  store i8 32, i8* %"str_char_0.4"
  %"str_char_1.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 1
  store i8 32, i8* %"str_char_1.4"
  %"str_char_2.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 2
  store i8 109, i8* %"str_char_2.4"
  %"str_char_3.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 3
  store i8 105, i8* %"str_char_3.4"
  %"str_char_4.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 4
  store i8 120, i8* %"str_char_4.4"
  %"str_char_5.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 5
  store i8 101, i8* %"str_char_5.4"
  %"str_char_6.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 6
  store i8 100, i8* %"str_char_6.4"
  %"str_char_7.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 7
  store i8 32, i8* %"str_char_7.4"
  %"str_char_8.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 8
  store i8 112, i8* %"str_char_8.4"
  %"str_char_9.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 9
  store i8 97, i8* %"str_char_9.4"
  %"str_char_10.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 10
  store i8 105, i8* %"str_char_10.4"
  %"str_char_11.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 11
  store i8 114, i8* %"str_char_11.4"
  %"str_char_12.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 12
  store i8 115, i8* %"str_char_12.4"
  %"str_char_13.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 13
  store i8 58, i8* %"str_char_13.4"
  %"str_char_14.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 14
  store i8 32, i8* %"str_char_14.4"
  %"str_char_15.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 15
  store i8 32, i8* %"str_char_15.4"
  %"str_char_16.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 16
  store i8 32, i8* %"str_char_16.4"
  %"str_char_17.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 17
  store i8 32, i8* %"str_char_17.4"
  %"str_char_18.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 18
  store i8 0, i8* %"str_char_18.4"
  %"touched.4" = load i64, i64* %"touched"
  %"t1.2" = load i64, i64* %"t1"
  %"t0.2" = load i64, i64* %"t0"
  %".322" = sub i64 %"t1.2", %"t0.2"
  %"arg0_decay.2" = getelementptr [19 x i8], [19 x i8]* %"str_stack.4", i32 0, i32 0
  call void @"bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1"(i8* %"arg0_decay.2", i64 %"touched.4", i64 %".322")
  %".324" = mul i32 64, 1024
  %".325" = mul i32 %".324", 1024
  %".326" = sext i32 %".325" to i64
  store i64 %".326", i64* %"sz"
  %"sz.3" = load i64, i64* %"sz"
  %".328" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"sz.3")
  store i64 %".328", i64* %"p"
  %"p.7" = load i64, i64* %"p"
  %".330" = zext i32 0 to i64
  %".331" = icmp ne i64 %"p.7", %".330"
  %"str_stack.5" = alloca [22 x i8]
  %"str_char_0.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 0
  store i8 54, i8* %"str_char_0.5"
  %"str_char_1.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 1
  store i8 52, i8* %"str_char_1.5"
  %"str_char_2.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 2
  store i8 32, i8* %"str_char_2.5"
  %"str_char_3.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 3
  store i8 77, i8* %"str_char_3.5"
  %"str_char_4.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 4
  store i8 66, i8* %"str_char_4.5"
  %"str_char_5.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 5
  store i8 32, i8* %"str_char_5.5"
  %"str_char_6.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 6
  store i8 98, i8* %"str_char_6.5"
  %"str_char_7.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 7
  store i8 108, i8* %"str_char_7.5"
  %"str_char_8.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 8
  store i8 111, i8* %"str_char_8.5"
  %"str_char_9.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 9
  store i8 99, i8* %"str_char_9.5"
  %"str_char_10.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 10
  store i8 107, i8* %"str_char_10.5"
  %"str_char_11.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 11
  store i8 32, i8* %"str_char_11.5"
  %"str_char_12.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 12
  store i8 97, i8* %"str_char_12.5"
  %"str_char_13.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 13
  store i8 108, i8* %"str_char_13.5"
  %"str_char_14.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 14
  store i8 108, i8* %"str_char_14.5"
  %"str_char_15.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 15
  store i8 111, i8* %"str_char_15.5"
  %"str_char_16.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 16
  store i8 99, i8* %"str_char_16.5"
  %"str_char_17.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 17
  store i8 97, i8* %"str_char_17.5"
  %"str_char_18.5" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 18
  store i8 116, i8* %"str_char_18.5"
  %"str_char_19.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 19
  store i8 101, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 20
  store i8 100, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 21
  store i8 0, i8* %"str_char_21.3"
  %"arg1_decay.2" = getelementptr [22 x i8], [22 x i8]* %"str_stack.5", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".331", i8* %"arg1_decay.2")
  %"p.8" = load i64, i64* %"p"
  %".355" = zext i32 0 to i64
  %".356" = icmp ne i64 %"p.8", %".355"
  br i1 %".356", label %"then.3", label %"else.3"
then.3:
  %"p.9" = load i64, i64* %"p"
  %"int_to_ptr.4" = inttoptr i64 %"p.9" to i64*
  store i64* %"int_to_ptr.4", i64** %"q"
  %"sz.4" = load i64, i64* %"sz"
  %".359" = zext i32 8 to i64
  %".360" = udiv i64 %"sz.4", %".359"
  store i64 %".360", i64* %"w"
  %".362" = sext i32 0 to i64
  store i64 %".362", i64* %"rounds"
  %"op_overload_result.4" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.4", i64* %"t0"
  br label %"while.cond.6"
else.3:
  br label %"ifcont.3"
ifcont.3:
  ret void
while.cond.6:
  %"rounds.1" = load i64, i64* %"rounds"
  %".366" = zext i32 4 to i64
  %".367" = icmp ult i64 %"rounds.1", %".366"
  br i1 %".367", label %"while.body.6", label %"while.end.6"
while.body.6:
  %".369" = sext i32 0 to i64
  store i64 %".369", i64* %"j"
  br label %"while.cond.7"
while.end.6:
  %"op_overload_result.5" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.5", i64* %"t1"
  %"str_stack.6" = alloca [19 x i8]
  %"str_char_0.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 0
  store i8 32, i8* %"str_char_0.6"
  %"str_char_1.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 1
  store i8 32, i8* %"str_char_1.6"
  %"str_char_2.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 2
  store i8 115, i8* %"str_char_2.6"
  %"str_char_3.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 3
  store i8 116, i8* %"str_char_3.6"
  %"str_char_4.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 4
  store i8 114, i8* %"str_char_4.6"
  %"str_char_5.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 5
  store i8 101, i8* %"str_char_5.6"
  %"str_char_6.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 6
  store i8 97, i8* %"str_char_6.6"
  %"str_char_7.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 7
  store i8 109, i8* %"str_char_7.6"
  %"str_char_8.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 8
  store i8 32, i8* %"str_char_8.6"
  %"str_char_9.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 9
  store i8 119, i8* %"str_char_9.6"
  %"str_char_10.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 10
  store i8 114, i8* %"str_char_10.6"
  %"str_char_11.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 11
  store i8 105, i8* %"str_char_11.6"
  %"str_char_12.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 12
  store i8 116, i8* %"str_char_12.6"
  %"str_char_13.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 13
  store i8 101, i8* %"str_char_13.6"
  %"str_char_14.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 14
  store i8 58, i8* %"str_char_14.6"
  %"str_char_15.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 15
  store i8 32, i8* %"str_char_15.6"
  %"str_char_16.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 16
  store i8 32, i8* %"str_char_16.6"
  %"str_char_17.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 17
  store i8 32, i8* %"str_char_17.6"
  %"str_char_18.6" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 18
  store i8 0, i8* %"str_char_18.6"
  %"sz.5" = load i64, i64* %"sz"
  %".403" = sext i32 4 to i64
  %".404" = mul i64 %"sz.5", %".403"
  %"t1.3" = load i64, i64* %"t1"
  %"t0.3" = load i64, i64* %"t0"
  %".405" = sub i64 %"t1.3", %"t0.3"
  %"arg0_decay.3" = getelementptr [19 x i8], [19 x i8]* %"str_stack.6", i32 0, i32 0
  call void @"bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1"(i8* %"arg0_decay.3", i64 %".404", i64 %".405")
  %".407" = sext i32 0 to i64
  store i64 %".407", i64* %"sum"
  %".409" = sext i32 0 to i64
  store i64 %".409", i64* %"rounds"
  %"op_overload_result.6" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.6", i64* %"t0"
  br label %"while.cond.8"
while.cond.7:
  %"j.15" = load i64, i64* %"j"
  %"w.8" = load i64, i64* %"w"
  %".372" = icmp ult i64 %"j.15", %"w.8"
  br i1 %".372", label %"while.body.7", label %"while.end.7"
while.body.7:
  %"j.16" = load i64, i64* %"j"
  %"rounds.2" = load i64, i64* %"rounds"
  %".374" = add i64 %"j.16", %"rounds.2"
  %"q.5" = load i64*, i64** %"q"
  %"j.17" = load i64, i64* %"j"
  %".375" = getelementptr inbounds i64, i64* %"q.5", i64 %"j.17"
  store i64 %".374", i64* %".375"
  %"j.18" = load i64, i64* %"j"
  %".377" = add i64 %"j.18", 1
  store i64 %".377", i64* %"j"
  br label %"while.cond.7"
while.end.7:
  %"rounds.3" = load i64, i64* %"rounds"
  %".380" = add i64 %"rounds.3", 1
  store i64 %".380", i64* %"rounds"
  br label %"while.cond.6"
while.cond.8:
  %"rounds.4" = load i64, i64* %"rounds"
  %".413" = zext i32 4 to i64
  %".414" = icmp ult i64 %"rounds.4", %".413"
  br i1 %".414", label %"while.body.8", label %"while.end.8"
while.body.8:
  %".416" = sext i32 0 to i64
  store i64 %".416", i64* %"j"
  br label %"while.cond.9"
while.end.8:
  %"op_overload_result.7" = call i64 @"standard__time__time_now__0__ret_dataE1_sbits64"()
  store i64 %"op_overload_result.7", i64* %"t1"
  %"w.10" = load i64, i64* %"w"
  %"w.11" = load i64, i64* %"w"
  %".430" = zext i32 1 to i64
  %".431" = sub i64 %"w.11", %".430"
  %".432" = mul i64 %"w.10", %".431"
  %".433" = zext i32 2 to i64
  %".434" = udiv i64 %".432", %".433"
  %"w.12" = load i64, i64* %"w"
  %".435" = zext i32 3 to i64
  %".436" = mul i64 %"w.12", %".435"
  %".437" = add i64 %".434", %".436"
  %".438" = zext i32 4 to i64
  %".439" = mul i64 %".437", %".438"
  store i64 %".439", i64* %"expect"
  %"sum.6" = load i64, i64* %"sum"
  %"expect.5" = load i64, i64* %"expect"
  %".441" = icmp eq i64 %"sum.6", %"expect.5"
  %"str_stack.7" = alloca [29 x i8]
  %"str_char_0.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 0
  store i8 115, i8* %"str_char_0.7"
  %"str_char_1.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 1
  store i8 116, i8* %"str_char_1.7"
  %"str_char_2.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 2
  store i8 114, i8* %"str_char_2.7"
  %"str_char_3.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 3
  store i8 101, i8* %"str_char_3.7"
  %"str_char_4.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 4
  store i8 97, i8* %"str_char_4.7"
  %"str_char_5.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 5
  store i8 109, i8* %"str_char_5.7"
  %"str_char_6.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 6
  store i8 32, i8* %"str_char_6.7"
  %"str_char_7.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 7
  store i8 114, i8* %"str_char_7.7"
  %"str_char_8.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 8
  store i8 101, i8* %"str_char_8.7"
  %"str_char_9.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 9
  store i8 97, i8* %"str_char_9.7"
  %"str_char_10.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 10
  store i8 100, i8* %"str_char_10.7"
  %"str_char_11.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 11
  store i8 45, i8* %"str_char_11.7"
  %"str_char_12.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 12
  store i8 98, i8* %"str_char_12.7"
  %"str_char_13.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 13
  store i8 97, i8* %"str_char_13.7"
  %"str_char_14.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 14
  store i8 99, i8* %"str_char_14.7"
  %"str_char_15.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 15
  store i8 107, i8* %"str_char_15.7"
  %"str_char_16.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 16
  store i8 32, i8* %"str_char_16.7"
  %"str_char_17.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 17
  store i8 115, i8* %"str_char_17.7"
  %"str_char_18.7" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 18
  store i8 117, i8* %"str_char_18.7"
  %"str_char_19.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 19
  store i8 109, i8* %"str_char_19.4"
  %"str_char_20.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 20
  store i8 32, i8* %"str_char_20.4"
  %"str_char_21.4" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 21
  store i8 109, i8* %"str_char_21.4"
  %"str_char_22.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 22
  store i8 97, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 23
  store i8 116, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 24
  store i8 99, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 25
  store i8 104, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 26
  store i8 101, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 27
  store i8 115, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 28
  store i8 0, i8* %"str_char_28.3"
  %"arg1_decay.3" = getelementptr [29 x i8], [29 x i8]* %"str_stack.7", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".441", i8* %"arg1_decay.3")
  %"str_stack.8" = alloca [19 x i8]
  %"str_char_0.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 0
  store i8 32, i8* %"str_char_0.8"
  %"str_char_1.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 1
  store i8 32, i8* %"str_char_1.8"
  %"str_char_2.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 2
  store i8 115, i8* %"str_char_2.8"
  %"str_char_3.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 3
  store i8 116, i8* %"str_char_3.8"
  %"str_char_4.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 4
  store i8 114, i8* %"str_char_4.8"
  %"str_char_5.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 5
  store i8 101, i8* %"str_char_5.8"
  %"str_char_6.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 6
  store i8 97, i8* %"str_char_6.8"
  %"str_char_7.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 7
  store i8 109, i8* %"str_char_7.8"
  %"str_char_8.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 8
  store i8 32, i8* %"str_char_8.8"
  %"str_char_9.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 9
  store i8 114, i8* %"str_char_9.8"
  %"str_char_10.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 10
  store i8 101, i8* %"str_char_10.8"
  %"str_char_11.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 11
  store i8 97, i8* %"str_char_11.8"
  %"str_char_12.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 12
  store i8 100, i8* %"str_char_12.8"
  %"str_char_13.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 13
  store i8 58, i8* %"str_char_13.8"
  %"str_char_14.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 14
  store i8 32, i8* %"str_char_14.8"
  %"str_char_15.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 15
  store i8 32, i8* %"str_char_15.8"
  %"str_char_16.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 16
  store i8 32, i8* %"str_char_16.8"
  %"str_char_17.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 17
  store i8 32, i8* %"str_char_17.8"
  %"str_char_18.8" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 18
  store i8 0, i8* %"str_char_18.8"
  %"sz.6" = load i64, i64* %"sz"
  %".491" = sext i32 4 to i64
  %".492" = mul i64 %"sz.6", %".491"
  %"t1.4" = load i64, i64* %"t1"
  %"t0.4" = load i64, i64* %"t0"
  %".493" = sub i64 %"t1.4", %"t0.4"
  %"arg0_decay.4" = getelementptr [19 x i8], [19 x i8]* %"str_stack.8", i32 0, i32 0
  call void @"bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1"(i8* %"arg0_decay.4", i64 %".492", i64 %".493")
  %"p.10" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.10")
  br label %"ifcont.3"
while.cond.9:
  %"j.19" = load i64, i64* %"j"
  %"w.9" = load i64, i64* %"w"
  %".419" = icmp ult i64 %"j.19", %"w.9"
  br i1 %".419", label %"while.body.9", label %"while.end.9"
while.body.9:
  %"sum.5" = load i64, i64* %"sum"
  %"q.6" = load i64*, i64** %"q"
  %"j.20" = load i64, i64* %"j"
  %"idx_trunc.2" = trunc i64 %"j.20" to i32
  %"ptr_gep.2" = getelementptr inbounds i64, i64* %"q.6", i32 %"idx_trunc.2"
  %"ptr_load.2" = load i64, i64* %"ptr_gep.2"
  %".421" = add i64 %"sum.5", %"ptr_load.2"
  store i64 %".421", i64* %"sum"
  %"j.21" = load i64, i64* %"j"
  %".423" = add i64 %"j.21", 1
  store i64 %".423", i64* %"j"
  br label %"while.cond.9"
while.end.9:
  %"rounds.5" = load i64, i64* %"rounds"
  %".426" = add i64 %"rounds.5", 1
  store i64 %".426", i64* %"rounds"
  br label %"while.cond.8"
}

define void @"test_frealloc_pressure__0__ret_voidE1"()
{
entry:
  %"rng" = alloca %"PCG32"
  store %"PCG32" zeroinitializer, %"PCG32"* %"rng"
  %"ptr" = alloca i64
  store i64 0, i64* %"ptr"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"n" = alloca i64
  store i64 0, i64* %"n"
  %"sz" = alloca i64
  store i64 0, i64* %"sz"
  %"prev_sz" = alloca i64
  store i64 0, i64* %"prev_sz"
  %"copy_sz" = alloca i64
  store i64 0, i64* %"copy_sz"
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"bp" = alloca i8*
  store i8* null, i8** %"bp"
  %"j" = alloca i64
  store i64 0, i64* %"j"
  %"rval" = alloca i32
  store i32 0, i32* %"rval"
  %"rval64" = alloca i64
  store i64 0, i64* %"rval64"
  %"new_ptr" = alloca i64
  store i64 0, i64* %"new_ptr"
  %"str_stack" = alloca [58 x i8]
  %"str_char_0" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 3
  store i8 102, i8* %"str_char_3"
  %"str_char_4" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 4
  store i8 114, i8* %"str_char_4"
  %"str_char_5" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 5
  store i8 101, i8* %"str_char_5"
  %"str_char_6" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 6
  store i8 97, i8* %"str_char_6"
  %"str_char_7" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 7
  store i8 108, i8* %"str_char_7"
  %"str_char_8" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 8
  store i8 108, i8* %"str_char_8"
  %"str_char_9" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 9
  store i8 111, i8* %"str_char_9"
  %"str_char_10" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 10
  store i8 99, i8* %"str_char_10"
  %"str_char_11" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 11
  store i8 32, i8* %"str_char_11"
  %"str_char_12" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 12
  store i8 112, i8* %"str_char_12"
  %"str_char_13" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 13
  store i8 114, i8* %"str_char_13"
  %"str_char_14" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 14
  store i8 101, i8* %"str_char_14"
  %"str_char_15" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 15
  store i8 115, i8* %"str_char_15"
  %"str_char_16" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 16
  store i8 115, i8* %"str_char_16"
  %"str_char_17" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 17
  store i8 117, i8* %"str_char_17"
  %"str_char_18" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 18
  store i8 114, i8* %"str_char_18"
  %"str_char_19" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 19
  store i8 101, i8* %"str_char_19"
  %"str_char_20" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 20
  store i8 32, i8* %"str_char_20"
  %"str_char_21" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 21
  store i8 40, i8* %"str_char_21"
  %"str_char_22" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 22
  store i8 49, i8* %"str_char_22"
  %"str_char_23" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 23
  store i8 48, i8* %"str_char_23"
  %"str_char_24" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 24
  store i8 48, i8* %"str_char_24"
  %"str_char_25" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 25
  store i8 48, i8* %"str_char_25"
  %"str_char_26" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 26
  store i8 32, i8* %"str_char_26"
  %"str_char_27" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 27
  store i8 114, i8* %"str_char_27"
  %"str_char_28" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 28
  store i8 97, i8* %"str_char_28"
  %"str_char_29" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 29
  store i8 110, i8* %"str_char_29"
  %"str_char_30" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 30
  store i8 100, i8* %"str_char_30"
  %"str_char_31" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 31
  store i8 111, i8* %"str_char_31"
  %"str_char_32" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 32
  store i8 109, i8* %"str_char_32"
  %"str_char_33" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 33
  store i8 32, i8* %"str_char_33"
  %"str_char_34" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 34
  store i8 103, i8* %"str_char_34"
  %"str_char_35" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 35
  store i8 114, i8* %"str_char_35"
  %"str_char_36" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 36
  store i8 111, i8* %"str_char_36"
  %"str_char_37" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 37
  store i8 119, i8* %"str_char_37"
  %"str_char_38" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 38
  store i8 47, i8* %"str_char_38"
  %"str_char_39" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 39
  store i8 115, i8* %"str_char_39"
  %"str_char_40" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 40
  store i8 104, i8* %"str_char_40"
  %"str_char_41" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 41
  store i8 114, i8* %"str_char_41"
  %"str_char_42" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 42
  store i8 105, i8* %"str_char_42"
  %"str_char_43" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 43
  store i8 110, i8* %"str_char_43"
  %"str_char_44" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 44
  store i8 107, i8* %"str_char_44"
  %"str_char_45" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 45
  store i8 32, i8* %"str_char_45"
  %"str_char_46" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 46
  store i8 99, i8* %"str_char_46"
  %"str_char_47" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 47
  store i8 121, i8* %"str_char_47"
  %"str_char_48" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 48
  store i8 99, i8* %"str_char_48"
  %"str_char_49" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 49
  store i8 108, i8* %"str_char_49"
  %"str_char_50" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 50
  store i8 101, i8* %"str_char_50"
  %"str_char_51" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 51
  store i8 115, i8* %"str_char_51"
  %"str_char_52" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 52
  store i8 41, i8* %"str_char_52"
  %"str_char_53" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 53
  store i8 32, i8* %"str_char_53"
  %"str_char_54" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 54
  store i8 45, i8* %"str_char_54"
  %"str_char_55" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 55
  store i8 45, i8* %"str_char_55"
  %"str_char_56" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 56
  store i8 10, i8* %"str_char_56"
  %"str_char_57" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 57
  store i8 0, i8* %"str_char_57"
  %"arg0_decay" = getelementptr [58 x i8], [58 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  call void @"standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1"(%"PCG32"* %"rng")
  %".75" = sext i32 1000 to i64
  store i64 %".75", i64* %"n"
  %".77" = sext i32 64 to i64
  %".78" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".77")
  store i64 %".78", i64* %"ptr"
  %".80" = sext i32 64 to i64
  store i64 %".80", i64* %"prev_sz"
  store i1 true, i1* %"ok"
  %"ptr.1" = load i64, i64* %"ptr"
  %".83" = zext i32 0 to i64
  %".84" = icmp ne i64 %"ptr.1", %".83"
  %"str_stack.1" = alloca [36 x i8]
  %"str_char_0.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 105, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 110, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 105, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 116, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 105, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 97, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 108, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 32, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 97, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 108, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 108, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 111, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 99, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 32, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 102, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 111, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 114, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 32, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 102, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 114, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 101, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 97, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 108, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 108, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 111, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 99, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 32, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 112, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 114, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 101, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 115, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 115, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 117, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 114, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 101, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 0, i8* %"str_char_35.1"
  %"arg1_decay" = getelementptr [36 x i8], [36 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".84", i8* %"arg1_decay")
  %"ptr.2" = load i64, i64* %"ptr"
  %"int_to_ptr" = inttoptr i64 %"ptr.2" to i8*
  store i8* %"int_to_ptr", i8** %"bp"
  %".123" = sext i32 0 to i64
  store i64 %".123", i64* %"j"
  br label %"while.cond"
while.cond:
  %"j.1" = load i64, i64* %"j"
  %"prev_sz.1" = load i64, i64* %"prev_sz"
  %".126" = icmp ult i64 %"j.1", %"prev_sz.1"
  br i1 %".126", label %"while.body", label %"while.end"
while.body:
  %".128" = trunc i32 90 to i8
  %"bp.1" = load i8*, i8** %"bp"
  %"j.2" = load i64, i64* %"j"
  %".129" = getelementptr inbounds i8, i8* %"bp.1", i64 %"j.2"
  store i8 %".128", i8* %".129"
  %"j.3" = load i64, i64* %"j"
  %".131" = add i64 %"j.3", 1
  store i64 %".131", i64* %"j"
  br label %"while.cond"
while.end:
  br label %"while.cond.1"
while.cond.1:
  %"i.1" = load i64, i64* %"i"
  %"n.1" = load i64, i64* %"n"
  %".135" = icmp ult i64 %"i.1", %"n.1"
  br i1 %".135", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".137" = call i32 @"standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32"(%"PCG32"* %"rng")
  store i32 %".137", i32* %"rval"
  %"rval.1" = load i32, i32* %"rval"
  %".139" = zext i32 %"rval.1" to i64
  store i64 %".139", i64* %"rval64"
  %"rval64.1" = load i64, i64* %"rval64"
  %".141" = zext i32 8192 to i64
  %".142" = urem i64 %"rval64.1", %".141"
  %".143" = zext i32 1 to i64
  %".144" = add i64 %".142", %".143"
  store i64 %".144", i64* %"sz"
  %"prev_sz.2" = load i64, i64* %"prev_sz"
  store i64 %"prev_sz.2", i64* %"copy_sz"
  %"sz.1" = load i64, i64* %"sz"
  %"copy_sz.1" = load i64, i64* %"copy_sz"
  %".147" = icmp ult i64 %"sz.1", %"copy_sz.1"
  br i1 %".147", label %"then", label %"else"
while.end.1:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.2" = alloca [56 x i8]
  %"str_char_0.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 49, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 48, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 48, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 48, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 32, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 102, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 114, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 101, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 97, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 108, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 108, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 111, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 99, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 32, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 103, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 114, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 111, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 119, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 47, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 115, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 104, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 114, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 105, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 110, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 107, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 32, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 99, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 121, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 99, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 108, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 101, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 115, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 58, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 32, i8* %"str_char_33.2"
  %"str_char_34.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 100, i8* %"str_char_34.2"
  %"str_char_35.2" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 97, i8* %"str_char_35.2"
  %"str_char_36.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 36
  store i8 116, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 37
  store i8 97, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 38
  store i8 32, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 39
  store i8 97, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 40
  store i8 108, i8* %"str_char_40.1"
  %"str_char_41.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 41
  store i8 119, i8* %"str_char_41.1"
  %"str_char_42.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 42
  store i8 97, i8* %"str_char_42.1"
  %"str_char_43.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 43
  store i8 121, i8* %"str_char_43.1"
  %"str_char_44.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 44
  store i8 115, i8* %"str_char_44.1"
  %"str_char_45.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 45
  store i8 32, i8* %"str_char_45.1"
  %"str_char_46.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 46
  store i8 112, i8* %"str_char_46.1"
  %"str_char_47.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 47
  store i8 114, i8* %"str_char_47.1"
  %"str_char_48.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 48
  store i8 101, i8* %"str_char_48.1"
  %"str_char_49.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 49
  store i8 115, i8* %"str_char_49.1"
  %"str_char_50.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 50
  store i8 101, i8* %"str_char_50.1"
  %"str_char_51.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 51
  store i8 114, i8* %"str_char_51.1"
  %"str_char_52.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 52
  store i8 118, i8* %"str_char_52.1"
  %"str_char_53.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 53
  store i8 101, i8* %"str_char_53.1"
  %"str_char_54.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 54
  store i8 100, i8* %"str_char_54.1"
  %"str_char_55.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 55
  store i8 0, i8* %"str_char_55.1"
  %"arg1_decay.1" = getelementptr [56 x i8], [56 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay.1")
  %"ptr.4" = load i64, i64* %"ptr"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"ptr.4")
  ret void
then:
  %"sz.2" = load i64, i64* %"sz"
  store i64 %"sz.2", i64* %"copy_sz"
  br label %"ifcont"
else:
  br label %"ifcont"
ifcont:
  %"ptr.3" = load i64, i64* %"ptr"
  %"sz.3" = load i64, i64* %"sz"
  %".152" = call i64 @"standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"ptr.3", i64 %"sz.3")
  store i64 %".152", i64* %"new_ptr"
  %"new_ptr.1" = load i64, i64* %"new_ptr"
  %".154" = zext i32 0 to i64
  %".155" = icmp eq i64 %"new_ptr.1", %".154"
  br i1 %".155", label %"then.1", label %"else.1"
then.1:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"new_ptr.2" = load i64, i64* %"new_ptr"
  %"int_to_ptr.1" = inttoptr i64 %"new_ptr.2" to i8*
  store i8* %"int_to_ptr.1", i8** %"bp"
  %".161" = sext i32 0 to i64
  store i64 %".161", i64* %"j"
  br label %"while.cond.2"
while.cond.2:
  %"j.4" = load i64, i64* %"j"
  %"copy_sz.2" = load i64, i64* %"copy_sz"
  %".164" = icmp ult i64 %"j.4", %"copy_sz.2"
  br i1 %".164", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"bp.2" = load i8*, i8** %"bp"
  %"j.5" = load i64, i64* %"j"
  %"idx_trunc" = trunc i64 %"j.5" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"bp.2", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".166" = trunc i32 90 to i8
  %".167" = icmp ne i8 %"ptr_load", %".166"
  br i1 %".167", label %"then.2", label %"else.2"
while.end.2:
  %"ok.1" = load i1, i1* %"ok"
  %".175" = xor i1 %"ok.1", -1
  br i1 %".175", label %"then.3", label %"else.3"
then.2:
  store i1 false, i1* %"ok"
  br label %"while.end.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  %"j.6" = load i64, i64* %"j"
  %".172" = add i64 %"j.6", 1
  store i64 %".172", i64* %"j"
  br label %"while.cond.2"
then.3:
  br label %"while.end.1"
else.3:
  br label %"ifcont.3"
ifcont.3:
  %".179" = sext i32 0 to i64
  store i64 %".179", i64* %"j"
  br label %"while.cond.3"
while.cond.3:
  %"j.7" = load i64, i64* %"j"
  %"sz.4" = load i64, i64* %"sz"
  %".182" = icmp ult i64 %"j.7", %"sz.4"
  br i1 %".182", label %"while.body.3", label %"while.end.3"
while.body.3:
  %".184" = trunc i32 90 to i8
  %"bp.3" = load i8*, i8** %"bp"
  %"j.8" = load i64, i64* %"j"
  %".185" = getelementptr inbounds i8, i8* %"bp.3", i64 %"j.8"
  store i8 %".184", i8* %".185"
  %"j.9" = load i64, i64* %"j"
  %".187" = add i64 %"j.9", 1
  store i64 %".187", i64* %"j"
  br label %"while.cond.3"
while.end.3:
  %"new_ptr.3" = load i64, i64* %"new_ptr"
  store i64 %"new_ptr.3", i64* %"ptr"
  %"sz.5" = load i64, i64* %"sz"
  store i64 %"sz.5", i64* %"prev_sz"
  %"i.2" = load i64, i64* %"i"
  %".192" = add i64 %"i.2", 1
  store i64 %".192", i64* %"i"
  br label %"while.cond.1"
}

define void @"test_slab_exhaustion_recovery__0__ret_voidE1"()
{
entry:
  %"batch" = alloca i64
  store i64 0, i64* %"batch"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %"total" = alloca i64
  store i64 0, i64* %"total"
  %"freed" = alloca i64
  store i64 0, i64* %"freed"
  %"freed_batch" = alloca i64
  store i64 0, i64* %"freed_batch"
  %"target" = alloca i64
  store i64 0, i64* %"target"
  %"ptrs" = alloca [256 x i64]
  %"memset_ptr" = bitcast [256 x i64]* %"ptrs" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 2048, i1 0)
  %"ok" = alloca i1
  store i1 0, i1* %"ok"
  %"p" = alloca i64
  store i64 0, i64* %"p"
  %"str_stack" = alloca [36 x i8]
  %"str_char_0" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 0
  store i8 45, i8* %"str_char_0"
  %"str_char_1" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 1
  store i8 45, i8* %"str_char_1"
  %"str_char_2" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 2
  store i8 32, i8* %"str_char_2"
  %"str_char_3" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 3
  store i8 115, i8* %"str_char_3"
  %"str_char_4" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 4
  store i8 108, i8* %"str_char_4"
  %"str_char_5" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 5
  store i8 97, i8* %"str_char_5"
  %"str_char_6" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 6
  store i8 98, i8* %"str_char_6"
  %"str_char_7" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 7
  store i8 32, i8* %"str_char_7"
  %"str_char_8" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 8
  store i8 101, i8* %"str_char_8"
  %"str_char_9" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 9
  store i8 120, i8* %"str_char_9"
  %"str_char_10" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 10
  store i8 104, i8* %"str_char_10"
  %"str_char_11" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 11
  store i8 97, i8* %"str_char_11"
  %"str_char_12" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 12
  store i8 117, i8* %"str_char_12"
  %"str_char_13" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 13
  store i8 115, i8* %"str_char_13"
  %"str_char_14" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 14
  store i8 116, i8* %"str_char_14"
  %"str_char_15" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 15
  store i8 105, i8* %"str_char_15"
  %"str_char_16" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 16
  store i8 111, i8* %"str_char_16"
  %"str_char_17" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 17
  store i8 110, i8* %"str_char_17"
  %"str_char_18" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 18
  store i8 32, i8* %"str_char_18"
  %"str_char_19" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 19
  store i8 97, i8* %"str_char_19"
  %"str_char_20" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 20
  store i8 110, i8* %"str_char_20"
  %"str_char_21" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 21
  store i8 100, i8* %"str_char_21"
  %"str_char_22" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 22
  store i8 32, i8* %"str_char_22"
  %"str_char_23" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 23
  store i8 114, i8* %"str_char_23"
  %"str_char_24" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 24
  store i8 101, i8* %"str_char_24"
  %"str_char_25" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 25
  store i8 99, i8* %"str_char_25"
  %"str_char_26" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 26
  store i8 111, i8* %"str_char_26"
  %"str_char_27" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 27
  store i8 118, i8* %"str_char_27"
  %"str_char_28" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 28
  store i8 101, i8* %"str_char_28"
  %"str_char_29" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 29
  store i8 114, i8* %"str_char_29"
  %"str_char_30" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 30
  store i8 121, i8* %"str_char_30"
  %"str_char_31" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 31
  store i8 32, i8* %"str_char_31"
  %"str_char_32" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 32
  store i8 45, i8* %"str_char_32"
  %"str_char_33" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 33
  store i8 45, i8* %"str_char_33"
  %"str_char_34" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 34
  store i8 10, i8* %"str_char_34"
  %"str_char_35" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 35
  store i8 0, i8* %"str_char_35"
  %"arg0_decay" = getelementptr [36 x i8], [36 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  %".48" = sext i32 256 to i64
  store i64 %".48", i64* %"batch"
  %".50" = sext i32 0 to i64
  store i64 %".50", i64* %"total"
  store i1 true, i1* %"ok"
  %".53" = sext i32 393216 to i64
  store i64 %".53", i64* %"target"
  br label %"while.cond"
while.cond:
  %"total.1" = load i64, i64* %"total"
  %"target.1" = load i64, i64* %"target"
  %".56" = icmp ult i64 %"total.1", %"target.1"
  br i1 %".56", label %"sc_rhs", label %"sc_end"
while.body:
  %".60" = sext i32 0 to i64
  store i64 %".60", i64* %"i"
  br label %"while.cond.1"
while.end:
  %"ok.2" = load i1, i1* %"ok"
  %"str_stack.1" = alloca [42 x i8]
  %"str_char_0.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 54, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 77, i8* %"str_char_1.1"
  %"str_char_2.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 2
  store i8 66, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 3
  store i8 32, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 4
  store i8 115, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 5
  store i8 108, i8* %"str_char_5.1"
  %"str_char_6.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 6
  store i8 97, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 7
  store i8 98, i8* %"str_char_7.1"
  %"str_char_8.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 8
  store i8 32, i8* %"str_char_8.1"
  %"str_char_9.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 9
  store i8 101, i8* %"str_char_9.1"
  %"str_char_10.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 10
  store i8 120, i8* %"str_char_10.1"
  %"str_char_11.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 11
  store i8 104, i8* %"str_char_11.1"
  %"str_char_12.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 12
  store i8 97, i8* %"str_char_12.1"
  %"str_char_13.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 13
  store i8 117, i8* %"str_char_13.1"
  %"str_char_14.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 14
  store i8 115, i8* %"str_char_14.1"
  %"str_char_15.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 15
  store i8 116, i8* %"str_char_15.1"
  %"str_char_16.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 16
  store i8 105, i8* %"str_char_16.1"
  %"str_char_17.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 17
  store i8 111, i8* %"str_char_17.1"
  %"str_char_18.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 18
  store i8 110, i8* %"str_char_18.1"
  %"str_char_19.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 19
  store i8 58, i8* %"str_char_19.1"
  %"str_char_20.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 20
  store i8 32, i8* %"str_char_20.1"
  %"str_char_21.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 21
  store i8 97, i8* %"str_char_21.1"
  %"str_char_22.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 22
  store i8 108, i8* %"str_char_22.1"
  %"str_char_23.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 23
  store i8 108, i8* %"str_char_23.1"
  %"str_char_24.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 24
  store i8 32, i8* %"str_char_24.1"
  %"str_char_25.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 25
  store i8 97, i8* %"str_char_25.1"
  %"str_char_26.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 26
  store i8 108, i8* %"str_char_26.1"
  %"str_char_27.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 27
  store i8 108, i8* %"str_char_27.1"
  %"str_char_28.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 28
  store i8 111, i8* %"str_char_28.1"
  %"str_char_29.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 29
  store i8 99, i8* %"str_char_29.1"
  %"str_char_30.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 30
  store i8 115, i8* %"str_char_30.1"
  %"str_char_31.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 31
  store i8 32, i8* %"str_char_31.1"
  %"str_char_32.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 32
  store i8 115, i8* %"str_char_32.1"
  %"str_char_33.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 33
  store i8 117, i8* %"str_char_33.1"
  %"str_char_34.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 34
  store i8 99, i8* %"str_char_34.1"
  %"str_char_35.1" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 35
  store i8 99, i8* %"str_char_35.1"
  %"str_char_36" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 36
  store i8 101, i8* %"str_char_36"
  %"str_char_37" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 37
  store i8 101, i8* %"str_char_37"
  %"str_char_38" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 38
  store i8 100, i8* %"str_char_38"
  %"str_char_39" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 39
  store i8 101, i8* %"str_char_39"
  %"str_char_40" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 40
  store i8 100, i8* %"str_char_40"
  %"str_char_41" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 41
  store i8 0, i8* %"str_char_41"
  %"arg1_decay" = getelementptr [42 x i8], [42 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %"ok.2", i8* %"arg1_decay")
  call void @"standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1"()
  %"str_stack.2" = alloca [36 x i8]
  %"str_char_0.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 99, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 111, i8* %"str_char_1.2"
  %"str_char_2.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 97, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 108, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 101, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 115, i8* %"str_char_5.2"
  %"str_char_6.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 99, i8* %"str_char_6.2"
  %"str_char_7.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 101, i8* %"str_char_7.2"
  %"str_char_8.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 8
  store i8 32, i8* %"str_char_8.2"
  %"str_char_9.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 9
  store i8 97, i8* %"str_char_9.2"
  %"str_char_10.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 10
  store i8 102, i8* %"str_char_10.2"
  %"str_char_11.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 11
  store i8 116, i8* %"str_char_11.2"
  %"str_char_12.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 12
  store i8 101, i8* %"str_char_12.2"
  %"str_char_13.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 13
  store i8 114, i8* %"str_char_13.2"
  %"str_char_14.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 14
  store i8 32, i8* %"str_char_14.2"
  %"str_char_15.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 15
  store i8 101, i8* %"str_char_15.2"
  %"str_char_16.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 16
  store i8 120, i8* %"str_char_16.2"
  %"str_char_17.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 17
  store i8 104, i8* %"str_char_17.2"
  %"str_char_18.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 18
  store i8 97, i8* %"str_char_18.2"
  %"str_char_19.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 19
  store i8 117, i8* %"str_char_19.2"
  %"str_char_20.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 20
  store i8 115, i8* %"str_char_20.2"
  %"str_char_21.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 21
  store i8 116, i8* %"str_char_21.2"
  %"str_char_22.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 22
  store i8 105, i8* %"str_char_22.2"
  %"str_char_23.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 23
  store i8 111, i8* %"str_char_23.2"
  %"str_char_24.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 24
  store i8 110, i8* %"str_char_24.2"
  %"str_char_25.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 25
  store i8 58, i8* %"str_char_25.2"
  %"str_char_26.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 26
  store i8 32, i8* %"str_char_26.2"
  %"str_char_27.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 27
  store i8 110, i8* %"str_char_27.2"
  %"str_char_28.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 28
  store i8 111, i8* %"str_char_28.2"
  %"str_char_29.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 29
  store i8 32, i8* %"str_char_29.2"
  %"str_char_30.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 30
  store i8 99, i8* %"str_char_30.2"
  %"str_char_31.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 31
  store i8 114, i8* %"str_char_31.2"
  %"str_char_32.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 32
  store i8 97, i8* %"str_char_32.2"
  %"str_char_33.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 33
  store i8 115, i8* %"str_char_33.2"
  %"str_char_34.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 34
  store i8 104, i8* %"str_char_34.2"
  %"str_char_35.2" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 35
  store i8 0, i8* %"str_char_35.2"
  %"arg1_decay.1" = getelementptr [36 x i8], [36 x i8]* %"str_stack.2", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 true, i8* %"arg1_decay.1")
  %".174" = sext i32 64 to i64
  %".175" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".174")
  store i64 %".175", i64* %"p"
  %"p.1" = load i64, i64* %"p"
  %"not_zero" = icmp ne i64 %"p.1", 0
  %"not_null_result" = zext i1 %"not_zero" to i8
  %"str_stack.3" = alloca [41 x i8]
  %"str_char_0.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 97, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 108, i8* %"str_char_1.3"
  %"str_char_2.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 108, i8* %"str_char_2.3"
  %"str_char_3.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 111, i8* %"str_char_3.3"
  %"str_char_4.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 99, i8* %"str_char_4.3"
  %"str_char_5.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 32, i8* %"str_char_5.3"
  %"str_char_6.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 97, i8* %"str_char_6.3"
  %"str_char_7.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 102, i8* %"str_char_7.3"
  %"str_char_8.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 8
  store i8 116, i8* %"str_char_8.3"
  %"str_char_9.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 9
  store i8 101, i8* %"str_char_9.3"
  %"str_char_10.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 10
  store i8 114, i8* %"str_char_10.3"
  %"str_char_11.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 11
  store i8 32, i8* %"str_char_11.3"
  %"str_char_12.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 12
  store i8 101, i8* %"str_char_12.3"
  %"str_char_13.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 13
  store i8 120, i8* %"str_char_13.3"
  %"str_char_14.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 14
  store i8 104, i8* %"str_char_14.3"
  %"str_char_15.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 15
  store i8 97, i8* %"str_char_15.3"
  %"str_char_16.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 16
  store i8 117, i8* %"str_char_16.3"
  %"str_char_17.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 17
  store i8 115, i8* %"str_char_17.3"
  %"str_char_18.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 18
  store i8 116, i8* %"str_char_18.3"
  %"str_char_19.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 19
  store i8 105, i8* %"str_char_19.3"
  %"str_char_20.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 20
  store i8 111, i8* %"str_char_20.3"
  %"str_char_21.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 21
  store i8 110, i8* %"str_char_21.3"
  %"str_char_22.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 22
  store i8 43, i8* %"str_char_22.3"
  %"str_char_23.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 23
  store i8 99, i8* %"str_char_23.3"
  %"str_char_24.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 24
  store i8 111, i8* %"str_char_24.3"
  %"str_char_25.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 25
  store i8 97, i8* %"str_char_25.3"
  %"str_char_26.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 26
  store i8 108, i8* %"str_char_26.3"
  %"str_char_27.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 27
  store i8 101, i8* %"str_char_27.3"
  %"str_char_28.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 28
  store i8 115, i8* %"str_char_28.3"
  %"str_char_29.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 29
  store i8 99, i8* %"str_char_29.3"
  %"str_char_30.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 30
  store i8 101, i8* %"str_char_30.3"
  %"str_char_31.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 31
  store i8 32, i8* %"str_char_31.3"
  %"str_char_32.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 32
  store i8 115, i8* %"str_char_32.3"
  %"str_char_33.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 33
  store i8 117, i8* %"str_char_33.3"
  %"str_char_34.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 34
  store i8 99, i8* %"str_char_34.3"
  %"str_char_35.3" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 35
  store i8 99, i8* %"str_char_35.3"
  %"str_char_36.1" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 36
  store i8 101, i8* %"str_char_36.1"
  %"str_char_37.1" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 37
  store i8 101, i8* %"str_char_37.1"
  %"str_char_38.1" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 38
  store i8 100, i8* %"str_char_38.1"
  %"str_char_39.1" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 39
  store i8 115, i8* %"str_char_39.1"
  %"str_char_40.1" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 40
  store i8 0, i8* %"str_char_40.1"
  %".218" = trunc i8 %"not_null_result" to i1
  %"arg1_decay.2" = getelementptr [41 x i8], [41 x i8]* %"str_stack.3", i32 0, i32 0
  call void @"check__2__boolE1__byteE1_ptr1__ret_voidE1"(i1 %".218", i8* %"arg1_decay.2")
  %"p.2" = load i64, i64* %"p"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"p.2")
  ret void
sc_rhs:
  %"ok.1" = load i1, i1* %"ok"
  br label %"sc_end"
sc_end:
  %"sc_result" = phi  i1 [0, %"while.cond"], [%"ok.1", %"sc_rhs"]
  br i1 %"sc_result", label %"while.body", label %"while.end"
while.cond.1:
  %"i.1" = load i64, i64* %"i"
  %"batch.1" = load i64, i64* %"batch"
  %".63" = icmp ult i64 %"i.1", %"batch.1"
  br i1 %".63", label %"sc_rhs.1", label %"sc_end.1"
while.body.1:
  %".68" = sext i32 16 to i64
  %".69" = call i64 @"standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %".68")
  %"i.2" = load i64, i64* %"i"
  %".70" = getelementptr inbounds [256 x i64], [256 x i64]* %"ptrs", i32 0, i64 %"i.2"
  store i64 %".69", i64* %".70"
  %"i.3" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.3" to i32
  %"array_gep" = getelementptr inbounds [256 x i64], [256 x i64]* %"ptrs", i32 0, i32 %"idx_trunc"
  %"array_load" = load i64, i64* %"array_gep"
  %".72" = zext i32 0 to i64
  %".73" = icmp eq i64 %"array_load", %".72"
  br i1 %".73", label %"then", label %"else"
while.end.1:
  %"i.5" = load i64, i64* %"i"
  store i64 %"i.5", i64* %"freed_batch"
  %".84" = sext i32 0 to i64
  store i64 %".84", i64* %"i"
  br label %"while.cond.2"
sc_rhs.1:
  %"total.2" = load i64, i64* %"total"
  %"target.2" = load i64, i64* %"target"
  %".65" = icmp ult i64 %"total.2", %"target.2"
  br label %"sc_end.1"
sc_end.1:
  %"sc_result.1" = phi  i1 [0, %"while.cond.1"], [%".65", %"sc_rhs.1"]
  br i1 %"sc_result.1", label %"while.body.1", label %"while.end.1"
then:
  store i1 false, i1* %"ok"
  br label %"while.end.1"
else:
  br label %"ifcont"
ifcont:
  %"i.4" = load i64, i64* %"i"
  %".78" = add i64 %"i.4", 1
  store i64 %".78", i64* %"i"
  %"total.3" = load i64, i64* %"total"
  %".80" = add i64 %"total.3", 1
  store i64 %".80", i64* %"total"
  br label %"while.cond.1"
while.cond.2:
  %"i.6" = load i64, i64* %"i"
  %"freed_batch.1" = load i64, i64* %"freed_batch"
  %".87" = icmp ult i64 %"i.6", %"freed_batch.1"
  br i1 %".87", label %"while.body.2", label %"while.end.2"
while.body.2:
  %"i.7" = load i64, i64* %"i"
  %"idx_trunc.1" = trunc i64 %"i.7" to i32
  %"array_gep.1" = getelementptr inbounds [256 x i64], [256 x i64]* %"ptrs", i32 0, i32 %"idx_trunc.1"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  call void @"standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1"(i64 %"array_load.1")
  %"i.8" = load i64, i64* %"i"
  %".90" = add i64 %"i.8", 1
  store i64 %".90", i64* %"i"
  br label %"while.cond.2"
while.end.2:
  br label %"while.cond"
}
