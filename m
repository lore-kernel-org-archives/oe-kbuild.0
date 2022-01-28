Content-Type: multipart/mixed; boundary="===============3973028559133075429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 9/9] fsdax: set a CoW flag when associate reflink mappings
Date: Sat, 29 Jan 2022 05:03:24 +0800
Message-ID: <202201290206.TU7AHhWg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3973028559133075429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220127124058.1172422-10-ruansy.fnst@fujitsu.com>
References: <20220127124058.1172422-10-ruansy.fnst@fujitsu.com>
TO: Shiyang Ruan <ruansy.fnst@fujitsu.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-xfs(a)vger.kernel.org
TO: nvdimm(a)lists.linux.dev
TO: linux-mm(a)kvack.org
TO: linux-fsdevel(a)vger.kernel.org
CC: djwong(a)kernel.org
CC: dan.j.williams(a)intel.com
CC: david(a)fromorbit.com
CC: hch(a)infradead.org
CC: jane.chu(a)oracle.com

Hi Shiyang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc1]
[cannot apply to xfs-linux/for-next hnaz-mm/master next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shiyang-Ruan/fsdax-introdu=
ce-fs-query-to-support-reflink/20220127-204239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220129/202201290206.TU7AHhWg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/26822296a70d211de3c5f4ef9=
03d4c4cf29179bd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shiyang-Ruan/fsdax-introduce-fs-qu=
ery-to-support-reflink/20220127-204239
        git checkout 26822296a70d211de3c5f4ef903d4c4cf29179bd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           *op++ =3D (u8) u;
                           ~~~~~~^~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   arch/x86/kernel/cpu/intel.c:925:4: warning: 1st function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
                           intel_tlb_lookup(desc[j]);
                           ^                ~~~~~~~
   arch/x86/kernel/cpu/intel.c:909:6: note: Assuming field 'cpuid_level' is=
 >=3D 2
           if (c->cpuid_level < 2)
               ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:909:2: note: Taking false branch
           if (c->cpuid_level < 2)
           ^
   arch/x86/kernel/cpu/intel.c:915:15: note: Assuming 'i' is < 'n'
           for (i =3D 0 ; i < n ; i++) {
                        ^~~~~
   arch/x86/kernel/cpu/intel.c:915:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0 ; i < n ; i++) {
           ^
   arch/x86/kernel/cpu/intel.c:916:3: note: Calling 'cpuid'
                   cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/processor.h:604:2: note: Calling 'native_cpuid'
           __cpuid(eax, ebx, ecx, edx);
           ^
   arch/x86/include/asm/processor.h:579:19: note: expanded from macro '__cp=
uid'
   #define __cpuid                 native_cpuid
                                   ^
   arch/x86/include/asm/processor.h:604:2: note: Returning from 'native_cpu=
id'
           __cpuid(eax, ebx, ecx, edx);
           ^
   arch/x86/include/asm/processor.h:579:19: note: expanded from macro '__cp=
uid'
   #define __cpuid                 native_cpuid
                                   ^
   arch/x86/kernel/cpu/intel.c:916:3: note: Returning from 'cpuid'
                   cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:920:8: note: Assuming the condition is false
                           if (regs[j] & (1 << 31))
                               ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel.c:920:4: note: Taking false branch
                           if (regs[j] & (1 << 31))
                           ^
   arch/x86/kernel/cpu/intel.c:919:3: note: Loop condition is false. Execut=
ion continues on line 924
                   for (j =3D 0 ; j < 3 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:924:8: note: The value 1 is assigned to 'j'
                   for (j =3D 1 ; j < 16 ; j++)
                        ^~~~~
   arch/x86/kernel/cpu/intel.c:924:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (j =3D 1 ; j < 16 ; j++)
                   ^
   arch/x86/kernel/cpu/intel.c:925:4: note: 1st function call argument is a=
n uninitialized value
                           intel_tlb_lookup(desc[j]);
                           ^                ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/dax.c:339:2: warning: Value stored to 'mapping' is never read [clang-=
analyzer-deadcode.DeadStores]
           mapping =3D (struct address_space *)PAGE_MAPPING_DAX_COW;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:339:2: note: Value stored to 'mapping' is never read
           mapping =3D (struct address_space *)PAGE_MAPPING_DAX_COW;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:1813:25: warning: The result of the left shift is undefined due=
 to shifting by '4294967295', which is greater or equal to the width of typ=
e 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           size_t len =3D PAGE_SIZE << order;
                                  ^  ~~~~~
   fs/dax.c:1812:23: note: Calling 'pe_order'
           unsigned int order =3D pe_order(pe_size);
                                ^~~~~~~~~~~~~~~~~
   fs/dax.c:35:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PTE
           if (pe_size =3D=3D PE_SIZE_PTE)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:35:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PTE)
           ^
   fs/dax.c:37:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PMD
           if (pe_size =3D=3D PE_SIZE_PMD)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:37:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PMD)
           ^
   fs/dax.c:39:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PUD
           if (pe_size =3D=3D PE_SIZE_PUD)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:39:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PUD)
           ^
   fs/dax.c:41:2: note: Returning the value 4294967295
           return ~0;
           ^~~~~~~~~
   fs/dax.c:1812:23: note: Returning from 'pe_order'
           unsigned int order =3D pe_order(pe_size);
                                ^~~~~~~~~~~~~~~~~
   fs/dax.c:1812:2: note: 'order' initialized to 4294967295
           unsigned int order =3D pe_order(pe_size);
           ^~~~~~~~~~~~~~~~~~
   fs/dax.c:1813:25: note: The result of the left shift is undefined due to=
 shifting by '4294967295', which is greater or equal to the width of type '=
