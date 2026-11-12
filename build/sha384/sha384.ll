; ModuleID = "IDEKA_module"
target triple = "x86_64-pc-windows-msvc"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%"standard__crypto__hashing__SHA384__SHA384_CTX" = type {[8 x i64], [128 x i8], i64, i64, i32}
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
%"BigInt" = type {[128 x i32], i32, i1}
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
@"standard__crypto__hashing__SHA384__K384" = internal global [80 x i64] [i64 4794697086780616226, i64 8158064640168781261, i64 -5349999486874862801, i64 -1606136188198331460, i64 4131703408338449720, i64 6480981068601479193, i64 -7908458776815382629, i64 -6116909921290321640, i64 -2880145864133508542, i64 1334009975649890238, i64 2608012711638119052, i64 6128411473006802146, i64 8268148722764581231, i64 -9160688886553864527, i64 -7215885187991268811, i64 -4495734319001033068, i64 -1973867731355612462, i64 -1171420211273849373, i64 1135362057144423861, i64 2597628984639134821, i64 3308224258029322869, i64 5365058923640841347, i64 6679025012923562964, i64 8573033837759648693, i64 -7476448914759557205, i64 -6327057829258317296, i64 -5763719355590565569, i64 -4658551843659510044, i64 -4116276920077217854, i64 -3051310485924567259, i64 489312712824947311, i64 1452737877330783856, i64 2861767655752347644, i64 3322285676063803686, i64 5560940570517711597, i64 5996557281743188959, i64 7280758554555802590, i64 8532644243296465576, i64 -9096487096722542874, i64 -7894198246740708037, i64 -6719396339535248540, i64 -6333637450476146687, i64 -4446306890439682159, i64 -4076793802049405392, i64 -3345356375505022440, i64 -2983346525034927856, i64 -860691631967231958, i64 1182934255886127544, i64 1847814050463011016, i64 2177327727835720531, i64 2830643537854262169, i64 3796741975233480872, i64 4115178125766777443, i64 5681478168544905931, i64 6601373596472566643, i64 7507060721942968483, i64 8399075790359081724, i64 8693463985226723168, i64 -8878714635349349518, i64 -8302665154208450068, i64 -8016688836872298968, i64 -6606660893046293015, i64 -4685533653050689259, i64 -4147400797238176981, i64 -3880063495543823972, i64 -3348786107499101689, i64 -1523767162380948706, i64 -757361751448694408, i64 500013540394364858, i64 748580250866718886, i64 1242879168328830382, i64 1977374033974150939, i64 2944078676154940804, i64 3659926193048069267, i64 4368137639120453308, i64 4836135668995329356, i64 5532061633213252278, i64 6448918945643986474, i64 6902733635092675308, i64 7801388544844847127]
@"standard__crypto__hashing__SHA384__SHA384_CTX.TLD" = internal constant {i32, i32, [5 x {i32, i32, i32}]} {i32 1696, i32 5, [5 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 512, i32 1}, {i32, i32, i32} {i32 512, i32 1024, i32 8}, {i32, i32, i32} {i32 1536, i32 64, i32 1}, {i32, i32, i32} {i32 1600, i32 64, i32 1}, {i32, i32, i32} {i32 1664, i32 32, i32 1}]}
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
@"BigInt.TLD" = internal constant {i32, i32, [3 x {i32, i32, i32}]} {i32 4129, i32 3, [3 x {i32, i32, i32}] [{i32, i32, i32} {i32 0, i32 4096, i32 32}, {i32, i32, i32} {i32 4096, i32 32, i32 32}, {i32, i32, i32} {i32 4128, i32 1, i32 1}]}
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
  %"msg" = alloca [3 x i8]
  store [3 x i8] zeroinitializer, [3 x i8]* %"msg"
  %"hash" = alloca [48 x i8]
  store [48 x i8] zeroinitializer, [48 x i8]* %"hash"
  %"exp" = alloca [48 x i8]
  store [48 x i8] zeroinitializer, [48 x i8]* %"exp"
  %"ctx" = alloca %"standard__crypto__hashing__SHA384__SHA384_CTX"
  store %"standard__crypto__hashing__SHA384__SHA384_CTX" zeroinitializer, %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"hi" = alloca i8
  store i8 0, i8* %"hi"
  %"lo" = alloca i8
  store i8 0, i8* %"lo"
  %".9" = getelementptr inbounds [3 x i8], [3 x i8]* %"msg", i32 0, i32 0
  store i8 97, i8* %".9"
  %".11" = getelementptr inbounds [3 x i8], [3 x i8]* %"msg", i32 0, i32 1
  store i8 98, i8* %".11"
  %".13" = getelementptr inbounds [3 x i8], [3 x i8]* %"msg", i32 0, i32 2
  store i8 99, i8* %".13"
  %".15" = trunc i32 203 to i8
  %".16" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 0
  store i8 %".15", i8* %".16"
  %".18" = trunc i32 0 to i8
  %".19" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 1
  store i8 %".18", i8* %".19"
  %".21" = trunc i32 117 to i8
  %".22" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 2
  store i8 %".21", i8* %".22"
  %".24" = trunc i32 63 to i8
  %".25" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 3
  store i8 %".24", i8* %".25"
  %".27" = trunc i32 69 to i8
  %".28" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 4
  store i8 %".27", i8* %".28"
  %".30" = trunc i32 163 to i8
  %".31" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 5
  store i8 %".30", i8* %".31"
  %".33" = trunc i32 94 to i8
  %".34" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 6
  store i8 %".33", i8* %".34"
  %".36" = trunc i32 139 to i8
  %".37" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 7
  store i8 %".36", i8* %".37"
  %".39" = trunc i32 181 to i8
  %".40" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 8
  store i8 %".39", i8* %".40"
  %".42" = trunc i32 160 to i8
  %".43" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 9
  store i8 %".42", i8* %".43"
  %".45" = trunc i32 61 to i8
  %".46" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 10
  store i8 %".45", i8* %".46"
  %".48" = trunc i32 105 to i8
  %".49" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 11
  store i8 %".48", i8* %".49"
  %".51" = trunc i32 154 to i8
  %".52" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 12
  store i8 %".51", i8* %".52"
  %".54" = trunc i32 198 to i8
  %".55" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 13
  store i8 %".54", i8* %".55"
  %".57" = trunc i32 80 to i8
  %".58" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 14
  store i8 %".57", i8* %".58"
  %".60" = trunc i32 7 to i8
  %".61" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 15
  store i8 %".60", i8* %".61"
  %".63" = trunc i32 39 to i8
  %".64" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 16
  store i8 %".63", i8* %".64"
  %".66" = trunc i32 44 to i8
  %".67" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 17
  store i8 %".66", i8* %".67"
  %".69" = trunc i32 50 to i8
  %".70" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 18
  store i8 %".69", i8* %".70"
  %".72" = trunc i32 171 to i8
  %".73" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 19
  store i8 %".72", i8* %".73"
  %".75" = trunc i32 14 to i8
  %".76" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 20
  store i8 %".75", i8* %".76"
  %".78" = trunc i32 222 to i8
  %".79" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 21
  store i8 %".78", i8* %".79"
  %".81" = trunc i32 209 to i8
  %".82" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 22
  store i8 %".81", i8* %".82"
  %".84" = trunc i32 99 to i8
  %".85" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 23
  store i8 %".84", i8* %".85"
  %".87" = trunc i32 26 to i8
  %".88" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 24
  store i8 %".87", i8* %".88"
  %".90" = trunc i32 139 to i8
  %".91" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 25
  store i8 %".90", i8* %".91"
  %".93" = trunc i32 96 to i8
  %".94" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 26
  store i8 %".93", i8* %".94"
  %".96" = trunc i32 90 to i8
  %".97" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 27
  store i8 %".96", i8* %".97"
  %".99" = trunc i32 67 to i8
  %".100" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 28
  store i8 %".99", i8* %".100"
  %".102" = trunc i32 255 to i8
  %".103" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 29
  store i8 %".102", i8* %".103"
  %".105" = trunc i32 91 to i8
  %".106" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 30
  store i8 %".105", i8* %".106"
  %".108" = trunc i32 237 to i8
  %".109" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 31
  store i8 %".108", i8* %".109"
  %".111" = trunc i32 128 to i8
  %".112" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 32
  store i8 %".111", i8* %".112"
  %".114" = trunc i32 134 to i8
  %".115" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 33
  store i8 %".114", i8* %".115"
  %".117" = trunc i32 7 to i8
  %".118" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 34
  store i8 %".117", i8* %".118"
  %".120" = trunc i32 43 to i8
  %".121" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 35
  store i8 %".120", i8* %".121"
  %".123" = trunc i32 161 to i8
  %".124" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 36
  store i8 %".123", i8* %".124"
  %".126" = trunc i32 231 to i8
  %".127" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 37
  store i8 %".126", i8* %".127"
  %".129" = trunc i32 204 to i8
  %".130" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 38
  store i8 %".129", i8* %".130"
  %".132" = trunc i32 35 to i8
  %".133" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 39
  store i8 %".132", i8* %".133"
  %".135" = trunc i32 88 to i8
  %".136" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 40
  store i8 %".135", i8* %".136"
  %".138" = trunc i32 186 to i8
  %".139" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 41
  store i8 %".138", i8* %".139"
  %".141" = trunc i32 236 to i8
  %".142" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 42
  store i8 %".141", i8* %".142"
  %".144" = trunc i32 161 to i8
  %".145" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 43
  store i8 %".144", i8* %".145"
  %".147" = trunc i32 52 to i8
  %".148" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 44
  store i8 %".147", i8* %".148"
  %".150" = trunc i32 200 to i8
  %".151" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 45
  store i8 %".150", i8* %".151"
  %".153" = trunc i32 37 to i8
  %".154" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 46
  store i8 %".153", i8* %".154"
  %".156" = trunc i32 167 to i8
  %".157" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 47
  store i8 %".156", i8* %".157"
  call void @"standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx")
  %".160" = getelementptr inbounds [3 x i8], [3 x i8]* %"msg", i32 0, i32 0
  %".161" = sext i32 3 to i64
  call void @"standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", i8* %".160", i64 %".161")
  %".163" = getelementptr inbounds [48 x i8], [48 x i8]* %"hash", i32 0, i32 0
  call void @"standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", i8* %".163")
  %"str_stack" = alloca [6 x i8]
  %"str_char_0" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 0
  store i8 71, i8* %"str_char_0"
  %"str_char_1" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 1
  store i8 79, i8* %"str_char_1"
  %"str_char_2" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 2
  store i8 84, i8* %"str_char_2"
  %"str_char_3" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 3
  store i8 58, i8* %"str_char_3"
  %"str_char_4" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 4
  store i8 32, i8* %"str_char_4"
  %"str_char_5" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 5
  store i8 0, i8* %"str_char_5"
  %"arg0_decay" = getelementptr [6 x i8], [6 x i8]* %"str_stack", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay")
  store i32 0, i32* %"i"
  %"ok" = alloca i32
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".174" = icmp slt i32 %"i.1", 48
  br i1 %".174", label %"for.body", label %"for.end"
