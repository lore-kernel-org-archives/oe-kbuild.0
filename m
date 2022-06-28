Content-Type: multipart/mixed; boundary="===============0274301821396605463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dma-direct: use the correct size for dma_set_encrypted()
Date: Wed, 29 Jun 2022 06:07:43 +0800
Message-ID: <202206290627.5IxYSe6J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0274301821396605463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/dm=
a/direct.c:325:15: warning: Value stored to 'page_order' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220622191424.15777-1-decui@microsoft.com>
References: <20220622191424.15777-1-decui@microsoft.com>
TO: Dexuan Cui <decui@microsoft.com>

Hi Dexuan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.19-rc4 next-20220628]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dexuan-Cui/dma-direc=
t-use-the-correct-size-for-dma_set_encrypted/20220623-031721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
de5c208d533a46a074eb46ea17f672cc005a7269
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: s390-randconfig-c005-20220625 (https://download.01.org/0day-ci/arch=
ive/20220629/202206290627.5IxYSe6J-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd=
3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2288b269c064b0b811f=
cb34ef45a306690456a7a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dexuan-Cui/dma-direct-use-the-corr=
ect-size-for-dma_set_encrypted/20220623-031721
        git checkout 2288b269c064b0b811fcb34ef45a306690456a7a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:5465:5: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                                   copy_to_user_page(vma, page, addr,
                                   ^
   include/asm-generic/cacheflush.h:108:3: note: expanded from macro 'copy_=
to_user_page'
                   memcpy(dst, src, len); \
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:5469:5: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                                   copy_from_user_page(vma, page, addr,
                                   ^
   include/asm-generic/cacheflush.h:115:2: note: expanded from macro 'copy_=
from_user_page'
           memcpy(dst, src, len)
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:5469:5: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                                   copy_from_user_page(vma, page, addr,
                                   ^
   include/asm-generic/cacheflush.h:115:2: note: expanded from macro 'copy_=
from_user_page'
           memcpy(dst, src, len)
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:5530:25: warning: Dereference of null pointer [clang-analyze=
r-core.NullDereference]
           struct mm_struct *mm =3D current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5530:25: note: Dereference of null pointer
           struct mm_struct *mm =3D current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 65 warnings (53 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (43 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   kernel/dma/direct.c:302:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ret, 0, size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/dma/direct.c:302:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ret, 0, size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> kernel/dma/direct.c:325:15: warning: Value stored to 'page_order' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int page_order =3D get_order(size);
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~
   kernel/dma/direct.c:325:15: note: Value stored to 'page_order' during it=
s initialization is never read
           unsigned int page_order =3D get_order(size);
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~
   kernel/dma/direct.c:383:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ret, 0, size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/dma/direct.c:383:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ret, 0, size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 55 warnings (43 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   arch/s390/kernel/diag.c:130:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           this_cpu_inc(diag_stat.counter[nr]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   arch/s390/kernel/diag.c:217:2: note: Calling 'diag_stat_inc'
           diag_stat_inc(DIAG_STAT_X26C);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/diag.c:130:2: note: Loop condition is false.  Exiting l=
oop
           this_cpu_inc(diag_stat.counter[nr]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/kernel/diag.c:130:2: note: Control jumps to 'case 4:'  at line=
 130
           this_cpu_inc(diag_stat.counter[nr]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   arch/s390/kernel/diag.c:130:2: note: Loop condition is false.  Exiting l=
oop
           this_cpu_inc(diag_stat.counter[nr]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:33:10: note: expanded from macro 'arch_th=
is_cpu_to_op_simple'
           ptr__ =3D raw_cpu_ptr(&(pcp));                                  =
  \
                   ^

vim +/page_order +325 kernel/dma/direct.c

a8463d4b0e47d1f lib/dma-noop.c      Christian Borntraeger 2016-02-02  321  =

2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  322  =
void dma_direct_free(struct device *dev, size_t size,
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  323  =
		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
a8463d4b0e47d1f lib/dma-noop.c      Christian Borntraeger 2016-02-02  324  {
c10f07aa27dadf5 lib/dma-direct.c    Christoph Hellwig     2018-03-19 @325  =
	unsigned int page_order =3D get_order(size);
080321d3b3139b3 lib/dma-direct.c    Christoph Hellwig     2017-12-22  326  =

849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  327  =
	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
f4111e39a52aa5d kernel/dma/direct.c Claire Chang          2021-06-19  328  =
	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  329  =
		/* cpu_addr is a struct page cookie, not a kernel address */
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  330  =
		dma_free_contiguous(dev, cpu_addr, size);
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  331  =
		return;
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  332  =
	}
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  333  =

2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  334  =
	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  335  =
	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  336  =
	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
3de18c865f504ab kernel/dma/direct.c Linus Torvalds        2021-09-03  337  =
	    !dev_is_dma_coherent(dev) &&
f4111e39a52aa5d kernel/dma/direct.c Claire Chang          2021-06-19  338  =
	    !is_swiotlb_for_alloc(dev)) {
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  339  =
		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  340  =
		return;
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  341  =
	}
2f5388a29be82a6 kernel/dma/direct.c Christoph Hellwig     2020-08-17  342  =

faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  343  =
	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  344  =
	    !dev_is_dma_coherent(dev)) {
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  345  =
		if (!dma_release_from_global_coherent(page_order, cpu_addr))
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  346  =
			WARN_ON_ONCE(1);
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  347  =
		return;
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  348  =
	}
faf4ef823ac5f3b kernel/dma/direct.c Christoph Hellwig     2021-06-23  349  =

76a19940bd62a81 kernel/dma/direct.c David Rientjes        2020-04-14  350  =
	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
849facea92fa68d kernel/dma/direct.c Christoph Hellwig     2020-10-07  351  =
	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
76a19940bd62a81 kernel/dma/direct.c David Rientjes        2020-04-14  352  =
	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
76a19940bd62a81 kernel/dma/direct.c David Rientjes        2020-04-14  353  =
		return;
76a19940bd62a81 kernel/dma/direct.c David Rientjes        2020-04-14  354  =

f5ff79fddf0efec kernel/dma/direct.c Christoph Hellwig     2022-02-26  355  =
	if (is_vmalloc_addr(cpu_addr)) {
3acac065508f6cc kernel/dma/direct.c Christoph Hellwig     2019-10-29  356  =
		vunmap(cpu_addr);
5570449b6876f21 kernel/dma/direct.c Christoph Hellwig     2021-10-21  357  =
	} else {
5570449b6876f21 kernel/dma/direct.c Christoph Hellwig     2021-10-21  358  =
		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
999a5d1203baa7c kernel/dma/direct.c Christoph Hellwig     2020-02-21  359  =
			arch_dma_clear_uncached(cpu_addr, size);
2288b269c064b0b kernel/dma/direct.c Dexuan Cui            2022-06-22  360  =
		if (dma_set_encrypted(dev, cpu_addr, size))
a90cf3043748934 kernel/dma/direct.c Christoph Hellwig     2021-11-09  361  =
			return;
5570449b6876f21 kernel/dma/direct.c Christoph Hellwig     2021-10-21  362  =
	}
3acac065508f6cc kernel/dma/direct.c Christoph Hellwig     2019-10-29  363  =

f4111e39a52aa5d kernel/dma/direct.c Claire Chang          2021-06-19  364  =
	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
a8463d4b0e47d1f lib/dma-noop.c      Christian Borntraeger 2016-02-02  365  }
a8463d4b0e47d1f lib/dma-noop.c      Christian Borntraeger 2016-02-02  366  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0274301821396605463==--

