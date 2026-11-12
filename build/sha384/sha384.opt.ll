; ModuleID = 'build\sha384\sha384.ll'
source_filename = "build\\sha384\\sha384.ll"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%Exception = type { ptr, i32, %ExceptionState }
%ExceptionState = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%FreeNode = type { ptr }
%BlockEntry = type { i64, i64, i64, i64 }
%Slab = type { i64, i64, i64, i64, ptr }
%standard__crypto__hashing__SHA384__SHA384_CTX = type { [8 x i64], [128 x i8], i64, i64, i32 }

@standard__system__cpu__g_l2_bytes = internal global i64 0
@standard__system__cpu__g_ermsb = internal global i1 false
@standard__system__cpu__g_cpuid_run = internal global i1 false
@standard__memory__allocators__stdheap__g_next_slab_size = internal global i64 4194304
@standard__memory__allocators__stdheap__g_slab_size_cap = internal global i64 67108864
@standard__memory__allocators__stdheap__g_large_used = internal global i64 0
@standard__memory__allocators__stdheap__g_table_cap = internal global i64 0
@standard__memory__allocators__stdheap__g_table_count = internal global i64 0
@standard__memory__allocators__stdheap__g_table_slab_cap = internal global i64 0
@standard__io__console__out_buf = internal global [8192 x i8] zeroinitializer
@standard__io__console__out_len = internal global i32 0
@standard__crypto__hashing__SHA384__K384 = internal global [80 x i64] [i64 4794697086780616226, i64 8158064640168781261, i64 -5349999486874862801, i64 -1606136188198331460, i64 4131703408338449720, i64 6480981068601479193, i64 -7908458776815382629, i64 -6116909921290321640, i64 -2880145864133508542, i64 1334009975649890238, i64 2608012711638119052, i64 6128411473006802146, i64 8268148722764581231, i64 -9160688886553864527, i64 -7215885187991268811, i64 -4495734319001033068, i64 -1973867731355612462, i64 -1171420211273849373, i64 1135362057144423861, i64 2597628984639134821, i64 3308224258029322869, i64 5365058923640841347, i64 6679025012923562964, i64 8573033837759648693, i64 -7476448914759557205, i64 -6327057829258317296, i64 -5763719355590565569, i64 -4658551843659510044, i64 -4116276920077217854, i64 -3051310485924567259, i64 489312712824947311, i64 1452737877330783856, i64 2861767655752347644, i64 3322285676063803686, i64 5560940570517711597, i64 5996557281743188959, i64 7280758554555802590, i64 8532644243296465576, i64 -9096487096722542874, i64 -7894198246740708037, i64 -6719396339535248540, i64 -6333637450476146687, i64 -4446306890439682159, i64 -4076793802049405392, i64 -3345356375505022440, i64 -2983346525034927856, i64 -860691631967231958, i64 1182934255886127544, i64 1847814050463011016, i64 2177327727835720531, i64 2830643537854262169, i64 3796741975233480872, i64 4115178125766777443, i64 5681478168544905931, i64 6601373596472566643, i64 7507060721942968483, i64 8399075790359081724, i64 8693463985226723168, i64 -8878714635349349518, i64 -8302665154208450068, i64 -8016688836872298968, i64 -6606660893046293015, i64 -4685533653050689259, i64 -4147400797238176981, i64 -3880063495543823972, i64 -3348786107499101689, i64 -1523767162380948706, i64 -757361751448694408, i64 500013540394364858, i64 748580250866718886, i64 1242879168328830382, i64 1977374033974150939, i64 2944078676154940804, i64 3659926193048069267, i64 4368137639120453308, i64 4836135668995329356, i64 5532061633213252278, i64 6448918945643986474, i64 6902733635092675308, i64 7801388544844847127]
@standard__crypto__hashing__SHA384__SHA384_CTX.TLD = internal constant { i32, i32, [5 x { i32, i32, i32 }] } { i32 1696, i32 5, [5 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 512, i32 1 }, { i32, i32, i32 } { i32 512, i32 1024, i32 8 }, { i32, i32, i32 } { i32 1536, i32 64, i32 1 }, { i32, i32, i32 } { i32 1600, i32 64, i32 1 }, { i32, i32, i32 } { i32 1664, i32 32, i32 1 }] }
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
@BigInt.TLD = internal constant { i32, i32, [3 x { i32, i32, i32 }] } { i32 4129, i32 3, [3 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 4096, i32 32 }, { i32, i32, i32 } { i32 4096, i32 32, i32 32 }, { i32, i32, i32 } { i32 4128, i32 1, i32 1 }] }
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
  %msg = alloca [3 x i8], align 1
  %.fca.0.gep54 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep54, align 1
  %.fca.1.gep55 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep55, align 1
  %.fca.2.gep56 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep56, align 1
  %hash = alloca [48 x i8], align 1
  %.fca.0.gep6 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep6, align 1
  %.fca.1.gep7 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep7, align 1
  %.fca.2.gep8 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep8, align 1
  %.fca.3.gep9 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep9, align 1
  %.fca.4.gep10 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep10, align 1
  %.fca.5.gep11 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep11, align 1
  %.fca.6.gep12 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep12, align 1
  %.fca.7.gep13 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep13, align 1
  %.fca.8.gep14 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep14, align 1
  %.fca.9.gep15 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep15, align 1
  %.fca.10.gep16 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep16, align 1
  %.fca.11.gep17 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep17, align 1
  %.fca.12.gep18 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep18, align 1
  %.fca.13.gep19 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep19, align 1
  %.fca.14.gep20 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep20, align 1
  %.fca.15.gep21 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep21, align 1
  %.fca.16.gep22 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep22, align 1
  %.fca.17.gep23 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep23, align 1
  %.fca.18.gep24 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep24, align 1
  %.fca.19.gep25 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep25, align 1
  %.fca.20.gep26 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep26, align 1
  %.fca.21.gep27 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep27, align 1
  %.fca.22.gep28 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep28, align 1
  %.fca.23.gep29 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep29, align 1
  %.fca.24.gep30 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep30, align 1
  %.fca.25.gep31 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep31, align 1
  %.fca.26.gep32 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep32, align 1
  %.fca.27.gep33 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep33, align 1
  %.fca.28.gep34 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep34, align 1
  %.fca.29.gep35 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep35, align 1
  %.fca.30.gep36 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep36, align 1
  %.fca.31.gep37 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep37, align 1
  %.fca.32.gep38 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep38, align 1
  %.fca.33.gep39 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep39, align 1
  %.fca.34.gep40 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep40, align 1
  %.fca.35.gep41 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep41, align 1
  %.fca.36.gep42 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep42, align 1
  %.fca.37.gep43 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep43, align 1
  %.fca.38.gep44 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep44, align 1
  %.fca.39.gep45 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep45, align 1
  %.fca.40.gep46 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep46, align 1
  %.fca.41.gep47 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep47, align 1
  %.fca.42.gep48 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep48, align 1
  %.fca.43.gep49 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep49, align 1
  %.fca.44.gep50 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep50, align 1
  %.fca.45.gep51 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep51, align 1
  %.fca.46.gep52 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep52, align 1
  %.fca.47.gep53 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep53, align 1
  %exp = alloca [48 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep3 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep3, align 1
  %.fca.3.gep4 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep4, align 1
  %.fca.4.gep5 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep5, align 1
  %.fca.5.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 23
  store i8 0, ptr %.fca.23.gep, align 1
  %.fca.24.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 24
  store i8 0, ptr %.fca.24.gep, align 1
  %.fca.25.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 25
  store i8 0, ptr %.fca.25.gep, align 1
  %.fca.26.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 26
  store i8 0, ptr %.fca.26.gep, align 1
  %.fca.27.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 27
  store i8 0, ptr %.fca.27.gep, align 1
  %.fca.28.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 28
  store i8 0, ptr %.fca.28.gep, align 1
  %.fca.29.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 29
  store i8 0, ptr %.fca.29.gep, align 1
  %.fca.30.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 30
  store i8 0, ptr %.fca.30.gep, align 1
  %.fca.31.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 31
  store i8 0, ptr %.fca.31.gep, align 1
  %.fca.32.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 32
  store i8 0, ptr %.fca.32.gep, align 1
  %.fca.33.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 33
  store i8 0, ptr %.fca.33.gep, align 1
  %.fca.34.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 34
  store i8 0, ptr %.fca.34.gep, align 1
  %.fca.35.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 35
  store i8 0, ptr %.fca.35.gep, align 1
  %.fca.36.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 36
  store i8 0, ptr %.fca.36.gep, align 1
  %.fca.37.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 37
  store i8 0, ptr %.fca.37.gep, align 1
  %.fca.38.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 38
  store i8 0, ptr %.fca.38.gep, align 1
  %.fca.39.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 39
  store i8 0, ptr %.fca.39.gep, align 1
  %.fca.40.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 40
  store i8 0, ptr %.fca.40.gep, align 1
  %.fca.41.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 41
  store i8 0, ptr %.fca.41.gep, align 1
  %.fca.42.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 42
  store i8 0, ptr %.fca.42.gep, align 1
  %.fca.43.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 43
  store i8 0, ptr %.fca.43.gep, align 1
  %.fca.44.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 44
  store i8 0, ptr %.fca.44.gep, align 1
  %.fca.45.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 45
  store i8 0, ptr %.fca.45.gep, align 1
  %.fca.46.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 46
  store i8 0, ptr %.fca.46.gep, align 1
  %.fca.47.gep = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 47
  store i8 0, ptr %.fca.47.gep, align 1
  %ctx = alloca %standard__crypto__hashing__SHA384__SHA384_CTX, align 8
  %.fca.0.0.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 0
  store i64 0, ptr %.fca.0.0.gep, align 8
  %.fca.0.1.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 1
  store i64 0, ptr %.fca.0.1.gep, align 8
  %.fca.0.2.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 2
  store i64 0, ptr %.fca.0.2.gep, align 8
  %.fca.0.3.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 3
  store i64 0, ptr %.fca.0.3.gep, align 8
  %.fca.0.4.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 4
  store i64 0, ptr %.fca.0.4.gep, align 8
  %.fca.0.5.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 5
  store i64 0, ptr %.fca.0.5.gep, align 8
  %.fca.0.6.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 6
  store i64 0, ptr %.fca.0.6.gep, align 8
  %.fca.0.7.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0, i32 7
  store i64 0, ptr %.fca.0.7.gep, align 8
  %.fca.1.0.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 0
  store i8 0, ptr %.fca.1.0.gep, align 8
  %.fca.1.1.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 1
  store i8 0, ptr %.fca.1.1.gep, align 1
  %.fca.1.2.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 2
  store i8 0, ptr %.fca.1.2.gep, align 2
  %.fca.1.3.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 3
  store i8 0, ptr %.fca.1.3.gep, align 1
  %.fca.1.4.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 4
  store i8 0, ptr %.fca.1.4.gep, align 4
  %.fca.1.5.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 5
  store i8 0, ptr %.fca.1.5.gep, align 1
  %.fca.1.6.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 6
  store i8 0, ptr %.fca.1.6.gep, align 2
  %.fca.1.7.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 7
  store i8 0, ptr %.fca.1.7.gep, align 1
  %.fca.1.8.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 8
  store i8 0, ptr %.fca.1.8.gep, align 8
  %.fca.1.9.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 9
  store i8 0, ptr %.fca.1.9.gep, align 1
  %.fca.1.10.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 10
  store i8 0, ptr %.fca.1.10.gep, align 2
  %.fca.1.11.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 11
  store i8 0, ptr %.fca.1.11.gep, align 1
  %.fca.1.12.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 12
  store i8 0, ptr %.fca.1.12.gep, align 4
  %.fca.1.13.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 13
  store i8 0, ptr %.fca.1.13.gep, align 1
  %.fca.1.14.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 14
  store i8 0, ptr %.fca.1.14.gep, align 2
  %.fca.1.15.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 15
  store i8 0, ptr %.fca.1.15.gep, align 1
  %.fca.1.16.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 16
  store i8 0, ptr %.fca.1.16.gep, align 8
  %.fca.1.17.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 17
  store i8 0, ptr %.fca.1.17.gep, align 1
  %.fca.1.18.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 18
  store i8 0, ptr %.fca.1.18.gep, align 2
  %.fca.1.19.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 19
  store i8 0, ptr %.fca.1.19.gep, align 1
  %.fca.1.20.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 20
  store i8 0, ptr %.fca.1.20.gep, align 4
  %.fca.1.21.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 21
  store i8 0, ptr %.fca.1.21.gep, align 1
  %.fca.1.22.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 22
  store i8 0, ptr %.fca.1.22.gep, align 2
  %.fca.1.23.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 23
  store i8 0, ptr %.fca.1.23.gep, align 1
  %.fca.1.24.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 24
  store i8 0, ptr %.fca.1.24.gep, align 8
  %.fca.1.25.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 25
  store i8 0, ptr %.fca.1.25.gep, align 1
  %.fca.1.26.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 26
  store i8 0, ptr %.fca.1.26.gep, align 2
  %.fca.1.27.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 27
  store i8 0, ptr %.fca.1.27.gep, align 1
  %.fca.1.28.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 28
  store i8 0, ptr %.fca.1.28.gep, align 4
  %.fca.1.29.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 29
  store i8 0, ptr %.fca.1.29.gep, align 1
  %.fca.1.30.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 30
  store i8 0, ptr %.fca.1.30.gep, align 2
  %.fca.1.31.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 31
  store i8 0, ptr %.fca.1.31.gep, align 1
  %.fca.1.32.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 32
  store i8 0, ptr %.fca.1.32.gep, align 8
  %.fca.1.33.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 33
  store i8 0, ptr %.fca.1.33.gep, align 1
  %.fca.1.34.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 34
  store i8 0, ptr %.fca.1.34.gep, align 2
  %.fca.1.35.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 35
  store i8 0, ptr %.fca.1.35.gep, align 1
  %.fca.1.36.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 36
  store i8 0, ptr %.fca.1.36.gep, align 4
  %.fca.1.37.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 37
  store i8 0, ptr %.fca.1.37.gep, align 1
  %.fca.1.38.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 38
  store i8 0, ptr %.fca.1.38.gep, align 2
  %.fca.1.39.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 39
  store i8 0, ptr %.fca.1.39.gep, align 1
  %.fca.1.40.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 40
  store i8 0, ptr %.fca.1.40.gep, align 8
  %.fca.1.41.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 41
  store i8 0, ptr %.fca.1.41.gep, align 1
  %.fca.1.42.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 42
  store i8 0, ptr %.fca.1.42.gep, align 2
  %.fca.1.43.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 43
  store i8 0, ptr %.fca.1.43.gep, align 1
  %.fca.1.44.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 44
  store i8 0, ptr %.fca.1.44.gep, align 4
  %.fca.1.45.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 45
  store i8 0, ptr %.fca.1.45.gep, align 1
  %.fca.1.46.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 46
  store i8 0, ptr %.fca.1.46.gep, align 2
  %.fca.1.47.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 47
  store i8 0, ptr %.fca.1.47.gep, align 1
  %.fca.1.48.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 48
  store i8 0, ptr %.fca.1.48.gep, align 8
  %.fca.1.49.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 49
  store i8 0, ptr %.fca.1.49.gep, align 1
  %.fca.1.50.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 50
  store i8 0, ptr %.fca.1.50.gep, align 2
  %.fca.1.51.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 51
  store i8 0, ptr %.fca.1.51.gep, align 1
  %.fca.1.52.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 52
  store i8 0, ptr %.fca.1.52.gep, align 4
  %.fca.1.53.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 53
  store i8 0, ptr %.fca.1.53.gep, align 1
  %.fca.1.54.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 54
  store i8 0, ptr %.fca.1.54.gep, align 2
  %.fca.1.55.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 55
  store i8 0, ptr %.fca.1.55.gep, align 1
  %.fca.1.56.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 56
  store i8 0, ptr %.fca.1.56.gep, align 8
  %.fca.1.57.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 57
  store i8 0, ptr %.fca.1.57.gep, align 1
  %.fca.1.58.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 58
  store i8 0, ptr %.fca.1.58.gep, align 2
  %.fca.1.59.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 59
  store i8 0, ptr %.fca.1.59.gep, align 1
  %.fca.1.60.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 60
  store i8 0, ptr %.fca.1.60.gep, align 4
  %.fca.1.61.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 61
  store i8 0, ptr %.fca.1.61.gep, align 1
  %.fca.1.62.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 62
  store i8 0, ptr %.fca.1.62.gep, align 2
  %.fca.1.63.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 63
  store i8 0, ptr %.fca.1.63.gep, align 1
  %.fca.1.64.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 64
  store i8 0, ptr %.fca.1.64.gep, align 8
  %.fca.1.65.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 65
  store i8 0, ptr %.fca.1.65.gep, align 1
  %.fca.1.66.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 66
  store i8 0, ptr %.fca.1.66.gep, align 2
  %.fca.1.67.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 67
  store i8 0, ptr %.fca.1.67.gep, align 1
  %.fca.1.68.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 68
  store i8 0, ptr %.fca.1.68.gep, align 4
  %.fca.1.69.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 69
  store i8 0, ptr %.fca.1.69.gep, align 1
  %.fca.1.70.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 70
  store i8 0, ptr %.fca.1.70.gep, align 2
  %.fca.1.71.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 71
  store i8 0, ptr %.fca.1.71.gep, align 1
  %.fca.1.72.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 72
  store i8 0, ptr %.fca.1.72.gep, align 8
  %.fca.1.73.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 73
  store i8 0, ptr %.fca.1.73.gep, align 1
  %.fca.1.74.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 74
  store i8 0, ptr %.fca.1.74.gep, align 2
  %.fca.1.75.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 75
  store i8 0, ptr %.fca.1.75.gep, align 1
  %.fca.1.76.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 76
  store i8 0, ptr %.fca.1.76.gep, align 4
  %.fca.1.77.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 77
  store i8 0, ptr %.fca.1.77.gep, align 1
  %.fca.1.78.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 78
  store i8 0, ptr %.fca.1.78.gep, align 2
  %.fca.1.79.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 79
  store i8 0, ptr %.fca.1.79.gep, align 1
  %.fca.1.80.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 80
  store i8 0, ptr %.fca.1.80.gep, align 8
  %.fca.1.81.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 81
  store i8 0, ptr %.fca.1.81.gep, align 1
  %.fca.1.82.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 82
  store i8 0, ptr %.fca.1.82.gep, align 2
  %.fca.1.83.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 83
  store i8 0, ptr %.fca.1.83.gep, align 1
  %.fca.1.84.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 84
  store i8 0, ptr %.fca.1.84.gep, align 4
  %.fca.1.85.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 85
  store i8 0, ptr %.fca.1.85.gep, align 1
  %.fca.1.86.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 86
  store i8 0, ptr %.fca.1.86.gep, align 2
  %.fca.1.87.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 87
  store i8 0, ptr %.fca.1.87.gep, align 1
  %.fca.1.88.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 88
  store i8 0, ptr %.fca.1.88.gep, align 8
  %.fca.1.89.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 89
  store i8 0, ptr %.fca.1.89.gep, align 1
  %.fca.1.90.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 90
  store i8 0, ptr %.fca.1.90.gep, align 2
  %.fca.1.91.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 91
  store i8 0, ptr %.fca.1.91.gep, align 1
  %.fca.1.92.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 92
  store i8 0, ptr %.fca.1.92.gep, align 4
  %.fca.1.93.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 93
  store i8 0, ptr %.fca.1.93.gep, align 1
  %.fca.1.94.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 94
  store i8 0, ptr %.fca.1.94.gep, align 2
  %.fca.1.95.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 95
  store i8 0, ptr %.fca.1.95.gep, align 1
  %.fca.1.96.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 96
  store i8 0, ptr %.fca.1.96.gep, align 8
  %.fca.1.97.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 97
  store i8 0, ptr %.fca.1.97.gep, align 1
  %.fca.1.98.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 98
  store i8 0, ptr %.fca.1.98.gep, align 2
  %.fca.1.99.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 99
  store i8 0, ptr %.fca.1.99.gep, align 1
  %.fca.1.100.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 100
  store i8 0, ptr %.fca.1.100.gep, align 4
  %.fca.1.101.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 101
  store i8 0, ptr %.fca.1.101.gep, align 1
  %.fca.1.102.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 102
  store i8 0, ptr %.fca.1.102.gep, align 2
  %.fca.1.103.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 103
  store i8 0, ptr %.fca.1.103.gep, align 1
  %.fca.1.104.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 104
  store i8 0, ptr %.fca.1.104.gep, align 8
  %.fca.1.105.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 105
  store i8 0, ptr %.fca.1.105.gep, align 1
  %.fca.1.106.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 106
  store i8 0, ptr %.fca.1.106.gep, align 2
  %.fca.1.107.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 107
  store i8 0, ptr %.fca.1.107.gep, align 1
  %.fca.1.108.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 108
  store i8 0, ptr %.fca.1.108.gep, align 4
  %.fca.1.109.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 109
  store i8 0, ptr %.fca.1.109.gep, align 1
  %.fca.1.110.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 110
  store i8 0, ptr %.fca.1.110.gep, align 2
  %.fca.1.111.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 111
  store i8 0, ptr %.fca.1.111.gep, align 1
  %.fca.1.112.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 112
  store i8 0, ptr %.fca.1.112.gep, align 8
  %.fca.1.113.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 113
  store i8 0, ptr %.fca.1.113.gep, align 1
  %.fca.1.114.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 114
  store i8 0, ptr %.fca.1.114.gep, align 2
  %.fca.1.115.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 115
  store i8 0, ptr %.fca.1.115.gep, align 1
  %.fca.1.116.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 116
  store i8 0, ptr %.fca.1.116.gep, align 4
  %.fca.1.117.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 117
  store i8 0, ptr %.fca.1.117.gep, align 1
  %.fca.1.118.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 118
  store i8 0, ptr %.fca.1.118.gep, align 2
  %.fca.1.119.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 119
  store i8 0, ptr %.fca.1.119.gep, align 1
  %.fca.1.120.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 120
  store i8 0, ptr %.fca.1.120.gep, align 8
  %.fca.1.121.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 121
  store i8 0, ptr %.fca.1.121.gep, align 1
  %.fca.1.122.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 122
  store i8 0, ptr %.fca.1.122.gep, align 2
  %.fca.1.123.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 123
  store i8 0, ptr %.fca.1.123.gep, align 1
  %.fca.1.124.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 124
  store i8 0, ptr %.fca.1.124.gep, align 4
  %.fca.1.125.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 125
  store i8 0, ptr %.fca.1.125.gep, align 1
  %.fca.1.126.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 126
  store i8 0, ptr %.fca.1.126.gep, align 2
  %.fca.1.127.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1, i32 127
  store i8 0, ptr %.fca.1.127.gep, align 1
  %.fca.2.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep, align 8
  %.fca.3.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep, align 8
  %.fca.4.gep = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  store i32 0, ptr %.fca.4.gep, align 8
  %.9 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 0
  store i8 97, ptr %.9, align 1
  %.11 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 1
  store i8 98, ptr %.11, align 1
  %.13 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 2
  store i8 99, ptr %.13, align 1
  %.15 = trunc i32 203 to i8
  %.16 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 0
  store i8 %.15, ptr %.16, align 1
  %.18 = trunc i32 0 to i8
  %.19 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 1
  store i8 %.18, ptr %.19, align 1
  %.21 = trunc i32 117 to i8
  %.22 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 2
  store i8 %.21, ptr %.22, align 1
  %.24 = trunc i32 63 to i8
  %.25 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 3
  store i8 %.24, ptr %.25, align 1
  %.27 = trunc i32 69 to i8
  %.28 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 4
  store i8 %.27, ptr %.28, align 1
  %.30 = trunc i32 163 to i8
  %.31 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 5
  store i8 %.30, ptr %.31, align 1
  %.33 = trunc i32 94 to i8
  %.34 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 6
  store i8 %.33, ptr %.34, align 1
  %.36 = trunc i32 139 to i8
  %.37 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 7
  store i8 %.36, ptr %.37, align 1
  %.39 = trunc i32 181 to i8
  %.40 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 8
  store i8 %.39, ptr %.40, align 1
  %.42 = trunc i32 160 to i8
  %.43 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 9
  store i8 %.42, ptr %.43, align 1
  %.45 = trunc i32 61 to i8
  %.46 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 10
  store i8 %.45, ptr %.46, align 1
  %.48 = trunc i32 105 to i8
  %.49 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 11
  store i8 %.48, ptr %.49, align 1
  %.51 = trunc i32 154 to i8
  %.52 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 12
  store i8 %.51, ptr %.52, align 1
  %.54 = trunc i32 198 to i8
  %.55 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 13
  store i8 %.54, ptr %.55, align 1
  %.57 = trunc i32 80 to i8
  %.58 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 14
  store i8 %.57, ptr %.58, align 1
  %.60 = trunc i32 7 to i8
  %.61 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 15
  store i8 %.60, ptr %.61, align 1
  %.63 = trunc i32 39 to i8
  %.64 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 16
  store i8 %.63, ptr %.64, align 1
  %.66 = trunc i32 44 to i8
  %.67 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 17
  store i8 %.66, ptr %.67, align 1
  %.69 = trunc i32 50 to i8
  %.70 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 18
  store i8 %.69, ptr %.70, align 1
  %.72 = trunc i32 171 to i8
  %.73 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 19
  store i8 %.72, ptr %.73, align 1
  %.75 = trunc i32 14 to i8
  %.76 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 20
  store i8 %.75, ptr %.76, align 1
  %.78 = trunc i32 222 to i8
  %.79 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 21
  store i8 %.78, ptr %.79, align 1
  %.81 = trunc i32 209 to i8
  %.82 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 22
  store i8 %.81, ptr %.82, align 1
  %.84 = trunc i32 99 to i8
  %.85 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 23
  store i8 %.84, ptr %.85, align 1
  %.87 = trunc i32 26 to i8
  %.88 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 24
  store i8 %.87, ptr %.88, align 1
  %.90 = trunc i32 139 to i8
  %.91 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 25
  store i8 %.90, ptr %.91, align 1
  %.93 = trunc i32 96 to i8
  %.94 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 26
  store i8 %.93, ptr %.94, align 1
  %.96 = trunc i32 90 to i8
  %.97 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 27
  store i8 %.96, ptr %.97, align 1
  %.99 = trunc i32 67 to i8
  %.100 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 28
  store i8 %.99, ptr %.100, align 1
  %.102 = trunc i32 255 to i8
  %.103 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 29
  store i8 %.102, ptr %.103, align 1
  %.105 = trunc i32 91 to i8
  %.106 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 30
  store i8 %.105, ptr %.106, align 1
  %.108 = trunc i32 237 to i8
  %.109 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 31
  store i8 %.108, ptr %.109, align 1
  %.111 = trunc i32 128 to i8
  %.112 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 32
  store i8 %.111, ptr %.112, align 1
  %.114 = trunc i32 134 to i8
  %.115 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 33
  store i8 %.114, ptr %.115, align 1
  %.117 = trunc i32 7 to i8
  %.118 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 34
  store i8 %.117, ptr %.118, align 1
  %.120 = trunc i32 43 to i8
  %.121 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 35
  store i8 %.120, ptr %.121, align 1
  %.123 = trunc i32 161 to i8
  %.124 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 36
  store i8 %.123, ptr %.124, align 1
  %.126 = trunc i32 231 to i8
  %.127 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 37
  store i8 %.126, ptr %.127, align 1
  %.129 = trunc i32 204 to i8
  %.130 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 38
  store i8 %.129, ptr %.130, align 1
  %.132 = trunc i32 35 to i8
  %.133 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 39
  store i8 %.132, ptr %.133, align 1
  %.135 = trunc i32 88 to i8
  %.136 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 40
  store i8 %.135, ptr %.136, align 1
  %.138 = trunc i32 186 to i8
  %.139 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 41
  store i8 %.138, ptr %.139, align 1
  %.141 = trunc i32 236 to i8
  %.142 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 42
  store i8 %.141, ptr %.142, align 1
  %.144 = trunc i32 161 to i8
  %.145 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 43
  store i8 %.144, ptr %.145, align 1
  %.147 = trunc i32 52 to i8
  %.148 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 44
  store i8 %.147, ptr %.148, align 1
  %.150 = trunc i32 200 to i8
  %.151 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 45
  store i8 %.150, ptr %.151, align 1
  %.153 = trunc i32 37 to i8
  %.154 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 46
  store i8 %.153, ptr %.154, align 1
  %.156 = trunc i32 167 to i8
  %.157 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 47
  store i8 %.156, ptr %.157, align 1
  call void @standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1(ptr %ctx)
  %.160 = getelementptr inbounds [3 x i8], ptr %msg, i32 0, i32 0
  %.161 = sext i32 3 to i64
  call void @standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1(ptr %ctx, ptr %.160, i64 %.161)
  %.163 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 0
  call void @standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %.163)
  %str_stack = alloca [6 x i8], align 1
  %str_char_0 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 0
  store i8 71, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 1
  store i8 79, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 2
  store i8 84, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 3
  store i8 58, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 4
  store i8 32, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 5
  store i8 0, ptr %str_char_5, align 1
  %arg0_decay = getelementptr [6 x i8], ptr %str_stack, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay)
  br label %for.cond

