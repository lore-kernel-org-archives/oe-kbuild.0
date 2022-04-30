Content-Type: multipart/mixed; boundary="===============4973001641588775893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 292/410] mm/mmap.c:795 __vma_adjust() error: we previously assumed 'next' could be null (see line 786)
Date: Sun, 01 May 2022 05:44:52 +0800
Message-ID: <202205010525.4JNDec1E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4973001641588775893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   bf4803abaa3e9d2fa207c0675a2d2abf0fd44f66
commit: dce94fc7a40fd9b59cb5c56b933b45b978ca85c3 [292/410] mmap: change zer=
oing of maple tree in __vma_adjust()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001-20220425 (https://download.01.org/0day-ci/ar=
chive/20220501/202205010525.4JNDec1E-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mmap.c:795 __vma_adjust() error: we previously assumed 'next' could be n=
ull (see line 786)

vim +/next +795 mm/mmap.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  608  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  609  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  610   * We cannot adjust v=
m_start, vm_end, vm_pgoff fields of a vma that
^1da177e4c3f41 Linus Torvalds        2005-04-16  611   * is already present=
 in an i_mmap tree without adjusting the tree.
^1da177e4c3f41 Linus Torvalds        2005-04-16  612   * The following help=
er function should be used when such adjustments
^1da177e4c3f41 Linus Torvalds        2005-04-16  613   * are necessary.  Th=
e "insert" vma (if any) is to be inserted
^1da177e4c3f41 Linus Torvalds        2005-04-16  614   * before we drop the=
 necessary locks.
^1da177e4c3f41 Linus Torvalds        2005-04-16  615   */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  616  int __vma_adjust(stru=
ct vm_area_struct *vma, unsigned long start,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  617  	unsigned long end, p=
goff_t pgoff, struct vm_area_struct *insert,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  618  	struct vm_area_struc=
t *expand)
^1da177e4c3f41 Linus Torvalds        2005-04-16  619  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  620  	struct mm_struct *mm=
 =3D vma->vm_mm;
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  621  	struct vm_area_struc=
t *next_next, *next =3D find_vma(mm, vma->vm_end);
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  622  	struct vm_area_struc=
t *orig_vma =3D vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  623  	struct address_space=
 *mapping =3D NULL;
f808c13fd37389 Davidlohr Bueso       2017-09-08  624  	struct rb_root_cache=
d *root =3D NULL;
012f18004da33b Rik van Riel          2010-08-09  625  	struct anon_vma *ano=
n_vma =3D NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  626  	struct file *file =
=3D vma->vm_file;
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  627  	bool vma_changed =3D=
 false;
^1da177e4c3f41 Linus Torvalds        2005-04-16  628  	long adjust_next =3D=
 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  629  	int remove_next =3D =
0;
f90a08f5f1a502 Liam R. Howlett       2022-04-26  630  	MA_STATE(mas, &mm->m=
m_mt, 0, 0);
734537c9cb725f Kirill A. Shutemov    2016-07-28  631  	struct vm_area_struc=
t *exporter =3D NULL, *importer =3D NULL;
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  632  	unsigned long ll_pre=
v =3D vma->vm_start; /* linked list prev. */
287d97ac032136 Linus Torvalds        2010-04-10  633  =

f90a08f5f1a502 Liam R. Howlett       2022-04-26  634  	if (next && !insert)=
 {
^1da177e4c3f41 Linus Torvalds        2005-04-16  635  		if (end >=3D next->=
vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  636  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  637  			 * vma expands, ov=
erlapping all the next, and
^1da177e4c3f41 Linus Torvalds        2005-04-16  638  			 * perhaps the one=
 after too (mprotect case 6).
86d12e471d9f15 Andrea Arcangeli      2016-10-07  639  			 * The only other =
cases that gets here are
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  640  			 * case 1, case 7 =
and case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  641  			 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  642  			if (next =3D=3D ex=
pand) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  643  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  644  				 * The only case =
where we don't expand "vma"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  645  				 * and we expand =
"next" instead is case 8.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  646  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  647  				VM_WARN_ON(end !=
=3D next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  648  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  649  				 * remove_next =
=3D=3D 3 means we're
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  650  				 * removing "vma"=
 and that to do so we
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  651  				 * swapped "vma" =
and "next".
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  652  				 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  653  				remove_next =3D 3;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  654  				VM_WARN_ON(file !=
=3D next->vm_file);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  655  				swap(vma, next);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  656  			} else {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  657  				VM_WARN_ON(expand=
 !=3D vma);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  658  				/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  659  				 * case 1, 6, 7, =
remove_next =3D=3D 2 is case 6,
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  660  				 * remove_next =
=3D=3D 1 is case 1 or 7.
^1da177e4c3f41 Linus Torvalds        2005-04-16  661  				 */
734537c9cb725f Kirill A. Shutemov    2016-07-28  662  				remove_next =3D 1=
 + (end > next->vm_end);
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  663  				next_next =3D fin=
d_vma(mm, next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  664  				VM_WARN_ON(remove=
_next =3D=3D 2 &&
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  665  					   end !=3D next=
_next->vm_end);
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  666  				/* trim end to ne=
xt, for case 6 first pass */
^1da177e4c3f41 Linus Torvalds        2005-04-16  667  				end =3D next->vm_=
end;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  668  			}
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  669  =

287d97ac032136 Linus Torvalds        2010-04-10  670  			exporter =3D next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  671  			importer =3D vma;
734537c9cb725f Kirill A. Shutemov    2016-07-28  672  =

734537c9cb725f Kirill A. Shutemov    2016-07-28  673  			/*
734537c9cb725f Kirill A. Shutemov    2016-07-28  674  			 * If next doesn't=
 have anon_vma, import from vma after
734537c9cb725f Kirill A. Shutemov    2016-07-28  675  			 * next, if the vm=
a overlaps with it.
734537c9cb725f Kirill A. Shutemov    2016-07-28  676  			 */
97a42cd4398162 Andrea Arcangeli      2016-10-07  677  			if (remove_next =
=3D=3D 2 && !next->anon_vma)
734537c9cb725f Kirill A. Shutemov    2016-07-28  678  				exporter =3D next=
->vm_next;
734537c9cb725f Kirill A. Shutemov    2016-07-28  679  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  680  		} else if (end > ne=
xt->vm_start) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  681  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  682  			 * vma expands, ov=
erlapping part of the next:
^1da177e4c3f41 Linus Torvalds        2005-04-16  683  			 * mprotect case 5=
 shifting the boundary up.
^1da177e4c3f41 Linus Torvalds        2005-04-16  684  			 */
f9d86a60572295 Wei Yang              2020-10-13  685  			adjust_next =3D (e=
nd - next->vm_start);
287d97ac032136 Linus Torvalds        2010-04-10  686  			exporter =3D next;
^1da177e4c3f41 Linus Torvalds        2005-04-16  687  			importer =3D vma;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  688  			VM_WARN_ON(expand =
!=3D importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  689  		} else if (end < vm=
a->vm_end) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  690  			/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  691  			 * vma shrinks, an=
d !insert tells it's not
^1da177e4c3f41 Linus Torvalds        2005-04-16  692  			 * split_vma inser=
ting another: so it must be
^1da177e4c3f41 Linus Torvalds        2005-04-16  693  			 * mprotect case 4=
 shifting the boundary down.
^1da177e4c3f41 Linus Torvalds        2005-04-16  694  			 */
f9d86a60572295 Wei Yang              2020-10-13  695  			adjust_next =3D -(=
vma->vm_end - end);
287d97ac032136 Linus Torvalds        2010-04-10  696  			exporter =3D vma;
^1da177e4c3f41 Linus Torvalds        2005-04-16  697  			importer =3D next;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  698  			VM_WARN_ON(expand =
!=3D importer);
^1da177e4c3f41 Linus Torvalds        2005-04-16  699  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  700  =

5beb49305251e5 Rik van Riel          2010-03-05  701  		/*
5beb49305251e5 Rik van Riel          2010-03-05  702  		 * Easily overlooke=
d: when mprotect shifts the boundary,
5beb49305251e5 Rik van Riel          2010-03-05  703  		 * make sure the ex=
panding vma has anon_vma set if the
5beb49305251e5 Rik van Riel          2010-03-05  704  		 * shrinking vma ha=
d, to cover any anon pages imported.
5beb49305251e5 Rik van Riel          2010-03-05  705  		 */
287d97ac032136 Linus Torvalds        2010-04-10  706  		if (exporter && exp=
orter->anon_vma && !importer->anon_vma) {
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  707  			int error;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  708  =

b800c91a051707 Konstantin Khlebnikov 2015-01-11  709  			importer->anon_vma=
 =3D exporter->anon_vma;
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  710  			error =3D anon_vma=
_clone(importer, exporter);
3fe89b3e2a7bbf Leon Yu               2015-03-25  711  			if (error)
c4ea95d7cd08d9 Daniel Forrest        2014-12-02  712  				return error;
b800c91a051707 Konstantin Khlebnikov 2015-01-11  713  		}
5beb49305251e5 Rik van Riel          2010-03-05  714  	}
734537c9cb725f Kirill A. Shutemov    2016-07-28  715  again:
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  716  	vma_adjust_trans_hug=
e(orig_vma, start, end, adjust_next);
37f9f5595c26d3 Kirill A. Shutemov    2016-07-26  717  =

f90a08f5f1a502 Liam R. Howlett       2022-04-26  718  	if (mas_preallocate(=
&mas, vma, GFP_KERNEL)) {
f90a08f5f1a502 Liam R. Howlett       2022-04-26  719  		if (exporter && exp=
orter->anon_vma)
f90a08f5f1a502 Liam R. Howlett       2022-04-26  720  			unlink_anon_vmas(i=
mporter);
f90a08f5f1a502 Liam R. Howlett       2022-04-26  721  		return -ENOMEM;
f90a08f5f1a502 Liam R. Howlett       2022-04-26  722  	}
f90a08f5f1a502 Liam R. Howlett       2022-04-26  723  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  724  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  725  		mapping =3D file->f=
_mapping;
^1da177e4c3f41 Linus Torvalds        2005-04-16  726  		root =3D &mapping->=
i_mmap;
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  727  		uprobe_munmap(vma, =
vma->vm_start, vma->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  728  =

682968e0c425c6 Srikar Dronamraju     2012-03-30  729  		if (adjust_next)
27ba0644ea9dfe Kirill A. Shutemov    2015-02-10  730  			uprobe_munmap(next=
, next->vm_start, next->vm_end);
682968e0c425c6 Srikar Dronamraju     2012-03-30  731  =

83cde9e8ba95d1 Davidlohr Bueso       2014-12-12  732  		i_mmap_lock_write(m=
apping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  733  		if (insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  734  			/*
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  735  			 * Put into interv=
al tree now, so instantiated pages
^1da177e4c3f41 Linus Torvalds        2005-04-16  736  			 * are visible to =
arm/parisc __flush_dcache_page
^1da177e4c3f41 Linus Torvalds        2005-04-16  737  			 * throughout; but=
 we cannot insert into address
^1da177e4c3f41 Linus Torvalds        2005-04-16  738  			 * space until vma=
 start or end is updated.
^1da177e4c3f41 Linus Torvalds        2005-04-16  739  			 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  740  			__vma_link_file(in=
sert);
^1da177e4c3f41 Linus Torvalds        2005-04-16  741  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  742  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  743  =

012f18004da33b Rik van Riel          2010-08-09  744  	anon_vma =3D vma->an=
on_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  745  	if (!anon_vma && adj=
ust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  746  		anon_vma =3D next->=
anon_vma;
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  747  	if (anon_vma) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  748  		VM_WARN_ON(adjust_n=
ext && next->anon_vma &&
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  749  			   anon_vma !=3D n=
ext->anon_vma);
4fc3f1d66b1ef0 Ingo Molnar           2012-12-02  750  		anon_vma_lock_write=
(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  751  		anon_vma_interval_t=
ree_pre_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  752  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  753  			anon_vma_interval_=
tree_pre_update_vma(next);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  754  	}
012f18004da33b Rik van Riel          2010-08-09  755  =

0fc48a6e213ab8 Wei Yang              2020-10-13  756  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  757  		flush_dcache_mmap_l=
ock(mapping);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  758  		vma_interval_tree_r=
emove(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  759  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  760  			vma_interval_tree_=
remove(next, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  761  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  762  =

d37371870ceb1d Michel Lespinasse     2012-12-11  763  	if (start !=3D vma->=
vm_start) {
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  764  		if ((vma->vm_start =
< start) &&
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  765  		    (!insert || (in=
sert->vm_end !=3D start))) {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  766  			vma_mt_szero(mm, v=
ma->vm_start, start);
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  767  			VM_WARN_ON(insert =
&& insert->vm_start > vma->vm_start);
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  768  		} else {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  769  			vma_changed =3D tr=
ue;
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  770  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  771  		vma->vm_start =3D s=
tart;
d37371870ceb1d Michel Lespinasse     2012-12-11  772  	}
d37371870ceb1d Michel Lespinasse     2012-12-11  773  	if (end !=3D vma->vm=
_end) {
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  774  		if (vma->vm_end > e=
nd) {
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  775  			if (!insert || (in=
sert->vm_start !=3D end)) {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  776  				vma_mt_szero(mm, =
end, vma->vm_end);
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  777  				VM_WARN_ON(insert=
 &&
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  778  					   insert->vm_en=
d < vma->vm_end);
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  779  			} else if (insert-=
>vm_start =3D=3D end) {
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  780  				ll_prev =3D vma->=
vm_end;
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  781  			}
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  782  		} else {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  783  			vma_changed =3D tr=
ue;
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  784  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  785  		vma->vm_end =3D end;
48c8a6f751a2c8 Liam R. Howlett       2022-04-26 @786  		if (!next)
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  787  			mm->highest_vm_end=
 =3D vm_end_gap(vma);
d37371870ceb1d Michel Lespinasse     2012-12-11  788  	}
f90a08f5f1a502 Liam R. Howlett       2022-04-26  789  =

48c8a6f751a2c8 Liam R. Howlett       2022-04-26  790  	if (vma_changed)
f90a08f5f1a502 Liam R. Howlett       2022-04-26  791  		vma_mas_store(vma, =
&mas);
f90a08f5f1a502 Liam R. Howlett       2022-04-26  792  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  793  	vma->vm_pgoff =3D pg=
off;
^1da177e4c3f41 Linus Torvalds        2005-04-16  794  	if (adjust_next) {
f9d86a60572295 Wei Yang              2020-10-13 @795  		next->vm_start +=3D=
 adjust_next;
f9d86a60572295 Wei Yang              2020-10-13  796  		next->vm_pgoff +=3D=
 adjust_next >> PAGE_SHIFT;
f90a08f5f1a502 Liam R. Howlett       2022-04-26  797  		vma_mas_store(next,=
 &mas);
^1da177e4c3f41 Linus Torvalds        2005-04-16  798  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  799  =

0fc48a6e213ab8 Wei Yang              2020-10-13  800  	if (file) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  801  		if (adjust_next)
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  802  			vma_interval_tree_=
insert(next, root);
6b2dbba8b6ac4d Michel Lespinasse     2012-10-08  803  		vma_interval_tree_i=
nsert(vma, root);
^1da177e4c3f41 Linus Torvalds        2005-04-16  804  		flush_dcache_mmap_u=
nlock(mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  805  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  806  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  807  	if (remove_next) {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  808  		__vma_unlink_list(m=
m, next);
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  809  		/* Kill the cache */
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  810  		vmacache_invalidate=
(mm);
^1da177e4c3f41 Linus Torvalds        2005-04-16  811  		if (file)
^1da177e4c3f41 Linus Torvalds        2005-04-16  812  			__remove_shared_vm=
_struct(next, file, mapping);
^1da177e4c3f41 Linus Torvalds        2005-04-16  813  	} else if (insert) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  814  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  815  		 * split_vma has sp=
lit insert from vma, and needs
^1da177e4c3f41 Linus Torvalds        2005-04-16  816  		 * us to insert it =
before dropping the locks
^1da177e4c3f41 Linus Torvalds        2005-04-16  817  		 * (it may either f=
ollow vma or precede it).
^1da177e4c3f41 Linus Torvalds        2005-04-16  818  		 */
dce94fc7a40fd9 Liam R. Howlett       2022-04-26  819  		__insert_vm_struct(=
mm, &mas, insert, ll_prev);
^1da177e4c3f41 Linus Torvalds        2005-04-16  820  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  821  =

bf181b9f9d8dfb Michel Lespinasse     2012-10-08  822  	if (anon_vma) {
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  823  		anon_vma_interval_t=
ree_post_update_vma(vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  824  		if (adjust_next)
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  825  			anon_vma_interval_=
tree_post_update_vma(next);
08b52706d50565 Konstantin Khlebnikov 2013-02-22  826  		anon_vma_unlock_wri=
te(anon_vma);
bf181b9f9d8dfb Michel Lespinasse     2012-10-08  827  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  828  =

0fc48a6e213ab8 Wei Yang              2020-10-13  829  	if (file) {
808fbdbea05f1e Wei Yang              2020-10-13  830  		i_mmap_unlock_write=
(mapping);
7b2d81d48a2d8e Ingo Molnar           2012-02-17  831  		uprobe_mmap(vma);
2b144498350860 Srikar Dronamraju     2012-02-09  832  =

2b144498350860 Srikar Dronamraju     2012-02-09  833  		if (adjust_next)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  834  			uprobe_mmap(next);
2b144498350860 Srikar Dronamraju     2012-02-09  835  	}
2b144498350860 Srikar Dronamraju     2012-02-09  836  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  837  	if (remove_next) {
925d1c401fa6cf Matt Helsley          2008-04-29  838  		if (file) {
cbc91f71b51b83 Srikar Dronamraju     2012-04-11  839  			uprobe_munmap(next=
, next->vm_start, next->vm_end);
^1da177e4c3f41 Linus Torvalds        2005-04-16  840  			fput(file);
925d1c401fa6cf Matt Helsley          2008-04-29  841  		}
5beb49305251e5 Rik van Riel          2010-03-05  842  		if (next->anon_vma)
5beb49305251e5 Rik van Riel          2010-03-05  843  			anon_vma_merge(vma=
, next);
^1da177e4c3f41 Linus Torvalds        2005-04-16  844  		mm->map_count--;
3964acd0dbec12 Oleg Nesterov         2013-07-31  845  		mpol_put(vma_policy=
(next));
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  846  		BUG_ON(vma->vm_end =
< next->vm_end);
3928d4f5ee37cd Linus Torvalds        2018-07-21  847  		vm_area_free(next);
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  848  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  849  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  850  		 * In mprotect's ca=
se 6 (see comments on vma_merge),
^1da177e4c3f41 Linus Torvalds        2005-04-16  851  		 * we must remove a=
nother next too. It would clutter
^1da177e4c3f41 Linus Torvalds        2005-04-16  852  		 * up the code too =
much to do both in one go.
^1da177e4c3f41 Linus Torvalds        2005-04-16  853  		 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  854  		if (remove_next !=
=3D 3) {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  855  			/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  856  			 * If "next" was r=
emoved and vma->vm_end was
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  857  			 * expanded (up) o=
ver it, in turn
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  858  			 * "next->vm_prev-=
>vm_end" changed and the
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  859  			 * "vma->vm_next" =
gap must be updated.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  860  			 */
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  861  			next =3D next_next;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  862  		} else {
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  863  			/*
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  864  			 * For the scope o=
f the comment "next" and
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  865  			 * "vma" considere=
d pre-swap(): if "vma" was
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  866  			 * removed, next->=
vm_start was expanded (down)
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  867  			 * over it and the=
 "next" gap must be updated.
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  868  			 * Because of the =
swap() the post-swap() "vma"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  869  			 * actually points=
 to pre-swap() "next"
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  870  			 * (post-swap() "n=
ext" as opposed is now a
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  871  			 * dangling pointe=
r).
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  872  			 */
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  873  			next =3D vma;
e86f15ee64d8ee Andrea Arcangeli      2016-10-07  874  		}
734537c9cb725f Kirill A. Shutemov    2016-07-28  875  		if (remove_next =3D=
=3D 2) {
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  876  			mas_reset(&mas);
734537c9cb725f Kirill A. Shutemov    2016-07-28  877  			remove_next =3D 1;
734537c9cb725f Kirill A. Shutemov    2016-07-28  878  			end =3D next->vm_e=
nd;
^1da177e4c3f41 Linus Torvalds        2005-04-16  879  			goto again;
48c8a6f751a2c8 Liam R. Howlett       2022-04-26  880  		} else if (!next) {
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  881  			/*
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  882  			 * If remove_next =
=3D=3D 2 we obviously can't
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  883  			 * reach this path.
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  884  			 *
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  885  			 * If remove_next =
=3D=3D 3 we can't reach this
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  886  			 * path because pr=
e-swap() next is always not
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  887  			 * NULL. pre-swap(=
) "next" is not being
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  888  			 * removed and its=
 next->vm_end is not altered
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  889  			 * (and furthermor=
e "end" already matches
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  890  			 * next->vm_end in=
 remove_next =3D=3D 3).
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  891  			 *
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  892  			 * We reach this o=
nly in the remove_next =3D=3D 1
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  893  			 * case if the "ne=
xt" vma that was removed was
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  894  			 * the highest vma=
 of the mm. However in such
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  895  			 * case next->vm_e=
nd =3D=3D "end" and the extended
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  896  			 * "vma" has vma->=
vm_end =3D=3D next->vm_end so
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  897  			 * mm->highest_vm_=
end doesn't need any update
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  898  			 * in remove_next =
=3D=3D 1 case.
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  899  			 */
1be7107fbe18ee Hugh Dickins          2017-06-19  900  			VM_WARN_ON(mm->hig=
hest_vm_end !=3D vm_end_gap(vma));
fb8c41e9ad1f35 Andrea Arcangeli      2016-10-07  901  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  902  	}
2b144498350860 Srikar Dronamraju     2012-02-09  903  	if (insert && file)
7b2d81d48a2d8e Ingo Molnar           2012-02-17  904  		uprobe_mmap(insert);
^1da177e4c3f41 Linus Torvalds        2005-04-16  905  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  906  	validate_mm(mm);
5beb49305251e5 Rik van Riel          2010-03-05  907  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  908  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  909  =


:::::: The code at line 795 was first introduced by commit
:::::: f9d86a60572295ebb53c87a4305dc89b487711bd mm/mmap: leave adjust_next =
as virtual address instead of page frame number

:::::: TO: Wei Yang <richard.weiyang@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4973001641588775893==--

