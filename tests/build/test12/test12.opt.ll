; ModuleID = 'build\test12\test12.ll'
source_filename = "build\\test12\\test12.ll"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%Exception = type { ptr, i32, %ExceptionState }
%ExceptionState = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
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
@SYSTEM_INFO_PARTIAL.TLD = internal constant { i32, i32, [10 x { i32, i32, i32 }] } { i32 384, i32 10, [10 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 32, i32 32 }, { i32, i32, i32 } { i32 288, i32 32, i32 32 }, { i32, i32, i32 } { i32 320, i32 32, i32 32 }, { i32, i32, i32 } { i32 352, i32 16, i32 16 }, { i32, i32, i32 } { i32 368, i32 16, i32 16 }] }
@BlockEntry.TLD = internal constant { i32, i32, [4 x { i32, i32, i32 }] } { i32 256, i32 4, [4 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }] }
@Slab.TLD = internal constant { i32, i32, [5 x { i32, i32, i32 }] } { i32 320, i32 5, [5 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }] }
@FreeNode.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 64, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }] }
@RingAllocResult.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 65, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 1, i32 1 }] }
@ExceptionState.TLD = internal constant { i32, i32, [18 x { i32, i32, i32 }] } { i32 1152, i32 18, [18 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 64, i32 64 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 64, i32 64 }, { i32, i32, i32 } { i32 768, i32 64, i32 64 }, { i32, i32, i32 } { i32 832, i32 64, i32 64 }, { i32, i32, i32 } { i32 896, i32 64, i32 64 }, { i32, i32, i32 } { i32 960, i32 64, i32 64 }, { i32, i32, i32 } { i32 1024, i32 64, i32 64 }, { i32, i32, i32 } { i32 1088, i32 64, i32 64 }] }
@Exception.TLD = internal constant { i32, i32, [3 x { i32, i32, i32 }] } { i32 1192, i32 3, [3 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 8, i32 8 }, { i32, i32, i32 } { i32 8, i32 32, i32 32 }, { i32, i32, i32 } { i32 40, i32 1152, i32 64 }] }
@WinExceptionRecord.TLD = internal constant { i32, i32, [6 x { i32, i32, i32 }] } { i32 1184, i32 6, [6 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 32, i32 32 }, { i32, i32, i32 } { i32 224, i32 960, i32 64 }] }
@WinContext.TLD = internal constant { i32, i32, [38 x { i32, i32, i32 }] } { i32 2048, i32 38, [38 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 32, i32 32 }, { i32, i32, i32 } { i32 416, i32 32, i32 32 }, { i32, i32, i32 } { i32 448, i32 16, i32 16 }, { i32, i32, i32 } { i32 464, i32 16, i32 16 }, { i32, i32, i32 } { i32 480, i32 16, i32 16 }, { i32, i32, i32 } { i32 496, i32 16, i32 16 }, { i32, i32, i32 } { i32 512, i32 16, i32 16 }, { i32, i32, i32 } { i32 528, i32 16, i32 16 }, { i32, i32, i32 } { i32 544, i32 32, i32 32 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 64, i32 64 }, { i32, i32, i32 } { i32 768, i32 64, i32 64 }, { i32, i32, i32 } { i32 832, i32 64, i32 64 }, { i32, i32, i32 } { i32 896, i32 64, i32 64 }, { i32, i32, i32 } { i32 960, i32 64, i32 64 }, { i32, i32, i32 } { i32 1024, i32 64, i32 64 }, { i32, i32, i32 } { i32 1088, i32 64, i32 64 }, { i32, i32, i32 } { i32 1152, i32 64, i32 64 }, { i32, i32, i32 } { i32 1216, i32 64, i32 64 }, { i32, i32, i32 } { i32 1280, i32 64, i32 64 }, { i32, i32, i32 } { i32 1344, i32 64, i32 64 }, { i32, i32, i32 } { i32 1408, i32 64, i32 64 }, { i32, i32, i32 } { i32 1472, i32 64, i32 64 }, { i32, i32, i32 } { i32 1536, i32 64, i32 64 }, { i32, i32, i32 } { i32 1600, i32 64, i32 64 }, { i32, i32, i32 } { i32 1664, i32 64, i32 64 }, { i32, i32, i32 } { i32 1728, i32 64, i32 64 }, { i32, i32, i32 } { i32 1792, i32 64, i32 64 }, { i32, i32, i32 } { i32 1856, i32 64, i32 64 }, { i32, i32, i32 } { i32 1920, i32 64, i32 64 }, { i32, i32, i32 } { i32 1984, i32 64, i32 64 }] }
@WinExceptionPointers.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 128, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }] }
@FluxJmpBuf.TLD = internal constant { i32, i32, [12 x { i32, i32, i32 }] } { i32 736, i32 12, [12 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 64, i32 64 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 32, i32 32 }] }
@timespec.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 128, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }] }
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

define i64 @standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size) {
entry:
  %.4 = zext i32 4096 to i64
  %.5 = icmp ugt i64 %size, %.4
  %cond = icmp eq i1 %.5, true
  br i1 %cond, label %switch_case_0, label %switch_default

common.ret:                                       ; preds = %switch_default, %switch_case_0
  %common.ret.op = phi i64 [ %.7, %switch_case_0 ], [ %.91, %switch_default ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.7 = sext i32 9 to i64
  br label %common.ret

switch_default:                                   ; preds = %entry
  %.10 = zext i32 1 to i64
  %.11 = sub i64 %size, %.10
  %.13 = zext i32 1 to i64
  %.14 = lshr i64 %.11, %.13
  %.15 = or i64 %.11, %.14
  %.17 = zext i32 2 to i64
  %.18 = lshr i64 %.15, %.17
  %.19 = or i64 %.15, %.18
  %.21 = zext i32 4 to i64
  %.22 = lshr i64 %.19, %.21
  %.23 = or i64 %.19, %.22
  %.25 = zext i32 8 to i64
  %.26 = lshr i64 %.23, %.25
  %.27 = or i64 %.23, %.26
  %.29 = zext i32 1 to i64
  %.30 = add i64 %.27, %.29
  %.32 = zext i32 16 to i64
  %.33 = icmp ult i64 %.30, %.32
  %cond6 = icmp eq i1 %.33, true
  %.35 = sext i32 16 to i64
  %s.0 = select i1 %cond6, i64 %.35, i64 %.30
  %.41 = zext i32 8 to i64
  %.42 = lshr i64 %s.0, %.41
  %.43 = zext i32 0 to i64
  %.44 = icmp ne i64 %.42, %.43
  %cond7 = icmp eq i1 %.44, true
  %.46 = zext i32 8 to i64
  %.47 = add i64 0, %.46
  %.49 = zext i32 8 to i64
  %.50 = lshr i64 %s.0, %.49
  %bit.0 = select i1 %cond7, i64 %.47, i64 0
  %tmp.0 = select i1 %cond7, i64 %.50, i64 %s.0
  %.54 = zext i32 4 to i64
  %.55 = lshr i64 %tmp.0, %.54
  %.56 = zext i32 0 to i64
  %.57 = icmp ne i64 %.55, %.56
  %cond8 = icmp eq i1 %.57, true
  %.59 = zext i32 4 to i64
  %.60 = add i64 %bit.0, %.59
  %.62 = zext i32 4 to i64
  %.63 = lshr i64 %tmp.0, %.62
  %bit.13 = select i1 %cond8, i64 %.60, i64 %bit.0
  %tmp.11 = select i1 %cond8, i64 %.63, i64 %tmp.0
  %.67 = zext i32 2 to i64
  %.68 = lshr i64 %tmp.11, %.67
  %.69 = zext i32 0 to i64
  %.70 = icmp ne i64 %.68, %.69
  %cond9 = icmp eq i1 %.70, true
  %.72 = zext i32 2 to i64
  %.73 = add i64 %bit.13, %.72
  %.75 = zext i32 2 to i64
  %.76 = lshr i64 %tmp.11, %.75
  %bit.24 = select i1 %cond9, i64 %.73, i64 %bit.13
  %tmp.22 = select i1 %cond9, i64 %.76, i64 %tmp.11
  %.80 = zext i32 1 to i64
  %.81 = lshr i64 %tmp.22, %.80
  %.82 = zext i32 0 to i64
  %.83 = icmp ne i64 %.81, %.82
  %cond10 = icmp eq i1 %.83, true
  %.85 = zext i32 1 to i64
  %.86 = add i64 %bit.24, %.85
  %bit.35 = select i1 %cond10, i64 %.86, i64 %bit.24
  %.90 = zext i32 4 to i64
  %.91 = sub i64 %bit.35, %.90
  br label %common.ret
}

define i64 @standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %cls) {
entry:
  switch i64 %cls, label %switch_default [
    i64 0, label %switch_case_0
    i64 1, label %switch_case_1
    i64 2, label %switch_case_2
    i64 3, label %switch_case_3
    i64 4, label %switch_case_4
    i64 5, label %switch_case_5
    i64 6, label %switch_case_6
    i64 7, label %switch_case_7
    i64 8, label %switch_case_8
  ]

common.ret:                                       ; preds = %switch_default, %switch_case_8, %switch_case_7, %switch_case_6, %switch_case_5, %switch_case_4, %switch_case_3, %switch_case_2, %switch_case_1, %switch_case_0
  %common.ret.op = phi i64 [ %.5, %switch_case_0 ], [ %.7, %switch_case_1 ], [ %.9, %switch_case_2 ], [ %.11, %switch_case_3 ], [ %.13, %switch_case_4 ], [ %.15, %switch_case_5 ], [ %.17, %switch_case_6 ], [ %.19, %switch_case_7 ], [ %.21, %switch_case_8 ], [ %.23, %switch_default ]
  ret i64 %common.ret.op

switch_case_0:                                    ; preds = %entry
  %.5 = sext i32 16 to i64
  br label %common.ret

switch_case_1:                                    ; preds = %entry
  %.7 = sext i32 32 to i64
  br label %common.ret

switch_case_2:                                    ; preds = %entry
  %.9 = sext i32 64 to i64
  br label %common.ret

switch_case_3:                                    ; preds = %entry
  %.11 = sext i32 128 to i64
  br label %common.ret

switch_case_4:                                    ; preds = %entry
  %.13 = sext i32 256 to i64
  br label %common.ret

switch_case_5:                                    ; preds = %entry
  %.15 = sext i32 512 to i64
  br label %common.ret

switch_case_6:                                    ; preds = %entry
  %.17 = sext i32 1024 to i64
  br label %common.ret

switch_case_7:                                    ; preds = %entry
  %.19 = sext i32 2048 to i64
  br label %common.ret

switch_case_8:                                    ; preds = %entry
  %.21 = sext i32 4096 to i64
  br label %common.ret

switch_default:                                   ; preds = %entry
  %.23 = sext i32 4096 to i64
  br label %common.ret
}