for.cond:                                         ; preds = %ifcont.1, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.207, %ifcont.1 ]
  %.174 = icmp slt i32 %i.0, 48
  br i1 %.174, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %array_gep = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 %i.0
  %array_load = load i8, ptr %array_gep, align 1
  %.176 = trunc i32 4 to i8
  %.177 = lshr i8 %array_load, %.176
  %.178 = trunc i32 15 to i8
  %.179 = and i8 %.177, %.178
  %array_gep.1 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 %i.0
  %array_load.1 = load i8, ptr %array_gep.1, align 1
  %.181 = trunc i32 15 to i8
  %.182 = and i8 %array_load.1, %.181
  %.184 = trunc i32 10 to i8
  %.185 = icmp ult i8 %.179, %.184
  br i1 %.185, label %then, label %else

for.end:                                          ; preds = %for.cond
  %str_stack.1 = alloca [2 x i8], align 1
  %str_char_0.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 10, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 0, ptr %str_char_1.1, align 1
  %arg0_decay.1 = getelementptr [2 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.1)
  br label %for.cond.1

then:                                             ; preds = %for.body
  %.187 = add i8 48, %.179
  call void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %.187)
  br label %ifcont

else:                                             ; preds = %for.body
  %.190 = trunc i32 10 to i8
  %.191 = sub i8 %.179, %.190
  %.192 = add i8 65, %.191
  call void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %.192)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %.195 = trunc i32 10 to i8
  %.196 = icmp ult i8 %.182, %.195
  br i1 %.196, label %then.1, label %else.1