for.body:
  %"i.2" = load i32, i32* %"i"
  %"array_gep" = getelementptr inbounds [48 x i8], [48 x i8]* %"hash", i32 0, i32 %"i.2"
  %"array_load" = load i8, i8* %"array_gep"
  %".176" = trunc i32 4 to i8
  %".177" = lshr i8 %"array_load", %".176"
  %".178" = trunc i32 15 to i8
  %".179" = and i8 %".177", %".178"
  store i8 %".179", i8* %"hi"
  %"i.3" = load i32, i32* %"i"
  %"array_gep.1" = getelementptr inbounds [48 x i8], [48 x i8]* %"hash", i32 0, i32 %"i.3"
  %"array_load.1" = load i8, i8* %"array_gep.1"
  %".181" = trunc i32 15 to i8
  %".182" = and i8 %"array_load.1", %".181"
  store i8 %".182", i8* %"lo"
  %"hi.1" = load i8, i8* %"hi"
  %".184" = trunc i32 10 to i8
  %".185" = icmp ult i8 %"hi.1", %".184"
  br i1 %".185", label %"then", label %"else"
for.update:
  %"i.4" = load i32, i32* %"i"
  %".207" = add i32 %"i.4", 1
  store i32 %".207", i32* %"i"
  br label %"for.cond"
for.end:
  %"str_stack.1" = alloca [2 x i8]
  %"str_char_0.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  store i8 10, i8* %"str_char_0.1"
  %"str_char_1.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 1
  store i8 0, i8* %"str_char_1.1"
  %"arg0_decay.1" = getelementptr [2 x i8], [2 x i8]* %"str_stack.1", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.1")
  store i32 1, i32* %"ok"
  store i32 0, i32* %"i"
  br label %"for.cond.1"
then:
  %"hi.2" = load i8, i8* %"hi"
  %".187" = add i8 48, %"hi.2"
  call void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %".187")
  br label %"ifcont"
else:
  %"hi.3" = load i8, i8* %"hi"
  %".190" = trunc i32 10 to i8
  %".191" = sub i8 %"hi.3", %".190"
  %".192" = add i8 65, %".191"
  call void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %".192")
  br label %"ifcont"
ifcont:
  %"lo.1" = load i8, i8* %"lo"
  %".195" = trunc i32 10 to i8
  %".196" = icmp ult i8 %"lo.1", %".195"
  br i1 %".196", label %"then.1", label %"else.1"
then.1:
  %"lo.2" = load i8, i8* %"lo"
  %".198" = add i8 48, %"lo.2"
  call void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %".198")
  br label %"ifcont.1"
else.1:
  %"lo.3" = load i8, i8* %"lo"
  %".201" = trunc i32 10 to i8
  %".202" = sub i8 %"lo.3", %".201"
  %".203" = add i8 65, %".202"
  call void @"standard__io__console__print__1__byteE1__ret_voidE1"(i8 %".203")
  br label %"ifcont.1"
ifcont.1:
  br label %"for.update"
for.cond.1:
  %"i.5" = load i32, i32* %"i"
  %".216" = icmp slt i32 %"i.5", 48
  br i1 %".216", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"i.6" = load i32, i32* %"i"
  %"array_gep.2" = getelementptr inbounds [48 x i8], [48 x i8]* %"hash", i32 0, i32 %"i.6"
  %"array_load.2" = load i8, i8* %"array_gep.2"
  %"i.7" = load i32, i32* %"i"
  %"array_gep.3" = getelementptr inbounds [48 x i8], [48 x i8]* %"exp", i32 0, i32 %"i.7"
  %"array_load.3" = load i8, i8* %"array_gep.3"
  %".218" = icmp ne i8 %"array_load.2", %"array_load.3"
  br i1 %".218", label %"then.2", label %"else.2"
for.update.1:
  %"i.8" = load i32, i32* %"i"
  %".224" = add i32 %"i.8", 1
  store i32 %".224", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  %"ok.1" = load i32, i32* %"ok"
  %"tobool" = icmp ne i32 %"ok.1", 0
  br i1 %"tobool", label %"ternary_true", label %"ternary_false"
then.2:
  store i32 0, i32* %"ok"
  br label %"ifcont.2"
else.2:
  br label %"ifcont.2"
ifcont.2:
  br label %"for.update.1"
ternary_true:
  %"str_stack.2" = alloca [8 x i8]
  %"str_char_0.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 0
  store i8 91, i8* %"str_char_0.2"
  %"str_char_1.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 1
  store i8 80, i8* %"str_char_1.2"
  %"str_char_2.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 2
  store i8 65, i8* %"str_char_2.1"
  %"str_char_3.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 3
  store i8 83, i8* %"str_char_3.1"
  %"str_char_4.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 4
  store i8 83, i8* %"str_char_4.1"
  %"str_char_5.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 5
  store i8 93, i8* %"str_char_5.1"
  %"str_char_6" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 6
  store i8 10, i8* %"str_char_6"
  %"str_char_7" = getelementptr [8 x i8], [8 x i8]* %"str_stack.2", i32 0, i32 7
  store i8 0, i8* %"str_char_7"
  br label %"ternary_merge"
ternary_false:
  %"str_stack.3" = alloca [8 x i8]
  %"str_char_0.3" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 0
  store i8 91, i8* %"str_char_0.3"
  %"str_char_1.3" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 1
  store i8 70, i8* %"str_char_1.3"
  %"str_char_2.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 2
  store i8 65, i8* %"str_char_2.2"
  %"str_char_3.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 3
  store i8 73, i8* %"str_char_3.2"
  %"str_char_4.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 4
  store i8 76, i8* %"str_char_4.2"
  %"str_char_5.2" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 5
  store i8 93, i8* %"str_char_5.2"
  %"str_char_6.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 6
  store i8 10, i8* %"str_char_6.1"
  %"str_char_7.1" = getelementptr [8 x i8], [8 x i8]* %"str_stack.3", i32 0, i32 7
  store i8 0, i8* %"str_char_7.1"
  br label %"ternary_merge"
ternary_merge:
  %"ternary_result" = phi  [8 x i8]* [%"str_stack.2", %"ternary_true"], [%"str_stack.3", %"ternary_false"]
  %"arg0_decay.2" = getelementptr [8 x i8], [8 x i8]* %"ternary_result", i32 0, i32 0
  call void @"standard__io__console__print__1__byteE1_arr__ret_voidE1"(i8* %"arg0_decay.2")
  %"ok.2" = load i32, i32* %"ok"
  %"tobool.1" = icmp ne i32 %"ok.2", 0
  br i1 %"tobool.1", label %"ternary_true.1", label %"ternary_false.1"
ternary_true.1:
  br label %"ternary_merge.1"
ternary_false.1:
  br label %"ternary_merge.1"
ternary_merge.1:
  %"ternary_result.1" = phi  i32 [0, %"ternary_true.1"], [1, %"ternary_false.1"]
  ret i32 %"ternary_result.1"
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

define float @"standard__math__exp__1__floatE1__ret_floatE1"(float %"x")
{
entry:
  %"x.addr" = alloca float
  store float %"x", float* %"x.addr"
  %"x.1" = load float, float* %"x.addr"
  %".4" = fpext float %"x.1" to double
  %".5" = call double @"standard__math__exp__1__doubleE1__ret_doubleE1"(double %".4")
  %".6" = fptrunc double %".5" to float
  ret float %".6"
}