define ptr @standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1(i64 %cls) {
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

define void @standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1(i64 %cls, ptr %node) {
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

define i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr, i64 %cap) {
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

common.ret:                                       ; preds = %entry, %while.end.2
  %common.ret.op = phi i1 [ true, %while.end.2 ], [ false, %entry ]
  ret i1 %common.ret.op

switch_default:                                   ; preds = %entry
  %int_to_ptr = inttoptr i64 %.8 to ptr
  br label %while.cond

while.cond:                                       ; preds = %while.body, %switch_default
  %i.0 = phi i64 [ 0, %switch_default ], [ %.23, %while.body ]
  %.19 = icmp ult i64 %i.0, %.6
  br i1 %.19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.21 = getelementptr inbounds i8, ptr %int_to_ptr, i64 %i.0
  store i8 0, ptr %.21, align 1
  %.23 = add i64 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %int_to_ptr.1 = inttoptr i64 %.8 to ptr
  %.27 = sext i32 0 to i64
  store i64 %.27, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %while.cond.1

while.cond.1:                                     ; preds = %switch_merge.1, %while.end
  %j.0 = phi i64 [ 0, %while.end ], [ %.38, %switch_merge.1 ]
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.30 = icmp ult i64 %j.0, %g_table_cap.1
  br i1 %.30, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %g_table.1 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %idx_trunc.1 = trunc i64 %j.0 to i32
  %ptr_gep.1 = getelementptr inbounds %BlockEntry, ptr %g_table.1, i32 %idx_trunc.1
  %key_ptr = getelementptr inbounds %BlockEntry, ptr %ptr_gep.1, i32 0, i32 0
  %key = load i64, ptr %key_ptr, align 8
  %not_zero = icmp ne i64 %key, 0
  %not_null_result = zext i1 %not_zero to i8
  %cond16 = icmp eq i8 %not_null_result, 1
  br i1 %cond16, label %switch_case_0.1, label %switch_merge.1

while.end.1:                                      ; preds = %while.cond.1
  %g_table.10 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %ptr_to_int = ptrtoint ptr %g_table.10 to i64
  %.42 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %ptr_to_int, i64 %.3)
  br label %while.cond.2

switch_merge.1:                                   ; preds = %while.body.1, %switch_case_0.1
  %.38 = add i64 %j.0, 1
  br label %while.cond.1

switch_case_0.1:                                  ; preds = %while.body.1
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
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %int_to_ptr.1, i64 %.3, i64 %key.1, i64 %size, i64 %kind, i64 %slab)
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.34 = add i64 %g_table_count, 1
  store i64 %.34, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %switch_merge.1

while.cond.2:                                     ; preds = %switch_default.11, %while.end.1
  %rm_idx.0 = phi i64 [ %.42, %while.end.1 ], [ %.138, %switch_default.11 ]
  %rm_found.0 = phi i1 [ false, %while.end.1 ], [ %rm_found.14, %switch_default.11 ]
  %idx_trunc.11 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.11 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.11
  %key_ptr.2 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.11, i32 0, i32 0
  %key.2 = load i64, ptr %key_ptr.2, align 8
  %not_zero.1 = icmp ne i64 %key.2, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %tobool = icmp ne i8 %not_null_result.1, 0
  br i1 %tobool, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %idx_trunc.13 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.13 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.13
  %key_ptr.3 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.13, i32 0, i32 0
  %key.3 = load i64, ptr %key_ptr.3, align 8
  %.52 = icmp eq i64 %key.3, %ptr_to_int
  %cond6 = icmp eq i1 %.52, true
  br i1 %cond6, label %switch_case_0.2, label %switch_merge.2

while.end.2:                                      ; preds = %switch_merge.2, %while.cond.2
  %g_table.11 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %ptr_to_int.1 = ptrtoint ptr %g_table.11 to i64
  %g_table_slab_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_slab_cap, align 8
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.1, i64 %g_table_slab_cap)
  store ptr %int_to_ptr.1, ptr @standard__memory__allocators__stdheap__g_table, align 8
  store i64 %.3, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  store i64 %.6, ptr @standard__memory__allocators__stdheap__g_table_slab_cap, align 8
  %g_table.12 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %g_table_cap.2 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.145 = sext i32 2 to i64
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %g_table.12, i64 %g_table_cap.2, i64 %.8, i64 %.6, i64 %.145, i64 %.8)
  %g_table_count.2 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.147 = add i64 %g_table_count.2, 1
  store i64 %.147, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %common.ret

switch_merge.2:                                   ; preds = %while.cond.3, %while.body.2
  %rm_found.14 = phi i1 [ %rm_found.0, %while.body.2 ], [ true, %while.cond.3 ]
  %cond7 = icmp eq i1 %rm_found.14, true
  br i1 %cond7, label %while.end.2, label %switch_default.11

switch_case_0.2:                                  ; preds = %while.body.2
  %idx_trunc.14 = trunc i64 %rm_idx.0 to i32
  %ptr_gep.14 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.14
  %.54 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.14, i32 0, i32 0
  %.55 = sext i32 0 to i64
  store i64 %.55, ptr %.54, align 8
  %g_table_count.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.57 = sub i64 %g_table_count.1, 1
  store i64 %.57, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.60 = zext i32 1 to i64
  %.61 = add i64 %rm_idx.0, %.60
  %.62 = zext i32 1 to i64
  %.63 = sub i64 %.3, %.62
  %.64 = and i64 %.61, %.63
  br label %while.cond.3

while.cond.3:                                     ; preds = %switch_merge.10, %switch_case_0.2
  %rm_hole.0 = phi i64 [ %rm_idx.0, %switch_case_0.2 ], [ %rm_hole.15, %switch_merge.10 ]
  %rm_next.0 = phi i64 [ %.64, %switch_case_0.2 ], [ %.125, %switch_merge.10 ]
  %idx_trunc.16 = trunc i64 %rm_next.0 to i32
  %ptr_gep.16 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.16
  %key_ptr.4 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.16, i32 0, i32 0
  %key.4 = load i64, ptr %key_ptr.4, align 8
  %not_zero.2 = icmp ne i64 %key.4, 0
  %not_null_result.2 = zext i1 %not_zero.2 to i8
  %tobool.1 = icmp ne i8 %not_null_result.2, 0
  br i1 %tobool.1, label %while.body.3, label %switch_merge.2

while.body.3:                                     ; preds = %while.cond.3
  %idx_trunc.18 = trunc i64 %rm_next.0 to i32
  %ptr_gep.18 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.18
  %key_ptr.5 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.18, i32 0, i32 0
  %key.5 = load i64, ptr %key_ptr.5, align 8
  %.68 = call i64 @standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %key.5, i64 %.3)
  %.70 = icmp ult i64 %rm_hole.0, %rm_next.0
  %cond8 = icmp eq i1 %.70, true
  br i1 %cond8, label %switch_case_0.3, label %switch_default.3

switch_merge.3:                                   ; preds = %switch_merge.7, %switch_merge.4
  %rm_shift.0 = phi i1 [ %., %switch_merge.4 ], [ %.18, %switch_merge.7 ]
  %cond12 = icmp eq i1 %rm_shift.0, true
  br i1 %cond12, label %switch_case_0.10, label %switch_merge.10

switch_case_0.3:                                  ; preds = %while.body.3
  %.72 = icmp ugt i64 %.68, %rm_hole.0
  %cond13 = icmp eq i1 %.72, true
  br i1 %cond13, label %switch_case_0.4, label %switch_merge.4

switch_default.3:                                 ; preds = %while.body.3
  %.89 = icmp ugt i64 %.68, %rm_hole.0
  %cond9 = icmp eq i1 %.89, true
  br i1 %cond9, label %switch_merge.7, label %switch_default.7

switch_merge.4:                                   ; preds = %switch_case_0.4, %switch_case_0.3
  %rm_in_range.0 = phi i1 [ false, %switch_case_0.3 ], [ %.17, %switch_case_0.4 ]
  %cond14 = icmp eq i1 %rm_in_range.0, true
  %. = select i1 %cond14, i1 false, i1 true
  br label %switch_merge.3

switch_case_0.4:                                  ; preds = %switch_case_0.3
  %.74 = icmp ule i64 %.68, %rm_next.0
  %cond15 = icmp eq i1 %.74, true
  %.17 = select i1 %cond15, i1 true, i1 false
  br label %switch_merge.4

switch_merge.7:                                   ; preds = %switch_default.7, %switch_default.3
  %rm_in_range.22 = phi i1 [ true, %switch_default.3 ], [ %.20, %switch_default.7 ]
  %cond11 = icmp eq i1 %rm_in_range.22, true
  %.18 = select i1 %cond11, i1 false, i1 true
  br label %switch_merge.3

switch_default.7:                                 ; preds = %switch_default.3
  %.93 = icmp ule i64 %.68, %rm_next.0
  %cond10 = icmp eq i1 %.93, true
  %.20 = select i1 %cond10, i1 true, i1 false
  br label %switch_merge.7

switch_merge.10:                                  ; preds = %switch_merge.3, %switch_case_0.10
  %rm_hole.15 = phi i64 [ %rm_next.0, %switch_case_0.10 ], [ %rm_hole.0, %switch_merge.3 ]
  %.121 = zext i32 1 to i64
  %.122 = add i64 %rm_next.0, %.121
  %.123 = zext i32 1 to i64
  %.124 = sub i64 %.3, %.123
  %.125 = and i64 %.122, %.124
  br label %while.cond.3

switch_case_0.10:                                 ; preds = %switch_merge.3
  %idx_trunc.20 = trunc i64 %rm_next.0 to i32
  %ptr_gep.20 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.20
  %key_ptr.6 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.20, i32 0, i32 0
  %key.6 = load i64, ptr %key_ptr.6, align 8
  %idx_trunc.21 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.21 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.21
  %.107 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.21, i32 0, i32 0
  store i64 %key.6, ptr %.107, align 8
  %idx_trunc.23 = trunc i64 %rm_next.0 to i32
  %ptr_gep.23 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.23
  %size_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.23, i32 0, i32 1
  %size.1 = load i64, ptr %size_ptr.1, align 8
  %idx_trunc.24 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.24 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.24
  %.109 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.24, i32 0, i32 1
  store i64 %size.1, ptr %.109, align 8
  %idx_trunc.26 = trunc i64 %rm_next.0 to i32
  %ptr_gep.26 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.26
  %kind_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.26, i32 0, i32 2
  %kind.1 = load i64, ptr %kind_ptr.1, align 8
  %idx_trunc.27 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.27 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.27
  %.111 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.27, i32 0, i32 2
  store i64 %kind.1, ptr %.111, align 8
  %idx_trunc.29 = trunc i64 %rm_next.0 to i32
  %ptr_gep.29 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.29
  %slab_ptr.1 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.29, i32 0, i32 3
  %slab.1 = load i64, ptr %slab_ptr.1, align 8
  %idx_trunc.30 = trunc i64 %rm_hole.0 to i32
  %ptr_gep.30 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.30
  %.113 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.30, i32 0, i32 3
  store i64 %slab.1, ptr %.113, align 8
  %idx_trunc.31 = trunc i64 %rm_next.0 to i32
  %ptr_gep.31 = getelementptr inbounds %BlockEntry, ptr %int_to_ptr.1, i32 %idx_trunc.31
  %.115 = getelementptr inbounds %BlockEntry, ptr %ptr_gep.31, i32 0, i32 0
  %.116 = sext i32 0 to i64
  store i64 %.116, ptr %.115, align 8
  br label %switch_merge.10

switch_default.11:                                ; preds = %switch_merge.2
  %.134 = zext i32 1 to i64
  %.135 = add i64 %rm_idx.0, %.134
  %.136 = zext i32 1 to i64
  %.137 = sub i64 %.3, %.136
  %.138 = and i64 %.135, %.137
  br label %while.cond.2
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
  br i1 %.12, label %then, label %ifcont

then:                                             ; preds = %entry
  %op_overload_result = call i1 @standard__memory__allocators__stdheap__table_init__0__ret_boolE1()
  %.14 = xor i1 %op_overload_result, true
  br i1 %.14, label %common.ret, label %ifcont

ifcont:                                           ; preds = %then, %entry
  %g_table_count = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.20 = zext i32 2 to i64
  %.21 = mul i64 %g_table_count, %.20
  %g_table_cap = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  %.22 = icmp uge i64 %.21, %g_table_cap
  br i1 %.22, label %then.2, label %ifcont.2

common.ret:                                       ; preds = %then.2, %then, %ifcont.2
  %common.ret.op = phi i1 [ true, %ifcont.2 ], [ false, %then ], [ false, %then.2 ]
  ret i1 %common.ret.op

then.2:                                           ; preds = %ifcont
  %op_overload_result.1 = call i1 @standard__memory__allocators__stdheap__table_grow__0__ret_boolE1()
  %.24 = xor i1 %op_overload_result.1, true
  %cond = icmp eq i1 %.24, true
  br i1 %cond, label %common.ret, label %ifcont.2