then.1:                                           ; preds = %ifcont
  %.198 = add i8 48, %.182
  call void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %.198)
  br label %ifcont.1

else.1:                                           ; preds = %ifcont
  %.201 = trunc i32 10 to i8
  %.202 = sub i8 %.182, %.201
  %.203 = add i8 65, %.202
  call void @standard__io__console__print__1__byteE1__ret_voidE1(i8 %.203)
  br label %ifcont.1

ifcont.1:                                         ; preds = %else.1, %then.1
  %.207 = add i32 %i.0, 1
  br label %for.cond

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %ok.0 = phi i32 [ 1, %for.end ], [ %.ok.0, %for.body.1 ]
  %i.11 = phi i32 [ 0, %for.end ], [ %.224, %for.body.1 ]
  %.216 = icmp slt i32 %i.11, 48
  br i1 %.216, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %array_gep.2 = getelementptr inbounds [48 x i8], ptr %hash, i32 0, i32 %i.11
  %array_load.2 = load i8, ptr %array_gep.2, align 1
  %array_gep.3 = getelementptr inbounds [48 x i8], ptr %exp, i32 0, i32 %i.11
  %array_load.3 = load i8, ptr %array_gep.3, align 1
  %.218 = icmp ne i8 %array_load.2, %array_load.3
  %.ok.0 = select i1 %.218, i32 0, i32 %ok.0
  %.224 = add i32 %i.11, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %tobool = icmp ne i32 %ok.0, 0
  br i1 %tobool, label %ternary_true, label %ternary_false