define double @"standard__math__exp__1__doubleE1__ret_doubleE1"(double %"x")
{
entry:
  %"x.addr" = alloca double
  store double %"x", double* %"x.addr"
  %"x.1" = load double, double* %"x.addr"
  %"float_to_double_rhs" = fpext float 0x40862e4300000000 to double
  %".4" = fcmp ogt double %"x.1", %"float_to_double_rhs"
  %"ln2_hi" = alloca double
  %"ln2_lo" = alloca double
  %"inv_ln2" = alloca double
  %"fn" = alloca double
  %"n" = alloca i32
  %"r" = alloca double
  %"r2" = alloca double
  %"p" = alloca double
  %"result" = alloca double
  %"bits" = alloca i64
  %"exp_field" = alloca i64
  br i1 %".4", label %"then", label %"else"
then:
  ret double 0x7fefffffffffffff
else:
  br label %"ifcont"
ifcont:
  %"x.2" = load double, double* %"x.addr"
  %".8" = fsub float              0x0, 0x40874910e0000000
  %"float_to_double_rhs.1" = fpext float %".8" to double
  %".9" = fcmp olt double %"x.2", %"float_to_double_rhs.1"
  br i1 %".9", label %"then.1", label %"else.1"
then.1:
  %".11" = fpext float              0x0 to double
  ret double %".11"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"float_to_double" = fpext float 0x3fe62e4300000000 to double
  store double %"float_to_double", double* %"ln2_hi"
  store double 0x3dea39ef35793c76, double* %"ln2_lo"
  %"float_to_double.1" = fpext float 0x3ff7154760000000 to double
  store double %"float_to_double.1", double* %"inv_ln2"
  %"x.3" = load double, double* %"x.addr"
  %"inv_ln2.1" = load double, double* %"inv_ln2"
  %".17" = fmul double %"x.3", %"inv_ln2.1"
  store double %".17", double* %"fn"
  store i32 0, i32* %"n"
  %"fn.1" = load double, double* %"fn"
  %"float_to_double_rhs.2" = fpext float              0x0 to double
  %".20" = fcmp oge double %"fn.1", %"float_to_double_rhs.2"
  br i1 %".20", label %"then.2", label %"else.2"
then.2:
  %"fn.2" = load double, double* %"fn"
  %"float_to_double_rhs.3" = fpext float 0x3fe0000000000000 to double
  %".22" = fadd double %"fn.2", %"float_to_double_rhs.3"
  %".23" = fptosi double %".22" to i32
  store i32 %".23", i32* %"n"
  br label %"ifcont.2"
else.2:
  %"fn.3" = load double, double* %"fn"
  %"float_to_double_rhs.4" = fpext float 0x3fe0000000000000 to double
  %".26" = fsub double %"fn.3", %"float_to_double_rhs.4"
  %".27" = fptosi double %".26" to i32
  store i32 %".27", i32* %"n"
  br label %"ifcont.2"
ifcont.2:
  %"x.4" = load double, double* %"x.addr"
  %"n.1" = load i32, i32* %"n"
  %".30" = sitofp i32 %"n.1" to double
  %"ln2_hi.1" = load double, double* %"ln2_hi"
  %".31" = fmul double %".30", %"ln2_hi.1"
  %".32" = fsub double %"x.4", %".31"
  store double %".32", double* %"r"
  %"r.1" = load double, double* %"r"
  %"n.2" = load i32, i32* %"n"
  %".34" = sitofp i32 %"n.2" to double
  %"ln2_lo.1" = load double, double* %"ln2_lo"
  %".35" = fmul double %".34", %"ln2_lo.1"
  %".36" = fsub double %"r.1", %".35"
  store double %".36", double* %"r"
  %"r.2" = load double, double* %"r"
  %"r.3" = load double, double* %"r"
  %".38" = fmul double %"r.2", %"r.3"
  store double %".38", double* %"r2"
  %"r.4" = load double, double* %"r"
  %"r2.1" = load double, double* %"r2"
  %"r2.2" = load double, double* %"r2"
  %"r2.3" = load double, double* %"r2"
  %"r2.4" = load double, double* %"r2"
  %"r2.5" = load double, double* %"r2"
  %".40" = fmul double %"r2.5", 0x3e5aa1688d199d5b
  %".41" = fadd double 0x3eb74d3b7ba53bbc, %".40"
  %".42" = fmul double %"r2.4", %".41"
  %"float_to_double_lhs" = fpext float 0x3f15d867c0000000 to double
  %".43" = fadd double %"float_to_double_lhs", %".42"
  %".44" = fmul double %"r2.3", %".43"
  %"float_to_double_lhs.1" = fpext float 0x3f71111120000000 to double
  %".45" = fadd double %"float_to_double_lhs.1", %".44"
  %".46" = fmul double %"r2.2", %".45"
  %"float_to_double_lhs.2" = fpext float 0x3fc5555560000000 to double
  %".47" = fadd double %"float_to_double_lhs.2", %".46"
  %".48" = fmul double %"r2.1", %".47"
  %"float_to_double_lhs.3" = fpext float 0x3ff0000000000000 to double
  %".49" = fadd double %"float_to_double_lhs.3", %".48"
  %".50" = fmul double %"r.4", %".49"
  store double %".50", double* %"p"
  %"r.5" = load double, double* %"r"
  %"p.1" = load double, double* %"p"
  %".52" = fmul double %"r.5", %"p.1"
  %"p.2" = load double, double* %"p"
  %"float_to_double_lhs.4" = fpext float 0x4000000000000000 to double
  %".53" = fsub double %"float_to_double_lhs.4", %"p.2"
  %".54" = fdiv double %".52", %".53"
  %"r.6" = load double, double* %"r"
  %".55" = fadd double %".54", %"r.6"
  %"float_to_double_lhs.5" = fpext float 0x3ff0000000000000 to double
  %".56" = fadd double %"float_to_double_lhs.5", %".55"
  store double %".56", double* %"result"
  %"n.3" = load i32, i32* %"n"
  %".58" = icmp eq i32 %"n.3", 0
  br i1 %".58", label %"then.3", label %"else.3"
then.3:
  %"result.1" = load double, double* %"result"
  ret double %"result.1"
else.3:
  br label %"ifcont.3"
ifcont.3:
  store i64 0, i64* %"bits"
  %".63" = bitcast double* %"result" to i64*
  %"deref" = load i64, i64* %".63"
  store i64 %"deref", i64* %"bits"
  store i64 0, i64* %"exp_field"
  %"bits.1" = load i64, i64* %"bits"
  %".66" = zext i32 52 to i64
  %".67" = lshr i64 %"bits.1", %".66"
  %".68" = sext i32 2047 to i64
  %".69" = and i64 %".67", %".68"
  %"n.4" = load i32, i32* %"n"
  %".70" = sext i32 %"n.4" to i64
  %".71" = add i64 %".69", %".70"
  store i64 %".71", i64* %"exp_field"
  %"exp_field.1" = load i64, i64* %"exp_field"
  %".73" = sext i32 0 to i64
  %".74" = icmp sle i64 %"exp_field.1", %".73"
  br i1 %".74", label %"then.4", label %"else.4"
then.4:
  %".76" = fpext float              0x0 to double
  ret double %".76"
else.4:
  br label %"ifcont.4"
ifcont.4:
  %"exp_field.2" = load i64, i64* %"exp_field"
  %".79" = sext i32 2047 to i64
  %".80" = icmp sge i64 %"exp_field.2", %".79"
  br i1 %".80", label %"then.5", label %"else.5"
then.5:
  ret double 0x7fefffffffffffff
else.5:
  br label %"ifcont.5"
ifcont.5:
  %"bits.2" = load i64, i64* %"bits"
  %".84" = and i64 %"bits.2", 9227875636482146303
  %"exp_field.3" = load i64, i64* %"exp_field"
  %".85" = zext i32 52 to i64
  %".86" = shl i64 %"exp_field.3", %".85"
  %".87" = or i64 %".84", %".86"
  store i64 %".87", i64* %"bits"
  %".89" = bitcast i64* %"bits" to double*
  %"deref.1" = load double, double* %".89"
  ret double %"deref.1"
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

define i32 @"standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32"(i32 %"x", i32 %"y", i32 %"z")
{
entry:
  %"x.addr" = alloca i32
  store i32 %"x", i32* %"x.addr"
  %"y.addr" = alloca i32
  store i32 %"y", i32* %"y.addr"
  %"z.addr" = alloca i32
  store i32 %"z", i32* %"z.addr"
  %"x.1" = load i32, i32* %"x.addr"
  %"y.1" = load i32, i32* %"y.addr"
  %".8" = and i32 %"x.1", %"y.1"
  %"x.2" = load i32, i32* %"x.addr"
  %".9" = xor i32 %"x.2", -1
  %"z.1" = load i32, i32* %"z.addr"
  %".10" = and i32 %".9", %"z.1"
  %".11" = xor i32 %".8", %".10"
  ret i32 %".11"
}

define i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"value", i64 %"n")
{
entry:
  %"value.addr" = alloca i64
  store i64 %"value", i64* %"value.addr"
  %"n.addr" = alloca i64
  store i64 %"n", i64* %"n.addr"
  %"value.1" = load i64, i64* %"value.addr"
  %"n.1" = load i64, i64* %"n.addr"
  %".6" = lshr i64 %"value.1", %"n.1"
  %"value.2" = load i64, i64* %"value.addr"
  %"n.2" = load i64, i64* %"n.addr"
  %".7" = zext i32 64 to i64
  %".8" = sub i64 %".7", %"n.2"
  %".9" = shl i64 %"value.2", %".8"
  %".10" = or i64 %".6", %".9"
  ret i64 %".10"
}

define i64 @"standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x", i64 %"y", i64 %"z")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"y.addr" = alloca i64
  store i64 %"y", i64* %"y.addr"
  %"z.addr" = alloca i64
  store i64 %"z", i64* %"z.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %"y.1" = load i64, i64* %"y.addr"
  %".8" = and i64 %"x.1", %"y.1"
  %"x.2" = load i64, i64* %"x.addr"
  %".9" = xor i64 %"x.2", -1
  %"z.1" = load i64, i64* %"z.addr"
  %".10" = and i64 %".9", %"z.1"
  %".11" = xor i64 %".8", %".10"
  ret i64 %".11"
}

define i64 @"standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x", i64 %"y", i64 %"z")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"y.addr" = alloca i64
  store i64 %"y", i64* %"y.addr"
  %"z.addr" = alloca i64
  store i64 %"z", i64* %"z.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %"y.1" = load i64, i64* %"y.addr"
  %".8" = and i64 %"x.1", %"y.1"
  %"x.2" = load i64, i64* %"x.addr"
  %"z.1" = load i64, i64* %"z.addr"
  %".9" = and i64 %"x.2", %"z.1"
  %".10" = xor i64 %".8", %".9"
  %"y.2" = load i64, i64* %"y.addr"
  %"z.2" = load i64, i64* %"z.addr"
  %".11" = and i64 %"y.2", %"z.2"
  %".12" = xor i64 %".10", %".11"
  ret i64 %".12"
}

define i64 @"standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = zext i32 28 to i64
  %".5" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.1", i64 %".4")
  %"x.2" = load i64, i64* %"x.addr"
  %".6" = zext i32 34 to i64
  %".7" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.2", i64 %".6")
  %".8" = xor i64 %".5", %".7"
  %"x.3" = load i64, i64* %"x.addr"
  %".9" = zext i32 39 to i64
  %".10" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.3", i64 %".9")
  %".11" = xor i64 %".8", %".10"
  ret i64 %".11"
}

define i64 @"standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = zext i32 14 to i64
  %".5" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.1", i64 %".4")
  %"x.2" = load i64, i64* %"x.addr"
  %".6" = zext i32 18 to i64
  %".7" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.2", i64 %".6")
  %".8" = xor i64 %".5", %".7"
  %"x.3" = load i64, i64* %"x.addr"
  %".9" = zext i32 41 to i64
  %".10" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.3", i64 %".9")
  %".11" = xor i64 %".8", %".10"
  ret i64 %".11"
}

define i64 @"standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = zext i32 1 to i64
  %".5" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.1", i64 %".4")
  %"x.2" = load i64, i64* %"x.addr"
  %".6" = zext i32 8 to i64
  %".7" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.2", i64 %".6")
  %".8" = xor i64 %".5", %".7"
  %"x.3" = load i64, i64* %"x.addr"
  %".9" = zext i32 7 to i64
  %".10" = lshr i64 %"x.3", %".9"
  %".11" = xor i64 %".8", %".10"
  ret i64 %".11"
}

define i64 @"standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x")
{
entry:
  %"x.addr" = alloca i64
  store i64 %"x", i64* %"x.addr"
  %"x.1" = load i64, i64* %"x.addr"
  %".4" = zext i32 19 to i64
  %".5" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.1", i64 %".4")
  %"x.2" = load i64, i64* %"x.addr"
  %".6" = zext i32 61 to i64
  %".7" = call i64 @"standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"x.2", i64 %".6")
  %".8" = xor i64 %".5", %".7"
  %"x.3" = load i64, i64* %"x.addr"
  %".9" = zext i32 6 to i64
  %".10" = lshr i64 %"x.3", %".9"
  %".11" = xor i64 %".8", %".10"
  ret i64 %".11"
}

define void @"standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx")
{
entry:
  %"ctx.addr" = alloca %"standard__crypto__hashing__SHA384__SHA384_CTX"*
  store %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"array_literal_const" = alloca [8 x i64]
  store [8 x i64] [i64 -3766243637369397544, i64 7105036623409894663, i64 -7973340178411365097, i64 1526699215303891257, i64 7436329637833083697, i64 -8163818279084223215, i64 -2662702644619276377, i64 5167115440072839076], [8 x i64]* %"array_literal_const"
  %"ctx_ptr" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".5" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr", i32 0, i32 0
  %"elem_0" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 0
  store i64 -3766243637369397544, i64* %"elem_0"
  %"elem_1" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 1
  store i64 7105036623409894663, i64* %"elem_1"
  %"elem_2" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 2
  store i64 -7973340178411365097, i64* %"elem_2"
  %"elem_3" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 3
  store i64 1526699215303891257, i64* %"elem_3"
  %"elem_4" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 4
  store i64 7436329637833083697, i64* %"elem_4"
  %"elem_5" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 5
  store i64 -8163818279084223215, i64* %"elem_5"
  %"elem_6" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 6
  store i64 -2662702644619276377, i64* %"elem_6"
  %"elem_7" = getelementptr [8 x i64], [8 x i64]* %".5", i32 0, i32 7
  store i64 5167115440072839076, i64* %"elem_7"
  %"ctx_ptr.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".14" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.1", i32 0, i32 2
  %".15" = zext i32 0 to i64
  store i64 %".15", i64* %".14"
  %"ctx_ptr.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".17" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.2", i32 0, i32 3
  %".18" = zext i32 0 to i64
  store i64 %".18", i64* %".17"
  %"ctx_ptr.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".20" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.3", i32 0, i32 4
  store i32 0, i32* %".20"
  ret void
}