ifcont.2:                                         ; preds = %then.2, %ifcont
  %g_table.1 = load ptr, ptr @standard__memory__allocators__stdheap__g_table, align 8
  %g_table_cap.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_cap, align 8
  call void @standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1(ptr %g_table.1, i64 %g_table_cap.1, i64 %key, i64 %size, i64 %kind, i64 %slab)
  %g_table_count.1 = load i64, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  %.31 = add i64 %g_table_count.1, 1
  store i64 %.31, ptr @standard__memory__allocators__stdheap__g_table_count, align 8
  br label %common.ret
}

define ptr @standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1(i64 %key) {
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
  %.18 = sext i32 0 to i64
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
  %.36 = sext i32 0 to i64
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

define i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %bytes) {
entry:
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.5 = ptrtoint ptr %g_slab_head to i64
  %.6 = ptrtoint ptr %int_to_ptr to i64
  %.7 = icmp eq i64 %.5, %.6
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i64 [ %.10, %then ], [ %.25, %ifcont ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.10 = sext i32 0 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
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

define i64 @standard__memory__allocators__stdheap__fmalloc_fast__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %cls) {
entry:
  %idx_trunc = trunc i64 %cls to i32
  %array_gep = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i32 %idx_trunc
  %array_load = load ptr, ptr %array_gep, align 8
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.5 = ptrtoint ptr %array_load to i64
  %.6 = ptrtoint ptr %int_to_ptr to i64
  %.7 = icmp eq i64 %.5, %.6
  br i1 %.7, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i64 [ %.9, %then ], [ %ptr_to_int, %ifcont ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.9 = sext i32 0 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %next_ptr = getelementptr inbounds %FreeNode, ptr %array_load, i32 0, i32 0
  %next = load ptr, ptr %next_ptr, align 8
  %.12 = getelementptr inbounds [9 x ptr], ptr @standard__memory__allocators__stdheap__g_bins, i32 0, i64 %cls
  store ptr %next, ptr %.12, align 8
  %ptr_to_int = ptrtoint ptr %array_load to i64
  br label %common.ret
}

define i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size) {
entry:
  %.4 = zext i1 false to i64
  %.5 = icmp eq i64 %size, %.4
  br i1 %.5, label %common.ret, label %ifcont

common.ret:                                       ; preds = %then.16, %then.9, %then.2, %entry, %switch_case_0.7, %switch_default.7, %switch_case_0.6, %switch_case_0.5, %switch_case_0.3, %switch_case_0.2, %switch_default.2, %switch_case_0.1, %ifcont.21, %then.21, %then.20, %then.19, %ifcont.14, %then.14, %then.13, %then.12, %ifcont.7, %then.7, %then.6, %then.5
  %common.ret.op = phi i64 [ %.35, %then.5 ], [ %.44, %then.6 ], [ %.53, %then.7 ], [ %ptr.0, %ifcont.7 ], [ %.89, %then.12 ], [ %.98, %then.13 ], [ %.107, %then.14 ], [ %ptr.5.0, %ifcont.14 ], [ %.143, %then.19 ], [ %.152, %then.20 ], [ %.161, %then.21 ], [ %ptr.10.0, %ifcont.21 ], [ %.181, %switch_case_0.1 ], [ %.176, %switch_default.2 ], [ %.189, %switch_case_0.2 ], [ %ptr_to_int.3, %switch_case_0.3 ], [ %.213, %switch_case_0.5 ], [ %.221, %switch_case_0.6 ], [ %ptr.15.0, %switch_default.7 ], [ %.230, %switch_case_0.7 ], [ %size, %entry ], [ %.16, %then.2 ], [ %.70, %then.9 ], [ %.124, %then.16 ]
  ret i64 %common.ret.op

ifcont:                                           ; preds = %entry
  %.9 = zext i32 32 to i64
  %.10 = icmp ule i64 %size, %.9
  %.12 = zext i32 16 to i64
  %.13 = icmp ugt i64 %size, %.12
  %or.cond = and i1 %.10, %.13
  br i1 %or.cond, label %then.2, label %ifcont.1

ifcont.1:                                         ; preds = %ifcont
  %.63 = zext i32 64 to i64
  %.64 = icmp ule i64 %size, %.63
  %.66 = zext i32 32 to i64
  %.67 = icmp ugt i64 %size, %.66
  %or.cond8 = and i1 %.64, %.67
  br i1 %or.cond8, label %then.9, label %ifcont.8

then.2:                                           ; preds = %ifcont
  %.15 = sext i32 1 to i64
  %.16 = call i64 @standard__memory__allocators__stdheap__fmalloc_fast__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.15)
  %not_zero = icmp ne i64 %.16, 0
  %not_null_result = zext i1 %not_zero to i8
  %tobool = icmp ne i8 %not_null_result, 0
  br i1 %tobool, label %common.ret, label %ifcont.3

ifcont.3:                                         ; preds = %then.2
  %.21 = sext i32 1 to i64
  %.23 = sext i32 32 to i64
  %.24 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.23)
  %.26 = zext i1 false to i64
  %.27 = icmp eq i64 %.24, %.26
  br i1 %.27, label %then.4, label %ifcont.4

then.4:                                           ; preds = %ifcont.3
  %.29 = sext i32 32 to i64
  %.30 = call ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %.29)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.31 = ptrtoint ptr %.30 to i64
  %.32 = ptrtoint ptr %int_to_ptr to i64
  %.33 = icmp eq i64 %.31, %.32
  br i1 %.33, label %then.5, label %ifcont.5

ifcont.4:                                         ; preds = %ifcont.5, %ifcont.3
  %ptr.0 = phi i64 [ %.24, %ifcont.3 ], [ %.39, %ifcont.5 ]
  %g_slab_head = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %ptr_to_int = ptrtoint ptr %g_slab_head to i64
  %.49 = sext i32 0 to i64
  %.50 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %ptr.0, i64 %.21, i64 %.49, i64 %ptr_to_int)
  %.51 = xor i1 %.50, true
  br i1 %.51, label %then.7, label %ifcont.7

then.5:                                           ; preds = %then.4
  %.35 = sext i32 0 to i64
  br label %common.ret

ifcont.5:                                         ; preds = %then.4
  %.38 = sext i32 32 to i64
  %.39 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.38)
  %.41 = zext i1 false to i64
  %.42 = icmp eq i64 %.39, %.41
  br i1 %.42, label %then.6, label %ifcont.4

then.6:                                           ; preds = %ifcont.5
  %.44 = sext i32 0 to i64
  br label %common.ret

then.7:                                           ; preds = %ifcont.4
  %.53 = sext i32 0 to i64
  br label %common.ret

ifcont.7:                                         ; preds = %ifcont.4
  %g_slab_head.2 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %used_ptr = getelementptr inbounds %Slab, ptr %g_slab_head.2, i32 0, i32 3
  %used = load i64, ptr %used_ptr, align 8
  %.56 = add i64 %used, 1
  %g_slab_head.3 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.57 = getelementptr inbounds %Slab, ptr %g_slab_head.3, i32 0, i32 3
  store i64 %.56, ptr %.57, align 8
  br label %common.ret

ifcont.8:                                         ; preds = %ifcont.1
  %.117 = zext i32 128 to i64
  %.118 = icmp ule i64 %size, %.117
  %.120 = zext i32 64 to i64
  %.121 = icmp ugt i64 %size, %.120
  %or.cond9 = and i1 %.118, %.121
  br i1 %or.cond9, label %then.16, label %ifcont.15

then.9:                                           ; preds = %ifcont.1
  %.69 = sext i32 2 to i64
  %.70 = call i64 @standard__memory__allocators__stdheap__fmalloc_fast__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.69)
  %not_zero.1 = icmp ne i64 %.70, 0
  %not_null_result.1 = zext i1 %not_zero.1 to i8
  %tobool.1 = icmp ne i8 %not_null_result.1, 0
  br i1 %tobool.1, label %common.ret, label %ifcont.10

ifcont.10:                                        ; preds = %then.9
  %.75 = sext i32 2 to i64
  %.77 = sext i32 64 to i64
  %.78 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.77)
  %.80 = zext i1 false to i64
  %.81 = icmp eq i64 %.78, %.80
  br i1 %.81, label %then.11, label %ifcont.11

then.11:                                          ; preds = %ifcont.10
  %.83 = sext i32 64 to i64
  %.84 = call ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %.83)
  %int_to_ptr_zext.1 = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  %.85 = ptrtoint ptr %.84 to i64
  %.86 = ptrtoint ptr %int_to_ptr.1 to i64
  %.87 = icmp eq i64 %.85, %.86
  br i1 %.87, label %then.12, label %ifcont.12

ifcont.11:                                        ; preds = %ifcont.12, %ifcont.10
  %ptr.5.0 = phi i64 [ %.78, %ifcont.10 ], [ %.93, %ifcont.12 ]
  %g_slab_head.4 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %ptr_to_int.1 = ptrtoint ptr %g_slab_head.4 to i64
  %.103 = sext i32 0 to i64
  %.104 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %ptr.5.0, i64 %.75, i64 %.103, i64 %ptr_to_int.1)
  %.105 = xor i1 %.104, true
  br i1 %.105, label %then.14, label %ifcont.14

then.12:                                          ; preds = %then.11
  %.89 = sext i32 0 to i64
  br label %common.ret

ifcont.12:                                        ; preds = %then.11
  %.92 = sext i32 64 to i64
  %.93 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.92)
  %.95 = zext i1 false to i64
  %.96 = icmp eq i64 %.93, %.95
  br i1 %.96, label %then.13, label %ifcont.11

then.13:                                          ; preds = %ifcont.12
  %.98 = sext i32 0 to i64
  br label %common.ret

then.14:                                          ; preds = %ifcont.11
  %.107 = sext i32 0 to i64
  br label %common.ret

ifcont.14:                                        ; preds = %ifcont.11
  %g_slab_head.6 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %used_ptr.1 = getelementptr inbounds %Slab, ptr %g_slab_head.6, i32 0, i32 3
  %used.1 = load i64, ptr %used_ptr.1, align 8
  %.110 = add i64 %used.1, 1
  %g_slab_head.7 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.111 = getelementptr inbounds %Slab, ptr %g_slab_head.7, i32 0, i32 3
  store i64 %.110, ptr %.111, align 8
  br label %common.ret

ifcont.15:                                        ; preds = %ifcont.8
  %.171 = call i64 @standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  %.173 = zext i32 9 to i64
  %.174 = icmp eq i64 %.171, %.173
  %cond = icmp eq i1 %.174, true
  br i1 %cond, label %switch_case_0, label %switch_default

then.16:                                          ; preds = %ifcont.8
  %.123 = sext i32 3 to i64
  %.124 = call i64 @standard__memory__allocators__stdheap__fmalloc_fast__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.123)
  %not_zero.2 = icmp ne i64 %.124, 0
  %not_null_result.2 = zext i1 %not_zero.2 to i8
  %tobool.2 = icmp ne i8 %not_null_result.2, 0
  br i1 %tobool.2, label %common.ret, label %ifcont.17

ifcont.17:                                        ; preds = %then.16
  %.129 = sext i32 3 to i64
  %.131 = sext i32 128 to i64
  %.132 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.131)
  %.134 = zext i1 false to i64
  %.135 = icmp eq i64 %.132, %.134
  br i1 %.135, label %then.18, label %ifcont.18

then.18:                                          ; preds = %ifcont.17
  %.137 = sext i32 128 to i64
  %.138 = call ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %.137)
  %int_to_ptr_zext.2 = zext i32 0 to i64
  %int_to_ptr.2 = inttoptr i64 %int_to_ptr_zext.2 to ptr
  %.139 = ptrtoint ptr %.138 to i64
  %.140 = ptrtoint ptr %int_to_ptr.2 to i64
  %.141 = icmp eq i64 %.139, %.140
  br i1 %.141, label %then.19, label %ifcont.19

