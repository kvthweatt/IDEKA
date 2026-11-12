; ModuleID = 'build\heap_stress\heap_stress.ll'
source_filename = "build\\heap_stress\\heap_stress.ll"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%Exception = type { ptr, i32, %ExceptionState }
%ExceptionState = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%PCG32 = type { i64, i64 }
%FreeNode = type { ptr }
%BlockEntry = type { i64, i64, i64, i64 }
%Slab = type { i64, i64, i64, i64, ptr }

@standard__system__cpu__g_l2_bytes = internal global i64 0
@standard__system__cpu__g_ermsb = internal global i1 false
@standard__system__cpu__g_cpuid_run = internal global i1 false
@standard__memory__allocators__stdheap__g_next_slab_size = internal global i64 4194304
@standard__memory__allocators__stdheap__g_slab_size_cap = internal global i64 67108864
@standard__memory__allocators__stdheap__g_large_used = internal global i64 0
@standard__memory__allocators__stdheap__g_table_cap = internal global i64 0
@standard__memory__allocators__stdheap__g_table_count = internal global i64 0
@standard__memory__allocators__stdheap__g_table_slab_cap = internal global i64 0
@standard__time__TIME_NS_PER_US = internal global i64 1000
@standard__time__TIME_NS_PER_MS = internal global i64 1000000
@standard__time__TIME_NS_PER_SEC = internal global i64 1000000000
@standard__io__console__out_buf = internal global [8192 x i8] zeroinitializer
@standard__io__console__out_len = internal global i32 0
@IDKC_TYPESYS.TLD = internal constant { i32, i32, [17 x { i32, i32, i32 }] } { i32 640, i32 17, [17 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 1, i32 1 }, { i32, i32, i32 } { i32 129, i32 1, i32 1 }, { i32, i32, i32 } { i32 130, i32 1, i32 1 }, { i32, i32, i32 } { i32 131, i32 1, i32 1 }, { i32, i32, i32 } { i32 132, i32 1, i32 1 }, { i32, i32, i32 } { i32 160, i32 32, i32 32 }, { i32, i32, i32 } { i32 192, i32 1, i32 1 }, { i32, i32, i32 } { i32 224, i32 32, i32 32 }, { i32, i32, i32 } { i32 256, i32 32, i32 32 }, { i32, i32, i32 } { i32 288, i32 32, i32 32 }, { i32, i32, i32 } { i32 320, i32 32, i32 32 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 1, i32 1 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }] }
@IDKC_PARAM.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 704, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 640, i32 64 }] }
@IDKC_FUNCINFO.TLD = internal constant { i32, i32, [12 x { i32, i32, i32 }] } { i32 928, i32 12, [12 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 640, i32 64 }, { i32, i32, i32 } { i32 768, i32 64, i32 64 }, { i32, i32, i32 } { i32 832, i32 1, i32 1 }, { i32, i32, i32 } { i32 833, i32 1, i32 1 }, { i32, i32, i32 } { i32 834, i32 1, i32 1 }, { i32, i32, i32 } { i32 835, i32 1, i32 1 }, { i32, i32, i32 } { i32 836, i32 1, i32 1 }, { i32, i32, i32 } { i32 837, i32 1, i32 1 }, { i32, i32, i32 } { i32 864, i32 32, i32 32 }, { i32, i32, i32 } { i32 896, i32 32, i32 32 }] }
@PtrVec.TLD = internal constant { i32, i32, [3 x { i32, i32, i32 }] } { i32 128, i32 3, [3 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }, { i32, i32, i32 } { i32 96, i32 32, i32 32 }] }
@NameMap.TLD = internal constant { i32, i32, [6 x { i32, i32, i32 }] } { i32 288, i32 6, [6 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 32, i32 32 }, { i32, i32, i32 } { i32 224, i32 32, i32 32 }, { i32, i32, i32 } { i32 256, i32 32, i32 32 }] }
@IDKC_SYMENTRY.TLD = internal constant { i32, i32, [8 x { i32, i32, i32 }] } { i32 1024, i32 8, [8 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 640, i32 64 }, { i32, i32, i32 } { i32 768, i32 64, i32 64 }, { i32, i32, i32 } { i32 832, i32 32, i32 32 }, { i32, i32, i32 } { i32 864, i32 32, i32 32 }, { i32, i32, i32 } { i32 896, i32 64, i32 64 }, { i32, i32, i32 } { i32 960, i32 64, i32 64 }] }
@IDKC_SYMTABLE.TLD = internal constant { i32, i32, [12 x { i32, i32, i32 }] } { i32 768, i32 12, [12 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 64, i32 64 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 64, i32 64 }] }
@SYSTEM_INFO_PARTIAL.TLD = internal constant { i32, i32, [10 x { i32, i32, i32 }] } { i32 384, i32 10, [10 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 1 }, { i32, i32, i32 } { i32 32, i32 32, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }, { i32, i32, i32 } { i32 256, i32 32, i32 1 }, { i32, i32, i32 } { i32 288, i32 32, i32 1 }, { i32, i32, i32 } { i32 320, i32 32, i32 1 }, { i32, i32, i32 } { i32 352, i32 16, i32 1 }, { i32, i32, i32 } { i32 368, i32 16, i32 1 }] }
@BlockEntry.TLD = internal constant { i32, i32, [4 x { i32, i32, i32 }] } { i32 256, i32 4, [4 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }, { i32, i32, i32 } { i32 128, i32 64, i32 1 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }] }
@Slab.TLD = internal constant { i32, i32, [5 x { i32, i32, i32 }] } { i32 320, i32 5, [5 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }, { i32, i32, i32 } { i32 128, i32 64, i32 1 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }] }
@FreeNode.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 64, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }] }
@RingAllocResult.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 65, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 1, i32 1 }] }
@ExceptionState.TLD = internal constant { i32, i32, [18 x { i32, i32, i32 }] } { i32 1152, i32 18, [18 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }, { i32, i32, i32 } { i32 128, i32 64, i32 1 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }, { i32, i32, i32 } { i32 256, i32 64, i32 1 }, { i32, i32, i32 } { i32 320, i32 64, i32 1 }, { i32, i32, i32 } { i32 384, i32 64, i32 1 }, { i32, i32, i32 } { i32 448, i32 64, i32 1 }, { i32, i32, i32 } { i32 512, i32 64, i32 1 }, { i32, i32, i32 } { i32 576, i32 64, i32 1 }, { i32, i32, i32 } { i32 640, i32 64, i32 1 }, { i32, i32, i32 } { i32 704, i32 64, i32 1 }, { i32, i32, i32 } { i32 768, i32 64, i32 1 }, { i32, i32, i32 } { i32 832, i32 64, i32 1 }, { i32, i32, i32 } { i32 896, i32 64, i32 1 }, { i32, i32, i32 } { i32 960, i32 64, i32 1 }, { i32, i32, i32 } { i32 1024, i32 64, i32 1 }, { i32, i32, i32 } { i32 1088, i32 64, i32 1 }] }
@Exception.TLD = internal constant { i32, i32, [3 x { i32, i32, i32 }] } { i32 1248, i32 3, [3 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 32, i32 1 }, { i32, i32, i32 } { i32 96, i32 1152, i32 1 }] }
@WinExceptionRecord.TLD = internal constant { i32, i32, [6 x { i32, i32, i32 }] } { i32 1184, i32 6, [6 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 1 }, { i32, i32, i32 } { i32 32, i32 32, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 32, i32 1 }, { i32, i32, i32 } { i32 224, i32 960, i32 1 }] }
@WinContext.TLD = internal constant { i32, i32, [38 x { i32, i32, i32 }] } { i32 2048, i32 38, [38 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }, { i32, i32, i32 } { i32 128, i32 64, i32 1 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }, { i32, i32, i32 } { i32 256, i32 64, i32 1 }, { i32, i32, i32 } { i32 320, i32 64, i32 1 }, { i32, i32, i32 } { i32 384, i32 32, i32 1 }, { i32, i32, i32 } { i32 416, i32 32, i32 1 }, { i32, i32, i32 } { i32 448, i32 16, i32 1 }, { i32, i32, i32 } { i32 464, i32 16, i32 1 }, { i32, i32, i32 } { i32 480, i32 16, i32 1 }, { i32, i32, i32 } { i32 496, i32 16, i32 1 }, { i32, i32, i32 } { i32 512, i32 16, i32 1 }, { i32, i32, i32 } { i32 528, i32 16, i32 1 }, { i32, i32, i32 } { i32 544, i32 32, i32 1 }, { i32, i32, i32 } { i32 576, i32 64, i32 1 }, { i32, i32, i32 } { i32 640, i32 64, i32 1 }, { i32, i32, i32 } { i32 704, i32 64, i32 1 }, { i32, i32, i32 } { i32 768, i32 64, i32 1 }, { i32, i32, i32 } { i32 832, i32 64, i32 1 }, { i32, i32, i32 } { i32 896, i32 64, i32 1 }, { i32, i32, i32 } { i32 960, i32 64, i32 1 }, { i32, i32, i32 } { i32 1024, i32 64, i32 1 }, { i32, i32, i32 } { i32 1088, i32 64, i32 1 }, { i32, i32, i32 } { i32 1152, i32 64, i32 1 }, { i32, i32, i32 } { i32 1216, i32 64, i32 1 }, { i32, i32, i32 } { i32 1280, i32 64, i32 1 }, { i32, i32, i32 } { i32 1344, i32 64, i32 1 }, { i32, i32, i32 } { i32 1408, i32 64, i32 1 }, { i32, i32, i32 } { i32 1472, i32 64, i32 1 }, { i32, i32, i32 } { i32 1536, i32 64, i32 1 }, { i32, i32, i32 } { i32 1600, i32 64, i32 1 }, { i32, i32, i32 } { i32 1664, i32 64, i32 1 }, { i32, i32, i32 } { i32 1728, i32 64, i32 1 }, { i32, i32, i32 } { i32 1792, i32 64, i32 1 }, { i32, i32, i32 } { i32 1856, i32 64, i32 1 }, { i32, i32, i32 } { i32 1920, i32 64, i32 1 }, { i32, i32, i32 } { i32 1984, i32 64, i32 1 }] }
@WinExceptionPointers.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 128, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }] }
@IDEKAJmpBuf.TLD = internal constant { i32, i32, [12 x { i32, i32, i32 }] } { i32 768, i32 12, [12 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }, { i32, i32, i32 } { i32 128, i32 64, i32 1 }, { i32, i32, i32 } { i32 192, i32 64, i32 1 }, { i32, i32, i32 } { i32 256, i32 64, i32 1 }, { i32, i32, i32 } { i32 320, i32 64, i32 1 }, { i32, i32, i32 } { i32 384, i32 64, i32 1 }, { i32, i32, i32 } { i32 448, i32 64, i32 1 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 64, i32 64 }] }
@timespec.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 128, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }] }
@PCG32.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 128, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 1 }, { i32, i32, i32 } { i32 64, i32 64, i32 1 }] }
@standard__memory__allocators__stdheap__g_slab_head = internal global ptr null
@standard__memory__allocators__stdheap__g_table = internal global ptr null
@standard__memory__allocators__stdheap__g_bins = internal global [9 x ptr] zeroinitializer
@STDLIB_GVP = internal global ptr null
@U64MAXVAL = internal global i64 -1
@_fltused = internal global i1 true
@nt_threshold = internal global i64 0
@ermsb = internal global i1 false
@WIN_STDOUT_HANDLE = internal global i64 0
@EC_NONE = internal global i32 0
@EC_NULLPTR = internal global i32 1
@EC_WILDPTR = internal global i32 2
@EC_PROTFAULT = internal global i32 3
@EC_STACKOVERFLOW = internal global i32 4
@EC_ILLEGALINSTR = internal global i32 5
@EC_DIVBYZERO = internal global i32 6
@EC_INTOVERFLOW = internal global i32 7
@EC_ALIGNFAULT = internal global i32 8
@EC_PRIVINSTR = internal global i32 9
@WIN_EXCEPTION_ACCESS_VIOLATION = internal global i32 -1073741819
@WIN_EXCEPTION_DATATYPE_MISALIGNMENT = internal global i32 -2147483646
@WIN_EXCEPTION_ILLEGAL_INSTRUCTION = internal global i32 -1073741795
@WIN_EXCEPTION_INT_DIVIDE_BY_ZERO = internal global i32 -1073741676
@WIN_EXCEPTION_INT_OVERFLOW = internal global i32 -1073741675
@WIN_EXCEPTION_PRIV_INSTRUCTION = internal global i32 -1073741674
@WIN_EXCEPTION_STACK_OVERFLOW = internal global i32 -1073741571
@WIN_EXCEPTION_CONTINUE_EXECUTION = internal global i32 -1
@WIN_EXCEPTION_CONTINUE_SEARCH = internal global i32 0
@FEXC_MEM_COMMIT_RESERVE = internal global i32 12288
@FEXC_PAGE_READWRITE = internal global i32 4
@FEXC_STACK_GUARANTEE_BYTES = internal global i32 65536
@FEXC_JMPSTACK_CAPACITY = internal global i64 64
@FEXC_JMPSTACK_BASE = internal global ptr null
@FEXC_JMPSTACK_TOP = internal global i64 0
@FEXC_INITIALIZED = internal global i1 false
@FEXC_PENDING = internal global %Exception zeroinitializer
@global_rng = internal global %PCG32 zeroinitializer
@global_rng_initialized = internal global i1 false
@g_pass = internal global i32 0
@g_fail = internal global i32 0

declare i32 @system(ptr)

declare ptr @LoadLibraryA(ptr)

declare ptr @GetProcAddress(ptr, ptr)

declare void @GetSystemInfo(ptr)

declare ptr @malloc(i64)

declare void @free(ptr)

declare ptr @calloc(i64, i64)

declare ptr @realloc(ptr, i64)

declare i64 @VirtualAlloc(i64, i64, i32, i32)

declare i1 @VirtualFree(i64, i64, i32)

declare i1 @VirtualProtect(i64, i64, i32, ptr)

declare i1 @FlushInstructionCache(i64, i64, i64)

declare ptr @AddVectoredExceptionHandler(i32, ptr)

declare i32 @SetThreadStackGuarantee(ptr)

declare i1 @QueryPerformanceCounter(ptr)

declare i1 @QueryPerformanceFrequency(ptr)

declare i32 @GetTickCount()

declare void @Sleep(i32)

declare ptr @fgets(ptr, i32, ptr)

declare ptr @fopen(ptr, ptr)

declare i32 @fclose(ptr)

declare i64 @GetStdHandle(i32)

declare ptr @GetCommandLineW()

declare ptr @LocalFree(ptr)

declare void @RtlExitUserProcess(i32)

define void @__static_init() {
entry:
  ret void
}

define void @standard__system__cpu__cpuid_query__0__ret_voidE1() {
entry:
  %g_cpuid_run = load i1, ptr @standard__system__cpu__g_cpuid_run, align 1
  %cond = icmp eq i1 %g_cpuid_run, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %entry, %switch_default
  ret void

switch_default:                                   ; preds = %entry
  %.9 = call { i64, i64, i64, i64 } asm sideeffect "movq $$7,  %rax\0D\0A                    xorq %rcx, %rcx\0D\0A                    cpuid\0D\0A                    movq %rax, $0\0D\0A                    movq %rbx, $1\0D\0A                    movq %rcx, $2\0D\0A                    movq %rdx, $3", "=r,=r,=r,=r,~{rax},~{rbx},~{rcx},~{rdx},~{memory}"()
  %.12 = extractvalue { i64, i64, i64, i64 } %.9, 1
  %.18 = zext i32 9 to i64
  %.19 = ashr i64 %.12, %.18
  %.20 = and i64 %.19, 1
  %.21 = trunc i64 %.20 to i1
  store i1 %.21, ptr @standard__system__cpu__g_ermsb, align 1
  %.23 = call i64 asm sideeffect "movq $$0x80000006, %rax\0D\0A                    cpuid\0D\0A                    movq %rcx, $0", "=r,~{rax},~{rbx},~{rcx},~{rdx},~{memory}"()
  %.25 = zext i32 16 to i64
  %.26 = ashr i64 %.23, %.25
  %.27 = and i64 %.26, 65535
  %.28 = zext i32 10 to i64
  %.29 = shl i64 %.27, %.28
  store i64 %.29, ptr @standard__system__cpu__g_l2_bytes, align 8
  %g_l2_bytes = load i64, ptr @standard__system__cpu__g_l2_bytes, align 8
  %.31 = icmp eq i64 %g_l2_bytes, 0
  %cond1 = icmp eq i1 %.31, true
  %spec.store.select = select i1 %cond1, i64 262144, i64 %.29
  store i64 %spec.store.select, ptr @standard__system__cpu__g_l2_bytes, align 8
  store i1 true, ptr @standard__system__cpu__g_cpuid_run, align 1
  br label %common.ret
}

define i64 @standard__system__cpu__l2_bytes__0__ret_ulongE1() {
entry:
  call void @standard__system__cpu__cpuid_query__0__ret_voidE1()
  %g_l2_bytes = load i64, ptr @standard__system__cpu__g_l2_bytes, align 8
  ret i64 %g_l2_bytes
}

define i1 @standard__system__cpu__ermsb__0__ret_boolE1() {
entry:
  call void @standard__system__cpu__cpuid_query__0__ret_voidE1()
  %g_ermsb = load i1, ptr @standard__system__cpu__g_ermsb, align 1
  ret i1 %g_ermsb
}

define ptr @memset(ptr %dst, i32 %c, i64 %n) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %.16, %while.body ]
  %.11 = icmp ult i64 %i.0, %n
  br i1 %.11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.13 = trunc i32 %c to i8
  %.14 = getelementptr inbounds i8, ptr %dst, i64 %i.0
  store i8 %.13, ptr %.14, align 1
  %.16 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret ptr %dst
}

define i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %bytes) {
entry:
  %.4 = sext i32 0 to i64
  %.5 = call i64 @VirtualAlloc(i64 %.4, i64 %bytes, i32 12288, i32 4)
  ret i64 %.5
}

define void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %ptr, i64 %bytes) {
entry:
  %.6 = sext i32 0 to i64
  %.7 = call i1 @VirtualFree(i64 %ptr, i64 %.6, i32 32768)
  ret void
}

; Function Attrs: alwaysinline
define i64 @standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) #0 {
entry:
  %.5 = call i64 asm "bsrq $1, $0", "=r,r,~{cc}"(i64 %x)
  ret i64 %.5
}

; Function Attrs: alwaysinline
define i64 @standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size) #0 {
entry:
  %.4 = zext i32 4096 to i64
  %.5 = icmp ugt i64 %size, %.4
  %cond = icmp eq i1 %.5, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_case_0.1, %switch_default.1, %switch_case_0
  %common.ret.op = phi i64 [ %.7, %switch_case_0 ], [ %.20, %switch_default.1 ], [ %.13, %switch_case_0.1 ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.7 = sext i32 9 to i64
  br label %common.ret

switch_default:                                   ; preds = %entry
  %.10 = zext i32 16 to i64
  %.11 = icmp ule i64 %size, %.10
  %cond1 = icmp eq i1 %.11, true
  br i1 %cond1, label %switch_case_0.1, label %switch_default.1

switch_case_0.1:                                  ; preds = %switch_default
  %.13 = sext i32 0 to i64
  br label %common.ret

switch_default.1:                                 ; preds = %switch_default
  %.16 = zext i32 1 to i64
  %.17 = sub i64 %size, %.16
  %.18 = call i64 @standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.17)
  %.19 = sext i32 3 to i64
  %.20 = sub i64 %.18, %.19
  br label %common.ret
}

; Function Attrs: alwaysinline
define i64 @standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %cls) #0 {
entry:
  %.4 = zext i32 8 to i64
  %.5 = icmp ugt i64 %cls, %.4
  %cond = icmp eq i1 %.5, true
  %.10 = sext i32 16 to i64
  %.11 = shl i64 %.10, %cls
  %.7 = sext i32 4096 to i64
  %common.ret.op = select i1 %cond, i64 %.7, i64 %.11
  ret i64 %common.ret.op
}

; Function Attrs: alwaysinline
define ptr @standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1(i64 %cls) #0 {
entry:
  %.4 = zext i32 8 to i64
  %.5 = icmp ugt i64 %cls, %.4
  %cond = icmp eq i1 %.5, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_default, %switch_case_0.1, %switch_case_0
  %common.ret.op = phi ptr [ %int_to_ptr, %switch_case_0 ], [ %array_load, %switch_case_0.1 ], [ %array_load, %switch_default ]
  ret ptr %common.ret.op

switch_case_0:                                    ; preds = %entry
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

switch_default:                                   ; preds = %entry
  %idx_trunc = trunc i64 %cls to i32
  %array_gep = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i32 %idx_trunc
  %array_load = load ptr, ptr %array_gep, align 8
  %not_null = icmp ne ptr %array_load, null
  %not_null_result = zext i1 %not_null to i8
  %cond1 = icmp eq i8 %not_null_result, 1
  br i1 %cond1, label %switch_case_0.1, label %common.ret

switch_case_0.1:                                  ; preds = %switch_default
  %next_ptr = getelementptr inbounds %FreeNode, ptr %array_load, i32 0, i32 0
  %next = load ptr, ptr %next_ptr, align 8
  %.11 = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i64 %cls
  store ptr %next, ptr %.11, align 8
  br label %common.ret
}

; Function Attrs: alwaysinline
define void @standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1(i64 %cls, ptr %node) #0 {
entry:
  %.6 = zext i32 8 to i64
  %.7 = icmp ugt i64 %cls, %.6
  %cond = icmp eq i1 %.7, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %entry, %switch_default
  ret void

switch_default:                                   ; preds = %entry
  %idx_trunc = trunc i64 %cls to i32
  %array_gep = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i32 %idx_trunc
  %array_load = load ptr, ptr %array_gep, align 8
  %.11 = getelementptr inbounds %FreeNode, ptr %node, i32 0, i32 0
  store ptr %array_load, ptr %.11, align 8
  %.13 = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i64 %cls
  store ptr %node, ptr %.13, align 8
  br label %common.ret
}

; Function Attrs: alwaysinline
define i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr, i64 %cap) #0 {
entry:
  %.6 = sext i32 4 to i64
  %.7 = lshr i64 %ptr, %.6
  %.9 = mul i64 %.7, -7046029254386353131
  %.11 = sext i32 32 to i64
  %.12 = lshr i64 %.9, %.11
  %.13 = xor i64 %.9, %.12
  %.15 = sext i32 1 to i64
  %.16 = sub i64 %cap, %.15
  %.17 = and i64 %.13, %.16
  ret i64 %.17
}

define void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %tbl, i64 %cap, i64 %key, i64 %size, i64 %kind, i64 %slab) {
entry:
  %.14 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key, i64 %cap)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %idx.0 = phi i64 [ %.14, %entry ], [ %.22, %while.body ]
  %idx_trunc.1 = trunc i64 %idx.0 to i32
  %ptr_gep.1 = getelementptr inbounds %BlockEntry, ptr %tbl, i32 %idx_trunc.1
  %key_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.1, i32 0, i32 0
  %key.2 = load i64, ptr %key_ptr, align 8
  %not_zero = icmp ne i64 %key.2, 0
  %not_null_result = zext i1 %not_zero to i8
  %tobool = icmp ne i8 %not_null_result, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.18 = zext i32 1 to i64
  %.19 = add i64 %idx.0, %.18
  %.20 = zext i32 1 to i64
  %.21 = sub i64 %cap, %.20
  %.22 = and i64 %.19, %.21
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %idx_trunc.2 = trunc i64 %idx.0 to i32
  %ptr_gep.2 = getelementptr inbounds %BlockEntry, ptr %tbl, i32 %idx_trunc.2
  %.25 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.2, i32 0, i32 0
  store i64 %key, ptr %.25, align 8
  %idx_trunc.3 = trunc i64 %idx.0 to i32
  %ptr_gep.3 = getelementptr inbounds %BlockEntry, ptr %tbl, i32 %idx_trunc.3
  %.27 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.3, i32 0, i32 1
  store i64 %size, ptr %.27, align 8
  %idx_trunc.4 = trunc i64 %idx.0 to i32
  %ptr_gep.4 = getelementptr inbounds %BlockEntry, ptr %tbl, i32 %idx_trunc.4
  %.29 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.4, i32 0, i32 2
  store i64 %kind, ptr %.29, align 8
  %idx_trunc.5 = trunc i64 %idx.0 to i32
  %ptr_gep.5 = getelementptr inbounds %BlockEntry, ptr %tbl, i32 %idx_trunc.5
  %.31 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.5, i32 0, i32 3
  store i64 %slab, ptr %.31, align 8
  ret void
}

define i1 @standard__memory__allocators__stdheap__table_grow__0__ret_boolE1() {
entry:
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.2 = zext i32 2 to i64
  %.3 = mul i64 %g_table_cap, %.2
  %.5 = zext i32 32 to i64
  %.6 = mul i64 %.3, %.5
  %.8 = call i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.6)
  %.10 = zext i32 0 to i64
  %.11 = icmp eq i64 %.8, %.10
  %cond = icmp eq i1 %.11, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %entry, %while.end.1
  %common.ret.op = phi i1 [ true, %while.end.1 ], [ false, %entry ]
  ret i1 %common.ret.op

switch_default:                                   ; preds = %entry
  %int_to_ptr = inttoptr i64 %.8 to ptr
  %.17 = sext i32 0 to i64
  store i64 %.17, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %while.cond

while.cond:                                       ; preds = %switch_merge.1, %switch_default
  %j.0 = phi i64 [ 0, %switch_default ], [ %.28, %switch_merge.1 ]
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.20 = icmp ult i64 %j.0, %g_table_cap.1
  br i1 %.20, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %g_table.1 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.1 = trunc i64 %j.0 to i32
  %ptr_gep.1 = getelementptr inbounds %BlockEntry, ptr %g_table.1, i32 %idx_trunc.1
  %key_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.1, i32 0, i32 0
  %key = load i64, ptr %key_ptr, align 8
  %not_zero = icmp ne i64 %key, 0
  %not_null_result = zext i1 %not_zero to i8
  %cond16 = icmp eq i8 %not_null_result, 1
  br i1 %cond16, label %switch_case_0.1, label %switch_merge.1

while.end:                                        ; preds = %while.cond
  %g_table.10 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %ptr_to_int = ptrtoint ptr %g_table.10 to i64
  %.32 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr_to_int, i64 %.3)
  br label %while.cond.1

switch_merge.1:                                   ; preds = %while.body, %switch_case_0.1
  %.28 = add i64 %j.0, 1
  br label %while.cond

switch_case_0.1:                                  ; preds = %while.body
  %g_table.3 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.3 = trunc i64 %j.0 to i32
  %ptr_gep.3 = getelementptr inbounds %BlockEntry, ptr %g_table.3, i32 %idx_trunc.3
  %key_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.3, i32 0, i32 0
  %key.1 = load i64, ptr %key_ptr.1, align 8
  %g_table.5 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.5 = trunc i64 %j.0 to i32
  %ptr_gep.5 = getelementptr inbounds %BlockEntry, ptr %g_table.5, i32 %idx_trunc.5
  %size_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.5, i32 0, i32 1
  %size = load i64, ptr %size_ptr, align 8
  %g_table.7 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.7 = trunc i64 %j.0 to i32
  %ptr_gep.7 = getelementptr inbounds %BlockEntry, ptr %g_table.7, i32 %idx_trunc.7
  %kind_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.7, i32 0, i32 2
  %kind = load i64, ptr %kind_ptr, align 8
  %g_table.9 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.9 = trunc i64 %j.0 to i32
  %ptr_gep.9 = getelementptr inbounds %BlockEntry, ptr %g_table.9, i32 %idx_trunc.9
  %slab_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.9, i32 0, i32 3
  %slab = load i64, ptr %slab_ptr, align 8
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %int_to_ptr, i64 %.3, i64 %key.1, i64 %size, i64 %kind, i64 %slab)
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.24 = add i64 %g_table_count, 1
  store i64 %.24, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %switch_merge.1

while.cond.1:                                     ; preds = %switch_default.11, %while.end
  %rm_idx.0 = phi i64 [ %.32, %while.end ], [ %.128, %switch_default.11 ]
  %rm_found.0 = phi i1 [ false, %while.end ], [ %rm_found.14, %switch_default.11 ]
  %idx_trunc.11 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.11 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.11
  %key_ptr.2 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.11, i32 0, i32 0
  %key.2 = load i64, ptr %key_ptr.2, align 8
  %not_zero.1 = icmp ne i64 %key.2, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %tobool = icmp ne i8 %not_null_result.1, 0
  br i1 %tobool, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.13 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.13 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.13
  %key_ptr.3 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.13, i32 0, i32 0
  %key.3 = load i64, ptr %key_ptr.3, align 8
  %.42 = icmp eq i64 %key.3, %ptr_to_int
  %cond6 = icmp eq i1 %.42, true
  br i1 %cond6, label %switch_case_0.2, label %switch_merge.2

while.end.1:                                      ; preds = %switch_merge.2, %while.cond.1
  %g_table.11 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %ptr_to_int.1 = ptrtoint ptr %g_table.11 to i64
  %g_table_slab_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_slab_cap, align 8
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.1, i64 %g_table_slab_cap)
  store ptr %int_to_ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  store i64 %.3, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  store i64 %.6, ptr @standard__memory__allocators__stdheap__g_table_slab_cap, align 8
  %g_table.12 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %g_table_cap.2 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.135 = sext i32 2 to i64
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %g_table.12, i64 %g_table_cap.2, i64 %.8, i64 %.6, i64 %.135, i64 %.8)
  %g_table_count.2 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.137 = add i64 %g_table_count.2, 1
  store i64 %.137, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %common.ret

switch_merge.2:                                   ; preds = %while.cond.2, %while.body.1
  %rm_found.14 = phi i1 [ %rm_found.0, %while.body.1 ], [ true, %while.cond.2 ]
  %cond7 = icmp eq i1 %rm_found.14, true
  br i1 %cond7, label %while.end.1, label %switch_default.11

switch_case_0.2:                                  ; preds = %while.body.1
  %idx_trunc.14 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.14 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.14
  %.44 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.14, i32 0, i32 0
  %.45 = sext i32 0 to i64
  store i64 %.45, ptr %.44, align 8
  %g_table_count.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.47 = sub i64 %g_table_count.1, 1
  store i64 %.47, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.50 = zext i32 1 to i64
  %.51 = add i64 %rm_idx.0, %.50
  %.52 = zext i32 1 to i64
  %.53 = sub i64 %.3, %.52
  %.54 = and i64 %.51, %.53
  br label %while.cond.2

while.cond.2:                                     ; preds = %switch_merge.10, %switch_case_0.2
  %rm_hole.0 = phi i64 [ %rm_idx.0, %switch_case_0.2 ], [ %rm_hole.15, %switch_merge.10 ]
  %rm_next.0 = phi i64 [ %.54, %switch_case_0.2 ], [ %.115, %switch_merge.10 ]
  %idx_trunc.16 = trunc i64 %rm_next.0 to i32
  %ptr_gep.16 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.16
  %key_ptr.4 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.16, i32 0, i32 0
  %key.4 = load i64, ptr %key_ptr.4, align 8
  %not_zero.2 = icmp ne i64 %key.4, 0
  %not_null_result.2 = zext i1 %not_zero.2 to i8
  %tobool.1 = icmp ne i8 %not_null_result.2, 0
  br i1 %tobool.1, label %while.body.2, label %switch_merge.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.18 = trunc i64 %rm_next.0 to i32
  %ptr_gep.18 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.18
  %key_ptr.5 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.18, i32 0, i32 0
  %key.5 = load i64, ptr %key_ptr.5, align 8
  %.58 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key.5, i64 %.3)
  %.60 = icmp ult i64 %rm_hole.0, %rm_next.0
  %cond8 = icmp eq i1 %.60, true
  br i1 %cond8, label %switch_case_0.3, label %switch_default.3

switch_merge.3:                                   ; preds = %switch_merge.7, %switch_merge.4
  %rm_shift.0 = phi i1 [ %., %switch_merge.4 ], [ %.19, %switch_merge.7 ]
  %cond12 = icmp eq i1 %rm_shift.0, true
  br i1 %cond12, label %switch_case_0.10, label %switch_merge.10

switch_case_0.3:                                  ; preds = %while.body.2
  %.62 = icmp ugt i64 %.58, %rm_hole.0
  %cond13 = icmp eq i1 %.62, true
  br i1 %cond13, label %switch_case_0.4, label %switch_merge.4

switch_default.3:                                 ; preds = %while.body.2
  %.79 = icmp ugt i64 %.58, %rm_hole.0
  %cond9 = icmp eq i1 %.79, true
  br i1 %cond9, label %switch_merge.7, label %switch_default.7

switch_merge.4:                                   ; preds = %switch_case_0.4, %switch_case_0.3
  %rm_in_range.0 = phi i1 [ false, %switch_case_0.3 ], [ %.18, %switch_case_0.4 ]
  %cond14 = icmp eq i1 %rm_in_range.0, true
  %. = select i1 %cond14, i1 false, i1 true
  br label %switch_merge.3

switch_case_0.4:                                  ; preds = %switch_case_0.3
  %.64 = icmp ule i64 %.58, %rm_next.0
  %cond15 = icmp eq i1 %.64, true
  %.18 = select i1 %cond15, i1 true, i1 false
  br label %switch_merge.4

switch_merge.7:                                   ; preds = %switch_default.7, %switch_default.3
  %rm_in_range.22 = phi i1 [ true, %switch_default.3 ], [ %.21, %switch_default.7 ]
  %cond11 = icmp eq i1 %rm_in_range.22, true
  %.19 = select i1 %cond11, i1 false, i1 true
  br label %switch_merge.3

switch_default.7:                                 ; preds = %switch_default.3
  %.83 = icmp ule i64 %.58, %rm_next.0
  %cond10 = icmp eq i1 %.83, true
  %.21 = select i1 %cond10, i1 true, i1 false
  br label %switch_merge.7

switch_merge.10:                                  ; preds = %switch_merge.3, %switch_case_0.10
  %rm_hole.15 = phi i64 [ %rm_next.0, %switch_case_0.10 ], [ %rm_hole.0, %switch_merge.3 ]
  %.111 = zext i32 1 to i64
  %.112 = add i64 %rm_next.0, %.111
  %.113 = zext i32 1 to i64
  %.114 = sub i64 %.3, %.113
  %.115 = and i64 %.112, %.114
  br label %while.cond.2

switch_case_0.10:                                 ; preds = %switch_merge.3
  %idx_trunc.20 = trunc i64 %rm_next.0 to i32
  %ptr_gep.20 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.20
  %key_ptr.6 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.20, i32 0, i32 0
  %key.6 = load i64, ptr %key_ptr.6, align 8
  %idx_trunc.21 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.21 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.21
  %.97 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.21, i32 0, i32 0
  store i64 %key.6, ptr %.97, align 8
  %idx_trunc.23 = trunc i64 %rm_next.0 to i32
  %ptr_gep.23 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.23
  %size_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.23, i32 0, i32 1
  %size.1 = load i64, ptr %size_ptr.1, align 8
  %idx_trunc.24 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.24 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.24
  %.99 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.24, i32 0, i32 1
  store i64 %size.1, ptr %.99, align 8
  %idx_trunc.26 = trunc i64 %rm_next.0 to i32
  %ptr_gep.26 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.26
  %kind_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.26, i32 0, i32 2
  %kind.1 = load i64, ptr %kind_ptr.1, align 8
  %idx_trunc.27 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.27 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.27
  %.101 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.27, i32 0, i32 2
  store i64 %kind.1, ptr %.101, align 8
  %idx_trunc.29 = trunc i64 %rm_next.0 to i32
  %ptr_gep.29 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.29
  %slab_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.29, i32 0, i32 3
  %slab.1 = load i64, ptr %slab_ptr.1, align 8
  %idx_trunc.30 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.30 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.30
  %.103 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.30, i32 0, i32 3
  store i64 %slab.1, ptr %.103, align 8
  %idx_trunc.31 = trunc i64 %rm_next.0 to i32
  %ptr_gep.31 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr, i32 %idx_trunc.31
  %.105 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.31, i32 0, i32 0
  %.106 = sext i32 0 to i64
  store i64 %.106, ptr %.105, align 8
  br label %switch_merge.10

switch_default.11:                                ; preds = %switch_merge.2
  %.124 = zext i32 1 to i64
  %.125 = add i64 %rm_idx.0, %.124
  %.126 = zext i32 1 to i64
  %.127 = sub i64 %.3, %.126
  %.128 = and i64 %.125, %.127
  br label %while.cond.1
}

define i1 @standard__memory__allocators__stdheap__table_init__0__ret_boolE1() {
entry:
  %.2 = sext i32 1024 to i64
  %.4 = zext i32 32 to i64
  %.5 = mul i64 %.2, %.4
  %.7 = call i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.5)
  %.9 = zext i32 0 to i64
  %.10 = icmp eq i64 %.7, %.9
  %cond = icmp eq i1 %.10, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %entry, %while.end
  %common.ret.op = phi i1 [ true, %while.end ], [ false, %entry ]
  ret i1 %common.ret.op

switch_default:                                   ; preds = %entry
  %int_to_ptr = inttoptr i64 %.7 to ptr
  br label %while.cond

while.cond:                                       ; preds = %while.body, %switch_default
  %i.0 = phi i64 [ 0, %switch_default ], [ %.22, %while.body ]
  %.17 = icmp ult i64 %i.0, %.5
  br i1 %.17, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.19 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %i.0
  %.20 = trunc i32 0 to i8
  store i8 %.20, ptr %.19, align 1
  %.22 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %int_to_ptr.1 = inttoptr i64 %.7 to ptr
  store ptr %int_to_ptr.1, ptr @standard__memory__allocators__stdheap__g_table, align 8
  store i64 %.2, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.27 = sext i32 0 to i64
  store i64 %.27, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  store i64 %.5, ptr @standard__memory__allocators__stdheap__g_table_slab_cap, align 8
  %g_table = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.30 = sext i32 2 to i64
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %g_table, i64 %g_table_cap, i64 %.7, i64 %.5, i64 %.30, i64 %.7)
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.32 = add i64 %g_table_count, 1
  store i64 %.32, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %common.ret
}

define i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %key, i64 %size, i64 %kind, i64 %slab) {
entry:
  %g_table = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.10 = ptrtoint ptr %g_table to i64
  %.11 = ptrtoint ptr %int_to_ptr to i64
  %.12 = icmp eq i64 %.10, %.11
  %cond = icmp eq i1 %.12, true
  br i1 %cond, label %switch_case_0, label %switch_merge

switch_merge:                                     ; preds = %switch_case_0, %entry
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.20 = zext i32 2 to i64
  %.21 = mul i64 %g_table_count, %.20
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.22 = icmp uge i64 %.21, %g_table_cap
  %cond1 = icmp eq i1 %.22, true
  br i1 %cond1, label %switch_case_0.2, label %switch_merge.2

switch_case_0:                                    ; preds = %entry
  %op_overload_result = call i1 @standard__memory__allocators__stdheap__table_init__0__ret_boolE1()
  %.14 = xor i1 %op_overload_result, true
  %cond3 = icmp eq i1 %.14, true
  br i1 %cond3, label %common.ret, label %switch_merge

common.ret:                                       ; preds = %switch_case_0.2, %switch_case_0, %switch_merge.2
  %common.ret.op = phi i1 [ true, %switch_merge.2 ], [ false, %switch_case_0 ], [ false, %switch_case_0.2 ]
  ret i1 %common.ret.op

switch_merge.2:                                   ; preds = %switch_case_0.2, %switch_merge
  %g_table.1 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %g_table.1, i64 %g_table_cap.1, i64 %key, i64 %size, i64 %kind, i64 %slab)
  %g_table_count.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.31 = add i64 %g_table_count.1, 1
  store i64 %.31, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %common.ret

switch_case_0.2:                                  ; preds = %switch_merge
  %op_overload_result.1 = call i1 @standard__memory__allocators__stdheap__table_grow__0__ret_boolE1()
  %.24 = xor i1 %op_overload_result.1, true
  %cond2 = icmp eq i1 %.24, true
  br i1 %cond2, label %common.ret, label %switch_merge.2
}

; Function Attrs: alwaysinline
define ptr @standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1(i64 %key) #0 {
entry:
  %g_table = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.4 = ptrtoint ptr %g_table to i64
  %.5 = ptrtoint ptr %int_to_ptr to i64
  %.6 = icmp eq i64 %.4, %.5
  %cond = icmp eq i1 %.6, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_case_0.1, %while.end, %switch_case_0
  %common.ret.op = phi ptr [ %int_to_ptr.1, %switch_case_0 ], [ %int_to_ptr.2, %while.end ], [ %.16, %switch_case_0.1 ]
  ret ptr %common.ret.op

switch_case_0:                                    ; preds = %entry
  %int_to_ptr_zext.1 = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  br label %common.ret

switch_default:                                   ; preds = %entry
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.10 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key, i64 %g_table_cap)
  br label %while.cond

while.cond:                                       ; preds = %switch_default.1, %switch_default
  %idx.0 = phi i64 [ %.10, %switch_default ], [ %.23, %switch_default.1 ]
  %g_table.2 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.1 = trunc i64 %idx.0 to i32
  %ptr_gep.1 = getelementptr inbounds %BlockEntry, ptr %g_table.2, i32 %idx_trunc.1
  %key_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.1, i32 0, i32 0
  %key.2 = load i64, ptr %key_ptr, align 8
  %not_zero = icmp ne i64 %key.2, 0
  %not_null_result = zext i1 %not_zero to i8
  %tobool = icmp ne i8 %not_null_result, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %g_table.4 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.3 = trunc i64 %idx.0 to i32
  %ptr_gep.3 = getelementptr inbounds %BlockEntry, ptr %g_table.4, i32 %idx_trunc.3
  %key_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.3, i32 0, i32 0
  %key.3 = load i64, ptr %key_ptr.1, align 8
  %.14 = icmp eq i64 %key.3, %key
  %cond1 = icmp eq i1 %.14, true
  br i1 %cond1, label %switch_case_0.1, label %switch_default.1

while.end:                                        ; preds = %while.cond
  %int_to_ptr_zext.2 = zext i32 0 to i64
  %int_to_ptr.2 = inttoptr i64 %int_to_ptr_zext.2 to ptr
  br label %common.ret

switch_case_0.1:                                  ; preds = %while.body
  %array_param_ptr = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %.16 = getelementptr inbounds %BlockEntry, ptr %array_param_ptr, i64 %idx.0
  br label %common.ret

switch_default.1:                                 ; preds = %while.body
  %.19 = zext i32 1 to i64
  %.20 = add i64 %idx.0, %.19
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.21 = zext i32 1 to i64
  %.22 = sub i64 %g_table_cap.1, %.21
  %.23 = and i64 %.20, %.22
  br label %while.cond
}

define void @standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1(i64 %key) {
entry:
  %g_table = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.4 = ptrtoint ptr %g_table to i64
  %.5 = ptrtoint ptr %int_to_ptr to i64
  %.6 = icmp eq i64 %.4, %.5
  %cond = icmp eq i1 %.6, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %while.cond.1, %while.cond, %entry
  ret void

switch_default:                                   ; preds = %entry
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.10 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key, i64 %g_table_cap)
  br label %while.cond

while.cond:                                       ; preds = %switch_default.1, %switch_default
  %idx.0 = phi i64 [ %.10, %switch_default ], [ %.105, %switch_default.1 ]
  %g_table.2 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.1 = trunc i64 %idx.0 to i32
  %ptr_gep.1 = getelementptr inbounds %BlockEntry, ptr %g_table.2, i32 %idx_trunc.1
  %key_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.1, i32 0, i32 0
  %key.2 = load i64, ptr %key_ptr, align 8
  %.18 = zext i32 0 to i64
  %.19 = icmp ne i64 %key.2, %.18
  br i1 %.19, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %g_table.4 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.3 = trunc i64 %idx.0 to i32
  %ptr_gep.3 = getelementptr inbounds %BlockEntry, ptr %g_table.4, i32 %idx_trunc.3
  %key_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.3, i32 0, i32 0
  %key.3 = load i64, ptr %key_ptr.1, align 8
  %.21 = icmp eq i64 %key.3, %key
  %cond5 = icmp eq i1 %.21, true
  br i1 %cond5, label %switch_case_0.1, label %switch_default.1

switch_case_0.1:                                  ; preds = %while.body
  %g_table.5 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.4 = trunc i64 %idx.0 to i32
  %ptr_gep.4 = getelementptr inbounds %BlockEntry, ptr %g_table.5, i32 %idx_trunc.4
  %.23 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.4, i32 0, i32 0
  %.24 = sext i32 0 to i64
  store i64 %.24, ptr %.23, align 8
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.26 = sub i64 %g_table_count, 1
  store i64 %.26, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.29 = zext i32 1 to i64
  %.30 = add i64 %idx.0, %.29
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.31 = zext i32 1 to i64
  %.32 = sub i64 %g_table_cap.1, %.31
  %.33 = and i64 %.30, %.32
  br label %while.cond.1

switch_default.1:                                 ; preds = %while.body
  %.101 = zext i32 1 to i64
  %.102 = add i64 %idx.0, %.101
  %g_table_cap.4 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.103 = zext i32 1 to i64
  %.104 = sub i64 %g_table_cap.4, %.103
  %.105 = and i64 %.102, %.104
  br label %while.cond

while.cond.1:                                     ; preds = %switch_merge.9, %switch_case_0.1
  %next.0 = phi i64 [ %.33, %switch_case_0.1 ], [ %.96, %switch_merge.9 ]
  %hole.0 = phi i64 [ %idx.0, %switch_case_0.1 ], [ %hole.13, %switch_merge.9 ]
  %g_table.7 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.6 = trunc i64 %next.0 to i32
  %ptr_gep.6 = getelementptr inbounds %BlockEntry, ptr %g_table.7, i32 %idx_trunc.6
  %key_ptr.2 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.6, i32 0, i32 0
  %key.5 = load i64, ptr %key_ptr.2, align 8
  %.36 = zext i32 0 to i64
  %.37 = icmp ne i64 %key.5, %.36
  br i1 %.37, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %g_table.9 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.8 = trunc i64 %next.0 to i32
  %ptr_gep.8 = getelementptr inbounds %BlockEntry, ptr %g_table.9, i32 %idx_trunc.8
  %key_ptr.3 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.8, i32 0, i32 0
  %key.6 = load i64, ptr %key_ptr.3, align 8
  %g_table_cap.2 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.39 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key.6, i64 %g_table_cap.2)
  %.41 = icmp ult i64 %hole.0, %next.0
  %cond6 = icmp eq i1 %.41, true
  br i1 %cond6, label %switch_case_0.2, label %switch_default.2

switch_merge.2:                                   ; preds = %switch_merge.6, %switch_merge.3
  %should_shift.0 = phi i1 [ %., %switch_merge.3 ], [ %.15, %switch_merge.6 ]
  %cond10 = icmp eq i1 %should_shift.0, true
  br i1 %cond10, label %switch_case_0.9, label %switch_merge.9

switch_case_0.2:                                  ; preds = %while.body.1
  %.43 = icmp ugt i64 %.39, %hole.0
  %cond11 = icmp eq i1 %.43, true
  br i1 %cond11, label %switch_case_0.3, label %switch_merge.3

switch_default.2:                                 ; preds = %while.body.1
  %.60 = icmp ugt i64 %.39, %hole.0
  %cond7 = icmp eq i1 %.60, true
  br i1 %cond7, label %switch_merge.6, label %switch_default.6

switch_merge.3:                                   ; preds = %switch_case_0.3, %switch_case_0.2
  %in_range.0 = phi i1 [ false, %switch_case_0.2 ], [ %.14, %switch_case_0.3 ]
  %cond12 = icmp eq i1 %in_range.0, true
  %. = select i1 %cond12, i1 false, i1 true
  br label %switch_merge.2

switch_case_0.3:                                  ; preds = %switch_case_0.2
  %.45 = icmp ule i64 %.39, %next.0
  %cond13 = icmp eq i1 %.45, true
  %.14 = select i1 %cond13, i1 true, i1 false
  br label %switch_merge.3

switch_merge.6:                                   ; preds = %switch_default.6, %switch_default.2
  %in_range.22 = phi i1 [ true, %switch_default.2 ], [ %.16, %switch_default.6 ]
  %cond9 = icmp eq i1 %in_range.22, true
  %.15 = select i1 %cond9, i1 false, i1 true
  br label %switch_merge.2

switch_default.6:                                 ; preds = %switch_default.2
  %.64 = icmp ule i64 %.39, %next.0
  %cond8 = icmp eq i1 %.64, true
  %.16 = select i1 %cond8, i1 true, i1 false
  br label %switch_merge.6

switch_merge.9:                                   ; preds = %switch_merge.2, %switch_case_0.9
  %hole.13 = phi i64 [ %next.0, %switch_case_0.9 ], [ %hole.0, %switch_merge.2 ]
  %.92 = zext i32 1 to i64
  %.93 = add i64 %next.0, %.92
  %g_table_cap.3 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.94 = zext i32 1 to i64
  %.95 = sub i64 %g_table_cap.3, %.94
  %.96 = and i64 %.93, %.95
  br label %while.cond.1

switch_case_0.9:                                  ; preds = %switch_merge.2
  %g_table.11 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.10 = trunc i64 %next.0 to i32
  %ptr_gep.10 = getelementptr inbounds %BlockEntry, ptr %g_table.11, i32 %idx_trunc.10
  %key_ptr.4 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.10, i32 0, i32 0
  %key.7 = load i64, ptr %key_ptr.4, align 8
  %g_table.12 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.11 = trunc i64 %hole.0 to i32
  %ptr_gep.11 = getelementptr inbounds %BlockEntry, ptr %g_table.12, i32 %idx_trunc.11
  %.78 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.11, i32 0, i32 0
  store i64 %key.7, ptr %.78, align 8
  %g_table.14 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.13 = trunc i64 %next.0 to i32
  %ptr_gep.13 = getelementptr inbounds %BlockEntry, ptr %g_table.14, i32 %idx_trunc.13
  %size_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.13, i32 0, i32 1
  %size = load i64, ptr %size_ptr, align 8
  %g_table.15 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.14 = trunc i64 %hole.0 to i32
  %ptr_gep.14 = getelementptr inbounds %BlockEntry, ptr %g_table.15, i32 %idx_trunc.14
  %.80 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.14, i32 0, i32 1
  store i64 %size, ptr %.80, align 8
  %g_table.17 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.16 = trunc i64 %next.0 to i32
  %ptr_gep.16 = getelementptr inbounds %BlockEntry, ptr %g_table.17, i32 %idx_trunc.16
  %kind_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.16, i32 0, i32 2
  %kind = load i64, ptr %kind_ptr, align 8
  %g_table.18 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.17 = trunc i64 %hole.0 to i32
  %ptr_gep.17 = getelementptr inbounds %BlockEntry, ptr %g_table.18, i32 %idx_trunc.17
  %.82 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.17, i32 0, i32 2
  store i64 %kind, ptr %.82, align 8
  %g_table.20 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.19 = trunc i64 %next.0 to i32
  %ptr_gep.19 = getelementptr inbounds %BlockEntry, ptr %g_table.20, i32 %idx_trunc.19
  %slab_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.19, i32 0, i32 3
  %slab = load i64, ptr %slab_ptr, align 8
  %g_table.21 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.20 = trunc i64 %hole.0 to i32
  %ptr_gep.20 = getelementptr inbounds %BlockEntry, ptr %g_table.21, i32 %idx_trunc.20
  %.84 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.20, i32 0, i32 3
  store i64 %slab, ptr %.84, align 8
  %g_table.22 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.21 = trunc i64 %next.0 to i32
  %ptr_gep.21 = getelementptr inbounds %BlockEntry, ptr %g_table.22, i32 %idx_trunc.21
  %.86 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.21, i32 0, i32 0
  %.87 = sext i32 0 to i64
  store i64 %.87, ptr %.86, align 8
  br label %switch_merge.9
}

define ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %min_capacity) {
entry:
  %g_next_slab_size = load i64, ptr @standard__memory__allocators__stdheap__g_next_slab_size, align 8
  %.5 = add i32 40, 15
  %.6 = xor i32 15, -1
  %.7 = and i32 %.5, %.6
  %.8 = sext i32 %.7 to i64
  %.10 = add i64 %min_capacity, %.8
  %.11 = icmp ugt i64 %.10, %g_next_slab_size
  %cond = icmp eq i1 %.11, true
  %.13 = add i64 %min_capacity, %.8
  %sz.0 = select i1 %cond, i64 %.13, i64 %g_next_slab_size
  %.17 = call i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %sz.0)
  %.19 = zext i32 0 to i64
  %.20 = icmp eq i64 %.17, %.19
  %cond1 = icmp eq i1 %.20, true
  br i1 %cond1, label %switch_case_0.1, label %switch_default.1

common.ret:                                       ; preds = %switch_default.1, %switch_case_0.1
  %common.ret.op = phi ptr [ %int_to_ptr, %switch_case_0.1 ], [ %int_to_ptr.1, %switch_default.1 ]
  ret ptr %common.ret.op

switch_case_0.1:                                  ; preds = %entry
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

switch_default.1:                                 ; preds = %entry
  %int_to_ptr.1 = inttoptr i64 %.17 to ptr
  %.25 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 0
  store i64 %.17, ptr %.25, align 8
  %.27 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 1
  store i64 %sz.0, ptr %.27, align 8
  %.29 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 2
  store i64 %.8, ptr %.29, align 8
  %.31 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 3
  %.32 = sext i32 0 to i64
  store i64 %.32, ptr %.31, align 8
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.34 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 4
  store ptr %g_slab_head, ptr %.34, align 8
  store ptr %int_to_ptr.1, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %g_next_slab_size.1 = load i64, ptr @standard__memory__allocators__stdheap__g_next_slab_size, align 8
  %.37 = zext i32 2 to i64
  %.38 = mul i64 %g_next_slab_size.1, %.37
  %g_slab_size_cap = load i64, ptr @standard__memory__allocators__stdheap__g_slab_size_cap, align 8
  %.40 = icmp ugt i64 %.38, %g_slab_size_cap
  %cond2 = icmp eq i1 %.40, true
  %g_slab_size_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_slab_size_cap, align 8
  %next.0 = select i1 %cond2, i64 %g_slab_size_cap.1, i64 %.38
  store i64 %next.0, ptr @standard__memory__allocators__stdheap__g_next_slab_size, align 8
  br label %common.ret
}

; Function Attrs: alwaysinline
define i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %bytes) #0 {
entry:
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.5 = ptrtoint ptr %g_slab_head to i64
  %.6 = ptrtoint ptr %int_to_ptr to i64
  %.7 = icmp eq i64 %.5, %.6
  %cond = icmp eq i1 %.7, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_case_0, %switch_default
  %common.ret.op = phi i64 [ %.25, %switch_default ], [ %.10, %switch_case_0 ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.10 = sext i32 0 to i64
  br label %common.ret

switch_default:                                   ; preds = %entry
  %not_null = icmp ne ptr %g_slab_head, null
  %not_null_result = zext i1 %not_null to i8
  %frontier_ptr = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 2
  %frontier = load i64, ptr %frontier_ptr, align 8
  %.13 = add i64 %frontier, %bytes
  %capacity_ptr = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 1
  %capacity = load i64, ptr %capacity_ptr, align 8
  %.14 = icmp ule i64 %.13, %capacity
  %.15 = zext i1 %.14 to i8
  %.16 = and i8 %not_null_result, %.15
  %.17 = trunc i8 %.16 to i1
  %base_ptr = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 0
  %base = load i64, ptr %base_ptr, align 8
  %int_to_ptr.1 = inttoptr i64 %base to ptr
  %frontier_ptr.1 = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 2
  %frontier.1 = load i64, ptr %frontier_ptr.1, align 8
  %.19 = getelementptr i8, ptr %int_to_ptr.1, i64 %frontier.1
  %ptr_to_int = ptrtoint ptr %.19 to i64
  %frontier_ptr.2 = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 2
  %frontier.2 = load i64, ptr %frontier_ptr.2, align 8
  %.21 = add i64 %frontier.2, %bytes
  %.22 = getelementptr inbounds %Slab, ptr %g_slab_head, i32 0, i32 2
  store i64 %.21, ptr %.22, align 8
  %.24 = zext i1 %.17 to i64
  %.25 = mul i64 %ptr_to_int, %.24
  br label %common.ret
}

define i64 @standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size) {
entry:
  %.4 = call i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  %.6 = zext i32 0 to i64
  %.7 = icmp eq i64 %.4, %.6
  %cond = icmp eq i1 %.7, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_case_0.1, %switch_default.1, %switch_case_0
  %common.ret.op = phi i64 [ %.9, %switch_case_0 ], [ %.4, %switch_default.1 ], [ %.17, %switch_case_0.1 ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.9 = sext i32 0 to i64
  br label %common.ret

switch_default:                                   ; preds = %entry
  %.12 = sext i32 1 to i64
  %.13 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %.4, i64 %size, i64 %.12, i64 %size)
  %.14 = xor i1 %.13, true
  %cond1 = icmp eq i1 %.14, true
  br i1 %cond1, label %switch_case_0.1, label %switch_default.1

switch_case_0.1:                                  ; preds = %switch_default
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %.4, i64 %size)
  %.17 = sext i32 0 to i64
  br label %common.ret

switch_default.1:                                 ; preds = %switch_default
  %g_large_used = load i64, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  %.20 = add i64 %g_large_used, 1
  store i64 %.20, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  br label %common.ret
}

define i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size) {
entry:
  %.4 = zext i1 false to i64
  %.5 = icmp eq i64 %size, %.4
  %cond = icmp eq i1 %.5, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %entry, %switch_case_0.6, %switch_default.6, %switch_case_0.5, %switch_case_0.4, %switch_case_0.2, %switch_case_0.1
  %common.ret.op = phi i64 [ %.12, %switch_case_0.1 ], [ %ptr_to_int, %switch_case_0.2 ], [ %.41, %switch_case_0.4 ], [ %.49, %switch_case_0.5 ], [ %ptr.0, %switch_default.6 ], [ %.58, %switch_case_0.6 ], [ %size, %entry ]
  ret i64 %common.ret.op

switch_default:                                   ; preds = %entry
  %.9 = zext i32 4096 to i64
  %.10 = icmp ugt i64 %size, %.9
  %cond1 = icmp eq i1 %.10, true
  br i1 %cond1, label %switch_case_0.1, label %switch_default.1

switch_case_0.1:                                  ; preds = %switch_default
  %.12 = call i64 @standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  br label %common.ret

switch_default.1:                                 ; preds = %switch_default
  %.15 = zext i32 1 to i64
  %.16 = sub i64 %size, %.15
  %.17 = zext i32 15 to i64
  %.18 = or i64 %.16, %.17
  %.19 = call i64 @standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.18)
  %.20 = sext i32 3 to i64
  %.21 = sub i64 %.19, %.20
  %idx_trunc = trunc i64 %.21 to i32
  %array_gep = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i32 %idx_trunc
  %array_load = load ptr, ptr %array_gep, align 8
  %not_null = icmp ne ptr %array_load, null
  %not_null_result = zext i1 %not_null to i8
  %cond2 = icmp eq i8 %not_null_result, 1
  br i1 %cond2, label %switch_case_0.2, label %switch_default.2

switch_case_0.2:                                  ; preds = %switch_default.1
  %next_ptr = getelementptr inbounds %FreeNode, ptr %array_load, i32 0, i32 0
  %next = load ptr, ptr %next_ptr, align 8
  %.25 = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i64 %.21
  store ptr %next, ptr %.25, align 8
  %ptr_to_int = ptrtoint ptr %array_load to i64
  br label %common.ret

switch_default.2:                                 ; preds = %switch_default.1
  %.29 = call i64 @standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.21)
  %.31 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.29)
  %.33 = zext i1 false to i64
  %.34 = icmp eq i64 %.31, %.33
  %cond3 = icmp eq i1 %.34, true
  br i1 %cond3, label %switch_case_0.3, label %switch_merge.3

switch_merge.3:                                   ; preds = %switch_default.4, %switch_default.2
  %ptr.0 = phi i64 [ %.31, %switch_default.2 ], [ %.44, %switch_default.4 ]
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %ptr_to_int.1 = ptrtoint ptr %g_slab_head to i64
  %.54 = sext i32 0 to i64
  %.55 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %ptr.0, i64 %.21, i64 %.54, i64 %ptr_to_int.1)
  %.56 = xor i1 %.55, true
  %cond4 = icmp eq i1 %.56, true
  br i1 %cond4, label %switch_case_0.6, label %switch_default.6

switch_case_0.3:                                  ; preds = %switch_default.2
  %.36 = call ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %.29)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.37 = ptrtoint ptr %.36 to i64
  %.38 = ptrtoint ptr %int_to_ptr to i64
  %.39 = icmp eq i64 %.37, %.38
  %cond5 = icmp eq i1 %.39, true
  br i1 %cond5, label %switch_case_0.4, label %switch_default.4

switch_case_0.4:                                  ; preds = %switch_case_0.3
  %.41 = sext i32 0 to i64
  br label %common.ret

switch_default.4:                                 ; preds = %switch_case_0.3
  %.44 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.29)
  %.46 = zext i1 false to i64
  %.47 = icmp eq i64 %.44, %.46
  %cond6 = icmp eq i1 %.47, true
  br i1 %cond6, label %switch_case_0.5, label %switch_merge.3

switch_case_0.5:                                  ; preds = %switch_default.4
  %.49 = sext i32 0 to i64
  br label %common.ret

switch_case_0.6:                                  ; preds = %switch_merge.3
  %.58 = sext i32 0 to i64
  br label %common.ret

switch_default.6:                                 ; preds = %switch_merge.3
  %g_slab_head.2 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %used_ptr = getelementptr inbounds %Slab, ptr %g_slab_head.2, i32 0, i32 3
  %used = load i64, ptr %used_ptr, align 8
  %.61 = add i64 %used, 1
  %g_slab_head.3 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.62 = getelementptr inbounds %Slab, ptr %g_slab_head.3, i32 0, i32 3
  store i64 %.61, ptr %.62, align 8
  br label %common.ret
}

define i64 @standard__memory__allocators__stdheap__fmalloc__1__ulongE1__ret_dataE1_ubits64(i64 %size) {
entry:
  %.4 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  ret i64 %.4
}

define void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr) {
entry:
  %.4 = zext i1 false to i64
  %.5 = icmp eq i64 %ptr, %.4
  %cond = icmp eq i1 %.5, true
  br i1 %cond, label %common.ret, label %switch_default

common.ret:                                       ; preds = %switch_default, %entry, %switch_case_0.2, %switch_default.2
  ret void

switch_default:                                   ; preds = %entry
  %.9 = call ptr @standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1(i64 %ptr)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.11 = ptrtoint ptr %.9 to i64
  %.12 = ptrtoint ptr %int_to_ptr to i64
  %.13 = icmp eq i64 %.11, %.12
  %cond1 = icmp eq i1 %.13, true
  br i1 %cond1, label %common.ret, label %switch_default.1

switch_default.1:                                 ; preds = %switch_default
  %kind_ptr = getelementptr inbounds %BlockEntry, ptr %.9, i32 0, i32 2
  %kind.1 = load i64, ptr %kind_ptr, align 8
  %size_ptr = getelementptr inbounds %BlockEntry, ptr %.9, i32 0, i32 1
  %size.1 = load i64, ptr %size_ptr, align 8
  %slab_ptr = getelementptr inbounds %BlockEntry, ptr %.9, i32 0, i32 3
  %slab.1 = load i64, ptr %slab_ptr, align 8
  %.20 = zext i32 1 to i64
  %.21 = icmp eq i64 %kind.1, %.20
  %cond2 = icmp eq i1 %.21, true
  br i1 %cond2, label %switch_case_0.2, label %switch_default.2

switch_case_0.2:                                  ; preds = %switch_default.1
  call void @standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1(i64 %ptr)
  %g_large_used = load i64, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  %.24 = sub i64 %g_large_used, 1
  store i64 %.24, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %ptr, i64 %slab.1)
  br label %common.ret

switch_default.2:                                 ; preds = %switch_default.1
  %.29 = sext i32 3 to i64
  %.30 = getelementptr inbounds %BlockEntry, ptr %.9, i32 0, i32 2
  store i64 %.29, ptr %.30, align 8
  %int_to_ptr.1 = inttoptr i64 %ptr to ptr
  call void @standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1(i64 %size.1, ptr %int_to_ptr.1)
  br label %common.ret
}

define void @standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1(ptr %ptr) {
entry:
  %ptr_to_int = ptrtoint ptr %ptr to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int)
  ret void
}

define i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr, i64 %new_size) {
entry:
  %.6 = zext i1 false to i64
  %.7 = icmp eq i64 %ptr, %.6
  %cond = icmp eq i1 %.7, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_default.3, %switch_case_0.3, %while.end.2, %switch_case_0.14, %while.end.1, %switch_case_0.13, %switch_merge.11, %switch_case_0.2, %switch_case_0.1, %switch_case_0
  %common.ret.op = phi i64 [ %.9, %switch_case_0 ], [ %.16, %switch_case_0.1 ], [ %.25, %switch_case_0.2 ], [ %ptr_to_int, %switch_merge.11 ], [ %.127, %switch_case_0.13 ], [ %.122, %while.end.1 ], [ %.149, %switch_case_0.14 ], [ %.144, %while.end.2 ], [ %ptr, %switch_case_0.3 ], [ %ptr, %switch_default.3 ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.9 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %new_size)
  br label %common.ret

switch_default:                                   ; preds = %entry
  %.12 = zext i32 0 to i64
  %.13 = icmp eq i64 %new_size, %.12
  %cond5 = icmp eq i1 %.13, true
  br i1 %cond5, label %switch_case_0.1, label %switch_default.1

switch_case_0.1:                                  ; preds = %switch_default
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr)
  %.16 = sext i32 0 to i64
  br label %common.ret

switch_default.1:                                 ; preds = %switch_default
  %.19 = call ptr @standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1(i64 %ptr)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.21 = ptrtoint ptr %.19 to i64
  %.22 = ptrtoint ptr %int_to_ptr to i64
  %.23 = icmp eq i64 %.21, %.22
  %cond6 = icmp eq i1 %.23, true
  br i1 %cond6, label %switch_case_0.2, label %switch_default.2

switch_case_0.2:                                  ; preds = %switch_default.1
  %.25 = sext i32 0 to i64
  br label %common.ret

switch_default.2:                                 ; preds = %switch_default.1
  %kind_ptr = getelementptr inbounds %BlockEntry, ptr %.19, i32 0, i32 2
  %kind.1 = load i64, ptr %kind_ptr, align 8
  %size_ptr = getelementptr inbounds %BlockEntry, ptr %.19, i32 0, i32 1
  %size = load i64, ptr %size_ptr, align 8
  %.42 = zext i32 1 to i64
  %.43 = icmp eq i64 %kind.1, %.42
  %cond7 = icmp eq i1 %.43, true
  br i1 %cond7, label %switch_case_0.3, label %switch_default.3

switch_case_0.3:                                  ; preds = %switch_default.2
  %.45 = icmp eq i64 %size, %new_size
  %cond17 = icmp eq i1 %.45, true
  br i1 %cond17, label %common.ret, label %switch_default.4

switch_default.3:                                 ; preds = %switch_default.2
  %.52 = call i64 @standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %new_size)
  %.54 = icmp eq i64 %.52, %size
  %cond8 = icmp eq i1 %.54, true
  %.59 = icmp ult i64 %.52, %size
  %cond9 = icmp eq i1 %.59, true
  %or.cond = or i1 %cond8, %cond9
  br i1 %or.cond, label %common.ret, label %switch_default.6

switch_default.4:                                 ; preds = %switch_case_0.3
  %.144 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %new_size)
  %.146 = zext i1 false to i64
  %.147 = icmp eq i64 %.144, %.146
  %cond18 = icmp eq i1 %.147, true
  br i1 %cond18, label %switch_case_0.14, label %switch_default.14

switch_default.6:                                 ; preds = %switch_default.3
  %.64 = call i64 @standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  %.66 = icmp ult i64 %new_size, %.64
  %cond10 = icmp eq i1 %.66, true
  %new_size..64 = select i1 %cond10, i64 %new_size, i64 %.64
  %.71 = call ptr @standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1(i64 %.52)
  %not_null = icmp ne ptr %.71, null
  %not_null_result = zext i1 %not_null to i8
  %.73 = trunc i8 %not_null_result to i1
  %cond11 = icmp eq i1 %.73, true
  br i1 %cond11, label %switch_case_0.8, label %switch_default.8

switch_case_0.8:                                  ; preds = %switch_default.6
  %ptr_to_int = ptrtoint ptr %.71 to i64
  %.77 = call ptr @standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1(i64 %ptr_to_int)
  %not_null.1 = icmp ne ptr %.77, null
  %not_null_result.1 = zext i1 %not_null.1 to i8
  %cond13 = icmp eq i8 %not_null_result.1, 1
  br i1 %cond13, label %switch_case_0.9, label %switch_merge.9

switch_default.8:                                 ; preds = %switch_default.6
  %.122 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %new_size)
  %.124 = zext i1 false to i64
  %.125 = icmp eq i64 %.122, %.124
  %cond12 = icmp eq i1 %.125, true
  br i1 %cond12, label %switch_case_0.13, label %switch_default.13

switch_merge.9:                                   ; preds = %switch_case_0.9, %switch_case_0.10, %switch_case_0.8
  %int_to_ptr.2 = inttoptr i64 %ptr to ptr
  %int_to_ptr.3 = inttoptr i64 %ptr_to_int to ptr
  br label %while.cond

switch_case_0.9:                                  ; preds = %switch_case_0.8
  %slab_ptr = getelementptr inbounds %BlockEntry, ptr %.77, i32 0, i32 3
  %slab = load i64, ptr %slab_ptr, align 8
  %int_to_ptr.1 = inttoptr i64 %slab to ptr
  %.81 = getelementptr inbounds %BlockEntry, ptr %.77, i32 0, i32 1
  store i64 %.52, ptr %.81, align 8
  %.83 = getelementptr inbounds %BlockEntry, ptr %.77, i32 0, i32 2
  %.84 = sext i32 0 to i64
  store i64 %.84, ptr %.83, align 8
  %not_null.2 = icmp ne ptr %int_to_ptr.1, null
  %not_null_result.2 = zext i1 %not_null.2 to i8
  %cond16 = icmp eq i8 %not_null_result.2, 1
  br i1 %cond16, label %switch_case_0.10, label %switch_merge.9

switch_case_0.10:                                 ; preds = %switch_case_0.9
  %used_ptr = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 3
  %used = load i64, ptr %used_ptr, align 8
  %.87 = add i64 %used, 1
  %.88 = getelementptr inbounds %Slab, ptr %int_to_ptr.1, i32 0, i32 3
  store i64 %.87, ptr %.88, align 8
  br label %switch_merge.9

while.cond:                                       ; preds = %while.body, %switch_merge.9
  %i.0 = phi i64 [ 0, %switch_merge.9 ], [ %.101, %while.body ]
  %.97 = icmp ult i64 %i.0, %new_size..64
  br i1 %.97, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idx_trunc = trunc i64 %i.0 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.2, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.99 = getelementptr inbounds i8, ptr %int_to_ptr.3, i64 %i.0
  store i8 %ptr_load, ptr %.99, align 1
  %.101 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %slab_ptr.1 = getelementptr inbounds %BlockEntry, ptr %.19, i32 0, i32 3
  %slab.1 = load i64, ptr %slab_ptr.1, align 8
  %int_to_ptr.4 = inttoptr i64 %slab.1 to ptr
  %not_null.3 = icmp ne ptr %int_to_ptr.4, null
  %not_null_result.3 = zext i1 %not_null.3 to i8
  %cond14 = icmp eq i8 %not_null_result.3, 1
  br i1 %cond14, label %switch_case_0.11, label %switch_merge.11

switch_merge.11:                                  ; preds = %switch_case_0.11, %switch_case_0.12, %while.end
  %.116 = sext i32 3 to i64
  %.117 = getelementptr inbounds %BlockEntry, ptr %.19, i32 0, i32 2
  store i64 %.116, ptr %.117, align 8
  %int_to_ptr.5 = inttoptr i64 %ptr to ptr
  call void @standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1(i64 %size, ptr %int_to_ptr.5)
  br label %common.ret

switch_case_0.11:                                 ; preds = %while.end
  %used_ptr.1 = getelementptr inbounds %Slab, ptr %int_to_ptr.4, i32 0, i32 3
  %used.1 = load i64, ptr %used_ptr.1, align 8
  %.106 = zext i32 0 to i64
  %.107 = icmp ugt i64 %used.1, %.106
  %cond15 = icmp eq i1 %.107, true
  br i1 %cond15, label %switch_case_0.12, label %switch_merge.11

switch_case_0.12:                                 ; preds = %switch_case_0.11
  %used_ptr.2 = getelementptr inbounds %Slab, ptr %int_to_ptr.4, i32 0, i32 3
  %used.2 = load i64, ptr %used_ptr.2, align 8
  %.109 = sub i64 %used.2, 1
  %.110 = getelementptr inbounds %Slab, ptr %int_to_ptr.4, i32 0, i32 3
  store i64 %.109, ptr %.110, align 8
  br label %switch_merge.11

switch_case_0.13:                                 ; preds = %switch_default.8
  %.127 = sext i32 0 to i64
  br label %common.ret

switch_default.13:                                ; preds = %switch_default.8
  %int_to_ptr.6 = inttoptr i64 %ptr to ptr
  %int_to_ptr.7 = inttoptr i64 %.122 to ptr
  %.132 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %switch_default.13
  %i.13 = phi i64 [ %.132, %switch_default.13 ], [ %.139, %while.body.1 ]
  %.135 = icmp ult i64 %i.13, %new_size..64
  br i1 %.135, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.1 = trunc i64 %i.13 to i32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %int_to_ptr.6, i32 %idx_trunc.1
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.137 = getelementptr inbounds i8, ptr %int_to_ptr.7, i64 %i.13
  store i8 %ptr_load.1, ptr %.137, align 1
  %.139 = add i64 %i.13, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr)
  br label %common.ret

switch_case_0.14:                                 ; preds = %switch_default.4
  %.149 = sext i32 0 to i64
  br label %common.ret

switch_default.14:                                ; preds = %switch_default.4
  %int_to_ptr.8 = inttoptr i64 %ptr to ptr
  %int_to_ptr.9 = inttoptr i64 %.144 to ptr
  %.155 = icmp ult i64 %new_size, %size
  %cond19 = icmp eq i1 %.155, true
  %new_size.size = select i1 %cond19, i64 %new_size, i64 %size
  %.160 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %switch_default.14
  %i.24 = phi i64 [ %.160, %switch_default.14 ], [ %.167, %while.body.2 ]
  %.163 = icmp ult i64 %i.24, %new_size.size
  br i1 %.163, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.2 = trunc i64 %i.24 to i32
  %ptr_gep.2 = getelementptr inbounds i8, ptr %int_to_ptr.8, i32 %idx_trunc.2
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.165 = getelementptr inbounds i8, ptr %int_to_ptr.9, i64 %i.24
  store i8 %ptr_load.2, ptr %.165, align 1
  %.167 = add i64 %i.24, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr)
  br label %common.ret
}

define void @standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1() {
entry:
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  br label %while.cond

while.cond:                                       ; preds = %switch_merge, %entry
  %prev.0 = phi ptr [ null, %entry ], [ %prev.13, %switch_merge ]
  %slab.0 = phi ptr [ %g_slab_head, %entry ], [ %next.1, %switch_merge ]
  %bin_idx.0 = phi i64 [ 0, %entry ], [ %bin_idx.11, %switch_merge ]
  %not_null = icmp ne ptr %slab.0, null
  %not_null_result = zext i1 %not_null to i8
  %tobool = icmp ne i8 %not_null_result, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %next_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 4
  %next.1 = load ptr, ptr %next_ptr, align 8
  %used_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 3
  %used = load i64, ptr %used_ptr, align 8
  %.16 = zext i32 0 to i64
  %.17 = icmp eq i64 %used, %.16
  %cond = icmp eq i1 %.17, true
  br i1 %cond, label %while.cond.1, label %switch_merge

while.end:                                        ; preds = %while.cond
  ret void

switch_merge:                                     ; preds = %while.body, %switch_merge.3
  %prev.13 = phi ptr [ %prev.0, %switch_merge.3 ], [ %slab.0, %while.body ]
  %bin_idx.11 = phi i64 [ %bin_idx.22, %switch_merge.3 ], [ %bin_idx.0, %while.body ]
  br label %while.cond

while.cond.1:                                     ; preds = %while.body, %while.end.3
  %bin_idx.22 = phi i64 [ %.61, %while.end.3 ], [ %bin_idx.0, %while.body ]
  %.20 = zext i32 8 to i64
  %.21 = icmp ule i64 %bin_idx.22, %.20
  br i1 %.21, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.23 = call ptr @standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1(i64 %bin_idx.22)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %int_to_ptr_zext.1 = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  br label %while.cond.2

while.end.1:                                      ; preds = %while.cond.1
  %int_to_ptr_zext.4 = zext i32 0 to i64
  %int_to_ptr.4 = inttoptr i64 %int_to_ptr_zext.4 to ptr
  %.64 = ptrtoint ptr %prev.0 to i64
  %.65 = ptrtoint ptr %int_to_ptr.4 to i64
  %.66 = icmp eq i64 %.64, %.65
  %cond6 = icmp eq i1 %.66, true
  br i1 %cond6, label %switch_case_0.3, label %switch_default.3

while.cond.2:                                     ; preds = %switch_merge.1, %while.body.1
  %keep_tail.0 = phi ptr [ %int_to_ptr.1, %while.body.1 ], [ %keep_tail.15, %switch_merge.1 ]
  %keep_head.0 = phi ptr [ %int_to_ptr, %while.body.1 ], [ %keep_head.14, %switch_merge.1 ]
  %node.0 = phi ptr [ %.23, %while.body.1 ], [ %next.2, %switch_merge.1 ]
  %not_null.1 = icmp ne ptr %node.0, null
  %not_null_result.1 = zext i1 %not_null.1 to i8
  %tobool.1 = icmp ne i8 %not_null_result.1, 0
  br i1 %tobool.1, label %while.body.2, label %while.cond.3

while.body.2:                                     ; preds = %while.cond.2
  %ptr_to_int = ptrtoint ptr %node.0 to i64
  %next_ptr.1 = getelementptr inbounds %FreeNode, ptr %node.0, i32 0, i32 0
  %next.2 = load ptr, ptr %next_ptr.1, align 8
  %base_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 0
  %base = load i64, ptr %base_ptr, align 8
  %.31 = icmp uge i64 %ptr_to_int, %base
  br i1 %.31, label %sc_rhs, label %sc_end

sc_rhs:                                           ; preds = %while.body.2
  %base_ptr.1 = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 0
  %base.1 = load i64, ptr %base_ptr.1, align 8
  %capacity_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 1
  %capacity = load i64, ptr %capacity_ptr, align 8
  %.33 = add i64 %base.1, %capacity
  %.34 = icmp ult i64 %ptr_to_int, %.33
  br label %sc_end

sc_end:                                           ; preds = %sc_rhs, %while.body.2
  %sc_result = phi i1 [ false, %while.body.2 ], [ %.34, %sc_rhs ]
  %cond7 = icmp eq i1 %sc_result, true
  br i1 %cond7, label %switch_merge.1, label %switch_default.1

switch_merge.1:                                   ; preds = %switch_default.1, %switch_default.2, %sc_end
  %keep_tail.15 = phi ptr [ %keep_tail.0, %sc_end ], [ %node.0, %switch_default.2 ], [ %node.0, %switch_default.1 ]
  %keep_head.14 = phi ptr [ %keep_head.0, %sc_end ], [ %keep_head.0, %switch_default.2 ], [ %node.0, %switch_default.1 ]
  br label %while.cond.2

switch_default.1:                                 ; preds = %sc_end
  %int_to_ptr_zext.2 = zext i32 0 to i64
  %int_to_ptr.2 = inttoptr i64 %int_to_ptr_zext.2 to ptr
  %.38 = getelementptr inbounds %FreeNode, ptr %node.0, i32 0, i32 0
  store ptr %int_to_ptr.2, ptr %.38, align 8
  %int_to_ptr_zext.3 = zext i32 0 to i64
  %int_to_ptr.3 = inttoptr i64 %int_to_ptr_zext.3 to ptr
  %.40 = ptrtoint ptr %keep_tail.0 to i64
  %.41 = ptrtoint ptr %int_to_ptr.3 to i64
  %.42 = icmp eq i64 %.40, %.41
  %cond8 = icmp eq i1 %.42, true
  br i1 %cond8, label %switch_merge.1, label %switch_default.2

switch_default.2:                                 ; preds = %switch_default.1
  %.47 = getelementptr inbounds %FreeNode, ptr %keep_tail.0, i32 0, i32 0
  store ptr %node.0, ptr %.47, align 8
  br label %switch_merge.1

while.cond.3:                                     ; preds = %while.cond.2, %while.body.3
  %reinsert.0 = phi ptr [ %next.3, %while.body.3 ], [ %keep_head.0, %while.cond.2 ]
  %not_null.2 = icmp ne ptr %reinsert.0, null
  %not_null_result.2 = zext i1 %not_null.2 to i8
  %tobool.2 = icmp ne i8 %not_null_result.2, 0
  br i1 %tobool.2, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %next_ptr.2 = getelementptr inbounds %FreeNode, ptr %reinsert.0, i32 0, i32 0
  %next.3 = load ptr, ptr %next_ptr.2, align 8
  call void @standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1(i64 %bin_idx.22, ptr %reinsert.0)
  br label %while.cond.3

while.end.3:                                      ; preds = %while.cond.3
  %.61 = add i64 %bin_idx.22, 1
  br label %while.cond.1

switch_merge.3:                                   ; preds = %switch_default.3, %switch_case_0.3
  %base_ptr.2 = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 0
  %base.2 = load i64, ptr %base_ptr.2, align 8
  %capacity_ptr.1 = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 1
  %capacity.1 = load i64, ptr %capacity_ptr.1, align 8
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %base.2, i64 %capacity.1)
  br label %switch_merge

switch_case_0.3:                                  ; preds = %while.end.1
  store ptr %next.1, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  br label %switch_merge.3

switch_default.3:                                 ; preds = %while.end.1
  %.70 = getelementptr inbounds %Slab, ptr %prev.0, i32 0, i32 4
  store ptr %next.1, ptr %.70, align 8
  br label %switch_merge.3
}

define float @standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1() {
entry:
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %slab.0 = phi ptr [ %g_slab_head, %entry ], [ %next, %while.body ]
  %total_used.0 = phi i64 [ 0, %entry ], [ %.17, %while.body ]
  %total_capacity.0 = phi i64 [ 0, %entry ], [ %.15, %while.body ]
  %not_null = icmp ne ptr %slab.0, null
  %not_null_result = zext i1 %not_null to i8
  %tobool = icmp ne i8 %not_null_result, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %capacity_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 1
  %capacity = load i64, ptr %capacity_ptr, align 8
  %.12 = zext i32 40 to i64
  %.13 = sub i64 %capacity, %.12
  %.15 = add i64 %total_capacity.0, %.13
  %used_ptr.1 = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 3
  %used.1 = load i64, ptr %used_ptr.1, align 8
  %.17 = add i64 %total_used.0, %used.1
  %next_ptr = getelementptr inbounds %Slab, ptr %slab.0, i32 0, i32 4
  %next = load ptr, ptr %next_ptr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.21 = zext i32 0 to i64
  %.22 = icmp eq i64 %total_capacity.0, %.21
  %cond = icmp eq i1 %.22, true
  br i1 %cond, label %switch_case_0, label %switch_default

switch_case_0:                                    ; preds = %while.end
  %g_large_used = load i64, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  %.24 = zext i32 0 to i64
  %.25 = icmp ugt i64 %g_large_used, %.24
  %cond10 = icmp eq i1 %.25, true
  %. = select i1 %cond10, float 1.000000e+00, float 0.000000e+00
  br label %common.ret

switch_default:                                   ; preds = %while.end
  %g_slab_head.1 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  br label %while.cond.1

common.ret:                                       ; preds = %while.end.1, %switch_case_0, %switch_default.2
  %common.ret.op = phi float [ %.61, %switch_default.2 ], [ %., %switch_case_0 ], [ 0.000000e+00, %while.end.1 ]
  ret float %common.ret.op

while.cond.1:                                     ; preds = %while.body.1, %switch_default
  %slab.17 = phi ptr [ %g_slab_head.1, %switch_default ], [ %next.1, %while.body.1 ]
  %committed.0 = phi i64 [ 0, %switch_default ], [ %.38, %while.body.1 ]
  %not_null.1 = icmp ne ptr %slab.17, null
  %not_null_result.1 = zext i1 %not_null.1 to i8
  %tobool.1 = icmp ne i8 %not_null_result.1, 0
  br i1 %tobool.1, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %frontier_ptr.1 = getelementptr inbounds %Slab, ptr %slab.17, i32 0, i32 2
  %frontier.1 = load i64, ptr %frontier_ptr.1, align 8
  %.36 = zext i32 40 to i64
  %.37 = sub i64 %frontier.1, %.36
  %.38 = add i64 %committed.0, %.37
  %next_ptr.1 = getelementptr inbounds %Slab, ptr %slab.17, i32 0, i32 4
  %next.1 = load ptr, ptr %next_ptr.1, align 8
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %g_large_used.1 = load i64, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  %.42 = add i64 %total_used.0, %g_large_used.1
  %.44 = zext i32 0 to i64
  %.45 = icmp eq i64 %committed.0, %.44
  %cond8 = icmp eq i1 %.45, true
  br i1 %cond8, label %common.ret, label %switch_default.2

switch_default.2:                                 ; preds = %while.end.1
  %.49 = zext i32 16 to i64
  %.50 = mul i64 %.42, %.49
  %.52 = icmp ugt i64 %.50, %committed.0
  %cond9 = icmp eq i1 %.52, true
  %committed.0..50 = select i1 %cond9, i64 %committed.0, i64 %.50
  %.57 = sub i64 %committed.0, %committed.0..50
  %.59 = sitofp i64 %.57 to float
  %.60 = sitofp i64 %committed.0 to float
  %.61 = fdiv float %.59, %.60
  br label %common.ret
}

define i1 @standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1(i8 %c) {
entry:
  switch i8 %c, label %sc_rhs.1 [
    i8 32, label %sc_end.1
    i8 9, label %sc_end.1
    i8 10, label %sc_end.1
  ]

sc_rhs.1:                                         ; preds = %entry
  br label %sc_end.1

sc_end.1:                                         ; preds = %entry, %entry, %entry, %sc_rhs.1
  %sc_result.1 = phi i1 [ true, %entry ], [ false, %sc_rhs.1 ], [ true, %entry ], [ true, %entry ]
  %.12 = icmp eq i8 %c, 13
  %spec.select1 = select i1 %sc_result.1, i1 true, i1 %.12
  ret i1 %spec.select1
}

define i1 @standard__strings__helpers__is_digit__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 48
  %.6 = icmp sle i8 %c, 57
  %spec.select = select i1 %.4, i1 %.6, i1 false
  ret i1 %spec.select
}

define i1 @standard__strings__helpers__is_alpha__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.6 = icmp sle i8 %c, 122
  %spec.select = select i1 %.4, i1 %.6, i1 false
  br i1 %spec.select, label %sc_end.1, label %sc_rhs.1

sc_rhs.1:                                         ; preds = %entry
  %.9 = icmp sge i8 %c, 65
  %.11 = icmp sle i8 %c, 90
  %spec.select1 = select i1 %.9, i1 %.11, i1 false
  br label %sc_end.1

sc_end.1:                                         ; preds = %sc_rhs.1, %entry
  %sc_result.2 = phi i1 [ true, %entry ], [ %spec.select1, %sc_rhs.1 ]
  ret i1 %sc_result.2
}

define i1 @standard__strings__helpers__is_upper__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 65
  %.6 = icmp sle i8 %c, 90
  %spec.select = select i1 %.4, i1 %.6, i1 false
  ret i1 %spec.select
}

define i1 @standard__strings__helpers__is_lower__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.6 = icmp sle i8 %c, 122
  %spec.select = select i1 %.4, i1 %.6, i1 false
  ret i1 %spec.select
}

define i1 @standard__strings__helpers__is_alnum__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = call i1 @standard__strings__helpers__is_alpha__1__charE1__ret_boolE1(i8 %c)
  br i1 %.4, label %sc_end, label %sc_rhs

sc_rhs:                                           ; preds = %entry
  %.6 = call i1 @standard__strings__helpers__is_digit__1__charE1__ret_boolE1(i8 %c)
  br label %sc_end

sc_end:                                           ; preds = %sc_rhs, %entry
  %sc_result = phi i1 [ true, %entry ], [ %.6, %sc_rhs ]
  ret i1 %sc_result
}

define i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 65
  %.6 = icmp sle i8 %c, 90
  %spec.select = select i1 %.4, i1 %.6, i1 false
  %.9 = sext i8 %c to i32
  %.10 = add i32 %.9, 32
  %.11 = trunc i32 %.10 to i8
  %common.ret.op = select i1 %spec.select, i8 %.11, i8 %c
  ret i8 %common.ret.op
}

define i8 @standard__strings__helpers__to_upper__1__charE1__ret_charE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.6 = icmp sle i8 %c, 122
  %spec.select = select i1 %.4, i1 %.6, i1 false
  %.9 = sext i8 %c to i32
  %.10 = sub i32 %.9, 32
  %.11 = trunc i32 %.10 to i8
  %common.ret.op = select i1 %spec.select, i8 %.11, i8 %c
  ret i8 %common.ret.op
}

define i32 @standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1(ptr %str, i8 %ch, i32 %start_pos) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %i.0 = phi i32 [ %start_pos, %entry ], [ %.18, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = zext i8 %ptr_load to i32
  %.11 = icmp ne i32 %.10, 0
  br i1 %.11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.13 = icmp eq i8 %ptr_load.1, %ch
  br i1 %.13, label %common.ret, label %ifcont

common.ret:                                       ; preds = %for.body, %for.end
  %common.ret.op = phi i32 [ %.21, %for.end ], [ %i.0, %for.body ]
  ret i32 %common.ret.op

for.end:                                          ; preds = %for.cond
  %.21 = sub i32 0, 1
  br label %common.ret

ifcont:                                           ; preds = %for.body
  %.18 = add i32 %i.0, 1
  br label %for.cond
}

define i32 @standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1(ptr %str, ptr %substr, i32 %start_pos) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %str_len.0 = phi i32 [ 0, %entry ], [ %.15, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %str_len.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.12 = zext i8 %ptr_load to i32
  %.13 = icmp ne i32 %.12, 0
  br i1 %.13, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.15 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %substr_len.0 = phi i32 [ %.22, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %substr_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.19 = zext i8 %ptr_load.1 to i32
  %.20 = icmp ne i32 %.19, 0
  br i1 %.20, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.22 = add i32 %substr_len.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.25 = icmp eq i32 %substr_len.0, 0
  br i1 %.25, label %common.ret, label %for.cond

common.ret:                                       ; preds = %for.cond.1, %while.end.1, %for.end
  %common.ret.op = phi i32 [ %.56, %for.end ], [ %start_pos, %while.end.1 ], [ %i.0, %for.cond.1 ]
  ret i32 %common.ret.op

for.cond:                                         ; preds = %while.end.1, %ifcont.2
  %i.0 = phi i32 [ %.53, %ifcont.2 ], [ %start_pos, %while.end.1 ]
  %.31 = sub i32 %str_len.0, %substr_len.0
  %.32 = icmp sle i32 %i.0, %.31
  br i1 %.32, label %for.cond.1, label %for.end

for.end:                                          ; preds = %for.cond
  %.56 = sub i32 0, 1
  br label %common.ret

for.cond.1:                                       ; preds = %for.cond, %ifcont.1
  %j.0 = phi i32 [ %.46, %ifcont.1 ], [ 0, %for.cond ]
  %.37 = icmp slt i32 %j.0, %substr_len.0
  br i1 %.37, label %for.body.1, label %common.ret

for.body.1:                                       ; preds = %for.cond.1
  %.39 = add i32 %i.0, %j.0
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %.39
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %substr, i32 %j.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.40 = icmp ne i8 %ptr_load.2, %ptr_load.3
  br i1 %.40, label %ifcont.2, label %ifcont.1

ifcont.1:                                         ; preds = %for.body.1
  %.46 = add i32 %j.0, 1
  br label %for.cond.1

ifcont.2:                                         ; preds = %for.body.1
  %.53 = add i32 %i.0, 1
  br label %for.cond
}

define i32 @standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1(ptr %s1, ptr %s2) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.27, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = zext i8 %ptr_load to i32
  %.11 = icmp ne i32 %.10, 0
  br i1 %.11, label %sc_rhs, label %while.end

while.body:                                       ; preds = %sc_rhs
  %ptr_gep.2 = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.17 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.2)
  %ptr_gep.3 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.19 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.3)
  %.21 = icmp ne i8 %.17, %.19
  br i1 %.21, label %then, label %ifcont

common.ret:                                       ; preds = %then, %while.end
  %common.ret.op = phi i32 [ %.33, %while.end ], [ %.24, %then ]
  ret i32 %common.ret.op

while.end:                                        ; preds = %while.cond, %sc_rhs
  %ptr_gep.4 = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.30 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.4)
  %ptr_gep.5 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.31 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.5)
  %.32 = sub i8 %.30, %.31
  %.33 = sext i8 %.32 to i32
  br label %common.ret

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.13 = zext i8 %ptr_load.1 to i32
  %.14 = icmp ne i32 %.13, 0
  br i1 %.14, label %while.body, label %while.end

then:                                             ; preds = %while.body
  %.23 = sub i8 %.17, %.19
  %.24 = sext i8 %.23 to i32
  br label %common.ret

ifcont:                                           ; preds = %while.body
  %.27 = add i32 %i.0, 1
  br label %while.cond
}

define i1 @standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1(ptr %str, ptr %prefix) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.15, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %prefix, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.8 = zext i8 %ptr_load to i32
  %.9 = icmp ne i32 %.8, 0
  br i1 %.9, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %ptr_gep.2 = getelementptr inbounds i8, ptr %prefix, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.11 = icmp ne i8 %ptr_load.1, %ptr_load.2
  br i1 %.11, label %common.ret, label %ifcont

common.ret:                                       ; preds = %while.body, %while.cond
  %common.ret.op = phi i1 [ true, %while.cond ], [ false, %while.body ]
  ret i1 %common.ret.op

ifcont:                                           ; preds = %while.body
  %.15 = add i32 %i.0, 1
  br label %while.cond
}

define i1 @standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1(ptr %str, ptr %suffix) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %str_len.0 = phi i32 [ 0, %entry ], [ %.12, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %str_len.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.9 = zext i8 %ptr_load to i32
  %.10 = icmp ne i32 %.9, 0
  br i1 %.10, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.12 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %suffix_len.0 = phi i32 [ %.19, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %suffix, i32 %suffix_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.16 = zext i8 %ptr_load.1 to i32
  %.17 = icmp ne i32 %.16, 0
  br i1 %.17, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.19 = add i32 %suffix_len.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.22 = icmp sgt i32 %suffix_len.0, %str_len.0
  br i1 %.22, label %common.ret, label %ifcont

common.ret:                                       ; preds = %for.body, %for.cond, %while.end.1
  %common.ret.op = phi i1 [ false, %while.end.1 ], [ true, %for.cond ], [ false, %for.body ]
  ret i1 %common.ret.op

ifcont:                                           ; preds = %while.end.1
  %.26 = sub i32 %str_len.0, %suffix_len.0
  br label %for.cond

for.cond:                                         ; preds = %ifcont.1, %ifcont
  %i.0 = phi i32 [ 0, %ifcont ], [ %.38, %ifcont.1 ]
  %.30 = icmp slt i32 %i.0, %suffix_len.0
  br i1 %.30, label %for.body, label %common.ret

for.body:                                         ; preds = %for.cond
  %.32 = add i32 %.26, %i.0
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %.32
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %suffix, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.33 = icmp ne i8 %ptr_load.2, %ptr_load.3
  br i1 %.33, label %common.ret, label %ifcont.1

ifcont.1:                                         ; preds = %for.body
  %.38 = add i32 %i.0, 1
  br label %for.cond
}

define ptr @standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1(ptr %src) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %len.0 = phi i32 [ 0, %entry ], [ %.9, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %src, i32 %len.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.6 = zext i8 %ptr_load to i32
  %.7 = icmp ne i32 %.6, 0
  br i1 %.7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.9 = add i32 %len.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.12 = zext i32 %len.0 to i64
  %.13 = zext i32 1 to i64
  %.14 = add i64 %.12, %.13
  %.15 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.14)
  %int_to_ptr = inttoptr i64 %.15 to ptr
  %.17 = ptrtoint ptr %int_to_ptr to i64
  %.18 = ptrtoint ptr null to i64
  %.19 = icmp eq i64 %.17, %.18
  br i1 %.19, label %then, label %for.cond

common.ret:                                       ; preds = %for.cond, %then
  %common.ret.op = phi ptr [ %int_to_ptr.1, %then ], [ %int_to_ptr, %for.cond ]
  ret ptr %common.ret.op

then:                                             ; preds = %while.end
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

for.cond:                                         ; preds = %while.end, %for.body
  %i.0 = phi i32 [ %.30, %for.body ], [ 0, %while.end ]
  %.25 = icmp sle i32 %i.0, %len.0
  br i1 %.25, label %for.body, label %common.ret

for.body:                                         ; preds = %for.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %src, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.27 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.1, ptr %.27, align 1
  %.30 = add i32 %i.0, 1
  br label %for.cond
}

define ptr @standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1(ptr %src, i32 %n) {
entry:
  %.6 = zext i32 %n to i64
  %.7 = zext i32 1 to i64
  %.8 = add i64 %.6, %.7
  %.9 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.8)
  %int_to_ptr = inttoptr i64 %.9 to ptr
  %.11 = ptrtoint ptr %int_to_ptr to i64
  %.12 = ptrtoint ptr null to i64
  %.13 = icmp eq i64 %.11, %.12
  br i1 %.13, label %then, label %for.cond

common.ret:                                       ; preds = %for.end, %then
  %common.ret.op = phi ptr [ %int_to_ptr.1, %then ], [ %int_to_ptr, %for.end ]
  ret ptr %common.ret.op

then:                                             ; preds = %entry
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

for.cond:                                         ; preds = %entry, %for.body
  %i.0 = phi i32 [ %.28, %for.body ], [ 0, %entry ]
  %.19 = icmp slt i32 %i.0, %n
  br i1 %.19, label %sc_rhs, label %for.end

for.body:                                         ; preds = %sc_rhs
  %ptr_gep.1 = getelementptr inbounds i8, ptr %src, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.25 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.1, ptr %.25, align 1
  %.28 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %sc_rhs
  %.31 = trunc i32 0 to i8
  %.32 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %n
  store i8 %.31, ptr %.32, align 1
  br label %common.ret

sc_rhs:                                           ; preds = %for.cond
  %ptr_gep = getelementptr inbounds i8, ptr %src, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.21 = zext i8 %ptr_load to i32
  %.22 = icmp ne i32 %.21, 0
  br i1 %.22, label %for.body, label %for.end
}

define ptr @standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1(ptr %str, i32 %start, i32 %length) {
entry:
  %.8 = zext i32 %length to i64
  %.9 = zext i32 1 to i64
  %.10 = add i64 %.8, %.9
  %.11 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.10)
  %int_to_ptr = inttoptr i64 %.11 to ptr
  %.13 = ptrtoint ptr %int_to_ptr to i64
  %.14 = ptrtoint ptr null to i64
  %.15 = icmp eq i64 %.13, %.14
  br i1 %.15, label %then, label %for.cond

common.ret:                                       ; preds = %for.end, %then
  %common.ret.op = phi ptr [ %int_to_ptr.1, %then ], [ %int_to_ptr, %for.end ]
  ret ptr %common.ret.op

then:                                             ; preds = %entry
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

for.cond:                                         ; preds = %entry, %for.body
  %i.0 = phi i32 [ %.32, %for.body ], [ 0, %entry ]
  %.21 = icmp slt i32 %i.0, %length
  br i1 %.21, label %sc_rhs, label %for.end

for.body:                                         ; preds = %sc_rhs
  %.28 = add i32 %start, %i.0
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %.28
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.29 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.1, ptr %.29, align 1
  %.32 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %sc_rhs
  %.35 = trunc i32 0 to i8
  %.36 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %length
  store i8 %.35, ptr %.36, align 1
  br label %common.ret

sc_rhs:                                           ; preds = %for.cond
  %.23 = add i32 %start, %i.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.23
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.24 = zext i8 %ptr_load to i32
  %.25 = icmp ne i32 %.24, 0
  br i1 %.25, label %for.body, label %for.end
}

define ptr @standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1(ptr %s1, ptr %s2) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %len1.0 = phi i32 [ 0, %entry ], [ %.11, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %s1, i32 %len1.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.8 = zext i8 %ptr_load to i32
  %.9 = icmp ne i32 %.8, 0
  br i1 %.9, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.11 = add i32 %len1.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %len2.0 = phi i32 [ %.19, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %s2, i32 %len2.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.16 = zext i8 %ptr_load.1 to i32
  %.17 = icmp ne i32 %.16, 0
  br i1 %.17, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.19 = add i32 %len2.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.22 = zext i32 %len1.0 to i64
  %.23 = zext i32 %len2.0 to i64
  %.24 = add i64 %.22, %.23
  %.25 = zext i32 1 to i64
  %.26 = add i64 %.24, %.25
  %.27 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.26)
  %int_to_ptr = inttoptr i64 %.27 to ptr
  %.29 = ptrtoint ptr %int_to_ptr to i64
  %.30 = ptrtoint ptr null to i64
  %.31 = icmp eq i64 %.29, %.30
  br i1 %.31, label %then, label %for.cond

common.ret:                                       ; preds = %for.end.1, %then
  %common.ret.op = phi ptr [ %int_to_ptr.1, %then ], [ %int_to_ptr, %for.end.1 ]
  ret ptr %common.ret.op

then:                                             ; preds = %while.end.1
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

for.cond:                                         ; preds = %while.end.1, %for.body
  %i.0 = phi i32 [ %.42, %for.body ], [ 0, %while.end.1 ]
  %.37 = icmp slt i32 %i.0, %len1.0
  br i1 %.37, label %for.body, label %for.cond.1

for.body:                                         ; preds = %for.cond
  %ptr_gep.2 = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.39 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.2, ptr %.39, align 1
  %.42 = add i32 %i.0, 1
  br label %for.cond

for.cond.1:                                       ; preds = %for.cond, %for.body.1
  %i.5.0 = phi i32 [ %.53, %for.body.1 ], [ 0, %for.cond ]
  %.47 = icmp slt i32 %i.5.0, %len2.0
  br i1 %.47, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %s2, i32 %i.5.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.49 = add i32 %len1.0, %i.5.0
  %.50 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %.49
  store i8 %ptr_load.3, ptr %.50, align 1
  %.53 = add i32 %i.5.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.56 = trunc i32 0 to i8
  %.57 = add i32 %len1.0, %len2.0
  %.58 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %.57
  store i8 %.56, ptr %.58, align 1
  br label %common.ret
}

declare i32 @strcmp(ptr, ptr)

declare void @printf(ptr, ptr)

declare ptr @strncpy(ptr, ptr, i64)

declare ptr @strcat(ptr, ptr)

declare ptr @strncat(ptr, ptr, i64)

declare i32 @strncmp(ptr, ptr, i64)

declare ptr @strtok(ptr, ptr)

declare ptr @strtok_s(ptr, ptr, ptr)

declare ptr @_strdup(ptr)

define i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %ps) {
entry:
  br label %do.body

do.body:                                          ; preds = %switch_default, %entry
  %c.0 = phi i32 [ 0, %entry ], [ %.12, %switch_default ]
  %ps.addr.0 = phi ptr [ %ps, %entry ], [ %ptr_inc, %switch_default ]
  %ptr_inc = getelementptr i8, ptr %ps.addr.0, i32 1
  %deref = load i8, ptr %ps.addr.0, align 1
  %cond = icmp eq i8 %deref, 0
  br i1 %cond, label %switch_case_0, label %switch_default

switch_case_0:                                    ; preds = %do.body
  ret i32 %c.0

switch_default:                                   ; preds = %do.body
  %.12 = add i32 %c.0, 1
  br label %do.body
}

define i16 @standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16(i16 %value, ptr %buffer) {
entry:
  %.6 = sext i16 %value to i32
  %.7 = icmp eq i32 %.6, 0
  %temp = alloca [8 x i8], align 1
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i16 [ %.15, %then ], [ %write_pos.11, %while.end.1 ]
  ret i16 %common.ret.op

then:                                             ; preds = %entry
  %.9 = trunc i32 48 to i8
  %.10 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.9, ptr %.10, align 1
  %.12 = trunc i32 0 to i8
  %.13 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.12, ptr %.13, align 1
  %.15 = trunc i32 1 to i16
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.19 = trunc i32 0 to i16
  %.20 = icmp slt i16 %value, %.19
  %.23 = sub i16 0, %value
  %is_negative.0 = select i1 %.20, i1 true, i1 false
  %value.addr.0 = select i1 %.20, i16 %.23, i16 %value
  %.27 = trunc i32 0 to i16
  %.fca.0.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i16 [ %.27, %ifcont ], [ %.44, %while.body ]
  %value.addr.1 = phi i16 [ %value.addr.0, %ifcont ], [ %.42, %while.body ]
  %.31 = trunc i32 0 to i16
  %.32 = icmp sgt i16 %value.addr.1, %.31
  br i1 %.32, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.34 = trunc i32 10 to i16
  %.35 = srem i16 %value.addr.1, %.34
  %.36 = trunc i32 48 to i16
  %.37 = add i16 %.35, %.36
  %.38 = trunc i16 %.37 to i8
  %.39 = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i16 %pos.0
  store i8 %.38, ptr %.39, align 1
  %.41 = trunc i32 10 to i16
  %.42 = sdiv i16 %value.addr.1, %.41
  %.44 = add i16 %pos.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.47 = trunc i32 0 to i16
  br i1 %is_negative.0, label %then.2, label %ifcont.2

then.2:                                           ; preds = %while.end
  %.50 = trunc i32 45 to i8
  %.51 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.50, ptr %.51, align 1
  %.53 = trunc i32 1 to i16
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %write_pos.0 = phi i16 [ %.53, %then.2 ], [ %.47, %while.end ]
  %.57 = trunc i32 1 to i16
  %.58 = sub i16 %pos.0, %.57
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont.2
  %write_pos.11 = phi i16 [ %write_pos.0, %ifcont.2 ], [ %.66, %while.body.1 ]
  %i.0 = phi i16 [ %.58, %ifcont.2 ], [ %.68, %while.body.1 ]
  %.61 = trunc i32 0 to i16
  %.62 = icmp sge i16 %i.0, %.61
  br i1 %.62, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_ext = sext i16 %i.0 to i32
  %array_gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 %idx_ext
  %array_load = load i8, ptr %array_gep, align 1
  %.64 = getelementptr inbounds i8, ptr %buffer, i16 %write_pos.11
  store i8 %array_load, ptr %.64, align 1
  %.66 = add i16 %write_pos.11, 1
  %.68 = sub i16 %i.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.71 = trunc i32 0 to i8
  %.72 = getelementptr inbounds i8, ptr %buffer, i16 %write_pos.11
  store i8 %.71, ptr %.72, align 1
  br label %common.ret
}

define i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %value, ptr %buffer) {
entry:
  %.6 = icmp eq i32 %value, 0
  %temp = alloca [32 x i8], align 1
  br i1 %.6, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i32 [ 1, %then ], [ %write_pos.11, %while.end.1 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.8 = trunc i32 48 to i8
  %.9 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.8, ptr %.9, align 1
  %.11 = trunc i32 0 to i8
  %.12 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.11, ptr %.12, align 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.17 = icmp slt i32 %value, 0
  %.20 = sub i32 0, %value
  %is_negative.0 = select i1 %.17, i32 1, i32 0
  %value.addr.0 = select i1 %.17, i32 %.20, i32 %value
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i32 [ 0, %ifcont ], [ %.36, %while.body ]
  %value.addr.1 = phi i32 [ %value.addr.0, %ifcont ], [ %.34, %while.body ]
  %.27 = icmp sgt i32 %value.addr.1, 0
  br i1 %.27, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.29 = srem i32 %value.addr.1, 10
  %.30 = add i32 %.29, 48
  %.31 = trunc i32 %.30 to i8
  %.32 = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %pos.0
  store i8 %.31, ptr %.32, align 1
  %.34 = sdiv i32 %value.addr.1, 10
  %.36 = add i32 %pos.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.40 = icmp eq i32 %is_negative.0, 1
  br i1 %.40, label %then.2, label %ifcont.2

then.2:                                           ; preds = %while.end
  %.42 = trunc i32 45 to i8
  %.43 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.42, ptr %.43, align 1
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %write_pos.0 = phi i32 [ 1, %then.2 ], [ 0, %while.end ]
  %.48 = sub i32 %pos.0, 1
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont.2
  %write_pos.11 = phi i32 [ %write_pos.0, %ifcont.2 ], [ %.55, %while.body.1 ]
  %i.0 = phi i32 [ %.48, %ifcont.2 ], [ %.57, %while.body.1 ]
  %.51 = icmp sge i32 %i.0, 0
  br i1 %.51, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %array_gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %.53 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.11
  store i8 %array_load, ptr %.53, align 1
  %.55 = add i32 %write_pos.11, 1
  %.57 = sub i32 %i.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.60 = trunc i32 0 to i8
  %.61 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.11
  store i8 %.60, ptr %.61, align 1
  br label %common.ret
}

define i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %value, ptr %buffer) {
entry:
  %.6 = sext i32 0 to i64
  %.7 = icmp eq i64 %value, %.6
  %temp = alloca [32 x i8], align 1
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i64 [ %.15, %then ], [ %write_pos.11, %while.end.1 ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.9 = trunc i32 48 to i8
  %.10 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.9, ptr %.10, align 1
  %.12 = trunc i32 0 to i8
  %.13 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.12, ptr %.13, align 1
  %.15 = sext i32 1 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.18 = sext i32 0 to i64
  %.20 = sext i32 0 to i64
  %.21 = icmp slt i64 %value, %.20
  %.23 = sext i32 1 to i64
  %.25 = sub i64 0, %value
  %is_negative.0 = select i1 %.21, i64 %.23, i64 %.18
  %value.addr.0 = select i1 %.21, i64 %.25, i64 %value
  %.29 = sext i32 0 to i64
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i64 [ %.29, %ifcont ], [ %.46, %while.body ]
  %value.addr.1 = phi i64 [ %value.addr.0, %ifcont ], [ %.44, %while.body ]
  %.33 = sext i32 0 to i64
  %.34 = icmp sgt i64 %value.addr.1, %.33
  br i1 %.34, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.36 = sext i32 10 to i64
  %.37 = srem i64 %value.addr.1, %.36
  %.38 = sext i32 48 to i64
  %.39 = add i64 %.37, %.38
  %.40 = trunc i64 %.39 to i8
  %.41 = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i64 %pos.0
  store i8 %.40, ptr %.41, align 1
  %.43 = sext i32 10 to i64
  %.44 = sdiv i64 %value.addr.1, %.43
  %.46 = add i64 %pos.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.49 = sext i32 0 to i64
  %.51 = sext i32 1 to i64
  %.52 = icmp eq i64 %is_negative.0, %.51
  br i1 %.52, label %then.2, label %ifcont.2

then.2:                                           ; preds = %while.end
  %.54 = trunc i32 45 to i8
  %.55 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.54, ptr %.55, align 1
  %.57 = sext i32 1 to i64
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %write_pos.0 = phi i64 [ %.57, %then.2 ], [ %.49, %while.end ]
  %.61 = sext i32 1 to i64
  %.62 = sub i64 %pos.0, %.61
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont.2
  %write_pos.11 = phi i64 [ %write_pos.0, %ifcont.2 ], [ %.70, %while.body.1 ]
  %i.0 = phi i64 [ %.62, %ifcont.2 ], [ %.72, %while.body.1 ]
  %.65 = sext i32 0 to i64
  %.66 = icmp sge i64 %i.0, %.65
  br i1 %.66, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %idx_trunc
  %array_load = load i8, ptr %array_gep, align 1
  %.68 = getelementptr inbounds i8, ptr %buffer, i64 %write_pos.11
  store i8 %array_load, ptr %.68, align 1
  %.70 = add i64 %write_pos.11, 1
  %.72 = sub i64 %i.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.75 = trunc i32 0 to i8
  %.76 = getelementptr inbounds i8, ptr %buffer, i64 %write_pos.11
  store i8 %.75, ptr %.76, align 1
  br label %common.ret
}

define i16 @standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16(i16 %value, ptr %buffer) {
entry:
  %.6 = trunc i32 0 to i16
  %.7 = icmp eq i16 %value, %.6
  %temp = alloca [8 x i8], align 1
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i16 [ %.15, %then ], [ %write_pos.0, %while.end.1 ]
  ret i16 %common.ret.op

then:                                             ; preds = %entry
  %.9 = trunc i32 48 to i8
  %.10 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.9, ptr %.10, align 1
  %.12 = trunc i32 0 to i8
  %.13 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.12, ptr %.13, align 1
  %.15 = trunc i32 1 to i16
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.18 = trunc i32 0 to i16
  %.fca.0.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i16 [ %.18, %ifcont ], [ %.35, %while.body ]
  %value.addr.0 = phi i16 [ %value, %ifcont ], [ %.33, %while.body ]
  %.22 = trunc i32 0 to i16
  %.23 = icmp ugt i16 %value.addr.0, %.22
  br i1 %.23, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.25 = trunc i32 10 to i16
  %.26 = urem i16 %value.addr.0, %.25
  %.27 = trunc i32 48 to i16
  %.28 = add i16 %.26, %.27
  %.29 = trunc i16 %.28 to i8
  %.30 = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i16 %pos.0
  store i8 %.29, ptr %.30, align 1
  %.32 = trunc i32 10 to i16
  %.33 = udiv i16 %value.addr.0, %.32
  %.35 = add i16 %pos.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.38 = trunc i32 0 to i16
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %write_pos.0 = phi i16 [ %.38, %while.end ], [ %.49, %while.body.1 ]
  %i.0 = phi i16 [ %pos.0, %while.end ], [ %.45, %while.body.1 ]
  %.42 = trunc i32 0 to i16
  %.43 = icmp ugt i16 %i.0, %.42
  br i1 %.43, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.45 = sub i16 %i.0, 1
  %idx_ext = sext i16 %.45 to i32
  %array_gep = getelementptr inbounds [8 x i8], ptr %temp, i32 0, i32 %idx_ext
  %array_load = load i8, ptr %array_gep, align 1
  %.47 = getelementptr inbounds i8, ptr %buffer, i16 %write_pos.0
  store i8 %array_load, ptr %.47, align 1
  %.49 = add i16 %write_pos.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.52 = trunc i32 0 to i8
  %.53 = getelementptr inbounds i8, ptr %buffer, i16 %write_pos.0
  store i8 %.52, ptr %.53, align 1
  br label %common.ret
}

define i32 @standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32(i32 %value, ptr %buffer) {
entry:
  %.6 = icmp eq i32 %value, 0
  %temp = alloca [32 x i8], align 1
  br i1 %.6, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i32 [ 1, %then ], [ %write_pos.0, %while.end.1 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.8 = trunc i32 48 to i8
  %.9 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.8, ptr %.9, align 1
  %.11 = trunc i32 0 to i8
  %.12 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.11, ptr %.12, align 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i32 [ 0, %ifcont ], [ %.28, %while.body ]
  %value.addr.0 = phi i32 [ %value, %ifcont ], [ %.26, %while.body ]
  %.19 = icmp ugt i32 %value.addr.0, 0
  br i1 %.19, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.21 = urem i32 %value.addr.0, 10
  %.22 = add i32 %.21, 48
  %.23 = trunc i32 %.22 to i8
  %.24 = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %pos.0
  store i8 %.23, ptr %.24, align 1
  %.26 = udiv i32 %value.addr.0, 10
  %.28 = add i32 %pos.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %write_pos.0 = phi i32 [ %.40, %while.body.1 ], [ 0, %while.cond ]
  %i.0 = phi i32 [ %.36, %while.body.1 ], [ %pos.0, %while.cond ]
  %.34 = icmp ugt i32 %i.0, 0
  br i1 %.34, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.36 = sub i32 %i.0, 1
  %array_gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %.36
  %array_load = load i8, ptr %array_gep, align 1
  %.38 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %array_load, ptr %.38, align 1
  %.40 = add i32 %write_pos.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.43 = trunc i32 0 to i8
  %.44 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.43, ptr %.44, align 1
  br label %common.ret
}

define i64 @standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64(i64 %value, ptr %buffer) {
entry:
  %.6 = sext i32 0 to i64
  %.7 = icmp eq i64 %value, %.6
  %temp = alloca [32 x i8], align 1
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %while.end.1, %then
  %common.ret.op = phi i64 [ %.15, %then ], [ %write_pos.0, %while.end.1 ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.9 = trunc i32 48 to i8
  %.10 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 %.9, ptr %.10, align 1
  %.12 = trunc i32 0 to i8
  %.13 = getelementptr inbounds i8, ptr %buffer, i32 1
  store i8 %.12, ptr %.13, align 1
  %.15 = sext i32 1 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.18 = sext i32 0 to i64
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %pos.0 = phi i64 [ %.18, %ifcont ], [ %.35, %while.body ]
  %value.addr.0 = phi i64 [ %value, %ifcont ], [ %.33, %while.body ]
  %.22 = sext i32 0 to i64
  %.23 = icmp ne i64 %value.addr.0, %.22
  br i1 %.23, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.25 = sext i32 10 to i64
  %.26 = urem i64 %value.addr.0, %.25
  %.27 = sext i32 48 to i64
  %.28 = add i64 %.26, %.27
  %.29 = trunc i64 %.28 to i8
  %.30 = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i64 %pos.0
  store i8 %.29, ptr %.30, align 1
  %.32 = sext i32 10 to i64
  %.33 = udiv i64 %value.addr.0, %.32
  %.35 = add i64 %pos.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.38 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %write_pos.0 = phi i64 [ %.38, %while.end ], [ %.49, %while.body.1 ]
  %remaining.0 = phi i64 [ %pos.0, %while.end ], [ %.45, %while.body.1 ]
  %.42 = sext i32 0 to i64
  %.43 = icmp ne i64 %remaining.0, %.42
  br i1 %.43, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.45 = sub i64 %remaining.0, 1
  %idx_trunc = trunc i64 %.45 to i32
  %array_gep = getelementptr inbounds [32 x i8], ptr %temp, i32 0, i32 %idx_trunc
  %array_load = load i8, ptr %array_gep, align 1
  %.47 = getelementptr inbounds i8, ptr %buffer, i64 %write_pos.0
  store i8 %array_load, ptr %.47, align 1
  %.49 = add i64 %write_pos.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.52 = trunc i32 0 to i8
  %.53 = getelementptr inbounds i8, ptr %buffer, i64 %write_pos.0
  store i8 %.52, ptr %.53, align 1
  br label %common.ret
}

define i32 @standard__strings__str2i32__1__byteE1_ptr1__ret_intE1(ptr %str) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.25, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = zext i8 %ptr_load to i32
  %.11 = icmp eq i32 %.10, 32
  br i1 %.11, label %while.body, label %sc_rhs

while.body:                                       ; preds = %sc_rhs.1, %while.cond, %sc_rhs, %sc_rhs.2
  %.25 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %sc_rhs.2
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.28 = zext i8 %ptr_load.4 to i32
  %.29 = icmp eq i32 %.28, 45
  br i1 %.29, label %then, label %else

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.13 = zext i8 %ptr_load.1 to i32
  %.14 = icmp eq i32 %.13, 9
  br i1 %.14, label %while.body, label %sc_rhs.1

sc_rhs.1:                                         ; preds = %sc_rhs
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.17 = zext i8 %ptr_load.2 to i32
  %.18 = icmp eq i32 %.17, 10
  br i1 %.18, label %while.body, label %sc_rhs.2

sc_rhs.2:                                         ; preds = %sc_rhs.1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.21 = zext i8 %ptr_load.3 to i32
  %.22 = icmp eq i32 %.21, 13
  br i1 %.22, label %while.body, label %while.end

then:                                             ; preds = %while.end
  %.31 = sub i32 0, 1
  %.33 = add i32 %i.0, 1
  br label %ifcont

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.36 = zext i8 %ptr_load.5 to i32
  %.37 = icmp eq i32 %.36, 43
  %.39 = add i32 %i.0, 1
  %spec.select = select i1 %.37, i32 %.39, i32 %i.0
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %sign.0 = phi i32 [ %.31, %then ], [ 1, %else ]
  %i.13 = phi i32 [ %.33, %then ], [ %spec.select, %else ]
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %ifcont
  %i.24 = phi i32 [ %i.13, %ifcont ], [ %.63, %then.1 ]
  %result.0 = phi i32 [ 0, %ifcont ], [ %.59, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.44 = zext i8 %ptr_load.6 to i32
  %.45 = icmp ne i32 %.44, 0
  br i1 %.45, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.48 = zext i8 %ptr_load.7 to i32
  %.49 = icmp uge i32 %.48, 48
  %.51 = zext i8 %ptr_load.7 to i32
  %.52 = icmp ule i32 %.51, 57
  %sc_result.3 = select i1 %.49, i1 %.52, i1 false
  br i1 %sc_result.3, label %then.1, label %while.end.1

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %.66 = mul i32 %result.0, %sign.0
  ret i32 %.66

then.1:                                           ; preds = %while.body.1
  %.55 = zext i8 %ptr_load.7 to i32
  %.56 = sub i32 %.55, 48
  %.58 = mul i32 %result.0, 10
  %.59 = add i32 %.58, %.56
  %.63 = add i32 %i.24, 1
  br label %while.cond.1
}

define i32 @standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1(ptr %str) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.24, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.9 = zext i8 %ptr_load to i32
  %.10 = icmp eq i32 %.9, 32
  br i1 %.10, label %while.body, label %sc_rhs

while.body:                                       ; preds = %sc_rhs.1, %while.cond, %sc_rhs, %sc_rhs.2
  %.24 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %sc_rhs.2
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.27 = zext i8 %ptr_load.4 to i32
  %.28 = icmp eq i32 %.27, 45
  br i1 %.28, label %common.ret, label %else

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.12 = zext i8 %ptr_load.1 to i32
  %.13 = icmp eq i32 %.12, 9
  br i1 %.13, label %while.body, label %sc_rhs.1

sc_rhs.1:                                         ; preds = %sc_rhs
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.16 = zext i8 %ptr_load.2 to i32
  %.17 = icmp eq i32 %.16, 10
  br i1 %.17, label %while.body, label %sc_rhs.2

sc_rhs.2:                                         ; preds = %sc_rhs.1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.20 = zext i8 %ptr_load.3 to i32
  %.21 = icmp eq i32 %.20, 13
  br i1 %.21, label %while.body, label %while.end

common.ret:                                       ; preds = %while.body.1, %while.cond.1, %while.end
  %common.ret.op = phi i32 [ 0, %while.end ], [ %result.0, %while.cond.1 ], [ %result.0, %while.body.1 ]
  ret i32 %common.ret.op

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.31 = zext i8 %ptr_load.5 to i32
  %.32 = icmp eq i32 %.31, 43
  %.34 = add i32 %i.0, 1
  %i.12 = select i1 %.32, i32 %.34, i32 %i.0
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %else
  %i.23 = phi i32 [ %i.12, %else ], [ %.58, %then.1 ]
  %result.0 = phi i32 [ 0, %else ], [ %.54, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.39 = zext i8 %ptr_load.6 to i32
  %.40 = icmp ne i32 %.39, 0
  br i1 %.40, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.43 = zext i8 %ptr_load.7 to i32
  %.44 = icmp uge i32 %.43, 48
  %.46 = zext i8 %ptr_load.7 to i32
  %.47 = icmp ule i32 %.46, 57
  %sc_result.3 = select i1 %.44, i1 %.47, i1 false
  br i1 %sc_result.3, label %then.1, label %common.ret

then.1:                                           ; preds = %while.body.1
  %.50 = zext i8 %ptr_load.7 to i32
  %.51 = sub i32 %.50, 48
  %.53 = mul i32 %result.0, 10
  %.54 = add i32 %.53, %.51
  %.58 = add i32 %i.23, 1
  br label %while.cond.1
}

define i64 @standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64(ptr %str) {
entry:
  %.6 = sext i32 1 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.26, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.11 = zext i8 %ptr_load to i32
  %.12 = icmp eq i32 %.11, 32
  br i1 %.12, label %while.body, label %sc_rhs

while.body:                                       ; preds = %sc_rhs.1, %while.cond, %sc_rhs, %sc_rhs.2
  %.26 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %sc_rhs.2
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.29 = zext i8 %ptr_load.4 to i32
  %.30 = icmp eq i32 %.29, 45
  br i1 %.30, label %then, label %else

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.14 = zext i8 %ptr_load.1 to i32
  %.15 = icmp eq i32 %.14, 9
  br i1 %.15, label %while.body, label %sc_rhs.1

sc_rhs.1:                                         ; preds = %sc_rhs
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.18 = zext i8 %ptr_load.2 to i32
  %.19 = icmp eq i32 %.18, 10
  br i1 %.19, label %while.body, label %sc_rhs.2

sc_rhs.2:                                         ; preds = %sc_rhs.1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.22 = zext i8 %ptr_load.3 to i32
  %.23 = icmp eq i32 %.22, 13
  br i1 %.23, label %while.body, label %while.end

then:                                             ; preds = %while.end
  %.32 = sub i32 0, 1
  %.33 = sext i32 %.32 to i64
  %.35 = add i32 %i.0, 1
  br label %ifcont

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.38 = zext i8 %ptr_load.5 to i32
  %.39 = icmp eq i32 %.38, 43
  %.41 = add i32 %i.0, 1
  %spec.select = select i1 %.39, i32 %.41, i32 %i.0
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %i.13 = phi i32 [ %.35, %then ], [ %spec.select, %else ]
  %sign.0 = phi i64 [ %.33, %then ], [ %.6, %else ]
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %ifcont
  %i.24 = phi i32 [ %i.13, %ifcont ], [ %.67, %then.1 ]
  %result.0 = phi i64 [ 0, %ifcont ], [ %.63, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.46 = zext i8 %ptr_load.6 to i32
  %.47 = icmp ne i32 %.46, 0
  br i1 %.47, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.50 = zext i8 %ptr_load.7 to i32
  %.51 = icmp uge i32 %.50, 48
  %.53 = zext i8 %ptr_load.7 to i32
  %.54 = icmp ule i32 %.53, 57
  %sc_result.3 = select i1 %.51, i1 %.54, i1 false
  br i1 %sc_result.3, label %then.1, label %while.end.1

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %.70 = mul i64 %result.0, %sign.0
  ret i64 %.70

then.1:                                           ; preds = %while.body.1
  %.57 = zext i8 %ptr_load.7 to i32
  %.58 = sub i32 %.57, 48
  %.59 = zext i32 %.58 to i64
  %.61 = sext i32 10 to i64
  %.62 = mul i64 %result.0, %.61
  %.63 = add i64 %.62, %.59
  %.67 = add i32 %i.24, 1
  br label %while.cond.1
}

define i64 @standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64(ptr %str) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.24, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.9 = zext i8 %ptr_load to i32
  %.10 = icmp eq i32 %.9, 32
  br i1 %.10, label %while.body, label %sc_rhs

while.body:                                       ; preds = %sc_rhs.1, %while.cond, %sc_rhs, %sc_rhs.2
  %.24 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %sc_rhs.2
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.27 = zext i8 %ptr_load.4 to i32
  %.28 = icmp eq i32 %.27, 45
  br i1 %.28, label %then, label %else

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.12 = zext i8 %ptr_load.1 to i32
  %.13 = icmp eq i32 %.12, 9
  br i1 %.13, label %while.body, label %sc_rhs.1

sc_rhs.1:                                         ; preds = %sc_rhs
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.16 = zext i8 %ptr_load.2 to i32
  %.17 = icmp eq i32 %.16, 10
  br i1 %.17, label %while.body, label %sc_rhs.2

sc_rhs.2:                                         ; preds = %sc_rhs.1
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.20 = zext i8 %ptr_load.3 to i32
  %.21 = icmp eq i32 %.20, 13
  br i1 %.21, label %while.body, label %while.end

common.ret:                                       ; preds = %while.body.1, %while.cond.1, %then
  %common.ret.op = phi i64 [ %.30, %then ], [ %result.0, %while.cond.1 ], [ %result.0, %while.body.1 ]
  ret i64 %common.ret.op

then:                                             ; preds = %while.end
  %.30 = sext i32 0 to i64
  br label %common.ret

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.32 = zext i8 %ptr_load.5 to i32
  %.33 = icmp eq i32 %.32, 43
  %.35 = add i32 %i.0, 1
  %i.12 = select i1 %.33, i32 %.35, i32 %i.0
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %else
  %i.23 = phi i32 [ %i.12, %else ], [ %.61, %then.1 ]
  %result.0 = phi i64 [ 0, %else ], [ %.57, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.40 = zext i8 %ptr_load.6 to i32
  %.41 = icmp ne i32 %.40, 0
  br i1 %.41, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.44 = zext i8 %ptr_load.7 to i32
  %.45 = icmp uge i32 %.44, 48
  %.47 = zext i8 %ptr_load.7 to i32
  %.48 = icmp ule i32 %.47, 57
  %sc_result.3 = select i1 %.45, i1 %.48, i1 false
  br i1 %sc_result.3, label %then.1, label %common.ret

then.1:                                           ; preds = %while.body.1
  %.51 = zext i8 %ptr_load.7 to i32
  %.52 = sub i32 %.51, 48
  %.53 = zext i32 %.52 to i64
  %.55 = zext i32 10 to i64
  %.56 = mul i64 %result.0, %.55
  %.57 = add i64 %.56, %.53
  %.61 = add i32 %i.23, 1
  br label %while.cond.1
}

define i32 @standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(float %value, ptr %buffer, i32 %precision) {
entry:
  %.10 = fcmp olt float %value, 0.000000e+00
  %int_temp = alloca [32 x i8], align 1
  %frac_temp = alloca [32 x i8], align 1
  br i1 %.10, label %then, label %ifcont

then:                                             ; preds = %entry
  %.12 = getelementptr inbounds i8, ptr %buffer, i32 0
  %.13 = trunc i32 45 to i8
  store i8 %.13, ptr %.12, align 1
  %.16 = fsub float 0.000000e+00, %value
  br label %ifcont

ifcont:                                           ; preds = %entry, %then
  %write_pos.0 = phi i32 [ 1, %then ], [ 0, %entry ]
  %value.addr.0 = phi float [ %.16, %then ], [ %value, %entry ]
  %.20 = fcmp oeq float %value.addr.0, 0.000000e+00
  br i1 %.20, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.22 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  %.23 = trunc i32 48 to i8
  store i8 %.23, ptr %.22, align 1
  %.25 = add i32 %write_pos.0, 1
  %.26 = getelementptr inbounds i8, ptr %buffer, i32 %.25
  %.27 = trunc i32 46 to i8
  store i8 %.27, ptr %.26, align 1
  br label %while.cond

ifcont.1:                                         ; preds = %ifcont
  %.49 = fptosi float %value.addr.0 to i32
  %.51 = sitofp i32 %.49 to float
  %.52 = fsub float %value.addr.0, %.51
  br label %while.cond.1

while.cond:                                       ; preds = %while.body, %then.1
  %i.0 = phi i32 [ 0, %then.1 ], [ %.37, %while.body ]
  %.30 = icmp slt i32 %i.0, %precision
  br i1 %.30, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.32 = add i32 %write_pos.0, 2
  %.33 = add i32 %.32, %i.0
  %.34 = getelementptr inbounds i8, ptr %buffer, i32 %.33
  %.35 = trunc i32 48 to i8
  store i8 %.35, ptr %.34, align 1
  %.37 = add i32 %i.0, 1
  br label %while.cond

common.ret:                                       ; preds = %ifcont.5, %while.end
  %common.ret.op = phi i32 [ %.46, %while.end ], [ %write_pos.312, %ifcont.5 ]
  ret i32 %common.ret.op

while.end:                                        ; preds = %while.cond
  %.40 = add i32 %write_pos.0, 2
  %.41 = add i32 %.40, %precision
  %.42 = getelementptr inbounds i8, ptr %buffer, i32 %.41
  %.43 = trunc i32 0 to i8
  store i8 %.43, ptr %.42, align 1
  %.45 = add i32 %write_pos.0, 1
  %.46 = add i32 %.45, %precision
  br label %common.ret

while.cond.1:                                     ; preds = %while.body.1, %ifcont.1
  %j.0 = phi i32 [ 0, %ifcont.1 ], [ %.61, %while.body.1 ]
  %frac_multiplier.0 = phi i32 [ 1, %ifcont.1 ], [ %.59, %while.body.1 ]
  %.57 = icmp slt i32 %j.0, %precision
  br i1 %.57, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.59 = mul i32 %frac_multiplier.0, 10
  %.61 = add i32 %j.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.64 = sitofp i32 %frac_multiplier.0 to float
  %.65 = fmul float %.52, %.64
  %.67 = fadd float %.65, 5.000000e-01
  %.68 = fptosi float %.67 to i32
  %.70 = icmp sge i32 %.68, %frac_multiplier.0
  %.72 = add i32 %.49, 1
  %spec.select = select i1 %.70, i32 0, i32 %.68
  %spec.select49 = select i1 %.70, i32 %.72, i32 %.49
  %.85 = icmp eq i32 %spec.select49, 0
  br i1 %.85, label %then.4, label %else.4

then.4:                                           ; preds = %while.end.1
  %.87 = trunc i32 48 to i8
  %.88 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.87, ptr %.88, align 1
  %.90 = add i32 %write_pos.0, 1
  br label %ifcont.4

else.4:                                           ; preds = %while.end.1
  %.fca.0.gep17 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep17, align 1
  %.fca.1.gep18 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep18, align 1
  %.fca.2.gep19 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep19, align 1
  %.fca.3.gep20 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep20, align 1
  %.fca.4.gep21 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep21, align 1
  %.fca.5.gep22 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep22, align 1
  %.fca.6.gep23 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep23, align 1
  %.fca.7.gep24 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep24, align 1
  %.fca.8.gep25 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep25, align 1
  %.fca.9.gep26 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep26, align 1
  %.fca.10.gep27 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep27, align 1
  %.fca.11.gep28 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep28, align 1
  %.fca.12.gep29 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep29, align 1
  %.fca.13.gep30 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep30, align 1
  %.fca.14.gep31 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep31, align 1
  %.fca.15.gep32 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep32, align 1
  %.fca.16.gep33 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep33, align 1
  %.fca.17.gep34 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep34, align 1
  %.fca.18.gep35 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep35, align 1
  %.fca.19.gep36 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep36, align 1
  %.fca.20.gep37 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep37, align 1
  %.fca.21.gep38 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep38, align 1
  %.fca.22.gep39 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep39, align 1
  %.fca.23.gep40 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep40, align 1
  %.fca.24.gep41 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep41, align 1
  %.fca.25.gep42 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep42, align 1
  %.fca.26.gep43 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep43, align 1
  %.fca.27.gep44 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep44, align 1
  %.fca.28.gep45 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep45, align 1
  %.fca.29.gep46 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep46, align 1
  %.fca.30.gep47 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep47, align 1
  %.fca.31.gep48 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep48, align 1
  br label %while.cond.2

ifcont.4:                                         ; preds = %while.cond.3, %then.4
  %write_pos.110 = phi i32 [ %.90, %then.4 ], [ %write_pos.211, %while.cond.3 ]
  %.122 = icmp sgt i32 %precision, 0
  br i1 %.122, label %then.5, label %ifcont.5

while.cond.2:                                     ; preds = %while.body.2, %else.4
  %temp_int.0 = phi i32 [ %spec.select49, %else.4 ], [ %.104, %while.body.2 ]
  %temp_pos.0 = phi i32 [ 0, %else.4 ], [ %.106, %while.body.2 ]
  %.97 = icmp sgt i32 %temp_int.0, 0
  br i1 %.97, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.99 = srem i32 %temp_int.0, 10
  %.100 = add i32 %.99, 48
  %.101 = trunc i32 %.100 to i8
  %.102 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %temp_pos.0
  store i8 %.101, ptr %.102, align 1
  %.104 = sdiv i32 %temp_int.0, 10
  %.106 = add i32 %temp_pos.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.109 = sub i32 %temp_pos.0, 1
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %k.0 = phi i32 [ %.109, %while.end.2 ], [ %.118, %while.body.3 ]
  %write_pos.211 = phi i32 [ %write_pos.0, %while.end.2 ], [ %.116, %while.body.3 ]
  %.112 = icmp sge i32 %k.0, 0
  br i1 %.112, label %while.body.3, label %ifcont.4

while.body.3:                                     ; preds = %while.cond.3
  %array_gep = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %k.0
  %array_load = load i8, ptr %array_gep, align 1
  %.114 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.211
  store i8 %array_load, ptr %.114, align 1
  %.116 = add i32 %write_pos.211, 1
  %.118 = sub i32 %k.0, 1
  br label %while.cond.3

then.5:                                           ; preds = %ifcont.4
  %.124 = trunc i32 46 to i8
  %.125 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.110
  store i8 %.124, ptr %.125, align 1
  %.127 = add i32 %write_pos.110, 1
  %.129 = icmp eq i32 %spec.select, 0
  br i1 %.129, label %while.cond.4, label %else.6

ifcont.5:                                         ; preds = %while.cond.7, %while.cond.4, %ifcont.4
  %write_pos.312 = phi i32 [ %write_pos.110, %ifcont.4 ], [ %write_pos.413, %while.cond.4 ], [ %write_pos.716, %while.cond.7 ]
  %.189 = trunc i32 0 to i8
  %.190 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.312
  store i8 %.189, ptr %.190, align 1
  br label %common.ret

else.6:                                           ; preds = %then.5
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond.5

while.cond.4:                                     ; preds = %then.5, %while.body.4
  %m.0 = phi i32 [ %.140, %while.body.4 ], [ 0, %then.5 ]
  %write_pos.413 = phi i32 [ %.138, %while.body.4 ], [ %.127, %then.5 ]
  %.133 = icmp slt i32 %m.0, %precision
  br i1 %.133, label %while.body.4, label %ifcont.5

while.body.4:                                     ; preds = %while.cond.4
  %.135 = trunc i32 48 to i8
  %.136 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.413
  store i8 %.135, ptr %.136, align 1
  %.138 = add i32 %write_pos.413, 1
  %.140 = add i32 %m.0, 1
  br label %while.cond.4

while.cond.5:                                     ; preds = %while.body.5, %else.6
  %frac_digits.0 = phi i32 [ 0, %else.6 ], [ %.157, %while.body.5 ]
  %temp_frac.0 = phi i32 [ %spec.select, %else.6 ], [ %.155, %while.body.5 ]
  %.148 = icmp sgt i32 %temp_frac.0, 0
  br i1 %.148, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %.150 = srem i32 %temp_frac.0, 10
  %.151 = add i32 %.150, 48
  %.152 = trunc i32 %.151 to i8
  %.153 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %frac_digits.0
  store i8 %.152, ptr %.153, align 1
  %.155 = sdiv i32 %temp_frac.0, 10
  %.157 = add i32 %frac_digits.0, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %.160 = sub i32 %precision, %frac_digits.0
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.body.6, %while.end.5
  %write_pos.615 = phi i32 [ %.127, %while.end.5 ], [ %.169, %while.body.6 ]
  %n.0 = phi i32 [ 0, %while.end.5 ], [ %.171, %while.body.6 ]
  %.164 = icmp slt i32 %n.0, %.160
  br i1 %.164, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.166 = trunc i32 48 to i8
  %.167 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.615
  store i8 %.166, ptr %.167, align 1
  %.169 = add i32 %write_pos.615, 1
  %.171 = add i32 %n.0, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6
  %.174 = sub i32 %frac_digits.0, 1
  br label %while.cond.7

while.cond.7:                                     ; preds = %while.body.7, %while.end.6
  %write_pos.716 = phi i32 [ %write_pos.615, %while.end.6 ], [ %.181, %while.body.7 ]
  %p.0 = phi i32 [ %.174, %while.end.6 ], [ %.183, %while.body.7 ]
  %.177 = icmp sge i32 %p.0, 0
  br i1 %.177, label %while.body.7, label %ifcont.5

while.body.7:                                     ; preds = %while.cond.7
  %array_gep.1 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %p.0
  %array_load.1 = load i8, ptr %array_gep.1, align 1
  %.179 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.716
  store i8 %array_load.1, ptr %.179, align 1
  %.181 = add i32 %write_pos.716, 1
  %.183 = sub i32 %p.0, 1
  br label %while.cond.7
}

define i32 @standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(double %value, ptr %buffer, i32 %precision) {
entry:
  %.9 = fpext float 0.000000e+00 to double
  %.10 = fcmp olt double %value, %.9
  %int_temp = alloca [32 x i8], align 1
  %frac_temp = alloca [32 x i8], align 1
  br i1 %.10, label %then, label %ifcont

then:                                             ; preds = %entry
  %.12 = getelementptr inbounds i8, ptr %buffer, i32 0
  store i8 69, ptr %.12, align 1
  %.15 = fsub double 0.000000e+00, %value
  br label %ifcont

ifcont:                                           ; preds = %entry, %then
  %write_pos.0 = phi i32 [ 1, %then ], [ 0, %entry ]
  %value.addr.0 = phi double [ %.15, %then ], [ %value, %entry ]
  %.19 = fpext float 0.000000e+00 to double
  %.20 = fcmp oeq double %value.addr.0, %.19
  br i1 %.20, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.22 = trunc i32 48 to i8
  %.23 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.22, ptr %.23, align 1
  %.25 = trunc i32 46 to i8
  %.26 = add i32 %write_pos.0, 1
  %.27 = getelementptr inbounds i8, ptr %buffer, i32 %.26
  store i8 %.25, ptr %.27, align 1
  br label %while.cond

ifcont.1:                                         ; preds = %ifcont
  %.50 = fptosi double %value.addr.0 to i64
  %.52 = sitofp i64 %.50 to double
  %.53 = fsub double %value.addr.0, %.52
  %.55 = sext i32 1 to i64
  br label %while.cond.1

while.cond:                                       ; preds = %while.body, %then.1
  %i.0 = phi i32 [ 0, %then.1 ], [ %.38, %while.body ]
  %.31 = icmp slt i32 %i.0, %precision
  br i1 %.31, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.33 = trunc i32 48 to i8
  %.34 = add i32 %write_pos.0, 2
  %.35 = add i32 %.34, %i.0
  %.36 = getelementptr inbounds i8, ptr %buffer, i32 %.35
  store i8 %.33, ptr %.36, align 1
  %.38 = add i32 %i.0, 1
  br label %while.cond

common.ret:                                       ; preds = %ifcont.5, %while.end
  %common.ret.op = phi i32 [ %.47, %while.end ], [ %write_pos.312, %ifcont.5 ]
  ret i32 %common.ret.op

while.end:                                        ; preds = %while.cond
  %.41 = trunc i32 0 to i8
  %.42 = add i32 %write_pos.0, 2
  %.43 = add i32 %.42, %precision
  %.44 = getelementptr inbounds i8, ptr %buffer, i32 %.43
  store i8 %.41, ptr %.44, align 1
  %.46 = add i32 %write_pos.0, 1
  %.47 = add i32 %.46, %precision
  br label %common.ret

while.cond.1:                                     ; preds = %while.body.1, %ifcont.1
  %j.0 = phi i32 [ 0, %ifcont.1 ], [ %.64, %while.body.1 ]
  %frac_multiplier.0 = phi i64 [ %.55, %ifcont.1 ], [ %.62, %while.body.1 ]
  %.59 = icmp slt i32 %j.0, %precision
  br i1 %.59, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.61 = sext i32 10 to i64
  %.62 = mul i64 %frac_multiplier.0, %.61
  %.64 = add i32 %j.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.67 = sitofp i64 %frac_multiplier.0 to double
  %.68 = fmul double %.53, %.67
  %.70 = fpext float 5.000000e-01 to double
  %.71 = fadd double %.68, %.70
  %.72 = fptosi double %.71 to i64
  %.74 = icmp sge i64 %.72, %frac_multiplier.0
  br i1 %.74, label %then.2, label %ifcont.2

then.2:                                           ; preds = %while.end.1
  %.76 = sext i32 1 to i64
  %.77 = add i64 %.50, %.76
  %.79 = sext i32 0 to i64
  %.81 = sext i32 10 to i64
  %.82 = srem i64 %.77, %.81
  %.83 = sext i32 0 to i64
  %.84 = icmp eq i64 %.82, %.83
  %.86 = icmp sgt i32 %precision, 0
  %spec.select = select i1 %.84, i1 %.86, i1 false
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end.1, %then.2
  %frac_part.0 = phi i64 [ %.79, %then.2 ], [ %.72, %while.end.1 ]
  %int_part.0 = phi i64 [ %.77, %then.2 ], [ %.50, %while.end.1 ]
  %.93 = sext i32 0 to i64
  %.94 = icmp eq i64 %int_part.0, %.93
  br i1 %.94, label %then.4, label %else.4

then.4:                                           ; preds = %ifcont.2
  %.96 = trunc i32 48 to i8
  %.97 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.96, ptr %.97, align 1
  %.99 = add i32 %write_pos.0, 1
  br label %ifcont.4

else.4:                                           ; preds = %ifcont.2
  %.fca.0.gep17 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep17, align 1
  %.fca.1.gep18 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep18, align 1
  %.fca.2.gep19 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep19, align 1
  %.fca.3.gep20 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep20, align 1
  %.fca.4.gep21 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep21, align 1
  %.fca.5.gep22 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep22, align 1
  %.fca.6.gep23 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep23, align 1
  %.fca.7.gep24 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep24, align 1
  %.fca.8.gep25 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep25, align 1
  %.fca.9.gep26 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep26, align 1
  %.fca.10.gep27 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep27, align 1
  %.fca.11.gep28 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep28, align 1
  %.fca.12.gep29 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep29, align 1
  %.fca.13.gep30 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep30, align 1
  %.fca.14.gep31 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep31, align 1
  %.fca.15.gep32 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep32, align 1
  %.fca.16.gep33 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep33, align 1
  %.fca.17.gep34 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep34, align 1
  %.fca.18.gep35 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep35, align 1
  %.fca.19.gep36 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep36, align 1
  %.fca.20.gep37 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep37, align 1
  %.fca.21.gep38 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep38, align 1
  %.fca.22.gep39 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep39, align 1
  %.fca.23.gep40 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep40, align 1
  %.fca.24.gep41 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep41, align 1
  %.fca.25.gep42 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep42, align 1
  %.fca.26.gep43 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep43, align 1
  %.fca.27.gep44 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep44, align 1
  %.fca.28.gep45 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep45, align 1
  %.fca.29.gep46 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep46, align 1
  %.fca.30.gep47 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep47, align 1
  %.fca.31.gep48 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep48, align 1
  br label %while.cond.2

ifcont.4:                                         ; preds = %while.cond.3, %then.4
  %write_pos.110 = phi i32 [ %.99, %then.4 ], [ %write_pos.211, %while.cond.3 ]
  %.135 = icmp sgt i32 %precision, 0
  br i1 %.135, label %then.5, label %ifcont.5

while.cond.2:                                     ; preds = %while.body.2, %else.4
  %temp_int.0 = phi i64 [ %int_part.0, %else.4 ], [ %.117, %while.body.2 ]
  %temp_pos.0 = phi i32 [ 0, %else.4 ], [ %.119, %while.body.2 ]
  %.106 = sext i32 0 to i64
  %.107 = icmp sgt i64 %temp_int.0, %.106
  br i1 %.107, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.109 = sext i32 10 to i64
  %.110 = srem i64 %temp_int.0, %.109
  %.111 = sext i32 48 to i64
  %.112 = add i64 %.110, %.111
  %.113 = trunc i64 %.112 to i8
  %.114 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %temp_pos.0
  store i8 %.113, ptr %.114, align 1
  %.116 = sext i32 10 to i64
  %.117 = sdiv i64 %temp_int.0, %.116
  %.119 = add i32 %temp_pos.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.122 = sub i32 %temp_pos.0, 1
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %k.0 = phi i32 [ %.122, %while.end.2 ], [ %.131, %while.body.3 ]
  %write_pos.211 = phi i32 [ %write_pos.0, %while.end.2 ], [ %.129, %while.body.3 ]
  %.125 = icmp sge i32 %k.0, 0
  br i1 %.125, label %while.body.3, label %ifcont.4

while.body.3:                                     ; preds = %while.cond.3
  %array_gep = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %k.0
  %array_load = load i8, ptr %array_gep, align 1
  %.127 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.211
  store i8 %array_load, ptr %.127, align 1
  %.129 = add i32 %write_pos.211, 1
  %.131 = sub i32 %k.0, 1
  br label %while.cond.3

then.5:                                           ; preds = %ifcont.4
  %.137 = trunc i32 46 to i8
  %.138 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.110
  store i8 %.137, ptr %.138, align 1
  %.140 = add i32 %write_pos.110, 1
  %.142 = sext i32 0 to i64
  %.143 = icmp eq i64 %frac_part.0, %.142
  br i1 %.143, label %while.cond.4, label %else.6

ifcont.5:                                         ; preds = %while.cond.7, %while.cond.4, %ifcont.4
  %write_pos.312 = phi i32 [ %write_pos.110, %ifcont.4 ], [ %write_pos.413, %while.cond.4 ], [ %write_pos.716, %while.cond.7 ]
  %.207 = trunc i32 0 to i8
  %.208 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.312
  store i8 %.207, ptr %.208, align 1
  br label %common.ret

else.6:                                           ; preds = %then.5
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  br label %while.cond.5

while.cond.4:                                     ; preds = %then.5, %while.body.4
  %m.0 = phi i32 [ %.154, %while.body.4 ], [ 0, %then.5 ]
  %write_pos.413 = phi i32 [ %.152, %while.body.4 ], [ %.140, %then.5 ]
  %.147 = icmp slt i32 %m.0, %precision
  br i1 %.147, label %while.body.4, label %ifcont.5

while.body.4:                                     ; preds = %while.cond.4
  %.149 = trunc i32 48 to i8
  %.150 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.413
  store i8 %.149, ptr %.150, align 1
  %.152 = add i32 %write_pos.413, 1
  %.154 = add i32 %m.0, 1
  br label %while.cond.4

while.cond.5:                                     ; preds = %while.body.5, %else.6
  %frac_digits.0 = phi i32 [ 0, %else.6 ], [ %.175, %while.body.5 ]
  %temp_frac.0 = phi i64 [ %frac_part.0, %else.6 ], [ %.173, %while.body.5 ]
  %.162 = sext i32 0 to i64
  %.163 = icmp sgt i64 %temp_frac.0, %.162
  br i1 %.163, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %.165 = sext i32 10 to i64
  %.166 = srem i64 %temp_frac.0, %.165
  %.167 = sext i32 48 to i64
  %.168 = add i64 %.166, %.167
  %.169 = trunc i64 %.168 to i8
  %.170 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %frac_digits.0
  store i8 %.169, ptr %.170, align 1
  %.172 = sext i32 10 to i64
  %.173 = sdiv i64 %temp_frac.0, %.172
  %.175 = add i32 %frac_digits.0, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %.178 = sub i32 %precision, %frac_digits.0
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.body.6, %while.end.5
  %write_pos.615 = phi i32 [ %.140, %while.end.5 ], [ %.187, %while.body.6 ]
  %n.0 = phi i32 [ 0, %while.end.5 ], [ %.189, %while.body.6 ]
  %.182 = icmp slt i32 %n.0, %.178
  br i1 %.182, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.184 = trunc i32 48 to i8
  %.185 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.615
  store i8 %.184, ptr %.185, align 1
  %.187 = add i32 %write_pos.615, 1
  %.189 = add i32 %n.0, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6
  %.192 = sub i32 %frac_digits.0, 1
  br label %while.cond.7

while.cond.7:                                     ; preds = %while.body.7, %while.end.6
  %write_pos.716 = phi i32 [ %write_pos.615, %while.end.6 ], [ %.199, %while.body.7 ]
  %p.0 = phi i32 [ %.192, %while.end.6 ], [ %.201, %while.body.7 ]
  %.195 = icmp sge i32 %p.0, 0
  br i1 %.195, label %while.body.7, label %ifcont.5

while.body.7:                                     ; preds = %while.cond.7
  %array_gep.1 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %p.0
  %array_load.1 = load i8, ptr %array_gep.1, align 1
  %.197 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.716
  store i8 %array_load.1, ptr %.197, align 1
  %.199 = add i32 %write_pos.716, 1
  %.201 = sub i32 %p.0, 1
  br label %while.cond.7
}

define i32 @standard__strings__count_lines__1__byteE1_ptr1__ret_intE1(ptr %str) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %count.11, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %.17, %for.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.7 = zext i8 %ptr_load to i32
  %.8 = icmp ne i32 %.7, 0
  br i1 %.8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.10 = icmp eq i8 %ptr_load.1, 10
  %.12 = add i32 %count.0, 1
  %count.11 = select i1 %.10, i32 %.12, i32 %count.0
  %.17 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %.20 = icmp sgt i32 %count.0, 0
  br i1 %.20, label %then.1, label %sc_rhs

sc_rhs:                                           ; preds = %for.end
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.22 = zext i8 %ptr_load.2 to i32
  %.23 = icmp ne i32 %.22, 0
  br i1 %.23, label %then.1, label %ifcont.1

then.1:                                           ; preds = %for.end, %sc_rhs
  %.26 = add i32 %count.0, 1
  br label %ifcont.1

ifcont.1:                                         ; preds = %sc_rhs, %then.1
  %count.22 = phi i32 [ %.26, %then.1 ], [ %count.0, %sc_rhs ]
  ret i32 %count.22
}

define ptr @standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1(ptr %str, i32 %line_num) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %current_line.0 = phi i32 [ 0, %entry ], [ %current_line.11, %ifcont ]
  %i.0 = phi i32 [ 0, %entry ], [ %.25, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = zext i8 %ptr_load to i32
  %.11 = icmp ne i32 %.10, 0
  br i1 %.11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.13 = icmp eq i32 %current_line.0, %line_num
  br i1 %.13, label %for.end, label %ifcont

for.end:                                          ; preds = %for.body, %for.cond
  %line_start.0 = phi i32 [ 0, %for.cond ], [ %i.0, %for.body ]
  %.28 = icmp ne i32 %current_line.0, %line_num
  br i1 %.28, label %then.2, label %while.cond

ifcont:                                           ; preds = %for.body
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.18 = icmp eq i8 %ptr_load.1, 10
  %.20 = add i32 %current_line.0, 1
  %current_line.11 = select i1 %.18, i32 %.20, i32 %current_line.0
  %.25 = add i32 %i.0, 1
  br label %for.cond

common.ret:                                       ; preds = %while.end, %then.2
  %common.ret.op = phi ptr [ %int_to_ptr, %then.2 ], [ %.45, %while.end ]
  ret ptr %common.ret.op

then.2:                                           ; preds = %for.end
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

while.cond:                                       ; preds = %for.end, %while.body
  %line_end.0 = phi i32 [ %.40, %while.body ], [ %line_start.0, %for.end ]
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %line_end.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.34 = zext i8 %ptr_load.2 to i32
  %.35 = icmp ne i32 %.34, 0
  br i1 %.35, label %sc_rhs, label %while.end

while.body:                                       ; preds = %sc_rhs
  %.40 = add i32 %line_end.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond, %sc_rhs
  %.43 = sub i32 %line_end.0, %line_start.0
  %.45 = call ptr @standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1(ptr %str, i32 %line_start.0, i32 %.43)
  br label %common.ret

sc_rhs:                                           ; preds = %while.cond
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %line_end.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.37 = icmp ne i8 %ptr_load.3, 10
  br i1 %.37, label %while.body, label %while.end
}

define i32 @standard__strings__count_words__1__byteE1_ptr1__ret_intE1(ptr %str) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %in_word.0 = phi i1 [ false, %entry ], [ %in_word.12, %ifcont ]
  %count.0 = phi i32 [ 0, %entry ], [ %count.11, %ifcont ]
  %i.0 = phi i32 [ 0, %entry ], [ %.23, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.8 = zext i8 %ptr_load to i32
  %.9 = icmp ne i32 %.8, 0
  br i1 %.9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.11 = call i1 @standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1(i8 %ptr_load.1)
  br i1 %.11, label %ifcont, label %else

for.end:                                          ; preds = %for.cond
  ret i32 %count.0

else:                                             ; preds = %for.body
  %.15 = xor i1 %in_word.0, true
  %.18 = add i32 %count.0, 1
  %spec.select = select i1 %.15, i1 true, i1 %in_word.0
  %spec.select3 = select i1 %.15, i32 %.18, i32 %count.0
  br label %ifcont

ifcont:                                           ; preds = %else, %for.body
  %in_word.12 = phi i1 [ false, %for.body ], [ %spec.select, %else ]
  %count.11 = phi i32 [ %count.0, %for.body ], [ %spec.select3, %else ]
  %.23 = add i32 %i.0, 1
  br label %for.cond
}

define ptr @standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1(ptr %str, ptr %find, ptr %replace) {
entry:
  %.8 = call i32 @standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1(ptr %str, ptr %find, i32 0)
  %.10 = sub i32 0, 1
  %.11 = icmp eq i32 %.8, %.10
  br i1 %.11, label %then, label %while.cond

common.ret:                                       ; preds = %for.cond.2, %then.1, %then
  %common.ret.op = phi ptr [ %.13, %then ], [ %int_to_ptr.1, %then.1 ], [ %int_to_ptr, %for.cond.2 ]
  ret ptr %common.ret.op

then:                                             ; preds = %entry
  %.13 = call ptr @standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1(ptr %str)
  br label %common.ret

while.cond:                                       ; preds = %entry, %while.body
  %str_len.0 = phi i32 [ %.21, %while.body ], [ 0, %entry ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %str_len.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.18 = zext i8 %ptr_load to i32
  %.19 = icmp ne i32 %.18, 0
  br i1 %.19, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.21 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %find_len.0 = phi i32 [ %.29, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %find, i32 %find_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.26 = zext i8 %ptr_load.1 to i32
  %.27 = icmp ne i32 %.26, 0
  br i1 %.27, label %while.body.1, label %while.cond.2

while.body.1:                                     ; preds = %while.cond.1
  %.29 = add i32 %find_len.0, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.cond.1, %while.body.2
  %replace_len.0 = phi i32 [ %.37, %while.body.2 ], [ 0, %while.cond.1 ]
  %ptr_gep.2 = getelementptr inbounds i8, ptr %replace, i32 %replace_len.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.34 = zext i8 %ptr_load.2 to i32
  %.35 = icmp ne i32 %.34, 0
  br i1 %.35, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.37 = add i32 %replace_len.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.40 = sub i32 %str_len.0, %find_len.0
  %.41 = add i32 %.40, %replace_len.0
  %.43 = zext i32 %.41 to i64
  %.44 = zext i32 1 to i64
  %.45 = add i64 %.43, %.44
  %.46 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.45)
  %int_to_ptr = inttoptr i64 %.46 to ptr
  %.48 = ptrtoint ptr %int_to_ptr to i64
  %.49 = ptrtoint ptr null to i64
  %.50 = icmp eq i64 %.48, %.49
  br i1 %.50, label %then.1, label %for.cond

then.1:                                           ; preds = %while.end.2
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

for.cond:                                         ; preds = %while.end.2, %for.body
  %i.0 = phi i32 [ %.61, %for.body ], [ 0, %while.end.2 ]
  %.56 = icmp slt i32 %i.0, %.8
  br i1 %.56, label %for.body, label %for.cond.1

for.body:                                         ; preds = %for.cond
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.58 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.3, ptr %.58, align 1
  %.61 = add i32 %i.0, 1
  br label %for.cond

for.cond.1:                                       ; preds = %for.cond, %for.body.1
  %i.5.0 = phi i32 [ %.72, %for.body.1 ], [ 0, %for.cond ]
  %.66 = icmp slt i32 %i.5.0, %replace_len.0
  br i1 %.66, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %ptr_gep.4 = getelementptr inbounds i8, ptr %replace, i32 %i.5.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.68 = add i32 %.8, %i.5.0
  %.69 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %.68
  store i8 %ptr_load.4, ptr %.69, align 1
  %.72 = add i32 %i.5.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.75 = add i32 %.8, %find_len.0
  br label %for.cond.2

for.cond.2:                                       ; preds = %for.body.2, %for.end.1
  %i.10.0 = phi i32 [ %.75, %for.end.1 ], [ %.85, %for.body.2 ]
  %.78 = icmp sle i32 %i.10.0, %str_len.0
  br i1 %.78, label %for.body.2, label %common.ret

for.body.2:                                       ; preds = %for.cond.2
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.10.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.80 = sub i32 %i.10.0, %find_len.0
  %.81 = add i32 %.80, %replace_len.0
  %.82 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %.81
  store i8 %ptr_load.5, ptr %.82, align 1
  %.85 = add i32 %i.10.0, 1
  br label %for.cond.2
}

define i32 @standard__strings__fstr_append__3__dataE1_sbits16__byteE1_ptr1__intE1_ptr1__ret_intE1(i16 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [8 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.9 = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i16 @standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16(i16 %value, ptr %.9)
  %.11 = sext i16 %.10 to i32
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %.15 = icmp slt i32 %i.0, %.11
  br i1 %.15, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.17 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.17, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.19 = add i32 %deref.1, 1
  store i32 %.19, ptr %pos, align 4
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.11
}

define i32 @standard__strings__fstr_append__3__dataE1_sbits32__byteE1_ptr1__intE1_ptr1__ret_intE1(i32 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %value, ptr %.9)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.20, %while.body ]
  %.14 = icmp slt i32 %i.0, %.10
  br i1 %.14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.16 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.16, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.18 = add i32 %deref.1, 1
  store i32 %.18, ptr %pos, align 4
  %.20 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.10
}

define i32 @standard__strings__fstr_append__3__dataE1_sbits64__byteE1_ptr1__intE1_ptr1__ret_intE1(i64 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %value, ptr %.9)
  %.11 = trunc i64 %.10 to i32
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %.15 = icmp slt i32 %i.0, %.11
  br i1 %.15, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.17 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.17, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.19 = add i32 %deref.1, 1
  store i32 %.19, ptr %pos, align 4
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.11
}

define i32 @standard__strings__fstr_append__3__dataE1_ubits16__byteE1_ptr1__intE1_ptr1__ret_intE1(i16 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [8 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.9 = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i16 @standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16(i16 %value, ptr %.9)
  %.11 = sext i16 %.10 to i32
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %.15 = icmp slt i32 %i.0, %.11
  br i1 %.15, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [8 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.17 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.17, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.19 = add i32 %deref.1, 1
  store i32 %.19, ptr %pos, align 4
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.11
}

define i32 @standard__strings__fstr_append__3__dataE1_ubits32__byteE1_ptr1__intE1_ptr1__ret_intE1(i32 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i32 @standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32(i32 %value, ptr %.9)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.20, %while.body ]
  %.14 = icmp slt i32 %i.0, %.10
  br i1 %.14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.16 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.16, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.18 = add i32 %deref.1, 1
  store i32 %.18, ptr %pos, align 4
  %.20 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.10
}

define i32 @standard__strings__fstr_append__3__dataE1_ubits64__byteE1_ptr1__intE1_ptr1__ret_intE1(i64 %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i64 @standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64(i64 %value, ptr %.9)
  %.11 = trunc i64 %.10 to i32
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %.15 = icmp slt i32 %i.0, %.11
  br i1 %.15, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.17 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.17, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.19 = add i32 %deref.1, 1
  store i32 %.19, ptr %pos, align 4
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.11
}

define i32 @standard__strings__fstr_append__3__floatE1__byteE1_ptr1__intE1_ptr1__ret_intE1(float %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i32 @standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(float %value, ptr %.9, i32 6)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.20, %while.body ]
  %.14 = icmp slt i32 %i.0, %.10
  br i1 %.14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.16 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.16, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.18 = add i32 %deref.1, 1
  store i32 %.18, ptr %pos, align 4
  %.20 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.10
}

define i32 @standard__strings__fstr_append__3__doubleE1__byteE1_ptr1__intE1_ptr1__ret_intE1(double %value, ptr %buf, ptr %pos) {
entry:
  %tmp = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.9 = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 0
  %.10 = call i32 @standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(double %value, ptr %.9, i32 14)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.20, %while.body ]
  %.14 = icmp slt i32 %i.0, %.10
  br i1 %.14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %array_gep = getelementptr inbounds [32 x i8], ptr %tmp, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %deref = load i32, ptr %pos, align 4
  %.16 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %array_load, ptr %.16, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.18 = add i32 %deref.1, 1
  store i32 %.18, ptr %pos, align 4
  %.20 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %.10
}

define i32 @standard__strings__fstr_append__3__byteE1_ptr1__byteE1_ptr1__intE1_ptr1__ret_intE1(ptr %value, ptr %buf, ptr %pos) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.17, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %value, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = zext i8 %ptr_load to i32
  %.11 = icmp ne i32 %.10, 0
  br i1 %.11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %value, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %deref = load i32, ptr %pos, align 4
  %.13 = getelementptr inbounds i8, ptr %buf, i32 %deref
  store i8 %ptr_load.1, ptr %.13, align 1
  %deref.1 = load i32, ptr %pos, align 4
  %.15 = add i32 %deref.1, 1
  store i32 %.15, ptr %pos, align 4
  %.17 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %i.0
}

define i32 @find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1(ptr %str, ptr %substr) {
entry:
  %.6 = ptrtoint ptr %str to i64
  %.7 = ptrtoint ptr null to i64
  %.8 = icmp eq i64 %.6, %.7
  %.10 = ptrtoint ptr %substr to i64
  %.11 = ptrtoint ptr null to i64
  %.12 = icmp eq i64 %.10, %.11
  %sc_result = select i1 %.8, i1 true, i1 %.12
  br i1 %sc_result, label %then, label %ifcont

common.ret:                                       ; preds = %for.cond.1, %ifcont, %for.end, %then.2, %then
  %common.ret.op = phi i32 [ %.15, %then ], [ %.28, %then.2 ], [ %.59, %for.end ], [ %.18, %ifcont ], [ %i.0, %for.cond.1 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.15 = sub i32 0, 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.18 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %str)
  %.20 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %substr)
  %.22 = icmp eq i32 %.20, 0
  br i1 %.22, label %common.ret, label %ifcont.1

ifcont.1:                                         ; preds = %ifcont
  %.26 = icmp sgt i32 %.20, %.18
  br i1 %.26, label %then.2, label %ifcont.2

then.2:                                           ; preds = %ifcont.1
  %.28 = sub i32 0, 1
  br label %common.ret

ifcont.2:                                         ; preds = %ifcont.1
  %.32 = sub i32 %.18, %.20
  br label %for.cond

for.cond:                                         ; preds = %ifcont.4, %ifcont.2
  %i.0 = phi i32 [ %.32, %ifcont.2 ], [ %.56, %ifcont.4 ]
  %.35 = icmp sge i32 %i.0, 0
  br i1 %.35, label %for.cond.1, label %for.end

for.end:                                          ; preds = %for.cond
  %.59 = sub i32 0, 1
  br label %common.ret

for.cond.1:                                       ; preds = %for.cond, %ifcont.3
  %j.0 = phi i32 [ %.49, %ifcont.3 ], [ 0, %for.cond ]
  %.40 = icmp slt i32 %j.0, %.20
  br i1 %.40, label %for.body.1, label %common.ret

for.body.1:                                       ; preds = %for.cond.1
  %.42 = add i32 %i.0, %j.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.42
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %j.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.43 = icmp ne i8 %ptr_load, %ptr_load.1
  br i1 %.43, label %ifcont.4, label %ifcont.3

ifcont.3:                                         ; preds = %for.body.1
  %.49 = add i32 %j.0, 1
  br label %for.cond.1

ifcont.4:                                         ; preds = %for.body.1
  %.56 = sub i32 %i.0, 1
  br label %for.cond
}

define i32 @find_last_char__2__byteE1_ptr1__charE1__ret_intE1(ptr %str, i8 %ch) {
entry:
  %.6 = ptrtoint ptr %str to i64
  %.7 = ptrtoint ptr null to i64
  %.8 = icmp eq i64 %.6, %.7
  br i1 %.8, label %then, label %ifcont

common.ret:                                       ; preds = %for.body, %for.end, %then
  %common.ret.op = phi i32 [ %.10, %then ], [ %.28, %for.end ], [ %i.0, %for.body ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.10 = sub i32 0, 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.13 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %str)
  %.15 = sub i32 %.13, 1
  br label %for.cond

for.cond:                                         ; preds = %ifcont.1, %ifcont
  %i.0 = phi i32 [ %.15, %ifcont ], [ %.25, %ifcont.1 ]
  %.18 = icmp sge i32 %i.0, 0
  br i1 %.18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.20 = icmp eq i8 %ptr_load, %ch
  br i1 %.20, label %common.ret, label %ifcont.1

for.end:                                          ; preds = %for.cond
  %.28 = sub i32 0, 1
  br label %common.ret

ifcont.1:                                         ; preds = %for.body
  %.25 = sub i32 %i.0, 1
  br label %for.cond
}

define i32 @count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1(ptr %str, ptr %substr) {
entry:
  %.6 = ptrtoint ptr %str to i64
  %.7 = ptrtoint ptr null to i64
  %.8 = icmp eq i64 %.6, %.7
  %.10 = ptrtoint ptr %substr to i64
  %.11 = ptrtoint ptr null to i64
  %.12 = icmp eq i64 %.10, %.11
  %sc_result = select i1 %.8, i1 true, i1 %.12
  br i1 %sc_result, label %common.ret, label %ifcont

common.ret:                                       ; preds = %while.cond, %ifcont, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ 0, %ifcont ], [ %count.0, %while.cond ]
  ret i32 %common.ret.op

ifcont:                                           ; preds = %entry
  %.17 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %str)
  %.19 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %substr)
  %.21 = icmp eq i32 %.19, 0
  %.23 = icmp sgt i32 %.19, %.17
  %spec.select = select i1 %.21, i1 true, i1 %.23
  br i1 %spec.select, label %common.ret, label %while.cond

while.cond:                                       ; preds = %ifcont, %ifcont.3
  %count.0 = phi i32 [ %count.12, %ifcont.3 ], [ 0, %ifcont ]
  %pos.0 = phi i32 [ %pos.11, %ifcont.3 ], [ 0, %ifcont ]
  %.32 = sub i32 %.17, %.19
  %.33 = icmp sle i32 %pos.0, %.32
  br i1 %.33, label %for.cond, label %common.ret

for.cond:                                         ; preds = %while.cond, %ifcont.2
  %j.0 = phi i32 [ %.47, %ifcont.2 ], [ 0, %while.cond ]
  %.38 = icmp slt i32 %j.0, %.19
  br i1 %.38, label %for.body, label %then.3

for.body:                                         ; preds = %for.cond
  %.40 = add i32 %pos.0, %j.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.40
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %j.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.41 = icmp ne i8 %ptr_load, %ptr_load.1
  br i1 %.41, label %else.3, label %ifcont.2

ifcont.2:                                         ; preds = %for.body
  %.47 = add i32 %j.0, 1
  br label %for.cond

then.3:                                           ; preds = %for.cond
  %.51 = add i32 %count.0, 1
  %.53 = add i32 %pos.0, %.19
  br label %ifcont.3

else.3:                                           ; preds = %for.body
  %.56 = add i32 %pos.0, 1
  br label %ifcont.3

ifcont.3:                                         ; preds = %else.3, %then.3
  %count.12 = phi i32 [ %.51, %then.3 ], [ %count.0, %else.3 ]
  %pos.11 = phi i32 [ %.53, %then.3 ], [ %.56, %else.3 ]
  br label %while.cond
}

define i64 @standard__time__win_time_now__0__ret_dataE1_sbits64() {
entry:
  %counter = alloca i64, align 8
  store i64 0, ptr %counter, align 8
  %freq = alloca i64, align 8
  store i64 0, ptr %freq, align 8
  %.4 = call i1 @QueryPerformanceCounter(ptr %counter)
  %.5 = call i1 @QueryPerformanceFrequency(ptr %freq)
  %freq.1 = load i64, ptr %freq, align 8
  %.6 = sext i32 0 to i64
  %.7 = icmp eq i64 %freq.1, %.6
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i64 [ %.9, %then ], [ %.17, %ifcont ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.9 = sext i32 0 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %counter.1 = load i64, ptr %counter, align 8
  %freq.2 = load i64, ptr %freq, align 8
  %.12 = sdiv i64 %counter.1, %freq.2
  %TIME_NS_PER_SEC = load i64, ptr @standard__time__TIME_NS_PER_SEC, align 8
  %.13 = mul i64 %.12, %TIME_NS_PER_SEC
  %counter.2 = load i64, ptr %counter, align 8
  %freq.3 = load i64, ptr %freq, align 8
  %.14 = srem i64 %counter.2, %freq.3
  %TIME_NS_PER_SEC.1 = load i64, ptr @standard__time__TIME_NS_PER_SEC, align 8
  %.15 = mul i64 %.14, %TIME_NS_PER_SEC.1
  %freq.4 = load i64, ptr %freq, align 8
  %.16 = sdiv i64 %.15, %freq.4
  %.17 = add i64 %.13, %.16
  br label %common.ret
}

define i64 @standard__time__time_now__0__ret_dataE1_sbits64() {
entry:
  %op_overload_result = call i64 @standard__time__win_time_now__0__ret_dataE1_sbits64()
  ret i64 %op_overload_result
}

define i64 @standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %ns) {
entry:
  %TIME_NS_PER_US = load i64, ptr @standard__time__TIME_NS_PER_US, align 8
  %.4 = sdiv i64 %ns, %TIME_NS_PER_US
  ret i64 %.4
}

define i64 @standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %ns) {
entry:
  %TIME_NS_PER_MS = load i64, ptr @standard__time__TIME_NS_PER_MS, align 8
  %.4 = sdiv i64 %ns, %TIME_NS_PER_MS
  ret i64 %.4
}

define void @standard__io__console__flush__0__ret_voidE1() {
entry:
  %out_len = load i32, ptr @standard__io__console__out_len, align 4
  %.3 = icmp eq i32 %out_len, 0
  br i1 %.3, label %common.ret, label %ifcont

common.ret:                                       ; preds = %entry, %ifcont
  ret void

ifcont:                                           ; preds = %entry
  store i32 0, ptr @standard__io__console__out_len, align 4
  %.8 = getelementptr inbounds [8192 x i8], ptr @standard__io__console__out_buf, i32 0, i32 0
  call void @standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1(ptr %.8, i32 %out_len)
  br label %common.ret
}

define void @standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x) {
entry:
  %.7 = icmp sle i32 %x, 0
  br i1 %.7, label %common.ret, label %ifcont

common.ret:                                       ; preds = %entry, %while.end, %then.1
  ret void

ifcont:                                           ; preds = %entry
  %.11 = icmp sge i32 %x, 8192
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  call void @standard__io__console__flush__0__ret_voidE1()
  call void @standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x)
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %out_len = load i32, ptr @standard__io__console__out_len, align 4
  %.16 = add i32 %out_len, %x
  %.17 = icmp sgt i32 %.16, 8192
  br i1 %.17, label %then.2, label %ifcont.2

then.2:                                           ; preds = %ifcont.1
  call void @standard__io__console__flush__0__ret_voidE1()
  br label %ifcont.2

ifcont.2:                                         ; preds = %ifcont.1, %then.2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont.2
  %i.0 = phi i32 [ 0, %ifcont.2 ], [ %.27, %while.body ]
  %.22 = icmp slt i32 %i.0, %x
  br i1 %.22, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %ptr_gep = getelementptr inbounds i8, ptr %msg, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %out_len.1 = load i32, ptr @standard__io__console__out_len, align 4
  %.24 = add i32 %out_len.1, %i.0
  %.25 = getelementptr inbounds [8192 x i8], ptr @standard__io__console__out_buf, i32 0, i32 %.24
  store i8 %ptr_load, ptr %.25, align 1
  %.27 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %out_len.2 = load i32, ptr @standard__io__console__out_len, align 4
  %.30 = add i32 %out_len.2, %x
  store i32 %.30, ptr @standard__io__console__out_len, align 4
  br label %common.ret
}

define void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x) {
entry:
  call void asm sideeffect "movq $$-11, %rcx        \0D\0A                    subq $$32, %rsp\0D\0A                    call GetStdHandle\0D\0A                    addq $$32, %rsp\0D\0A                    movq %rax, %rcx         \0D\0A                    movq $0, %rdx           \0D\0A                    movl $1, %r8d           \0D\0A                    xorq %r9, %r9           \0D\0A                    subq $$40, %rsp         \0D\0A                    movq %r9, 32(%rsp)      \0D\0A                    call WriteFile\0D\0A                    addq $$40, %rsp", "r,r,~{rax},~{rcx},~{rdx},~{r8},~{r9},~{r10},~{r11},~{memory}"(ptr %msg, i32 %x)
  ret void
}

define void @standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1(ptr %s, i32 %len) {
entry:
  call void @standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1(ptr %s, i32 %len)
  ret void
}

define void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %s) {
entry:
  %.4 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %s)
  call void @standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1(ptr %s, i32 %.4)
  ret void
}

define void @standard__io__console__print__1__boolE1__ret_voidE1(i1 %b) {
entry:
  br i1 %b, label %then, label %else

then:                                             ; preds = %entry
  %str_stack = alloca [5 x i8], align 1
  %str_char_0 = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 0
  store i8 84, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 1
  store i8 114, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 2
  store i8 117, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 3
  store i8 101, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 4
  store i8 0, ptr %str_char_4, align 1
  %arg0_decay = getelementptr [5 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  br label %ifcont

else:                                             ; preds = %entry
  %str_stack.1 = alloca [6 x i8], align 1
  %str_char_0.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 70, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 97, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 108, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 115, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 101, ptr %str_char_4.1, align 1
  %str_char_5 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 0, ptr %str_char_5, align 1
  %arg0_decay.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  ret void
}

define void @standard__io__console__print__1__charE1__ret_voidE1(i8 %s) {
entry:
  %x = alloca [2 x i8], align 1
  %elem_0 = getelementptr [2 x i8], ptr %x, i32 0, i32 0
  store i8 %s, ptr %elem_0, align 1
  %.5 = trunc i32 0 to i8
  %elem_1 = getelementptr [2 x i8], ptr %x, i32 0, i32 1
  store i8 %.5, ptr %elem_1, align 1
  %arg0_decay = getelementptr [2 x i8], ptr %x, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %s) {
entry:
  %x = alloca [2 x i8], align 1
  %elem_0 = getelementptr [2 x i8], ptr %x, i32 0, i32 0
  store i8 %s, ptr %elem_0, align 1
  %.5 = trunc i32 0 to i8
  %elem_1 = getelementptr [2 x i8], ptr %x, i32 0, i32 1
  store i8 %.5, ptr %elem_1, align 1
  %arg0_decay = getelementptr [2 x i8], ptr %x, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__dataE1_sbits8__ret_voidE1(i8 %s) {
entry:
  call void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %s)
  ret void
}

define void @standard__io__console__print__1__dataE1_sbits16__ret_voidE1(i16 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i16 @standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16(i16 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__dataE1_ubits16__ret_voidE1(i16 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i16 @standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16(i16 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__intE1__ret_voidE1(i32 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__dataE1_sbits32__ret_voidE1(i32 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

declare void @standard__io__console__print__1__uintE1__ret_voidE1(i32)

define void @standard__io__console__print__1__dataE1_ubits32__ret_voidE1(i32 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i32 @standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32(i32 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__dataE1_sbits64__ret_voidE1(i64 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__dataE1_ubits64__ret_voidE1(i64 %x) {
entry:
  %buf = alloca [21 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [21 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  %.5 = call i64 @standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64(i64 %x, ptr %arg1_decay)
  %arg0_decay = getelementptr [21 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__longE1__ret_voidE1(i64 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_sbits64__ret_voidE1(i64 %x)
  ret void
}

define void @standard__io__console__print__1__ulongE1__ret_voidE1(i64 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_ubits64__ret_voidE1(i64 %x)
  ret void
}

define void @standard__io__console__print__1__floatE1__ret_voidE1(float %x) {
entry:
  %buffer = alloca [256 x i8], align 1
  %memset_ptr = bitcast ptr %buffer to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 256, i1 false)
  %arg1_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  %.5 = call i32 @standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(float %x, ptr %arg1_decay, i32 5)
  %arg0_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__2__floatE1__intE1__ret_voidE1(float %x, i32 %y) {
entry:
  %buffer = alloca [256 x i8], align 1
  %memset_ptr = bitcast ptr %buffer to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 256, i1 false)
  %.7 = icmp sgt i32 %y, 5
  %.y = select i1 %.7, i32 5, i32 %y
  %arg1_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  %.12 = call i32 @standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(float %x, ptr %arg1_decay, i32 %.y)
  %arg0_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__1__doubleE1__ret_voidE1(double %x) {
entry:
  %buffer = alloca [256 x i8], align 1
  %memset_ptr = bitcast ptr %buffer to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 256, i1 false)
  %arg1_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  %.5 = call i32 @standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(double %x, ptr %arg1_decay, i32 14)
  %arg0_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__print__2__doubleE1__intE1__ret_voidE1(double %x, i32 %y) {
entry:
  %buffer = alloca [256 x i8], align 1
  %memset_ptr = bitcast ptr %buffer to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 256, i1 false)
  %.7 = icmp sgt i32 %y, 14
  %.y = select i1 %.7, i32 14, i32 %y
  %arg1_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  %.12 = call i32 @standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32(double %x, ptr %arg1_decay, i32 %.y)
  %arg0_decay = getelementptr [256 x i8], ptr %buffer, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret void
}

define void @standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x) {
entry:
  call void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x)
  ret void
}

declare i32 @fread(ptr, i32, i32, ptr)

declare i32 @fwrite(ptr, i32, i32, ptr)

declare i32 @sscanf(ptr, ptr, ptr, ptr, ptr)

declare i32 @fseek(ptr, i32, i32)

declare i32 @ftell(ptr)

declare void @rewind(ptr)

declare i32 @feof(ptr)

declare i32 @ferror(ptr)

declare i32 @fflush(ptr)

declare i32 @remove(ptr)

declare i32 @rename(ptr, ptr)

define i32 @main__0__ret_intE1() {
entry:
  %buf = alloca [32 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %str_stack = alloca [30 x i8], align 1
  %str_char_0 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 0
  store i8 61, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 1
  store i8 61, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 2
  store i8 61, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 3
  store i8 32, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 4
  store i8 115, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 5
  store i8 116, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 6
  store i8 100, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 7
  store i8 104, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 9
  store i8 97, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 10
  store i8 112, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 12
  store i8 115, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 13
  store i8 116, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 14
  store i8 114, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 15
  store i8 101, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 16
  store i8 115, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 17
  store i8 115, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 18
  store i8 32, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 19
  store i8 116, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 20
  store i8 101, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 21
  store i8 115, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 22
  store i8 116, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 23
  store i8 32, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 24
  store i8 61, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 25
  store i8 61, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 26
  store i8 61, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 27
  store i8 10, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 28
  store i8 10, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 29
  store i8 0, ptr %str_char_29, align 1
  %arg0_decay = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @test_edge_cases__0__ret_voidE1()
  call void @test_all_size_classes__0__ret_voidE1()
  call void @test_large_alloc__0__ret_voidE1()
  call void @test_bin_reuse__0__ret_voidE1()
  call void @test_write_read__0__ret_voidE1()
  call void @test_no_overlap__0__ret_voidE1()
  call void @test_frealloc_same_class__0__ret_voidE1()
  call void @test_frealloc_grow__0__ret_voidE1()
  call void @test_frealloc_large_identity__0__ret_voidE1()
  call void @test_frealloc_chain__0__ret_voidE1()
  call void @test_coalesce__0__ret_voidE1()
  call void @test_coalesce_bin_integrity__0__ret_voidE1()
  call void @test_fragmentation__0__ret_voidE1()
  call void @test_mixed_pattern__0__ret_voidE1()
  call void @test_table_stress__0__ret_voidE1()
  call void @test_double_free_guard__0__ret_voidE1()
  call void @test_throughput_small__0__ret_voidE1()
  call void @test_throughput_mixed__0__ret_voidE1()
  call void @test_throughput_fastpath__0__ret_voidE1()
  call void @test_bandwidth__0__ret_voidE1()
  call void @test_frealloc_pressure__0__ret_voidE1()
  call void @test_slab_exhaustion_recovery__0__ret_voidE1()
  %str_stack.1 = alloca [2 x i8], align 1
  %str_char_0.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 10, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 0, ptr %str_char_1.1, align 1
  %arg0_decay.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %g_pass = load i32, ptr @g_pass, align 4
  %.37 = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 0
  %.38 = call i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %g_pass, ptr %.37)
  %.39 = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.39)
  %str_stack.2 = alloca [10 x i8], align 1
  %str_char_0.2 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 32, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 112, ptr %str_char_1.2, align 1
  %str_char_2.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 115, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 115, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 100, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 44, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 0, ptr %str_char_9.1, align 1
  %arg0_decay.2 = getelementptr [10 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.2)
  %g_fail = load i32, ptr @g_fail, align 4
  %.52 = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 0
  %.53 = call i32 @standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32(i32 %g_fail, ptr %.52)
  %.54 = getelementptr inbounds [32 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.54)
  %str_stack.3 = alloca [9 x i8], align 1
  %str_char_0.3 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 32, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 102, ptr %str_char_1.3, align 1
  %str_char_2.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 97, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 105, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 100, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 10, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 0, ptr %str_char_8.2, align 1
  %arg0_decay.3 = getelementptr [9 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.3)
  %g_fail.1 = load i32, ptr @g_fail, align 4
  ret i32 %g_fail.1
}

define i32 @main__2__intE1__byteE1_ptr2__ret_intE1(i32 %.1, ptr %.2) {
entry:
  %.4 = call i32 @main__0__ret_intE1()
  ret i32 %.4
}

define i32 @FRTStartup() {
entry:
  %op_overload_result = call i64 @standard__system__cpu__l2_bytes__0__ret_ulongE1()
  store i64 %op_overload_result, ptr @nt_threshold, align 8
  %op_overload_result.1 = call i1 @standard__system__cpu__ermsb__0__ret_boolE1()
  store i1 %op_overload_result.1, ptr @ermsb, align 1
  %.16 = sub i32 0, 11
  %.17 = call i64 @GetStdHandle(i32 %.16)
  store i64 %.17, ptr @WIN_STDOUT_HANDLE, align 8
  %op_overload_result.2 = call i1 @standard__memory__allocators__stdheap__table_init__0__ret_boolE1()
  %.19 = call ptr @GetCommandLineW()
  br label %while.cond

while.cond:                                       ; preds = %ifcont.1, %entry
  %pos.0 = phi i32 [ 0, %entry ], [ %pos.514, %ifcont.1 ]
  %argc.0 = phi i32 [ 0, %entry ], [ %.81, %ifcont.1 ]
  %ptr_gep = getelementptr inbounds i16, ptr %.19, i32 %pos.0
  %ptr_load = load i16, ptr %ptr_gep, align 2
  %.22 = trunc i32 0 to i16
  %.23 = icmp ne i16 %ptr_load, %.22
  br i1 %.23, label %while.cond.1, label %while.end

while.end:                                        ; preds = %while.end.1, %while.cond
  %.84 = zext i32 %argc.0 to i64
  %.85 = sext i32 8 to i64
  %.86 = mul i64 %.84, %.85
  %.87 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.86)
  %int_to_ptr = inttoptr i64 %.87 to ptr
  br label %while.cond.4

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %pos.110 = phi i32 [ %.33, %while.body.1 ], [ %pos.0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.1 = load i16, ptr %ptr_gep.1, align 2
  %.26 = trunc i32 32 to i16
  %.27 = icmp eq i16 %ptr_load.1, %.26
  br i1 %.27, label %while.body.1, label %sc_rhs

while.body.1:                                     ; preds = %while.cond.1, %sc_rhs
  %.33 = add i32 %pos.110, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %sc_rhs
  %ptr_gep.3 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.3 = load i16, ptr %ptr_gep.3, align 2
  %.36 = trunc i32 0 to i16
  %.37 = icmp eq i16 %ptr_load.3, %.36
  br i1 %.37, label %while.end, label %ifcont

sc_rhs:                                           ; preds = %while.cond.1
  %ptr_gep.2 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.2 = load i16, ptr %ptr_gep.2, align 2
  %.29 = trunc i32 9 to i16
  %.30 = icmp eq i16 %ptr_load.2, %.29
  br i1 %.30, label %while.body.1, label %while.end.1

ifcont:                                           ; preds = %while.end.1
  %ptr_gep.4 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.4 = load i16, ptr %ptr_gep.4, align 2
  %.41 = trunc i32 34 to i16
  %.42 = icmp eq i16 %ptr_load.4, %.41
  br i1 %.42, label %then.1, label %while.cond.3

then.1:                                           ; preds = %ifcont
  %.44 = add i32 %pos.110, 1
  br label %while.cond.2

ifcont.1:                                         ; preds = %sc_rhs.2, %while.cond.3, %sc_rhs.3, %while.end.2
  %pos.514 = phi i32 [ %pos.615, %while.end.2 ], [ %pos.413, %sc_rhs.3 ], [ %pos.413, %while.cond.3 ], [ %pos.413, %sc_rhs.2 ]
  %.81 = add i32 %argc.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %while.body.2, %then.1
  %pos.312 = phi i32 [ %.44, %then.1 ], [ %.54, %while.body.2 ]
  %ptr_gep.5 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.5 = load i16, ptr %ptr_gep.5, align 2
  %.47 = trunc i32 0 to i16
  %.48 = icmp ne i16 %ptr_load.5, %.47
  br i1 %.48, label %sc_rhs.1, label %while.end.2

while.body.2:                                     ; preds = %sc_rhs.1
  %.54 = add i32 %pos.312, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2, %sc_rhs.1
  %ptr_gep.7 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.7 = load i16, ptr %ptr_gep.7, align 2
  %.57 = trunc i32 34 to i16
  %.58 = icmp eq i16 %ptr_load.7, %.57
  %.60 = add i32 %pos.312, 1
  %pos.615 = select i1 %.58, i32 %.60, i32 %pos.312
  br label %ifcont.1

sc_rhs.1:                                         ; preds = %while.cond.2
  %ptr_gep.6 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.6 = load i16, ptr %ptr_gep.6, align 2
  %.50 = trunc i32 34 to i16
  %.51 = icmp ne i16 %ptr_load.6, %.50
  br i1 %.51, label %while.body.2, label %while.end.2

while.cond.3:                                     ; preds = %ifcont, %while.body.3
  %pos.413 = phi i32 [ %.77, %while.body.3 ], [ %pos.110, %ifcont ]
  %ptr_gep.8 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.8 = load i16, ptr %ptr_gep.8, align 2
  %.66 = trunc i32 0 to i16
  %.67 = icmp ne i16 %ptr_load.8, %.66
  br i1 %.67, label %sc_rhs.2, label %ifcont.1

while.body.3:                                     ; preds = %sc_rhs.3
  %.77 = add i32 %pos.413, 1
  br label %while.cond.3

sc_rhs.2:                                         ; preds = %while.cond.3
  %ptr_gep.9 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.9 = load i16, ptr %ptr_gep.9, align 2
  %.69 = trunc i32 32 to i16
  %.70 = icmp ne i16 %ptr_load.9, %.69
  br i1 %.70, label %sc_rhs.3, label %ifcont.1

sc_rhs.3:                                         ; preds = %sc_rhs.2
  %ptr_gep.10 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.10 = load i16, ptr %ptr_gep.10, align 2
  %.73 = trunc i32 9 to i16
  %.74 = icmp ne i16 %ptr_load.10, %.73
  br i1 %.74, label %while.body.3, label %ifcont.1

while.cond.4:                                     ; preds = %while.end.8, %while.end
  %pos.211 = phi i32 [ 0, %while.end ], [ %pos.1019, %while.end.8 ]
  %argi.0 = phi i32 [ 0, %while.end ], [ %.180, %while.end.8 ]
  %ptr_gep.11 = getelementptr inbounds i16, ptr %.19, i32 %pos.211
  %ptr_load.11 = load i16, ptr %ptr_gep.11, align 2
  %.92 = trunc i32 0 to i16
  %.93 = icmp ne i16 %ptr_load.11, %.92
  br i1 %.93, label %while.cond.5, label %while.end.4

while.end.4:                                      ; preds = %while.end.5, %while.cond.4
  %.183 = icmp sgt i32 %argc.0, 1
  br i1 %.183, label %then.6, label %else.6

while.cond.5:                                     ; preds = %while.cond.4, %while.body.5
  %pos.716 = phi i32 [ %.103, %while.body.5 ], [ %pos.211, %while.cond.4 ]
  %ptr_gep.12 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.12 = load i16, ptr %ptr_gep.12, align 2
  %.96 = trunc i32 32 to i16
  %.97 = icmp eq i16 %ptr_load.12, %.96
  br i1 %.97, label %while.body.5, label %sc_rhs.4

while.body.5:                                     ; preds = %while.cond.5, %sc_rhs.4
  %.103 = add i32 %pos.716, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %sc_rhs.4
  %ptr_gep.14 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.14 = load i16, ptr %ptr_gep.14, align 2
  %.106 = trunc i32 0 to i16
  %.107 = icmp eq i16 %ptr_load.14, %.106
  br i1 %.107, label %while.end.4, label %ifcont.3

sc_rhs.4:                                         ; preds = %while.cond.5
  %ptr_gep.13 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.13 = load i16, ptr %ptr_gep.13, align 2
  %.99 = trunc i32 9 to i16
  %.100 = icmp eq i16 %ptr_load.13, %.99
  br i1 %.100, label %while.body.5, label %while.end.5

ifcont.3:                                         ; preds = %while.end.5
  %ptr_gep.15 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.15 = load i16, ptr %ptr_gep.15, align 2
  %.113 = trunc i32 34 to i16
  %.114 = icmp eq i16 %ptr_load.15, %.113
  br i1 %.114, label %then.4, label %while.cond.7

then.4:                                           ; preds = %ifcont.3
  %.117 = add i32 %pos.716, 1
  br label %while.cond.6

ifcont.4:                                         ; preds = %sc_rhs.6, %while.cond.7, %sc_rhs.7, %while.end.6
  %len.222 = phi i32 [ %len.0, %while.end.6 ], [ %len.121, %sc_rhs.7 ], [ %len.121, %while.cond.7 ], [ %len.121, %sc_rhs.6 ]
  %start.0 = phi i32 [ %.117, %while.end.6 ], [ %pos.716, %sc_rhs.7 ], [ %pos.716, %while.cond.7 ], [ %pos.716, %sc_rhs.6 ]
  %pos.1019 = phi i32 [ %pos.1120, %while.end.6 ], [ %pos.918, %sc_rhs.7 ], [ %pos.918, %while.cond.7 ], [ %pos.918, %sc_rhs.6 ]
  %.159 = zext i32 %len.222 to i64
  %.160 = sext i32 1 to i64
  %.161 = add i64 %.159, %.160
  %.162 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.161)
  %int_to_ptr.1 = inttoptr i64 %.162 to ptr
  br label %while.cond.8

while.cond.6:                                     ; preds = %while.body.6, %then.4
  %len.0 = phi i32 [ 0, %then.4 ], [ %.128, %while.body.6 ]
  %pos.817 = phi i32 [ %.117, %then.4 ], [ %.130, %while.body.6 ]
  %ptr_gep.16 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.16 = load i16, ptr %ptr_gep.16, align 2
  %.121 = trunc i32 0 to i16
  %.122 = icmp ne i16 %ptr_load.16, %.121
  br i1 %.122, label %sc_rhs.5, label %while.end.6

while.body.6:                                     ; preds = %sc_rhs.5
  %.128 = add i32 %len.0, 1
  %.130 = add i32 %pos.817, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6, %sc_rhs.5
  %ptr_gep.18 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.18 = load i16, ptr %ptr_gep.18, align 2
  %.133 = trunc i32 34 to i16
  %.134 = icmp eq i16 %ptr_load.18, %.133
  %.136 = add i32 %pos.817, 1
  %pos.1120 = select i1 %.134, i32 %.136, i32 %pos.817
  br label %ifcont.4

sc_rhs.5:                                         ; preds = %while.cond.6
  %ptr_gep.17 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.17 = load i16, ptr %ptr_gep.17, align 2
  %.124 = trunc i32 34 to i16
  %.125 = icmp ne i16 %ptr_load.17, %.124
  br i1 %.125, label %while.body.6, label %while.end.6

while.cond.7:                                     ; preds = %ifcont.3, %while.body.7
  %len.121 = phi i32 [ %.153, %while.body.7 ], [ 0, %ifcont.3 ]
  %pos.918 = phi i32 [ %.155, %while.body.7 ], [ %pos.716, %ifcont.3 ]
  %ptr_gep.19 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.19 = load i16, ptr %ptr_gep.19, align 2
  %.142 = trunc i32 0 to i16
  %.143 = icmp ne i16 %ptr_load.19, %.142
  br i1 %.143, label %sc_rhs.6, label %ifcont.4

while.body.7:                                     ; preds = %sc_rhs.7
  %.153 = add i32 %len.121, 1
  %.155 = add i32 %pos.918, 1
  br label %while.cond.7

sc_rhs.6:                                         ; preds = %while.cond.7
  %ptr_gep.20 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.20 = load i16, ptr %ptr_gep.20, align 2
  %.145 = trunc i32 32 to i16
  %.146 = icmp ne i16 %ptr_load.20, %.145
  br i1 %.146, label %sc_rhs.7, label %ifcont.4

sc_rhs.7:                                         ; preds = %sc_rhs.6
  %ptr_gep.21 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.21 = load i16, ptr %ptr_gep.21, align 2
  %.149 = trunc i32 9 to i16
  %.150 = icmp ne i16 %ptr_load.21, %.149
  br i1 %.150, label %while.body.7, label %ifcont.4

while.cond.8:                                     ; preds = %while.body.8, %ifcont.4
  %j.0 = phi i32 [ 0, %ifcont.4 ], [ %.172, %while.body.8 ]
  %.166 = icmp slt i32 %j.0, %len.222
  br i1 %.166, label %while.body.8, label %while.end.8

while.body.8:                                     ; preds = %while.cond.8
  %.168 = add i32 %start.0, %j.0
  %ptr_gep.22 = getelementptr inbounds i16, ptr %.19, i32 %.168
  %ptr_load.22 = load i16, ptr %ptr_gep.22, align 2
  %.169 = trunc i16 %ptr_load.22 to i8
  %.170 = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %j.0
  store i8 %.169, ptr %.170, align 1
  %.172 = add i32 %j.0, 1
  br label %while.cond.8

while.end.8:                                      ; preds = %while.cond.8
  %.175 = trunc i32 0 to i8
  %.176 = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %len.222
  store i8 %.175, ptr %.176, align 1
  %.178 = getelementptr inbounds ptr, ptr %int_to_ptr, i32 %argi.0
  store ptr %int_to_ptr.1, ptr %.178, align 8
  %.180 = add i32 %argi.0, 1
  br label %while.cond.4

then.6:                                           ; preds = %while.end.4
  %.185 = call i32 @main__2__intE1__byteE1_ptr2__ret_intE1(i32 %argc.0, ptr %int_to_ptr)
  br label %ifcont.6

else.6:                                           ; preds = %while.end.4
  %op_overload_result.3 = call i32 @main__0__ret_intE1()
  br label %ifcont.6

ifcont.6:                                         ; preds = %else.6, %then.6
  %return_code.0 = phi i32 [ %.185, %then.6 ], [ %op_overload_result.3, %else.6 ]
  br label %while.cond.9

while.cond.9:                                     ; preds = %while.body.9, %ifcont.6
  %k.0 = phi i32 [ 0, %ifcont.6 ], [ %.194, %while.body.9 ]
  %.191 = icmp slt i32 %k.0, %argc.0
  br i1 %.191, label %while.body.9, label %while.end.9

while.body.9:                                     ; preds = %while.cond.9
  %ptr_gep.23 = getelementptr inbounds ptr, ptr %int_to_ptr, i32 %k.0
  %ptr_load.23 = load ptr, ptr %ptr_gep.23, align 8
  %ptr_to_int = ptrtoint ptr %ptr_load.23 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int)
  %.194 = add i32 %k.0, 1
  br label %while.cond.9

while.end.9:                                      ; preds = %while.cond.9
  %.197 = icmp ne i32 %return_code.0, 0
  %.199 = sub i32 0, 1073741819
  %.200 = icmp eq i32 %return_code.0, %.199
  %or.cond = and i1 %.197, %.200
  br i1 %or.cond, label %then.8, label %ifcont.7

ifcont.7:                                         ; preds = %then.8, %while.end.9
  call void @standard__io__console__flush__0__ret_voidE1()
  call void @RtlExitUserProcess(i32 %return_code.0)
  %ptr_to_int.1 = ptrtoint ptr %int_to_ptr to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.1)
  ret i32 %return_code.0

then.8:                                           ; preds = %while.end.9
  %str_stack = alloca [10 x i8], align 1
  %str_char_0 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 0
  store i8 83, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 1
  store i8 69, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 2
  store i8 71, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 3
  store i8 70, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 4
  store i8 65, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 5
  store i8 85, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 6
  store i8 76, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 7
  store i8 84, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 8
  store i8 10, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 9
  store i8 0, ptr %str_char_9, align 1
  %arg0_decay = getelementptr [10 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  br label %ifcont.7
}

; Function Attrs: naked noinline noreturn
define void @__chkstk() #1 {
entry:
  call void asm sideeffect "subq $$16, %rsp\0D\0A        movq %r10, (%rsp)\0D\0A        movq %r11, 8(%rsp)\0D\0A        xorq %r11, %r11\0D\0A        leaq 24(%rsp), %r10\0D\0A        subq %rax, %r10\0D\0A        cmovbq %r11, %r10\0D\0A        movq %gs:16, %r11\0D\0A        cmpq %r11, %r10\0D\0A        jae .Lchkstk_done\0D\0A        andw $$-4096, %r10w\0D\0A    .Lchkstk_probe:\0D\0A        leaq -4096(%r11), %r11\0D\0A        movb $$0, (%r11)\0D\0A        cmpq %r11, %r10\0D\0A        jne .Lchkstk_probe\0D\0A    .Lchkstk_done:\0D\0A        movq (%rsp), %r10\0D\0A        movq 8(%rsp), %r11\0D\0A        addq $$16, %rsp\0D\0A        retq", "~{memory},~{cc}"()
  unreachable
}

define i64 @standard__random__get_rdtsc__0__ret_dataE1_ubits64() {
entry:
  %.4 = call i64 asm sideeffect "rdtsc                    \0D\0A                shlq $$32, %rdx          \0D\0A                orq %rdx, %rax", "={rax},~{rdx}"()
  ret i64 %.4
}

define i64 @standard__random__get_entropy__0__ret_dataE1_ubits64() {
entry:
  %op_overload_result = call i64 @standard__random__get_rdtsc__0__ret_dataE1_ubits64()
  %op_overload_result.1 = call i64 @standard__random__get_rdtsc__0__ret_dataE1_ubits64()
  %op_overload_result.2 = call i64 @standard__random__get_rdtsc__0__ret_dataE1_ubits64()
  %.5 = zext i32 21 to i64
  %.6 = shl i64 %op_overload_result.1, %.5
  %.7 = xor i64 %op_overload_result, %.6
  %.8 = zext i32 17 to i64
  %.9 = lshr i64 %op_overload_result.2, %.8
  %.10 = xor i64 %.7, %.9
  ret i64 %.10
}

define void @standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %rng, i64 %seed, i64 %seq) {
entry:
  %.8 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  %.9 = sext i32 0 to i64
  store i64 %.9, ptr %.8, align 8
  %.11 = zext i32 1 to i64
  %.12 = shl i64 %seq, %.11
  %.13 = zext i32 1 to i64
  %.14 = or i64 %.12, %.13
  %.15 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 %.14, ptr %.15, align 8
  %state_ptr = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  %state = load i64, ptr %state_ptr, align 8
  %.19 = mul i64 %state, 6364136223846793005
  %inc_ptr = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  %inc = load i64, ptr %inc_ptr, align 8
  %.20 = add i64 %.19, %inc
  %.21 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 %.20, ptr %.21, align 8
  %state_ptr.1 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  %state.1 = load i64, ptr %state_ptr.1, align 8
  %.23 = add i64 %state.1, %seed
  %.24 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 %.23, ptr %.24, align 8
  %state_ptr.2 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  %state.2 = load i64, ptr %state_ptr.2, align 8
  %.26 = mul i64 %state.2, 6364136223846793005
  %inc_ptr.1 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  %inc.1 = load i64, ptr %inc_ptr.1, align 8
  %.27 = add i64 %.26, %inc.1
  %.28 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 %.27, ptr %.28, align 8
  ret void
}

define void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng) {
entry:
  %op_overload_result = call i64 @standard__random__get_entropy__0__ret_dataE1_ubits64()
  %op_overload_result.1 = call i64 @standard__random__get_entropy__0__ret_dataE1_ubits64()
  call void @standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %rng, i64 %op_overload_result, i64 %op_overload_result.1)
  ret void
}

define i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng) {
entry:
  %state_ptr = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  %state = load i64, ptr %state_ptr, align 8
  %.5 = mul i64 %state, 6364136223846793005
  %inc_ptr = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  %inc = load i64, ptr %inc_ptr, align 8
  %.6 = add i64 %.5, %inc
  %.7 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 %.6, ptr %.7, align 8
  %.9 = zext i32 18 to i64
  %.10 = lshr i64 %state, %.9
  %.11 = xor i64 %.10, %state
  %.12 = zext i32 27 to i64
  %.13 = lshr i64 %.11, %.12
  %.14 = trunc i64 %.13 to i32
  %.16 = zext i32 59 to i64
  %.17 = lshr i64 %state, %.16
  %.18 = trunc i64 %.17 to i32
  %.20 = lshr i32 %.14, %.18
  %.21 = sub i32 0, %.18
  %.22 = shl i32 %.14, %.21
  %.23 = or i32 %.20, %.22
  ret i32 %.23
}

define void @pass__1__byteE1_ptr1__ret_voidE1(ptr %name) {
entry:
  %str_stack = alloca [8 x i8], align 1
  %str_char_0 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 0
  store i8 91, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 1
  store i8 80, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 2
  store i8 65, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 3
  store i8 83, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 4
  store i8 83, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 5
  store i8 93, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 6
  store i8 32, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 7
  store i8 0, ptr %str_char_7, align 1
  %arg0_decay = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %name)
  %str_stack.1 = alloca [2 x i8], align 1
  %str_char_0.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 10, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 0, ptr %str_char_1.1, align 1
  %arg0_decay.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %g_pass = load i32, ptr @g_pass, align 4
  %.17 = add i32 %g_pass, 1
  store i32 %.17, ptr @g_pass, align 4
  ret void
}

define void @fail__1__byteE1_ptr1__ret_voidE1(ptr %name) {
entry:
  %str_stack = alloca [8 x i8], align 1
  %str_char_0 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 0
  store i8 91, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 1
  store i8 70, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 2
  store i8 65, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 3
  store i8 73, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 4
  store i8 76, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 5
  store i8 93, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 6
  store i8 32, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 7
  store i8 0, ptr %str_char_7, align 1
  %arg0_decay = getelementptr [8 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %name)
  %str_stack.1 = alloca [2 x i8], align 1
  %str_char_0.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 10, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 0, ptr %str_char_1.1, align 1
  %arg0_decay.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %g_fail = load i32, ptr @g_fail, align 4
  %.17 = add i32 %g_fail, 1
  store i32 %.17, ptr @g_fail, align 4
  ret void
}

define void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok, ptr %name) {
entry:
  br i1 %ok, label %then, label %else

then:                                             ; preds = %entry
  call void @pass__1__byteE1_ptr1__ret_voidE1(ptr %name)
  br label %ifcont

else:                                             ; preds = %entry
  call void @fail__1__byteE1_ptr1__ret_voidE1(ptr %name)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  ret void
}

define void @test_edge_cases__0__ret_voidE1() {
entry:
  %str_stack = alloca [18 x i8], align 1
  %str_char_0 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 3
  store i8 101, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 4
  store i8 100, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 5
  store i8 103, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 6
  store i8 101, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 7
  store i8 32, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 8
  store i8 99, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 9
  store i8 97, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 10
  store i8 115, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 11
  store i8 101, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 12
  store i8 115, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 13
  store i8 32, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 14
  store i8 45, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 15
  store i8 45, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 16
  store i8 10, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 17
  store i8 0, ptr %str_char_17, align 1
  %arg0_decay = getelementptr [18 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.22 = sext i32 0 to i64
  %.23 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.22)
  %int_to_ptr = inttoptr i64 %.23 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  %str_stack.1 = alloca [24 x i8], align 1
  %str_char_0.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 109, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 108, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 40, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 48, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 41, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 114, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 101, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 116, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 117, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 114, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 110, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 115, ptr %str_char_17.1, align 1
  %str_char_18 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 32, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 110, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 117, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 108, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 108, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 0, ptr %str_char_23, align 1
  %arg1_decay = getelementptr [24 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %is_null, ptr %arg1_decay)
  %.50 = sext i32 0 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.50)
  %str_stack.2 = alloca [27 x i8], align 1
  %str_char_0.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 102, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 114, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 101, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 101, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 40, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 110, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 117, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 108, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 108, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 41, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 100, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 111, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 101, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 115, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 110, ptr %str_char_17.2, align 1
  %str_char_18.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 111, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 116, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 32, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 99, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 114, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 97, ptr %str_char_23.1, align 1
  %str_char_24 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 115, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 104, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 0, ptr %str_char_26, align 1
  %arg1_decay.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 true, ptr %arg1_decay.1)
  %.80 = sext i32 0 to i64
  %.81 = sext i32 0 to i64
  %.82 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.80, i64 %.81)
  %int_to_ptr.1 = inttoptr i64 %.82 to ptr
  %is_null.1 = icmp eq ptr %int_to_ptr.1, null
  %str_stack.3 = alloca [31 x i8], align 1
  %str_char_0.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 114, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 101, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 97, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 108, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 111, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 99, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 40, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 110, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 117, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 108, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 108, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 44, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 32, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 48, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 41, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 32, ptr %str_char_17.3, align 1
  %str_char_18.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 114, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 101, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 116, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 117, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 114, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 110, ptr %str_char_23.2, align 1
  %str_char_24.1 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 32, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 110, ptr %str_char_26.1, align 1
  %str_char_27 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 117, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 108, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 108, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 0, ptr %str_char_30, align 1
  %arg1_decay.2 = getelementptr [31 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %is_null.1, ptr %arg1_decay.2)
  %.116 = sext i32 0 to i64
  %.117 = sext i32 64 to i64
  %.118 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.116, i64 %.117)
  %not_zero = icmp ne i64 %.118, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.4 = alloca [35 x i8], align 1
  %str_char_0.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 114, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 101, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 97, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 108, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 108, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 111, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 99, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 40, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 110, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 117, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 108, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 108, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 44, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 32, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 54, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 52, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 41, ptr %str_char_17.4, align 1
  %str_char_18.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 32, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 97, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 99, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 116, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 115, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 32, ptr %str_char_23.3, align 1
  %str_char_24.2 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 97, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 115, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27.1 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 102, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 109, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 29
  store i8 97, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 30
  store i8 108, ptr %str_char_30.1, align 1
  %str_char_31 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 31
  store i8 108, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 32
  store i8 111, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 33
  store i8 99, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 34
  store i8 0, ptr %str_char_34, align 1
  %.155 = trunc i8 %not_null_result to i1
  %arg1_decay.3 = getelementptr [35 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.155, ptr %arg1_decay.3)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.118)
  %.158 = sext i32 64 to i64
  %.159 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.158)
  %not_zero.1 = icmp ne i64 %.159, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %str_stack.5 = alloca [32 x i8], align 1
  %str_char_0.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 115, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 101, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 116, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 117, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 112, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 32, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 97, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 108, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 108, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 111, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 99, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 32, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 102, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 111, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 114, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 32, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 102, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 114, ptr %str_char_17.5, align 1
  %str_char_18.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 101, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 97, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 108, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 108, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 111, ptr %str_char_22.4, align 1
  %str_char_23.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 99, ptr %str_char_23.4, align 1
  %str_char_24.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 40, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 112, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 26
  store i8 116, ptr %str_char_26.3, align 1
  %str_char_27.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 27
  store i8 114, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 28
  store i8 44, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 29
  store i8 48, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 30
  store i8 41, ptr %str_char_30.2, align 1
  %str_char_31.1 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 31
  store i8 0, ptr %str_char_31.1, align 1
  %.193 = trunc i8 %not_null_result.1 to i1
  %arg1_decay.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.193, ptr %arg1_decay.4)
  %.195 = sext i32 0 to i64
  %.196 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.159, i64 %.195)
  %.198 = zext i32 0 to i64
  %.199 = icmp eq i64 %.196, %.198
  %str_stack.6 = alloca [45 x i8], align 1
  %str_char_0.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 102, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 114, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 101, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 97, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 108, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 108, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 111, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 99, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 40, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 112, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 116, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 114, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 44, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 32, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 48, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 41, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 32, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 97, ptr %str_char_17.6, align 1
  %str_char_18.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 99, ptr %str_char_18.5, align 1
  %str_char_19.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 116, ptr %str_char_19.5, align 1
  %str_char_20.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 115, ptr %str_char_20.5, align 1
  %str_char_21.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 32, ptr %str_char_21.5, align 1
  %str_char_22.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 22
  store i8 97, ptr %str_char_22.5, align 1
  %str_char_23.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 23
  store i8 115, ptr %str_char_23.5, align 1
  %str_char_24.4 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 24
  store i8 32, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 25
  store i8 102, ptr %str_char_25.4, align 1
  %str_char_26.4 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 26
  store i8 102, ptr %str_char_26.4, align 1
  %str_char_27.3 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 27
  store i8 114, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 28
  store i8 101, ptr %str_char_28.3, align 1
  %str_char_29.3 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 29
  store i8 101, ptr %str_char_29.3, align 1
  %str_char_30.3 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 30
  store i8 44, ptr %str_char_30.3, align 1
  %str_char_31.2 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 31
  store i8 32, ptr %str_char_31.2, align 1
  %str_char_32.1 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 32
  store i8 114, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 33
  store i8 101, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 34
  store i8 116, ptr %str_char_34.1, align 1
  %str_char_35 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 35
  store i8 117, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 36
  store i8 114, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 37
  store i8 110, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 38
  store i8 115, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 39
  store i8 32, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 40
  store i8 110, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 41
  store i8 117, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 42
  store i8 108, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 43
  store i8 108, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 44
  store i8 0, ptr %str_char_44, align 1
  %arg1_decay.5 = getelementptr [45 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.199, ptr %arg1_decay.5)
  ret void
}

define void @test_all_size_classes__0__ret_voidE1() {
entry:
  %sizes = alloca [18 x i64], align 8
  %.fca.0.gep2 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep2, align 8
  %.fca.1.gep3 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep3, align 8
  %.fca.2.gep4 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep4, align 8
  %.fca.3.gep5 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep5, align 8
  %.fca.4.gep6 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 4
  store i64 0, ptr %.fca.4.gep6, align 8
  %.fca.5.gep7 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 5
  store i64 0, ptr %.fca.5.gep7, align 8
  %.fca.6.gep8 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 6
  store i64 0, ptr %.fca.6.gep8, align 8
  %.fca.7.gep9 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 7
  store i64 0, ptr %.fca.7.gep9, align 8
  %.fca.8.gep10 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 8
  store i64 0, ptr %.fca.8.gep10, align 8
  %.fca.9.gep11 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 9
  store i64 0, ptr %.fca.9.gep11, align 8
  %.fca.10.gep12 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 10
  store i64 0, ptr %.fca.10.gep12, align 8
  %.fca.11.gep13 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 11
  store i64 0, ptr %.fca.11.gep13, align 8
  %.fca.12.gep14 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 12
  store i64 0, ptr %.fca.12.gep14, align 8
  %.fca.13.gep15 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 13
  store i64 0, ptr %.fca.13.gep15, align 8
  %.fca.14.gep16 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 14
  store i64 0, ptr %.fca.14.gep16, align 8
  %.fca.15.gep17 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 15
  store i64 0, ptr %.fca.15.gep17, align 8
  %.fca.16.gep18 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 16
  store i64 0, ptr %.fca.16.gep18, align 8
  %.fca.17.gep19 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 17
  store i64 0, ptr %.fca.17.gep19, align 8
  %ptrs = alloca [18 x i64], align 8
  %.fca.0.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %.fca.2.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep, align 8
  %.fca.3.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep, align 8
  %.fca.4.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 4
  store i64 0, ptr %.fca.4.gep, align 8
  %.fca.5.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 5
  store i64 0, ptr %.fca.5.gep, align 8
  %.fca.6.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 6
  store i64 0, ptr %.fca.6.gep, align 8
  %.fca.7.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 7
  store i64 0, ptr %.fca.7.gep, align 8
  %.fca.8.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 8
  store i64 0, ptr %.fca.8.gep, align 8
  %.fca.9.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 9
  store i64 0, ptr %.fca.9.gep, align 8
  %.fca.10.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 10
  store i64 0, ptr %.fca.10.gep, align 8
  %.fca.11.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 11
  store i64 0, ptr %.fca.11.gep, align 8
  %.fca.12.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 12
  store i64 0, ptr %.fca.12.gep, align 8
  %.fca.13.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 13
  store i64 0, ptr %.fca.13.gep, align 8
  %.fca.14.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 14
  store i64 0, ptr %.fca.14.gep, align 8
  %.fca.15.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 15
  store i64 0, ptr %.fca.15.gep, align 8
  %.fca.16.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 16
  store i64 0, ptr %.fca.16.gep, align 8
  %.fca.17.gep = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 17
  store i64 0, ptr %.fca.17.gep, align 8
  %str_stack = alloca [24 x i8], align 1
  %str_char_0 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 3
  store i8 97, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 4
  store i8 108, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 5
  store i8 108, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 6
  store i8 32, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 7
  store i8 115, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 8
  store i8 105, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 9
  store i8 122, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 10
  store i8 101, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 12
  store i8 99, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 13
  store i8 108, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 14
  store i8 97, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 15
  store i8 115, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 16
  store i8 115, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 17
  store i8 101, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 18
  store i8 115, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 20
  store i8 45, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 21
  store i8 45, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 22
  store i8 10, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 23
  store i8 0, ptr %str_char_23, align 1
  %arg0_decay = getelementptr [24 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.31 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 0
  %.32 = sext i32 1 to i64
  store i64 %.32, ptr %.31, align 8
  %.34 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 1
  %.35 = sext i32 16 to i64
  store i64 %.35, ptr %.34, align 8
  %.37 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 2
  %.38 = sext i32 17 to i64
  store i64 %.38, ptr %.37, align 8
  %.40 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 3
  %.41 = sext i32 32 to i64
  store i64 %.41, ptr %.40, align 8
  %.43 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 4
  %.44 = sext i32 33 to i64
  store i64 %.44, ptr %.43, align 8
  %.46 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 5
  %.47 = sext i32 64 to i64
  store i64 %.47, ptr %.46, align 8
  %.49 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 6
  %.50 = sext i32 65 to i64
  store i64 %.50, ptr %.49, align 8
  %.52 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 7
  %.53 = sext i32 128 to i64
  store i64 %.53, ptr %.52, align 8
  %.55 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 8
  %.56 = sext i32 129 to i64
  store i64 %.56, ptr %.55, align 8
  %.58 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 9
  %.59 = sext i32 256 to i64
  store i64 %.59, ptr %.58, align 8
  %.61 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 10
  %.62 = sext i32 257 to i64
  store i64 %.62, ptr %.61, align 8
  %.64 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 11
  %.65 = sext i32 512 to i64
  store i64 %.65, ptr %.64, align 8
  %.67 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 12
  %.68 = sext i32 513 to i64
  store i64 %.68, ptr %.67, align 8
  %.70 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 13
  %.71 = sext i32 1024 to i64
  store i64 %.71, ptr %.70, align 8
  %.73 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 14
  %.74 = sext i32 1025 to i64
  store i64 %.74, ptr %.73, align 8
  %.76 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 15
  %.77 = sext i32 2048 to i64
  store i64 %.77, ptr %.76, align 8
  %.79 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 16
  %.80 = sext i32 2049 to i64
  store i64 %.80, ptr %.79, align 8
  %.82 = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 17
  %.83 = sext i32 4096 to i64
  store i64 %.83, ptr %.82, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %.159, %while.body ]
  %.86 = zext i32 18 to i64
  %.87 = icmp ult i64 %i.0, %.86
  br i1 %.87, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [18 x i64], ptr %sizes, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  %.89 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %array_load)
  %.90 = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.89, ptr %.90, align 8
  %idx_trunc.1 = trunc i64 %i.0 to i32
  %array_gep.1 = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  %.92 = zext i32 0 to i64
  %.93 = icmp ne i64 %array_load.1, %.92
  %str_stack.1 = alloca [26 x i8], align 1
  %str_char_0.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 115, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 105, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 122, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 101, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 32, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 99, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 108, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 97, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 115, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 115, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 97, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 108, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 108, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 111, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 99, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 32, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 110, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 111, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 110, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 45, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 110, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 117, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 108, ptr %str_char_23.1, align 1
  %str_char_24 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 108, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 0, ptr %str_char_25, align 1
  %arg1_decay = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.93, ptr %arg1_decay)
  %idx_trunc.2 = trunc i64 %i.0 to i32
  %array_gep.2 = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.2
  %array_load.2 = load i64, ptr %array_gep.2, align 8
  %.121 = zext i32 15 to i64
  %.122 = and i64 %array_load.2, %.121
  %.123 = zext i32 0 to i64
  %.124 = icmp eq i64 %.122, %.123
  %str_stack.2 = alloca [33 x i8], align 1
  %str_char_0.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 115, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 105, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 122, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 101, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 32, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 99, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 108, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 97, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 115, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 115, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 32, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 97, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 108, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 108, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 111, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 99, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 49, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 54, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 45, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 98, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 121, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 116, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 101, ptr %str_char_23.2, align 1
  %str_char_24.1 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 32, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 97, ptr %str_char_25.1, align 1
  %str_char_26 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 108, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 105, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 103, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 110, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 101, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 100, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 0, ptr %str_char_32, align 1
  %arg1_decay.1 = getelementptr [33 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.124, ptr %arg1_decay.1)
  %.159 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.162 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %i.11 = phi i64 [ %.162, %while.end ], [ %.169, %while.body.1 ]
  %.165 = zext i32 18 to i64
  %.166 = icmp ult i64 %i.11, %.165
  br i1 %.166, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.3 = trunc i64 %i.11 to i32
  %array_gep.3 = getelementptr inbounds [18 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.3
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.3)
  %.169 = add i64 %i.11, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  ret void
}

define void @test_large_alloc__0__ret_voidE1() {
entry:
  %str_stack = alloca [27 x i8], align 1
  %str_char_0 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 3
  store i8 108, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 4
  store i8 97, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 5
  store i8 114, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 6
  store i8 103, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 7
  store i8 101, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 8
  store i8 32, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 9
  store i8 97, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 10
  store i8 108, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 11
  store i8 108, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 12
  store i8 111, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 13
  store i8 99, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 14
  store i8 32, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 15
  store i8 40, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 16
  store i8 62, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 17
  store i8 52, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 18
  store i8 48, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 19
  store i8 57, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 20
  store i8 54, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 21
  store i8 41, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 22
  store i8 32, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 23
  store i8 45, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 24
  store i8 45, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 25
  store i8 10, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 26
  store i8 0, ptr %str_char_26, align 1
  %arg0_decay = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.34 = sext i32 4097 to i64
  %.35 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.34)
  %not_zero = icmp ne i64 %.35, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.1 = alloca [23 x i8], align 1
  %str_char_0.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 109, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 108, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 40, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 52, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 48, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 57, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 55, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 41, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 32, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 110, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 111, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 110, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 45, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 110, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 117, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 108, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 108, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 0, ptr %str_char_22.1, align 1
  %.60 = trunc i8 %not_null_result to i1
  %arg1_decay = getelementptr [23 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.60, ptr %arg1_decay)
  %.62 = zext i32 15 to i64
  %.63 = and i64 %.35, %.62
  %.64 = zext i32 0 to i64
  %.65 = icmp eq i64 %.63, %.64
  %str_stack.2 = alloca [30 x i8], align 1
  %str_char_0.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 109, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 97, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 108, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 111, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 99, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 40, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 52, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 48, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 57, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 55, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 41, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 49, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 54, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 45, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 98, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 121, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 116, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 101, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 32, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 97, ptr %str_char_22.2, align 1
  %str_char_23.1 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 108, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 105, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 103, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 110, ptr %str_char_26.1, align 1
  %str_char_27 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 101, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 100, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 0, ptr %str_char_29, align 1
  %arg1_decay.1 = getelementptr [30 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.65, ptr %arg1_decay.1)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.35)
  %.98 = sext i32 1048576 to i64
  %.99 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.98)
  %not_zero.1 = icmp ne i64 %.99, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %str_stack.3 = alloca [22 x i8], align 1
  %str_char_0.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 109, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 97, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 108, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 111, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 99, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 40, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 49, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 77, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 66, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 41, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 32, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 110, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 111, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 110, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 45, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 110, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 117, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 108, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 108, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 0, ptr %str_char_21.3, align 1
  %.123 = trunc i8 %not_null_result.1 to i1
  %arg1_decay.2 = getelementptr [22 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.123, ptr %arg1_decay.2)
  %.125 = zext i32 15 to i64
  %.126 = and i64 %.99, %.125
  %.127 = zext i32 0 to i64
  %.128 = icmp eq i64 %.126, %.127
  %str_stack.4 = alloca [29 x i8], align 1
  %str_char_0.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 109, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 97, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 108, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 108, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 111, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 99, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 40, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 49, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 77, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 66, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 41, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 32, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 49, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 54, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 45, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 98, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 121, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 116, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 101, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 32, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 97, ptr %str_char_21.4, align 1
  %str_char_22.3 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 108, ptr %str_char_22.3, align 1
  %str_char_23.2 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 105, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 103, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 110, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 101, ptr %str_char_26.2, align 1
  %str_char_27.1 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 100, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 0, ptr %str_char_28.1, align 1
  %arg1_decay.3 = getelementptr [29 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.128, ptr %arg1_decay.3)
  %int_to_ptr = inttoptr i64 %.99 to ptr
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %.168, %while.body ]
  %.162 = zext i32 1048576 to i64
  %.163 = icmp ult i64 %i.0, %.162
  br i1 %.163, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.165 = trunc i32 205 to i8
  %.166 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %i.0
  store i8 %.165, ptr %.166, align 1
  %.168 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.171 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %ifcont, %while.end
  %i.13 = phi i64 [ %.171, %while.end ], [ %.183, %ifcont ]
  %.174 = zext i32 1048576 to i64
  %.175 = icmp ult i64 %i.13, %.174
  br i1 %.175, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc = trunc i64 %i.13 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.177 = trunc i32 205 to i8
  %.178 = icmp ne i8 %ptr_load, %.177
  br i1 %.178, label %while.end.1, label %ifcont

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %ok.0 = phi i1 [ true, %while.cond.1 ], [ false, %while.body.1 ]
  %str_stack.5 = alloca [32 x i8], align 1
  %str_char_0.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 102, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 109, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 97, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 108, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 108, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 111, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 99, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 40, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 49, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 77, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 66, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 41, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 32, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 119, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 114, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 105, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 116, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 101, ptr %str_char_17.5, align 1
  %str_char_18.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 47, ptr %str_char_18.5, align 1
  %str_char_19.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 114, ptr %str_char_19.5, align 1
  %str_char_20.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 101, ptr %str_char_20.5, align 1
  %str_char_21.5 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 97, ptr %str_char_21.5, align 1
  %str_char_22.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 100, ptr %str_char_22.4, align 1
  %str_char_23.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 32, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 99, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 111, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 26
  store i8 114, ptr %str_char_26.3, align 1
  %str_char_27.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 27
  store i8 114, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 28
  store i8 101, ptr %str_char_28.2, align 1
  %str_char_29.1 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 29
  store i8 99, ptr %str_char_29.1, align 1
  %str_char_30 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 30
  store i8 116, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 31
  store i8 0, ptr %str_char_31, align 1
  %arg1_decay.4 = getelementptr [32 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay.4)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.99)
  %.220 = sext i32 8388608 to i64
  %.221 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.220)
  %not_zero.2 = icmp ne i64 %.221, 0
  %not_null_result.2 = zext i1 %not_zero.2 to i8
  %str_stack.6 = alloca [22 x i8], align 1
  %str_char_0.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 102, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 109, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 97, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 108, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 108, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 111, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 99, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 40, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 56, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 77, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 66, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 41, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 32, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 110, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 111, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 110, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 45, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 110, ptr %str_char_17.6, align 1
  %str_char_18.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 117, ptr %str_char_18.6, align 1
  %str_char_19.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 108, ptr %str_char_19.6, align 1
  %str_char_20.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 108, ptr %str_char_20.6, align 1
  %str_char_21.6 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 0, ptr %str_char_21.6, align 1
  %.245 = trunc i8 %not_null_result.2 to i1
  %arg1_decay.5 = getelementptr [22 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.245, ptr %arg1_decay.5)
  %int_to_ptr.1 = inttoptr i64 %.221 to ptr
  %.249 = sext i32 0 to i64
  br label %while.cond.2

ifcont:                                           ; preds = %while.body.1
  %.183 = add i64 %i.13, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %i.24 = phi i64 [ %.249, %while.end.1 ], [ %.258, %while.body.2 ]
  %.252 = zext i32 8388608 to i64
  %.253 = icmp ult i64 %i.24, %.252
  br i1 %.253, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.255 = trunc i32 171 to i8
  %.256 = getelementptr inbounds i8, ptr %int_to_ptr.1, i64 %i.24
  store i8 %.255, ptr %.256, align 1
  %.258 = add i64 %i.24, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.261 = sext i32 0 to i64
  br label %while.cond.3

while.cond.3:                                     ; preds = %ifcont.1, %while.end.2
  %i.35 = phi i64 [ %.261, %while.end.2 ], [ %.273, %ifcont.1 ]
  %.264 = zext i32 8388608 to i64
  %.265 = icmp ult i64 %i.35, %.264
  br i1 %.265, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %idx_trunc.1 = trunc i64 %i.35 to i32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %idx_trunc.1
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.267 = trunc i32 171 to i8
  %.268 = icmp ne i8 %ptr_load.1, %.267
  br i1 %.268, label %while.end.3, label %ifcont.1

while.end.3:                                      ; preds = %while.body.3, %while.cond.3
  %ok.16 = phi i1 [ true, %while.cond.3 ], [ false, %while.body.3 ]
  %str_stack.7 = alloca [32 x i8], align 1
  %str_char_0.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 102, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 109, ptr %str_char_1.7, align 1
  %str_char_2.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 97, ptr %str_char_2.7, align 1
  %str_char_3.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 108, ptr %str_char_3.7, align 1
  %str_char_4.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 108, ptr %str_char_4.7, align 1
  %str_char_5.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 111, ptr %str_char_5.7, align 1
  %str_char_6.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 99, ptr %str_char_6.7, align 1
  %str_char_7.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 40, ptr %str_char_7.7, align 1
  %str_char_8.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 56, ptr %str_char_8.7, align 1
  %str_char_9.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 77, ptr %str_char_9.7, align 1
  %str_char_10.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 66, ptr %str_char_10.7, align 1
  %str_char_11.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 41, ptr %str_char_11.7, align 1
  %str_char_12.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 32, ptr %str_char_12.7, align 1
  %str_char_13.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 119, ptr %str_char_13.7, align 1
  %str_char_14.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 114, ptr %str_char_14.7, align 1
  %str_char_15.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 15
  store i8 105, ptr %str_char_15.7, align 1
  %str_char_16.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 16
  store i8 116, ptr %str_char_16.7, align 1
  %str_char_17.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 17
  store i8 101, ptr %str_char_17.7, align 1
  %str_char_18.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 18
  store i8 47, ptr %str_char_18.7, align 1
  %str_char_19.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 19
  store i8 114, ptr %str_char_19.7, align 1
  %str_char_20.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 20
  store i8 101, ptr %str_char_20.7, align 1
  %str_char_21.7 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 21
  store i8 97, ptr %str_char_21.7, align 1
  %str_char_22.5 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 22
  store i8 100, ptr %str_char_22.5, align 1
  %str_char_23.4 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 23
  store i8 32, ptr %str_char_23.4, align 1
  %str_char_24.4 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 24
  store i8 99, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 25
  store i8 111, ptr %str_char_25.4, align 1
  %str_char_26.4 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 26
  store i8 114, ptr %str_char_26.4, align 1
  %str_char_27.3 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 27
  store i8 114, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 28
  store i8 101, ptr %str_char_28.3, align 1
  %str_char_29.2 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 29
  store i8 99, ptr %str_char_29.2, align 1
  %str_char_30.1 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 30
  store i8 116, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 31
  store i8 0, ptr %str_char_31.1, align 1
  %arg1_decay.6 = getelementptr [32 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.16, ptr %arg1_decay.6)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.221)
  ret void

ifcont.1:                                         ; preds = %while.body.3
  %.273 = add i64 %i.35, 1
  br label %while.cond.3
}

define void @test_bin_reuse__0__ret_voidE1() {
entry:
  %str_stack = alloca [17 x i8], align 1
  %str_char_0 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 3
  store i8 98, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 4
  store i8 105, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 5
  store i8 110, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 6
  store i8 32, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 7
  store i8 114, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 9
  store i8 117, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 10
  store i8 115, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 11
  store i8 101, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 12
  store i8 32, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 13
  store i8 45, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 14
  store i8 45, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 15
  store i8 10, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 16
  store i8 0, ptr %str_char_16, align 1
  %arg0_decay = getelementptr [17 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.23 = sext i32 64 to i64
  %.24 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.23)
  %.26 = sext i32 64 to i64
  %.27 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.26)
  %.29 = zext i32 0 to i64
  %.30 = icmp ne i64 %.24, %.29
  %str_stack.1 = alloca [26 x i8], align 1
  %str_char_0.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 105, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 114, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 115, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 116, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 32, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 32, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 97, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 108, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 108, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 111, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 99, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 40, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 54, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 52, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 41, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 32, ptr %str_char_16.1, align 1
  %str_char_17 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 110, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 111, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 110, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 45, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 110, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 117, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 108, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 108, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 0, ptr %str_char_25, align 1
  %arg1_decay = getelementptr [26 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.30, ptr %arg1_decay)
  %.58 = zext i32 0 to i64
  %.59 = icmp ne i64 %.27, %.58
  %str_stack.2 = alloca [26 x i8], align 1
  %str_char_0.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 115, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 101, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 99, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 111, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 110, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 100, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 32, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 97, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 108, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 108, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 111, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 99, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 40, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 54, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 52, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 41, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 110, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 111, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 110, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 45, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 110, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 117, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 108, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 108, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 0, ptr %str_char_25.1, align 1
  %arg1_decay.1 = getelementptr [26 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.59, ptr %arg1_decay.1)
  %.87 = icmp ne i64 %.24, %.27
  %str_stack.3 = alloca [18 x i8], align 1
  %str_char_0.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 116, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 119, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 111, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 32, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 97, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 108, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 108, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 111, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 99, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 115, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 32, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 100, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 105, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 102, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 102, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 101, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 114, ptr %str_char_16.3, align 1
  %str_char_17.2 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 0, ptr %str_char_17.2, align 1
  %arg1_decay.2 = getelementptr [18 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.87, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.24)
  %.108 = sext i32 64 to i64
  %.109 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.108)
  %.111 = icmp eq i64 %.109, %.24
  %str_stack.4 = alloca [41 x i8], align 1
  %str_char_0.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 98, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 105, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 110, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 32, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 114, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 101, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 117, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 115, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 101, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 32, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 114, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 101, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 116, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 117, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 114, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 110, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 115, ptr %str_char_16.4, align 1
  %str_char_17.3 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 32, ptr %str_char_17.3, align 1
  %str_char_18.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 112, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 114, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 101, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 118, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 105, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 111, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 117, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 115, ptr %str_char_25.2, align 1
  %str_char_26 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 108, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 121, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 32, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 29
  store i8 102, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 30
  store i8 114, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 31
  store i8 101, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 32
  store i8 101, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 33
  store i8 100, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 34
  store i8 32, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 35
  store i8 98, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 36
  store i8 108, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 37
  store i8 111, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 38
  store i8 99, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 39
  store i8 107, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 40
  store i8 0, ptr %str_char_40, align 1
  %arg1_decay.3 = getelementptr [41 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.111, ptr %arg1_decay.3)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.27)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.109)
  %.156 = sext i32 128 to i64
  %.157 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.156)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.157)
  %.160 = sext i32 128 to i64
  %.161 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.160)
  %.163 = icmp eq i64 %.161, %.157
  %str_stack.5 = alloca [30 x i8], align 1
  %str_char_0.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 98, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 105, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 110, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 32, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 114, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 101, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 117, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 115, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 101, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 32, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 99, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 108, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 97, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 115, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 115, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 45, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 51, ptr %str_char_16.5, align 1
  %str_char_17.4 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 32, ptr %str_char_17.4, align 1
  %str_char_18.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 40, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 49, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 50, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 56, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 32, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 98, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 121, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 116, ptr %str_char_25.3, align 1
  %str_char_26.1 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 26
  store i8 101, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 27
  store i8 115, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 28
  store i8 41, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 29
  store i8 0, ptr %str_char_29.1, align 1
  %arg1_decay.4 = getelementptr [30 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.163, ptr %arg1_decay.4)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.161)
  %.196 = sext i32 16 to i64
  %.197 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.196)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.197)
  %.200 = sext i32 16 to i64
  %.201 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.200)
  %.203 = icmp eq i64 %.201, %.197
  %str_stack.6 = alloca [29 x i8], align 1
  %str_char_0.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 98, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 105, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 110, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 32, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 114, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 101, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 117, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 115, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 101, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 32, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 99, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 108, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 97, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 115, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 115, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 45, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 48, ptr %str_char_16.6, align 1
  %str_char_17.5 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 32, ptr %str_char_17.5, align 1
  %str_char_18.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 40, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 49, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 54, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 32, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 22
  store i8 98, ptr %str_char_22.4, align 1
  %str_char_23.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 23
  store i8 121, ptr %str_char_23.4, align 1
  %str_char_24.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 24
  store i8 116, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 25
  store i8 101, ptr %str_char_25.4, align 1
  %str_char_26.2 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 26
  store i8 115, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 27
  store i8 41, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 28
  store i8 0, ptr %str_char_28.2, align 1
  %arg1_decay.5 = getelementptr [29 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.203, ptr %arg1_decay.5)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.201)
  ret void
}

define void @test_write_read__0__ret_voidE1() {
entry:
  %rng = alloca %PCG32, align 8
  %.fca.0.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %str_stack = alloca [51 x i8], align 1
  %str_char_0 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 3
  store i8 119, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 5
  store i8 105, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 6
  store i8 116, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 7
  store i8 101, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 8
  store i8 47, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 9
  store i8 114, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 10
  store i8 101, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 11
  store i8 97, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 12
  store i8 100, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 13
  store i8 32, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 14
  store i8 99, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 15
  store i8 111, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 16
  store i8 114, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 17
  store i8 114, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 18
  store i8 101, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 19
  store i8 99, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 20
  store i8 116, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 21
  store i8 110, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 22
  store i8 101, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 23
  store i8 115, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 24
  store i8 115, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 25
  store i8 32, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 26
  store i8 40, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 27
  store i8 49, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 28
  store i8 48, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 29
  store i8 48, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 30
  store i8 48, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 31
  store i8 48, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 32
  store i8 32, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 33
  store i8 97, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 34
  store i8 108, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 35
  store i8 108, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 36
  store i8 111, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 37
  store i8 99, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 38
  store i8 115, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 39
  store i8 47, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 40
  store i8 102, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 41
  store i8 114, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 42
  store i8 101, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 43
  store i8 101, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 44
  store i8 115, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 45
  store i8 41, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 46
  store i8 32, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 47
  store i8 45, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 48
  store i8 45, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 49
  store i8 10, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 50
  store i8 0, ptr %str_char_50, align 1
  %arg0_decay = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %.66 = sext i32 10000 to i64
  br label %while.cond

while.cond:                                       ; preds = %ifcont.2, %entry
  %ok.0 = phi i1 [ true, %entry ], [ %ok.23, %ifcont.2 ]
  %i.0 = phi i64 [ 0, %entry ], [ %.122, %ifcont.2 ]
  %.70 = icmp ult i64 %i.0, %.66
  br i1 %.70, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.72 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.74 = zext i32 %.72 to i64
  %.76 = zext i32 4096 to i64
  %.77 = urem i64 %.74, %.76
  %.78 = zext i32 1 to i64
  %.79 = add i64 %.77, %.78
  %.81 = zext i32 255 to i64
  %.82 = and i64 %i.0, %.81
  %.83 = trunc i64 %.82 to i8
  %.85 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.79)
  %.87 = zext i32 0 to i64
  %.88 = icmp eq i64 %.85, %.87
  br i1 %.88, label %while.end, label %ifcont

while.end:                                        ; preds = %while.end.2, %while.body, %while.cond
  %ok.12 = phi i1 [ %ok.0, %while.cond ], [ false, %while.body ], [ %ok.23, %while.end.2 ]
  %str_stack.1 = alloca [63 x i8], align 1
  %str_char_0.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 119, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 114, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 105, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 116, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 101, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 47, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 114, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 101, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 97, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 100, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 99, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 111, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 114, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 114, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 101, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 99, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 116, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 32, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 97, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 99, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 114, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 111, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 115, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 32, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 49, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 48, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 48, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 48, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 48, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 32, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 114, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 97, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 110, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 100, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 111, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 109, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 45, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 115, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 40
  store i8 105, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 41
  store i8 122, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 42
  store i8 101, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 43
  store i8 100, ptr %str_char_43.1, align 1
  %str_char_44.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 44
  store i8 32, ptr %str_char_44.1, align 1
  %str_char_45.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 45
  store i8 97, ptr %str_char_45.1, align 1
  %str_char_46.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 46
  store i8 108, ptr %str_char_46.1, align 1
  %str_char_47.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 47
  store i8 108, ptr %str_char_47.1, align 1
  %str_char_48.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 48
  store i8 111, ptr %str_char_48.1, align 1
  %str_char_49.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 49
  store i8 99, ptr %str_char_49.1, align 1
  %str_char_50.1 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 50
  store i8 47, ptr %str_char_50.1, align 1
  %str_char_51 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 51
  store i8 102, ptr %str_char_51, align 1
  %str_char_52 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 52
  store i8 114, ptr %str_char_52, align 1
  %str_char_53 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 53
  store i8 101, ptr %str_char_53, align 1
  %str_char_54 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 54
  store i8 101, ptr %str_char_54, align 1
  %str_char_55 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 55
  store i8 32, ptr %str_char_55, align 1
  %str_char_56 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 56
  store i8 99, ptr %str_char_56, align 1
  %str_char_57 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 57
  store i8 121, ptr %str_char_57, align 1
  %str_char_58 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 58
  store i8 99, ptr %str_char_58, align 1
  %str_char_59 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 59
  store i8 108, ptr %str_char_59, align 1
  %str_char_60 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 60
  store i8 101, ptr %str_char_60, align 1
  %str_char_61 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 61
  store i8 115, ptr %str_char_61, align 1
  %str_char_62 = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 62
  store i8 0, ptr %str_char_62, align 1
  %arg1_decay = getelementptr [63 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.12, ptr %arg1_decay)
  ret void

ifcont:                                           ; preds = %while.body
  %int_to_ptr = inttoptr i64 %.85 to ptr
  %.94 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont
  %j.0 = phi i64 [ %.94, %ifcont ], [ %.101, %while.body.1 ]
  %.97 = icmp ult i64 %j.0, %.79
  br i1 %.97, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.99 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %j.0
  store i8 %.83, ptr %.99, align 1
  %.101 = add i64 %j.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.104 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %ifcont.1, %while.end.1
  %j.11 = phi i64 [ %.104, %while.end.1 ], [ %.114, %ifcont.1 ]
  %.107 = icmp ult i64 %j.11, %.79
  br i1 %.107, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc = trunc i64 %j.11 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.109 = icmp ne i8 %ptr_load, %.83
  br i1 %.109, label %while.end.2, label %ifcont.1

while.end.2:                                      ; preds = %while.body.2, %while.cond.2
  %ok.23 = phi i1 [ %ok.0, %while.cond.2 ], [ false, %while.body.2 ]
  %.117 = xor i1 %ok.23, true
  br i1 %.117, label %while.end, label %ifcont.2

ifcont.1:                                         ; preds = %while.body.2
  %.114 = add i64 %j.11, 1
  br label %while.cond.2

ifcont.2:                                         ; preds = %while.end.2
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.85)
  %.122 = add i64 %i.0, 1
  br label %while.cond
}

define void @test_no_overlap__0__ret_voidE1() {
entry:
  %ptrs = alloca [512 x i64], align 8
  %memset_ptr = bitcast ptr %ptrs to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 4096, i1 false)
  %tags = alloca [512 x i8], align 1
  %memset_ptr.1 = bitcast ptr %tags to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr.1, i8 0, i64 512, i1 false)
  %rng = alloca %PCG32, align 8
  %.fca.0.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %str_stack = alloca [40 x i8], align 1
  %str_char_0 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 3
  store i8 110, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 4
  store i8 111, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 5
  store i8 45, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 6
  store i8 111, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 7
  store i8 118, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 9
  store i8 114, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 10
  store i8 108, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 11
  store i8 97, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 12
  store i8 112, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 13
  store i8 32, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 14
  store i8 117, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 15
  store i8 110, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 16
  store i8 100, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 17
  store i8 101, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 18
  store i8 114, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 20
  store i8 53, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 21
  store i8 49, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 22
  store i8 50, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 23
  store i8 32, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 24
  store i8 108, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 25
  store i8 105, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 26
  store i8 118, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 27
  store i8 101, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 28
  store i8 32, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 29
  store i8 98, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 30
  store i8 108, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 31
  store i8 111, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 32
  store i8 99, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 33
  store i8 107, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 34
  store i8 115, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 35
  store i8 32, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 36
  store i8 45, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 37
  store i8 45, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 38
  store i8 10, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 39
  store i8 0, ptr %str_char_39, align 1
  %arg0_decay = getelementptr [40 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %.55 = sext i32 512 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.end.1, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %.99, %while.end.1 ]
  %.59 = icmp ult i64 %i.0, %.55
  br i1 %.59, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.61 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.63 = zext i32 %.61 to i64
  %.65 = zext i32 256 to i64
  %.66 = urem i64 %.63, %.65
  %.67 = zext i32 1 to i64
  %.68 = add i64 %.66, %.67
  %.70 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.68)
  %.71 = getelementptr inbounds [512 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.70, ptr %.71, align 8
  %.73 = zext i32 255 to i64
  %.74 = and i64 %i.0, %.73
  %.75 = trunc i64 %.74 to i8
  %.76 = getelementptr inbounds [512 x i8], ptr %tags, i32 0, i64 %i.0
  store i8 %.75, ptr %.76, align 1
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [512 x i64], ptr %ptrs, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  %.78 = zext i32 0 to i64
  %.79 = icmp eq i64 %array_load, %.78
  br i1 %.79, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %str_stack.1 = alloca [34 x i8], align 1
  %str_char_0.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 97, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 108, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 108, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 32, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 53, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 49, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 50, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 32, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 98, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 108, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 111, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 99, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 107, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 115, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 32, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 97, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 108, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 108, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 111, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 99, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 97, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 116, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 101, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 100, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 32, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 110, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 111, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 110, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 45, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 110, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 117, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 108, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 108, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 0, ptr %str_char_33.1, align 1
  %arg1_decay = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.138 = sext i32 0 to i64
  br label %while.cond.2

ifcont:                                           ; preds = %while.body
  %idx_trunc.1 = trunc i64 %i.0 to i32
  %array_gep.1 = getelementptr inbounds [512 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  %int_to_ptr = inttoptr i64 %array_load.1 to ptr
  %.85 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont
  %j.0 = phi i64 [ %.85, %ifcont ], [ %.96, %while.body.1 ]
  %.88 = zext i32 16 to i64
  %.89 = icmp ult i64 %j.0, %.88
  %.91 = icmp ult i64 %j.0, %.68
  %spec.select = select i1 %.89, i1 %.91, i1 false
  br i1 %spec.select, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.2 = trunc i64 %i.0 to i32
  %array_gep.2 = getelementptr inbounds [512 x i8], ptr %tags, i32 0, i32 %idx_trunc.2
  %array_load.2 = load i8, ptr %array_gep.2, align 1
  %.94 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %j.0
  store i8 %array_load.2, ptr %.94, align 1
  %.96 = add i64 %j.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.99 = add i64 %i.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %ifcont.1, %while.end
  %i.16 = phi i64 [ %.138, %while.end ], [ %.149, %ifcont.1 ]
  %.141 = icmp ult i64 %i.16, %.55
  br i1 %.141, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.3 = trunc i64 %i.16 to i32
  %array_gep.3 = getelementptr inbounds [512 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.3
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  %int_to_ptr.1 = inttoptr i64 %array_load.3 to ptr
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %idx_trunc.4 = trunc i64 %i.16 to i32
  %array_gep.4 = getelementptr inbounds [512 x i8], ptr %tags, i32 0, i32 %idx_trunc.4
  %array_load.4 = load i8, ptr %array_gep.4, align 1
  %.144 = icmp ne i8 %ptr_load, %array_load.4
  br i1 %.144, label %while.end.2, label %ifcont.1

while.end.2:                                      ; preds = %while.body.2, %while.cond.2
  %ok.18 = phi i1 [ true, %while.cond.2 ], [ false, %while.body.2 ]
  %str_stack.2 = alloca [39 x i8], align 1
  %str_char_0.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 110, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 111, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 32, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 98, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 111, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 99, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 107, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 97, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 108, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 105, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 97, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 115, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 105, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 110, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 103, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 58, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 32, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 97, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 108, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 108, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 32, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 116, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 97, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 103, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 99, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 104, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 101, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 99, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 107, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 115, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 32, ptr %str_char_33.2, align 1
  %str_char_34.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 112, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 97, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 115, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 115, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 38
  store i8 0, ptr %str_char_38.1, align 1
  %arg1_decay.1 = getelementptr [39 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.18, ptr %arg1_decay.1)
  %.192 = sext i32 0 to i64
  br label %while.cond.3

ifcont.1:                                         ; preds = %while.body.2
  %.149 = add i64 %i.16, 1
  br label %while.cond.2

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %i.27 = phi i64 [ %.192, %while.end.2 ], [ %.198, %while.body.3 ]
  %.195 = icmp ult i64 %i.27, %.55
  br i1 %.195, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %idx_trunc.5 = trunc i64 %i.27 to i32
  %array_gep.5 = getelementptr inbounds [512 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.5
  %array_load.5 = load i64, ptr %array_gep.5, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.5)
  %.198 = add i64 %i.27, 1
  br label %while.cond.3

while.end.3:                                      ; preds = %while.cond.3
  ret void
}

define void @test_frealloc_same_class__0__ret_voidE1() {
entry:
  %str_stack = alloca [36 x i8], align 1
  %str_char_0 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 3
  store i8 102, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 6
  store i8 97, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 8
  store i8 108, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 9
  store i8 111, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 10
  store i8 99, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 12
  store i8 115, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 13
  store i8 97, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 14
  store i8 109, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 15
  store i8 101, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 16
  store i8 45, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 17
  store i8 99, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 18
  store i8 108, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 19
  store i8 97, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 20
  store i8 115, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 21
  store i8 115, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 22
  store i8 32, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 23
  store i8 105, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 24
  store i8 110, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 25
  store i8 45, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 26
  store i8 112, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 27
  store i8 108, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 28
  store i8 97, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 29
  store i8 99, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 30
  store i8 101, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 31
  store i8 32, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 32
  store i8 45, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 33
  store i8 45, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 34
  store i8 10, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 35
  store i8 0, ptr %str_char_35, align 1
  %arg0_decay = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.44 = sext i32 33 to i64
  %.45 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.44)
  %.47 = zext i32 0 to i64
  %.48 = icmp ne i64 %.45, %.47
  %str_stack.1 = alloca [21 x i8], align 1
  %str_char_0.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 109, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 108, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 40, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 51, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 51, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 41, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 32, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 110, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 110, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 45, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 110, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 117, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 108, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 108, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 0, ptr %str_char_20.1, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.48, ptr %arg1_decay)
  %int_to_ptr = inttoptr i64 %.45 to ptr
  %.72 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i64 [ %.72, %entry ], [ %.81, %while.body ]
  %.75 = zext i32 33 to i64
  %.76 = icmp ult i64 %i.0, %.75
  br i1 %.76, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.78 = trunc i32 170 to i8
  %.79 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %i.0
  store i8 %.78, ptr %.79, align 1
  %.81 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.84 = sext i32 64 to i64
  %.85 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.45, i64 %.84)
  %.87 = icmp eq i64 %.85, %.45
  %str_stack.2 = alloca [45 x i8], align 1
  %str_char_0.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 114, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 101, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 97, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 108, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 111, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 99, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 119, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 105, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 116, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 104, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 105, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 110, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 32, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 99, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 108, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 97, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 115, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 115, ptr %str_char_20.2, align 1
  %str_char_21.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 58, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 32, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 115, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 97, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 109, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 101, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 32, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 112, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 111, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 105, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 110, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 116, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 101, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 114, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 32, ptr %str_char_35.1, align 1
  %str_char_36 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 114, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 101, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 38
  store i8 116, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 39
  store i8 117, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 40
  store i8 114, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 41
  store i8 110, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 42
  store i8 101, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 43
  store i8 100, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 44
  store i8 0, ptr %str_char_44, align 1
  %arg1_decay.1 = getelementptr [45 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.87, ptr %arg1_decay.1)
  %.135 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %ifcont, %while.end
  %i.13 = phi i64 [ %.135, %while.end ], [ %.147, %ifcont ]
  %.138 = zext i32 33 to i64
  %.139 = icmp ult i64 %i.13, %.138
  br i1 %.139, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %int_to_ptr.1 = inttoptr i64 %.85 to ptr
  %idx_trunc = trunc i64 %i.13 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.141 = trunc i32 170 to i8
  %.142 = icmp ne i8 %ptr_load, %.141
  br i1 %.142, label %while.end.1, label %ifcont

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %ok.0 = phi i1 [ true, %while.cond.1 ], [ false, %while.body.1 ]
  %str_stack.3 = alloca [38 x i8], align 1
  %str_char_0.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 114, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 101, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 97, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 108, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 111, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 99, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 32, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 119, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 105, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 116, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 104, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 105, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 110, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 32, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 99, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 108, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 97, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 115, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 115, ptr %str_char_20.3, align 1
  %str_char_21.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 58, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 32, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 100, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 97, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 116, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 97, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 32, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 112, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 114, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 101, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 115, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 101, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 33
  store i8 114, ptr %str_char_33.2, align 1
  %str_char_34.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 34
  store i8 118, ptr %str_char_34.2, align 1
  %str_char_35.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 35
  store i8 101, ptr %str_char_35.2, align 1
  %str_char_36.1 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 36
  store i8 100, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 37
  store i8 0, ptr %str_char_37.1, align 1
  %arg1_decay.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.85)
  %.190 = sext i32 128 to i64
  %.191 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.190)
  %.193 = zext i32 0 to i64
  %.194 = icmp ne i64 %.191, %.193
  %str_stack.4 = alloca [38 x i8], align 1
  %str_char_0.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 109, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 97, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 108, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 108, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 111, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 99, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 40, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 49, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 50, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 56, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 41, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 32, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 110, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 111, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 110, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 45, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 110, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 117, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 108, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 108, ptr %str_char_20.4, align 1
  %str_char_21.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 32, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 102, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 111, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 114, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 32, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 115, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 104, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 114, ptr %str_char_28.3, align 1
  %str_char_29.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 29
  store i8 105, ptr %str_char_29.3, align 1
  %str_char_30.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 30
  store i8 110, ptr %str_char_30.3, align 1
  %str_char_31.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 31
  store i8 107, ptr %str_char_31.3, align 1
  %str_char_32.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 32
  store i8 32, ptr %str_char_32.3, align 1
  %str_char_33.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 33
  store i8 116, ptr %str_char_33.3, align 1
  %str_char_34.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 34
  store i8 101, ptr %str_char_34.3, align 1
  %str_char_35.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 35
  store i8 115, ptr %str_char_35.3, align 1
  %str_char_36.2 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 36
  store i8 116, ptr %str_char_36.2, align 1
  %str_char_37.2 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 37
  store i8 0, ptr %str_char_37.2, align 1
  %arg1_decay.3 = getelementptr [38 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.194, ptr %arg1_decay.3)
  %int_to_ptr.2 = inttoptr i64 %.191 to ptr
  %.235 = sext i32 0 to i64
  br label %while.cond.2

ifcont:                                           ; preds = %while.body.1
  %.147 = add i64 %i.13, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %i.24 = phi i64 [ %.235, %while.end.1 ], [ %.244, %while.body.2 ]
  %.238 = zext i32 64 to i64
  %.239 = icmp ult i64 %i.24, %.238
  br i1 %.239, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.241 = trunc i32 187 to i8
  %.242 = getelementptr inbounds i8, ptr %int_to_ptr.2, i64 %i.24
  store i8 %.241, ptr %.242, align 1
  %.244 = add i64 %i.24, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.247 = sext i32 60 to i64
  %.248 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.191, i64 %.247)
  %.250 = icmp eq i64 %.248, %.191
  %str_stack.5 = alloca [47 x i8], align 1
  %str_char_0.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 102, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 114, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 101, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 97, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 108, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 108, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 111, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 99, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 32, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 115, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 104, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 114, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 105, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 110, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 107, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 32, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 116, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 111, ptr %str_char_17.5, align 1
  %str_char_18.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 32, ptr %str_char_18.5, align 1
  %str_char_19.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 115, ptr %str_char_19.5, align 1
  %str_char_20.5 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 109, ptr %str_char_20.5, align 1
  %str_char_21.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 97, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 108, ptr %str_char_22.4, align 1
  %str_char_23.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 108, ptr %str_char_23.4, align 1
  %str_char_24.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 101, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 114, ptr %str_char_25.4, align 1
  %str_char_26.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 26
  store i8 32, ptr %str_char_26.4, align 1
  %str_char_27.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 27
  store i8 99, ptr %str_char_27.4, align 1
  %str_char_28.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 28
  store i8 108, ptr %str_char_28.4, align 1
  %str_char_29.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 29
  store i8 97, ptr %str_char_29.4, align 1
  %str_char_30.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 30
  store i8 115, ptr %str_char_30.4, align 1
  %str_char_31.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 31
  store i8 115, ptr %str_char_31.4, align 1
  %str_char_32.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 32
  store i8 58, ptr %str_char_32.4, align 1
  %str_char_33.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 33
  store i8 32, ptr %str_char_33.4, align 1
  %str_char_34.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 34
  store i8 115, ptr %str_char_34.4, align 1
  %str_char_35.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 35
  store i8 97, ptr %str_char_35.4, align 1
  %str_char_36.3 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 36
  store i8 109, ptr %str_char_36.3, align 1
  %str_char_37.3 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 37
  store i8 101, ptr %str_char_37.3, align 1
  %str_char_38.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 38
  store i8 32, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 39
  store i8 112, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 40
  store i8 111, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 41
  store i8 105, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 42
  store i8 110, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 43
  store i8 116, ptr %str_char_43.1, align 1
  %str_char_44.1 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 44
  store i8 101, ptr %str_char_44.1, align 1
  %str_char_45 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 45
  store i8 114, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 46
  store i8 0, ptr %str_char_46, align 1
  %arg1_decay.4 = getelementptr [47 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.250, ptr %arg1_decay.4)
  %.300 = sext i32 0 to i64
  br label %while.cond.3

while.cond.3:                                     ; preds = %ifcont.1, %while.end.2
  %i.35 = phi i64 [ %.300, %while.end.2 ], [ %.312, %ifcont.1 ]
  %.303 = zext i32 60 to i64
  %.304 = icmp ult i64 %i.35, %.303
  br i1 %.304, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %int_to_ptr.3 = inttoptr i64 %.248 to ptr
  %idx_trunc.1 = trunc i64 %i.35 to i32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %int_to_ptr.3, i32 %idx_trunc.1
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.306 = trunc i32 187 to i8
  %.307 = icmp ne i8 %ptr_load.1, %.306
  br i1 %.307, label %while.end.3, label %ifcont.1

while.end.3:                                      ; preds = %while.body.3, %while.cond.3
  %ok.16 = phi i1 [ true, %while.cond.3 ], [ false, %while.body.3 ]
  %str_stack.6 = alloca [32 x i8], align 1
  %str_char_0.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 102, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 114, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 101, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 97, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 108, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 108, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 111, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 99, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 32, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 115, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 104, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 114, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 105, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 110, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 107, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 58, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 32, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 100, ptr %str_char_17.6, align 1
  %str_char_18.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 97, ptr %str_char_18.6, align 1
  %str_char_19.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 116, ptr %str_char_19.6, align 1
  %str_char_20.6 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 97, ptr %str_char_20.6, align 1
  %str_char_21.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 32, ptr %str_char_21.5, align 1
  %str_char_22.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 22
  store i8 112, ptr %str_char_22.5, align 1
  %str_char_23.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 23
  store i8 114, ptr %str_char_23.5, align 1
  %str_char_24.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 24
  store i8 101, ptr %str_char_24.5, align 1
  %str_char_25.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 25
  store i8 115, ptr %str_char_25.5, align 1
  %str_char_26.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 26
  store i8 101, ptr %str_char_26.5, align 1
  %str_char_27.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 27
  store i8 114, ptr %str_char_27.5, align 1
  %str_char_28.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 28
  store i8 118, ptr %str_char_28.5, align 1
  %str_char_29.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 29
  store i8 101, ptr %str_char_29.5, align 1
  %str_char_30.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 30
  store i8 100, ptr %str_char_30.5, align 1
  %str_char_31.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 31
  store i8 0, ptr %str_char_31.5, align 1
  %arg1_decay.5 = getelementptr [32 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.16, ptr %arg1_decay.5)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.248)
  ret void

ifcont.1:                                         ; preds = %while.body.3
  %.312 = add i64 %i.35, 1
  br label %while.cond.3
}

define void @test_frealloc_grow__0__ret_voidE1() {
entry:
  %str_stack = alloca [21 x i8], align 1
  %str_char_0 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 3
  store i8 102, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 6
  store i8 97, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 8
  store i8 108, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 9
  store i8 111, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 10
  store i8 99, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 12
  store i8 103, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 13
  store i8 114, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 14
  store i8 111, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 15
  store i8 119, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 16
  store i8 32, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 17
  store i8 45, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 18
  store i8 45, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 19
  store i8 10, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 20
  store i8 0, ptr %str_char_20, align 1
  %arg0_decay = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.29 = sext i32 32 to i64
  %.30 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.29)
  %.32 = zext i32 0 to i64
  %.33 = icmp ne i64 %.30, %.32
  %str_stack.1 = alloca [21 x i8], align 1
  %str_char_0.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 109, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 108, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 40, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 51, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 50, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 41, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 32, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 110, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 110, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 45, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 110, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 117, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 108, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 108, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 0, ptr %str_char_20.1, align 1
  %arg1_decay = getelementptr [21 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.33, ptr %arg1_decay)
  %int_to_ptr = inttoptr i64 %.30 to ptr
  %.57 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i64 [ %.57, %entry ], [ %.68, %while.body ]
  %.60 = zext i32 32 to i64
  %.61 = icmp ult i64 %i.0, %.60
  br i1 %.61, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.63 = zext i32 255 to i64
  %.64 = and i64 %i.0, %.63
  %.65 = trunc i64 %.64 to i8
  %.66 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %i.0
  store i8 %.65, ptr %.66, align 1
  %.68 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.71 = sext i32 128 to i64
  %.72 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.30, i64 %.71)
  %.74 = zext i32 0 to i64
  %.75 = icmp ne i64 %.72, %.74
  %str_stack.2 = alloca [23 x i8], align 1
  %str_char_0.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 114, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 101, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 97, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 108, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 111, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 99, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 103, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 114, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 111, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 119, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 110, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 111, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 110, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 45, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 110, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 117, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 108, ptr %str_char_20.2, align 1
  %str_char_21 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 108, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 0, ptr %str_char_22, align 1
  %arg1_decay.1 = getelementptr [23 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.75, ptr %arg1_decay.1)
  %.101 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %ifcont, %while.end
  %i.110 = phi i64 [ %.101, %while.end ], [ %.115, %ifcont ]
  %.104 = zext i32 32 to i64
  %.105 = icmp ult i64 %i.110, %.104
  br i1 %.105, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %int_to_ptr.1 = inttoptr i64 %.72 to ptr
  %idx_trunc = trunc i64 %i.110 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.107 = zext i32 255 to i64
  %.108 = and i64 %i.110, %.107
  %.109 = trunc i64 %.108 to i8
  %.110 = icmp ne i8 %ptr_load, %.109
  br i1 %.110, label %while.end.1, label %ifcont

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %ok.0 = phi i1 [ true, %while.cond.1 ], [ false, %while.body.1 ]
  %str_stack.3 = alloca [40 x i8], align 1
  %str_char_0.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 114, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 101, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 97, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 108, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 111, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 99, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 32, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 103, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 114, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 111, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 119, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 58, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 32, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 111, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 114, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 105, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 103, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 105, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 110, ptr %str_char_20.3, align 1
  %str_char_21.1 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 97, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 108, ptr %str_char_22.1, align 1
  %str_char_23 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 32, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 98, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 121, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 116, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 101, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 115, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 32, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 112, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 114, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 101, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 33
  store i8 115, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 34
  store i8 101, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 35
  store i8 114, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 36
  store i8 118, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 37
  store i8 101, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 38
  store i8 100, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 39
  store i8 0, ptr %str_char_39, align 1
  %arg1_decay.2 = getelementptr [40 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.72)
  %.160 = sext i32 64 to i64
  %.161 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.160)
  %.163 = zext i32 0 to i64
  %.164 = icmp ne i64 %.161, %.163
  %str_stack.4 = alloca [45 x i8], align 1
  %str_char_0.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 109, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 97, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 108, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 108, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 111, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 99, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 40, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 54, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 52, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 41, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 32, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 110, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 111, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 110, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 45, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 110, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 117, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 108, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 108, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 32, ptr %str_char_20.4, align 1
  %str_char_21.2 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 102, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 111, ptr %str_char_22.2, align 1
  %str_char_23.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 114, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 32, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 99, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 114, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 111, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 115, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 29
  store i8 115, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 30
  store i8 45, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 31
  store i8 98, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 32
  store i8 111, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 33
  store i8 117, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 34
  store i8 110, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 35
  store i8 100, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 36
  store i8 97, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 37
  store i8 114, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 38
  store i8 121, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 39
  store i8 32, ptr %str_char_39.1, align 1
  %str_char_40 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 40
  store i8 103, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 41
  store i8 114, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 42
  store i8 111, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 43
  store i8 119, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 44
  store i8 0, ptr %str_char_44, align 1
  %arg1_decay.3 = getelementptr [45 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.164, ptr %arg1_decay.3)
  %int_to_ptr.2 = inttoptr i64 %.161 to ptr
  %.212 = sext i32 0 to i64
  br label %while.cond.2

ifcont:                                           ; preds = %while.body.1
  %.115 = add i64 %i.110, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %i.211 = phi i64 [ %.212, %while.end.1 ], [ %.223, %while.body.2 ]
  %.215 = zext i32 64 to i64
  %.216 = icmp ult i64 %i.211, %.215
  br i1 %.216, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.218 = zext i32 255 to i64
  %.219 = sub i64 %.218, %i.211
  %.220 = trunc i64 %.219 to i8
  %.221 = getelementptr inbounds i8, ptr %int_to_ptr.2, i64 %i.211
  store i8 %.220, ptr %.221, align 1
  %.223 = add i64 %i.211, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.226 = sext i32 8192 to i64
  %.227 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.161, i64 %.226)
  %.229 = zext i32 0 to i64
  %.230 = icmp ne i64 %.227, %.229
  %str_stack.5 = alloca [31 x i8], align 1
  %str_char_0.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 102, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 114, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 101, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 97, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 108, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 108, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 111, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 99, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 32, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 115, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 109, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 97, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 108, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 108, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 45, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 62, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 108, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 97, ptr %str_char_17.5, align 1
  %str_char_18.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 114, ptr %str_char_18.5, align 1
  %str_char_19.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 103, ptr %str_char_19.5, align 1
  %str_char_20.5 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 101, ptr %str_char_20.5, align 1
  %str_char_21.3 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 32, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 110, ptr %str_char_22.3, align 1
  %str_char_23.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 111, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 110, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 45, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 26
  store i8 110, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 27
  store i8 117, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 28
  store i8 108, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 29
  store i8 108, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 30
  store i8 0, ptr %str_char_30.2, align 1
  %arg1_decay.4 = getelementptr [31 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.230, ptr %arg1_decay.4)
  %.263 = icmp ne i64 %.227, %.161
  %str_stack.6 = alloca [36 x i8], align 1
  %str_char_0.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 102, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 114, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 101, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 97, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 108, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 108, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 111, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 99, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 32, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 115, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 109, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 97, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 108, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 108, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 45, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 62, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 108, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 97, ptr %str_char_17.6, align 1
  %str_char_18.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 114, ptr %str_char_18.6, align 1
  %str_char_19.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 103, ptr %str_char_19.6, align 1
  %str_char_20.6 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 101, ptr %str_char_20.6, align 1
  %str_char_21.4 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 32, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 22
  store i8 109, ptr %str_char_22.4, align 1
  %str_char_23.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 23
  store i8 111, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 24
  store i8 118, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 25
  store i8 101, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 26
  store i8 100, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 27
  store i8 32, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 28
  store i8 112, ptr %str_char_28.3, align 1
  %str_char_29.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 29
  store i8 111, ptr %str_char_29.3, align 1
  %str_char_30.3 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 30
  store i8 105, ptr %str_char_30.3, align 1
  %str_char_31.2 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 31
  store i8 110, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 32
  store i8 116, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 33
  store i8 101, ptr %str_char_33.2, align 1
  %str_char_34.2 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 34
  store i8 114, ptr %str_char_34.2, align 1
  %str_char_35.2 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 35
  store i8 0, ptr %str_char_35.2, align 1
  %arg1_decay.5 = getelementptr [36 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.263, ptr %arg1_decay.5)
  %.302 = sext i32 0 to i64
  br label %while.cond.3

while.cond.3:                                     ; preds = %ifcont.1, %while.end.2
  %i.312 = phi i64 [ %.302, %while.end.2 ], [ %.316, %ifcont.1 ]
  %.305 = zext i32 64 to i64
  %.306 = icmp ult i64 %i.312, %.305
  br i1 %.306, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %int_to_ptr.3 = inttoptr i64 %.227 to ptr
  %idx_trunc.1 = trunc i64 %i.312 to i32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %int_to_ptr.3, i32 %idx_trunc.1
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.308 = zext i32 255 to i64
  %.309 = sub i64 %.308, %i.312
  %.310 = trunc i64 %.309 to i8
  %.311 = icmp ne i8 %ptr_load.1, %.310
  br i1 %.311, label %while.end.3, label %ifcont.1

while.end.3:                                      ; preds = %while.body.3, %while.cond.3
  %ok.115 = phi i1 [ true, %while.cond.3 ], [ false, %while.body.3 ]
  %str_stack.7 = alloca [48 x i8], align 1
  %str_char_0.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 102, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 114, ptr %str_char_1.7, align 1
  %str_char_2.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 101, ptr %str_char_2.7, align 1
  %str_char_3.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 97, ptr %str_char_3.7, align 1
  %str_char_4.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 108, ptr %str_char_4.7, align 1
  %str_char_5.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 108, ptr %str_char_5.7, align 1
  %str_char_6.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 111, ptr %str_char_6.7, align 1
  %str_char_7.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 99, ptr %str_char_7.7, align 1
  %str_char_8.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 32, ptr %str_char_8.7, align 1
  %str_char_9.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 115, ptr %str_char_9.7, align 1
  %str_char_10.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 109, ptr %str_char_10.7, align 1
  %str_char_11.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 97, ptr %str_char_11.7, align 1
  %str_char_12.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 108, ptr %str_char_12.7, align 1
  %str_char_13.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 108, ptr %str_char_13.7, align 1
  %str_char_14.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 45, ptr %str_char_14.7, align 1
  %str_char_15.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 15
  store i8 62, ptr %str_char_15.7, align 1
  %str_char_16.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 16
  store i8 108, ptr %str_char_16.7, align 1
  %str_char_17.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 17
  store i8 97, ptr %str_char_17.7, align 1
  %str_char_18.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 18
  store i8 114, ptr %str_char_18.7, align 1
  %str_char_19.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 19
  store i8 103, ptr %str_char_19.7, align 1
  %str_char_20.7 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 20
  store i8 101, ptr %str_char_20.7, align 1
  %str_char_21.5 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 21
  store i8 58, ptr %str_char_21.5, align 1
  %str_char_22.5 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 22
  store i8 32, ptr %str_char_22.5, align 1
  %str_char_23.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 23
  store i8 111, ptr %str_char_23.4, align 1
  %str_char_24.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 24
  store i8 114, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 25
  store i8 105, ptr %str_char_25.4, align 1
  %str_char_26.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 26
  store i8 103, ptr %str_char_26.4, align 1
  %str_char_27.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 27
  store i8 105, ptr %str_char_27.4, align 1
  %str_char_28.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 28
  store i8 110, ptr %str_char_28.4, align 1
  %str_char_29.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 29
  store i8 97, ptr %str_char_29.4, align 1
  %str_char_30.4 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 30
  store i8 108, ptr %str_char_30.4, align 1
  %str_char_31.3 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 31
  store i8 32, ptr %str_char_31.3, align 1
  %str_char_32.3 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 32
  store i8 98, ptr %str_char_32.3, align 1
  %str_char_33.3 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 33
  store i8 121, ptr %str_char_33.3, align 1
  %str_char_34.3 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 34
  store i8 116, ptr %str_char_34.3, align 1
  %str_char_35.3 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 35
  store i8 101, ptr %str_char_35.3, align 1
  %str_char_36.2 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 36
  store i8 115, ptr %str_char_36.2, align 1
  %str_char_37.2 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 37
  store i8 32, ptr %str_char_37.2, align 1
  %str_char_38.2 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 38
  store i8 112, ptr %str_char_38.2, align 1
  %str_char_39.2 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 39
  store i8 114, ptr %str_char_39.2, align 1
  %str_char_40.1 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 40
  store i8 101, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 41
  store i8 115, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 42
  store i8 101, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 43
  store i8 114, ptr %str_char_43.1, align 1
  %str_char_44.1 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 44
  store i8 118, ptr %str_char_44.1, align 1
  %str_char_45 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 45
  store i8 101, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 46
  store i8 100, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 47
  store i8 0, ptr %str_char_47, align 1
  %arg1_decay.6 = getelementptr [48 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.115, ptr %arg1_decay.6)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.227)
  %.369 = sext i32 8192 to i64
  %.370 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.369)
  %.372 = zext i32 0 to i64
  %.373 = icmp ne i64 %.370, %.372
  %str_stack.8 = alloca [47 x i8], align 1
  %str_char_0.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 102, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 109, ptr %str_char_1.8, align 1
  %str_char_2.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 2
  store i8 97, ptr %str_char_2.8, align 1
  %str_char_3.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 3
  store i8 108, ptr %str_char_3.8, align 1
  %str_char_4.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 4
  store i8 108, ptr %str_char_4.8, align 1
  %str_char_5.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 5
  store i8 111, ptr %str_char_5.8, align 1
  %str_char_6.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 6
  store i8 99, ptr %str_char_6.8, align 1
  %str_char_7.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 7
  store i8 40, ptr %str_char_7.8, align 1
  %str_char_8.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 8
  store i8 56, ptr %str_char_8.8, align 1
  %str_char_9.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 9
  store i8 49, ptr %str_char_9.8, align 1
  %str_char_10.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 10
  store i8 57, ptr %str_char_10.8, align 1
  %str_char_11.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 11
  store i8 50, ptr %str_char_11.8, align 1
  %str_char_12.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 12
  store i8 41, ptr %str_char_12.8, align 1
  %str_char_13.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 13
  store i8 32, ptr %str_char_13.8, align 1
  %str_char_14.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 14
  store i8 110, ptr %str_char_14.8, align 1
  %str_char_15.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 15
  store i8 111, ptr %str_char_15.8, align 1
  %str_char_16.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 16
  store i8 110, ptr %str_char_16.8, align 1
  %str_char_17.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 17
  store i8 45, ptr %str_char_17.8, align 1
  %str_char_18.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 18
  store i8 110, ptr %str_char_18.8, align 1
  %str_char_19.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 19
  store i8 117, ptr %str_char_19.8, align 1
  %str_char_20.8 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 20
  store i8 108, ptr %str_char_20.8, align 1
  %str_char_21.6 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 21
  store i8 108, ptr %str_char_21.6, align 1
  %str_char_22.6 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 22
  store i8 32, ptr %str_char_22.6, align 1
  %str_char_23.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 23
  store i8 102, ptr %str_char_23.5, align 1
  %str_char_24.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 24
  store i8 111, ptr %str_char_24.5, align 1
  %str_char_25.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 25
  store i8 114, ptr %str_char_25.5, align 1
  %str_char_26.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 26
  store i8 32, ptr %str_char_26.5, align 1
  %str_char_27.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 27
  store i8 108, ptr %str_char_27.5, align 1
  %str_char_28.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 28
  store i8 97, ptr %str_char_28.5, align 1
  %str_char_29.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 29
  store i8 114, ptr %str_char_29.5, align 1
  %str_char_30.5 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 30
  store i8 103, ptr %str_char_30.5, align 1
  %str_char_31.4 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 31
  store i8 101, ptr %str_char_31.4, align 1
  %str_char_32.4 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 32
  store i8 45, ptr %str_char_32.4, align 1
  %str_char_33.4 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 33
  store i8 62, ptr %str_char_33.4, align 1
  %str_char_34.4 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 34
  store i8 115, ptr %str_char_34.4, align 1
  %str_char_35.4 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 35
  store i8 109, ptr %str_char_35.4, align 1
  %str_char_36.3 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 36
  store i8 97, ptr %str_char_36.3, align 1
  %str_char_37.3 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 37
  store i8 108, ptr %str_char_37.3, align 1
  %str_char_38.3 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 38
  store i8 108, ptr %str_char_38.3, align 1
  %str_char_39.3 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 39
  store i8 32, ptr %str_char_39.3, align 1
  %str_char_40.2 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 40
  store i8 115, ptr %str_char_40.2, align 1
  %str_char_41.2 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 41
  store i8 104, ptr %str_char_41.2, align 1
  %str_char_42.2 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 42
  store i8 114, ptr %str_char_42.2, align 1
  %str_char_43.2 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 43
  store i8 105, ptr %str_char_43.2, align 1
  %str_char_44.2 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 44
  store i8 110, ptr %str_char_44.2, align 1
  %str_char_45.1 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 45
  store i8 107, ptr %str_char_45.1, align 1
  %str_char_46.1 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 46
  store i8 0, ptr %str_char_46.1, align 1
  %arg1_decay.7 = getelementptr [47 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.373, ptr %arg1_decay.7)
  %int_to_ptr.4 = inttoptr i64 %.370 to ptr
  %.423 = sext i32 0 to i64
  br label %while.cond.4

ifcont.1:                                         ; preds = %while.body.3
  %.316 = add i64 %i.312, 1
  br label %while.cond.3

while.cond.4:                                     ; preds = %while.body.4, %while.end.3
  %i.413 = phi i64 [ %.423, %while.end.3 ], [ %.434, %while.body.4 ]
  %.426 = zext i32 64 to i64
  %.427 = icmp ult i64 %i.413, %.426
  br i1 %.427, label %while.body.4, label %while.end.4

while.body.4:                                     ; preds = %while.cond.4
  %.429 = zext i32 3 to i64
  %.430 = mul i64 %i.413, %.429
  %.431 = trunc i64 %.430 to i8
  %.432 = getelementptr inbounds i8, ptr %int_to_ptr.4, i64 %i.413
  store i8 %.431, ptr %.432, align 1
  %.434 = add i64 %i.413, 1
  br label %while.cond.4

while.end.4:                                      ; preds = %while.cond.4
  %.437 = sext i32 64 to i64
  %.438 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.370, i64 %.437)
  %.440 = zext i32 0 to i64
  %.441 = icmp ne i64 %.438, %.440
  %str_stack.9 = alloca [31 x i8], align 1
  %str_char_0.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 0
  store i8 102, ptr %str_char_0.9, align 1
  %str_char_1.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 1
  store i8 114, ptr %str_char_1.9, align 1
  %str_char_2.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 2
  store i8 101, ptr %str_char_2.9, align 1
  %str_char_3.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 3
  store i8 97, ptr %str_char_3.9, align 1
  %str_char_4.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 4
  store i8 108, ptr %str_char_4.9, align 1
  %str_char_5.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 5
  store i8 108, ptr %str_char_5.9, align 1
  %str_char_6.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 6
  store i8 111, ptr %str_char_6.9, align 1
  %str_char_7.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 7
  store i8 99, ptr %str_char_7.9, align 1
  %str_char_8.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 8
  store i8 32, ptr %str_char_8.9, align 1
  %str_char_9.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 9
  store i8 108, ptr %str_char_9.9, align 1
  %str_char_10.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 10
  store i8 97, ptr %str_char_10.9, align 1
  %str_char_11.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 11
  store i8 114, ptr %str_char_11.9, align 1
  %str_char_12.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 12
  store i8 103, ptr %str_char_12.9, align 1
  %str_char_13.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 13
  store i8 101, ptr %str_char_13.9, align 1
  %str_char_14.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 14
  store i8 45, ptr %str_char_14.9, align 1
  %str_char_15.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 15
  store i8 62, ptr %str_char_15.9, align 1
  %str_char_16.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 16
  store i8 115, ptr %str_char_16.9, align 1
  %str_char_17.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 17
  store i8 109, ptr %str_char_17.9, align 1
  %str_char_18.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 18
  store i8 97, ptr %str_char_18.9, align 1
  %str_char_19.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 19
  store i8 108, ptr %str_char_19.9, align 1
  %str_char_20.9 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 20
  store i8 108, ptr %str_char_20.9, align 1
  %str_char_21.7 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 21
  store i8 32, ptr %str_char_21.7, align 1
  %str_char_22.7 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 22
  store i8 110, ptr %str_char_22.7, align 1
  %str_char_23.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 23
  store i8 111, ptr %str_char_23.6, align 1
  %str_char_24.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 24
  store i8 110, ptr %str_char_24.6, align 1
  %str_char_25.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 25
  store i8 45, ptr %str_char_25.6, align 1
  %str_char_26.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 26
  store i8 110, ptr %str_char_26.6, align 1
  %str_char_27.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 27
  store i8 117, ptr %str_char_27.6, align 1
  %str_char_28.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 28
  store i8 108, ptr %str_char_28.6, align 1
  %str_char_29.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 29
  store i8 108, ptr %str_char_29.6, align 1
  %str_char_30.6 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 30
  store i8 0, ptr %str_char_30.6, align 1
  %arg1_decay.8 = getelementptr [31 x i8], ptr %str_stack.9, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.441, ptr %arg1_decay.8)
  %.475 = sext i32 0 to i64
  br label %while.cond.5

while.cond.5:                                     ; preds = %ifcont.2, %while.end.4
  %i.514 = phi i64 [ %.475, %while.end.4 ], [ %.489, %ifcont.2 ]
  %.478 = zext i32 64 to i64
  %.479 = icmp ult i64 %i.514, %.478
  br i1 %.479, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %int_to_ptr.5 = inttoptr i64 %.438 to ptr
  %idx_trunc.2 = trunc i64 %i.514 to i32
  %ptr_gep.2 = getelementptr inbounds i8, ptr %int_to_ptr.5, i32 %idx_trunc.2
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.481 = zext i32 3 to i64
  %.482 = mul i64 %i.514, %.481
  %.483 = trunc i64 %.482 to i8
  %.484 = icmp ne i8 %ptr_load.2, %.483
  br i1 %.484, label %while.end.5, label %ifcont.2

while.end.5:                                      ; preds = %while.body.5, %while.cond.5
  %ok.216 = phi i1 [ true, %while.cond.5 ], [ false, %while.body.5 ]
  %str_stack.10 = alloca [39 x i8], align 1
  %str_char_0.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 0
  store i8 102, ptr %str_char_0.10, align 1
  %str_char_1.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 1
  store i8 114, ptr %str_char_1.10, align 1
  %str_char_2.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 2
  store i8 101, ptr %str_char_2.10, align 1
  %str_char_3.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 3
  store i8 97, ptr %str_char_3.10, align 1
  %str_char_4.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 4
  store i8 108, ptr %str_char_4.10, align 1
  %str_char_5.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 5
  store i8 108, ptr %str_char_5.10, align 1
  %str_char_6.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 6
  store i8 111, ptr %str_char_6.10, align 1
  %str_char_7.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 7
  store i8 99, ptr %str_char_7.10, align 1
  %str_char_8.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 8
  store i8 32, ptr %str_char_8.10, align 1
  %str_char_9.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 9
  store i8 108, ptr %str_char_9.10, align 1
  %str_char_10.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 10
  store i8 97, ptr %str_char_10.10, align 1
  %str_char_11.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 11
  store i8 114, ptr %str_char_11.10, align 1
  %str_char_12.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 12
  store i8 103, ptr %str_char_12.10, align 1
  %str_char_13.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 13
  store i8 101, ptr %str_char_13.10, align 1
  %str_char_14.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 14
  store i8 45, ptr %str_char_14.10, align 1
  %str_char_15.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 15
  store i8 62, ptr %str_char_15.10, align 1
  %str_char_16.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 16
  store i8 115, ptr %str_char_16.10, align 1
  %str_char_17.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 17
  store i8 109, ptr %str_char_17.10, align 1
  %str_char_18.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 18
  store i8 97, ptr %str_char_18.10, align 1
  %str_char_19.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 19
  store i8 108, ptr %str_char_19.10, align 1
  %str_char_20.10 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 20
  store i8 108, ptr %str_char_20.10, align 1
  %str_char_21.8 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 21
  store i8 58, ptr %str_char_21.8, align 1
  %str_char_22.8 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 22
  store i8 32, ptr %str_char_22.8, align 1
  %str_char_23.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 23
  store i8 98, ptr %str_char_23.7, align 1
  %str_char_24.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 24
  store i8 121, ptr %str_char_24.7, align 1
  %str_char_25.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 25
  store i8 116, ptr %str_char_25.7, align 1
  %str_char_26.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 26
  store i8 101, ptr %str_char_26.7, align 1
  %str_char_27.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 27
  store i8 115, ptr %str_char_27.7, align 1
  %str_char_28.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 28
  store i8 32, ptr %str_char_28.7, align 1
  %str_char_29.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 29
  store i8 112, ptr %str_char_29.7, align 1
  %str_char_30.7 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 30
  store i8 114, ptr %str_char_30.7, align 1
  %str_char_31.5 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 31
  store i8 101, ptr %str_char_31.5, align 1
  %str_char_32.5 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 32
  store i8 115, ptr %str_char_32.5, align 1
  %str_char_33.5 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 33
  store i8 101, ptr %str_char_33.5, align 1
  %str_char_34.5 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 34
  store i8 114, ptr %str_char_34.5, align 1
  %str_char_35.5 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 35
  store i8 118, ptr %str_char_35.5, align 1
  %str_char_36.4 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 36
  store i8 101, ptr %str_char_36.4, align 1
  %str_char_37.4 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 37
  store i8 100, ptr %str_char_37.4, align 1
  %str_char_38.4 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 38
  store i8 0, ptr %str_char_38.4, align 1
  %arg1_decay.9 = getelementptr [39 x i8], ptr %str_stack.10, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.216, ptr %arg1_decay.9)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.438)
  ret void

ifcont.2:                                         ; preds = %while.body.5
  %.489 = add i64 %i.514, 1
  br label %while.cond.5
}

define void @test_frealloc_large_identity__0__ret_voidE1() {
entry:
  %str_stack = alloca [37 x i8], align 1
  %str_char_0 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 3
  store i8 102, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 6
  store i8 97, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 8
  store i8 108, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 9
  store i8 111, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 10
  store i8 99, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 12
  store i8 108, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 13
  store i8 97, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 14
  store i8 114, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 15
  store i8 103, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 16
  store i8 101, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 17
  store i8 45, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 18
  store i8 98, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 19
  store i8 108, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 20
  store i8 111, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 21
  store i8 99, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 22
  store i8 107, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 23
  store i8 32, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 24
  store i8 105, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 25
  store i8 100, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 26
  store i8 101, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 27
  store i8 110, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 28
  store i8 116, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 29
  store i8 105, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 30
  store i8 116, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 31
  store i8 121, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 32
  store i8 32, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 33
  store i8 45, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 34
  store i8 45, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 35
  store i8 10, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 36
  store i8 0, ptr %str_char_36, align 1
  %arg0_decay = getelementptr [37 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.42 = sext i32 65536 to i64
  %.43 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.42)
  %.45 = zext i32 0 to i64
  %.46 = icmp ne i64 %.43, %.45
  %str_stack.1 = alloca [22 x i8], align 1
  %str_char_0.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 109, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 108, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 40, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 54, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 52, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 75, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 41, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 32, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 110, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 111, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 110, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 45, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 110, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 117, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 108, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 108, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 0, ptr %str_char_21.1, align 1
  %arg1_decay = getelementptr [22 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.46, ptr %arg1_decay)
  %.70 = sext i32 65536 to i64
  %.71 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.43, i64 %.70)
  %.73 = icmp eq i64 %.71, %.43
  %str_stack.2 = alloca [46 x i8], align 1
  %str_char_0.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 114, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 101, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 97, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 108, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 111, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 99, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 108, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 97, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 114, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 103, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 101, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 32, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 115, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 97, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 109, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 101, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 45, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 115, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 105, ptr %str_char_21.2, align 1
  %str_char_22.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 122, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 101, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 32, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 114, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 101, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 116, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 117, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 114, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 110, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 115, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 32, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 115, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 97, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 109, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 101, ptr %str_char_36.1, align 1
  %str_char_37 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 32, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 38
  store i8 112, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 39
  store i8 111, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 40
  store i8 105, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 41
  store i8 110, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 42
  store i8 116, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 43
  store i8 101, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 44
  store i8 114, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 45
  store i8 0, ptr %str_char_45, align 1
  %arg1_decay.1 = getelementptr [46 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.73, ptr %arg1_decay.1)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.71)
  ret void
}

define void @test_frealloc_chain__0__ret_voidE1() {
entry:
  %str_stack = alloca [31 x i8], align 1
  %str_char_0 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 3
  store i8 102, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 6
  store i8 97, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 8
  store i8 108, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 9
  store i8 111, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 10
  store i8 99, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 12
  store i8 99, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 13
  store i8 104, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 14
  store i8 97, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 15
  store i8 105, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 16
  store i8 110, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 17
  store i8 101, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 18
  store i8 100, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 20
  store i8 103, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 21
  store i8 114, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 22
  store i8 111, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 23
  store i8 119, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 24
  store i8 116, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 25
  store i8 104, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 26
  store i8 32, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 27
  store i8 45, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 28
  store i8 45, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 29
  store i8 10, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 30
  store i8 0, ptr %str_char_30, align 1
  %arg0_decay = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.38 = sext i32 8 to i64
  %.39 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.38)
  %.41 = zext i32 0 to i64
  %.42 = icmp ne i64 %.39, %.41
  %str_stack.1 = alloca [28 x i8], align 1
  %str_char_0.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 105, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 110, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 105, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 116, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 105, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 97, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 108, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 32, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 102, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 109, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 97, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 108, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 108, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 99, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 40, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 56, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 41, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 32, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 110, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 111, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 110, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 45, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 110, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 117, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 108, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 108, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 0, ptr %str_char_27.1, align 1
  %arg1_decay = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.42, ptr %arg1_decay)
  %.72 = trunc i32 66 to i8
  %int_to_ptr = inttoptr i64 %.39 to ptr
  %.73 = getelementptr inbounds i8, ptr %int_to_ptr, i32 0
  store i8 %.72, ptr %.73, align 1
  %.75 = sext i32 32 to i64
  %.76 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.39, i64 %.75)
  %.78 = zext i32 0 to i64
  %.79 = icmp ne i64 %.76, %.78
  %str_stack.2 = alloca [24 x i8], align 1
  %str_char_0.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 114, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 101, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 97, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 108, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 111, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 99, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 45, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 62, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 51, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 50, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 32, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 110, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 111, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 110, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 45, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 110, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 117, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 108, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 108, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 0, ptr %str_char_23.2, align 1
  %arg1_decay.1 = getelementptr [24 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.79, ptr %arg1_decay.1)
  %.105 = sext i32 128 to i64
  %.106 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.76, i64 %.105)
  %.108 = zext i32 0 to i64
  %.109 = icmp ne i64 %.106, %.108
  %str_stack.3 = alloca [25 x i8], align 1
  %str_char_0.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 114, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 101, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 97, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 108, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 111, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 99, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 32, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 45, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 62, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 32, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 49, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 50, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 56, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 32, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 110, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 111, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 110, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 45, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 110, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 117, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 108, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 108, ptr %str_char_23.3, align 1
  %str_char_24.2 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 0, ptr %str_char_24.2, align 1
  %arg1_decay.2 = getelementptr [25 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.109, ptr %arg1_decay.2)
  %.136 = sext i32 512 to i64
  %.137 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.106, i64 %.136)
  %.139 = zext i32 0 to i64
  %.140 = icmp ne i64 %.137, %.139
  %str_stack.4 = alloca [25 x i8], align 1
  %str_char_0.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 114, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 101, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 97, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 108, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 108, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 111, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 99, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 32, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 45, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 62, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 32, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 53, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 49, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 50, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 32, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 110, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 111, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 110, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 45, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 110, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 117, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 108, ptr %str_char_22.4, align 1
  %str_char_23.4 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 108, ptr %str_char_23.4, align 1
  %str_char_24.3 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 0, ptr %str_char_24.3, align 1
  %arg1_decay.3 = getelementptr [25 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.140, ptr %arg1_decay.3)
  %.167 = sext i32 4096 to i64
  %.168 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.137, i64 %.167)
  %.170 = zext i32 0 to i64
  %.171 = icmp ne i64 %.168, %.170
  %str_stack.5 = alloca [26 x i8], align 1
  %str_char_0.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 102, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 114, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 101, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 97, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 108, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 108, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 111, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 99, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 32, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 45, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 62, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 32, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 52, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 48, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 57, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 54, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 32, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 110, ptr %str_char_17.5, align 1
  %str_char_18.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 111, ptr %str_char_18.5, align 1
  %str_char_19.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 110, ptr %str_char_19.5, align 1
  %str_char_20.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 45, ptr %str_char_20.5, align 1
  %str_char_21.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 110, ptr %str_char_21.5, align 1
  %str_char_22.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 22
  store i8 117, ptr %str_char_22.5, align 1
  %str_char_23.5 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 23
  store i8 108, ptr %str_char_23.5, align 1
  %str_char_24.4 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 24
  store i8 108, ptr %str_char_24.4, align 1
  %str_char_25.2 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 25
  store i8 0, ptr %str_char_25.2, align 1
  %arg1_decay.4 = getelementptr [26 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.171, ptr %arg1_decay.4)
  %.199 = sext i32 65536 to i64
  %.200 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.168, i64 %.199)
  %.202 = zext i32 0 to i64
  %.203 = icmp ne i64 %.200, %.202
  %str_stack.6 = alloca [35 x i8], align 1
  %str_char_0.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 102, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 114, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 101, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 97, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 108, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 108, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 111, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 99, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 32, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 45, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 62, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 32, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 54, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 53, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 53, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 51, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 54, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 32, ptr %str_char_17.6, align 1
  %str_char_18.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 40, ptr %str_char_18.6, align 1
  %str_char_19.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 19
  store i8 108, ptr %str_char_19.6, align 1
  %str_char_20.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 20
  store i8 97, ptr %str_char_20.6, align 1
  %str_char_21.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 21
  store i8 114, ptr %str_char_21.6, align 1
  %str_char_22.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 22
  store i8 103, ptr %str_char_22.6, align 1
  %str_char_23.6 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 23
  store i8 101, ptr %str_char_23.6, align 1
  %str_char_24.5 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 24
  store i8 41, ptr %str_char_24.5, align 1
  %str_char_25.3 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 25
  store i8 32, ptr %str_char_25.3, align 1
  %str_char_26.2 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 26
  store i8 110, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 27
  store i8 111, ptr %str_char_27.2, align 1
  %str_char_28.1 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 28
  store i8 110, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 29
  store i8 45, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 30
  store i8 110, ptr %str_char_30.1, align 1
  %str_char_31 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 31
  store i8 117, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 32
  store i8 108, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 33
  store i8 108, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 34
  store i8 0, ptr %str_char_34, align 1
  %arg1_decay.5 = getelementptr [35 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.203, ptr %arg1_decay.5)
  %.240 = sext i32 4096 to i64
  %.241 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.200, i64 %.240)
  %.243 = zext i32 0 to i64
  %.244 = icmp ne i64 %.241, %.243
  %str_stack.7 = alloca [30 x i8], align 1
  %str_char_0.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 102, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 114, ptr %str_char_1.7, align 1
  %str_char_2.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 101, ptr %str_char_2.7, align 1
  %str_char_3.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 97, ptr %str_char_3.7, align 1
  %str_char_4.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 108, ptr %str_char_4.7, align 1
  %str_char_5.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 108, ptr %str_char_5.7, align 1
  %str_char_6.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 111, ptr %str_char_6.7, align 1
  %str_char_7.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 99, ptr %str_char_7.7, align 1
  %str_char_8.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 32, ptr %str_char_8.7, align 1
  %str_char_9.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 108, ptr %str_char_9.7, align 1
  %str_char_10.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 97, ptr %str_char_10.7, align 1
  %str_char_11.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 114, ptr %str_char_11.7, align 1
  %str_char_12.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 103, ptr %str_char_12.7, align 1
  %str_char_13.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 101, ptr %str_char_13.7, align 1
  %str_char_14.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 45, ptr %str_char_14.7, align 1
  %str_char_15.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 15
  store i8 62, ptr %str_char_15.7, align 1
  %str_char_16.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 16
  store i8 52, ptr %str_char_16.7, align 1
  %str_char_17.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 17
  store i8 48, ptr %str_char_17.7, align 1
  %str_char_18.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 18
  store i8 57, ptr %str_char_18.7, align 1
  %str_char_19.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 19
  store i8 54, ptr %str_char_19.7, align 1
  %str_char_20.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 20
  store i8 32, ptr %str_char_20.7, align 1
  %str_char_21.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 21
  store i8 110, ptr %str_char_21.7, align 1
  %str_char_22.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 22
  store i8 111, ptr %str_char_22.7, align 1
  %str_char_23.7 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 23
  store i8 110, ptr %str_char_23.7, align 1
  %str_char_24.6 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 24
  store i8 45, ptr %str_char_24.6, align 1
  %str_char_25.4 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 25
  store i8 110, ptr %str_char_25.4, align 1
  %str_char_26.3 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 26
  store i8 117, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 27
  store i8 108, ptr %str_char_27.3, align 1
  %str_char_28.2 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 28
  store i8 108, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 29
  store i8 0, ptr %str_char_29.2, align 1
  %arg1_decay.6 = getelementptr [30 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.244, ptr %arg1_decay.6)
  %.276 = sext i32 64 to i64
  %.277 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %.241, i64 %.276)
  %.279 = zext i32 0 to i64
  %.280 = icmp ne i64 %.277, %.279
  %str_stack.8 = alloca [23 x i8], align 1
  %str_char_0.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 102, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 114, ptr %str_char_1.8, align 1
  %str_char_2.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 2
  store i8 101, ptr %str_char_2.8, align 1
  %str_char_3.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 3
  store i8 97, ptr %str_char_3.8, align 1
  %str_char_4.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 4
  store i8 108, ptr %str_char_4.8, align 1
  %str_char_5.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 5
  store i8 108, ptr %str_char_5.8, align 1
  %str_char_6.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 6
  store i8 111, ptr %str_char_6.8, align 1
  %str_char_7.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 7
  store i8 99, ptr %str_char_7.8, align 1
  %str_char_8.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 8
  store i8 32, ptr %str_char_8.8, align 1
  %str_char_9.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 9
  store i8 45, ptr %str_char_9.8, align 1
  %str_char_10.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 10
  store i8 62, ptr %str_char_10.8, align 1
  %str_char_11.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 11
  store i8 54, ptr %str_char_11.8, align 1
  %str_char_12.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 12
  store i8 52, ptr %str_char_12.8, align 1
  %str_char_13.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 13
  store i8 32, ptr %str_char_13.8, align 1
  %str_char_14.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 14
  store i8 110, ptr %str_char_14.8, align 1
  %str_char_15.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 15
  store i8 111, ptr %str_char_15.8, align 1
  %str_char_16.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 16
  store i8 110, ptr %str_char_16.8, align 1
  %str_char_17.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 17
  store i8 45, ptr %str_char_17.8, align 1
  %str_char_18.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 18
  store i8 110, ptr %str_char_18.8, align 1
  %str_char_19.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 19
  store i8 117, ptr %str_char_19.8, align 1
  %str_char_20.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 20
  store i8 108, ptr %str_char_20.8, align 1
  %str_char_21.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 21
  store i8 108, ptr %str_char_21.8, align 1
  %str_char_22.8 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 22
  store i8 0, ptr %str_char_22.8, align 1
  %arg1_decay.7 = getelementptr [23 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.280, ptr %arg1_decay.7)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.277)
  ret void
}

define void @test_coalesce__0__ret_voidE1() {
entry:
  %ptrs = alloca [64 x i64], align 8
  %.fca.0.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %.fca.2.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep, align 8
  %.fca.3.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep, align 8
  %.fca.4.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 4
  store i64 0, ptr %.fca.4.gep, align 8
  %.fca.5.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 5
  store i64 0, ptr %.fca.5.gep, align 8
  %.fca.6.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 6
  store i64 0, ptr %.fca.6.gep, align 8
  %.fca.7.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 7
  store i64 0, ptr %.fca.7.gep, align 8
  %.fca.8.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 8
  store i64 0, ptr %.fca.8.gep, align 8
  %.fca.9.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 9
  store i64 0, ptr %.fca.9.gep, align 8
  %.fca.10.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 10
  store i64 0, ptr %.fca.10.gep, align 8
  %.fca.11.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 11
  store i64 0, ptr %.fca.11.gep, align 8
  %.fca.12.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 12
  store i64 0, ptr %.fca.12.gep, align 8
  %.fca.13.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 13
  store i64 0, ptr %.fca.13.gep, align 8
  %.fca.14.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 14
  store i64 0, ptr %.fca.14.gep, align 8
  %.fca.15.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 15
  store i64 0, ptr %.fca.15.gep, align 8
  %.fca.16.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 16
  store i64 0, ptr %.fca.16.gep, align 8
  %.fca.17.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 17
  store i64 0, ptr %.fca.17.gep, align 8
  %.fca.18.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 18
  store i64 0, ptr %.fca.18.gep, align 8
  %.fca.19.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 19
  store i64 0, ptr %.fca.19.gep, align 8
  %.fca.20.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 20
  store i64 0, ptr %.fca.20.gep, align 8
  %.fca.21.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 21
  store i64 0, ptr %.fca.21.gep, align 8
  %.fca.22.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 22
  store i64 0, ptr %.fca.22.gep, align 8
  %.fca.23.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 23
  store i64 0, ptr %.fca.23.gep, align 8
  %.fca.24.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 24
  store i64 0, ptr %.fca.24.gep, align 8
  %.fca.25.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 25
  store i64 0, ptr %.fca.25.gep, align 8
  %.fca.26.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 26
  store i64 0, ptr %.fca.26.gep, align 8
  %.fca.27.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 27
  store i64 0, ptr %.fca.27.gep, align 8
  %.fca.28.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 28
  store i64 0, ptr %.fca.28.gep, align 8
  %.fca.29.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 29
  store i64 0, ptr %.fca.29.gep, align 8
  %.fca.30.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 30
  store i64 0, ptr %.fca.30.gep, align 8
  %.fca.31.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 31
  store i64 0, ptr %.fca.31.gep, align 8
  %.fca.32.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 32
  store i64 0, ptr %.fca.32.gep, align 8
  %.fca.33.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 33
  store i64 0, ptr %.fca.33.gep, align 8
  %.fca.34.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 34
  store i64 0, ptr %.fca.34.gep, align 8
  %.fca.35.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 35
  store i64 0, ptr %.fca.35.gep, align 8
  %.fca.36.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 36
  store i64 0, ptr %.fca.36.gep, align 8
  %.fca.37.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 37
  store i64 0, ptr %.fca.37.gep, align 8
  %.fca.38.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 38
  store i64 0, ptr %.fca.38.gep, align 8
  %.fca.39.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 39
  store i64 0, ptr %.fca.39.gep, align 8
  %.fca.40.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 40
  store i64 0, ptr %.fca.40.gep, align 8
  %.fca.41.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 41
  store i64 0, ptr %.fca.41.gep, align 8
  %.fca.42.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 42
  store i64 0, ptr %.fca.42.gep, align 8
  %.fca.43.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 43
  store i64 0, ptr %.fca.43.gep, align 8
  %.fca.44.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 44
  store i64 0, ptr %.fca.44.gep, align 8
  %.fca.45.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 45
  store i64 0, ptr %.fca.45.gep, align 8
  %.fca.46.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 46
  store i64 0, ptr %.fca.46.gep, align 8
  %.fca.47.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 47
  store i64 0, ptr %.fca.47.gep, align 8
  %.fca.48.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 48
  store i64 0, ptr %.fca.48.gep, align 8
  %.fca.49.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 49
  store i64 0, ptr %.fca.49.gep, align 8
  %.fca.50.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 50
  store i64 0, ptr %.fca.50.gep, align 8
  %.fca.51.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 51
  store i64 0, ptr %.fca.51.gep, align 8
  %.fca.52.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 52
  store i64 0, ptr %.fca.52.gep, align 8
  %.fca.53.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 53
  store i64 0, ptr %.fca.53.gep, align 8
  %.fca.54.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 54
  store i64 0, ptr %.fca.54.gep, align 8
  %.fca.55.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 55
  store i64 0, ptr %.fca.55.gep, align 8
  %.fca.56.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 56
  store i64 0, ptr %.fca.56.gep, align 8
  %.fca.57.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 57
  store i64 0, ptr %.fca.57.gep, align 8
  %.fca.58.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 58
  store i64 0, ptr %.fca.58.gep, align 8
  %.fca.59.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 59
  store i64 0, ptr %.fca.59.gep, align 8
  %.fca.60.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 60
  store i64 0, ptr %.fca.60.gep, align 8
  %.fca.61.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 61
  store i64 0, ptr %.fca.61.gep, align 8
  %.fca.62.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 62
  store i64 0, ptr %.fca.62.gep, align 8
  %.fca.63.gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 63
  store i64 0, ptr %.fca.63.gep, align 8
  %str_stack = alloca [21 x i8], align 1
  %str_char_0 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 3
  store i8 99, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 4
  store i8 111, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 5
  store i8 97, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 6
  store i8 108, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 7
  store i8 101, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 8
  store i8 115, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 9
  store i8 99, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 10
  store i8 101, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 11
  store i8 95, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 12
  store i8 104, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 13
  store i8 101, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 14
  store i8 97, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 15
  store i8 112, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 16
  store i8 32, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 17
  store i8 45, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 18
  store i8 45, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 19
  store i8 10, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 20
  store i8 0, ptr %str_char_20, align 1
  %arg0_decay = getelementptr [21 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.28 = sext i32 64 to i64
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %.44, %ifcont ]
  %.32 = icmp ult i64 %i.0, %.28
  br i1 %.32, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.34 = sext i32 32 to i64
  %.35 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.34)
  %.36 = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.35, ptr %.36, align 8
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  %.38 = zext i32 0 to i64
  %.39 = icmp eq i64 %array_load, %.38
  br i1 %.39, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %str_stack.1 = alloca [38 x i8], align 1
  %str_char_0.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 54, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 52, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 32, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 98, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 111, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 99, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 107, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 115, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 32, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 97, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 108, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 108, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 99, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 97, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 116, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 101, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 100, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 32, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 102, ptr %str_char_20.1, align 1
  %str_char_21 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 111, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 114, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 32, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 99, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 111, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 97, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 108, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 101, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 115, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 99, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 101, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 32, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 116, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 101, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 115, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 116, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 0, ptr %str_char_37, align 1
  %arg1_decay = getelementptr [38 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.86 = sext i32 0 to i64
  br label %while.cond.1

ifcont:                                           ; preds = %while.body
  %.44 = add i64 %i.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %i.11 = phi i64 [ %.86, %while.end ], [ %.92, %while.body.1 ]
  %.89 = icmp ult i64 %i.11, %.28
  br i1 %.89, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.1 = trunc i64 %i.11 to i32
  %array_gep.1 = getelementptr inbounds [64 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.1)
  %.92 = add i64 %i.11, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  call void @standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1()
  %str_stack.2 = alloca [38 x i8], align 1
  %str_char_0.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 99, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 111, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 97, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 108, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 101, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 115, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 99, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 101, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 95, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 104, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 101, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 97, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 112, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 99, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 111, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 109, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 112, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 108, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 101, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 116, ptr %str_char_20.2, align 1
  %str_char_21.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 101, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 100, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 32, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 119, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 105, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 116, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 104, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 111, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 117, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 116, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 32, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 99, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 114, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 97, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 115, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 104, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 0, ptr %str_char_37.1, align 1
  %arg1_decay.1 = getelementptr [38 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 true, ptr %arg1_decay.1)
  %.134 = sext i32 32 to i64
  %.135 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.134)
  %not_zero = icmp ne i64 %.135, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.3 = alloca [30 x i8], align 1
  %str_char_0.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 97, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 108, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 108, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 111, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 99, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 32, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 97, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 102, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 116, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 101, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 114, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 32, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 99, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 111, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 97, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 108, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 101, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 115, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 99, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 101, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 32, ptr %str_char_20.3, align 1
  %str_char_21.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 115, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 117, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 99, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 99, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 101, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 101, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 100, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 115, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 0, ptr %str_char_29.2, align 1
  %.167 = trunc i8 %not_null_result to i1
  %arg1_decay.2 = getelementptr [30 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.167, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.135)
  ret void
}

define void @test_coalesce_bin_integrity__0__ret_voidE1() {
entry:
  %ptrs = alloca [32 x i64], align 8
  %.fca.0.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %.fca.2.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep, align 8
  %.fca.3.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep, align 8
  %.fca.4.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 4
  store i64 0, ptr %.fca.4.gep, align 8
  %.fca.5.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 5
  store i64 0, ptr %.fca.5.gep, align 8
  %.fca.6.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 6
  store i64 0, ptr %.fca.6.gep, align 8
  %.fca.7.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 7
  store i64 0, ptr %.fca.7.gep, align 8
  %.fca.8.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 8
  store i64 0, ptr %.fca.8.gep, align 8
  %.fca.9.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 9
  store i64 0, ptr %.fca.9.gep, align 8
  %.fca.10.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 10
  store i64 0, ptr %.fca.10.gep, align 8
  %.fca.11.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 11
  store i64 0, ptr %.fca.11.gep, align 8
  %.fca.12.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 12
  store i64 0, ptr %.fca.12.gep, align 8
  %.fca.13.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 13
  store i64 0, ptr %.fca.13.gep, align 8
  %.fca.14.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 14
  store i64 0, ptr %.fca.14.gep, align 8
  %.fca.15.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 15
  store i64 0, ptr %.fca.15.gep, align 8
  %.fca.16.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 16
  store i64 0, ptr %.fca.16.gep, align 8
  %.fca.17.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 17
  store i64 0, ptr %.fca.17.gep, align 8
  %.fca.18.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 18
  store i64 0, ptr %.fca.18.gep, align 8
  %.fca.19.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 19
  store i64 0, ptr %.fca.19.gep, align 8
  %.fca.20.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 20
  store i64 0, ptr %.fca.20.gep, align 8
  %.fca.21.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 21
  store i64 0, ptr %.fca.21.gep, align 8
  %.fca.22.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 22
  store i64 0, ptr %.fca.22.gep, align 8
  %.fca.23.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 23
  store i64 0, ptr %.fca.23.gep, align 8
  %.fca.24.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 24
  store i64 0, ptr %.fca.24.gep, align 8
  %.fca.25.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 25
  store i64 0, ptr %.fca.25.gep, align 8
  %.fca.26.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 26
  store i64 0, ptr %.fca.26.gep, align 8
  %.fca.27.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 27
  store i64 0, ptr %.fca.27.gep, align 8
  %.fca.28.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 28
  store i64 0, ptr %.fca.28.gep, align 8
  %.fca.29.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 29
  store i64 0, ptr %.fca.29.gep, align 8
  %.fca.30.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 30
  store i64 0, ptr %.fca.30.gep, align 8
  %.fca.31.gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 31
  store i64 0, ptr %.fca.31.gep, align 8
  %str_stack = alloca [30 x i8], align 1
  %str_char_0 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 3
  store i8 99, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 4
  store i8 111, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 5
  store i8 97, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 6
  store i8 108, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 7
  store i8 101, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 8
  store i8 115, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 9
  store i8 99, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 10
  store i8 101, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 12
  store i8 98, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 13
  store i8 105, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 14
  store i8 110, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 15
  store i8 32, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 16
  store i8 105, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 17
  store i8 110, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 18
  store i8 116, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 19
  store i8 101, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 20
  store i8 103, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 21
  store i8 114, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 22
  store i8 105, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 23
  store i8 116, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 24
  store i8 121, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 25
  store i8 32, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 26
  store i8 45, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 27
  store i8 45, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 28
  store i8 10, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 29
  store i8 0, ptr %str_char_29, align 1
  %arg0_decay = getelementptr [30 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.39 = sext i32 32 to i64
  %.41 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %i.0 = phi i64 [ %.41, %entry ], [ %.57, %ifcont ]
  %.45 = icmp ult i64 %i.0, %.39
  br i1 %.45, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.47 = sext i32 64 to i64
  %.48 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.47)
  %.49 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.48, ptr %.49, align 8
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  %.51 = zext i32 0 to i64
  %.52 = icmp eq i64 %array_load, %.51
  br i1 %.52, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %str_stack.1 = alloca [28 x i8], align 1
  %str_char_0.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 51, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 50, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 32, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 99, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 97, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 115, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 115, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 45, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 50, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 98, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 108, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 99, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 107, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 115, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 32, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 97, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 108, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 108, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 111, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 99, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 97, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 116, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 101, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 100, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 0, ptr %str_char_27.1, align 1
  %arg1_decay = getelementptr [28 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.89 = sext i32 0 to i64
  br label %while.cond.1

ifcont:                                           ; preds = %while.body
  %.57 = add i64 %i.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %i.110 = phi i64 [ %.89, %while.end ], [ %.95, %while.body.1 ]
  %.92 = icmp ult i64 %i.110, %.39
  br i1 %.92, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %idx_trunc.1 = trunc i64 %i.110 to i32
  %array_gep.1 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.1)
  %.95 = add i64 %i.110, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  call void @standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1()
  %.99 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.end.3, %while.end.1
  %i.211 = phi i64 [ %.99, %while.end.1 ], [ %.129, %while.end.3 ]
  %.102 = icmp ult i64 %i.211, %.39
  br i1 %.102, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.104 = sext i32 64 to i64
  %.105 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.104)
  %.106 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i64 %i.211
  store i64 %.105, ptr %.106, align 8
  %idx_trunc.2 = trunc i64 %i.211 to i32
  %array_gep.2 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.2
  %array_load.2 = load i64, ptr %array_gep.2, align 8
  %.108 = zext i32 0 to i64
  %.109 = icmp eq i64 %array_load.2, %.108
  br i1 %.109, label %while.end.2, label %ifcont.1

while.end.2:                                      ; preds = %while.body.2, %while.cond.2
  %ok.114 = phi i1 [ true, %while.cond.2 ], [ false, %while.body.2 ]
  %str_stack.2 = alloca [34 x i8], align 1
  %str_char_0.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 112, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 111, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 115, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 116, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 45, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 99, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 111, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 97, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 108, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 101, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 115, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 99, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 101, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 97, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 108, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 108, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 111, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 99, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 115, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 32, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 97, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 108, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 108, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 32, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 110, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 111, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 110, ptr %str_char_27.2, align 1
  %str_char_28.1 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 45, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 110, ptr %str_char_29.1, align 1
  %str_char_30 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 117, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 108, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 108, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 0, ptr %str_char_33, align 1
  %arg1_decay.1 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.114, ptr %arg1_decay.1)
  %.168 = sext i32 0 to i64
  br label %while.cond.4

ifcont.1:                                         ; preds = %while.body.2
  %idx_trunc.3 = trunc i64 %i.211 to i32
  %array_gep.3 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.3
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  %int_to_ptr = inttoptr i64 %array_load.3 to ptr
  %.115 = sext i32 0 to i64
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %ifcont.1
  %j.0 = phi i64 [ %.115, %ifcont.1 ], [ %.126, %while.body.3 ]
  %.118 = zext i32 64 to i64
  %.119 = icmp ult i64 %j.0, %.118
  br i1 %.119, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %.121 = zext i32 255 to i64
  %.122 = and i64 %i.211, %.121
  %.123 = trunc i64 %.122 to i8
  %.124 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %j.0
  store i8 %.123, ptr %.124, align 1
  %.126 = add i64 %j.0, 1
  br label %while.cond.3

while.end.3:                                      ; preds = %while.cond.3
  %.129 = add i64 %i.211, 1
  br label %while.cond.2

while.cond.4:                                     ; preds = %ifcont.2, %while.end.2
  %i.312 = phi i64 [ %.168, %while.end.2 ], [ %.182, %ifcont.2 ]
  %.171 = icmp ult i64 %i.312, %.39
  br i1 %.171, label %while.body.4, label %while.end.4

while.body.4:                                     ; preds = %while.cond.4
  %idx_trunc.4 = trunc i64 %i.312 to i32
  %array_gep.4 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.4
  %array_load.4 = load i64, ptr %array_gep.4, align 8
  %int_to_ptr.1 = inttoptr i64 %array_load.4 to ptr
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.174 = zext i32 255 to i64
  %.175 = and i64 %i.312, %.174
  %.176 = trunc i64 %.175 to i8
  %.177 = icmp ne i8 %ptr_load, %.176
  br i1 %.177, label %while.end.4, label %ifcont.2

while.end.4:                                      ; preds = %while.body.4, %while.cond.4
  %ok.215 = phi i1 [ true, %while.cond.4 ], [ false, %while.body.4 ]
  %str_stack.3 = alloca [33 x i8], align 1
  %str_char_0.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 112, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 111, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 115, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 116, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 45, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 99, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 111, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 97, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 108, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 101, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 115, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 99, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 101, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 32, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 119, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 114, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 105, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 116, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 101, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 47, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 114, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 101, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 97, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 100, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 32, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 99, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 111, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 114, ptr %str_char_27.3, align 1
  %str_char_28.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 114, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 101, ptr %str_char_29.2, align 1
  %str_char_30.1 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 99, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 116, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 0, ptr %str_char_32.1, align 1
  %arg1_decay.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.215, ptr %arg1_decay.2)
  %.219 = sext i32 0 to i64
  br label %while.cond.5

ifcont.2:                                         ; preds = %while.body.4
  %.182 = add i64 %i.312, 1
  br label %while.cond.4

while.cond.5:                                     ; preds = %while.body.5, %while.end.4
  %i.413 = phi i64 [ %.219, %while.end.4 ], [ %.225, %while.body.5 ]
  %.222 = icmp ult i64 %i.413, %.39
  br i1 %.222, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %idx_trunc.5 = trunc i64 %i.413 to i32
  %array_gep.5 = getelementptr inbounds [32 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.5
  %array_load.5 = load i64, ptr %array_gep.5, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.5)
  %.225 = add i64 %i.413, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  ret void
}

define void @test_fragmentation__0__ret_voidE1() {
entry:
  %str_stack = alloca [27 x i8], align 1
  %str_char_0 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 3
  store i8 99, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 4
  store i8 104, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 6
  store i8 99, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 7
  store i8 107, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 8
  store i8 95, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 9
  store i8 102, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 10
  store i8 114, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 11
  store i8 97, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 12
  store i8 103, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 13
  store i8 109, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 14
  store i8 101, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 15
  store i8 110, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 16
  store i8 116, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 17
  store i8 97, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 18
  store i8 116, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 19
  store i8 105, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 20
  store i8 111, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 21
  store i8 110, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 22
  store i8 32, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 23
  store i8 45, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 24
  store i8 45, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 25
  store i8 10, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 26
  store i8 0, ptr %str_char_26, align 1
  %arg0_decay = getelementptr [27 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %op_overload_result = call float @standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1()
  %.38 = fcmp oge float %op_overload_result, 0.000000e+00
  %.40 = fcmp ole float %op_overload_result, 1.000000e+00
  %sc_result = select i1 %.38, i1 %.40, i1 false
  %str_stack.1 = alloca [40 x i8], align 1
  %str_char_0.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 102, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 114, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 97, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 103, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 109, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 101, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 110, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 116, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 97, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 116, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 105, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 111, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 110, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 32, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 105, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 110, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 32, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 91, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 48, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 44, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 49, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 93, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 32, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 98, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 101, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 102, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 111, ptr %str_char_26.1, align 1
  %str_char_27 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 114, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 101, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 32, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 97, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 110, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 121, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 32, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 97, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 108, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 108, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 111, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 99, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 0, ptr %str_char_39, align 1
  %arg1_decay = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %sc_result, ptr %arg1_decay)
  %.83 = sext i32 64 to i64
  %.84 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.83)
  %.86 = sext i32 128 to i64
  %.87 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.86)
  %.89 = sext i32 256 to i64
  %.90 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.89)
  %.92 = sext i32 512 to i64
  %.93 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.92)
  %op_overload_result.1 = call float @standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1()
  %.96 = fcmp oge float %op_overload_result.1, 0.000000e+00
  %.98 = fcmp ole float %op_overload_result.1, 1.000000e+00
  %sc_result.1 = select i1 %.96, i1 %.98, i1 false
  %str_stack.2 = alloca [40 x i8], align 1
  %str_char_0.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 102, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 114, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 97, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 103, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 109, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 110, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 116, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 97, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 116, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 105, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 111, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 110, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 105, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 110, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 91, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 48, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 44, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 49, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 93, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 32, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 119, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 105, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 116, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 104, ptr %str_char_26.2, align 1
  %str_char_27.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 32, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 108, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 105, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 118, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 101, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 32, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 98, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 108, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 111, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 99, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 107, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 38
  store i8 115, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 39
  store i8 0, ptr %str_char_39.1, align 1
  %arg1_decay.1 = getelementptr [40 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %sc_result.1, ptr %arg1_decay.1)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.84)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.87)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.90)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.93)
  %op_overload_result.2 = call float @standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1()
  %.146 = fcmp oge float %op_overload_result.2, 0.000000e+00
  %.148 = fcmp ole float %op_overload_result.2, 1.000000e+00
  %sc_result.2 = select i1 %.146, i1 %.148, i1 false
  %str_stack.3 = alloca [41 x i8], align 1
  %str_char_0.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 102, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 114, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 97, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 103, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 109, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 101, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 110, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 116, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 97, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 116, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 105, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 111, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 110, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 32, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 105, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 110, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 32, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 91, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 48, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 44, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 49, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 93, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 32, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 97, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 102, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 116, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 101, ptr %str_char_26.3, align 1
  %str_char_27.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 114, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 32, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 102, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 114, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 101, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 101, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 33
  store i8 105, ptr %str_char_33.2, align 1
  %str_char_34.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 34
  store i8 110, ptr %str_char_34.2, align 1
  %str_char_35.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 35
  store i8 103, ptr %str_char_35.2, align 1
  %str_char_36.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 36
  store i8 32, ptr %str_char_36.2, align 1
  %str_char_37.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 37
  store i8 97, ptr %str_char_37.2, align 1
  %str_char_38.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 38
  store i8 108, ptr %str_char_38.2, align 1
  %str_char_39.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 39
  store i8 108, ptr %str_char_39.2, align 1
  %str_char_40 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 40
  store i8 0, ptr %str_char_40, align 1
  %arg1_decay.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %sc_result.2, ptr %arg1_decay.2)
  %.192 = fcmp oge float %op_overload_result.2, %op_overload_result.1
  %str_stack.4 = alloca [46 x i8], align 1
  %str_char_0.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 102, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 114, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 97, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 103, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 109, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 101, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 110, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 116, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 97, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 116, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 105, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 111, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 110, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 32, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 114, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 105, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 115, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 101, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 115, ptr %str_char_18.4, align 1
  %str_char_19.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 19
  store i8 32, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 20
  store i8 97, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 21
  store i8 102, ptr %str_char_21.4, align 1
  %str_char_22.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 22
  store i8 116, ptr %str_char_22.4, align 1
  %str_char_23.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 23
  store i8 101, ptr %str_char_23.4, align 1
  %str_char_24.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 24
  store i8 114, ptr %str_char_24.4, align 1
  %str_char_25.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 25
  store i8 32, ptr %str_char_25.4, align 1
  %str_char_26.4 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 26
  store i8 102, ptr %str_char_26.4, align 1
  %str_char_27.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 27
  store i8 114, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 28
  store i8 101, ptr %str_char_28.3, align 1
  %str_char_29.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 29
  store i8 101, ptr %str_char_29.3, align 1
  %str_char_30.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 30
  store i8 105, ptr %str_char_30.3, align 1
  %str_char_31.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 31
  store i8 110, ptr %str_char_31.3, align 1
  %str_char_32.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 32
  store i8 103, ptr %str_char_32.3, align 1
  %str_char_33.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 33
  store i8 32, ptr %str_char_33.3, align 1
  %str_char_34.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 34
  store i8 108, ptr %str_char_34.3, align 1
  %str_char_35.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 35
  store i8 105, ptr %str_char_35.3, align 1
  %str_char_36.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 36
  store i8 118, ptr %str_char_36.3, align 1
  %str_char_37.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 37
  store i8 101, ptr %str_char_37.3, align 1
  %str_char_38.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 38
  store i8 32, ptr %str_char_38.3, align 1
  %str_char_39.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 39
  store i8 98, ptr %str_char_39.3, align 1
  %str_char_40.1 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 40
  store i8 108, ptr %str_char_40.1, align 1
  %str_char_41 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 41
  store i8 111, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 42
  store i8 99, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 43
  store i8 107, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 44
  store i8 115, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 45
  store i8 0, ptr %str_char_45, align 1
  %arg1_decay.3 = getelementptr [46 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.192, ptr %arg1_decay.3)
  call void @standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1()
  ret void
}

define void @test_mixed_pattern__0__ret_voidE1() {
entry:
  %rng = alloca %PCG32, align 8
  %.fca.0.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %live = alloca [256 x i64], align 8
  %memset_ptr = bitcast ptr %live to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 2048, i1 false)
  %live_sz = alloca [256 x i64], align 8
  %memset_ptr.1 = bitcast ptr %live_sz to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr.1, i8 0, i64 2048, i1 false)
  %str_stack = alloca [51 x i8], align 1
  %str_char_0 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 3
  store i8 109, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 4
  store i8 105, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 5
  store i8 120, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 6
  store i8 101, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 7
  store i8 100, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 8
  store i8 32, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 9
  store i8 97, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 10
  store i8 108, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 11
  store i8 108, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 12
  store i8 111, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 13
  store i8 99, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 14
  store i8 47, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 15
  store i8 102, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 16
  store i8 114, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 17
  store i8 101, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 18
  store i8 101, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 20
  store i8 40, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 21
  store i8 53, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 22
  store i8 48, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 23
  store i8 48, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 24
  store i8 48, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 25
  store i8 32, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 26
  store i8 111, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 27
  store i8 112, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 28
  store i8 115, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 29
  store i8 44, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 30
  store i8 32, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 31
  store i8 117, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 32
  store i8 112, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 33
  store i8 32, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 34
  store i8 116, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 35
  store i8 111, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 36
  store i8 32, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 37
  store i8 50, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 38
  store i8 53, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 39
  store i8 54, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 40
  store i8 32, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 41
  store i8 108, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 42
  store i8 105, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 43
  store i8 118, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 44
  store i8 101, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 45
  store i8 41, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 46
  store i8 32, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 47
  store i8 45, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 48
  store i8 45, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 49
  store i8 10, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 50
  store i8 0, ptr %str_char_50, align 1
  %arg0_decay = getelementptr [51 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %.70 = sext i32 5000 to i64
  %.72 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %ifcont.2, %entry
  %live_count.0 = phi i64 [ %.72, %entry ], [ %live_count.23, %ifcont.2 ]
  %i.0 = phi i64 [ 0, %entry ], [ %.151, %ifcont.2 ]
  %.76 = icmp ult i64 %i.0, %.70
  br i1 %.76, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.78 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.80 = zext i32 %.78 to i64
  %.82 = zext i32 256 to i64
  %.83 = icmp eq i64 %live_count.0, %.82
  br i1 %.83, label %ifcont, label %else

while.end:                                        ; preds = %switch_merge, %switch_case_0, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %switch_case_0 ], [ true, %switch_merge ]
  %live_count.12 = phi i64 [ %live_count.0, %while.cond ], [ %live_count.0, %switch_case_0 ], [ %live_count.23, %switch_merge ]
  %str_stack.1 = alloca [36 x i8], align 1
  %str_char_0.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 53, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 48, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 48, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 48, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 32, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 109, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 105, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 120, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 101, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 100, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 111, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 112, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 115, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 58, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 32, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 97, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 108, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 108, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 32, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 97, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 108, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 108, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 111, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 99, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 115, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 32, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 110, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 111, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 110, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 45, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 110, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 117, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 108, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 108, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 0, ptr %str_char_35.1, align 1
  %arg1_decay = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.191 = sext i32 0 to i64
  br label %while.cond.2

else:                                             ; preds = %while.body
  %.87 = zext i32 0 to i64
  %.88 = icmp eq i64 %live_count.0, %.87
  br i1 %.88, label %ifcont, label %elif_else_0

ifcont:                                           ; preds = %else, %while.body, %elif_else_0
  %do_alloc.0 = phi i1 [ %.95, %elif_else_0 ], [ false, %while.body ], [ true, %else ]
  %cond = icmp eq i1 %do_alloc.0, true
  br i1 %cond, label %switch_case_0, label %switch_default

elif_else_0:                                      ; preds = %else
  %.92 = zext i32 255 to i64
  %.93 = and i64 %.80, %.92
  %.94 = zext i32 153 to i64
  %.95 = icmp ult i64 %.93, %.94
  br label %ifcont

switch_merge:                                     ; preds = %while.end.1, %switch_default
  %live_count.23 = phi i64 [ %.140, %switch_default ], [ %.134, %while.end.1 ]
  %.147 = xor i1 true, true
  br i1 %.147, label %while.end, label %ifcont.2

switch_case_0:                                    ; preds = %ifcont
  %.99 = zext i32 4096 to i64
  %.100 = urem i64 %.80, %.99
  %.101 = zext i32 1 to i64
  %.102 = add i64 %.100, %.101
  %.104 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.102)
  %.106 = zext i32 0 to i64
  %.107 = icmp eq i64 %.104, %.106
  br i1 %.107, label %while.end, label %ifcont.1

switch_default:                                   ; preds = %ifcont
  %.137 = urem i64 %.80, %live_count.0
  %idx_trunc = trunc i64 %.137 to i32
  %array_gep = getelementptr inbounds [256 x i64], ptr %live, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load)
  %.140 = sub i64 %live_count.0, 1
  %idx_trunc.1 = trunc i64 %.140 to i32
  %array_gep.1 = getelementptr inbounds [256 x i64], ptr %live, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  %.142 = getelementptr inbounds [256 x i64], ptr %live, i32 0, i64 %.137
  store i64 %array_load.1, ptr %.142, align 8
  %idx_trunc.2 = trunc i64 %.140 to i32
  %array_gep.2 = getelementptr inbounds [256 x i64], ptr %live_sz, i32 0, i32 %idx_trunc.2
  %array_load.2 = load i64, ptr %array_gep.2, align 8
  %.144 = getelementptr inbounds [256 x i64], ptr %live_sz, i32 0, i64 %.137
  store i64 %array_load.2, ptr %.144, align 8
  br label %switch_merge

ifcont.1:                                         ; preds = %switch_case_0
  %int_to_ptr = inttoptr i64 %.104 to ptr
  %.113 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont.1
  %j.14 = phi i64 [ %.113, %ifcont.1 ], [ %.127, %while.body.1 ]
  %.116 = zext i32 8 to i64
  %.117 = icmp ult i64 %j.14, %.116
  %.119 = icmp ult i64 %j.14, %.102
  %spec.select = select i1 %.117, i1 %.119, i1 false
  br i1 %spec.select, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.122 = zext i32 255 to i64
  %.123 = and i64 %live_count.0, %.122
  %.124 = trunc i64 %.123 to i8
  %.125 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %j.14
  store i8 %.124, ptr %.125, align 1
  %.127 = add i64 %j.14, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.130 = getelementptr inbounds [256 x i64], ptr %live, i32 0, i64 %live_count.0
  store i64 %.104, ptr %.130, align 8
  %.132 = getelementptr inbounds [256 x i64], ptr %live_sz, i32 0, i64 %live_count.0
  store i64 %.102, ptr %.132, align 8
  %.134 = add i64 %live_count.0, 1
  br label %switch_merge

ifcont.2:                                         ; preds = %switch_merge
  %.151 = add i64 %i.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %while.body.2, %while.end
  %j.0 = phi i64 [ %.191, %while.end ], [ %.197, %while.body.2 ]
  %.194 = icmp ult i64 %j.0, %live_count.12
  br i1 %.194, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.3 = trunc i64 %j.0 to i32
  %array_gep.3 = getelementptr inbounds [256 x i64], ptr %live, i32 0, i32 %idx_trunc.3
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.3)
  %.197 = add i64 %j.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  ret void
}

define void @test_table_stress__0__ret_voidE1() {
entry:
  %.6 = sext i32 2048 to i64
  %str_stack = alloca [44 x i8], align 1
  %str_char_0 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 3
  store i8 116, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 4
  store i8 97, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 5
  store i8 98, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 6
  store i8 108, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 7
  store i8 101, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 8
  store i8 32, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 9
  store i8 115, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 10
  store i8 116, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 11
  store i8 114, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 12
  store i8 101, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 13
  store i8 115, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 14
  store i8 115, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 15
  store i8 58, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 16
  store i8 32, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 17
  store i8 50, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 18
  store i8 48, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 19
  store i8 52, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 20
  store i8 56, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 21
  store i8 32, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 22
  store i8 108, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 23
  store i8 105, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 24
  store i8 118, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 25
  store i8 101, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 26
  store i8 32, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 27
  store i8 108, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 28
  store i8 97, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 29
  store i8 114, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 30
  store i8 103, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 31
  store i8 101, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 32
  store i8 32, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 33
  store i8 98, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 34
  store i8 108, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 35
  store i8 111, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 36
  store i8 99, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 37
  store i8 107, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 38
  store i8 115, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 39
  store i8 32, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 40
  store i8 45, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 41
  store i8 45, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 42
  store i8 10, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 43
  store i8 0, ptr %str_char_43, align 1
  %arg0_decay = getelementptr [44 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %ptrs = alloca [256 x i64], align 8
  %memset_ptr = bitcast ptr %ptrs to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 2048, i1 false)
  %.58 = sext i32 256 to i64
  %.60 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.end.2, %entry
  %total_freed.0 = phi i64 [ %.60, %entry ], [ %.95, %while.end.2 ]
  %ok.0 = phi i1 [ true, %entry ], [ %ok.23, %while.end.2 ]
  %.63 = icmp ult i64 %total_freed.0, %.6
  br i1 %.63, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.65 = sext i32 0 to i64
  br label %while.cond.1

while.end:                                        ; preds = %while.end.1, %while.cond
  %ok.12 = phi i1 [ %ok.0, %while.cond ], [ %ok.23, %while.end.1 ]
  %str_stack.1 = alloca [57 x i8], align 1
  %str_char_0.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 50, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 48, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 52, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 56, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 32, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 108, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 97, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 114, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 103, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 101, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 32, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 98, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 108, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 111, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 99, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 107, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 115, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 32, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 40, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 56, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 32, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 98, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 97, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 116, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 99, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 104, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 101, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 115, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 32, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 111, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 102, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 32, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 50, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 53, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 54, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 41, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 32, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 97, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 108, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 108, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 40
  store i8 111, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 41
  store i8 99, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 42
  store i8 97, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 43
  store i8 116, ptr %str_char_43.1, align 1
  %str_char_44 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 44
  store i8 101, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 45
  store i8 100, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 46
  store i8 32, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 47
  store i8 97, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 48
  store i8 110, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 49
  store i8 100, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 50
  store i8 32, ptr %str_char_50, align 1
  %str_char_51 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 51
  store i8 102, ptr %str_char_51, align 1
  %str_char_52 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 52
  store i8 114, ptr %str_char_52, align 1
  %str_char_53 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 53
  store i8 101, ptr %str_char_53, align 1
  %str_char_54 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 54
  store i8 101, ptr %str_char_54, align 1
  %str_char_55 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 55
  store i8 100, ptr %str_char_55, align 1
  %str_char_56 = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 56
  store i8 0, ptr %str_char_56, align 1
  %arg1_decay = getelementptr [57 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.12, ptr %arg1_decay)
  %.156 = sext i32 64 to i64
  %.157 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.156)
  %not_zero = icmp ne i64 %.157, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.2 = alloca [34 x i8], align 1
  %str_char_0.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 97, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 108, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 108, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 111, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 99, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 32, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 115, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 117, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 99, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 99, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 101, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 101, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 100, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 115, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 32, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 97, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 102, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 116, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 101, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 114, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 32, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 116, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 97, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 98, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 108, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 101, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 115, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 116, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 114, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 101, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 115, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 115, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 0, ptr %str_char_33.2, align 1
  %.193 = trunc i8 %not_null_result to i1
  %arg1_decay.1 = getelementptr [34 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.193, ptr %arg1_decay.1)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.157)
  ret void

while.cond.1:                                     ; preds = %ifcont, %while.body
  %i.0 = phi i64 [ %.65, %while.body ], [ %.79, %ifcont ]
  %.68 = icmp ult i64 %i.0, %.58
  br i1 %.68, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.70 = sext i32 8192 to i64
  %.71 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.70)
  %int_to_ptr = inttoptr i64 %.71 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  br i1 %is_null, label %while.end.1, label %ifcont

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %ok.23 = phi i1 [ %ok.0, %while.cond.1 ], [ false, %while.body.1 ]
  %.82 = xor i1 %ok.23, true
  br i1 %.82, label %while.end, label %ifcont.1

ifcont:                                           ; preds = %while.body.1
  %.77 = getelementptr inbounds [256 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.71, ptr %.77, align 8
  %.79 = add i64 %i.0, 1
  br label %while.cond.1

ifcont.1:                                         ; preds = %while.end.1
  %.86 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %ifcont.1
  %i.11 = phi i64 [ %.86, %ifcont.1 ], [ %.92, %while.body.2 ]
  %.89 = icmp ult i64 %i.11, %.58
  br i1 %.89, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc = trunc i64 %i.11 to i32
  %array_gep = getelementptr inbounds [256 x i64], ptr %ptrs, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load)
  %.92 = add i64 %i.11, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.95 = add i64 %total_freed.0, %.58
  br label %while.cond
}

define void @test_double_free_guard__0__ret_voidE1() {
entry:
  %str_stack = alloca [25 x i8], align 1
  %str_char_0 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 3
  store i8 100, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 4
  store i8 111, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 5
  store i8 117, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 6
  store i8 98, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 9
  store i8 45, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 10
  store i8 102, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 11
  store i8 114, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 12
  store i8 101, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 13
  store i8 101, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 14
  store i8 32, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 15
  store i8 103, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 16
  store i8 117, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 17
  store i8 97, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 18
  store i8 114, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 19
  store i8 100, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 20
  store i8 32, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 21
  store i8 45, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 22
  store i8 45, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 23
  store i8 10, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 24
  store i8 0, ptr %str_char_24, align 1
  %arg0_decay = getelementptr [25 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.29 = sext i32 64 to i64
  %.30 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.29)
  %not_zero = icmp ne i64 %.30, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.1 = alloca [27 x i8], align 1
  %str_char_0.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 97, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 108, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 108, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 111, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 99, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 32, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 102, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 111, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 114, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 32, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 100, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 111, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 117, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 98, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 108, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 101, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 45, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 102, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 114, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 101, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 101, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 32, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 116, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 101, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 116, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 0, ptr %str_char_26, align 1
  %.59 = trunc i8 %not_null_result to i1
  %arg1_decay = getelementptr [27 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.59, ptr %arg1_decay)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.30)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.30)
  %str_stack.2 = alloca [27 x i8], align 1
  %str_char_0.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 100, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 111, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 117, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 98, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 108, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 45, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 102, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 114, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 101, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 101, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 100, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 111, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 101, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 115, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 110, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 111, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 116, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 32, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 99, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 114, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 97, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 115, ptr %str_char_24.2, align 1
  %str_char_25.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 104, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 0, ptr %str_char_26.1, align 1
  %arg1_decay.1 = getelementptr [27 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 true, ptr %arg1_decay.1)
  %.91 = sext i32 64 to i64
  %.92 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.91)
  %not_zero.1 = icmp ne i64 %.92, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %str_stack.3 = alloca [38 x i8], align 1
  %str_char_0.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 97, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 108, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 108, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 111, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 99, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 32, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 97, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 102, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 116, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 101, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 114, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 32, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 100, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 111, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 117, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 98, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 108, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 101, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 45, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 102, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 114, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 101, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 101, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 32, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 105, ptr %str_char_24.3, align 1
  %str_char_25.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 115, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 102, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 117, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 110, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 99, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 116, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 105, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 33
  store i8 111, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 34
  store i8 110, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 35
  store i8 97, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 36
  store i8 108, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 37
  store i8 0, ptr %str_char_37, align 1
  %.132 = trunc i8 %not_null_result.1 to i1
  %arg1_decay.2 = getelementptr [38 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.132, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.92)
  ret void
}

define void @test_throughput_small__0__ret_voidE1() {
entry:
  %buf = alloca [64 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.fca.32.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep, align 1
  %.fca.33.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep, align 1
  %.fca.34.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep, align 1
  %.fca.35.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep, align 1
  %.fca.36.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep, align 1
  %.fca.37.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep, align 1
  %.fca.38.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep, align 1
  %.fca.39.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep, align 1
  %.fca.40.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep, align 1
  %.fca.41.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep, align 1
  %.fca.42.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep, align 1
  %.fca.43.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep, align 1
  %.fca.44.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep, align 1
  %.fca.45.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep, align 1
  %.fca.46.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep, align 1
  %.fca.47.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep, align 1
  %.fca.48.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 48
  store i8 0, ptr %.fca.48.gep, align 1
  %.fca.49.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 49
  store i8 0, ptr %.fca.49.gep, align 1
  %.fca.50.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 50
  store i8 0, ptr %.fca.50.gep, align 1
  %.fca.51.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 51
  store i8 0, ptr %.fca.51.gep, align 1
  %.fca.52.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 52
  store i8 0, ptr %.fca.52.gep, align 1
  %.fca.53.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 53
  store i8 0, ptr %.fca.53.gep, align 1
  %.fca.54.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 54
  store i8 0, ptr %.fca.54.gep, align 1
  %.fca.55.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 55
  store i8 0, ptr %.fca.55.gep, align 1
  %.fca.56.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 56
  store i8 0, ptr %.fca.56.gep, align 1
  %.fca.57.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 57
  store i8 0, ptr %.fca.57.gep, align 1
  %.fca.58.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 58
  store i8 0, ptr %.fca.58.gep, align 1
  %.fca.59.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 59
  store i8 0, ptr %.fca.59.gep, align 1
  %.fca.60.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 60
  store i8 0, ptr %.fca.60.gep, align 1
  %.fca.61.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 61
  store i8 0, ptr %.fca.61.gep, align 1
  %.fca.62.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 62
  store i8 0, ptr %.fca.62.gep, align 1
  %.fca.63.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 63
  store i8 0, ptr %.fca.63.gep, align 1
  %str_stack = alloca [49 x i8], align 1
  %str_char_0 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 3
  store i8 116, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 4
  store i8 104, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 5
  store i8 114, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 6
  store i8 111, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 7
  store i8 117, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 8
  store i8 103, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 9
  store i8 104, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 10
  store i8 112, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 11
  store i8 117, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 12
  store i8 116, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 13
  store i8 58, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 14
  store i8 32, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 15
  store i8 49, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 16
  store i8 77, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 17
  store i8 32, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 18
  store i8 120, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 20
  store i8 54, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 21
  store i8 52, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 22
  store i8 45, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 23
  store i8 98, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 24
  store i8 121, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 25
  store i8 116, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 26
  store i8 101, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 27
  store i8 32, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 28
  store i8 97, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 29
  store i8 108, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 30
  store i8 108, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 31
  store i8 111, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 32
  store i8 99, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 33
  store i8 43, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 34
  store i8 102, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 35
  store i8 114, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 36
  store i8 101, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 37
  store i8 101, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 38
  store i8 32, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 39
  store i8 112, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 40
  store i8 97, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 41
  store i8 105, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 42
  store i8 114, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 43
  store i8 115, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 44
  store i8 32, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 45
  store i8 45, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 46
  store i8 45, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 47
  store i8 10, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 48
  store i8 0, ptr %str_char_48, align 1
  %arg0_decay = getelementptr [49 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.66 = sext i32 1000000 to i64
  %.69 = sext i32 0 to i64
  %op_overload_result = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %k.0 = phi i64 [ %.69, %entry ], [ %.83, %ifcont ]
  %.73 = icmp ult i64 %k.0, %.66
  br i1 %.73, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.75 = sext i32 64 to i64
  %.76 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.75)
  %int_to_ptr = inttoptr i64 %.76 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  br i1 %is_null, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %op_overload_result.1 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %str_stack.1 = alloca [34 x i8], align 1
  %str_char_0.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 49, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 77, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 32, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 97, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 108, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 111, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 99, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 43, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 102, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 114, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 101, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 101, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 32, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 112, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 97, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 105, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 114, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 115, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 32, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 97, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 108, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 108, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 32, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 117, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 99, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 99, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 101, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 101, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 100, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 101, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 100, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 0, ptr %str_char_33.1, align 1
  %arg1_decay = getelementptr [34 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.122 = sub i64 %op_overload_result.1, %op_overload_result
  %.124 = call i64 @standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.122)
  %.126 = call i64 @standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.122)
  %.127 = sext i32 1000 to i64
  %.128 = srem i64 %.126, %.127
  %.130 = sext i32 1000 to i64
  %.131 = sdiv i64 %.122, %.130
  %.133 = sext i32 0 to i64
  %.134 = icmp sle i64 %.131, %.133
  %.136 = sext i32 1 to i64
  %us_elapsed.0 = select i1 %.134, i64 %.136, i64 %.131
  %.140 = sext i32 64 to i64
  %.141 = mul i64 %.66, %.140
  %.142 = sext i32 1000 to i64
  %.143 = mul i64 %.141, %.142
  %.144 = sdiv i64 %.143, %us_elapsed.0
  %.146 = sext i32 1024 to i64
  %.147 = sdiv i64 %.144, %.146
  %.149 = sext i32 1024 to i64
  %.150 = srem i64 %.144, %.149
  %.151 = sext i32 10 to i64
  %.152 = mul i64 %.150, %.151
  %.153 = sext i32 1024 to i64
  %.154 = sdiv i64 %.152, %.153
  %str_stack.2 = alloca [15 x i8], align 1
  %str_char_0.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 32, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 32, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 116, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 105, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 109, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 58, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 32, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 32, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 32, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 32, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 0, ptr %str_char_14.2, align 1
  %arg0_decay.1 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %.172 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.173 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.124, ptr %.172)
  %.174 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.174)
  %str_stack.3 = alloca [2 x i8], align 1
  %str_char_0.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 46, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 0, ptr %str_char_1.3, align 1
  %arg0_decay.2 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.2)
  %.179 = sext i32 100 to i64
  %.180 = icmp slt i64 %.128, %.179
  br i1 %.180, label %then.2, label %ifcont.2

ifcont:                                           ; preds = %while.body
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.76)
  %.83 = add i64 %k.0, 1
  br label %while.cond

then.2:                                           ; preds = %while.end
  %str_stack.4 = alloca [2 x i8], align 1
  %str_char_0.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 48, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 0, ptr %str_char_1.4, align 1
  %arg0_decay.3 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.3)
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %.187 = sext i32 10 to i64
  %.188 = icmp slt i64 %.128, %.187
  br i1 %.188, label %then.3, label %ifcont.3

then.3:                                           ; preds = %ifcont.2
  %str_stack.5 = alloca [2 x i8], align 1
  %str_char_0.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 48, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 0, ptr %str_char_1.5, align 1
  %arg0_decay.4 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.4)
  br label %ifcont.3

ifcont.3:                                         ; preds = %ifcont.2, %then.3
  %.195 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.196 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.128, ptr %.195)
  %.197 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.197)
  %str_stack.6 = alloca [5 x i8], align 1
  %str_char_0.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 32, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 109, ptr %str_char_1.6, align 1
  %str_char_2.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 115, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 10, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 0, ptr %str_char_4.3, align 1
  %arg0_decay.5 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.5)
  %str_stack.7 = alloca [15 x i8], align 1
  %str_char_0.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 32, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 32, ptr %str_char_1.7, align 1
  %str_char_2.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 116, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 104, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 114, ptr %str_char_4.4, align 1
  %str_char_5.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 111, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 117, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 103, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 104, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 112, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 117, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 116, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 58, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 32, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 0, ptr %str_char_14.3, align 1
  %arg0_decay.6 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.6)
  %.221 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.222 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.147, ptr %.221)
  %.223 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.223)
  %str_stack.8 = alloca [2 x i8], align 1
  %str_char_0.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 46, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 0, ptr %str_char_1.8, align 1
  %arg0_decay.7 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.7)
  %.228 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.229 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.154, ptr %.228)
  %.230 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.230)
  %str_stack.9 = alloca [7 x i8], align 1
  %str_char_0.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  store i8 32, ptr %str_char_0.9, align 1
  %str_char_1.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 1
  store i8 77, ptr %str_char_1.9, align 1
  %str_char_2.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 2
  store i8 66, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 3
  store i8 47, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 4
  store i8 115, ptr %str_char_4.5, align 1
  %str_char_5.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 5
  store i8 10, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 6
  store i8 0, ptr %str_char_6.4, align 1
  %arg0_decay.8 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.8)
  ret void
}

define void @test_throughput_mixed__0__ret_voidE1() {
entry:
  %rng = alloca %PCG32, align 8
  %.fca.0.gep1 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep1, align 8
  %.fca.1.gep2 = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep2, align 8
  %buf = alloca [64 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.fca.32.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep, align 1
  %.fca.33.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep, align 1
  %.fca.34.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep, align 1
  %.fca.35.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep, align 1
  %.fca.36.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep, align 1
  %.fca.37.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep, align 1
  %.fca.38.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep, align 1
  %.fca.39.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep, align 1
  %.fca.40.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep, align 1
  %.fca.41.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep, align 1
  %.fca.42.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep, align 1
  %.fca.43.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep, align 1
  %.fca.44.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep, align 1
  %.fca.45.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep, align 1
  %.fca.46.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep, align 1
  %.fca.47.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep, align 1
  %.fca.48.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 48
  store i8 0, ptr %.fca.48.gep, align 1
  %.fca.49.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 49
  store i8 0, ptr %.fca.49.gep, align 1
  %.fca.50.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 50
  store i8 0, ptr %.fca.50.gep, align 1
  %.fca.51.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 51
  store i8 0, ptr %.fca.51.gep, align 1
  %.fca.52.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 52
  store i8 0, ptr %.fca.52.gep, align 1
  %.fca.53.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 53
  store i8 0, ptr %.fca.53.gep, align 1
  %.fca.54.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 54
  store i8 0, ptr %.fca.54.gep, align 1
  %.fca.55.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 55
  store i8 0, ptr %.fca.55.gep, align 1
  %.fca.56.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 56
  store i8 0, ptr %.fca.56.gep, align 1
  %.fca.57.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 57
  store i8 0, ptr %.fca.57.gep, align 1
  %.fca.58.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 58
  store i8 0, ptr %.fca.58.gep, align 1
  %.fca.59.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 59
  store i8 0, ptr %.fca.59.gep, align 1
  %.fca.60.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 60
  store i8 0, ptr %.fca.60.gep, align 1
  %.fca.61.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 61
  store i8 0, ptr %.fca.61.gep, align 1
  %.fca.62.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 62
  store i8 0, ptr %.fca.62.gep, align 1
  %.fca.63.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 63
  store i8 0, ptr %.fca.63.gep, align 1
  %str_stack = alloca [65 x i8], align 1
  %str_char_0 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 3
  store i8 116, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 4
  store i8 104, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 5
  store i8 114, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 6
  store i8 111, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 7
  store i8 117, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 8
  store i8 103, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 9
  store i8 104, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 10
  store i8 112, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 11
  store i8 117, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 12
  store i8 116, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 13
  store i8 58, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 14
  store i8 32, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 15
  store i8 49, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 16
  store i8 77, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 17
  store i8 32, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 18
  store i8 109, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 19
  store i8 105, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 20
  store i8 120, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 21
  store i8 101, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 22
  store i8 100, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 23
  store i8 45, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 24
  store i8 115, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 25
  store i8 105, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 26
  store i8 122, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 27
  store i8 101, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 28
  store i8 32, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 29
  store i8 40, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 30
  store i8 49, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 31
  store i8 45, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 32
  store i8 52, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 33
  store i8 48, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 34
  store i8 57, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 35
  store i8 54, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 36
  store i8 32, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 37
  store i8 98, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 38
  store i8 121, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 39
  store i8 116, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 40
  store i8 101, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 41
  store i8 115, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 42
  store i8 41, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 43
  store i8 32, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 44
  store i8 97, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 45
  store i8 108, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 46
  store i8 108, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 47
  store i8 111, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 48
  store i8 99, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 49
  store i8 43, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 50
  store i8 102, ptr %str_char_50, align 1
  %str_char_51 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 51
  store i8 114, ptr %str_char_51, align 1
  %str_char_52 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 52
  store i8 101, ptr %str_char_52, align 1
  %str_char_53 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 53
  store i8 101, ptr %str_char_53, align 1
  %str_char_54 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 54
  store i8 32, ptr %str_char_54, align 1
  %str_char_55 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 55
  store i8 112, ptr %str_char_55, align 1
  %str_char_56 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 56
  store i8 97, ptr %str_char_56, align 1
  %str_char_57 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 57
  store i8 105, ptr %str_char_57, align 1
  %str_char_58 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 58
  store i8 114, ptr %str_char_58, align 1
  %str_char_59 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 59
  store i8 115, ptr %str_char_59, align 1
  %str_char_60 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 60
  store i8 32, ptr %str_char_60, align 1
  %str_char_61 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 61
  store i8 45, ptr %str_char_61, align 1
  %str_char_62 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 62
  store i8 45, ptr %str_char_62, align 1
  %str_char_63 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 63
  store i8 10, ptr %str_char_63, align 1
  %str_char_64 = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 64
  store i8 0, ptr %str_char_64, align 1
  %arg0_decay = getelementptr [65 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.87 = sext i32 1000000 to i64
  %.90 = sext i32 0 to i64
  %.92 = sext i32 0 to i64
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %op_overload_result = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %k.0 = phi i64 [ %.90, %entry ], [ %.117, %ifcont ]
  %total_bytes.0 = phi i64 [ %.92, %entry ], [ %.114, %ifcont ]
  %.97 = icmp ult i64 %k.0, %.87
  br i1 %.97, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.99 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.101 = zext i32 %.99 to i64
  %.103 = zext i32 4096 to i64
  %.104 = urem i64 %.101, %.103
  %.105 = zext i32 1 to i64
  %.106 = add i64 %.104, %.105
  %.108 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.106)
  %int_to_ptr = inttoptr i64 %.108 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  br i1 %is_null, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %op_overload_result.1 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %str_stack.1 = alloca [40 x i8], align 1
  %str_char_0.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 49, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 77, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 32, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 109, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 105, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 120, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 101, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 100, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 32, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 97, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 108, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 108, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 111, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 99, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 43, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 102, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 114, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 101, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 101, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 32, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 112, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 97, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 105, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 114, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 32, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 97, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 108, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 108, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 32, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 115, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 117, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 99, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 99, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 101, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 101, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 100, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 101, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 100, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 0, ptr %str_char_39.1, align 1
  %arg1_decay = getelementptr [40 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.162 = sub i64 %op_overload_result.1, %op_overload_result
  %.164 = call i64 @standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.162)
  %.166 = call i64 @standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.162)
  %.167 = sext i32 1000 to i64
  %.168 = srem i64 %.166, %.167
  %.170 = sext i32 1000 to i64
  %.171 = sdiv i64 %.162, %.170
  %.173 = sext i32 0 to i64
  %.174 = icmp sle i64 %.171, %.173
  %.176 = sext i32 1 to i64
  %us_elapsed.0 = select i1 %.174, i64 %.176, i64 %.171
  %.180 = sext i32 1000 to i64
  %.181 = mul i64 %total_bytes.0, %.180
  %.182 = sdiv i64 %.181, %us_elapsed.0
  %.184 = sext i32 1024 to i64
  %.185 = sdiv i64 %.182, %.184
  %.187 = sext i32 1024 to i64
  %.188 = srem i64 %.182, %.187
  %.189 = sext i32 10 to i64
  %.190 = mul i64 %.188, %.189
  %.191 = sext i32 1024 to i64
  %.192 = sdiv i64 %.190, %.191
  %str_stack.2 = alloca [15 x i8], align 1
  %str_char_0.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 32, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 32, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 116, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 105, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 109, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 58, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 32, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 32, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 32, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 32, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 0, ptr %str_char_14.2, align 1
  %arg0_decay.1 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %.210 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.211 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.164, ptr %.210)
  %.212 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.212)
  %str_stack.3 = alloca [2 x i8], align 1
  %str_char_0.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 46, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 0, ptr %str_char_1.3, align 1
  %arg0_decay.2 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.2)
  %.217 = sext i32 100 to i64
  %.218 = icmp slt i64 %.168, %.217
  br i1 %.218, label %then.2, label %ifcont.2

ifcont:                                           ; preds = %while.body
  %.114 = add i64 %total_bytes.0, %.106
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.108)
  %.117 = add i64 %k.0, 1
  br label %while.cond

then.2:                                           ; preds = %while.end
  %str_stack.4 = alloca [2 x i8], align 1
  %str_char_0.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 48, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 0, ptr %str_char_1.4, align 1
  %arg0_decay.3 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.3)
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %.225 = sext i32 10 to i64
  %.226 = icmp slt i64 %.168, %.225
  br i1 %.226, label %then.3, label %ifcont.3

then.3:                                           ; preds = %ifcont.2
  %str_stack.5 = alloca [2 x i8], align 1
  %str_char_0.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 48, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 0, ptr %str_char_1.5, align 1
  %arg0_decay.4 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.4)
  br label %ifcont.3

ifcont.3:                                         ; preds = %ifcont.2, %then.3
  %.233 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.234 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.168, ptr %.233)
  %.235 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.235)
  %str_stack.6 = alloca [5 x i8], align 1
  %str_char_0.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 32, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 109, ptr %str_char_1.6, align 1
  %str_char_2.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 115, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 10, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 0, ptr %str_char_4.3, align 1
  %arg0_decay.5 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.5)
  %str_stack.7 = alloca [15 x i8], align 1
  %str_char_0.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 32, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 32, ptr %str_char_1.7, align 1
  %str_char_2.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 116, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 104, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 114, ptr %str_char_4.4, align 1
  %str_char_5.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 111, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 117, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 103, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 104, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 112, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 117, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 116, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 58, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 32, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 0, ptr %str_char_14.3, align 1
  %arg0_decay.6 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.6)
  %.259 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.260 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.185, ptr %.259)
  %.261 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.261)
  %str_stack.8 = alloca [2 x i8], align 1
  %str_char_0.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 46, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 0, ptr %str_char_1.8, align 1
  %arg0_decay.7 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.7)
  %.266 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.267 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.192, ptr %.266)
  %.268 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.268)
  %str_stack.9 = alloca [7 x i8], align 1
  %str_char_0.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  store i8 32, ptr %str_char_0.9, align 1
  %str_char_1.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 1
  store i8 77, ptr %str_char_1.9, align 1
  %str_char_2.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 2
  store i8 66, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 3
  store i8 47, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 4
  store i8 115, ptr %str_char_4.5, align 1
  %str_char_5.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 5
  store i8 10, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 6
  store i8 0, ptr %str_char_6.4, align 1
  %arg0_decay.8 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.8)
  ret void
}

define void @test_throughput_fastpath__0__ret_voidE1() {
entry:
  %buf = alloca [64 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.fca.32.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep, align 1
  %.fca.33.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep, align 1
  %.fca.34.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep, align 1
  %.fca.35.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep, align 1
  %.fca.36.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep, align 1
  %.fca.37.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep, align 1
  %.fca.38.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep, align 1
  %.fca.39.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep, align 1
  %.fca.40.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep, align 1
  %.fca.41.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep, align 1
  %.fca.42.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep, align 1
  %.fca.43.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep, align 1
  %.fca.44.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep, align 1
  %.fca.45.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep, align 1
  %.fca.46.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep, align 1
  %.fca.47.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep, align 1
  %.fca.48.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 48
  store i8 0, ptr %.fca.48.gep, align 1
  %.fca.49.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 49
  store i8 0, ptr %.fca.49.gep, align 1
  %.fca.50.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 50
  store i8 0, ptr %.fca.50.gep, align 1
  %.fca.51.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 51
  store i8 0, ptr %.fca.51.gep, align 1
  %.fca.52.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 52
  store i8 0, ptr %.fca.52.gep, align 1
  %.fca.53.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 53
  store i8 0, ptr %.fca.53.gep, align 1
  %.fca.54.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 54
  store i8 0, ptr %.fca.54.gep, align 1
  %.fca.55.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 55
  store i8 0, ptr %.fca.55.gep, align 1
  %.fca.56.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 56
  store i8 0, ptr %.fca.56.gep, align 1
  %.fca.57.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 57
  store i8 0, ptr %.fca.57.gep, align 1
  %.fca.58.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 58
  store i8 0, ptr %.fca.58.gep, align 1
  %.fca.59.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 59
  store i8 0, ptr %.fca.59.gep, align 1
  %.fca.60.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 60
  store i8 0, ptr %.fca.60.gep, align 1
  %.fca.61.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 61
  store i8 0, ptr %.fca.61.gep, align 1
  %.fca.62.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 62
  store i8 0, ptr %.fca.62.gep, align 1
  %.fca.63.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 63
  store i8 0, ptr %.fca.63.gep, align 1
  %str_stack = alloca [64 x i8], align 1
  %str_char_0 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 3
  store i8 116, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 4
  store i8 104, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 5
  store i8 114, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 6
  store i8 111, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 7
  store i8 117, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 8
  store i8 103, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 9
  store i8 104, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 10
  store i8 112, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 11
  store i8 117, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 12
  store i8 116, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 13
  store i8 58, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 14
  store i8 32, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 15
  store i8 102, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 16
  store i8 97, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 17
  store i8 115, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 18
  store i8 116, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 19
  store i8 45, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 20
  store i8 112, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 21
  store i8 97, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 22
  store i8 116, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 23
  store i8 104, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 24
  store i8 32, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 25
  store i8 98, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 26
  store i8 105, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 27
  store i8 110, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 28
  store i8 32, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 29
  store i8 114, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 30
  store i8 101, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 31
  store i8 117, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 32
  store i8 115, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 33
  store i8 101, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 34
  store i8 32, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 35
  store i8 40, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 36
  store i8 49, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 37
  store i8 77, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 38
  store i8 32, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 39
  store i8 120, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 40
  store i8 32, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 41
  store i8 54, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 42
  store i8 52, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 43
  store i8 45, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 44
  store i8 98, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 45
  store i8 121, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 46
  store i8 116, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 47
  store i8 101, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 48
  store i8 44, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 49
  store i8 32, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 50
  store i8 119, ptr %str_char_50, align 1
  %str_char_51 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 51
  store i8 97, ptr %str_char_51, align 1
  %str_char_52 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 52
  store i8 114, ptr %str_char_52, align 1
  %str_char_53 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 53
  store i8 109, ptr %str_char_53, align 1
  %str_char_54 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 54
  store i8 32, ptr %str_char_54, align 1
  %str_char_55 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 55
  store i8 98, ptr %str_char_55, align 1
  %str_char_56 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 56
  store i8 105, ptr %str_char_56, align 1
  %str_char_57 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 57
  store i8 110, ptr %str_char_57, align 1
  %str_char_58 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 58
  store i8 41, ptr %str_char_58, align 1
  %str_char_59 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 59
  store i8 32, ptr %str_char_59, align 1
  %str_char_60 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 60
  store i8 45, ptr %str_char_60, align 1
  %str_char_61 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 61
  store i8 45, ptr %str_char_61, align 1
  %str_char_62 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 62
  store i8 10, ptr %str_char_62, align 1
  %str_char_63 = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 63
  store i8 0, ptr %str_char_63, align 1
  %arg0_decay = getelementptr [64 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.81 = sext i32 1000000 to i64
  %.84 = sext i32 0 to i64
  %.86 = sext i32 64 to i64
  %.87 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.86)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.87)
  %op_overload_result = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %k.0 = phi i64 [ %.84, %entry ], [ %.102, %ifcont ]
  %.92 = icmp ult i64 %k.0, %.81
  br i1 %.92, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.94 = sext i32 64 to i64
  %.95 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.94)
  %int_to_ptr = inttoptr i64 %.95 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  br i1 %is_null, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %op_overload_result.1 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %str_stack.1 = alloca [44 x i8], align 1
  %str_char_0.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 49, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 77, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 32, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 102, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 97, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 115, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 116, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 45, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 112, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 97, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 116, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 104, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 32, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 98, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 105, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 110, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 45, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 114, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 101, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 117, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 115, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 101, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 32, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 99, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 121, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 99, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 108, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 101, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 115, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 32, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 97, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 108, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 108, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 32, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 115, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 117, ptr %str_char_35.1, align 1
  %str_char_36.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 99, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 99, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 101, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 101, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 40
  store i8 100, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 41
  store i8 101, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 42
  store i8 100, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 43
  store i8 0, ptr %str_char_43.1, align 1
  %arg1_decay = getelementptr [44 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  %.151 = sub i64 %op_overload_result.1, %op_overload_result
  %.153 = call i64 @standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.151)
  %.155 = call i64 @standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %.151)
  %.156 = sext i32 1000 to i64
  %.157 = srem i64 %.155, %.156
  %.159 = sext i32 1000 to i64
  %.160 = sdiv i64 %.151, %.159
  %.162 = sext i32 0 to i64
  %.163 = icmp sle i64 %.160, %.162
  %.165 = sext i32 1 to i64
  %us_elapsed.0 = select i1 %.163, i64 %.165, i64 %.160
  %.169 = sext i32 64 to i64
  %.170 = mul i64 %.81, %.169
  %.171 = sext i32 1000 to i64
  %.172 = mul i64 %.170, %.171
  %.173 = sdiv i64 %.172, %us_elapsed.0
  %.175 = sext i32 1024 to i64
  %.176 = sdiv i64 %.173, %.175
  %.178 = sext i32 1024 to i64
  %.179 = srem i64 %.173, %.178
  %.180 = sext i32 10 to i64
  %.181 = mul i64 %.179, %.180
  %.182 = sext i32 1024 to i64
  %.183 = sdiv i64 %.181, %.182
  %str_stack.2 = alloca [15 x i8], align 1
  %str_char_0.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 32, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 32, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 116, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 105, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 109, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 101, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 58, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 32, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 32, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 32, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 32, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 32, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 0, ptr %str_char_14.2, align 1
  %arg0_decay.1 = getelementptr [15 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  %.201 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.202 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.153, ptr %.201)
  %.203 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.203)
  %str_stack.3 = alloca [2 x i8], align 1
  %str_char_0.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 46, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 0, ptr %str_char_1.3, align 1
  %arg0_decay.2 = getelementptr [2 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.2)
  %.208 = sext i32 100 to i64
  %.209 = icmp slt i64 %.157, %.208
  br i1 %.209, label %then.2, label %ifcont.2

ifcont:                                           ; preds = %while.body
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.95)
  %.102 = add i64 %k.0, 1
  br label %while.cond

then.2:                                           ; preds = %while.end
  %str_stack.4 = alloca [2 x i8], align 1
  %str_char_0.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 48, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 0, ptr %str_char_1.4, align 1
  %arg0_decay.3 = getelementptr [2 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.3)
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.end, %then.2
  %.216 = sext i32 10 to i64
  %.217 = icmp slt i64 %.157, %.216
  br i1 %.217, label %then.3, label %ifcont.3

then.3:                                           ; preds = %ifcont.2
  %str_stack.5 = alloca [2 x i8], align 1
  %str_char_0.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 48, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 0, ptr %str_char_1.5, align 1
  %arg0_decay.4 = getelementptr [2 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.4)
  br label %ifcont.3

ifcont.3:                                         ; preds = %ifcont.2, %then.3
  %.224 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.225 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.157, ptr %.224)
  %.226 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.226)
  %str_stack.6 = alloca [5 x i8], align 1
  %str_char_0.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 32, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 109, ptr %str_char_1.6, align 1
  %str_char_2.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 115, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 10, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 0, ptr %str_char_4.3, align 1
  %arg0_decay.5 = getelementptr [5 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.5)
  %str_stack.7 = alloca [15 x i8], align 1
  %str_char_0.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 32, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 32, ptr %str_char_1.7, align 1
  %str_char_2.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 116, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 104, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 114, ptr %str_char_4.4, align 1
  %str_char_5.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 111, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 117, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 103, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 104, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 112, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 117, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 116, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 58, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 32, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 0, ptr %str_char_14.3, align 1
  %arg0_decay.6 = getelementptr [15 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.6)
  %.250 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.251 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.176, ptr %.250)
  %.252 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.252)
  %str_stack.8 = alloca [2 x i8], align 1
  %str_char_0.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 46, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 0, ptr %str_char_1.8, align 1
  %arg0_decay.7 = getelementptr [2 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.7)
  %.257 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.258 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.183, ptr %.257)
  %.259 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.259)
  %str_stack.9 = alloca [7 x i8], align 1
  %str_char_0.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  store i8 32, ptr %str_char_0.9, align 1
  %str_char_1.9 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 1
  store i8 77, ptr %str_char_1.9, align 1
  %str_char_2.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 2
  store i8 66, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 3
  store i8 47, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 4
  store i8 115, ptr %str_char_4.5, align 1
  %str_char_5.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 5
  store i8 10, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 6
  store i8 0, ptr %str_char_6.4, align 1
  %arg0_decay.8 = getelementptr [7 x i8], ptr %str_stack.9, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.8)
  ret void
}

define void @bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1(ptr %what, i64 %bytes, i64 %ns) {
entry:
  %buf = alloca [64 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.fca.32.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep, align 1
  %.fca.33.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep, align 1
  %.fca.34.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep, align 1
  %.fca.35.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep, align 1
  %.fca.36.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep, align 1
  %.fca.37.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep, align 1
  %.fca.38.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep, align 1
  %.fca.39.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep, align 1
  %.fca.40.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep, align 1
  %.fca.41.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep, align 1
  %.fca.42.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep, align 1
  %.fca.43.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep, align 1
  %.fca.44.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep, align 1
  %.fca.45.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep, align 1
  %.fca.46.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep, align 1
  %.fca.47.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep, align 1
  %.fca.48.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 48
  store i8 0, ptr %.fca.48.gep, align 1
  %.fca.49.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 49
  store i8 0, ptr %.fca.49.gep, align 1
  %.fca.50.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 50
  store i8 0, ptr %.fca.50.gep, align 1
  %.fca.51.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 51
  store i8 0, ptr %.fca.51.gep, align 1
  %.fca.52.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 52
  store i8 0, ptr %.fca.52.gep, align 1
  %.fca.53.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 53
  store i8 0, ptr %.fca.53.gep, align 1
  %.fca.54.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 54
  store i8 0, ptr %.fca.54.gep, align 1
  %.fca.55.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 55
  store i8 0, ptr %.fca.55.gep, align 1
  %.fca.56.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 56
  store i8 0, ptr %.fca.56.gep, align 1
  %.fca.57.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 57
  store i8 0, ptr %.fca.57.gep, align 1
  %.fca.58.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 58
  store i8 0, ptr %.fca.58.gep, align 1
  %.fca.59.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 59
  store i8 0, ptr %.fca.59.gep, align 1
  %.fca.60.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 60
  store i8 0, ptr %.fca.60.gep, align 1
  %.fca.61.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 61
  store i8 0, ptr %.fca.61.gep, align 1
  %.fca.62.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 62
  store i8 0, ptr %.fca.62.gep, align 1
  %.fca.63.gep = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 63
  store i8 0, ptr %.fca.63.gep, align 1
  %.12 = sext i32 1000 to i64
  %.13 = sdiv i64 %ns, %.12
  %.15 = sext i32 0 to i64
  %.16 = icmp sle i64 %.13, %.15
  %.18 = sext i32 1 to i64
  %us.0 = select i1 %.16, i64 %.18, i64 %.13
  %.22 = sext i32 1000000 to i64
  %.23 = mul i64 %bytes, %.22
  %.24 = sdiv i64 %.23, %us.0
  %.25 = sext i32 1048576 to i64
  %.26 = sdiv i64 %.24, %.25
  %.28 = sext i32 1000000 to i64
  %.29 = mul i64 %bytes, %.28
  %.30 = sdiv i64 %.29, %us.0
  %.31 = sext i32 1048576 to i64
  %.32 = srem i64 %.30, %.31
  %.33 = sext i32 10 to i64
  %.34 = mul i64 %.32, %.33
  %.35 = sext i32 1048576 to i64
  %.36 = sdiv i64 %.34, %.35
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %what)
  %.39 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.40 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.26, ptr %.39)
  %.41 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.41)
  %str_stack = alloca [2 x i8], align 1
  %str_char_0 = getelementptr [2 x i8], ptr %str_stack, i32 0, i32 0
  store i8 46, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [2 x i8], ptr %str_stack, i32 0, i32 1
  store i8 0, ptr %str_char_1, align 1
  %arg0_decay = getelementptr [2 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.46 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  %.47 = call i64 @standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64(i64 %.36, ptr %.46)
  %.48 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %.48)
  %str_stack.1 = alloca [7 x i8], align 1
  %str_char_0.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 32, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 77, ptr %str_char_1.1, align 1
  %str_char_2 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 66, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 47, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 115, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 10, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 0, ptr %str_char_6, align 1
  %arg0_decay.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  ret void
}

define void @test_bandwidth__0__ret_voidE1() {
entry:
  %rng = alloca %PCG32, align 8
  %.fca.0.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %str_stack = alloca [46 x i8], align 1
  %str_char_0 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 3
  store i8 98, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 4
  store i8 97, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 5
  store i8 110, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 6
  store i8 100, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 7
  store i8 119, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 8
  store i8 105, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 9
  store i8 100, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 10
  store i8 116, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 11
  store i8 104, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 12
  store i8 58, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 13
  store i8 32, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 14
  store i8 98, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 15
  store i8 121, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 16
  store i8 116, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 17
  store i8 101, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 18
  store i8 115, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 19
  store i8 32, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 20
  store i8 119, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 21
  store i8 114, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 22
  store i8 105, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 23
  store i8 116, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 24
  store i8 116, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 25
  store i8 101, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 26
  store i8 110, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 27
  store i8 32, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 28
  store i8 97, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 29
  store i8 110, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 30
  store i8 100, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 31
  store i8 32, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 32
  store i8 114, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 33
  store i8 101, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 34
  store i8 97, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 35
  store i8 100, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 36
  store i8 32, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 37
  store i8 98, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 38
  store i8 97, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 39
  store i8 99, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 40
  store i8 107, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 41
  store i8 32, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 42
  store i8 45, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 43
  store i8 45, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 44
  store i8 10, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 45
  store i8 0, ptr %str_char_45, align 1
  %arg0_decay = getelementptr [46 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.68 = sext i32 1000000 to i64
  %.71 = sext i32 0 to i64
  %.73 = sext i32 0 to i64
  %.75 = sext i32 0 to i64
  %.77 = sext i32 0 to i64
  %op_overload_result = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond

while.cond:                                       ; preds = %while.end.2, %entry
  %expect.0 = phi i64 [ %.75, %entry ], [ %.118, %while.end.2 ]
  %sum.0 = phi i64 [ %.73, %entry ], [ %sum.116, %while.end.2 ]
  %k.0 = phi i64 [ %.71, %entry ], [ %.124, %while.end.2 ]
  %touched.0 = phi i64 [ %.77, %entry ], [ %.122, %while.end.2 ]
  %.81 = icmp ult i64 %k.0, %.68
  br i1 %.81, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.83 = sext i32 64 to i64
  %.84 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.83)
  %int_to_ptr = inttoptr i64 %.84 to ptr
  %is_null = icmp eq ptr %int_to_ptr, null
  br i1 %is_null, label %while.end, label %ifcont

while.end:                                        ; preds = %while.body, %while.cond
  %ok.0 = phi i1 [ true, %while.cond ], [ false, %while.body ]
  %op_overload_result.1 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %.129 = icmp eq i64 %sum.0, %expect.0
  %spec.select = select i1 %ok.0, i1 %.129, i1 false
  %str_stack.1 = alloca [35 x i8], align 1
  %str_char_0.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 54, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 52, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 45, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 98, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 121, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 116, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 101, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 32, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 119, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 114, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 105, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 116, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 101, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 47, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 114, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 101, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 97, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 100, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 45, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 98, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 97, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 99, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 107, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 32, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 115, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 117, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 109, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 115, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 32, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 109, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 97, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 116, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 99, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 104, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 0, ptr %str_char_34.1, align 1
  %arg1_decay = getelementptr [35 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %spec.select, ptr %arg1_decay)
  %str_stack.2 = alloca [19 x i8], align 1
  %str_char_0.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 32, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 32, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 54, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 52, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 45, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 98, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 121, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 116, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 101, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 32, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 112, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 97, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 105, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 114, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 115, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 58, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 32, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 32, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 0, ptr %str_char_18.2, align 1
  %.186 = sub i64 %op_overload_result.1, %op_overload_result
  %arg0_decay.1 = getelementptr [19 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1(ptr %arg0_decay.1, i64 %touched.0, i64 %.186)
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %.189 = sext i32 0 to i64
  %.191 = sext i32 0 to i64
  %.193 = sext i32 0 to i64
  %.195 = sext i32 0 to i64
  %op_overload_result.2 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond.3

ifcont:                                           ; preds = %while.body
  %int_to_ptr.1 = inttoptr i64 %.84 to ptr
  %.91 = sext i32 0 to i64
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %ifcont
  %j.0 = phi i64 [ %.91, %ifcont ], [ %.100, %while.body.1 ]
  %.94 = zext i32 8 to i64
  %.95 = icmp ult i64 %j.0, %.94
  br i1 %.95, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.97 = add i64 %k.0, %j.0
  %.98 = getelementptr inbounds i64, ptr %int_to_ptr.1, i64 %j.0
  store i64 %.97, ptr %.98, align 8
  %.100 = add i64 %j.0, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.103 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %sum.116 = phi i64 [ %sum.0, %while.end.1 ], [ %.109, %while.body.2 ]
  %j.110 = phi i64 [ %.103, %while.end.1 ], [ %.111, %while.body.2 ]
  %.106 = zext i32 8 to i64
  %.107 = icmp ult i64 %j.110, %.106
  br i1 %.107, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc = trunc i64 %j.110 to i32
  %ptr_gep = getelementptr inbounds i64, ptr %int_to_ptr.1, i32 %idx_trunc
  %ptr_load = load i64, ptr %ptr_gep, align 8
  %.109 = add i64 %sum.116, %ptr_load
  %.111 = add i64 %j.110, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.114 = zext i32 8 to i64
  %.115 = mul i64 %k.0, %.114
  %.116 = add i64 %expect.0, %.115
  %.117 = zext i32 28 to i64
  %.118 = add i64 %.116, %.117
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.84)
  %.121 = sext i32 128 to i64
  %.122 = add i64 %touched.0, %.121
  %.124 = add i64 %k.0, 1
  br label %while.cond

while.cond.3:                                     ; preds = %while.end.5, %while.end
  %expect.121 = phi i64 [ %.193, %while.end ], [ %.255, %while.end.5 ]
  %sum.217 = phi i64 [ %.191, %while.end ], [ %sum.318, %while.end.5 ]
  %k.13 = phi i64 [ %.189, %while.end ], [ %.262, %while.end.5 ]
  %touched.11 = phi i64 [ %.195, %while.end ], [ %.260, %while.end.5 ]
  %.199 = icmp ult i64 %k.13, %.68
  br i1 %.199, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %.201 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.203 = zext i32 %.201 to i64
  %.205 = zext i32 4096 to i64
  %.206 = urem i64 %.203, %.205
  %.207 = zext i32 1 to i64
  %.208 = add i64 %.206, %.207
  %.210 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.208)
  %int_to_ptr.2 = inttoptr i64 %.210 to ptr
  %is_null.1 = icmp eq ptr %int_to_ptr.2, null
  br i1 %is_null.1, label %while.end.3, label %ifcont.1

while.end.3:                                      ; preds = %while.body.3, %while.cond.3
  %ok.12 = phi i1 [ %ok.0, %while.cond.3 ], [ false, %while.body.3 ]
  %op_overload_result.3 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %.267 = icmp eq i64 %sum.217, %expect.121
  %spec.select22 = select i1 %ok.12, i1 %.267, i1 false
  %str_stack.3 = alloca [33 x i8], align 1
  %str_char_0.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 109, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 105, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 120, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 101, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 100, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 32, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 119, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 114, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 105, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 116, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 101, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 47, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 114, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 101, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 97, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 100, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 45, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 98, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 97, ptr %str_char_18.3, align 1
  %str_char_19.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 99, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 107, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 32, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 115, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 117, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 109, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 115, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 109, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 97, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 116, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 99, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 104, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 0, ptr %str_char_32.2, align 1
  %arg1_decay.1 = getelementptr [33 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %spec.select22, ptr %arg1_decay.1)
  %str_stack.4 = alloca [19 x i8], align 1
  %str_char_0.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 32, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 32, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 109, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 105, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 120, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 101, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 100, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 32, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 112, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 97, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 105, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 114, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 115, ptr %str_char_12.4, align 1
  %str_char_13.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 58, ptr %str_char_13.4, align 1
  %str_char_14.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 32, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 32, ptr %str_char_15.4, align 1
  %str_char_16.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 16
  store i8 32, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 17
  store i8 32, ptr %str_char_17.4, align 1
  %str_char_18.4 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 18
  store i8 0, ptr %str_char_18.4, align 1
  %.322 = sub i64 %op_overload_result.3, %op_overload_result.2
  %arg0_decay.2 = getelementptr [19 x i8], ptr %str_stack.4, i32 0, i32 0
  call void @bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1(ptr %arg0_decay.2, i64 %touched.11, i64 %.322)
  %.324 = mul i32 64, 1024
  %.325 = mul i32 %.324, 1024
  %.326 = sext i32 %.325 to i64
  %.328 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.326)
  %.330 = zext i32 0 to i64
  %.331 = icmp ne i64 %.328, %.330
  %str_stack.5 = alloca [22 x i8], align 1
  %str_char_0.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 54, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 52, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 32, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 77, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 66, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 32, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 98, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 108, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 111, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 99, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 107, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 32, ptr %str_char_11.5, align 1
  %str_char_12.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 12
  store i8 97, ptr %str_char_12.5, align 1
  %str_char_13.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 13
  store i8 108, ptr %str_char_13.5, align 1
  %str_char_14.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 14
  store i8 108, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 15
  store i8 111, ptr %str_char_15.5, align 1
  %str_char_16.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 16
  store i8 99, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 17
  store i8 97, ptr %str_char_17.5, align 1
  %str_char_18.5 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 18
  store i8 116, ptr %str_char_18.5, align 1
  %str_char_19.3 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 19
  store i8 101, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 20
  store i8 100, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 21
  store i8 0, ptr %str_char_21.3, align 1
  %arg1_decay.2 = getelementptr [22 x i8], ptr %str_stack.5, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.331, ptr %arg1_decay.2)
  %.355 = zext i32 0 to i64
  %.356 = icmp ne i64 %.328, %.355
  br i1 %.356, label %then.3, label %ifcont.3

ifcont.1:                                         ; preds = %while.body.3
  %int_to_ptr.3 = inttoptr i64 %.210 to ptr
  %.217 = zext i32 8 to i64
  %.218 = udiv i64 %.208, %.217
  %.220 = zext i32 0 to i64
  %.221 = icmp eq i64 %.218, %.220
  %.223 = sext i32 1 to i64
  %w.0 = select i1 %.221, i64 %.223, i64 %.218
  %.227 = sext i32 0 to i64
  br label %while.cond.4

while.cond.4:                                     ; preds = %while.body.4, %ifcont.1
  %j.211 = phi i64 [ %.227, %ifcont.1 ], [ %.235, %while.body.4 ]
  %.230 = icmp ult i64 %j.211, %w.0
  br i1 %.230, label %while.body.4, label %while.end.4

while.body.4:                                     ; preds = %while.cond.4
  %.232 = add i64 %k.13, %j.211
  %.233 = getelementptr inbounds i64, ptr %int_to_ptr.3, i64 %j.211
  store i64 %.232, ptr %.233, align 8
  %.235 = add i64 %j.211, 1
  br label %while.cond.4

while.end.4:                                      ; preds = %while.cond.4
  %.238 = sext i32 0 to i64
  br label %while.cond.5

while.cond.5:                                     ; preds = %while.body.5, %while.end.4
  %sum.318 = phi i64 [ %sum.217, %while.end.4 ], [ %.243, %while.body.5 ]
  %j.312 = phi i64 [ %.238, %while.end.4 ], [ %.245, %while.body.5 ]
  %.241 = icmp ult i64 %j.312, %w.0
  br i1 %.241, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %idx_trunc.1 = trunc i64 %j.312 to i32
  %ptr_gep.1 = getelementptr inbounds i64, ptr %int_to_ptr.3, i32 %idx_trunc.1
  %ptr_load.1 = load i64, ptr %ptr_gep.1, align 8
  %.243 = add i64 %sum.318, %ptr_load.1
  %.245 = add i64 %j.312, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %.248 = mul i64 %k.13, %w.0
  %.249 = add i64 %expect.121, %.248
  %.250 = zext i32 1 to i64
  %.251 = sub i64 %w.0, %.250
  %.252 = mul i64 %w.0, %.251
  %.253 = zext i32 2 to i64
  %.254 = udiv i64 %.252, %.253
  %.255 = add i64 %.249, %.254
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.210)
  %.258 = sext i32 16 to i64
  %.259 = mul i64 %w.0, %.258
  %.260 = add i64 %touched.11, %.259
  %.262 = add i64 %k.13, 1
  br label %while.cond.3

then.3:                                           ; preds = %while.end.3
  %int_to_ptr.4 = inttoptr i64 %.328 to ptr
  %.359 = zext i32 8 to i64
  %.360 = udiv i64 %.326, %.359
  %.362 = sext i32 0 to i64
  %op_overload_result.4 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond.6

ifcont.3:                                         ; preds = %while.end.3, %while.end.8
  ret void

while.cond.6:                                     ; preds = %while.end.7, %then.3
  %rounds.0 = phi i64 [ %.362, %then.3 ], [ %.380, %while.end.7 ]
  %.366 = zext i32 4 to i64
  %.367 = icmp ult i64 %rounds.0, %.366
  br i1 %.367, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.369 = sext i32 0 to i64
  br label %while.cond.7

while.end.6:                                      ; preds = %while.cond.6
  %op_overload_result.5 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %str_stack.6 = alloca [19 x i8], align 1
  %str_char_0.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 32, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 32, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 115, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 116, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 114, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 101, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 97, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 109, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 32, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 119, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 114, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 105, ptr %str_char_11.6, align 1
  %str_char_12.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 116, ptr %str_char_12.6, align 1
  %str_char_13.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 101, ptr %str_char_13.6, align 1
  %str_char_14.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 14
  store i8 58, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 15
  store i8 32, ptr %str_char_15.6, align 1
  %str_char_16.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 16
  store i8 32, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 17
  store i8 32, ptr %str_char_17.6, align 1
  %str_char_18.6 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 18
  store i8 0, ptr %str_char_18.6, align 1
  %.403 = sext i32 4 to i64
  %.404 = mul i64 %.326, %.403
  %.405 = sub i64 %op_overload_result.5, %op_overload_result.4
  %arg0_decay.3 = getelementptr [19 x i8], ptr %str_stack.6, i32 0, i32 0
  call void @bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1(ptr %arg0_decay.3, i64 %.404, i64 %.405)
  %.407 = sext i32 0 to i64
  %.409 = sext i32 0 to i64
  %op_overload_result.6 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  br label %while.cond.8

while.cond.7:                                     ; preds = %while.body.7, %while.body.6
  %j.413 = phi i64 [ %.369, %while.body.6 ], [ %.377, %while.body.7 ]
  %.372 = icmp ult i64 %j.413, %.360
  br i1 %.372, label %while.body.7, label %while.end.7

while.body.7:                                     ; preds = %while.cond.7
  %.374 = add i64 %j.413, %rounds.0
  %.375 = getelementptr inbounds i64, ptr %int_to_ptr.4, i64 %j.413
  store i64 %.374, ptr %.375, align 8
  %.377 = add i64 %j.413, 1
  br label %while.cond.7

while.end.7:                                      ; preds = %while.cond.7
  %.380 = add i64 %rounds.0, 1
  br label %while.cond.6

while.cond.8:                                     ; preds = %while.end.9, %while.end.6
  %sum.419 = phi i64 [ %.407, %while.end.6 ], [ %sum.520, %while.end.9 ]
  %rounds.115 = phi i64 [ %.409, %while.end.6 ], [ %.426, %while.end.9 ]
  %.413 = zext i32 4 to i64
  %.414 = icmp ult i64 %rounds.115, %.413
  br i1 %.414, label %while.body.8, label %while.end.8

while.body.8:                                     ; preds = %while.cond.8
  %.416 = sext i32 0 to i64
  br label %while.cond.9

while.end.8:                                      ; preds = %while.cond.8
  %op_overload_result.7 = call i64 @standard__time__time_now__0__ret_dataE1_sbits64()
  %.430 = zext i32 1 to i64
  %.431 = sub i64 %.360, %.430
  %.432 = mul i64 %.360, %.431
  %.433 = zext i32 2 to i64
  %.434 = udiv i64 %.432, %.433
  %.435 = zext i32 3 to i64
  %.436 = mul i64 %.360, %.435
  %.437 = add i64 %.434, %.436
  %.438 = zext i32 4 to i64
  %.439 = mul i64 %.437, %.438
  %.441 = icmp eq i64 %sum.419, %.439
  %str_stack.7 = alloca [29 x i8], align 1
  %str_char_0.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 115, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 116, ptr %str_char_1.7, align 1
  %str_char_2.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 114, ptr %str_char_2.7, align 1
  %str_char_3.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 101, ptr %str_char_3.7, align 1
  %str_char_4.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 97, ptr %str_char_4.7, align 1
  %str_char_5.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 109, ptr %str_char_5.7, align 1
  %str_char_6.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 32, ptr %str_char_6.7, align 1
  %str_char_7.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 114, ptr %str_char_7.7, align 1
  %str_char_8.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 101, ptr %str_char_8.7, align 1
  %str_char_9.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 97, ptr %str_char_9.7, align 1
  %str_char_10.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 100, ptr %str_char_10.7, align 1
  %str_char_11.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 45, ptr %str_char_11.7, align 1
  %str_char_12.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 98, ptr %str_char_12.7, align 1
  %str_char_13.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 97, ptr %str_char_13.7, align 1
  %str_char_14.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 99, ptr %str_char_14.7, align 1
  %str_char_15.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 15
  store i8 107, ptr %str_char_15.7, align 1
  %str_char_16.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 16
  store i8 32, ptr %str_char_16.7, align 1
  %str_char_17.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 17
  store i8 115, ptr %str_char_17.7, align 1
  %str_char_18.7 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 18
  store i8 117, ptr %str_char_18.7, align 1
  %str_char_19.4 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 19
  store i8 109, ptr %str_char_19.4, align 1
  %str_char_20.4 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 20
  store i8 32, ptr %str_char_20.4, align 1
  %str_char_21.4 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 21
  store i8 109, ptr %str_char_21.4, align 1
  %str_char_22.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 22
  store i8 97, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 23
  store i8 116, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 24
  store i8 99, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 25
  store i8 104, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 26
  store i8 101, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 27
  store i8 115, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 28
  store i8 0, ptr %str_char_28.3, align 1
  %arg1_decay.3 = getelementptr [29 x i8], ptr %str_stack.7, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.441, ptr %arg1_decay.3)
  %str_stack.8 = alloca [19 x i8], align 1
  %str_char_0.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 32, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 32, ptr %str_char_1.8, align 1
  %str_char_2.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 2
  store i8 115, ptr %str_char_2.8, align 1
  %str_char_3.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 3
  store i8 116, ptr %str_char_3.8, align 1
  %str_char_4.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 4
  store i8 114, ptr %str_char_4.8, align 1
  %str_char_5.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 5
  store i8 101, ptr %str_char_5.8, align 1
  %str_char_6.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 6
  store i8 97, ptr %str_char_6.8, align 1
  %str_char_7.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 7
  store i8 109, ptr %str_char_7.8, align 1
  %str_char_8.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 8
  store i8 32, ptr %str_char_8.8, align 1
  %str_char_9.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 9
  store i8 114, ptr %str_char_9.8, align 1
  %str_char_10.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 10
  store i8 101, ptr %str_char_10.8, align 1
  %str_char_11.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 11
  store i8 97, ptr %str_char_11.8, align 1
  %str_char_12.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 12
  store i8 100, ptr %str_char_12.8, align 1
  %str_char_13.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 13
  store i8 58, ptr %str_char_13.8, align 1
  %str_char_14.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 14
  store i8 32, ptr %str_char_14.8, align 1
  %str_char_15.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 15
  store i8 32, ptr %str_char_15.8, align 1
  %str_char_16.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 16
  store i8 32, ptr %str_char_16.8, align 1
  %str_char_17.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 17
  store i8 32, ptr %str_char_17.8, align 1
  %str_char_18.8 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 18
  store i8 0, ptr %str_char_18.8, align 1
  %.491 = sext i32 4 to i64
  %.492 = mul i64 %.326, %.491
  %.493 = sub i64 %op_overload_result.7, %op_overload_result.6
  %arg0_decay.4 = getelementptr [19 x i8], ptr %str_stack.8, i32 0, i32 0
  call void @bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1(ptr %arg0_decay.4, i64 %.492, i64 %.493)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.328)
  br label %ifcont.3

while.cond.9:                                     ; preds = %while.body.9, %while.body.8
  %sum.520 = phi i64 [ %sum.419, %while.body.8 ], [ %.421, %while.body.9 ]
  %j.514 = phi i64 [ %.416, %while.body.8 ], [ %.423, %while.body.9 ]
  %.419 = icmp ult i64 %j.514, %.360
  br i1 %.419, label %while.body.9, label %while.end.9

while.body.9:                                     ; preds = %while.cond.9
  %idx_trunc.2 = trunc i64 %j.514 to i32
  %ptr_gep.2 = getelementptr inbounds i64, ptr %int_to_ptr.4, i32 %idx_trunc.2
  %ptr_load.2 = load i64, ptr %ptr_gep.2, align 8
  %.421 = add i64 %sum.520, %ptr_load.2
  %.423 = add i64 %j.514, 1
  br label %while.cond.9

while.end.9:                                      ; preds = %while.cond.9
  %.426 = add i64 %rounds.115, 1
  br label %while.cond.8
}

define void @test_frealloc_pressure__0__ret_voidE1() {
entry:
  %rng = alloca %PCG32, align 8
  %.fca.0.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %PCG32, ptr %rng, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %str_stack = alloca [58 x i8], align 1
  %str_char_0 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 3
  store i8 102, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 4
  store i8 114, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 5
  store i8 101, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 6
  store i8 97, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 7
  store i8 108, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 8
  store i8 108, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 9
  store i8 111, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 10
  store i8 99, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 11
  store i8 32, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 12
  store i8 112, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 13
  store i8 114, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 14
  store i8 101, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 15
  store i8 115, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 16
  store i8 115, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 17
  store i8 117, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 18
  store i8 114, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 19
  store i8 101, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 20
  store i8 32, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 21
  store i8 40, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 22
  store i8 49, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 23
  store i8 48, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 24
  store i8 48, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 25
  store i8 48, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 26
  store i8 32, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 27
  store i8 114, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 28
  store i8 97, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 29
  store i8 110, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 30
  store i8 100, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 31
  store i8 111, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 32
  store i8 109, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 33
  store i8 32, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 34
  store i8 103, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 35
  store i8 114, ptr %str_char_35, align 1
  %str_char_36 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 36
  store i8 111, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 37
  store i8 119, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 38
  store i8 47, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 39
  store i8 115, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 40
  store i8 104, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 41
  store i8 114, ptr %str_char_41, align 1
  %str_char_42 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 42
  store i8 105, ptr %str_char_42, align 1
  %str_char_43 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 43
  store i8 110, ptr %str_char_43, align 1
  %str_char_44 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 44
  store i8 107, ptr %str_char_44, align 1
  %str_char_45 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 45
  store i8 32, ptr %str_char_45, align 1
  %str_char_46 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 46
  store i8 99, ptr %str_char_46, align 1
  %str_char_47 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 47
  store i8 121, ptr %str_char_47, align 1
  %str_char_48 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 48
  store i8 99, ptr %str_char_48, align 1
  %str_char_49 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 49
  store i8 108, ptr %str_char_49, align 1
  %str_char_50 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 50
  store i8 101, ptr %str_char_50, align 1
  %str_char_51 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 51
  store i8 115, ptr %str_char_51, align 1
  %str_char_52 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 52
  store i8 41, ptr %str_char_52, align 1
  %str_char_53 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 53
  store i8 32, ptr %str_char_53, align 1
  %str_char_54 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 54
  store i8 45, ptr %str_char_54, align 1
  %str_char_55 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 55
  store i8 45, ptr %str_char_55, align 1
  %str_char_56 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 56
  store i8 10, ptr %str_char_56, align 1
  %str_char_57 = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 57
  store i8 0, ptr %str_char_57, align 1
  %arg0_decay = getelementptr [58 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  call void @standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1(ptr %rng)
  %.75 = sext i32 1000 to i64
  %.77 = sext i32 64 to i64
  %.78 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.77)
  %.80 = sext i32 64 to i64
  %.83 = zext i32 0 to i64
  %.84 = icmp ne i64 %.78, %.83
  %str_stack.1 = alloca [36 x i8], align 1
  %str_char_0.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 105, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 110, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 105, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 116, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 105, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 97, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 108, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 32, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 97, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 108, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 108, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 111, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 99, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 32, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 102, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 111, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 114, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 32, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 102, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 114, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 101, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 97, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 108, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 108, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 111, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 99, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 32, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 112, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 114, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 101, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 115, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 115, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 117, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 114, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 101, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 0, ptr %str_char_35.1, align 1
  %arg1_decay = getelementptr [36 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.84, ptr %arg1_decay)
  %int_to_ptr = inttoptr i64 %.78 to ptr
  %.123 = sext i32 0 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %j.0 = phi i64 [ %.123, %entry ], [ %.131, %while.body ]
  %.126 = icmp ult i64 %j.0, %.80
  br i1 %.126, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.128 = trunc i32 90 to i8
  %.129 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %j.0
  store i8 %.128, ptr %.129, align 1
  %.131 = add i64 %j.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.end.3
  %ok.0 = phi i1 [ %ok.22, %while.end.3 ], [ true, %while.cond ]
  %prev_sz.0 = phi i64 [ %.144, %while.end.3 ], [ %.80, %while.cond ]
  %i.0 = phi i64 [ %.192, %while.end.3 ], [ 0, %while.cond ]
  %ptr.0 = phi i64 [ %.152, %while.end.3 ], [ %.78, %while.cond ]
  %.135 = icmp ult i64 %i.0, %.75
  br i1 %.135, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.137 = call i32 @standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32(ptr %rng)
  %.139 = zext i32 %.137 to i64
  %.141 = zext i32 8192 to i64
  %.142 = urem i64 %.139, %.141
  %.143 = zext i32 1 to i64
  %.144 = add i64 %.142, %.143
  %.147 = icmp ult i64 %.144, %prev_sz.0
  %.144.prev_sz.0 = select i1 %.147, i64 %.144, i64 %prev_sz.0
  %.152 = call i64 @standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr.0, i64 %.144)
  %.154 = zext i32 0 to i64
  %.155 = icmp eq i64 %.152, %.154
  br i1 %.155, label %while.end.1, label %ifcont.1

while.end.1:                                      ; preds = %while.end.2, %while.body.1, %while.cond.1
  %ok.11 = phi i1 [ %ok.0, %while.cond.1 ], [ false, %while.body.1 ], [ %ok.22, %while.end.2 ]
  %str_stack.2 = alloca [56 x i8], align 1
  %str_char_0.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 49, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 48, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 48, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 48, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 32, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 102, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 114, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 101, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 97, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 108, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 108, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 111, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 99, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 32, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 103, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 114, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 111, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 119, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 47, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 115, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 104, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 114, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 105, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 110, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 107, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 32, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 99, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 121, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 99, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 108, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 101, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 115, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 58, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 32, ptr %str_char_33.2, align 1
  %str_char_34.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 100, ptr %str_char_34.2, align 1
  %str_char_35.2 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 97, ptr %str_char_35.2, align 1
  %str_char_36.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 36
  store i8 116, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 37
  store i8 97, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 38
  store i8 32, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 39
  store i8 97, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 40
  store i8 108, ptr %str_char_40.1, align 1
  %str_char_41.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 41
  store i8 119, ptr %str_char_41.1, align 1
  %str_char_42.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 42
  store i8 97, ptr %str_char_42.1, align 1
  %str_char_43.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 43
  store i8 121, ptr %str_char_43.1, align 1
  %str_char_44.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 44
  store i8 115, ptr %str_char_44.1, align 1
  %str_char_45.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 45
  store i8 32, ptr %str_char_45.1, align 1
  %str_char_46.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 46
  store i8 112, ptr %str_char_46.1, align 1
  %str_char_47.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 47
  store i8 114, ptr %str_char_47.1, align 1
  %str_char_48.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 48
  store i8 101, ptr %str_char_48.1, align 1
  %str_char_49.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 49
  store i8 115, ptr %str_char_49.1, align 1
  %str_char_50.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 50
  store i8 101, ptr %str_char_50.1, align 1
  %str_char_51.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 51
  store i8 114, ptr %str_char_51.1, align 1
  %str_char_52.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 52
  store i8 118, ptr %str_char_52.1, align 1
  %str_char_53.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 53
  store i8 101, ptr %str_char_53.1, align 1
  %str_char_54.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 54
  store i8 100, ptr %str_char_54.1, align 1
  %str_char_55.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 55
  store i8 0, ptr %str_char_55.1, align 1
  %arg1_decay.1 = getelementptr [56 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.11, ptr %arg1_decay.1)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr.0)
  ret void

ifcont.1:                                         ; preds = %while.body.1
  %int_to_ptr.1 = inttoptr i64 %.152 to ptr
  %.161 = sext i32 0 to i64
  br label %while.cond.2

while.cond.2:                                     ; preds = %ifcont.2, %ifcont.1
  %j.13 = phi i64 [ %.161, %ifcont.1 ], [ %.172, %ifcont.2 ]
  %.164 = icmp ult i64 %j.13, %.144.prev_sz.0
  br i1 %.164, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc = trunc i64 %j.13 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.166 = trunc i32 90 to i8
  %.167 = icmp ne i8 %ptr_load, %.166
  br i1 %.167, label %while.end.2, label %ifcont.2

while.end.2:                                      ; preds = %while.body.2, %while.cond.2
  %ok.22 = phi i1 [ %ok.0, %while.cond.2 ], [ false, %while.body.2 ]
  %.175 = xor i1 %ok.22, true
  br i1 %.175, label %while.end.1, label %ifcont.3

ifcont.2:                                         ; preds = %while.body.2
  %.172 = add i64 %j.13, 1
  br label %while.cond.2

ifcont.3:                                         ; preds = %while.end.2
  %.179 = sext i32 0 to i64
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %ifcont.3
  %j.24 = phi i64 [ %.179, %ifcont.3 ], [ %.187, %while.body.3 ]
  %.182 = icmp ult i64 %j.24, %.144
  br i1 %.182, label %while.body.3, label %while.end.3

while.body.3:                                     ; preds = %while.cond.3
  %.184 = trunc i32 90 to i8
  %.185 = getelementptr inbounds i8, ptr %int_to_ptr.1, i64 %j.24
  store i8 %.184, ptr %.185, align 1
  %.187 = add i64 %j.24, 1
  br label %while.cond.3

while.end.3:                                      ; preds = %while.cond.3
  %.192 = add i64 %i.0, 1
  br label %while.cond.1
}

define void @test_slab_exhaustion_recovery__0__ret_voidE1() {
entry:
  %ptrs = alloca [256 x i64], align 8
  %memset_ptr = bitcast ptr %ptrs to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 2048, i1 false)
  %str_stack = alloca [36 x i8], align 1
  %str_char_0 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 0
  store i8 45, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 1
  store i8 45, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 2
  store i8 32, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 3
  store i8 115, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 4
  store i8 108, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 5
  store i8 97, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 6
  store i8 98, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 7
  store i8 32, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 9
  store i8 120, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 10
  store i8 104, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 11
  store i8 97, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 12
  store i8 117, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 13
  store i8 115, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 14
  store i8 116, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 15
  store i8 105, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 16
  store i8 111, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 17
  store i8 110, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 18
  store i8 32, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 19
  store i8 97, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 20
  store i8 110, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 21
  store i8 100, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 22
  store i8 32, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 23
  store i8 114, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 24
  store i8 101, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 25
  store i8 99, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 26
  store i8 111, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 27
  store i8 118, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 28
  store i8 101, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 29
  store i8 114, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 30
  store i8 121, ptr %str_char_30, align 1
  %str_char_31 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 31
  store i8 32, ptr %str_char_31, align 1
  %str_char_32 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 32
  store i8 45, ptr %str_char_32, align 1
  %str_char_33 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 33
  store i8 45, ptr %str_char_33, align 1
  %str_char_34 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 34
  store i8 10, ptr %str_char_34, align 1
  %str_char_35 = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 35
  store i8 0, ptr %str_char_35, align 1
  %arg0_decay = getelementptr [36 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  %.48 = sext i32 256 to i64
  %.50 = sext i32 0 to i64
  %.53 = sext i32 393216 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.cond.2, %entry
  %ok.0 = phi i1 [ true, %entry ], [ %ok.13, %while.cond.2 ]
  %total.0 = phi i64 [ %.50, %entry ], [ %total.12, %while.cond.2 ]
  %.56 = icmp ult i64 %total.0, %.53
  %spec.select = select i1 %.56, i1 %ok.0, i1 false
  br i1 %spec.select, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.60 = sext i32 0 to i64
  br label %while.cond.1

while.end:                                        ; preds = %while.cond
  %str_stack.1 = alloca [42 x i8], align 1
  %str_char_0.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 54, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 77, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 66, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 32, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 115, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 108, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 97, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 98, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 32, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 101, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 120, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 104, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 97, ptr %str_char_12.1, align 1
  %str_char_13.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 117, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 115, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 116, ptr %str_char_15.1, align 1
  %str_char_16.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 16
  store i8 105, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 17
  store i8 111, ptr %str_char_17.1, align 1
  %str_char_18.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 18
  store i8 110, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 19
  store i8 58, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 20
  store i8 32, ptr %str_char_20.1, align 1
  %str_char_21.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 21
  store i8 97, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 22
  store i8 108, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 23
  store i8 108, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 24
  store i8 32, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 25
  store i8 97, ptr %str_char_25.1, align 1
  %str_char_26.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 26
  store i8 108, ptr %str_char_26.1, align 1
  %str_char_27.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 27
  store i8 108, ptr %str_char_27.1, align 1
  %str_char_28.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 28
  store i8 111, ptr %str_char_28.1, align 1
  %str_char_29.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 29
  store i8 99, ptr %str_char_29.1, align 1
  %str_char_30.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 30
  store i8 115, ptr %str_char_30.1, align 1
  %str_char_31.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 31
  store i8 32, ptr %str_char_31.1, align 1
  %str_char_32.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 32
  store i8 115, ptr %str_char_32.1, align 1
  %str_char_33.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 33
  store i8 117, ptr %str_char_33.1, align 1
  %str_char_34.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 34
  store i8 99, ptr %str_char_34.1, align 1
  %str_char_35.1 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 35
  store i8 99, ptr %str_char_35.1, align 1
  %str_char_36 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 36
  store i8 101, ptr %str_char_36, align 1
  %str_char_37 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 37
  store i8 101, ptr %str_char_37, align 1
  %str_char_38 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 38
  store i8 100, ptr %str_char_38, align 1
  %str_char_39 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 39
  store i8 101, ptr %str_char_39, align 1
  %str_char_40 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 40
  store i8 100, ptr %str_char_40, align 1
  %str_char_41 = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 41
  store i8 0, ptr %str_char_41, align 1
  %arg1_decay = getelementptr [42 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %ok.0, ptr %arg1_decay)
  call void @standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1()
  %str_stack.2 = alloca [36 x i8], align 1
  %str_char_0.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 99, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 111, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 97, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 108, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 101, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 115, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 99, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 101, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 32, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 97, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 102, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 116, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 101, ptr %str_char_12.2, align 1
  %str_char_13.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 13
  store i8 114, ptr %str_char_13.2, align 1
  %str_char_14.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 14
  store i8 32, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 15
  store i8 101, ptr %str_char_15.2, align 1
  %str_char_16.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 16
  store i8 120, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 17
  store i8 104, ptr %str_char_17.2, align 1
  %str_char_18.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 18
  store i8 97, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 19
  store i8 117, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 20
  store i8 115, ptr %str_char_20.2, align 1
  %str_char_21.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 21
  store i8 116, ptr %str_char_21.2, align 1
  %str_char_22.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 22
  store i8 105, ptr %str_char_22.2, align 1
  %str_char_23.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 23
  store i8 111, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 24
  store i8 110, ptr %str_char_24.2, align 1
  %str_char_25.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 25
  store i8 58, ptr %str_char_25.2, align 1
  %str_char_26.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 26
  store i8 32, ptr %str_char_26.2, align 1
  %str_char_27.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 27
  store i8 110, ptr %str_char_27.2, align 1
  %str_char_28.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 28
  store i8 111, ptr %str_char_28.2, align 1
  %str_char_29.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 29
  store i8 32, ptr %str_char_29.2, align 1
  %str_char_30.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 30
  store i8 99, ptr %str_char_30.2, align 1
  %str_char_31.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 31
  store i8 114, ptr %str_char_31.2, align 1
  %str_char_32.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 32
  store i8 97, ptr %str_char_32.2, align 1
  %str_char_33.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 33
  store i8 115, ptr %str_char_33.2, align 1
  %str_char_34.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 34
  store i8 104, ptr %str_char_34.2, align 1
  %str_char_35.2 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 35
  store i8 0, ptr %str_char_35.2, align 1
  %arg1_decay.1 = getelementptr [36 x i8], ptr %str_stack.2, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 true, ptr %arg1_decay.1)
  %.174 = sext i32 64 to i64
  %.175 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.174)
  %not_zero = icmp ne i64 %.175, 0
  %not_null_result = zext i1 %not_zero to i8
  %str_stack.3 = alloca [41 x i8], align 1
  %str_char_0.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 97, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 108, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 108, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 111, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 99, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 32, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 97, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 102, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 116, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 101, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 114, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 32, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 101, ptr %str_char_12.3, align 1
  %str_char_13.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 13
  store i8 120, ptr %str_char_13.3, align 1
  %str_char_14.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 14
  store i8 104, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 15
  store i8 97, ptr %str_char_15.3, align 1
  %str_char_16.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 16
  store i8 117, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 17
  store i8 115, ptr %str_char_17.3, align 1
  %str_char_18.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 18
  store i8 116, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 19
  store i8 105, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 20
  store i8 111, ptr %str_char_20.3, align 1
  %str_char_21.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 21
  store i8 110, ptr %str_char_21.3, align 1
  %str_char_22.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 22
  store i8 43, ptr %str_char_22.3, align 1
  %str_char_23.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 23
  store i8 99, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 24
  store i8 111, ptr %str_char_24.3, align 1
  %str_char_25.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 25
  store i8 97, ptr %str_char_25.3, align 1
  %str_char_26.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 26
  store i8 108, ptr %str_char_26.3, align 1
  %str_char_27.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 27
  store i8 101, ptr %str_char_27.3, align 1
  %str_char_28.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 28
  store i8 115, ptr %str_char_28.3, align 1
  %str_char_29.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 29
  store i8 99, ptr %str_char_29.3, align 1
  %str_char_30.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 30
  store i8 101, ptr %str_char_30.3, align 1
  %str_char_31.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 31
  store i8 32, ptr %str_char_31.3, align 1
  %str_char_32.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 32
  store i8 115, ptr %str_char_32.3, align 1
  %str_char_33.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 33
  store i8 117, ptr %str_char_33.3, align 1
  %str_char_34.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 34
  store i8 99, ptr %str_char_34.3, align 1
  %str_char_35.3 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 35
  store i8 99, ptr %str_char_35.3, align 1
  %str_char_36.1 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 36
  store i8 101, ptr %str_char_36.1, align 1
  %str_char_37.1 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 37
  store i8 101, ptr %str_char_37.1, align 1
  %str_char_38.1 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 38
  store i8 100, ptr %str_char_38.1, align 1
  %str_char_39.1 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 39
  store i8 115, ptr %str_char_39.1, align 1
  %str_char_40.1 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 40
  store i8 0, ptr %str_char_40.1, align 1
  %.218 = trunc i8 %not_null_result to i1
  %arg1_decay.2 = getelementptr [41 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @check__2__boolE1__byteE1_ptr1__ret_voidE1(i1 %.218, ptr %arg1_decay.2)
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %.175)
  ret void

while.cond.1:                                     ; preds = %ifcont, %while.body
  %total.12 = phi i64 [ %total.0, %while.body ], [ %.80, %ifcont ]
  %i.0 = phi i64 [ %.60, %while.body ], [ %.78, %ifcont ]
  %.63 = icmp ult i64 %i.0, %.48
  %.65 = icmp ult i64 %total.12, %.53
  %spec.select4 = select i1 %.63, i1 %.65, i1 false
  br i1 %spec.select4, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.68 = sext i32 16 to i64
  %.69 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.68)
  %.70 = getelementptr inbounds [256 x i64], ptr %ptrs, i32 0, i64 %i.0
  store i64 %.69, ptr %.70, align 8
  %idx_trunc = trunc i64 %i.0 to i32
  %array_gep = getelementptr inbounds [256 x i64], ptr %ptrs, i32 0, i32 %idx_trunc
  %array_load = load i64, ptr %array_gep, align 8
  %.72 = zext i32 0 to i64
  %.73 = icmp eq i64 %array_load, %.72
  br i1 %.73, label %while.end.1, label %ifcont

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %ok.13 = phi i1 [ %ok.0, %while.cond.1 ], [ false, %while.body.1 ]
  %.84 = sext i32 0 to i64
  br label %while.cond.2

ifcont:                                           ; preds = %while.body.1
  %.78 = add i64 %i.0, 1
  %.80 = add i64 %total.12, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %i.11 = phi i64 [ %.84, %while.end.1 ], [ %.90, %while.body.2 ]
  %.87 = icmp ult i64 %i.11, %i.0
  br i1 %.87, label %while.body.2, label %while.cond

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.1 = trunc i64 %i.11 to i32
  %array_gep.1 = getelementptr inbounds [256 x i64], ptr %ptrs, i32 0, i32 %idx_trunc.1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %array_load.1)
  %.90 = add i64 %i.11, 1
  br label %while.cond.2
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

attributes #0 = { alwaysinline }
attributes #1 = { naked noinline noreturn }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
