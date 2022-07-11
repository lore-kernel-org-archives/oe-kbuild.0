Content-Type: multipart/mixed; boundary="===============0510919551790347220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/madvise.c:124:28: warning: Parameter 'anon_name' can be declared with const [constParameter]
Date: Mon, 11 Jul 2022 20:41:00 +0800
Message-ID: <202207112002.OXzI2DeE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0510919551790347220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: mm/madvis=
e.c:124:28: warning: Parameter 'anon_name' can be declared with const [cons=
tParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   32346491ddf24599decca06190ebca03ff9de7f8
commit: 5c26f6ac9416b63d093e29c30e79b3297e425472 mm: refactor vm_area_struc=
t::anon_vma_name usage code
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5c26f6ac9416b63d093e29c30e79b3297e425472
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/madvise.c:124:28: warning: Parameter 'anon_name' can be declared with=
 const [constParameter]
        struct anon_vma_name *anon_name)
                              ^
>> mm/swap.c:612:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:610:25: note: Address of variable taken here.
    struct pagevec *pvec =3D &per_cpu(lru_pvecs.lru_add, cpu);
                           ^
   mm/swap.c:610:33: note: Temporary created here.
    struct pagevec *pvec =3D &per_cpu(lru_pvecs.lru_add, cpu);
                                   ^
   mm/swap.c:612:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:617:30: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (data_race(pagevec_count(pvec))) {
                                ^
   mm/swap.c:615:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_rotate.pvec, cpu);
           ^
   mm/swap.c:615:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_rotate.pvec, cpu);
                   ^
   mm/swap.c:617:30: note: Using pointer that is a temporary.
    if (data_race(pagevec_count(pvec))) {
                                ^
   mm/swap.c:627:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:626:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate_file, cpu);
           ^
   mm/swap.c:626:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate_file, cpu);
                   ^
   mm/swap.c:627:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:631:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:630:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate, cpu);
           ^
   mm/swap.c:630:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate, cpu);
                   ^
   mm/swap.c:631:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:635:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:634:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_lazyfree, cpu);
           ^
   mm/swap.c:634:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_lazyfree, cpu);
                   ^
   mm/swap.c:635:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^

vim +/anon_name +124 mm/madvise.c

9a10064f5625d5 Colin Cross        2022-01-14  100  =