ifcont.18:                                        ; preds = %ifcont.19, %ifcont.17
  %ptr.10.0 = phi i64 [ %.132, %ifcont.17 ], [ %.147, %ifcont.19 ]
  %g_slab_head.8 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %ptr_to_int.2 = ptrtoint ptr %g_slab_head.8 to i64
  %.157 = sext i32 0 to i64
  %.158 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %ptr.10.0, i64 %.129, i64 %.157, i64 %ptr_to_int.2)
  %.159 = xor i1 %.158, true
  br i1 %.159, label %then.21, label %ifcont.21

then.19:                                          ; preds = %then.18
  %.143 = sext i32 0 to i64
  br label %common.ret

ifcont.19:                                        ; preds = %then.18
  %.146 = sext i32 128 to i64
  %.147 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.146)
  %.149 = zext i1 false to i64
  %.150 = icmp eq i64 %.147, %.149
  br i1 %.150, label %then.20, label %ifcont.18

then.20:                                          ; preds = %ifcont.19
  %.152 = sext i32 0 to i64
  br label %common.ret

then.21:                                          ; preds = %ifcont.18
  %.161 = sext i32 0 to i64
  br label %common.ret

ifcont.21:                                        ; preds = %ifcont.18
  %g_slab_head.10 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %used_ptr.2 = getelementptr inbounds %Slab, ptr %g_slab_head.10, i32 0, i32 3
  %used.2 = load i64, ptr %used_ptr.2, align 8
  %.164 = add i64 %used.2, 1
  %g_slab_head.11 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.165 = getelementptr inbounds %Slab, ptr %g_slab_head.11, i32 0, i32 3
  store i64 %.164, ptr %.165, align 8
  br label %common.ret

switch_case_0:                                    ; preds = %ifcont.15
  %.176 = call i64 @standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %size)
  %.178 = zext i32 0 to i64
  %.179 = icmp eq i64 %.176, %.178
  %cond6 = icmp eq i1 %.179, true
  br i1 %cond6, label %switch_case_0.1, label %switch_default.1

switch_default:                                   ; preds = %ifcont.15
  %.196 = call ptr @standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1(i64 %.171)
  %not_null = icmp ne ptr %.196, null
  %not_null_result.3 = zext i1 %not_null to i8
  %cond1 = icmp eq i8 %not_null_result.3, 1
  br i1 %cond1, label %switch_case_0.3, label %switch_default.3

switch_case_0.1:                                  ; preds = %switch_case_0
  %.181 = sext i32 0 to i64
  br label %common.ret

switch_default.1:                                 ; preds = %switch_case_0
  %.184 = sext i32 1 to i64
  %.185 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %.176, i64 %size, i64 %.184, i64 %size)
  %.186 = xor i1 %.185, true
  %cond7 = icmp eq i1 %.186, true
  br i1 %cond7, label %switch_case_0.2, label %switch_default.2

switch_case_0.2:                                  ; preds = %switch_default.1
  call void @standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1(i64 %.176, i64 %size)
  %.189 = sext i32 0 to i64
  br label %common.ret

switch_default.2:                                 ; preds = %switch_default.1
  %g_large_used = load i64, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  %.192 = add i64 %g_large_used, 1
  store i64 %.192, ptr @standard__memory__allocators__stdheap__g_large_used, align 8
  br label %common.ret

switch_case_0.3:                                  ; preds = %switch_default
  %ptr_to_int.3 = ptrtoint ptr %.196 to i64
  br label %common.ret

switch_default.3:                                 ; preds = %switch_default
  %.201 = call i64 @standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.171)
  %.203 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.201)
  %.205 = zext i1 false to i64
  %.206 = icmp eq i64 %.203, %.205
  %cond2 = icmp eq i1 %.206, true
  br i1 %cond2, label %switch_case_0.4, label %switch_merge.4

switch_merge.4:                                   ; preds = %switch_default.5, %switch_default.3
  %ptr.15.0 = phi i64 [ %.203, %switch_default.3 ], [ %.216, %switch_default.5 ]
  %g_slab_head.12 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %ptr_to_int.4 = ptrtoint ptr %g_slab_head.12 to i64
  %.226 = sext i32 0 to i64
  %.227 = call i1 @standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1(i64 %ptr.15.0, i64 %.171, i64 %.226, i64 %ptr_to_int.4)
  %.228 = xor i1 %.227, true
  %cond3 = icmp eq i1 %.228, true
  br i1 %cond3, label %switch_case_0.7, label %switch_default.7

switch_case_0.4:                                  ; preds = %switch_default.3
  %.208 = call ptr @standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1(i64 %.201)
  %int_to_ptr_zext.3 = zext i32 0 to i64
  %int_to_ptr.3 = inttoptr i64 %int_to_ptr_zext.3 to ptr
  %.209 = ptrtoint ptr %.208 to i64
  %.210 = ptrtoint ptr %int_to_ptr.3 to i64
  %.211 = icmp eq i64 %.209, %.210
  %cond4 = icmp eq i1 %.211, true
  br i1 %cond4, label %switch_case_0.5, label %switch_default.5

switch_case_0.5:                                  ; preds = %switch_case_0.4
  %.213 = sext i32 0 to i64
  br label %common.ret

switch_default.5:                                 ; preds = %switch_case_0.4
  %.216 = call i64 @standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.201)
  %.218 = zext i1 false to i64
  %.219 = icmp eq i64 %.216, %.218
  %cond5 = icmp eq i1 %.219, true
  br i1 %cond5, label %switch_case_0.6, label %switch_merge.4

switch_case_0.6:                                  ; preds = %switch_default.5
  %.221 = sext i32 0 to i64
  br label %common.ret

switch_case_0.7:                                  ; preds = %switch_merge.4
  %.230 = sext i32 0 to i64
  br label %common.ret

switch_default.7:                                 ; preds = %switch_merge.4
  %g_slab_head.14 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %used_ptr.3 = getelementptr inbounds %Slab, ptr %g_slab_head.14, i32 0, i32 3
  %used.3 = load i64, ptr %used_ptr.3, align 8
  %.233 = add i64 %used.3, 1
  %g_slab_head.15 = load ptr, ptr @standard__memory__allocators__stdheap__g_slab_head, align 8
  %.234 = getelementptr inbounds %Slab, ptr %g_slab_head.15, i32 0, i32 3
  store i64 %.233, ptr %.234, align 8
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

define i1 @standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp eq i8 %c, 32
  %.5 = icmp eq i8 %c, 9
  %.6 = or i1 %.4, %.5
  %.7 = icmp eq i8 %c, 10
  %.8 = or i1 %.6, %.7
  %.9 = icmp eq i8 %c, 13
  %.10 = or i1 %.8, %.9
  ret i1 %.10
}

define i1 @standard__strings__helpers__is_digit__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 48
  %.5 = icmp sle i8 %c, 57
  %.6 = and i1 %.4, %.5
  ret i1 %.6
}

define i1 @standard__strings__helpers__is_alpha__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.5 = icmp sle i8 %c, 122
  %.6 = and i1 %.4, %.5
  %.7 = icmp sge i8 %c, 65
  %.8 = icmp sle i8 %c, 90
  %.9 = and i1 %.7, %.8
  %.10 = or i1 %.6, %.9
  ret i1 %.10
}

define i1 @standard__strings__helpers__is_upper__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 65
  %.5 = icmp sle i8 %c, 90
  %.6 = and i1 %.4, %.5
  ret i1 %.6
}

define i1 @standard__strings__helpers__is_lower__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.5 = icmp sle i8 %c, 122
  %.6 = and i1 %.4, %.5
  ret i1 %.6
}

define i1 @standard__strings__helpers__is_alnum__1__charE1__ret_boolE1(i8 %c) {
entry:
  %.4 = call i1 @standard__strings__helpers__is_alpha__1__charE1__ret_boolE1(i8 %c)
  %.5 = call i1 @standard__strings__helpers__is_digit__1__charE1__ret_boolE1(i8 %c)
  %.6 = or i1 %.4, %.5
  ret i1 %.6
}

define i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 65
  %.5 = icmp sle i8 %c, 90
  %.6 = and i1 %.4, %.5
  %.8 = sext i8 %c to i32
  %.9 = add i32 %.8, 32
  %.10 = trunc i32 %.9 to i8
  %common.ret.op = select i1 %.6, i8 %.10, i8 %c
  ret i8 %common.ret.op
}

define i8 @standard__strings__helpers__to_upper__1__charE1__ret_charE1(i8 %c) {
entry:
  %.4 = icmp sge i8 %c, 97
  %.5 = icmp sle i8 %c, 122
  %.6 = and i1 %.4, %.5
  %.8 = sext i8 %c to i32
  %.9 = sub i32 %.8, 32
  %.10 = trunc i32 %.9 to i8
  %common.ret.op = select i1 %.6, i8 %.10, i8 %c
  ret i8 %common.ret.op
}

define i32 @standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1(ptr %str, i8 %ch, i32 %start_pos) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %i.0 = phi i32 [ %start_pos, %entry ], [ %.18, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = sext i8 %ptr_load to i32
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
  %.12 = sext i8 %ptr_load to i32
  %.13 = icmp ne i32 %.12, 0
  br i1 %.13, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.15 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %substr_len.0 = phi i32 [ %.22, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %substr_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.19 = sext i8 %ptr_load.1 to i32
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
  %i.0 = phi i32 [ 0, %entry ], [ %.26, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = sext i8 %ptr_load to i32
  %.11 = icmp ne i32 %.10, 0
  %ptr_gep.1 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.12 = sext i8 %ptr_load.1 to i32
  %.13 = icmp ne i32 %.12, 0
  %.14 = and i1 %.11, %.13
  br i1 %.14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %ptr_gep.2 = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.16 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.2)
  %ptr_gep.3 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.18 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.3)
  %.20 = icmp ne i8 %.16, %.18
  br i1 %.20, label %then, label %ifcont

common.ret:                                       ; preds = %then, %while.end
  %common.ret.op = phi i32 [ %.32, %while.end ], [ %.23, %then ]
  ret i32 %common.ret.op

while.end:                                        ; preds = %while.cond
  %ptr_gep.4 = getelementptr inbounds i8, ptr %s1, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.29 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.4)
  %ptr_gep.5 = getelementptr inbounds i8, ptr %s2, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.30 = call i8 @standard__strings__helpers__to_lower__1__charE1__ret_charE1(i8 %ptr_load.5)
  %.31 = sub i8 %.29, %.30
  %.32 = sext i8 %.31 to i32
  br label %common.ret

then:                                             ; preds = %while.body
  %.22 = sub i8 %.16, %.18
  %.23 = sext i8 %.22 to i32
  br label %common.ret

ifcont:                                           ; preds = %while.body
  %.26 = add i32 %i.0, 1
  br label %while.cond
}

define i1 @standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1(ptr %str, ptr %prefix) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.15, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %prefix, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.8 = sext i8 %ptr_load to i32
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
  %.9 = sext i8 %ptr_load to i32
  %.10 = icmp ne i32 %.9, 0
  br i1 %.10, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.12 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %suffix_len.0 = phi i32 [ %.19, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %suffix, i32 %suffix_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.16 = sext i8 %ptr_load.1 to i32
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
  %.6 = sext i8 %ptr_load to i32
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
  %i.0 = phi i32 [ %.27, %for.body ], [ 0, %entry ]
  %.19 = icmp slt i32 %i.0, %n
  %ptr_gep = getelementptr inbounds i8, ptr %src, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.20 = sext i8 %ptr_load to i32
  %.21 = icmp ne i32 %.20, 0
  %.22 = and i1 %.19, %.21
  br i1 %.22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ptr_gep.1 = getelementptr inbounds i8, ptr %src, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.24 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.1, ptr %.24, align 1
  %.27 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %.30 = trunc i32 0 to i8
  %.31 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %n
  store i8 %.30, ptr %.31, align 1
  br label %common.ret
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
  %i.0 = phi i32 [ %.31, %for.body ], [ 0, %entry ]
  %.21 = icmp slt i32 %i.0, %length
  %.22 = add i32 %start, %i.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.22
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.23 = sext i8 %ptr_load to i32
  %.24 = icmp ne i32 %.23, 0
  %.25 = and i1 %.21, %.24
  br i1 %.25, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.27 = add i32 %start, %i.0
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %.27
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.28 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %i.0
  store i8 %ptr_load.1, ptr %.28, align 1
  %.31 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %.34 = trunc i32 0 to i8
  %.35 = getelementptr inbounds i8, ptr %int_to_ptr, i32 %length
  store i8 %.34, ptr %.35, align 1
  br label %common.ret
}

