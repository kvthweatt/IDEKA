








































const void* STDLIB_GVP = (void*)@void;
const data{64} U64MAXVAL = 0xFFFFFFFFFFFFFFFFu;
const bool _fltused = true;

struct FXC_TYPESYS
{
    byte*  base_type,       
           custom_typename; 
    bool   is_signed,
           is_const,
           is_volatile,
           is_tied,
           is_pointer;
    int    pointer_depth;
    bool   is_array,
           array_size,      
           bit_width,       
           alignment,       
           endianness;      
    byte*  storage_class;   
    bool   is_dict;
    byte*  dict_key_type,   
           dict_value_type; 
};

struct FXC_PARAM
{
    byte*      name;
    FXC_TYPESYS type;
};

struct FXC_FUNCINFO
{
    int        param_count;
    FXC_PARAM* params;
    FXC_TYPESYS return_type;
    byte*      calling_conv;   
    bool       is_variadic,
               is_recursive,
               is_inline,
               no_mangle,
               has_effect,     
               has_attenuate;  
    int        pre_contracts,  
               post_contracts; 
};

struct FXC_SYMENTRY
{
    byte* name,        
          kind;        


    FXC_TYPESYS* type; 

    byte* ns;          
};

struct FXC_SYMTABLE
{
    int entries;
    FXC_SYMENTRY* entry;
};





global ulong nt_threshold;
global bool  ermsb;
































namespace standard
{
	namespace types
	{
		unsigned data{4} as nybble;
        byte[] as noopstr;
        unsigned data{16} as u16;
        unsigned data{32} as u32;
        unsigned data{64} as u64;

        signed data{8}  as i8;
        signed data{16} as i16;
        i16 as short;
        u16 as ushort;
        signed data{32} as i32;
        signed data{64} as i64;


        byte* as byte_ptr;
        i32* as i32_ptr;
        i64* as i64_ptr;
        void* as void_ptr;
        noopstr* as noopstr_ptr;





        i64* as intptr;
        u64* as uintptr;
        i64 as ssize_t;
        u64 as size_t;















        i16 as wchar;



        data{16::1} as be16;
        data{32::1} as be32;
        data{64::1} as be64;


        data{16::0} as le16;
        data{32::0} as le32;
        data{64::0} as le64;



        def bswap16(u16 value) -> u16
        {
            return ((value & 0xFF) << 8) | ((value >> 8) & 0xFF);
        };

        def bswap32(u32 value) -> u32
        {
            return ((value & 0xFF) << 24)  |
                   ((value & 0xFF00) << 8) |
                   ((value >> 8) & 0xFF00) |
                   ((value >> 24) & 0xFF);
        };

        def bswap64(u64 value) -> u64
        {
            return ((value & 0xFF) << 56)      |
                   ((value & 0xFF00) << 40)    |
                   ((value & 0xFF0000) << 24)  |
                   ((value & 0xFF000000) << 8) |
                   ((value >> 8) & 0xFF000000) |
                   ((value >> 24) & 0xFF0000)  |
                   ((value >> 40) & 0xFF00)    |
                   ((value >> 56) & 0xFF);
        };























        def bit_test(u32 value, u32 bit) -> bool
        {
            return (value & (1 << bit)) != 0;
        };


        def align_up(u64 value, u64 alignment) -> u64
        {
            return (value + alignment - 1) & (alignment - 1);
        };

        def align_down(u64 value, u64 alignment) -> u64
        {
            return value & (alignment - 1);
        };

        def is_aligned(u64 value, u64 alignment) -> bool
        {
            return (value & (alignment - 1)) == 0;
        };
	};
};

using standard::types;





global i64 WIN_STDOUT_HANDLE;

















extern
{
    def !!
        system(byte*) -> int,
        LoadLibraryA(byte*) -> void*,
        GetProcAddress(void*, byte*) -> void*,
        GetSystemInfo(void*) -> void;
};









struct SYSTEM_INFO_PARTIAL
{
    u32   dwOemId,
          dwPageSize;
    void* lpMin,
          lpMax;
    u64   dwActiveProcessorMask;
    u32   dwNumberOfProcessors,
          dwProcessorType,
          dwAllocationGranularity;
    u16   wProcessorLevel,
          wProcessorRevision;
};









namespace standard
{
    namespace system
    {
        namespace cpu
        {



            global singinit ulong g_l2_bytes;
            global singinit bool  g_ermsb,
                                  g_cpuid_run = false;

            def cpuid_query() -> void
            {
                switch (g_cpuid_run) { case (1) { return; } default {}; };

                ulong eax, ebx, ecx, edx;


                volatile asm
                {
                    movq $$7,  %rax
                    xorq %rcx, %rcx
                    cpuid
                    movq %rax, $0
                    movq %rbx, $1
                    movq %rcx, $2
                    movq %rdx, $3
                } : "=r"(eax), "=r"(ebx), "=r"(ecx), "=r"(edx) :
                  : "rax","rbx","rcx","rdx","memory";

                g_ermsb = (bool)((ebx >> 9) `& 1ul);


                volatile asm
                {
                    movq $$0x80000006, %rax
                    cpuid
                    movq %rcx, $0
                } : "=r"(ecx) :
                  : "rax","rbx","rcx","rdx","memory";

                g_l2_bytes = ((ecx >> 16) `& 0xFFFFul) << 10;


                switch (g_l2_bytes == 0ul)
                {
                    case (1) { g_l2_bytes = 262144ul; } 
                    default  {};
                };

                g_cpuid_run = true;
            };




































































































































            def l2_bytes() -> ulong
            {
                cpuid_query();
                return g_l2_bytes;
            };

            def ermsb() -> bool
            {
                cpuid_query();
                return g_ermsb;
            };
        };

        namespace Windows
        {
        };
    };
};


















extern
{

    def !!
        malloc(size_t) -> void*,
        free(void*) -> void,
        calloc(size_t, size_t) -> void*,
        realloc(void*, size_t) -> void*,
        VirtualAlloc(ulong, size_t, u32, u32)  -> ulong,
        VirtualFree(ulong, size_t, u32)        -> bool,
        VirtualProtect(ulong, size_t, u32, u32*) -> bool;
};

def !!memset(void* dst, int c, size_t n) -> void*
{
    byte* d = (byte*)dst;
    size_t i;
    while (i < n)
    {
        d[i] = (byte)c;
        i++;
    };
    return dst;
};

def fmemcpy(void* dest, void* src, ulong count) -> void*
{
    void* ret = dest;



    volatile asm
    {
        movq $0, %rdi
        movq $1, %rsi
        movq $2, %rcx


        cmpq $$16, %rcx
        jae .Lcheck_ermsb
        testq %rcx, %rcx
        jz .Ldone
    .Lsmall:
        movb (%rsi), %al
        movb %al, (%rdi)
        incq %rsi
        incq %rdi
        decq %rcx
        jnz .Lsmall
        jmp .Ldone


    .Lcheck_ermsb:
        cmpb $$1, $3
        je .Lermsb


        cmpq $$128, %rcx
        jae .Llarge
        movq %rcx, %rax
    .Lmed_loop:
        cmpq $$16, %rax
        jb .Lmed_tail
        movdqu (%rsi), %xmm0
        movdqu %xmm0, (%rdi)
        addq $$16, %rsi
        addq $$16, %rdi
        subq $$16, %rax
        jmp .Lmed_loop
    .Lmed_tail:
        testq %rax, %rax
        jz .Ldone
    .Lmed_byte:
        movb (%rsi), %al
        movb %al, (%rdi)
        incq %rsi
        incq %rdi
        decq %rax
        jnz .Lmed_byte
        jmp .Ldone


    .Llarge:
        movq $4, %r11
        cmpq %r11, %rcx
        jae .Lnt


        movq %rdi, %rax
        andq $$31, %rax
        testq %rax, %rax
        jz .Lbulk
        movq $$32, %r10
        subq %rax, %r10
        cmpq %rcx, %r10
        cmovaq %rcx, %r10
    .Lalign_loop:
        testq %r10, %r10
        jz .Lbulk
        movb (%rsi), %al
        movb %al, (%rdi)
        incq %rsi
        incq %rdi
        decq %rcx
        decq %r10
        jmp .Lalign_loop

    .Lbulk:
        movq %rcx, %rax
        shrq $$8, %rax
        testq %rax, %rax
        jz .Llarge_tail
    .Lbulk_loop:
        prefetcht0  256(%rsi)
        prefetcht0  288(%rsi)
        vmovdqu   (%rsi),    %ymm0
        vmovdqu   32(%rsi),  %ymm1
        vmovdqu   64(%rsi),  %ymm2
        vmovdqu   96(%rsi),  %ymm3
        vmovdqu   128(%rsi), %ymm4
        vmovdqu   160(%rsi), %ymm5
        vmovdqu   192(%rsi), %ymm6
        vmovdqu   224(%rsi), %ymm7
        vmovdqa   %ymm0,     (%rdi)
        vmovdqa   %ymm1,     32(%rdi)
        vmovdqa   %ymm2,     64(%rdi)
        vmovdqa   %ymm3,     96(%rdi)
        vmovdqa   %ymm4,     128(%rdi)
        vmovdqa   %ymm5,     160(%rdi)
        vmovdqa   %ymm6,     192(%rdi)
        vmovdqa   %ymm7,     224(%rdi)
        addq      $$256,     %rsi
        addq      $$256,     %rdi
        decq      %rax
        jnz       .Lbulk_loop
    .Llarge_tail:
        movq %rcx, %rax
        andq $$255, %rax
        movq %rax, %rcx
        rep movsb
        jmp .Ldone


    .Lnt:
        movq %rcx, %rax
        shrq $$8, %rax
        testq %rax, %rax
        jz .Lnt_tail
    .Lnt_loop:
        prefetchnta 256(%rsi)
        prefetchnta 288(%rsi)
        vmovdqu    (%rsi),    %ymm0
        vmovdqu    32(%rsi),  %ymm1
        vmovdqu    64(%rsi),  %ymm2
        vmovdqu    96(%rsi),  %ymm3
        vmovdqu    128(%rsi), %ymm4
        vmovdqu    160(%rsi), %ymm5
        vmovdqu    192(%rsi), %ymm6
        vmovdqu    224(%rsi), %ymm7
        vmovntdq   %ymm0,     (%rdi)
        vmovntdq   %ymm1,     32(%rdi)
        vmovntdq   %ymm2,     64(%rdi)
        vmovntdq   %ymm3,     96(%rdi)
        vmovntdq   %ymm4,     128(%rdi)
        vmovntdq   %ymm5,     160(%rdi)
        vmovntdq   %ymm6,     192(%rdi)
        vmovntdq   %ymm7,     224(%rdi)
        addq       $$256,     %rsi
        addq       $$256,     %rdi
        decq       %rax
        jnz        .Lnt_loop
        sfence
    .Lnt_tail:
        movq %rcx, %rax
        andq $$255, %rax
        movq %rax, %rcx
        rep movsb
        jmp .Ldone


    .Lermsb:
        rep movsb

    .Ldone:
        vzeroupper
    } : : "r"(dest), "r"(src), "r"(count), "r"(ermsb), "r"(nt_threshold)
      : "rax","rcx","rdi","rsi","r10","r11",
        "xmm0","ymm0","ymm1","ymm2","ymm3","ymm4","ymm5","ymm6","ymm7",
        "memory";



















































































































    return ret;
};

def !!memcpy(void* dst, void* src, size_t n) -> void*
{
    byte* d = (byte*)dst,
          s = (byte*)src;
    size_t i;
    while (i < n)
    {
        d[i] = s[i];
        i++;
    };
    return dst;
};

def !!memmove(void* dst, void* src, size_t n) -> void*
{
    byte* d = (byte*)dst,
          s = (byte*)src;
    size_t i;
    if (d < s)
    {
        while (i < n)
        {
            d[i] = s[i];
            i++;
        };
    }
    else
    {
        i = n;
        while (i > 0)
        {
            i--;
            d[i] = s[i];
        };
    };
    return dst;
};

def !!memcmp(void* a, void* b, size_t n) -> int
{
    byte* pa = (byte*)a,
          pb = (byte*)b;
    size_t i;
    while (i < n)
    {
        if (pa[i] < pb[i]) { return -1; };
        if (pa[i] > pb[i]) { return 1; };
        i++;
    };
    return 0;
};

def mem_fill(void* ptr, byte value, size_t size) -> void
{

    u64  word, v64;
    byte* p;
    u64*  wp;
    size_t i, head, tail, words;

    v64  = (u64)value;
    word = v64 | (v64 << 8) | (v64 << 16) | (v64 << 24)
              | (v64 << 32) | (v64 << 40) | (v64 << 48) | (v64 << 56);

    p = (byte*)ptr;


    head = (u64)ptr & 7;
    if (head != 0)
    {
        head = 8 - head;
        if (head > size) { head = size; };
        i = 0;
        while (i < head)
        {
            p[i] = value;
            i++;
        };
        p    = (byte*)((u64)p + head);
        size -= head;
    };


    words = size / 8;
    wp    = (u64*)p;
    i     = 0;
    while (i < words)
    {
        wp[i] = word;
        i++;
    };
    p    = (byte*)((u64)p + words * 8);
    size -= words * 8;


    tail = size;
    i    = 0;
    while (i < tail)
    {
        p[i] = value;
        i++;
    };
};













































































































































































extern
{
    def !!
        VirtualAlloc(ulong, size_t, u32, u32)   -> ulong,
        VirtualFree(ulong, size_t, u32)          -> bool,
        VirtualProtect(ulong, size_t, u32, u32*) -> bool,
        FlushInstructionCache(ulong, ulong, size_t) -> bool;
};





namespace standard
{
    namespace memory
    {


        def mem_zero(void* ptr, size_t size) -> void
        {
            memset(ptr, 0, size);
        };

        def mem_fill(void* ptr, byte value, size_t size) -> void
        {
            memset(ptr, value, size);
        };

        def mem_copy(void* dest, void* src, size_t size) -> void
        {
            memcpy(dest, src, size);
        };

        def mem_move(void* dest, void* src, size_t size) -> void
        {
            memmove(dest, src, size);
        };

        def mem_compare(void* a, void* b, size_t size) -> int
        {
            return memcmp(a, b, size);
        };

        def mem_equals(void* a, void* b, size_t size) -> bool
        {
            return memcmp(a, b, size) == 0;
        };



        def align_forward(size_t addr, size_t alignment) -> size_t
        {
            size_t modulo = addr & (alignment - 1);
            if (modulo != 0)
            {
                addr += alignment - modulo;
            };
            return addr;
        };

        def is_aligned(size_t addr, size_t alignment) -> bool
        {
            return (addr & (alignment - 1)) == 0;
        };

        def malloc_aligned(size_t size, size_t alignment) -> void*
        {
            size_t total_size = size + alignment + sizeof(void*);
            void* raw = malloc(total_size);

            if (raw == STDLIB_GVP)
            {
                return STDLIB_GVP;
            };

            size_t raw_addr = (size_t)raw;
            size_t aligned_addr = align_forward(raw_addr + sizeof(void*), alignment);

            void** header = (void**)(aligned_addr - sizeof(void*));
            *header = raw;

            return (void*)aligned_addr;
        };

        def free_aligned(void* ptr) -> void
        {
            if (ptr == STDLIB_GVP)
            {
                return;
            };

            void** header = (void**)((size_t)ptr - sizeof(void*));
            void* raw = *header;
            (void)raw;
        };



        struct RefCountHeader
        {
            size_t ref_count, size;
        };

        def ref_alloc(size_t size) -> void*
        {
            size_t total = sizeof(RefCountHeader) + size;
            RefCountHeader* header = (RefCountHeader*)malloc(total);

            if (header == (RefCountHeader*)0)
            {
                return STDLIB_GVP;
            };

            header.ref_count = 1;
            header.size = size;

            return (void*)(header + 1);
        };

        def ref_retain(void* ptr) -> void*
        {
            if (ptr == STDLIB_GVP)
            {
                return STDLIB_GVP;
            };

            RefCountHeader* header = ((RefCountHeader*)ptr) - 1;
            header.ref_count++;

            return ptr;
        };

        def ref_release(void* ptr) -> void
        {
            if (ptr == STDLIB_GVP)
            {
                return;
            };

            RefCountHeader* header = ((RefCountHeader*)ptr) - 1;

            if (header.ref_count > 0)
            {
                header.ref_count--;
            };

            if (header.ref_count == 0)
            {
                (void)header;
            };
        };

        def ref_count(void* ptr) -> size_t
        {
            if (ptr == STDLIB_GVP)
            {
                return (size_t)0;
            };

            RefCountHeader* header = ((RefCountHeader*)ptr) - 1;
            return header.ref_count;
        };



        def swap_bytes(byte* a, byte* b) -> void
        {
            byte temp = *a;
            *a = *b;
            *b = temp;
        };

        def reverse_bytes(byte* buffer, size_t size) -> void
        {
            size_t i,
                   j = size - 1;

            while (i < j)
            {
                swap_bytes(buffer + i, buffer + j);
                i++;
                j--;
            };
        };

        def copy_bytes(byte* dest, byte* src, size_t count) -> void
        {
            for (size_t i = 0; i < count; i++)
            {
                dest[i] = src[i];
            };
        };

        def zero_bytes(byte* buffer, size_t count) -> void
        {
            for (size_t i = 0; i < count; i++)
            {
                buffer[i] = 0;
            };
        };
    };
};

































extern
{
    def !!
        VirtualAlloc(u64, size_t, u32, u32) -> u64,
        VirtualFree(u64, size_t, u32)       -> bool;
};






























































struct BlockEntry
{
    u64    key;
    size_t size;
    u64    kind;
    u64    slab;
};



struct Slab
{
    u64    base;
    size_t capacity,frontier,used;
    Slab*  next;
};



struct FreeNode
{
    FreeNode* next;
};






struct RingAllocResult
{
    u64*  ptr;
    bool  wrapped;
};








namespace standard
{
    namespace memory
    {
        namespace allocators
        {
            namespace stdheap
            {

                Slab*       g_slab_head      = (Slab*)0;
                size_t      g_next_slab_size = 4194304;   
                size_t      g_slab_size_cap  = 67108864;  
                size_t      g_large_used     = 0;         


                BlockEntry* g_table          = (BlockEntry*)0;
                size_t      g_table_cap      = 0;   
                size_t      g_table_count    = 0;   
                size_t      g_table_slab_cap = 0;   


                FreeNode*[9] g_bins;



                def heap_os_alloc(size_t bytes) -> u64
                {


                    return VirtualAlloc(0, bytes, 0x3000, 0x04);










                } # effect {*Alloc.Virtual};

                def heap_os_free(u64 ptr, size_t bytes) -> void
                {


                    VirtualFree(ptr, 0, (u32)0x8000);






                } # effect {*Alloc.Virtual};

                def size_class(size_t size) -> size_t # effect {Pure};
                def size_class(size_t size) -> size_t
                {

                    switch (size > 4096) { case (1) { return (size_t)9; } default {}; };










                    size_t s = size - 1;
                    s |= (s >> 1);
                    s |= (s >> 2);
                    s |= (s >> 4);
                    s |= (s >> 8);
                    s += 1;


                    switch (s < 16) { case (1) { s = 16; } default {}; };



                    size_t bit, tmp = s;
                    switch (tmp >> 8  != 0) { case (1) { bit += 8;  tmp >>= 8;  } default {}; };
                    switch (tmp >> 4  != 0) { case (1) { bit += 4;  tmp >>= 4;  } default {}; };
                    switch (tmp >> 2  != 0) { case (1) { bit += 2;  tmp >>= 2;  } default {}; };
                    switch (tmp >> 1  != 0) { case (1) { bit += 1;              } default {}; };



                    return bit - 4;
                };

                def class_block_size(size_t cls) -> size_t # effect {Pure};
                def class_block_size(size_t cls) -> size_t
                {
                    switch (cls)
                    {
                        case (0) { return 16;   }
                        case (1) { return 32;   }
                        case (2) { return 64;   }
                        case (3) { return 128;  }
                        case (4) { return 256;  }
                        case (5) { return 512;  }
                        case (6) { return 1024; }
                        case (7) { return 2048; }
                        case (8) { return 4096; }
                        default  { return 4096; };
                    };
                    return 0;
                };

                def bin_pop(size_t cls) -> FreeNode* # effect {Pure};
                def bin_pop(size_t cls) -> FreeNode*
                {
                    switch (cls > 8) { case (1) { return (FreeNode*)0; } default {}; };
                    FreeNode* n = g_bins[cls];
                    switch (n!?) { case (1) { g_bins[cls] = n.next; } default {}; };
                    return n;
                };

                def bin_push(size_t cls, FreeNode* node) -> void # effect {Pure};
                def bin_push(size_t cls, FreeNode* node) -> void
                {
                    switch (cls > 8) { case (1) { return; } default {}; };
                    node.next = g_bins[cls];
                    g_bins[cls] = node;
                };




                def table_hash(u64 ptr, size_t cap) -> size_t # effect {Pure};
                def table_hash(u64 ptr, size_t cap) -> size_t
                {



                    size_t h = (size_t)ptr >> (size_t)4;
                    h = h * 0x9E3779B97F4A7C15;
                    h = h `^| (h >> (size_t)32);
                    return h & (cap - (size_t)1);
                };


                def table_raw_insert(BlockEntry* tbl, size_t cap,
                                     u64 key, size_t size, u64 kind, u64 slab) -> void # effect {Pure};
                def table_raw_insert(BlockEntry* tbl, size_t cap,
                                     u64 key, size_t size, u64 kind, u64 slab) -> void
                {
                    size_t idx = table_hash(key, cap);
                    while (tbl[idx].key!?)
                    {
                        idx = (idx + 1) `& (cap - 1);
                    };

                    tbl[idx]
                    {
                        .key  = key;
                        .size = size;
                        .kind = kind;
                        .slab = slab;
                    };
                };