unsigned long'
           size_t len =3D PAGE_SIZE << order;
                                  ^  ~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/crypto/fname.c:209:18: warning: The right operand of '|' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   ac =3D (ac << 8) | src[i];
                                  ^
   fs/crypto/fname.c:346:2: note: Taking false branch
           if (fscrypt_is_dot_dotdot(&qname)) {
           ^
   fs/crypto/fname.c:353:6: note: Assuming field 'len' is >=3D FS_CRYPTO_BL=
OCK_SIZE
           if (iname->len < FS_CRYPTO_BLOCK_SIZE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/fname.c:353:2: note: Taking false branch
           if (iname->len < FS_CRYPTO_BLOCK_SIZE)
           ^
   fs/crypto/fname.c:356:2: note: Taking false branch
           if (fscrypt_has_encryption_key(inode))
           ^
   fs/crypto/fname.c:363:2: note: Taking false branch
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, dirhash) !=
=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/crypto/fname.c:363:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, dirhash) !=
=3D
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/crypto/fname.c:365:2: note: Taking false branch
           BUILD_BUG_ON(offsetofend(struct fscrypt_nokey_name, bytes) !=3D

vim +/mapping +339 fs/dax.c

d2c997c0f14535 Dan Williams   2017-12-22  328  =

d2c997c0f14535 Dan Williams   2017-12-22  329  /*
d2c997c0f14535 Dan Williams   2017-12-22  330   * Iterate through all mappe=
d pfns represented by an entry, i.e. skip
d2c997c0f14535 Dan Williams   2017-12-22  331   * 'empty' and 'zero' entrie=
s.
d2c997c0f14535 Dan Williams   2017-12-22  332   */
d2c997c0f14535 Dan Williams   2017-12-22  333  #define for_each_mapped_pfn(=
entry, pfn) \
a77d19f46a37c0 Matthew Wilcox 2018-03-27  334  	for (pfn =3D dax_to_pfn(ent=
ry); \
a77d19f46a37c0 Matthew Wilcox 2018-03-27  335  			pfn < dax_end_pfn(entry);=
 pfn++)
d2c997c0f14535 Dan Williams   2017-12-22  336  =

26822296a70d21 Shiyang Ruan   2022-01-27  337  static inline void dax_mappi=
ng_set_cow_flag(struct address_space *mapping)
26822296a70d21 Shiyang Ruan   2022-01-27  338  {
26822296a70d21 Shiyang Ruan   2022-01-27 @339  	mapping =3D (struct address=
_space *)PAGE_MAPPING_DAX_COW;
26822296a70d21 Shiyang Ruan   2022-01-27  340  }
26822296a70d21 Shiyang Ruan   2022-01-27  341  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3973028559133075429==--

