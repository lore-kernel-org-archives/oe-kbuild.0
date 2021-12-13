Content-Type: multipart/mixed; boundary="===============2583207358332686026=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/bitops/fls64.h:21:14: warning: The result of the '>>' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 13 Dec 2021 10:33:44 +0800
Message-ID: <202112131045.es1rz6j5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2583207358332686026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20211128 (https://download.01.org/0day-ci/arc=
hive/20211213/202112131045.es1rz6j5-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1636:6: note: Left side of '&&' i=
s true
           if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1636:2: note: Taking false branch
           if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1645:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1645:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1653:7: note: 'nodes' is null
                   if (nodes) {
                       ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1653:3: note: Taking false branch
                   if (nodes) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1661:7: note: 'pages_addr' is null
                   if (pages_addr) {
                       ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1661:3: note: Taking false branch
                   if (pages_addr) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1691:10: note: Taking true branch
                   } else if (flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) {
                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1697:7: note: Calling 'amdgpu_vm_=
update_ptes'
                   r =3D amdgpu_vm_update_ptes(&params, start, tmp, addr, f=
lags);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1442:2: note: Calling 'amdgpu_vm_=
fragment'
           amdgpu_vm_fragment(params, frag_start, end, flags, &frag, &frag_=
end);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1395:6: note: Assuming field 'asi=
c_type' is >=3D CHIP_VEGA10
           if (params->adev->asic_type < CHIP_VEGA10)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1395:2: note: Taking false branch
           if (params->adev->asic_type < CHIP_VEGA10)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1401:6: note: Assuming field 'pag=
es_addr' is non-null
           if (params->pages_addr) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1401:2: note: Taking true branch
           if (params->pages_addr) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1404:3: note: Returning without w=
riting to 'params->unlocked', which participates in a condition later
                   return;
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1442:2: note: Returning from 'amd=
gpu_vm_fragment'
           amdgpu_vm_fragment(params, frag_start, end, flags, &frag, &frag_=
end);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1446:9: note: Assuming 'end' is >=
 field 'pfn'
           while (cursor.pfn < end) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1446:2: note: Loop condition is t=
rue.  Entering loop body
           while (cursor.pfn < end) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1451:7: note: Assuming field 'unl=
ocked' is true
                   if (!params->unlocked) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1451:3: note: Taking false branch
                   if (!params->unlocked) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1461:11: note: Calling 'amdgpu_vm=
_level_shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:125:2: note: Control jumps to the=
 'default' case at line 133
           switch (level) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:134:3: note: Returning the value =
4294967295
                   return ~0;
                   ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1461:11: note: Returning from 'am=
dgpu_vm_level_shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1461:3: note: The value 429496729=
5 is assigned to 'shift'
                   shift =3D amdgpu_vm_level_shift(adev, cursor.level);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1463:15: note: Field 'unlocked' i=
s true
                   if (params->unlocked) {
                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1463:3: note: Taking true branch
                   if (params->unlocked) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1465:8: note: Assuming the condit=
ion is false
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1465:4: note: Taking false branch
                           if (amdgpu_vm_pt_descendant(adev, &cursor))
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1492:7: note: Assuming 'pt' is no=
n-null
                   if (!pt) {
                       ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1492:3: note: Taking false branch
                   if (!pt) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1510:41: note: The result of the =
left shift is undefined due to shifting by '4294967295', which is greater o=
r equal to the width of type 'uint64_t'
                   incr =3D (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
                                                         ^  ~~~~~
>> include/asm-generic/bitops/fls64.h:21:14: warning: The result of the '>>=
' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
           __u32 h =3D x >> 32;
                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2677:6: note: Assuming the condit=
ion is true
           if (amdgpu_vm_size !=3D -1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2677:2: note: Taking true branch
           if (amdgpu_vm_size !=3D -1) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2679:7: note: Assuming 'vm_size' =
is <=3D 'max_size'
                   if (vm_size > max_size) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2679:3: note: Taking false branch
                   if (vm_size > max_size) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2712:8: note: '?' condition is fa=
lse
           tmp =3D roundup_pow_of_two(adev->vm_manager.max_pfn);
                 ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2713:6: note: Assuming the condit=
ion is false
           if (amdgpu_vm_block_size !=3D -1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2713:2: note: Taking false branch
           if (amdgpu_vm_block_size !=3D -1)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2716:31: note: Assuming '__UNIQUE=
_ID___x451' is >=3D '__UNIQUE_ID___y452'
           adev->vm_manager.num_level =3D min(max_level, (unsigned)tmp);
                                        ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2716:31: note: '?' condition is f=
alse
           adev->vm_manager.num_level =3D min(max_level, (unsigned)tmp);
                                        ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2717:2: note: Control jumps to th=
e 'default' case@line 2727
           switch (adev->vm_manager.num_level) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2731:6: note: Assuming the condit=
ion is false
           if (amdgpu_vm_block_size !=3D -1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2731:2: note: Taking false branch
           if (amdgpu_vm_block_size !=3D -1)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2736:11: note: Assuming field 'nu=
m_level' is <=3D 1
           else if (adev->vm_manager.num_level > 1)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2736:7: note: Taking false branch
           else if (adev->vm_manager.num_level > 1)
                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2739:33: note: Calling 'amdgpu_vm=
_get_block_size'
                   adev->vm_manager.block_size =3D amdgpu_vm_get_block_size=
(tmp);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2648:18: note: '?' condition is f=
alse
           unsigned bits =3D ilog2(vm_size) + 18;
                           ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2648:18: note: '?' condition is f=
alse
           unsigned bits =3D ilog2(vm_size) + 18;
                           ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2648:18: note: Calling '__ilog2_u=
64'
           unsigned bits =3D ilog2(vm_size) + 18;
                           ^
   include/linux/log2.h:163:2: note: expanded from macro 'ilog2'
           __ilog2_u64(n)                  \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:32:9: note: Calling 'fls64'
           return fls64(n) - 1;
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:21:14: note: The result of the '>>' e=
xpression is undefined
           __u32 h =3D x >> 32;
                     ~~^~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);

vim +21 include/asm-generic/bitops/fls64.h

a54baa1487c51c Akinobu Mita           2006-03-26   6  =

d57594c203b1e7 Alexander van Heukelum 2008-03-15   7  /**
d57594c203b1e7 Alexander van Heukelum 2008-03-15   8   * fls64 - find last =
set bit in a 64-bit word
d57594c203b1e7 Alexander van Heukelum 2008-03-15   9   * @x: the word to se=
arch
d57594c203b1e7 Alexander van Heukelum 2008-03-15  10   *
d57594c203b1e7 Alexander van Heukelum 2008-03-15  11   * This is defined in=
 a similar way as the libc and compiler builtin
d57594c203b1e7 Alexander van Heukelum 2008-03-15  12   * ffsll, but returns=
 the position of the most significant set bit.
d57594c203b1e7 Alexander van Heukelum 2008-03-15  13   *
d57594c203b1e7 Alexander van Heukelum 2008-03-15  14   * fls64(value) retur=
ns 0 if value is 0 or the position of the last
d57594c203b1e7 Alexander van Heukelum 2008-03-15  15   * set bit if value i=
s nonzero. The last (most significant) bit is
d57594c203b1e7 Alexander van Heukelum 2008-03-15  16   *@position 64.
d57594c203b1e7 Alexander van Heukelum 2008-03-15  17   */
d57594c203b1e7 Alexander van Heukelum 2008-03-15  18  #if BITS_PER_LONG =3D=
=3D 32
c8399943bdb70f Andi Kleen             2009-01-12  19  static __always_inlin=
e int fls64(__u64 x)
2dfc383ad587bb Akinobu Mita           2006-03-26  20  {
2dfc383ad587bb Akinobu Mita           2006-03-26 @21  	__u32 h =3D x >> 32;
2dfc383ad587bb Akinobu Mita           2006-03-26  22  	if (h)
2dfc383ad587bb Akinobu Mita           2006-03-26  23  		return fls(h) + 32;
2dfc383ad587bb Akinobu Mita           2006-03-26  24  	return fls(x);
2dfc383ad587bb Akinobu Mita           2006-03-26  25  }
d57594c203b1e7 Alexander van Heukelum 2008-03-15  26  #elif BITS_PER_LONG =
=3D=3D 64
c8399943bdb70f Andi Kleen             2009-01-12  27  static __always_inlin=
e int fls64(__u64 x)
d57594c203b1e7 Alexander van Heukelum 2008-03-15  28  {
d57594c203b1e7 Alexander van Heukelum 2008-03-15  29  	if (x =3D=3D 0)
d57594c203b1e7 Alexander van Heukelum 2008-03-15  30  		return 0;
d57594c203b1e7 Alexander van Heukelum 2008-03-15  31  	return __fls(x) + 1;
d57594c203b1e7 Alexander van Heukelum 2008-03-15  32  }
d57594c203b1e7 Alexander van Heukelum 2008-03-15  33  #else
d57594c203b1e7 Alexander van Heukelum 2008-03-15  34  #error BITS_PER_LONG =
not 32 or 64
d57594c203b1e7 Alexander van Heukelum 2008-03-15  35  #endif
2dfc383ad587bb Akinobu Mita           2006-03-26  36  =


:::::: The code at line 21 was first introduced by commit
:::::: 2dfc383ad587bbead84739a9ff9273df3eda983d [PATCH] bitops: generic fls=
64()

:::::: TO: Akinobu Mita <mita@miraclelinux.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2583207358332686026==--