                def table_grow() -> bool # effect {*Alloc.Virtual};
                def table_grow() -> bool
                {
                    size_t new_cap  = g_table_cap * 2;
                    size_t new_bytes = new_cap * 32;

                    u64 raw = heap_os_alloc(new_bytes);
                    switch (raw == 0)
                    {
                        case (1) { return false; }
                        default  {};
                    };


                    byte* p = (byte*)raw;
                    size_t i, j;
                    while (i < new_bytes)
                    {
                        p[i] = '\0';
                        i++;
                    };

                    BlockEntry* new_tbl = (BlockEntry*)raw;

                    g_table_count = 0;


                    while (j < g_table_cap)
                    {
                        switch (g_table[j].key!?)
                        {
                            case (1)
                            {
                                table_raw_insert(new_tbl, new_cap,
                                                 g_table[j].key,
                                                 g_table[j].size,
                                                 g_table[j].kind,
                                                 g_table[j].slab);
                                g_table_count++;
                            }
                            default {};
                        };
                        j++;
                    };



                    u64 old_tbl_addr = (u64)g_table;
                    size_t rm_idx = table_hash(old_tbl_addr, new_cap),
                           rm_hole, rm_next,
                           rm_natural;
                    bool rm_found,
                         rm_shift,
                         rm_in_range;

                    while (new_tbl[rm_idx].key!?)
                    {
                        switch (new_tbl[rm_idx].key == old_tbl_addr)
                        {
                            case (1)
                            {
                                new_tbl[rm_idx].key = 0;
                                g_table_count--;

                                rm_hole = rm_idx;
                                rm_next = (rm_idx + 1) `& (new_cap - 1);
                                while (new_tbl[rm_next].key!?)
                                {
                                    rm_natural = table_hash(new_tbl[rm_next].key, new_cap);
                                    switch (rm_hole < rm_next)
                                    {
                                        case (1)
                                        {
                                            switch (rm_natural > rm_hole)
                                            {
                                                case (1)
                                                {
                                                    switch (rm_natural <= rm_next)
                                                    {
                                                        case (1) { rm_in_range = true; }
                                                        default  { rm_in_range = false; };
                                                    };
                                                }
                                                default { rm_in_range = false; };
                                            };
                                            switch (rm_in_range)
                                            {
                                                case (1) { rm_shift = false; }
                                                default  { rm_shift = true; };
                                            };
                                        }
                                        default
                                        {
                                            switch (rm_natural > rm_hole)
                                            {
                                                case (1) { rm_in_range = true; }
                                                default
                                                {
                                                    switch (rm_natural <= rm_next)
                                                    {
                                                        case (1) { rm_in_range = true; }
                                                        default  { rm_in_range = false; };
                                                    };
                                                };
                                            };
                                            switch (rm_in_range)
                                            {
                                                case (1) { rm_shift = false; }
                                                default  { rm_shift = true; };
                                            };
                                        };
                                    };
                                    switch (rm_shift)
                                    {
                                        case (1)
                                        {
                                            new_tbl[rm_hole]
                                            {
                                                .key  = new_tbl[rm_next].key;
                                                .size = new_tbl[rm_next].size;
                                                .kind = new_tbl[rm_next].kind;
                                                .slab = new_tbl[rm_next].slab;
                                            };
                                            new_tbl[rm_next].key  = 0;
                                            rm_hole = rm_next;
                                        }
                                        default {};
                                    };
                                    rm_next = (rm_next + 1) `& (new_cap - 1);
                                };
                                rm_found = true;
                            }
                            default {};
                        };
                        switch (rm_found) { case (1) { break; } default {}; };
                        rm_idx = (rm_idx + 1) `& (new_cap - 1);
                    };

                    heap_os_free((u64)g_table, g_table_slab_cap);

                    g_table          = new_tbl;
                    g_table_cap      = new_cap;
                    g_table_slab_cap = new_bytes;


                    table_raw_insert(g_table,
                                     g_table_cap,
                                     raw,
                                     new_bytes,
                                     2,
                                     raw);
                    g_table_count++;

                    return true;
                };


                def table_init() -> bool # effect {*Alloc.Virtual};
                def table_init() -> bool
                {
                    size_t initial_cap   = 1024,
                           initial_bytes = initial_cap * 32;

                    u64 raw = heap_os_alloc(initial_bytes);
                    switch (raw == 0)
                    {
                        case (1) { return false; }
                        default  {};
                    };


                    byte* p = (byte*)raw;
                    size_t i;
                    while (i < initial_bytes)
                    {
                        p[i] = 0;
                        i++;
                    };

                    g_table          = (BlockEntry*)raw;
                    g_table_cap      = initial_cap;
                    g_table_count    = 0;
                    g_table_slab_cap = initial_bytes;


                    table_raw_insert(g_table,
                                     g_table_cap,
                                     raw,
                                     initial_bytes,
                                     2,
                                     raw);
                    g_table_count++;

                    return true;
                };

                def table_insert(u64 key, size_t size, u64 kind, u64 slab) -> bool # effect {*Alloc.Virtual};
                def table_insert(u64 key, size_t size, u64 kind, u64 slab) -> bool
                {
                    if (g_table == (BlockEntry*)0)
                    {
                        if (!table_init()) { return false; };
                    };


                    if (g_table_count * 2 >= g_table_cap)
                    {
                            switch (!table_grow()) { case (1) { return false; } default {}; };
                    };

                    table_raw_insert(g_table, g_table_cap, key, size, kind, slab);
                    g_table_count++;
                    return true;
                };

                def table_find(u64 key) -> BlockEntry* # effect {Pure};
                def table_find(u64 key) -> BlockEntry*
                {
                    switch (g_table == (BlockEntry*)0) { case (1) { return (BlockEntry*)0; } default {}; };

                    size_t idx = table_hash(key, g_table_cap);
                    while (g_table[idx].key!?)
                    {
                        switch (g_table[idx].key == key)
                        {
                            case (1) { return @g_table[idx]; }
                            default  {};
                        };
                        idx = (idx + 1) `& (g_table_cap - 1);
                    };
                    return (BlockEntry*)0;
                };

                def table_remove(u64 key) -> void # effect {Pure};
                def table_remove(u64 key) -> void
                {
                    switch (g_table == (BlockEntry*)0) { case (1) { return; } default {}; };

                    size_t idx = table_hash(key, g_table_cap),
                           hole, next, natural;
                    bool should_shift, in_range;
                    while (g_table[idx].key != 0)
                    {
                        switch (g_table[idx].key == key)
                        {
                            case (1)
                            {

                                g_table[idx].key = 0;
                                g_table_count--;




                                hole = idx;
                                next = (idx + 1) `& (g_table_cap - 1);
                                while (g_table[next].key != 0)
                                {
                                    natural = table_hash(g_table[next].key, g_table_cap);












                                    switch (hole < next)
                                    {
                                        case (1)
                                        {

                                            switch (natural > hole)
                                            {
                                                case (1)
                                                {
                                                    switch (natural <= next)
                                                    {
                                                        case (1) { in_range = true; }
                                                        default  { in_range = false; };
                                                    };
                                                }
                                                default { in_range = false; };
                                            };
                                            switch (in_range)
                                            {
                                                case (1) { should_shift = false; }
                                                default  { should_shift = true; };
                                            };
                                        }
                                        default
                                        {


                                            switch (natural > hole)
                                            {
                                                case (1) { in_range = true; }
                                                default
                                                {
                                                    switch (natural <= next)
                                                    {
                                                        case (1) { in_range = true; }
                                                        default  { in_range = false; };
                                                    };
                                                };
                                            };
                                            switch (in_range)
                                            {
                                                case (1) { should_shift = false; }
                                                default  { should_shift = true; };
                                            };
                                        };
                                    };
                                    switch (should_shift)
                                    {
                                        case (1)
                                        {
                                            g_table[hole]
                                            {
                                                .key  = g_table[next].key;
                                                .size = g_table[next].size;
                                                .kind = g_table[next].kind;
                                                .slab = g_table[next].slab;
                                            };
                                            g_table[next].key = 0;
                                            hole = next;
                                        }
                                        default {};
                                    };
                                    next = (next + 1) `& (g_table_cap - 1);
                                };
                                return;
                            }
                            default {};
                        };
                        idx = (idx + 1) `& (g_table_cap - 1);
                    };
                };

                def heap_new_slab(size_t min_capacity) -> Slab* # effect {*Alloc.Virtual};
                def heap_new_slab(size_t min_capacity) -> Slab*
                {
                    size_t sz = g_next_slab_size;
                    size_t header_size = (40 + 15) `& `!15;
                    switch (min_capacity + header_size > sz)
                    {
                        case (1) { sz = min_capacity + header_size; }
                        default  {};
                    };

                    u64 raw = heap_os_alloc(sz);
                    switch (raw == 0) { case (1) { return (Slab*)0; } default {}; };

                    Slab* slab    = (Slab*)raw;
                    slab
                    {
                        .base = raw;
                        .capacity = sz;
                        .frontier = header_size;
                        .used = 0;
                        .next = g_slab_head;
                    };

                    g_slab_head   = slab;


                    size_t next = g_next_slab_size * 2;
                    switch (next > g_slab_size_cap)
                    {
                        case (1) { next = g_slab_size_cap; }
                        default  {};
                    };
                    g_next_slab_size = next;

                    return slab;
                };

                def bump_alloc(size_t bytes) -> u64 # effect {Pure};
                def bump_alloc(size_t bytes) -> u64
                {
                    Slab* slab = g_slab_head;
                    bool b = slab == (Slab*)0;
                    if (b) { return 0; };
                    bool ret = ((slab!?) `& (slab.frontier + bytes <= slab.capacity));
                    u64 ptr       = (u64)((byte*)slab.base + slab.frontier);
                    slab.frontier = slab.frontier + bytes;
                    return ptr * ret;
                };

                def fmalloc_fast(size_t cls) -> u64 # effect {Pure};
                def fmalloc_fast(size_t cls) -> u64
                {
                    FreeNode* head = g_bins[cls];
                    if (head == (FreeNode*)0) { return 0; };
                    g_bins[cls] = head.next;
                    return (u64)head;
                };



                def fmalloc(size_t size) -> u64 # effect {*Alloc.Heap};
                def fmalloc(size_t size) -> u64
                {
                    if (size is void) { return size; };




                    if (size <= 32)
                    {
                        if (size > 16)   
                        {
                            u64 fast = fmalloc_fast(1);
                            if (fast!?) { return fast; };

                            size_t cls = 1;
                            u64 ptr = bump_alloc(32);
                            if (ptr is void)
                            {
                                    if (heap_new_slab(32) is (Slab*)0) { return 0; };
                                    ptr = bump_alloc(32);
                                    if (ptr is void) { return 0; };
                            };

                            if (!table_insert(ptr, cls, 0, (u64)g_slab_head))
                            {
                                return 0;
                            };
                            g_slab_head.used++;
                            return ptr;
                        };
                    };

                    if (size <= 64)
                    {
                        if (size > 32)   
                        {
                            u64 fast = fmalloc_fast(2);
                            if (fast!?) { return fast; };
                            size_t cls = 2;
                            u64 ptr = bump_alloc(64);
                            if (ptr is void)
                            {
                                if (heap_new_slab(64) is (Slab*)0) { return 0; };
                                ptr = bump_alloc(64);
                                if (ptr is void) { return 0; };
                            };

                            if (!table_insert(ptr, cls, 0, (u64)g_slab_head))
                            {
                                return 0;
                            };
                            g_slab_head.used++;
                            return ptr;
                        };
                    };

                    if (size <= 128)
                    {
                        if (size > 64)   
                        {
                            u64 fast = fmalloc_fast(3);
                            if (fast!?) { return fast; };
                            size_t cls = 3;
                            u64 ptr = bump_alloc(128);
                            if (ptr is void)
                            {
                                    if (heap_new_slab(128) == (Slab*)0) { return 0; };
                                    ptr = bump_alloc(128);
                                    if (ptr is void) { return 0; };
                            };
                            if (!table_insert(ptr, cls, 0, (u64)g_slab_head))
                            {
                                return 0;
                            };
                            g_slab_head.used++;
                            return ptr;
                        };
                    };


                    size_t cls = size_class(size);

                    switch (cls == 9)
                    {
                        case (1)
                        {

                            u64 raw = heap_os_alloc(size);
                            switch (raw == 0) { case (1) { return 0; } default {}; };


                            switch (!table_insert(raw, size, 1, size))
                            {
                                case (1)
                                {
                                    heap_os_free(raw, size);
                                    return 0;
                                }
                                default {};
                            };

                            g_large_used++;
                            return raw;
                        }
                        default {};
                    };


                    FreeNode* node = bin_pop(cls);
                    switch (node!?)
                    {
                        case (1) { return (u64)node; }
                        default  {};
                    };


                    size_t block = class_block_size(cls);
                    u64 ptr = bump_alloc(block);
                    switch (ptr is void)
                    {
                        case (1)
                        {
                            switch (heap_new_slab(block) == (Slab*)0) { case (1) { return 0; } default {}; };
                            ptr = bump_alloc(block);
                            switch (ptr is void) { case (1) { return 0; } default {}; };
                        }
                        default {};
                    };

                    switch (!table_insert(ptr, cls, 0, (u64)g_slab_head))
                    {
                        case (1) { return 0; }
                        default  {};
                    };

                    g_slab_head.used++;
                    return ptr;
                };

                def fmalloc(ulong size) -> u64 # effect {*Alloc.Heap};
                def fmalloc(ulong size) -> u64
                {
                    return fmalloc((size_t)size);
                };

                def ffree(u64 ptr) -> void # effect {*Alloc.Heap};
                def ffree(u64 ptr) -> void
                {
                    switch (ptr is void) { case (1) { return; } default {}; };

                    BlockEntry* entry = table_find(ptr);
                    switch (entry == (BlockEntry*)0) { case (1) { return; } default {}; };

                    u64    kind = entry.kind;
                    size_t size = entry.size;
                    u64    slab = entry.slab;

                    switch (kind == 1)
                    {
                        case (1)
                        {

                            table_remove(ptr);
                            g_large_used--;
                            heap_os_free(ptr, (size_t)slab);
                            return;
                        }
                        default {};
                    };



                    entry.kind = (u64)3;
                    bin_push(size, (FreeNode*)ptr);
                };

                def ffree(byte* ptr) -> void # effect {*Alloc.Heap};
                def ffree(byte* ptr) -> void
                {
                    ffree((u64)ptr);
                };

                def frealloc(u64 ptr, size_t new_size) -> u64 # effect {*Alloc.Heap};
                def frealloc(u64 ptr, size_t new_size) -> u64
                {
                    switch (ptr is void) { case (1) { return fmalloc(new_size); } default {}; };
                    switch (new_size == 0) { case (1) { ffree(ptr); return 0; } default {}; };

                    BlockEntry* entry = table_find(ptr);
                    switch (entry == (BlockEntry*)0) { case (1) { return 0; } default {}; };

                    u64    kind    = entry.kind,
                           new_ptr;
                    size_t old_size = entry.size,
                           copy_size,
                           i;

                    byte* src, dst;

                    bool same, shrink, has_reuse;

                    FreeNode* reuse;
                    Slab* old_owner, new_owner, ws;

                    switch (kind == 1)
                    {
                        case (1)
                        {

                            same = old_size == new_size;
                            switch (same)
                            {
                                case (1) { return ptr; }
                                default  {};
                            };


                        }
                        default
                        {
                            size_t old_cls = old_size;
                            size_t new_cls = size_class(new_size);


                            same = new_cls == old_cls;
                            switch (same) { case (1) { return ptr; } default {}; };


                            shrink = new_cls < old_cls;
                            switch (shrink) { case (1) { return ptr; } default {}; };


                            copy_size = class_block_size(old_cls);
                            switch (new_size < copy_size) { case (1) { copy_size = new_size; } default {}; };

                            reuse = bin_pop(new_cls);
                            has_reuse = reuse!?;
                            switch (has_reuse)
                            {
                                case (1)
                                {
                                    new_ptr = (u64)reuse;
                                    BlockEntry* reuse_entry = table_find(new_ptr);
                                    switch (reuse_entry!?)
                                    {
                                        case (1)
                                        {
                                            new_owner = (Slab*)reuse_entry.slab;
                                            reuse_entry.size = new_cls;
                                            reuse_entry.kind = 0;  
                                            switch (new_owner!?)
                                            {
                                                case (1) { new_owner.used++; }
                                                default  {};
                                            };
                                        }
                                        default {};
                                    };
                                    src = (byte*)ptr;
                                    dst = (byte*)new_ptr;
                                    while (i < copy_size) { dst[i] = src[i]; i++; };
                                    old_owner = (Slab*)entry.slab;
                                    switch (old_owner!?)
                                    {
                                        case (1) { switch (old_owner.used > 0) { case (1) { old_owner.used--; } default {}; }; }
                                        default  {};
                                    };
                                    entry.kind = (u64)3;   
                                    bin_push(old_cls, (FreeNode*)ptr);
                                    return new_ptr;
                                }
                                default {};
                            };


                            new_ptr = fmalloc(new_size);
                            switch (new_ptr is void) { case (1) { return 0; } default {}; };
                            src = (byte*)ptr;
                            dst = (byte*)new_ptr;
                            i = 0;
                            while (i < copy_size) { dst[i] = src[i]; i++; };
                            ffree(ptr);
                            return new_ptr;
                        };
                    };


                    new_ptr = fmalloc(new_size);
                    switch (new_ptr is void) { case (1) { return 0; } default {}; };
                    src = (byte*)ptr;
                    dst = (byte*)new_ptr;
                    copy_size = old_size;
                    switch (new_size < old_size) { case (1) { copy_size = new_size; } default {}; };
                    i = 0;
                    while (i < copy_size) { dst[i] = src[i]; i++; };
                    ffree(ptr);
                    return new_ptr;
                };





                def coalesce_heap() -> void # effect {*Alloc.Virtual};
                def coalesce_heap() -> void
                {
                    size_t bin_idx;

                    u64 addr;

                    Slab* slab = g_slab_head,
                          prev, next;

                    FreeNode* node, node_next, keep_head, keep_tail,
                              reinsert, reinsert_next;

                    while (slab!?)
                    {
                        next = slab.next;

                        switch (slab.used == 0)
                        {
                            case (1)
                            {


                                while (bin_idx <= 8)
                                {
                                    node = bin_pop(bin_idx);
                                    keep_head = (FreeNode*)0;
                                    keep_tail = (FreeNode*)0;

                                    while (node!?)
                                    {
                                        addr = (u64)node;
                                        node_next = node.next;

                                        switch (addr >= slab.base & addr < slab.base + (u64)slab.capacity)
                                        {

                                            case (1) {}
                                            default
                                            {

                                                node.next = (FreeNode*)0;
                                                switch (keep_tail == (FreeNode*)0)
                                                {
                                                    case (1)
                                                    {
                                                        keep_head = node;
                                                        keep_tail = node;
                                                    }
                                                    default
                                                    {
                                                        keep_tail.next = node;
                                                        keep_tail      = node;
                                                    };
                                                };
                                            };
                                        };

                                        node = node_next;
                                    };


                                    reinsert = keep_head;
                                    while (reinsert!?)
                                    {
                                        reinsert_next = reinsert.next;
                                        bin_push(bin_idx, reinsert);
                                        reinsert = reinsert_next;
                                    };

                                    bin_idx++;
                                };


                                switch (prev == (Slab*)0)
                                {
                                    case (1) { g_slab_head = next; }
                                    default  { prev.next   = next; };
                                };

                                heap_os_free(slab.base, slab.capacity);
                            }
                            default
                            {
                                prev = slab;
                            };
                        };

                        slab = next;
                    };
                };





