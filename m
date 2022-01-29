Content-Type: multipart/mixed; boundary="===============0386057882349594729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 11/35] mm: rcu safe vma freeing
Date: Sat, 29 Jan 2022 20:17:12 +0800
Message-ID: <202201292049.8ov9aDBO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0386057882349594729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220128131006.67712-12-michel@lespinasse.org>
References: <20220128131006.67712-12-michel@lespinasse.org>
TO: Michel Lespinasse <michel@lespinasse.org>
TO: "Linux-MM" <linux-mm@kvack.org>
TO: linux-kernel(a)vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: kernel-team(a)fb.com
CC: Laurent Dufour <ldufour@linux.ibm.com>
CC: Jerome Glisse <jglisse@google.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Michal Hocko <mhocko@suse.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Davidlohr Bueso <dave@stgolabs.net>

Hi Michel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc1 next-20220128]
[cannot apply to tip/x86/mm arm64/for-next/core powerpc/next hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michel-Lespinasse/Speculat=
ive-page-faults/20220128-212122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
145d9b498fc827b79c1260b4caa29a8e59d4c2b9
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220129/202201292049.8ov9aDBO-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e070569f2fa273212280128b7=
d07f3d39f0fbd27
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michel-Lespinasse/Speculative-page=
-faults/20220128-212122
        git checkout e070569f2fa273212280128b7d07f3d39f0fbd27
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:155:7: note: Assuming field 'offset' is 0
                   if (bf[0].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:155:3: note: Taking false branch
                   if (bf[0].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:159:6: note: Assuming field 'length' is 0
           if (!bf[1].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:159:2: note: Taking true branch
           if (!bf[1].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:160:7: note: Assuming field 'offset' is 0
                   if (bf[1].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:160:3: note: Taking false branch
                   if (bf[1].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:164:6: note: Assuming field 'length' is 0
           if (!bf[2].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:164:2: note: Taking true branch
           if (!bf[2].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:165:7: note: Assuming field 'offset' is 0
                   if (bf[2].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:165:3: note: Taking false branch
                   if (bf[2].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:2: note: Taking false branch
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:2: note: Taking false branch
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:177:9: note: Assuming 'offset' is >=3D 'en=
d'
           while (offset < end) {
                  ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:177:2: note: Loop condition is false. Exec=
ution continues on line 252
           while (offset < end) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:252:6: note: 'freeseen' is equal to 7
           if (freeseen !=3D 7)
               ^~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:252:2: note: Taking false branch
           if (freeseen !=3D 7)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:254:6: note: Assuming the condition is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:254:54: note: Left side of '||' is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
                                                               ^
   fs/xfs/libxfs/xfs_dir2_data.c:256:27: note: Access to field 'count' resu=
lts in a dereference of a null pointer (loaded from variable 'btp')
                   for (i =3D stale =3D 0; i < be32_to_cpu(btp->count); i++=
) {
                                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:58: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                                                            ^~
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
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
>> arch/x86/mm/pat/memtype.c:1098:24: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c:1092:6: note: Assuming 'vma' is null
           if (vma && !(vma->vm_flags & VM_PAT))
               ^~~
   arch/x86/mm/pat/memtype.c:1092:10: note: Left side of '&&' is false
           if (vma && !(vma->vm_flags & VM_PAT))
                   ^
   arch/x86/mm/pat/memtype.c:1097:6: note: Assuming 'paddr' is 0
           if (!paddr && !size) {
               ^~~~~~
   arch/x86/mm/pat/memtype.c:1097:6: note: Left side of '&&' is true
   arch/x86/mm/pat/memtype.c:1097:16: note: Assuming 'size' is 0
           if (!paddr && !size) {
                         ^~~~~
   arch/x86/mm/pat/memtype.c:1097:2: note: Taking true branch
           if (!paddr && !size) {
           ^
   arch/x86/mm/pat/memtype.c:1098:24: note: Dereference of null pointer
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   arch/x86/mm/kasan_init_64.c:131:3: warning: Value stored to 'p' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   p =3D early_alloc(PAGE_SIZE, nid, true);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:131:3: note: Value stored to 'p' is never re=
ad
                   p =3D early_alloc(PAGE_SIZE, nid, true);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:276:4: warning: Value stored to 'p' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           p =3D early_alloc(PAGE_SIZE, NUMA_NO_NODE, true);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:276:4: note: Value stored to 'p' is never re=
ad
                           p =3D early_alloc(PAGE_SIZE, NUMA_NO_NODE, true);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:301:2: warning: Value stored to 'p4d_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p4d_val &=3D __default_kernel_pte_mask;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:301:2: note: Value stored to 'p4d_val' is ne=
ver read
           p4d_val &=3D __default_kernel_pte_mask;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/kasan_init_64.c:312:7: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0; pgtable_l5_enabled() && i < PTRS_PER_P4D; i++)
                ^   ~
   arch/x86/mm/kasan_init_64.c:312:7: note: Value stored to 'i' is never re=
ad
           for (i =3D 0; pgtable_l5_enabled() && i < PTRS_PER_P4D; i++)
                ^   ~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ntfs3/xattr.c:966:3: warning: 2nd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Calling 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:6: note: Assuming the condition is false
           if (!(ni->ni_flags & NI_FLAG_EA))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:2: note: Taking false branch
           if (!(ni->ni_flags & NI_FLAG_EA))
           ^
   fs/ntfs3/xattr.c:212:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:212:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:217:6: note: 'name_len' is <=3D 255
           if (name_len > 255) {
               ^~~~~~~~
   fs/ntfs3/xattr.c:217:2: note: Taking false branch
           if (name_len > 255) {
           ^
   fs/ntfs3/xattr.c:223:6: note: 'err' is not equal to 0
           if (err)
               ^~~
   fs/ntfs3/xattr.c:223:2: note: Taking true branch
           if (err)
           ^
   fs/ntfs3/xattr.c:224:3: note: Control jumps to line 253
                   goto out;
                   ^
   fs/ntfs3/xattr.c:254:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:254:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:257:9: note: 'err' is not equal to 0
           return err ? err : len;
                  ^~~
   fs/ntfs3/xattr.c:257:9: note: '?' condition is true
   fs/ntfs3/xattr.c:257:2: note: Returning without writing to '*buffer'
           return err ? err : len;
           ^

vim +1098 arch/x86/mm/pat/memtype.c

5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1080  =

5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1081  /*
5180da410db636 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1082   * untrack_pfn is called while unmapping a pfnmap for a region.
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1083   * untrack can be called for a specific region indicated by pfn and=
 size or
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1084   * can be for the entire vma (in which case pfn, size are zero).
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1085   */
5180da410db636 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1086  void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1087  		 unsigned long size)
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1088  {
c1c15b65ec3027 arch/x86/mm/pat.c H. Peter Anvin                2008-12-23  =
1089  	resource_size_t paddr;
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1090  	unsigned long prot;
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1091  =

9049771f7d5490 arch/x86/mm/pat.c Dan Williams                  2016-09-07  =
1092  	if (vma && !(vma->vm_flags & VM_PAT))
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1093  		return;
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1094  =

b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1095  	/* free the chunk starting from pfn or the whole chunk */
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1096  	paddr =3D (resource_size_t)pfn << PAGE_SHIFT;
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1097  	if (!paddr && !size) {
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08 @=
1098  		if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1099  			WARN_ON_ONCE(1);
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1100  			return;
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1101  		}
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1102  =

b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1103  		size =3D vma->vm_end - vma->vm_start;
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1104  	}
b1a86e15dc0304 arch/x86/mm/pat.c Suresh Siddha                 2012-10-08  =
1105  	free_pfn_range(paddr, size);
9049771f7d5490 arch/x86/mm/pat.c Dan Williams                  2016-09-07  =
1106  	if (vma)
b3b9c2932c32e0 arch/x86/mm/pat.c Konstantin Khlebnikov         2012-10-08  =
1107  		vma->vm_flags &=3D ~VM_PAT;
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1108  }
5899329b19100c arch/x86/mm/pat.c venkatesh.pallipadi(a)intel.com 2008-12-18=
  1109  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0386057882349594729==--