define void @"standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", i8* %"datax")
{
entry:
  %"ctx.addr" = alloca %"standard__crypto__hashing__SHA384__SHA384_CTX"*
  store %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"datax.addr" = alloca i8*
  store i8* %"datax", i8** %"datax.addr"
  %"W" = alloca [80 x i64]
  %"memset_ptr" = bitcast [80 x i64]* %"W" to i8*
  call void @"llvm.memset.p0i8.i64"(i8* %"memset_ptr", i8 0, i64 640, i1 0)
  %"a" = alloca i64
  store i64 0, i64* %"a"
  %"b" = alloca i64
  store i64 0, i64* %"b"
  %"c" = alloca i64
  store i64 0, i64* %"c"
  %"d" = alloca i64
  store i64 0, i64* %"d"
  %"e" = alloca i64
  store i64 0, i64* %"e"
  %"f" = alloca i64
  store i64 0, i64* %"f"
  %"g" = alloca i64
  store i64 0, i64* %"g"
  %"h" = alloca i64
  store i64 0, i64* %"h"
  %"t1" = alloca i64
  store i64 0, i64* %"t1"
  %"t2" = alloca i64
  store i64 0, i64* %"t2"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i32, i32* %"i"
  %".20" = icmp ult i32 %"i.1", 16
  br i1 %".20", label %"for.body", label %"for.end"
for.body:
  %"datax.1" = load i8*, i8** %"datax.addr"
  %"i.2" = load i32, i32* %"i"
  %".22" = mul i32 %"i.2", 8
  %"ptr_gep" = getelementptr inbounds i8, i8* %"datax.1", i32 %".22"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %".23" = zext i8 %"ptr_load" to i32
  %".24" = and i32 %".23", 255
  %".25" = zext i32 %".24" to i64
  %".26" = zext i32 56 to i64
  %".27" = shl i64 %".25", %".26"
  %"datax.2" = load i8*, i8** %"datax.addr"
  %"i.3" = load i32, i32* %"i"
  %".28" = mul i32 %"i.3", 8
  %".29" = add i32 %".28", 1
  %"ptr_gep.1" = getelementptr inbounds i8, i8* %"datax.2", i32 %".29"
  %"ptr_load.1" = load i8, i8* %"ptr_gep.1"
  %".30" = zext i8 %"ptr_load.1" to i32
  %".31" = and i32 %".30", 255
  %".32" = zext i32 %".31" to i64
  %".33" = zext i32 48 to i64
  %".34" = shl i64 %".32", %".33"
  %".35" = or i64 %".27", %".34"
  %"datax.3" = load i8*, i8** %"datax.addr"
  %"i.4" = load i32, i32* %"i"
  %".36" = mul i32 %"i.4", 8
  %".37" = add i32 %".36", 2
  %"ptr_gep.2" = getelementptr inbounds i8, i8* %"datax.3", i32 %".37"
  %"ptr_load.2" = load i8, i8* %"ptr_gep.2"
  %".38" = zext i8 %"ptr_load.2" to i32
  %".39" = and i32 %".38", 255
  %".40" = zext i32 %".39" to i64
  %".41" = zext i32 40 to i64
  %".42" = shl i64 %".40", %".41"
  %".43" = or i64 %".35", %".42"
  %"datax.4" = load i8*, i8** %"datax.addr"
  %"i.5" = load i32, i32* %"i"
  %".44" = mul i32 %"i.5", 8
  %".45" = add i32 %".44", 3
  %"ptr_gep.3" = getelementptr inbounds i8, i8* %"datax.4", i32 %".45"
  %"ptr_load.3" = load i8, i8* %"ptr_gep.3"
  %".46" = zext i8 %"ptr_load.3" to i32
  %".47" = and i32 %".46", 255
  %".48" = zext i32 %".47" to i64
  %".49" = zext i32 32 to i64
  %".50" = shl i64 %".48", %".49"
  %".51" = or i64 %".43", %".50"
  %"datax.5" = load i8*, i8** %"datax.addr"
  %"i.6" = load i32, i32* %"i"
  %".52" = mul i32 %"i.6", 8
  %".53" = add i32 %".52", 4
  %"ptr_gep.4" = getelementptr inbounds i8, i8* %"datax.5", i32 %".53"
  %"ptr_load.4" = load i8, i8* %"ptr_gep.4"
  %".54" = zext i8 %"ptr_load.4" to i32
  %".55" = and i32 %".54", 255
  %".56" = zext i32 %".55" to i64
  %".57" = zext i32 24 to i64
  %".58" = shl i64 %".56", %".57"
  %".59" = or i64 %".51", %".58"
  %"datax.6" = load i8*, i8** %"datax.addr"
  %"i.7" = load i32, i32* %"i"
  %".60" = mul i32 %"i.7", 8
  %".61" = add i32 %".60", 5
  %"ptr_gep.5" = getelementptr inbounds i8, i8* %"datax.6", i32 %".61"
  %"ptr_load.5" = load i8, i8* %"ptr_gep.5"
  %".62" = zext i8 %"ptr_load.5" to i32
  %".63" = and i32 %".62", 255
  %".64" = zext i32 %".63" to i64
  %".65" = zext i32 16 to i64
  %".66" = shl i64 %".64", %".65"
  %".67" = or i64 %".59", %".66"
  %"datax.7" = load i8*, i8** %"datax.addr"
  %"i.8" = load i32, i32* %"i"
  %".68" = mul i32 %"i.8", 8
  %".69" = add i32 %".68", 6
  %"ptr_gep.6" = getelementptr inbounds i8, i8* %"datax.7", i32 %".69"
  %"ptr_load.6" = load i8, i8* %"ptr_gep.6"
  %".70" = zext i8 %"ptr_load.6" to i32
  %".71" = and i32 %".70", 255
  %".72" = zext i32 %".71" to i64
  %".73" = zext i32 8 to i64
  %".74" = shl i64 %".72", %".73"
  %".75" = or i64 %".67", %".74"
  %"datax.8" = load i8*, i8** %"datax.addr"
  %"i.9" = load i32, i32* %"i"
  %".76" = mul i32 %"i.9", 8
  %".77" = add i32 %".76", 7
  %"ptr_gep.7" = getelementptr inbounds i8, i8* %"datax.8", i32 %".77"
  %"ptr_load.7" = load i8, i8* %"ptr_gep.7"
  %".78" = zext i8 %"ptr_load.7" to i32
  %".79" = and i32 %".78", 255
  %".80" = zext i32 %".79" to i64
  %".81" = or i64 %".75", %".80"
  %"i.10" = load i32, i32* %"i"
  %".82" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %"i.10"
  store i64 %".81", i64* %".82"
  br label %"for.update"
for.update:
  %"i.11" = load i32, i32* %"i"
  %".85" = add i32 %"i.11", 1
  store i32 %".85", i32* %"i"
  br label %"for.cond"
for.end:
  store i32 16, i32* %"i"
  br label %"for.cond.1"
for.cond.1:
  %"i.12" = load i32, i32* %"i"
  %".90" = icmp ult i32 %"i.12", 80
  br i1 %".90", label %"for.body.1", label %"for.end.1"
for.body.1:
  %"i.13" = load i32, i32* %"i"
  %".92" = sub i32 %"i.13", 2
  %"array_gep" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %".92"
  %"array_load" = load i64, i64* %"array_gep"
  %".93" = call i64 @"standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"array_load")
  %"i.14" = load i32, i32* %"i"
  %".94" = sub i32 %"i.14", 7
  %"array_gep.1" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %".94"
  %"array_load.1" = load i64, i64* %"array_gep.1"
  %".95" = add i64 %".93", %"array_load.1"
  %"i.15" = load i32, i32* %"i"
  %".96" = sub i32 %"i.15", 15
  %"array_gep.2" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %".96"
  %"array_load.2" = load i64, i64* %"array_gep.2"
  %".97" = call i64 @"standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"array_load.2")
  %".98" = add i64 %".95", %".97"
  %"i.16" = load i32, i32* %"i"
  %".99" = sub i32 %"i.16", 16
  %"array_gep.3" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %".99"
  %"array_load.3" = load i64, i64* %"array_gep.3"
  %".100" = add i64 %".98", %"array_load.3"
  %"i.17" = load i32, i32* %"i"
  %".101" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %"i.17"
  store i64 %".100", i64* %".101"
  br label %"for.update.1"
for.update.1:
  %"i.18" = load i32, i32* %"i"
  %".104" = add i32 %"i.18", 1
  store i32 %".104", i32* %"i"
  br label %"for.cond.1"
for.end.1:
  %"ctx.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.2", i32 0, i32 0
  %"array_gep.4" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr", i32 0, i32 0
  %"array_load.4" = load i64, i64* %"array_gep.4"
  store i64 %"array_load.4", i64* %"a"
  %"ctx.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.4" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.4", i32 0, i32 0
  %"array_gep.5" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.1", i32 0, i32 1
  %"array_load.5" = load i64, i64* %"array_gep.5"
  store i64 %"array_load.5", i64* %"b"
  %"ctx.5" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.6" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.2" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.6", i32 0, i32 0
  %"array_gep.6" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.2", i32 0, i32 2
  %"array_load.6" = load i64, i64* %"array_gep.6"
  store i64 %"array_load.6", i64* %"c"
  %"ctx.7" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.8" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.3" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.8", i32 0, i32 0
  %"array_gep.7" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.3", i32 0, i32 3
  %"array_load.7" = load i64, i64* %"array_gep.7"
  store i64 %"array_load.7", i64* %"d"
  %"ctx.9" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.10" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.4" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.10", i32 0, i32 0
  %"array_gep.8" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.4", i32 0, i32 4
  %"array_load.8" = load i64, i64* %"array_gep.8"
  store i64 %"array_load.8", i64* %"e"
  %"ctx.11" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.12" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.5" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.12", i32 0, i32 0
  %"array_gep.9" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.5", i32 0, i32 5
  %"array_load.9" = load i64, i64* %"array_gep.9"
  store i64 %"array_load.9", i64* %"f"
  %"ctx.13" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.14" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.6" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.14", i32 0, i32 0
  %"array_gep.10" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.6", i32 0, i32 6
  %"array_load.10" = load i64, i64* %"array_gep.10"
  store i64 %"array_load.10", i64* %"g"
  %"ctx.15" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.16" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.7" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.16", i32 0, i32 0
  %"array_gep.11" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.7", i32 0, i32 7
  %"array_load.11" = load i64, i64* %"array_gep.11"
  store i64 %"array_load.11", i64* %"h"
  store i32 0, i32* %"i"
  br label %"for.cond.2"
for.cond.2:
  %"i.19" = load i32, i32* %"i"
  %".117" = icmp ult i32 %"i.19", 80
  br i1 %".117", label %"for.body.2", label %"for.end.2"
for.body.2:
  %"h.1" = load i64, i64* %"h"
  %"e.1" = load i64, i64* %"e"
  %".119" = call i64 @"standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"e.1")
  %".120" = add i64 %"h.1", %".119"
  %"e.2" = load i64, i64* %"e"
  %"f.1" = load i64, i64* %"f"
  %"g.1" = load i64, i64* %"g"
  %".121" = call i64 @"standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"e.2", i64 %"f.1", i64 %"g.1")
  %".122" = add i64 %".120", %".121"
  %"i.20" = load i32, i32* %"i"
  %"array_gep.12" = getelementptr inbounds [80 x i64], [80 x i64]* @"standard__crypto__hashing__SHA384__K384", i32 0, i32 %"i.20"
  %"array_load.12" = load i64, i64* %"array_gep.12"
  %".123" = add i64 %".122", %"array_load.12"
  %"i.21" = load i32, i32* %"i"
  %"array_gep.13" = getelementptr inbounds [80 x i64], [80 x i64]* %"W", i32 0, i32 %"i.21"
  %"array_load.13" = load i64, i64* %"array_gep.13"
  %".124" = add i64 %".123", %"array_load.13"
  store i64 %".124", i64* %"t1"
  %"a.1" = load i64, i64* %"a"
  %".126" = call i64 @"standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"a.1")
  %"a.2" = load i64, i64* %"a"
  %"b.1" = load i64, i64* %"b"
  %"c.1" = load i64, i64* %"c"
  %".127" = call i64 @"standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64"(i64 %"a.2", i64 %"b.1", i64 %"c.1")
  %".128" = add i64 %".126", %".127"
  store i64 %".128", i64* %"t2"
  %"g.2" = load i64, i64* %"g"
  store i64 %"g.2", i64* %"h"
  %"f.2" = load i64, i64* %"f"
  store i64 %"f.2", i64* %"g"
  %"e.3" = load i64, i64* %"e"
  store i64 %"e.3", i64* %"f"
  %"d.1" = load i64, i64* %"d"
  %"t1.1" = load i64, i64* %"t1"
  %".133" = add i64 %"d.1", %"t1.1"
  store i64 %".133", i64* %"e"
  %"c.2" = load i64, i64* %"c"
  store i64 %"c.2", i64* %"d"
  %"b.2" = load i64, i64* %"b"
  store i64 %"b.2", i64* %"c"
  %"a.3" = load i64, i64* %"a"
  store i64 %"a.3", i64* %"b"
  %"t1.2" = load i64, i64* %"t1"
  %"t2.1" = load i64, i64* %"t2"
  %".138" = add i64 %"t1.2", %"t2.1"
  store i64 %".138", i64* %"a"
  br label %"for.update.2"
for.update.2:
  %"i.22" = load i32, i32* %"i"
  %".141" = add i32 %"i.22", 1
  store i32 %".141", i32* %"i"
  br label %"for.cond.2"
for.end.2:
  %"ctx.17" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.18" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.8" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.18", i32 0, i32 0
  %"array_gep.14" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.8", i32 0, i32 0
  %"array_load.14" = load i64, i64* %"array_gep.14"
  %"a.4" = load i64, i64* %"a"
  %".144" = add i64 %"array_load.14", %"a.4"
  %"struct_ptr" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".145" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr", i32 0, i32 0
  %".146" = getelementptr inbounds [8 x i64], [8 x i64]* %".145", i32 0, i32 0
  store i64 %".144", i64* %".146"
  %"ctx.19" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.20" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.9" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.20", i32 0, i32 0
  %"array_gep.15" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.9", i32 0, i32 1
  %"array_load.15" = load i64, i64* %"array_gep.15"
  %"b.3" = load i64, i64* %"b"
  %".148" = add i64 %"array_load.15", %"b.3"
  %"struct_ptr.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".149" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.1", i32 0, i32 0
  %".150" = getelementptr inbounds [8 x i64], [8 x i64]* %".149", i32 0, i32 1
  store i64 %".148", i64* %".150"
  %"ctx.21" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.22" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.10" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.22", i32 0, i32 0
  %"array_gep.16" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.10", i32 0, i32 2
  %"array_load.16" = load i64, i64* %"array_gep.16"
  %"c.3" = load i64, i64* %"c"
  %".152" = add i64 %"array_load.16", %"c.3"
  %"struct_ptr.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".153" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.2", i32 0, i32 0
  %".154" = getelementptr inbounds [8 x i64], [8 x i64]* %".153", i32 0, i32 2
  store i64 %".152", i64* %".154"
  %"ctx.23" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.24" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.11" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.24", i32 0, i32 0
  %"array_gep.17" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.11", i32 0, i32 3
  %"array_load.17" = load i64, i64* %"array_gep.17"
  %"d.2" = load i64, i64* %"d"
  %".156" = add i64 %"array_load.17", %"d.2"
  %"struct_ptr.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".157" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.3", i32 0, i32 0
  %".158" = getelementptr inbounds [8 x i64], [8 x i64]* %".157", i32 0, i32 3
  store i64 %".156", i64* %".158"
  %"ctx.25" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.26" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.12" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.26", i32 0, i32 0
  %"array_gep.18" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.12", i32 0, i32 4
  %"array_load.18" = load i64, i64* %"array_gep.18"
  %"e.4" = load i64, i64* %"e"
  %".160" = add i64 %"array_load.18", %"e.4"
  %"struct_ptr.4" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".161" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.4", i32 0, i32 0
  %".162" = getelementptr inbounds [8 x i64], [8 x i64]* %".161", i32 0, i32 4
  store i64 %".160", i64* %".162"
  %"ctx.27" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.28" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.13" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.28", i32 0, i32 0
  %"array_gep.19" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.13", i32 0, i32 5
  %"array_load.19" = load i64, i64* %"array_gep.19"
  %"f.3" = load i64, i64* %"f"
  %".164" = add i64 %"array_load.19", %"f.3"
  %"struct_ptr.5" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".165" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.5", i32 0, i32 0
  %".166" = getelementptr inbounds [8 x i64], [8 x i64]* %".165", i32 0, i32 5
  store i64 %".164", i64* %".166"
  %"ctx.29" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.30" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.14" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.30", i32 0, i32 0
  %"array_gep.20" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.14", i32 0, i32 6
  %"array_load.20" = load i64, i64* %"array_gep.20"
  %"g.3" = load i64, i64* %"g"
  %".168" = add i64 %"array_load.20", %"g.3"
  %"struct_ptr.6" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".169" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.6", i32 0, i32 0
  %".170" = getelementptr inbounds [8 x i64], [8 x i64]* %".169", i32 0, i32 6
  store i64 %".168", i64* %".170"
  %"ctx.31" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.32" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.15" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.32", i32 0, i32 0
  %"array_gep.21" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.15", i32 0, i32 7
  %"array_load.21" = load i64, i64* %"array_gep.21"
  %"h.2" = load i64, i64* %"h"
  %".172" = add i64 %"array_load.21", %"h.2"
  %"struct_ptr.7" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".173" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.7", i32 0, i32 0
  %".174" = getelementptr inbounds [8 x i64], [8 x i64]* %".173", i32 0, i32 7
  store i64 %".172", i64* %".174"
  ret void
}