define ptr @standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1(ptr %s1, ptr %s2) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %len1.0 = phi i32 [ 0, %entry ], [ %.11, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %s1, i32 %len1.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.8 = sext i8 %ptr_load to i32
  %.9 = icmp ne i32 %.8, 0
  br i1 %.9, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.11 = add i32 %len1.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %len2.0 = phi i32 [ %.19, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %s2, i32 %len2.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.16 = sext i8 %ptr_load.1 to i32
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
  %i.0 = phi i32 [ 0, %entry ], [ %.22, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.10 = sext i8 %ptr_load to i32
  %.11 = icmp eq i32 %.10, 32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.12 = sext i8 %ptr_load.1 to i32
  %.13 = icmp eq i32 %.12, 9
  %.14 = or i1 %.11, %.13
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.15 = sext i8 %ptr_load.2 to i32
  %.16 = icmp eq i32 %.15, 10
  %.17 = or i1 %.14, %.16
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.18 = sext i8 %ptr_load.3 to i32
  %.19 = icmp eq i32 %.18, 13
  %.20 = or i1 %.17, %.19
  br i1 %.20, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.22 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.25 = sext i8 %ptr_load.4 to i32
  %.26 = icmp eq i32 %.25, 45
  br i1 %.26, label %then, label %else

then:                                             ; preds = %while.end
  %.28 = sub i32 0, 1
  %.30 = add i32 %i.0, 1
  br label %ifcont

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.33 = sext i8 %ptr_load.5 to i32
  %.34 = icmp eq i32 %.33, 43
  %.36 = add i32 %i.0, 1
  %spec.select = select i1 %.34, i32 %.36, i32 %i.0
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %sign.0 = phi i32 [ %.28, %then ], [ 1, %else ]
  %i.13 = phi i32 [ %.30, %then ], [ %spec.select, %else ]
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %ifcont
  %i.24 = phi i32 [ %i.13, %ifcont ], [ %.59, %then.1 ]
  %result.0 = phi i32 [ 0, %ifcont ], [ %.55, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.41 = sext i8 %ptr_load.6 to i32
  %.42 = icmp ne i32 %.41, 0
  br i1 %.42, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.45 = zext i8 %ptr_load.7 to i32
  %.46 = icmp uge i32 %.45, 48
  %.47 = zext i8 %ptr_load.7 to i32
  %.48 = icmp ule i32 %.47, 57
  %.49 = and i1 %.46, %.48
  br i1 %.49, label %then.1, label %while.end.1

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %.62 = mul i32 %result.0, %sign.0
  ret i32 %.62

then.1:                                           ; preds = %while.body.1
  %.51 = zext i8 %ptr_load.7 to i32
  %.52 = sub i32 %.51, 48
  %.54 = mul i32 %result.0, 10
  %.55 = add i32 %.54, %.52
  %.59 = add i32 %i.24, 1
  br label %while.cond.1
}

define i32 @standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1(ptr %str) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.9 = sext i8 %ptr_load to i32
  %.10 = icmp eq i32 %.9, 32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.11 = sext i8 %ptr_load.1 to i32
  %.12 = icmp eq i32 %.11, 9
  %.13 = or i1 %.10, %.12
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.14 = sext i8 %ptr_load.2 to i32
  %.15 = icmp eq i32 %.14, 10
  %.16 = or i1 %.13, %.15
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.17 = sext i8 %ptr_load.3 to i32
  %.18 = icmp eq i32 %.17, 13
  %.19 = or i1 %.16, %.18
  br i1 %.19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.24 = sext i8 %ptr_load.4 to i32
  %.25 = icmp eq i32 %.24, 45
  br i1 %.25, label %common.ret, label %else

common.ret:                                       ; preds = %while.body.1, %while.cond.1, %while.end
  %common.ret.op = phi i32 [ 0, %while.end ], [ %result.0, %while.cond.1 ], [ %result.0, %while.body.1 ]
  ret i32 %common.ret.op

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.28 = sext i8 %ptr_load.5 to i32
  %.29 = icmp eq i32 %.28, 43
  %.31 = add i32 %i.0, 1
  %i.12 = select i1 %.29, i32 %.31, i32 %i.0
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %else
  %i.23 = phi i32 [ %i.12, %else ], [ %.54, %then.1 ]
  %result.0 = phi i32 [ 0, %else ], [ %.50, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.36 = sext i8 %ptr_load.6 to i32
  %.37 = icmp ne i32 %.36, 0
  br i1 %.37, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.40 = zext i8 %ptr_load.7 to i32
  %.41 = icmp uge i32 %.40, 48
  %.42 = zext i8 %ptr_load.7 to i32
  %.43 = icmp ule i32 %.42, 57
  %.44 = and i1 %.41, %.43
  br i1 %.44, label %then.1, label %common.ret

then.1:                                           ; preds = %while.body.1
  %.46 = zext i8 %ptr_load.7 to i32
  %.47 = sub i32 %.46, 48
  %.49 = mul i32 %result.0, 10
  %.50 = add i32 %.49, %.47
  %.54 = add i32 %i.23, 1
  br label %while.cond.1
}

define i64 @standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64(ptr %str) {
entry:
  %.6 = sext i32 1 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.23, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.11 = sext i8 %ptr_load to i32
  %.12 = icmp eq i32 %.11, 32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.13 = sext i8 %ptr_load.1 to i32
  %.14 = icmp eq i32 %.13, 9
  %.15 = or i1 %.12, %.14
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.16 = sext i8 %ptr_load.2 to i32
  %.17 = icmp eq i32 %.16, 10
  %.18 = or i1 %.15, %.17
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.19 = sext i8 %ptr_load.3 to i32
  %.20 = icmp eq i32 %.19, 13
  %.21 = or i1 %.18, %.20
  br i1 %.21, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.23 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.26 = sext i8 %ptr_load.4 to i32
  %.27 = icmp eq i32 %.26, 45
  br i1 %.27, label %then, label %else

then:                                             ; preds = %while.end
  %.29 = sub i32 0, 1
  %.30 = sext i32 %.29 to i64
  %.32 = add i32 %i.0, 1
  br label %ifcont

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.35 = sext i8 %ptr_load.5 to i32
  %.36 = icmp eq i32 %.35, 43
  %.38 = add i32 %i.0, 1
  %spec.select = select i1 %.36, i32 %.38, i32 %i.0
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %i.13 = phi i32 [ %.32, %then ], [ %spec.select, %else ]
  %sign.0 = phi i64 [ %.30, %then ], [ %.6, %else ]
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %ifcont
  %i.24 = phi i32 [ %i.13, %ifcont ], [ %.63, %then.1 ]
  %result.0 = phi i64 [ 0, %ifcont ], [ %.59, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.43 = sext i8 %ptr_load.6 to i32
  %.44 = icmp ne i32 %.43, 0
  br i1 %.44, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.24
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.47 = zext i8 %ptr_load.7 to i32
  %.48 = icmp uge i32 %.47, 48
  %.49 = zext i8 %ptr_load.7 to i32
  %.50 = icmp ule i32 %.49, 57
  %.51 = and i1 %.48, %.50
  br i1 %.51, label %then.1, label %while.end.1

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %.66 = mul i64 %result.0, %sign.0
  ret i64 %.66

then.1:                                           ; preds = %while.body.1
  %.53 = zext i8 %ptr_load.7 to i32
  %.54 = sub i32 %.53, 48
  %.55 = zext i32 %.54 to i64
  %.57 = sext i32 10 to i64
  %.58 = mul i64 %result.0, %.57
  %.59 = add i64 %.58, %.55
  %.63 = add i32 %i.24, 1
  br label %while.cond.1
}

define i64 @standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64(ptr %str) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.21, %while.body ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.9 = sext i8 %ptr_load to i32
  %.10 = icmp eq i32 %.9, 32
  %ptr_gep.1 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.11 = sext i8 %ptr_load.1 to i32
  %.12 = icmp eq i32 %.11, 9
  %.13 = or i1 %.10, %.12
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.14 = sext i8 %ptr_load.2 to i32
  %.15 = icmp eq i32 %.14, 10
  %.16 = or i1 %.13, %.15
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.17 = sext i8 %ptr_load.3 to i32
  %.18 = icmp eq i32 %.17, 13
  %.19 = or i1 %.16, %.18
  br i1 %.19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.21 = add i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %ptr_gep.4 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.24 = sext i8 %ptr_load.4 to i32
  %.25 = icmp eq i32 %.24, 45
  br i1 %.25, label %then, label %else

common.ret:                                       ; preds = %while.body.1, %while.cond.1, %then
  %common.ret.op = phi i64 [ %.27, %then ], [ %result.0, %while.cond.1 ], [ %result.0, %while.body.1 ]
  ret i64 %common.ret.op

then:                                             ; preds = %while.end
  %.27 = sext i32 0 to i64
  br label %common.ret

else:                                             ; preds = %while.end
  %ptr_gep.5 = getelementptr inbounds i8, ptr %str, i32 %i.0
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.29 = sext i8 %ptr_load.5 to i32
  %.30 = icmp eq i32 %.29, 43
  %.32 = add i32 %i.0, 1
  %i.12 = select i1 %.30, i32 %.32, i32 %i.0
  br label %while.cond.1

while.cond.1:                                     ; preds = %then.1, %else
  %i.23 = phi i32 [ %i.12, %else ], [ %.57, %then.1 ]
  %result.0 = phi i64 [ 0, %else ], [ %.53, %then.1 ]
  %ptr_gep.6 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.37 = sext i8 %ptr_load.6 to i32
  %.38 = icmp ne i32 %.37, 0
  br i1 %.38, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.7 = getelementptr inbounds i8, ptr %str, i32 %i.23
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.41 = zext i8 %ptr_load.7 to i32
  %.42 = icmp uge i32 %.41, 48
  %.43 = zext i8 %ptr_load.7 to i32
  %.44 = icmp ule i32 %.43, 57
  %.45 = and i1 %.42, %.44
  br i1 %.45, label %then.1, label %common.ret

then.1:                                           ; preds = %while.body.1
  %.47 = zext i8 %ptr_load.7 to i32
  %.48 = sub i32 %.47, 48
  %.49 = zext i32 %.48 to i64
  %.51 = zext i32 10 to i64
  %.52 = mul i64 %result.0, %.51
  %.53 = add i64 %.52, %.49
  %.57 = add i32 %i.23, 1
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
  %.84 = icmp eq i32 %spec.select49, 0
  br i1 %.84, label %then.4, label %else.4

then.4:                                           ; preds = %while.end.1
  %.86 = trunc i32 48 to i8
  %.87 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.86, ptr %.87, align 1
  %.89 = add i32 %write_pos.0, 1
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
  %write_pos.110 = phi i32 [ %.89, %then.4 ], [ %write_pos.211, %while.cond.3 ]
  %.121 = icmp sgt i32 %precision, 0
  br i1 %.121, label %then.5, label %ifcont.5

while.cond.2:                                     ; preds = %while.body.2, %else.4
  %temp_int.0 = phi i32 [ %spec.select49, %else.4 ], [ %.103, %while.body.2 ]
  %temp_pos.0 = phi i32 [ 0, %else.4 ], [ %.105, %while.body.2 ]
  %.96 = icmp sgt i32 %temp_int.0, 0
  br i1 %.96, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.98 = srem i32 %temp_int.0, 10
  %.99 = add i32 %.98, 48
  %.100 = trunc i32 %.99 to i8
  %.101 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %temp_pos.0
  store i8 %.100, ptr %.101, align 1
  %.103 = sdiv i32 %temp_int.0, 10
  %.105 = add i32 %temp_pos.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.108 = sub i32 %temp_pos.0, 1
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %k.0 = phi i32 [ %.108, %while.end.2 ], [ %.117, %while.body.3 ]
  %write_pos.211 = phi i32 [ %write_pos.0, %while.end.2 ], [ %.115, %while.body.3 ]
  %.111 = icmp sge i32 %k.0, 0
  br i1 %.111, label %while.body.3, label %ifcont.4

while.body.3:                                     ; preds = %while.cond.3
  %array_gep = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %k.0
  %array_load = load i8, ptr %array_gep, align 1
  %.113 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.211
  store i8 %array_load, ptr %.113, align 1
  %.115 = add i32 %write_pos.211, 1
  %.117 = sub i32 %k.0, 1
  br label %while.cond.3

then.5:                                           ; preds = %ifcont.4
  %.123 = trunc i32 46 to i8
  %.124 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.110
  store i8 %.123, ptr %.124, align 1
  %.126 = add i32 %write_pos.110, 1
  %.128 = icmp eq i32 %spec.select, 0
  br i1 %.128, label %while.cond.4, label %else.6

ifcont.5:                                         ; preds = %while.cond.7, %while.cond.4, %ifcont.4
  %write_pos.312 = phi i32 [ %write_pos.110, %ifcont.4 ], [ %write_pos.413, %while.cond.4 ], [ %write_pos.716, %while.cond.7 ]
  %.188 = trunc i32 0 to i8
  %.189 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.312
  store i8 %.188, ptr %.189, align 1
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
  %m.0 = phi i32 [ %.139, %while.body.4 ], [ 0, %then.5 ]
  %write_pos.413 = phi i32 [ %.137, %while.body.4 ], [ %.126, %then.5 ]
  %.132 = icmp slt i32 %m.0, %precision
  br i1 %.132, label %while.body.4, label %ifcont.5

while.body.4:                                     ; preds = %while.cond.4
  %.134 = trunc i32 48 to i8
  %.135 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.413
  store i8 %.134, ptr %.135, align 1
  %.137 = add i32 %write_pos.413, 1
  %.139 = add i32 %m.0, 1
  br label %while.cond.4

while.cond.5:                                     ; preds = %while.body.5, %else.6
  %frac_digits.0 = phi i32 [ 0, %else.6 ], [ %.156, %while.body.5 ]
  %temp_frac.0 = phi i32 [ %spec.select, %else.6 ], [ %.154, %while.body.5 ]
  %.147 = icmp sgt i32 %temp_frac.0, 0
  br i1 %.147, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %.149 = srem i32 %temp_frac.0, 10
  %.150 = add i32 %.149, 48
  %.151 = trunc i32 %.150 to i8
  %.152 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %frac_digits.0
  store i8 %.151, ptr %.152, align 1
  %.154 = sdiv i32 %temp_frac.0, 10
  %.156 = add i32 %frac_digits.0, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %.159 = sub i32 %precision, %frac_digits.0
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.body.6, %while.end.5
  %write_pos.615 = phi i32 [ %.126, %while.end.5 ], [ %.168, %while.body.6 ]
  %n.0 = phi i32 [ 0, %while.end.5 ], [ %.170, %while.body.6 ]
  %.163 = icmp slt i32 %n.0, %.159
  br i1 %.163, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.165 = trunc i32 48 to i8
  %.166 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.615
  store i8 %.165, ptr %.166, align 1
  %.168 = add i32 %write_pos.615, 1
  %.170 = add i32 %n.0, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6
  %.173 = sub i32 %frac_digits.0, 1
  br label %while.cond.7

while.cond.7:                                     ; preds = %while.body.7, %while.end.6
  %write_pos.716 = phi i32 [ %write_pos.615, %while.end.6 ], [ %.180, %while.body.7 ]
  %p.0 = phi i32 [ %.173, %while.end.6 ], [ %.182, %while.body.7 ]
  %.176 = icmp sge i32 %p.0, 0
  br i1 %.176, label %while.body.7, label %ifcont.5

while.body.7:                                     ; preds = %while.cond.7
  %array_gep.1 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %p.0
  %array_load.1 = load i8, ptr %array_gep.1, align 1
  %.178 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.716
  store i8 %array_load.1, ptr %.178, align 1
  %.180 = add i32 %write_pos.716, 1
  %.182 = sub i32 %p.0, 1
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
  %.76 = sext i32 1 to i64
  %.77 = add i64 %.50, %.76
  %.79 = sext i32 0 to i64
  %frac_part.0 = select i1 %.74, i64 %.79, i64 %.72
  %int_part.0 = select i1 %.74, i64 %.77, i64 %.50
  %.92 = sext i32 0 to i64
  %.93 = icmp eq i64 %int_part.0, %.92
  br i1 %.93, label %then.4, label %else.4

then.4:                                           ; preds = %while.end.1
  %.95 = trunc i32 48 to i8
  %.96 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.0
  store i8 %.95, ptr %.96, align 1
  %.98 = add i32 %write_pos.0, 1
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
  %write_pos.110 = phi i32 [ %.98, %then.4 ], [ %write_pos.211, %while.cond.3 ]
  %.134 = icmp sgt i32 %precision, 0
  br i1 %.134, label %then.5, label %ifcont.5

while.cond.2:                                     ; preds = %while.body.2, %else.4
  %temp_int.0 = phi i64 [ %int_part.0, %else.4 ], [ %.116, %while.body.2 ]
  %temp_pos.0 = phi i32 [ 0, %else.4 ], [ %.118, %while.body.2 ]
  %.105 = sext i32 0 to i64
  %.106 = icmp sgt i64 %temp_int.0, %.105
  br i1 %.106, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.108 = sext i32 10 to i64
  %.109 = srem i64 %temp_int.0, %.108
  %.110 = sext i32 48 to i64
  %.111 = add i64 %.109, %.110
  %.112 = trunc i64 %.111 to i8
  %.113 = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %temp_pos.0
  store i8 %.112, ptr %.113, align 1
  %.115 = sext i32 10 to i64
  %.116 = sdiv i64 %temp_int.0, %.115
  %.118 = add i32 %temp_pos.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %.121 = sub i32 %temp_pos.0, 1
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %k.0 = phi i32 [ %.121, %while.end.2 ], [ %.130, %while.body.3 ]
  %write_pos.211 = phi i32 [ %write_pos.0, %while.end.2 ], [ %.128, %while.body.3 ]
  %.124 = icmp sge i32 %k.0, 0
  br i1 %.124, label %while.body.3, label %ifcont.4

while.body.3:                                     ; preds = %while.cond.3
  %array_gep = getelementptr inbounds [32 x i8], ptr %int_temp, i32 0, i32 %k.0
  %array_load = load i8, ptr %array_gep, align 1
  %.126 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.211
  store i8 %array_load, ptr %.126, align 1
  %.128 = add i32 %write_pos.211, 1
  %.130 = sub i32 %k.0, 1
  br label %while.cond.3

then.5:                                           ; preds = %ifcont.4
  %.136 = trunc i32 46 to i8
  %.137 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.110
  store i8 %.136, ptr %.137, align 1
  %.139 = add i32 %write_pos.110, 1
  %.141 = sext i32 0 to i64
  %.142 = icmp eq i64 %frac_part.0, %.141
  br i1 %.142, label %while.cond.4, label %else.6

ifcont.5:                                         ; preds = %while.cond.7, %while.cond.4, %ifcont.4
  %write_pos.312 = phi i32 [ %write_pos.110, %ifcont.4 ], [ %write_pos.413, %while.cond.4 ], [ %write_pos.716, %while.cond.7 ]
  %.206 = trunc i32 0 to i8
  %.207 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.312
  store i8 %.206, ptr %.207, align 1
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
  %m.0 = phi i32 [ %.153, %while.body.4 ], [ 0, %then.5 ]
  %write_pos.413 = phi i32 [ %.151, %while.body.4 ], [ %.139, %then.5 ]
  %.146 = icmp slt i32 %m.0, %precision
  br i1 %.146, label %while.body.4, label %ifcont.5

while.body.4:                                     ; preds = %while.cond.4
  %.148 = trunc i32 48 to i8
  %.149 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.413
  store i8 %.148, ptr %.149, align 1
  %.151 = add i32 %write_pos.413, 1
  %.153 = add i32 %m.0, 1
  br label %while.cond.4

while.cond.5:                                     ; preds = %while.body.5, %else.6
  %frac_digits.0 = phi i32 [ 0, %else.6 ], [ %.174, %while.body.5 ]
  %temp_frac.0 = phi i64 [ %frac_part.0, %else.6 ], [ %.172, %while.body.5 ]
  %.161 = sext i32 0 to i64
  %.162 = icmp sgt i64 %temp_frac.0, %.161
  br i1 %.162, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %.164 = sext i32 10 to i64
  %.165 = srem i64 %temp_frac.0, %.164
  %.166 = sext i32 48 to i64
  %.167 = add i64 %.165, %.166
  %.168 = trunc i64 %.167 to i8
  %.169 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %frac_digits.0
  store i8 %.168, ptr %.169, align 1
  %.171 = sext i32 10 to i64
  %.172 = sdiv i64 %temp_frac.0, %.171
  %.174 = add i32 %frac_digits.0, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %.177 = sub i32 %precision, %frac_digits.0
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.body.6, %while.end.5
  %write_pos.615 = phi i32 [ %.139, %while.end.5 ], [ %.186, %while.body.6 ]
  %n.0 = phi i32 [ 0, %while.end.5 ], [ %.188, %while.body.6 ]
  %.181 = icmp slt i32 %n.0, %.177
  br i1 %.181, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.183 = trunc i32 48 to i8
  %.184 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.615
  store i8 %.183, ptr %.184, align 1
  %.186 = add i32 %write_pos.615, 1
  %.188 = add i32 %n.0, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6
  %.191 = sub i32 %frac_digits.0, 1
  br label %while.cond.7

while.cond.7:                                     ; preds = %while.body.7, %while.end.6
  %write_pos.716 = phi i32 [ %write_pos.615, %while.end.6 ], [ %.198, %while.body.7 ]
  %p.0 = phi i32 [ %.191, %while.end.6 ], [ %.200, %while.body.7 ]
  %.194 = icmp sge i32 %p.0, 0
  br i1 %.194, label %while.body.7, label %ifcont.5

while.body.7:                                     ; preds = %while.cond.7
  %array_gep.1 = getelementptr inbounds [32 x i8], ptr %frac_temp, i32 0, i32 %p.0
  %array_load.1 = load i8, ptr %array_gep.1, align 1
  %.196 = getelementptr inbounds i8, ptr %buffer, i32 %write_pos.716
  store i8 %array_load.1, ptr %.196, align 1
  %.198 = add i32 %write_pos.716, 1
  %.200 = sub i32 %p.0, 1
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
  %.7 = sext i8 %ptr_load to i32
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
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.21 = sext i8 %ptr_load.2 to i32
  %.22 = icmp ne i32 %.21, 0
  %.23 = or i1 %.20, %.22
  %.25 = add i32 %count.0, 1
  %count.22 = select i1 %.23, i32 %.25, i32 %count.0
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
  %.10 = sext i8 %ptr_load to i32
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
  %common.ret.op = phi ptr [ %int_to_ptr, %then.2 ], [ %.44, %while.end ]
  ret ptr %common.ret.op

then.2:                                           ; preds = %for.end
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  br label %common.ret

while.cond:                                       ; preds = %for.end, %while.body
  %line_end.0 = phi i32 [ %.39, %while.body ], [ %line_start.0, %for.end ]
  %ptr_gep.2 = getelementptr inbounds i8, ptr %str, i32 %line_end.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.34 = sext i8 %ptr_load.2 to i32
  %.35 = icmp ne i32 %.34, 0
  %ptr_gep.3 = getelementptr inbounds i8, ptr %str, i32 %line_end.0
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.36 = icmp ne i8 %ptr_load.3, 10
  %.37 = and i1 %.35, %.36
  br i1 %.37, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.39 = add i32 %line_end.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.42 = sub i32 %line_end.0, %line_start.0
  %.44 = call ptr @standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1(ptr %str, i32 %line_start.0, i32 %.42)
  br label %common.ret
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
  %.8 = sext i8 %ptr_load to i32
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
  %.18 = sext i8 %ptr_load to i32
  %.19 = icmp ne i32 %.18, 0
  br i1 %.19, label %while.body, label %while.cond.1

while.body:                                       ; preds = %while.cond
  %.21 = add i32 %str_len.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %find_len.0 = phi i32 [ %.29, %while.body.1 ], [ 0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i8, ptr %find, i32 %find_len.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.26 = sext i8 %ptr_load.1 to i32
  %.27 = icmp ne i32 %.26, 0
  br i1 %.27, label %while.body.1, label %while.cond.2

while.body.1:                                     ; preds = %while.cond.1
  %.29 = add i32 %find_len.0, 1
  br label %while.cond.1

while.cond.2:                                     ; preds = %while.cond.1, %while.body.2
  %replace_len.0 = phi i32 [ %.37, %while.body.2 ], [ 0, %while.cond.1 ]
  %ptr_gep.2 = getelementptr inbounds i8, ptr %replace, i32 %replace_len.0
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.34 = sext i8 %ptr_load.2 to i32
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
  %.10 = sext i8 %ptr_load to i32
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
  %.9 = ptrtoint ptr %substr to i64
  %.10 = ptrtoint ptr null to i64
  %.11 = icmp eq i64 %.9, %.10
  %.12 = or i1 %.8, %.11
  br i1 %.12, label %then, label %ifcont

common.ret:                                       ; preds = %for.cond.1, %ifcont, %for.end, %then.2, %then
  %common.ret.op = phi i32 [ %.14, %then ], [ %.27, %then.2 ], [ %.58, %for.end ], [ %.17, %ifcont ], [ %i.0, %for.cond.1 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.14 = sub i32 0, 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.17 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %str)
  %.19 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %substr)
  %.21 = icmp eq i32 %.19, 0
  br i1 %.21, label %common.ret, label %ifcont.1

ifcont.1:                                         ; preds = %ifcont
  %.25 = icmp sgt i32 %.19, %.17
  br i1 %.25, label %then.2, label %ifcont.2

then.2:                                           ; preds = %ifcont.1
  %.27 = sub i32 0, 1
  br label %common.ret

ifcont.2:                                         ; preds = %ifcont.1
  %.31 = sub i32 %.17, %.19
  br label %for.cond

for.cond:                                         ; preds = %ifcont.4, %ifcont.2
  %i.0 = phi i32 [ %.31, %ifcont.2 ], [ %.55, %ifcont.4 ]
  %.34 = icmp sge i32 %i.0, 0
  br i1 %.34, label %for.cond.1, label %for.end

for.end:                                          ; preds = %for.cond
  %.58 = sub i32 0, 1
  br label %common.ret

for.cond.1:                                       ; preds = %for.cond, %ifcont.3
  %j.0 = phi i32 [ %.48, %ifcont.3 ], [ 0, %for.cond ]
  %.39 = icmp slt i32 %j.0, %.19
  br i1 %.39, label %for.body.1, label %common.ret

for.body.1:                                       ; preds = %for.cond.1
  %.41 = add i32 %i.0, %j.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.41
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %j.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.42 = icmp ne i8 %ptr_load, %ptr_load.1
  br i1 %.42, label %ifcont.4, label %ifcont.3

ifcont.3:                                         ; preds = %for.body.1
  %.48 = add i32 %j.0, 1
  br label %for.cond.1

ifcont.4:                                         ; preds = %for.body.1
  %.55 = sub i32 %i.0, 1
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
  %.9 = ptrtoint ptr %substr to i64
  %.10 = ptrtoint ptr null to i64
  %.11 = icmp eq i64 %.9, %.10
  %.12 = or i1 %.8, %.11
  br i1 %.12, label %common.ret, label %ifcont

common.ret:                                       ; preds = %while.cond, %ifcont, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ 0, %ifcont ], [ %count.0, %while.cond ]
  ret i32 %common.ret.op

ifcont:                                           ; preds = %entry
  %.16 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %str)
  %.18 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %substr)
  %.20 = icmp eq i32 %.18, 0
  %.21 = icmp sgt i32 %.18, %.16
  %.22 = or i1 %.20, %.21
  br i1 %.22, label %common.ret, label %while.cond

while.cond:                                       ; preds = %ifcont, %ifcont.3
  %count.0 = phi i32 [ %count.12, %ifcont.3 ], [ 0, %ifcont ]
  %pos.0 = phi i32 [ %pos.11, %ifcont.3 ], [ 0, %ifcont ]
  %.30 = sub i32 %.16, %.18
  %.31 = icmp sle i32 %pos.0, %.30
  br i1 %.31, label %for.cond, label %common.ret

for.cond:                                         ; preds = %while.cond, %ifcont.2
  %j.0 = phi i32 [ %.45, %ifcont.2 ], [ 0, %while.cond ]
  %.36 = icmp slt i32 %j.0, %.18
  br i1 %.36, label %for.body, label %then.3

for.body:                                         ; preds = %for.cond
  %.38 = add i32 %pos.0, %j.0
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %.38
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %substr, i32 %j.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.39 = icmp ne i8 %ptr_load, %ptr_load.1
  br i1 %.39, label %else.3, label %ifcont.2

ifcont.2:                                         ; preds = %for.body
  %.45 = add i32 %j.0, 1
  br label %for.cond

then.3:                                           ; preds = %for.cond
  %.49 = add i32 %count.0, 1
  %.51 = add i32 %pos.0, %.18
  br label %ifcont.3

else.3:                                           ; preds = %for.body
  %.54 = add i32 %pos.0, 1
  br label %ifcont.3

ifcont.3:                                         ; preds = %else.3, %then.3
  %count.12 = phi i32 [ %.49, %then.3 ], [ %count.0, %else.3 ]
  %pos.11 = phi i32 [ %.51, %then.3 ], [ %.54, %else.3 ]
  br label %while.cond
}

