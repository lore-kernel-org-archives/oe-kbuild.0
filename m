Content-Type: multipart/mixed; boundary="===============8075855205339306542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/core.c:872:4: warning: Potential leak of memory pointed to by '_x' [clang-analyzer-unix.Malloc]
Date: Wed, 23 Feb 2022 17:56:46 +0800
Message-ID: <202202231730.oCnZdD6N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8075855205339306542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: 0aba691a7443a7541c1dc56423e0c92cc6ea7164 riscv: Introduce va_kernel=
_pa_offset for 32-bit kernel
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220220 (https://download.01.org/0day-ci/arc=
hive/20220223/202202231730.oCnZdD6N-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0aba691a7443a7541c1dc56423e0c92cc6ea7164
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0aba691a7443a7541c1dc56423e0c92cc6ea7164
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/scsi/libsas/sas_expander.c:672:7: note: 'resp' is non-null
           if (!resp) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/scsi/libsas/sas_expander.c:672:2: note: '?' condition is false
           if (!resp) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/libsas/sas_expander.c:672:2: note: Taking false branch
           if (!resp) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/libsas/sas_expander.c:683:2: note: Assuming 'res' is 0
           if (res)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/libsas/sas_expander.c:683:2: note: '?' condition is false
           if (res)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/libsas/sas_expander.c:683:6: note: 'res' is 0
           if (res)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/scsi/libsas/sas_expander.c:683:2: note: '?' condition is false
           if (res)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/libsas/sas_expander.c:683:2: note: Taking false branch
           if (res)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/libsas/sas_expander.c:686:29: note: Calling 'get_unaligned_=
be32'
           phy->invalid_dword_count =3D get_unaligned_be32(&resp[12]);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:62:9: note: 1st function call argument i=
s an uninitialized value
           return be32_to_cpu(__get_unaligned_t(__be32, p));
                  ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^                    ~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/nvme/host/core.c:872:4: warning: Potential leak of memory pointe=
d to by '_x' [clang-analyzer-unix.Malloc]
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
   drivers/nvme/host/core.c:845:10: note: Calling 'kzalloc'
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:845:10: note: Returned allocated memory
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:846:6: note: Assuming 'range' is non-null
           if (!range) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:846:7: note: 'range' is non-null
           if (!range) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:846:2: note: Taking false branch
           if (!range) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:858:2: note: Assuming field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:858:2: note: Field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:11: note: expanded from macro '__rq_for_each_=
bio'
           if ((rq->bio))                  \
                    ^
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:871:7: note: '_x' is >=3D -1073741824
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:871:7: note: Left side of '&&' is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:138:27: note: expanded from macro '__virt_=
to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:130:2: note: expanded from macro '__va_to_=
pa_nodebug'
           is_linear_mapping(_x) ?                                         =
        \
           ^
   arch/riscv/include/asm/page.h:109:3: note: expanded from macro 'is_linea=
r_mapping'
           ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < ker=
nel_map.virt_addr))
            ^
   drivers/nvme/host/core.c:871:7: note: Left side of '||' is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:138:27: note: expanded from macro '__virt_=
to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:130:2: note: expanded from macro '__va_to_=
pa_nodebug'
           is_linear_mapping(_x) ?                                         =
        \
           ^
   arch/riscv/include/asm/page.h:109:52: note: expanded from macro 'is_line=
ar_mapping'
           ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < ker=
nel_map.virt_addr))
                                                             ^
   drivers/nvme/host/core.c:871:3: note: Assuming the condition is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:871:3: note: '?' condition is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:871:3: note: Taking true branch
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:872:4: note: Potential leak of memory pointed t=
o by '_x'
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
>> drivers/nvme/host/core.c:872:4: warning: Potential leak of memory pointe=
d to by '_y' [clang-analyzer-unix.Malloc]
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
   drivers/nvme/host/core.c:845:10: note: Calling 'kzalloc'
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:845:10: note: Returned allocated memory
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:846:6: note: Assuming 'range' is non-null
           if (!range) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:846:7: note: 'range' is non-null
           if (!range) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:846:2: note: Taking false branch
           if (!range) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:858:2: note: Assuming field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:858:2: note: Field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:11: note: expanded from macro '__rq_for_each_=