define void @"standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", i8* %"datax", i64 %"len")
{
entry:
  %"ctx.addr" = alloca %"standard__crypto__hashing__SHA384__SHA384_CTX"*
  store %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"datax.addr" = alloca i8*
  store i8* %"datax", i8** %"datax.addr"
  %"len.addr" = alloca i64
  store i64 %"len", i64* %"len.addr"
  %"i" = alloca i64
  store i64 0, i64* %"i"
  %".9" = sext i32 0 to i64
  store i64 %".9", i64* %"i"
  br label %"for.cond"
for.cond:
  %"i.1" = load i64, i64* %"i"
  %"len.1" = load i64, i64* %"len.addr"
  %".12" = icmp ult i64 %"i.1", %"len.1"
  br i1 %".12", label %"for.body", label %"for.end"
for.body:
  %"datax.1" = load i8*, i8** %"datax.addr"
  %"i.2" = load i64, i64* %"i"
  %"idx_trunc" = trunc i64 %"i.2" to i32
  %"ptr_gep" = getelementptr inbounds i8, i8* %"datax.1", i32 %"idx_trunc"
  %"ptr_load" = load i8, i8* %"ptr_gep"
  %"struct_ptr" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".14" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr", i32 0, i32 1
  %"ctx.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.2", i32 0, i32 4
  %"buflen" = load i32, i32* %"buflen_ptr"
  %".15" = getelementptr inbounds [128 x i8], [128 x i8]* %".14", i32 0, i32 %"buflen"
  store i8 %"ptr_load", i8* %".15"
  %"ctx.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.4" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.4", i32 0, i32 4
  %"buflen.1" = load i32, i32* %"buflen_ptr.1"
  %".17" = add i32 %"buflen.1", 1
  %"ctx_ptr" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".18" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr", i32 0, i32 4
  store i32 %".17", i32* %".18"
  %"ctx.5" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.6" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr.2" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.6", i32 0, i32 4
  %"buflen.2" = load i32, i32* %"buflen_ptr.2"
  %".20" = icmp eq i32 %"buflen.2", 128
  br i1 %".20", label %"then", label %"else"
for.update:
  %"i.3" = load i64, i64* %"i"
  %".41" = add i64 %"i.3", 1
  store i64 %".41", i64* %"i"
  br label %"for.cond"
for.end:
  ret void
then:
  %"obj_this" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.7" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.8" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.9" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buffer_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.9", i32 0, i32 1
  %"arg1_decay" = getelementptr [128 x i8], [128 x i8]* %"buffer_ptr", i32 0, i32 0
  call void @"standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.7", i8* %"arg1_decay")
  %"ctx.10" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.11" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_lo_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.11", i32 0, i32 2
  %"bitlen_lo" = load i64, i64* %"bitlen_lo_ptr"
  %".23" = zext i32 1024 to i64
  %".24" = add i64 %"bitlen_lo", %".23"
  %"ctx_ptr.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".25" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.1", i32 0, i32 2
  store i64 %".24", i64* %".25"
  %"ctx.12" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.13" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_lo_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.13", i32 0, i32 2
  %"bitlen_lo.1" = load i64, i64* %"bitlen_lo_ptr.1"
  %".27" = zext i32 0 to i64
  %".28" = icmp eq i64 %"bitlen_lo.1", %".27"
  br i1 %".28", label %"then.1", label %"else.1"
else:
  br label %"ifcont"
ifcont:
  br label %"for.update"
then.1:
  %"ctx.14" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.15" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_hi_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.15", i32 0, i32 3
  %"bitlen_hi" = load i64, i64* %"bitlen_hi_ptr"
  %".30" = zext i32 1 to i64
  %".31" = add i64 %"bitlen_hi", %".30"
  %"ctx_ptr.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".32" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.2", i32 0, i32 3
  store i64 %".31", i64* %".32"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"ctx_ptr.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".36" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx_ptr.3", i32 0, i32 4
  store i32 0, i32* %".36"
  br label %"ifcont"
}

define void @"standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", i8* %"hash")
{
entry:
  %"ctx.addr" = alloca %"standard__crypto__hashing__SHA384__SHA384_CTX"*
  store %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx", %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"hash.addr" = alloca i8*
  store i8* %"hash", i8** %"hash.addr"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"total_bits_lo" = alloca i64
  store i64 0, i64* %"total_bits_lo"
  %"total_bits_hi" = alloca i64
  store i64 0, i64* %"total_bits_hi"
  %"ctx.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.2", i32 0, i32 4
  %"buflen" = load i32, i32* %"buflen_ptr"
  store i32 %"buflen", i32* %"i"
  %".10" = trunc i32 128 to i8
  %"struct_ptr" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".11" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr", i32 0, i32 1
  %"i.1" = load i32, i32* %"i"
  %".12" = getelementptr inbounds [128 x i8], [128 x i8]* %".11", i32 0, i32 %"i.1"
  store i8 %".10", i8* %".12"
  %"i.2" = load i32, i32* %"i"
  %".14" = add i32 %"i.2", 1
  store i32 %".14", i32* %"i"
  %"ctx.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.4" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.4", i32 0, i32 4
  %"buflen.1" = load i32, i32* %"buflen_ptr.1"
  %".16" = icmp ult i32 %"buflen.1", 112
  br i1 %".16", label %"then", label %"else"
then:
  br label %"while.cond"
else:
  br label %"while.cond.1"
ifcont:
  %"ctx.8" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.9" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_lo_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.9", i32 0, i32 2
  %"bitlen_lo" = load i64, i64* %"bitlen_lo_ptr"
  %"ctx.10" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.11" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buflen_ptr.2" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.11", i32 0, i32 4
  %"buflen.2" = load i32, i32* %"buflen_ptr.2"
  %".53" = zext i32 %"buflen.2" to i64
  %".54" = zext i32 8 to i64
  %".55" = mul i64 %".53", %".54"
  %".56" = add i64 %"bitlen_lo", %".55"
  store i64 %".56", i64* %"total_bits_lo"
  %"ctx.12" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.13" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_hi_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.13", i32 0, i32 3
  %"bitlen_hi" = load i64, i64* %"bitlen_hi_ptr"
  store i64 %"bitlen_hi", i64* %"total_bits_hi"
  %"total_bits_lo.1" = load i64, i64* %"total_bits_lo"
  %"ctx.14" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.15" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"bitlen_lo_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.15", i32 0, i32 2
  %"bitlen_lo.1" = load i64, i64* %"bitlen_lo_ptr.1"
  %".59" = icmp ult i64 %"total_bits_lo.1", %"bitlen_lo.1"
  br i1 %".59", label %"then.1", label %"else.1"
while.cond:
  %"i.3" = load i32, i32* %"i"
  %".19" = icmp ult i32 %"i.3", 112
  br i1 %".19", label %"while.body", label %"while.end"
while.body:
  %".21" = trunc i32 0 to i8
  %"struct_ptr.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".22" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.1", i32 0, i32 1
  %"i.4" = load i32, i32* %"i"
  %".23" = getelementptr inbounds [128 x i8], [128 x i8]* %".22", i32 0, i32 %"i.4"
  store i8 %".21", i8* %".23"
  %"i.5" = load i32, i32* %"i"
  %".25" = add i32 %"i.5", 1
  store i32 %".25", i32* %"i"
  br label %"while.cond"
while.end:
  br label %"ifcont"
while.cond.1:
  %"i.6" = load i32, i32* %"i"
  %".30" = icmp ult i32 %"i.6", 128
  br i1 %".30", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".32" = trunc i32 0 to i8
  %"struct_ptr.2" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".33" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.2", i32 0, i32 1
  %"i.7" = load i32, i32* %"i"
  %".34" = getelementptr inbounds [128 x i8], [128 x i8]* %".33", i32 0, i32 %"i.7"
  store i8 %".32", i8* %".34"
  %"i.8" = load i32, i32* %"i"
  %".36" = add i32 %"i.8", 1
  store i32 %".36", i32* %"i"
  br label %"while.cond.1"
while.end.1:
  %"obj_this" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.5" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.6" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.7" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buffer_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.7", i32 0, i32 1
  %"arg1_decay" = getelementptr [128 x i8], [128 x i8]* %"buffer_ptr", i32 0, i32 0
  call void @"standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.5", i8* %"arg1_decay")
  store i32 0, i32* %"i"
  br label %"for.cond"