ternary_true:                                     ; preds = %for.end.1
  %str_stack.2 = alloca [8 x i8], align 1
  %str_char_0.2 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 91, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 80, ptr %str_char_1.2, align 1
  %str_char_2.1 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 65, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 83, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 83, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 93, ptr %str_char_5.1, align 1
  %str_char_6 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 10, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [8 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 0, ptr %str_char_7, align 1
  br label %ternary_merge

ternary_false:                                    ; preds = %for.end.1
  %str_stack.3 = alloca [8 x i8], align 1
  %str_char_0.3 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 91, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 70, ptr %str_char_1.3, align 1
  %str_char_2.2 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 65, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 73, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 76, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 93, ptr %str_char_5.2, align 1
  %str_char_6.1 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 10, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [8 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 0, ptr %str_char_7.1, align 1
  br label %ternary_merge

ternary_merge:                                    ; preds = %ternary_false, %ternary_true
  %ternary_result = phi ptr [ %str_stack.2, %ternary_true ], [ %str_stack.3, %ternary_false ]
  %arg0_decay.2 = getelementptr [8 x i8], ptr %ternary_result, i32 0, i32 0
  call void @standard__io__console__print__1__byteE1_arr__ret_voidE1(ptr %arg0_decay.2)
  %tobool.1 = icmp ne i32 %ok.0, 0
  %. = select i1 %tobool.1, i32 0, i32 1
  ret i32 %.
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

define float @standard__math__exp__1__floatE1__ret_floatE1(float %x) {
entry:
  %.4 = fpext float %x to double
  %.5 = call double @standard__math__exp__1__doubleE1__ret_doubleE1(double %.4)
  %.6 = fptrunc double %.5 to float
  ret float %.6
}

define double @standard__math__exp__1__doubleE1__ret_doubleE1(double %x) {
entry:
  %float_to_double_rhs = fpext float 0x40862E4300000000 to double
  %.4 = fcmp ogt double %x, %float_to_double_rhs
  br i1 %.4, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont.4, %ifcont.2, %entry, %ifcont.5, %then.4, %then.1
  %common.ret.op = phi double [ %.11, %then.1 ], [ %.76, %then.4 ], [ %1, %ifcont.5 ], [ 0x7FEFFFFFFFFFFFFF, %entry ], [ %.56, %ifcont.2 ], [ 0x7FEFFFFFFFFFFFFF, %ifcont.4 ]
  ret double %common.ret.op

ifcont:                                           ; preds = %entry
  %.8 = fsub float 0.000000e+00, 0x40874910E0000000
  %float_to_double_rhs.1 = fpext float %.8 to double
  %.9 = fcmp olt double %x, %float_to_double_rhs.1
  br i1 %.9, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.11 = fpext float 0.000000e+00 to double
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %float_to_double = fpext float 0x3FE62E4300000000 to double
  %float_to_double.1 = fpext float 0x3FF7154760000000 to double
  %.17 = fmul double %x, %float_to_double.1
  %float_to_double_rhs.2 = fpext float 0.000000e+00 to double
  %.20 = fcmp oge double %.17, %float_to_double_rhs.2
  br i1 %.20, label %then.2, label %else.2

then.2:                                           ; preds = %ifcont.1
  %float_to_double_rhs.3 = fpext float 5.000000e-01 to double
  %.22 = fadd double %.17, %float_to_double_rhs.3
  %.23 = fptosi double %.22 to i32
  br label %ifcont.2

else.2:                                           ; preds = %ifcont.1
  %float_to_double_rhs.4 = fpext float 5.000000e-01 to double
  %.26 = fsub double %.17, %float_to_double_rhs.4
  %.27 = fptosi double %.26 to i32
  br label %ifcont.2

ifcont.2:                                         ; preds = %else.2, %then.2
  %n.0 = phi i32 [ %.23, %then.2 ], [ %.27, %else.2 ]
  %.30 = sitofp i32 %n.0 to double
  %.31 = fmul double %.30, %float_to_double
  %.32 = fsub double %x, %.31
  %.34 = sitofp i32 %n.0 to double
  %.35 = fmul double %.34, 0x3DEA39EF35793C76
  %.36 = fsub double %.32, %.35
  %.38 = fmul double %.36, %.36
  %.40 = fmul double %.38, 0x3E5AA1688D199D5B
  %.41 = fadd double 0x3EB74D3B7BA53BBC, %.40
  %.42 = fmul double %.38, %.41
  %float_to_double_lhs = fpext float 0x3F15D867C0000000 to double
  %.43 = fadd double %float_to_double_lhs, %.42
  %.44 = fmul double %.38, %.43
  %float_to_double_lhs.1 = fpext float 0x3F71111120000000 to double
  %.45 = fadd double %float_to_double_lhs.1, %.44
  %.46 = fmul double %.38, %.45
  %float_to_double_lhs.2 = fpext float 0x3FC5555560000000 to double
  %.47 = fadd double %float_to_double_lhs.2, %.46
  %.48 = fmul double %.38, %.47
  %float_to_double_lhs.3 = fpext float 1.000000e+00 to double
  %.49 = fadd double %float_to_double_lhs.3, %.48
  %.50 = fmul double %.36, %.49
  %.52 = fmul double %.36, %.50
  %float_to_double_lhs.4 = fpext float 2.000000e+00 to double
  %.53 = fsub double %float_to_double_lhs.4, %.50
  %.54 = fdiv double %.52, %.53
  %.55 = fadd double %.54, %.36
  %float_to_double_lhs.5 = fpext float 1.000000e+00 to double
  %.56 = fadd double %float_to_double_lhs.5, %.55
  %.58 = icmp eq i32 %n.0, 0
  br i1 %.58, label %common.ret, label %ifcont.3

ifcont.3:                                         ; preds = %ifcont.2
  %0 = bitcast double %.56 to i64
  %.66 = zext i32 52 to i64
  %.67 = lshr i64 %0, %.66
  %.68 = sext i32 2047 to i64
  %.69 = and i64 %.67, %.68
  %.70 = sext i32 %n.0 to i64
  %.71 = add i64 %.69, %.70
  %.73 = sext i32 0 to i64
  %.74 = icmp sle i64 %.71, %.73
  br i1 %.74, label %then.4, label %ifcont.4

then.4:                                           ; preds = %ifcont.3
  %.76 = fpext float 0.000000e+00 to double
  br label %common.ret

ifcont.4:                                         ; preds = %ifcont.3
  %.79 = sext i32 2047 to i64
  %.80 = icmp sge i64 %.71, %.79
  br i1 %.80, label %common.ret, label %ifcont.5

ifcont.5:                                         ; preds = %ifcont.4
  %.84 = and i64 %0, -9218868437227405313
  %.85 = zext i32 52 to i64
  %.86 = shl i64 %.71, %.85
  %.87 = or i64 %.84, %.86
  %1 = bitcast i64 %.87 to double
  br label %common.ret
}

define i8 @standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8(i8 %x) {
entry:
  %.4 = sext i8 %x to i32
  %.5 = icmp sgt i32 %.4, 0
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont.1, %then.1, %then
  %common.ret.op = phi i8 [ %.7, %then ], [ %.14, %then.1 ], [ %.17, %ifcont.1 ]
  ret i8 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 1 to i8
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i8 %x to i32
  %.11 = icmp slt i32 %.10, 0
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = sub i32 0, 1
  %.14 = trunc i32 %.13 to i8
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.17 = trunc i32 0 to i8
  br label %common.ret
}

define i16 @standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16(i16 %x) {
entry:
  %.4 = sext i16 %x to i32
  %.5 = icmp sgt i32 %.4, 0
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont.1, %then.1, %then
  %common.ret.op = phi i16 [ %.7, %then ], [ %.14, %then.1 ], [ %.17, %ifcont.1 ]
  ret i16 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 1 to i16
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i16 %x to i32
  %.11 = icmp slt i32 %.10, 0
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = sub i32 0, 1
  %.14 = trunc i32 %.13 to i16
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.17 = trunc i32 0 to i16
  br label %common.ret
}

define i32 @standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32(i32 %x) {
entry:
  %.4 = icmp sgt i32 %x, 0
  %.8 = icmp slt i32 %x, 0
  %.10 = sub i32 0, 1
  %spec.select = select i1 %.8, i32 %.10, i32 0
  %common.ret.op = select i1 %.4, i32 1, i32 %spec.select
  ret i32 %common.ret.op
}

define i64 @standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %x) {
entry:
  %.4 = sext i32 0 to i64
  %.5 = icmp sgt i64 %x, %.4
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont.1, %then.1, %then
  %common.ret.op = phi i64 [ %.7, %then ], [ %.14, %then.1 ], [ %.17, %ifcont.1 ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.7 = sext i32 1 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i32 0 to i64
  %.11 = icmp slt i64 %x, %.10
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = sub i32 0, 1
  %.14 = sext i32 %.13 to i64
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.17 = sext i32 0 to i64
  br label %common.ret
}

define float @standard__math__sign__1__floatE1__ret_floatE1(float %x) {
entry:
  %.4 = fcmp ogt float %x, 0.000000e+00
  br i1 %.4, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont, %entry, %then.1
  %common.ret.op = phi float [ %.10, %then.1 ], [ 1.000000e+00, %entry ], [ 0.000000e+00, %ifcont ]
  ret float %common.ret.op

ifcont:                                           ; preds = %entry
  %.8 = fcmp olt float %x, 0.000000e+00
  br i1 %.8, label %then.1, label %common.ret

then.1:                                           ; preds = %ifcont
  %.10 = fsub float 0.000000e+00, 1.000000e+00
  br label %common.ret
}

define double @standard__math__sign__1__doubleE1__ret_doubleE1(double %x) {
entry:
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.4 = fcmp ogt double %x, %float_to_double_rhs
  br i1 %.4, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont.1, %then.1, %then
  %common.ret.op = phi double [ %.6, %then ], [ %.12, %then.1 ], [ %.15, %ifcont.1 ]
  ret double %common.ret.op

then:                                             ; preds = %entry
  %.6 = fpext float 1.000000e+00 to double
  br label %common.ret

ifcont:                                           ; preds = %entry
  %float_to_double_rhs.1 = fpext float 0.000000e+00 to double
  %.9 = fcmp olt double %x, %float_to_double_rhs.1
  br i1 %.9, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.11 = fsub float 0.000000e+00, 1.000000e+00
  %.12 = fpext float %.11 to double
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.15 = fpext float 0.000000e+00 to double
  br label %common.ret
}

define i32 @standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32(i32 %x, i32 %y, i32 %z) {
entry:
  %.8 = and i32 %x, %y
  %.9 = xor i32 %x, -1
  %.10 = and i32 %.9, %z
  %.11 = xor i32 %.8, %.10
  ret i32 %.11
}

define i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %value, i64 %n) {
entry:
  %.6 = lshr i64 %value, %n
  %.7 = zext i32 64 to i64
  %.8 = sub i64 %.7, %n
  %.9 = shl i64 %value, %.8
  %.10 = or i64 %.6, %.9
  ret i64 %.10
}

define i64 @standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %y, i64 %z) {
entry:
  %.8 = and i64 %x, %y
  %.9 = xor i64 %x, -1
  %.10 = and i64 %.9, %z
  %.11 = xor i64 %.8, %.10
  ret i64 %.11
}

define i64 @standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %y, i64 %z) {
entry:
  %.8 = and i64 %x, %y
  %.9 = and i64 %x, %z
  %.10 = xor i64 %.8, %.9
  %.11 = and i64 %y, %z
  %.12 = xor i64 %.10, %.11
  ret i64 %.12
}

define i64 @standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) {
entry:
  %.4 = zext i32 28 to i64
  %.5 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.4)
  %.6 = zext i32 34 to i64
  %.7 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.6)
  %.8 = xor i64 %.5, %.7
  %.9 = zext i32 39 to i64
  %.10 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.9)
  %.11 = xor i64 %.8, %.10
  ret i64 %.11
}

define i64 @standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) {
entry:
  %.4 = zext i32 14 to i64
  %.5 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.4)
  %.6 = zext i32 18 to i64
  %.7 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.6)
  %.8 = xor i64 %.5, %.7
  %.9 = zext i32 41 to i64
  %.10 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.9)
  %.11 = xor i64 %.8, %.10
  ret i64 %.11
}

define i64 @standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) {
entry:
  %.4 = zext i32 1 to i64
  %.5 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.4)
  %.6 = zext i32 8 to i64
  %.7 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.6)
  %.8 = xor i64 %.5, %.7
  %.9 = zext i32 7 to i64
  %.10 = lshr i64 %x, %.9
  %.11 = xor i64 %.8, %.10
  ret i64 %.11
}

define i64 @standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) {
entry:
  %.4 = zext i32 19 to i64
  %.5 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.4)
  %.6 = zext i32 61 to i64
  %.7 = call i64 @standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %x, i64 %.6)
  %.8 = xor i64 %.5, %.7
  %.9 = zext i32 6 to i64
  %.10 = lshr i64 %x, %.9
  %.11 = xor i64 %.8, %.10
  ret i64 %.11
}

define void @standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1(ptr %ctx) {
entry:
  %.5 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %elem_0 = getelementptr [8 x i64], ptr %.5, i32 0, i32 0
  store i64 -3766243637369397544, ptr %elem_0, align 8
  %elem_1 = getelementptr [8 x i64], ptr %.5, i32 0, i32 1
  store i64 7105036623409894663, ptr %elem_1, align 8
  %elem_2 = getelementptr [8 x i64], ptr %.5, i32 0, i32 2
  store i64 -7973340178411365097, ptr %elem_2, align 8
  %elem_3 = getelementptr [8 x i64], ptr %.5, i32 0, i32 3
  store i64 1526699215303891257, ptr %elem_3, align 8
  %elem_4 = getelementptr [8 x i64], ptr %.5, i32 0, i32 4
  store i64 7436329637833083697, ptr %elem_4, align 8
  %elem_5 = getelementptr [8 x i64], ptr %.5, i32 0, i32 5
  store i64 -8163818279084223215, ptr %elem_5, align 8
  %elem_6 = getelementptr [8 x i64], ptr %.5, i32 0, i32 6
  store i64 -2662702644619276377, ptr %elem_6, align 8
  %elem_7 = getelementptr [8 x i64], ptr %.5, i32 0, i32 7
  store i64 5167115440072839076, ptr %elem_7, align 8
  %.14 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  %.15 = zext i32 0 to i64
  store i64 %.15, ptr %.14, align 8
  %.17 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 3
  %.18 = zext i32 0 to i64
  store i64 %.18, ptr %.17, align 8
  %.20 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  store i32 0, ptr %.20, align 4
  ret void
}