                def check_fragmentation() -> float # effect {Pure};
                def check_fragmentation() -> float
                {

                    size_t total_capacity, total_used,
                           usable, committed,
                           all_used, used_bytes, free_bytes;

                    Slab* slab = g_slab_head;

                    while (slab!?)
                    {

                        usable = slab.capacity - 40;
                        total_capacity += usable;



                        total_used += slab.used;
                        slab = slab.next;
                    };

                    switch (total_capacity == 0)
                    {
                        case (1)
                        {

                            switch (g_large_used > 0)
                            {
                                case (1) { return 1.0; }
                                default  { return 0.0; };
                            };
                        }
                        default {};
                    };





                    slab = g_slab_head;
                    while (slab!?)
                    {
                        committed += slab.frontier - 40;
                        slab = slab.next;
                    };

                    all_used = total_used + g_large_used;

                    switch (committed == 0)
                    {
                        case (1) { return 0.0; }
                        default  {};
                    };





                    used_bytes = all_used * 16;
                    switch (used_bytes > committed)
                    {
                        case (1) { used_bytes = committed; }
                        default  {};
                    };
                    free_bytes = committed - used_bytes;

                    return float(free_bytes) / float(committed);
                };

            };

            namespace stdstack
            {

                object StackAllocator
                {
                    byte* buffer;
                    size_t capacity, offset;

                    def __init(size_t size) -> this # effect {*Alloc.Stack};
                    def __init(size_t size) -> this
                    {
                        this
                        {
                            .capacity = size;
                            .offset = 0;
                            .buffer = (byte*)stdheap::fmalloc(size);
                        };

                        return this;
                    };

                    def __exit() -> void # effect {*Alloc.Stack};
                    def __exit() -> void
                    {
                        switch (this.buffer != 0)
                        {
                            case (true)
                            {
                                stdheap::ffree((u64)this.buffer);
                            }
                            default {};
                        };
                    };

                    def __expr() -> u64 # effect {Pure};
                    def __expr() -> u64
                    {
                        return (u64)@this.buffer;
                    };

                    def allocate(size_t size) -> void_ptr # effect {*Alloc.Stack};
                    def allocate(size_t size) -> void_ptr
                    {
                        bool b = (this.offset + size) > this.capacity;
                        switch (b)
                        {
                            case (true)
                            {
                                return STDLIB_GVP;
                            }
                            default
                            {
                                u64* ptr = (void_ptr)(this.buffer + this.offset);
                                this.offset += size;
                                return ptr;
                            };
                        };
                        return STDLIB_GVP;
                    };

                    def reset() -> void # effect {Pure};
                    def reset() -> void
                    {
                        this.offset = 0;
                    };

                    def get_used() -> size_t # effect {Pure};
                    def get_used() -> size_t
                    {
                        return this.offset;
                    };

                    def get_available() -> size_t # effect {Pure};
                    def get_available() -> size_t
                    {
                        return this.capacity - this.offset;
                    };

                    def get_capacity() -> size_t # effect {Pure};
                    def get_capacity() -> size_t
                    {
                        return this.capacity;
                    };
                };
            };

            namespace stdpool
            {










                object PoolAllocator
                {
                    byte*     buffer;
                    size_t    block_size, block_count;
                    FreeNode* free_head;

                    def __init(size_t bsize, size_t bcount) -> this # effect {*Alloc.Pool};
                    def __init(size_t bsize, size_t bcount) -> this
                    {


                        size_t actual_bsize = bsize;
                        FreeNode* node;
                        switch (actual_bsize < 8)
                        {
                            case (1) { actual_bsize = 8; }
                            default  {};
                        };

                        this
                        {
                            .block_size = actual_bsize;
                            .block_count = bcount;
                            .buffer = (byte*)stdheap::fmalloc(actual_bsize * bcount);
                            .free_head = (FreeNode*)0;
                        };


                        switch (this.buffer != (byte*)0)
                        {
                            case (1)
                            {
                                size_t i = bcount;
                                while (i > 0)
                                {
                                    i--;
                                    node = (FreeNode*)(this.buffer + i * actual_bsize);
                                    node.next      = this.free_head;
                                    this.free_head = node;
                                };
                            }
                            default {};
                        };

                        return this;
                    };

                    def __exit() -> void # effect {*Alloc.Pool};
                    def __exit() -> void
                    {
                        switch (this.buffer != (byte*)0)
                        {
                            case (1)
                            {
                                stdheap::ffree((u64)@this.buffer);
                            }
                            default {};
                        };
                    };

                    def __expr() -> u64 # effect {Pure};
                    def __expr() -> u64
                    {
                        return (u64)@this.buffer;
                    };



                    def allocate() -> void_ptr # effect {*Alloc.Pool};
                    def allocate() -> void_ptr
                    {
                        switch (this.free_head == (FreeNode*)0)
                        {
                            case (1) { return (void_ptr)0; }
                            default  {};
                        };

                        FreeNode* node = this.free_head;
                        this.free_head = node.next;
                        return (void_ptr)node;
                    };




                    def deallocate(void_ptr ptr) -> void # effect {*Alloc.Pool};
                    def deallocate(void_ptr ptr) -> void
                    {
                        switch (ptr is void)
                        {
                            case (1) { return; }
                            default  {};
                        };

                        FreeNode* node = (FreeNode*)ptr;
                        node.next      = this.free_head;
                        this.free_head = node;
                    };

                    def get_block_size() -> size_t # effect {Pure};
                    def get_block_size() -> size_t
                    {
                        return this.block_size;
                    };

                    def get_block_count() -> size_t # effect {Pure};
                    def get_block_count() -> size_t
                    {
                        return this.block_count;
                    };


                    def get_free_count() -> size_t # effect {Pure};
                    def get_free_count() -> size_t
                    {
                        size_t    count;
                        FreeNode* node  = this.free_head;
                        while (node!?)
                        {
                            count++;
                            node = node.next;
                        };
                        return count;
                    };
                };
            };

            namespace stdarena
            {



























                struct ArenaChunk
                {
                    ArenaChunk* next;
                    size_t      capacity;
                    size_t      offset;
                };





                struct ArenaMark
                {
                    ArenaChunk* chunk;
                    size_t      offset;
                };



                struct Arena
                {
                    ArenaChunk* head;
                    size_t      next_chunk_size;
                    size_t      chunk_size_cap;
                };






                def _new_chunk(Arena* a, size_t min_bytes) -> bool # effect {*Alloc.Pool};
                def _new_chunk(Arena* a, size_t min_bytes) -> bool
                {
                    size_t      need, sz;
                    ArenaChunk* chunk;
                    u64         raw;
                    need = min_bytes + (size_t)32;
                    sz   = a.next_chunk_size;
                    switch (need > sz) { case (1) { sz = need; } default {}; };
                    raw = stdheap::fmalloc(sz);
                    switch (raw == 0) { case (1) { return false; } default {}; };
                    chunk          = (ArenaChunk*)raw;
                    chunk
                    {
                        .next = a.head;
                        .capacity = sz;
                        .offset = (size_t)32;
                    };
                    a.head         = chunk;
                    sz = a.next_chunk_size * 2;
                    switch (sz > a.chunk_size_cap) { case (1) { sz = a.chunk_size_cap; } default {}; };
                    a.next_chunk_size = sz;
                    return true;
                };


                def arena_init(Arena* a) -> void # effect {Pure};
                def arena_init(Arena* a) -> void
                {
                    a
                    {
                        .head            = (ArenaChunk*)0;
                        .next_chunk_size = (size_t)1048576;
                        .chunk_size_cap  = (size_t)67108864;
                    };
                };


                def arena_init_sized(Arena* a, size_t first_chunk) -> void # effect {Pure};
                def arena_init_sized(Arena* a, size_t first_chunk) -> void
                {
                    a.head            = (ArenaChunk*)0;
                    a.next_chunk_size = first_chunk;
                    a.chunk_size_cap  = (size_t)67108864;
                };




                def alloc(Arena* a, size_t sz) -> void* # effect {*Alloc.Pool};
                def alloc(Arena* a, size_t sz) -> void*
                {
                    size_t      aligned, new_offset;
                    ArenaChunk* c;
                    u64         ptr;
                    aligned = (sz + (size_t)7) `& (`!7);
                    c       = a.head;
                    switch ((u64)c != 0)
                    {
                        case (1)
                        {
                            new_offset = c.offset + aligned;
                            switch (new_offset <= c.capacity)
                            {
                                case (1)
                                {
                                    ptr      = (u64)c + (u64)c.offset;
                                    c.offset = new_offset;
                                    return (void*)ptr;
                                }
                                default {};
                            };
                        }
                        default {};
                    };
                    switch (!_new_chunk(a, aligned)) { case (1) { return (void*)0; } default {}; };
                    c        = a.head;
                    ptr      = (u64)c + (u64)c.offset;
                    c.offset = c.offset + aligned;
                    return (void*)ptr;
                };


                def alloc_zero(Arena* a, size_t sz) -> void* # effect {*Alloc.Pool};
                def alloc_zero(Arena* a, size_t sz) -> void*
                {
                    void*  p;
                    byte*  b;
                    size_t i;
                    p = alloc(a, sz);
                    switch ((u64)p == 0) { case (1) { return (void*)0; } default {}; };
                    b = (byte*)p;
                    while (i < sz) { b[i] = 0; i++; };
                    return p;
                };


                def alloc_copy(Arena* a, void* src, size_t sz) -> void* # effect {*Alloc.Pool};
                def alloc_copy(Arena* a, void* src, size_t sz) -> void*
                {
                    void*  p;
                    byte*  d, s;
                    size_t i;
                    p = alloc(a, sz);
                    switch ((u64)p == 0) { case (1) { return (void*)0; } default {}; };
                    d = (byte*)p;
                    s = (byte*)src;
                    while (i < sz) { d[i] = s[i]; i++; };
                    return p;
                };


                def alloc_str(Arena* a, byte* src) -> byte* # effect {*Alloc.Pool};
                def alloc_str(Arena* a, byte* src) -> byte*
                {
                    size_t n;
                    byte*  p;
                    while (src[n] != 0) { n++; };
                    n++;
                    p = (byte*)alloc(a, n);
                    switch ((u64)p == 0) { case (1) { return (byte*)0; } default {}; };
                    n = 0;
                    while (src[n] != 0) { p[n] = src[n]; n++; };
                    p[n] = 0;
                    return p;
                };


                def arena_mark(Arena* a) -> ArenaMark # effect {Pure};
                def arena_mark(Arena* a) -> ArenaMark
                {
                    ArenaMark   m;
                    ArenaChunk* h;
                    h        = a.head;
                    m.chunk  = h;
                    switch ((u64)h != 0)
                    {
                        case (1) { m.offset = h.offset; }
                        default  { m.offset = 0; };
                    };
                    return m;
                };


                def arena_rewind(Arena* a, ArenaMark* m) -> void # effect {*Alloc.Pool};
                def arena_rewind(Arena* a, ArenaMark* m) -> void
                {
                    ArenaChunk* c, target, next;
                    target = m.chunk;
                    c      = a.head;
                    while ((u64)c != (u64)target & (u64)c != 0)
                    {
                        next = c.next;
                        stdheap::ffree((u64)c);
                        c = next;
                    };
                    a.head = target;
                    switch ((u64)target != 0) { case (1) { target.offset = m.offset; } default {}; };
                };


                def arena_reset(Arena* a) -> void # effect {Pure};
                def arena_reset(Arena* a) -> void
                {
                    ArenaChunk* c;
                    c = a.head;
                    while ((u64)c != 0)
                    {
                        c.offset = (size_t)32;
                        c = c.next;
                    };
                };


                def arena_destroy(Arena* a) -> void # effect {*Alloc.Pool};
                def arena_destroy(Arena* a) -> void
                {
                    ArenaChunk* c, next;
                    c = a.head;
                    while ((u64)c != 0)
                    {
                        next = c.next;
                        stdheap::ffree((u64)c);
                        c = next;
                    };
                    a.head = (ArenaChunk*)0;
                };



                def arena_used(Arena* a) -> size_t # effect {Pure};
                def arena_used(Arena* a) -> size_t
                {
                    ArenaChunk* c;
                    size_t      total;
                    c     = a.head;
                    while ((u64)c != 0)
                    {
                        total = total + c.offset - (size_t)32;
                        c     = c.next;
                    };
                    return total;
                };


                def arena_committed(Arena* a) -> size_t # effect {Pure};
                def arena_committed(Arena* a) -> size_t
                {
                    ArenaChunk* c;
                    size_t      total;
                    c     = a.head;
                    while ((u64)c != 0)
                    {
                        total = total + c.capacity - (size_t)32;
                        c     = c.next;
                    };
                    return total;
                };

            };

            namespace stdring
            {



















                object RingAllocator
                {
                    byte*            buffer;
                    size_t           capacity, write_pos;
                    RingAllocResult* rallocresult;

                    def __init(size_t size) -> this # effect {*Alloc.Heap};
                    def __init(size_t size) -> this
                    {
                        this
                        {
                            .capacity = size;
                            .write_pos = 0;
                            .buffer = (byte*)stdheap::fmalloc(size);
                            .rallocresult = (RingAllocResult*)stdheap::fmalloc(16);
                        };
                        return this;
                    };

                    def __exit() -> void # effect {*Alloc.Heap};
                    def __exit() -> void
                    {
                        switch (this.buffer != (byte*)0)
                        {
                            case (1)
                            {
                                stdheap::ffree((u64)@this.buffer);
                            }
                            default {};
                        };
                        switch (this.rallocresult != (RingAllocResult*)0)
                        {
                            case (1)
                            {
                                stdheap::ffree((u64)@this.rallocresult);
                            }
                            default {};
                        };
                    };

                    def __expr() -> u64 # effect {Pure};
                    def __expr() -> u64
                    {
                        return (u64)@this.buffer;
                    };






                    def allocate(size_t size) -> RingAllocResult* # effect {*Alloc.Heap};
                    def allocate(size_t size) -> RingAllocResult*
                    {

                        switch (size > this.capacity)
                        {
                            case (1) { return (RingAllocResult*)0; }
                            default  {};
                        };

                        bool wrapped = false;


                        switch (this.write_pos + size > this.capacity)
                        {
                            case (1)
                            {
                                this.write_pos = 0;
                                wrapped        = true;
                            }
                            default {};
                        };


                        u64* user_ptr   = (void_ptr)(this.buffer + this.write_pos);
                        this.write_pos  += size;

                        this.rallocresult.ptr     = user_ptr;
                        this.rallocresult.wrapped = wrapped;

                        return this.rallocresult;
                    };

                    def get_capacity() -> size_t
                    {
                        return this.capacity;
                    } # effect {Pure};

                    def get_write_pos() -> size_t
                    {
                        return this.write_pos;
                    } # effect {Pure};

                    def reset() -> void
                    {
                        this.write_pos = 0;
                    } # effect {Pure};
                };
            };
        };
    };
};



























struct ExceptionState
{
    u64 RAX, RBX, RCX, RDX,
        RSI, RDI, RBP, RSP,
        R8,  R9,  R10, R11,
        R12, R13, R14, R15,
        RIP, RFLAGS;
};

























const i32 EC_NONE             = 0,
          EC_NULLPTR           = 1,
          EC_WILDPTR           = 2,
          EC_PROTFAULT         = 3,
          EC_STACKOVERFLOW     = 4,
          EC_ILLEGALINSTR      = 5,
          EC_DIVBYZERO         = 6,
          EC_INTOVERFLOW       = 7,
          EC_ALIGNFAULT        = 8,
          EC_PRIVINSTR         = 9;

struct Exception
{
    byte*          msg;
    i32            ec;
    ExceptionState regs;
};





const u32 WIN_EXCEPTION_ACCESS_VIOLATION       = 0xC0000005u,
          WIN_EXCEPTION_DATATYPE_MISALIGNMENT  = 0x80000002u,
          WIN_EXCEPTION_ILLEGAL_INSTRUCTION    = 0xC000001Du,
          WIN_EXCEPTION_INT_DIVIDE_BY_ZERO     = 0xC0000094u,
          WIN_EXCEPTION_INT_OVERFLOW           = 0xC0000095u,
          WIN_EXCEPTION_PRIV_INSTRUCTION       = 0xC0000096u,
          WIN_EXCEPTION_STACK_OVERFLOW         = 0xC00000FDu;

const i32 WIN_EXCEPTION_CONTINUE_EXECUTION = -1,
          WIN_EXCEPTION_CONTINUE_SEARCH    = 0;


struct WinExceptionRecord
{
    u32                  ExceptionCode;
    u32                  ExceptionFlags;
    WinExceptionRecord*  ExceptionRecordNext;
    void*                ExceptionAddress;
    u32                  NumberParameters;
    u64[15]              ExceptionInformation;
};

struct WinContext
{
    u64 P1Home, P2Home, P3Home, P4Home, P5Home, P6Home;
    u32 ContextFlags;
    u32 MxCsr;
    u16 SegCs, SegDs, SegEs, SegFs, SegGs, SegSs;
    u32 EFlags;
    u64 Dr0, Dr1, Dr2, Dr3, Dr6, Dr7;
    u64 Rax, Rcx, Rdx, Rbx, Rsp, Rbp, Rsi, Rdi;
    u64 R8, R9, R10, R11, R12, R13, R14, R15;
    u64 Rip;
};

struct WinExceptionPointers
{
    WinExceptionRecord* ExceptionRecord;
    WinContext*         ContextRecord;
};

extern
{
    stdcall !!
        AddVectoredExceptionHandler(u32 First, void* Handler) -> void*,
        SetThreadStackGuarantee(u32* StackSizeInBytes) -> i32,
        VirtualAlloc(void*, u64, u32, u32) -> void*,
        VirtualFree(void*, u64, u32)       -> i32;
};

const u32 FEXC_MEM_COMMIT_RESERVE = 0x3000u,
          FEXC_PAGE_READWRITE    = 0x04u;

const u32 FEXC_STACK_GUARANTEE_BYTES = 0x10000u; 





struct FluxJmpBuf
{
    u64    rip, rsp, rbp, rbx, r12, r13, r14, r15;
    bool*  exc_flag_ptr;
    u64*   exc_value_ptr;
    bool*  exc_origin_ptr;
    i32*   exc_type_tag_ptr;
};

const u64 FEXC_JMPSTACK_CAPACITY = 64;

global FluxJmpBuf* FEXC_JMPSTACK_BASE = (FluxJmpBuf*)STDLIB_GVP;
global u64         FEXC_JMPSTACK_TOP  = 0;
global bool        FEXC_INITIALIZED   = false;

global Exception FEXC_PENDING;

namespace standard
{
    namespace runtime
    {
        namespace exceptions
        {
            def fexc_init() -> bool
            {


                void* page = VirtualAlloc(
                    (ulong)STDLIB_GVP,
                    (u64)FEXC_JMPSTACK_CAPACITY * (u64)sizeof(FluxJmpBuf),
                    FEXC_MEM_COMMIT_RESERVE,
                    FEXC_PAGE_READWRITE
                );
                if (page == (void*)STDLIB_GVP)
                {
                    return false;
                };
                FEXC_JMPSTACK_BASE = (FluxJmpBuf*)page;
                FEXC_JMPSTACK_TOP  = 0;
                FEXC_INITIALIZED   = true;
                return true;








            };

            def fexc_push(bool* exc_flag_ptr, u64* exc_value_ptr, bool* exc_origin_ptr, i32* exc_type_tag_ptr) -> FluxJmpBuf*
            {
                if (!FEXC_INITIALIZED)
                {
                    return (FluxJmpBuf*)STDLIB_GVP;
                };
                if (FEXC_JMPSTACK_TOP >= FEXC_JMPSTACK_CAPACITY)
                {
                    return (FluxJmpBuf*)STDLIB_GVP;
                };
                FluxJmpBuf* slot = FEXC_JMPSTACK_BASE + FEXC_JMPSTACK_TOP;
                slot.exc_flag_ptr     = exc_flag_ptr;
                slot.exc_value_ptr    = exc_value_ptr;
                slot.exc_origin_ptr   = exc_origin_ptr;
                slot.exc_type_tag_ptr = exc_type_tag_ptr;
                FEXC_JMPSTACK_TOP = FEXC_JMPSTACK_TOP + 1;
                return slot;
            };

            def fexc_pop() -> void
            {
                if (FEXC_JMPSTACK_TOP == 0)
                {
                    return;
                };
                FEXC_JMPSTACK_TOP = FEXC_JMPSTACK_TOP - 1;
            };

            def fexc_top() -> FluxJmpBuf*
            {
                if (!FEXC_INITIALIZED | FEXC_JMPSTACK_TOP == 0)
                {
                    return (FluxJmpBuf*)STDLIB_GVP;
                };
                return FEXC_JMPSTACK_BASE + (FEXC_JMPSTACK_TOP - 1);
            };







            def flux_setjmp(FluxJmpBuf* buf) -> i32
            {
                i32 result = 0;
                volatile asm
                {
                    movq $1, %rdi
                    movq %rsp, 8(%rdi)
                    movq %rbp, 16(%rdi)
                    movq %rbx, 24(%rdi)
                    movq %r12, 32(%rdi)
                    movq %r13, 40(%rdi)
                    movq %r14, 48(%rdi)
                    movq %r15, 56(%rdi)
                    leaq .fexc_resume_point(%rip), %rax
                    movq %rax, 0(%rdi)
                    movl $$0, %eax
                .fexc_resume_point:
                    movl %eax, $0
                } : "=r"(result) : "r"(buf) : "rax", "rdi", "rsp", "rbp", "rbx",
                                 "r12", "r13", "r14", "r15", "memory";
                return result;
            };

            def flux_longjmp(FluxJmpBuf* buf, i32 value) -> void
            {
                i32 actual_value = value;
                if (actual_value == 0)
                {
                    actual_value = 1;
                };
                volatile asm
                {
                    movq $0, %rdi
                    movl $1, %eax
                    movq 32(%rdi), %r12
                    movq 40(%rdi), %r13
                    movq 48(%rdi), %r14
                    movq 56(%rdi), %r15
                    movq 16(%rdi), %rbp
                    movq 24(%rdi), %rbx
                    movq 0(%rdi),  %rcx
                    movq 8(%rdi),  %rsp
                    jmpq *%rcx
                } : : "r"(buf), "r"(actual_value) : "rax", "rcx", "rdi",
                                 "rsp", "rbp", "rbx", "r12", "r13",
                                 "r14", "r15", "memory";
                noreturn;
            };





            def fexc_classify(WinExceptionRecord* record) -> i32
            {
                u32 code = record.ExceptionCode;

                if (code == WIN_EXCEPTION_STACK_OVERFLOW)
                {
                    return EC_STACKOVERFLOW;
                };

                if (code == WIN_EXCEPTION_ACCESS_VIOLATION)
                {

                    u64 fault_addr = record.ExceptionInformation[1];

                    if (fault_addr < (u64)0x10000u)
                    {
                        return EC_NULLPTR;
                    };



                    if (record.ExceptionInformation[0] == (u64)1)
                    {
                        return EC_PROTFAULT;
                    };

                    return EC_WILDPTR;
                };

                if (code == WIN_EXCEPTION_ILLEGAL_INSTRUCTION)
                {
                    return EC_ILLEGALINSTR;
                };

                if (code == WIN_EXCEPTION_INT_DIVIDE_BY_ZERO)
                {
                    return EC_DIVBYZERO;
                };

                if (code == WIN_EXCEPTION_INT_OVERFLOW)
                {
                    return EC_INTOVERFLOW;
                };

                if (code == WIN_EXCEPTION_DATATYPE_MISALIGNMENT)
                {
                    return EC_ALIGNFAULT;
                };

                if (code == WIN_EXCEPTION_PRIV_INSTRUCTION)
                {
                    return EC_PRIVINSTR;
                };

                return EC_NONE;
            };


            def fexc_message(i32 ec) -> byte*
            {
                if (ec == EC_NULLPTR)        { return "Null pointer dereference\0"; };
                if (ec == EC_WILDPTR)        { return "Wild pointer access\0"; };
                if (ec == EC_PROTFAULT)      { return "Write to protected memory\0"; };
                if (ec == EC_STACKOVERFLOW)  { return "Stack overflow\0"; };
                if (ec == EC_ILLEGALINSTR)   { return "Illegal instruction\0"; };
                if (ec == EC_DIVBYZERO)      { return "Integer divide by zero\0"; };
                if (ec == EC_INTOVERFLOW)    { return "Integer overflow\0"; };
                if (ec == EC_ALIGNFAULT)     { return "Data type misalignment\0"; };
                if (ec == EC_PRIVINSTR)      { return "Privileged instruction\0"; };
                return "Unknown hardware exception\0";
            };


            def fexc_populate_state(WinContext* ctx, ExceptionState* out) -> void
            {
                out.RAX    = ctx.Rax;
                out.RBX    = ctx.Rbx;
                out.RCX    = ctx.Rcx;
                out.RDX    = ctx.Rdx;
                out.RSI    = ctx.Rsi;
                out.RDI    = ctx.Rdi;
                out.RBP    = ctx.Rbp;
                out.RSP    = ctx.Rsp;
                out.R8     = ctx.R8;
                out.R9     = ctx.R9;
                out.R10    = ctx.R10;
                out.R11    = ctx.R11;
                out.R12    = ctx.R12;
                out.R13    = ctx.R13;
                out.R14    = ctx.R14;
                out.R15    = ctx.R15;
                out.RIP    = ctx.Rip;
                out.RFLAGS = (u64)ctx.EFlags;
            };

            def FluxVectoredHandler(void* exception_info) -> i32
            {
                WinExceptionPointers* info = (WinExceptionPointers*)exception_info;
                WinExceptionRecord*   record = info.ExceptionRecord;
                WinContext*           ctx    = info.ContextRecord;

                i32 ec = fexc_classify(record);

                if (ec == EC_NONE)
                {
                    return WIN_EXCEPTION_CONTINUE_SEARCH;
                };

                FluxJmpBuf* target = fexc_top();
                if (target == (FluxJmpBuf*)STDLIB_GVP)
                {
                    return WIN_EXCEPTION_CONTINUE_SEARCH;
                };

                FEXC_PENDING.ec  = ec;
                FEXC_PENDING.msg = fexc_message(ec);
                fexc_populate_state(ctx, @FEXC_PENDING.regs);

                *(target.exc_value_ptr)  = (u64)@FEXC_PENDING;
                *(target.exc_origin_ptr) = true;
                *(target.exc_flag_ptr)   = true;

                flux_longjmp(target, 1);
                return WIN_EXCEPTION_CONTINUE_SEARCH;
            };