for.cond:
  %"i.9" = load i32, i32* %"i"
  %".42" = icmp ult i32 %"i.9", 112
  br i1 %".42", label %"for.body", label %"for.end"
for.body:
  %".44" = trunc i32 0 to i8
  %"struct_ptr.3" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %".45" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"struct_ptr.3", i32 0, i32 1
  %"i.10" = load i32, i32* %"i"
  %".46" = getelementptr inbounds [128 x i8], [128 x i8]* %".45", i32 0, i32 %"i.10"
  store i8 %".44", i8* %".46"
  br label %"for.update"
for.update:
  %"i.11" = load i32, i32* %"i"
  %".49" = add i32 %"i.11", 1
  store i32 %".49", i32* %"i"
  br label %"for.cond"
for.end:
  br label %"ifcont"
then.1:
  %"total_bits_hi.1" = load i64, i64* %"total_bits_hi"
  %"total_bits_hi.2" = load i64, i64* %"total_bits_hi"
  %".61" = zext i32 1 to i64
  %".62" = add i64 %"total_bits_hi.2", %".61"
  store i64 %".62", i64* %"total_bits_hi"
  br label %"ifcont.1"
else.1:
  br label %"ifcont.1"
ifcont.1:
  %"ctx.16" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.17" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buffer_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.17", i32 0, i32 1
  %"total_bits_hi.3" = load i64, i64* %"total_bits_hi"
  %"scalar_to_bytes" = alloca [9 x i8]
  %"scalar_shift_0" = lshr i64 %"total_bits_hi.3", 56
  %"scalar_byte_0" = trunc i64 %"scalar_shift_0" to i8
  %"scalar_dst_0" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 0
  store i8 %"scalar_byte_0", i8* %"scalar_dst_0"
  %"scalar_shift_1" = lshr i64 %"total_bits_hi.3", 48
  %"scalar_byte_1" = trunc i64 %"scalar_shift_1" to i8
  %"scalar_dst_1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 1
  store i8 %"scalar_byte_1", i8* %"scalar_dst_1"
  %"scalar_shift_2" = lshr i64 %"total_bits_hi.3", 40
  %"scalar_byte_2" = trunc i64 %"scalar_shift_2" to i8
  %"scalar_dst_2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 2
  store i8 %"scalar_byte_2", i8* %"scalar_dst_2"
  %"scalar_shift_3" = lshr i64 %"total_bits_hi.3", 32
  %"scalar_byte_3" = trunc i64 %"scalar_shift_3" to i8
  %"scalar_dst_3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 3
  store i8 %"scalar_byte_3", i8* %"scalar_dst_3"
  %"scalar_shift_4" = lshr i64 %"total_bits_hi.3", 24
  %"scalar_byte_4" = trunc i64 %"scalar_shift_4" to i8
  %"scalar_dst_4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 4
  store i8 %"scalar_byte_4", i8* %"scalar_dst_4"
  %"scalar_shift_5" = lshr i64 %"total_bits_hi.3", 16
  %"scalar_byte_5" = trunc i64 %"scalar_shift_5" to i8
  %"scalar_dst_5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 5
  store i8 %"scalar_byte_5", i8* %"scalar_dst_5"
  %"scalar_shift_6" = lshr i64 %"total_bits_hi.3", 8
  %"scalar_byte_6" = trunc i64 %"scalar_shift_6" to i8
  %"scalar_dst_6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 6
  store i8 %"scalar_byte_6", i8* %"scalar_dst_6"
  %"scalar_byte_7" = trunc i64 %"total_bits_hi.3" to i8
  %"scalar_dst_7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 7
  store i8 %"scalar_byte_7", i8* %"scalar_dst_7"
  %"scalar_null_term" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term"
  %"rav.k" = alloca i32
  store i32 0, i32* %"rav.k"
  %"rav.span" = sub i32 119, 112
  br label %"rav.cond"
rav.cond:
  %"rav.kv" = load i32, i32* %"rav.k"
  %"rav.cmp" = icmp sle i32 %"rav.kv", %"rav.span"
  br i1 %"rav.cmp", label %"rav.body", label %"rav.end"
rav.body:
  %"rav.kb" = load i32, i32* %"rav.k"
  %"rav.src" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes", i32 0, i32 %"rav.kb"
  %"rav.val" = load i8, i8* %"rav.src"
  %"rav.dstidx" = add i32 112, %"rav.kb"
  %"rav.dst" = getelementptr inbounds [128 x i8], [128 x i8]* %"buffer_ptr.1", i32 0, i32 %"rav.dstidx"
  store i8 %"rav.val", i8* %"rav.dst"
  %"rav.next" = add i32 %"rav.kb", 1
  store i32 %"rav.next", i32* %"rav.k"
  br label %"rav.cond"
rav.end:
  %"ctx.18" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.19" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buffer_ptr.2" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.19", i32 0, i32 1
  %"total_bits_lo.2" = load i64, i64* %"total_bits_lo"
  %"scalar_to_bytes.1" = alloca [9 x i8]
  %"scalar_shift_0.1" = lshr i64 %"total_bits_lo.2", 56
  %"scalar_byte_0.1" = trunc i64 %"scalar_shift_0.1" to i8
  %"scalar_dst_0.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 0
  store i8 %"scalar_byte_0.1", i8* %"scalar_dst_0.1"
  %"scalar_shift_1.1" = lshr i64 %"total_bits_lo.2", 48
  %"scalar_byte_1.1" = trunc i64 %"scalar_shift_1.1" to i8
  %"scalar_dst_1.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 1
  store i8 %"scalar_byte_1.1", i8* %"scalar_dst_1.1"
  %"scalar_shift_2.1" = lshr i64 %"total_bits_lo.2", 40
  %"scalar_byte_2.1" = trunc i64 %"scalar_shift_2.1" to i8
  %"scalar_dst_2.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 2
  store i8 %"scalar_byte_2.1", i8* %"scalar_dst_2.1"
  %"scalar_shift_3.1" = lshr i64 %"total_bits_lo.2", 32
  %"scalar_byte_3.1" = trunc i64 %"scalar_shift_3.1" to i8
  %"scalar_dst_3.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 3
  store i8 %"scalar_byte_3.1", i8* %"scalar_dst_3.1"
  %"scalar_shift_4.1" = lshr i64 %"total_bits_lo.2", 24
  %"scalar_byte_4.1" = trunc i64 %"scalar_shift_4.1" to i8
  %"scalar_dst_4.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 4
  store i8 %"scalar_byte_4.1", i8* %"scalar_dst_4.1"
  %"scalar_shift_5.1" = lshr i64 %"total_bits_lo.2", 16
  %"scalar_byte_5.1" = trunc i64 %"scalar_shift_5.1" to i8
  %"scalar_dst_5.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 5
  store i8 %"scalar_byte_5.1", i8* %"scalar_dst_5.1"
  %"scalar_shift_6.1" = lshr i64 %"total_bits_lo.2", 8
  %"scalar_byte_6.1" = trunc i64 %"scalar_shift_6.1" to i8
  %"scalar_dst_6.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 6
  store i8 %"scalar_byte_6.1", i8* %"scalar_dst_6.1"
  %"scalar_byte_7.1" = trunc i64 %"total_bits_lo.2" to i8
  %"scalar_dst_7.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 7
  store i8 %"scalar_byte_7.1", i8* %"scalar_dst_7.1"
  %"scalar_null_term.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.1"
  %"rav.k.1" = alloca i32
  store i32 0, i32* %"rav.k.1"
  %"rav.span.1" = sub i32 127, 120
  br label %"rav.cond.1"
rav.cond.1:
  %"rav.kv.1" = load i32, i32* %"rav.k.1"
  %"rav.cmp.1" = icmp sle i32 %"rav.kv.1", %"rav.span.1"
  br i1 %"rav.cmp.1", label %"rav.body.1", label %"rav.end.1"
rav.body.1:
  %"rav.kb.1" = load i32, i32* %"rav.k.1"
  %"rav.src.1" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.1", i32 0, i32 %"rav.kb.1"
  %"rav.val.1" = load i8, i8* %"rav.src.1"
  %"rav.dstidx.1" = add i32 120, %"rav.kb.1"
  %"rav.dst.1" = getelementptr inbounds [128 x i8], [128 x i8]* %"buffer_ptr.2", i32 0, i32 %"rav.dstidx.1"
  store i8 %"rav.val.1", i8* %"rav.dst.1"
  %"rav.next.1" = add i32 %"rav.kb.1", 1
  store i32 %"rav.next.1", i32* %"rav.k.1"
  br label %"rav.cond.1"