9a10064f5625d5 Colin Cross        2022-01-14  101  /* mmap_lock should be w=
rite-locked */
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  102  static int replace_anon_=
vma_name(struct vm_area_struct *vma,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  103  				 struct anon_vma_nam=
e *anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  104  {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  105  	struct anon_vma_name *o=
rig_name =3D anon_vma_name(vma);
78db3412833dc9 Suren Baghdasaryan 2022-01-14  106  =

5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  107  	if (!anon_name) {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  108  		vma->anon_name =3D NUL=
L;
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  109  		anon_vma_name_put(orig=
_name);
9a10064f5625d5 Colin Cross        2022-01-14  110  		return 0;
9a10064f5625d5 Colin Cross        2022-01-14  111  	}
9a10064f5625d5 Colin Cross        2022-01-14  112  =

5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  113  	if (anon_vma_name_eq(or=
ig_name, anon_name))
9a10064f5625d5 Colin Cross        2022-01-14  114  		return 0;
9a10064f5625d5 Colin Cross        2022-01-14  115  =

5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  116  	anon_vma_name_get(anon_=
name);
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  117  	vma->anon_name =3D anon=
_name;
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  118  	anon_vma_name_put(orig_=
name);
9a10064f5625d5 Colin Cross        2022-01-14  119  =

9a10064f5625d5 Colin Cross        2022-01-14  120  	return 0;
9a10064f5625d5 Colin Cross        2022-01-14  121  }
9a10064f5625d5 Colin Cross        2022-01-14  122  #else /* CONFIG_ANON_VMA=
_NAME */
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  123  static int replace_anon_=
vma_name(struct vm_area_struct *vma,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04 @124  				 struct anon_vma_nam=
e *anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  125  {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  126  	if (anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  127  		return -EINVAL;
9a10064f5625d5 Colin Cross        2022-01-14  128  =

9a10064f5625d5 Colin Cross        2022-01-14  129  	return 0;
9a10064f5625d5 Colin Cross        2022-01-14  130  }
9a10064f5625d5 Colin Cross        2022-01-14  131  #endif /* CONFIG_ANON_VM=
A_NAME */
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  /*
ac1e9acc5acf0b Colin Cross        2022-01-14  133   * Update the vm_flags o=
n region of a vma, splitting it or merging it as
ac1e9acc5acf0b Colin Cross        2022-01-14  134   * necessary.  Must be c=
alled with mmap_sem held for writing;
^1da177e4c3f41 Linus Torvalds     2005-04-16  135   */
ac1e9acc5acf0b Colin Cross        2022-01-14  136  static int madvise_updat=
e_vma(struct vm_area_struct *vma,
ac1e9acc5acf0b Colin Cross        2022-01-14  137  			      struct vm_area_=
struct **prev, unsigned long start,
9a10064f5625d5 Colin Cross        2022-01-14  138  			      unsigned long e=
nd, unsigned long new_flags,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  139  			      struct anon_vma=
_name *anon_name)
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  	struct mm_struct *mm =
=3D vma->vm_mm;
ac1e9acc5acf0b Colin Cross        2022-01-14  142  	int error;
05b7438475ddba Prasanna Meda      2005-06-21  143  	pgoff_t pgoff;
e798c6e87b64d9 Prasanna Meda      2005-06-21  144  =

5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  145  	if (new_flags =3D=3D vm=
a->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
05b7438475ddba Prasanna Meda      2005-06-21  146  		*prev =3D vma;
ac1e9acc5acf0b Colin Cross        2022-01-14  147  		return 0;
05b7438475ddba Prasanna Meda      2005-06-21  148  	}
05b7438475ddba Prasanna Meda      2005-06-21  149  =

05b7438475ddba Prasanna Meda      2005-06-21  150  	pgoff =3D vma->vm_pgoff=
 + ((start - vma->vm_start) >> PAGE_SHIFT);
05b7438475ddba Prasanna Meda      2005-06-21  151  	*prev =3D vma_merge(mm,=
 *prev, start, end, new_flags, vma->anon_vma,
19a809afe2fe08 Andrea Arcangeli   2015-09-04  152  			  vma->vm_file, pgoff=
, vma_policy(vma),
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  153  			  vma->vm_userfaultfd=
_ctx, anon_name);
05b7438475ddba Prasanna Meda      2005-06-21  154  	if (*prev) {
05b7438475ddba Prasanna Meda      2005-06-21  155  		vma =3D *prev;
05b7438475ddba Prasanna Meda      2005-06-21  156  		goto success;
05b7438475ddba Prasanna Meda      2005-06-21  157  	}
05b7438475ddba Prasanna Meda      2005-06-21  158  =

05b7438475ddba Prasanna Meda      2005-06-21  159  	*prev =3D vma;
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  161  	if (start !=3D vma->vm_=
start) {
ac1e9acc5acf0b Colin Cross        2022-01-14  162  		if (unlikely(mm->map_c=
ount >=3D sysctl_max_map_count))
ac1e9acc5acf0b Colin Cross        2022-01-14  163  			return -ENOMEM;
def5efe0376501 David Rientjes     2017-02-24  164  		error =3D __split_vma(=
mm, vma, start, 1);
f3bc0dba3154fa Mike Rapoport      2019-09-23  165  		if (error)
ac1e9acc5acf0b Colin Cross        2022-01-14  166  			return error;
def5efe0376501 David Rientjes     2017-02-24  167  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  168  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  169  	if (end !=3D vma->vm_en=
d) {
ac1e9acc5acf0b Colin Cross        2022-01-14  170  		if (unlikely(mm->map_c=
ount >=3D sysctl_max_map_count))
ac1e9acc5acf0b Colin Cross        2022-01-14  171  			return -ENOMEM;
def5efe0376501 David Rientjes     2017-02-24  172  		error =3D __split_vma(=
mm, vma, end, 0);
f3bc0dba3154fa Mike Rapoport      2019-09-23  173  		if (error)
ac1e9acc5acf0b Colin Cross        2022-01-14  174  			return error;
def5efe0376501 David Rientjes     2017-02-24  175  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  176  =

836d5ffd345509 Hugh Dickins       2005-09-03  177  success:
^1da177e4c3f41 Linus Torvalds     2005-04-16  178  	/*
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  179  	 * vm_flags is protecte=
d by the mmap_lock held in write mode.
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  	 */
e798c6e87b64d9 Prasanna Meda      2005-06-21  181  	vma->vm_flags =3D new_f=
lags;
9a10064f5625d5 Colin Cross        2022-01-14  182  	if (!vma->vm_file) {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  183  		error =3D replace_anon=
_vma_name(vma, anon_name);
9a10064f5625d5 Colin Cross        2022-01-14  184  		if (error)
9a10064f5625d5 Colin Cross        2022-01-14  185  			return error;
9a10064f5625d5 Colin Cross        2022-01-14  186  	}
f3bc0dba3154fa Mike Rapoport      2019-09-23  187  =

ac1e9acc5acf0b Colin Cross        2022-01-14  188  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  189  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0510919551790347220==--