            def fexc_register() -> bool
            {
                if (!fexc_init())
                {
                    return false;
                };

                u32 guarantee = FEXC_STACK_GUARANTEE_BYTES;
                SetThreadStackGuarantee(@guarantee);

                void* handle = AddVectoredExceptionHandler((u32)1, (void*)@FluxVectoredHandler);

                return handle != (void*)STDLIB_GVP;
            };

        };
    };
};



using standard::runtime::exceptions;
using standard::memory::allocators::stdheap;











namespace standard
{
    namespace strings
    {
        extern
        {
            def !!
                strcmp(byte* x, byte* y) -> int,
                printf(byte* x, byte* y) -> void,
                strncpy(byte* dest, byte* src, size_t n) -> byte*,
                strcat(byte* dest, byte* src) -> byte*,
                strncat(byte* dest, byte* src, size_t n) -> byte*,
                strncmp(byte* s1, byte* s2, size_t n) -> int,
                strtok(byte* str, byte* delim) -> byte*,
                strtok_s(byte* str, byte* delim, byte** saveptr) -> byte*,
                _strdup(byte* str) -> byte*;
        };

        def strlen(byte* ps) -> int
        {
            int c;
            byte* ch;
            do
            {
                ch = ps++;

                switch (*ch)
                {
                    case (0) { break; }
                    default {};
                };

                c++;
            };
            return c;
        };

        def strstr(byte* haystack, byte* needle) -> byte*
        {
            byte* h, n;
            if (*needle == 0) { return haystack; };
            for (;;)
            {
                if (*haystack == 0) { return (byte*)0; };
                h = haystack;
                n = needle;
                while (*h != 0 & *n != 0 & *h == *n)
                {
                    h = h + 1;
                    n = n + 1;
                };
                if (*n == 0) { return haystack; };
                haystack = haystack + 1;
            };
            return haystack;
        };

        def strchr(byte* str, int c) -> byte*
        {
            for (;;)
            {
                if (*str == c) { return str; };
                if (*str == 0) { return (byte*)0; };
                str = str + 1;
            };
            return (byte*)0;
        };

        def strcpy(noopstr dest, noopstr src) -> noopstr
        {
            size_t i;
            while (src[i] != 0)
            {
                dest[i] = src[i];
                i++;
            };
            dest[i] = (byte)0;
            return dest;
        };

        def i16str(i16 value, byte* buffer) -> i16
        {
            if (value == 0)
            {
                buffer[0] = (byte)48;
                buffer[1] = (byte)0;
                return 1;
            };

            bool is_negative;
            if (value < (i16)0)
            {
                is_negative = true;
                value = -value;
            };

            i16 pos = (i16)0;
            byte[8] temp;

            while (value > (i16)0)
            {
                temp[pos] = (byte)((value % (i16)10) + (i16)48);
                value = value / (i16)10;
                pos++;
            };

            i16 write_pos = (i16)0;
            if (is_negative)
            {
                buffer[0] = (byte)45;
                write_pos = (i16)1;
            };

            i16 i = pos - (i16)1;
            while (i >= (i16)0)
            {
                buffer[write_pos] = temp[i];
                write_pos++;
                i--;
            };

            buffer[write_pos] = (byte)0;
            return write_pos;
        };

        def i32str(i32 value, byte* buffer) -> i32
        {
            if (value == 0)
            {
                buffer[0] = (byte)48; 
                buffer[1] = (byte)0;  
                return 1;
            };

            i32 is_negative = 0;
            if (value < 0)
            {
                is_negative = 1;
                value = -value;
            };


            i32 pos = 0;
            byte[32] temp;

            while (value > 0)
            {
                temp[pos] = (byte)((value % 10) + 48); 
                value = value / 10;
                pos++;
            };


            i32 write_pos = 0;
            if (is_negative == 1)
            {
                buffer[0] = (byte)45; 
                write_pos = 1;
            };


            i32 i = pos - 1;
            while (i >= 0)
            {
                buffer[write_pos] = temp[i];
                write_pos++;
                i--;
            };

            buffer[write_pos] = (byte)0; 
            return write_pos;
        };

        def i64str(i64 value, byte* buffer) -> i64
        {
            if (value == (i64)0)
            {
                buffer[0] = (byte)48; 
                buffer[1] = (byte)0;  
                return 1;
            };

            i64 is_negative = (i64)0;
            if (value < (i64)0)
            {
                is_negative = (i64)1;
                value = -value;
            };


            i64 pos = (i64)0;
            byte[32] temp;

            while (value > (i64)0)
            {
                temp[pos] = (byte)((value % (i64)10) + (i64)48); 
                value = value / (i64)10;
                pos++;
            };


            i64 write_pos = 0;
            if (is_negative == (i64)1)
            {
                buffer[0] = (byte)45; 
                write_pos = (i64)1;
            };


            i64 i = pos - (i64)1;
            while (i >= (i64)0)
            {
                buffer[write_pos] = temp[i];
                write_pos++;
                i--;
            };

            buffer[write_pos] = (byte)0; 
            return write_pos;
        };

        def u16str(u16 value, byte* buffer) -> u16
        {
            if (value == (u16)0)
            {
                buffer[0] = (byte)48;
                buffer[1] = (byte)0;
                return (u16)1;
            };

            u16 pos = (u16)0;
            byte[8] temp;

            while (value > (u16)0)
            {
                temp[pos] = (byte)((value % (u16)10) + (u16)48);
                value = value / (u16)10;
                pos++;
            };

            u16 write_pos = (u16)0;
            u16 i = pos;
            while (i > (u16)0)
            {
                i--;
                buffer[write_pos] = temp[i];
                write_pos++;
            };

            buffer[write_pos] = (byte)0;
            return write_pos;
        };

        def u32str(u32 value, byte* buffer) -> u32
        {
            if (value == (u32)0)
            {
                buffer[0] = (byte)48; 
                buffer[1] = (byte)0;  
                return (u32)1;
            };


            u32 pos = (u32)0;
            byte[32] temp;

            while (value > (u32)0)
            {
                temp[pos] = (byte)((value % (u32)10) + (u32)48);
                value = value / (u32)10;
                pos++;
            };


            u32 write_pos = (u32)0;
            u32 i = pos;  
            while (i > (u32)0)  
            {
                i--;  
                buffer[write_pos] = temp[i];
                write_pos++;
            };

            buffer[write_pos] = (byte)0; 
            return write_pos;
        };

        def u64str(u64 value, byte* buffer) -> u64
        {
            if (value == (u64)0)
            {
                buffer[0] = (byte)48; 
                buffer[1] = (byte)0;  
                return (u64)1;
            };


            u64 pos = (u64)0;
            byte[32] temp;


            while (value != (u64)0)
            {
                temp[pos] = (byte)((value % (u64)10) + (u64)48); 
                value = value / (u64)10;
                pos++;
            };


            u64 write_pos = (u64)0;
            u64 remaining = pos;  

            while (remaining != (u64)0)
            {
                remaining--;  
                buffer[write_pos] = temp[remaining];
                write_pos++;
            };

            buffer[write_pos] = (byte)0; 
            return write_pos;
        };

        def str2i32(byte* str) -> int
        {
            int result, i, digit;
            int sign = 1;
            byte c;
            while (str[i] == 32 | str[i] == 9 | str[i] == 10 | str[i] == 13)
            {
                i++;
            };
            if (str[i] == 45)  
            {
                sign = -1;
                i++;
            }
            elif (str[i] == 43)  
            {
                i++;
            };
            while (str[i] != 0)
            {
                c = str[i];
                if (c >= 48 & c <= 57)
                {
                    digit = (int)(c - 48);
                    result = result * 10 + digit;
                }
                else
                {
                    break;
                };
                i++;
            };
            return result * sign;
        };



        def str2u32(byte* str) -> uint
        {
            uint result, digit;
            int i;
            byte c;


            while (str[i] == 32 | str[i] == 9 | str[i] == 10 | str[i] == 13)
            {
                i++;
            };


            if (str[i] == 45)  
            {
                return 0;  
            }
            elif (str[i] == 43)  
            {
                i++;
            };


            while (str[i] != 0)
            {
                c = str[i];


                if (c >= 48 & c <= 57)
                {
                    digit = (uint)(c - 48);
                    result = result * 10 + digit;
                }
                else
                {

                    break;
                };

                i++;
            };

            return result;
        };



        def str2i64(byte* str) -> i64
        {
            i64 result, digit;
            i64 sign = 1;
            int i;
            byte c;


            while (str[i] == 32 | str[i] == 9 | str[i] == 10 | str[i] == 13)
            {
                i++;
            };


            if (str[i] == 45)  
            {
                sign = (i64)-1;
                i++;
            }
            elif (str[i] == 43)  
            {
                i++;
            };


            while (str[i] != 0)
            {
                c = str[i];


                if (c >= 48 & c <= 57)
                {
                    digit = (i64)(c - 48);
                    result = result * 10 + digit;
                }
                else
                {

                    break;
                };

                i++;
            };

            return result * sign;
        };



        def str2u64(byte* str) -> u64
        {
            u64 result, digit;
            int i;
            byte c;


            while (str[i] == 32 | str[i] == 9 | str[i] == 10 | str[i] == 13)
            {
                i++;
            };


            if (str[i] == 45)  
            {
                return 0;  
            }
            elif (str[i] == 43)  
            {
                i++;
            };


            while (str[i] != 0)
            {
                c = str[i];


                if (c >= 48 & c <= 57)
                {
                    digit = (u64)(c - 48);
                    result = result * 10 + digit;
                }
                else
                {

                    break;
                };

                i++;
            };

            return result;
        };



        def float2str(float value, byte* buffer, i32 precision) -> i32
        {
            i32 write_pos, i;


            if (value < 0.0)
            {
                buffer[0] = 45; 
                write_pos = 1;
                value = -value;
            };


            if (value == 0.0)
            {
                buffer[write_pos] = 48; 
                buffer[write_pos + 1] = 46; 

                while (i < precision)
                {
                    buffer[write_pos + 2 + i] = 48; 
                    i++;
                };

                buffer[write_pos + 2 + precision] = 0;
                return write_pos + 1 + precision;
            };


            i32 int_part = int(value);


            float fractional = value - float(int_part);


            i32 frac_multiplier = 1,
                j;
            while (j < precision)
            {
                frac_multiplier = frac_multiplier * 10;
                j++;
            };


            float scaled_frac = fractional * (float)frac_multiplier;
            i32 frac_part = (i32)(scaled_frac + 0.5);


            if (frac_part >= frac_multiplier)
            {
                int_part = int_part + 1;
                frac_part = 0;


                if (int_part % 10 == 0 & precision > 0)
                {


                };
            };


            if (int_part == 0)
            {
                buffer[write_pos] = (byte)48; 
                write_pos = write_pos + 1;
            }
            else
            {

                byte[32] int_temp;
                i32 temp_pos,
                    temp_int = int_part;

                while (temp_int > 0)
                {
                    int_temp[temp_pos] = (byte)((temp_int % 10) + 48);
                    temp_int = temp_int / 10;
                    temp_pos++;
                };


                i32 k = temp_pos - 1;
                while (k >= 0)
                {
                    buffer[write_pos] = int_temp[k];
                    write_pos = write_pos + 1;
                    k--;
                };
            };


            if (precision > 0)
            {
                buffer[write_pos] = (byte)46; 
                write_pos = write_pos + 1;


                if (frac_part == 0)
                {
                    i32 m = 0;
                    while (m < precision)
                    {
                        buffer[write_pos] = (byte)48; 
                        write_pos = write_pos + 1;
                        m++;
                    };
                }
                else
                {

                    byte[32] frac_temp;
                    i32 frac_digits = 0;
                    i32 temp_frac = frac_part;

                    while (temp_frac > 0)
                    {
                        frac_temp[frac_digits] = (byte)((temp_frac % 10) + 48);
                        temp_frac = temp_frac / 10;
                        frac_digits++;
                    };


                    i32 leading_zeros = precision - frac_digits;
                    i32 n = 0;
                    while (n < leading_zeros)
                    {
                        buffer[write_pos] = (byte)48; 
                        write_pos = write_pos + 1;
                        n++;
                    };


                    i32 p = frac_digits - 1;
                    while (p >= 0)
                    {
                        buffer[write_pos] = frac_temp[p];
                        write_pos = write_pos + 1;
                        p--;
                    };
                };
            };


            buffer[write_pos] = (byte)0;
            return write_pos;
        };

        def dbl2str(double value, byte* buffer, i32 precision) -> i32
        {
            i32 write_pos = 0;


            if (value < (double)0.0)
            {
                buffer[0] = '\x45'; 
                write_pos = 1;
                value = -value;
            };


            if (value == (double)0.0)
            {
                buffer[write_pos] = (byte)48; 
                buffer[write_pos + 1] = (byte)46; 

                i32 i = 0;
                while (i < precision)
                {
                    buffer[write_pos + 2 + i] = (byte)48; 
                    i++;
                };

                buffer[write_pos + 2 + precision] = (byte)0;
                return write_pos + 1 + precision;
            };


            i64 int_part = (i64)value;


            double fractional = value - double(int_part);


            i64 frac_multiplier = (i64)1;
            i32 j = 0;
            while (j < precision)
            {
                frac_multiplier = frac_multiplier * (i64)10;
                j++;
            };


            double scaled_frac = fractional * double(frac_multiplier);
            i64 frac_part = (i64)(scaled_frac + double(0.5));


            if (frac_part >= frac_multiplier)
            {
                int_part = int_part + (i64)1;
                frac_part = (i64)0;


                if (int_part % (i64)10 == (i64)0 & precision > 0)
                {


                };
            };


            if (int_part == (i64)0)
            {
                buffer[write_pos] = (byte)48; 
                write_pos = write_pos + 1;
            }
            else
            {

                byte[32] int_temp;
                i32 temp_pos = 0;
                i64 temp_int = int_part;

                while (temp_int > (i64)0)
                {
                    int_temp[temp_pos] = (byte)((temp_int % (i64)10) + (i64)48);
                    temp_int = temp_int / (i64)10;
                    temp_pos++;
                };


                i32 k = temp_pos - 1;
                while (k >= 0)
                {
                    buffer[write_pos] = int_temp[k];
                    write_pos = write_pos + 1;
                    k--;
                };
            };


            if (precision > 0)
            {
                buffer[write_pos] = (byte)46; 
                write_pos = write_pos + 1;


                if (frac_part == (i64)0)
                {
                    i32 m = 0;
                    while (m < precision)
                    {
                        buffer[write_pos] = (byte)48; 
                        write_pos = write_pos + 1;
                        m++;
                    };
                }
                else
                {

                    byte[32] frac_temp;
                    i32 frac_digits = 0;
                    i64 temp_frac = frac_part;

                    while (temp_frac > (i64)0)
                    {
                        frac_temp[frac_digits] = (byte)((temp_frac % (i64)10) + (i64)48);
                        temp_frac = temp_frac / (i64)10;
                        frac_digits++;
                    };


                    i32 leading_zeros = precision - frac_digits;
                    i32 n = 0;
                    while (n < leading_zeros)
                    {
                        buffer[write_pos] = (byte)48; 
                        write_pos = write_pos + 1;
                        n++;
                    };


                    i32 p = frac_digits - 1;
                    while (p >= 0)
                    {
                        buffer[write_pos] = frac_temp[p];
                        write_pos = write_pos + 1;
                        p--;
                    };
                };
            };


            buffer[write_pos] = (byte)0;
            return write_pos;
        };



        namespace helpers
        {
            def is_whitespace(char c) -> bool
            {
                return c == ' ' | c == '\t' | c == '\n' | c == '\r';
            };

            def is_digit(char c) -> bool
            {
                return c >= '0' & c <= '9';
            };

            def is_alpha(char c) -> bool
            {
                return (c >= 'a' & c <= 'z') | (c >= 'A' & c <= 'Z');
            };

            def is_upper(char c) -> bool
            {
                return c >= 'A' & c <= 'Z';
            };

            def is_lower(char c) -> bool
            {
                return c >= 'a' & c <= 'z';
            };

            def is_alnum(char c) -> bool
            {
                return is_alpha(c) | is_digit(c);
            };

            def is_hex_digit(char c) -> bool
            {
                return is_digit(c) | (c >= 'a' & c <= 'f') | (c >= 'A' & c <= 'F');
            };

            def is_identifier_start(char c) -> bool
            {
                return is_alpha(c) | c == '_';
            };

            def is_identifier_char(char c) -> bool
            {
                return is_alnum(c) | c == '_';
            };

            def is_newline(char c) -> bool
            {
                return c == '\n' | c == '\r';
            };




            def to_lower(char c) -> char
            {
                if (c >= 'A' & c <= 'Z')
                {
                    return c + 32;
                };
                return c;
            };

            def to_upper(char c) -> char
            {
                if (c >= 'a' & c <= 'z')
                {
                    return c - 32;
                };
                return c;
            };

            def char_to_digit(char c) -> int
            {
                if (c >= '0' & c <= '9')
                {
                    return c - '0';
                };
                return -1;
            };

            def hex_to_int(char c) -> int
            {
                if (c >= '0' & c <= '9')
                {
                    return c - '0';
                };
                if (c >= 'a' & c <= 'f')
                {
                    return 10 + (c - 'a');
                };
                if (c >= 'A' & c <= 'F')
                {
                    return 10 + (c - 'A');
                };
                return -1;
            };






            def find_char(byte* str, char ch, int start_pos) -> int
            {
                for (int i = start_pos; str[i] != 0; i = i + 1)
                {
                    if (str[i] == ch)
                    {
                        return i;
                    };
                };
                return -1;
            };


            def find_char_last(byte* str, char ch) -> int
            {
                int last = -1;
                for (int i; str[i] != 0; i = i + 1)
                {
                    if (str[i] == ch)
                    {
                        last = i;
                    };
                };
                return last;
            };


            def find_any(byte* str, byte* char_set, int start_pos) -> int
            {
                for (int i = start_pos; str[i] != 0; i = i + 1)
                {
                    for (int j; char_set[j] != 0; j = j + 1)
                    {
                        if (str[i] == char_set[j])
                        {
                            return i;
                        };
                    };
                };
                return -1;
            };



            def find_substring(byte* str, byte* substr, int start_pos) -> int
            {
                int str_len, substr_len;
                bool match;
                while (str[str_len] != 0) { str_len = str_len + 1; };
                while (substr[substr_len] != 0) { substr_len = substr_len + 1; };

                if (substr_len == 0)
                {
                    return start_pos;
                };

                for (int i = start_pos; i <= str_len - substr_len; i = i + 1)
                {
                    match = true;
                    for (int j; j < substr_len; j = j + 1)
                    {
                        if (str[i + j] != substr[j])
                        {
                            match = false;
                            break;
                        };
                    };
                    if (match)
                    {
                        return i;
                    };
                };
                return -1;
            };





            def skip_whitespace(byte* str, int pos) -> int
            {
                while (str[pos] != 0 & is_whitespace(str[pos]))
                {
                    pos = pos + 1;
                };
                return pos;
            };


            def trim_end(byte* str) -> void
            {
                int len = 0;
                while (str[len] != 0) { len = len + 1; };

                while (len > 0 & is_whitespace(str[len - 1]))
                {
                    len = len - 1;
                };
                str[len] = (byte)0;
                return;
            };





            def compare_n(byte* s1, byte* s2, int n) -> int
            {
                for (int i = 0; i < n; i = i + 1)
                {
                    if (s1[i] != s2[i])
                    {
                        return s1[i] - s2[i];
                    };
                    if (s1[i] == 0)
                    {
                        return 0;
                    };
                };
                return 0;
            };


            def compare_ignore_case(byte* s1, byte* s2) -> int
            {
                int i;
                char c1, c2;
                while (s1[i] != 0 & s2[i] != 0)
                {
                    c1 = to_lower(s1[i]);
                    c2 = to_lower(s2[i]);
                    if (c1 != c2)
                    {
                        return c1 - c2;
                    };
                    i = i + 1;
                };
                return to_lower(s1[i]) - to_lower(s2[i]);
            };


            def starts_with(byte* str, byte* prefix) -> bool
            {
                int i;
                while (prefix[i] != 0)
                {
                    if (str[i] != prefix[i])
                    {
                        return false;
                    };
                    i = i + 1;
                };
                return true;
            };


            def ends_with(byte* str, byte* suffix) -> bool
            {
                int str_len, suffix_len;
                while (str[str_len] != 0) { str_len = str_len + 1; };
                while (suffix[suffix_len] != 0) { suffix_len = suffix_len + 1; };

                if (suffix_len > str_len)
                {
                    return false;
                };

                int offset = str_len - suffix_len;
                for (int i = 0; i < suffix_len; i = i + 1)
                {
                    if (str[offset + i] != suffix[i])
                    {
                        return false;
                    };
                };
                return true;
            };
        };


        namespace manip
        {

            def copy_string(byte* src) -> byte*
            {
                int len = 0;
                while (src[len] != 0) { len = len + 1; };

                byte* dest = fmalloc((u64)len + 1);
                if (dest == 0)
                {
                    return (byte*)0;
                };

                for (int i = 0; i <= len; i = i + 1)
                {
                    dest[i] = src[i];
                };

                return dest;
            };


            def copy_n(byte* src, int n) -> byte*
            {
                byte* dest = fmalloc((u64)n + 1);
                if (dest == 0)
                {
                    return (byte*)0;
                };

                for (int i = 0; i < n & src[i] != 0; i = i + 1)
                {
                    dest[i] = src[i];
                };
                dest[n] = (byte)0;

                return dest;
            };


            def substring(byte* str, int start, int length) -> byte*
            {
                byte* result = fmalloc((u64)length + 1);
                if (result == 0)
                {
                    return (byte*)0;
                };

                for (int i = 0; i < length & str[start + i] != 0; i = i + 1)
                {
                    result[i] = (byte)str[start + i];
                };
                result[length] = (byte)0;

                return result;
            };