define void @standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %datax) {
entry:
  %W = alloca [80 x i64], align 8
  %memset_ptr = bitcast ptr %W to ptr
  call void @llvm.memset.p0.i64(ptr %memset_ptr, i8 0, i64 640, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.85, %for.body ]
  %.20 = icmp ult i32 %i.0, 16
  br i1 %.20, label %for.body, label %for.cond.1

for.body:                                         ; preds = %for.cond
  %.22 = mul i32 %i.0, 8
  %ptr_gep = getelementptr inbounds i8, ptr %datax, i32 %.22
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.23 = zext i8 %ptr_load to i32
  %.24 = and i32 %.23, 255
  %.25 = zext i32 %.24 to i64
  %.26 = zext i32 56 to i64
  %.27 = shl i64 %.25, %.26
  %.28 = mul i32 %i.0, 8
  %.29 = add i32 %.28, 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %datax, i32 %.29
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.30 = zext i8 %ptr_load.1 to i32
  %.31 = and i32 %.30, 255
  %.32 = zext i32 %.31 to i64
  %.33 = zext i32 48 to i64
  %.34 = shl i64 %.32, %.33
  %.35 = or i64 %.27, %.34
  %.36 = mul i32 %i.0, 8
  %.37 = add i32 %.36, 2
  %ptr_gep.2 = getelementptr inbounds i8, ptr %datax, i32 %.37
  %ptr_load.2 = load i8, ptr %ptr_gep.2, align 1
  %.38 = zext i8 %ptr_load.2 to i32
  %.39 = and i32 %.38, 255
  %.40 = zext i32 %.39 to i64
  %.41 = zext i32 40 to i64
  %.42 = shl i64 %.40, %.41
  %.43 = or i64 %.35, %.42
  %.44 = mul i32 %i.0, 8
  %.45 = add i32 %.44, 3
  %ptr_gep.3 = getelementptr inbounds i8, ptr %datax, i32 %.45
  %ptr_load.3 = load i8, ptr %ptr_gep.3, align 1
  %.46 = zext i8 %ptr_load.3 to i32
  %.47 = and i32 %.46, 255
  %.48 = zext i32 %.47 to i64
  %.49 = zext i32 32 to i64
  %.50 = shl i64 %.48, %.49
  %.51 = or i64 %.43, %.50
  %.52 = mul i32 %i.0, 8
  %.53 = add i32 %.52, 4
  %ptr_gep.4 = getelementptr inbounds i8, ptr %datax, i32 %.53
  %ptr_load.4 = load i8, ptr %ptr_gep.4, align 1
  %.54 = zext i8 %ptr_load.4 to i32
  %.55 = and i32 %.54, 255
  %.56 = zext i32 %.55 to i64
  %.57 = zext i32 24 to i64
  %.58 = shl i64 %.56, %.57
  %.59 = or i64 %.51, %.58
  %.60 = mul i32 %i.0, 8
  %.61 = add i32 %.60, 5
  %ptr_gep.5 = getelementptr inbounds i8, ptr %datax, i32 %.61
  %ptr_load.5 = load i8, ptr %ptr_gep.5, align 1
  %.62 = zext i8 %ptr_load.5 to i32
  %.63 = and i32 %.62, 255
  %.64 = zext i32 %.63 to i64
  %.65 = zext i32 16 to i64
  %.66 = shl i64 %.64, %.65
  %.67 = or i64 %.59, %.66
  %.68 = mul i32 %i.0, 8
  %.69 = add i32 %.68, 6
  %ptr_gep.6 = getelementptr inbounds i8, ptr %datax, i32 %.69
  %ptr_load.6 = load i8, ptr %ptr_gep.6, align 1
  %.70 = zext i8 %ptr_load.6 to i32
  %.71 = and i32 %.70, 255
  %.72 = zext i32 %.71 to i64
  %.73 = zext i32 8 to i64
  %.74 = shl i64 %.72, %.73
  %.75 = or i64 %.67, %.74
  %.76 = mul i32 %i.0, 8
  %.77 = add i32 %.76, 7
  %ptr_gep.7 = getelementptr inbounds i8, ptr %datax, i32 %.77
  %ptr_load.7 = load i8, ptr %ptr_gep.7, align 1
  %.78 = zext i8 %ptr_load.7 to i32
  %.79 = and i32 %.78, 255
  %.80 = zext i32 %.79 to i64
  %.81 = or i64 %.75, %.80
  %.82 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %i.0
  store i64 %.81, ptr %.82, align 8
  %.85 = add i32 %i.0, 1
  br label %for.cond

for.cond.1:                                       ; preds = %for.cond, %for.body.1
  %i.110 = phi i32 [ %.104, %for.body.1 ], [ 16, %for.cond ]
  %.90 = icmp ult i32 %i.110, 80
  br i1 %.90, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.92 = sub i32 %i.110, 2
  %array_gep = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %.92
  %array_load = load i64, ptr %array_gep, align 8
  %.93 = call i64 @standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %array_load)
  %.94 = sub i32 %i.110, 7
  %array_gep.1 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %.94
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  %.95 = add i64 %.93, %array_load.1
  %.96 = sub i32 %i.110, 15
  %array_gep.2 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %.96
  %array_load.2 = load i64, ptr %array_gep.2, align 8
  %.97 = call i64 @standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %array_load.2)
  %.98 = add i64 %.95, %.97
  %.99 = sub i32 %i.110, 16
  %array_gep.3 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %.99
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  %.100 = add i64 %.98, %array_load.3
  %.101 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %i.110
  store i64 %.100, ptr %.101, align 8
  %.104 = add i32 %i.110, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %state_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.4 = getelementptr inbounds [8 x i64], ptr %state_ptr, i32 0, i32 0
  %array_load.4 = load i64, ptr %array_gep.4, align 8
  %state_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.5 = getelementptr inbounds [8 x i64], ptr %state_ptr.1, i32 0, i32 1
  %array_load.5 = load i64, ptr %array_gep.5, align 8
  %state_ptr.2 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.6 = getelementptr inbounds [8 x i64], ptr %state_ptr.2, i32 0, i32 2
  %array_load.6 = load i64, ptr %array_gep.6, align 8
  %state_ptr.3 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.7 = getelementptr inbounds [8 x i64], ptr %state_ptr.3, i32 0, i32 3
  %array_load.7 = load i64, ptr %array_gep.7, align 8
  %state_ptr.4 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.8 = getelementptr inbounds [8 x i64], ptr %state_ptr.4, i32 0, i32 4
  %array_load.8 = load i64, ptr %array_gep.8, align 8
  %state_ptr.5 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.9 = getelementptr inbounds [8 x i64], ptr %state_ptr.5, i32 0, i32 5
  %array_load.9 = load i64, ptr %array_gep.9, align 8
  %state_ptr.6 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.10 = getelementptr inbounds [8 x i64], ptr %state_ptr.6, i32 0, i32 6
  %array_load.10 = load i64, ptr %array_gep.10, align 8
  %state_ptr.7 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.11 = getelementptr inbounds [8 x i64], ptr %state_ptr.7, i32 0, i32 7
  %array_load.11 = load i64, ptr %array_gep.11, align 8
  br label %for.cond.2

for.cond.2:                                       ; preds = %for.body.2, %for.end.1
  %h.0 = phi i64 [ %array_load.11, %for.end.1 ], [ %g.0, %for.body.2 ]
  %g.0 = phi i64 [ %array_load.10, %for.end.1 ], [ %f.0, %for.body.2 ]
  %f.0 = phi i64 [ %array_load.9, %for.end.1 ], [ %e.0, %for.body.2 ]
  %e.0 = phi i64 [ %array_load.8, %for.end.1 ], [ %.133, %for.body.2 ]
  %d.0 = phi i64 [ %array_load.7, %for.end.1 ], [ %c.0, %for.body.2 ]
  %c.0 = phi i64 [ %array_load.6, %for.end.1 ], [ %b.0, %for.body.2 ]
  %b.0 = phi i64 [ %array_load.5, %for.end.1 ], [ %a.0, %for.body.2 ]
  %a.0 = phi i64 [ %array_load.4, %for.end.1 ], [ %.138, %for.body.2 ]
  %i.211 = phi i32 [ 0, %for.end.1 ], [ %.141, %for.body.2 ]
  %.117 = icmp ult i32 %i.211, 80
  br i1 %.117, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  %.119 = call i64 @standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %e.0)
  %.120 = add i64 %h.0, %.119
  %.121 = call i64 @standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %e.0, i64 %f.0, i64 %g.0)
  %.122 = add i64 %.120, %.121
  %array_gep.12 = getelementptr inbounds [80 x i64], ptr @standard__crypto__hashing__SHA384__K384, i32 0, i32 %i.211
  %array_load.12 = load i64, ptr %array_gep.12, align 8
  %.123 = add i64 %.122, %array_load.12
  %array_gep.13 = getelementptr inbounds [80 x i64], ptr %W, i32 0, i32 %i.211
  %array_load.13 = load i64, ptr %array_gep.13, align 8
  %.124 = add i64 %.123, %array_load.13
  %.126 = call i64 @standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %a.0)
  %.127 = call i64 @standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %a.0, i64 %b.0, i64 %c.0)
  %.128 = add i64 %.126, %.127
  %.133 = add i64 %d.0, %.124
  %.138 = add i64 %.124, %.128
  %.141 = add i32 %i.211, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  %state_ptr.8 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.14 = getelementptr inbounds [8 x i64], ptr %state_ptr.8, i32 0, i32 0
  %array_load.14 = load i64, ptr %array_gep.14, align 8
  %.144 = add i64 %array_load.14, %a.0
  %.145 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.146 = getelementptr inbounds [8 x i64], ptr %.145, i32 0, i32 0
  store i64 %.144, ptr %.146, align 8
  %state_ptr.9 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.15 = getelementptr inbounds [8 x i64], ptr %state_ptr.9, i32 0, i32 1
  %array_load.15 = load i64, ptr %array_gep.15, align 8
  %.148 = add i64 %array_load.15, %b.0
  %.149 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.150 = getelementptr inbounds [8 x i64], ptr %.149, i32 0, i32 1
  store i64 %.148, ptr %.150, align 8
  %state_ptr.10 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.16 = getelementptr inbounds [8 x i64], ptr %state_ptr.10, i32 0, i32 2
  %array_load.16 = load i64, ptr %array_gep.16, align 8
  %.152 = add i64 %array_load.16, %c.0
  %.153 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.154 = getelementptr inbounds [8 x i64], ptr %.153, i32 0, i32 2
  store i64 %.152, ptr %.154, align 8
  %state_ptr.11 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.17 = getelementptr inbounds [8 x i64], ptr %state_ptr.11, i32 0, i32 3
  %array_load.17 = load i64, ptr %array_gep.17, align 8
  %.156 = add i64 %array_load.17, %d.0
  %.157 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.158 = getelementptr inbounds [8 x i64], ptr %.157, i32 0, i32 3
  store i64 %.156, ptr %.158, align 8
  %state_ptr.12 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.18 = getelementptr inbounds [8 x i64], ptr %state_ptr.12, i32 0, i32 4
  %array_load.18 = load i64, ptr %array_gep.18, align 8
  %.160 = add i64 %array_load.18, %e.0
  %.161 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.162 = getelementptr inbounds [8 x i64], ptr %.161, i32 0, i32 4
  store i64 %.160, ptr %.162, align 8
  %state_ptr.13 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.19 = getelementptr inbounds [8 x i64], ptr %state_ptr.13, i32 0, i32 5
  %array_load.19 = load i64, ptr %array_gep.19, align 8
  %.164 = add i64 %array_load.19, %f.0
  %.165 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.166 = getelementptr inbounds [8 x i64], ptr %.165, i32 0, i32 5
  store i64 %.164, ptr %.166, align 8
  %state_ptr.14 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.20 = getelementptr inbounds [8 x i64], ptr %state_ptr.14, i32 0, i32 6
  %array_load.20 = load i64, ptr %array_gep.20, align 8
  %.168 = add i64 %array_load.20, %g.0
  %.169 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.170 = getelementptr inbounds [8 x i64], ptr %.169, i32 0, i32 6
  store i64 %.168, ptr %.170, align 8
  %state_ptr.15 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.21 = getelementptr inbounds [8 x i64], ptr %state_ptr.15, i32 0, i32 7
  %array_load.21 = load i64, ptr %array_gep.21, align 8
  %.172 = add i64 %array_load.21, %h.0
  %.173 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %.174 = getelementptr inbounds [8 x i64], ptr %.173, i32 0, i32 7
  store i64 %.172, ptr %.174, align 8
  ret void
}