bio'
           if ((rq->bio))                  \
                    ^
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6078:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6079:3: note: Control jumps to line 6129
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6131:2: note: '?' condition is false
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6131:2: note: '?' condition is false
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6131:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6140:6: note: Assuming the condition is false
           if (!ext4_should_journal_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inode.c:6140:2: note: '?' condition is false
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6140:6: note: Assuming the condition is true
           if (!ext4_should_journal_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ext4/inode.c:6140:2: note: '?' condition is true
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6140:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6141:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/nvme/host/core.c:872:4: warning: Potential leak of memory pointe=
d to by '_x' [clang-analyzer-unix.Malloc]
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
   drivers/nvme/host/core.c:845:10: note: Calling 'kzalloc'
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:845:10: note: Returned allocated memory
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:846:6: note: Assuming 'range' is non-null
           if (!range) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:846:7: note: 'range' is non-null
           if (!range) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:846:2: note: Taking false branch
           if (!range) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:858:2: note: Assuming field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:858:2: note: Field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:11: note: expanded from macro '__rq_for_each_=
bio'
           if ((rq->bio))                  \
                    ^
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:871:7: note: '_x' is >=3D -1073741824
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:871:7: note: Left side of '&&' is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:138:27: note: expanded from macro '__virt_=
to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:130:2: note: expanded from macro '__va_to_=
pa_nodebug'
           is_linear_mapping(_x) ?                                         =
        \
           ^
   arch/riscv/include/asm/page.h:109:3: note: expanded from macro 'is_linea=
r_mapping'
           ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < ker=
nel_map.virt_addr))
            ^
   drivers/nvme/host/core.c:871:7: note: Left side of '||' is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                       ^
   arch/riscv/include/asm/page.h:152:42: note: expanded from macro 'virt_to=
_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:149:41: note: expanded from macro 'virt_to=
_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:143:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:138:27: note: expanded from macro '__virt_=
to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:130:2: note: expanded from macro '__va_to_=
pa_nodebug'
           is_linear_mapping(_x) ?                                         =
        \
           ^
   arch/riscv/include/asm/page.h:109:52: note: expanded from macro 'is_line=
ar_mapping'
           ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < ker=
nel_map.virt_addr))
                                                             ^
   drivers/nvme/host/core.c:871:3: note: Assuming the condition is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:871:3: note: '?' condition is true
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:871:3: note: Taking true branch
                   if (virt_to_page(range) =3D=3D ns->ctrl->discard_page)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:872:4: note: Potential leak of memory pointed t=