            def concat(byte* s1, byte* s2) -> byte*
            {
                int len1 = 0;
                while (s1[len1] != 0) { len1 = len1 + 1; };

                int len2 = 0;
                while (s2[len2] != 0) { len2 = len2 + 1; };

                byte* result = fmalloc((u64)len1 + len2 + 1);
                if (result == 0)
                {
                    return (byte*)0;
                };

                for (int i = 0; i < len1; i = i + 1)
                {
                    result[i] = s1[i];
                };
                for (int i = 0; i < len2; i = i + 1)
                {
                    result[len1 + i] = s2[i];
                };
                result[len1 + len2] = (byte)0;

                return result;
            };
        };






        def parse_int(byte* str, int start_pos, int* end_pos) -> int
        {
            int pos = helpers::skip_whitespace(str, start_pos);

            bool negative = false;
            if (str[pos] == '-')
            {
                negative = true;
                pos = pos + 1;
            }
            elif (str[pos] == '+')
            {
                pos = pos + 1;
            };

            int value = 0;
            while (helpers::is_digit(str[pos]))
            {
                value = value * 10 + (str[pos] - '0');
                pos = pos + 1;
            };

            *end_pos = pos;

            if (negative)
            {
                return -value;
            };
            return value;
        };


        def parse_hex(byte* str, int start_pos, int* end_pos) -> int
        {
            int pos = helpers::skip_whitespace(str, start_pos);


            if (str[pos] == '0' & (str[pos + 1] == 'x' | str[pos + 1] == 'X'))
            {
                pos = pos + 2;
            };

            int value, digit;
            while (helpers::is_hex_digit(str[pos]))
            {
                digit = helpers::hex_to_int(str[pos]);
                value = value * 16 + digit;
                pos = pos + 1;
            };

            *end_pos = pos;
            return value;
        };





        def count_lines(byte* str) -> int
        {
            int count;
            for (int i; str[i] != 0; i = i + 1)
            {
                if (str[i] == '\n')
                {
                    count = count + 1;
                };
            };

            if (count > 0 | str[0] != 0)
            {
                count = count + 1;
            };
            return count;
        };




        def get_line(byte* str, int line_num) -> byte*
        {
            int current_line = 0;
            int line_start = 0;


            for (int i = 0; str[i] != 0; i = i + 1)
            {
                if (current_line == line_num)
                {
                    line_start = i;
                    break;
                };
                if (str[i] == '\n')
                {
                    current_line = current_line + 1;
                };
            };

            if (current_line != line_num)
            {
                return (byte*)0; 
            };


            int line_end = line_start;
            while (str[line_end] != 0 & str[line_end] != '\n')
            {
                line_end = line_end + 1;
            };


            int line_len = line_end - line_start;
            return manip::substring(str, line_start, line_len);
        };


        def count_words(byte* str) -> int
        {
            int count = 0;
            bool in_word = false;

            for (int i = 0; str[i] != 0; i = i + 1)
            {
                if (helpers::is_whitespace(str[i]))
                {
                    in_word = false;
                }
                elif (!in_word)
                {
                    in_word = true;
                    count = count + 1;
                };
            };

            return count;
        };






        def replace_first(byte* str, byte* find, byte* replace) -> byte*
        {
            int pos = helpers::find_substring(str, find, 0);
            if (pos == -1)
            {
                return manip::copy_string(str);
            };

            int str_len = 0;
            while (str[str_len] != 0) { str_len = str_len + 1; };

            int find_len = 0;
            while (find[find_len] != 0) { find_len = find_len + 1; };

            int replace_len = 0;
            while (replace[replace_len] != 0) { replace_len = replace_len + 1; };

            int new_len = str_len - find_len + replace_len;
            byte* result = fmalloc((u64)new_len + 1);
            if (result == 0)
            {
                return (byte*)0;
            };


            for (int i = 0; i < pos; i = i + 1)
            {
                result[i] = str[i];
            };


            for (int i = 0; i < replace_len; i = i + 1)
            {
                result[pos + i] = replace[i];
            };


            for (int i = pos + find_len; i <= str_len; i = i + 1)
            {
                result[i - find_len + replace_len] = str[i];
            };

            return result;
        };



        namespace tokenization
        {

            def skip_until(byte* str, int pos, char ch) -> int
            {
                while (str[pos] != 0 & str[pos] != ch)
                {
                    pos = pos + 1;
                };
                return pos;
            };


            def skip_while_digit(byte* str, int pos) -> int
            {
                while (str[pos] != 0 & helpers::is_digit(str[pos]))
                {
                    pos = pos + 1;
                };
                return pos;
            };

            def skip_while_alnum(byte* str, int pos) -> int
            {
                while (str[pos] != 0 & helpers::is_alnum(str[pos]))
                {
                    pos = pos + 1;
                };
                return pos;
            };

            def skip_while_identifier(byte* str, int pos) -> int
            {
                while (str[pos] != 0 & helpers::is_identifier_char(str[pos]))
                {
                    pos = pos + 1;
                };
                return pos;
            };


            def match_at(byte* str, int pos, byte* pattern) -> bool
            {
                int i = 0;
                while (pattern[i] != 0)
                {
                    if (str[pos + i] != pattern[i])
                    {
                        return false;
                    };
                    i = i + 1;
                };
                return true;
            };
        };