define void @standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1(ptr %ctx, ptr %datax, i64 %len) {
entry:
  %.9 = sext i32 0 to i64
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %i.0 = phi i64 [ %.9, %entry ], [ %.41, %ifcont ]
  %.12 = icmp ult i64 %i.0, %len
  br i1 %.12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idx_trunc = trunc i64 %i.0 to i32
  %ptr_gep = getelementptr inbounds i8, ptr %datax, i32 %idx_trunc
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.14 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %buflen_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen = load i32, ptr %buflen_ptr, align 4
  %.15 = getelementptr inbounds [128 x i8], ptr %.14, i32 0, i32 %buflen
  store i8 %ptr_load, ptr %.15, align 1
  %buflen_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen.1 = load i32, ptr %buflen_ptr.1, align 4
  %.17 = add i32 %buflen.1, 1
  %.18 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  store i32 %.17, ptr %.18, align 4
  %buflen_ptr.2 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen.2 = load i32, ptr %buflen_ptr.2, align 4
  %.20 = icmp eq i32 %buflen.2, 128
  br i1 %.20, label %then, label %ifcont

for.end:                                          ; preds = %for.cond
  ret void

then:                                             ; preds = %for.body
  %buffer_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %arg1_decay = getelementptr [128 x i8], ptr %buffer_ptr, i32 0, i32 0
  call void @standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %arg1_decay)
  %bitlen_lo_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  %bitlen_lo = load i64, ptr %bitlen_lo_ptr, align 8
  %.23 = zext i32 1024 to i64
  %.24 = add i64 %bitlen_lo, %.23
  %.25 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  store i64 %.24, ptr %.25, align 8
  %bitlen_lo_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  %bitlen_lo.1 = load i64, ptr %bitlen_lo_ptr.1, align 8
  %.27 = zext i32 0 to i64
  %.28 = icmp eq i64 %bitlen_lo.1, %.27
  br i1 %.28, label %then.1, label %ifcont.1

ifcont:                                           ; preds = %for.body, %ifcont.1
  %.41 = add i64 %i.0, 1
  br label %for.cond

then.1:                                           ; preds = %then
  %bitlen_hi_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 3
  %bitlen_hi = load i64, ptr %bitlen_hi_ptr, align 8
  %.30 = zext i32 1 to i64
  %.31 = add i64 %bitlen_hi, %.30
  %.32 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 3
  store i64 %.31, ptr %.32, align 8
  br label %ifcont.1

ifcont.1:                                         ; preds = %then, %then.1
  %.36 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  store i32 0, ptr %.36, align 4
  br label %ifcont
}

define void @standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %hash) {
entry:
  %buflen_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen = load i32, ptr %buflen_ptr, align 4
  %.10 = trunc i32 128 to i8
  %.11 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %.12 = getelementptr inbounds [128 x i8], ptr %.11, i32 0, i32 %buflen
  store i8 %.10, ptr %.12, align 1
  %.14 = add i32 %buflen, 1
  %buflen_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen.1 = load i32, ptr %buflen_ptr.1, align 4
  %.16 = icmp ult i32 %buflen.1, 112
  br i1 %.16, label %while.cond, label %while.cond.1

ifcont:                                           ; preds = %for.cond, %while.cond
  %bitlen_lo_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  %bitlen_lo = load i64, ptr %bitlen_lo_ptr, align 8
  %buflen_ptr.2 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 4
  %buflen.2 = load i32, ptr %buflen_ptr.2, align 4
  %.53 = zext i32 %buflen.2 to i64
  %.54 = zext i32 8 to i64
  %.55 = mul i64 %.53, %.54
  %.56 = add i64 %bitlen_lo, %.55
  %bitlen_hi_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 3
  %bitlen_hi = load i64, ptr %bitlen_hi_ptr, align 8
  %bitlen_lo_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 2
  %bitlen_lo.1 = load i64, ptr %bitlen_lo_ptr.1, align 8
  %.59 = icmp ult i64 %.56, %bitlen_lo.1
  %.61 = zext i32 1 to i64
  %.62 = add i64 %bitlen_hi, %.61
  %total_bits_hi.0 = select i1 %.59, i64 %.62, i64 %bitlen_hi
  %buffer_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %scalar_to_bytes = alloca [9 x i8], align 1
  %scalar_shift_0 = lshr i64 %total_bits_hi.0, 56
  %scalar_byte_0 = trunc i64 %scalar_shift_0 to i8
  %scalar_dst_0 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 0
  store i8 %scalar_byte_0, ptr %scalar_dst_0, align 1
  %scalar_shift_1 = lshr i64 %total_bits_hi.0, 48
  %scalar_byte_1 = trunc i64 %scalar_shift_1 to i8
  %scalar_dst_1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 1
  store i8 %scalar_byte_1, ptr %scalar_dst_1, align 1
  %scalar_shift_2 = lshr i64 %total_bits_hi.0, 40
  %scalar_byte_2 = trunc i64 %scalar_shift_2 to i8
  %scalar_dst_2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 2
  store i8 %scalar_byte_2, ptr %scalar_dst_2, align 1
  %scalar_shift_3 = lshr i64 %total_bits_hi.0, 32
  %scalar_byte_3 = trunc i64 %scalar_shift_3 to i8
  %scalar_dst_3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 3
  store i8 %scalar_byte_3, ptr %scalar_dst_3, align 1
  %scalar_shift_4 = lshr i64 %total_bits_hi.0, 24
  %scalar_byte_4 = trunc i64 %scalar_shift_4 to i8
  %scalar_dst_4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 4
  store i8 %scalar_byte_4, ptr %scalar_dst_4, align 1
  %scalar_shift_5 = lshr i64 %total_bits_hi.0, 16
  %scalar_byte_5 = trunc i64 %scalar_shift_5 to i8
  %scalar_dst_5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 5
  store i8 %scalar_byte_5, ptr %scalar_dst_5, align 1
  %scalar_shift_6 = lshr i64 %total_bits_hi.0, 8
  %scalar_byte_6 = trunc i64 %scalar_shift_6 to i8
  %scalar_dst_6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 6
  store i8 %scalar_byte_6, ptr %scalar_dst_6, align 1
  %scalar_byte_7 = trunc i64 %total_bits_hi.0 to i8
  %scalar_dst_7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 7
  store i8 %scalar_byte_7, ptr %scalar_dst_7, align 1
  %scalar_null_term = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 8
  store i8 0, ptr %scalar_null_term, align 1
  %rav.k = alloca i32, align 4
  store i32 0, ptr %rav.k, align 4
  %rav.span = sub i32 119, 112
  br label %rav.cond

while.cond:                                       ; preds = %entry, %while.body
  %i.0 = phi i32 [ %.25, %while.body ], [ %.14, %entry ]
  %.19 = icmp ult i32 %i.0, 112
  br i1 %.19, label %while.body, label %ifcont

while.body:                                       ; preds = %while.cond
  %.21 = trunc i32 0 to i8
  %.22 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %.23 = getelementptr inbounds [128 x i8], ptr %.22, i32 0, i32 %i.0
  store i8 %.21, ptr %.23, align 1
  %.25 = add i32 %i.0, 1
  br label %while.cond

while.cond.1:                                     ; preds = %entry, %while.body.1
  %i.12 = phi i32 [ %.36, %while.body.1 ], [ %.14, %entry ]
  %.30 = icmp ult i32 %i.12, 128
  br i1 %.30, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.32 = trunc i32 0 to i8
  %.33 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %.34 = getelementptr inbounds [128 x i8], ptr %.33, i32 0, i32 %i.12
  store i8 %.32, ptr %.34, align 1
  %.36 = add i32 %i.12, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %buffer_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %arg1_decay = getelementptr [128 x i8], ptr %buffer_ptr, i32 0, i32 0
  call void @standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %arg1_decay)
  br label %for.cond

for.cond:                                         ; preds = %for.body, %while.end.1
  %i.23 = phi i32 [ 0, %while.end.1 ], [ %.49, %for.body ]
  %.42 = icmp ult i32 %i.23, 112
  br i1 %.42, label %for.body, label %ifcont

for.body:                                         ; preds = %for.cond
  %.44 = trunc i32 0 to i8
  %.45 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %.46 = getelementptr inbounds [128 x i8], ptr %.45, i32 0, i32 %i.23
  store i8 %.44, ptr %.46, align 1
  %.49 = add i32 %i.23, 1
  br label %for.cond

rav.cond:                                         ; preds = %rav.body, %ifcont
  %rav.kv = load i32, ptr %rav.k, align 4
  %rav.cmp = icmp sle i32 %rav.kv, %rav.span
  br i1 %rav.cmp, label %rav.body, label %rav.end

rav.body:                                         ; preds = %rav.cond
  %rav.kb = load i32, ptr %rav.k, align 4
  %rav.src = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes, i32 0, i32 %rav.kb
  %rav.val = load i8, ptr %rav.src, align 1
  %rav.dstidx = add i32 112, %rav.kb
  %rav.dst = getelementptr inbounds [128 x i8], ptr %buffer_ptr.1, i32 0, i32 %rav.dstidx
  store i8 %rav.val, ptr %rav.dst, align 1
  %rav.next = add i32 %rav.kb, 1
  store i32 %rav.next, ptr %rav.k, align 4
  br label %rav.cond

rav.end:                                          ; preds = %rav.cond
  %buffer_ptr.2 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %scalar_to_bytes.1 = alloca [9 x i8], align 1
  %scalar_shift_0.1 = lshr i64 %.56, 56
  %scalar_byte_0.1 = trunc i64 %scalar_shift_0.1 to i8
  %scalar_dst_0.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 0
  store i8 %scalar_byte_0.1, ptr %scalar_dst_0.1, align 1
  %scalar_shift_1.1 = lshr i64 %.56, 48
  %scalar_byte_1.1 = trunc i64 %scalar_shift_1.1 to i8
  %scalar_dst_1.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 1
  store i8 %scalar_byte_1.1, ptr %scalar_dst_1.1, align 1
  %scalar_shift_2.1 = lshr i64 %.56, 40
  %scalar_byte_2.1 = trunc i64 %scalar_shift_2.1 to i8
  %scalar_dst_2.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 2
  store i8 %scalar_byte_2.1, ptr %scalar_dst_2.1, align 1
  %scalar_shift_3.1 = lshr i64 %.56, 32
  %scalar_byte_3.1 = trunc i64 %scalar_shift_3.1 to i8
  %scalar_dst_3.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 3
  store i8 %scalar_byte_3.1, ptr %scalar_dst_3.1, align 1
  %scalar_shift_4.1 = lshr i64 %.56, 24
  %scalar_byte_4.1 = trunc i64 %scalar_shift_4.1 to i8
  %scalar_dst_4.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 4
  store i8 %scalar_byte_4.1, ptr %scalar_dst_4.1, align 1
  %scalar_shift_5.1 = lshr i64 %.56, 16
  %scalar_byte_5.1 = trunc i64 %scalar_shift_5.1 to i8
  %scalar_dst_5.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 5
  store i8 %scalar_byte_5.1, ptr %scalar_dst_5.1, align 1
  %scalar_shift_6.1 = lshr i64 %.56, 8
  %scalar_byte_6.1 = trunc i64 %scalar_shift_6.1 to i8
  %scalar_dst_6.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 6
  store i8 %scalar_byte_6.1, ptr %scalar_dst_6.1, align 1
  %scalar_byte_7.1 = trunc i64 %.56 to i8
  %scalar_dst_7.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 7
  store i8 %scalar_byte_7.1, ptr %scalar_dst_7.1, align 1
  %scalar_null_term.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.1, align 1
  %rav.k.1 = alloca i32, align 4
  store i32 0, ptr %rav.k.1, align 4
  %rav.span.1 = sub i32 127, 120
  br label %rav.cond.1

