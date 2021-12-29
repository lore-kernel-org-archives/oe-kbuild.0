Content-Type: multipart/mixed; boundary="===============3140179852674951175=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mm/damon: Add access checking for hugetlb pages
Date: Wed, 29 Dec 2021 11:02:41 +0800
Message-ID: <202112291022.Ut97ZGZm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3140179852674951175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <6afcbd1fda5f9c7c24f320d26a98188c727ceec3.1639623751.git.baoli=
n.wang@linux.alibaba.com>
References: <6afcbd1fda5f9c7c24f320d26a98188c727ceec3.1639623751.git.baolin=
.wang@linux.alibaba.com>
TO: Baolin Wang <baolin.wang@linux.alibaba.com>

Hi Baolin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]

url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/mm-damon-Add-a=
ccess-checking-for-hugetlb-pages/20211216-183925
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-c006-20211228 (https://download.01.org/0day-ci/arc=
hive/20211229/202112291022.Ut97ZGZm-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/468a013161dfcf6a8631ea645=
ea9e1ec461d7c59
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Baolin-Wang/mm-damon-Add-access-ch=
ecking-for-hugetlb-pages/20211216-183925
        git checkout 468a013161dfcf6a8631ea645ea9e1ec461d7c59
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mtd/ubi/build.c:643:7: note: Calling 'is_power_of_2'
           if (!is_power_of_2(ubi->min_io_size)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:47:10: note: Assuming 'n' is not equal to 0
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
                   ^~~~~~
   include/linux/log2.h:47:10: note: Left side of '&&' is true
   include/linux/log2.h:47:21: note: Assuming the condition is true
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
                              ^~~~~~~~~~~~~~~~~~
   include/linux/log2.h:47:2: note: Returning the value 1, which participat=
es in a condition later
           return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/build.c:643:7: note: Returning from 'is_power_of_2'
           if (!is_power_of_2(ubi->min_io_size)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/build.c:643:2: note: Taking false branch
           if (!is_power_of_2(ubi->min_io_size)) {
           ^
   drivers/mtd/ubi/build.c:649:13: note: Assuming field 'hdrs_min_io_size' =
is <=3D 0
           ubi_assert(ubi->hdrs_min_io_size > 0);
                      ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/ubi/build.c:649:2: note: Taking true branch
           ubi_assert(ubi->hdrs_min_io_size > 0);
           ^
   drivers/mtd/ubi/debug.h:18:2: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
           ^
   drivers/mtd/ubi/build.c:649:2: note: Loop condition is false.  Exiting l=
oop
           ubi_assert(ubi->hdrs_min_io_size > 0);
           ^
   drivers/mtd/ubi/debug.h:19:3: note: expanded from macro 'ubi_assert'
                   pr_crit("UBI assert failed in %s at %u (pid %d)\n",     =
     \
                   ^
   include/linux/printk.h:479:2: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mtd/ubi/build.c:649:2: note: Loop condition is false.  Exiting l=
oop
           ubi_assert(ubi->hdrs_min_io_size > 0);
           ^
   drivers/mtd/ubi/debug.h:17:27: note: expanded from macro 'ubi_assert'
   #define ubi_assert(expr)  do {                                          =
     \
                             ^
   drivers/mtd/ubi/build.c:650:18: note: Field 'hdrs_min_io_size' is <=3D f=
ield 'min_io_size'
           ubi_assert(ubi->hdrs_min_io_size <=3D ubi->min_io_size);
                           ^
   drivers/mtd/ubi/build.c:650:2: note: Taking false branch
           ubi_assert(ubi->hdrs_min_io_size <=3D ubi->min_io_size);
           ^
   drivers/mtd/ubi/debug.h:18:2: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
           ^
   drivers/mtd/ubi/build.c:650:2: note: Loop condition is false.  Exiting l=
oop
           ubi_assert(ubi->hdrs_min_io_size <=3D ubi->min_io_size);
           ^
   drivers/mtd/ubi/debug.h:17:27: note: expanded from macro 'ubi_assert'
   #define ubi_assert(expr)  do {                                          =
     \
                             ^
   drivers/mtd/ubi/build.c:651:30: note: Division by zero
           ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size =3D=3D 0);
                                       ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/ubi/build.c:1401:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, val);
           ^~~~~~
   drivers/mtd/ubi/build.c:1401:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(buf, val);
           ^~~~~~
   drivers/mtd/ubi/build.c:1416:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(&p->name[0], tokens[0]);
           ^~~~~~
   drivers/mtd/ubi/build.c:1416:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(&p->name[0], tokens[0]);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> mm/damon/vaddr.c:402:17: warning: Value stored to 'h' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct hstate *h =3D hstate_vma(vma);
                          ^   ~~~~~~~~~~~~~~~
   mm/damon/vaddr.c:402:17: note: Value stored to 'h' during its initializa=
tion is never read
           struct hstate *h =3D hstate_vma(vma);
                          ^   ~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   mm/memfd.c:281:2: warning: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   mm/memfd.c:281:2: note: Call to function 'strcpy' is insecure as it does=
 not provide bounding of the memory buffer. Replace unbounded copy function=
s with analogous functions that support length arguments such as 'strlcpy'.=
 CWE-119
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/usb/chipidea/otg_fsm.c:42:2: warning: Value stored to 'next' is =
never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:42:2: note: Value stored to 'next' is nev=
er read
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: warning: Value stored to 'next' is =
never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:91:2: note: Value stored to 'next' is nev=
er read
           next +=3D t;
           ^       ~
   drivers/usb/chipidea/otg_fsm.c:131:2: warning: Value stored to 'next' is=
 never read [clang-analyzer-deadcode.DeadStores]
           next +=3D t;

vim +/h +402 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park 2021-09-07  396  =

468a013161dfcf Baolin Wang   2021-12-16  397  #ifdef CONFIG_HUGETLB_PAGE
468a013161dfcf Baolin Wang   2021-12-16  398  static void damon_hugetlb_mko=
ld(pte_t *pte, struct mm_struct *mm,
468a013161dfcf Baolin Wang   2021-12-16  399  				struct vm_area_struct *vm=
a, unsigned long addr)
468a013161dfcf Baolin Wang   2021-12-16  400  {
468a013161dfcf Baolin Wang   2021-12-16  401  	bool referenced =3D false;
468a013161dfcf Baolin Wang   2021-12-16 @402  	struct hstate *h =3D hstate_=
vma(vma);
468a013161dfcf Baolin Wang   2021-12-16  403  	pte_t entry =3D huge_ptep_ge=
t(pte);
468a013161dfcf Baolin Wang   2021-12-16  404  	struct page *page =3D pte_pa=
ge(entry);
468a013161dfcf Baolin Wang   2021-12-16  405  =

468a013161dfcf Baolin Wang   2021-12-16  406  	if (!page)
468a013161dfcf Baolin Wang   2021-12-16  407  		return;
468a013161dfcf Baolin Wang   2021-12-16  408  =

468a013161dfcf Baolin Wang   2021-12-16  409  	get_page(page);
468a013161dfcf Baolin Wang   2021-12-16  410  =

468a013161dfcf Baolin Wang   2021-12-16  411  	if (pte_young(entry)) {
468a013161dfcf Baolin Wang   2021-12-16  412  		referenced =3D true;
468a013161dfcf Baolin Wang   2021-12-16  413  		entry =3D pte_mkold(entry);
468a013161dfcf Baolin Wang   2021-12-16  414  		huge_ptep_set_access_flags(=
vma, addr, pte, entry,
468a013161dfcf Baolin Wang   2021-12-16  415  					   vma->vm_flags & VM_WR=
ITE);
468a013161dfcf Baolin Wang   2021-12-16  416  	}
468a013161dfcf Baolin Wang   2021-12-16  417  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3140179852674951175==--

