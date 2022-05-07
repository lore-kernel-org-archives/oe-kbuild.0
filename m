Content-Type: multipart/mixed; boundary="===============0459284007070292372=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/vdso.c:177:30: warning: Subtracting pointers that point to different objects [comparePointers]
Date: Sat, 07 May 2022 14:20:35 +0800
Message-ID: <202205071418.iImX13WC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0459284007070292372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b97bac0756a81cda5afd45417a99b5bccdcff67
commit: 779df2248739b6308c03b354c99e4c352141e3bc s390/vdso: add minimal com=
pat vdso
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 779df2248739b6308c03b354c99e4c352141e3bc
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/mm/mmap.c:74:51: warning: Parameter 'filp' can be declared wit=
h const [constParameter]
   unsigned long arch_get_unmapped_area(struct file *filp, unsigned long ad=
dr,
                                                     ^
   arch/s390/mm/mmap.c:113:59: warning: Parameter 'filp' can be declared wi=
th const [constParameter]
   unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned=
 long addr,
                                                             ^
--
>> arch/s390/kernel/vdso.c:177:30: warning: Subtracting pointers that point=
 to different objects [comparePointers]
     vdso_text_len =3D vdso32_end - vdso32_start;
                                ^
   arch/s390/kernel/vdso.c:23:29: note: Variable declared here.
   extern char vdso32_start[], vdso32_end[];
                               ^
   arch/s390/kernel/vdso.c:177:19: note: Array decayed to pointer here.
     vdso_text_len =3D vdso32_end - vdso32_start;
                     ^
   arch/s390/kernel/vdso.c:23:13: note: Variable declared here.
   extern char vdso32_start[], vdso32_end[];
               ^
   arch/s390/kernel/vdso.c:177:32: note: Array decayed to pointer here.
     vdso_text_len =3D vdso32_end - vdso32_start;
                                  ^
   arch/s390/kernel/vdso.c:177:30: note: Subtracting pointers that point to=
 different objects
     vdso_text_len =3D vdso32_end - vdso32_start;
                                ^
   arch/s390/kernel/vdso.c:180:30: warning: Subtracting pointers that point=
 to different objects [comparePointers]
     vdso_text_len =3D vdso64_end - vdso64_start;
                                ^
   arch/s390/kernel/vdso.c:22:29: note: Variable declared here.
   extern char vdso64_start[], vdso64_end[];
                               ^
   arch/s390/kernel/vdso.c:180:19: note: Array decayed to pointer here.
     vdso_text_len =3D vdso64_end - vdso64_start;
                     ^
   arch/s390/kernel/vdso.c:22:13: note: Variable declared here.
   extern char vdso64_start[], vdso64_end[];
               ^
   arch/s390/kernel/vdso.c:180:32: note: Array decayed to pointer here.
     vdso_text_len =3D vdso64_end - vdso64_start;
                                  ^
   arch/s390/kernel/vdso.c:180:30: note: Subtracting pointers that point to=
 different objects
     vdso_text_len =3D vdso64_end - vdso64_start;
                                ^
>> arch/s390/kernel/vdso.c:213:66: warning: Parameter 'end' can be declared=
 with const [constParameter]
   static struct page ** __init vdso_setup_pages(void *start, void *end)
                                                                    ^

vim +177 arch/s390/kernel/vdso.c

80f06306240e0a Heiko Carstens     2020-11-16  162  =

b020632e40c3ed Martin Schwidefsky 2008-12-25  163  int arch_setup_additiona=
l_pages(struct linux_binprm *bprm, int uses_interp)
b020632e40c3ed Martin Schwidefsky 2008-12-25  164  {
214b3564869cd9 Heiko Carstens     2021-02-05  165  	unsigned long vdso_text=
_len, vdso_mapping_len;
214b3564869cd9 Heiko Carstens     2021-02-05  166  	unsigned long vvar_star=
t, vdso_text_start;
779df2248739b6 Sven Schnelle      2021-06-25  167  	struct vm_special_mappi=
ng *vdso_mapping;
b020632e40c3ed Martin Schwidefsky 2008-12-25  168  	struct mm_struct *mm =
=3D current->mm;
35bb092a91b4c4 Martin Schwidefsky 2017-05-15  169  	struct vm_area_struct *=
vma;
b020632e40c3ed Martin Schwidefsky 2008-12-25  170  	int rc;
b020632e40c3ed Martin Schwidefsky 2008-12-25  171  =

eeab78b05d202f Heiko Carstens     2021-02-05  172  	BUILD_BUG_ON(VVAR_NR_PA=
GES !=3D __VVAR_PAGES);
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  173  	if (mmap_write_lock_kil=
lable(mm))
69048176078add Michal Hocko       2016-05-23  174  		return -EINTR;
779df2248739b6 Sven Schnelle      2021-06-25  175  =

779df2248739b6 Sven Schnelle      2021-06-25  176  	if (is_compat_task()) {
779df2248739b6 Sven Schnelle      2021-06-25 @177  		vdso_text_len =3D vdso=
32_end - vdso32_start;
779df2248739b6 Sven Schnelle      2021-06-25  178  		vdso_mapping =3D &vdso=
32_mapping;
779df2248739b6 Sven Schnelle      2021-06-25  179  	} else {
779df2248739b6 Sven Schnelle      2021-06-25  180  		vdso_text_len =3D vdso=
64_end - vdso64_start;
779df2248739b6 Sven Schnelle      2021-06-25  181  		vdso_mapping =3D &vdso=
64_mapping;
779df2248739b6 Sven Schnelle      2021-06-25  182  	}
eeab78b05d202f Heiko Carstens     2021-02-05  183  	vdso_mapping_len =3D vd=
so_text_len + VVAR_NR_PAGES * PAGE_SIZE;
214b3564869cd9 Heiko Carstens     2021-02-05  184  	vvar_start =3D get_unma=
pped_area(NULL, 0, vdso_mapping_len, 0, 0);
214b3564869cd9 Heiko Carstens     2021-02-05  185  	rc =3D vvar_start;
214b3564869cd9 Heiko Carstens     2021-02-05  186  	if (IS_ERR_VALUE(vvar_s=
tart))
8d4be7f318bc69 Heiko Carstens     2021-01-24  187  		goto out;
eeab78b05d202f Heiko Carstens     2021-02-05  188  	vma =3D _install_specia=
l_mapping(mm, vvar_start, VVAR_NR_PAGES*PAGE_SIZE,
eeab78b05d202f Heiko Carstens     2021-02-05  189  				       VM_READ|VM_MA=
YREAD|VM_IO|VM_DONTDUMP|
eeab78b05d202f Heiko Carstens     2021-02-05  190  				       VM_PFNMAP,
214b3564869cd9 Heiko Carstens     2021-02-05  191  				       &vvar_mapping=
);
214b3564869cd9 Heiko Carstens     2021-02-05  192  	rc =3D PTR_ERR(vma);
214b3564869cd9 Heiko Carstens     2021-02-05  193  	if (IS_ERR(vma))
214b3564869cd9 Heiko Carstens     2021-02-05  194  		goto out;
eeab78b05d202f Heiko Carstens     2021-02-05  195  	vdso_text_start =3D vva=
r_start + VVAR_NR_PAGES * PAGE_SIZE;
5056c2c53a22a6 Heiko Carstens     2021-01-24  196  	/* VM_MAYWRITE for COW =
so gdb can set breakpoints */
214b3564869cd9 Heiko Carstens     2021-02-05  197  	vma =3D _install_specia=
l_mapping(mm, vdso_text_start, vdso_text_len,
b020632e40c3ed Martin Schwidefsky 2008-12-25  198  				       VM_READ|VM_EX=
EC|
909af768e88867 Jason Baron        2012-03-23  199  				       VM_MAYREAD|VM=
_MAYWRITE|VM_MAYEXEC,
779df2248739b6 Sven Schnelle      2021-06-25  200  				       vdso_mapping);
5056c2c53a22a6 Heiko Carstens     2021-01-24  201  	if (IS_ERR(vma)) {
214b3564869cd9 Heiko Carstens     2021-02-05  202  		do_munmap(mm, vvar_sta=
rt, PAGE_SIZE, NULL);
5056c2c53a22a6 Heiko Carstens     2021-01-24  203  		rc =3D PTR_ERR(vma);
5056c2c53a22a6 Heiko Carstens     2021-01-24  204  	} else {
5056c2c53a22a6 Heiko Carstens     2021-01-24  205  		current->mm->context.v=
dso_base =3D vdso_text_start;
35bb092a91b4c4 Martin Schwidefsky 2017-05-15  206  		rc =3D 0;
5056c2c53a22a6 Heiko Carstens     2021-01-24  207  	}
8d4be7f318bc69 Heiko Carstens     2021-01-24  208  out:
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  209  	mmap_write_unlock(mm);
b020632e40c3ed Martin Schwidefsky 2008-12-25  210  	return rc;
b020632e40c3ed Martin Schwidefsky 2008-12-25  211  }
b020632e40c3ed Martin Schwidefsky 2008-12-25  212  =

779df2248739b6 Sven Schnelle      2021-06-25 @213  static struct page ** __=
init vdso_setup_pages(void *start, void *end)
b020632e40c3ed Martin Schwidefsky 2008-12-25  214  {
779df2248739b6 Sven Schnelle      2021-06-25  215  	int pages =3D (end - st=
art) >> PAGE_SHIFT;
779df2248739b6 Sven Schnelle      2021-06-25  216  	struct page **pagelist;
b020632e40c3ed Martin Schwidefsky 2008-12-25  217  	int i;
b020632e40c3ed Martin Schwidefsky 2008-12-25  218  =

779df2248739b6 Sven Schnelle      2021-06-25  219  	pagelist =3D kcalloc(pa=
ges + 1, sizeof(struct page *), GFP_KERNEL);
779df2248739b6 Sven Schnelle      2021-06-25  220  	if (!pagelist)
779df2248739b6 Sven Schnelle      2021-06-25  221  		panic("%s: Cannot allo=
cate page list for VDSO", __func__);
779df2248739b6 Sven Schnelle      2021-06-25  222  	for (i =3D 0; i < pages=
; i++)
779df2248739b6 Sven Schnelle      2021-06-25  223  		pagelist[i] =3D virt_t=
o_page(start + i * PAGE_SIZE);
779df2248739b6 Sven Schnelle      2021-06-25  224  	return pagelist;
779df2248739b6 Sven Schnelle      2021-06-25  225  }
d57778feb9878a Sven Schnelle      2021-06-23  226  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0459284007070292372==--