rav.cond.1:                                       ; preds = %rav.body.1, %rav.end
  %rav.kv.1 = load i32, ptr %rav.k.1, align 4
  %rav.cmp.1 = icmp sle i32 %rav.kv.1, %rav.span.1
  br i1 %rav.cmp.1, label %rav.body.1, label %rav.end.1

rav.body.1:                                       ; preds = %rav.cond.1
  %rav.kb.1 = load i32, ptr %rav.k.1, align 4
  %rav.src.1 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.1, i32 0, i32 %rav.kb.1
  %rav.val.1 = load i8, ptr %rav.src.1, align 1
  %rav.dstidx.1 = add i32 120, %rav.kb.1
  %rav.dst.1 = getelementptr inbounds [128 x i8], ptr %buffer_ptr.2, i32 0, i32 %rav.dstidx.1
  store i8 %rav.val.1, ptr %rav.dst.1, align 1
  %rav.next.1 = add i32 %rav.kb.1, 1
  store i32 %rav.next.1, ptr %rav.k.1, align 4
  br label %rav.cond.1

rav.end.1:                                        ; preds = %rav.cond.1
  %buffer_ptr.3 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 1
  %arg1_decay.1 = getelementptr [128 x i8], ptr %buffer_ptr.3, i32 0, i32 0
  call void @standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1(ptr %ctx, ptr %arg1_decay.1)
  %state_ptr = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep = getelementptr inbounds [8 x i64], ptr %state_ptr, i32 0, i32 0
  %array_load = load i64, ptr %array_gep, align 8
  %scalar_to_bytes.2 = alloca [9 x i8], align 1
  %scalar_shift_0.2 = lshr i64 %array_load, 56
  %scalar_byte_0.2 = trunc i64 %scalar_shift_0.2 to i8
  %scalar_dst_0.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 0
  store i8 %scalar_byte_0.2, ptr %scalar_dst_0.2, align 1
  %scalar_shift_1.2 = lshr i64 %array_load, 48
  %scalar_byte_1.2 = trunc i64 %scalar_shift_1.2 to i8
  %scalar_dst_1.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 1
  store i8 %scalar_byte_1.2, ptr %scalar_dst_1.2, align 1
  %scalar_shift_2.2 = lshr i64 %array_load, 40
  %scalar_byte_2.2 = trunc i64 %scalar_shift_2.2 to i8
  %scalar_dst_2.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 2
  store i8 %scalar_byte_2.2, ptr %scalar_dst_2.2, align 1
  %scalar_shift_3.2 = lshr i64 %array_load, 32
  %scalar_byte_3.2 = trunc i64 %scalar_shift_3.2 to i8
  %scalar_dst_3.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 3
  store i8 %scalar_byte_3.2, ptr %scalar_dst_3.2, align 1
  %scalar_shift_4.2 = lshr i64 %array_load, 24
  %scalar_byte_4.2 = trunc i64 %scalar_shift_4.2 to i8
  %scalar_dst_4.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 4
  store i8 %scalar_byte_4.2, ptr %scalar_dst_4.2, align 1
  %scalar_shift_5.2 = lshr i64 %array_load, 16
  %scalar_byte_5.2 = trunc i64 %scalar_shift_5.2 to i8
  %scalar_dst_5.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 5
  store i8 %scalar_byte_5.2, ptr %scalar_dst_5.2, align 1
  %scalar_shift_6.2 = lshr i64 %array_load, 8
  %scalar_byte_6.2 = trunc i64 %scalar_shift_6.2 to i8
  %scalar_dst_6.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 6
  store i8 %scalar_byte_6.2, ptr %scalar_dst_6.2, align 1
  %scalar_byte_7.2 = trunc i64 %array_load to i8
  %scalar_dst_7.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 7
  store i8 %scalar_byte_7.2, ptr %scalar_dst_7.2, align 1
  %scalar_null_term.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.2, align 1
  %rav.k.2 = alloca i32, align 4
  store i32 0, ptr %rav.k.2, align 4
  %rav.span.2 = sub i32 7, 0
  br label %rav.cond.2

rav.cond.2:                                       ; preds = %rav.body.2, %rav.end.1
  %rav.kv.2 = load i32, ptr %rav.k.2, align 4
  %rav.cmp.2 = icmp sle i32 %rav.kv.2, %rav.span.2
  br i1 %rav.cmp.2, label %rav.body.2, label %rav.end.2

rav.body.2:                                       ; preds = %rav.cond.2
  %rav.kb.2 = load i32, ptr %rav.k.2, align 4
  %rav.src.2 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.2, i32 0, i32 %rav.kb.2
  %rav.val.2 = load i8, ptr %rav.src.2, align 1
  %rav.dstidx.2 = add i32 0, %rav.kb.2
  %rav.dst.2 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.2
  store i8 %rav.val.2, ptr %rav.dst.2, align 1
  %rav.next.2 = add i32 %rav.kb.2, 1
  store i32 %rav.next.2, ptr %rav.k.2, align 4
  br label %rav.cond.2

rav.end.2:                                        ; preds = %rav.cond.2
  %state_ptr.1 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.1 = getelementptr inbounds [8 x i64], ptr %state_ptr.1, i32 0, i32 1
  %array_load.1 = load i64, ptr %array_gep.1, align 8
  %scalar_to_bytes.3 = alloca [9 x i8], align 1
  %scalar_shift_0.3 = lshr i64 %array_load.1, 56
  %scalar_byte_0.3 = trunc i64 %scalar_shift_0.3 to i8
  %scalar_dst_0.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 0
  store i8 %scalar_byte_0.3, ptr %scalar_dst_0.3, align 1
  %scalar_shift_1.3 = lshr i64 %array_load.1, 48
  %scalar_byte_1.3 = trunc i64 %scalar_shift_1.3 to i8
  %scalar_dst_1.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 1
  store i8 %scalar_byte_1.3, ptr %scalar_dst_1.3, align 1
  %scalar_shift_2.3 = lshr i64 %array_load.1, 40
  %scalar_byte_2.3 = trunc i64 %scalar_shift_2.3 to i8
  %scalar_dst_2.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 2
  store i8 %scalar_byte_2.3, ptr %scalar_dst_2.3, align 1
  %scalar_shift_3.3 = lshr i64 %array_load.1, 32
  %scalar_byte_3.3 = trunc i64 %scalar_shift_3.3 to i8
  %scalar_dst_3.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 3
  store i8 %scalar_byte_3.3, ptr %scalar_dst_3.3, align 1
  %scalar_shift_4.3 = lshr i64 %array_load.1, 24
  %scalar_byte_4.3 = trunc i64 %scalar_shift_4.3 to i8
  %scalar_dst_4.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 4
  store i8 %scalar_byte_4.3, ptr %scalar_dst_4.3, align 1
  %scalar_shift_5.3 = lshr i64 %array_load.1, 16
  %scalar_byte_5.3 = trunc i64 %scalar_shift_5.3 to i8
  %scalar_dst_5.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 5
  store i8 %scalar_byte_5.3, ptr %scalar_dst_5.3, align 1
  %scalar_shift_6.3 = lshr i64 %array_load.1, 8
  %scalar_byte_6.3 = trunc i64 %scalar_shift_6.3 to i8
  %scalar_dst_6.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 6
  store i8 %scalar_byte_6.3, ptr %scalar_dst_6.3, align 1
  %scalar_byte_7.3 = trunc i64 %array_load.1 to i8
  %scalar_dst_7.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 7
  store i8 %scalar_byte_7.3, ptr %scalar_dst_7.3, align 1
  %scalar_null_term.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.3, align 1
  %rav.k.3 = alloca i32, align 4
  store i32 0, ptr %rav.k.3, align 4
  %rav.span.3 = sub i32 15, 8
  br label %rav.cond.3

rav.cond.3:                                       ; preds = %rav.body.3, %rav.end.2
  %rav.kv.3 = load i32, ptr %rav.k.3, align 4
  %rav.cmp.3 = icmp sle i32 %rav.kv.3, %rav.span.3
  br i1 %rav.cmp.3, label %rav.body.3, label %rav.end.3

rav.body.3:                                       ; preds = %rav.cond.3
  %rav.kb.3 = load i32, ptr %rav.k.3, align 4
  %rav.src.3 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.3, i32 0, i32 %rav.kb.3
  %rav.val.3 = load i8, ptr %rav.src.3, align 1
  %rav.dstidx.3 = add i32 8, %rav.kb.3
  %rav.dst.3 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.3
  store i8 %rav.val.3, ptr %rav.dst.3, align 1
  %rav.next.3 = add i32 %rav.kb.3, 1
  store i32 %rav.next.3, ptr %rav.k.3, align 4
  br label %rav.cond.3

rav.end.3:                                        ; preds = %rav.cond.3
  %state_ptr.2 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.2 = getelementptr inbounds [8 x i64], ptr %state_ptr.2, i32 0, i32 2
  %array_load.2 = load i64, ptr %array_gep.2, align 8
  %scalar_to_bytes.4 = alloca [9 x i8], align 1
  %scalar_shift_0.4 = lshr i64 %array_load.2, 56
  %scalar_byte_0.4 = trunc i64 %scalar_shift_0.4 to i8
  %scalar_dst_0.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 0
  store i8 %scalar_byte_0.4, ptr %scalar_dst_0.4, align 1
  %scalar_shift_1.4 = lshr i64 %array_load.2, 48
  %scalar_byte_1.4 = trunc i64 %scalar_shift_1.4 to i8
  %scalar_dst_1.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 1
  store i8 %scalar_byte_1.4, ptr %scalar_dst_1.4, align 1
  %scalar_shift_2.4 = lshr i64 %array_load.2, 40
  %scalar_byte_2.4 = trunc i64 %scalar_shift_2.4 to i8
  %scalar_dst_2.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 2
  store i8 %scalar_byte_2.4, ptr %scalar_dst_2.4, align 1
  %scalar_shift_3.4 = lshr i64 %array_load.2, 32
  %scalar_byte_3.4 = trunc i64 %scalar_shift_3.4 to i8
  %scalar_dst_3.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 3
  store i8 %scalar_byte_3.4, ptr %scalar_dst_3.4, align 1
  %scalar_shift_4.4 = lshr i64 %array_load.2, 24
  %scalar_byte_4.4 = trunc i64 %scalar_shift_4.4 to i8
  %scalar_dst_4.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 4
  store i8 %scalar_byte_4.4, ptr %scalar_dst_4.4, align 1
  %scalar_shift_5.4 = lshr i64 %array_load.2, 16
  %scalar_byte_5.4 = trunc i64 %scalar_shift_5.4 to i8
  %scalar_dst_5.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 5
  store i8 %scalar_byte_5.4, ptr %scalar_dst_5.4, align 1
  %scalar_shift_6.4 = lshr i64 %array_load.2, 8
  %scalar_byte_6.4 = trunc i64 %scalar_shift_6.4 to i8
  %scalar_dst_6.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 6
  store i8 %scalar_byte_6.4, ptr %scalar_dst_6.4, align 1
  %scalar_byte_7.4 = trunc i64 %array_load.2 to i8
  %scalar_dst_7.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 7
  store i8 %scalar_byte_7.4, ptr %scalar_dst_7.4, align 1
  %scalar_null_term.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.4, align 1
  %rav.k.4 = alloca i32, align 4
  store i32 0, ptr %rav.k.4, align 4
  %rav.span.4 = sub i32 23, 16
  br label %rav.cond.4

rav.cond.4:                                       ; preds = %rav.body.4, %rav.end.3
  %rav.kv.4 = load i32, ptr %rav.k.4, align 4
  %rav.cmp.4 = icmp sle i32 %rav.kv.4, %rav.span.4
  br i1 %rav.cmp.4, label %rav.body.4, label %rav.end.4