rav.end.1:
  %"obj_this.1" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.20" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.21" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.22" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"buffer_ptr.3" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.22", i32 0, i32 1
  %"arg1_decay.1" = getelementptr [128 x i8], [128 x i8]* %"buffer_ptr.3", i32 0, i32 0
  call void @"standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1"(%"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.20", i8* %"arg1_decay.1")
  %"hash.1" = load i8*, i8** %"hash.addr"
  %"ctx.23" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.24" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.24", i32 0, i32 0
  %"array_gep" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr", i32 0, i32 0
  %"array_load" = load i64, i64* %"array_gep"
  %"scalar_to_bytes.2" = alloca [9 x i8]
  %"scalar_shift_0.2" = lshr i64 %"array_load", 56
  %"scalar_byte_0.2" = trunc i64 %"scalar_shift_0.2" to i8
  %"scalar_dst_0.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 0
  store i8 %"scalar_byte_0.2", i8* %"scalar_dst_0.2"
  %"scalar_shift_1.2" = lshr i64 %"array_load", 48
  %"scalar_byte_1.2" = trunc i64 %"scalar_shift_1.2" to i8
  %"scalar_dst_1.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 1
  store i8 %"scalar_byte_1.2", i8* %"scalar_dst_1.2"
  %"scalar_shift_2.2" = lshr i64 %"array_load", 40
  %"scalar_byte_2.2" = trunc i64 %"scalar_shift_2.2" to i8
  %"scalar_dst_2.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 2
  store i8 %"scalar_byte_2.2", i8* %"scalar_dst_2.2"
  %"scalar_shift_3.2" = lshr i64 %"array_load", 32
  %"scalar_byte_3.2" = trunc i64 %"scalar_shift_3.2" to i8
  %"scalar_dst_3.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 3
  store i8 %"scalar_byte_3.2", i8* %"scalar_dst_3.2"
  %"scalar_shift_4.2" = lshr i64 %"array_load", 24
  %"scalar_byte_4.2" = trunc i64 %"scalar_shift_4.2" to i8
  %"scalar_dst_4.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 4
  store i8 %"scalar_byte_4.2", i8* %"scalar_dst_4.2"
  %"scalar_shift_5.2" = lshr i64 %"array_load", 16
  %"scalar_byte_5.2" = trunc i64 %"scalar_shift_5.2" to i8
  %"scalar_dst_5.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 5
  store i8 %"scalar_byte_5.2", i8* %"scalar_dst_5.2"
  %"scalar_shift_6.2" = lshr i64 %"array_load", 8
  %"scalar_byte_6.2" = trunc i64 %"scalar_shift_6.2" to i8
  %"scalar_dst_6.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 6
  store i8 %"scalar_byte_6.2", i8* %"scalar_dst_6.2"
  %"scalar_byte_7.2" = trunc i64 %"array_load" to i8
  %"scalar_dst_7.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 7
  store i8 %"scalar_byte_7.2", i8* %"scalar_dst_7.2"
  %"scalar_null_term.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.2"
  %"rav.k.2" = alloca i32
  store i32 0, i32* %"rav.k.2"
  %"rav.span.2" = sub i32 7, 0
  br label %"rav.cond.2"
rav.cond.2:
  %"rav.kv.2" = load i32, i32* %"rav.k.2"
  %"rav.cmp.2" = icmp sle i32 %"rav.kv.2", %"rav.span.2"
  br i1 %"rav.cmp.2", label %"rav.body.2", label %"rav.end.2"
rav.body.2:
  %"rav.kb.2" = load i32, i32* %"rav.k.2"
  %"rav.src.2" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.2", i32 0, i32 %"rav.kb.2"
  %"rav.val.2" = load i8, i8* %"rav.src.2"
  %"rav.dstidx.2" = add i32 0, %"rav.kb.2"
  %"rav.dst.2" = getelementptr inbounds i8, i8* %"hash.1", i32 %"rav.dstidx.2"
  store i8 %"rav.val.2", i8* %"rav.dst.2"
  %"rav.next.2" = add i32 %"rav.kb.2", 1
  store i32 %"rav.next.2", i32* %"rav.k.2"
  br label %"rav.cond.2"
rav.end.2:
  %"hash.2" = load i8*, i8** %"hash.addr"
  %"ctx.25" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.26" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.1" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.26", i32 0, i32 0
  %"array_gep.1" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.1", i32 0, i32 1
  %"array_load.1" = load i64, i64* %"array_gep.1"
  %"scalar_to_bytes.3" = alloca [9 x i8]
  %"scalar_shift_0.3" = lshr i64 %"array_load.1", 56
  %"scalar_byte_0.3" = trunc i64 %"scalar_shift_0.3" to i8
  %"scalar_dst_0.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 0
  store i8 %"scalar_byte_0.3", i8* %"scalar_dst_0.3"
  %"scalar_shift_1.3" = lshr i64 %"array_load.1", 48
  %"scalar_byte_1.3" = trunc i64 %"scalar_shift_1.3" to i8
  %"scalar_dst_1.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 1
  store i8 %"scalar_byte_1.3", i8* %"scalar_dst_1.3"
  %"scalar_shift_2.3" = lshr i64 %"array_load.1", 40
  %"scalar_byte_2.3" = trunc i64 %"scalar_shift_2.3" to i8
  %"scalar_dst_2.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 2
  store i8 %"scalar_byte_2.3", i8* %"scalar_dst_2.3"
  %"scalar_shift_3.3" = lshr i64 %"array_load.1", 32
  %"scalar_byte_3.3" = trunc i64 %"scalar_shift_3.3" to i8
  %"scalar_dst_3.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 3
  store i8 %"scalar_byte_3.3", i8* %"scalar_dst_3.3"
  %"scalar_shift_4.3" = lshr i64 %"array_load.1", 24
  %"scalar_byte_4.3" = trunc i64 %"scalar_shift_4.3" to i8
  %"scalar_dst_4.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 4
  store i8 %"scalar_byte_4.3", i8* %"scalar_dst_4.3"
  %"scalar_shift_5.3" = lshr i64 %"array_load.1", 16
  %"scalar_byte_5.3" = trunc i64 %"scalar_shift_5.3" to i8
  %"scalar_dst_5.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 5
  store i8 %"scalar_byte_5.3", i8* %"scalar_dst_5.3"
  %"scalar_shift_6.3" = lshr i64 %"array_load.1", 8
  %"scalar_byte_6.3" = trunc i64 %"scalar_shift_6.3" to i8
  %"scalar_dst_6.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 6
  store i8 %"scalar_byte_6.3", i8* %"scalar_dst_6.3"
  %"scalar_byte_7.3" = trunc i64 %"array_load.1" to i8
  %"scalar_dst_7.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 7
  store i8 %"scalar_byte_7.3", i8* %"scalar_dst_7.3"
  %"scalar_null_term.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.3"
  %"rav.k.3" = alloca i32
  store i32 0, i32* %"rav.k.3"
  %"rav.span.3" = sub i32 15, 8
  br label %"rav.cond.3"
rav.cond.3:
  %"rav.kv.3" = load i32, i32* %"rav.k.3"
  %"rav.cmp.3" = icmp sle i32 %"rav.kv.3", %"rav.span.3"
  br i1 %"rav.cmp.3", label %"rav.body.3", label %"rav.end.3"
rav.body.3:
  %"rav.kb.3" = load i32, i32* %"rav.k.3"
  %"rav.src.3" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.3", i32 0, i32 %"rav.kb.3"
  %"rav.val.3" = load i8, i8* %"rav.src.3"
  %"rav.dstidx.3" = add i32 8, %"rav.kb.3"
  %"rav.dst.3" = getelementptr inbounds i8, i8* %"hash.2", i32 %"rav.dstidx.3"
  store i8 %"rav.val.3", i8* %"rav.dst.3"
  %"rav.next.3" = add i32 %"rav.kb.3", 1
  store i32 %"rav.next.3", i32* %"rav.k.3"
  br label %"rav.cond.3"
rav.end.3:
  %"hash.3" = load i8*, i8** %"hash.addr"
  %"ctx.27" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.28" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.2" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.28", i32 0, i32 0
  %"array_gep.2" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.2", i32 0, i32 2
  %"array_load.2" = load i64, i64* %"array_gep.2"
  %"scalar_to_bytes.4" = alloca [9 x i8]
  %"scalar_shift_0.4" = lshr i64 %"array_load.2", 56
  %"scalar_byte_0.4" = trunc i64 %"scalar_shift_0.4" to i8
  %"scalar_dst_0.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 0
  store i8 %"scalar_byte_0.4", i8* %"scalar_dst_0.4"
  %"scalar_shift_1.4" = lshr i64 %"array_load.2", 48
  %"scalar_byte_1.4" = trunc i64 %"scalar_shift_1.4" to i8
  %"scalar_dst_1.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 1
  store i8 %"scalar_byte_1.4", i8* %"scalar_dst_1.4"
  %"scalar_shift_2.4" = lshr i64 %"array_load.2", 40
  %"scalar_byte_2.4" = trunc i64 %"scalar_shift_2.4" to i8
  %"scalar_dst_2.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 2
  store i8 %"scalar_byte_2.4", i8* %"scalar_dst_2.4"
  %"scalar_shift_3.4" = lshr i64 %"array_load.2", 32
  %"scalar_byte_3.4" = trunc i64 %"scalar_shift_3.4" to i8
  %"scalar_dst_3.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 3
  store i8 %"scalar_byte_3.4", i8* %"scalar_dst_3.4"
  %"scalar_shift_4.4" = lshr i64 %"array_load.2", 24
  %"scalar_byte_4.4" = trunc i64 %"scalar_shift_4.4" to i8
  %"scalar_dst_4.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 4
  store i8 %"scalar_byte_4.4", i8* %"scalar_dst_4.4"
  %"scalar_shift_5.4" = lshr i64 %"array_load.2", 16
  %"scalar_byte_5.4" = trunc i64 %"scalar_shift_5.4" to i8
  %"scalar_dst_5.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 5
  store i8 %"scalar_byte_5.4", i8* %"scalar_dst_5.4"
  %"scalar_shift_6.4" = lshr i64 %"array_load.2", 8
  %"scalar_byte_6.4" = trunc i64 %"scalar_shift_6.4" to i8
  %"scalar_dst_6.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 6
  store i8 %"scalar_byte_6.4", i8* %"scalar_dst_6.4"
  %"scalar_byte_7.4" = trunc i64 %"array_load.2" to i8
  %"scalar_dst_7.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 7
  store i8 %"scalar_byte_7.4", i8* %"scalar_dst_7.4"
  %"scalar_null_term.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.4"
  %"rav.k.4" = alloca i32
  store i32 0, i32* %"rav.k.4"
  %"rav.span.4" = sub i32 23, 16
  br label %"rav.cond.4"
rav.cond.4:
  %"rav.kv.4" = load i32, i32* %"rav.k.4"
  %"rav.cmp.4" = icmp sle i32 %"rav.kv.4", %"rav.span.4"
  br i1 %"rav.cmp.4", label %"rav.body.4", label %"rav.end.4"
rav.body.4:
  %"rav.kb.4" = load i32, i32* %"rav.k.4"
  %"rav.src.4" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.4", i32 0, i32 %"rav.kb.4"
  %"rav.val.4" = load i8, i8* %"rav.src.4"
  %"rav.dstidx.4" = add i32 16, %"rav.kb.4"
  %"rav.dst.4" = getelementptr inbounds i8, i8* %"hash.3", i32 %"rav.dstidx.4"
  store i8 %"rav.val.4", i8* %"rav.dst.4"
  %"rav.next.4" = add i32 %"rav.kb.4", 1
  store i32 %"rav.next.4", i32* %"rav.k.4"
  br label %"rav.cond.4"
