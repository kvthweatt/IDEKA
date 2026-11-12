; ModuleID = 'build\plasma_pong\plasma_pong.ll'
source_filename = "build\\plasma_pong\\plasma_pong.ll"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%Exception = type { ptr, i32, %ExceptionState }
%ExceptionState = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%WorkSlice = type { i32, i32, i32, i32, ptr, ptr, double, double, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, double, double, double, double, ptr }
%Thread = type { [8 x i8], i32 }
%Semaphore = type { [32 x i8] }
%OpenGL__GLContext = type { i64, i64, i1 }
%FreeNode = type { ptr }
%BlockEntry = type { i64, i64, i64, i64 }
%Slab = type { i64, i64, i64, i64, ptr }
%standard__system__windows__MSG = type { i64, i32, i64, i64, i32, %standard__math__POINT }
%standard__math__POINT = type { i32, i32 }
%standard__system__windows__RECT = type { i32, i32, i32, i32 }
%SYSTEM_INFO_PARTIAL = type { i32, i32, ptr, ptr, i64, i32, i32, i32, i16, i16 }
%standard__system__windows__WNDCLASSEXA = type { i32, i32, ptr, i32, i32, i64, i64, i64, i64, ptr, ptr, i64 }
%standard__vectors__Vec3 = type { float, float, float }
%PIXELFORMATDESCRIPTOR = type { i16, i16, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32 }
%standard__system__windows__PAINTSTRUCT = type { i64, i32, %standard__system__windows__RECT, i32, i32, [32 x i8] }

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
@standard__math__POINT.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 64, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }] }
@standard__system__windows__WS_VISIBLE = internal global i32 268435456
@standard__system__windows__WS_OVERLAPPEDWINDOW = internal global i32 13565952
@standard__system__windows__WS_EX_APPWINDOW = internal global i32 262144
@standard__system__windows__CS_VREDRAW = internal global i32 1
@standard__system__windows__CS_HREDRAW = internal global i32 2
@standard__system__windows__CS_OWNDC = internal global i32 32
@standard__system__windows__SW_SHOW = internal global i32 5
@standard__system__windows__WM_DESTROY = internal global i32 2
@standard__system__windows__WM_PAINT = internal global i32 15
@standard__system__windows__WM_ERASEBKGND = internal global i32 20
@standard__system__windows__WM_CLOSE = internal global i32 16
@standard__system__windows__WM_QUIT = internal global i32 18
@standard__system__windows__WM_KEYDOWN = internal global i32 256
@standard__system__windows__WM_MOUSEMOVE = internal global i32 512
@standard__system__windows__WM_LBUTTONDOWN = internal global i32 513
@standard__system__windows__WM_LBUTTONUP = internal global i32 514
@standard__system__windows__WM_RBUTTONDOWN = internal global i32 516
@standard__system__windows__WM_RBUTTONUP = internal global i32 517
@standard__system__windows__PM_REMOVE = internal global i32 1
@standard__system__windows__BLACK_BRUSH = internal global i32 4
@standard__system__windows__MSG.TLD = internal constant { i32, i32, [6 x { i32, i32, i32 }] } { i32 384, i32 6, [6 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 32, i32 32 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }] }
@standard__system__windows__WNDCLASSEXA.TLD = internal constant { i32, i32, [12 x { i32, i32, i32 }] } { i32 640, i32 12, [12 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 64, i32 64 }, { i32, i32, i32 } { i32 128, i32 32, i32 32 }, { i32, i32, i32 } { i32 160, i32 32, i32 32 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 64, i32 64 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }] }
@standard__system__windows__RECT.TLD = internal constant { i32, i32, [4 x { i32, i32, i32 }] } { i32 128, i32 4, [4 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }, { i32, i32, i32 } { i32 96, i32 32, i32 32 }] }
@standard__system__windows__PAINTSTRUCT.TLD = internal constant { i32, i32, [6 x { i32, i32, i32 }] } { i32 576, i32 6, [6 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 64 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }, { i32, i32, i32 } { i32 128, i32 128, i32 64 }, { i32, i32, i32 } { i32 256, i32 32, i32 32 }, { i32, i32, i32 } { i32 288, i32 32, i32 32 }, { i32, i32, i32 } { i32 320, i32 256, i32 8 }] }
@standard__vectors__Vec3.TLD = internal constant { i32, i32, [3 x { i32, i32, i32 }] } { i32 96, i32 3, [3 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }] }
@OpenGL___glGenBuffers = internal global ptr null
@OpenGL___glDeleteBuffers = internal global ptr null
@OpenGL___glBindBuffer = internal global ptr null
@OpenGL___glBufferData = internal global ptr null
@OpenGL___glBufferSubData = internal global ptr null
@OpenGL___glMapBuffer = internal global ptr null
@OpenGL___glUnmapBuffer = internal global ptr null
@OpenGL___glGenVertexArrays = internal global ptr null
@OpenGL___glDeleteVertexArrays = internal global ptr null
@OpenGL___glBindVertexArray = internal global ptr null
@OpenGL___glEnableVertexAttribArray = internal global ptr null
@OpenGL___glDisableVertexAttribArray = internal global ptr null
@OpenGL___glVertexAttribPointer = internal global ptr null
@OpenGL___glCreateShader = internal global ptr null
@OpenGL___glDeleteShader = internal global ptr null
@OpenGL___glShaderSource = internal global ptr null
@OpenGL___glCompileShader = internal global ptr null
@OpenGL___glGetShaderiv = internal global ptr null
@OpenGL___glGetShaderInfoLog = internal global ptr null
@OpenGL___glCreateProgram = internal global ptr null
@OpenGL___glDeleteProgram = internal global ptr null
@OpenGL___glAttachShader = internal global ptr null
@OpenGL___glDetachShader = internal global ptr null
@OpenGL___glLinkProgram = internal global ptr null
@OpenGL___glUseProgram = internal global ptr null
@OpenGL___glGetProgramiv = internal global ptr null
@OpenGL___glGetProgramInfoLog = internal global ptr null
@OpenGL___glBindAttribLocation = internal global ptr null
@OpenGL___glGetUniformLocation = internal global ptr null
@OpenGL___glUniform1i = internal global ptr null
@OpenGL___glUniform1f = internal global ptr null
@OpenGL___glUniform2f = internal global ptr null
@OpenGL___glUniform3f = internal global ptr null
@OpenGL___glUniform4f = internal global ptr null
@OpenGL___glUniform1iv = internal global ptr null
@OpenGL___glUniform2fv = internal global ptr null
@OpenGL___glUniform3fv = internal global ptr null
@OpenGL___glUniform4fv = internal global ptr null
@OpenGL___glUniformMat4fv = internal global ptr null
@OpenGL___glGenFramebuffers = internal global ptr null
@OpenGL___glDeleteFramebuffers = internal global ptr null
@OpenGL___glBindFramebuffer = internal global ptr null
@OpenGL___glFramebufferTexture2D = internal global ptr null
@OpenGL___glCheckFramebufferStatus = internal global ptr null
@OpenGL___glGenRenderbuffers = internal global ptr null
@OpenGL___glDeleteRenderbuffers = internal global ptr null
@OpenGL___glBindRenderbuffer = internal global ptr null
@OpenGL___glRenderbufferStorage = internal global ptr null
@OpenGL___glFramebufferRenderbuffer = internal global ptr null
@OpenGL___glGenerateMipmap = internal global ptr null
@OpenGL___glActiveTexture = internal global ptr null
@OpenGL___glDrawArrays = internal global ptr null
@OpenGL___glDrawElements = internal global ptr null
@OpenGL___glDrawArraysInstanced = internal global ptr null
@OpenGL___glDrawElementsInstanced = internal global ptr null
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
@PIXELFORMATDESCRIPTOR.TLD = internal constant { i32, i32, [26 x { i32, i32, i32 }] } { i32 320, i32 26, [26 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 16, i32 1 }, { i32, i32, i32 } { i32 16, i32 16, i32 1 }, { i32, i32, i32 } { i32 32, i32 32, i32 1 }, { i32, i32, i32 } { i32 64, i32 8, i32 1 }, { i32, i32, i32 } { i32 72, i32 8, i32 1 }, { i32, i32, i32 } { i32 80, i32 8, i32 1 }, { i32, i32, i32 } { i32 88, i32 8, i32 1 }, { i32, i32, i32 } { i32 96, i32 8, i32 1 }, { i32, i32, i32 } { i32 104, i32 8, i32 1 }, { i32, i32, i32 } { i32 112, i32 8, i32 1 }, { i32, i32, i32 } { i32 120, i32 8, i32 1 }, { i32, i32, i32 } { i32 128, i32 8, i32 1 }, { i32, i32, i32 } { i32 136, i32 8, i32 1 }, { i32, i32, i32 } { i32 144, i32 8, i32 1 }, { i32, i32, i32 } { i32 152, i32 8, i32 1 }, { i32, i32, i32 } { i32 160, i32 8, i32 1 }, { i32, i32, i32 } { i32 168, i32 8, i32 1 }, { i32, i32, i32 } { i32 176, i32 8, i32 1 }, { i32, i32, i32 } { i32 184, i32 8, i32 1 }, { i32, i32, i32 } { i32 192, i32 8, i32 1 }, { i32, i32, i32 } { i32 200, i32 8, i32 1 }, { i32, i32, i32 } { i32 208, i32 8, i32 1 }, { i32, i32, i32 } { i32 216, i32 8, i32 1 }, { i32, i32, i32 } { i32 224, i32 32, i32 1 }, { i32, i32, i32 } { i32 256, i32 32, i32 1 }, { i32, i32, i32 } { i32 288, i32 32, i32 1 }] }
@Thread.TLD = internal constant { i32, i32, [2 x { i32, i32, i32 }] } { i32 96, i32 2, [2 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 8 }, { i32, i32, i32 } { i32 64, i32 32, i32 1 }] }
@Mutex.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 512, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 512, i32 8 }] }
@RWLock.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 512, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 512, i32 8 }] }
@CondVar.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 512, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 512, i32 8 }] }
@Semaphore.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 256, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 256, i32 8 }] }
@Barrier.TLD = internal constant { i32, i32, [4 x { i32, i32, i32 }] } { i32 128, i32 4, [4 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 1 }, { i32, i32, i32 } { i32 32, i32 32, i32 1 }, { i32, i32, i32 } { i32 64, i32 32, i32 1 }, { i32, i32, i32 } { i32 96, i32 32, i32 1 }] }
@TLSKey.TLD = internal constant { i32, i32, [1 x { i32, i32, i32 }] } { i32 64, i32 1, [1 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 64, i32 8 }] }
@WorkSlice.TLD = internal constant { i32, i32, [21 x { i32, i32, i32 }] } { i32 1216, i32 21, [21 x { i32, i32, i32 }] [{ i32, i32, i32 } { i32 0, i32 32, i32 32 }, { i32, i32, i32 } { i32 32, i32 32, i32 32 }, { i32, i32, i32 } { i32 64, i32 32, i32 32 }, { i32, i32, i32 } { i32 96, i32 32, i32 32 }, { i32, i32, i32 } { i32 128, i32 64, i32 64 }, { i32, i32, i32 } { i32 192, i32 64, i32 64 }, { i32, i32, i32 } { i32 256, i32 64, i32 64 }, { i32, i32, i32 } { i32 320, i32 64, i32 64 }, { i32, i32, i32 } { i32 384, i32 64, i32 64 }, { i32, i32, i32 } { i32 448, i32 64, i32 64 }, { i32, i32, i32 } { i32 512, i32 64, i32 64 }, { i32, i32, i32 } { i32 576, i32 64, i32 64 }, { i32, i32, i32 } { i32 640, i32 64, i32 64 }, { i32, i32, i32 } { i32 704, i32 64, i32 64 }, { i32, i32, i32 } { i32 768, i32 64, i32 64 }, { i32, i32, i32 } { i32 832, i32 64, i32 64 }, { i32, i32, i32 } { i32 896, i32 64, i32 64 }, { i32, i32, i32 } { i32 960, i32 64, i32 64 }, { i32, i32, i32 } { i32 1024, i32 64, i32 64 }, { i32, i32, i32 } { i32 1088, i32 64, i32 64 }, { i32, i32, i32 } { i32 1152, i32 64, i32 64 }] }
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
@glCreateShader_fp = internal global ptr null
@glShaderSource_fp = internal global ptr null
@glCompileShader_fp = internal global ptr null
@glCreateProgram_fp = internal global ptr null
@glAttachShader_fp = internal global ptr null
@glLinkProgram_fp = internal global ptr null
@glUseProgram_fp = internal global ptr null
@glGetUniformLocation_fp = internal global ptr null
@glUniform1i_fp = internal global ptr null
@glUniform2f_fp = internal global ptr null
@glActiveTexture_fp = internal global ptr null
@glDeleteShader_fp = internal global ptr null
@glDeleteProgram_fp = internal global ptr null
@PFD_DRAW_TO_WINDOW = internal global i32 4
@PFD_SUPPORT_OPENGL = internal global i32 32
@PFD_DOUBLEBUFFER = internal global i32 1
@PFD_TYPE_RGBA = internal global i8 0
@PFD_MAIN_PLANE = internal global i8 0
@GL_FALSE = internal global i8 0
@GL_TRUE = internal global i8 1
@GL_NO_ERROR = internal global i8 0
@GL_INVALID_ENUM = internal global i8 0
@GL_INVALID_VALUE = internal global i8 0
@GL_INVALID_OPERATION = internal global i8 0
@GL_OUT_OF_MEMORY = internal global i8 0
@GL_NO_ERROR_INT = internal global i32 0
@GL_INVALID_ENUM_INT = internal global i32 1280
@GL_INVALID_VALUE_INT = internal global i32 1281
@GL_INVALID_OPERATION_INT = internal global i32 1282
@GL_STACK_OVERFLOW_INT = internal global i32 1283
@GL_STACK_UNDERFLOW_INT = internal global i32 1284
@GL_OUT_OF_MEMORY_INT = internal global i32 1285
@GL_COLOR_BUFFER_BIT = internal global i32 16384
@GL_DEPTH_BUFFER_BIT = internal global i32 256
@GL_STENCIL_BUFFER_BIT = internal global i32 1024
@GL_ACCUM_BUFFER_BIT = internal global i32 512
@GL_POINTS = internal global i32 0
@GL_LINES = internal global i32 1
@GL_LINE_LOOP = internal global i32 2
@GL_LINE_STRIP = internal global i32 3
@GL_TRIANGLES = internal global i32 4
@GL_TRIANGLE_STRIP = internal global i32 5
@GL_TRIANGLE_FAN = internal global i32 6
@GL_QUADS = internal global i32 7
@GL_QUAD_STRIP = internal global i32 8
@GL_POLYGON = internal global i32 9
@GL_BYTE = internal global i32 5120
@GL_UNSIGNED_BYTE = internal global i32 5121
@GL_SHORT = internal global i32 5122
@GL_UNSIGNED_SHORT = internal global i32 5123
@GL_INT = internal global i32 5124
@GL_UNSIGNED_INT = internal global i32 5125
@GL_FLOAT = internal global i32 5126
@GL_DOUBLE = internal global i32 5130
@GL_MODELVIEW = internal global i32 5888
@GL_PROJECTION = internal global i32 5889
@GL_TEXTURE = internal global i32 5890
@GL_NEVER = internal global i32 512
@GL_LESS = internal global i32 513
@GL_EQUAL = internal global i32 514
@GL_LEQUAL = internal global i32 515
@GL_GREATER = internal global i32 516
@GL_NOTEQUAL = internal global i32 517
@GL_GEQUAL = internal global i32 518
@GL_ALWAYS = internal global i32 519
@GL_ZERO = internal global i32 0
@GL_ONE = internal global i32 1
@GL_SRC_COLOR = internal global i32 768
@GL_ONE_MINUS_SRC_COLOR = internal global i32 769
@GL_SRC_ALPHA = internal global i32 770
@GL_ONE_MINUS_SRC_ALPHA = internal global i32 771
@GL_DST_ALPHA = internal global i32 772
@GL_ONE_MINUS_DST_ALPHA = internal global i32 773
@GL_DST_COLOR = internal global i32 774
@GL_ONE_MINUS_DST_COLOR = internal global i32 775
@GL_DEPTH_TEST = internal global i32 2929
@GL_BLEND = internal global i32 3042
@GL_CULL_FACE = internal global i32 2884
@GL_LIGHTING = internal global i32 2896
@GL_TEXTURE_2D = internal global i32 3553
@GL_SCISSOR_TEST = internal global i32 3089
@GL_LINE_SMOOTH = internal global i32 2848
@GL_POINT_SMOOTH = internal global i32 2832
@GL_NORMALIZE = internal global i32 2977
@GL_FOG = internal global i32 2912
@GL_STENCIL_TEST = internal global i32 2960
@GL_ALPHA_TEST = internal global i32 3008
@GL_COLOR_LOGIC_OP = internal global i32 3058
@GL_POLYGON_OFFSET_FILL = internal global i32 32823
@GL_MULTISAMPLE = internal global i32 32925
@GL_FRONT = internal global i32 1028
@GL_BACK = internal global i32 1029
@GL_FRONT_AND_BACK = internal global i32 1032
@GL_CW = internal global i32 2304
@GL_CCW = internal global i32 2305
@GL_POINT = internal global i32 6912
@GL_LINE = internal global i32 6913
@GL_FILL = internal global i32 6914
@GL_FLAT = internal global i32 7424
@GL_SMOOTH = internal global i32 7425
@GL_TEXTURE_MAG_FILTER = internal global i32 10240
@GL_TEXTURE_MIN_FILTER = internal global i32 10241
@GL_TEXTURE_WRAP_S = internal global i32 10242
@GL_TEXTURE_WRAP_T = internal global i32 10243
@GL_NEAREST = internal global i32 9728
@GL_LINEAR = internal global i32 9729
@GL_NEAREST_MIPMAP_NEAREST = internal global i32 9984
@GL_LINEAR_MIPMAP_NEAREST = internal global i32 9985
@GL_NEAREST_MIPMAP_LINEAR = internal global i32 9986
@GL_LINEAR_MIPMAP_LINEAR = internal global i32 9987
@GL_CLAMP = internal global i32 10496
@GL_REPEAT = internal global i32 10497
@GL_CLAMP_TO_EDGE = internal global i32 33071
@GL_RGB = internal global i32 6407
@GL_RGBA = internal global i32 6408
@GL_LUMINANCE = internal global i32 6409
@GL_LUMINANCE_ALPHA = internal global i32 6410
@GL_DEPTH_COMPONENT = internal global i32 6402
@GL_ALPHA = internal global i32 6406
@GL_RGB8 = internal global i32 32849
@GL_RGBA8 = internal global i32 32856
@GL_DEPTH_COMPONENT16 = internal global i32 33189
@GL_DEPTH_COMPONENT24 = internal global i32 33190
@GL_ARRAY_BUFFER = internal global i32 34962
@GL_ELEMENT_ARRAY_BUFFER = internal global i32 34963
@GL_UNIFORM_BUFFER = internal global i32 35345
@GL_STREAM_DRAW = internal global i32 35040
@GL_STREAM_READ = internal global i32 35041
@GL_STATIC_DRAW = internal global i32 35044
@GL_STATIC_READ = internal global i32 35045
@GL_DYNAMIC_DRAW = internal global i32 35048
@GL_DYNAMIC_READ = internal global i32 35049
@GL_FRAGMENT_SHADER = internal global i32 35632
@GL_VERTEX_SHADER = internal global i32 35633
@GL_GEOMETRY_SHADER = internal global i32 36313
@GL_COMPILE_STATUS = internal global i32 35713
@GL_LINK_STATUS = internal global i32 35714
@GL_INFO_LOG_LENGTH = internal global i32 35716
@GL_SHADER_TYPE = internal global i32 35663
@GL_DELETE_STATUS = internal global i32 35712
@GL_FRAMEBUFFER = internal global i32 36160
@GL_RENDERBUFFER = internal global i32 36161
@GL_COLOR_ATTACHMENT0 = internal global i32 36064
@GL_DEPTH_ATTACHMENT = internal global i32 36096
@GL_STENCIL_ATTACHMENT = internal global i32 36128
@GL_FRAMEBUFFER_COMPLETE = internal global i32 36053
@GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = internal global i32 36054
@GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = internal global i32 36055
@GL_FRAMEBUFFER_UNSUPPORTED = internal global i32 36061
@GL_VENDOR = internal global i32 7936
@GL_RENDERER = internal global i32 7937
@GL_VERSION = internal global i32 7938
@GL_EXTENSIONS = internal global i32 7939
@GL_TEXTURE0 = internal global i32 33984
@GL_TEXTURE1 = internal global i32 33985
@GL_TEXTURE2 = internal global i32 33986
@GL_TEXTURE3 = internal global i32 33987
@GL_TEXTURE4 = internal global i32 33988
@GL_TEXTURE5 = internal global i32 33989
@GL_TEXTURE6 = internal global i32 33990
@GL_TEXTURE7 = internal global i32 33991
@GL_LIGHT0 = internal global i32 16384
@GL_LIGHT1 = internal global i32 16385
@GL_LIGHT2 = internal global i32 16386
@GL_LIGHT3 = internal global i32 16387
@GL_AMBIENT = internal global i32 4608
@GL_DIFFUSE = internal global i32 4609
@GL_SPECULAR = internal global i32 4610
@GL_POSITION = internal global i32 4611
@GL_SHININESS = internal global i32 5633
@GL_EMISSION = internal global i32 5632
@GL_VIEWPORT = internal global i32 2978
@GL_MAX_TEXTURE_SIZE = internal global i32 3379
@GL_MAX_VIEWPORT_DIMS = internal global i32 3386
@ATOMIC_RELAXED = internal global i32 0
@ATOMIC_ACQUIRE = internal global i32 2
@ATOMIC_RELEASE = internal global i32 3
@ATOMIC_ACQ_REL = internal global i32 4
@ATOMIC_SEQ_CST = internal global i32 5
@WIN32_INFINITE = internal global i32 -1
@THREAD_OPAQUE_BYTES = internal global i32 8
@MUTEX_OPAQUE_BYTES = internal global i32 64
@RWLOCK_OPAQUE_BYTES = internal global i32 64
@COND_OPAQUE_BYTES = internal global i32 64
@SEM_OPAQUE_BYTES = internal global i32 32
@TLS_KEY_OPAQUE_BYTES = internal global i32 8
@THREAD_OK = internal global i32 0
@THREAD_ERROR = internal global i32 -1
@THREAD_TIMEOUT = internal global i32 -2
@WIN_W = internal global i32 1024
@WIN_H = internal global i32 768
@MAX_THREADS = internal global i32 64
@g_dens = internal global ptr null
@g_dens_prev = internal global ptr null
@g_vx = internal global ptr null
@g_vy = internal global ptr null
@g_vx_prev = internal global ptr null
@g_vy_prev = internal global ptr null
@g_dens_tex = internal global ptr null
@g_vel_tex = internal global ptr null
@g_part_x = internal global ptr null
@g_part_y = internal global ptr null
@g_rand_seed = internal global i32 12345
@PHASE_LINSOLVE_RED = internal global i32 0
@PHASE_LINSOLVE_BLACK = internal global i32 1
@PHASE_ADVECT = internal global i32 2
@PHASE_PROJECT_DIV = internal global i32 3
@PHASE_PROJECT_GRAD = internal global i32 4
@PHASE_DECAY = internal global i32 5
@PHASE_EXIT = internal global i32 6
@g_slices = internal global [64 x %WorkSlice] zeroinitializer
@g_slices2 = internal global [64 x %WorkSlice] zeroinitializer
@g_threads = internal global [64 x %Thread] zeroinitializer
@g_threads2 = internal global [64 x %Thread] zeroinitializer
@g_work_sem = internal global %Semaphore zeroinitializer
@g_done_sem = internal global %Semaphore zeroinitializer
@g_work_sem2 = internal global %Semaphore zeroinitializer
@g_done_sem2 = internal global %Semaphore zeroinitializer
@g_num_threads = internal global i32 1
@g_rows_per_thread = internal global i32 1
@mouse_down = internal global i1 false
@mouse_x = internal global i32 0
@mouse_y = internal global i32 0
@mouse_px = internal global i32 0
@mouse_py = internal global i32 0
@cur_w = internal global i32 1024
@cur_h = internal global i32 768
@g_palette = internal global i32 0
@g_game_state = internal global i32 0
@g_prev_state = internal global i32 0
@g_smooth_vx = internal global double 0.000000e+00
@g_smooth_vy = internal global double 0.000000e+00
@g_paddle_gy = internal global i32 96
@g_cpu_paddle_gy = internal global i32 96
@g_jetting = internal global i1 false
@g_sucking = internal global i1 false
@g_suck_charge = internal global float 0.000000e+00
@g_ball_x = internal global float -1.000000e+00
@g_ball_y = internal global float 0.000000e+00
@g_ball_vx = internal global float 0.000000e+00
@g_ball_vy = internal global float 0.000000e+00
@g_lives = internal global i32 3
@g_level = internal global i32 1
@VERT_SRC = internal global [102 x i8] c"#version 120\0Avoid main() {\0A    gl_TexCoord[0] = gl_MultiTexCoord0;\0A    gl_Position    = gl_Vertex;\0A}\0A\00"
@FRAG_SRC = internal global [4187 x i8] c"#version 120\0Auniform sampler2D u_dens;\0Auniform sampler2D u_vel;\0Auniform vec2      u_res;\0Auniform int       u_palette;\0A\0Avoid main() {\0A    vec2 uv = gl_TexCoord[0].xy;\0A\0A    float d  = texture2D(u_dens, uv).r;\0A    vec2  v  = texture2D(u_vel,  uv).ra - 0.5;\0A    float vm = length(v) * 2.0;\0A    float t  = clamp(d, 0.0, 1.0);\0A\0A    // Wide bloom - 8-tap gather at two radii\0A    vec2  px   = 1.0 / u_res;\0A    float blur = 0.0;\0A    blur += texture2D(u_dens, uv + vec2(-px.x,       0.0      )).r;\0A    blur += texture2D(u_dens, uv + vec2( px.x,       0.0      )).r;\0A    blur += texture2D(u_dens, uv + vec2( 0.0,       -px.y     )).r;\0A    blur += texture2D(u_dens, uv + vec2( 0.0,        px.y     )).r;\0A    blur += texture2D(u_dens, uv + vec2(-px.x*2.5,  -px.y*2.5 )).r;\0A    blur += texture2D(u_dens, uv + vec2( px.x*2.5,  -px.y*2.5 )).r;\0A    blur += texture2D(u_dens, uv + vec2(-px.x*2.5,   px.y*2.5 )).r;\0A    blur += texture2D(u_dens, uv + vec2( px.x*2.5,   px.y*2.5 )).r;\0A    blur *= 0.125;\0A    float glow = clamp(blur * 3.0 + vm * t * 0.5, 0.0, 1.0);\0A\0A    vec3 col = vec3(0.0);\0A\0A    // 1: Classic plasma - blue/cyan/magenta\0A    if (u_palette == 0) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 0.0));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 0.4));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 0.8));\0A    }\0A    // 2: Fire - black -> red -> orange -> yellow\0A    else if (u_palette == 1) {\0A        col.r = clamp(t * 3.0,       0.0, 1.0);\0A        col.g = clamp(t * 3.0 - 1.0, 0.0, 1.0);\0A        col.b = clamp(t * 3.0 - 2.0, 0.0, 1.0);\0A    }\0A    // 3: Toxic - green/yellow-green\0A    else if (u_palette == 2) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 0.9));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 0.3));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.2 + 1.3));\0A    }\0A    // 4: Ice - deep blue -> cyan -> white\0A    else if (u_palette == 3) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.0 + 1.0));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.0 + 0.6));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.0 + 0.1));\0A    }\0A    // 5: Sunset - purple -> magenta -> orange\0A    else if (u_palette == 4) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.1 + 0.1));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.1 + 0.9));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.1 + 0.5));\0A    }\0A    // 6: Deep ocean - navy -> teal -> seafoam\0A    else if (u_palette == 5) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.3 + 1.2));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.3 + 0.7));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.3 + 0.2));\0A    }\0A    // 7: Neon - hot pink -> purple -> electric blue\0A    else if (u_palette == 6) {\0A        col.r = 0.5 - 0.5 * cos(3.14159 * (t * 1.4 + 0.2));\0A        col.g = 0.5 - 0.5 * cos(3.14159 * (t * 1.4 + 1.1));\0A        col.b = 0.5 - 0.5 * cos(3.14159 * (t * 1.4 + 0.6));\0A    }\0A    // 8: Gold - brown -> gold -> bright yellow\0A    else if (u_palette == 7) {\0A        col.r = clamp(t * 2.5,       0.0, 1.0);\0A        col.g = clamp(t * 2.5 - 0.4, 0.0, 1.0);\0A        col.b = clamp(t * 3.0 - 2.2, 0.0, 0.3);\0A    }\0A    // 9: Monochrome - white core with soft halo\0A    else if (u_palette == 8) {\0A        float lum = t * t * 2.0;\0A        col = vec3(clamp(lum, 0.0, 1.0));\0A    }\0A    // 0: Rainbow - full hue cycle across density\0A    else {\0A        float h = t * 6.0;\0A        float f = clamp(h - floor(h), 0.0, 1.0);\0A        if      (h < 1.0) { col = vec3(1.0,     f,       0.0     ); }\0A        else if (h < 2.0) { col = vec3(1.0-f,   1.0,     0.0     ); }\0A        else if (h < 3.0) { col = vec3(0.0,     1.0,     f       ); }\0A        else if (h < 4.0) { col = vec3(0.0,     1.0-f,   1.0     ); }\0A        else if (h < 5.0) { col = vec3(f,       0.0,     1.0     ); }\0A        else              { col = vec3(1.0,     0.0,     1.0-f   ); }\0A        col *= t;\0A    }\0A\0A    // Saturation boost\0A    float grey = dot(col, vec3(0.299, 0.587, 0.114));\0A    col = mix(vec3(grey), col, 1.8);\0A\0A    // Additive glow halo\0A    col += col * glow * 1.4;\0A\0A    // Velocity shimmer\0A    col += vec3(0.08, 0.2, 0.4) * vm * d * 0.6;\0A\0A    col *= t;\0A    float alpha = clamp(t * 8.0, 0.0, 1.0);\0A    gl_FragColor = vec4(col, alpha);\0A}\0A\00"
@FONT_SPACE = internal global [5 x i32] zeroinitializer
@FONT_EXCL = internal global [5 x i32] [i32 0, i32 0, i32 95, i32 0, i32 0]
@FONT_QUOT = internal global [5 x i32] [i32 0, i32 7, i32 0, i32 7, i32 0]
@FONT_HASH = internal global [5 x i32] [i32 20, i32 127, i32 20, i32 127, i32 20]
@FONT_DOLL = internal global [5 x i32] [i32 36, i32 42, i32 127, i32 42, i32 18]
@FONT_PERC = internal global [5 x i32] [i32 35, i32 19, i32 8, i32 100, i32 98]
@FONT_AMP = internal global [5 x i32] [i32 54, i32 73, i32 85, i32 34, i32 80]
@FONT_APOS = internal global [5 x i32] [i32 0, i32 5, i32 3, i32 0, i32 0]
@FONT_LPAREN = internal global [5 x i32] [i32 0, i32 28, i32 34, i32 65, i32 0]
@FONT_RPAREN = internal global [5 x i32] [i32 0, i32 65, i32 34, i32 28, i32 0]
@FONT_STAR = internal global [5 x i32] [i32 20, i32 8, i32 62, i32 8, i32 20]
@FONT_PLUS = internal global [5 x i32] [i32 8, i32 8, i32 62, i32 8, i32 8]
@FONT_COMMA = internal global [5 x i32] [i32 0, i32 80, i32 48, i32 0, i32 0]
@FONT_MINUS = internal global [5 x i32] [i32 8, i32 8, i32 8, i32 8, i32 8]
@FONT_PERIOD = internal global [5 x i32] [i32 0, i32 96, i32 96, i32 0, i32 0]
@FONT_SLASH = internal global [5 x i32] [i32 32, i32 16, i32 8, i32 4, i32 2]
@FONT_0 = internal global [5 x i32] [i32 62, i32 81, i32 73, i32 69, i32 62]
@FONT_1 = internal global [5 x i32] [i32 0, i32 66, i32 127, i32 64, i32 0]
@FONT_2 = internal global [5 x i32] [i32 66, i32 97, i32 81, i32 73, i32 70]
@FONT_3 = internal global [5 x i32] [i32 33, i32 65, i32 69, i32 75, i32 49]
@FONT_4 = internal global [5 x i32] [i32 24, i32 20, i32 18, i32 127, i32 16]
@FONT_5 = internal global [5 x i32] [i32 39, i32 69, i32 69, i32 69, i32 57]
@FONT_6 = internal global [5 x i32] [i32 60, i32 74, i32 73, i32 73, i32 48]
@FONT_7 = internal global [5 x i32] [i32 1, i32 113, i32 9, i32 5, i32 3]
@FONT_8 = internal global [5 x i32] [i32 54, i32 73, i32 73, i32 73, i32 54]
@FONT_9 = internal global [5 x i32] [i32 6, i32 73, i32 73, i32 41, i32 30]
@FONT_COLON = internal global [5 x i32] [i32 0, i32 54, i32 54, i32 0, i32 0]
@FONT_SEMIC = internal global [5 x i32] [i32 0, i32 86, i32 54, i32 0, i32 0]
@FONT_LT = internal global [5 x i32] [i32 8, i32 20, i32 34, i32 65, i32 0]
@FONT_EQ = internal global [5 x i32] [i32 20, i32 20, i32 20, i32 20, i32 20]
@FONT_GT = internal global [5 x i32] [i32 0, i32 65, i32 34, i32 20, i32 8]
@FONT_QUEST = internal global [5 x i32] [i32 2, i32 1, i32 81, i32 9, i32 6]
@FONT_AT = internal global [5 x i32] [i32 50, i32 73, i32 121, i32 65, i32 62]
@FONT_A = internal global [5 x i32] [i32 126, i32 17, i32 17, i32 17, i32 126]
@FONT_B = internal global [5 x i32] [i32 127, i32 73, i32 73, i32 73, i32 54]
@FONT_C = internal global [5 x i32] [i32 62, i32 65, i32 65, i32 65, i32 34]
@FONT_D = internal global [5 x i32] [i32 127, i32 65, i32 65, i32 34, i32 28]
@FONT_E = internal global [5 x i32] [i32 127, i32 73, i32 73, i32 73, i32 65]
@FONT_F = internal global [5 x i32] [i32 127, i32 9, i32 9, i32 9, i32 1]
@FONT_G = internal global [5 x i32] [i32 62, i32 65, i32 73, i32 73, i32 122]
@FONT_H = internal global [5 x i32] [i32 127, i32 8, i32 8, i32 8, i32 127]
@FONT_I = internal global [5 x i32] [i32 0, i32 65, i32 127, i32 65, i32 0]
@FONT_J = internal global [5 x i32] [i32 32, i32 64, i32 65, i32 63, i32 1]
@FONT_K = internal global [5 x i32] [i32 127, i32 8, i32 20, i32 34, i32 65]
@FONT_L = internal global [5 x i32] [i32 127, i32 64, i32 64, i32 64, i32 64]
@FONT_M = internal global [5 x i32] [i32 127, i32 2, i32 12, i32 2, i32 127]
@FONT_N = internal global [5 x i32] [i32 127, i32 4, i32 8, i32 16, i32 127]
@FONT_O = internal global [5 x i32] [i32 62, i32 65, i32 65, i32 65, i32 62]
@FONT_P = internal global [5 x i32] [i32 127, i32 9, i32 9, i32 9, i32 6]
@FONT_Q = internal global [5 x i32] [i32 62, i32 65, i32 81, i32 33, i32 94]
@FONT_R = internal global [5 x i32] [i32 127, i32 9, i32 25, i32 41, i32 70]
@FONT_S = internal global [5 x i32] [i32 70, i32 73, i32 73, i32 73, i32 49]
@FONT_T = internal global [5 x i32] [i32 1, i32 1, i32 127, i32 1, i32 1]
@FONT_U = internal global [5 x i32] [i32 63, i32 64, i32 64, i32 64, i32 63]
@FONT_V = internal global [5 x i32] [i32 31, i32 32, i32 64, i32 32, i32 31]
@FONT_W = internal global [5 x i32] [i32 63, i32 64, i32 56, i32 64, i32 63]
@FONT_X = internal global [5 x i32] [i32 99, i32 20, i32 8, i32 20, i32 99]
@FONT_Y = internal global [5 x i32] [i32 7, i32 8, i32 112, i32 8, i32 7]
@FONT_Z = internal global [5 x i32] [i32 97, i32 81, i32 73, i32 69, i32 67]

define ptr @OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1(ptr %this.1, i64 %device_context.1) {
entry:
  %.5 = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 0
  store i64 %device_context.1, ptr %.5, align 8
  %.7 = call i64 @OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %device_context.1)
  %.8 = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 1
  store i64 %.7, ptr %.8, align 8
  %.10 = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 2
  store i1 false, ptr %.10, align 1
  ret ptr %this.1
}

define void @OpenGL__GLContext.__exit__0__ret_voidE1(ptr %this.1) {
entry:
  %rc_ptr = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 1
  %rc = load i64, ptr %rc_ptr, align 8
  %.3 = sext i32 0 to i64
  %.4 = icmp ne i64 %rc, %.3
  br i1 %.4, label %then, label %ifcont

then:                                             ; preds = %entry
  %.6 = sext i32 0 to i64
  %.7 = sext i32 0 to i64
  %.8 = call i1 @wglMakeCurrent(i64 %.6, i64 %.7)
  %rc_ptr.1 = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 1
  %rc.1 = load i64, ptr %rc_ptr.1, align 8
  %.9 = call i1 @wglDeleteContext(i64 %rc.1)
  br label %ifcont

ifcont:                                           ; preds = %entry, %then
  ret void
}

define void @OpenGL__GLContext.load_extensions__0__ret_voidE1(ptr %this.1) {
entry:
  call void @OpenGL__gl_load_extensions__0__ret_voidE1()
  %.3 = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 2
  store i1 true, ptr %.3, align 1
  ret void
}

define void @OpenGL__GLContext.present__0__ret_voidE1(ptr %this.1) {
entry:
  %dc_ptr = getelementptr inbounds %OpenGL__GLContext, ptr %this.1, i32 0, i32 0
  %dc = load i64, ptr %dc_ptr, align 8
  call void @OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1(i64 %dc)
  ret void
}

define void @OpenGL__GLContext.clear__0__ret_voidE1(ptr %this.1) {
entry:
  %GL_COLOR_BUFFER_BIT = load i32, ptr @GL_COLOR_BUFFER_BIT, align 4
  %GL_DEPTH_BUFFER_BIT = load i32, ptr @GL_DEPTH_BUFFER_BIT, align 4
  %.3 = or i32 %GL_COLOR_BUFFER_BIT, %GL_DEPTH_BUFFER_BIT
  call void @glClear(i32 %.3)
  ret void
}

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

declare ptr @CreateThread(ptr, i64, ptr, ptr, i32, ptr)

declare i32 @WaitForSingleObject(ptr, i32)

declare i32 @CloseHandle(ptr)

declare i32 @GetCurrentThreadId()

declare i32 @SwitchToThread()

declare void @ExitThread(i32)

declare void @InitializeCriticalSection(ptr)

declare void @DeleteCriticalSection(ptr)

declare void @EnterCriticalSection(ptr)

declare void @LeaveCriticalSection(ptr)

declare i32 @TryEnterCriticalSection(ptr)

declare void @InitializeSRWLock(ptr)

declare void @AcquireSRWLockExclusive(ptr)

declare void @ReleaseSRWLockExclusive(ptr)

declare void @AcquireSRWLockShared(ptr)

declare void @ReleaseSRWLockShared(ptr)

declare i32 @TryAcquireSRWLockExclusive(ptr)

declare i32 @TryAcquireSRWLockShared(ptr)

declare void @InitializeConditionVariable(ptr)

declare i32 @SleepConditionVariableCS(ptr, ptr, i32)

declare void @WakeConditionVariable(ptr)

declare void @WakeAllConditionVariable(ptr)

declare ptr @CreateSemaphoreA(ptr, i32, i32, ptr)

declare i32 @ReleaseSemaphore(ptr, i32, ptr)

declare i32 @TlsAlloc()

declare i32 @TlsFree(i32)

declare ptr @TlsGetValue(i32)

declare i32 @TlsSetValue(i32, ptr)

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
  %msg = alloca %standard__system__windows__MSG, align 8
  %.fca.0.gep29 = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep29, align 8
  %.fca.1.gep30 = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 1
  store i32 0, ptr %.fca.1.gep30, align 8
  %.fca.2.gep31 = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 2
  store i64 0, ptr %.fca.2.gep31, align 8
  %.fca.3.gep32 = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 3
  store i64 0, ptr %.fca.3.gep32, align 8
  %.fca.4.gep33 = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 4
  store i32 0, ptr %.fca.4.gep33, align 8
  %.fca.5.0.gep = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 5, i32 0
  store i32 0, ptr %.fca.5.0.gep, align 4
  %.fca.5.1.gep = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 5, i32 1
  store i32 0, ptr %.fca.5.1.gep, align 8
  %tex_dens = alloca i32, align 4
  store i32 0, ptr %tex_dens, align 4
  %tex_vel = alloca i32, align 4
  store i32 0, ptr %tex_vel, align 4
  %client_rect = alloca %standard__system__windows__RECT, align 8
  %.fca.0.gep25 = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 0
  store i32 0, ptr %.fca.0.gep25, align 4
  %.fca.1.gep26 = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 1
  store i32 0, ptr %.fca.1.gep26, align 4
  %.fca.2.gep27 = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 2
  store i32 0, ptr %.fca.2.gep27, align 4
  %.fca.3.gep28 = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 3
  store i32 0, ptr %.fca.3.gep28, align 4
  %sysinfo = alloca %SYSTEM_INFO_PARTIAL, align 8
  %.fca.0.gep15 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 0
  store i32 0, ptr %.fca.0.gep15, align 8
  %.fca.1.gep16 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 1
  store i32 0, ptr %.fca.1.gep16, align 4
  %.fca.2.gep17 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 2
  store ptr null, ptr %.fca.2.gep17, align 8
  %.fca.3.gep18 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 3
  store ptr null, ptr %.fca.3.gep18, align 8
  %.fca.4.gep19 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 4
  store i64 0, ptr %.fca.4.gep19, align 8
  %.fca.5.gep20 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 5
  store i32 0, ptr %.fca.5.gep20, align 8
  %.fca.6.gep21 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 6
  store i32 0, ptr %.fca.6.gep21, align 4
  %.fca.7.gep22 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 7
  store i32 0, ptr %.fca.7.gep22, align 8
  %.fca.8.gep23 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 8
  store i16 0, ptr %.fca.8.gep23, align 4
  %.fca.9.gep24 = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 9
  store i16 0, ptr %.fca.9.gep24, align 2
  %to_void_ptr = bitcast ptr %sysinfo to ptr
  call void @GetSystemInfo(ptr %to_void_ptr)
  %dwNumberOfProcessors_ptr = getelementptr inbounds %SYSTEM_INFO_PARTIAL, ptr %sysinfo, i32 0, i32 5
  %dwNumberOfProcessors = load i32, ptr %dwNumberOfProcessors_ptr, align 4
  store i32 %dwNumberOfProcessors, ptr @g_num_threads, align 4
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.38 = icmp slt i32 %g_num_threads, 1
  %wc = alloca %standard__system__windows__WNDCLASSEXA, align 8
  %gl = alloca %OpenGL__GLContext, align 8
  %spec.store.select = select i1 %.38, i32 1, i32 %dwNumberOfProcessors
  store i32 %spec.store.select, ptr @g_num_threads, align 4
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %MAX_THREADS = load i32, ptr @MAX_THREADS, align 4
  %.43 = icmp sgt i32 %g_num_threads.1, %MAX_THREADS
  br i1 %.43, label %then.1, label %ifcont.1

then.1:                                           ; preds = %entry
  %MAX_THREADS.1 = load i32, ptr @MAX_THREADS, align 4
  store i32 %MAX_THREADS.1, ptr @g_num_threads, align 4
  br label %ifcont.1

ifcont.1:                                         ; preds = %entry, %then.1
  %.48 = mul i32 256, 192
  %.49 = mul i32 %.48, 8
  %.50 = zext i32 %.49 to i64
  %.52 = mul i32 256, 192
  %.53 = mul i32 %.52, 4
  %.54 = zext i32 %.53 to i64
  %.56 = mul i32 256, 192
  %.57 = mul i32 %.56, 4
  %.58 = mul i32 %.57, 2
  %.59 = zext i32 %.58 to i64
  %.61 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr = inttoptr i64 %.61 to ptr
  store ptr %int_to_ptr, ptr @g_dens, align 8
  %.63 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr.1 = inttoptr i64 %.63 to ptr
  store ptr %int_to_ptr.1, ptr @g_dens_prev, align 8
  %.65 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr.2 = inttoptr i64 %.65 to ptr
  store ptr %int_to_ptr.2, ptr @g_vx, align 8
  %.67 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr.3 = inttoptr i64 %.67 to ptr
  store ptr %int_to_ptr.3, ptr @g_vy, align 8
  %.69 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr.4 = inttoptr i64 %.69 to ptr
  store ptr %int_to_ptr.4, ptr @g_vx_prev, align 8
  %.71 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.50)
  %int_to_ptr.5 = inttoptr i64 %.71 to ptr
  store ptr %int_to_ptr.5, ptr @g_vy_prev, align 8
  %.73 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.54)
  %int_to_ptr.6 = inttoptr i64 %.73 to ptr
  store ptr %int_to_ptr.6, ptr @g_dens_tex, align 8
  %.75 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.59)
  %int_to_ptr.7 = inttoptr i64 %.75 to ptr
  store ptr %int_to_ptr.7, ptr @g_vel_tex, align 8
  %.77 = mul i32 7500, 4
  %.78 = zext i32 %.77 to i64
  %.79 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.78)
  %int_to_ptr.8 = inttoptr i64 %.79 to ptr
  store ptr %int_to_ptr.8, ptr @g_part_x, align 8
  %.81 = mul i32 7500, 4
  %.82 = zext i32 %.81 to i64
  %.83 = call i64 @standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %.82)
  %int_to_ptr.9 = inttoptr i64 %.83 to ptr
  store ptr %int_to_ptr.9, ptr @g_part_y, align 8
  call void @particles_init__0__ret_voidE1()
  %.85 = call i32 @standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1(ptr @g_work_sem, i32 0)
  %.86 = call i32 @standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1(ptr @g_done_sem, i32 0)
  %.87 = call i32 @standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1(ptr @g_work_sem2, i32 0)
  %.88 = call i32 @standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1(ptr @g_done_sem2, i32 0)
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.89 = sdiv i32 192, %g_num_threads.2
  store i32 %.89, ptr @g_rows_per_thread, align 4
  %g_rows_per_thread = load i32, ptr @g_rows_per_thread, align 4
  %.91 = icmp slt i32 %g_rows_per_thread, 1
  %spec.store.select34 = select i1 %.91, i32 1, i32 %.89
  store i32 %spec.store.select34, ptr @g_rows_per_thread, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %ifcont.1
  %t.0 = phi i32 [ 0, %ifcont.1 ], [ %.135, %for.body ]
  %g_num_threads.3 = load i32, ptr @g_num_threads, align 4
  %.98 = icmp slt i32 %t.0, %g_num_threads.3
  br i1 %.98, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %g_rows_per_thread.1 = load i32, ptr @g_rows_per_thread, align 4
  %.100 = mul i32 %t.0, %g_rows_per_thread.1
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.101 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 0
  store i32 %.100, ptr %.101, align 4
  %g_num_threads.4 = load i32, ptr @g_num_threads, align 4
  %.103 = sub i32 %g_num_threads.4, 1
  %.104 = icmp eq i32 %t.0, %.103
  %.107 = add i32 %t.0, 1
  %g_rows_per_thread.2 = load i32, ptr @g_rows_per_thread, align 4
  %.108 = mul i32 %.107, %g_rows_per_thread.2
  %ternary_result = select i1 %.104, i32 192, i32 %.108
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.110 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 1
  store i32 %ternary_result, ptr %.110, align 4
  %PHASE_DECAY = load i32, ptr @PHASE_DECAY, align 4
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.112 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 2
  store i32 %PHASE_DECAY, ptr %.112, align 4
  %g_rows_per_thread.3 = load i32, ptr @g_rows_per_thread, align 4
  %.114 = mul i32 %t.0, %g_rows_per_thread.3
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.115 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 0
  store i32 %.114, ptr %.115, align 4
  %g_num_threads.5 = load i32, ptr @g_num_threads, align 4
  %.117 = sub i32 %g_num_threads.5, 1
  %.118 = icmp eq i32 %t.0, %.117
  %.121 = add i32 %t.0, 1
  %g_rows_per_thread.4 = load i32, ptr @g_rows_per_thread, align 4
  %.122 = mul i32 %.121, %g_rows_per_thread.4
  %ternary_result.1 = select i1 %.118, i32 192, i32 %.122
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.124 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 1
  store i32 %ternary_result.1, ptr %.124, align 4
  %PHASE_DECAY.1 = load i32, ptr @PHASE_DECAY, align 4
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.126 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 2
  store i32 %PHASE_DECAY.1, ptr %.126, align 4
  %to_void_ptr.1 = bitcast ptr @worker__1__voidE1_ptr1__ret_voidE1_ptr1 to ptr
  %.128 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %to_void_ptr.2 = bitcast ptr %.128 to ptr
  %.129 = getelementptr inbounds [64 x %Thread], ptr @g_threads, i32 0, i32 %t.0
  %.130 = call i32 @standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1(ptr %to_void_ptr.1, ptr %to_void_ptr.2, ptr %.129)
  %to_void_ptr.3 = bitcast ptr @worker2__1__voidE1_ptr1__ret_voidE1_ptr1 to ptr
  %.131 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %to_void_ptr.4 = bitcast ptr %.131 to ptr
  %.132 = getelementptr inbounds [64 x %Thread], ptr @g_threads2, i32 0, i32 %t.0
  %.133 = call i32 @standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1(ptr %to_void_ptr.3, ptr %to_void_ptr.4, ptr %.132)
  %.135 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr.10 = inttoptr i64 %int_to_ptr_zext to ptr
  %.138 = call i64 @GetModuleHandleA(ptr %int_to_ptr.10)
  %str_data = alloca [9 x i8], align 1
  %.140 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 0
  store i8 70, ptr %.140, align 1
  %.142 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 1
  store i8 108, ptr %.142, align 1
  %.144 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 2
  store i8 117, ptr %.144, align 1
  %.146 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 3
  store i8 105, ptr %.146, align 1
  %.148 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 4
  store i8 100, ptr %.148, align 1
  %.150 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 5
  store i8 83, ptr %.150, align 1
  %.152 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 6
  store i8 105, ptr %.152, align 1
  %.154 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 7
  store i8 109, ptr %.154, align 1
  %.156 = getelementptr [9 x i8], ptr %str_data, i32 0, i32 8
  store i8 0, ptr %.156, align 1
  %str_ptr = getelementptr [9 x i8], ptr %str_data, i32 0, i32 0
  %str_data.1 = alloca [17 x i8], align 1
  %.159 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 0
  store i8 70, ptr %.159, align 1
  %.161 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 1
  store i8 108, ptr %.161, align 1
  %.163 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 2
  store i8 117, ptr %.163, align 1
  %.165 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 3
  store i8 105, ptr %.165, align 1
  %.167 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 4
  store i8 100, ptr %.167, align 1
  %.169 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 5
  store i8 32, ptr %.169, align 1
  %.171 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 6
  store i8 83, ptr %.171, align 1
  %.173 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 7
  store i8 105, ptr %.173, align 1
  %.175 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 8
  store i8 109, ptr %.175, align 1
  %.177 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 9
  store i8 117, ptr %.177, align 1
  %.179 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 10
  store i8 108, ptr %.179, align 1
  %.181 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 11
  store i8 97, ptr %.181, align 1
  %.183 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 12
  store i8 116, ptr %.183, align 1
  %.185 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 13
  store i8 105, ptr %.185, align 1
  %.187 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 14
  store i8 111, ptr %.187, align 1
  %.189 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 15
  store i8 110, ptr %.189, align 1
  %.191 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 16
  store i8 0, ptr %.191, align 1
  %str_ptr.1 = getelementptr [17 x i8], ptr %str_data.1, i32 0, i32 0
  %.fca.0.gep12 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 0
  store i32 0, ptr %.fca.0.gep12, align 8
  %.fca.1.gep13 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 1
  store i32 0, ptr %.fca.1.gep13, align 4
  %.fca.2.gep14 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 2
  store ptr null, ptr %.fca.2.gep14, align 8
  %.fca.3.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 3
  store i32 0, ptr %.fca.3.gep, align 8
  %.fca.4.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 4
  store i32 0, ptr %.fca.4.gep, align 4
  %.fca.5.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 5
  store i64 0, ptr %.fca.5.gep, align 8
  %.fca.6.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 6
  store i64 0, ptr %.fca.6.gep, align 8
  %.fca.7.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 7
  store i64 0, ptr %.fca.7.gep, align 8
  %.fca.8.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 8
  store i64 0, ptr %.fca.8.gep, align 8
  %.fca.9.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 9
  store ptr null, ptr %.fca.9.gep, align 8
  %.fca.10.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 10
  store ptr null, ptr %.fca.10.gep, align 8
  %.fca.11.gep = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 11
  store i64 0, ptr %.fca.11.gep, align 8
  %.195 = sdiv i32 640, 8
  %.196 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 0
  store i32 %.195, ptr %.196, align 4
  %CS_HREDRAW = load i32, ptr @standard__system__windows__CS_HREDRAW, align 4
  %CS_VREDRAW = load i32, ptr @standard__system__windows__CS_VREDRAW, align 4
  %.198 = or i32 %CS_HREDRAW, %CS_VREDRAW
  %CS_OWNDC = load i32, ptr @standard__system__windows__CS_OWNDC, align 4
  %.199 = or i32 %.198, %CS_OWNDC
  %.200 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 1
  store i32 %.199, ptr %.200, align 4
  %.202 = bitcast ptr @FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64 to ptr
  %.203 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 2
  store ptr %.202, ptr %.203, align 8
  %.205 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 3
  store i32 0, ptr %.205, align 4
  %.207 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 4
  store i32 0, ptr %.207, align 4
  %.209 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 5
  store i64 %.138, ptr %.209, align 8
  %.211 = sext i32 0 to i64
  %int_to_ptr_zext.1 = zext i32 32512 to i64
  %int_to_ptr.11 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  %.212 = call i64 @LoadIconA(i64 %.211, ptr %int_to_ptr.11)
  %.213 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 6
  store i64 %.212, ptr %.213, align 8
  %.215 = sext i32 0 to i64
  %int_to_ptr_zext.2 = zext i32 32512 to i64
  %int_to_ptr.12 = inttoptr i64 %int_to_ptr_zext.2 to ptr
  %.216 = call i64 @LoadCursorA(i64 %.215, ptr %int_to_ptr.12)
  %.217 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 7
  store i64 %.216, ptr %.217, align 8
  %BLACK_BRUSH = load i32, ptr @standard__system__windows__BLACK_BRUSH, align 4
  %.219 = call i64 @GetStockObject(i32 %BLACK_BRUSH)
  %.220 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 8
  store i64 %.219, ptr %.220, align 8
  %int_to_ptr_zext.3 = zext i32 0 to i64
  %int_to_ptr.13 = inttoptr i64 %int_to_ptr_zext.3 to ptr
  %.222 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 9
  store ptr %int_to_ptr.13, ptr %.222, align 8
  %.224 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 10
  store ptr %str_ptr, ptr %.224, align 8
  %.226 = sext i32 0 to i64
  %.227 = getelementptr inbounds %standard__system__windows__WNDCLASSEXA, ptr %wc, i32 0, i32 11
  store i64 %.226, ptr %.227, align 8
  %.229 = call i16 @RegisterClassExA(ptr %wc)
  %WS_EX_APPWINDOW = load i32, ptr @standard__system__windows__WS_EX_APPWINDOW, align 4
  %WS_OVERLAPPEDWINDOW = load i32, ptr @standard__system__windows__WS_OVERLAPPEDWINDOW, align 4
  %WS_VISIBLE = load i32, ptr @standard__system__windows__WS_VISIBLE, align 4
  %.230 = or i32 %WS_OVERLAPPEDWINDOW, %WS_VISIBLE
  %WIN_W = load i32, ptr @WIN_W, align 4
  %WIN_H = load i32, ptr @WIN_H, align 4
  %.231 = sext i32 0 to i64
  %.232 = sext i32 0 to i64
  %STDLIB_GVP = load ptr, ptr @STDLIB_GVP, align 8
  %.233 = call i64 @CreateWindowExA(i32 %WS_EX_APPWINDOW, ptr %str_ptr, ptr %str_ptr.1, i32 %.230, i32 100, i32 100, i32 %WIN_W, i32 %WIN_H, i64 %.231, i64 %.232, i64 %.138, ptr %STDLIB_GVP)
  %.235 = call i64 @GetDC(i64 %.233)
  %.fca.0.gep = getelementptr inbounds %OpenGL__GLContext, ptr %gl, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %OpenGL__GLContext, ptr %gl, i32 0, i32 1
  store i64 0, ptr %.fca.1.gep, align 8
  %.fca.2.gep = getelementptr inbounds %OpenGL__GLContext, ptr %gl, i32 0, i32 2
  store i1 false, ptr %.fca.2.gep, align 8
  %.238 = call ptr @OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1(ptr %gl, i64 %.235)
  call void @OpenGL__GLContext.load_extensions__0__ret_voidE1(ptr %gl)
  %_glCreateShader = load ptr, ptr @OpenGL___glCreateShader, align 8
  %void_ptr_to_typed = bitcast ptr %_glCreateShader to ptr
  store ptr %void_ptr_to_typed, ptr @glCreateShader_fp, align 8
  %_glShaderSource = load ptr, ptr @OpenGL___glShaderSource, align 8
  %void_ptr_to_typed.1 = bitcast ptr %_glShaderSource to ptr
  store ptr %void_ptr_to_typed.1, ptr @glShaderSource_fp, align 8
  %_glCompileShader = load ptr, ptr @OpenGL___glCompileShader, align 8
  %void_ptr_to_typed.2 = bitcast ptr %_glCompileShader to ptr
  store ptr %void_ptr_to_typed.2, ptr @glCompileShader_fp, align 8
  %_glCreateProgram = load ptr, ptr @OpenGL___glCreateProgram, align 8
  %void_ptr_to_typed.3 = bitcast ptr %_glCreateProgram to ptr
  store ptr %void_ptr_to_typed.3, ptr @glCreateProgram_fp, align 8
  %_glAttachShader = load ptr, ptr @OpenGL___glAttachShader, align 8
  %void_ptr_to_typed.4 = bitcast ptr %_glAttachShader to ptr
  store ptr %void_ptr_to_typed.4, ptr @glAttachShader_fp, align 8
  %_glLinkProgram = load ptr, ptr @OpenGL___glLinkProgram, align 8
  %void_ptr_to_typed.5 = bitcast ptr %_glLinkProgram to ptr
  store ptr %void_ptr_to_typed.5, ptr @glLinkProgram_fp, align 8
  %_glUseProgram = load ptr, ptr @OpenGL___glUseProgram, align 8
  %void_ptr_to_typed.6 = bitcast ptr %_glUseProgram to ptr
  store ptr %void_ptr_to_typed.6, ptr @glUseProgram_fp, align 8
  %_glGetUniformLocation = load ptr, ptr @OpenGL___glGetUniformLocation, align 8
  %void_ptr_to_typed.7 = bitcast ptr %_glGetUniformLocation to ptr
  store ptr %void_ptr_to_typed.7, ptr @glGetUniformLocation_fp, align 8
  %_glUniform1i = load ptr, ptr @OpenGL___glUniform1i, align 8
  %void_ptr_to_typed.8 = bitcast ptr %_glUniform1i to ptr
  store ptr %void_ptr_to_typed.8, ptr @glUniform1i_fp, align 8
  %_glUniform2f = load ptr, ptr @OpenGL___glUniform2f, align 8
  %void_ptr_to_typed.9 = bitcast ptr %_glUniform2f to ptr
  store ptr %void_ptr_to_typed.9, ptr @glUniform2f_fp, align 8
  %_glActiveTexture = load ptr, ptr @OpenGL___glActiveTexture, align 8
  %void_ptr_to_typed.10 = bitcast ptr %_glActiveTexture to ptr
  store ptr %void_ptr_to_typed.10, ptr @glActiveTexture_fp, align 8
  %_glDeleteShader = load ptr, ptr @OpenGL___glDeleteShader, align 8
  %void_ptr_to_typed.11 = bitcast ptr %_glDeleteShader to ptr
  store ptr %void_ptr_to_typed.11, ptr @glDeleteShader_fp, align 8
  %_glDeleteProgram = load ptr, ptr @OpenGL___glDeleteProgram, align 8
  %void_ptr_to_typed.12 = bitcast ptr %_glDeleteProgram to ptr
  store ptr %void_ptr_to_typed.12, ptr @glDeleteProgram_fp, align 8
  %GL_PROJECTION = load i32, ptr @GL_PROJECTION, align 4
  call void @glMatrixMode(i32 %GL_PROJECTION)
  call void @glLoadIdentity()
  %GL_MODELVIEW = load i32, ptr @GL_MODELVIEW, align 4
  call void @glMatrixMode(i32 %GL_MODELVIEW)
  call void @glLoadIdentity()
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D)
  %GL_VERTEX_SHADER = load i32, ptr @GL_VERTEX_SHADER, align 4
  %.259 = getelementptr inbounds [102 x i8], ptr @VERT_SRC, i32 0, i32 0
  %.260 = call i32 @OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1(i32 %GL_VERTEX_SHADER, ptr %.259)
  %GL_FRAGMENT_SHADER = load i32, ptr @GL_FRAGMENT_SHADER, align 4
  %.262 = getelementptr inbounds [4187 x i8], ptr @FRAG_SRC, i32 0, i32 0
  %.263 = call i32 @OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1(i32 %GL_FRAGMENT_SHADER, ptr %.262)
  %.265 = call i32 @OpenGL__link_program__2__intE1__intE1__ret_intE1(i32 %.260, i32 %.263)
  %glGetUniformLocation_fp = load ptr, ptr @glGetUniformLocation_fp, align 8
  %str_stack = alloca [7 x i8], align 1
  %str_char_0 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 0
  store i8 117, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 1
  store i8 95, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 2
  store i8 100, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 3
  store i8 101, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 4
  store i8 110, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 5
  store i8 115, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 6
  store i8 0, ptr %str_char_6, align 1
  %arg1_decay = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 0
  %fp_call = call i32 %glGetUniformLocation_fp(i32 %.265, ptr %arg1_decay)
  %glGetUniformLocation_fp.1 = load ptr, ptr @glGetUniformLocation_fp, align 8
  %str_stack.1 = alloca [6 x i8], align 1
  %str_char_0.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 117, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 95, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 118, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 101, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 0, ptr %str_char_5.1, align 1
  %arg1_decay.1 = getelementptr [6 x i8], ptr %str_stack.1, i32 0, i32 0
  %fp_call.1 = call i32 %glGetUniformLocation_fp.1(i32 %.265, ptr %arg1_decay.1)
  %glGetUniformLocation_fp.2 = load ptr, ptr @glGetUniformLocation_fp, align 8
  %str_stack.2 = alloca [6 x i8], align 1
  %str_char_0.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 117, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 95, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 114, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 101, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 115, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 0, ptr %str_char_5.2, align 1
  %arg1_decay.2 = getelementptr [6 x i8], ptr %str_stack.2, i32 0, i32 0
  %fp_call.2 = call i32 %glGetUniformLocation_fp.2(i32 %.265, ptr %arg1_decay.2)
  %glGetUniformLocation_fp.3 = load ptr, ptr @glGetUniformLocation_fp, align 8
  %str_stack.3 = alloca [10 x i8], align 1
  %str_char_0.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 117, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 95, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 112, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 97, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 108, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 101, ptr %str_char_5.3, align 1
  %str_char_6.1 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 116, ptr %str_char_6.1, align 1
  %str_char_7 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 116, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 101, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 0, ptr %str_char_9, align 1
  %arg1_decay.3 = getelementptr [10 x i8], ptr %str_stack.3, i32 0, i32 0
  %fp_call.3 = call i32 %glGetUniformLocation_fp.3(i32 %.265, ptr %arg1_decay.3)
  store i32 0, ptr %tex_dens, align 4
  call void @glGenTextures(i32 1, ptr %tex_dens)
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  %tex_dens.1 = load i32, ptr %tex_dens, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.1, i32 %tex_dens.1)
  %GL_TEXTURE_2D.2 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_MIN_FILTER = load i32, ptr @GL_TEXTURE_MIN_FILTER, align 4
  %GL_LINEAR = load i32, ptr @GL_LINEAR, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.2, i32 %GL_TEXTURE_MIN_FILTER, i32 %GL_LINEAR)
  %GL_TEXTURE_2D.3 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_MAG_FILTER = load i32, ptr @GL_TEXTURE_MAG_FILTER, align 4
  %GL_LINEAR.1 = load i32, ptr @GL_LINEAR, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.3, i32 %GL_TEXTURE_MAG_FILTER, i32 %GL_LINEAR.1)
  %GL_TEXTURE_2D.4 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_WRAP_S = load i32, ptr @GL_TEXTURE_WRAP_S, align 4
  %GL_CLAMP_TO_EDGE = load i32, ptr @GL_CLAMP_TO_EDGE, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.4, i32 %GL_TEXTURE_WRAP_S, i32 %GL_CLAMP_TO_EDGE)
  %GL_TEXTURE_2D.5 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_WRAP_T = load i32, ptr @GL_TEXTURE_WRAP_T, align 4
  %GL_CLAMP_TO_EDGE.1 = load i32, ptr @GL_CLAMP_TO_EDGE, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.5, i32 %GL_TEXTURE_WRAP_T, i32 %GL_CLAMP_TO_EDGE.1)
  %GL_TEXTURE_2D.6 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_LUMINANCE = load i32, ptr @GL_LUMINANCE, align 4
  %GL_LUMINANCE.1 = load i32, ptr @GL_LUMINANCE, align 4
  %GL_FLOAT = load i32, ptr @GL_FLOAT, align 4
  %g_dens_tex = load ptr, ptr @g_dens_tex, align 8
  %to_void_ptr.5 = bitcast ptr %g_dens_tex to ptr
  call void @glTexImage2D(i32 %GL_TEXTURE_2D.6, i32 0, i32 %GL_LUMINANCE, i32 256, i32 192, i32 0, i32 %GL_LUMINANCE.1, i32 %GL_FLOAT, ptr %to_void_ptr.5)
  store i32 0, ptr %tex_vel, align 4
  call void @glGenTextures(i32 1, ptr %tex_vel)
  %GL_TEXTURE_2D.7 = load i32, ptr @GL_TEXTURE_2D, align 4
  %tex_vel.1 = load i32, ptr %tex_vel, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.7, i32 %tex_vel.1)
  %GL_TEXTURE_2D.8 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_MIN_FILTER.1 = load i32, ptr @GL_TEXTURE_MIN_FILTER, align 4
  %GL_LINEAR.2 = load i32, ptr @GL_LINEAR, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.8, i32 %GL_TEXTURE_MIN_FILTER.1, i32 %GL_LINEAR.2)
  %GL_TEXTURE_2D.9 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_MAG_FILTER.1 = load i32, ptr @GL_TEXTURE_MAG_FILTER, align 4
  %GL_LINEAR.3 = load i32, ptr @GL_LINEAR, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.9, i32 %GL_TEXTURE_MAG_FILTER.1, i32 %GL_LINEAR.3)
  %GL_TEXTURE_2D.10 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_WRAP_S.1 = load i32, ptr @GL_TEXTURE_WRAP_S, align 4
  %GL_CLAMP_TO_EDGE.2 = load i32, ptr @GL_CLAMP_TO_EDGE, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.10, i32 %GL_TEXTURE_WRAP_S.1, i32 %GL_CLAMP_TO_EDGE.2)
  %GL_TEXTURE_2D.11 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_TEXTURE_WRAP_T.1 = load i32, ptr @GL_TEXTURE_WRAP_T, align 4
  %GL_CLAMP_TO_EDGE.3 = load i32, ptr @GL_CLAMP_TO_EDGE, align 4
  call void @glTexParameteri(i32 %GL_TEXTURE_2D.11, i32 %GL_TEXTURE_WRAP_T.1, i32 %GL_CLAMP_TO_EDGE.3)
  %GL_TEXTURE_2D.12 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_LUMINANCE_ALPHA = load i32, ptr @GL_LUMINANCE_ALPHA, align 4
  %GL_LUMINANCE_ALPHA.1 = load i32, ptr @GL_LUMINANCE_ALPHA, align 4
  %GL_FLOAT.1 = load i32, ptr @GL_FLOAT, align 4
  %g_vel_tex = load ptr, ptr @g_vel_tex, align 8
  %to_void_ptr.6 = bitcast ptr %g_vel_tex to ptr
  call void @glTexImage2D(i32 %GL_TEXTURE_2D.12, i32 0, i32 %GL_LUMINANCE_ALPHA, i32 256, i32 192, i32 0, i32 %GL_LUMINANCE_ALPHA.1, i32 %GL_FLOAT.1, ptr %to_void_ptr.6)
  %SW_SHOW = load i32, ptr @standard__system__windows__SW_SHOW, align 4
  %.316 = call i1 @ShowWindow(i64 %.233, i32 %SW_SHOW)
  %.317 = call i1 @UpdateWindow(i64 %.233)
  br label %while.cond

while.cond:                                       ; preds = %ifcont.14, %for.end
  %running.0 = phi i1 [ true, %for.end ], [ %running.11, %ifcont.14 ]
  br i1 %running.0, label %while.cond.1, label %while.end

while.end:                                        ; preds = %while.end.1, %while.cond
  br label %for.cond.2

while.cond.1:                                     ; preds = %while.cond, %while.body.1
  %running.11 = phi i1 [ %.running.11, %while.body.1 ], [ %running.0, %while.cond ]
  %.322 = sext i32 0 to i64
  %PM_REMOVE = load i32, ptr @standard__system__windows__PM_REMOVE, align 4
  %.323 = call i1 @PeekMessageA(ptr %msg, i64 %.322, i32 0, i32 0, i32 %PM_REMOVE)
  br i1 %.323, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %message_ptr = getelementptr inbounds %standard__system__windows__MSG, ptr %msg, i32 0, i32 1
  %message = load i32, ptr %message_ptr, align 4
  %WM_QUIT = load i32, ptr @standard__system__windows__WM_QUIT, align 4
  %.325 = icmp eq i32 %message, %WM_QUIT
  %.running.11 = select i1 %.325, i1 false, i1 %running.11
  %.330 = call i1 @TranslateMessage(ptr %msg)
  %.331 = call i64 @DispatchMessageA(ptr %msg)
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  %.333 = xor i1 %running.11, true
  br i1 %.333, label %while.end, label %ifcont.4

ifcont.4:                                         ; preds = %while.end.1
  %.337 = call i1 @GetClientRect(i64 %.233, ptr %client_rect)
  %right_ptr = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 2
  %right = load i32, ptr %right_ptr, align 4
  %left_ptr = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 0
  %left = load i32, ptr %left_ptr, align 4
  %.338 = sub i32 %right, %left
  store i32 %.338, ptr @cur_w, align 4
  %bottom_ptr = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 3
  %bottom = load i32, ptr %bottom_ptr, align 4
  %top_ptr = getelementptr inbounds %standard__system__windows__RECT, ptr %client_rect, i32 0, i32 1
  %top = load i32, ptr %top_ptr, align 4
  %.340 = sub i32 %bottom, %top
  store i32 %.340, ptr @cur_h, align 4
  %cur_w = load i32, ptr @cur_w, align 4
  %.342 = icmp slt i32 %cur_w, 1
  br i1 %.342, label %then.5, label %ifcont.5

then.5:                                           ; preds = %ifcont.4
  store i32 1, ptr @cur_w, align 4
  br label %ifcont.5

ifcont.5:                                         ; preds = %ifcont.4, %then.5
  %cur_h = load i32, ptr @cur_h, align 4
  %.347 = icmp slt i32 %cur_h, 1
  br i1 %.347, label %then.6, label %ifcont.6

then.6:                                           ; preds = %ifcont.5
  store i32 1, ptr @cur_h, align 4
  br label %ifcont.6

ifcont.6:                                         ; preds = %ifcont.5, %then.6
  %cur_w.1 = load i32, ptr @cur_w, align 4
  %cur_h.1 = load i32, ptr @cur_h, align 4
  call void @glViewport(i32 0, i32 0, i32 %cur_w.1, i32 %cur_h.1)
  %g_game_state = load i32, ptr @g_game_state, align 4
  %.353 = icmp eq i32 %g_game_state, 1
  br i1 %.353, label %then.7, label %ifcont.7

then.7:                                           ; preds = %ifcont.6
  %g_ball_x = load float, ptr @g_ball_x, align 4
  %.355 = fcmp olt float %g_ball_x, 0.000000e+00
  br i1 %.355, label %then.8, label %ifcont.8

ifcont.7:                                         ; preds = %ifcont.6, %ifcont.8
  %g_game_state.1 = load i32, ptr @g_game_state, align 4
  %.363 = icmp eq i32 %g_game_state.1, 1
  br i1 %.363, label %then.9, label %ifcont.9

then.8:                                           ; preds = %then.7
  %cur_w.2 = load i32, ptr @cur_w, align 4
  %cur_h.2 = load i32, ptr @cur_h, align 4
  call void @ball_reset__2__intE1__intE1__ret_voidE1(i32 %cur_w.2, i32 %cur_h.2)
  br label %ifcont.8

ifcont.8:                                         ; preds = %then.7, %then.8
  call void @paddle_update__0__ret_voidE1()
  call void @cpu_paddle_update__0__ret_voidE1()
  %cur_w.3 = load i32, ptr @cur_w, align 4
  %cur_h.3 = load i32, ptr @cur_h, align 4
  call void @ball_update__2__intE1__intE1__ret_voidE1(i32 %cur_w.3, i32 %cur_h.3)
  call void @vel_step__0__ret_voidE1()
  call void @dens_step__0__ret_voidE1()
  call void @dispatch_decay__0__ret_voidE1()
  br label %ifcont.7

then.9:                                           ; preds = %ifcont.7
  call void @particles_update__0__ret_voidE1()
  br label %ifcont.9

ifcont.9:                                         ; preds = %ifcont.7, %then.9
  call void @upload_textures__0__ret_voidE1()
  %glActiveTexture_fp = load ptr, ptr @glActiveTexture_fp, align 8
  %GL_TEXTURE0 = load i32, ptr @GL_TEXTURE0, align 4
  call void %glActiveTexture_fp(i32 %GL_TEXTURE0)
  %GL_TEXTURE_2D.13 = load i32, ptr @GL_TEXTURE_2D, align 4
  %tex_dens.2 = load i32, ptr %tex_dens, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.13, i32 %tex_dens.2)
  %GL_TEXTURE_2D.14 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_LUMINANCE.2 = load i32, ptr @GL_LUMINANCE, align 4
  %GL_FLOAT.2 = load i32, ptr @GL_FLOAT, align 4
  %g_dens_tex.1 = load ptr, ptr @g_dens_tex, align 8
  %to_void_ptr.7 = bitcast ptr %g_dens_tex.1 to ptr
  call void @glTexSubImage2D(i32 %GL_TEXTURE_2D.14, i32 0, i32 0, i32 0, i32 256, i32 192, i32 %GL_LUMINANCE.2, i32 %GL_FLOAT.2, ptr %to_void_ptr.7)
  %glActiveTexture_fp.1 = load ptr, ptr @glActiveTexture_fp, align 8
  %GL_TEXTURE1 = load i32, ptr @GL_TEXTURE1, align 4
  call void %glActiveTexture_fp.1(i32 %GL_TEXTURE1)
  %GL_TEXTURE_2D.15 = load i32, ptr @GL_TEXTURE_2D, align 4
  %tex_vel.2 = load i32, ptr %tex_vel, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.15, i32 %tex_vel.2)
  %GL_TEXTURE_2D.16 = load i32, ptr @GL_TEXTURE_2D, align 4
  %GL_LUMINANCE_ALPHA.2 = load i32, ptr @GL_LUMINANCE_ALPHA, align 4
  %GL_FLOAT.3 = load i32, ptr @GL_FLOAT, align 4
  %g_vel_tex.1 = load ptr, ptr @g_vel_tex, align 8
  %to_void_ptr.8 = bitcast ptr %g_vel_tex.1 to ptr
  call void @glTexSubImage2D(i32 %GL_TEXTURE_2D.16, i32 0, i32 0, i32 0, i32 256, i32 192, i32 %GL_LUMINANCE_ALPHA.2, i32 %GL_FLOAT.3, ptr %to_void_ptr.8)
  call void @glClearColor(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00)
  %GL_COLOR_BUFFER_BIT = load i32, ptr @GL_COLOR_BUFFER_BIT, align 4
  call void @glClear(i32 %GL_COLOR_BUFFER_BIT)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND)
  %GL_SRC_ALPHA = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE_MINUS_SRC_ALPHA = load i32, ptr @GL_ONE_MINUS_SRC_ALPHA, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA, i32 %GL_ONE_MINUS_SRC_ALPHA)
  %glUseProgram_fp = load ptr, ptr @glUseProgram_fp, align 8
  call void %glUseProgram_fp(i32 %.265)
  %glUniform1i_fp = load ptr, ptr @glUniform1i_fp, align 8
  call void %glUniform1i_fp(i32 %fp_call, i32 0)
  %glUniform1i_fp.1 = load ptr, ptr @glUniform1i_fp, align 8
  call void %glUniform1i_fp.1(i32 %fp_call.1, i32 1)
  %glUniform2f_fp = load ptr, ptr @glUniform2f_fp, align 8
  %.375 = sitofp i32 256 to float
  %.376 = sitofp i32 192 to float
  call void %glUniform2f_fp(i32 %fp_call.2, float %.375, float %.376)
  %glUniform1i_fp.2 = load ptr, ptr @glUniform1i_fp, align 8
  %g_palette = load i32, ptr @g_palette, align 4
  call void %glUniform1i_fp.2(i32 %fp_call.3, i32 %g_palette)
  %GL_TRIANGLES = load i32, ptr @GL_TRIANGLES, align 4
  call void @glBegin(i32 %GL_TRIANGLES)
  call void @glTexCoord2f(float 0.000000e+00, float 0.000000e+00)
  %.379 = fsub float 0.000000e+00, 1.000000e+00
  %.380 = fsub float 0.000000e+00, 1.000000e+00
  call void @glVertex2f(float %.379, float %.380)
  call void @glTexCoord2f(float 2.000000e+00, float 0.000000e+00)
  %.383 = fsub float 0.000000e+00, 1.000000e+00
  call void @glVertex2f(float 3.000000e+00, float %.383)
  call void @glTexCoord2f(float 0.000000e+00, float 2.000000e+00)
  %.386 = fsub float 0.000000e+00, 1.000000e+00
  call void @glVertex2f(float %.386, float 3.000000e+00)
  call void @glEnd()
  %glUseProgram_fp.1 = load ptr, ptr @glUseProgram_fp, align 8
  call void %glUseProgram_fp.1(i32 0)
  %GL_BLEND.1 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.1)
  %glActiveTexture_fp.2 = load ptr, ptr @glActiveTexture_fp, align 8
  %GL_TEXTURE0.1 = load i32, ptr @GL_TEXTURE0, align 4
  call void %glActiveTexture_fp.2(i32 %GL_TEXTURE0.1)
  %GL_TEXTURE_2D.17 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.17, i32 0)
  %glActiveTexture_fp.3 = load ptr, ptr @glActiveTexture_fp, align 8
  %GL_TEXTURE1.1 = load i32, ptr @GL_TEXTURE1, align 4
  call void %glActiveTexture_fp.3(i32 %GL_TEXTURE1.1)
  %GL_TEXTURE_2D.18 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glBindTexture(i32 %GL_TEXTURE_2D.18, i32 0)
  %glActiveTexture_fp.4 = load ptr, ptr @glActiveTexture_fp, align 8
  %GL_TEXTURE0.2 = load i32, ptr @GL_TEXTURE0, align 4
  call void %glActiveTexture_fp.4(i32 %GL_TEXTURE0.2)
  %GL_TEXTURE_2D.19 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D.19)
  %GL_DEPTH_TEST.1 = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST.1)
  %GL_BLEND.2 = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND.2)
  %GL_SRC_ALPHA.1 = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE = load i32, ptr @GL_ONE, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA.1, i32 %GL_ONE)
  %float_to_double_rhs = fpext float 1.200000e+01 to double
  %.396 = fdiv double 0x401921FB54442EEA, %float_to_double_rhs
  %f64_to_f32 = fptrunc double %.396 to float
  br label %for.cond.1

for.cond.1:                                       ; preds = %ifcont.10, %ifcont.9
  %i.0 = phi i32 [ 0, %ifcont.9 ], [ %.465, %ifcont.10 ]
  %.400 = icmp slt i32 %i.0, 7500
  br i1 %.400, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %g_part_x = load ptr, ptr @g_part_x, align 8
  %ptr_gep = getelementptr inbounds float, ptr %g_part_x, i32 %i.0
  %ptr_load = load float, ptr %ptr_gep, align 4
  %g_part_y = load ptr, ptr @g_part_y, align 8
  %ptr_gep.1 = getelementptr inbounds float, ptr %g_part_y, i32 %i.0
  %ptr_load.1 = load float, ptr %ptr_gep.1, align 4
  %g_dens = load ptr, ptr @g_dens, align 8
  %.404 = fptosi float %ptr_load.1 to i32
  %.405 = mul i32 %.404, 256
  %.406 = fptosi float %ptr_load to i32
  %.407 = add i32 %.405, %.406
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_dens, i32 %.407
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.408 = fptrunc double %ptr_load.2 to float
  %.410 = fcmp ogt float %.408, 8.000000e+00
  br i1 %.410, label %then.10, label %ifcont.10

for.end.1:                                        ; preds = %for.cond.1
  %GL_BLEND.3 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.3)
  %GL_TEXTURE_2D.20 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.20)
  %g_game_state.2 = load i32, ptr @g_game_state, align 4
  %.470 = icmp eq i32 %g_game_state.2, 1
  br i1 %.470, label %then.12, label %ifcont.12

then.10:                                          ; preds = %for.body.1
  %.412 = fmul float %.408, 0x3F926E9780000000
  %.413 = fadd float 1.500000e+00, %.412
  %.415 = fcmp ogt float %.413, 5.500000e+00
  %..413 = select i1 %.415, float 5.500000e+00, float %.413
  %.420 = sitofp i32 256 to float
  %.421 = fdiv float %ptr_load, %.420
  %.422 = fmul float %.421, 2.000000e+00
  %.423 = fsub float %.422, 1.000000e+00
  %.425 = sitofp i32 192 to float
  %.426 = fdiv float %ptr_load.1, %.425
  %.427 = fmul float %.426, 2.000000e+00
  %.428 = fsub float %.427, 1.000000e+00
  %.430 = fmul float %..413, 2.000000e+00
  %cur_w.4 = load i32, ptr @cur_w, align 4
  %.431 = sitofp i32 %cur_w.4 to float
  %.432 = fdiv float %.430, %.431
  %.434 = fmul float %..413, 2.000000e+00
  %cur_h.4 = load i32, ptr @cur_h, align 4
  %.435 = sitofp i32 %cur_h.4 to float
  %.436 = fdiv float %.434, %.435
  %GL_TRIANGLE_FAN = load i32, ptr @GL_TRIANGLE_FAN, align 4
  call void @glBegin(i32 %GL_TRIANGLE_FAN)
  call void @glColor4f(float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 0x3FE19999A0000000)
  call void @glVertex2f(float %.423, float %.428)
  call void @glColor4f(float 0x3FE19999A0000000, float 7.500000e-01, float 1.000000e+00, float 0.000000e+00)
  br label %while.cond.2

ifcont.10:                                        ; preds = %for.body.1, %while.end.2
  %.465 = add i32 %i.0, 1
  br label %for.cond.1

while.cond.2:                                     ; preds = %while.body.2, %then.10
  %seg.0 = phi i32 [ 0, %then.10 ], [ %.458, %while.body.2 ]
  %.444 = icmp sle i32 %seg.0, 12
  br i1 %.444, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.446 = sitofp i32 %seg.0 to float
  %.447 = fmul float %.446, %f64_to_f32
  %.449 = call float @standard__math__cos__1__floatE1__ret_floatE1(float %.447)
  %.450 = fmul float %.432, %.449
  %.451 = fadd float %.423, %.450
  %.453 = call float @standard__math__sin__1__floatE1__ret_floatE1(float %.447)
  %.454 = fmul float %.436, %.453
  %.455 = fadd float %.428, %.454
  call void @glVertex2f(float %.451, float %.455)
  %.458 = add i32 %seg.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  call void @glEnd()
  br label %ifcont.10

then.12:                                          ; preds = %for.end.1
  %cur_w.5 = load i32, ptr @cur_w, align 4
  %cur_h.5 = load i32, ptr @cur_h, align 4
  %g_paddle_gy = load i32, ptr @g_paddle_gy, align 4
  call void @draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1(i32 %cur_w.5, i32 %cur_h.5, i32 4, i32 %g_paddle_gy)
  %cur_w.6 = load i32, ptr @cur_w, align 4
  %cur_h.6 = load i32, ptr @cur_h, align 4
  %.473 = sub i32 256, 6
  %g_cpu_paddle_gy = load i32, ptr @g_cpu_paddle_gy, align 4
  call void @draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1(i32 %cur_w.6, i32 %cur_h.6, i32 %.473, i32 %g_cpu_paddle_gy)
  %cur_w.7 = load i32, ptr @cur_w, align 4
  %cur_h.7 = load i32, ptr @cur_h, align 4
  call void @draw_ball__2__intE1__intE1__ret_voidE1(i32 %cur_w.7, i32 %cur_h.7)
  %cur_w.8 = load i32, ptr @cur_w, align 4
  %cur_h.8 = load i32, ptr @cur_h, align 4
  call void @draw_hud__2__intE1__intE1__ret_voidE1(i32 %cur_w.8, i32 %cur_h.8)
  br label %ifcont.12

ifcont.12:                                        ; preds = %for.end.1, %then.12
  %g_game_state.3 = load i32, ptr @g_game_state, align 4
  %.479 = icmp eq i32 %g_game_state.3, 0
  br i1 %.479, label %then.13, label %ifcont.13

then.13:                                          ; preds = %ifcont.12
  %cur_w.9 = load i32, ptr @cur_w, align 4
  %cur_h.9 = load i32, ptr @cur_h, align 4
  call void @draw_gui__2__intE1__intE1__ret_voidE1(i32 %cur_w.9, i32 %cur_h.9)
  br label %ifcont.13

ifcont.13:                                        ; preds = %ifcont.12, %then.13
  %g_game_state.4 = load i32, ptr @g_game_state, align 4
  %.484 = icmp eq i32 %g_game_state.4, 2
  br i1 %.484, label %then.14, label %ifcont.14

then.14:                                          ; preds = %ifcont.13
  %cur_w.10 = load i32, ptr @cur_w, align 4
  %cur_h.10 = load i32, ptr @cur_h, align 4
  call void @draw_quit_dialog__2__intE1__intE1__ret_voidE1(i32 %cur_w.10, i32 %cur_h.10)
  br label %ifcont.14

ifcont.14:                                        ; preds = %ifcont.13, %then.14
  call void @OpenGL__GLContext.present__0__ret_voidE1(ptr %gl)
  br label %while.cond

for.cond.2:                                       ; preds = %for.body.2, %while.end
  %t.110 = phi i32 [ 0, %while.end ], [ %.502, %for.body.2 ]
  %g_num_threads.6 = load i32, ptr @g_num_threads, align 4
  %.493 = icmp slt i32 %t.110, %g_num_threads.6
  br i1 %.493, label %for.body.2, label %for.cond.3

for.body.2:                                       ; preds = %for.cond.2
  %PHASE_EXIT = load i32, ptr @PHASE_EXIT, align 4
  %array_gep.6 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.110
  %.495 = getelementptr inbounds %WorkSlice, ptr %array_gep.6, i32 0, i32 2
  store i32 %PHASE_EXIT, ptr %.495, align 4
  %PHASE_EXIT.1 = load i32, ptr @PHASE_EXIT, align 4
  %array_gep.7 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.110
  %.497 = getelementptr inbounds %WorkSlice, ptr %array_gep.7, i32 0, i32 2
  store i32 %PHASE_EXIT.1, ptr %.497, align 4
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem2)
  %.502 = add i32 %t.110, 1
  br label %for.cond.2

for.cond.3:                                       ; preds = %for.cond.2, %for.body.3
  %t.211 = phi i32 [ %.514, %for.body.3 ], [ 0, %for.cond.2 ]
  %g_num_threads.7 = load i32, ptr @g_num_threads, align 4
  %.507 = icmp slt i32 %t.211, %g_num_threads.7
  br i1 %.507, label %for.body.3, label %for.end.3

for.body.3:                                       ; preds = %for.cond.3
  %.509 = getelementptr inbounds [64 x %Thread], ptr @g_threads, i32 0, i32 %t.211
  %.510 = call i32 @standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1(ptr %.509)
  %.511 = getelementptr inbounds [64 x %Thread], ptr @g_threads2, i32 0, i32 %t.211
  %.512 = call i32 @standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1(ptr %.511)
  %.514 = add i32 %t.211, 1
  br label %for.cond.3

for.end.3:                                        ; preds = %for.cond.3
  call void @standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  call void @standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  call void @standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem2)
  call void @standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem2)
  %glDeleteShader_fp = load ptr, ptr @glDeleteShader_fp, align 8
  call void %glDeleteShader_fp(i32 %.260)
  %glDeleteShader_fp.1 = load ptr, ptr @glDeleteShader_fp, align 8
  call void %glDeleteShader_fp.1(i32 %.263)
  %glDeleteProgram_fp = load ptr, ptr @glDeleteProgram_fp, align 8
  call void %glDeleteProgram_fp(i32 %.265)
  call void @glDeleteTextures(i32 1, ptr %tex_dens)
  call void @glDeleteTextures(i32 1, ptr %tex_vel)
  call void @OpenGL__GLContext.__exit__0__ret_voidE1(ptr %gl)
  %.524 = call i32 @ReleaseDC(i64 %.233, i64 %.235)
  %.525 = call i1 @UnregisterClassA(ptr %str_ptr, i64 %.138)
  %g_part_y.1 = load ptr, ptr @g_part_y, align 8
  %ptr_to_int = ptrtoint ptr %g_part_y.1 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int)
  %g_part_x.1 = load ptr, ptr @g_part_x, align 8
  %ptr_to_int.1 = ptrtoint ptr %g_part_x.1 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.1)
  %g_vel_tex.2 = load ptr, ptr @g_vel_tex, align 8
  %ptr_to_int.2 = ptrtoint ptr %g_vel_tex.2 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.2)
  %g_dens_tex.2 = load ptr, ptr @g_dens_tex, align 8
  %ptr_to_int.3 = ptrtoint ptr %g_dens_tex.2 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.3)
  %g_vy_prev = load ptr, ptr @g_vy_prev, align 8
  %ptr_to_int.4 = ptrtoint ptr %g_vy_prev to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.4)
  %g_vx_prev = load ptr, ptr @g_vx_prev, align 8
  %ptr_to_int.5 = ptrtoint ptr %g_vx_prev to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.5)
  %g_vy = load ptr, ptr @g_vy, align 8
  %ptr_to_int.6 = ptrtoint ptr %g_vy to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.6)
  %g_vx = load ptr, ptr @g_vx, align 8
  %ptr_to_int.7 = ptrtoint ptr %g_vx to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.7)
  %g_dens_prev = load ptr, ptr @g_dens_prev, align 8
  %ptr_to_int.8 = ptrtoint ptr %g_dens_prev to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.8)
  %g_dens.1 = load ptr, ptr @g_dens, align 8
  %ptr_to_int.9 = ptrtoint ptr %g_dens.1 to i64
  call void @standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1(i64 %ptr_to_int.9)
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

define i8 @standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8(i8 %x) {
entry:
  %.4 = sext i8 %x to i32
  %.5 = icmp sle i32 %.4, 0
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %while.cond, %then.1, %then
  %common.ret.op = phi i8 [ %.7, %then ], [ %.13, %then.1 ], [ %y.0, %while.cond ]
  ret i8 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 0 to i8
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i8 %x to i32
  %.11 = icmp eq i32 %.10, 1
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = trunc i32 1 to i8
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.16 = sext i8 %x to i32
  %.17 = sdiv i32 %.16, 2
  %.18 = trunc i32 %.17 to i8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont.1
  %y.0 = phi i8 [ %.18, %ifcont.1 ], [ %.32, %while.body ]
  %prev_y.0 = phi i8 [ %x, %ifcont.1 ], [ %y.0, %while.body ]
  %.22 = icmp ne i8 %y.0, %prev_y.0
  %.24 = icmp slt i8 %y.0, %prev_y.0
  %spec.select = select i1 %.22, i1 %.24, i1 false
  br i1 %spec.select, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.28 = sdiv i8 %x, %y.0
  %.29 = add i8 %y.0, %.28
  %.30 = sext i8 %.29 to i32
  %.31 = sdiv i32 %.30, 2
  %.32 = trunc i32 %.31 to i8
  br label %while.cond
}

define i16 @standard__math__sqrt__1__dataE1_sbits16__ret_dataE1_sbits16(i16 %x) {
entry:
  %.4 = sext i16 %x to i32
  %.5 = icmp sle i32 %.4, 0
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %while.cond, %then.1, %then
  %common.ret.op = phi i16 [ %.7, %then ], [ %.13, %then.1 ], [ %y.0, %while.cond ]
  ret i16 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 0 to i16
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i16 %x to i32
  %.11 = icmp eq i32 %.10, 1
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = trunc i32 1 to i16
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.16 = sext i16 %x to i32
  %.17 = sdiv i32 %.16, 2
  %.18 = trunc i32 %.17 to i16
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont.1
  %y.0 = phi i16 [ %.18, %ifcont.1 ], [ %.32, %while.body ]
  %prev_y.0 = phi i16 [ %x, %ifcont.1 ], [ %y.0, %while.body ]
  %.22 = icmp ne i16 %y.0, %prev_y.0
  %.24 = icmp slt i16 %y.0, %prev_y.0
  %spec.select = select i1 %.22, i1 %.24, i1 false
  br i1 %spec.select, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.28 = sdiv i16 %x, %y.0
  %.29 = add i16 %y.0, %.28
  %.30 = sext i16 %.29 to i32
  %.31 = sdiv i32 %.30, 2
  %.32 = trunc i32 %.31 to i16
  br label %while.cond
}

define i32 @standard__math__sqrt__1__dataE1_sbits32__ret_dataE1_sbits32(i32 %x) {
entry:
  %.4 = icmp sle i32 %x, 0
  br i1 %.4, label %common.ret, label %ifcont

common.ret:                                       ; preds = %while.cond, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %y.0, %while.cond ]
  ret i32 %common.ret.op

ifcont:                                           ; preds = %entry
  %.8 = sdiv i32 %x, 2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont
  %y.0 = phi i32 [ %.8, %ifcont ], [ %.20, %while.body ]
  %prev_y.0 = phi i32 [ %x, %ifcont ], [ %y.0, %while.body ]
  %.12 = icmp ne i32 %y.0, %prev_y.0
  %.14 = icmp slt i32 %y.0, %prev_y.0
  %spec.select = select i1 %.12, i1 %.14, i1 false
  br i1 %spec.select, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.18 = sdiv i32 %x, %y.0
  %.19 = add i32 %y.0, %.18
  %.20 = sdiv i32 %.19, 2
  br label %while.cond
}

define i64 @standard__math__sqrt__1__dataE1_sbits64__ret_dataE1_sbits64(i64 %x) {
entry:
  %.4 = sext i32 0 to i64
  %.5 = icmp sle i64 %x, %.4
  br i1 %.5, label %then, label %ifcont

common.ret:                                       ; preds = %while.cond, %then.1, %then
  %common.ret.op = phi i64 [ %.7, %then ], [ %.13, %then.1 ], [ %y.0, %while.cond ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.7 = sext i32 0 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = sext i32 1 to i64
  %.11 = icmp eq i64 %x, %.10
  br i1 %.11, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  %.13 = sext i32 1 to i64
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %.16 = sext i32 2 to i64
  %.17 = sdiv i64 %x, %.16
  br label %while.cond

while.cond:                                       ; preds = %while.body, %ifcont.1
  %y.0 = phi i64 [ %.17, %ifcont.1 ], [ %.30, %while.body ]
  %prev_y.0 = phi i64 [ %x, %ifcont.1 ], [ %y.0, %while.body ]
  %.21 = icmp ne i64 %y.0, %prev_y.0
  %.23 = icmp slt i64 %y.0, %prev_y.0
  %spec.select = select i1 %.21, i1 %.23, i1 false
  br i1 %spec.select, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.27 = sdiv i64 %x, %y.0
  %.28 = add i64 %y.0, %.27
  %.29 = sext i32 2 to i64
  %.30 = sdiv i64 %.28, %.29
  br label %while.cond
}

define i8 @standard__math__sqrt__1__byteE1__ret_byteE1(i8 %x) {
entry:
  %.4 = zext i8 %x to i32
  %.5 = icmp ule i32 %.4, 0
  br i1 %.5, label %then, label %while.cond

common.ret:                                       ; preds = %while.cond, %then
  %common.ret.op = phi i8 [ %.7, %then ], [ %y.0, %while.cond ]
  ret i8 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 0 to i8
  br label %common.ret

while.cond:                                       ; preds = %entry, %while.body
  %y.0 = phi i8 [ %.20, %while.body ], [ %x, %entry ]
  %prev_y.0 = phi i8 [ %y.0, %while.body ], [ 0, %entry ]
  %.13 = icmp ne i8 %y.0, %prev_y.0
  br i1 %.13, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.16 = udiv i8 %x, %y.0
  %.17 = add i8 %y.0, %.16
  %.18 = zext i8 %.17 to i32
  %.19 = udiv i32 %.18, 2
  %.20 = trunc i32 %.19 to i8
  br label %while.cond
}

define i16 @standard__math__sqrt__1__dataE1_ubits16__ret_dataE1_ubits16(i16 %x) {
entry:
  %.4 = zext i16 %x to i32
  %.5 = icmp ule i32 %.4, 0
  br i1 %.5, label %then, label %while.cond

common.ret:                                       ; preds = %while.cond, %then
  %common.ret.op = phi i16 [ %.7, %then ], [ %y.0, %while.cond ]
  ret i16 %common.ret.op

then:                                             ; preds = %entry
  %.7 = trunc i32 0 to i16
  br label %common.ret

while.cond:                                       ; preds = %entry, %while.body
  %y.0 = phi i16 [ %.20, %while.body ], [ %x, %entry ]
  %prev_y.0 = phi i16 [ %y.0, %while.body ], [ 0, %entry ]
  %.13 = icmp ne i16 %y.0, %prev_y.0
  br i1 %.13, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.16 = udiv i16 %x, %y.0
  %.17 = add i16 %y.0, %.16
  %.18 = zext i16 %.17 to i32
  %.19 = udiv i32 %.18, 2
  %.20 = trunc i32 %.19 to i16
  br label %while.cond
}

define i32 @standard__math__sqrt__1__dataE1_ubits32__ret_dataE1_ubits32(i32 %x) {
entry:
  %.4 = icmp ule i32 %x, 0
  br i1 %.4, label %common.ret, label %while.cond

common.ret:                                       ; preds = %while.cond, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %y.0, %while.cond ]
  ret i32 %common.ret.op

while.cond:                                       ; preds = %entry, %while.body
  %y.0 = phi i32 [ %.16, %while.body ], [ %x, %entry ]
  %prev_y.0 = phi i32 [ %y.0, %while.body ], [ 0, %entry ]
  %.11 = icmp ne i32 %y.0, %prev_y.0
  br i1 %.11, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.14 = udiv i32 %x, %y.0
  %.15 = add i32 %y.0, %.14
  %.16 = udiv i32 %.15, 2
  br label %while.cond
}

define i64 @standard__math__sqrt__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %x) {
entry:
  %.4 = zext i32 0 to i64
  %.5 = icmp ule i64 %x, %.4
  br i1 %.5, label %then, label %while.cond

common.ret:                                       ; preds = %while.cond, %then
  %common.ret.op = phi i64 [ %.7, %then ], [ %y.0, %while.cond ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.7 = sext i32 0 to i64
  br label %common.ret

while.cond:                                       ; preds = %entry, %while.body
  %y.0 = phi i64 [ %.19, %while.body ], [ %x, %entry ]
  %prev_y.0 = phi i64 [ %y.0, %while.body ], [ 0, %entry ]
  %.13 = icmp ne i64 %y.0, %prev_y.0
  br i1 %.13, label %while.body, label %common.ret

while.body:                                       ; preds = %while.cond
  %.16 = udiv i64 %x, %y.0
  %.17 = add i64 %y.0, %.16
  %.18 = zext i32 2 to i64
  %.19 = udiv i64 %.17, %.18
  br label %while.cond
}

define float @standard__math__sqrt__1__floatE1__ret_floatE1(float %x) {
entry:
  %.5 = call float asm sideeffect "sqrtss $1, $0", "=x,x"(float %x)
  ret float %.5
}

define double @standard__math__sqrt__1__doubleE1__ret_doubleE1(double %x) {
entry:
  %.5 = call double asm sideeffect "sqrtsd $1, $0", "=x,x"(double %x)
  ret double %.5
}

define double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %r) {
entry:
  %.5 = fmul double %r, %r
  %.7 = fmul double %r, %.5
  %.8 = fsub float 0.000000e+00, 0x3FC5555560000000
  %.9 = fsub float 0.000000e+00, 0x3F2A01A020000000
  %.10 = fsub double 0.000000e+00, 0x3E5AE5E68A2BA852
  %.11 = fmul double %.5, 0x3DE5D93A5ACFD57C
  %.12 = fadd double %.10, %.11
  %.13 = fmul double %.5, %.12
  %.14 = fadd double 0x3EC71DE357B1FE79, %.13
  %.15 = fmul double %.5, %.14
  %float_to_double_lhs = fpext float %.9 to double
  %.16 = fadd double %float_to_double_lhs, %.15
  %.17 = fmul double %.5, %.16
  %float_to_double_lhs.1 = fpext float 0x3F81111120000000 to double
  %.18 = fadd double %float_to_double_lhs.1, %.17
  %.19 = fmul double %.5, %.18
  %float_to_double_lhs.2 = fpext float %.8 to double
  %.20 = fadd double %float_to_double_lhs.2, %.19
  %.21 = fmul double %.7, %.20
  %.22 = fadd double %r, %.21
  ret double %.22
}

define double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %r) {
entry:
  %.5 = fmul double %r, %r
  %.7 = fmul double %.5, 0x3DA8FAE9BE8838D4
  %.8 = fsub double 0x3E21EE9EBDB4B1CD, %.7
  %.9 = fmul double %.5, %.8
  %.10 = fsub double 0x3E927E4F809C52AD, %.9
  %.11 = fmul double %.5, %.10
  %float_to_double_lhs = fpext float 0x3EFA01A020000000 to double
  %.12 = fsub double %float_to_double_lhs, %.11
  %.13 = fmul double %.5, %.12
  %float_to_double_lhs.1 = fpext float 0x3F56C16C20000000 to double
  %.14 = fsub double %float_to_double_lhs.1, %.13
  %.15 = fmul double %.5, %.14
  %float_to_double_lhs.2 = fpext float 0x3FA5555560000000 to double
  %.16 = fsub double %float_to_double_lhs.2, %.15
  %.17 = fmul double %.5, %.16
  %float_to_double_lhs.3 = fpext float 5.000000e-01 to double
  %.18 = fsub double %float_to_double_lhs.3, %.17
  %.19 = fmul double %.5, %.18
  %float_to_double_lhs.4 = fpext float 1.000000e+00 to double
  %.20 = fsub double %float_to_double_lhs.4, %.19
  ret double %.20
}

define double @standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1(double %x, ptr %q) {
entry:
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.6 = fcmp olt double %x, %float_to_double_rhs
  %.8 = fsub double 0.000000e+00, %x
  %x.addr.0 = select i1 %.6, double %.8, double %x
  %.14 = fmul double %x.addr.0, 0x3FE45F306DC9C883
  %float_to_double_rhs.1 = fpext float 5.000000e-01 to double
  %.15 = fadd double %.14, %float_to_double_rhs.1
  %.17 = fptosi double %.15 to i32
  %.19 = sitofp i32 %.17 to double
  %float_to_double_rhs.2 = fpext float 0x3FF921FB60000000 to double
  %.21 = fmul double %.19, %float_to_double_rhs.2
  %.22 = fsub double %x.addr.0, %.21
  %.24 = fmul double %.19, 0x3DD0B4611A626331
  %.25 = fsub double %.22, %.24
  %.27 = fmul double %.19, 0x3B8722074E806E23
  %.28 = fsub double %.25, %.27
  store i32 %.17, ptr %q, align 4
  ret double %.28
}

define double @standard__math__sin__1__doubleE1__ret_doubleE1(double %x) {
entry:
  %q = alloca i32, align 4
  store i32 0, ptr %q, align 4
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.7 = fcmp olt double %x, %float_to_double_rhs
  %.10 = fsub double 0.000000e+00, %x
  %x.addr.0 = select i1 %.7, double %.10, double %x
  %float_to_double_rhs.1 = fpext float 0x3FE921FB60000000 to double
  %.14 = fcmp ole double %x.addr.0, %float_to_double_rhs.1
  br i1 %.14, label %then.1, label %ifcont.1

then.1:                                           ; preds = %entry
  %.16 = call double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %x.addr.0)
  %.19 = fsub double 0.000000e+00, %.16
  %r.0 = select i1 %.7, double %.19, double %.16
  br label %common.ret

ifcont.1:                                         ; preds = %entry
  %.25 = call double @standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1(double %x.addr.0, ptr %q)
  %q.1 = load i32, ptr %q, align 4
  %.27 = and i32 %q.1, 3
  switch i32 %.27, label %ifcont.1.unreachabledefault [
    i32 0, label %switch_case_0
    i32 1, label %switch_case_1
    i32 2, label %switch_case_2
    i32 3, label %switch_default
  ]

common.ret:                                       ; preds = %switch_merge, %then.1
  %common.ret.op = phi double [ %r.0, %then.1 ], [ %r.22, %switch_merge ]
  ret double %common.ret.op

switch_merge:                                     ; preds = %switch_default, %switch_case_2, %switch_case_1, %switch_case_0
  %r.11 = phi double [ %.40, %switch_default ], [ %.29, %switch_case_0 ], [ %.32, %switch_case_1 ], [ %.36, %switch_case_2 ]
  %.44 = fsub double 0.000000e+00, %r.11
  %r.22 = select i1 %.7, double %.44, double %r.11
  br label %common.ret

switch_case_0:                                    ; preds = %ifcont.1
  %.29 = call double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %.25)
  br label %switch_merge

switch_case_1:                                    ; preds = %ifcont.1
  %.32 = call double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %.25)
  br label %switch_merge

switch_case_2:                                    ; preds = %ifcont.1
  %.35 = call double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %.25)
  %.36 = fsub double 0.000000e+00, %.35
  br label %switch_merge

ifcont.1.unreachabledefault:                      ; preds = %ifcont.1
  unreachable

switch_default:                                   ; preds = %ifcont.1
  %.39 = call double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %.25)
  %.40 = fsub double 0.000000e+00, %.39
  br label %switch_merge
}

define double @standard__math__cos__1__doubleE1__ret_doubleE1(double %x) {
entry:
  %q = alloca i32, align 4
  store i32 0, ptr %q, align 4
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.6 = fcmp olt double %x, %float_to_double_rhs
  %.8 = fsub double 0.000000e+00, %x
  %x.addr.0 = select i1 %.6, double %.8, double %x
  %float_to_double_rhs.1 = fpext float 0x3FE921FB60000000 to double
  %.12 = fcmp ole double %x.addr.0, %float_to_double_rhs.1
  br i1 %.12, label %then.1, label %ifcont.1

common.ret:                                       ; preds = %switch_case_0, %switch_case_1, %switch_case_2, %switch_default, %then.1
  %common.ret.op = phi double [ %.14, %then.1 ], [ %.32, %switch_default ], [ %.21, %switch_case_0 ], [ %.25, %switch_case_1 ], [ %.29, %switch_case_2 ]
  ret double %common.ret.op

then.1:                                           ; preds = %entry
  %.14 = call double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %x.addr.0)
  br label %common.ret

ifcont.1:                                         ; preds = %entry
  %.17 = call double @standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1(double %x.addr.0, ptr %q)
  %q.1 = load i32, ptr %q, align 4
  %.19 = and i32 %q.1, 3
  switch i32 %.19, label %ifcont.1.unreachabledefault [
    i32 0, label %switch_case_0
    i32 1, label %switch_case_1
    i32 2, label %switch_case_2
    i32 3, label %switch_default
  ]

switch_case_0:                                    ; preds = %ifcont.1
  %.21 = call double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %.17)
  br label %common.ret

switch_case_1:                                    ; preds = %ifcont.1
  %.24 = call double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %.17)
  %.25 = fsub double 0.000000e+00, %.24
  br label %common.ret

switch_case_2:                                    ; preds = %ifcont.1
  %.28 = call double @standard__math___cos_kernel__1__doubleE1__ret_doubleE1(double %.17)
  %.29 = fsub double 0.000000e+00, %.28
  br label %common.ret

ifcont.1.unreachabledefault:                      ; preds = %ifcont.1
  unreachable

switch_default:                                   ; preds = %ifcont.1
  %.32 = call double @standard__math___sin_kernel__1__doubleE1__ret_doubleE1(double %.17)
  br label %common.ret
}

define float @standard__math__sin__1__floatE1__ret_floatE1(float %x) {
entry:
  %.4 = fpext float %x to double
  %.5 = call double @standard__math__sin__1__doubleE1__ret_doubleE1(double %.4)
  %.6 = fptrunc double %.5 to float
  ret float %.6
}

define float @standard__math__cos__1__floatE1__ret_floatE1(float %x) {
entry:
  %.4 = fpext float %x to double
  %.5 = call double @standard__math__cos__1__doubleE1__ret_doubleE1(double %.4)
  %.6 = fptrunc double %.5 to float
  ret float %.6
}

define float @standard__math__step__2__floatE1__floatE1__ret_floatE1(float %edge, float %x) {
entry:
  %.6 = fcmp oge float %x, %edge
  %. = select i1 %.6, float 1.000000e+00, float 0.000000e+00
  ret float %.
}

define double @standard__math__step__2__doubleE1__doubleE1__ret_doubleE1(double %edge, double %x) {
entry:
  %.6 = fcmp oge double %x, %edge
  %. = select i1 %.6, float 1.000000e+00, float 0.000000e+00
  %.10 = fpext float %. to double
  ret double %.10
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

declare i64 @GetModuleHandleA(ptr)

declare i16 @RegisterClassExA(ptr)

declare i1 @UnregisterClassA(ptr, i64)

declare i64 @CreateWindowExA(i32, ptr, ptr, i32, i32, i32, i32, i32, i64, i64, i64, ptr)

declare i1 @DestroyWindow(i64)

declare i1 @ShowWindow(i64, i32)

declare i1 @UpdateWindow(i64)

declare i1 @SetWindowTextA(i64, ptr)

declare i32 @GetWindowTextA(i64, ptr, i32)

declare i1 @SetWindowPos(i64, i64, i32, i32, i32, i32, i32)

declare i1 @SetForegroundWindow(i64)

declare i1 @BringWindowToTop(i64)

declare i64 @SetFocus(i64)

declare i1 @InvalidateRect(i64, ptr, i1)

declare i1 @GetClientRect(i64, ptr)

declare i1 @GetWindowRect(i64, ptr)

declare i1 @GetMessageA(ptr, i64, i32, i32)

declare i1 @PeekMessageA(ptr, i64, i32, i32, i32)

declare i1 @TranslateMessage(ptr)

declare i64 @DispatchMessageA(ptr)

declare void @PostQuitMessage(i32)

declare i64 @DefWindowProcA(i64, i32, i64, i64)

declare i64 @BeginPaint(i64, ptr)

declare i1 @EndPaint(i64, ptr)

declare i64 @GetDC(i64)

declare i32 @ReleaseDC(i64, i64)

declare i1 @MoveToEx(i64, i32, i32, ptr)

declare i1 @LineTo(i64, i32, i32)

declare i1 @Ellipse(i64, i32, i32, i32, i32)

declare i1 @Rectangle(i64, i32, i32, i32, i32)

declare i32 @FillRect(i64, ptr, i64)

declare i32 @FrameRect(i64, ptr, i64)

declare i32 @SetPixel(i64, i32, i32, i32)

declare i1 @Arc(i64, i32, i32, i32, i32, i32, i32, i32, i32)

declare i1 @Polyline(i64, ptr, i32)

declare i1 @Polygon(i64, ptr, i32)

declare i32 @IntersectClipRect(i64, i32, i32, i32, i32)

declare i32 @SelectClipRgn(i64, i64)

declare i64 @CreatePen(i32, i32, i32)

declare i64 @CreateSolidBrush(i32)

declare i64 @SelectObject(i64, i64)

declare i1 @DeleteObject(i64)

declare i64 @CreateCompatibleDC(i64)

declare i64 @CreateCompatibleBitmap(i64, i32, i32)

declare i1 @BitBlt(i64, i32, i32, i32, i32, i64, i32, i32, i32)

declare i1 @DeleteDC(i64)

declare i32 @SetBkMode(i64, i32)

declare i32 @SetBkColor(i64, i32)

declare i32 @SetTextColor(i64, i32)

declare i1 @TextOutA(i64, i32, i32, ptr, i32)

declare i64 @GetConsoleWindow()

declare i64 @GetStockObject(i32)

declare i1 @GetCursorPos(ptr)

declare i64 @LoadCursorA(i64, ptr)

declare i64 @LoadIconA(i64, ptr)

declare i16 @GetAsyncKeyState(i32)

declare i1 @ScreenToClient(ptr, ptr)

declare i64 @CreateMenu()

declare i64 @CreatePopupMenu()

declare i1 @AppendMenuA(i64, i32, i64, ptr)

declare i1 @SetMenu(i64, i64)

declare i64 @SendMessageA(i64, i32, i64, i64)

declare i32 @GetWindowTextLengthA(i64)

declare i1 @MoveWindow(i64, i32, i32, i32, i32, i1)

declare i32 @MessageBoxA(i64, ptr, ptr, i32)

declare i1 @GetOpenFileNameA(ptr)

declare i1 @GetSaveFileNameA(ptr)

declare i64 @CreateFileA(ptr, i32, i32, ptr, i32, i32, i64)

declare i1 @ReadFile(i64, ptr, i32, ptr, ptr)

declare i1 @WriteFile(i64, ptr, i32, ptr, ptr)

declare i1 @GetFileSizeEx(i64, ptr)

declare i32 @GetSystemMetrics(i32)

declare i1 @FreeConsole()

declare i64 @CreateFontA(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr)

declare i32 @SetWindowTheme(i64, ptr, ptr)

declare i32 @DwmSetWindowAttribute(i64, i32, ptr, i32)

declare i1 @GetTextMetricsA(i64, ptr)

declare i32 @SetScrollInfo(i64, i32, ptr, i1)

declare i1 @GetScrollInfo(i64, i32, ptr)

declare i64 @SetCapture(i64)

declare i1 @ReleaseCapture()

declare i1 @ExtTextOutA(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @DrawTextA(i64, ptr, i32, ptr, i32)

declare i1 @OpenClipboard(i64)

declare i1 @CloseClipboard()

declare i1 @EmptyClipboard()

declare i64 @SetClipboardData(i32, i64)

declare i64 @GetClipboardData(i32)

declare i64 @GlobalAlloc(i32, i64)

declare ptr @GlobalLock(i64)

declare i1 @GlobalUnlock(i64)

declare i64 @GlobalSize(i64)

declare i32 @snprintf(ptr, i64, ptr, i32)

define %standard__math__POINT @standard__vectors__project__5__Vec3E1_ptr1__intE1__intE1__floatE1__floatE1__ret_POINTE1(ptr %v, i32 %cx, i32 %cy, float %fov, float %cam_z) {
entry:
  %z_ptr = getelementptr inbounds %standard__vectors__Vec3, ptr %v, i32 0, i32 2
  %z = load float, ptr %z_ptr, align 4
  %.12 = fadd float %z, %cam_z
  %.15 = fcmp olt float %.12, 0x3F50624DE0000000
  br i1 %.15, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi %standard__math__POINT [ %p.1.fca.1.insert, %then ], [ %p.2.fca.1.insert, %ifcont ]
  ret %standard__math__POINT %common.ret.op

then:                                             ; preds = %entry
  %p.1.fca.0.insert = insertvalue %standard__math__POINT poison, i32 %cx, 0
  %p.1.fca.1.insert = insertvalue %standard__math__POINT %p.1.fca.0.insert, i32 %cy, 1
  br label %common.ret

ifcont:                                           ; preds = %entry
  %x_ptr = getelementptr inbounds %standard__vectors__Vec3, ptr %v, i32 0, i32 0
  %x = load float, ptr %x_ptr, align 4
  %.23 = fmul float %x, %fov
  %.24 = fdiv float %.23, %.12
  %.25 = fptosi float %.24 to i32
  %.26 = add i32 %cx, %.25
  %y_ptr = getelementptr inbounds %standard__vectors__Vec3, ptr %v, i32 0, i32 1
  %y = load float, ptr %y_ptr, align 4
  %.29 = fmul float %y, %fov
  %.30 = fdiv float %.29, %.12
  %.31 = fptosi float %.30 to i32
  %.32 = sub i32 %cy, %.31
  %p.2.fca.0.insert = insertvalue %standard__math__POINT poison, i32 %.26, 0
  %p.2.fca.1.insert = insertvalue %standard__math__POINT %p.2.fca.0.insert, i32 %.32, 1
  br label %common.ret
}

declare i32 @ChoosePixelFormat(i64, ptr)

declare i1 @SetPixelFormat(i64, i32, ptr)

declare i64 @wglCreateContext(i64)

declare i1 @wglMakeCurrent(i64, i64)

declare i1 @wglDeleteContext(i64)

declare ptr @wglGetProcAddress(ptr)

declare i1 @SwapBuffers(i64)

declare void @glEnable(i32)

declare void @glDisable(i32)

declare i8 @glIsEnabled(i32)

declare i32 @glGetError()

declare void @glGetIntegerv(i32, ptr)

declare void @glGetFloatv(i32, ptr)

declare ptr @glGetString(i32)

declare void @glFinish()

declare void @glFlush()

declare void @glClear(i32)

declare void @glClearColor(float, float, float, float)

declare void @glClearDepth(float)

declare void @glClearStencil(i32)

declare void @glViewport(i32, i32, i32, i32)

declare void @glScissor(i32, i32, i32, i32)

declare void @glDepthFunc(i32)

declare void @glDepthMask(i8)

declare void @glDepthRange(float, float)

declare void @glBlendFunc(i32, i32)

declare void @glBlendEquation(i32)

declare void @glCullFace(i32)

declare void @glFrontFace(i32)

declare void @glPolygonMode(i32, i32)

declare void @glPolygonOffset(float, float)

declare void @glLineWidth(float)

declare void @glPointSize(float)

declare void @glColor4f(float, float, float, float)

declare void @glColor3f(float, float, float)

declare void @glColor4ub(i8, i8, i8, i8)

declare void @glShadeModel(i32)

declare void @glMatrixMode(i32)

declare void @glLoadIdentity()

declare void @glLoadMatrixf(ptr)

declare void @glMultMatrixf(ptr)

declare void @glPushMatrix()

declare void @glPopMatrix()

declare void @glTranslatef(float, float, float)

declare void @glRotatef(float, float, float, float)

declare void @glScalef(float, float, float)

declare void @glOrtho(double, double, double, double, double, double)

declare void @glFrustum(float, float, float, float, float, float)

declare void @glBegin(i32)

declare void @glEnd()

declare void @glVertex2f(float, float)

declare void @glVertex3f(float, float, float)

declare void @glVertex4f(float, float, float, float)

declare void @glVertex2i(i32, i32)

declare void @glVertex3i(i32, i32, i32)

declare void @glNormal3f(float, float, float)

declare void @glTexCoord2f(float, float)

declare void @glGenTextures(i32, ptr)

declare void @glDeleteTextures(i32, ptr)

declare void @glBindTexture(i32, i32)

declare void @glTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32, ptr)

declare void @glTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, ptr)

declare void @glTexParameteri(i32, i32, i32)

declare void @glTexParameterf(i32, i32, float)

declare void @glNewList(i32, i32)

declare void @glEndList()

declare void @glCallList(i32)

declare i32 @glGenLists(i32)

declare void @glDeleteLists(i32, i32)

declare void @glStencilFunc(i32, i32, i32)

declare void @glStencilOp(i32, i32, i32)

declare void @glStencilMask(i32)

declare void @glColorMask(i8, i8, i8, i8)

declare void @glReadPixels(i32, i32, i32, i32, i32, i32, ptr)

declare void @glLightfv(i32, i32, ptr)

declare void @glLightf(i32, i32, float)

declare void @glMaterialfv(i32, i32, ptr)

declare void @glMaterialf(i32, i32, float)

define i64 @OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64(i64 %device_context) {
entry:
  %pfd = alloca %PIXELFORMATDESCRIPTOR, align 8
  %.fca.0.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 0
  store i16 0, ptr %.fca.0.gep, align 4
  %.fca.1.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 1
  store i16 0, ptr %.fca.1.gep, align 2
  %.fca.2.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 2
  store i32 0, ptr %.fca.2.gep, align 4
  %.fca.3.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 4
  %.fca.4.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 2
  %.fca.6.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 4
  %.fca.8.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 2
  %.fca.10.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 4
  %.fca.12.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 2
  %.fca.14.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 4
  %.fca.16.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 16
  store i8 0, ptr %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 17
  store i8 0, ptr %.fca.17.gep, align 2
  %.fca.18.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 18
  store i8 0, ptr %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 19
  store i8 0, ptr %.fca.19.gep, align 4
  %.fca.20.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 20
  store i8 0, ptr %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 21
  store i8 0, ptr %.fca.21.gep, align 2
  %.fca.22.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 22
  store i8 0, ptr %.fca.22.gep, align 1
  %.fca.23.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 23
  store i32 0, ptr %.fca.23.gep, align 4
  %.fca.24.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 24
  store i32 0, ptr %.fca.24.gep, align 4
  %.fca.25.gep = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 25
  store i32 0, ptr %.fca.25.gep, align 4
  %.5 = sdiv i32 320, 8
  %.6 = trunc i32 %.5 to i16
  %.7 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 0
  store i16 %.6, ptr %.7, align 2
  %.9 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 1
  %.10 = trunc i32 1 to i16
  store i16 %.10, ptr %.9, align 2
  %PFD_DRAW_TO_WINDOW = load i32, ptr @PFD_DRAW_TO_WINDOW, align 4
  %PFD_SUPPORT_OPENGL = load i32, ptr @PFD_SUPPORT_OPENGL, align 4
  %.12 = or i32 %PFD_DRAW_TO_WINDOW, %PFD_SUPPORT_OPENGL
  %PFD_DOUBLEBUFFER = load i32, ptr @PFD_DOUBLEBUFFER, align 4
  %.13 = or i32 %.12, %PFD_DOUBLEBUFFER
  %.14 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 2
  store i32 %.13, ptr %.14, align 4
  %PFD_TYPE_RGBA = load i8, ptr @PFD_TYPE_RGBA, align 1
  %.16 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 3
  store i8 %PFD_TYPE_RGBA, ptr %.16, align 1
  %.18 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 4
  %.19 = trunc i32 32 to i8
  store i8 %.19, ptr %.18, align 1
  %.21 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 18
  %.22 = trunc i32 24 to i8
  store i8 %.22, ptr %.21, align 1
  %.24 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 19
  %.25 = trunc i32 8 to i8
  store i8 %.25, ptr %.24, align 1
  %PFD_MAIN_PLANE = load i8, ptr @PFD_MAIN_PLANE, align 1
  %.27 = getelementptr inbounds %PIXELFORMATDESCRIPTOR, ptr %pfd, i32 0, i32 21
  store i8 %PFD_MAIN_PLANE, ptr %.27, align 1
  %.29 = call i32 @ChoosePixelFormat(i64 %device_context, ptr %pfd)
  %.31 = call i1 @SetPixelFormat(i64 %device_context, i32 %.29, ptr %pfd)
  %.32 = call i64 @wglCreateContext(i64 %device_context)
  %.34 = call i1 @wglMakeCurrent(i64 %device_context, i64 %.32)
  ret i64 %.32
}

define void @OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1(i64 %device_context) {
entry:
  %.4 = call i1 @SwapBuffers(i64 %device_context)
  ret void
}

define i32 @OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1(i32 %shader_type, ptr %src) {
entry:
  %glCreateShader_fp = load ptr, ptr @glCreateShader_fp, align 8
  %fp_call = call i32 %glCreateShader_fp(i32 %shader_type)
  %src_arr = alloca [1 x ptr], align 8
  %elem_0 = getelementptr [1 x ptr], ptr %src_arr, i32 0, i32 0
  store ptr %src, ptr %elem_0, align 8
  %len_arr = alloca [1 x i32], align 4
  %.8 = sub i32 0, 1
  %elem_0.1 = getelementptr [1 x i32], ptr %len_arr, i32 0, i32 0
  store i32 %.8, ptr %elem_0.1, align 4
  %glShaderSource_fp = load ptr, ptr @glShaderSource_fp, align 8
  %.10 = getelementptr inbounds [1 x ptr], ptr %src_arr, i32 0, i32 0
  %.11 = getelementptr inbounds [1 x i32], ptr %len_arr, i32 0, i32 0
  call void %glShaderSource_fp(i32 %fp_call, i32 1, ptr %.10, ptr %.11)
  %glCompileShader_fp = load ptr, ptr @glCompileShader_fp, align 8
  call void %glCompileShader_fp(i32 %fp_call)
  ret i32 %fp_call
}

define i32 @OpenGL__link_program__2__intE1__intE1__ret_intE1(i32 %vert, i32 %frag) {
entry:
  %glCreateProgram_fp = load ptr, ptr @glCreateProgram_fp, align 8
  %fp_call = call i32 %glCreateProgram_fp()
  %glAttachShader_fp = load ptr, ptr @glAttachShader_fp, align 8
  call void %glAttachShader_fp(i32 %fp_call, i32 %vert)
  %glAttachShader_fp.1 = load ptr, ptr @glAttachShader_fp, align 8
  call void %glAttachShader_fp.1(i32 %fp_call, i32 %frag)
  %glLinkProgram_fp = load ptr, ptr @glLinkProgram_fp, align 8
  call void %glLinkProgram_fp(i32 %fp_call)
  ret i32 %fp_call
}

define void @OpenGL__gl_load_extensions__0__ret_voidE1() {
entry:
  %str_stack = alloca [13 x i8], align 1
  %str_char_0 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 0
  store i8 103, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 1
  store i8 108, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 2
  store i8 71, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 3
  store i8 101, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 4
  store i8 110, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 5
  store i8 66, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 6
  store i8 117, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 7
  store i8 102, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 8
  store i8 102, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 9
  store i8 101, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 10
  store i8 114, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 11
  store i8 115, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 12
  store i8 0, ptr %str_char_12, align 1
  %arg0_decay = getelementptr [13 x i8], ptr %str_stack, i32 0, i32 0
  %.15 = call ptr @wglGetProcAddress(ptr %arg0_decay)
  store ptr %.15, ptr @OpenGL___glGenBuffers, align 8
  %str_stack.1 = alloca [16 x i8], align 1
  %str_char_0.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 103, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 108, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 68, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 101, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 108, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 101, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 116, ptr %str_char_6.1, align 1
  %str_char_7.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 7
  store i8 101, ptr %str_char_7.1, align 1
  %str_char_8.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 8
  store i8 66, ptr %str_char_8.1, align 1
  %str_char_9.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 9
  store i8 117, ptr %str_char_9.1, align 1
  %str_char_10.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 10
  store i8 102, ptr %str_char_10.1, align 1
  %str_char_11.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 11
  store i8 102, ptr %str_char_11.1, align 1
  %str_char_12.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 12
  store i8 101, ptr %str_char_12.1, align 1
  %str_char_13 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 13
  store i8 114, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 14
  store i8 115, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 15
  store i8 0, ptr %str_char_15, align 1
  %arg0_decay.1 = getelementptr [16 x i8], ptr %str_stack.1, i32 0, i32 0
  %.33 = call ptr @wglGetProcAddress(ptr %arg0_decay.1)
  store ptr %.33, ptr @OpenGL___glDeleteBuffers, align 8
  %str_stack.2 = alloca [13 x i8], align 1
  %str_char_0.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 103, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 108, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 66, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 105, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 110, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 100, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 66, ptr %str_char_6.2, align 1
  %str_char_7.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 7
  store i8 117, ptr %str_char_7.2, align 1
  %str_char_8.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 8
  store i8 102, ptr %str_char_8.2, align 1
  %str_char_9.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 9
  store i8 102, ptr %str_char_9.2, align 1
  %str_char_10.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 10
  store i8 101, ptr %str_char_10.2, align 1
  %str_char_11.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 11
  store i8 114, ptr %str_char_11.2, align 1
  %str_char_12.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 12
  store i8 0, ptr %str_char_12.2, align 1
  %arg0_decay.2 = getelementptr [13 x i8], ptr %str_stack.2, i32 0, i32 0
  %.48 = call ptr @wglGetProcAddress(ptr %arg0_decay.2)
  store ptr %.48, ptr @OpenGL___glBindBuffer, align 8
  %str_stack.3 = alloca [13 x i8], align 1
  %str_char_0.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 103, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 108, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 66, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 117, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 102, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 102, ptr %str_char_5.3, align 1
  %str_char_6.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 6
  store i8 101, ptr %str_char_6.3, align 1
  %str_char_7.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 7
  store i8 114, ptr %str_char_7.3, align 1
  %str_char_8.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 8
  store i8 68, ptr %str_char_8.3, align 1
  %str_char_9.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 9
  store i8 97, ptr %str_char_9.3, align 1
  %str_char_10.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 10
  store i8 116, ptr %str_char_10.3, align 1
  %str_char_11.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 11
  store i8 97, ptr %str_char_11.3, align 1
  %str_char_12.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 12
  store i8 0, ptr %str_char_12.3, align 1
  %arg0_decay.3 = getelementptr [13 x i8], ptr %str_stack.3, i32 0, i32 0
  %.63 = call ptr @wglGetProcAddress(ptr %arg0_decay.3)
  store ptr %.63, ptr @OpenGL___glBufferData, align 8
  %str_stack.4 = alloca [16 x i8], align 1
  %str_char_0.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 0
  store i8 103, ptr %str_char_0.4, align 1
  %str_char_1.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 1
  store i8 108, ptr %str_char_1.4, align 1
  %str_char_2.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 2
  store i8 66, ptr %str_char_2.4, align 1
  %str_char_3.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 3
  store i8 117, ptr %str_char_3.4, align 1
  %str_char_4.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 4
  store i8 102, ptr %str_char_4.4, align 1
  %str_char_5.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 5
  store i8 102, ptr %str_char_5.4, align 1
  %str_char_6.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 6
  store i8 101, ptr %str_char_6.4, align 1
  %str_char_7.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 7
  store i8 114, ptr %str_char_7.4, align 1
  %str_char_8.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 8
  store i8 83, ptr %str_char_8.4, align 1
  %str_char_9.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 9
  store i8 117, ptr %str_char_9.4, align 1
  %str_char_10.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 10
  store i8 98, ptr %str_char_10.4, align 1
  %str_char_11.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 11
  store i8 68, ptr %str_char_11.4, align 1
  %str_char_12.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 12
  store i8 97, ptr %str_char_12.4, align 1
  %str_char_13.1 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 13
  store i8 116, ptr %str_char_13.1, align 1
  %str_char_14.1 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 14
  store i8 97, ptr %str_char_14.1, align 1
  %str_char_15.1 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 15
  store i8 0, ptr %str_char_15.1, align 1
  %arg0_decay.4 = getelementptr [16 x i8], ptr %str_stack.4, i32 0, i32 0
  %.81 = call ptr @wglGetProcAddress(ptr %arg0_decay.4)
  store ptr %.81, ptr @OpenGL___glBufferSubData, align 8
  %str_stack.5 = alloca [12 x i8], align 1
  %str_char_0.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 0
  store i8 103, ptr %str_char_0.5, align 1
  %str_char_1.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 1
  store i8 108, ptr %str_char_1.5, align 1
  %str_char_2.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 2
  store i8 77, ptr %str_char_2.5, align 1
  %str_char_3.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 3
  store i8 97, ptr %str_char_3.5, align 1
  %str_char_4.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 4
  store i8 112, ptr %str_char_4.5, align 1
  %str_char_5.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 5
  store i8 66, ptr %str_char_5.5, align 1
  %str_char_6.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 6
  store i8 117, ptr %str_char_6.5, align 1
  %str_char_7.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 7
  store i8 102, ptr %str_char_7.5, align 1
  %str_char_8.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 8
  store i8 102, ptr %str_char_8.5, align 1
  %str_char_9.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 9
  store i8 101, ptr %str_char_9.5, align 1
  %str_char_10.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 10
  store i8 114, ptr %str_char_10.5, align 1
  %str_char_11.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 11
  store i8 0, ptr %str_char_11.5, align 1
  %arg0_decay.5 = getelementptr [12 x i8], ptr %str_stack.5, i32 0, i32 0
  %.95 = call ptr @wglGetProcAddress(ptr %arg0_decay.5)
  store ptr %.95, ptr @OpenGL___glMapBuffer, align 8
  %str_stack.6 = alloca [14 x i8], align 1
  %str_char_0.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 0
  store i8 103, ptr %str_char_0.6, align 1
  %str_char_1.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 1
  store i8 108, ptr %str_char_1.6, align 1
  %str_char_2.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 2
  store i8 85, ptr %str_char_2.6, align 1
  %str_char_3.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 3
  store i8 110, ptr %str_char_3.6, align 1
  %str_char_4.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 4
  store i8 109, ptr %str_char_4.6, align 1
  %str_char_5.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 5
  store i8 97, ptr %str_char_5.6, align 1
  %str_char_6.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 6
  store i8 112, ptr %str_char_6.6, align 1
  %str_char_7.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 7
  store i8 66, ptr %str_char_7.6, align 1
  %str_char_8.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 8
  store i8 117, ptr %str_char_8.6, align 1
  %str_char_9.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 9
  store i8 102, ptr %str_char_9.6, align 1
  %str_char_10.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 10
  store i8 102, ptr %str_char_10.6, align 1
  %str_char_11.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 11
  store i8 101, ptr %str_char_11.6, align 1
  %str_char_12.5 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 12
  store i8 114, ptr %str_char_12.5, align 1
  %str_char_13.2 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 13
  store i8 0, ptr %str_char_13.2, align 1
  %arg0_decay.6 = getelementptr [14 x i8], ptr %str_stack.6, i32 0, i32 0
  %.111 = call ptr @wglGetProcAddress(ptr %arg0_decay.6)
  store ptr %.111, ptr @OpenGL___glUnmapBuffer, align 8
  %str_stack.7 = alloca [18 x i8], align 1
  %str_char_0.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 0
  store i8 103, ptr %str_char_0.7, align 1
  %str_char_1.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 1
  store i8 108, ptr %str_char_1.7, align 1
  %str_char_2.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 2
  store i8 71, ptr %str_char_2.7, align 1
  %str_char_3.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 3
  store i8 101, ptr %str_char_3.7, align 1
  %str_char_4.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 4
  store i8 110, ptr %str_char_4.7, align 1
  %str_char_5.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 5
  store i8 86, ptr %str_char_5.7, align 1
  %str_char_6.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 6
  store i8 101, ptr %str_char_6.7, align 1
  %str_char_7.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 7
  store i8 114, ptr %str_char_7.7, align 1
  %str_char_8.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 8
  store i8 116, ptr %str_char_8.7, align 1
  %str_char_9.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 9
  store i8 101, ptr %str_char_9.7, align 1
  %str_char_10.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 10
  store i8 120, ptr %str_char_10.7, align 1
  %str_char_11.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 11
  store i8 65, ptr %str_char_11.7, align 1
  %str_char_12.6 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 12
  store i8 114, ptr %str_char_12.6, align 1
  %str_char_13.3 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 13
  store i8 114, ptr %str_char_13.3, align 1
  %str_char_14.2 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 14
  store i8 97, ptr %str_char_14.2, align 1
  %str_char_15.2 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 15
  store i8 121, ptr %str_char_15.2, align 1
  %str_char_16 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 16
  store i8 115, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 17
  store i8 0, ptr %str_char_17, align 1
  %arg0_decay.7 = getelementptr [18 x i8], ptr %str_stack.7, i32 0, i32 0
  %.131 = call ptr @wglGetProcAddress(ptr %arg0_decay.7)
  store ptr %.131, ptr @OpenGL___glGenVertexArrays, align 8
  %str_stack.8 = alloca [21 x i8], align 1
  %str_char_0.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 0
  store i8 103, ptr %str_char_0.8, align 1
  %str_char_1.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 1
  store i8 108, ptr %str_char_1.8, align 1
  %str_char_2.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 2
  store i8 68, ptr %str_char_2.8, align 1
  %str_char_3.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 3
  store i8 101, ptr %str_char_3.8, align 1
  %str_char_4.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 4
  store i8 108, ptr %str_char_4.8, align 1
  %str_char_5.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 5
  store i8 101, ptr %str_char_5.8, align 1
  %str_char_6.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 6
  store i8 116, ptr %str_char_6.8, align 1
  %str_char_7.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 7
  store i8 101, ptr %str_char_7.8, align 1
  %str_char_8.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 8
  store i8 86, ptr %str_char_8.8, align 1
  %str_char_9.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 9
  store i8 101, ptr %str_char_9.8, align 1
  %str_char_10.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 10
  store i8 114, ptr %str_char_10.8, align 1
  %str_char_11.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 11
  store i8 116, ptr %str_char_11.8, align 1
  %str_char_12.7 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 12
  store i8 101, ptr %str_char_12.7, align 1
  %str_char_13.4 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 13
  store i8 120, ptr %str_char_13.4, align 1
  %str_char_14.3 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 14
  store i8 65, ptr %str_char_14.3, align 1
  %str_char_15.3 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 15
  store i8 114, ptr %str_char_15.3, align 1
  %str_char_16.1 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 16
  store i8 114, ptr %str_char_16.1, align 1
  %str_char_17.1 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 17
  store i8 97, ptr %str_char_17.1, align 1
  %str_char_18 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 18
  store i8 121, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 19
  store i8 115, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 20
  store i8 0, ptr %str_char_20, align 1
  %arg0_decay.8 = getelementptr [21 x i8], ptr %str_stack.8, i32 0, i32 0
  %.154 = call ptr @wglGetProcAddress(ptr %arg0_decay.8)
  store ptr %.154, ptr @OpenGL___glDeleteVertexArrays, align 8
  %str_stack.9 = alloca [18 x i8], align 1
  %str_char_0.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 0
  store i8 103, ptr %str_char_0.9, align 1
  %str_char_1.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 1
  store i8 108, ptr %str_char_1.9, align 1
  %str_char_2.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 2
  store i8 66, ptr %str_char_2.9, align 1
  %str_char_3.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 3
  store i8 105, ptr %str_char_3.9, align 1
  %str_char_4.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 4
  store i8 110, ptr %str_char_4.9, align 1
  %str_char_5.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 5
  store i8 100, ptr %str_char_5.9, align 1
  %str_char_6.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 6
  store i8 86, ptr %str_char_6.9, align 1
  %str_char_7.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 7
  store i8 101, ptr %str_char_7.9, align 1
  %str_char_8.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 8
  store i8 114, ptr %str_char_8.9, align 1
  %str_char_9.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 9
  store i8 116, ptr %str_char_9.9, align 1
  %str_char_10.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 10
  store i8 101, ptr %str_char_10.9, align 1
  %str_char_11.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 11
  store i8 120, ptr %str_char_11.9, align 1
  %str_char_12.8 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 12
  store i8 65, ptr %str_char_12.8, align 1
  %str_char_13.5 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 13
  store i8 114, ptr %str_char_13.5, align 1
  %str_char_14.4 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 14
  store i8 114, ptr %str_char_14.4, align 1
  %str_char_15.4 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 15
  store i8 97, ptr %str_char_15.4, align 1
  %str_char_16.2 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 16
  store i8 121, ptr %str_char_16.2, align 1
  %str_char_17.2 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 17
  store i8 0, ptr %str_char_17.2, align 1
  %arg0_decay.9 = getelementptr [18 x i8], ptr %str_stack.9, i32 0, i32 0
  %.174 = call ptr @wglGetProcAddress(ptr %arg0_decay.9)
  store ptr %.174, ptr @OpenGL___glBindVertexArray, align 8
  %str_stack.10 = alloca [26 x i8], align 1
  %str_char_0.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 0
  store i8 103, ptr %str_char_0.10, align 1
  %str_char_1.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 1
  store i8 108, ptr %str_char_1.10, align 1
  %str_char_2.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 2
  store i8 69, ptr %str_char_2.10, align 1
  %str_char_3.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 3
  store i8 110, ptr %str_char_3.10, align 1
  %str_char_4.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 4
  store i8 97, ptr %str_char_4.10, align 1
  %str_char_5.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 5
  store i8 98, ptr %str_char_5.10, align 1
  %str_char_6.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 6
  store i8 108, ptr %str_char_6.10, align 1
  %str_char_7.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 7
  store i8 101, ptr %str_char_7.10, align 1
  %str_char_8.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 8
  store i8 86, ptr %str_char_8.10, align 1
  %str_char_9.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 9
  store i8 101, ptr %str_char_9.10, align 1
  %str_char_10.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 10
  store i8 114, ptr %str_char_10.10, align 1
  %str_char_11.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 11
  store i8 116, ptr %str_char_11.10, align 1
  %str_char_12.9 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 12
  store i8 101, ptr %str_char_12.9, align 1
  %str_char_13.6 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 13
  store i8 120, ptr %str_char_13.6, align 1
  %str_char_14.5 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 14
  store i8 65, ptr %str_char_14.5, align 1
  %str_char_15.5 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 15
  store i8 116, ptr %str_char_15.5, align 1
  %str_char_16.3 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 16
  store i8 116, ptr %str_char_16.3, align 1
  %str_char_17.3 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 17
  store i8 114, ptr %str_char_17.3, align 1
  %str_char_18.1 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 18
  store i8 105, ptr %str_char_18.1, align 1
  %str_char_19.1 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 19
  store i8 98, ptr %str_char_19.1, align 1
  %str_char_20.1 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 20
  store i8 65, ptr %str_char_20.1, align 1
  %str_char_21 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 21
  store i8 114, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 22
  store i8 114, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 23
  store i8 97, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 24
  store i8 121, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 25
  store i8 0, ptr %str_char_25, align 1
  %arg0_decay.10 = getelementptr [26 x i8], ptr %str_stack.10, i32 0, i32 0
  %.202 = call ptr @wglGetProcAddress(ptr %arg0_decay.10)
  store ptr %.202, ptr @OpenGL___glEnableVertexAttribArray, align 8
  %str_stack.11 = alloca [27 x i8], align 1
  %str_char_0.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 0
  store i8 103, ptr %str_char_0.11, align 1
  %str_char_1.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 1
  store i8 108, ptr %str_char_1.11, align 1
  %str_char_2.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 2
  store i8 68, ptr %str_char_2.11, align 1
  %str_char_3.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 3
  store i8 105, ptr %str_char_3.11, align 1
  %str_char_4.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 4
  store i8 115, ptr %str_char_4.11, align 1
  %str_char_5.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 5
  store i8 97, ptr %str_char_5.11, align 1
  %str_char_6.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 6
  store i8 98, ptr %str_char_6.11, align 1
  %str_char_7.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 7
  store i8 108, ptr %str_char_7.11, align 1
  %str_char_8.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 8
  store i8 101, ptr %str_char_8.11, align 1
  %str_char_9.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 9
  store i8 86, ptr %str_char_9.11, align 1
  %str_char_10.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 10
  store i8 101, ptr %str_char_10.11, align 1
  %str_char_11.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 11
  store i8 114, ptr %str_char_11.11, align 1
  %str_char_12.10 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 12
  store i8 116, ptr %str_char_12.10, align 1
  %str_char_13.7 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 13
  store i8 101, ptr %str_char_13.7, align 1
  %str_char_14.6 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 14
  store i8 120, ptr %str_char_14.6, align 1
  %str_char_15.6 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 15
  store i8 65, ptr %str_char_15.6, align 1
  %str_char_16.4 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 16
  store i8 116, ptr %str_char_16.4, align 1
  %str_char_17.4 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 17
  store i8 116, ptr %str_char_17.4, align 1
  %str_char_18.2 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 18
  store i8 114, ptr %str_char_18.2, align 1
  %str_char_19.2 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 19
  store i8 105, ptr %str_char_19.2, align 1
  %str_char_20.2 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 20
  store i8 98, ptr %str_char_20.2, align 1
  %str_char_21.1 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 21
  store i8 65, ptr %str_char_21.1, align 1
  %str_char_22.1 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 22
  store i8 114, ptr %str_char_22.1, align 1
  %str_char_23.1 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 23
  store i8 114, ptr %str_char_23.1, align 1
  %str_char_24.1 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 24
  store i8 97, ptr %str_char_24.1, align 1
  %str_char_25.1 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 25
  store i8 121, ptr %str_char_25.1, align 1
  %str_char_26 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 26
  store i8 0, ptr %str_char_26, align 1
  %arg0_decay.11 = getelementptr [27 x i8], ptr %str_stack.11, i32 0, i32 0
  %.231 = call ptr @wglGetProcAddress(ptr %arg0_decay.11)
  store ptr %.231, ptr @OpenGL___glDisableVertexAttribArray, align 8
  %str_stack.12 = alloca [22 x i8], align 1
  %str_char_0.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 0
  store i8 103, ptr %str_char_0.12, align 1
  %str_char_1.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 1
  store i8 108, ptr %str_char_1.12, align 1
  %str_char_2.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 2
  store i8 86, ptr %str_char_2.12, align 1
  %str_char_3.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 3
  store i8 101, ptr %str_char_3.12, align 1
  %str_char_4.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 4
  store i8 114, ptr %str_char_4.12, align 1
  %str_char_5.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 5
  store i8 116, ptr %str_char_5.12, align 1
  %str_char_6.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 6
  store i8 101, ptr %str_char_6.12, align 1
  %str_char_7.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 7
  store i8 120, ptr %str_char_7.12, align 1
  %str_char_8.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 8
  store i8 65, ptr %str_char_8.12, align 1
  %str_char_9.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 9
  store i8 116, ptr %str_char_9.12, align 1
  %str_char_10.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 10
  store i8 116, ptr %str_char_10.12, align 1
  %str_char_11.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 11
  store i8 114, ptr %str_char_11.12, align 1
  %str_char_12.11 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 12
  store i8 105, ptr %str_char_12.11, align 1
  %str_char_13.8 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 13
  store i8 98, ptr %str_char_13.8, align 1
  %str_char_14.7 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 14
  store i8 80, ptr %str_char_14.7, align 1
  %str_char_15.7 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 15
  store i8 111, ptr %str_char_15.7, align 1
  %str_char_16.5 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 16
  store i8 105, ptr %str_char_16.5, align 1
  %str_char_17.5 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 17
  store i8 110, ptr %str_char_17.5, align 1
  %str_char_18.3 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 18
  store i8 116, ptr %str_char_18.3, align 1
  %str_char_19.3 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 19
  store i8 101, ptr %str_char_19.3, align 1
  %str_char_20.3 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 20
  store i8 114, ptr %str_char_20.3, align 1
  %str_char_21.2 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 21
  store i8 0, ptr %str_char_21.2, align 1
  %arg0_decay.12 = getelementptr [22 x i8], ptr %str_stack.12, i32 0, i32 0
  %.255 = call ptr @wglGetProcAddress(ptr %arg0_decay.12)
  store ptr %.255, ptr @OpenGL___glVertexAttribPointer, align 8
  %str_stack.13 = alloca [15 x i8], align 1
  %str_char_0.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 0
  store i8 103, ptr %str_char_0.13, align 1
  %str_char_1.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 1
  store i8 108, ptr %str_char_1.13, align 1
  %str_char_2.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 2
  store i8 67, ptr %str_char_2.13, align 1
  %str_char_3.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 3
  store i8 114, ptr %str_char_3.13, align 1
  %str_char_4.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 4
  store i8 101, ptr %str_char_4.13, align 1
  %str_char_5.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 5
  store i8 97, ptr %str_char_5.13, align 1
  %str_char_6.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 6
  store i8 116, ptr %str_char_6.13, align 1
  %str_char_7.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 7
  store i8 101, ptr %str_char_7.13, align 1
  %str_char_8.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 8
  store i8 83, ptr %str_char_8.13, align 1
  %str_char_9.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 9
  store i8 104, ptr %str_char_9.13, align 1
  %str_char_10.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 10
  store i8 97, ptr %str_char_10.13, align 1
  %str_char_11.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 11
  store i8 100, ptr %str_char_11.13, align 1
  %str_char_12.12 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 12
  store i8 101, ptr %str_char_12.12, align 1
  %str_char_13.9 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 13
  store i8 114, ptr %str_char_13.9, align 1
  %str_char_14.8 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 14
  store i8 0, ptr %str_char_14.8, align 1
  %arg0_decay.13 = getelementptr [15 x i8], ptr %str_stack.13, i32 0, i32 0
  %.272 = call ptr @wglGetProcAddress(ptr %arg0_decay.13)
  store ptr %.272, ptr @OpenGL___glCreateShader, align 8
  %str_stack.14 = alloca [15 x i8], align 1
  %str_char_0.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 0
  store i8 103, ptr %str_char_0.14, align 1
  %str_char_1.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 1
  store i8 108, ptr %str_char_1.14, align 1
  %str_char_2.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 2
  store i8 68, ptr %str_char_2.14, align 1
  %str_char_3.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 3
  store i8 101, ptr %str_char_3.14, align 1
  %str_char_4.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 4
  store i8 108, ptr %str_char_4.14, align 1
  %str_char_5.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 5
  store i8 101, ptr %str_char_5.14, align 1
  %str_char_6.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 6
  store i8 116, ptr %str_char_6.14, align 1
  %str_char_7.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 7
  store i8 101, ptr %str_char_7.14, align 1
  %str_char_8.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 8
  store i8 83, ptr %str_char_8.14, align 1
  %str_char_9.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 9
  store i8 104, ptr %str_char_9.14, align 1
  %str_char_10.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 10
  store i8 97, ptr %str_char_10.14, align 1
  %str_char_11.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 11
  store i8 100, ptr %str_char_11.14, align 1
  %str_char_12.13 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 12
  store i8 101, ptr %str_char_12.13, align 1
  %str_char_13.10 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 13
  store i8 114, ptr %str_char_13.10, align 1
  %str_char_14.9 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 14
  store i8 0, ptr %str_char_14.9, align 1
  %arg0_decay.14 = getelementptr [15 x i8], ptr %str_stack.14, i32 0, i32 0
  %.289 = call ptr @wglGetProcAddress(ptr %arg0_decay.14)
  store ptr %.289, ptr @OpenGL___glDeleteShader, align 8
  %str_stack.15 = alloca [15 x i8], align 1
  %str_char_0.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 0
  store i8 103, ptr %str_char_0.15, align 1
  %str_char_1.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 1
  store i8 108, ptr %str_char_1.15, align 1
  %str_char_2.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 2
  store i8 83, ptr %str_char_2.15, align 1
  %str_char_3.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 3
  store i8 104, ptr %str_char_3.15, align 1
  %str_char_4.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 4
  store i8 97, ptr %str_char_4.15, align 1
  %str_char_5.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 5
  store i8 100, ptr %str_char_5.15, align 1
  %str_char_6.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 6
  store i8 101, ptr %str_char_6.15, align 1
  %str_char_7.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 7
  store i8 114, ptr %str_char_7.15, align 1
  %str_char_8.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 8
  store i8 83, ptr %str_char_8.15, align 1
  %str_char_9.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 9
  store i8 111, ptr %str_char_9.15, align 1
  %str_char_10.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 10
  store i8 117, ptr %str_char_10.15, align 1
  %str_char_11.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 11
  store i8 114, ptr %str_char_11.15, align 1
  %str_char_12.14 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 12
  store i8 99, ptr %str_char_12.14, align 1
  %str_char_13.11 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 13
  store i8 101, ptr %str_char_13.11, align 1
  %str_char_14.10 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 14
  store i8 0, ptr %str_char_14.10, align 1
  %arg0_decay.15 = getelementptr [15 x i8], ptr %str_stack.15, i32 0, i32 0
  %.306 = call ptr @wglGetProcAddress(ptr %arg0_decay.15)
  store ptr %.306, ptr @OpenGL___glShaderSource, align 8
  %str_stack.16 = alloca [16 x i8], align 1
  %str_char_0.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 0
  store i8 103, ptr %str_char_0.16, align 1
  %str_char_1.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 1
  store i8 108, ptr %str_char_1.16, align 1
  %str_char_2.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 2
  store i8 67, ptr %str_char_2.16, align 1
  %str_char_3.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 3
  store i8 111, ptr %str_char_3.16, align 1
  %str_char_4.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 4
  store i8 109, ptr %str_char_4.16, align 1
  %str_char_5.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 5
  store i8 112, ptr %str_char_5.16, align 1
  %str_char_6.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 6
  store i8 105, ptr %str_char_6.16, align 1
  %str_char_7.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 7
  store i8 108, ptr %str_char_7.16, align 1
  %str_char_8.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 8
  store i8 101, ptr %str_char_8.16, align 1
  %str_char_9.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 9
  store i8 83, ptr %str_char_9.16, align 1
  %str_char_10.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 10
  store i8 104, ptr %str_char_10.16, align 1
  %str_char_11.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 11
  store i8 97, ptr %str_char_11.16, align 1
  %str_char_12.15 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 12
  store i8 100, ptr %str_char_12.15, align 1
  %str_char_13.12 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 13
  store i8 101, ptr %str_char_13.12, align 1
  %str_char_14.11 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 14
  store i8 114, ptr %str_char_14.11, align 1
  %str_char_15.8 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 15
  store i8 0, ptr %str_char_15.8, align 1
  %arg0_decay.16 = getelementptr [16 x i8], ptr %str_stack.16, i32 0, i32 0
  %.324 = call ptr @wglGetProcAddress(ptr %arg0_decay.16)
  store ptr %.324, ptr @OpenGL___glCompileShader, align 8
  %str_stack.17 = alloca [14 x i8], align 1
  %str_char_0.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 0
  store i8 103, ptr %str_char_0.17, align 1
  %str_char_1.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 1
  store i8 108, ptr %str_char_1.17, align 1
  %str_char_2.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 2
  store i8 71, ptr %str_char_2.17, align 1
  %str_char_3.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 3
  store i8 101, ptr %str_char_3.17, align 1
  %str_char_4.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 4
  store i8 116, ptr %str_char_4.17, align 1
  %str_char_5.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 5
  store i8 83, ptr %str_char_5.17, align 1
  %str_char_6.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 6
  store i8 104, ptr %str_char_6.17, align 1
  %str_char_7.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 7
  store i8 97, ptr %str_char_7.17, align 1
  %str_char_8.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 8
  store i8 100, ptr %str_char_8.17, align 1
  %str_char_9.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 9
  store i8 101, ptr %str_char_9.17, align 1
  %str_char_10.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 10
  store i8 114, ptr %str_char_10.17, align 1
  %str_char_11.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 11
  store i8 105, ptr %str_char_11.17, align 1
  %str_char_12.16 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 12
  store i8 118, ptr %str_char_12.16, align 1
  %str_char_13.13 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 13
  store i8 0, ptr %str_char_13.13, align 1
  %arg0_decay.17 = getelementptr [14 x i8], ptr %str_stack.17, i32 0, i32 0
  %.340 = call ptr @wglGetProcAddress(ptr %arg0_decay.17)
  store ptr %.340, ptr @OpenGL___glGetShaderiv, align 8
  %str_stack.18 = alloca [19 x i8], align 1
  %str_char_0.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 0
  store i8 103, ptr %str_char_0.18, align 1
  %str_char_1.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 1
  store i8 108, ptr %str_char_1.18, align 1
  %str_char_2.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 2
  store i8 71, ptr %str_char_2.18, align 1
  %str_char_3.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 3
  store i8 101, ptr %str_char_3.18, align 1
  %str_char_4.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 4
  store i8 116, ptr %str_char_4.18, align 1
  %str_char_5.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 5
  store i8 83, ptr %str_char_5.18, align 1
  %str_char_6.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 6
  store i8 104, ptr %str_char_6.18, align 1
  %str_char_7.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 7
  store i8 97, ptr %str_char_7.18, align 1
  %str_char_8.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 8
  store i8 100, ptr %str_char_8.18, align 1
  %str_char_9.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 9
  store i8 101, ptr %str_char_9.18, align 1
  %str_char_10.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 10
  store i8 114, ptr %str_char_10.18, align 1
  %str_char_11.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 11
  store i8 73, ptr %str_char_11.18, align 1
  %str_char_12.17 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 12
  store i8 110, ptr %str_char_12.17, align 1
  %str_char_13.14 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 13
  store i8 102, ptr %str_char_13.14, align 1
  %str_char_14.12 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 14
  store i8 111, ptr %str_char_14.12, align 1
  %str_char_15.9 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 15
  store i8 76, ptr %str_char_15.9, align 1
  %str_char_16.6 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 16
  store i8 111, ptr %str_char_16.6, align 1
  %str_char_17.6 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 17
  store i8 103, ptr %str_char_17.6, align 1
  %str_char_18.4 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 18
  store i8 0, ptr %str_char_18.4, align 1
  %arg0_decay.18 = getelementptr [19 x i8], ptr %str_stack.18, i32 0, i32 0
  %.361 = call ptr @wglGetProcAddress(ptr %arg0_decay.18)
  store ptr %.361, ptr @OpenGL___glGetShaderInfoLog, align 8
  %str_stack.19 = alloca [16 x i8], align 1
  %str_char_0.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 0
  store i8 103, ptr %str_char_0.19, align 1
  %str_char_1.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 1
  store i8 108, ptr %str_char_1.19, align 1
  %str_char_2.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 2
  store i8 67, ptr %str_char_2.19, align 1
  %str_char_3.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 3
  store i8 114, ptr %str_char_3.19, align 1
  %str_char_4.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 4
  store i8 101, ptr %str_char_4.19, align 1
  %str_char_5.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 5
  store i8 97, ptr %str_char_5.19, align 1
  %str_char_6.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 6
  store i8 116, ptr %str_char_6.19, align 1
  %str_char_7.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 7
  store i8 101, ptr %str_char_7.19, align 1
  %str_char_8.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 8
  store i8 80, ptr %str_char_8.19, align 1
  %str_char_9.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 9
  store i8 114, ptr %str_char_9.19, align 1
  %str_char_10.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 10
  store i8 111, ptr %str_char_10.19, align 1
  %str_char_11.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 11
  store i8 103, ptr %str_char_11.19, align 1
  %str_char_12.18 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 12
  store i8 114, ptr %str_char_12.18, align 1
  %str_char_13.15 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 13
  store i8 97, ptr %str_char_13.15, align 1
  %str_char_14.13 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 14
  store i8 109, ptr %str_char_14.13, align 1
  %str_char_15.10 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 15
  store i8 0, ptr %str_char_15.10, align 1
  %arg0_decay.19 = getelementptr [16 x i8], ptr %str_stack.19, i32 0, i32 0
  %.379 = call ptr @wglGetProcAddress(ptr %arg0_decay.19)
  store ptr %.379, ptr @OpenGL___glCreateProgram, align 8
  %str_stack.20 = alloca [16 x i8], align 1
  %str_char_0.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 0
  store i8 103, ptr %str_char_0.20, align 1
  %str_char_1.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 1
  store i8 108, ptr %str_char_1.20, align 1
  %str_char_2.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 2
  store i8 68, ptr %str_char_2.20, align 1
  %str_char_3.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 3
  store i8 101, ptr %str_char_3.20, align 1
  %str_char_4.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 4
  store i8 108, ptr %str_char_4.20, align 1
  %str_char_5.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 5
  store i8 101, ptr %str_char_5.20, align 1
  %str_char_6.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 6
  store i8 116, ptr %str_char_6.20, align 1
  %str_char_7.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 7
  store i8 101, ptr %str_char_7.20, align 1
  %str_char_8.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 8
  store i8 80, ptr %str_char_8.20, align 1
  %str_char_9.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 9
  store i8 114, ptr %str_char_9.20, align 1
  %str_char_10.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 10
  store i8 111, ptr %str_char_10.20, align 1
  %str_char_11.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 11
  store i8 103, ptr %str_char_11.20, align 1
  %str_char_12.19 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 12
  store i8 114, ptr %str_char_12.19, align 1
  %str_char_13.16 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 13
  store i8 97, ptr %str_char_13.16, align 1
  %str_char_14.14 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 14
  store i8 109, ptr %str_char_14.14, align 1
  %str_char_15.11 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 15
  store i8 0, ptr %str_char_15.11, align 1
  %arg0_decay.20 = getelementptr [16 x i8], ptr %str_stack.20, i32 0, i32 0
  %.397 = call ptr @wglGetProcAddress(ptr %arg0_decay.20)
  store ptr %.397, ptr @OpenGL___glDeleteProgram, align 8
  %str_stack.21 = alloca [15 x i8], align 1
  %str_char_0.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 0
  store i8 103, ptr %str_char_0.21, align 1
  %str_char_1.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 1
  store i8 108, ptr %str_char_1.21, align 1
  %str_char_2.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 2
  store i8 65, ptr %str_char_2.21, align 1
  %str_char_3.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 3
  store i8 116, ptr %str_char_3.21, align 1
  %str_char_4.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 4
  store i8 116, ptr %str_char_4.21, align 1
  %str_char_5.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 5
  store i8 97, ptr %str_char_5.21, align 1
  %str_char_6.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 6
  store i8 99, ptr %str_char_6.21, align 1
  %str_char_7.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 7
  store i8 104, ptr %str_char_7.21, align 1
  %str_char_8.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 8
  store i8 83, ptr %str_char_8.21, align 1
  %str_char_9.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 9
  store i8 104, ptr %str_char_9.21, align 1
  %str_char_10.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 10
  store i8 97, ptr %str_char_10.21, align 1
  %str_char_11.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 11
  store i8 100, ptr %str_char_11.21, align 1
  %str_char_12.20 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 12
  store i8 101, ptr %str_char_12.20, align 1
  %str_char_13.17 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 13
  store i8 114, ptr %str_char_13.17, align 1
  %str_char_14.15 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 14
  store i8 0, ptr %str_char_14.15, align 1
  %arg0_decay.21 = getelementptr [15 x i8], ptr %str_stack.21, i32 0, i32 0
  %.414 = call ptr @wglGetProcAddress(ptr %arg0_decay.21)
  store ptr %.414, ptr @OpenGL___glAttachShader, align 8
  %str_stack.22 = alloca [15 x i8], align 1
  %str_char_0.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 0
  store i8 103, ptr %str_char_0.22, align 1
  %str_char_1.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 1
  store i8 108, ptr %str_char_1.22, align 1
  %str_char_2.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 2
  store i8 68, ptr %str_char_2.22, align 1
  %str_char_3.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 3
  store i8 101, ptr %str_char_3.22, align 1
  %str_char_4.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 4
  store i8 116, ptr %str_char_4.22, align 1
  %str_char_5.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 5
  store i8 97, ptr %str_char_5.22, align 1
  %str_char_6.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 6
  store i8 99, ptr %str_char_6.22, align 1
  %str_char_7.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 7
  store i8 104, ptr %str_char_7.22, align 1
  %str_char_8.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 8
  store i8 83, ptr %str_char_8.22, align 1
  %str_char_9.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 9
  store i8 104, ptr %str_char_9.22, align 1
  %str_char_10.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 10
  store i8 97, ptr %str_char_10.22, align 1
  %str_char_11.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 11
  store i8 100, ptr %str_char_11.22, align 1
  %str_char_12.21 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 12
  store i8 101, ptr %str_char_12.21, align 1
  %str_char_13.18 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 13
  store i8 114, ptr %str_char_13.18, align 1
  %str_char_14.16 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 14
  store i8 0, ptr %str_char_14.16, align 1
  %arg0_decay.22 = getelementptr [15 x i8], ptr %str_stack.22, i32 0, i32 0
  %.431 = call ptr @wglGetProcAddress(ptr %arg0_decay.22)
  store ptr %.431, ptr @OpenGL___glDetachShader, align 8
  %str_stack.23 = alloca [14 x i8], align 1
  %str_char_0.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 0
  store i8 103, ptr %str_char_0.23, align 1
  %str_char_1.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 1
  store i8 108, ptr %str_char_1.23, align 1
  %str_char_2.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 2
  store i8 76, ptr %str_char_2.23, align 1
  %str_char_3.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 3
  store i8 105, ptr %str_char_3.23, align 1
  %str_char_4.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 4
  store i8 110, ptr %str_char_4.23, align 1
  %str_char_5.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 5
  store i8 107, ptr %str_char_5.23, align 1
  %str_char_6.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 6
  store i8 80, ptr %str_char_6.23, align 1
  %str_char_7.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 7
  store i8 114, ptr %str_char_7.23, align 1
  %str_char_8.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 8
  store i8 111, ptr %str_char_8.23, align 1
  %str_char_9.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 9
  store i8 103, ptr %str_char_9.23, align 1
  %str_char_10.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 10
  store i8 114, ptr %str_char_10.23, align 1
  %str_char_11.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 11
  store i8 97, ptr %str_char_11.23, align 1
  %str_char_12.22 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 12
  store i8 109, ptr %str_char_12.22, align 1
  %str_char_13.19 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 13
  store i8 0, ptr %str_char_13.19, align 1
  %arg0_decay.23 = getelementptr [14 x i8], ptr %str_stack.23, i32 0, i32 0
  %.447 = call ptr @wglGetProcAddress(ptr %arg0_decay.23)
  store ptr %.447, ptr @OpenGL___glLinkProgram, align 8
  %str_stack.24 = alloca [13 x i8], align 1
  %str_char_0.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 0
  store i8 103, ptr %str_char_0.24, align 1
  %str_char_1.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 1
  store i8 108, ptr %str_char_1.24, align 1
  %str_char_2.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 2
  store i8 85, ptr %str_char_2.24, align 1
  %str_char_3.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 3
  store i8 115, ptr %str_char_3.24, align 1
  %str_char_4.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 4
  store i8 101, ptr %str_char_4.24, align 1
  %str_char_5.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 5
  store i8 80, ptr %str_char_5.24, align 1
  %str_char_6.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 6
  store i8 114, ptr %str_char_6.24, align 1
  %str_char_7.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 7
  store i8 111, ptr %str_char_7.24, align 1
  %str_char_8.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 8
  store i8 103, ptr %str_char_8.24, align 1
  %str_char_9.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 9
  store i8 114, ptr %str_char_9.24, align 1
  %str_char_10.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 10
  store i8 97, ptr %str_char_10.24, align 1
  %str_char_11.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 11
  store i8 109, ptr %str_char_11.24, align 1
  %str_char_12.23 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 12
  store i8 0, ptr %str_char_12.23, align 1
  %arg0_decay.24 = getelementptr [13 x i8], ptr %str_stack.24, i32 0, i32 0
  %.462 = call ptr @wglGetProcAddress(ptr %arg0_decay.24)
  store ptr %.462, ptr @OpenGL___glUseProgram, align 8
  %str_stack.25 = alloca [15 x i8], align 1
  %str_char_0.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 0
  store i8 103, ptr %str_char_0.25, align 1
  %str_char_1.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 1
  store i8 108, ptr %str_char_1.25, align 1
  %str_char_2.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 2
  store i8 71, ptr %str_char_2.25, align 1
  %str_char_3.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 3
  store i8 101, ptr %str_char_3.25, align 1
  %str_char_4.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 4
  store i8 116, ptr %str_char_4.25, align 1
  %str_char_5.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 5
  store i8 80, ptr %str_char_5.25, align 1
  %str_char_6.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 6
  store i8 114, ptr %str_char_6.25, align 1
  %str_char_7.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 7
  store i8 111, ptr %str_char_7.25, align 1
  %str_char_8.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 8
  store i8 103, ptr %str_char_8.25, align 1
  %str_char_9.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 9
  store i8 114, ptr %str_char_9.25, align 1
  %str_char_10.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 10
  store i8 97, ptr %str_char_10.25, align 1
  %str_char_11.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 11
  store i8 109, ptr %str_char_11.25, align 1
  %str_char_12.24 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 12
  store i8 105, ptr %str_char_12.24, align 1
  %str_char_13.20 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 13
  store i8 118, ptr %str_char_13.20, align 1
  %str_char_14.17 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 14
  store i8 0, ptr %str_char_14.17, align 1
  %arg0_decay.25 = getelementptr [15 x i8], ptr %str_stack.25, i32 0, i32 0
  %.479 = call ptr @wglGetProcAddress(ptr %arg0_decay.25)
  store ptr %.479, ptr @OpenGL___glGetProgramiv, align 8
  %str_stack.26 = alloca [20 x i8], align 1
  %str_char_0.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 0
  store i8 103, ptr %str_char_0.26, align 1
  %str_char_1.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 1
  store i8 108, ptr %str_char_1.26, align 1
  %str_char_2.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 2
  store i8 71, ptr %str_char_2.26, align 1
  %str_char_3.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 3
  store i8 101, ptr %str_char_3.26, align 1
  %str_char_4.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 4
  store i8 116, ptr %str_char_4.26, align 1
  %str_char_5.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 5
  store i8 80, ptr %str_char_5.26, align 1
  %str_char_6.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 6
  store i8 114, ptr %str_char_6.26, align 1
  %str_char_7.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 7
  store i8 111, ptr %str_char_7.26, align 1
  %str_char_8.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 8
  store i8 103, ptr %str_char_8.26, align 1
  %str_char_9.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 9
  store i8 114, ptr %str_char_9.26, align 1
  %str_char_10.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 10
  store i8 97, ptr %str_char_10.26, align 1
  %str_char_11.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 11
  store i8 109, ptr %str_char_11.26, align 1
  %str_char_12.25 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 12
  store i8 73, ptr %str_char_12.25, align 1
  %str_char_13.21 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 13
  store i8 110, ptr %str_char_13.21, align 1
  %str_char_14.18 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 14
  store i8 102, ptr %str_char_14.18, align 1
  %str_char_15.12 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 15
  store i8 111, ptr %str_char_15.12, align 1
  %str_char_16.7 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 16
  store i8 76, ptr %str_char_16.7, align 1
  %str_char_17.7 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 17
  store i8 111, ptr %str_char_17.7, align 1
  %str_char_18.5 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 18
  store i8 103, ptr %str_char_18.5, align 1
  %str_char_19.4 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 19
  store i8 0, ptr %str_char_19.4, align 1
  %arg0_decay.26 = getelementptr [20 x i8], ptr %str_stack.26, i32 0, i32 0
  %.501 = call ptr @wglGetProcAddress(ptr %arg0_decay.26)
  store ptr %.501, ptr @OpenGL___glGetProgramInfoLog, align 8
  %str_stack.27 = alloca [21 x i8], align 1
  %str_char_0.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 0
  store i8 103, ptr %str_char_0.27, align 1
  %str_char_1.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 1
  store i8 108, ptr %str_char_1.27, align 1
  %str_char_2.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 2
  store i8 66, ptr %str_char_2.27, align 1
  %str_char_3.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 3
  store i8 105, ptr %str_char_3.27, align 1
  %str_char_4.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 4
  store i8 110, ptr %str_char_4.27, align 1
  %str_char_5.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 5
  store i8 100, ptr %str_char_5.27, align 1
  %str_char_6.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 6
  store i8 65, ptr %str_char_6.27, align 1
  %str_char_7.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 7
  store i8 116, ptr %str_char_7.27, align 1
  %str_char_8.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 8
  store i8 116, ptr %str_char_8.27, align 1
  %str_char_9.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 9
  store i8 114, ptr %str_char_9.27, align 1
  %str_char_10.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 10
  store i8 105, ptr %str_char_10.27, align 1
  %str_char_11.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 11
  store i8 98, ptr %str_char_11.27, align 1
  %str_char_12.26 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 12
  store i8 76, ptr %str_char_12.26, align 1
  %str_char_13.22 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 13
  store i8 111, ptr %str_char_13.22, align 1
  %str_char_14.19 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 14
  store i8 99, ptr %str_char_14.19, align 1
  %str_char_15.13 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 15
  store i8 97, ptr %str_char_15.13, align 1
  %str_char_16.8 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 16
  store i8 116, ptr %str_char_16.8, align 1
  %str_char_17.8 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 17
  store i8 105, ptr %str_char_17.8, align 1
  %str_char_18.6 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 18
  store i8 111, ptr %str_char_18.6, align 1
  %str_char_19.5 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 19
  store i8 110, ptr %str_char_19.5, align 1
  %str_char_20.4 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 20
  store i8 0, ptr %str_char_20.4, align 1
  %arg0_decay.27 = getelementptr [21 x i8], ptr %str_stack.27, i32 0, i32 0
  %.524 = call ptr @wglGetProcAddress(ptr %arg0_decay.27)
  store ptr %.524, ptr @OpenGL___glBindAttribLocation, align 8
  %str_stack.28 = alloca [21 x i8], align 1
  %str_char_0.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 0
  store i8 103, ptr %str_char_0.28, align 1
  %str_char_1.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 1
  store i8 108, ptr %str_char_1.28, align 1
  %str_char_2.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 2
  store i8 71, ptr %str_char_2.28, align 1
  %str_char_3.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 3
  store i8 101, ptr %str_char_3.28, align 1
  %str_char_4.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 4
  store i8 116, ptr %str_char_4.28, align 1
  %str_char_5.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 5
  store i8 85, ptr %str_char_5.28, align 1
  %str_char_6.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 6
  store i8 110, ptr %str_char_6.28, align 1
  %str_char_7.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 7
  store i8 105, ptr %str_char_7.28, align 1
  %str_char_8.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 8
  store i8 102, ptr %str_char_8.28, align 1
  %str_char_9.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 9
  store i8 111, ptr %str_char_9.28, align 1
  %str_char_10.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 10
  store i8 114, ptr %str_char_10.28, align 1
  %str_char_11.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 11
  store i8 109, ptr %str_char_11.28, align 1
  %str_char_12.27 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 12
  store i8 76, ptr %str_char_12.27, align 1
  %str_char_13.23 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 13
  store i8 111, ptr %str_char_13.23, align 1
  %str_char_14.20 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 14
  store i8 99, ptr %str_char_14.20, align 1
  %str_char_15.14 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 15
  store i8 97, ptr %str_char_15.14, align 1
  %str_char_16.9 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 16
  store i8 116, ptr %str_char_16.9, align 1
  %str_char_17.9 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 17
  store i8 105, ptr %str_char_17.9, align 1
  %str_char_18.7 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 18
  store i8 111, ptr %str_char_18.7, align 1
  %str_char_19.6 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 19
  store i8 110, ptr %str_char_19.6, align 1
  %str_char_20.5 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 20
  store i8 0, ptr %str_char_20.5, align 1
  %arg0_decay.28 = getelementptr [21 x i8], ptr %str_stack.28, i32 0, i32 0
  %.547 = call ptr @wglGetProcAddress(ptr %arg0_decay.28)
  store ptr %.547, ptr @OpenGL___glGetUniformLocation, align 8
  %str_stack.29 = alloca [12 x i8], align 1
  %str_char_0.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 0
  store i8 103, ptr %str_char_0.29, align 1
  %str_char_1.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 1
  store i8 108, ptr %str_char_1.29, align 1
  %str_char_2.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 2
  store i8 85, ptr %str_char_2.29, align 1
  %str_char_3.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 3
  store i8 110, ptr %str_char_3.29, align 1
  %str_char_4.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 4
  store i8 105, ptr %str_char_4.29, align 1
  %str_char_5.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 5
  store i8 102, ptr %str_char_5.29, align 1
  %str_char_6.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 6
  store i8 111, ptr %str_char_6.29, align 1
  %str_char_7.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 7
  store i8 114, ptr %str_char_7.29, align 1
  %str_char_8.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 8
  store i8 109, ptr %str_char_8.29, align 1
  %str_char_9.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 9
  store i8 49, ptr %str_char_9.29, align 1
  %str_char_10.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 10
  store i8 105, ptr %str_char_10.29, align 1
  %str_char_11.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 11
  store i8 0, ptr %str_char_11.29, align 1
  %arg0_decay.29 = getelementptr [12 x i8], ptr %str_stack.29, i32 0, i32 0
  %.561 = call ptr @wglGetProcAddress(ptr %arg0_decay.29)
  store ptr %.561, ptr @OpenGL___glUniform1i, align 8
  %str_stack.30 = alloca [12 x i8], align 1
  %str_char_0.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 0
  store i8 103, ptr %str_char_0.30, align 1
  %str_char_1.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 1
  store i8 108, ptr %str_char_1.30, align 1
  %str_char_2.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 2
  store i8 85, ptr %str_char_2.30, align 1
  %str_char_3.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 3
  store i8 110, ptr %str_char_3.30, align 1
  %str_char_4.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 4
  store i8 105, ptr %str_char_4.30, align 1
  %str_char_5.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 5
  store i8 102, ptr %str_char_5.30, align 1
  %str_char_6.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 6
  store i8 111, ptr %str_char_6.30, align 1
  %str_char_7.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 7
  store i8 114, ptr %str_char_7.30, align 1
  %str_char_8.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 8
  store i8 109, ptr %str_char_8.30, align 1
  %str_char_9.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 9
  store i8 49, ptr %str_char_9.30, align 1
  %str_char_10.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 10
  store i8 102, ptr %str_char_10.30, align 1
  %str_char_11.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 11
  store i8 0, ptr %str_char_11.30, align 1
  %arg0_decay.30 = getelementptr [12 x i8], ptr %str_stack.30, i32 0, i32 0
  %.575 = call ptr @wglGetProcAddress(ptr %arg0_decay.30)
  store ptr %.575, ptr @OpenGL___glUniform1f, align 8
  %str_stack.31 = alloca [12 x i8], align 1
  %str_char_0.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 0
  store i8 103, ptr %str_char_0.31, align 1
  %str_char_1.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 1
  store i8 108, ptr %str_char_1.31, align 1
  %str_char_2.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 2
  store i8 85, ptr %str_char_2.31, align 1
  %str_char_3.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 3
  store i8 110, ptr %str_char_3.31, align 1
  %str_char_4.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 4
  store i8 105, ptr %str_char_4.31, align 1
  %str_char_5.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 5
  store i8 102, ptr %str_char_5.31, align 1
  %str_char_6.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 6
  store i8 111, ptr %str_char_6.31, align 1
  %str_char_7.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 7
  store i8 114, ptr %str_char_7.31, align 1
  %str_char_8.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 8
  store i8 109, ptr %str_char_8.31, align 1
  %str_char_9.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 9
  store i8 50, ptr %str_char_9.31, align 1
  %str_char_10.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 10
  store i8 102, ptr %str_char_10.31, align 1
  %str_char_11.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 11
  store i8 0, ptr %str_char_11.31, align 1
  %arg0_decay.31 = getelementptr [12 x i8], ptr %str_stack.31, i32 0, i32 0
  %.589 = call ptr @wglGetProcAddress(ptr %arg0_decay.31)
  store ptr %.589, ptr @OpenGL___glUniform2f, align 8
  %str_stack.32 = alloca [12 x i8], align 1
  %str_char_0.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 0
  store i8 103, ptr %str_char_0.32, align 1
  %str_char_1.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 1
  store i8 108, ptr %str_char_1.32, align 1
  %str_char_2.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 2
  store i8 85, ptr %str_char_2.32, align 1
  %str_char_3.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 3
  store i8 110, ptr %str_char_3.32, align 1
  %str_char_4.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 4
  store i8 105, ptr %str_char_4.32, align 1
  %str_char_5.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 5
  store i8 102, ptr %str_char_5.32, align 1
  %str_char_6.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 6
  store i8 111, ptr %str_char_6.32, align 1
  %str_char_7.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 7
  store i8 114, ptr %str_char_7.32, align 1
  %str_char_8.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 8
  store i8 109, ptr %str_char_8.32, align 1
  %str_char_9.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 9
  store i8 51, ptr %str_char_9.32, align 1
  %str_char_10.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 10
  store i8 102, ptr %str_char_10.32, align 1
  %str_char_11.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 11
  store i8 0, ptr %str_char_11.32, align 1
  %arg0_decay.32 = getelementptr [12 x i8], ptr %str_stack.32, i32 0, i32 0
  %.603 = call ptr @wglGetProcAddress(ptr %arg0_decay.32)
  store ptr %.603, ptr @OpenGL___glUniform3f, align 8
  %str_stack.33 = alloca [12 x i8], align 1
  %str_char_0.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 0
  store i8 103, ptr %str_char_0.33, align 1
  %str_char_1.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 1
  store i8 108, ptr %str_char_1.33, align 1
  %str_char_2.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 2
  store i8 85, ptr %str_char_2.33, align 1
  %str_char_3.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 3
  store i8 110, ptr %str_char_3.33, align 1
  %str_char_4.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 4
  store i8 105, ptr %str_char_4.33, align 1
  %str_char_5.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 5
  store i8 102, ptr %str_char_5.33, align 1
  %str_char_6.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 6
  store i8 111, ptr %str_char_6.33, align 1
  %str_char_7.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 7
  store i8 114, ptr %str_char_7.33, align 1
  %str_char_8.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 8
  store i8 109, ptr %str_char_8.33, align 1
  %str_char_9.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 9
  store i8 52, ptr %str_char_9.33, align 1
  %str_char_10.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 10
  store i8 102, ptr %str_char_10.33, align 1
  %str_char_11.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 11
  store i8 0, ptr %str_char_11.33, align 1
  %arg0_decay.33 = getelementptr [12 x i8], ptr %str_stack.33, i32 0, i32 0
  %.617 = call ptr @wglGetProcAddress(ptr %arg0_decay.33)
  store ptr %.617, ptr @OpenGL___glUniform4f, align 8
  %str_stack.34 = alloca [13 x i8], align 1
  %str_char_0.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 0
  store i8 103, ptr %str_char_0.34, align 1
  %str_char_1.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 1
  store i8 108, ptr %str_char_1.34, align 1
  %str_char_2.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 2
  store i8 85, ptr %str_char_2.34, align 1
  %str_char_3.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 3
  store i8 110, ptr %str_char_3.34, align 1
  %str_char_4.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 4
  store i8 105, ptr %str_char_4.34, align 1
  %str_char_5.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 5
  store i8 102, ptr %str_char_5.34, align 1
  %str_char_6.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 6
  store i8 111, ptr %str_char_6.34, align 1
  %str_char_7.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 7
  store i8 114, ptr %str_char_7.34, align 1
  %str_char_8.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 8
  store i8 109, ptr %str_char_8.34, align 1
  %str_char_9.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 9
  store i8 49, ptr %str_char_9.34, align 1
  %str_char_10.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 10
  store i8 105, ptr %str_char_10.34, align 1
  %str_char_11.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 11
  store i8 118, ptr %str_char_11.34, align 1
  %str_char_12.28 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 12
  store i8 0, ptr %str_char_12.28, align 1
  %arg0_decay.34 = getelementptr [13 x i8], ptr %str_stack.34, i32 0, i32 0
  %.632 = call ptr @wglGetProcAddress(ptr %arg0_decay.34)
  store ptr %.632, ptr @OpenGL___glUniform1iv, align 8
  %str_stack.35 = alloca [13 x i8], align 1
  %str_char_0.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 0
  store i8 103, ptr %str_char_0.35, align 1
  %str_char_1.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 1
  store i8 108, ptr %str_char_1.35, align 1
  %str_char_2.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 2
  store i8 85, ptr %str_char_2.35, align 1
  %str_char_3.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 3
  store i8 110, ptr %str_char_3.35, align 1
  %str_char_4.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 4
  store i8 105, ptr %str_char_4.35, align 1
  %str_char_5.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 5
  store i8 102, ptr %str_char_5.35, align 1
  %str_char_6.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 6
  store i8 111, ptr %str_char_6.35, align 1
  %str_char_7.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 7
  store i8 114, ptr %str_char_7.35, align 1
  %str_char_8.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 8
  store i8 109, ptr %str_char_8.35, align 1
  %str_char_9.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 9
  store i8 50, ptr %str_char_9.35, align 1
  %str_char_10.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 10
  store i8 102, ptr %str_char_10.35, align 1
  %str_char_11.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 11
  store i8 118, ptr %str_char_11.35, align 1
  %str_char_12.29 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 12
  store i8 0, ptr %str_char_12.29, align 1
  %arg0_decay.35 = getelementptr [13 x i8], ptr %str_stack.35, i32 0, i32 0
  %.647 = call ptr @wglGetProcAddress(ptr %arg0_decay.35)
  store ptr %.647, ptr @OpenGL___glUniform2fv, align 8
  %str_stack.36 = alloca [13 x i8], align 1
  %str_char_0.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 0
  store i8 103, ptr %str_char_0.36, align 1
  %str_char_1.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 1
  store i8 108, ptr %str_char_1.36, align 1
  %str_char_2.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 2
  store i8 85, ptr %str_char_2.36, align 1
  %str_char_3.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 3
  store i8 110, ptr %str_char_3.36, align 1
  %str_char_4.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 4
  store i8 105, ptr %str_char_4.36, align 1
  %str_char_5.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 5
  store i8 102, ptr %str_char_5.36, align 1
  %str_char_6.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 6
  store i8 111, ptr %str_char_6.36, align 1
  %str_char_7.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 7
  store i8 114, ptr %str_char_7.36, align 1
  %str_char_8.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 8
  store i8 109, ptr %str_char_8.36, align 1
  %str_char_9.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 9
  store i8 51, ptr %str_char_9.36, align 1
  %str_char_10.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 10
  store i8 102, ptr %str_char_10.36, align 1
  %str_char_11.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 11
  store i8 118, ptr %str_char_11.36, align 1
  %str_char_12.30 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 12
  store i8 0, ptr %str_char_12.30, align 1
  %arg0_decay.36 = getelementptr [13 x i8], ptr %str_stack.36, i32 0, i32 0
  %.662 = call ptr @wglGetProcAddress(ptr %arg0_decay.36)
  store ptr %.662, ptr @OpenGL___glUniform3fv, align 8
  %str_stack.37 = alloca [13 x i8], align 1
  %str_char_0.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 0
  store i8 103, ptr %str_char_0.37, align 1
  %str_char_1.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 1
  store i8 108, ptr %str_char_1.37, align 1
  %str_char_2.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 2
  store i8 85, ptr %str_char_2.37, align 1
  %str_char_3.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 3
  store i8 110, ptr %str_char_3.37, align 1
  %str_char_4.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 4
  store i8 105, ptr %str_char_4.37, align 1
  %str_char_5.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 5
  store i8 102, ptr %str_char_5.37, align 1
  %str_char_6.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 6
  store i8 111, ptr %str_char_6.37, align 1
  %str_char_7.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 7
  store i8 114, ptr %str_char_7.37, align 1
  %str_char_8.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 8
  store i8 109, ptr %str_char_8.37, align 1
  %str_char_9.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 9
  store i8 52, ptr %str_char_9.37, align 1
  %str_char_10.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 10
  store i8 102, ptr %str_char_10.37, align 1
  %str_char_11.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 11
  store i8 118, ptr %str_char_11.37, align 1
  %str_char_12.31 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 12
  store i8 0, ptr %str_char_12.31, align 1
  %arg0_decay.37 = getelementptr [13 x i8], ptr %str_stack.37, i32 0, i32 0
  %.677 = call ptr @wglGetProcAddress(ptr %arg0_decay.37)
  store ptr %.677, ptr @OpenGL___glUniform4fv, align 8
  %str_stack.38 = alloca [16 x i8], align 1
  %str_char_0.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 0
  store i8 103, ptr %str_char_0.38, align 1
  %str_char_1.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 1
  store i8 108, ptr %str_char_1.38, align 1
  %str_char_2.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 2
  store i8 85, ptr %str_char_2.38, align 1
  %str_char_3.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 3
  store i8 110, ptr %str_char_3.38, align 1
  %str_char_4.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 4
  store i8 105, ptr %str_char_4.38, align 1
  %str_char_5.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 5
  store i8 102, ptr %str_char_5.38, align 1
  %str_char_6.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 6
  store i8 111, ptr %str_char_6.38, align 1
  %str_char_7.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 7
  store i8 114, ptr %str_char_7.38, align 1
  %str_char_8.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 8
  store i8 109, ptr %str_char_8.38, align 1
  %str_char_9.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 9
  store i8 77, ptr %str_char_9.38, align 1
  %str_char_10.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 10
  store i8 97, ptr %str_char_10.38, align 1
  %str_char_11.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 11
  store i8 116, ptr %str_char_11.38, align 1
  %str_char_12.32 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 12
  store i8 52, ptr %str_char_12.32, align 1
  %str_char_13.24 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 13
  store i8 102, ptr %str_char_13.24, align 1
  %str_char_14.21 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 14
  store i8 118, ptr %str_char_14.21, align 1
  %str_char_15.15 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 15
  store i8 0, ptr %str_char_15.15, align 1
  %arg0_decay.38 = getelementptr [16 x i8], ptr %str_stack.38, i32 0, i32 0
  %.695 = call ptr @wglGetProcAddress(ptr %arg0_decay.38)
  store ptr %.695, ptr @OpenGL___glUniformMat4fv, align 8
  %str_stack.39 = alloca [18 x i8], align 1
  %str_char_0.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 0
  store i8 103, ptr %str_char_0.39, align 1
  %str_char_1.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 1
  store i8 108, ptr %str_char_1.39, align 1
  %str_char_2.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 2
  store i8 71, ptr %str_char_2.39, align 1
  %str_char_3.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 3
  store i8 101, ptr %str_char_3.39, align 1
  %str_char_4.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 4
  store i8 110, ptr %str_char_4.39, align 1
  %str_char_5.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 5
  store i8 70, ptr %str_char_5.39, align 1
  %str_char_6.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 6
  store i8 114, ptr %str_char_6.39, align 1
  %str_char_7.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 7
  store i8 97, ptr %str_char_7.39, align 1
  %str_char_8.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 8
  store i8 109, ptr %str_char_8.39, align 1
  %str_char_9.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 9
  store i8 101, ptr %str_char_9.39, align 1
  %str_char_10.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 10
  store i8 98, ptr %str_char_10.39, align 1
  %str_char_11.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 11
  store i8 117, ptr %str_char_11.39, align 1
  %str_char_12.33 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 12
  store i8 102, ptr %str_char_12.33, align 1
  %str_char_13.25 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 13
  store i8 102, ptr %str_char_13.25, align 1
  %str_char_14.22 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 14
  store i8 101, ptr %str_char_14.22, align 1
  %str_char_15.16 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 15
  store i8 114, ptr %str_char_15.16, align 1
  %str_char_16.10 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 16
  store i8 115, ptr %str_char_16.10, align 1
  %str_char_17.10 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 17
  store i8 0, ptr %str_char_17.10, align 1
  %arg0_decay.39 = getelementptr [18 x i8], ptr %str_stack.39, i32 0, i32 0
  %.715 = call ptr @wglGetProcAddress(ptr %arg0_decay.39)
  store ptr %.715, ptr @OpenGL___glGenFramebuffers, align 8
  %str_stack.40 = alloca [21 x i8], align 1
  %str_char_0.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 0
  store i8 103, ptr %str_char_0.40, align 1
  %str_char_1.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 1
  store i8 108, ptr %str_char_1.40, align 1
  %str_char_2.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 2
  store i8 68, ptr %str_char_2.40, align 1
  %str_char_3.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 3
  store i8 101, ptr %str_char_3.40, align 1
  %str_char_4.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 4
  store i8 108, ptr %str_char_4.40, align 1
  %str_char_5.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 5
  store i8 101, ptr %str_char_5.40, align 1
  %str_char_6.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 6
  store i8 116, ptr %str_char_6.40, align 1
  %str_char_7.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 7
  store i8 101, ptr %str_char_7.40, align 1
  %str_char_8.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 8
  store i8 70, ptr %str_char_8.40, align 1
  %str_char_9.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 9
  store i8 114, ptr %str_char_9.40, align 1
  %str_char_10.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 10
  store i8 97, ptr %str_char_10.40, align 1
  %str_char_11.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 11
  store i8 109, ptr %str_char_11.40, align 1
  %str_char_12.34 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 12
  store i8 101, ptr %str_char_12.34, align 1
  %str_char_13.26 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 13
  store i8 98, ptr %str_char_13.26, align 1
  %str_char_14.23 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 14
  store i8 117, ptr %str_char_14.23, align 1
  %str_char_15.17 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 15
  store i8 102, ptr %str_char_15.17, align 1
  %str_char_16.11 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 16
  store i8 102, ptr %str_char_16.11, align 1
  %str_char_17.11 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 17
  store i8 101, ptr %str_char_17.11, align 1
  %str_char_18.8 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 18
  store i8 114, ptr %str_char_18.8, align 1
  %str_char_19.7 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 19
  store i8 115, ptr %str_char_19.7, align 1
  %str_char_20.6 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 20
  store i8 0, ptr %str_char_20.6, align 1
  %arg0_decay.40 = getelementptr [21 x i8], ptr %str_stack.40, i32 0, i32 0
  %.738 = call ptr @wglGetProcAddress(ptr %arg0_decay.40)
  store ptr %.738, ptr @OpenGL___glDeleteFramebuffers, align 8
  %str_stack.41 = alloca [18 x i8], align 1
  %str_char_0.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 0
  store i8 103, ptr %str_char_0.41, align 1
  %str_char_1.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 1
  store i8 108, ptr %str_char_1.41, align 1
  %str_char_2.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 2
  store i8 66, ptr %str_char_2.41, align 1
  %str_char_3.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 3
  store i8 105, ptr %str_char_3.41, align 1
  %str_char_4.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 4
  store i8 110, ptr %str_char_4.41, align 1
  %str_char_5.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 5
  store i8 100, ptr %str_char_5.41, align 1
  %str_char_6.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 6
  store i8 70, ptr %str_char_6.41, align 1
  %str_char_7.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 7
  store i8 114, ptr %str_char_7.41, align 1
  %str_char_8.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 8
  store i8 97, ptr %str_char_8.41, align 1
  %str_char_9.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 9
  store i8 109, ptr %str_char_9.41, align 1
  %str_char_10.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 10
  store i8 101, ptr %str_char_10.41, align 1
  %str_char_11.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 11
  store i8 98, ptr %str_char_11.41, align 1
  %str_char_12.35 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 12
  store i8 117, ptr %str_char_12.35, align 1
  %str_char_13.27 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 13
  store i8 102, ptr %str_char_13.27, align 1
  %str_char_14.24 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 14
  store i8 102, ptr %str_char_14.24, align 1
  %str_char_15.18 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 15
  store i8 101, ptr %str_char_15.18, align 1
  %str_char_16.12 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 16
  store i8 114, ptr %str_char_16.12, align 1
  %str_char_17.12 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 17
  store i8 0, ptr %str_char_17.12, align 1
  %arg0_decay.41 = getelementptr [18 x i8], ptr %str_stack.41, i32 0, i32 0
  %.758 = call ptr @wglGetProcAddress(ptr %arg0_decay.41)
  store ptr %.758, ptr @OpenGL___glBindFramebuffer, align 8
  %str_stack.42 = alloca [23 x i8], align 1
  %str_char_0.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 0
  store i8 103, ptr %str_char_0.42, align 1
  %str_char_1.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 1
  store i8 108, ptr %str_char_1.42, align 1
  %str_char_2.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 2
  store i8 70, ptr %str_char_2.42, align 1
  %str_char_3.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 3
  store i8 114, ptr %str_char_3.42, align 1
  %str_char_4.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 4
  store i8 97, ptr %str_char_4.42, align 1
  %str_char_5.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 5
  store i8 109, ptr %str_char_5.42, align 1
  %str_char_6.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 6
  store i8 101, ptr %str_char_6.42, align 1
  %str_char_7.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 7
  store i8 98, ptr %str_char_7.42, align 1
  %str_char_8.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 8
  store i8 117, ptr %str_char_8.42, align 1
  %str_char_9.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 9
  store i8 102, ptr %str_char_9.42, align 1
  %str_char_10.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 10
  store i8 102, ptr %str_char_10.42, align 1
  %str_char_11.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 11
  store i8 101, ptr %str_char_11.42, align 1
  %str_char_12.36 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 12
  store i8 114, ptr %str_char_12.36, align 1
  %str_char_13.28 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 13
  store i8 84, ptr %str_char_13.28, align 1
  %str_char_14.25 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 14
  store i8 101, ptr %str_char_14.25, align 1
  %str_char_15.19 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 15
  store i8 120, ptr %str_char_15.19, align 1
  %str_char_16.13 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 16
  store i8 116, ptr %str_char_16.13, align 1
  %str_char_17.13 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 17
  store i8 117, ptr %str_char_17.13, align 1
  %str_char_18.9 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 18
  store i8 114, ptr %str_char_18.9, align 1
  %str_char_19.8 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 19
  store i8 101, ptr %str_char_19.8, align 1
  %str_char_20.7 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 20
  store i8 50, ptr %str_char_20.7, align 1
  %str_char_21.3 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 21
  store i8 68, ptr %str_char_21.3, align 1
  %str_char_22.2 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 22
  store i8 0, ptr %str_char_22.2, align 1
  %arg0_decay.42 = getelementptr [23 x i8], ptr %str_stack.42, i32 0, i32 0
  %.783 = call ptr @wglGetProcAddress(ptr %arg0_decay.42)
  store ptr %.783, ptr @OpenGL___glFramebufferTexture2D, align 8
  %str_stack.43 = alloca [25 x i8], align 1
  %str_char_0.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 0
  store i8 103, ptr %str_char_0.43, align 1
  %str_char_1.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 1
  store i8 108, ptr %str_char_1.43, align 1
  %str_char_2.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 2
  store i8 67, ptr %str_char_2.43, align 1
  %str_char_3.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 3
  store i8 104, ptr %str_char_3.43, align 1
  %str_char_4.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 4
  store i8 101, ptr %str_char_4.43, align 1
  %str_char_5.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 5
  store i8 99, ptr %str_char_5.43, align 1
  %str_char_6.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 6
  store i8 107, ptr %str_char_6.43, align 1
  %str_char_7.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 7
  store i8 70, ptr %str_char_7.43, align 1
  %str_char_8.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 8
  store i8 114, ptr %str_char_8.43, align 1
  %str_char_9.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 9
  store i8 97, ptr %str_char_9.43, align 1
  %str_char_10.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 10
  store i8 109, ptr %str_char_10.43, align 1
  %str_char_11.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 11
  store i8 101, ptr %str_char_11.43, align 1
  %str_char_12.37 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 12
  store i8 98, ptr %str_char_12.37, align 1
  %str_char_13.29 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 13
  store i8 117, ptr %str_char_13.29, align 1
  %str_char_14.26 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 14
  store i8 102, ptr %str_char_14.26, align 1
  %str_char_15.20 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 15
  store i8 102, ptr %str_char_15.20, align 1
  %str_char_16.14 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 16
  store i8 101, ptr %str_char_16.14, align 1
  %str_char_17.14 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 17
  store i8 114, ptr %str_char_17.14, align 1
  %str_char_18.10 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 18
  store i8 83, ptr %str_char_18.10, align 1
  %str_char_19.9 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 19
  store i8 116, ptr %str_char_19.9, align 1
  %str_char_20.8 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 20
  store i8 97, ptr %str_char_20.8, align 1
  %str_char_21.4 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 21
  store i8 116, ptr %str_char_21.4, align 1
  %str_char_22.3 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 22
  store i8 117, ptr %str_char_22.3, align 1
  %str_char_23.2 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 23
  store i8 115, ptr %str_char_23.2, align 1
  %str_char_24.2 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 24
  store i8 0, ptr %str_char_24.2, align 1
  %arg0_decay.43 = getelementptr [25 x i8], ptr %str_stack.43, i32 0, i32 0
  %.810 = call ptr @wglGetProcAddress(ptr %arg0_decay.43)
  store ptr %.810, ptr @OpenGL___glCheckFramebufferStatus, align 8
  %str_stack.44 = alloca [19 x i8], align 1
  %str_char_0.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 0
  store i8 103, ptr %str_char_0.44, align 1
  %str_char_1.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 1
  store i8 108, ptr %str_char_1.44, align 1
  %str_char_2.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 2
  store i8 71, ptr %str_char_2.44, align 1
  %str_char_3.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 3
  store i8 101, ptr %str_char_3.44, align 1
  %str_char_4.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 4
  store i8 110, ptr %str_char_4.44, align 1
  %str_char_5.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 5
  store i8 82, ptr %str_char_5.44, align 1
  %str_char_6.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 6
  store i8 101, ptr %str_char_6.44, align 1
  %str_char_7.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 7
  store i8 110, ptr %str_char_7.44, align 1
  %str_char_8.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 8
  store i8 100, ptr %str_char_8.44, align 1
  %str_char_9.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 9
  store i8 101, ptr %str_char_9.44, align 1
  %str_char_10.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 10
  store i8 114, ptr %str_char_10.44, align 1
  %str_char_11.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 11
  store i8 98, ptr %str_char_11.44, align 1
  %str_char_12.38 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 12
  store i8 117, ptr %str_char_12.38, align 1
  %str_char_13.30 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 13
  store i8 102, ptr %str_char_13.30, align 1
  %str_char_14.27 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 14
  store i8 102, ptr %str_char_14.27, align 1
  %str_char_15.21 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 15
  store i8 101, ptr %str_char_15.21, align 1
  %str_char_16.15 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 16
  store i8 114, ptr %str_char_16.15, align 1
  %str_char_17.15 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 17
  store i8 115, ptr %str_char_17.15, align 1
  %str_char_18.11 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 18
  store i8 0, ptr %str_char_18.11, align 1
  %arg0_decay.44 = getelementptr [19 x i8], ptr %str_stack.44, i32 0, i32 0
  %.831 = call ptr @wglGetProcAddress(ptr %arg0_decay.44)
  store ptr %.831, ptr @OpenGL___glGenRenderbuffers, align 8
  %str_stack.45 = alloca [22 x i8], align 1
  %str_char_0.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 0
  store i8 103, ptr %str_char_0.45, align 1
  %str_char_1.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 1
  store i8 108, ptr %str_char_1.45, align 1
  %str_char_2.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 2
  store i8 68, ptr %str_char_2.45, align 1
  %str_char_3.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 3
  store i8 101, ptr %str_char_3.45, align 1
  %str_char_4.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 4
  store i8 108, ptr %str_char_4.45, align 1
  %str_char_5.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 5
  store i8 101, ptr %str_char_5.45, align 1
  %str_char_6.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 6
  store i8 116, ptr %str_char_6.45, align 1
  %str_char_7.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 7
  store i8 101, ptr %str_char_7.45, align 1
  %str_char_8.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 8
  store i8 82, ptr %str_char_8.45, align 1
  %str_char_9.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 9
  store i8 101, ptr %str_char_9.45, align 1
  %str_char_10.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 10
  store i8 110, ptr %str_char_10.45, align 1
  %str_char_11.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 11
  store i8 100, ptr %str_char_11.45, align 1
  %str_char_12.39 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 12
  store i8 101, ptr %str_char_12.39, align 1
  %str_char_13.31 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 13
  store i8 114, ptr %str_char_13.31, align 1
  %str_char_14.28 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 14
  store i8 98, ptr %str_char_14.28, align 1
  %str_char_15.22 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 15
  store i8 117, ptr %str_char_15.22, align 1
  %str_char_16.16 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 16
  store i8 102, ptr %str_char_16.16, align 1
  %str_char_17.16 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 17
  store i8 102, ptr %str_char_17.16, align 1
  %str_char_18.12 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 18
  store i8 101, ptr %str_char_18.12, align 1
  %str_char_19.10 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 19
  store i8 114, ptr %str_char_19.10, align 1
  %str_char_20.9 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 20
  store i8 115, ptr %str_char_20.9, align 1
  %str_char_21.5 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 21
  store i8 0, ptr %str_char_21.5, align 1
  %arg0_decay.45 = getelementptr [22 x i8], ptr %str_stack.45, i32 0, i32 0
  %.855 = call ptr @wglGetProcAddress(ptr %arg0_decay.45)
  store ptr %.855, ptr @OpenGL___glDeleteRenderbuffers, align 8
  %str_stack.46 = alloca [19 x i8], align 1
  %str_char_0.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 0
  store i8 103, ptr %str_char_0.46, align 1
  %str_char_1.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 1
  store i8 108, ptr %str_char_1.46, align 1
  %str_char_2.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 2
  store i8 66, ptr %str_char_2.46, align 1
  %str_char_3.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 3
  store i8 105, ptr %str_char_3.46, align 1
  %str_char_4.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 4
  store i8 110, ptr %str_char_4.46, align 1
  %str_char_5.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 5
  store i8 100, ptr %str_char_5.46, align 1
  %str_char_6.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 6
  store i8 82, ptr %str_char_6.46, align 1
  %str_char_7.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 7
  store i8 101, ptr %str_char_7.46, align 1
  %str_char_8.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 8
  store i8 110, ptr %str_char_8.46, align 1
  %str_char_9.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 9
  store i8 100, ptr %str_char_9.46, align 1
  %str_char_10.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 10
  store i8 101, ptr %str_char_10.46, align 1
  %str_char_11.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 11
  store i8 114, ptr %str_char_11.46, align 1
  %str_char_12.40 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 12
  store i8 98, ptr %str_char_12.40, align 1
  %str_char_13.32 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 13
  store i8 117, ptr %str_char_13.32, align 1
  %str_char_14.29 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 14
  store i8 102, ptr %str_char_14.29, align 1
  %str_char_15.23 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 15
  store i8 102, ptr %str_char_15.23, align 1
  %str_char_16.17 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 16
  store i8 101, ptr %str_char_16.17, align 1
  %str_char_17.17 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 17
  store i8 114, ptr %str_char_17.17, align 1
  %str_char_18.13 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 18
  store i8 0, ptr %str_char_18.13, align 1
  %arg0_decay.46 = getelementptr [19 x i8], ptr %str_stack.46, i32 0, i32 0
  %.876 = call ptr @wglGetProcAddress(ptr %arg0_decay.46)
  store ptr %.876, ptr @OpenGL___glBindRenderbuffer, align 8
  %str_stack.47 = alloca [22 x i8], align 1
  %str_char_0.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 0
  store i8 103, ptr %str_char_0.47, align 1
  %str_char_1.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 1
  store i8 108, ptr %str_char_1.47, align 1
  %str_char_2.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 2
  store i8 82, ptr %str_char_2.47, align 1
  %str_char_3.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 3
  store i8 101, ptr %str_char_3.47, align 1
  %str_char_4.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 4
  store i8 110, ptr %str_char_4.47, align 1
  %str_char_5.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 5
  store i8 100, ptr %str_char_5.47, align 1
  %str_char_6.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 6
  store i8 101, ptr %str_char_6.47, align 1
  %str_char_7.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 7
  store i8 114, ptr %str_char_7.47, align 1
  %str_char_8.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 8
  store i8 98, ptr %str_char_8.47, align 1
  %str_char_9.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 9
  store i8 117, ptr %str_char_9.47, align 1
  %str_char_10.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 10
  store i8 102, ptr %str_char_10.47, align 1
  %str_char_11.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 11
  store i8 102, ptr %str_char_11.47, align 1
  %str_char_12.41 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 12
  store i8 101, ptr %str_char_12.41, align 1
  %str_char_13.33 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 13
  store i8 114, ptr %str_char_13.33, align 1
  %str_char_14.30 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 14
  store i8 83, ptr %str_char_14.30, align 1
  %str_char_15.24 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 15
  store i8 116, ptr %str_char_15.24, align 1
  %str_char_16.18 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 16
  store i8 111, ptr %str_char_16.18, align 1
  %str_char_17.18 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 17
  store i8 114, ptr %str_char_17.18, align 1
  %str_char_18.14 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 18
  store i8 97, ptr %str_char_18.14, align 1
  %str_char_19.11 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 19
  store i8 103, ptr %str_char_19.11, align 1
  %str_char_20.10 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 20
  store i8 101, ptr %str_char_20.10, align 1
  %str_char_21.6 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 21
  store i8 0, ptr %str_char_21.6, align 1
  %arg0_decay.47 = getelementptr [22 x i8], ptr %str_stack.47, i32 0, i32 0
  %.900 = call ptr @wglGetProcAddress(ptr %arg0_decay.47)
  store ptr %.900, ptr @OpenGL___glRenderbufferStorage, align 8
  %str_stack.48 = alloca [26 x i8], align 1
  %str_char_0.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 0
  store i8 103, ptr %str_char_0.48, align 1
  %str_char_1.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 1
  store i8 108, ptr %str_char_1.48, align 1
  %str_char_2.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 2
  store i8 70, ptr %str_char_2.48, align 1
  %str_char_3.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 3
  store i8 114, ptr %str_char_3.48, align 1
  %str_char_4.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 4
  store i8 97, ptr %str_char_4.48, align 1
  %str_char_5.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 5
  store i8 109, ptr %str_char_5.48, align 1
  %str_char_6.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 6
  store i8 101, ptr %str_char_6.48, align 1
  %str_char_7.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 7
  store i8 98, ptr %str_char_7.48, align 1
  %str_char_8.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 8
  store i8 117, ptr %str_char_8.48, align 1
  %str_char_9.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 9
  store i8 102, ptr %str_char_9.48, align 1
  %str_char_10.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 10
  store i8 102, ptr %str_char_10.48, align 1
  %str_char_11.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 11
  store i8 101, ptr %str_char_11.48, align 1
  %str_char_12.42 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 12
  store i8 114, ptr %str_char_12.42, align 1
  %str_char_13.34 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 13
  store i8 82, ptr %str_char_13.34, align 1
  %str_char_14.31 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 14
  store i8 101, ptr %str_char_14.31, align 1
  %str_char_15.25 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 15
  store i8 110, ptr %str_char_15.25, align 1
  %str_char_16.19 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 16
  store i8 100, ptr %str_char_16.19, align 1
  %str_char_17.19 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 17
  store i8 101, ptr %str_char_17.19, align 1
  %str_char_18.15 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 18
  store i8 114, ptr %str_char_18.15, align 1
  %str_char_19.12 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 19
  store i8 98, ptr %str_char_19.12, align 1
  %str_char_20.11 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 20
  store i8 117, ptr %str_char_20.11, align 1
  %str_char_21.7 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 21
  store i8 102, ptr %str_char_21.7, align 1
  %str_char_22.4 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 22
  store i8 102, ptr %str_char_22.4, align 1
  %str_char_23.3 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 23
  store i8 101, ptr %str_char_23.3, align 1
  %str_char_24.3 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 24
  store i8 114, ptr %str_char_24.3, align 1
  %str_char_25.2 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 25
  store i8 0, ptr %str_char_25.2, align 1
  %arg0_decay.48 = getelementptr [26 x i8], ptr %str_stack.48, i32 0, i32 0
  %.928 = call ptr @wglGetProcAddress(ptr %arg0_decay.48)
  store ptr %.928, ptr @OpenGL___glFramebufferRenderbuffer, align 8
  %str_stack.49 = alloca [17 x i8], align 1
  %str_char_0.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 0
  store i8 103, ptr %str_char_0.49, align 1
  %str_char_1.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 1
  store i8 108, ptr %str_char_1.49, align 1
  %str_char_2.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 2
  store i8 71, ptr %str_char_2.49, align 1
  %str_char_3.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 3
  store i8 101, ptr %str_char_3.49, align 1
  %str_char_4.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 4
  store i8 110, ptr %str_char_4.49, align 1
  %str_char_5.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 5
  store i8 101, ptr %str_char_5.49, align 1
  %str_char_6.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 6
  store i8 114, ptr %str_char_6.49, align 1
  %str_char_7.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 7
  store i8 97, ptr %str_char_7.49, align 1
  %str_char_8.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 8
  store i8 116, ptr %str_char_8.49, align 1
  %str_char_9.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 9
  store i8 101, ptr %str_char_9.49, align 1
  %str_char_10.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 10
  store i8 77, ptr %str_char_10.49, align 1
  %str_char_11.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 11
  store i8 105, ptr %str_char_11.49, align 1
  %str_char_12.43 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 12
  store i8 112, ptr %str_char_12.43, align 1
  %str_char_13.35 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 13
  store i8 109, ptr %str_char_13.35, align 1
  %str_char_14.32 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 14
  store i8 97, ptr %str_char_14.32, align 1
  %str_char_15.26 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 15
  store i8 112, ptr %str_char_15.26, align 1
  %str_char_16.20 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 16
  store i8 0, ptr %str_char_16.20, align 1
  %arg0_decay.49 = getelementptr [17 x i8], ptr %str_stack.49, i32 0, i32 0
  %.947 = call ptr @wglGetProcAddress(ptr %arg0_decay.49)
  store ptr %.947, ptr @OpenGL___glGenerateMipmap, align 8
  %str_stack.50 = alloca [16 x i8], align 1
  %str_char_0.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 0
  store i8 103, ptr %str_char_0.50, align 1
  %str_char_1.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 1
  store i8 108, ptr %str_char_1.50, align 1
  %str_char_2.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 2
  store i8 65, ptr %str_char_2.50, align 1
  %str_char_3.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 3
  store i8 99, ptr %str_char_3.50, align 1
  %str_char_4.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 4
  store i8 116, ptr %str_char_4.50, align 1
  %str_char_5.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 5
  store i8 105, ptr %str_char_5.50, align 1
  %str_char_6.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 6
  store i8 118, ptr %str_char_6.50, align 1
  %str_char_7.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 7
  store i8 101, ptr %str_char_7.50, align 1
  %str_char_8.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 8
  store i8 84, ptr %str_char_8.50, align 1
  %str_char_9.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 9
  store i8 101, ptr %str_char_9.50, align 1
  %str_char_10.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 10
  store i8 120, ptr %str_char_10.50, align 1
  %str_char_11.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 11
  store i8 116, ptr %str_char_11.50, align 1
  %str_char_12.44 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 12
  store i8 117, ptr %str_char_12.44, align 1
  %str_char_13.36 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 13
  store i8 114, ptr %str_char_13.36, align 1
  %str_char_14.33 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 14
  store i8 101, ptr %str_char_14.33, align 1
  %str_char_15.27 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 15
  store i8 0, ptr %str_char_15.27, align 1
  %arg0_decay.50 = getelementptr [16 x i8], ptr %str_stack.50, i32 0, i32 0
  %.965 = call ptr @wglGetProcAddress(ptr %arg0_decay.50)
  store ptr %.965, ptr @OpenGL___glActiveTexture, align 8
  %str_stack.51 = alloca [13 x i8], align 1
  %str_char_0.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 0
  store i8 103, ptr %str_char_0.51, align 1
  %str_char_1.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 1
  store i8 108, ptr %str_char_1.51, align 1
  %str_char_2.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 2
  store i8 68, ptr %str_char_2.51, align 1
  %str_char_3.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 3
  store i8 114, ptr %str_char_3.51, align 1
  %str_char_4.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 4
  store i8 97, ptr %str_char_4.51, align 1
  %str_char_5.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 5
  store i8 119, ptr %str_char_5.51, align 1
  %str_char_6.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 6
  store i8 65, ptr %str_char_6.51, align 1
  %str_char_7.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 7
  store i8 114, ptr %str_char_7.51, align 1
  %str_char_8.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 8
  store i8 114, ptr %str_char_8.51, align 1
  %str_char_9.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 9
  store i8 97, ptr %str_char_9.51, align 1
  %str_char_10.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 10
  store i8 121, ptr %str_char_10.51, align 1
  %str_char_11.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 11
  store i8 115, ptr %str_char_11.51, align 1
  %str_char_12.45 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 12
  store i8 0, ptr %str_char_12.45, align 1
  %arg0_decay.51 = getelementptr [13 x i8], ptr %str_stack.51, i32 0, i32 0
  %.980 = call ptr @wglGetProcAddress(ptr %arg0_decay.51)
  store ptr %.980, ptr @OpenGL___glDrawArrays, align 8
  %str_stack.52 = alloca [15 x i8], align 1
  %str_char_0.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 0
  store i8 103, ptr %str_char_0.52, align 1
  %str_char_1.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 1
  store i8 108, ptr %str_char_1.52, align 1
  %str_char_2.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 2
  store i8 68, ptr %str_char_2.52, align 1
  %str_char_3.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 3
  store i8 114, ptr %str_char_3.52, align 1
  %str_char_4.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 4
  store i8 97, ptr %str_char_4.52, align 1
  %str_char_5.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 5
  store i8 119, ptr %str_char_5.52, align 1
  %str_char_6.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 6
  store i8 69, ptr %str_char_6.52, align 1
  %str_char_7.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 7
  store i8 108, ptr %str_char_7.52, align 1
  %str_char_8.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 8
  store i8 101, ptr %str_char_8.52, align 1
  %str_char_9.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 9
  store i8 109, ptr %str_char_9.52, align 1
  %str_char_10.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 10
  store i8 101, ptr %str_char_10.52, align 1
  %str_char_11.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 11
  store i8 110, ptr %str_char_11.52, align 1
  %str_char_12.46 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 12
  store i8 116, ptr %str_char_12.46, align 1
  %str_char_13.37 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 13
  store i8 115, ptr %str_char_13.37, align 1
  %str_char_14.34 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 14
  store i8 0, ptr %str_char_14.34, align 1
  %arg0_decay.52 = getelementptr [15 x i8], ptr %str_stack.52, i32 0, i32 0
  %.997 = call ptr @wglGetProcAddress(ptr %arg0_decay.52)
  store ptr %.997, ptr @OpenGL___glDrawElements, align 8
  %str_stack.53 = alloca [22 x i8], align 1
  %str_char_0.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 0
  store i8 103, ptr %str_char_0.53, align 1
  %str_char_1.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 1
  store i8 108, ptr %str_char_1.53, align 1
  %str_char_2.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 2
  store i8 68, ptr %str_char_2.53, align 1
  %str_char_3.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 3
  store i8 114, ptr %str_char_3.53, align 1
  %str_char_4.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 4
  store i8 97, ptr %str_char_4.53, align 1
  %str_char_5.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 5
  store i8 119, ptr %str_char_5.53, align 1
  %str_char_6.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 6
  store i8 65, ptr %str_char_6.53, align 1
  %str_char_7.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 7
  store i8 114, ptr %str_char_7.53, align 1
  %str_char_8.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 8
  store i8 114, ptr %str_char_8.53, align 1
  %str_char_9.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 9
  store i8 97, ptr %str_char_9.53, align 1
  %str_char_10.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 10
  store i8 121, ptr %str_char_10.53, align 1
  %str_char_11.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 11
  store i8 115, ptr %str_char_11.53, align 1
  %str_char_12.47 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 12
  store i8 73, ptr %str_char_12.47, align 1
  %str_char_13.38 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 13
  store i8 110, ptr %str_char_13.38, align 1
  %str_char_14.35 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 14
  store i8 115, ptr %str_char_14.35, align 1
  %str_char_15.28 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 15
  store i8 116, ptr %str_char_15.28, align 1
  %str_char_16.21 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 16
  store i8 97, ptr %str_char_16.21, align 1
  %str_char_17.20 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 17
  store i8 110, ptr %str_char_17.20, align 1
  %str_char_18.16 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 18
  store i8 99, ptr %str_char_18.16, align 1
  %str_char_19.13 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 19
  store i8 101, ptr %str_char_19.13, align 1
  %str_char_20.12 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 20
  store i8 100, ptr %str_char_20.12, align 1
  %str_char_21.8 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 21
  store i8 0, ptr %str_char_21.8, align 1
  %arg0_decay.53 = getelementptr [22 x i8], ptr %str_stack.53, i32 0, i32 0
  %.1021 = call ptr @wglGetProcAddress(ptr %arg0_decay.53)
  store ptr %.1021, ptr @OpenGL___glDrawArraysInstanced, align 8
  %str_stack.54 = alloca [24 x i8], align 1
  %str_char_0.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 0
  store i8 103, ptr %str_char_0.54, align 1
  %str_char_1.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 1
  store i8 108, ptr %str_char_1.54, align 1
  %str_char_2.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 2
  store i8 68, ptr %str_char_2.54, align 1
  %str_char_3.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 3
  store i8 114, ptr %str_char_3.54, align 1
  %str_char_4.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 4
  store i8 97, ptr %str_char_4.54, align 1
  %str_char_5.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 5
  store i8 119, ptr %str_char_5.54, align 1
  %str_char_6.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 6
  store i8 69, ptr %str_char_6.54, align 1
  %str_char_7.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 7
  store i8 108, ptr %str_char_7.54, align 1
  %str_char_8.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 8
  store i8 101, ptr %str_char_8.54, align 1
  %str_char_9.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 9
  store i8 109, ptr %str_char_9.54, align 1
  %str_char_10.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 10
  store i8 101, ptr %str_char_10.54, align 1
  %str_char_11.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 11
  store i8 110, ptr %str_char_11.54, align 1
  %str_char_12.48 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 12
  store i8 116, ptr %str_char_12.48, align 1
  %str_char_13.39 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 13
  store i8 115, ptr %str_char_13.39, align 1
  %str_char_14.36 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 14
  store i8 73, ptr %str_char_14.36, align 1
  %str_char_15.29 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 15
  store i8 110, ptr %str_char_15.29, align 1
  %str_char_16.22 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 16
  store i8 115, ptr %str_char_16.22, align 1
  %str_char_17.21 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 17
  store i8 116, ptr %str_char_17.21, align 1
  %str_char_18.17 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 18
  store i8 97, ptr %str_char_18.17, align 1
  %str_char_19.14 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 19
  store i8 110, ptr %str_char_19.14, align 1
  %str_char_20.13 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 20
  store i8 99, ptr %str_char_20.13, align 1
  %str_char_21.9 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 21
  store i8 101, ptr %str_char_21.9, align 1
  %str_char_22.5 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 22
  store i8 100, ptr %str_char_22.5, align 1
  %str_char_23.4 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 23
  store i8 0, ptr %str_char_23.4, align 1
  %arg0_decay.54 = getelementptr [24 x i8], ptr %str_stack.54, i32 0, i32 0
  %.1047 = call ptr @wglGetProcAddress(ptr %arg0_decay.54)
  store ptr %.1047, ptr @OpenGL___glDrawElementsInstanced, align 8
  ret void
}

define void @standard__atomic__load_fence__0__ret_voidE1() {
entry:
  call void asm sideeffect "lfence", "~{memory}"()
  ret void
}

define void @standard__atomic__store_fence__0__ret_voidE1() {
entry:
  call void asm sideeffect "sfence", "~{memory}"()
  ret void
}

define void @standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1(ptr %ptr, ptr %out) {
entry:
  call void asm sideeffect "movq $0, %rsi\0D\0A                movq $1, %rdi\0D\0A                movl (%rsi), %eax\0D\0A                movl %eax, (%rdi)", "r,r,~{eax},~{rsi},~{rdi},~{memory}"(ptr %ptr, ptr %out)
  ret void
}

define i32 @standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32(ptr %ptr) {
entry:
  %result = alloca i32, align 4
  store i32 0, ptr %result, align 4
  call void @standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1(ptr %ptr, ptr %result)
  %result.1 = load i32, ptr %result, align 4
  ret i32 %result.1
}

define void @standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1(ptr %ptr, i32 %value) {
entry:
  call void asm sideeffect "movq $0, %rsi\0D\0A                movl $1, %eax\0D\0A                xchgl %eax, (%rsi)", "r,r,~{eax},~{rsi},~{memory}"(ptr %ptr, i32 %value)
  ret void
}

define ptr @standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1(ptr %storage) {
entry:
  %from_void_ptr = bitcast ptr %storage to ptr
  %deref = load i64, ptr %from_void_ptr, align 8
  %int_to_ptr = inttoptr i64 %deref to ptr
  ret ptr %int_to_ptr
}

define void @standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1(ptr %storage, ptr %ptr) {
entry:
  %from_void_ptr = bitcast ptr %storage to ptr
  %ptr_to_int = ptrtoint ptr %ptr to i64
  store i64 %ptr_to_int, ptr %from_void_ptr, align 8
  ret void
}

define i32 @standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1(ptr %fn, ptr %arg, ptr %out) {
entry:
  %.8 = getelementptr inbounds %Thread, ptr %out, i32 0, i32 1
  call void @standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1(ptr %.8, i32 1)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %int_to_ptr_zext.1 = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  %.10 = sext i32 0 to i64
  %.11 = call ptr @CreateThread(ptr %int_to_ptr, i64 %.10, ptr %fn, ptr %arg, i32 0, ptr %int_to_ptr.1)
  %ptr_to_int = ptrtoint ptr %.11 to i64
  %.13 = sext i32 0 to i64
  %.14 = icmp eq i64 %ptr_to_int, %.13
  br i1 %.14, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i32 [ %THREAD_ERROR, %then ], [ %THREAD_OK, %ifcont ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %.16 = getelementptr inbounds %Thread, ptr %out, i32 0, i32 1
  call void @standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1(ptr %.16, i32 0)
  %THREAD_ERROR = load i32, ptr @THREAD_ERROR, align 4
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.20 = getelementptr inbounds %Thread, ptr %out, i32 0, i32 0
  %.21 = getelementptr inbounds [8 x i8], ptr %.20, i32 0, i32 0
  call void @standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1(ptr %.21, ptr %.11)
  %THREAD_OK = load i32, ptr @THREAD_OK, align 4
  br label %common.ret
}

define i32 @standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1(ptr %t) {
entry:
  %.4 = getelementptr inbounds %Thread, ptr %t, i32 0, i32 1
  %.5 = call i32 @standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32(ptr %.4)
  %.6 = icmp eq i32 %.5, 0
  br i1 %.6, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i32 [ %THREAD_OK, %then ], [ %ternary_result, %ifcont ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %THREAD_OK = load i32, ptr @THREAD_OK, align 4
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.10 = getelementptr inbounds %Thread, ptr %t, i32 0, i32 0
  %.11 = getelementptr inbounds [8 x i8], ptr %.10, i32 0, i32 0
  %.12 = call ptr @standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1(ptr %.11)
  %WIN32_INFINITE = load i32, ptr @WIN32_INFINITE, align 4
  %.14 = call i32 @WaitForSingleObject(ptr %.12, i32 %WIN32_INFINITE)
  %.16 = call i32 @CloseHandle(ptr %.12)
  %.17 = getelementptr inbounds %Thread, ptr %t, i32 0, i32 1
  call void @standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1(ptr %.17, i32 0)
  %.19 = icmp eq i32 %.14, 0
  %THREAD_OK.1 = load i32, ptr @THREAD_OK, align 4
  %THREAD_ERROR = load i32, ptr @THREAD_ERROR, align 4
  %ternary_result = select i1 %.19, i32 %THREAD_OK.1, i32 %THREAD_ERROR
  br label %common.ret
}

define i32 @standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1(ptr %s, i32 %initial_value) {
entry:
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %int_to_ptr_zext.1 = zext i32 0 to i64
  %int_to_ptr.1 = inttoptr i64 %int_to_ptr_zext.1 to ptr
  %.6 = call ptr @CreateSemaphoreA(ptr %int_to_ptr, i32 %initial_value, i32 2147483647, ptr %int_to_ptr.1)
  %ptr_to_int = ptrtoint ptr %.6 to i64
  %.8 = sext i32 0 to i64
  %.9 = icmp eq i64 %ptr_to_int, %.8
  br i1 %.9, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont, %then
  %common.ret.op = phi i32 [ %THREAD_ERROR, %then ], [ %THREAD_OK, %ifcont ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %THREAD_ERROR = load i32, ptr @THREAD_ERROR, align 4
  br label %common.ret

ifcont:                                           ; preds = %entry
  %.13 = getelementptr inbounds %Semaphore, ptr %s, i32 0, i32 0
  %.14 = getelementptr inbounds [32 x i8], ptr %.13, i32 0, i32 0
  call void @standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1(ptr %.14, ptr %.6)
  %THREAD_OK = load i32, ptr @THREAD_OK, align 4
  br label %common.ret
}

define void @standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1(ptr %s) {
entry:
  %.4 = getelementptr inbounds %Semaphore, ptr %s, i32 0, i32 0
  %.5 = getelementptr inbounds [32 x i8], ptr %.4, i32 0, i32 0
  %.6 = call ptr @standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1(ptr %.5)
  %.8 = call i32 @CloseHandle(ptr %.6)
  ret void
}

define void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr %s) {
entry:
  %.4 = getelementptr inbounds %Semaphore, ptr %s, i32 0, i32 0
  %.5 = getelementptr inbounds [32 x i8], ptr %.4, i32 0, i32 0
  %.6 = call ptr @standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1(ptr %.5)
  %WIN32_INFINITE = load i32, ptr @WIN32_INFINITE, align 4
  %.8 = call i32 @WaitForSingleObject(ptr %.6, i32 %WIN32_INFINITE)
  ret void
}

define void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr %s) {
entry:
  %.4 = getelementptr inbounds %Semaphore, ptr %s, i32 0, i32 0
  %.5 = getelementptr inbounds [32 x i8], ptr %.4, i32 0, i32 0
  %.6 = call ptr @standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1(ptr %.5)
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  %.8 = call i32 @ReleaseSemaphore(ptr %.6, i32 1, ptr %int_to_ptr)
  ret void
}

define i1 @btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1(i32 %mx, i32 %my, i32 %cx, i32 %cy) {
entry:
  %.16 = sdiv i32 220, 2
  %.18 = sdiv i32 52, 2
  %.20 = sub i32 %my, %cy
  %.22 = sub i32 0, %.18
  %.23 = icmp slt i32 %.20, %.22
  %.25 = icmp sgt i32 %.20, %.18
  %spec.select = select i1 %.23, i1 true, i1 %.25
  br i1 %spec.select, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont, %entry
  %common.ret.op = phi i1 [ false, %entry ], [ %spec.select2, %ifcont ]
  ret i1 %common.ret.op

ifcont:                                           ; preds = %entry
  %.30 = add i32 %.20, %.18
  %.31 = sitofp i32 %.30 to float
  %.32 = sitofp i32 52 to float
  %.33 = fdiv float %.31, %.32
  %.35 = fsub float %.33, 5.000000e-01
  %.36 = mul i32 18, 2
  %.37 = sitofp i32 %.36 to float
  %.38 = fmul float %.35, %.37
  %.39 = fptosi float %.38 to i32
  %.41 = sub i32 %mx, %cx
  %.42 = sub i32 %.41, %.39
  %.44 = sub i32 0, %.16
  %.45 = icmp slt i32 %.42, %.44
  %.47 = icmp sgt i32 %.42, %.16
  %spec.select1 = select i1 %.45, i1 true, i1 %.47
  %spec.select2 = select i1 %spec.select1, i1 false, i1 true
  br label %common.ret
}

define i1 @btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1(i32 %mx, i32 %my, i32 %cx, i32 %cy, i32 %half_w, i32 %half_h) {
entry:
  %.19 = sdiv i32 18, 2
  %.21 = sub i32 %my, %cy
  %.23 = sub i32 0, %half_h
  %.24 = icmp slt i32 %.21, %.23
  %.26 = icmp sgt i32 %.21, %half_h
  %spec.select = select i1 %.24, i1 true, i1 %.26
  br i1 %spec.select, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont, %entry
  %common.ret.op = phi i1 [ false, %entry ], [ %spec.select2, %ifcont ]
  ret i1 %common.ret.op

ifcont:                                           ; preds = %entry
  %.31 = add i32 %.21, %half_h
  %.32 = sitofp i32 %.31 to float
  %.33 = mul i32 %half_h, 2
  %.34 = sitofp i32 %.33 to float
  %.35 = fdiv float %.32, %.34
  %.37 = fsub float %.35, 5.000000e-01
  %.38 = mul i32 %.19, 2
  %.39 = sitofp i32 %.38 to float
  %.40 = fmul float %.37, %.39
  %.41 = fptosi float %.40 to i32
  %.43 = sub i32 %mx, %cx
  %.44 = sub i32 %.43, %.41
  %.46 = sub i32 0, %half_w
  %.47 = icmp slt i32 %.44, %.46
  %.49 = icmp sgt i32 %.44, %half_w
  %spec.select1 = select i1 %.47, i1 true, i1 %.49
  %spec.select2 = select i1 %spec.select1, i1 false, i1 true
  br label %common.ret
}

define void @draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(i32 %cx, i32 %cy, i32 %half_w, i32 %half_h, i32 %slant, float %inv_w, float %inv_h) {
entry:
  %.24 = sub i32 %cx, %half_w
  %.25 = sub i32 %.24, %slant
  %.27 = add i32 %cx, %half_w
  %.28 = sub i32 %.27, %slant
  %.30 = sub i32 %cx, %half_w
  %.31 = add i32 %.30, %slant
  %.33 = add i32 %cx, %half_w
  %.34 = add i32 %.33, %slant
  %.36 = sub i32 %cy, %half_h
  %.38 = add i32 %cy, %half_h
  %.40 = sitofp i32 %.36 to float
  %.41 = fmul float %.40, %inv_h
  %.42 = fsub float %.41, 1.000000e+00
  %.44 = sitofp i32 %.38 to float
  %.45 = fmul float %.44, %inv_h
  %.46 = fsub float %.45, 1.000000e+00
  %GL_QUADS = load i32, ptr @GL_QUADS, align 4
  call void @glBegin(i32 %GL_QUADS)
  call void @glColor4f(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 5.000000e-01)
  %.50 = sitofp i32 %.25 to float
  %.51 = fmul float %.50, %inv_w
  %.52 = fsub float %.51, 1.000000e+00
  %.53 = fadd float %.52, 0x3F789374C0000000
  %.54 = fsub float %.42, 0x3F847AE140000000
  call void @glVertex2f(float %.53, float %.54)
  %.56 = sitofp i32 %.28 to float
  %.57 = fmul float %.56, %inv_w
  %.58 = fsub float %.57, 1.000000e+00
  %.59 = fadd float %.58, 0x3F789374C0000000
  %.60 = fsub float %.42, 0x3F847AE140000000
  call void @glVertex2f(float %.59, float %.60)
  %.62 = sitofp i32 %.34 to float
  %.63 = fmul float %.62, %inv_w
  %.64 = fsub float %.63, 1.000000e+00
  %.65 = fadd float %.64, 0x3F789374C0000000
  %.66 = fsub float %.46, 0x3F847AE140000000
  call void @glVertex2f(float %.65, float %.66)
  %.68 = sitofp i32 %.31 to float
  %.69 = fmul float %.68, %inv_w
  %.70 = fsub float %.69, 1.000000e+00
  %.71 = fadd float %.70, 0x3F789374C0000000
  %.72 = fsub float %.46, 0x3F847AE140000000
  call void @glVertex2f(float %.71, float %.72)
  call void @glEnd()
  %GL_QUADS.1 = load i32, ptr @GL_QUADS, align 4
  call void @glBegin(i32 %GL_QUADS.1)
  call void @glColor4f(float 0x3FA47AE140000000, float 0x3FB1EB8520000000, float 0x3FC70A3D80000000, float 0x3FED70A3E0000000)
  %.77 = sitofp i32 %.25 to float
  %.78 = fmul float %.77, %inv_w
  %.79 = fsub float %.78, 1.000000e+00
  call void @glVertex2f(float %.79, float %.42)
  call void @glColor4f(float 0x3FA47AE140000000, float 0x3FB1EB8520000000, float 0x3FC70A3D80000000, float 0x3FED70A3E0000000)
  %.82 = sitofp i32 %.28 to float
  %.83 = fmul float %.82, %inv_w
  %.84 = fsub float %.83, 1.000000e+00
  call void @glVertex2f(float %.84, float %.42)
  call void @glColor4f(float 0x3FB47AE140000000, float 0x3FC1EB8520000000, float 0x3FD5C28F60000000, float 0x3FED70A3E0000000)
  %.87 = sitofp i32 %.34 to float
  %.88 = fmul float %.87, %inv_w
  %.89 = fsub float %.88, 1.000000e+00
  call void @glVertex2f(float %.89, float %.46)
  call void @glColor4f(float 0x3FB47AE140000000, float 0x3FC1EB8520000000, float 0x3FD5C28F60000000, float 0x3FED70A3E0000000)
  %.92 = sitofp i32 %.31 to float
  %.93 = fmul float %.92, %inv_w
  %.94 = fsub float %.93, 1.000000e+00
  call void @glVertex2f(float %.94, float %.46)
  call void @glEnd()
  call void @glLineWidth(float 1.500000e+00)
  %GL_LINES = load i32, ptr @GL_LINES, align 4
  call void @glBegin(i32 %GL_LINES)
  call void @glColor4f(float 0x3FD99999A0000000, float 0x3FE6666660000000, float 1.000000e+00, float 0x3FE99999A0000000)
  %.100 = sitofp i32 %.31 to float
  %.101 = fmul float %.100, %inv_w
  %.102 = fsub float %.101, 1.000000e+00
  call void @glVertex2f(float %.102, float %.46)
  %.104 = sitofp i32 %.34 to float
  %.105 = fmul float %.104, %inv_w
  %.106 = fsub float %.105, 1.000000e+00
  call void @glVertex2f(float %.106, float %.46)
  call void @glEnd()
  %GL_LINES.1 = load i32, ptr @GL_LINES, align 4
  call void @glBegin(i32 %GL_LINES.1)
  call void @glColor4f(float 0.000000e+00, float 0x3FA99999A0000000, float 0x3FC3333340000000, float 0x3FECCCCCC0000000)
  %.111 = sitofp i32 %.25 to float
  %.112 = fmul float %.111, %inv_w
  %.113 = fsub float %.112, 1.000000e+00
  call void @glVertex2f(float %.113, float %.42)
  %.115 = sitofp i32 %.28 to float
  %.116 = fmul float %.115, %inv_w
  %.117 = fsub float %.116, 1.000000e+00
  call void @glVertex2f(float %.117, float %.42)
  call void @glEnd()
  call void @glLineWidth(float 0x3FFCCCCCC0000000)
  %GL_LINE_LOOP = load i32, ptr @GL_LINE_LOOP, align 4
  call void @glBegin(i32 %GL_LINE_LOOP)
  call void @glColor4f(float 2.500000e-01, float 0x3FE19999A0000000, float 1.000000e+00, float 0x3FEE666660000000)
  %.123 = sitofp i32 %.25 to float
  %.124 = fmul float %.123, %inv_w
  %.125 = fsub float %.124, 1.000000e+00
  call void @glVertex2f(float %.125, float %.42)
  %.127 = sitofp i32 %.28 to float
  %.128 = fmul float %.127, %inv_w
  %.129 = fsub float %.128, 1.000000e+00
  call void @glVertex2f(float %.129, float %.42)
  %.131 = sitofp i32 %.34 to float
  %.132 = fmul float %.131, %inv_w
  %.133 = fsub float %.132, 1.000000e+00
  call void @glVertex2f(float %.133, float %.46)
  %.135 = sitofp i32 %.31 to float
  %.136 = fmul float %.135, %inv_w
  %.137 = fsub float %.136, 1.000000e+00
  call void @glVertex2f(float %.137, float %.46)
  call void @glEnd()
  ret void
}

define i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %str, i32 %scale) {
entry:
  br label %while.cond

while.cond:                                       ; preds = %ifcont, %entry
  %ci.0 = phi i32 [ 0, %entry ], [ %.21, %ifcont ]
  %count.0 = phi i32 [ 0, %entry ], [ %.19, %ifcont ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %ci.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.13 = zext i8 %ptr_load to i32
  %.15 = icmp eq i32 %.13, 0
  br i1 %.15, label %then, label %ifcont

then:                                             ; preds = %while.cond
  %.24 = icmp eq i32 %count.0, 0
  %.28 = mul i32 %count.0, 6
  %.29 = mul i32 %.28, %scale
  %.30 = sub i32 %.29, %scale
  %common.ret.op = select i1 %.24, i32 0, i32 %.30
  ret i32 %common.ret.op

ifcont:                                           ; preds = %while.cond
  %.19 = add i32 %count.0, 1
  %.21 = add i32 %ci.0, 1
  br label %while.cond
}

define void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %str, i32 %px, i32 %py, i32 %scale, float %inv_w, float %inv_h) {
entry:
  %GL_QUADS = load i32, ptr @GL_QUADS, align 4
  call void @glBegin(i32 %GL_QUADS)
  br label %while.cond

while.cond:                                       ; preds = %while.end.1, %entry
  %cx.0 = phi i32 [ %px, %entry ], [ %.104, %while.end.1 ]
  %ci.0 = phi i32 [ 0, %entry ], [ %.106, %while.end.1 ]
  %ptr_gep = getelementptr inbounds i8, ptr %str, i32 %ci.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %.34 = zext i8 %ptr_load to i32
  %.36 = icmp eq i32 %.34, 0
  br i1 %.36, label %then, label %ifcont

then:                                             ; preds = %while.cond
  call void @glEnd()
  ret void

ifcont:                                           ; preds = %while.cond
  %.40 = icmp sge i32 %.34, 97
  %.42 = icmp sle i32 %.34, 122
  %spec.select = select i1 %.40, i1 %.42, i1 false
  %.45 = sub i32 %.34, 32
  %c.0 = select i1 %spec.select, i32 %.45, i32 %.34
  %.49 = call ptr @font_glyph__1__intE1__ret_dataE1_ptr1_ubits32(i32 %c.0)
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.end.2, %ifcont
  %col.0 = phi i32 [ 0, %ifcont ], [ %.99, %while.end.2 ]
  %.53 = icmp slt i32 %col.0, 5
  br i1 %.53, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep.1 = getelementptr inbounds i32, ptr %.49, i32 %col.0
  %ptr_load.1 = load i32, ptr %ptr_gep.1, align 4
  br label %while.cond.2

while.end.1:                                      ; preds = %while.cond.1
  %.102 = add i32 5, 1
  %.103 = mul i32 %.102, %scale
  %.104 = add i32 %cx.0, %.103
  %.106 = add i32 %ci.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %ifcont.2, %while.body.1
  %row.0 = phi i32 [ 0, %while.body.1 ], [ %.96, %ifcont.2 ]
  %.58 = icmp slt i32 %row.0, 7
  br i1 %.58, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.60 = shl i32 1, %row.0
  %.61 = and i32 %ptr_load.1, %.60
  %tobool = icmp ne i32 %.61, 0
  br i1 %tobool, label %then.2, label %ifcont.2

while.end.2:                                      ; preds = %while.cond.2
  %.99 = add i32 %col.0, 1
  br label %while.cond.1

then.2:                                           ; preds = %while.body.2
  %.63 = mul i32 %col.0, %scale
  %.64 = add i32 %cx.0, %.63
  %.66 = sub i32 6, %row.0
  %.67 = mul i32 %.66, %scale
  %.68 = add i32 %py, %.67
  %.70 = add i32 %.64, %scale
  %.72 = add i32 %.68, %scale
  %.74 = sitofp i32 %.64 to float
  %.75 = fmul float %.74, %inv_w
  %.76 = fsub float %.75, 1.000000e+00
  %.78 = sitofp i32 %.68 to float
  %.79 = fmul float %.78, %inv_h
  %.80 = fsub float %.79, 1.000000e+00
  %.82 = sitofp i32 %.70 to float
  %.83 = fmul float %.82, %inv_w
  %.84 = fsub float %.83, 1.000000e+00
  %.86 = sitofp i32 %.72 to float
  %.87 = fmul float %.86, %inv_h
  %.88 = fsub float %.87, 1.000000e+00
  call void @glVertex2f(float %.76, float %.80)
  call void @glVertex2f(float %.84, float %.80)
  call void @glVertex2f(float %.84, float %.88)
  call void @glVertex2f(float %.76, float %.88)
  br label %ifcont.2

ifcont.2:                                         ; preds = %while.body.2, %then.2
  %.96 = add i32 %row.0, 1
  br label %while.cond.2
}

define void @draw_quit_dialog__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %.27 = sitofp i32 %w to float
  %.28 = fdiv float 2.000000e+00, %.27
  %.30 = sitofp i32 %h to float
  %.31 = fdiv float 2.000000e+00, %.30
  %.33 = sdiv i32 %w, 2
  %.35 = sdiv i32 %h, 2
  %.40 = sdiv i32 420, 2
  %.41 = sub i32 %.33, %.40
  %.43 = sdiv i32 160, 2
  %.44 = sub i32 %.35, %.43
  %.46 = sdiv i32 420, 2
  %.47 = add i32 %.33, %.46
  %.49 = sdiv i32 160, 2
  %.50 = add i32 %.35, %.49
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D)
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND)
  %GL_SRC_ALPHA = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE_MINUS_SRC_ALPHA = load i32, ptr @GL_ONE_MINUS_SRC_ALPHA, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA, i32 %GL_ONE_MINUS_SRC_ALPHA)
  %.56 = sitofp i32 %.41 to float
  %.57 = fmul float %.56, %.28
  %.58 = fsub float %.57, 1.000000e+00
  %.60 = sitofp i32 %.44 to float
  %.61 = fmul float %.60, %.31
  %.62 = fsub float %.61, 1.000000e+00
  %.64 = sitofp i32 %.47 to float
  %.65 = fmul float %.64, %.28
  %.66 = fsub float %.65, 1.000000e+00
  %.68 = sitofp i32 %.50 to float
  %.69 = fmul float %.68, %.31
  %.70 = fsub float %.69, 1.000000e+00
  %GL_QUADS = load i32, ptr @GL_QUADS, align 4
  call void @glBegin(i32 %GL_QUADS)
  call void @glColor4f(float 0x3F947AE140000000, float 0x3FA47AE140000000, float 0x3FBEB851E0000000, float 0x3FEEB851E0000000)
  call void @glVertex2f(float %.58, float %.62)
  call void @glVertex2f(float %.66, float %.62)
  call void @glVertex2f(float %.66, float %.70)
  call void @glVertex2f(float %.58, float %.70)
  call void @glEnd()
  call void @glLineWidth(float 0x3FFCCCCCC0000000)
  %GL_LINE_LOOP = load i32, ptr @GL_LINE_LOOP, align 4
  call void @glBegin(i32 %GL_LINE_LOOP)
  call void @glColor4f(float 2.500000e-01, float 0x3FE19999A0000000, float 1.000000e+00, float 0x3FEE666660000000)
  call void @glVertex2f(float %.58, float %.62)
  call void @glVertex2f(float %.66, float %.62)
  call void @glVertex2f(float %.66, float %.70)
  call void @glVertex2f(float %.58, float %.70)
  call void @glEnd()
  call void @glLineWidth(float 1.000000e+00)
  %GL_LINES = load i32, ptr @GL_LINES, align 4
  call void @glBegin(i32 %GL_LINES)
  call void @glColor4f(float 0x3FD99999A0000000, float 0x3FE6666660000000, float 1.000000e+00, float 0x3FE3333340000000)
  call void @glVertex2f(float %.58, float %.70)
  call void @glVertex2f(float %.66, float %.70)
  call void @glEnd()
  %str_stack = alloca [31 x i8], align 1
  %str_char_0 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 0
  store i8 65, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 1
  store i8 82, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 2
  store i8 69, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 3
  store i8 32, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 4
  store i8 89, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 5
  store i8 79, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 6
  store i8 85, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 7
  store i8 32, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 8
  store i8 83, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 9
  store i8 85, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 10
  store i8 82, ptr %str_char_10, align 1
  %str_char_11 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 11
  store i8 69, ptr %str_char_11, align 1
  %str_char_12 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 12
  store i8 32, ptr %str_char_12, align 1
  %str_char_13 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 13
  store i8 89, ptr %str_char_13, align 1
  %str_char_14 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 14
  store i8 79, ptr %str_char_14, align 1
  %str_char_15 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 15
  store i8 85, ptr %str_char_15, align 1
  %str_char_16 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 16
  store i8 32, ptr %str_char_16, align 1
  %str_char_17 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 17
  store i8 87, ptr %str_char_17, align 1
  %str_char_18 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 18
  store i8 65, ptr %str_char_18, align 1
  %str_char_19 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 19
  store i8 78, ptr %str_char_19, align 1
  %str_char_20 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 20
  store i8 84, ptr %str_char_20, align 1
  %str_char_21 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 21
  store i8 32, ptr %str_char_21, align 1
  %str_char_22 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 22
  store i8 84, ptr %str_char_22, align 1
  %str_char_23 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 23
  store i8 79, ptr %str_char_23, align 1
  %str_char_24 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 24
  store i8 32, ptr %str_char_24, align 1
  %str_char_25 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 25
  store i8 81, ptr %str_char_25, align 1
  %str_char_26 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 26
  store i8 85, ptr %str_char_26, align 1
  %str_char_27 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 27
  store i8 73, ptr %str_char_27, align 1
  %str_char_28 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 28
  store i8 84, ptr %str_char_28, align 1
  %str_char_29 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 29
  store i8 63, ptr %str_char_29, align 1
  %str_char_30 = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 30
  store i8 0, ptr %str_char_30, align 1
  %array_to_elem_ptr = getelementptr [31 x i8], ptr %str_stack, i32 0, i32 0
  %.125 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %array_to_elem_ptr, i32 2)
  %.127 = sdiv i32 %.125, 2
  %.128 = sub i32 %.33, %.127
  %.130 = sdiv i32 160, 2
  %.131 = add i32 %.35, %.130
  %.132 = sub i32 %.131, 36
  call void @glColor4f(float 0x3FEB333340000000, float 0x3FED70A3E0000000, float 1.000000e+00, float 1.000000e+00)
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %array_to_elem_ptr, i32 %.128, i32 %.132, i32 2, float %.28, float %.31)
  %str_stack.1 = alloca [4 x i8], align 1
  %str_char_0.1 = getelementptr [4 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 89, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [4 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 69, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [4 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 83, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [4 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 0, ptr %str_char_3.1, align 1
  %array_to_elem_ptr.1 = getelementptr [4 x i8], ptr %str_stack.1, i32 0, i32 0
  %.141 = sub i32 %.33, 80
  %.142 = sub i32 %.35, 50
  %.143 = sdiv i32 220, 4
  %.144 = sdiv i32 52, 2
  %.145 = sdiv i32 18, 2
  call void @draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(i32 %.141, i32 %.142, i32 %.143, i32 %.144, i32 %.145, float %.28, float %.31)
  %.147 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %array_to_elem_ptr.1, i32 2)
  %.149 = sub i32 %.33, 80
  %.150 = sdiv i32 %.147, 2
  %.151 = sub i32 %.149, %.150
  %.153 = sub i32 %.35, 50
  %.154 = mul i32 7, 2
  %.155 = sdiv i32 %.154, 2
  %.156 = sub i32 %.153, %.155
  call void @glColor4f(float 7.500000e-01, float 0x3FEC28F5C0000000, float 1.000000e+00, float 1.000000e+00)
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %array_to_elem_ptr.1, i32 %.151, i32 %.156, i32 2, float %.28, float %.31)
  %str_stack.2 = alloca [3 x i8], align 1
  %str_char_0.2 = getelementptr [3 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 78, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [3 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 79, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [3 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 0, ptr %str_char_2.2, align 1
  %array_to_elem_ptr.2 = getelementptr [3 x i8], ptr %str_stack.2, i32 0, i32 0
  %.164 = add i32 %.33, 80
  %.165 = sub i32 %.35, 50
  %.166 = sdiv i32 220, 4
  %.167 = sdiv i32 52, 2
  %.168 = sdiv i32 18, 2
  call void @draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(i32 %.164, i32 %.165, i32 %.166, i32 %.167, i32 %.168, float %.28, float %.31)
  %.170 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %array_to_elem_ptr.2, i32 2)
  %.172 = add i32 %.33, 80
  %.173 = sdiv i32 %.170, 2
  %.174 = sub i32 %.172, %.173
  %.176 = sub i32 %.35, 50
  %.177 = mul i32 7, 2
  %.178 = sdiv i32 %.177, 2
  %.179 = sub i32 %.176, %.178
  call void @glColor4f(float 7.500000e-01, float 0x3FEC28F5C0000000, float 1.000000e+00, float 1.000000e+00)
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %array_to_elem_ptr.2, i32 %.174, i32 %.179, i32 2, float %.28, float %.31)
  %GL_BLEND.1 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.1)
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.1)
  ret void
}

define void @paddle_update__0__ret_voidE1() {
entry:
  %cur_h = load i32, ptr @cur_h, align 4
  %.16 = sub i32 %cur_h, 1
  %mouse_y = load i32, ptr @mouse_y, align 4
  %.17 = sub i32 %.16, %mouse_y
  %.18 = mul i32 %.17, 192
  %cur_h.1 = load i32, ptr @cur_h, align 4
  %.19 = sdiv i32 %.18, %cur_h.1
  %.21 = add i32 14, 1
  %.22 = icmp slt i32 %.19, %.21
  %.24 = add i32 14, 1
  %gy.0 = select i1 %.22, i32 %.24, i32 %.19
  %.28 = sub i32 192, 14
  %.29 = sub i32 %.28, 2
  %.30 = icmp sgt i32 %gy.0, %.29
  %.32 = sub i32 192, 14
  %.33 = sub i32 %.32, 2
  %gy.11 = select i1 %.30, i32 %.33, i32 %gy.0
  store i32 %gy.11, ptr @g_paddle_gy, align 4
  %g_sucking = load i1, ptr @g_sucking, align 1
  br i1 %g_sucking, label %then.2, label %ifcont.2

then.2:                                           ; preds = %entry
  %g_suck_charge = load float, ptr @g_suck_charge, align 4
  %.39 = fadd float %g_suck_charge, 0x3F926E9780000000
  store float %.39, ptr @g_suck_charge, align 4
  %g_suck_charge.1 = load float, ptr @g_suck_charge, align 4
  %.41 = fcmp ogt float %g_suck_charge.1, 1.000000e+00
  br i1 %.41, label %then.3, label %ifcont.3

ifcont.2:                                         ; preds = %entry
  %g_suck_charge.3 = load float, ptr @g_suck_charge, align 4
  %.135 = fcmp ogt float %g_suck_charge.3, 0.000000e+00
  br i1 %.135, label %then.8, label %ifcont.8

then.3:                                           ; preds = %then.2
  store float 1.000000e+00, ptr @g_suck_charge, align 4
  br label %ifcont.3

ifcont.3:                                         ; preds = %then.2, %then.3
  %.46 = add i32 4, 2
  %cur_w = load i32, ptr @cur_w, align 4
  %.47 = mul i32 %.46, %cur_w
  %.48 = sdiv i32 %.47, 256
  %.49 = sitofp i32 %.48 to float
  %g_ball_x = load float, ptr @g_ball_x, align 4
  %.51 = fsub float %.49, %g_ball_x
  %cur_h.2 = load i32, ptr @cur_h, align 4
  %.53 = mul i32 %gy.11, %cur_h.2
  %.54 = sdiv i32 %.53, 192
  %.55 = sitofp i32 %.54 to float
  %g_ball_y = load float, ptr @g_ball_y, align 4
  %.56 = fsub float %.55, %g_ball_y
  %.58 = fmul float %.51, %.51
  %.59 = fmul float %.56, %.56
  %.60 = fadd float %.58, %.59
  %.61 = call float @standard__math__sqrt__1__floatE1__ret_floatE1(float %.60)
  %.63 = fcmp ogt float %.61, 1.000000e+00
  br i1 %.63, label %then.4, label %ifcont.4

then.4:                                           ; preds = %ifcont.3
  %g_suck_charge.2 = load float, ptr @g_suck_charge, align 4
  %.65 = fmul float %g_suck_charge.2, 0x3FF3333340000000
  %.66 = fadd float 0x3FE3333340000000, %.65
  %g_ball_vx = load float, ptr @g_ball_vx, align 4
  %.68 = fdiv float %.51, %.61
  %.69 = fmul float %.68, %.66
  %.70 = fadd float %g_ball_vx, %.69
  store float %.70, ptr @g_ball_vx, align 4
  %g_ball_vy = load float, ptr @g_ball_vy, align 4
  %.72 = fdiv float %.56, %.61
  %.73 = fmul float %.72, %.66
  %.74 = fadd float %g_ball_vy, %.73
  store float %.74, ptr @g_ball_vy, align 4
  br label %ifcont.4

ifcont.4:                                         ; preds = %ifcont.3, %then.4
  %.78 = add i32 4, 2
  %.80 = sub i32 %gy.11, 14
  %.82 = add i32 %gy.11, 14
  %.84 = icmp slt i32 %.80, 1
  %..80 = select i1 %.84, i32 1, i32 %.80
  %.89 = sub i32 192, 2
  %.90 = icmp sgt i32 %.82, %.89
  %.92 = sub i32 192, 2
  %jend.0 = select i1 %.90, i32 %.92, i32 %.82
  br label %for.cond

for.cond:                                         ; preds = %for.body, %ifcont.4
  %j.0 = phi i32 [ %..80, %ifcont.4 ], [ %.130, %for.body ]
  %.98 = icmp sle i32 %j.0, %jend.0
  br i1 %.98, label %for.body, label %common.ret

for.body:                                         ; preds = %for.cond
  %.100 = sub i32 %j.0, %gy.11
  %.101 = sitofp i32 %.100 to double
  %.103 = fmul double %.101, %.101
  %.104 = mul i32 14, 14
  %.105 = add i32 %.104, 1
  %.106 = sitofp i32 %.105 to double
  %.107 = fdiv double %.103, %.106
  %float_to_double_lhs = fpext float 1.000000e+00 to double
  %.108 = fsub double %float_to_double_lhs, %.107
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.110 = fcmp olt double %.108, %float_to_double_rhs
  %f32_to_f64 = fpext float 0.000000e+00 to double
  %fall.0 = select i1 %.110, double %f32_to_f64, double %.108
  %g_dens = load ptr, ptr @g_dens, align 8
  %.115 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.78, i32 %j.0)
  %ptr_gep = getelementptr inbounds double, ptr %g_dens, i32 %.115
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.116 = fmul float 4.000000e+02, 0x3FD99999A0000000
  %float_to_double_rhs.1 = fpext float %.116 to double
  %.117 = fmul double %fall.0, %float_to_double_rhs.1
  %.118 = fadd double %ptr_load, %.117
  %g_dens.1 = load ptr, ptr @g_dens, align 8
  %.119 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.78, i32 %j.0)
  %.120 = getelementptr inbounds double, ptr %g_dens.1, i32 %.119
  store double %.118, ptr %.120, align 8
  %g_vx = load ptr, ptr @g_vx, align 8
  %.122 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.78, i32 %j.0)
  %ptr_gep.1 = getelementptr inbounds double, ptr %g_vx, i32 %.122
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.123 = fmul float 4.000000e+01, 1.500000e+00
  %float_to_double_rhs.2 = fpext float %.123 to double
  %.124 = fmul double %fall.0, %float_to_double_rhs.2
  %.125 = fsub double %ptr_load.1, %.124
  %g_vx.1 = load ptr, ptr @g_vx, align 8
  %.126 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.78, i32 %j.0)
  %.127 = getelementptr inbounds double, ptr %g_vx.1, i32 %.126
  store double %.125, ptr %.127, align 8
  %.130 = add i32 %j.0, 1
  br label %for.cond

common.ret:                                       ; preds = %for.cond.1, %ifcont.8, %for.cond, %then.8
  ret void

then.8:                                           ; preds = %ifcont.2
  %g_ball_vx.1 = load float, ptr @g_ball_vx, align 4
  %g_suck_charge.4 = load float, ptr @g_suck_charge, align 4
  %.137 = fmul float %g_suck_charge.4, 2.200000e+01
  %.138 = fadd float %g_ball_vx.1, %.137
  store float %.138, ptr @g_ball_vx, align 4
  %g_ball_vy.1 = load float, ptr @g_ball_vy, align 4
  %.140 = fmul float %g_ball_vy.1, 0x3FD99999A0000000
  store float %.140, ptr @g_ball_vy, align 4
  store float 0.000000e+00, ptr @g_suck_charge, align 4
  br label %common.ret

ifcont.8:                                         ; preds = %ifcont.2
  %g_jetting = load i1, ptr @g_jetting, align 1
  %.145 = xor i1 %g_jetting, true
  br i1 %.145, label %common.ret, label %ifcont.9

ifcont.9:                                         ; preds = %ifcont.8
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.149 = mul i32 %g_rand_seed, 1664525
  %.150 = add i32 %.149, 1013904223
  store i32 %.150, ptr @g_rand_seed, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.152 = and i32 %g_rand_seed.1, 7
  %.153 = sub i32 %.152, 3
  %.155 = add i32 %gy.11, %.153
  %.157 = add i32 4, 1
  %.159 = sub i32 %.155, 14
  %.161 = add i32 %.155, 14
  %.163 = icmp slt i32 %.159, 1
  %..159 = select i1 %.163, i32 1, i32 %.159
  %.168 = sub i32 192, 2
  %.169 = icmp sgt i32 %.161, %.168
  %.171 = sub i32 192, 2
  %jend.17 = select i1 %.169, i32 %.171, i32 %.161
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %ifcont.9
  %j.15 = phi i32 [ %..159, %ifcont.9 ], [ %.207, %for.body.1 ]
  %.177 = icmp sle i32 %j.15, %jend.17
  br i1 %.177, label %for.body.1, label %common.ret

for.body.1:                                       ; preds = %for.cond.1
  %.179 = sub i32 %j.15, %.155
  %.180 = sitofp i32 %.179 to double
  %.182 = fmul double %.180, %.180
  %.183 = mul i32 14, 14
  %.184 = add i32 %.183, 1
  %.185 = sitofp i32 %.184 to double
  %.186 = fdiv double %.182, %.185
  %float_to_double_lhs.1 = fpext float 1.000000e+00 to double
  %.187 = fsub double %float_to_double_lhs.1, %.186
  %float_to_double_rhs.3 = fpext float 0.000000e+00 to double
  %.189 = fcmp olt double %.187, %float_to_double_rhs.3
  %f32_to_f64.1 = fpext float 0.000000e+00 to double
  %fall.18 = select i1 %.189, double %f32_to_f64.1, double %.187
  %g_dens.2 = load ptr, ptr @g_dens, align 8
  %.194 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.157, i32 %j.15)
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_dens.2, i32 %.194
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %float_to_double_rhs.4 = fpext float 4.000000e+02 to double
  %.195 = fmul double %fall.18, %float_to_double_rhs.4
  %.196 = fadd double %ptr_load.2, %.195
  %g_dens.3 = load ptr, ptr @g_dens, align 8
  %.197 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.157, i32 %j.15)
  %.198 = getelementptr inbounds double, ptr %g_dens.3, i32 %.197
  store double %.196, ptr %.198, align 8
  %g_vx.2 = load ptr, ptr @g_vx, align 8
  %.200 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.157, i32 %j.15)
  %ptr_gep.3 = getelementptr inbounds double, ptr %g_vx.2, i32 %.200
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %float_to_double_rhs.5 = fpext float 4.000000e+01 to double
  %.201 = fmul double %fall.18, %float_to_double_rhs.5
  %.202 = fadd double %ptr_load.3, %.201
  %g_vx.3 = load ptr, ptr @g_vx, align 8
  %.203 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.157, i32 %j.15)
  %.204 = getelementptr inbounds double, ptr %g_vx.3, i32 %.203
  store double %.202, ptr %.204, align 8
  %.207 = add i32 %j.15, 1
  br label %for.cond.1
}

define void @cpu_paddle_update__0__ret_voidE1() {
entry:
  %g_ball_y = load float, ptr @g_ball_y, align 4
  %cur_h = load i32, ptr @cur_h, align 4
  %.13 = sitofp i32 %cur_h to float
  %.14 = fdiv float %g_ball_y, %.13
  %.15 = sitofp i32 192 to float
  %.16 = fmul float %.14, %.15
  %.17 = fptosi float %.16 to i32
  %.19 = icmp slt i32 %.17, 0
  %..17 = select i1 %.19, i32 0, i32 %.17
  %.24 = icmp sgt i32 %..17, 192
  %ball_gy.12 = select i1 %.24, i32 192, i32 %..17
  %g_cpu_paddle_gy = load i32, ptr @g_cpu_paddle_gy, align 4
  %.30 = sub i32 %ball_gy.12, %g_cpu_paddle_gy
  %.32 = fptosi float 1.500000e+00 to i32
  %.33 = icmp sgt i32 %.30, %.32
  %.35 = fptosi float 1.500000e+00 to i32
  %diff.0 = select i1 %.33, i32 %.35, i32 %.30
  %.39 = fptosi float 1.500000e+00 to i32
  %.40 = sub i32 0, %.39
  %.41 = icmp slt i32 %diff.0, %.40
  %.43 = fptosi float 1.500000e+00 to i32
  %.44 = sub i32 0, %.43
  %diff.13 = select i1 %.41, i32 %.44, i32 %diff.0
  %.48 = add i32 %g_cpu_paddle_gy, %diff.13
  %.50 = add i32 14, 1
  %.51 = icmp slt i32 %.48, %.50
  %.53 = add i32 14, 1
  %gy.0 = select i1 %.51, i32 %.53, i32 %.48
  %.57 = sub i32 192, 14
  %.58 = sub i32 %.57, 2
  %.59 = icmp sgt i32 %gy.0, %.58
  %.61 = sub i32 192, 14
  %.62 = sub i32 %.61, 2
  %gy.11 = select i1 %.59, i32 %.62, i32 %gy.0
  store i32 %gy.11, ptr @g_cpu_paddle_gy, align 4
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.67 = mul i32 %g_rand_seed, 1664525
  %.68 = add i32 %.67, 1013904223
  store i32 %.68, ptr @g_rand_seed, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.70 = and i32 %g_rand_seed.1, 7
  %.71 = sub i32 %.70, 3
  %.73 = add i32 %gy.11, %.71
  %.75 = sub i32 256, 6
  %.76 = sub i32 %.75, 1
  %.78 = sub i32 %.73, 14
  %.80 = add i32 %.73, 14
  %.82 = icmp slt i32 %.78, 1
  %jstart.0 = select i1 %.82, i32 1, i32 %.78
  %.87 = sub i32 192, 2
  %.88 = icmp sgt i32 %.80, %.87
  %.90 = sub i32 192, 2
  %jend.0 = select i1 %.88, i32 %.90, i32 %.80
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %j.0 = phi i32 [ %jstart.0, %entry ], [ %.126, %for.body ]
  %.96 = icmp sle i32 %j.0, %jend.0
  br i1 %.96, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.98 = sub i32 %j.0, %.73
  %.99 = sitofp i32 %.98 to double
  %.101 = fmul double %.99, %.99
  %.102 = mul i32 14, 14
  %.103 = add i32 %.102, 1
  %.104 = sitofp i32 %.103 to double
  %.105 = fdiv double %.101, %.104
  %float_to_double_lhs = fpext float 1.000000e+00 to double
  %.106 = fsub double %float_to_double_lhs, %.105
  %float_to_double_rhs = fpext float 0.000000e+00 to double
  %.108 = fcmp olt double %.106, %float_to_double_rhs
  %f32_to_f64 = fpext float 0.000000e+00 to double
  %fall.0 = select i1 %.108, double %f32_to_f64, double %.106
  %g_dens = load ptr, ptr @g_dens, align 8
  %.113 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.76, i32 %j.0)
  %ptr_gep = getelementptr inbounds double, ptr %g_dens, i32 %.113
  %ptr_load = load double, ptr %ptr_gep, align 8
  %float_to_double_rhs.1 = fpext float 4.000000e+02 to double
  %.114 = fmul double %fall.0, %float_to_double_rhs.1
  %.115 = fadd double %ptr_load, %.114
  %g_dens.1 = load ptr, ptr @g_dens, align 8
  %.116 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.76, i32 %j.0)
  %.117 = getelementptr inbounds double, ptr %g_dens.1, i32 %.116
  store double %.115, ptr %.117, align 8
  %g_vx = load ptr, ptr @g_vx, align 8
  %.119 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.76, i32 %j.0)
  %ptr_gep.1 = getelementptr inbounds double, ptr %g_vx, i32 %.119
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %float_to_double_rhs.2 = fpext float 4.000000e+01 to double
  %.120 = fmul double %fall.0, %float_to_double_rhs.2
  %.121 = fsub double %ptr_load.1, %.120
  %g_vx.1 = load ptr, ptr @g_vx, align 8
  %.122 = call i32 @IX__2__intE1__intE1__ret_intE1(i32 %.76, i32 %j.0)
  %.123 = getelementptr inbounds double, ptr %g_vx.1, i32 %.122
  store double %.121, ptr %.123, align 8
  %.126 = add i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1(i32 %w, i32 %h, i32 %grid_x, i32 %center_gy) {
entry:
  %.39 = sitofp i32 %w to float
  %.40 = fdiv float 2.000000e+00, %.39
  %.42 = sitofp i32 %h to float
  %.43 = fdiv float 2.000000e+00, %.42
  %.45 = mul i32 %grid_x, %w
  %.46 = sdiv i32 %.45, 256
  %.48 = sub i32 %center_gy, 14
  %.49 = mul i32 %.48, %h
  %.50 = sdiv i32 %.49, 192
  %.52 = add i32 %center_gy, 14
  %.53 = mul i32 %.52, %h
  %.54 = sdiv i32 %.53, 192
  %.56 = add i32 %grid_x, 2
  %.57 = mul i32 %.56, %w
  %.58 = sdiv i32 %.57, 256
  %.59 = sub i32 %.58, %.46
  %.61 = sub i32 %.54, %.50
  %.63 = sitofp i32 %.59 to float
  %.64 = sitofp i32 5 to float
  %.65 = fdiv float %.63, %.64
  %.67 = sitofp i32 %.61 to float
  %.68 = sitofp i32 20 to float
  %.69 = fdiv float %.67, %.68
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D)
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND)
  %GL_SRC_ALPHA = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE = load i32, ptr @GL_ONE, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA, i32 %GL_ONE)
  %.76 = sitofp i32 16 to float
  %float_to_double_rhs = fpext float %.76 to double
  %.77 = fdiv double 0x401921FB54442EEA, %float_to_double_rhs
  %f64_to_f32 = fptrunc double %.77 to float
  br label %while.cond

while.cond:                                       ; preds = %while.end.1, %entry
  %ci.0 = phi i32 [ 0, %entry ], [ %.140, %while.end.1 ]
  %.81 = icmp slt i32 %ci.0, 5
  br i1 %.81, label %while.cond.1, label %while.end

while.end:                                        ; preds = %while.cond
  %GL_BLEND.1 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.1)
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.1)
  ret void

while.cond.1:                                     ; preds = %while.cond, %while.end.2
  %ri.0 = phi i32 [ %.137, %while.end.2 ], [ 0, %while.cond ]
  %.85 = icmp slt i32 %ri.0, 20
  br i1 %.85, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.87 = sitofp i32 %ci.0 to float
  %.88 = fmul float %.87, %.65
  %.89 = fmul float %.65, 5.000000e-01
  %.90 = fadd float %.88, %.89
  %.91 = fptosi float %.90 to i32
  %.92 = add i32 %.46, %.91
  %.94 = sitofp i32 %ri.0 to float
  %.95 = fmul float %.94, %.69
  %.96 = fmul float %.69, 5.000000e-01
  %.97 = fadd float %.95, %.96
  %.98 = fptosi float %.97 to i32
  %.99 = add i32 %.50, %.98
  %.101 = sitofp i32 %.92 to float
  %.102 = fmul float %.101, %.40
  %.103 = fsub float %.102, 1.000000e+00
  %.105 = sitofp i32 %.99 to float
  %.106 = fmul float %.105, %.43
  %.107 = fsub float %.106, 1.000000e+00
  %.109 = fmul float 5.000000e+00, %.40
  %.111 = fmul float 5.000000e+00, %.43
  %GL_TRIANGLE_FAN = load i32, ptr @GL_TRIANGLE_FAN, align 4
  call void @glBegin(i32 %GL_TRIANGLE_FAN)
  call void @glColor4f(float 0x3FE3333340000000, float 0x3FEB333340000000, float 1.000000e+00, float 0x3FC99999A0000000)
  call void @glVertex2f(float %.103, float %.107)
  call void @glColor4f(float 0x3FD3333340000000, float 0x3FE3333340000000, float 1.000000e+00, float 0x3FC99999A0000000)
  br label %while.cond.2

while.end.1:                                      ; preds = %while.cond.1
  %.140 = add i32 %ci.0, 1
  br label %while.cond

while.cond.2:                                     ; preds = %while.body.2, %while.body.1
  %seg.0 = phi i32 [ 0, %while.body.1 ], [ %.133, %while.body.2 ]
  %.119 = icmp sle i32 %seg.0, 16
  br i1 %.119, label %while.body.2, label %while.end.2

while.body.2:                                     ; preds = %while.cond.2
  %.121 = sitofp i32 %seg.0 to float
  %.122 = fmul float %.121, %f64_to_f32
  %.124 = call float @standard__math__cos__1__floatE1__ret_floatE1(float %.122)
  %.125 = fmul float %.109, %.124
  %.126 = fadd float %.103, %.125
  %.128 = call float @standard__math__sin__1__floatE1__ret_floatE1(float %.122)
  %.129 = fmul float %.111, %.128
  %.130 = fadd float %.107, %.129
  call void @glVertex2f(float %.126, float %.130)
  %.133 = add i32 %seg.0, 1
  br label %while.cond.2

while.end.2:                                      ; preds = %while.cond.2
  call void @glEnd()
  %.137 = add i32 %ri.0, 1
  br label %while.cond.1
}

define void @ball_reset__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %.6 = sitofp i32 %w to float
  %.7 = fmul float %.6, 5.000000e-01
  store float %.7, ptr @g_ball_x, align 4
  %.9 = sitofp i32 %h to float
  %.10 = fmul float %.9, 5.000000e-01
  store float %.10, ptr @g_ball_y, align 4
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.12 = mul i32 %g_rand_seed, 1664525
  %.13 = add i32 %.12, 1013904223
  store i32 %.13, ptr @g_rand_seed, align 4
  store float 0x3FF4CCCCC0000000, ptr @g_ball_vx, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.16 = and i32 %g_rand_seed.1, 255
  %.17 = sub i32 %.16, 128
  %.18 = sitofp i32 %.17 to float
  %.19 = fdiv float %.18, 1.280000e+02
  %.20 = fmul float %.19, 0x3FF4CCCCC0000000
  store float %.20, ptr @g_ball_vy, align 4
  %.22 = sdiv i32 192, 2
  store i32 %.22, ptr @g_cpu_paddle_gy, align 4
  store float 0.000000e+00, ptr @g_suck_charge, align 4
  store i1 false, ptr @g_sucking, align 1
  ret void
}

define void @ball_update__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %g_ball_x = load float, ptr @g_ball_x, align 4
  %.21 = sitofp i32 %w to float
  %.22 = fdiv float %g_ball_x, %.21
  %.23 = sitofp i32 256 to float
  %.24 = fmul float %.22, %.23
  %.25 = fptosi float %.24 to i32
  %g_ball_y = load float, ptr @g_ball_y, align 4
  %.27 = sitofp i32 %h to float
  %.28 = fdiv float %g_ball_y, %.27
  %.29 = sitofp i32 192 to float
  %.30 = fmul float %.28, %.29
  %.31 = fptosi float %.30 to i32
  %.33 = icmp slt i32 %.25, 1
  %..25 = select i1 %.33, i32 1, i32 %.25
  %.38 = sub i32 256, 2
  %.39 = icmp sgt i32 %..25, %.38
  %.41 = sub i32 256, 2
  %gx.11 = select i1 %.39, i32 %.41, i32 %..25
  %.45 = icmp slt i32 %.31, 1
  %gy.0 = select i1 %.45, i32 1, i32 %.31
  %.50 = sub i32 192, 2
  %.51 = icmp sgt i32 %gy.0, %.50
  %.53 = sub i32 192, 2
  %gy.12 = select i1 %.51, i32 %.53, i32 %gy.0
  %g_vx = load ptr, ptr @g_vx, align 8
  %.57 = mul i32 %gy.12, 256
  %.58 = add i32 %.57, %gx.11
  %ptr_gep = getelementptr inbounds double, ptr %g_vx, i32 %.58
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.59 = fptrunc double %ptr_load to float
  %g_vy = load ptr, ptr @g_vy, align 8
  %.61 = mul i32 %gy.12, 256
  %.62 = add i32 %.61, %gx.11
  %ptr_gep.1 = getelementptr inbounds double, ptr %g_vy, i32 %.62
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.63 = fptrunc double %ptr_load.1 to float
  %g_ball_vx = load float, ptr @g_ball_vx, align 4
  %.65 = fmul float %.59, 2.000000e+00
  %.66 = fadd float %g_ball_vx, %.65
  store float %.66, ptr @g_ball_vx, align 4
  %g_ball_vy = load float, ptr @g_ball_vy, align 4
  %.68 = fmul float %.63, 2.000000e+00
  %.69 = fadd float %g_ball_vy, %.68
  store float %.69, ptr @g_ball_vy, align 4
  %.71 = sub i32 %gx.11, 4
  %.73 = add i32 %gx.11, 4
  %.75 = icmp slt i32 %.71, 1
  %gx_l.0 = select i1 %.75, i32 1, i32 %.71
  %.80 = sub i32 256, 2
  %.81 = icmp sgt i32 %.73, %.80
  %.83 = sub i32 256, 2
  %gx_r.0 = select i1 %.81, i32 %.83, i32 %.73
  %g_vx.1 = load ptr, ptr @g_vx, align 8
  %.87 = mul i32 %gy.12, 256
  %.88 = add i32 %.87, %gx_l.0
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_vx.1, i32 %.88
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.89 = fptrunc double %ptr_load.2 to float
  %g_vx.2 = load ptr, ptr @g_vx, align 8
  %.91 = mul i32 %gy.12, 256
  %.92 = add i32 %.91, %gx_r.0
  %ptr_gep.3 = getelementptr inbounds double, ptr %g_vx.2, i32 %.92
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.93 = fptrunc double %ptr_load.3 to float
  %.94 = fsub float 0.000000e+00, %.93
  %g_ball_vx.1 = load float, ptr @g_ball_vx, align 4
  %g_ball_vx.2 = load float, ptr @g_ball_vx, align 4
  %.96 = fmul float %g_ball_vx.1, %g_ball_vx.2
  %g_ball_vy.1 = load float, ptr @g_ball_vy, align 4
  %g_ball_vy.2 = load float, ptr @g_ball_vy, align 4
  %.97 = fmul float %g_ball_vy.1, %g_ball_vy.2
  %.98 = fadd float %.96, %.97
  %.100 = fcmp ogt float %.89, 1.500000e+00
  %.102 = fcmp ogt float %.94, 1.500000e+00
  %sc_result = select i1 %.100, i1 %.102, i1 false
  %.105 = fcmp olt float %.98, 4.000000e+00
  %or.cond = select i1 %sc_result, i1 %.105, i1 false
  br i1 %or.cond, label %then.6, label %ifcont.6

then.6:                                           ; preds = %entry
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.108 = mul i32 %g_rand_seed, 1664525
  %.109 = add i32 %.108, 1013904223
  store i32 %.109, ptr @g_rand_seed, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.111 = and i32 %g_rand_seed.1, 1
  %.112 = icmp eq i32 %.111, 0
  br i1 %.112, label %then.7, label %else.7

ifcont.6:                                         ; preds = %then.7, %else.7, %entry
  %g_ball_vx.3 = load float, ptr @g_ball_vx, align 4
  %.122 = fmul float %g_ball_vx.3, 0x3FEFAE1480000000
  store float %.122, ptr @g_ball_vx, align 4
  %g_ball_vy.5 = load float, ptr @g_ball_vy, align 4
  %.124 = fmul float %g_ball_vy.5, 0x3FEFAE1480000000
  store float %.124, ptr @g_ball_vy, align 4
  %g_ball_x.1 = load float, ptr @g_ball_x, align 4
  %g_ball_vx.4 = load float, ptr @g_ball_vx, align 4
  %.126 = fadd float %g_ball_x.1, %g_ball_vx.4
  store float %.126, ptr @g_ball_x, align 4
  %g_ball_y.1 = load float, ptr @g_ball_y, align 4
  %g_ball_vy.6 = load float, ptr @g_ball_vy, align 4
  %.128 = fadd float %g_ball_y.1, %g_ball_vy.6
  store float %.128, ptr @g_ball_y, align 4
  %.130 = add i32 4, 2
  %.131 = mul i32 %.130, %w
  %.132 = sdiv i32 %.131, 256
  %.133 = sitofp i32 %.132 to float
  %g_paddle_gy = load i32, ptr @g_paddle_gy, align 4
  %.135 = sub i32 %g_paddle_gy, 14
  %.136 = mul i32 %.135, %h
  %.137 = sdiv i32 %.136, 192
  %.138 = sitofp i32 %.137 to float
  %g_paddle_gy.1 = load i32, ptr @g_paddle_gy, align 4
  %.140 = add i32 %g_paddle_gy.1, 14
  %.141 = mul i32 %.140, %h
  %.142 = sdiv i32 %.141, 192
  %.143 = sitofp i32 %.142 to float
  %g_ball_x.2 = load float, ptr @g_ball_x, align 4
  %.145 = fsub float %g_ball_x.2, 8.000000e+00
  %.146 = fcmp olt float %.145, %.133
  %g_ball_x.3 = load float, ptr @g_ball_x, align 4
  %.148 = fadd float %g_ball_x.3, 8.000000e+00
  %.149 = fsub float %.133, 4.000000e+00
  %.150 = fcmp ogt float %.148, %.149
  %sc_result.2 = select i1 %.146, i1 %.150, i1 false
  %g_ball_y.2 = load float, ptr @g_ball_y, align 4
  %.153 = fcmp ogt float %g_ball_y.2, %.138
  %or.cond3 = select i1 %sc_result.2, i1 %.153, i1 false
  %g_ball_y.3 = load float, ptr @g_ball_y, align 4
  %.156 = fcmp olt float %g_ball_y.3, %.143
  %or.cond4 = select i1 %or.cond3, i1 %.156, i1 false
  br i1 %or.cond4, label %then.8, label %ifcont.8

then.7:                                           ; preds = %then.6
  %g_ball_vy.3 = load float, ptr @g_ball_vy, align 4
  %.114 = fadd float %g_ball_vy.3, 5.500000e+00
  store float %.114, ptr @g_ball_vy, align 4
  br label %ifcont.6

else.7:                                           ; preds = %then.6
  %g_ball_vy.4 = load float, ptr @g_ball_vy, align 4
  %.117 = fsub float %g_ball_vy.4, 5.500000e+00
  store float %.117, ptr @g_ball_vy, align 4
  br label %ifcont.6

then.8:                                           ; preds = %ifcont.6
  %.159 = fadd float %.133, 8.000000e+00
  store float %.159, ptr @g_ball_x, align 4
  %g_ball_vx.5 = load float, ptr @g_ball_vx, align 4
  %.161 = fsub float 0.000000e+00, 0x3FE70A3D80000000
  %.162 = fmul float %g_ball_vx.5, %.161
  store float %.162, ptr @g_ball_vx, align 4
  br label %ifcont.8

ifcont.8:                                         ; preds = %ifcont.6, %then.8
  %.166 = sub i32 256, 6
  %.167 = mul i32 %.166, %w
  %.168 = sdiv i32 %.167, 256
  %.169 = sitofp i32 %.168 to float
  %g_cpu_paddle_gy = load i32, ptr @g_cpu_paddle_gy, align 4
  %.171 = sub i32 %g_cpu_paddle_gy, 14
  %.172 = mul i32 %.171, %h
  %.173 = sdiv i32 %.172, 192
  %.174 = sitofp i32 %.173 to float
  %g_cpu_paddle_gy.1 = load i32, ptr @g_cpu_paddle_gy, align 4
  %.176 = add i32 %g_cpu_paddle_gy.1, 14
  %.177 = mul i32 %.176, %h
  %.178 = sdiv i32 %.177, 192
  %.179 = sitofp i32 %.178 to float
  %g_ball_x.4 = load float, ptr @g_ball_x, align 4
  %.181 = fadd float %g_ball_x.4, 8.000000e+00
  %.182 = fcmp ogt float %.181, %.169
  %g_ball_x.5 = load float, ptr @g_ball_x, align 4
  %.184 = fsub float %g_ball_x.5, 8.000000e+00
  %.185 = fadd float %.169, 4.000000e+00
  %.186 = fcmp olt float %.184, %.185
  %sc_result.5 = select i1 %.182, i1 %.186, i1 false
  %g_ball_y.4 = load float, ptr @g_ball_y, align 4
  %.189 = fcmp ogt float %g_ball_y.4, %.174
  %or.cond5 = select i1 %sc_result.5, i1 %.189, i1 false
  %g_ball_y.5 = load float, ptr @g_ball_y, align 4
  %.192 = fcmp olt float %g_ball_y.5, %.179
  %or.cond6 = select i1 %or.cond5, i1 %.192, i1 false
  br i1 %or.cond6, label %then.9, label %ifcont.9

then.9:                                           ; preds = %ifcont.8
  %.195 = fsub float %.169, 8.000000e+00
  store float %.195, ptr @g_ball_x, align 4
  %g_ball_vx.6 = load float, ptr @g_ball_vx, align 4
  %.197 = fsub float 0.000000e+00, 0x3FE70A3D80000000
  %.198 = fmul float %g_ball_vx.6, %.197
  store float %.198, ptr @g_ball_vx, align 4
  br label %ifcont.9

ifcont.9:                                         ; preds = %ifcont.8, %then.9
  %g_ball_y.6 = load float, ptr @g_ball_y, align 4
  %.202 = fsub float %g_ball_y.6, 8.000000e+00
  %.203 = fcmp olt float %.202, 0.000000e+00
  br i1 %.203, label %then.10, label %ifcont.10

then.10:                                          ; preds = %ifcont.9
  store float 8.000000e+00, ptr @g_ball_y, align 4
  %g_ball_vy.7 = load float, ptr @g_ball_vy, align 4
  %.206 = fsub float 0.000000e+00, 0x3FE70A3D80000000
  %.207 = fmul float %g_ball_vy.7, %.206
  store float %.207, ptr @g_ball_vy, align 4
  br label %ifcont.10

ifcont.10:                                        ; preds = %ifcont.9, %then.10
  %g_ball_y.7 = load float, ptr @g_ball_y, align 4
  %.211 = fadd float %g_ball_y.7, 8.000000e+00
  %.212 = sitofp i32 %h to float
  %.213 = fcmp ogt float %.211, %.212
  br i1 %.213, label %then.11, label %ifcont.11

then.11:                                          ; preds = %ifcont.10
  %.215 = sitofp i32 %h to float
  %.216 = fsub float %.215, 8.000000e+00
  store float %.216, ptr @g_ball_y, align 4
  %g_ball_vy.8 = load float, ptr @g_ball_vy, align 4
  %.218 = fsub float 0.000000e+00, 0x3FE70A3D80000000
  %.219 = fmul float %g_ball_vy.8, %.218
  store float %.219, ptr @g_ball_vy, align 4
  br label %ifcont.11

ifcont.11:                                        ; preds = %ifcont.10, %then.11
  %g_ball_x.6 = load float, ptr @g_ball_x, align 4
  %.223 = fsub float %g_ball_x.6, 8.000000e+00
  %.224 = fcmp olt float %.223, 0.000000e+00
  br i1 %.224, label %then.12, label %ifcont.12

then.12:                                          ; preds = %ifcont.11
  %g_lives = load i32, ptr @g_lives, align 4
  %.226 = sub i32 %g_lives, 1
  store i32 %.226, ptr @g_lives, align 4
  %g_lives.1 = load i32, ptr @g_lives, align 4
  %.228 = icmp slt i32 %g_lives.1, 1
  br i1 %.228, label %then.13, label %ifcont.13

ifcont.12:                                        ; preds = %ifcont.11
  %g_ball_x.7 = load float, ptr @g_ball_x, align 4
  %.238 = fadd float %g_ball_x.7, 8.000000e+00
  %.239 = sitofp i32 %w to float
  %.240 = fcmp ogt float %.238, %.239
  br i1 %.240, label %then.14, label %common.ret

then.13:                                          ; preds = %then.12
  store i32 3, ptr @g_lives, align 4
  store i32 1, ptr @g_level, align 4
  store i32 0, ptr @g_game_state, align 4
  br label %ifcont.13

common.ret:                                       ; preds = %ifcont.12, %then.14, %ifcont.13
  ret void

ifcont.13:                                        ; preds = %then.12, %then.13
  call void @ball_reset__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h)
  br label %common.ret

then.14:                                          ; preds = %ifcont.12
  %g_level = load i32, ptr @g_level, align 4
  %.242 = add i32 %g_level, 1
  store i32 %.242, ptr @g_level, align 4
  call void @ball_reset__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h)
  br label %common.ret
}

define void @draw_ball__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %.25 = sitofp i32 %w to float
  %.26 = fdiv float 2.000000e+00, %.25
  %.28 = sitofp i32 %h to float
  %.29 = fdiv float 2.000000e+00, %.28
  %g_ball_x = load float, ptr @g_ball_x, align 4
  %.31 = fmul float %g_ball_x, %.26
  %.32 = fsub float %.31, 1.000000e+00
  %g_ball_y = load float, ptr @g_ball_y, align 4
  %.34 = fmul float %g_ball_y, %.29
  %.35 = fsub float %.34, 1.000000e+00
  %.37 = fadd float 8.000000e+00, 4.000000e+00
  %.38 = fmul float %.37, %.26
  %.40 = fadd float 8.000000e+00, 4.000000e+00
  %.41 = fmul float %.40, %.29
  %.43 = fmul float 8.000000e+00, %.26
  %.45 = fmul float 8.000000e+00, %.29
  %.47 = sitofp i32 32 to float
  %float_to_double_rhs = fpext float %.47 to double
  %.48 = fdiv double 0x401921FB54442EEA, %float_to_double_rhs
  %f64_to_f32 = fptrunc double %.48 to float
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D)
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND)
  %GL_TRIANGLE_FAN = load i32, ptr @GL_TRIANGLE_FAN, align 4
  call void @glBegin(i32 %GL_TRIANGLE_FAN)
  call void @glColor3f(float 1.000000e+00, float 1.000000e+00, float 1.000000e+00)
  call void @glVertex2f(float %.32, float %.35)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %seg.0 = phi i32 [ 0, %entry ], [ %.72, %while.body ]
  %.58 = icmp sle i32 %seg.0, 32
  br i1 %.58, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.60 = sitofp i32 %seg.0 to float
  %.61 = fmul float %.60, %f64_to_f32
  %.63 = call float @standard__math__cos__1__floatE1__ret_floatE1(float %.61)
  %.64 = fmul float %.38, %.63
  %.65 = fadd float %.32, %.64
  %.67 = call float @standard__math__sin__1__floatE1__ret_floatE1(float %.61)
  %.68 = fmul float %.41, %.67
  %.69 = fadd float %.35, %.68
  call void @glVertex2f(float %.65, float %.69)
  %.72 = add i32 %seg.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @glEnd()
  %GL_TRIANGLE_FAN.1 = load i32, ptr @GL_TRIANGLE_FAN, align 4
  call void @glBegin(i32 %GL_TRIANGLE_FAN.1)
  call void @glColor3f(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00)
  call void @glVertex2f(float %.32, float %.35)
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %seg.11 = phi i32 [ 0, %while.end ], [ %.95, %while.body.1 ]
  %.81 = icmp sle i32 %seg.11, 32
  br i1 %.81, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.83 = sitofp i32 %seg.11 to float
  %.84 = fmul float %.83, %f64_to_f32
  %.86 = call float @standard__math__cos__1__floatE1__ret_floatE1(float %.84)
  %.87 = fmul float %.43, %.86
  %.88 = fadd float %.32, %.87
  %.90 = call float @standard__math__sin__1__floatE1__ret_floatE1(float %.84)
  %.91 = fmul float %.45, %.90
  %.92 = fadd float %.35, %.91
  call void @glVertex2f(float %.88, float %.92)
  %.95 = add i32 %seg.11, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  call void @glEnd()
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.1)
  ret void
}

define void @draw_hud__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %num_buf = alloca [16 x i8], align 1
  %.fca.0.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 0
  store i8 0, ptr %.fca.0.gep, align 1
  %.fca.1.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 1
  store i8 0, ptr %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 2
  store i8 0, ptr %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 3
  store i8 0, ptr %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 4
  store i8 0, ptr %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 5
  store i8 0, ptr %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 6
  store i8 0, ptr %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 7
  store i8 0, ptr %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 8
  store i8 0, ptr %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 9
  store i8 0, ptr %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 10
  store i8 0, ptr %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 11
  store i8 0, ptr %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 12
  store i8 0, ptr %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 13
  store i8 0, ptr %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 14
  store i8 0, ptr %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 15
  store i8 0, ptr %.fca.15.gep, align 1
  %.25 = sitofp i32 %w to float
  %.26 = fdiv float 2.000000e+00, %.25
  %.28 = sitofp i32 %h to float
  %.29 = fdiv float 2.000000e+00, %.28
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D)
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND)
  %GL_SRC_ALPHA = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE_MINUS_SRC_ALPHA = load i32, ptr @GL_ONE_MINUS_SRC_ALPHA, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA, i32 %GL_ONE_MINUS_SRC_ALPHA)
  %g_level = load i32, ptr @g_level, align 4
  %.35 = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 0
  %.36 = call i32 @int_to_str__2__intE1__byteE1_ptr1__ret_intE1(i32 %g_level, ptr %.35)
  %str_stack = alloca [7 x i8], align 1
  %str_char_0 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 0
  store i8 76, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 1
  store i8 69, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 2
  store i8 86, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 3
  store i8 69, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 4
  store i8 76, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 5
  store i8 32, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 6
  store i8 0, ptr %str_char_6, align 1
  %arg0_decay = getelementptr [7 x i8], ptr %str_stack, i32 0, i32 0
  %.44 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %arg0_decay, i32 2)
  %.45 = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 0
  %.46 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %.45, i32 2)
  %.47 = add i32 %.44, %.46
  %.49 = sdiv i32 %w, 2
  %.50 = sdiv i32 %.47, 2
  %.51 = sub i32 %.49, %.50
  %.53 = sub i32 %h, 28
  call void @glColor4f(float 0x3FE3333340000000, float 0x3FE99999A0000000, float 1.000000e+00, float 0x3FECCCCCC0000000)
  %str_stack.1 = alloca [7 x i8], align 1
  %str_char_0.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 0
  store i8 76, ptr %str_char_0.1, align 1
  %str_char_1.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 1
  store i8 69, ptr %str_char_1.1, align 1
  %str_char_2.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 2
  store i8 86, ptr %str_char_2.1, align 1
  %str_char_3.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 3
  store i8 69, ptr %str_char_3.1, align 1
  %str_char_4.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 4
  store i8 76, ptr %str_char_4.1, align 1
  %str_char_5.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 5
  store i8 32, ptr %str_char_5.1, align 1
  %str_char_6.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 6
  store i8 0, ptr %str_char_6.1, align 1
  %arg0_decay.1 = getelementptr [7 x i8], ptr %str_stack.1, i32 0, i32 0
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %arg0_decay.1, i32 %.51, i32 %.53, i32 2, float %.26, float %.29)
  %str_stack.2 = alloca [7 x i8], align 1
  %str_char_0.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 0
  store i8 76, ptr %str_char_0.2, align 1
  %str_char_1.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 1
  store i8 69, ptr %str_char_1.2, align 1
  %str_char_2.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 2
  store i8 86, ptr %str_char_2.2, align 1
  %str_char_3.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 3
  store i8 69, ptr %str_char_3.2, align 1
  %str_char_4.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 4
  store i8 76, ptr %str_char_4.2, align 1
  %str_char_5.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 5
  store i8 32, ptr %str_char_5.2, align 1
  %str_char_6.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 6
  store i8 0, ptr %str_char_6.2, align 1
  %arg0_decay.2 = getelementptr [7 x i8], ptr %str_stack.2, i32 0, i32 0
  %.71 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %arg0_decay.2, i32 2)
  %.72 = add i32 %.51, %.71
  call void @glColor4f(float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00)
  %.75 = getelementptr inbounds [16 x i8], ptr %num_buf, i32 0, i32 0
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %.75, i32 %.72, i32 %.53, i32 2, float %.26, float %.29)
  call void @glColor4f(float 1.000000e+00, float 0x3FD1EB8520000000, float 0x3FD1EB8520000000, float 0x3FEE666660000000)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %li.0 = phi i32 [ 0, %entry ], [ %.124, %while.body ]
  %g_lives = load i32, ptr @g_lives, align 4
  %.81 = icmp slt i32 %li.0, %g_lives
  br i1 %.81, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.83 = mul i32 7, 2
  %.84 = add i32 %.83, 6
  %.85 = mul i32 %li.0, %.84
  %.86 = add i32 20, %.85
  %.88 = sub i32 %h, 22
  %.90 = sitofp i32 %.86 to float
  %.91 = fmul float %.90, %.26
  %.92 = fsub float %.91, 1.000000e+00
  %.94 = sitofp i32 %.88 to float
  %.95 = fmul float %.94, %.29
  %.96 = fsub float %.95, 1.000000e+00
  %.98 = sub i32 %.86, 7
  %.99 = sitofp i32 %.98 to float
  %.100 = fmul float %.99, %.26
  %.101 = fsub float %.100, 1.000000e+00
  %.103 = add i32 %.86, 7
  %.104 = sitofp i32 %.103 to float
  %.105 = fmul float %.104, %.26
  %.106 = fsub float %.105, 1.000000e+00
  %.108 = sub i32 %.88, 7
  %.109 = sitofp i32 %.108 to float
  %.110 = fmul float %.109, %.29
  %.111 = fsub float %.110, 1.000000e+00
  %.113 = add i32 %.88, 7
  %.114 = sitofp i32 %.113 to float
  %.115 = fmul float %.114, %.29
  %.116 = fsub float %.115, 1.000000e+00
  %GL_QUADS = load i32, ptr @GL_QUADS, align 4
  call void @glBegin(i32 %GL_QUADS)
  call void @glVertex2f(float %.92, float %.116)
  call void @glVertex2f(float %.106, float %.96)
  call void @glVertex2f(float %.92, float %.111)
  call void @glVertex2f(float %.101, float %.96)
  call void @glEnd()
  %.124 = add i32 %li.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @glColor4f(float 5.000000e-01, float 0x3FC3333340000000, float 0x3FC3333340000000, float 0x3FE3333340000000)
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %li.11 = phi i32 [ %li.0, %while.end ], [ %.174, %while.body.1 ]
  %.130 = icmp slt i32 %li.11, 3
  br i1 %.130, label %while.body.1, label %while.end.1

while.body.1:                                     ; preds = %while.cond.1
  %.132 = mul i32 7, 2
  %.133 = add i32 %.132, 6
  %.134 = mul i32 %li.11, %.133
  %.135 = add i32 20, %.134
  %.137 = sub i32 %h, 22
  %.139 = sitofp i32 %.135 to float
  %.140 = fmul float %.139, %.26
  %.141 = fsub float %.140, 1.000000e+00
  %.143 = sitofp i32 %.137 to float
  %.144 = fmul float %.143, %.29
  %.145 = fsub float %.144, 1.000000e+00
  %.147 = sub i32 %.135, 7
  %.148 = sitofp i32 %.147 to float
  %.149 = fmul float %.148, %.26
  %.150 = fsub float %.149, 1.000000e+00
  %.152 = add i32 %.135, 7
  %.153 = sitofp i32 %.152 to float
  %.154 = fmul float %.153, %.26
  %.155 = fsub float %.154, 1.000000e+00
  %.157 = sub i32 %.137, 7
  %.158 = sitofp i32 %.157 to float
  %.159 = fmul float %.158, %.29
  %.160 = fsub float %.159, 1.000000e+00
  %.162 = add i32 %.137, 7
  %.163 = sitofp i32 %.162 to float
  %.164 = fmul float %.163, %.29
  %.165 = fsub float %.164, 1.000000e+00
  call void @glLineWidth(float 1.000000e+00)
  %GL_LINE_LOOP = load i32, ptr @GL_LINE_LOOP, align 4
  call void @glBegin(i32 %GL_LINE_LOOP)
  call void @glVertex2f(float %.141, float %.165)
  call void @glVertex2f(float %.155, float %.145)
  call void @glVertex2f(float %.141, float %.160)
  call void @glVertex2f(float %.150, float %.145)
  call void @glEnd()
  %.174 = add i32 %li.11, 1
  br label %while.cond.1

while.end.1:                                      ; preds = %while.cond.1
  call void @glColor4f(float 0x3FE3333340000000, float 0x3FE99999A0000000, float 1.000000e+00, float 0x3FE6666660000000)
  %.178 = sub i32 %h, 44
  %str_stack.3 = alloca [6 x i8], align 1
  %str_char_0.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 0
  store i8 76, ptr %str_char_0.3, align 1
  %str_char_1.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 1
  store i8 73, ptr %str_char_1.3, align 1
  %str_char_2.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 2
  store i8 86, ptr %str_char_2.3, align 1
  %str_char_3.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 3
  store i8 69, ptr %str_char_3.3, align 1
  %str_char_4.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 4
  store i8 83, ptr %str_char_4.3, align 1
  %str_char_5.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 5
  store i8 0, ptr %str_char_5.3, align 1
  %arg0_decay.3 = getelementptr [6 x i8], ptr %str_stack.3, i32 0, i32 0
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %arg0_decay.3, i32 8, i32 %.178, i32 2, float %.26, float %.29)
  %GL_BLEND.1 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.1)
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.1)
  ret void
}

define void @vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %vx, ptr %vy) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.end.1, %entry
  %j.0 = phi i32 [ 1, %entry ], [ %.56, %for.end.1 ]
  %.17 = sub i32 192, 1
  %.18 = icmp slt i32 %j.0, %.17
  br i1 %.18, label %for.body, label %for.cond.2

for.body:                                         ; preds = %for.cond
  %.20 = mul i32 %j.0, 256
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.body
  %i.0 = phi i32 [ 1, %for.body ], [ %.52, %for.body.1 ]
  %.24 = sub i32 256, 1
  %.25 = icmp slt i32 %i.0, %.24
  br i1 %.25, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.27 = add i32 %.20, %i.0
  %.28 = add i32 %.27, 1
  %ptr_gep = getelementptr inbounds double, ptr %vy, i32 %.28
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.29 = add i32 %.20, %i.0
  %.30 = sub i32 %.29, 1
  %ptr_gep.1 = getelementptr inbounds double, ptr %vy, i32 %.30
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.31 = fsub double %ptr_load, %ptr_load.1
  %.32 = add i32 %.20, %i.0
  %.33 = add i32 %.32, 256
  %ptr_gep.2 = getelementptr inbounds double, ptr %vx, i32 %.33
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.34 = fsub double %.31, %ptr_load.2
  %.35 = add i32 %.20, %i.0
  %.36 = sub i32 %.35, 256
  %ptr_gep.3 = getelementptr inbounds double, ptr %vx, i32 %.36
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.37 = fadd double %.34, %ptr_load.3
  %float_to_double_rhs = fpext float 5.000000e-01 to double
  %.38 = fmul double %.37, %float_to_double_rhs
  %float_to_double_rhs.1 = fpext float 0.000000e+00 to double
  %.40 = fcmp olt double %.38, %float_to_double_rhs.1
  %float_to_double_lhs = fpext float 0.000000e+00 to double
  %.42 = fsub double %float_to_double_lhs, %.38
  %ternary_result = select i1 %.40, double %.42, double %.38
  %g_dens_prev = load ptr, ptr @g_dens_prev, align 8
  %.45 = add i32 %.20, %i.0
  %.46 = getelementptr inbounds double, ptr %g_dens_prev, i32 %.45
  store double %ternary_result, ptr %.46, align 8
  %g_vx_prev = load ptr, ptr @g_vx_prev, align 8
  %.48 = add i32 %.20, %i.0
  %.49 = getelementptr inbounds double, ptr %g_vx_prev, i32 %.48
  store double %.38, ptr %.49, align 8
  %.52 = add i32 %i.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.56 = add i32 %j.0, 1
  br label %for.cond

for.cond.2:                                       ; preds = %for.cond, %for.end.3
  %j.111 = phi i32 [ %.121, %for.end.3 ], [ 1, %for.cond ]
  %.61 = sub i32 192, 1
  %.62 = icmp slt i32 %j.111, %.61
  br i1 %.62, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  %.64 = mul i32 %j.111, 256
  br label %for.cond.3

for.end.2:                                        ; preds = %for.cond.2
  ret void

for.cond.3:                                       ; preds = %for.body.3, %for.body.2
  %i.110 = phi i32 [ 1, %for.body.2 ], [ %.117, %for.body.3 ]
  %.68 = sub i32 256, 1
  %.69 = icmp slt i32 %i.110, %.68
  br i1 %.69, label %for.body.3, label %for.end.3

for.body.3:                                       ; preds = %for.cond.3
  %g_dens_prev.1 = load ptr, ptr @g_dens_prev, align 8
  %.71 = add i32 %.64, %i.110
  %.72 = add i32 %.71, 1
  %ptr_gep.4 = getelementptr inbounds double, ptr %g_dens_prev.1, i32 %.72
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %g_dens_prev.2 = load ptr, ptr @g_dens_prev, align 8
  %.73 = add i32 %.64, %i.110
  %.74 = sub i32 %.73, 1
  %ptr_gep.5 = getelementptr inbounds double, ptr %g_dens_prev.2, i32 %.74
  %ptr_load.5 = load double, ptr %ptr_gep.5, align 8
  %.75 = fsub double %ptr_load.4, %ptr_load.5
  %float_to_double_rhs.2 = fpext float 5.000000e-01 to double
  %.76 = fmul double %.75, %float_to_double_rhs.2
  %g_dens_prev.3 = load ptr, ptr @g_dens_prev, align 8
  %.78 = add i32 %.64, %i.110
  %.79 = add i32 %.78, 256
  %ptr_gep.6 = getelementptr inbounds double, ptr %g_dens_prev.3, i32 %.79
  %ptr_load.6 = load double, ptr %ptr_gep.6, align 8
  %g_dens_prev.4 = load ptr, ptr @g_dens_prev, align 8
  %.80 = add i32 %.64, %i.110
  %.81 = sub i32 %.80, 256
  %ptr_gep.7 = getelementptr inbounds double, ptr %g_dens_prev.4, i32 %.81
  %ptr_load.7 = load double, ptr %ptr_gep.7, align 8
  %.82 = fsub double %ptr_load.6, %ptr_load.7
  %float_to_double_rhs.3 = fpext float 5.000000e-01 to double
  %.83 = fmul double %.82, %float_to_double_rhs.3
  %.85 = fmul double %.76, %.76
  %.86 = fmul double %.83, %.83
  %.87 = fadd double %.85, %.86
  %.88 = call double @standard__math__sqrt__1__doubleE1__ret_doubleE1(double %.87)
  %float_to_double_rhs.4 = fpext float 0x3F1A36E2E0000000 to double
  %.89 = fadd double %.88, %float_to_double_rhs.4
  %.91 = fdiv double %.76, %.89
  %.93 = fdiv double %.83, %.89
  %g_vx_prev.1 = load ptr, ptr @g_vx_prev, align 8
  %.95 = add i32 %.64, %i.110
  %ptr_gep.8 = getelementptr inbounds double, ptr %g_vx_prev.1, i32 %.95
  %ptr_load.8 = load double, ptr %ptr_gep.8, align 8
  %.97 = fmul double %.93, %ptr_load.8
  %.98 = fsub float 0.000000e+00, 0x3FE99999A0000000
  %float_to_double_rhs.5 = fpext float %.98 to double
  %.99 = fmul double %.97, %float_to_double_rhs.5
  %.101 = fmul double %.91, %ptr_load.8
  %float_to_double_rhs.6 = fpext float 0x3FE99999A0000000 to double
  %.102 = fmul double %.101, %float_to_double_rhs.6
  %.104 = add i32 %.64, %i.110
  %ptr_gep.9 = getelementptr inbounds double, ptr %vx, i32 %.104
  %ptr_load.9 = load double, ptr %ptr_gep.9, align 8
  %float_to_double_lhs.1 = fpext float 0x3FB99999A0000000 to double
  %.105 = fmul double %float_to_double_lhs.1, %.99
  %.106 = fadd double %ptr_load.9, %.105
  %.107 = add i32 %.64, %i.110
  %.108 = getelementptr inbounds double, ptr %vx, i32 %.107
  store double %.106, ptr %.108, align 8
  %.110 = add i32 %.64, %i.110
  %ptr_gep.10 = getelementptr inbounds double, ptr %vy, i32 %.110
  %ptr_load.10 = load double, ptr %ptr_gep.10, align 8
  %float_to_double_lhs.2 = fpext float 0x3FB99999A0000000 to double
  %.111 = fmul double %float_to_double_lhs.2, %.102
  %.112 = fadd double %ptr_load.10, %.111
  %.113 = add i32 %.64, %i.110
  %.114 = getelementptr inbounds double, ptr %vy, i32 %.113
  store double %.112, ptr %.114, align 8
  %.117 = add i32 %i.110, 1
  br label %for.cond.3

for.end.3:                                        ; preds = %for.cond.3
  %.121 = add i32 %j.111, 1
  br label %for.cond.2
}

define i64 @FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(i64 %hwnd, i32 %msg, i64 %wParam, i64 %lParam) {
entry:
  %WM_CLOSE = load i32, ptr @standard__system__windows__WM_CLOSE, align 4
  %.14 = icmp eq i32 %msg, %WM_CLOSE
  %ps = alloca %standard__system__windows__PAINTSTRUCT, align 8
  br i1 %.14, label %then, label %ifcont

common.ret:                                       ; preds = %ifcont.28, %then.28, %then.27, %then.26, %then.25, %then.24, %then.23, %then.22, %then.21, %then.20, %then.19, %ifcont.18, %ifcont.16, %then.15, %then.14, %ifcont.13, %then.11, %ifcont.10, %ifcont.9, %ifcont.6, %then.3, %then.2, %then.1, %then
  %common.ret.op = phi i64 [ %.17, %then ], [ %.23, %then.1 ], [ %.28, %then.2 ], [ %.36, %then.3 ], [ %.64, %ifcont.6 ], [ %.91, %ifcont.9 ], [ %.104, %ifcont.10 ], [ %.111, %then.11 ], [ %.123, %ifcont.13 ], [ %.129, %then.14 ], [ %.148, %then.15 ], [ %.241, %ifcont.16 ], [ %.165, %ifcont.18 ], [ %.172, %then.19 ], [ %.179, %then.20 ], [ %.186, %then.21 ], [ %.193, %then.22 ], [ %.200, %then.23 ], [ %.207, %then.24 ], [ %.214, %then.25 ], [ %.221, %then.26 ], [ %.228, %then.27 ], [ %.235, %then.28 ], [ %.238, %ifcont.28 ]
  ret i64 %common.ret.op

then:                                             ; preds = %entry
  %.16 = call i1 @DestroyWindow(i64 %hwnd)
  %.17 = sext i32 0 to i64
  br label %common.ret

ifcont:                                           ; preds = %entry
  %WM_DESTROY = load i32, ptr @standard__system__windows__WM_DESTROY, align 4
  %.20 = icmp eq i32 %msg, %WM_DESTROY
  br i1 %.20, label %then.1, label %ifcont.1

then.1:                                           ; preds = %ifcont
  call void @PostQuitMessage(i32 0)
  %.23 = sext i32 0 to i64
  br label %common.ret

ifcont.1:                                         ; preds = %ifcont
  %WM_ERASEBKGND = load i32, ptr @standard__system__windows__WM_ERASEBKGND, align 4
  %.26 = icmp eq i32 %msg, %WM_ERASEBKGND
  br i1 %.26, label %then.2, label %ifcont.2

then.2:                                           ; preds = %ifcont.1
  %.28 = sext i32 1 to i64
  br label %common.ret

ifcont.2:                                         ; preds = %ifcont.1
  %WM_PAINT = load i32, ptr @standard__system__windows__WM_PAINT, align 4
  %.31 = icmp eq i32 %msg, %WM_PAINT
  br i1 %.31, label %then.3, label %ifcont.3

then.3:                                           ; preds = %ifcont.2
  %.fca.0.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 0
  store i64 0, ptr %.fca.0.gep, align 8
  %.fca.1.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 1
  store i32 0, ptr %.fca.1.gep, align 8
  %.fca.2.0.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 2, i32 0
  store i32 0, ptr %.fca.2.0.gep, align 4
  %.fca.2.1.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 2, i32 1
  store i32 0, ptr %.fca.2.1.gep, align 8
  %.fca.2.2.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 2, i32 2
  store i32 0, ptr %.fca.2.2.gep, align 4
  %.fca.2.3.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 2, i32 3
  store i32 0, ptr %.fca.2.3.gep, align 8
  %.fca.3.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 3
  store i32 0, ptr %.fca.3.gep, align 4
  %.fca.4.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 4
  store i32 0, ptr %.fca.4.gep, align 8
  %.fca.5.0.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 0
  store i8 0, ptr %.fca.5.0.gep, align 4
  %.fca.5.1.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 1
  store i8 0, ptr %.fca.5.1.gep, align 1
  %.fca.5.2.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 2
  store i8 0, ptr %.fca.5.2.gep, align 2
  %.fca.5.3.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 3
  store i8 0, ptr %.fca.5.3.gep, align 1
  %.fca.5.4.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 4
  store i8 0, ptr %.fca.5.4.gep, align 8
  %.fca.5.5.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 5
  store i8 0, ptr %.fca.5.5.gep, align 1
  %.fca.5.6.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 6
  store i8 0, ptr %.fca.5.6.gep, align 2
  %.fca.5.7.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 7
  store i8 0, ptr %.fca.5.7.gep, align 1
  %.fca.5.8.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 8
  store i8 0, ptr %.fca.5.8.gep, align 4
  %.fca.5.9.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 9
  store i8 0, ptr %.fca.5.9.gep, align 1
  %.fca.5.10.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 10
  store i8 0, ptr %.fca.5.10.gep, align 2
  %.fca.5.11.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 11
  store i8 0, ptr %.fca.5.11.gep, align 1
  %.fca.5.12.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 12
  store i8 0, ptr %.fca.5.12.gep, align 8
  %.fca.5.13.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 13
  store i8 0, ptr %.fca.5.13.gep, align 1
  %.fca.5.14.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 14
  store i8 0, ptr %.fca.5.14.gep, align 2
  %.fca.5.15.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 15
  store i8 0, ptr %.fca.5.15.gep, align 1
  %.fca.5.16.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 16
  store i8 0, ptr %.fca.5.16.gep, align 4
  %.fca.5.17.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 17
  store i8 0, ptr %.fca.5.17.gep, align 1
  %.fca.5.18.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 18
  store i8 0, ptr %.fca.5.18.gep, align 2
  %.fca.5.19.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 19
  store i8 0, ptr %.fca.5.19.gep, align 1
  %.fca.5.20.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 20
  store i8 0, ptr %.fca.5.20.gep, align 8
  %.fca.5.21.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 21
  store i8 0, ptr %.fca.5.21.gep, align 1
  %.fca.5.22.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 22
  store i8 0, ptr %.fca.5.22.gep, align 2
  %.fca.5.23.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 23
  store i8 0, ptr %.fca.5.23.gep, align 1
  %.fca.5.24.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 24
  store i8 0, ptr %.fca.5.24.gep, align 4
  %.fca.5.25.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 25
  store i8 0, ptr %.fca.5.25.gep, align 1
  %.fca.5.26.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 26
  store i8 0, ptr %.fca.5.26.gep, align 2
  %.fca.5.27.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 27
  store i8 0, ptr %.fca.5.27.gep, align 1
  %.fca.5.28.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 28
  store i8 0, ptr %.fca.5.28.gep, align 8
  %.fca.5.29.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 29
  store i8 0, ptr %.fca.5.29.gep, align 1
  %.fca.5.30.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 30
  store i8 0, ptr %.fca.5.30.gep, align 2
  %.fca.5.31.gep = getelementptr inbounds %standard__system__windows__PAINTSTRUCT, ptr %ps, i32 0, i32 5, i32 31
  store i8 0, ptr %.fca.5.31.gep, align 1
  %.34 = call i64 @BeginPaint(i64 %hwnd, ptr %ps)
  %.35 = call i1 @EndPaint(i64 %hwnd, ptr %ps)
  %.36 = sext i32 0 to i64
  br label %common.ret

ifcont.3:                                         ; preds = %ifcont.2
  %WM_LBUTTONDOWN = load i32, ptr @standard__system__windows__WM_LBUTTONDOWN, align 4
  %.39 = icmp eq i32 %msg, %WM_LBUTTONDOWN
  br i1 %.39, label %then.4, label %ifcont.4

then.4:                                           ; preds = %ifcont.3
  %.41 = zext i32 65535 to i64
  %.42 = and i64 %lParam, %.41
  %.43 = trunc i64 %.42 to i32
  %.45 = zext i32 16 to i64
  %.46 = lshr i64 %lParam, %.45
  %.47 = zext i32 65535 to i64
  %.48 = and i64 %.46, %.47
  %.49 = trunc i64 %.48 to i32
  %g_game_state = load i32, ptr @g_game_state, align 4
  %.51 = icmp eq i32 %g_game_state, 0
  br i1 %.51, label %then.5, label %ifcont.5

ifcont.4:                                         ; preds = %ifcont.3
  %WM_LBUTTONUP = load i32, ptr @standard__system__windows__WM_LBUTTONUP, align 4
  %.107 = icmp eq i32 %msg, %WM_LBUTTONUP
  br i1 %.107, label %then.11, label %ifcont.11

then.5:                                           ; preds = %then.4
  %cur_w = load i32, ptr @cur_w, align 4
  %.53 = sdiv i32 %cur_w, 2
  %cur_h = load i32, ptr @cur_h, align 4
  %.54 = sdiv i32 %cur_h, 2
  %.55 = call i1 @btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1(i32 %.43, i32 %.49, i32 %.53, i32 %.54)
  br i1 %.55, label %then.6, label %ifcont.6

ifcont.5:                                         ; preds = %then.4
  %g_game_state.1 = load i32, ptr @g_game_state, align 4
  %.67 = icmp eq i32 %g_game_state.1, 2
  br i1 %.67, label %then.7, label %ifcont.7

then.6:                                           ; preds = %then.5
  store i32 3, ptr @g_lives, align 4
  store i32 1, ptr @g_level, align 4
  %.59 = fsub float 0.000000e+00, 1.000000e+00
  store float %.59, ptr @g_ball_x, align 4
  store i32 1, ptr @g_game_state, align 4
  br label %ifcont.6

ifcont.6:                                         ; preds = %then.5, %then.6
  %.64 = sext i32 0 to i64
  br label %common.ret

then.7:                                           ; preds = %ifcont.5
  %cur_w.1 = load i32, ptr @cur_w, align 4
  %.69 = sdiv i32 %cur_w.1, 2
  %.70 = sub i32 %.69, 80
  %cur_h.1 = load i32, ptr @cur_h, align 4
  %.71 = sdiv i32 %cur_h.1, 2
  %.72 = add i32 %.71, 50
  %.73 = sdiv i32 220, 4
  %.74 = sdiv i32 52, 2
  %.75 = call i1 @btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1(i32 %.43, i32 %.49, i32 %.70, i32 %.72, i32 %.73, i32 %.74)
  br i1 %.75, label %then.8, label %ifcont.8

ifcont.7:                                         ; preds = %ifcont.5
  store i1 true, ptr @mouse_down, align 1
  %g_game_state.2 = load i32, ptr @g_game_state, align 4
  %.95 = icmp eq i32 %g_game_state.2, 1
  br i1 %.95, label %then.10, label %ifcont.10

then.8:                                           ; preds = %then.7
  call void @PostQuitMessage(i32 0)
  br label %ifcont.8

ifcont.8:                                         ; preds = %then.7, %then.8
  %cur_w.2 = load i32, ptr @cur_w, align 4
  %.80 = sdiv i32 %cur_w.2, 2
  %.81 = add i32 %.80, 80
  %cur_h.2 = load i32, ptr @cur_h, align 4
  %.82 = sdiv i32 %cur_h.2, 2
  %.83 = add i32 %.82, 50
  %.84 = sdiv i32 220, 4
  %.85 = sdiv i32 52, 2
  %.86 = call i1 @btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1(i32 %.43, i32 %.49, i32 %.81, i32 %.83, i32 %.84, i32 %.85)
  br i1 %.86, label %then.9, label %ifcont.9

then.9:                                           ; preds = %ifcont.8
  %g_prev_state = load i32, ptr @g_prev_state, align 4
  store i32 %g_prev_state, ptr @g_game_state, align 4
  br label %ifcont.9

ifcont.9:                                         ; preds = %ifcont.8, %then.9
  %.91 = sext i32 0 to i64
  br label %common.ret

then.10:                                          ; preds = %ifcont.7
  store i1 true, ptr @g_jetting, align 1
  br label %ifcont.10

ifcont.10:                                        ; preds = %ifcont.7, %then.10
  store i32 %.43, ptr @mouse_px, align 4
  store i32 %.49, ptr @mouse_py, align 4
  %mouse_px = load i32, ptr @mouse_px, align 4
  store i32 %mouse_px, ptr @mouse_x, align 4
  %mouse_py = load i32, ptr @mouse_py, align 4
  store i32 %mouse_py, ptr @mouse_y, align 4
  %.104 = sext i32 0 to i64
  br label %common.ret

then.11:                                          ; preds = %ifcont.4
  store i1 false, ptr @mouse_down, align 1
  store i1 false, ptr @g_jetting, align 1
  %.111 = sext i32 0 to i64
  br label %common.ret

ifcont.11:                                        ; preds = %ifcont.4
  %WM_RBUTTONDOWN = load i32, ptr @standard__system__windows__WM_RBUTTONDOWN, align 4
  %.114 = icmp eq i32 %msg, %WM_RBUTTONDOWN
  br i1 %.114, label %then.12, label %ifcont.12

then.12:                                          ; preds = %ifcont.11
  %g_game_state.3 = load i32, ptr @g_game_state, align 4
  %.116 = icmp eq i32 %g_game_state.3, 1
  br i1 %.116, label %then.13, label %ifcont.13

ifcont.12:                                        ; preds = %ifcont.11
  %WM_RBUTTONUP = load i32, ptr @standard__system__windows__WM_RBUTTONUP, align 4
  %.126 = icmp eq i32 %msg, %WM_RBUTTONUP
  br i1 %.126, label %then.14, label %ifcont.14

then.13:                                          ; preds = %then.12
  store i1 true, ptr @g_sucking, align 1
  store i1 false, ptr @g_jetting, align 1
  store float 0.000000e+00, ptr @g_suck_charge, align 4
  br label %ifcont.13

ifcont.13:                                        ; preds = %then.12, %then.13
  %.123 = sext i32 0 to i64
  br label %common.ret

then.14:                                          ; preds = %ifcont.12
  store i1 false, ptr @g_sucking, align 1
  %.129 = sext i32 0 to i64
  br label %common.ret

ifcont.14:                                        ; preds = %ifcont.12
  %WM_MOUSEMOVE = load i32, ptr @standard__system__windows__WM_MOUSEMOVE, align 4
  %.132 = icmp eq i32 %msg, %WM_MOUSEMOVE
  br i1 %.132, label %then.15, label %ifcont.15

then.15:                                          ; preds = %ifcont.14
  %.134 = zext i32 65535 to i64
  %.135 = and i64 %lParam, %.134
  %.136 = trunc i64 %.135 to i32
  %.138 = zext i32 16 to i64
  %.139 = lshr i64 %lParam, %.138
  %.140 = zext i32 65535 to i64
  %.141 = and i64 %.139, %.140
  %.142 = trunc i64 %.141 to i32
  %mouse_x = load i32, ptr @mouse_x, align 4
  store i32 %mouse_x, ptr @mouse_px, align 4
  %mouse_y = load i32, ptr @mouse_y, align 4
  store i32 %mouse_y, ptr @mouse_py, align 4
  store i32 %.136, ptr @mouse_x, align 4
  store i32 %.142, ptr @mouse_y, align 4
  %.148 = sext i32 0 to i64
  br label %common.ret

ifcont.15:                                        ; preds = %ifcont.14
  %WM_KEYDOWN = load i32, ptr @standard__system__windows__WM_KEYDOWN, align 4
  %.151 = icmp eq i32 %msg, %WM_KEYDOWN
  br i1 %.151, label %then.16, label %ifcont.16

then.16:                                          ; preds = %ifcont.15
  %.153 = zext i32 27 to i64
  %.154 = icmp eq i64 %wParam, %.153
  br i1 %.154, label %then.17, label %ifcont.17

ifcont.16:                                        ; preds = %ifcont.15
  %.241 = call i64 @DefWindowProcA(i64 %hwnd, i32 %msg, i64 %wParam, i64 %lParam)
  br label %common.ret

then.17:                                          ; preds = %then.16
  %g_game_state.4 = load i32, ptr @g_game_state, align 4
  %.156 = icmp ne i32 %g_game_state.4, 2
  br i1 %.156, label %then.18, label %ifcont.18

ifcont.17:                                        ; preds = %then.16
  %.168 = zext i32 49 to i64
  %.169 = icmp eq i64 %wParam, %.168
  br i1 %.169, label %then.19, label %ifcont.19

then.18:                                          ; preds = %then.17
  %g_game_state.5 = load i32, ptr @g_game_state, align 4
  store i32 %g_game_state.5, ptr @g_prev_state, align 4
  store i32 2, ptr @g_game_state, align 4
  store i1 false, ptr @g_jetting, align 1
  store i1 false, ptr @g_sucking, align 1
  store float 0.000000e+00, ptr @g_suck_charge, align 4
  br label %ifcont.18

ifcont.18:                                        ; preds = %then.17, %then.18
  %.165 = sext i32 0 to i64
  br label %common.ret

then.19:                                          ; preds = %ifcont.17
  store i32 0, ptr @g_palette, align 4
  %.172 = sext i32 0 to i64
  br label %common.ret

ifcont.19:                                        ; preds = %ifcont.17
  %.175 = zext i32 50 to i64
  %.176 = icmp eq i64 %wParam, %.175
  br i1 %.176, label %then.20, label %ifcont.20

then.20:                                          ; preds = %ifcont.19
  store i32 1, ptr @g_palette, align 4
  %.179 = sext i32 0 to i64
  br label %common.ret

ifcont.20:                                        ; preds = %ifcont.19
  %.182 = zext i32 51 to i64
  %.183 = icmp eq i64 %wParam, %.182
  br i1 %.183, label %then.21, label %ifcont.21

then.21:                                          ; preds = %ifcont.20
  store i32 2, ptr @g_palette, align 4
  %.186 = sext i32 0 to i64
  br label %common.ret

ifcont.21:                                        ; preds = %ifcont.20
  %.189 = zext i32 52 to i64
  %.190 = icmp eq i64 %wParam, %.189
  br i1 %.190, label %then.22, label %ifcont.22

then.22:                                          ; preds = %ifcont.21
  store i32 3, ptr @g_palette, align 4
  %.193 = sext i32 0 to i64
  br label %common.ret

ifcont.22:                                        ; preds = %ifcont.21
  %.196 = zext i32 53 to i64
  %.197 = icmp eq i64 %wParam, %.196
  br i1 %.197, label %then.23, label %ifcont.23

then.23:                                          ; preds = %ifcont.22
  store i32 4, ptr @g_palette, align 4
  %.200 = sext i32 0 to i64
  br label %common.ret

ifcont.23:                                        ; preds = %ifcont.22
  %.203 = zext i32 54 to i64
  %.204 = icmp eq i64 %wParam, %.203
  br i1 %.204, label %then.24, label %ifcont.24

then.24:                                          ; preds = %ifcont.23
  store i32 5, ptr @g_palette, align 4
  %.207 = sext i32 0 to i64
  br label %common.ret

ifcont.24:                                        ; preds = %ifcont.23
  %.210 = zext i32 55 to i64
  %.211 = icmp eq i64 %wParam, %.210
  br i1 %.211, label %then.25, label %ifcont.25

then.25:                                          ; preds = %ifcont.24
  store i32 6, ptr @g_palette, align 4
  %.214 = sext i32 0 to i64
  br label %common.ret

ifcont.25:                                        ; preds = %ifcont.24
  %.217 = zext i32 56 to i64
  %.218 = icmp eq i64 %wParam, %.217
  br i1 %.218, label %then.26, label %ifcont.26

then.26:                                          ; preds = %ifcont.25
  store i32 7, ptr @g_palette, align 4
  %.221 = sext i32 0 to i64
  br label %common.ret

ifcont.26:                                        ; preds = %ifcont.25
  %.224 = zext i32 57 to i64
  %.225 = icmp eq i64 %wParam, %.224
  br i1 %.225, label %then.27, label %ifcont.27

then.27:                                          ; preds = %ifcont.26
  store i32 8, ptr @g_palette, align 4
  %.228 = sext i32 0 to i64
  br label %common.ret

ifcont.27:                                        ; preds = %ifcont.26
  %.231 = zext i32 48 to i64
  %.232 = icmp eq i64 %wParam, %.231
  br i1 %.232, label %then.28, label %ifcont.28

then.28:                                          ; preds = %ifcont.27
  store i32 9, ptr @g_palette, align 4
  %.235 = sext i32 0 to i64
  br label %common.ret

ifcont.28:                                        ; preds = %ifcont.27
  %.238 = sext i32 0 to i64
  br label %common.ret
}

define i32 @IX__2__intE1__intE1__ret_intE1(i32 %x, i32 %y) {
entry:
  %.6 = mul i32 %y, 256
  %.7 = add i32 %.6, %x
  ret i32 %.7
}

define void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 %b, ptr %x) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %.45, %ifcont ]
  %.9 = sub i32 192, 1
  %.10 = icmp slt i32 %i.0, %.9
  br i1 %.10, label %for.body, label %for.cond.1

for.body:                                         ; preds = %for.cond
  %.12 = icmp eq i32 %b, 1
  br i1 %.12, label %then, label %else

then:                                             ; preds = %for.body
  %.14 = mul i32 %i.0, 256
  %.15 = add i32 %.14, 1
  %ptr_gep = getelementptr inbounds double, ptr %x, i32 %.15
  %ptr_load = load double, ptr %ptr_gep, align 8
  %float_to_double_lhs = fpext float 0.000000e+00 to double
  %.16 = fsub double %float_to_double_lhs, %ptr_load
  %.17 = mul i32 %i.0, 256
  %.18 = getelementptr inbounds double, ptr %x, i32 %.17
  store double %.16, ptr %.18, align 8
  %.20 = mul i32 %i.0, 256
  %.21 = add i32 %.20, 256
  %.22 = sub i32 %.21, 2
  %ptr_gep.1 = getelementptr inbounds double, ptr %x, i32 %.22
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %float_to_double_lhs.1 = fpext float 0.000000e+00 to double
  %.23 = fsub double %float_to_double_lhs.1, %ptr_load.1
  %.24 = mul i32 %i.0, 256
  %.25 = add i32 %.24, 256
  %.26 = sub i32 %.25, 1
  %.27 = getelementptr inbounds double, ptr %x, i32 %.26
  store double %.23, ptr %.27, align 8
  br label %ifcont

else:                                             ; preds = %for.body
  %.30 = mul i32 %i.0, 256
  %.31 = add i32 %.30, 1
  %ptr_gep.2 = getelementptr inbounds double, ptr %x, i32 %.31
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.32 = mul i32 %i.0, 256
  %.33 = getelementptr inbounds double, ptr %x, i32 %.32
  store double %ptr_load.2, ptr %.33, align 8
  %.35 = mul i32 %i.0, 256
  %.36 = add i32 %.35, 256
  %.37 = sub i32 %.36, 2
  %ptr_gep.3 = getelementptr inbounds double, ptr %x, i32 %.37
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.38 = mul i32 %i.0, 256
  %.39 = add i32 %.38, 256
  %.40 = sub i32 %.39, 1
  %.41 = getelementptr inbounds double, ptr %x, i32 %.40
  store double %ptr_load.3, ptr %.41, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %.45 = add i32 %i.0, 1
  br label %for.cond

for.cond.1:                                       ; preds = %for.cond, %ifcont.1
  %i.110 = phi i32 [ %.82, %ifcont.1 ], [ 1, %for.cond ]
  %.50 = sub i32 256, 1
  %.51 = icmp slt i32 %i.110, %.50
  br i1 %.51, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.53 = icmp eq i32 %b, 2
  br i1 %.53, label %then.1, label %else.1

for.end.1:                                        ; preds = %for.cond.1
  %ptr_gep.8 = getelementptr inbounds double, ptr %x, i32 1
  %ptr_load.8 = load double, ptr %ptr_gep.8, align 8
  %ptr_gep.9 = getelementptr inbounds double, ptr %x, i32 256
  %ptr_load.9 = load double, ptr %ptr_gep.9, align 8
  %.85 = fadd double %ptr_load.8, %ptr_load.9
  %float_to_double_lhs.4 = fpext float 5.000000e-01 to double
  %.86 = fmul double %float_to_double_lhs.4, %.85
  %.87 = getelementptr inbounds double, ptr %x, i32 0
  store double %.86, ptr %.87, align 8
  %.89 = sub i32 256, 2
  %ptr_gep.10 = getelementptr inbounds double, ptr %x, i32 %.89
  %ptr_load.10 = load double, ptr %ptr_gep.10, align 8
  %.90 = add i32 256, 256
  %.91 = sub i32 %.90, 1
  %ptr_gep.11 = getelementptr inbounds double, ptr %x, i32 %.91
  %ptr_load.11 = load double, ptr %ptr_gep.11, align 8
  %.92 = fadd double %ptr_load.10, %ptr_load.11
  %float_to_double_lhs.5 = fpext float 5.000000e-01 to double
  %.93 = fmul double %float_to_double_lhs.5, %.92
  %.94 = sub i32 256, 1
  %.95 = getelementptr inbounds double, ptr %x, i32 %.94
  store double %.93, ptr %.95, align 8
  %.97 = sub i32 192, 1
  %.98 = mul i32 %.97, 256
  %.99 = add i32 %.98, 1
  %ptr_gep.12 = getelementptr inbounds double, ptr %x, i32 %.99
  %ptr_load.12 = load double, ptr %ptr_gep.12, align 8
  %.100 = sub i32 192, 2
  %.101 = mul i32 %.100, 256
  %ptr_gep.13 = getelementptr inbounds double, ptr %x, i32 %.101
  %ptr_load.13 = load double, ptr %ptr_gep.13, align 8
  %.102 = fadd double %ptr_load.12, %ptr_load.13
  %float_to_double_lhs.6 = fpext float 5.000000e-01 to double
  %.103 = fmul double %float_to_double_lhs.6, %.102
  %.104 = sub i32 192, 1
  %.105 = mul i32 %.104, 256
  %.106 = getelementptr inbounds double, ptr %x, i32 %.105
  store double %.103, ptr %.106, align 8
  %.108 = sub i32 192, 1
  %.109 = mul i32 %.108, 256
  %.110 = add i32 %.109, 256
  %.111 = sub i32 %.110, 2
  %ptr_gep.14 = getelementptr inbounds double, ptr %x, i32 %.111
  %ptr_load.14 = load double, ptr %ptr_gep.14, align 8
  %.112 = sub i32 192, 2
  %.113 = mul i32 %.112, 256
  %.114 = add i32 %.113, 256
  %.115 = sub i32 %.114, 1
  %ptr_gep.15 = getelementptr inbounds double, ptr %x, i32 %.115
  %ptr_load.15 = load double, ptr %ptr_gep.15, align 8
  %.116 = fadd double %ptr_load.14, %ptr_load.15
  %float_to_double_lhs.7 = fpext float 5.000000e-01 to double
  %.117 = fmul double %float_to_double_lhs.7, %.116
  %.118 = sub i32 192, 1
  %.119 = mul i32 %.118, 256
  %.120 = add i32 %.119, 256
  %.121 = sub i32 %.120, 1
  %.122 = getelementptr inbounds double, ptr %x, i32 %.121
  store double %.117, ptr %.122, align 8
  ret void

then.1:                                           ; preds = %for.body.1
  %.55 = add i32 %i.110, 256
  %ptr_gep.4 = getelementptr inbounds double, ptr %x, i32 %.55
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %float_to_double_lhs.2 = fpext float 0.000000e+00 to double
  %.56 = fsub double %float_to_double_lhs.2, %ptr_load.4
  %.57 = getelementptr inbounds double, ptr %x, i32 %i.110
  store double %.56, ptr %.57, align 8
  %.59 = sub i32 192, 2
  %.60 = mul i32 %.59, 256
  %.61 = add i32 %.60, %i.110
  %ptr_gep.5 = getelementptr inbounds double, ptr %x, i32 %.61
  %ptr_load.5 = load double, ptr %ptr_gep.5, align 8
  %float_to_double_lhs.3 = fpext float 0.000000e+00 to double
  %.62 = fsub double %float_to_double_lhs.3, %ptr_load.5
  %.63 = sub i32 192, 1
  %.64 = mul i32 %.63, 256
  %.65 = add i32 %.64, %i.110
  %.66 = getelementptr inbounds double, ptr %x, i32 %.65
  store double %.62, ptr %.66, align 8
  br label %ifcont.1

else.1:                                           ; preds = %for.body.1
  %.69 = add i32 %i.110, 256
  %ptr_gep.6 = getelementptr inbounds double, ptr %x, i32 %.69
  %ptr_load.6 = load double, ptr %ptr_gep.6, align 8
  %.70 = getelementptr inbounds double, ptr %x, i32 %i.110
  store double %ptr_load.6, ptr %.70, align 8
  %.72 = sub i32 192, 2
  %.73 = mul i32 %.72, 256
  %.74 = add i32 %.73, %i.110
  %ptr_gep.7 = getelementptr inbounds double, ptr %x, i32 %.74
  %ptr_load.7 = load double, ptr %ptr_gep.7, align 8
  %.75 = sub i32 192, 1
  %.76 = mul i32 %.75, 256
  %.77 = add i32 %.76, %i.110
  %.78 = getelementptr inbounds double, ptr %x, i32 %.77
  store double %ptr_load.7, ptr %.78, align 8
  br label %ifcont.1

ifcont.1:                                         ; preds = %else.1, %then.1
  %.82 = add i32 %i.110, 1
  br label %for.cond.1
}

define void @linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start, i32 %row_end, i32 %color, ptr %x, ptr %x0, double %a, double %c_inv) {
entry:
  %.24 = icmp slt i32 %row_start, 1
  %.row_start = select i1 %.24, i32 1, i32 %row_start
  %.29 = sub i32 192, 1
  %.30 = icmp sgt i32 %row_end, %.29
  %.32 = sub i32 192, 1
  %jend.0 = select i1 %.30, i32 %.32, i32 %row_end
  br label %for.cond

for.cond:                                         ; preds = %while.end, %entry
  %j.0 = phi i32 [ %.row_start, %entry ], [ %.74, %while.end ]
  %.38 = icmp slt i32 %j.0, %jend.0
  br i1 %.38, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.40 = mul i32 %j.0, 256
  %.42 = add i32 %j.0, %color
  %.43 = add i32 %.42, 1
  %.44 = and i32 %.43, 1
  %.45 = add i32 1, %.44
  br label %while.cond

for.end:                                          ; preds = %for.cond
  ret void

while.cond:                                       ; preds = %while.body, %for.body
  %i.0 = phi i32 [ %.45, %for.body ], [ %.70, %while.body ]
  %.49 = sub i32 256, 1
  %.50 = icmp slt i32 %i.0, %.49
  br i1 %.50, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.52 = add i32 %.40, %i.0
  %ptr_gep = getelementptr inbounds double, ptr %x0, i32 %.52
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.53 = add i32 %.40, %i.0
  %.54 = sub i32 %.53, 1
  %ptr_gep.1 = getelementptr inbounds double, ptr %x, i32 %.54
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.55 = add i32 %.40, %i.0
  %.56 = add i32 %.55, 1
  %ptr_gep.2 = getelementptr inbounds double, ptr %x, i32 %.56
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.57 = fadd double %ptr_load.1, %ptr_load.2
  %.58 = add i32 %.40, %i.0
  %.59 = sub i32 %.58, 256
  %ptr_gep.3 = getelementptr inbounds double, ptr %x, i32 %.59
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.60 = fadd double %.57, %ptr_load.3
  %.61 = add i32 %.40, %i.0
  %.62 = add i32 %.61, 256
  %ptr_gep.4 = getelementptr inbounds double, ptr %x, i32 %.62
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %.63 = fadd double %.60, %ptr_load.4
  %.64 = fmul double %a, %.63
  %.65 = fadd double %ptr_load, %.64
  %.66 = fmul double %.65, %c_inv
  %.67 = add i32 %.40, %i.0
  %.68 = getelementptr inbounds double, ptr %x, i32 %.67
  store double %.66, ptr %.68, align 8
  %.70 = add i32 %i.0, 2
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.74 = add i32 %j.0, 1
  br label %for.cond
}

define void @advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(i32 %row_start, i32 %row_end, ptr %d, ptr %d0, ptr %u, ptr %v) {
entry:
  %.35 = sub i32 256, 2
  %.36 = sitofp i32 %.35 to double
  %float_to_double_lhs = fpext float 0x3FB99999A0000000 to double
  %.37 = fmul double %float_to_double_lhs, %.36
  %.39 = sub i32 192, 2
  %.40 = sitofp i32 %.39 to double
  %float_to_double_lhs.1 = fpext float 0x3FB99999A0000000 to double
  %.41 = fmul double %float_to_double_lhs.1, %.40
  %.43 = sub i32 256, 2
  %.44 = sitofp i32 %.43 to double
  %float_to_double_rhs = fpext float 5.000000e-01 to double
  %.45 = fadd double %.44, %float_to_double_rhs
  %.47 = sub i32 192, 2
  %.48 = sitofp i32 %.47 to double
  %float_to_double_rhs.1 = fpext float 5.000000e-01 to double
  %.49 = fadd double %.48, %float_to_double_rhs.1
  %.53 = icmp slt i32 %row_start, 1
  %.row_start = select i1 %.53, i32 1, i32 %row_start
  %.58 = sub i32 192, 1
  %.59 = icmp sgt i32 %row_end, %.58
  %.61 = sub i32 192, 1
  %jend.0 = select i1 %.59, i32 %.61, i32 %row_end
  br label %for.cond

for.cond:                                         ; preds = %for.end.1, %entry
  %j.0 = phi i32 [ %.row_start, %entry ], [ %.149, %for.end.1 ]
  %.67 = icmp slt i32 %j.0, %jend.0
  br i1 %.67, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.69 = mul i32 %j.0, 256
  br label %for.cond.1

for.end:                                          ; preds = %for.cond
  ret void

for.cond.1:                                       ; preds = %for.body.1, %for.body
  %i.0 = phi i32 [ 1, %for.body ], [ %.145, %for.body.1 ]
  %.73 = sub i32 256, 1
  %.74 = icmp slt i32 %i.0, %.73
  br i1 %.74, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.76 = sitofp i32 %i.0 to double
  %.77 = add i32 %.69, %i.0
  %ptr_gep = getelementptr inbounds double, ptr %u, i32 %.77
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.78 = fmul double %.37, %ptr_load
  %.79 = fsub double %.76, %.78
  %.81 = sitofp i32 %j.0 to double
  %.82 = add i32 %.69, %i.0
  %ptr_gep.1 = getelementptr inbounds double, ptr %v, i32 %.82
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.83 = fmul double %.41, %ptr_load.1
  %.84 = fsub double %.81, %.83
  %float_to_double_rhs.2 = fpext float 5.000000e-01 to double
  %.86 = fcmp olt double %.79, %float_to_double_rhs.2
  %f32_to_f64 = fpext float 5.000000e-01 to double
  %bx.0 = select i1 %.86, double %f32_to_f64, double %.79
  %.91 = fcmp ogt double %bx.0, %.45
  %bx.11 = select i1 %.91, double %.45, double %bx.0
  %float_to_double_rhs.3 = fpext float 5.000000e-01 to double
  %.96 = fcmp olt double %.84, %float_to_double_rhs.3
  %f32_to_f64.1 = fpext float 5.000000e-01 to double
  %by.0 = select i1 %.96, double %f32_to_f64.1, double %.84
  %.101 = fcmp ogt double %by.0, %.49
  %by.12 = select i1 %.101, double %.49, double %by.0
  %.106 = fptosi double %bx.11 to i32
  %.108 = fptosi double %by.12 to i32
  %.110 = add i32 %.106, 1
  %.112 = add i32 %.108, 1
  %.114 = sitofp i32 %.106 to double
  %.115 = fsub double %bx.11, %.114
  %float_to_double_lhs.2 = fpext float 1.000000e+00 to double
  %.117 = fsub double %float_to_double_lhs.2, %.115
  %.119 = sitofp i32 %.108 to double
  %.120 = fsub double %by.12, %.119
  %float_to_double_lhs.3 = fpext float 1.000000e+00 to double
  %.122 = fsub double %float_to_double_lhs.3, %.120
  %.124 = mul i32 %.108, 256
  %.126 = mul i32 %.112, 256
  %.128 = add i32 %.124, %.106
  %ptr_gep.2 = getelementptr inbounds double, ptr %d0, i32 %.128
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.129 = fmul double %.122, %ptr_load.2
  %.130 = add i32 %.126, %.106
  %ptr_gep.3 = getelementptr inbounds double, ptr %d0, i32 %.130
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.131 = fmul double %.120, %ptr_load.3
  %.132 = fadd double %.129, %.131
  %.133 = fmul double %.117, %.132
  %.134 = add i32 %.124, %.110
  %ptr_gep.4 = getelementptr inbounds double, ptr %d0, i32 %.134
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %.135 = fmul double %.122, %ptr_load.4
  %.136 = add i32 %.126, %.110
  %ptr_gep.5 = getelementptr inbounds double, ptr %d0, i32 %.136
  %ptr_load.5 = load double, ptr %ptr_gep.5, align 8
  %.137 = fmul double %.120, %ptr_load.5
  %.138 = fadd double %.135, %.137
  %.139 = fmul double %.115, %.138
  %.140 = fadd double %.133, %.139
  %.141 = add i32 %.69, %i.0
  %.142 = getelementptr inbounds double, ptr %d, i32 %.141
  store double %.140, ptr %.142, align 8
  %.145 = add i32 %i.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.149 = add i32 %j.0, 1
  br label %for.cond
}

define void @project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start, i32 %row_end, ptr %u, ptr %v, ptr %p, ptr %div, double %hx, double %hy) {
entry:
  %.25 = icmp slt i32 %row_start, 1
  %.row_start = select i1 %.25, i32 1, i32 %row_start
  %.30 = sub i32 192, 1
  %.31 = icmp sgt i32 %row_end, %.30
  %.33 = sub i32 192, 1
  %jend.0 = select i1 %.31, i32 %.33, i32 %row_end
  br label %for.cond

for.cond:                                         ; preds = %for.end.1, %entry
  %j.0 = phi i32 [ %.row_start, %entry ], [ %.74, %for.end.1 ]
  %.39 = icmp slt i32 %j.0, %jend.0
  br i1 %.39, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.41 = mul i32 %j.0, 256
  br label %for.cond.1

for.end:                                          ; preds = %for.cond
  ret void

for.cond.1:                                       ; preds = %for.body.1, %for.body
  %i.0 = phi i32 [ 1, %for.body ], [ %.70, %for.body.1 ]
  %.45 = sub i32 256, 1
  %.46 = icmp slt i32 %i.0, %.45
  br i1 %.46, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.48 = fsub float 0.000000e+00, 5.000000e-01
  %.49 = add i32 %.41, %i.0
  %.50 = add i32 %.49, 1
  %ptr_gep = getelementptr inbounds double, ptr %u, i32 %.50
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.51 = add i32 %.41, %i.0
  %.52 = sub i32 %.51, 1
  %ptr_gep.1 = getelementptr inbounds double, ptr %u, i32 %.52
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.53 = fsub double %ptr_load, %ptr_load.1
  %.54 = fmul double %hx, %.53
  %.55 = add i32 %.41, %i.0
  %.56 = add i32 %.55, 256
  %ptr_gep.2 = getelementptr inbounds double, ptr %v, i32 %.56
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.57 = add i32 %.41, %i.0
  %.58 = sub i32 %.57, 256
  %ptr_gep.3 = getelementptr inbounds double, ptr %v, i32 %.58
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.59 = fsub double %ptr_load.2, %ptr_load.3
  %.60 = fmul double %hy, %.59
  %.61 = fadd double %.54, %.60
  %float_to_double_lhs = fpext float %.48 to double
  %.62 = fmul double %float_to_double_lhs, %.61
  %.63 = add i32 %.41, %i.0
  %.64 = getelementptr inbounds double, ptr %div, i32 %.63
  store double %.62, ptr %.64, align 8
  %.66 = add i32 %.41, %i.0
  %.67 = getelementptr inbounds double, ptr %p, i32 %.66
  %f32_to_f64 = fpext float 0.000000e+00 to double
  store double %f32_to_f64, ptr %.67, align 8
  %.70 = add i32 %i.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.74 = add i32 %j.0, 1
  br label %for.cond
}

define void @project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start, i32 %row_end, ptr %u, ptr %v, ptr %p, double %hx_inv, double %hy_inv) {
entry:
  %.23 = icmp slt i32 %row_start, 1
  %.row_start = select i1 %.23, i32 1, i32 %row_start
  %.28 = sub i32 192, 1
  %.29 = icmp sgt i32 %row_end, %.28
  %.31 = sub i32 192, 1
  %jend.0 = select i1 %.29, i32 %.31, i32 %row_end
  br label %for.cond

for.cond:                                         ; preds = %for.end.1, %entry
  %j.0 = phi i32 [ %.row_start, %entry ], [ %.75, %for.end.1 ]
  %.37 = icmp slt i32 %j.0, %jend.0
  br i1 %.37, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.39 = mul i32 %j.0, 256
  br label %for.cond.1

for.end:                                          ; preds = %for.cond
  ret void

for.cond.1:                                       ; preds = %for.body.1, %for.body
  %i.0 = phi i32 [ 1, %for.body ], [ %.71, %for.body.1 ]
  %.43 = sub i32 256, 1
  %.44 = icmp slt i32 %i.0, %.43
  br i1 %.44, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.46 = add i32 %.39, %i.0
  %ptr_gep = getelementptr inbounds double, ptr %u, i32 %.46
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.47 = add i32 %.39, %i.0
  %.48 = add i32 %.47, 1
  %ptr_gep.1 = getelementptr inbounds double, ptr %p, i32 %.48
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %.49 = add i32 %.39, %i.0
  %.50 = sub i32 %.49, 1
  %ptr_gep.2 = getelementptr inbounds double, ptr %p, i32 %.50
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.51 = fsub double %ptr_load.1, %ptr_load.2
  %float_to_double_lhs = fpext float 5.000000e-01 to double
  %.52 = fmul double %float_to_double_lhs, %.51
  %.53 = fmul double %.52, %hx_inv
  %.54 = fsub double %ptr_load, %.53
  %.55 = add i32 %.39, %i.0
  %.56 = getelementptr inbounds double, ptr %u, i32 %.55
  store double %.54, ptr %.56, align 8
  %.58 = add i32 %.39, %i.0
  %ptr_gep.3 = getelementptr inbounds double, ptr %v, i32 %.58
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.59 = add i32 %.39, %i.0
  %.60 = add i32 %.59, 256
  %ptr_gep.4 = getelementptr inbounds double, ptr %p, i32 %.60
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %.61 = add i32 %.39, %i.0
  %.62 = sub i32 %.61, 256
  %ptr_gep.5 = getelementptr inbounds double, ptr %p, i32 %.62
  %ptr_load.5 = load double, ptr %ptr_gep.5, align 8
  %.63 = fsub double %ptr_load.4, %ptr_load.5
  %float_to_double_lhs.1 = fpext float 5.000000e-01 to double
  %.64 = fmul double %float_to_double_lhs.1, %.63
  %.65 = fmul double %.64, %hy_inv
  %.66 = fsub double %ptr_load.3, %.65
  %.67 = add i32 %.39, %i.0
  %.68 = getelementptr inbounds double, ptr %v, i32 %.67
  store double %.66, ptr %.68, align 8
  %.71 = add i32 %i.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.75 = add i32 %j.0, 1
  br label %for.cond
}

define void @decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1(i32 %row_start, i32 %row_end, ptr %dens) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.end.1, %entry
  %j.0 = phi i32 [ %row_start, %entry ], [ %.38, %for.end.1 ]
  %.14 = icmp slt i32 %j.0, %row_end
  br i1 %.14, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.16 = mul i32 %j.0, 256
  br label %for.cond.1

for.end:                                          ; preds = %for.cond
  ret void

for.cond.1:                                       ; preds = %for.body.1, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %.34, %for.body.1 ]
  %.20 = icmp slt i32 %i.0, 256
  br i1 %.20, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %.22 = add i32 %.16, %i.0
  %ptr_gep = getelementptr inbounds double, ptr %dens, i32 %.22
  %ptr_load = load double, ptr %ptr_gep, align 8
  %float_to_double_rhs = fpext float 0x3FEFFE5CA0000000 to double
  %.23 = fmul double %ptr_load, %float_to_double_rhs
  %float_to_double_rhs.1 = fpext float 0x3F1A36E2E0000000 to double
  %.25 = fcmp olt double %.23, %float_to_double_rhs.1
  %f32_to_f64 = fpext float 0.000000e+00 to double
  %d.0 = select i1 %.25, double %f32_to_f64, double %.23
  %.30 = add i32 %.16, %i.0
  %.31 = getelementptr inbounds double, ptr %dens, i32 %.30
  store double %d.0, ptr %.31, align 8
  %.34 = add i32 %i.0, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  %.38 = add i32 %j.0, 1
  br label %for.cond
}

define void @particles_init__0__ret_voidE1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.30, %for.body ]
  %.5 = icmp slt i32 %i.0, 7500
  br i1 %.5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.7 = mul i32 %g_rand_seed, 1664525
  %.8 = add i32 %.7, 1013904223
  store i32 %.8, ptr @g_rand_seed, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.10 = and i32 %g_rand_seed.1, 2147483647
  %.11 = sitofp i32 %.10 to float
  %.12 = sitofp i32 2147483647 to float
  %.13 = fdiv float %.11, %.12
  %.14 = sitofp i32 256 to float
  %.15 = fmul float %.13, %.14
  %g_part_x = load ptr, ptr @g_part_x, align 8
  %.16 = getelementptr inbounds float, ptr %g_part_x, i32 %i.0
  store float %.15, ptr %.16, align 4
  %g_rand_seed.2 = load i32, ptr @g_rand_seed, align 4
  %.18 = mul i32 %g_rand_seed.2, 1664525
  %.19 = add i32 %.18, 1013904223
  store i32 %.19, ptr @g_rand_seed, align 4
  %g_rand_seed.3 = load i32, ptr @g_rand_seed, align 4
  %.21 = and i32 %g_rand_seed.3, 2147483647
  %.22 = sitofp i32 %.21 to float
  %.23 = sitofp i32 2147483647 to float
  %.24 = fdiv float %.22, %.23
  %.25 = sitofp i32 192 to float
  %.26 = fmul float %.24, %.25
  %g_part_y = load ptr, ptr @g_part_y, align 8
  %.27 = getelementptr inbounds float, ptr %g_part_y, i32 %i.0
  store float %.26, ptr %.27, align 4
  %.30 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @particles_update__0__ret_voidE1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.110, %for.body ]
  %.11 = icmp slt i32 %i.0, 7500
  br i1 %.11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %g_part_x = load ptr, ptr @g_part_x, align 8
  %ptr_gep = getelementptr inbounds float, ptr %g_part_x, i32 %i.0
  %ptr_load = load float, ptr %ptr_gep, align 4
  %g_part_y = load ptr, ptr @g_part_y, align 8
  %ptr_gep.1 = getelementptr inbounds float, ptr %g_part_y, i32 %i.0
  %ptr_load.1 = load float, ptr %ptr_gep.1, align 4
  %.15 = fptosi float %ptr_load to i32
  %.17 = fptosi float %ptr_load.1 to i32
  %.19 = icmp slt i32 %.15, 1
  %..15 = select i1 %.19, i32 1, i32 %.15
  %.24 = sub i32 256, 2
  %.25 = icmp sgt i32 %..15, %.24
  %.27 = sub i32 256, 2
  %pi.11 = select i1 %.25, i32 %.27, i32 %..15
  %.31 = icmp slt i32 %.17, 1
  %pj.0 = select i1 %.31, i32 1, i32 %.17
  %.36 = sub i32 192, 2
  %.37 = icmp sgt i32 %pj.0, %.36
  %.39 = sub i32 192, 2
  %pj.12 = select i1 %.37, i32 %.39, i32 %pj.0
  %g_vx = load ptr, ptr @g_vx, align 8
  %.43 = mul i32 %pj.12, 256
  %.44 = add i32 %.43, %pi.11
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_vx, i32 %.44
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %float_to_double_rhs = fpext float 1.500000e+01 to double
  %.45 = fmul double %ptr_load.2, %float_to_double_rhs
  %.46 = fptrunc double %.45 to float
  %g_vy = load ptr, ptr @g_vy, align 8
  %.48 = mul i32 %pj.12, 256
  %.49 = add i32 %.48, %pi.11
  %ptr_gep.3 = getelementptr inbounds double, ptr %g_vy, i32 %.49
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %float_to_double_rhs.1 = fpext float 1.500000e+01 to double
  %.50 = fmul double %ptr_load.3, %float_to_double_rhs.1
  %.51 = fptrunc double %.50 to float
  %g_rand_seed = load i32, ptr @g_rand_seed, align 4
  %.53 = mul i32 %g_rand_seed, 1664525
  %.54 = add i32 %.53, 1013904223
  store i32 %.54, ptr @g_rand_seed, align 4
  %g_rand_seed.1 = load i32, ptr @g_rand_seed, align 4
  %.56 = and i32 %g_rand_seed.1, 255
  %.57 = sub i32 %.56, 128
  %.58 = sitofp i32 %.57 to float
  %.59 = fmul float %.58, 0x3F50624DE0000000
  %.60 = fadd float %.46, %.59
  %g_rand_seed.2 = load i32, ptr @g_rand_seed, align 4
  %.62 = mul i32 %g_rand_seed.2, 1664525
  %.63 = add i32 %.62, 1013904223
  store i32 %.63, ptr @g_rand_seed, align 4
  %g_rand_seed.3 = load i32, ptr @g_rand_seed, align 4
  %.65 = and i32 %g_rand_seed.3, 255
  %.66 = sub i32 %.65, 128
  %.67 = sitofp i32 %.66 to float
  %.68 = fmul float %.67, 0x3F50624DE0000000
  %.69 = fadd float %.51, %.68
  %.71 = fadd float %ptr_load, %.60
  %.73 = fadd float %ptr_load.1, %.69
  %.75 = fcmp olt float %.71, 0.000000e+00
  %.77 = sitofp i32 256 to float
  %.78 = fadd float %.71, %.77
  %px.0 = select i1 %.75, float %.78, float %.71
  %.82 = sitofp i32 256 to float
  %.83 = fcmp oge float %px.0, %.82
  %.85 = sitofp i32 256 to float
  %.86 = fsub float %px.0, %.85
  %px.13 = select i1 %.83, float %.86, float %px.0
  %.90 = fcmp olt float %.73, 0.000000e+00
  %.92 = sitofp i32 192 to float
  %.93 = fadd float %.73, %.92
  %py.0 = select i1 %.90, float %.93, float %.73
  %.97 = sitofp i32 192 to float
  %.98 = fcmp oge float %py.0, %.97
  %.100 = sitofp i32 192 to float
  %.101 = fsub float %py.0, %.100
  %py.14 = select i1 %.98, float %.101, float %py.0
  %g_part_x.1 = load ptr, ptr @g_part_x, align 8
  %.105 = getelementptr inbounds float, ptr %g_part_x.1, i32 %i.0
  store float %px.13, ptr %.105, align 4
  %g_part_y.1 = load ptr, ptr @g_part_y, align 8
  %.107 = getelementptr inbounds float, ptr %g_part_y.1, i32 %i.0
  store float %py.14, ptr %.107, align 4
  %.110 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define ptr @worker__1__voidE1_ptr1__ret_voidE1_ptr1(ptr %arg) {
entry:
  %from_void_ptr = bitcast ptr %arg to ptr
  br label %while.cond

while.cond:                                       ; preds = %ifcont.1, %entry
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  call void @standard__atomic__load_fence__0__ret_voidE1()
  %phase_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase = load i32, ptr %phase_ptr, align 4
  %PHASE_EXIT = load i32, ptr @PHASE_EXIT, align 4
  %.9 = icmp eq i32 %phase, %PHASE_EXIT
  br i1 %.9, label %then, label %ifcont

then:                                             ; preds = %while.cond
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  ret ptr %int_to_ptr

ifcont:                                           ; preds = %while.cond
  %phase_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.1 = load i32, ptr %phase_ptr.1, align 4
  %PHASE_LINSOLVE_RED = load i32, ptr @PHASE_LINSOLVE_RED, align 4
  %.13 = icmp eq i32 %phase.1, %PHASE_LINSOLVE_RED
  br i1 %.13, label %then.1, label %sc_rhs

sc_rhs:                                           ; preds = %ifcont
  %phase_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.2 = load i32, ptr %phase_ptr.2, align 4
  %PHASE_LINSOLVE_BLACK = load i32, ptr @PHASE_LINSOLVE_BLACK, align 4
  %.15 = icmp eq i32 %phase.2, %PHASE_LINSOLVE_BLACK
  br i1 %.15, label %then.1, label %else.1

then.1:                                           ; preds = %ifcont, %sc_rhs
  %row_start_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start = load i32, ptr %row_start_ptr, align 4
  %row_end_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end = load i32, ptr %row_end_ptr, align 4
  %ls_color_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 3
  %ls_color = load i32, ptr %ls_color_ptr, align 4
  %ls_x_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 4
  %ls_x = load ptr, ptr %ls_x_ptr, align 8
  %ls_x0_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 5
  %ls_x0 = load ptr, ptr %ls_x0_ptr, align 8
  %ls_a_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 6
  %ls_a = load double, ptr %ls_a_ptr, align 8
  %ls_c_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 7
  %ls_c_inv = load double, ptr %ls_c_inv_ptr, align 8
  call void @linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start, i32 %row_end, i32 %ls_color, ptr %ls_x, ptr %ls_x0, double %ls_a, double %ls_c_inv)
  br label %ifcont.1

else.1:                                           ; preds = %sc_rhs
  %phase_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.3 = load i32, ptr %phase_ptr.3, align 4
  %PHASE_ADVECT = load i32, ptr @PHASE_ADVECT, align 4
  %.20 = icmp eq i32 %phase.3, %PHASE_ADVECT
  br i1 %.20, label %elif_then_0, label %elif_else_0

ifcont.1:                                         ; preds = %elif_else_2, %elif_then_3, %elif_then_2, %elif_then_1, %elif_then_0, %then.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  br label %while.cond

elif_then_0:                                      ; preds = %else.1
  %row_start_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.1 = load i32, ptr %row_start_ptr.1, align 4
  %row_end_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.1 = load i32, ptr %row_end_ptr.1, align 4
  %adv_dst_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 8
  %adv_dst = load ptr, ptr %adv_dst_ptr, align 8
  %adv_src_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 9
  %adv_src = load ptr, ptr %adv_src_ptr, align 8
  %adv_u_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 10
  %adv_u = load ptr, ptr %adv_u_ptr, align 8
  %adv_v_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 11
  %adv_v = load ptr, ptr %adv_v_ptr, align 8
  call void @advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(i32 %row_start.1, i32 %row_end.1, ptr %adv_dst, ptr %adv_src, ptr %adv_u, ptr %adv_v)
  br label %ifcont.1

elif_else_0:                                      ; preds = %else.1
  %phase_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.4 = load i32, ptr %phase_ptr.4, align 4
  %PHASE_PROJECT_DIV = load i32, ptr @PHASE_PROJECT_DIV, align 4
  %.24 = icmp eq i32 %phase.4, %PHASE_PROJECT_DIV
  br i1 %.24, label %elif_then_1, label %elif_else_1

elif_then_1:                                      ; preds = %elif_else_0
  %row_start_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.2 = load i32, ptr %row_start_ptr.2, align 4
  %row_end_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.2 = load i32, ptr %row_end_ptr.2, align 4
  %proj_u_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 12
  %proj_u = load ptr, ptr %proj_u_ptr, align 8
  %proj_v_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 13
  %proj_v = load ptr, ptr %proj_v_ptr, align 8
  %proj_p_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 14
  %proj_p = load ptr, ptr %proj_p_ptr, align 8
  %proj_div_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 15
  %proj_div = load ptr, ptr %proj_div_ptr, align 8
  %proj_hx_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 16
  %proj_hx = load double, ptr %proj_hx_ptr, align 8
  %proj_hy_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 17
  %proj_hy = load double, ptr %proj_hy_ptr, align 8
  call void @project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start.2, i32 %row_end.2, ptr %proj_u, ptr %proj_v, ptr %proj_p, ptr %proj_div, double %proj_hx, double %proj_hy)
  br label %ifcont.1

elif_else_1:                                      ; preds = %elif_else_0
  %phase_ptr.5 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.5 = load i32, ptr %phase_ptr.5, align 4
  %PHASE_PROJECT_GRAD = load i32, ptr @PHASE_PROJECT_GRAD, align 4
  %.28 = icmp eq i32 %phase.5, %PHASE_PROJECT_GRAD
  br i1 %.28, label %elif_then_2, label %elif_else_2

elif_then_2:                                      ; preds = %elif_else_1
  %row_start_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.3 = load i32, ptr %row_start_ptr.3, align 4
  %row_end_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.3 = load i32, ptr %row_end_ptr.3, align 4
  %proj_u_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 12
  %proj_u.1 = load ptr, ptr %proj_u_ptr.1, align 8
  %proj_v_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 13
  %proj_v.1 = load ptr, ptr %proj_v_ptr.1, align 8
  %proj_p_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 14
  %proj_p.1 = load ptr, ptr %proj_p_ptr.1, align 8
  %proj_hx_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 18
  %proj_hx_inv = load double, ptr %proj_hx_inv_ptr, align 8
  %proj_hy_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 19
  %proj_hy_inv = load double, ptr %proj_hy_inv_ptr, align 8
  call void @project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start.3, i32 %row_end.3, ptr %proj_u.1, ptr %proj_v.1, ptr %proj_p.1, double %proj_hx_inv, double %proj_hy_inv)
  br label %ifcont.1

elif_else_2:                                      ; preds = %elif_else_1
  %phase_ptr.6 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.6 = load i32, ptr %phase_ptr.6, align 4
  %PHASE_DECAY = load i32, ptr @PHASE_DECAY, align 4
  %.32 = icmp eq i32 %phase.6, %PHASE_DECAY
  br i1 %.32, label %elif_then_3, label %ifcont.1

elif_then_3:                                      ; preds = %elif_else_2
  %row_start_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.4 = load i32, ptr %row_start_ptr.4, align 4
  %row_end_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.4 = load i32, ptr %row_end_ptr.4, align 4
  %dp_dens_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 20
  %dp_dens = load ptr, ptr %dp_dens_ptr, align 8
  call void @decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1(i32 %row_start.4, i32 %row_end.4, ptr %dp_dens)
  br label %ifcont.1
}

define ptr @worker2__1__voidE1_ptr1__ret_voidE1_ptr1(ptr %arg) {
entry:
  %from_void_ptr = bitcast ptr %arg to ptr
  br label %while.cond

while.cond:                                       ; preds = %ifcont.1, %entry
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem2)
  call void @standard__atomic__load_fence__0__ret_voidE1()
  %phase_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase = load i32, ptr %phase_ptr, align 4
  %PHASE_EXIT = load i32, ptr @PHASE_EXIT, align 4
  %.9 = icmp eq i32 %phase, %PHASE_EXIT
  br i1 %.9, label %then, label %ifcont

then:                                             ; preds = %while.cond
  %int_to_ptr_zext = zext i32 0 to i64
  %int_to_ptr = inttoptr i64 %int_to_ptr_zext to ptr
  ret ptr %int_to_ptr

ifcont:                                           ; preds = %while.cond
  %phase_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.1 = load i32, ptr %phase_ptr.1, align 4
  %PHASE_LINSOLVE_RED = load i32, ptr @PHASE_LINSOLVE_RED, align 4
  %.13 = icmp eq i32 %phase.1, %PHASE_LINSOLVE_RED
  br i1 %.13, label %then.1, label %sc_rhs

sc_rhs:                                           ; preds = %ifcont
  %phase_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.2 = load i32, ptr %phase_ptr.2, align 4
  %PHASE_LINSOLVE_BLACK = load i32, ptr @PHASE_LINSOLVE_BLACK, align 4
  %.15 = icmp eq i32 %phase.2, %PHASE_LINSOLVE_BLACK
  br i1 %.15, label %then.1, label %else.1

then.1:                                           ; preds = %ifcont, %sc_rhs
  %row_start_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start = load i32, ptr %row_start_ptr, align 4
  %row_end_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end = load i32, ptr %row_end_ptr, align 4
  %ls_color_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 3
  %ls_color = load i32, ptr %ls_color_ptr, align 4
  %ls_x_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 4
  %ls_x = load ptr, ptr %ls_x_ptr, align 8
  %ls_x0_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 5
  %ls_x0 = load ptr, ptr %ls_x0_ptr, align 8
  %ls_a_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 6
  %ls_a = load double, ptr %ls_a_ptr, align 8
  %ls_c_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 7
  %ls_c_inv = load double, ptr %ls_c_inv_ptr, align 8
  call void @linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start, i32 %row_end, i32 %ls_color, ptr %ls_x, ptr %ls_x0, double %ls_a, double %ls_c_inv)
  br label %ifcont.1

else.1:                                           ; preds = %sc_rhs
  %phase_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.3 = load i32, ptr %phase_ptr.3, align 4
  %PHASE_ADVECT = load i32, ptr @PHASE_ADVECT, align 4
  %.20 = icmp eq i32 %phase.3, %PHASE_ADVECT
  br i1 %.20, label %elif_then_0, label %elif_else_0

ifcont.1:                                         ; preds = %elif_else_2, %elif_then_3, %elif_then_2, %elif_then_1, %elif_then_0, %then.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem2)
  br label %while.cond

elif_then_0:                                      ; preds = %else.1
  %row_start_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.1 = load i32, ptr %row_start_ptr.1, align 4
  %row_end_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.1 = load i32, ptr %row_end_ptr.1, align 4
  %adv_dst_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 8
  %adv_dst = load ptr, ptr %adv_dst_ptr, align 8
  %adv_src_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 9
  %adv_src = load ptr, ptr %adv_src_ptr, align 8
  %adv_u_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 10
  %adv_u = load ptr, ptr %adv_u_ptr, align 8
  %adv_v_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 11
  %adv_v = load ptr, ptr %adv_v_ptr, align 8
  call void @advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(i32 %row_start.1, i32 %row_end.1, ptr %adv_dst, ptr %adv_src, ptr %adv_u, ptr %adv_v)
  br label %ifcont.1

elif_else_0:                                      ; preds = %else.1
  %phase_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.4 = load i32, ptr %phase_ptr.4, align 4
  %PHASE_PROJECT_DIV = load i32, ptr @PHASE_PROJECT_DIV, align 4
  %.24 = icmp eq i32 %phase.4, %PHASE_PROJECT_DIV
  br i1 %.24, label %elif_then_1, label %elif_else_1

elif_then_1:                                      ; preds = %elif_else_0
  %row_start_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.2 = load i32, ptr %row_start_ptr.2, align 4
  %row_end_ptr.2 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.2 = load i32, ptr %row_end_ptr.2, align 4
  %proj_u_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 12
  %proj_u = load ptr, ptr %proj_u_ptr, align 8
  %proj_v_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 13
  %proj_v = load ptr, ptr %proj_v_ptr, align 8
  %proj_p_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 14
  %proj_p = load ptr, ptr %proj_p_ptr, align 8
  %proj_div_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 15
  %proj_div = load ptr, ptr %proj_div_ptr, align 8
  %proj_hx_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 16
  %proj_hx = load double, ptr %proj_hx_ptr, align 8
  %proj_hy_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 17
  %proj_hy = load double, ptr %proj_hy_ptr, align 8
  call void @project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start.2, i32 %row_end.2, ptr %proj_u, ptr %proj_v, ptr %proj_p, ptr %proj_div, double %proj_hx, double %proj_hy)
  br label %ifcont.1

elif_else_1:                                      ; preds = %elif_else_0
  %phase_ptr.5 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.5 = load i32, ptr %phase_ptr.5, align 4
  %PHASE_PROJECT_GRAD = load i32, ptr @PHASE_PROJECT_GRAD, align 4
  %.28 = icmp eq i32 %phase.5, %PHASE_PROJECT_GRAD
  br i1 %.28, label %elif_then_2, label %elif_else_2

elif_then_2:                                      ; preds = %elif_else_1
  %row_start_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.3 = load i32, ptr %row_start_ptr.3, align 4
  %row_end_ptr.3 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.3 = load i32, ptr %row_end_ptr.3, align 4
  %proj_u_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 12
  %proj_u.1 = load ptr, ptr %proj_u_ptr.1, align 8
  %proj_v_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 13
  %proj_v.1 = load ptr, ptr %proj_v_ptr.1, align 8
  %proj_p_ptr.1 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 14
  %proj_p.1 = load ptr, ptr %proj_p_ptr.1, align 8
  %proj_hx_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 18
  %proj_hx_inv = load double, ptr %proj_hx_inv_ptr, align 8
  %proj_hy_inv_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 19
  %proj_hy_inv = load double, ptr %proj_hy_inv_ptr, align 8
  call void @project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %row_start.3, i32 %row_end.3, ptr %proj_u.1, ptr %proj_v.1, ptr %proj_p.1, double %proj_hx_inv, double %proj_hy_inv)
  br label %ifcont.1

elif_else_2:                                      ; preds = %elif_else_1
  %phase_ptr.6 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 2
  %phase.6 = load i32, ptr %phase_ptr.6, align 4
  %PHASE_DECAY = load i32, ptr @PHASE_DECAY, align 4
  %.32 = icmp eq i32 %phase.6, %PHASE_DECAY
  br i1 %.32, label %elif_then_3, label %ifcont.1

elif_then_3:                                      ; preds = %elif_else_2
  %row_start_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 0
  %row_start.4 = load i32, ptr %row_start_ptr.4, align 4
  %row_end_ptr.4 = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 1
  %row_end.4 = load i32, ptr %row_end_ptr.4, align 4
  %dp_dens_ptr = getelementptr inbounds %WorkSlice, ptr %from_void_ptr, i32 0, i32 20
  %dp_dens = load ptr, ptr %dp_dens_ptr, align 8
  call void @decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1(i32 %row_start.4, i32 %row_end.4, ptr %dp_dens)
  br label %ifcont.1
}

define void @dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %color, ptr %x, ptr %x0, double %a, double %c_inv) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.34, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.15 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.17 = icmp eq i32 %color, 0
  %PHASE_LINSOLVE_RED = load i32, ptr @PHASE_LINSOLVE_RED, align 4
  %PHASE_LINSOLVE_BLACK = load i32, ptr @PHASE_LINSOLVE_BLACK, align 4
  %ternary_result = select i1 %.17, i32 %PHASE_LINSOLVE_RED, i32 %PHASE_LINSOLVE_BLACK
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %ternary_result, ptr %.21, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 4
  store ptr %x, ptr %.23, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.25 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 5
  store ptr %x0, ptr %.25, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.27 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 6
  store double %a, ptr %.27, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.29 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 7
  store double %c_inv, ptr %.29, align 8
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices2, i32 0, i32 %t.0
  %.31 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 3
  store i32 %color, ptr %.31, align 4
  %.34 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.11 = phi i32 [ 0, %for.end ], [ %.43, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.39 = icmp slt i32 %t.11, %g_num_threads.1
  br i1 %.39, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem2)
  %.43 = add i32 %t.11, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  ret void
}

define void @collect2__0__ret_voidE1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.9, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.5 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem2)
  %.9 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %color, ptr %x, ptr %x0, double %a, double %c_inv) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.34, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.15 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.17 = icmp eq i32 %color, 0
  %PHASE_LINSOLVE_RED = load i32, ptr @PHASE_LINSOLVE_RED, align 4
  %PHASE_LINSOLVE_BLACK = load i32, ptr @PHASE_LINSOLVE_BLACK, align 4
  %ternary_result = select i1 %.17, i32 %PHASE_LINSOLVE_RED, i32 %PHASE_LINSOLVE_BLACK
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %ternary_result, ptr %.21, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 4
  store ptr %x, ptr %.23, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.25 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 5
  store ptr %x0, ptr %.25, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.27 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 6
  store double %a, ptr %.27, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.29 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 7
  store double %c_inv, ptr %.29, align 8
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.31 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 3
  store i32 %color, ptr %.31, align 4
  %.34 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.11 = phi i32 [ 0, %for.end ], [ %.43, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.39 = icmp slt i32 %t.11, %g_num_threads.1
  br i1 %.39, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.43 = add i32 %t.11, 1
  br label %for.cond.1

for.end.1:                                        ; preds = %for.cond.1
  ret void
}

define void @collect1__0__ret_voidE1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.9, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.5 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.9 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %color, ptr %x, ptr %x0, double %a, double %c_inv) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.34, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.15 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.17 = icmp eq i32 %color, 0
  %PHASE_LINSOLVE_RED = load i32, ptr @PHASE_LINSOLVE_RED, align 4
  %PHASE_LINSOLVE_BLACK = load i32, ptr @PHASE_LINSOLVE_BLACK, align 4
  %ternary_result = select i1 %.17, i32 %PHASE_LINSOLVE_RED, i32 %PHASE_LINSOLVE_BLACK
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %ternary_result, ptr %.21, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 4
  store ptr %x, ptr %.23, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.25 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 5
  store ptr %x0, ptr %.25, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.27 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 6
  store double %a, ptr %.27, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.29 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 7
  store double %c_inv, ptr %.29, align 8
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.31 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 3
  store i32 %color, ptr %.31, align 4
  %.34 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.13 = phi i32 [ 0, %for.end ], [ %.43, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.39 = icmp slt i32 %t.13, %g_num_threads.1
  br i1 %.39, label %for.body.1, label %for.cond.2

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.43 = add i32 %t.13, 1
  br label %for.cond.1

for.cond.2:                                       ; preds = %for.cond.1, %for.body.2
  %t.24 = phi i32 [ %.52, %for.body.2 ], [ 0, %for.cond.1 ]
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.48 = icmp slt i32 %t.24, %g_num_threads.2
  br i1 %.48, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.52 = add i32 %t.24, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  ret void
}

define void @dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %dst, ptr %src, ptr %u, ptr %v) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.26, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.13 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.13, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %PHASE_ADVECT = load i32, ptr @PHASE_ADVECT, align 4
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.15 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %PHASE_ADVECT, ptr %.15, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.17 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 8
  store ptr %dst, ptr %.17, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.19 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 9
  store ptr %src, ptr %.19, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 10
  store ptr %u, ptr %.21, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 11
  store ptr %v, ptr %.23, align 8
  %.26 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.12 = phi i32 [ 0, %for.end ], [ %.35, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.31 = icmp slt i32 %t.12, %g_num_threads.1
  br i1 %.31, label %for.body.1, label %for.cond.2

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.35 = add i32 %t.12, 1
  br label %for.cond.1

for.cond.2:                                       ; preds = %for.cond.1, %for.body.2
  %t.23 = phi i32 [ %.44, %for.body.2 ], [ 0, %for.cond.1 ]
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.40 = icmp slt i32 %t.23, %g_num_threads.2
  br i1 %.40, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.44 = add i32 %t.23, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  ret void
}

define void @dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(ptr %u, ptr %v, ptr %p, ptr %div, double %hx, double %hy) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.34, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.17 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.17, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %PHASE_PROJECT_DIV = load i32, ptr @PHASE_PROJECT_DIV, align 4
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.19 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %PHASE_PROJECT_DIV, ptr %.19, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 12
  store ptr %u, ptr %.21, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 13
  store ptr %v, ptr %.23, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.25 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 14
  store ptr %p, ptr %.25, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.27 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 15
  store ptr %div, ptr %.27, align 8
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.29 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 16
  store double %hx, ptr %.29, align 8
  %array_gep.6 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.31 = getelementptr inbounds %WorkSlice, ptr %array_gep.6, i32 0, i32 17
  store double %hy, ptr %.31, align 8
  %.34 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.14 = phi i32 [ 0, %for.end ], [ %.43, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.39 = icmp slt i32 %t.14, %g_num_threads.1
  br i1 %.39, label %for.body.1, label %for.cond.2

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.43 = add i32 %t.14, 1
  br label %for.cond.1

for.cond.2:                                       ; preds = %for.cond.1, %for.body.2
  %t.25 = phi i32 [ %.52, %for.body.2 ], [ 0, %for.cond.1 ]
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.48 = icmp slt i32 %t.25, %g_num_threads.2
  br i1 %.48, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.52 = add i32 %t.25, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  ret void
}

define void @dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(ptr %u, ptr %v, ptr %p, double %hx_inv, double %hy_inv) {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.30, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.15 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %PHASE_PROJECT_GRAD = load i32, ptr @PHASE_PROJECT_GRAD, align 4
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.17 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %PHASE_PROJECT_GRAD, ptr %.17, align 4
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.19 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 12
  store ptr %u, ptr %.19, align 8
  %array_gep.2 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.21 = getelementptr inbounds %WorkSlice, ptr %array_gep.2, i32 0, i32 13
  store ptr %v, ptr %.21, align 8
  %array_gep.3 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.23 = getelementptr inbounds %WorkSlice, ptr %array_gep.3, i32 0, i32 14
  store ptr %p, ptr %.23, align 8
  %array_gep.4 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.25 = getelementptr inbounds %WorkSlice, ptr %array_gep.4, i32 0, i32 18
  store double %hx_inv, ptr %.25, align 8
  %array_gep.5 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.27 = getelementptr inbounds %WorkSlice, ptr %array_gep.5, i32 0, i32 19
  store double %hy_inv, ptr %.27, align 8
  %.30 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.13 = phi i32 [ 0, %for.end ], [ %.39, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.35 = icmp slt i32 %t.13, %g_num_threads.1
  br i1 %.35, label %for.body.1, label %for.cond.2

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.39 = add i32 %t.13, 1
  br label %for.cond.1

for.cond.2:                                       ; preds = %for.cond.1, %for.body.2
  %t.24 = phi i32 [ %.48, %for.body.2 ], [ 0, %for.cond.1 ]
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.44 = icmp slt i32 %t.24, %g_num_threads.2
  br i1 %.44, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.48 = add i32 %t.24, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  ret void
}

define void @dispatch_decay__0__ret_voidE1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %.12, %for.body ]
  %g_num_threads = load i32, ptr @g_num_threads, align 4
  %.5 = icmp slt i32 %t.0, %g_num_threads
  br i1 %.5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %PHASE_DECAY = load i32, ptr @PHASE_DECAY, align 4
  %array_gep = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.7 = getelementptr inbounds %WorkSlice, ptr %array_gep, i32 0, i32 2
  store i32 %PHASE_DECAY, ptr %.7, align 4
  %g_dens = load ptr, ptr @g_dens, align 8
  %array_gep.1 = getelementptr inbounds [64 x %WorkSlice], ptr @g_slices, i32 0, i32 %t.0
  %.9 = getelementptr inbounds %WorkSlice, ptr %array_gep.1, i32 0, i32 20
  store ptr %g_dens, ptr %.9, align 8
  %.12 = add i32 %t.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @standard__atomic__store_fence__0__ret_voidE1()
  br label %for.cond.1

for.cond.1:                                       ; preds = %for.body.1, %for.end
  %t.11 = phi i32 [ 0, %for.end ], [ %.21, %for.body.1 ]
  %g_num_threads.1 = load i32, ptr @g_num_threads, align 4
  %.17 = icmp slt i32 %t.11, %g_num_threads.1
  br i1 %.17, label %for.body.1, label %for.cond.2

for.body.1:                                       ; preds = %for.cond.1
  call void @standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_work_sem)
  %.21 = add i32 %t.11, 1
  br label %for.cond.1

for.cond.2:                                       ; preds = %for.cond.1, %for.body.2
  %t.22 = phi i32 [ %.30, %for.body.2 ], [ 0, %for.cond.1 ]
  %g_num_threads.2 = load i32, ptr @g_num_threads, align 4
  %.26 = icmp slt i32 %t.22, %g_num_threads.2
  br i1 %.26, label %for.body.2, label %for.end.2

for.body.2:                                       ; preds = %for.cond.2
  call void @standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1(ptr @g_done_sem)
  %.30 = add i32 %t.22, 1
  br label %for.cond.2

for.end.2:                                        ; preds = %for.cond.2
  ret void
}

define void @upload_textures__0__ret_voidE1() {
entry:
  %.8 = mul i32 256, 192
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %.38, %for.body ]
  %.12 = icmp slt i32 %i.0, %.8
  br i1 %.12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %g_dens = load ptr, ptr @g_dens, align 8
  %ptr_gep = getelementptr inbounds double, ptr %g_dens, i32 %i.0
  %ptr_load = load double, ptr %ptr_gep, align 8
  %.14 = fmul double %ptr_load, 0x3F70101010101010
  %.15 = fptrunc double %.14 to float
  %.17 = fcmp ogt float %.15, 1.000000e+00
  %..15 = select i1 %.17, float 1.000000e+00, float %.15
  %g_dens_tex = load ptr, ptr @g_dens_tex, align 8
  %.22 = getelementptr inbounds float, ptr %g_dens_tex, i32 %i.0
  store float %..15, ptr %.22, align 4
  %.24 = mul i32 %i.0, 2
  %g_vx = load ptr, ptr @g_vx, align 8
  %ptr_gep.1 = getelementptr inbounds double, ptr %g_vx, i32 %i.0
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %float_to_double_rhs = fpext float 4.000000e+00 to double
  %.26 = fmul double %ptr_load.1, %float_to_double_rhs
  %.27 = fptrunc double %.26 to float
  %.28 = fadd float %.27, 5.000000e-01
  %g_vel_tex = load ptr, ptr @g_vel_tex, align 8
  %.29 = getelementptr inbounds float, ptr %g_vel_tex, i32 %.24
  store float %.28, ptr %.29, align 4
  %g_vy = load ptr, ptr @g_vy, align 8
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_vy, i32 %i.0
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %float_to_double_rhs.1 = fpext float 4.000000e+00 to double
  %.31 = fmul double %ptr_load.2, %float_to_double_rhs.1
  %.32 = fptrunc double %.31 to float
  %.33 = fadd float %.32, 5.000000e-01
  %g_vel_tex.1 = load ptr, ptr @g_vel_tex, align 8
  %.34 = add i32 %.24, 1
  %.35 = getelementptr inbounds float, ptr %g_vel_tex.1, i32 %.34
  store float %.33, ptr %.35, align 4
  %.38 = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %b, ptr %x, ptr %x0, double %a, double %c) {
entry:
  %float_to_double_lhs = fpext float 1.000000e+00 to double
  %.14 = fdiv double %float_to_double_lhs, %c
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %.29, %ifcont ]
  %.18 = icmp slt i32 %k.0, 20
  br i1 %.18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 0, ptr %x, ptr %x0, double %a, double %.14)
  call void @dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 1, ptr %x, ptr %x0, double %a, double %.14)
  %.22 = sub i32 20, 1
  %.23 = icmp eq i32 %k.0, %.22
  br i1 %.23, label %then, label %ifcont

for.end:                                          ; preds = %for.cond
  ret void

then:                                             ; preds = %for.body
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 %b, ptr %x)
  br label %ifcont

ifcont:                                           ; preds = %for.body, %then
  %.29 = add i32 %k.0, 1
  br label %for.cond
}

define void @diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1(i32 %b, ptr %x, ptr %x0, double %diff) {
entry:
  %float_to_double_lhs = fpext float 0x3FB99999A0000000 to double
  %.11 = fmul double %float_to_double_lhs, %diff
  %.12 = sub i32 256, 2
  %.13 = sitofp i32 %.12 to double
  %.14 = fmul double %.11, %.13
  %.15 = sub i32 192, 2
  %.16 = sitofp i32 %.15 to double
  %.17 = fmul double %.14, %.16
  %float_to_double_lhs.1 = fpext float 4.000000e+00 to double
  %.19 = fmul double %float_to_double_lhs.1, %.17
  %float_to_double_lhs.2 = fpext float 1.000000e+00 to double
  %.20 = fadd double %float_to_double_lhs.2, %.19
  call void @lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 %b, ptr %x, ptr %x0, double %.17, double %.20)
  ret void
}

define void @project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %u, ptr %v, ptr %p, ptr %div) {
entry:
  %.14 = sub i32 256, 2
  %.15 = sitofp i32 %.14 to double
  %float_to_double_lhs = fpext float 1.000000e+00 to double
  %.16 = fdiv double %float_to_double_lhs, %.15
  %.18 = sub i32 192, 2
  %.19 = sitofp i32 %.18 to double
  %float_to_double_lhs.1 = fpext float 1.000000e+00 to double
  %.20 = fdiv double %float_to_double_lhs.1, %.19
  %.22 = sub i32 256, 2
  %.23 = sitofp i32 %.22 to double
  %.25 = sub i32 192, 2
  %.26 = sitofp i32 %.25 to double
  call void @dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(ptr %u, ptr %v, ptr %p, ptr %div, double %.16, double %.20)
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 0, ptr %div)
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 0, ptr %p)
  %arg3_float_to_double = fpext float 1.000000e+00 to double
  %arg4_float_to_double = fpext float 4.000000e+00 to double
  call void @lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 0, ptr %p, ptr %div, double %arg3_float_to_double, double %arg4_float_to_double)
  call void @dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(ptr %u, ptr %v, ptr %p, double %.23, double %.26)
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 1, ptr %u)
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 2, ptr %v)
  ret void
}

define void @diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1(i32 %b1, ptr %x1, ptr %x10, double %diff1, i32 %b2, ptr %x2, ptr %x20, double %diff2) {
entry:
  %float_to_double_lhs = fpext float 0x3FB99999A0000000 to double
  %.23 = fmul double %float_to_double_lhs, %diff1
  %.24 = sub i32 256, 2
  %.25 = sitofp i32 %.24 to double
  %.26 = fmul double %.23, %.25
  %.27 = sub i32 192, 2
  %.28 = sitofp i32 %.27 to double
  %.29 = fmul double %.26, %.28
  %float_to_double_lhs.1 = fpext float 0x3FB99999A0000000 to double
  %.31 = fmul double %float_to_double_lhs.1, %diff2
  %.32 = sub i32 256, 2
  %.33 = sitofp i32 %.32 to double
  %.34 = fmul double %.31, %.33
  %.35 = sub i32 192, 2
  %.36 = sitofp i32 %.35 to double
  %.37 = fmul double %.34, %.36
  %float_to_double_lhs.2 = fpext float 4.000000e+00 to double
  %.39 = fmul double %float_to_double_lhs.2, %.29
  %float_to_double_lhs.3 = fpext float 1.000000e+00 to double
  %.40 = fadd double %float_to_double_lhs.3, %.39
  %float_to_double_lhs.4 = fpext float 1.000000e+00 to double
  %.41 = fdiv double %float_to_double_lhs.4, %.40
  %float_to_double_lhs.5 = fpext float 4.000000e+00 to double
  %.43 = fmul double %float_to_double_lhs.5, %.37
  %float_to_double_lhs.6 = fpext float 1.000000e+00 to double
  %.44 = fadd double %float_to_double_lhs.6, %.43
  %float_to_double_lhs.7 = fpext float 1.000000e+00 to double
  %.45 = fdiv double %float_to_double_lhs.7, %.44
  br label %for.cond

for.cond:                                         ; preds = %ifcont, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %.63, %ifcont ]
  %.49 = icmp slt i32 %k.0, 20
  br i1 %.49, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 0, ptr %x1, ptr %x10, double %.29, double %.41)
  call void @dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 0, ptr %x2, ptr %x20, double %.37, double %.45)
  call void @collect1__0__ret_voidE1()
  call void @collect2__0__ret_voidE1()
  call void @dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 1, ptr %x1, ptr %x10, double %.29, double %.41)
  call void @dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1(i32 1, ptr %x2, ptr %x20, double %.37, double %.45)
  call void @collect1__0__ret_voidE1()
  call void @collect2__0__ret_voidE1()
  %.55 = sub i32 20, 1
  %.56 = icmp eq i32 %k.0, %.55
  br i1 %.56, label %then, label %ifcont

for.end:                                          ; preds = %for.cond
  ret void

then:                                             ; preds = %for.body
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 %b1, ptr %x1)
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 %b2, ptr %x2)
  br label %ifcont

ifcont:                                           ; preds = %for.body, %then
  %.63 = add i32 %k.0, 1
  br label %for.cond
}

define void @vel_step__0__ret_voidE1() {
entry:
  %g_vx_prev = load ptr, ptr @g_vx_prev, align 8
  %g_vx = load ptr, ptr @g_vx, align 8
  %g_vy_prev = load ptr, ptr @g_vy_prev, align 8
  %g_vy = load ptr, ptr @g_vy, align 8
  %arg3_float_to_double = fpext float 0x3F50624DE0000000 to double
  %arg7_float_to_double = fpext float 0x3F50624DE0000000 to double
  call void @diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1(i32 1, ptr %g_vx_prev, ptr %g_vx, double %arg3_float_to_double, i32 2, ptr %g_vy_prev, ptr %g_vy, double %arg7_float_to_double)
  %g_vx_prev.1 = load ptr, ptr @g_vx_prev, align 8
  %g_vy_prev.1 = load ptr, ptr @g_vy_prev, align 8
  %g_vx.1 = load ptr, ptr @g_vx, align 8
  %g_vy.1 = load ptr, ptr @g_vy, align 8
  call void @project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_vx_prev.1, ptr %g_vy_prev.1, ptr %g_vx.1, ptr %g_vy.1)
  %g_vx.2 = load ptr, ptr @g_vx, align 8
  %g_vx_prev.2 = load ptr, ptr @g_vx_prev, align 8
  %g_vx_prev.3 = load ptr, ptr @g_vx_prev, align 8
  %g_vy_prev.2 = load ptr, ptr @g_vy_prev, align 8
  call void @dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_vx.2, ptr %g_vx_prev.2, ptr %g_vx_prev.3, ptr %g_vy_prev.2)
  %g_vx.3 = load ptr, ptr @g_vx, align 8
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 1, ptr %g_vx.3)
  %g_vy.2 = load ptr, ptr @g_vy, align 8
  %g_vy_prev.3 = load ptr, ptr @g_vy_prev, align 8
  %g_vx_prev.4 = load ptr, ptr @g_vx_prev, align 8
  %g_vy_prev.4 = load ptr, ptr @g_vy_prev, align 8
  call void @dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_vy.2, ptr %g_vy_prev.3, ptr %g_vx_prev.4, ptr %g_vy_prev.4)
  %g_vy.3 = load ptr, ptr @g_vy, align 8
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 2, ptr %g_vy.3)
  %g_vx.4 = load ptr, ptr @g_vx, align 8
  %g_vy.4 = load ptr, ptr @g_vy, align 8
  call void @vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_vx.4, ptr %g_vy.4)
  %g_vx.5 = load ptr, ptr @g_vx, align 8
  %g_vy.5 = load ptr, ptr @g_vy, align 8
  %g_vx_prev.5 = load ptr, ptr @g_vx_prev, align 8
  %g_vy_prev.5 = load ptr, ptr @g_vy_prev, align 8
  call void @project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_vx.5, ptr %g_vy.5, ptr %g_vx_prev.5, ptr %g_vy_prev.5)
  ret void
}

define void @dens_step__0__ret_voidE1() {
entry:
  %g_dens_prev = load ptr, ptr @g_dens_prev, align 8
  %g_dens = load ptr, ptr @g_dens, align 8
  %arg3_float_to_double = fpext float 0x3F1A36E2E0000000 to double
  call void @diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1(i32 0, ptr %g_dens_prev, ptr %g_dens, double %arg3_float_to_double)
  %g_dens.1 = load ptr, ptr @g_dens, align 8
  %g_dens_prev.1 = load ptr, ptr @g_dens_prev, align 8
  %g_vx = load ptr, ptr @g_vx, align 8
  %g_vy = load ptr, ptr @g_vy, align 8
  call void @dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1(ptr %g_dens.1, ptr %g_dens_prev.1, ptr %g_vx, ptr %g_vy)
  %g_dens.2 = load ptr, ptr @g_dens, align 8
  call void @set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1(i32 0, ptr %g_dens.2)
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %pass.0 = phi i32 [ 0, %entry ], [ %.76, %for.end ]
  %.13 = icmp slt i32 %pass.0, 2
  br i1 %.13, label %for.cond, label %while.end

while.end:                                        ; preds = %while.cond
  ret void

for.cond:                                         ; preds = %while.cond, %for.end.1
  %j.0 = phi i32 [ %.73, %for.end.1 ], [ 1, %while.cond ]
  %.17 = sub i32 192, 1
  %.18 = icmp slt i32 %j.0, %.17
  br i1 %.18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %.20 = mul i32 %j.0, 256
  br label %for.cond.1

for.end:                                          ; preds = %for.cond
  %.76 = add i32 %pass.0, 1
  br label %while.cond

for.cond.1:                                       ; preds = %ifcont, %for.body
  %i.0 = phi i32 [ 1, %for.body ], [ %.69, %ifcont ]
  %.24 = sub i32 256, 1
  %.25 = icmp slt i32 %i.0, %.24
  br i1 %.25, label %for.body.1, label %for.end.1

for.body.1:                                       ; preds = %for.cond.1
  %g_dens.3 = load ptr, ptr @g_dens, align 8
  %.27 = add i32 %.20, %i.0
  %ptr_gep = getelementptr inbounds double, ptr %g_dens.3, i32 %.27
  %ptr_load = load double, ptr %ptr_gep, align 8
  %float_to_double_rhs = fpext float 8.800000e+01 to double
  %.28 = fcmp ogt double %ptr_load, %float_to_double_rhs
  br i1 %.28, label %then, label %ifcont

for.end.1:                                        ; preds = %for.cond.1
  %.73 = add i32 %j.0, 1
  br label %for.cond

then:                                             ; preds = %for.body.1
  %g_dens.4 = load ptr, ptr @g_dens, align 8
  %.30 = add i32 %.20, %i.0
  %ptr_gep.1 = getelementptr inbounds double, ptr %g_dens.4, i32 %.30
  %ptr_load.1 = load double, ptr %ptr_gep.1, align 8
  %float_to_double_rhs.1 = fpext float 8.800000e+01 to double
  %.31 = fsub double %ptr_load.1, %float_to_double_rhs.1
  %float_to_double_rhs.2 = fpext float 0x3FCC28F5C0000000 to double
  %.33 = fmul double %.31, %float_to_double_rhs.2
  %g_dens.5 = load ptr, ptr @g_dens, align 8
  %.35 = add i32 %.20, %i.0
  %.36 = getelementptr inbounds double, ptr %g_dens.5, i32 %.35
  %f32_to_f64 = fpext float 8.800000e+01 to double
  store double %f32_to_f64, ptr %.36, align 8
  %g_dens.6 = load ptr, ptr @g_dens, align 8
  %.38 = add i32 %.20, %i.0
  %.39 = add i32 %.38, 1
  %ptr_gep.2 = getelementptr inbounds double, ptr %g_dens.6, i32 %.39
  %ptr_load.2 = load double, ptr %ptr_gep.2, align 8
  %.40 = fadd double %ptr_load.2, %.33
  %g_dens.7 = load ptr, ptr @g_dens, align 8
  %.41 = add i32 %.20, %i.0
  %.42 = add i32 %.41, 1
  %.43 = getelementptr inbounds double, ptr %g_dens.7, i32 %.42
  store double %.40, ptr %.43, align 8
  %g_dens.8 = load ptr, ptr @g_dens, align 8
  %.45 = add i32 %.20, %i.0
  %.46 = sub i32 %.45, 1
  %ptr_gep.3 = getelementptr inbounds double, ptr %g_dens.8, i32 %.46
  %ptr_load.3 = load double, ptr %ptr_gep.3, align 8
  %.47 = fadd double %ptr_load.3, %.33
  %g_dens.9 = load ptr, ptr @g_dens, align 8
  %.48 = add i32 %.20, %i.0
  %.49 = sub i32 %.48, 1
  %.50 = getelementptr inbounds double, ptr %g_dens.9, i32 %.49
  store double %.47, ptr %.50, align 8
  %g_dens.10 = load ptr, ptr @g_dens, align 8
  %.52 = add i32 %.20, %i.0
  %.53 = add i32 %.52, 256
  %ptr_gep.4 = getelementptr inbounds double, ptr %g_dens.10, i32 %.53
  %ptr_load.4 = load double, ptr %ptr_gep.4, align 8
  %.54 = fadd double %ptr_load.4, %.33
  %g_dens.11 = load ptr, ptr @g_dens, align 8
  %.55 = add i32 %.20, %i.0
  %.56 = add i32 %.55, 256
  %.57 = getelementptr inbounds double, ptr %g_dens.11, i32 %.56
  store double %.54, ptr %.57, align 8
  %g_dens.12 = load ptr, ptr @g_dens, align 8
  %.59 = add i32 %.20, %i.0
  %.60 = sub i32 %.59, 256
  %ptr_gep.5 = getelementptr inbounds double, ptr %g_dens.12, i32 %.60
  %ptr_load.5 = load double, ptr %ptr_gep.5, align 8
  %.61 = fadd double %ptr_load.5, %.33
  %g_dens.13 = load ptr, ptr @g_dens, align 8
  %.62 = add i32 %.20, %i.0
  %.63 = sub i32 %.62, 256
  %.64 = getelementptr inbounds double, ptr %g_dens.13, i32 %.63
  store double %.61, ptr %.64, align 8
  br label %ifcont

ifcont:                                           ; preds = %for.body.1, %then
  %.69 = add i32 %i.0, 1
  br label %for.cond.1
}

define i32 @int_to_str__2__intE1__byteE1_ptr1__ret_intE1(i32 %val, ptr %buf) {
entry:
  %.11 = icmp slt i32 %val, 0
  %.val = select i1 %.11, i32 0, i32 %val
  %.16 = icmp eq i32 %.val, 0
  br i1 %.16, label %then.1, label %while.cond

common.ret:                                       ; preds = %while.cond.1, %then.1
  %common.ret.op = phi i32 [ 1, %then.1 ], [ %len.0, %while.cond.1 ]
  ret i32 %common.ret.op

then.1:                                           ; preds = %entry
  %.18 = getelementptr inbounds i8, ptr %buf, i32 0
  %.19 = trunc i32 48 to i8
  store i8 %.19, ptr %.18, align 1
  %.21 = getelementptr inbounds i8, ptr %buf, i32 1
  %.22 = trunc i32 0 to i8
  store i8 %.22, ptr %.21, align 1
  br label %common.ret

while.cond:                                       ; preds = %entry, %while.body
  %len.0 = phi i32 [ %.38, %while.body ], [ 0, %entry ]
  %tmp.0 = phi i32 [ %.36, %while.body ], [ %.val, %entry ]
  %.29 = icmp sgt i32 %tmp.0, 0
  br i1 %.29, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %.31 = srem i32 %tmp.0, 10
  %.32 = add i32 48, %.31
  %.33 = trunc i32 %.32 to i8
  %.34 = getelementptr inbounds i8, ptr %buf, i32 %len.0
  store i8 %.33, ptr %.34, align 1
  %.36 = sdiv i32 %tmp.0, 10
  %.38 = add i32 %len.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %.41 = getelementptr inbounds i8, ptr %buf, i32 %len.0
  %.42 = trunc i32 0 to i8
  store i8 %.42, ptr %.41, align 1
  %.45 = sub i32 %len.0, 1
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.end
  %j.0 = phi i32 [ %.45, %while.end ], [ %.57, %while.body.1 ]
  %i.0 = phi i32 [ 0, %while.end ], [ %.55, %while.body.1 ]
  %.48 = icmp slt i32 %i.0, %j.0
  br i1 %.48, label %while.body.1, label %common.ret

while.body.1:                                     ; preds = %while.cond.1
  %ptr_gep = getelementptr inbounds i8, ptr %buf, i32 %i.0
  %ptr_load = load i8, ptr %ptr_gep, align 1
  %ptr_gep.1 = getelementptr inbounds i8, ptr %buf, i32 %j.0
  %ptr_load.1 = load i8, ptr %ptr_gep.1, align 1
  %.51 = getelementptr inbounds i8, ptr %buf, i32 %i.0
  store i8 %ptr_load.1, ptr %.51, align 1
  %.53 = getelementptr inbounds i8, ptr %buf, i32 %j.0
  store i8 %ptr_load, ptr %.53, align 1
  %.55 = add i32 %i.0, 1
  %.57 = sub i32 %j.0, 1
  br label %while.cond.1
}

define ptr @font_glyph__1__intE1__ret_dataE1_ptr1_ubits32(i32 %c) {
entry:
  switch i32 %c, label %ifcont.58 [
    i32 32, label %then
    i32 33, label %then.1
    i32 34, label %then.2
    i32 35, label %then.3
    i32 36, label %then.4
    i32 37, label %then.5
    i32 38, label %then.6
    i32 39, label %then.7
    i32 40, label %then.8
    i32 41, label %then.9
    i32 42, label %then.10
    i32 43, label %then.11
    i32 44, label %then.12
    i32 45, label %then.13
    i32 46, label %then.14
    i32 47, label %then.15
    i32 48, label %then.16
    i32 49, label %then.17
    i32 50, label %then.18
    i32 51, label %then.19
    i32 52, label %then.20
    i32 53, label %then.21
    i32 54, label %then.22
    i32 55, label %then.23
    i32 56, label %then.24
    i32 57, label %then.25
    i32 58, label %then.26
    i32 59, label %then.27
    i32 60, label %then.28
    i32 61, label %then.29
    i32 62, label %then.30
    i32 63, label %then.31
    i32 64, label %then.32
    i32 65, label %then.33
    i32 66, label %then.34
    i32 67, label %then.35
    i32 68, label %then.36
    i32 69, label %then.37
    i32 70, label %then.38
    i32 71, label %then.39
    i32 72, label %then.40
    i32 73, label %then.41
    i32 74, label %then.42
    i32 75, label %then.43
    i32 76, label %then.44
    i32 77, label %then.45
    i32 78, label %then.46
    i32 79, label %then.47
    i32 80, label %then.48
    i32 81, label %then.49
    i32 82, label %then.50
    i32 83, label %then.51
    i32 84, label %then.52
    i32 85, label %then.53
    i32 86, label %then.54
    i32 87, label %then.55
    i32 88, label %then.56
    i32 89, label %then.57
    i32 90, label %then.58
  ]

common.ret:                                       ; preds = %ifcont.58, %then.58, %then.57, %then.56, %then.55, %then.54, %then.53, %then.52, %then.51, %then.50, %then.49, %then.48, %then.47, %then.46, %then.45, %then.44, %then.43, %then.42, %then.41, %then.40, %then.39, %then.38, %then.37, %then.36, %then.35, %then.34, %then.33, %then.32, %then.31, %then.30, %then.29, %then.28, %then.27, %then.26, %then.25, %then.24, %then.23, %then.22, %then.21, %then.20, %then.19, %then.18, %then.17, %then.16, %then.15, %then.14, %then.13, %then.12, %then.11, %then.10, %then.9, %then.8, %then.7, %then.6, %then.5, %then.4, %then.3, %then.2, %then.1, %then
  %common.ret.op = phi ptr [ %.6, %then ], [ %.11, %then.1 ], [ %.16, %then.2 ], [ %.21, %then.3 ], [ %.26, %then.4 ], [ %.31, %then.5 ], [ %.36, %then.6 ], [ %.41, %then.7 ], [ %.46, %then.8 ], [ %.51, %then.9 ], [ %.56, %then.10 ], [ %.61, %then.11 ], [ %.66, %then.12 ], [ %.71, %then.13 ], [ %.76, %then.14 ], [ %.81, %then.15 ], [ %.86, %then.16 ], [ %.91, %then.17 ], [ %.96, %then.18 ], [ %.101, %then.19 ], [ %.106, %then.20 ], [ %.111, %then.21 ], [ %.116, %then.22 ], [ %.121, %then.23 ], [ %.126, %then.24 ], [ %.131, %then.25 ], [ %.136, %then.26 ], [ %.141, %then.27 ], [ %.146, %then.28 ], [ %.151, %then.29 ], [ %.156, %then.30 ], [ %.161, %then.31 ], [ %.166, %then.32 ], [ %.171, %then.33 ], [ %.176, %then.34 ], [ %.181, %then.35 ], [ %.186, %then.36 ], [ %.191, %then.37 ], [ %.196, %then.38 ], [ %.201, %then.39 ], [ %.206, %then.40 ], [ %.211, %then.41 ], [ %.216, %then.42 ], [ %.221, %then.43 ], [ %.226, %then.44 ], [ %.231, %then.45 ], [ %.236, %then.46 ], [ %.241, %then.47 ], [ %.246, %then.48 ], [ %.251, %then.49 ], [ %.256, %then.50 ], [ %.261, %then.51 ], [ %.266, %then.52 ], [ %.271, %then.53 ], [ %.276, %then.54 ], [ %.281, %then.55 ], [ %.286, %then.56 ], [ %.291, %then.57 ], [ %.296, %then.58 ], [ %.299, %ifcont.58 ]
  ret ptr %common.ret.op

then:                                             ; preds = %entry
  %.6 = getelementptr inbounds [5 x i32], ptr @FONT_SPACE, i32 0, i32 0
  br label %common.ret

then.1:                                           ; preds = %entry
  %.11 = getelementptr inbounds [5 x i32], ptr @FONT_EXCL, i32 0, i32 0
  br label %common.ret

then.2:                                           ; preds = %entry
  %.16 = getelementptr inbounds [5 x i32], ptr @FONT_QUOT, i32 0, i32 0
  br label %common.ret

then.3:                                           ; preds = %entry
  %.21 = getelementptr inbounds [5 x i32], ptr @FONT_HASH, i32 0, i32 0
  br label %common.ret

then.4:                                           ; preds = %entry
  %.26 = getelementptr inbounds [5 x i32], ptr @FONT_DOLL, i32 0, i32 0
  br label %common.ret

then.5:                                           ; preds = %entry
  %.31 = getelementptr inbounds [5 x i32], ptr @FONT_PERC, i32 0, i32 0
  br label %common.ret

then.6:                                           ; preds = %entry
  %.36 = getelementptr inbounds [5 x i32], ptr @FONT_AMP, i32 0, i32 0
  br label %common.ret

then.7:                                           ; preds = %entry
  %.41 = getelementptr inbounds [5 x i32], ptr @FONT_APOS, i32 0, i32 0
  br label %common.ret

then.8:                                           ; preds = %entry
  %.46 = getelementptr inbounds [5 x i32], ptr @FONT_LPAREN, i32 0, i32 0
  br label %common.ret

then.9:                                           ; preds = %entry
  %.51 = getelementptr inbounds [5 x i32], ptr @FONT_RPAREN, i32 0, i32 0
  br label %common.ret

then.10:                                          ; preds = %entry
  %.56 = getelementptr inbounds [5 x i32], ptr @FONT_STAR, i32 0, i32 0
  br label %common.ret

then.11:                                          ; preds = %entry
  %.61 = getelementptr inbounds [5 x i32], ptr @FONT_PLUS, i32 0, i32 0
  br label %common.ret

then.12:                                          ; preds = %entry
  %.66 = getelementptr inbounds [5 x i32], ptr @FONT_COMMA, i32 0, i32 0
  br label %common.ret

then.13:                                          ; preds = %entry
  %.71 = getelementptr inbounds [5 x i32], ptr @FONT_MINUS, i32 0, i32 0
  br label %common.ret

then.14:                                          ; preds = %entry
  %.76 = getelementptr inbounds [5 x i32], ptr @FONT_PERIOD, i32 0, i32 0
  br label %common.ret

then.15:                                          ; preds = %entry
  %.81 = getelementptr inbounds [5 x i32], ptr @FONT_SLASH, i32 0, i32 0
  br label %common.ret

then.16:                                          ; preds = %entry
  %.86 = getelementptr inbounds [5 x i32], ptr @FONT_0, i32 0, i32 0
  br label %common.ret

then.17:                                          ; preds = %entry
  %.91 = getelementptr inbounds [5 x i32], ptr @FONT_1, i32 0, i32 0
  br label %common.ret

then.18:                                          ; preds = %entry
  %.96 = getelementptr inbounds [5 x i32], ptr @FONT_2, i32 0, i32 0
  br label %common.ret

then.19:                                          ; preds = %entry
  %.101 = getelementptr inbounds [5 x i32], ptr @FONT_3, i32 0, i32 0
  br label %common.ret

then.20:                                          ; preds = %entry
  %.106 = getelementptr inbounds [5 x i32], ptr @FONT_4, i32 0, i32 0
  br label %common.ret

then.21:                                          ; preds = %entry
  %.111 = getelementptr inbounds [5 x i32], ptr @FONT_5, i32 0, i32 0
  br label %common.ret

then.22:                                          ; preds = %entry
  %.116 = getelementptr inbounds [5 x i32], ptr @FONT_6, i32 0, i32 0
  br label %common.ret

then.23:                                          ; preds = %entry
  %.121 = getelementptr inbounds [5 x i32], ptr @FONT_7, i32 0, i32 0
  br label %common.ret

then.24:                                          ; preds = %entry
  %.126 = getelementptr inbounds [5 x i32], ptr @FONT_8, i32 0, i32 0
  br label %common.ret

then.25:                                          ; preds = %entry
  %.131 = getelementptr inbounds [5 x i32], ptr @FONT_9, i32 0, i32 0
  br label %common.ret

then.26:                                          ; preds = %entry
  %.136 = getelementptr inbounds [5 x i32], ptr @FONT_COLON, i32 0, i32 0
  br label %common.ret

then.27:                                          ; preds = %entry
  %.141 = getelementptr inbounds [5 x i32], ptr @FONT_SEMIC, i32 0, i32 0
  br label %common.ret

then.28:                                          ; preds = %entry
  %.146 = getelementptr inbounds [5 x i32], ptr @FONT_LT, i32 0, i32 0
  br label %common.ret

then.29:                                          ; preds = %entry
  %.151 = getelementptr inbounds [5 x i32], ptr @FONT_EQ, i32 0, i32 0
  br label %common.ret

then.30:                                          ; preds = %entry
  %.156 = getelementptr inbounds [5 x i32], ptr @FONT_GT, i32 0, i32 0
  br label %common.ret

then.31:                                          ; preds = %entry
  %.161 = getelementptr inbounds [5 x i32], ptr @FONT_QUEST, i32 0, i32 0
  br label %common.ret

then.32:                                          ; preds = %entry
  %.166 = getelementptr inbounds [5 x i32], ptr @FONT_AT, i32 0, i32 0
  br label %common.ret

then.33:                                          ; preds = %entry
  %.171 = getelementptr inbounds [5 x i32], ptr @FONT_A, i32 0, i32 0
  br label %common.ret

then.34:                                          ; preds = %entry
  %.176 = getelementptr inbounds [5 x i32], ptr @FONT_B, i32 0, i32 0
  br label %common.ret

then.35:                                          ; preds = %entry
  %.181 = getelementptr inbounds [5 x i32], ptr @FONT_C, i32 0, i32 0
  br label %common.ret

then.36:                                          ; preds = %entry
  %.186 = getelementptr inbounds [5 x i32], ptr @FONT_D, i32 0, i32 0
  br label %common.ret

then.37:                                          ; preds = %entry
  %.191 = getelementptr inbounds [5 x i32], ptr @FONT_E, i32 0, i32 0
  br label %common.ret

then.38:                                          ; preds = %entry
  %.196 = getelementptr inbounds [5 x i32], ptr @FONT_F, i32 0, i32 0
  br label %common.ret

then.39:                                          ; preds = %entry
  %.201 = getelementptr inbounds [5 x i32], ptr @FONT_G, i32 0, i32 0
  br label %common.ret

then.40:                                          ; preds = %entry
  %.206 = getelementptr inbounds [5 x i32], ptr @FONT_H, i32 0, i32 0
  br label %common.ret

then.41:                                          ; preds = %entry
  %.211 = getelementptr inbounds [5 x i32], ptr @FONT_I, i32 0, i32 0
  br label %common.ret

then.42:                                          ; preds = %entry
  %.216 = getelementptr inbounds [5 x i32], ptr @FONT_J, i32 0, i32 0
  br label %common.ret

then.43:                                          ; preds = %entry
  %.221 = getelementptr inbounds [5 x i32], ptr @FONT_K, i32 0, i32 0
  br label %common.ret

then.44:                                          ; preds = %entry
  %.226 = getelementptr inbounds [5 x i32], ptr @FONT_L, i32 0, i32 0
  br label %common.ret

then.45:                                          ; preds = %entry
  %.231 = getelementptr inbounds [5 x i32], ptr @FONT_M, i32 0, i32 0
  br label %common.ret

then.46:                                          ; preds = %entry
  %.236 = getelementptr inbounds [5 x i32], ptr @FONT_N, i32 0, i32 0
  br label %common.ret

then.47:                                          ; preds = %entry
  %.241 = getelementptr inbounds [5 x i32], ptr @FONT_O, i32 0, i32 0
  br label %common.ret

then.48:                                          ; preds = %entry
  %.246 = getelementptr inbounds [5 x i32], ptr @FONT_P, i32 0, i32 0
  br label %common.ret

then.49:                                          ; preds = %entry
  %.251 = getelementptr inbounds [5 x i32], ptr @FONT_Q, i32 0, i32 0
  br label %common.ret

then.50:                                          ; preds = %entry
  %.256 = getelementptr inbounds [5 x i32], ptr @FONT_R, i32 0, i32 0
  br label %common.ret

then.51:                                          ; preds = %entry
  %.261 = getelementptr inbounds [5 x i32], ptr @FONT_S, i32 0, i32 0
  br label %common.ret

then.52:                                          ; preds = %entry
  %.266 = getelementptr inbounds [5 x i32], ptr @FONT_T, i32 0, i32 0
  br label %common.ret

then.53:                                          ; preds = %entry
  %.271 = getelementptr inbounds [5 x i32], ptr @FONT_U, i32 0, i32 0
  br label %common.ret

then.54:                                          ; preds = %entry
  %.276 = getelementptr inbounds [5 x i32], ptr @FONT_V, i32 0, i32 0
  br label %common.ret

then.55:                                          ; preds = %entry
  %.281 = getelementptr inbounds [5 x i32], ptr @FONT_W, i32 0, i32 0
  br label %common.ret

then.56:                                          ; preds = %entry
  %.286 = getelementptr inbounds [5 x i32], ptr @FONT_X, i32 0, i32 0
  br label %common.ret

then.57:                                          ; preds = %entry
  %.291 = getelementptr inbounds [5 x i32], ptr @FONT_Y, i32 0, i32 0
  br label %common.ret

then.58:                                          ; preds = %entry
  %.296 = getelementptr inbounds [5 x i32], ptr @FONT_Z, i32 0, i32 0
  br label %common.ret

ifcont.58:                                        ; preds = %entry
  %.299 = getelementptr inbounds [5 x i32], ptr @FONT_SPACE, i32 0, i32 0
  br label %common.ret
}

define void @draw_gui__2__intE1__intE1__ret_voidE1(i32 %w, i32 %h) {
entry:
  %.15 = sitofp i32 %w to float
  %.16 = fdiv float 2.000000e+00, %.15
  %.18 = sitofp i32 %h to float
  %.19 = fdiv float 2.000000e+00, %.18
  %.21 = sdiv i32 %w, 2
  %.23 = sdiv i32 %h, 2
  %GL_TEXTURE_2D = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glDisable(i32 %GL_TEXTURE_2D)
  %GL_DEPTH_TEST = load i32, ptr @GL_DEPTH_TEST, align 4
  call void @glDisable(i32 %GL_DEPTH_TEST)
  %GL_BLEND = load i32, ptr @GL_BLEND, align 4
  call void @glEnable(i32 %GL_BLEND)
  %GL_SRC_ALPHA = load i32, ptr @GL_SRC_ALPHA, align 4
  %GL_ONE_MINUS_SRC_ALPHA = load i32, ptr @GL_ONE_MINUS_SRC_ALPHA, align 4
  call void @glBlendFunc(i32 %GL_SRC_ALPHA, i32 %GL_ONE_MINUS_SRC_ALPHA)
  %.30 = sdiv i32 220, 2
  %.31 = sdiv i32 52, 2
  call void @draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(i32 %.21, i32 %.23, i32 %.30, i32 %.31, i32 18, float %.16, float %.19)
  %str_stack = alloca [11 x i8], align 1
  %str_char_0 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 0
  store i8 83, ptr %str_char_0, align 1
  %str_char_1 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 1
  store i8 84, ptr %str_char_1, align 1
  %str_char_2 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 2
  store i8 65, ptr %str_char_2, align 1
  %str_char_3 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 3
  store i8 82, ptr %str_char_3, align 1
  %str_char_4 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 4
  store i8 84, ptr %str_char_4, align 1
  %str_char_5 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 5
  store i8 32, ptr %str_char_5, align 1
  %str_char_6 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 6
  store i8 71, ptr %str_char_6, align 1
  %str_char_7 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 7
  store i8 65, ptr %str_char_7, align 1
  %str_char_8 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 8
  store i8 77, ptr %str_char_8, align 1
  %str_char_9 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 9
  store i8 69, ptr %str_char_9, align 1
  %str_char_10 = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 10
  store i8 0, ptr %str_char_10, align 1
  %array_to_elem_ptr = getelementptr [11 x i8], ptr %str_stack, i32 0, i32 0
  %.45 = call i32 @text_width__2__byteE1_ptr1__intE1__ret_intE1(ptr %array_to_elem_ptr, i32 2)
  %.47 = sdiv i32 %.45, 2
  %.48 = sub i32 %.21, %.47
  %.50 = mul i32 7, 2
  %.51 = sdiv i32 %.50, 2
  %.52 = sub i32 %.23, %.51
  call void @glColor4f(float 7.500000e-01, float 0x3FEC28F5C0000000, float 1.000000e+00, float 1.000000e+00)
  call void @draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1(ptr %array_to_elem_ptr, i32 %.48, i32 %.52, i32 2, float %.16, float %.19)
  %GL_BLEND.1 = load i32, ptr @GL_BLEND, align 4
  call void @glDisable(i32 %GL_BLEND.1)
  %GL_TEXTURE_2D.1 = load i32, ptr @GL_TEXTURE_2D, align 4
  call void @glEnable(i32 %GL_TEXTURE_2D.1)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

attributes #0 = { alwaysinline }
attributes #1 = { naked noinline noreturn }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