rav.body.4:                                       ; preds = %rav.cond.4
  %rav.kb.4 = load i32, ptr %rav.k.4, align 4
  %rav.src.4 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.4, i32 0, i32 %rav.kb.4
  %rav.val.4 = load i8, ptr %rav.src.4, align 1
  %rav.dstidx.4 = add i32 16, %rav.kb.4
  %rav.dst.4 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.4
  store i8 %rav.val.4, ptr %rav.dst.4, align 1
  %rav.next.4 = add i32 %rav.kb.4, 1
  store i32 %rav.next.4, ptr %rav.k.4, align 4
  br label %rav.cond.4

rav.end.4:                                        ; preds = %rav.cond.4
  %state_ptr.3 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.3 = getelementptr inbounds [8 x i64], ptr %state_ptr.3, i32 0, i32 3
  %array_load.3 = load i64, ptr %array_gep.3, align 8
  %scalar_to_bytes.5 = alloca [9 x i8], align 1
  %scalar_shift_0.5 = lshr i64 %array_load.3, 56
  %scalar_byte_0.5 = trunc i64 %scalar_shift_0.5 to i8
  %scalar_dst_0.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 0
  store i8 %scalar_byte_0.5, ptr %scalar_dst_0.5, align 1
  %scalar_shift_1.5 = lshr i64 %array_load.3, 48
  %scalar_byte_1.5 = trunc i64 %scalar_shift_1.5 to i8
  %scalar_dst_1.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 1
  store i8 %scalar_byte_1.5, ptr %scalar_dst_1.5, align 1
  %scalar_shift_2.5 = lshr i64 %array_load.3, 40
  %scalar_byte_2.5 = trunc i64 %scalar_shift_2.5 to i8
  %scalar_dst_2.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 2
  store i8 %scalar_byte_2.5, ptr %scalar_dst_2.5, align 1
  %scalar_shift_3.5 = lshr i64 %array_load.3, 32
  %scalar_byte_3.5 = trunc i64 %scalar_shift_3.5 to i8
  %scalar_dst_3.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 3
  store i8 %scalar_byte_3.5, ptr %scalar_dst_3.5, align 1
  %scalar_shift_4.5 = lshr i64 %array_load.3, 24
  %scalar_byte_4.5 = trunc i64 %scalar_shift_4.5 to i8
  %scalar_dst_4.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 4
  store i8 %scalar_byte_4.5, ptr %scalar_dst_4.5, align 1
  %scalar_shift_5.5 = lshr i64 %array_load.3, 16
  %scalar_byte_5.5 = trunc i64 %scalar_shift_5.5 to i8
  %scalar_dst_5.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 5
  store i8 %scalar_byte_5.5, ptr %scalar_dst_5.5, align 1
  %scalar_shift_6.5 = lshr i64 %array_load.3, 8
  %scalar_byte_6.5 = trunc i64 %scalar_shift_6.5 to i8
  %scalar_dst_6.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 6
  store i8 %scalar_byte_6.5, ptr %scalar_dst_6.5, align 1
  %scalar_byte_7.5 = trunc i64 %array_load.3 to i8
  %scalar_dst_7.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 7
  store i8 %scalar_byte_7.5, ptr %scalar_dst_7.5, align 1
  %scalar_null_term.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.5, align 1
  %rav.k.5 = alloca i32, align 4
  store i32 0, ptr %rav.k.5, align 4
  %rav.span.5 = sub i32 31, 24
  br label %rav.cond.5

rav.cond.5:                                       ; preds = %rav.body.5, %rav.end.4
  %rav.kv.5 = load i32, ptr %rav.k.5, align 4
  %rav.cmp.5 = icmp sle i32 %rav.kv.5, %rav.span.5
  br i1 %rav.cmp.5, label %rav.body.5, label %rav.end.5

rav.body.5:                                       ; preds = %rav.cond.5
  %rav.kb.5 = load i32, ptr %rav.k.5, align 4
  %rav.src.5 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.5, i32 0, i32 %rav.kb.5
  %rav.val.5 = load i8, ptr %rav.src.5, align 1
  %rav.dstidx.5 = add i32 24, %rav.kb.5
  %rav.dst.5 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.5
  store i8 %rav.val.5, ptr %rav.dst.5, align 1
  %rav.next.5 = add i32 %rav.kb.5, 1
  store i32 %rav.next.5, ptr %rav.k.5, align 4
  br label %rav.cond.5

rav.end.5:                                        ; preds = %rav.cond.5
  %state_ptr.4 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.4 = getelementptr inbounds [8 x i64], ptr %state_ptr.4, i32 0, i32 4
  %array_load.4 = load i64, ptr %array_gep.4, align 8
  %scalar_to_bytes.6 = alloca [9 x i8], align 1
  %scalar_shift_0.6 = lshr i64 %array_load.4, 56
  %scalar_byte_0.6 = trunc i64 %scalar_shift_0.6 to i8
  %scalar_dst_0.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 0
  store i8 %scalar_byte_0.6, ptr %scalar_dst_0.6, align 1
  %scalar_shift_1.6 = lshr i64 %array_load.4, 48
  %scalar_byte_1.6 = trunc i64 %scalar_shift_1.6 to i8
  %scalar_dst_1.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 1
  store i8 %scalar_byte_1.6, ptr %scalar_dst_1.6, align 1
  %scalar_shift_2.6 = lshr i64 %array_load.4, 40
  %scalar_byte_2.6 = trunc i64 %scalar_shift_2.6 to i8
  %scalar_dst_2.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 2
  store i8 %scalar_byte_2.6, ptr %scalar_dst_2.6, align 1
  %scalar_shift_3.6 = lshr i64 %array_load.4, 32
  %scalar_byte_3.6 = trunc i64 %scalar_shift_3.6 to i8
  %scalar_dst_3.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 3
  store i8 %scalar_byte_3.6, ptr %scalar_dst_3.6, align 1
  %scalar_shift_4.6 = lshr i64 %array_load.4, 24
  %scalar_byte_4.6 = trunc i64 %scalar_shift_4.6 to i8
  %scalar_dst_4.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 4
  store i8 %scalar_byte_4.6, ptr %scalar_dst_4.6, align 1
  %scalar_shift_5.6 = lshr i64 %array_load.4, 16
  %scalar_byte_5.6 = trunc i64 %scalar_shift_5.6 to i8
  %scalar_dst_5.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 5
  store i8 %scalar_byte_5.6, ptr %scalar_dst_5.6, align 1
  %scalar_shift_6.6 = lshr i64 %array_load.4, 8
  %scalar_byte_6.6 = trunc i64 %scalar_shift_6.6 to i8
  %scalar_dst_6.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 6
  store i8 %scalar_byte_6.6, ptr %scalar_dst_6.6, align 1
  %scalar_byte_7.6 = trunc i64 %array_load.4 to i8
  %scalar_dst_7.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 7
  store i8 %scalar_byte_7.6, ptr %scalar_dst_7.6, align 1
  %scalar_null_term.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.6, align 1
  %rav.k.6 = alloca i32, align 4
  store i32 0, ptr %rav.k.6, align 4
  %rav.span.6 = sub i32 39, 32
  br label %rav.cond.6

rav.cond.6:                                       ; preds = %rav.body.6, %rav.end.5
  %rav.kv.6 = load i32, ptr %rav.k.6, align 4
  %rav.cmp.6 = icmp sle i32 %rav.kv.6, %rav.span.6
  br i1 %rav.cmp.6, label %rav.body.6, label %rav.end.6

rav.body.6:                                       ; preds = %rav.cond.6
  %rav.kb.6 = load i32, ptr %rav.k.6, align 4
  %rav.src.6 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.6, i32 0, i32 %rav.kb.6
  %rav.val.6 = load i8, ptr %rav.src.6, align 1
  %rav.dstidx.6 = add i32 32, %rav.kb.6
  %rav.dst.6 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.6
  store i8 %rav.val.6, ptr %rav.dst.6, align 1
  %rav.next.6 = add i32 %rav.kb.6, 1
  store i32 %rav.next.6, ptr %rav.k.6, align 4
  br label %rav.cond.6

rav.end.6:                                        ; preds = %rav.cond.6
  %state_ptr.5 = getelementptr inbounds %standard__crypto__hashing__SHA384__SHA384_CTX, ptr %ctx, i32 0, i32 0
  %array_gep.5 = getelementptr inbounds [8 x i64], ptr %state_ptr.5, i32 0, i32 5
  %array_load.5 = load i64, ptr %array_gep.5, align 8
  %scalar_to_bytes.7 = alloca [9 x i8], align 1
  %scalar_shift_0.7 = lshr i64 %array_load.5, 56
  %scalar_byte_0.7 = trunc i64 %scalar_shift_0.7 to i8
  %scalar_dst_0.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 0
  store i8 %scalar_byte_0.7, ptr %scalar_dst_0.7, align 1
  %scalar_shift_1.7 = lshr i64 %array_load.5, 48
  %scalar_byte_1.7 = trunc i64 %scalar_shift_1.7 to i8
  %scalar_dst_1.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 1
  store i8 %scalar_byte_1.7, ptr %scalar_dst_1.7, align 1
  %scalar_shift_2.7 = lshr i64 %array_load.5, 40
  %scalar_byte_2.7 = trunc i64 %scalar_shift_2.7 to i8
  %scalar_dst_2.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 2
  store i8 %scalar_byte_2.7, ptr %scalar_dst_2.7, align 1
  %scalar_shift_3.7 = lshr i64 %array_load.5, 32
  %scalar_byte_3.7 = trunc i64 %scalar_shift_3.7 to i8
  %scalar_dst_3.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 3
  store i8 %scalar_byte_3.7, ptr %scalar_dst_3.7, align 1
  %scalar_shift_4.7 = lshr i64 %array_load.5, 24
  %scalar_byte_4.7 = trunc i64 %scalar_shift_4.7 to i8
  %scalar_dst_4.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 4
  store i8 %scalar_byte_4.7, ptr %scalar_dst_4.7, align 1
  %scalar_shift_5.7 = lshr i64 %array_load.5, 16
  %scalar_byte_5.7 = trunc i64 %scalar_shift_5.7 to i8
  %scalar_dst_5.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 5
  store i8 %scalar_byte_5.7, ptr %scalar_dst_5.7, align 1
  %scalar_shift_6.7 = lshr i64 %array_load.5, 8
  %scalar_byte_6.7 = trunc i64 %scalar_shift_6.7 to i8
  %scalar_dst_6.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 6
  store i8 %scalar_byte_6.7, ptr %scalar_dst_6.7, align 1
  %scalar_byte_7.7 = trunc i64 %array_load.5 to i8
  %scalar_dst_7.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 7
  store i8 %scalar_byte_7.7, ptr %scalar_dst_7.7, align 1
  %scalar_null_term.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 8
  store i8 0, ptr %scalar_null_term.7, align 1
  %rav.k.7 = alloca i32, align 4
  store i32 0, ptr %rav.k.7, align 4
  %rav.span.7 = sub i32 47, 40
  br label %rav.cond.7

rav.cond.7:                                       ; preds = %rav.body.7, %rav.end.6
  %rav.kv.7 = load i32, ptr %rav.k.7, align 4
  %rav.cmp.7 = icmp sle i32 %rav.kv.7, %rav.span.7
  br i1 %rav.cmp.7, label %rav.body.7, label %rav.end.7

rav.body.7:                                       ; preds = %rav.cond.7
  %rav.kb.7 = load i32, ptr %rav.k.7, align 4
  %rav.src.7 = getelementptr inbounds [9 x i8], ptr %scalar_to_bytes.7, i32 0, i32 %rav.kb.7
  %rav.val.7 = load i8, ptr %rav.src.7, align 1
  %rav.dstidx.7 = add i32 40, %rav.kb.7
  %rav.dst.7 = getelementptr inbounds i8, ptr %hash, i32 %rav.dstidx.7
  store i8 %rav.val.7, ptr %rav.dst.7, align 1
  %rav.next.7 = add i32 %rav.kb.7, 1
  store i32 %rav.next.7, ptr %rav.k.7, align 4
  br label %rav.cond.7

rav.end.7:                                        ; preds = %rav.cond.7
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

attributes #0 = { alwaysinline }
attributes #1 = { naked noinline noreturn }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