o by '_x'
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
>> drivers/nvme/host/core.c:872:4: warning: Potential leak of memory pointe=
d to by '_y' [clang-analyzer-unix.Malloc]
                           clear_bit_unlock(0, &ns->ctrl->discard_page_busy=
);
                           ^
   drivers/nvme/host/core.c:845:10: note: Calling 'kzalloc'
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:845:10: note: Returned allocated memory
           range =3D kzalloc(alloc_size, GFP_ATOMIC | __GFP_NOWARN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:846:6: note: Assuming 'range' is non-null
           if (!range) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:846:7: note: 'range' is non-null
           if (!range) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:846:2: note: '?' condition is false
           if (!range) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:846:2: note: Taking false branch
           if (!range) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:858:2: note: Assuming field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:858:2: note: Field 'bio' is null
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:11: note: expanded from macro '__rq_for_each_=
bio'
           if ((rq->bio))                  \
                    ^
   drivers/nvme/host/core.c:858:2: note: '?' condition is false
           __rq_for_each_bio(bio, req) {
           ^
   include/linux/blkdev.h:848:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +/_x +872 drivers/nvme/host/core.c

8093f7ca73c163 Ming Lin             2016-04-12  830  =

fc17b6534eb839 Christoph Hellwig    2017-06-03  831  static blk_status_t nv=
me_setup_discard(struct nvme_ns *ns, struct request *req,
8093f7ca73c163 Ming Lin             2016-04-12  832  		struct nvme_command =
*cmnd)
8093f7ca73c163 Ming Lin             2016-04-12  833  {
b35ba01ea69791 Christoph Hellwig    2017-02-08  834  	unsigned short segmen=
ts =3D blk_rq_nr_discard_segments(req), n =3D 0;
8093f7ca73c163 Ming Lin             2016-04-12  835  	struct nvme_dsm_range=
 *range;
b35ba01ea69791 Christoph Hellwig    2017-02-08  836  	struct bio *bio;
8093f7ca73c163 Ming Lin             2016-04-12  837  =

530436c45ef2e4 Eduard Hasenleithner 2019-11-12  838  	/*
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  839  	 * Some devices do no=
t consider the DSM 'Number of Ranges' field when
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  840  	 * determining how mu=
ch data to DMA. Always allocate memory for maximum
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  841  	 * number of segments=
 to prevent device reading beyond end of buffer.
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  842  	 */
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  843  	static const size_t a=
lloc_size =3D sizeof(*range) * NVME_DSM_MAX_RANGES;
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  844  =

530436c45ef2e4 Eduard Hasenleithner 2019-11-12  845  	range =3D kzalloc(all=
oc_size, GFP_ATOMIC | __GFP_NOWARN);
cb5b7262b011cf Jens Axboe           2018-12-12  846  	if (!range) {
cb5b7262b011cf Jens Axboe           2018-12-12  847  		/*
cb5b7262b011cf Jens Axboe           2018-12-12  848  		 * If we fail alloca=
tion our range, fallback to the controller
cb5b7262b011cf Jens Axboe           2018-12-12  849  		 * discard page. If =
that's also busy, it's safe to return
cb5b7262b011cf Jens Axboe           2018-12-12  850  		 * busy, as we know =
we can make progress once that's freed.
cb5b7262b011cf Jens Axboe           2018-12-12  851  		 */
cb5b7262b011cf Jens Axboe           2018-12-12  852  		if (test_and_set_bit=
_lock(0, &ns->ctrl->discard_page_busy))
fc17b6534eb839 Christoph Hellwig    2017-06-03  853  			return BLK_STS_RESO=
URCE;
8093f7ca73c163 Ming Lin             2016-04-12  854  =

cb5b7262b011cf Jens Axboe           2018-12-12  855  		range =3D page_addre=
ss(ns->ctrl->discard_page);
cb5b7262b011cf Jens Axboe           2018-12-12  856  	}
cb5b7262b011cf Jens Axboe           2018-12-12  857  =

b35ba01ea69791 Christoph Hellwig    2017-02-08  858  	__rq_for_each_bio(bio=
, req) {
314d48dd224897 Damien Le Moal       2019-10-21  859  		u64 slba =3D nvme_se=
ct_to_lba(ns, bio->bi_iter.bi_sector);
b35ba01ea69791 Christoph Hellwig    2017-02-08  860  		u32 nlb =3D bio->bi_=
iter.bi_size >> ns->lba_shift;
b35ba01ea69791 Christoph Hellwig    2017-02-08  861  =

8cb6af7b3a6d47 Keith Busch          2018-01-31  862  		if (n < segments) {
b35ba01ea69791 Christoph Hellwig    2017-02-08  863  			range[n].cattr =3D =
cpu_to_le32(0);
b35ba01ea69791 Christoph Hellwig    2017-02-08  864  			range[n].nlb =3D cp=
u_to_le32(nlb);
b35ba01ea69791 Christoph Hellwig    2017-02-08  865  			range[n].slba =3D c=
pu_to_le64(slba);
8cb6af7b3a6d47 Keith Busch          2018-01-31  866  		}
b35ba01ea69791 Christoph Hellwig    2017-02-08  867  		n++;
b35ba01ea69791 Christoph Hellwig    2017-02-08  868  	}
b35ba01ea69791 Christoph Hellwig    2017-02-08  869  =

b35ba01ea69791 Christoph Hellwig    2017-02-08  870  	if (WARN_ON_ONCE(n !=
=3D segments)) {
cb5b7262b011cf Jens Axboe           2018-12-12 @871  		if (virt_to_page(ran=
ge) =3D=3D ns->ctrl->discard_page)
cb5b7262b011cf Jens Axboe           2018-12-12 @872  			clear_bit_unlock(0,=
 &ns->ctrl->discard_page_busy);
cb5b7262b011cf Jens Axboe           2018-12-12  873  		else
b35ba01ea69791 Christoph Hellwig    2017-02-08  874  			kfree(range);
fc17b6534eb839 Christoph Hellwig    2017-06-03  875  		return BLK_STS_IOERR;
b35ba01ea69791 Christoph Hellwig    2017-02-08  876  	}
8093f7ca73c163 Ming Lin             2016-04-12  877  =

8093f7ca73c163 Ming Lin             2016-04-12  878  	cmnd->dsm.opcode =3D =
nvme_cmd_dsm;
ed754e5deeb17f Christoph Hellwig    2017-11-09  879  	cmnd->dsm.nsid =3D cp=
u_to_le32(ns->head->ns_id);
f1dd03a84dbf3e Christoph Hellwig    2017-03-31  880  	cmnd->dsm.nr =3D cpu_=
to_le32(segments - 1);
8093f7ca73c163 Ming Lin             2016-04-12  881  	cmnd->dsm.attributes =
=3D cpu_to_le32(NVME_DSMGMT_AD);
8093f7ca73c163 Ming Lin             2016-04-12  882  =

f9d03f96b98800 Christoph Hellwig    2016-12-08  883  	req->special_vec.bv_p=
age =3D virt_to_page(range);
f9d03f96b98800 Christoph Hellwig    2016-12-08  884  	req->special_vec.bv_o=
ffset =3D offset_in_page(range);
530436c45ef2e4 Eduard Hasenleithner 2019-11-12  885  	req->special_vec.bv_l=
en =3D alloc_size;
f9d03f96b98800 Christoph Hellwig    2016-12-08  886  	req->rq_flags |=3D RQ=
F_SPECIAL_PAYLOAD;
8093f7ca73c163 Ming Lin             2016-04-12  887  =

fc17b6534eb839 Christoph Hellwig    2017-06-03  888  	return BLK_STS_OK;
8093f7ca73c163 Ming Lin             2016-04-12  889  }
8093f7ca73c163 Ming Lin             2016-04-12  890  =


:::::: The code at line 872 was first introduced by commit
:::::: cb5b7262b011cfb793519bf97e54dff5282da23c nvme: provide fallback for =
discard alloc failure

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8075855205339306542==--