define void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %msg, i32 %x) {
entry:
  %WIN_STDOUT_HANDLE_load = load i64, ptr @WIN_STDOUT_HANDLE, align 8
  call void asm sideeffect "movq $2, %rcx           \0D\0A                    movq $0, %rdx           \0D\0A                    movl $1, %r8d           \0D\0A                    xorq %r9, %r9           \0D\0A                    subq $$40, %rsp         \0D\0A                    movq %r9, 32(%rsp)      \0D\0A                    call WriteFile\0D\0A                    addq $$40, %rsp", "r,r,r,~{rax},~{rcx},~{rdx},~{r8},~{r9},~{r10},~{r11},~{memory}"(ptr %msg, i32 %x, i64 %WIN_STDOUT_HANDLE_load)
  ret void
}

define void @standard__io__console__print__0__ret_voidE1() {
entry:
  %str_stack = alloca [3 x i8], align 1
  %str_char_0 = getelementptr [3 x i8], ptr %str_stack, i32 0, i32 0
  store i8 13, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [3 x i8], ptr %str_stack, i32 0, i32 1
  store i8 10, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [3 x i8], ptr %str_stack, i32 0, i32 2
  store i8 0, ptr %str_char_2, align 1
  %arg0_decay = getelementptr [3 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %arg0_decay, i32 2)
  ret void
}