        def fstr_append(i16 value, byte* buf, int* pos) -> int
        {
            byte[8] tmp;
            int n = (int)i16str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(i32 value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = i32str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(i64 value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = (int)i64str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(u16 value, byte* buf, int* pos) -> int
        {
            byte[8] tmp;
            int n = (int)u16str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(u32 value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = (int)u32str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(u64 value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = (int)u64str(value, @tmp[0]);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(float value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = float2str(value, @tmp[0], 6);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(double value, byte* buf, int* pos) -> int
        {
            byte[32] tmp;
            int n = dbl2str(value, @tmp[0], 14);
            int i;
            while (i < n) { buf[*pos] = tmp[i]; *pos = *pos + 1; i++; };
            return n;
        };

        def fstr_append(byte* value, byte* buf, int* pos) -> int
        {
            int i;
            while (value[i] != 0) { buf[*pos] = value[i]; *pos = *pos + 1; i++; };
            return i;
        };
    };
};

def find_last_substring(byte* str, byte* substr) -> int
{
    if (str == 0 | substr == 0)
    {
        return -1;
    };

    int str_len = standard::strings::strlen(str);
    int sub_len = standard::strings::strlen(substr);

    if (sub_len == 0)
    {
        return str_len;  
    };

    if (sub_len > str_len)
    {
        return -1;
    };


    bool found = true;
    for (int i = str_len - sub_len; i >= 0; i = i - 1)
    {
        found = true;


        for (int j = 0; j < sub_len; j = j + 1)
        {
            if (str[i + j] != substr[j])
            {
                found = false;
                break;
            };
        };

        if (found)
        {
            return i;
        };
    };

    return -1;
};

def find_last_char(byte* str, char ch) -> int
{
    if (str == 0)
    {
        return -1;
    };

    int len = standard::strings::strlen(str);


    for (int i = len - 1; i >= 0; i = i - 1)
    {
        if ((char)str[i] == ch)
        {
            return i;
        };
    };

    return -1;
};

def count_substring(byte* str, byte* substr) -> int
{
    if (str == 0 | substr == 0)
    {
        return 0;
    };

    int str_len = standard::strings::strlen(str);
    int sub_len = standard::strings::strlen(substr);

    if (sub_len == 0 | sub_len > str_len)
    {
        return 0;
    };

    int count = 0;
    int pos = 0;

    bool found = true;
    while (pos <= str_len - sub_len)
    {
        found = true;

        for (int j = 0; j < sub_len; j = j + 1)
        {
            if (str[pos + j] != substr[j])
            {
                found = false;
                break;
            };
        };

        if (found)
        {
            count = count + 1;
            pos = pos + sub_len;  
        }
        else
        {
            pos = pos + 1;  
        };
    };

    return count;
};

def !!strstr(byte* haystack, byte* needle) -> byte*
{

    if (haystack == 0 | needle == 0)
    {
        return (byte*)0;
    };


    if (needle[0] == 0)
    {
        return haystack;
    };


    byte first_char = needle[0];


    int needle_len = 0;
    while (needle[needle_len] != 0)
    {
        needle_len = needle_len + 1;
    };


    if (needle_len == 1)
    {
        for (int i; haystack[i] != 0; i = i + 1)
        {
            if (haystack[i] == first_char)
            {
                return haystack + i;
            };
        };
        return (byte*)0;
    };


    int h;
    bool match = true;
    while (haystack[h] != 0)
    {

        if (haystack[h] == first_char)
        {

            match = true;            
            for (int n = 1; n < needle_len; n = n + 1)
            {
                if (haystack[h + n] == 0)
                {

                    return (byte*)0;
                };

                if (haystack[h + n] != needle[n])
                {
                    match = false;
                    break;
                };
            };

            if (match)
            {
                return haystack + h;
            };
        };

        h = h + 1;
    };

    return (byte*)0;
};
































extern
{
    def !!
        QueryPerformanceCounter(i64*) -> bool,
        QueryPerformanceFrequency(i64*) -> bool,
        GetTickCount() -> u32,
        Sleep(u32) -> void;
};





















struct timespec
{
    i64 tv_sec, tv_nsec;
};



namespace standard
{
    namespace time
    {


        global const i64 TIME_NS_PER_US  = 1000,
                         TIME_NS_PER_MS  = 1000000,
                         TIME_NS_PER_SEC = 1000000000;





        def win_time_now() -> i64,
            win_sleep_ms(u32) -> void,
            win_sleep_us(u32) -> void;

















        def win_time_now() -> i64
        {
            i64 counter, freq;
            QueryPerformanceCounter(@counter);
            QueryPerformanceFrequency(@freq);
            if (freq == 0)
            {
                return 0;
            };
            return (counter / freq) * TIME_NS_PER_SEC
                 + ((counter % freq) * TIME_NS_PER_SEC) / freq;
        };

        def win_sleep_ms(u32 ms) -> void
        {
            Sleep(ms);
        };

        def win_sleep_us(u32 us) -> void
        {

            u32 ms = (us + 999) / 1000;
            if (ms == 0)
            {
                ms = 1;
            };
            Sleep(ms);
        };



























































        def time_now() -> i64
        {
            switch (1)
            {


                case (1)
                {
                    return win_time_now();
                }












                default { return (i64)0; };
            };
            return 0;
        };

        def sleep_ms(u32 ms) -> void
        {
            switch (1)
            {


                case (1)
                {
                    win_sleep_ms(ms);
                }












                default {};
            };
        };

        def sleep_us(u32 us) -> void
        {
            switch (1)
            {


                case (1)
                {
                    win_sleep_us(us);
                }












                default {};
            };
        };



        def ns_to_us(i64 ns) -> i64
        {
            return ns / TIME_NS_PER_US;
        };

        def ns_to_ms(i64 ns) -> i64
        {
            return ns / TIME_NS_PER_MS;
        };

        def ns_to_sec(i64 ns) -> i64
        {
            return ns / TIME_NS_PER_SEC;
        };

        def us_to_ns(i64 us) -> i64
        {
            return us * TIME_NS_PER_US;
        };

        def ms_to_ns(i64 ms) -> i64
        {
            return ms * TIME_NS_PER_MS;
        };

        def sec_to_ns(i64 s) -> i64
        {
            return s * TIME_NS_PER_SEC;
        };



        struct Timer
        {
            i64 start, stop;
            bool running;
        };

        def timer_start(Timer* t) -> void
        {
            t.start   = time_now();
            t.stop    = 0;
            t.running = true;
        };


        def timer_stop(Timer* t) -> i64
        {
            t.stop    = time_now();
            t.running = false;
            return t.stop - t.start;
        };


        def timer_read(Timer* t) -> i64
        {
            if (t.running)
            {
                return time_now() - t.start;
            };
            return t.stop - t.start;
        };

        def timer_reset(Timer* t) -> void
        {
            t.start   = 0;
            t.stop    = 0;
            t.running = false;
        };

    };  
};  


























extern
{
    def !!
        fgets(byte* str, int n, byte* stream) -> byte*,
        fopen(byte* filename, byte* mode) -> byte*,
        fclose(byte* stream) -> int;
};


namespace standard
{
    namespace io
    {

        namespace console
        {



            def win_input(byte[] buffer, int max_len) -> int # effect {~IO.Console.Input};







            def input(byte[] buffer, int max_len) -> int # effect {~IO.Console.Input};





            def win_print(byte* msg, int x) -> void # effect {~IO.Console.Output};







            def print() -> void # effect {~IO.Console}, 
                print(noopstr, int) -> void # effect {~IO.Console.Output},
                print(noopstr) -> void # effect {~IO.Console.Output},
                print(bool) -> void # effect {~IO.Console.Output},
                printchar(noopstr) -> void # effect {~IO.Console.Output},
                print(char) -> void # effect {~IO.Console.Output},
                print(byte) -> void # effect {~IO.Console.Output},
                print(i8) -> void # effect {~IO.Console.Output},
                print(i16) -> void # effect {~IO.Console.Output},
                print(u16) -> void # effect {~IO.Console.Output},
                print(int) -> void # effect {~IO.Console.Output},
                print(i32) -> void # effect {~IO.Console.Output}, 
                print(uint) -> void # effect {~IO.Console.Output},
                print(u32) -> void # effect {~IO.Console.Output},
                print_hex_byte(byte) -> void # effect {~IO.Console.Output},
                print_hex_u32(u32) -> void # effect {~IO.Console.Output},
                print(i64) -> void # effect {~IO.Console.Output},
                print(u64) -> void # effect {~IO.Console.Output},
                print(long) -> void # effect {~IO.Console.Output},
                print(ulong) -> void # effect {~IO.Console.Output},
                print(float) -> void # effect {~IO.Console.Output},
                print(float,int) -> void # effect {~IO.Console.Output},
                print(double) -> void # effect {~IO.Console.Output},
                print(double,int) -> void # effect {~IO.Console.Output},
                println(noopstr) -> void # effect {~IO.Console.Output},   
                println(byte) -> void # effect {~IO.Console.Output},
                println(char) -> void # effect {~IO.Console.Output},
                println(bool) -> void # effect {~IO.Console.Output},
                println(i8) -> void # effect {~IO.Console.Output},
                println(i16) -> void # effect {~IO.Console.Output},
                println(u16) -> void # effect {~IO.Console.Output},
                println(int) -> void # effect {~IO.Console.Output},
                println(uint) -> void # effect {~IO.Console.Output},
                printhbline(byte) -> void # effect {~IO.Console.Output},
                println(long) -> void # effect {~IO.Console.Output},
                println(ulong) -> void # effect {~IO.Console.Output},
                println(float) -> void # effect {~IO.Console.Output},
                println(float,int) -> void # effect {~IO.Console.Output},
                println(double) -> void # effect {~IO.Console.Output},
                println(double,int) -> void # effect {~IO.Console.Output};




            def win_input(byte[] buf, int max_len) -> int
            {
                i32 bytes_read, original_mode;
                i32* bytes_read_ptr = @bytes_read,
                     mode_ptr = @original_mode;



                volatile asm
                {

                    movq $$-10, %rcx
                    subq $$32, %rsp
                    call GetStdHandle
                    addq $$32, %rsp
                    movq %rax, %r12


                    movq %rax, %rcx
                    movq $3, %rdx
                    subq $$32, %rsp
                    call GetConsoleMode
                    addq $$32, %rsp




                    movq %r12, %rcx
                    movq $$0x001F, %rdx
                    subq $$32, %rsp
                    call SetConsoleMode
                    addq $$32, %rsp


                    movq %r12, %rcx
                    movq $0, %rdx           
                    movl $1, %r8d           
                    movq $2, %r9            
                    subq $$40, %rsp
                    movq $$0, 32(%rsp)
                    call ReadFile
                    addq $$40, %rsp


                    movq %r12, %rcx
                    movl ($3), %edx
                    subq $$32, %rsp
                    call SetConsoleMode
                    addq $$32, %rsp


                    movl ($2), %eax
                } : : "r"(buf), "r"(max_len), "r"(bytes_read_ptr), "r"(mode_ptr)
                  : "rax","rcx","rdx","r8","r9","r10","r11","r12","memory";


                for (int i; i < bytes_read; i++)
                {
                    if (buf[i] == '\r' | buf[i] == '\n')
                    {
                        buf[i] = 0;
                    };
                };
                return bytes_read;
            };



























































































































            def input(byte[] buffer, int max_len) -> int
            {


                return win_input(buffer, max_len);






            };





            def win_print(byte* msg, int x) -> void
            {


                volatile asm
                {

                    movq $2, %rcx           
                    movq $0, %rdx           
                    movl $1, %r8d           
                    xorq %r9, %r9           
                    subq $$40, %rsp         
                    movq %r9, 32(%rsp)      
                    call WriteFile
                    addq $$40, %rsp
                } : : "r"(msg), "r"(x), "r"(WIN_STDOUT_HANDLE)
                    : "rax","rcx","rdx","r8","r9","r10","r11","memory";
































                return;
            };

            def reset_from_input() -> void
            {
                char bs = 8;
                win_print(@bs,1);
                win_print(@bs,1);
                return;
            };































































































    		def print(noopstr s, int len) -> void
    		{


                win_print(@s, len);






    			(void)s;
    			return;
    		};

            def print(noopstr s) -> void
            {
                int len = standard::strings::strlen(@s);



                win_print(@s, len);






                (void)s;
                return;
            };

            def print(bool b) -> void
            {
                if (b) { print("True\0"); } else { print("False\0"); };
            };
            def print(i8 s) -> void
            {
                print(byte(s));
            };
            def print(byte s) -> void
            {
                byte[2] x = [s, 0];
                print(x);
                return;
            };
            def print(char s) -> void
            {
                char[2] x = [s, 0];
                print(x);
                return;
            };
            def print(int x) -> void
            {
                byte[21] buf;
                standard::strings::i32str(x,buf);
                print(buf);
                return;
            };
            def print(i16 x) -> void
            {
                byte[21] buf;
                standard::strings::i16str(x,buf);
                print(buf);
                return;
            };
            def print(u16 x) -> void
            {
                byte[21] buf;
                standard::strings::u16str(x,buf);
                print(buf);
                return;
            };
            def print(i32 x) -> void
            {
                byte[21] buf;
                standard::strings::i32str(x,buf);
                print(buf);
                return;
            };
            def print(u32 x) -> void
            {
                byte[21] buf;
                standard::strings::u32str(x,buf);
                print(buf);
                return;
            };
            def print(i64 x) -> void
            {
                byte[21] buf;
                standard::strings::i64str(x,buf);
                print(buf);
                return;
            };
            def print(u64 x) -> void
            {
                byte[21] buf;
                standard::strings::u64str(x,buf);
                print(buf);
                return;
            };
            def print(long x) -> void
            {
                print((i64)x);
                return;
            };
            def print(ulong x) -> void
            {
                print((u64)x);
                return;
            };
            def print(float x) -> void
            {
                byte[256] buffer;
                standard::strings::float2str(x, @buffer, 5);
                print(buffer);
                return;
            };
            def print(float x, int y) -> void
            {
                byte[256] buffer;
                if (y > 5) { y = 5; };
                standard::strings::float2str(x, @buffer, y);
                print(buffer);
                return;
            };
            def print(double x) -> void
            {
                byte[256] buffer;
                standard::strings::dbl2str(x, @buffer, 14);
                print(buffer);
                return;
            };
            def print(double x, int y) -> void
            {
                byte[256] buffer;
                if (y > 14) { y = 14; };
                standard::strings::dbl2str(x, @buffer, y);
                print(buffer);
                return;
            };

            def println(noopstr s) -> void
            {
                standard::io::console::print(s);
                standard::io::console::print();
            };
            def println(byte s) -> void
            {
                standard::io::console::print(s);
                standard::io::console::print();
            };
            def println(char s) -> void
            {
                standard::io::console::print(s);
                standard::io::console::print();
            };
            def println(bool x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(i8 x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(i16 x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(u16 x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(int x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(i32 x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(uint x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(u32 x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def printhbline(byte s) -> void
            {
                standard::io::console::print(s);
                standard::io::console::print();
            };
            def println(long x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(ulong x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(float x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(float x, int y) -> void
            {
                standard::io::console::print(x, y);
                standard::io::console::print();
            };
            def println(double x) -> void
            {
                standard::io::console::print(x);
                standard::io::console::print();
            };
            def println(double x, int y) -> void
            {
                standard::io::console::print(x, y);
                standard::io::console::print();
            };

            def print_hex_byte(byte b) -> void
            {
                byte high = (b >> 4) & 0x0F;
                if (high < 10)
                {
                    print((byte)('0' + high));
                }
                else
                {
                    print((byte)('a' + (high - 10)));
                };

                byte low = b & 0x0F;
                if (low < 10)
                {
                    print((byte)('0' + low));
                }
                else
                {
                    print((byte)('a' + (low - 10)));
                };
                return;
            };
            def print_hex(u32 value) -> void
            {

                byte b;
                b = (byte)((value >> 24) & 0xFF);
                print_hex_byte(b);
                b = (byte)((value >> 16) & 0xFF);
                print_hex_byte(b);
                b = (byte)((value >> 8) & 0xFF);
                print_hex_byte(b);
                b = (byte)(value & 0xFF);
                print_hex_byte(b);
                return;
            };

            def print_hex(byte* buf, int len) -> void
            {
                int i;
                byte hi, lo;
                for (i = 0; i < len; i++)
                {
                    hi = (buf[i] >> 4) & (byte)0x0F;
                    lo = buf[i] & (byte)0x0F;
                    if (hi < (byte)10) { print('0' + hi); } else { print('A' + (hi - (byte)10)); };
                    if (lo < (byte)10) { print('0' + lo); } else { print('A' + (lo - (byte)10)); };
                };
            };


            def print() -> void
            {


                win_print("\r\n", 2);






                return;
            };
        };      



        namespace file
        {



























            def win_open(byte* path, u32 access, u32 share, u32 disposition, u32 attributes) -> i64;
            def win_read(i64 handle, byte* buffer, u32 bytes_to_read) -> i32;
            def win_write(i64 handle, byte* buffer, u32 bytes_to_write) -> i32;
            def win_close(i64 handle) -> i32;





            def win_open(byte* path, u32 access, u32 share, u32 disposition, u32 attributes) -> i64
            {
                i64 handle = -1;

                volatile asm
                {

                    movq $0, %rcx           


                    movl $1, %edx           


                    movl $2, %r8d           


                    xorq %r9, %r9           


                    subq $$56, %rsp


                    movl $3, %eax           
                    movl %eax, 32(%rsp)     


                    movl $4, %eax           
                    movl %eax, 40(%rsp)     


                    xorq %rax, %rax
                    movq %rax, 48(%rsp)     


                    call CreateFileA


                    movq %rax, $5           


                    addq $$56, %rsp
                } : : "r"(path), "r"(access), "r"(share), "r"(disposition), "r"(attributes), "m"(handle)
                  : "rax","rcx","rdx","r8","r9","r10","r11","memory";

                return handle;
            };



            def win_read(i64 handle, byte* buffer, u32 bytes_to_read) -> i32
            {
                u32 bytes_read = 0;
                u32* bytes_read_ptr = @bytes_read;
                i32 success = 0;

                volatile asm
                {

                    movq $0, %rcx           


                    movq $1, %rdx           


                    movl $2, %r8d           


                    movq $3, %r9            


                    subq $$40, %rsp


                    xorq %rax, %rax
                    movq %rax, 32(%rsp)     


                    call ReadFile


                    movl %eax, $4           


                    addq $$40, %rsp
                } : : "r"(handle), "r"(buffer), "r"(bytes_to_read), "r"(bytes_read_ptr), "m"(success)
                  : "rax","rcx","rdx","r8","r9","r10","r11","memory";

                if (success == 0)
                {
                    return -1;
                };

                return (i32)bytes_read;
            };



            def win_write(i64 handle, byte* buffer, u32 bytes_to_write) -> i32
            {
                u32 bytes_written = 0;
                u32* bytes_written_ptr = @bytes_written;
                i32 success = 0;

                volatile asm
                {

                    movq $0, %rcx           


                    movq $1, %rdx           


                    movl $2, %r8d           


                    movq $3, %r9            


                    subq $$40, %rsp


                    xorq %rax, %rax
                    movq %rax, 32(%rsp)     


                    call WriteFile


                    movl %eax, $4           


                    addq $$40, %rsp
                } : : "r"(handle), "r"(buffer), "r"(bytes_to_write), "r"(bytes_written_ptr), "m"(success)
                  : "rax","rcx","rdx","r8","r9","r10","r11","memory";

                if (success == 0)
                {
                    return -1;
                };

                return (i32)bytes_written;
            };



            def win_close(i64 handle) -> i32
            {
                i32 result = 0;

                volatile asm
                {

                    movq $0, %rcx           


                    subq $$32, %rsp


                    call CloseHandle


                    movl %eax, $1           


                    addq $$32, %rsp
                } : : "r"(handle), "m"(result)
                  : "rax","rcx","rdx","r8","r9","r10","r11","memory";

                return result;
            };




            def open_read(byte* path) -> i64
            {
                return win_open(path, (i32)0x80000000, (i32)0x00000001, (i32)3, (i32)0x80);
            };


            def open_write(byte* path) -> i64
            {
                return win_open(path, (i32)0x40000000, (i32)0, (i32)2, (i32)0x80);
            };


            def open_append(byte* path) -> i64
            {
                return win_open(path, (i32)0x40000000, (i32)0x00000001, (i32)4, (i32)0x80);
            };


            def open_read_write(byte* path) -> i64
            {
                return win_open(path, (i32)0xC0000000, (i32)0x00000001, (i32)4, (i32)0x80);
            };













        };
    };
};


























namespace standard
{
    namespace io
    {
        namespace file
        {
            extern
            {

                def !!
                    fopen(byte*, byte*) -> void*,
                    fclose(void*) -> int,
                    fread(void*, int, int, void*) -> int,
                    fwrite(void*, int, int, void*) -> int,
                    fgets(byte*, int, void*) -> void*,
                    sscanf(byte*, byte*, void*, void*, void*) -> int,
                    fseek(void*, int, int) -> int,
                    ftell(void*) -> int,
                    rewind(void*) -> void,
                    feof(void*) -> int,
                    ferror(void*) -> int;
            };













            global int SEEK_SET = 0,  
                       SEEK_CUR = 1,  
                       SEEK_END = 2;  






            def read_file(byte* filename, byte[] buffer, int buffer_size) -> int
            {
                void* file = fopen(filename, "rb\0");
                if (file == 0)
                {
                    return -1;
                };


                fseek(file, 0, 2);
                int file_size = ftell(file);
                rewind(file);


                int bytes_to_read = file_size;
                if (bytes_to_read > buffer_size)
                {
                    bytes_to_read = buffer_size;
                };

                int bytes_read = fread(buffer, 1, bytes_to_read, file);
                fclose(file);

                return bytes_read;
            };



            def write_file(byte* filename, byte[] xd, int data_size) -> int
            {
                void* file = fopen(filename, "wb\0");
                if (file == 0)
                {
                    return -1;
                };

                int bytes_written = fwrite(xd, 1, data_size, file);
                fclose(file);

                return bytes_written;
            };



            def append_file(byte* filename, byte[] xd, int data_size) -> int
            {
                void* file = fopen(filename, "ab\0");
                if (file == 0)
                {
                    return -1;
                };

                int bytes_written = fwrite(xd, 1, data_size, file);
                fclose(file);

                return bytes_written;
            };



            def get_file_size(byte* filename) -> int
            {
                void* file = fopen(filename, "rb\0");
                if (file == 0)
                {
                    return -1;
                };

                fseek(file, 0, 2);
                int size = ftell(file);
                fclose(file);

                return size;
            };



            def file_exists(byte* filename) -> bool
            {
                void* file = fopen(filename, "rb\0");
                if (file == 0)
                {
                    return 0;
                };

                fclose(file);
                return 1;
            };
        };
    };
};



















namespace standard
{
    namespace strings
    {
        trait BaseSTDStringTraits
        {
            def val() -> byte*,
                len() -> int,
                set(byte*) -> bool,
                clear() -> void,
                isempty() -> bool,


                equals(byte*) -> bool,
                compare(byte*) -> int,
                icompare(byte*) -> int,


                contains(byte*) -> bool,
                startswith(byte*) -> bool,
                endswith(byte*) -> bool,
                indexof(byte*) -> int,
                lastindexof(byte*) -> int,
                indexof_char(char) -> int,
                lastindexof_char(char) -> int,
                count_occurrences(byte*) -> int,
                count_spaces() -> int, 
                count_lines() -> int, 


                charat(int) -> char,
                setat(int, char) -> bool,


                substring(int, int) -> byte*,
                left(int) -> byte*,
                right(int) -> byte*,


                concat(byte*) -> byte*,
                append(byte*) -> bool,
                prepend(byte*) -> bool,


                replace(byte*, byte*) -> byte*,
                replace_all(byte*, byte*) -> byte*,
                replace_char(char, char) -> bool,
                insert(int, byte*) -> bool,
                remove(int, int) -> bool,


                toupper() -> bool,
                tolower() -> bool,
                totitle() -> bool,


                trim() -> bool,
                trimstart() -> bool,
                trimend() -> bool,
                trim_char(char) -> bool,


                split(char) -> byte**,
                split_lines() -> byte**,
                split_words() -> byte**,


                isalpha() -> bool,
                isdigit() -> bool,
                isalnum() -> bool,
                isupper() -> bool,
                islower() -> bool,


                toint() -> int,
                toi32() -> i32,
                toi64() -> i64,
                tou32() -> u32,
                tou64() -> u64,
                fromint(int) -> bool,


                count_lines() -> int,
                get_line(int) -> byte*,
                count_words() -> int,


                reverse() -> bool,
                copy() -> byte*,
                hash() -> int,
                printval() -> void,
                println() -> void;
        };

        BaseSTDStringTraits       
        object string             
        {
            noopstr value;
            byte** lines;
            int length, line_count;


            def __init(byte* x) -> this
            {
                this.value = x;
                this.length = strings::strlen(x);
                return this;
            };

            def __init(byte* x, int len) -> this
            {
                this.value = x;
                this.length = len;
                this.lines = this.split_lines();
                this.line_count = this.count_lines();
                return this;
            };

            def __exit() -> void
            {
                return;
            };

            def __expr() -> byte*
            {
                return this.value;
            };

            def val() -> byte*
            {
                return this.value;
            };

            def len() -> int
            {
                return strings::strlen(this.value);
            };

            def set(byte* s) -> bool
            {
                try
                {
                    this.value = s;
                    this.length = (i32)strings::strlen(s); 
                    return true;
                }
                catch()
                {
                    return false;
                };
                return false;
            };

            def clear() -> void
            {
                this.value[0] = (byte)0;
                this.length = 0;
            };

            def isempty() -> bool
            {
                return this.length == 0;
            };


            def equals(byte* s) -> bool
            {

                return strcmp(s, this.value) == 0;
            };

            def compare(byte* s) -> int
            {
                return strcmp(this.value, s);
            };

            def icompare(byte* s) -> int
            {

                return helpers::compare_ignore_case(this.value, s);
            };


            def contains(byte* substr) -> bool
            {
                return (substr in this.value);

            };

            def startswith(byte* prefix) -> bool
            {
                return helpers::starts_with(this.value, prefix);
            };

            def endswith(byte* suffix) -> bool
            {
                return helpers::ends_with(this.value, suffix);
            };

            def indexof(byte* substr) -> int
            {
                return helpers::find_substring(this.value, substr, 0);
            };

            def lastindexof(byte* substr) -> int
            {
                return find_last_substring(this.value, substr);
            };

            def indexof_char(char ch) -> int
            {
                return helpers::find_char(this.value, ch, 0);
            };

            def lastindexof_char(char ch) -> int
            {
                return find_last_char(this.value, ch);
            };

            def count_occurrences(byte* substr) -> int
            {
                return count_substring(this.value, substr);
            };

            def count_spaces() -> int
            {
                return this.count_occurrences(" \0");
            };

            def count_lines() -> int
            {
                return this.count_occurrences("\n\0");
            };


            def charat(int index) -> char
            {
                if (index < 0 | index >= this.length)
                {
                    return 0;
                };
                return (char)this.value[index];
            };

            def setat(int index, char ch) -> bool
            {
                if (index < 0 | index >= this.length)
                {
                    return false;
                };
                this.value[index] = (byte)ch;
                return true;
            };


            def substring(int start, int length) -> byte*
            {
                if (start < 0 | start >= this.length)
                {
                    return (byte*)0;
                };
                if (length < 0 | start + length > this.length)
                {
                    length = this.length - start;
                };
                return manip::copy_n(this.value + start, length);
            };

            def left(int n) -> byte*
            {
                if (n < 0)
                {
                    return (byte*)0;
                };
                if (n > this.length)
                {
                    n = this.length;
                };
                return manip::copy_n(this.value, n);
            };

            def right(int n) -> byte*
            {
                if (n < 0)
                {
                    return (byte*)0;
                };
                if (n > this.length)
                {
                    n = this.length;
                };
                return manip::copy_n(this.value + (this.length - n), n);
            };


            def concat(byte* s) -> byte*
            {
                return manip::concat(this.value, s);
            };

            def append(byte* s) -> bool
            {
                try
                {
                    byte* newval = manip::concat(this.value, s);
                    if (newval == 0)
                    {
                        return false;
                    };
                    this.value = newval;
                    this.length = strings::strlen(newval);
                    return true;
                }
                catch()
                {
                    return false;
                };
                return false;
            };

            def prepend(byte* s) -> bool
            {
                try
                {
                    byte* newval = manip::concat(s, this.value);
                    if (newval == 0)
                    {
                        return false;
                    };
                    this.value = newval;
                    this.length = strings::strlen(newval);
                    return true;
                }
                catch()
                {
                    return false;
                };
                return false;
            };


            def replace(byte* find, byte* replace) -> byte*
            {
                return replace_first(this.value, find, replace);
            };

            def replace_all(byte* find, byte* replace) -> byte*
            {

                byte* result = manip::copy_string(this.value),
                      temp;
                int pos;
                if (result == 0)
                {
                    return (byte*)0;
                };

                int find_len = strings::strlen(find);
                if (find_len == 0)
                {
                    return result;
                };

                while (true)
                {
                    pos = helpers::find_substring(result, find, 0);
                    if (pos == -1)
                    {
                        break;
                    };

                    temp = replace_first(result, find, replace);
                    ffree(long(result));
                    result = temp;

                    if (result == 0)
                    {
                        return (byte*)0;
                    };
                };

                return result;
            };

            def replace_char(char oldch, char newch) -> bool
            {
                for (int i; i < this.length; i = i + 1)
                {
                    if ((char)this.value[i] == oldch)
                    {
                        this.value[i] = (byte)newch;
                    };
                };
                return true;
            };

            def insert(int pos, byte* s) -> bool
            {
                if (pos < 0 | pos > this.length)
                {
                    return false;
                };

                byte* before = manip::copy_n(this.value, pos),
                      after = manip::copy_string(this.value + pos);

                if (before == 0 | after == 0)
                {
                    if (before != 0) { ffree(long(before)); };
                    if (after != 0) { ffree(long(after)); };
                    return false;
                };

                byte* temp = manip::concat(before, s);
                ffree(long(before));

                if (temp == 0)
                {
                    ffree(long(after));
                    return false;
                };

                byte* result = manip::concat(temp, after);
                ffree(long(temp));
                ffree(long(after));

                if (result == 0)
                {
                    return false;
                };

                this.value = result;
                this.length = (i32)strings::strlen(result);
                return true;
            };

            def remove(int start, int length) -> bool
            {
                if (start < 0 | start >= this.length)
                {
                    return false;
                };
                if (length < 0)
                {
                    return false;
                };
                if (start + length > this.length)
                {
                    length = this.length - start;
                };

                byte* before = manip::copy_n(this.value, start),
                      after = manip::copy_string(this.value + start + length);

                if (before == 0 | after == 0)
                {
                    if (before != 0) { ffree(long(before)); };
                    if (after != 0) { ffree(long(after)); };
                    return false;
                };

                byte* result = manip::concat(before, after);
                ffree(long(before));
                ffree(long(after));

                if (result == 0)
                {
                    return false;
                };

                this.value = result;
                this.length = strings::strlen(result);
                return true;
            };


            def toupper() -> bool
            {
                for (int i; i < this.length; i = i + 1)
                {
                    this.value[i] = helpers::to_upper(this.value[i]);
                };
                return true;
            };

            def tolower() -> bool
            {
                for (int i = 0; i < this.length; i = i + 1)
                {
                    this.value[i] = helpers::to_lower(this.value[i]);
                };
                return true;
            };

            def totitle() -> bool
            {

                bool at_word_start = true;
                char ch;
                for (int i; i < this.length; i = i + 1)
                {
                    ch = this.value[i];
                    if (helpers::is_whitespace(ch))
                    {
                        at_word_start = true;
                    }
                    elif (at_word_start)
                    {
                        this.value[i] = helpers::to_upper(ch);
                        at_word_start = false;
                    }
                    else
                    {
                        this.value[i] = helpers::to_lower(ch);
                    };
                };
                return true;
            };


            def trim() -> bool
            {
                int start, end, newlen;
                while (start < this.length & helpers::is_whitespace(this.value[start]))
                {
                    start = start + 1;
                };

                end = this.length - 1;
                while (end >= start & helpers::is_whitespace(this.value[end]))
                {
                    end = end - 1;
                };

                newlen = end - start + 1;
                if (newlen <= 0)
                {
                    this.clear();
                    return true;
                };

                byte* result = manip::copy_n(this.value + start, newlen);
                if (result == 0)
                {
                    return false;
                };

                this.value = result;
                this.length = newlen;
                return true;
            };

            def trimstart() -> bool
            {
                int start;
                while (start < this.length & helpers::is_whitespace((char)this.value[start]))
                {
                    start = start + 1;
                };

                if (start == 0)
                {
                    return true;
                };

                byte* result = manip::copy_string(this.value + start);
                if (result == 0)
                {
                    return false;
                };

                this.value = result;
                this.length = (i32)strings::strlen(result);
                return true;
            };

            def trimend() -> bool
            {
                int end = this.length - 1;
                while (end >= 0 & helpers::is_whitespace((char)this.value[end]))
                {
                    end = end - 1;
                };

                if (end == this.length - 1)
                {
                    return true;
                };

                this.value[end + 1] = (byte)0;
                this.length = end + 1;
                return true;
            };

            def trim_char(char ch) -> bool
            {
                int start, end, newlen;
                while (start < this.length & (char)this.value[start] == ch)
                {
                    start = start + 1;
                };

                end = this.length - 1;
                while (end >= start & (char)this.value[end] == ch)
                {
                    end = end - 1;
                };

                newlen = end - start + 1;
                if (newlen <= 0)
                {
                    this.clear();
                    return true;
                };

                byte* result = manip::copy_n(this.value + start, newlen);
                if (result == 0)
                {
                    return false;
                };

                this.value = result;
                this.length = newlen;
                return true;
            };


            def isalpha() -> bool
            {
                if (this.length == 0)
                {
                    return false;
                };
                for (int i; i < this.length; i = i + 1)
                {
                    if (!helpers::is_alpha((char)this.value[i]))
                    {
                        return false;
                    };
                };
                return true;
            };

            def isdigit() -> bool
            {
                if (this.length == 0)
                {
                    return false;
                };
                for (int i; i < this.length; i = i + 1)
                {
                    if (!helpers::is_digit((char)this.value[i]))
                    {
                        return false;
                    };
                };
                return true;
            };

            def isalnum() -> bool
            {
                if (this.length == 0)
                {
                    return false;
                };
                for (int i; i < this.length; i = i + 1)
                {
                    if (!helpers::is_alnum((char)this.value[i]))
                    {
                        return false;
                    };
                };
                return true;
            };

            def isupper() -> bool
            {
                if (this.length == 0)
                {
                    return false;
                };
                bool has_alpha;
                char ch;
                for (int i; i < this.length; i = i + 1)
                {
                    ch = this.value[i];
                    if (helpers::is_alpha(ch))
                    {
                        has_alpha = true;
                        if (!helpers::is_upper(ch))
                        {
                            return false;
                        };
                    };
                };
                return has_alpha;
            };

            def islower() -> bool
            {
                if (this.length == 0)
                {
                    return false;
                };
                bool has_alpha;
                char ch;
                for (int i = 0; i < this.length; i = i + 1)
                {
                    ch = this.value[i];
                    if (helpers::is_alpha(ch))
                    {
                        has_alpha = true;
                        if (!helpers::is_lower(ch))
                        {
                            return false;
                        };
                    };
                };
                return has_alpha;
            };


            def toint() -> int
            {
                return str2i32(this.value);
            };

            def toi32() -> i32
            {
                return str2i32(this.value);
            };

            def toi64() -> i64
            {
                return str2i64(this.value);
            };

            def tou32() -> u32
            {
                return str2u32(this.value);
            };

            def tou64() -> u64
            {
                return str2u64(this.value);
            };

            def fromint(int value) -> bool
            {
                byte[32] buffer;
                i32str(value, buffer);
                return this.set(manip::copy_string(buffer));
            };


            def count_lines() -> int
            {
                return count_lines(this.value);
            };

            def get_line(int line_num) -> byte*
            {
                return get_line(this.value, line_num);
            };

            def count_words() -> int
            {
                return count_words(this.value);
            };


            def split(char delimiter) -> byte**
            {

                int count = 1;
                for (int i; i < this.length; i = i + 1)
                {
                    if ((char)this.value[i] == delimiter)
                    {
                        count = count + 1;
                    };
                };


                byte** result = (byte**)fmalloc((u64)(count + 1) * 8); 
                if (result == 0)
                {
                    return (byte**)0;
                };

                int part_idx, start, part_len;

                for (int i; i <= this.length; i = i + 1)
                {
                    if (i == this.length | (char)this.value[i] == delimiter)
                    {
                        part_len = i - start;
                        result[part_idx] = manip::copy_n(this.value + start, part_len);
                        part_idx = part_idx + 1;
                        start = i + 1;
                    };
                };

                result[part_idx] = (byte*)0; 
                return result;
            };

            def split_lines() -> byte**
            {
                return this.split('\n');
            };

            def split_words() -> byte**
            {
                return this.split(' ');
            };


            def reverse() -> bool
            {
                byte temp;
                for (int i; i < this.length / 2; i = i + 1)
                {
                    temp = this.value[i];
                    this.value[i] = this.value[this.length - 1 - i];
                    this.value[this.length - 1 - i] = temp;
                };
                return true;
            };

            def copy() -> byte*
            {
                return manip::copy_string(this.value);
            };

            def hash() -> int
            {

                int hash = 5381;
                for (int i; i < this.length; i = i + 1)
                {
                    hash = ((hash << 5) + hash) + int(this.value[i]);
                };
                return hash;
            };

            def printval() -> void
            {
                io::console::print(this.value, this.length);
            };

            def println() -> void
            {
                io::console::print(this.value, this.length);
                io::console::print("\n\0",2);
            };
        };
    };
};

using standard::strings;


















namespace standard
{
    namespace io
    {
        namespace file
        {
            extern
            {
                def !!
                    fflush(void*) -> int,
                    remove(byte*) -> int,
                    rename(byte*, byte*) -> int;
            };

            enum file_error_state
            {
                GOOD,
                NOT_OPEN,
                READ_ERROR,
                WRITE_ERROR,
                SEEK_ERROR,
                ALLOC_ERROR,
                EOF_REACHED,
                DELETE_ERROR,
                RENAME_ERROR,
                COPY_ERROR
            };



            trait BaseSTDFileTraits
            {

                def is_open() -> bool,
                    eof() -> bool,
                    f_error() -> bool,
                    get_error() -> int,
                    is_empty() -> bool,
                    is_readable() -> bool,
                    is_writable() -> bool,
                    is_binary() -> bool,


                    get_path() -> byte*,
                    get_mode() -> byte*,
                    get_size() -> int,
                    count_bytes() -> int,


                    close() -> bool,
                    flush() -> bool,


                    seek(int, int) -> bool,
                    tell() -> int,
                    file_rewind() -> void,


                    count_lines() -> int,
                    count_words() -> int,
                    count_occurrences(byte*) -> int,


                    read_all() -> string,
                    read_bytes(byte*, int) -> int,
                    read_line(byte*, int) -> bool,
                    read_line_n(int) -> byte*,
                    read_lines() -> byte**,
                    read_words() -> byte**,
                    read_from(int, int) -> byte*,
                    read_between(int, int) -> byte*,


                    contains(byte*) -> bool,
                    find(byte*) -> int,
                    find_from(byte*, int) -> int,
                    find_all(byte*) -> int*,
                    find_line(byte*) -> int,
                    find_line_from(byte*, int) -> int,
                    startswith(byte*) -> bool,
                    endswith(byte*) -> bool,


                    write(byte*) -> int,
                    write_bytes(byte*, int) -> int,
                    write_line(byte*) -> int,
                    write_all(byte*) -> bool,
                    append(byte*) -> int,
                    append_line(byte*) -> int,
                    insert_at(int, byte*) -> bool,
                    delete_range(int, int) -> bool,
                    replace_first(byte*, byte*) -> bool,
                    replace_all(byte*, byte*) -> bool,
                    replace_line(int, byte*) -> bool,


                    truncate(int) -> bool,
                    clear() -> bool,
                    copy_to(byte*) -> bool,
                    move_to(byte*) -> bool,
                    delete_file() -> bool;
            };

            BaseSTDFileTraits
            object file
            {
                void* handle;
                int size, error_state;
                byte* path;
                byte* mode;




                def __init(byte* fpath, byte* fmode) -> this
                {
                    this.path = fpath;
                    this.mode = fmode;
                    this.handle = fopen(fpath, fmode);
                    this.error_state = file_error_state.GOOD;
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        this.size = -1;
                    }
                    else
                    {
                        this.size = this.get_size();
                    };
                    return this;
                };



                def __init(byte* fpath, byte* fmode, byte* buf, int bufsz) -> this
                {
                    this.path = fpath;
                    this.mode = fmode;
                    this.handle = fopen(fpath, fmode);
                    this.error_state = file_error_state.GOOD;
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        this.size = -1;
                        return this;
                    };
                    this.size = this.get_size();
                    if (buf != (byte*)0 & bufsz > 0)
                    {
                        int n = this.read_bytes(buf, bufsz - 1);
                        if (n >= 0)
                        {
                            buf[n] = (byte)0;
                        }
                        else
                        {
                            this.error_state = file_error_state.READ_ERROR;
                        };
                    };
                    return this;
                };

                def __exit() -> void
                {
                    this.close();
                    return;
                };

                def __expr() -> void*
                {
                    return this.handle;
                };



                def is_open() -> bool
                {
                    return this.handle != (void*)0;
                };

                def eof() -> bool
                {
                    if (!this.is_open()) { return true; };
                    return feof(this.handle) != 0;
                };

                def f_error() -> bool
                {
                    if (!this.is_open()) { return true; };
                    return ferror(this.handle) != 0;
                };

                def get_error() -> int
                {
                    return this.error_state;
                };

                def is_empty() -> bool
                {
                    return this.get_size() == 0;
                };


                def is_readable() -> bool
                {
                    if (this.mode == (byte*)0) { return false; };
                    int i;
                    while (this.mode[i] != 0)
                    {
                        if (this.mode[i] == 'r') { return true; };
                        i = i + 1;
                    };
                    return false;
                };


                def is_writable() -> bool
                {
                    if (this.mode == (byte*)0) { return false; };
                    int i;
                    while (this.mode[i] != 0)
                    {
                        if (this.mode[i] == 'w' | this.mode[i] == 'a') { return true; };
                        if (this.mode[i] == '+') { return true; };
                        i = i + 1;
                    };
                    return false;
                };


                def is_binary() -> bool
                {
                    if (this.mode == (byte*)0) { return false; };
                    int i;
                    while (this.mode[i] != 0)
                    {
                        if (this.mode[i] == 'b') { return true; };
                        i = i + 1;
                    };
                    return false;
                };



                def get_path() -> byte*
                {
                    return this.path;
                };

                def get_mode() -> byte*
                {
                    return this.mode;
                };


                def get_size() -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int cur = ftell(this.handle);
                    fseek(this.handle, 0, SEEK_END);
                    int s = ftell(this.handle);
                    fseek(this.handle, cur, SEEK_SET);
                    return s;
                };

                def count_bytes() -> int
                {
                    return this.get_size();
                };



                def close() -> bool
                {
                    if (!this.is_open()) { return false; };
                    fclose(this.handle);
                    this.handle = (void*)0;
                    return true;
                };

                def flush() -> bool
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    return fflush(this.handle) == 0;
                };



                def seek(int offset, int whence) -> bool
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    bool ok = fseek(this.handle, offset, whence) == 0;
                    if (!ok) { this.error_state = file_error_state.SEEK_ERROR; };
                    return ok;
                };

                def tell() -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    return ftell(this.handle);
                };


                def file_rewind() -> void
                {
                    if (this.is_open())
                    {
                        rewind(this.handle);
                        this.error_state = file_error_state.GOOD;
                    };
                    return;
                };




                def count_lines() -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);
                    int count, ch;
                    byte[1] buf;
                    while (fread(@buf[0], 1, 1, this.handle) == 1)
                    {
                        if (buf[0] == '\n') { count = count + 1; };
                    };
                    fseek(this.handle, cur, SEEK_SET);
                    return count;
                };


                def count_words() -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);
                    int count;
                    bool in_word;
                    bool ws;
                    byte[1] buf;
                    while (fread(@buf[0], 1, 1, this.handle) == 1)
                    {
                        ws = buf[0] == ' ' | buf[0] == '\t' | buf[0] == '\n' | buf[0] == '\r';
                        if (!ws & !in_word)
                        {
                            count = count + 1;
                            in_word = true;
                        }
                        elif (ws)
                        {
                            in_word = false;
                        };
                    };
                    fseek(this.handle, cur, SEEK_SET);
                    return count;
                };


                def count_occurrences(byte* pattern) -> int
                {
                    if (!this.is_open() | pattern == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int plen;
                    while (pattern[plen] != 0) { plen = plen + 1; };
                    if (plen == 0) { return 0; };

                    int cur = ftell(this.handle);
                    int fsize = this.get_size();
                    if (fsize <= 0)
                    {
                        fseek(this.handle, cur, SEEK_SET);
                        return 0;
                    };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        fseek(this.handle, cur, SEEK_SET);
                        return -1;
                    };

                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;
                    fseek(this.handle, cur, SEEK_SET);

                    int count, i, j;
                    while (i <= n - plen)
                    {
                        j = 0;
                        while (j < plen)
                        {
                            if (buf[i + j] != pattern[j]) { break; };
                            j = j + 1;
                        };
                        if (j == plen)
                        {
                            count = count + 1;
                            i = i + plen;
                        }
                        else
                        {
                            i = i + 1;
                        };
                    };
                    ffree(buf);
                    return count;
                };





                def read_all() -> string
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        string empty("\0");
                        return empty;
                    };
                    int s = this.get_size();
                    if (s <= 0)
                    {
                        string empty("\0");
                        return empty;
                    };
                    byte* buf = (byte*)fmalloc((u64)s + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        string empty("\0");
                        return empty;
                    };
                    int n = fread(buf, 1, s, this.handle);
                    if (n < 0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.READ_ERROR;
                        string empty("\0");
                        return empty;
                    };
                    buf[n] = (byte)0;
                    string out(buf);
                    return out;
                };



                def read_bytes(byte* buf, int n) -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    if (buf == (byte*)0 | n <= 0) { return 0; };
                    int got = fread(buf, 1, n, this.handle);
                    if (got < 0)
                    {
                        this.error_state = file_error_state.READ_ERROR;
                        return -1;
                    };
                    if (this.eof()) { this.error_state = file_error_state.EOF_REACHED; };
                    return got;
                };



                def read_line(byte* buf, int bufsz) -> bool
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    if (buf == (byte*)0 | bufsz <= 0) { return false; };
                    void* result = fgets(buf, bufsz, this.handle);
                    if (result == (void*)0)
                    {
                        if (this.eof()) { this.error_state = file_error_state.EOF_REACHED; }
                        else { this.error_state = file_error_state.READ_ERROR; };
                        return false;
                    };
                    return true;
                };



                def read_line_n(int n) -> byte*
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return (byte*)0;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);

                    byte[4096] linebuf;
                    int line_idx, len, i;
                    byte* result = (byte*)0;

                    while (fgets(@linebuf[0], 4096, this.handle) != (void*)0)
                    {
                        if (line_idx == n)
                        {
                            len = 0;
                            while (linebuf[len] != 0) { len = len + 1; };
                            result = (byte*)fmalloc((u64)len + 1);
                            if (result != (byte*)0)
                            {
                                i = 0;
                                while (i <= len) { result[i] = linebuf[i]; i = i + 1; };
                            }
                            else
                            {
                                this.error_state = file_error_state.ALLOC_ERROR;
                            };
                            break;
                        };
                        line_idx = line_idx + 1;
                    };

                    fseek(this.handle, cur, SEEK_SET);
                    return result;
                };



                def read_lines() -> byte**
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return (byte**)0;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);

                    int line_count = this.count_lines() + 1;
                    byte** arr = (byte**)fmalloc((u64)(line_count + 1) * 8);
                    if (arr == (byte**)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        fseek(this.handle, cur, SEEK_SET);
                        return (byte**)0;
                    };

                    rewind(this.handle);
                    byte[4096] linebuf;
                    int idx, len, i;
                    while (fgets(@linebuf[0], 4096, this.handle) != (void*)0)
                    {
                        len = 0;
                        while (linebuf[len] != 0) { len = len + 1; };
                        arr[idx] = (byte*)fmalloc((u64)len + 1);
                        if (arr[idx] != (byte*)0)
                        {
                            i = 0;
                            while (i <= len) { arr[idx][i] = linebuf[i]; i = i + 1; };
                        };
                        idx = idx + 1;
                    };
                    arr[idx] = (byte*)0;
                    fseek(this.handle, cur, SEEK_SET);
                    return arr;
                };



                def read_words() -> byte**
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return (byte**)0;
                    };
                    int cur = ftell(this.handle);
                    int fsize = this.get_size();
                    if (fsize <= 0)
                    {
                        fseek(this.handle, cur, SEEK_SET);
                        return (byte**)0;
                    };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        fseek(this.handle, cur, SEEK_SET);
                        return (byte**)0;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;
                    fseek(this.handle, cur, SEEK_SET);

                    int wcount = this.count_words();
                    byte** arr = (byte**)fmalloc((u64)(wcount + 1) * 8);
                    if (arr == (byte**)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return (byte**)0;
                    };

                    int i, widx, wstart, wlen, j;
                    bool ws;
                    while (i < n)
                    {
                        ws = buf[i] == ' ' | buf[i] == '\t' | buf[i] == '\n' | buf[i] == '\r';
                        if (!ws)
                        {
                            wstart = i;
                            while (i < n & !(buf[i] == ' ' | buf[i] == '\t' | buf[i] == '\n' | buf[i] == '\r'))
                            {
                                i = i + 1;
                            };
                            wlen = i - wstart;
                            arr[widx] = (byte*)fmalloc((u64)wlen + 1);
                            if (arr[widx] != (byte*)0)
                            {
                                j = 0;
                                while (j < wlen) { arr[widx][j] = buf[wstart + j]; j = j + 1; };
                                arr[widx][wlen] = (byte)0;
                            };
                            widx = widx + 1;
                        }
                        else
                        {
                            i = i + 1;
                        };
                    };
                    arr[widx] = (byte*)0;
                    ffree(buf);
                    return arr;
                };