rav.end.4:
  %"hash.4" = load i8*, i8** %"hash.addr"
  %"ctx.29" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.30" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.3" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.30", i32 0, i32 0
  %"array_gep.3" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.3", i32 0, i32 3
  %"array_load.3" = load i64, i64* %"array_gep.3"
  %"scalar_to_bytes.5" = alloca [9 x i8]
  %"scalar_shift_0.5" = lshr i64 %"array_load.3", 56
  %"scalar_byte_0.5" = trunc i64 %"scalar_shift_0.5" to i8
  %"scalar_dst_0.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 0
  store i8 %"scalar_byte_0.5", i8* %"scalar_dst_0.5"
  %"scalar_shift_1.5" = lshr i64 %"array_load.3", 48
  %"scalar_byte_1.5" = trunc i64 %"scalar_shift_1.5" to i8
  %"scalar_dst_1.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 1
  store i8 %"scalar_byte_1.5", i8* %"scalar_dst_1.5"
  %"scalar_shift_2.5" = lshr i64 %"array_load.3", 40
  %"scalar_byte_2.5" = trunc i64 %"scalar_shift_2.5" to i8
  %"scalar_dst_2.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 2
  store i8 %"scalar_byte_2.5", i8* %"scalar_dst_2.5"
  %"scalar_shift_3.5" = lshr i64 %"array_load.3", 32
  %"scalar_byte_3.5" = trunc i64 %"scalar_shift_3.5" to i8
  %"scalar_dst_3.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 3
  store i8 %"scalar_byte_3.5", i8* %"scalar_dst_3.5"
  %"scalar_shift_4.5" = lshr i64 %"array_load.3", 24
  %"scalar_byte_4.5" = trunc i64 %"scalar_shift_4.5" to i8
  %"scalar_dst_4.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 4
  store i8 %"scalar_byte_4.5", i8* %"scalar_dst_4.5"
  %"scalar_shift_5.5" = lshr i64 %"array_load.3", 16
  %"scalar_byte_5.5" = trunc i64 %"scalar_shift_5.5" to i8
  %"scalar_dst_5.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 5
  store i8 %"scalar_byte_5.5", i8* %"scalar_dst_5.5"
  %"scalar_shift_6.5" = lshr i64 %"array_load.3", 8
  %"scalar_byte_6.5" = trunc i64 %"scalar_shift_6.5" to i8
  %"scalar_dst_6.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 6
  store i8 %"scalar_byte_6.5", i8* %"scalar_dst_6.5"
  %"scalar_byte_7.5" = trunc i64 %"array_load.3" to i8
  %"scalar_dst_7.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 7
  store i8 %"scalar_byte_7.5", i8* %"scalar_dst_7.5"
  %"scalar_null_term.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.5"
  %"rav.k.5" = alloca i32
  store i32 0, i32* %"rav.k.5"
  %"rav.span.5" = sub i32 31, 24
  br label %"rav.cond.5"
rav.cond.5:
  %"rav.kv.5" = load i32, i32* %"rav.k.5"
  %"rav.cmp.5" = icmp sle i32 %"rav.kv.5", %"rav.span.5"
  br i1 %"rav.cmp.5", label %"rav.body.5", label %"rav.end.5"
rav.body.5:
  %"rav.kb.5" = load i32, i32* %"rav.k.5"
  %"rav.src.5" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.5", i32 0, i32 %"rav.kb.5"
  %"rav.val.5" = load i8, i8* %"rav.src.5"
  %"rav.dstidx.5" = add i32 24, %"rav.kb.5"
  %"rav.dst.5" = getelementptr inbounds i8, i8* %"hash.4", i32 %"rav.dstidx.5"
  store i8 %"rav.val.5", i8* %"rav.dst.5"
  %"rav.next.5" = add i32 %"rav.kb.5", 1
  store i32 %"rav.next.5", i32* %"rav.k.5"
  br label %"rav.cond.5"
rav.end.5:
  %"hash.5" = load i8*, i8** %"hash.addr"
  %"ctx.31" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.32" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.4" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.32", i32 0, i32 0
  %"array_gep.4" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.4", i32 0, i32 4
  %"array_load.4" = load i64, i64* %"array_gep.4"
  %"scalar_to_bytes.6" = alloca [9 x i8]
  %"scalar_shift_0.6" = lshr i64 %"array_load.4", 56
  %"scalar_byte_0.6" = trunc i64 %"scalar_shift_0.6" to i8
  %"scalar_dst_0.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 0
  store i8 %"scalar_byte_0.6", i8* %"scalar_dst_0.6"
  %"scalar_shift_1.6" = lshr i64 %"array_load.4", 48
  %"scalar_byte_1.6" = trunc i64 %"scalar_shift_1.6" to i8
  %"scalar_dst_1.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 1
  store i8 %"scalar_byte_1.6", i8* %"scalar_dst_1.6"
  %"scalar_shift_2.6" = lshr i64 %"array_load.4", 40
  %"scalar_byte_2.6" = trunc i64 %"scalar_shift_2.6" to i8
  %"scalar_dst_2.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 2
  store i8 %"scalar_byte_2.6", i8* %"scalar_dst_2.6"
  %"scalar_shift_3.6" = lshr i64 %"array_load.4", 32
  %"scalar_byte_3.6" = trunc i64 %"scalar_shift_3.6" to i8
  %"scalar_dst_3.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 3
  store i8 %"scalar_byte_3.6", i8* %"scalar_dst_3.6"
  %"scalar_shift_4.6" = lshr i64 %"array_load.4", 24
  %"scalar_byte_4.6" = trunc i64 %"scalar_shift_4.6" to i8
  %"scalar_dst_4.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 4
  store i8 %"scalar_byte_4.6", i8* %"scalar_dst_4.6"
  %"scalar_shift_5.6" = lshr i64 %"array_load.4", 16
  %"scalar_byte_5.6" = trunc i64 %"scalar_shift_5.6" to i8
  %"scalar_dst_5.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 5
  store i8 %"scalar_byte_5.6", i8* %"scalar_dst_5.6"
  %"scalar_shift_6.6" = lshr i64 %"array_load.4", 8
  %"scalar_byte_6.6" = trunc i64 %"scalar_shift_6.6" to i8
  %"scalar_dst_6.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 6
  store i8 %"scalar_byte_6.6", i8* %"scalar_dst_6.6"
  %"scalar_byte_7.6" = trunc i64 %"array_load.4" to i8
  %"scalar_dst_7.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 7
  store i8 %"scalar_byte_7.6", i8* %"scalar_dst_7.6"
  %"scalar_null_term.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.6"
  %"rav.k.6" = alloca i32
  store i32 0, i32* %"rav.k.6"
  %"rav.span.6" = sub i32 39, 32
  br label %"rav.cond.6"
rav.cond.6:
  %"rav.kv.6" = load i32, i32* %"rav.k.6"
  %"rav.cmp.6" = icmp sle i32 %"rav.kv.6", %"rav.span.6"
  br i1 %"rav.cmp.6", label %"rav.body.6", label %"rav.end.6"
rav.body.6:
  %"rav.kb.6" = load i32, i32* %"rav.k.6"
  %"rav.src.6" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.6", i32 0, i32 %"rav.kb.6"
  %"rav.val.6" = load i8, i8* %"rav.src.6"
  %"rav.dstidx.6" = add i32 32, %"rav.kb.6"
  %"rav.dst.6" = getelementptr inbounds i8, i8* %"hash.5", i32 %"rav.dstidx.6"
  store i8 %"rav.val.6", i8* %"rav.dst.6"
  %"rav.next.6" = add i32 %"rav.kb.6", 1
  store i32 %"rav.next.6", i32* %"rav.k.6"
  br label %"rav.cond.6"
rav.end.6:
  %"hash.6" = load i8*, i8** %"hash.addr"
  %"ctx.33" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"ctx.34" = load %"standard__crypto__hashing__SHA384__SHA384_CTX"*, %"standard__crypto__hashing__SHA384__SHA384_CTX"** %"ctx.addr"
  %"state_ptr.5" = getelementptr inbounds %"standard__crypto__hashing__SHA384__SHA384_CTX", %"standard__crypto__hashing__SHA384__SHA384_CTX"* %"ctx.34", i32 0, i32 0
  %"array_gep.5" = getelementptr inbounds [8 x i64], [8 x i64]* %"state_ptr.5", i32 0, i32 5
  %"array_load.5" = load i64, i64* %"array_gep.5"
  %"scalar_to_bytes.7" = alloca [9 x i8]
  %"scalar_shift_0.7" = lshr i64 %"array_load.5", 56
  %"scalar_byte_0.7" = trunc i64 %"scalar_shift_0.7" to i8
  %"scalar_dst_0.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 0
  store i8 %"scalar_byte_0.7", i8* %"scalar_dst_0.7"
  %"scalar_shift_1.7" = lshr i64 %"array_load.5", 48
  %"scalar_byte_1.7" = trunc i64 %"scalar_shift_1.7" to i8
  %"scalar_dst_1.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 1
  store i8 %"scalar_byte_1.7", i8* %"scalar_dst_1.7"
  %"scalar_shift_2.7" = lshr i64 %"array_load.5", 40
  %"scalar_byte_2.7" = trunc i64 %"scalar_shift_2.7" to i8
  %"scalar_dst_2.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 2
  store i8 %"scalar_byte_2.7", i8* %"scalar_dst_2.7"
  %"scalar_shift_3.7" = lshr i64 %"array_load.5", 32
  %"scalar_byte_3.7" = trunc i64 %"scalar_shift_3.7" to i8
  %"scalar_dst_3.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 3
  store i8 %"scalar_byte_3.7", i8* %"scalar_dst_3.7"
  %"scalar_shift_4.7" = lshr i64 %"array_load.5", 24
  %"scalar_byte_4.7" = trunc i64 %"scalar_shift_4.7" to i8
  %"scalar_dst_4.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 4
  store i8 %"scalar_byte_4.7", i8* %"scalar_dst_4.7"
  %"scalar_shift_5.7" = lshr i64 %"array_load.5", 16
  %"scalar_byte_5.7" = trunc i64 %"scalar_shift_5.7" to i8
  %"scalar_dst_5.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 5
  store i8 %"scalar_byte_5.7", i8* %"scalar_dst_5.7"
  %"scalar_shift_6.7" = lshr i64 %"array_load.5", 8
  %"scalar_byte_6.7" = trunc i64 %"scalar_shift_6.7" to i8
  %"scalar_dst_6.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 6
  store i8 %"scalar_byte_6.7", i8* %"scalar_dst_6.7"
  %"scalar_byte_7.7" = trunc i64 %"array_load.5" to i8
  %"scalar_dst_7.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 7
  store i8 %"scalar_byte_7.7", i8* %"scalar_dst_7.7"
  %"scalar_null_term.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 8
  store i8 0, i8* %"scalar_null_term.7"
  %"rav.k.7" = alloca i32
  store i32 0, i32* %"rav.k.7"
  %"rav.span.7" = sub i32 47, 40
  br label %"rav.cond.7"
rav.cond.7:
  %"rav.kv.7" = load i32, i32* %"rav.k.7"
  %"rav.cmp.7" = icmp sle i32 %"rav.kv.7", %"rav.span.7"
  br i1 %"rav.cmp.7", label %"rav.body.7", label %"rav.end.7"
rav.body.7:
  %"rav.kb.7" = load i32, i32* %"rav.k.7"
  %"rav.src.7" = getelementptr inbounds [9 x i8], [9 x i8]* %"scalar_to_bytes.7", i32 0, i32 %"rav.kb.7"
  %"rav.val.7" = load i8, i8* %"rav.src.7"
  %"rav.dstidx.7" = add i32 40, %"rav.kb.7"
  %"rav.dst.7" = getelementptr inbounds i8, i8* %"hash.6", i32 %"rav.dstidx.7"
  store i8 %"rav.val.7", i8* %"rav.dst.7"
  %"rav.next.7" = add i32 %"rav.kb.7", 1
  store i32 %"rav.next.7", i32* %"rav.k.7"
  br label %"rav.cond.7"
rav.end.7:
  ret void
}