define void @standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1(ptr %s, i32 %len) {
entry:
  call void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %s, i32 %len)
  ret void
}

define void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %s) {
entry:
  %.4 = call i32 @standard__strings__strlen__1__byteE1_ptr1__ret_intE1(ptr %s)
  call void @standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1(ptr %s, i32 %.4)
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

define void @standard__io__console__println__1__byteE1_arr__ret_voidE1(ptr %s) {
entry:
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %s)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__byteE1__ret_voidE1(i8 %s) {
entry:
  %s.addr = alloca i8, align 1
  store i8 %s, ptr %s.addr, align 1
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %s.addr)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__charE1__ret_voidE1(i8 %s) {
entry:
  %s.addr = alloca i8, align 1
  store i8 %s, ptr %s.addr, align 1
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %s.addr)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__boolE1__ret_voidE1(i1 %x) {
entry:
  call void @standard__io__console__print__1__boolE1__ret_voidE1(i1 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__dataE1_sbits8__ret_voidE1(i8 %x) {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, ptr %x.addr, align 1
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %x.addr)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__dataE1_sbits16__ret_voidE1(i16 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_sbits16__ret_voidE1(i16 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__dataE1_ubits16__ret_voidE1(i16 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_ubits16__ret_voidE1(i16 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__intE1__ret_voidE1(i32 %x) {
entry:
  call void @standard__io__console__print__1__intE1__ret_voidE1(i32 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__uintE1__ret_voidE1(i32 %x) {
entry:
  call void @standard__io__console__print__1__intE1__ret_voidE1(i32 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__longE1__ret_voidE1(i64 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_ubits64__ret_voidE1(i64 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__ulongE1__ret_voidE1(i64 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_ubits64__ret_voidE1(i64 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__floatE1__ret_voidE1(float %x) {
entry:
  call void @standard__io__console__print__1__floatE1__ret_voidE1(float %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__doubleE1__ret_voidE1(double %x) {
entry:
  call void @standard__io__console__print__1__doubleE1__ret_voidE1(double %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__dataE1_sbits32__ret_voidE1(i32 %x) {
entry:
  call void @standard__io__console__print__1__dataE1_sbits32__ret_voidE1(i32 %x)
  call void @standard__io__console__print__0__ret_voidE1()
  ret void
}

define void @standard__io__console__println__1__dataE1_ubits32__ret_voidE1(i32 %x) {
entry:
  call void @standard__io__console__print__1__intE1__ret_voidE1(i32 %x)
  call void @standard__io__console__print__0__ret_voidE1()
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
  %str_stack = alloca [13 x i8], align 1
  %str_char_0 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 0
  store i8 72, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 1
  store i8 101, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 2
  store i8 108, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 3
  store i8 108, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 4
  store i8 111, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 5
  store i8 32, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 6
  store i8 87, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 7
  store i8 111, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 8
  store i8 114, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 9
  store i8 108, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 10
  store i8 100, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 11
  store i8 33, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 12
  store i8 0, ptr %str_char_12, align 1
  %arg0_decay = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__println__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  ret i32 0
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
  %argc.0 = phi i32 [ 0, %entry ], [ %.77, %ifcont.1 ]
  %ptr_gep = getelementptr inbounds i16, ptr %.19, i32 %pos.0
  %ptr_load = load i16, ptr %ptr_gep, align 2
  %.22 = trunc i32 0 to i16
  %.23 = icmp ne i16 %ptr_load, %.22
  br i1 %.23, label %while.cond.1, label %while.end

while.end:                                        ; preds = %while.end.1, %while.cond
  %.80 = zext i32 %argc.0 to i64
  %.81 = sext i32 8 to i64
  %.82 = mul i64 %.80, %.81
  %.83 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.82)
  %int_to_ptr = inttoptr i64 %.83 to ptr
  br label %while.cond.4

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %pos.110 = phi i32 [ %.32, %while.body.1 ], [ %pos.0, %while.cond ]
  %ptr_gep.1 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.1 = load i16, ptr %ptr_gep.1, align 2
  %.26 = trunc i32 32 to i16
  %.27 = icmp eq i16 %ptr_load.1, %.26
  %ptr_gep.2 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.2 = load i16, ptr %ptr_gep.2, align 2
  %.28 = trunc i32 9 to i16
  %.29 = icmp eq i16 %ptr_load.2, %.28
  %.30 = or i1 %.27, %.29
  br i1 %.30, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.32 = add i32 %pos.110, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %ptr_gep.3 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.3 = load i16, ptr %ptr_gep.3, align 2
  %.35 = trunc i32 0 to i16
  %.36 = icmp eq i16 %ptr_load.3, %.35
  br i1 %.36, label %while.end, label %ifcont

ifcont:                                           ; preds = %while.end.1
  %ptr_gep.4 = getelementptr inbounds i16, ptr %.19, i32 %pos.110
  %ptr_load.4 = load i16, ptr %ptr_gep.4, align 2
  %.40 = trunc i32 34 to i16
  %.41 = icmp eq i16 %ptr_load.4, %.40
  br i1 %.41, label %then.1, label %while.cond.3

then.1:                                           ; preds = %ifcont
  %.43 = add i32 %pos.110, 1
  br label %while.cond.2

ifcont.1:                                         ; preds = %while.cond.3, %while.end.2
  %pos.514 = phi i32 [ %pos.615, %while.end.2 ], [ %pos.413, %while.cond.3 ]
  %.77 = add i32 %argc.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %while.body.2, %then.1
  %pos.312 = phi i32 [ %.43, %then.1 ], [ %.52, %while.body.2 ]
  %ptr_gep.5 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.5 = load i16, ptr %ptr_gep.5, align 2
  %.46 = trunc i32 0 to i16
  %.47 = icmp ne i16 %ptr_load.5, %.46
  %ptr_gep.6 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.6 = load i16, ptr %ptr_gep.6, align 2
  %.48 = trunc i32 34 to i16
  %.49 = icmp ne i16 %ptr_load.6, %.48
  %.50 = and i1 %.47, %.49
  br i1 %.50, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.52 = add i32 %pos.312, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  %ptr_gep.7 = getelementptr inbounds i16, ptr %.19, i32 %pos.312
  %ptr_load.7 = load i16, ptr %ptr_gep.7, align 2
  %.55 = trunc i32 34 to i16
  %.56 = icmp eq i16 %ptr_load.7, %.55
  %.58 = add i32 %pos.312, 1
  %pos.615 = select i1 %.56, i32 %.58, i32 %pos.312
  br label %ifcont.1

while.cond.3:                                     ; preds = %ifcont, %while.body.3
  %pos.413 = phi i32 [ %.73, %while.body.3 ], [ %pos.110, %ifcont ]
  %ptr_gep.8 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.8 = load i16, ptr %ptr_gep.8, align 2
  %.64 = trunc i32 0 to i16
  %.65 = icmp ne i16 %ptr_load.8, %.64
  %ptr_gep.9 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.9 = load i16, ptr %ptr_gep.9, align 2
  %.66 = trunc i32 32 to i16
  %.67 = icmp ne i16 %ptr_load.9, %.66
  %.68 = and i1 %.65, %.67
  %ptr_gep.10 = getelementptr inbounds i16, ptr %.19, i32 %pos.413
  %ptr_load.10 = load i16, ptr %ptr_gep.10, align 2
  %.69 = trunc i32 9 to i16
  %.70 = icmp ne i16 %ptr_load.10, %.69
  %.71 = and i1 %.68, %.70
  br i1 %.71, label %while.body.3, label %ifcont.1

while.body.3:                                     ; preds = %while.cond.3
  %.73 = add i32 %pos.413, 1
  br label %while.cond.3

while.cond.4:                                     ; preds = %while.end.8, %while.end
  %pos.211 = phi i32 [ 0, %while.end ], [ %pos.1019, %while.end.8 ]
  %argi.0 = phi i32 [ 0, %while.end ], [ %.172, %while.end.8 ]
  %ptr_gep.11 = getelementptr inbounds i16, ptr %.19, i32 %pos.211
  %ptr_load.11 = load i16, ptr %ptr_gep.11, align 2
  %.88 = trunc i32 0 to i16
  %.89 = icmp ne i16 %ptr_load.11, %.88
  br i1 %.89, label %while.cond.5, label %while.end.4

while.end.4:                                      ; preds = %while.end.5, %while.cond.4
  %.175 = icmp sgt i32 %argc.0, 1
  br i1 %.175, label %then.6, label %else.6

while.cond.5:                                     ; preds = %while.cond.4, %while.body.5
  %pos.716 = phi i32 [ %.98, %while.body.5 ], [ %pos.211, %while.cond.4 ]
  %ptr_gep.12 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.12 = load i16, ptr %ptr_gep.12, align 2
  %.92 = trunc i32 32 to i16
  %.93 = icmp eq i16 %ptr_load.12, %.92
  %ptr_gep.13 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.13 = load i16, ptr %ptr_gep.13, align 2
  %.94 = trunc i32 9 to i16
  %.95 = icmp eq i16 %ptr_load.13, %.94
  %.96 = or i1 %.93, %.95
  br i1 %.96, label %while.body.5, label %while.end.5

while.body.5:                                     ; preds = %while.cond.5
  %.98 = add i32 %pos.716, 1
  br label %while.cond.5

while.end.5:                                      ; preds = %while.cond.5
  %ptr_gep.14 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.14 = load i16, ptr %ptr_gep.14, align 2
  %.101 = trunc i32 0 to i16
  %.102 = icmp eq i16 %ptr_load.14, %.101
  br i1 %.102, label %while.end.4, label %ifcont.3

ifcont.3:                                         ; preds = %while.end.5
  %ptr_gep.15 = getelementptr inbounds i16, ptr %.19, i32 %pos.716
  %ptr_load.15 = load i16, ptr %ptr_gep.15, align 2
  %.108 = trunc i32 34 to i16
  %.109 = icmp eq i16 %ptr_load.15, %.108
  br i1 %.109, label %then.4, label %while.cond.7

then.4:                                           ; preds = %ifcont.3
  %.112 = add i32 %pos.716, 1
  br label %while.cond.6

ifcont.4:                                         ; preds = %while.cond.7, %while.end.6
  %len.222 = phi i32 [ %len.0, %while.end.6 ], [ %len.121, %while.cond.7 ]
  %start.0 = phi i32 [ %.112, %while.end.6 ], [ %pos.716, %while.cond.7 ]
  %pos.1019 = phi i32 [ %pos.1120, %while.end.6 ], [ %pos.918, %while.cond.7 ]
  %.151 = zext i32 %len.222 to i64
  %.152 = sext i32 1 to i64
  %.153 = add i64 %.151, %.152
  %.154 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.153)
  %int_to_ptr.1 = inttoptr i64 %.154 to ptr
  br label %while.cond.8

while.cond.6:                                     ; preds = %while.body.6, %then.4
  %len.0 = phi i32 [ 0, %then.4 ], [ %.122, %while.body.6 ]
  %pos.817 = phi i32 [ %.112, %then.4 ], [ %.124, %while.body.6 ]
  %ptr_gep.16 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.16 = load i16, ptr %ptr_gep.16, align 2
  %.116 = trunc i32 0 to i16
  %.117 = icmp ne i16 %ptr_load.16, %.116
  %ptr_gep.17 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.17 = load i16, ptr %ptr_gep.17, align 2
  %.118 = trunc i32 34 to i16
  %.119 = icmp ne i16 %ptr_load.17, %.118
  %.120 = and i1 %.117, %.119
  br i1 %.120, label %while.body.6, label %while.end.6

while.body.6:                                     ; preds = %while.cond.6
  %.122 = add i32 %len.0, 1
  %.124 = add i32 %pos.817, 1
  br label %while.cond.6

while.end.6:                                      ; preds = %while.cond.6
  %ptr_gep.18 = getelementptr inbounds i16, ptr %.19, i32 %pos.817
  %ptr_load.18 = load i16, ptr %ptr_gep.18, align 2
  %.127 = trunc i32 34 to i16
  %.128 = icmp eq i16 %ptr_load.18, %.127
  %.130 = add i32 %pos.817, 1
  %pos.1120 = select i1 %.128, i32 %.130, i32 %pos.817
  br label %ifcont.4

while.cond.7:                                     ; preds = %ifcont.3, %while.body.7
  %len.121 = phi i32 [ %.145, %while.body.7 ], [ 0, %ifcont.3 ]
  %pos.918 = phi i32 [ %.147, %while.body.7 ], [ %pos.716, %ifcont.3 ]
  %ptr_gep.19 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.19 = load i16, ptr %ptr_gep.19, align 2
  %.136 = trunc i32 0 to i16
  %.137 = icmp ne i16 %ptr_load.19, %.136
  %ptr_gep.20 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.20 = load i16, ptr %ptr_gep.20, align 2
  %.138 = trunc i32 32 to i16
  %.139 = icmp ne i16 %ptr_load.20, %.138
  %.140 = and i1 %.137, %.139
  %ptr_gep.21 = getelementptr inbounds i16, ptr %.19, i32 %pos.918
  %ptr_load.21 = load i16, ptr %ptr_gep.21, align 2
  %.141 = trunc i32 9 to i16
  %.142 = icmp ne i16 %ptr_load.21, %.141
  %.143 = and i1 %.140, %.142
  br i1 %.143, label %while.body.7, label %ifcont.4

while.body.7:                                     ; preds = %while.cond.7
  %.145 = add i32 %len.121, 1
  %.147 = add i32 %pos.918, 1
  br label %while.cond.7

while.cond.8:                                     ; preds = %while.body.8, %ifcont.4
  %j.0 = phi i32 [ 0, %ifcont.4 ], [ %.164, %while.body.8 ]
  %.158 = icmp slt i32 %j.0, %len.222
  br i1 %.158, label %while.body.8, label %while.end.8

while.body.8:                                     ; preds = %while.cond.8
  %.160 = add i32 %start.0, %j.0
  %ptr_gep.22 = getelementptr inbounds i16, ptr %.19, i32 %.160
  %ptr_load.22 = load i16, ptr %ptr_gep.22, align 2
  %.161 = trunc i16 %ptr_load.22 to i8
  %.162 = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %j.0
  store i8 %.161, ptr %.162, align 1
  %.164 = add i32 %j.0, 1
  br label %while.cond.8

while.end.8:                                      ; preds = %while.cond.8
  %.167 = trunc i32 0 to i8
  %.168 = getelementptr inbounds i8, ptr %int_to_ptr.1, i32 %len.222
  store i8 %.167, ptr %.168, align 1
  %.170 = getelementptr inbounds ptr, ptr %int_to_ptr, i32 %argi.0
  store ptr %int_to_ptr.1, ptr %.170, align 8
  %.172 = add i32 %argi.0, 1
  br label %while.cond.4

then.6:                                           ; preds = %while.end.4
  %.177 = call i32 @main__2__intE1__byteE1_ptr2__ret_intE1(i32 %argc.0, ptr %int_to_ptr)
  br label %ifcont.6

else.6:                                           ; preds = %while.end.4
  %op_overload_result.3 = call i32 @main__0__ret_intE1()
  br label %ifcont.6

ifcont.6:                                         ; preds = %else.6, %then.6
  %return_code.0 = phi i32 [ %.177, %then.6 ], [ %op_overload_result.3, %else.6 ]
  br label %while.cond.9

while.cond.9:                                     ; preds = %while.body.9, %ifcont.6
  %k.0 = phi i32 [ 0, %ifcont.6 ], [ %.186, %while.body.9 ]
  %.183 = icmp slt i32 %k.0, %argc.0
  br i1 %.183, label %while.body.9, label %while.end.9

while.body.9:                                     ; preds = %while.cond.9
  %ptr_gep.23 = getelementptr inbounds ptr, ptr %int_to_ptr, i32 %k.0
  %ptr_load.23 = load ptr, ptr %ptr_gep.23, align 8
  %ptr_to_int = ptrtoint ptr %ptr_load.23 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int)
  %.186 = add i32 %k.0, 1
  br label %while.cond.9

while.end.9:                                      ; preds = %while.cond.9
  %.189 = icmp ne i32 %return_code.0, 0
  %.191 = sub i32 0, 1073741819
  %.192 = icmp eq i32 %return_code.0, %.191
  %or.cond = and i1 %.189, %.192
  br i1 %or.cond, label %then.8, label %ifcont.7

ifcont.7:                                         ; preds = %then.8, %while.end.9
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #0

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: write) }