                def read_from(int offset, int n) -> byte*
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return (byte*)0;
                    };
                    if (n <= 0) { return (byte*)0; };
                    byte* buf = (byte*)fmalloc((u64)n + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return (byte*)0;
                    };
                    int cur = ftell(this.handle);
                    fseek(this.handle, offset, SEEK_SET);
                    int got = fread(buf, 1, n, this.handle);
                    fseek(this.handle, cur, SEEK_SET);
                    if (got < 0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.READ_ERROR;
                        return (byte*)0;
                    };
                    buf[got] = (byte)0;
                    return buf;
                };


                def read_between(int start, int end) -> byte*
                {
                    if (end <= start) { return (byte*)0; };
                    return this.read_from(start, end - start);
                };




                def contains(byte* pattern) -> bool
                {
                    return this.find(pattern) >= 0;
                };


                def find(byte* pattern) -> int
                {
                    return this.find_from(pattern, 0);
                };


                def find_from(byte* pattern, int offset) -> int
                {
                    if (!this.is_open() | pattern == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int plen;
                    while (pattern[plen] != 0) { plen = plen + 1; };
                    if (plen == 0) { return offset; };

                    int cur = ftell(this.handle);
                    int fsize = this.get_size();
                    if (fsize <= 0 | offset >= fsize)
                    {
                        fseek(this.handle, cur, SEEK_SET);
                        return -1;
                    };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        fseek(this.handle, cur, SEEK_SET);
                        return -1;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;
                    fseek(this.handle, cur, SEEK_SET);

                    int result = -1;
                    int i = offset;
                    int j;
                    while (i <= n - plen)
                    {
                        j = 0;
                        while (j < plen)
                        {
                            if (buf[i + j] != pattern[j]) { break; };
                            j = j + 1;
                        };
                        if (j == plen) { result = i; break; };
                        i = i + 1;
                    };
                    ffree(buf);
                    return result;
                };



                def find_all(byte* pattern) -> int*
                {
                    if (!this.is_open() | pattern == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return (int*)0;
                    };
                    int count = this.count_occurrences(pattern);
                    if (count <= 0)
                    {
                        int* empty = (int*)fmalloc(8);
                        if (empty != (int*)0) { empty[0] = -1; };
                        return empty;
                    };

                    int plen;
                    while (pattern[plen] != 0) { plen = plen + 1; };

                    int cur = ftell(this.handle);
                    int fsize = this.get_size();
                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        fseek(this.handle, cur, SEEK_SET);
                        return (int*)0;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;
                    fseek(this.handle, cur, SEEK_SET);

                    int* offsets = (int*)fmalloc((u64)(count + 1) * 4);
                    if (offsets == (int*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return (int*)0;
                    };

                    int i, oidx, j;
                    while (i <= n - plen)
                    {
                        j = 0;
                        while (j < plen)
                        {
                            if (buf[i + j] != pattern[j]) { break; };
                            j = j + 1;
                        };
                        if (j == plen)
                        {
                            offsets[oidx] = i;
                            oidx = oidx + 1;
                            i = i + plen;
                        }
                        else
                        {
                            i = i + 1;
                        };
                    };
                    offsets[oidx] = -1;
                    ffree(buf);
                    return offsets;
                };


                def find_line(byte* pattern) -> int
                {
                    return this.find_line_from(pattern, 0);
                };


                def find_line_from(byte* pattern, int start_line) -> int
                {
                    if (!this.is_open() | pattern == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);

                    byte[4096] linebuf;
                    int line_idx, result = -1;
                    int plen, llen, i, j;
                    while (pattern[plen] != 0) { plen = plen + 1; };

                    while (fgets(@linebuf[0], 4096, this.handle) != (void*)0)
                    {
                        if (line_idx >= start_line)
                        {
                            llen = 0;
                            while (linebuf[llen] != 0) { llen = llen + 1; };
                            i = 0;
                            while (i <= llen - plen)
                            {
                                j = 0;
                                while (j < plen)
                                {
                                    if (linebuf[i + j] != pattern[j]) { break; };
                                    j = j + 1;
                                };
                                if (j == plen) { result = line_idx; break; };
                                i = i + 1;
                            };
                            if (result >= 0) { break; };
                        };
                        line_idx = line_idx + 1;
                    };

                    fseek(this.handle, cur, SEEK_SET);
                    return result;
                };


                def startswith(byte* prefix) -> bool
                {
                    if (!this.is_open() | prefix == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int plen;
                    while (prefix[plen] != 0) { plen = plen + 1; };
                    if (plen == 0) { return true; };

                    byte* buf = (byte*)fmalloc((u64)plen + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);
                    int got = fread(buf, 1, plen, this.handle);
                    fseek(this.handle, cur, SEEK_SET);

                    bool match = true;
                    int i;
                    while (i < got & i < plen)
                    {
                        if (buf[i] != prefix[i]) { match = false; break; };
                        i = i + 1;
                    };
                    if (got < plen) { match = false; };
                    ffree(buf);
                    return match;
                };


                def endswith(byte* suffix) -> bool
                {
                    if (!this.is_open() | suffix == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int slen;
                    while (suffix[slen] != 0) { slen = slen + 1; };
                    if (slen == 0) { return true; };

                    int fsize = this.get_size();
                    if (fsize < slen) { return false; };

                    byte* buf = (byte*)fmalloc((u64)slen + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    int cur = ftell(this.handle);
                    fseek(this.handle, fsize - slen, SEEK_SET);
                    int got = fread(buf, 1, slen, this.handle);
                    fseek(this.handle, cur, SEEK_SET);

                    bool match = true;
                    int i;
                    while (i < slen)
                    {
                        if (buf[i] != suffix[i]) { match = false; break; };
                        i = i + 1;
                    };
                    ffree(buf);
                    return match;
                };




                def write(byte* xdata) -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int n = (int)standard::strings::strlen(xdata);
                    int written = fwrite(xdata, 1, n, this.handle);
                    if (written < n) { this.error_state = file_error_state.WRITE_ERROR; };
                    return written;
                };


                def write_bytes(byte* xdata, int n) -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    if (xdata == (byte*)0 | n <= 0) { return 0; };
                    int written = fwrite(xdata, 1, n, this.handle);
                    if (written < n) { this.error_state = file_error_state.WRITE_ERROR; };
                    return written;
                };


                def write_line(byte* xdata) -> int
                {
                    int w = this.write(xdata);
                    if (w < 0) { return w; };
                    int nl = this.write_bytes("\n\0", 1);
                    if (nl < 0) { return nl; };
                    return w + nl;
                };



                def write_all(byte* xdata) -> bool
                {
                    if (this.path == (byte*)0) { return false; };
                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int n = (int)standard::strings::strlen(xdata);
                    int written = fwrite(xdata, 1, n, h);
                    fclose(h);
                    this.handle = fopen(this.path, this.mode);
                    if (!this.is_open()) { this.error_state = file_error_state.NOT_OPEN; };
                    this.size = this.get_size();
                    return written == n;
                };


                def append(byte* xdata) -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    int cur = ftell(this.handle);
                    fseek(this.handle, 0, SEEK_END);
                    int written = this.write(xdata);
                    this.size = this.get_size();
                    return written;
                };


                def append_line(byte* xdata) -> int
                {
                    if (!this.is_open())
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return -1;
                    };
                    fseek(this.handle, 0, SEEK_END);
                    int written = this.write_line(xdata);
                    this.size = this.get_size();
                    return written;
                };


                def insert_at(int offset, byte* xdata) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (offset < 0 | offset > fsize) { return false; };

                    int inslen;
                    while (xdata[inslen] != 0) { inslen = inslen + 1; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;

                    int newsize = n + inslen;
                    byte* newbuf = (byte*)fmalloc((u64)newsize + 1);
                    if (newbuf == (byte*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };

                    int i;
                    while (i < offset) { newbuf[i] = buf[i]; i = i + 1; };
                    int j;
                    while (j < inslen) { newbuf[offset + j] = xdata[j]; j = j + 1; };
                    int k;
                    while (k < n - offset) { newbuf[offset + inslen + k] = buf[offset + k]; k = k + 1; };
                    newbuf[newsize] = (byte)0;

                    ffree(buf);
                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        ffree(newbuf);
                        this.error_state = file_error_state.WRITE_ERROR;
                        return false;
                    };
                    fwrite(newbuf, 1, newsize, h);
                    fclose(h);
                    ffree(newbuf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return this.is_open();
                };


                def delete_range(int start, int end) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (start < 0 | end > fsize | start >= end) { return false; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);

                    int newsize = n - (end - start);
                    byte* newbuf = (byte*)fmalloc((u64)newsize + 1);
                    if (newbuf == (byte*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };

                    int i;
                    while (i < start) { newbuf[i] = buf[i]; i = i + 1; };
                    int j = end;
                    while (j < n) { newbuf[start + (j - end)] = buf[j]; j = j + 1; };
                    newbuf[newsize] = (byte)0;

                    ffree(buf);
                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        ffree(newbuf);
                        this.error_state = file_error_state.WRITE_ERROR;
                        return false;
                    };
                    fwrite(newbuf, 1, newsize, h);
                    fclose(h);
                    ffree(newbuf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return this.is_open();
                };


                def replace_first(byte* find_str, byte* repl_str) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (fsize <= 0) { return false; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;

                    byte* newbuf = standard::strings::replace_first(buf, find_str, repl_str);
                    ffree(buf);
                    if (newbuf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };

                    int newlen;
                    while (newbuf[newlen] != 0) { newlen = newlen + 1; };

                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        ffree(newbuf);
                        this.error_state = file_error_state.WRITE_ERROR;
                        return false;
                    };
                    fwrite(newbuf, 1, newlen, h);
                    fclose(h);
                    ffree(newbuf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return this.is_open();
                };


                def replace_all(byte* find_str, byte* repl_str) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (fsize <= 0) { return false; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1),
                          next;
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;

                    int flen;
                    while (find_str[flen] != 0) { flen = flen + 1; };
                    int rlen;
                    while (repl_str[rlen] != 0) { rlen = rlen + 1; };


                    byte* cur = buf;
                    int iteration, ci, j, found_pos;
                    while (iteration < 65536)
                    {
                        ci = 0;
                        found_pos = -1;
                        while (cur[ci] != 0)
                        {
                            j = 0;
                            while (j < flen)
                            {
                                if (cur[ci + j] != find_str[j]) { break; };
                                j = j + 1;
                            };
                            if (j == flen) { found_pos = ci; break; };
                            ci = ci + 1;
                        };
                        if (found_pos < 0) { break; };

                        next = standard::strings::replace_first(cur, find_str, repl_str);
                        if (next == (byte*)0) { break; };
                        if (cur != buf) { ffree(cur); };
                        cur = next;
                        iteration = iteration + 1;
                    };

                    int newlen;
                    while (cur[newlen] != 0) { newlen = newlen + 1; };

                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    bool ok;
                    if (h == (void*)0)
                    {
                        this.error_state = file_error_state.WRITE_ERROR;
                        ok = false;
                    }
                    else
                    {
                        fwrite(cur, 1, newlen, h);
                        fclose(h);
                        ok = true;
                    };

                    if (cur != buf) { ffree(cur); };
                    ffree(buf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return ok & this.is_open();
                };


                def replace_line(int line_n, byte* repl_str) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (fsize <= 0) { return false; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    buf[n] = (byte)0;

                    int rlen;
                    while (repl_str[rlen] != 0) { rlen = rlen + 1; };


                    int cur_line, line_start = -1, line_end = -1;
                    int i;
                    while (i <= n)
                    {
                        if (cur_line == line_n & line_start == -1) { line_start = i; };
                        if (cur_line == line_n & (buf[i] == '\n' | i == n))
                        {
                            line_end = i;
                            break;
                        };
                        if (buf[i] == '\n') { cur_line = cur_line + 1; };
                        i = i + 1;
                    };

                    if (line_start == -1 | line_end == -1)
                    {
                        ffree(buf);
                        return false;
                    };

                    int old_llen = line_end - line_start;
                    int newsize = n - old_llen + rlen;
                    byte* newbuf = (byte*)fmalloc((u64)newsize + 1);
                    if (newbuf == (byte*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };

                    int wi;
                    int bi;
                    while (bi < line_start) { newbuf[wi] = buf[bi]; wi = wi + 1; bi = bi + 1; };
                    int ri;
                    while (ri < rlen) { newbuf[wi] = repl_str[ri]; wi = wi + 1; ri = ri + 1; };
                    bi = line_end;
                    while (bi <= n) { newbuf[wi] = buf[bi]; wi = wi + 1; bi = bi + 1; };

                    ffree(buf);
                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        ffree(newbuf);
                        this.error_state = file_error_state.WRITE_ERROR;
                        return false;
                    };
                    fwrite(newbuf, 1, newsize, h);
                    fclose(h);
                    ffree(newbuf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return this.is_open();
                };




                def truncate(int new_size) -> bool
                {
                    if (!this.is_open() | this.path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    if (new_size < 0) { new_size = 0; };
                    int fsize = this.get_size();
                    if (new_size >= fsize) { return true; };

                    byte* buf = (byte*)fmalloc((u64)new_size + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    rewind(this.handle);
                    int got = fread(buf, 1, new_size, this.handle);
                    buf[got] = (byte)0;

                    this.close();
                    void* h = fopen(this.path, "wb\0");
                    if (h == (void*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.WRITE_ERROR;
                        return false;
                    };
                    fwrite(buf, 1, got, h);
                    fclose(h);
                    ffree(buf);

                    this.handle = fopen(this.path, this.mode);
                    this.size = this.get_size();
                    return this.is_open();
                };


                def clear() -> bool
                {
                    return this.truncate(0);
                };


                def copy_to(byte* dest_path) -> bool
                {
                    if (!this.is_open() | dest_path == (byte*)0)
                    {
                        this.error_state = file_error_state.NOT_OPEN;
                        return false;
                    };
                    int fsize = this.get_size();
                    if (fsize < 0) { return false; };

                    byte* buf = (byte*)fmalloc((u64)fsize + 1);
                    if (buf == (byte*)0)
                    {
                        this.error_state = file_error_state.ALLOC_ERROR;
                        return false;
                    };
                    int cur = ftell(this.handle);
                    rewind(this.handle);
                    int n = fread(buf, 1, fsize, this.handle);
                    fseek(this.handle, cur, SEEK_SET);

                    void* dest = fopen(dest_path, "wb\0");
                    if (dest == (void*)0)
                    {
                        ffree(buf);
                        this.error_state = file_error_state.COPY_ERROR;
                        return false;
                    };
                    int written = fwrite(buf, 1, n, dest);
                    fclose(dest);
                    ffree(buf);
                    if (written < n)
                    {
                        this.error_state = file_error_state.COPY_ERROR;
                        return false;
                    };
                    return true;
                };


                def move_to(byte* dest_path) -> bool
                {
                    if (!this.copy_to(dest_path)) { return false; };
                    return this.clear();
                };


                def delete_file() -> bool
                {
                    if (this.path == (byte*)0) { return false; };
                    this.close();
                    bool ok = remove(this.path) == 0;
                    if (!ok) { this.error_state = file_error_state.DELETE_ERROR; };
                    return ok;
                };
            };
        };
    };
};









extern
{


    stdcall !!
            GetStdHandle(int nStdHandle) -> i64;
    def !!
        GetCommandLineW() -> wchar*,
        LocalFree(void* x) -> void*,
        RtlExitUserProcess(u32 code) -> void;
};



















































































































struct FSSFrame
{
    u64 canary,       
        saved_ra,     
        saved_rsp;    
};









global FSSFrame* FSS_BASE      = (FSSFrame*)STDLIB_GVP;
global u64       FSS_TOP       = 0;
global u64       FSS_CAP       = 0;
global u64       FSS_CANARY    = 0;






extern
{

    stdcall !!
        VirtualAlloc(void*, u64, u32, u32) -> void*,
        VirtualFree(void*, u64, u32)       -> i32,
        VirtualProtect(void*, u64, u32, u32*) -> i32;



    stdcall !!
        QueryPerformanceCounter(u64*) -> i32;

    stdcall !!
        ExitProcess(u32 uExitCode) -> void;
};















namespace standard
{
    namespace runtime
    {
        namespace shadow_stack
        {




            def fss_rdtsc() -> u64
            {
                u64 result = 0;
                volatile asm
                {
                    rdtsc
                    shlq $$32, %rdx
                    orq %rdx, %rax
                    movq %rax, $0
                } : : "m"(result) : "rax", "rdx";
                return result;
            };







            def fss_init() -> bool
            {

                void* page = VirtualAlloc(
                    ulong((void*)STDLIB_GVP),
                    (u64)4096,
                    (u32)0x3000,
                    (u32)0x04
                );

                if (page == (void*)STDLIB_GVP)
                {
                    return false;
                };

                FSS_BASE = (FSSFrame*)page;
                FSS_TOP  = 0;
                FSS_CAP  = (u64)170;





                u64 t0 = fss_rdtsc();
                u64 qpc = 0;
                QueryPerformanceCounter(@qpc);
                FSS_CANARY = t0 ^| (qpc << 17) ^| (qpc >> 47) ^| 0xA3B4C5D6E7F80192u;

                return true;
            };











            def fss_push(u64 ra, u64 rsp) -> u64
            {
                if (FSS_TOP >= FSS_CAP)
                {
                    return U64MAXVAL;
                };

                FSSFrame* frame = FSS_BASE + FSS_TOP;
                frame.canary    = FSS_CANARY;
                frame.saved_ra  = ra ^| FSS_CANARY;
                frame.saved_rsp = rsp;

                FSS_TOP = FSS_TOP + 1;
                return FSS_TOP - 1;
            };










            def fss_verify(u64 slot, u64 ra, u64 rsp) -> bool
            {
                if (slot >= FSS_CAP)
                {
                    return false;
                };

                FSSFrame* frame = FSS_BASE + slot;


                if (frame.canary != FSS_CANARY)
                {
                    return false;
                };


                u64 expected_ra = frame.saved_ra ^| FSS_CANARY;
                if (expected_ra != ra)
                {
                    return false;
                };


                if (frame.saved_rsp != rsp)
                {
                    return false;
                };

                return true;
            };




            def fss_pop() -> void
            {
                if (FSS_TOP == 0)
                {
                    return;
                };

                FSS_TOP = FSS_TOP - 1;
                FSSFrame* frame = FSS_BASE + FSS_TOP;


                frame.canary    = 0;
                frame.saved_ra  = 0;
                frame.saved_rsp = 0;

                return;
            };








            def fss_abort() -> void
            {
                standard::io::console::print("FATAL: shadow stack violation detected - aborting\n\0");
                ExitProcess((u32)1);
                noreturn;
            };






            def fss_teardown() -> void
            {
                if (FSS_BASE == (FSSFrame*)STDLIB_GVP)
                {
                    return;
                };

                VirtualFree(ulong((void*)FSS_BASE), (u64)0, (u32)0x8000);
                FSS_BASE   = (FSSFrame*)STDLIB_GVP;
                FSS_TOP    = 0;
                FSS_CAP    = 0;
                FSS_CANARY = 0;
                return;
            };
        };
    };
};

using standard::runtime::shadow_stack;















contract FSS_Protect_Frame,
         FSS_Cleanup_Frame;

contract FSS_Protect_Frame
{
    volatile u64 __fss_canary_local,
                 __fss_frame_slot;
    volatile bool __fss_frame_active;
    if (FSS_BASE != (FSSFrame*)STDLIB_GVP)
    {
        u64 __fss_frame_canary = fss_rdtsc() ^| FSS_CANARY;
        __fss_canary_local = __fss_frame_canary;
        __fss_frame_slot = fss_push(__fss_frame_canary, __fss_frame_canary);
        __fss_frame_active = true;
    };
} # binding {this : FSS_Cleanup_Frame};

contract FSS_Cleanup_Frame
{
    if (__fss_frame_active)
    {
        if (fss_verify(__fss_frame_slot, __fss_canary_local, __fss_frame_canary))
        {
            fss_pop();
        }
        else
        {
            fss_abort();
        };
    };
} # binding {FSS_Protect_Frame : this};





















































































































































































































































































































def main() -> int;
def main(int, byte**) -> int;





def !!FRTStartup() -> int; 

























def !!FRTStartup() -> int
{
    int return_code, argc, argi, pos, start, len, j, k;
    byte* arg;
    byte** argv;
    bool quoted;
    wchar* cmdLine;



    nt_threshold = standard::system::cpu::l2_bytes();
    ermsb        = standard::system::cpu::ermsb();


    WIN_STDOUT_HANDLE = GetStdHandle(-11);




    standard::memory::allocators::stdheap::table_init();


    cmdLine = GetCommandLineW();

    while (cmdLine[pos] != (wchar)0)
    {

        while (cmdLine[pos] == (wchar)32 | cmdLine[pos] == (wchar)9)
        {
            pos = pos + 1;
        };
        if (cmdLine[pos] == (wchar)0)
        {
            break;
        };

        if (cmdLine[pos] == (wchar)34)
        {
            pos = pos + 1;
            while (cmdLine[pos] != (wchar)0 & cmdLine[pos] != (wchar)34)
            {
                pos = pos + 1;
            };
            if (cmdLine[pos] == (wchar)34)
            {
                pos = pos + 1;
            };
        }
        else
        {
            while (cmdLine[pos] != (wchar)0 & cmdLine[pos] != (wchar)32 & cmdLine[pos] != (wchar)9)
            {
                pos = pos + 1;
            };
        };
        argc = argc + 1;
    };


    argv = (byte**)fmalloc((u64)argc * (u64)8);
    defer ffree(ulong(argv));


    argi = 0;
    pos = 0;
    while (cmdLine[pos] != (wchar)0)
    {

        while (cmdLine[pos] == (wchar)32 | cmdLine[pos] == (wchar)9)
        {
            pos = pos + 1;
        };
        if (cmdLine[pos] == (wchar)0)
        {
            break;
        };


        start = pos;
        len = 0;
        if (cmdLine[pos] == (wchar)34)
        {
            quoted = true;
            pos = pos + 1;
            start = pos;
            while (cmdLine[pos] != (wchar)0 & cmdLine[pos] != (wchar)34)
            {
                len = len + 1;
                pos = pos + 1;
            };
            if (cmdLine[pos] == (wchar)34)
            {
                pos = pos + 1;
            };
        }
        else
        {
            while (cmdLine[pos] != (wchar)0 & cmdLine[pos] != (wchar)32 & cmdLine[pos] != (wchar)9)
            {
                len = len + 1;
                pos = pos + 1;
            };
        };


        arg = (byte*)fmalloc((u64)len + (u64)1);
        j = 0;
        while (j < len)
        {
            arg[j] = (byte)cmdLine[start + j];
            j = j + 1;
        };
        arg[len] = (byte)0;
        argv[argi] = arg;
        argi = argi + 1;
    };






    if (!fss_init())
    {
        standard::io::console::print("WARNING: shadow stack allocation failed, continuing unprotected\n\0");
    };

    if (argc > 1)
    {



        return_code = main__2__intE1__byteE1_ptr2__ret_intE1(argc, argv);



    }
    else
    {
        return_code = main();
    };



    fss_teardown();


    while (k < argc)
    {
        ffree((u64)argv[k]);
        k = k + 1;
    };

    if (return_code != 0)
    {

        if (return_code == -1073741819)
        {
            standard::io::console::print("SEGFAULT\n\0");
        };
    };
    -> return_code;
};


































































struct PCG32
{
    u64 state, inc;
};

PCG32 global_rng;
bool global_rng_initialized = false;

namespace standard
{
    namespace random
    {



        def get_rdtsc() -> u64
        {
            u64 result = 0;



            volatile asm
            {
                rdtsc                    
                shlq $$32, %rdx          
                orq %rdx, %rax           
            } : "=a"(result) : : "rdx";








            return result;
        };


        def get_entropy() -> u64
        {
            u64 t1 = get_rdtsc(),
                t2 = get_rdtsc(),
                t3 = get_rdtsc();


            return t1 ^| (t2 << 21) ^| (t3 >> 17);
        };




        struct XorShift64
        {
            u64 state;
        };


        def xorshift64_seed(XorShift64* rng, u64 seed) -> void
        {

            if (seed == 0)
            {
                seed = 0xDEADBEEFCAFEBABE;
            };
            rng.state = seed;
        };


        def xorshift64_init(XorShift64* rng) -> void
        {
            u64 seed = get_entropy();
            xorshift64_seed(rng, seed);
        };


        def xorshift64_next(XorShift64* rng) -> u64
        {
            u64 x = rng.state;
            x = x ^| (x << 13);
            x = x ^| (x >> 7);
            x = x ^| (x << 17);
            rng.state = x;
            return x;
        };




        struct XorShift128
        {
            u64[2] state;
        };

        def xorshift128_seed(XorShift128* rng, u64 seed1, u64 seed2) -> void
        {

            if (seed1 == 0)
            {
                seed1 = 0xDEADBEEFCAFEBABE;
            };
            if (seed2 == 0)
            {
                seed2 = 0xFEEDFACEBAADF00D;
            };

            rng.state[0] = seed1;
            rng.state[1] = seed2;
        };

        def xorshift128_init(XorShift128* rng) -> void
        {
            u64 seed1 = get_entropy(),
                seed2 = get_entropy();
            xorshift128_seed(rng, seed1, seed2);
        };

        def xorshift128_next(XorShift128* rng) -> u64
        {
            u64 s1 = rng.state[0],
                s0 = rng.state[1];

            rng.state[0] = s0;
            s1 = s1 ^| (s1 << 23);
            s1 = s1 ^| (s1 >> 17);
            s1 = s1 ^| s0;
            s1 = s1 ^| (s0 >> 26);
            rng.state[1] = s1;

            return s0 + s1;
        };




        def pcg32_seed(PCG32* rng, u64 seed, u64 seq) -> void
        {
            rng.state = 0;
            rng.inc = (seq << 1) | 1;


            u64 dummy;
            rng.state = rng.state * 6364136223846793005 + rng.inc;
            rng.state = rng.state + seed;
            rng.state = rng.state * 6364136223846793005 + rng.inc;



        };

        def pcg32_init(PCG32* rng) -> void
        {
            u64 seed = get_entropy(),
                seq = get_entropy();
            pcg32_seed(rng, seed, seq);
        };

        def pcg32_next(PCG32* rng) -> u32
        {
            u64 oldstate = rng.state;


            rng.state = oldstate * 6364136223846793005 + rng.inc;


            u32 xorshifted = (((oldstate >> 18) ^| oldstate) >> 27),
                rot = (oldstate >> 59);

            return (xorshifted >> rot) | (xorshifted << (0u - rot));
        };




        struct LCG
        {
            u64 state;
        };

        def lcg_seed(LCG* rng, u64 seed) -> void
        {
            rng.state = seed;
        };

        def lcg_init(LCG* rng) -> void
        {
            u64 seed = get_entropy();
            lcg_seed(rng, seed);
        };

        def lcg_next(LCG* rng) -> u32
        {

            rng.state = rng.state * 1664525 + 1013904223;
            return (rng.state >> 32);
        };




        def random_range_u64(XorShift128* rng, u64 max) -> u64
        {
            if (max == 0)
            {
                return 0;
            };

            u64 val = xorshift128_next(rng);
            return val % max;
        };


        def random_range_u32(PCG32* rng, u32 max) -> u32
        {
            if (max == 0u)
            {
                return 0u;
            };

            u32 val = pcg32_next(rng);
            return val % max;
        };


        def random_range_int(PCG32* rng, int min, int max) -> int
        {
            if (min >= max)
            {
                return min;
            };

            u32 range = (max - min + 1),
                val = random_range_u32(rng, range);
            return min + (int)val;
        };


        def random_float(PCG32* rng) -> float
        {
            u32 val = pcg32_next(rng);


            return (float)val / 4294967296.0;
        };


        def random_range_float(PCG32* rng, float min, float max) -> float
        {
            float t = random_float(rng);
            return min + t * (max - min);
        };


        def random_bool(PCG32* rng) -> bool
        {
            return (pcg32_next(rng) & 1) == 1;
        };




        def random_bytes(PCG32* rng, byte* buffer, u64 length) -> void
        {
            u64 i;
            u32 val;


            while (i + 4 <= length)
            {
                val = pcg32_next(rng);
                buffer[i + 0] = (byte)(val & 0xFF);
                buffer[i + 1] = (byte)((val >> 8) & 0xFF);
                buffer[i + 2] = (byte)((val >> 16) & 0xFF);
                buffer[i + 3] = (byte)((val >> 24) & 0xFF);
                i = i + 4;
            };


            if (i < length)
            {
                val = pcg32_next(rng);
                while (i < length)
                {
                    buffer[i] = (byte)(val & 0xFF);
                    val = val >> 8;
                    i++;
                };
            };
        };


        def shuffle_u32_array(PCG32* rng, u32* array, u32 length) -> void
        {
            u32 i = length - 1,
                j,
                temp;

            while (i > 0u)
            {
                j = random_range_u32(rng, i + 1);


                temp = array[i];
                array[i] = array[j];
                array[j] = temp;

                i--;
            };
        };




        def roll_dice(PCG32* rng, int sides) -> int
        {
            if (sides < 1)
            {
                return 1;
            };

            return random_range_int(rng, 1, sides);
        };


        def roll_dice_sum(PCG32* rng, int count, int sides) -> int
        {
            int total = 0;

            for (int i = 0; i < count; i++)
            {
                total = total + roll_dice(rng, sides);
            };

            return total;
        };


        def flip_coin(PCG32* rng) -> bool
        {
            return random_bool(rng);
        };




        global const byte[] CHARSET_ALPHA_LOWER = "abcdefghijklmnopqrstuvwxyz\0";
        global const byte[] CHARSET_ALPHA_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0";
        global const byte[] CHARSET_DIGITS = "0123456789\0";
        global const byte[] CHARSET_ALPHANUMERIC = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\0";
        global const byte[] CHARSET_HEX_LOWER = "0123456789abcdef\0";
        global const byte[] CHARSET_HEX_UPPER = "0123456789ABCDEF\0";


        def random_string(PCG32* rng, byte* buffer, u32 length, byte* charset) -> void
        {

            u32 charset_len,
                idx;
            while (charset[charset_len] != (byte)0)
            {
                charset_len++;
            };

            if (charset_len == 0u)
            {
                buffer[0] = (byte)0;
                return;
            };


            for (u32 i; i < length; i++)
            {
                idx = random_range_u32(rng, charset_len);
                buffer[i] = charset[idx];
            };

            buffer[length] = (byte)0;
        };


        def random_alphanum(PCG32* rng, byte* buffer, u32 length) -> void
        {
            random_string(rng, buffer, length, CHARSET_ALPHANUMERIC);
        };


        def random_hex(PCG32* rng, byte* buffer, u32 length) -> void
        {
            random_string(rng, buffer, length, CHARSET_HEX_LOWER);
        };





        def init_random() -> void
        {
            if (!global_rng_initialized)
            {
                pcg32_init(@global_rng);
                global_rng_initialized = true;
            };
        };


        def random() -> u32
        {
            if (!global_rng_initialized)
            {
                init_random();
            };

            return pcg32_next(@global_rng);
        };


        def random_int(int min, int max) -> int
        {
            if (!global_rng_initialized)
            {
                init_random();
            };

            return random_range_int(@global_rng, min, max);
        };


        def random_f() -> float
        {
            if (!global_rng_initialized)
            {
                init_random();
            };

            return random_float(@global_rng);
        };
    };
};



using standard::io::console,
      standard::random;

def grade(int score) -> byte*
{
    if   (score >= 90) -> "A"
    elif (score >= 80) -> "B"
    elif (score >= 70) -> "C"
    elif (score >= 60) -> "D"
    else               -> "F";
};

byte* passchars = g"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890";

def passgen(PCG32* z, int l) -> byte*
{
    byte* r = (@)fmalloc(l);
    int maxlen = strlen(passchars);
    byte[maxlen] tmp = "";
    int ri;

    for (int c; c < l; c++)
    {
        ri = random_range_int(@z, 0, l-1);

        if (passchars[ri] in tmp)
        {
            continue;
        };

        tmp += passchars[ri];
        r += passchars[ri];
    };

    return r;
};

comptime
{
    PCG32 rng;
    pcg32_init(@rng);

    operator (i32 a) [&] -> int
    {

        return ++a;
    } # binding {:this};

    float k = 10.0;
    int j from k;
    println(j);
    println(passgen(@rng, 16));

    operator (int a, int b, byte c) [$%][%$] -> int
    {
        return a + b * c;
    };

    compiler.io.console.println("True" if (5 < 10 < 20) else "False");

    def add(int,i32) -> int as operator[\] # effect{IO};

    def add(int a, i32 b) -> int
    {
        return a+b;
    } # effect{IO};

    FXC_SYMTABLE st = compiler.symbol_table;
    FXC_SYMENTRY e;
    int i;
    while (i < st.entries)
    {
        e = st.entry[i];

        i++;
    };

    int x = 1 $% 2 %$ 3;

    compiler.io.console.println(x);

    compiler.io.console.println(5\2); 

    compiler.io.console.println(9&); 

    FXC_FUNCINFO fi = compiler.symbol_table.funcinfo("standard::io::console::println");
    compiler.io.console.println(f"println has_effect: {fi.has_effect}\n");
};

comptime
{
    compiler.io.console.print(f"arch: {compiler.target.arch}\n");
    compiler.io.console.print(f"os: {compiler.target.os}\n");
    compiler.io.console.print(f"ptr_width: {compiler.target.ptr_width}\n");
    compiler.io.console.print(f"has_avx: {compiler.target.has_avx}\n");
    compiler.io.console.print(f"cache_line: {compiler.target.cache_line}\n");
};

struct Point { int x, y; };
Point[4] pts = [{1,2},{3,4},{5,6},{7,8}];

struct ErrType
{
    byte* msg;
};

def f() -> int ^| ErrType
{
    if (true) { error {"Test"}; };
    return 42;
};

def main() -> int : FSS_Protect_Frame
{
    int ^| ErrType result,err = f();

    println(err.msg);

    for (auto {x, y} in pts)
    {
        println(x);
        println(y);
    };
    println("Hello World!");
    println(f"Grade: {grade(100)}");
    return 0;
} : FSS_Cleanup_Frame # effect {!IO.Console.Output};