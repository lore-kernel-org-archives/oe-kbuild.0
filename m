Content-Type: multipart/mixed; boundary="===============0384181019782869537=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 291/410] mm/mmap.c:850 __vma_adjust() error: uninitialized symbol 'next_next'.
Date: Sat, 30 Apr 2022 07:15:35 +0800
Message-ID: <202204300714.hs00NRDM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0384181019782869537==
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
commit: 48c8a6f751a2c87c2dcfa40442e0ebe3afd7cd76 [291/410] mm: remove rb tr=
ee.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20220425 (https://download.01.org/0day-ci/ar=
chive/20220430/202204300714.hs00NRDM-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mmap.c:850 __vma_adjust() error: uninitialized symbol 'next_next'.

vim +/next_next +850 mm/mmap.c

^1da177e4c3f415 Linus Torvalds        2005-04-16  608  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  609  /*
^1da177e4c3f415 Linus Torvalds        2005-04-16  610   * We cannot adjust =
vm_start, vm_end, vm_pgoff fields of a vma that
^1da177e4c3f415 Linus Torvalds        2005-04-16  611   * is already presen=
t in an i_mmap tree without adjusting the tree.
^1da177e4c3f415 Linus Torvalds        2005-04-16  612   * The following hel=
per function should be used when such adjustments
^1da177e4c3f415 Linus Torvalds        2005-04-16  613   * are necessary.  T=
he "insert" vma (if any) is to be inserted
^1da177e4c3f415 Linus Torvalds        2005-04-16  614   * before we drop th=
e necessary locks.
^1da177e4c3f415 Linus Torvalds        2005-04-16  615   */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  616  int __vma_adjust(str=
uct vm_area_struct *vma, unsigned long start,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  617  	unsigned long end, =
pgoff_t pgoff, struct vm_area_struct *insert,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  618  	struct vm_area_stru=
ct *expand)
^1da177e4c3f415 Linus Torvalds        2005-04-16  619  {
^1da177e4c3f415 Linus Torvalds        2005-04-16  620  	struct mm_struct *m=
m =3D vma->vm_mm;
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  621  	struct vm_area_stru=
ct *next_next, *next =3D find_vma(mm, vma->vm_end);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  622  	struct vm_area_stru=
ct *orig_vma =3D vma;
^1da177e4c3f415 Linus Torvalds        2005-04-16  623  	struct address_spac=
e *mapping =3D NULL;
f808c13fd373894 Davidlohr Bueso       2017-09-08  624  	struct rb_root_cach=
ed *root =3D NULL;
012f18004da33ba Rik van Riel          2010-08-09  625  	struct anon_vma *an=
on_vma =3D NULL;
^1da177e4c3f415 Linus Torvalds        2005-04-16  626  	struct file *file =
=3D vma->vm_file;
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  627  	bool vma_changed =
=3D false;
^1da177e4c3f415 Linus Torvalds        2005-04-16  628  	long adjust_next =
=3D 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  629  	int remove_next =3D=
 0;
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  630  	MA_STATE(mas, &mm->=
mm_mt, 0, 0);
734537c9cb725fc Kirill A. Shutemov    2016-07-28  631  	struct vm_area_stru=
ct *exporter =3D NULL, *importer =3D NULL;
287d97ac0321367 Linus Torvalds        2010-04-10  632  =

f90a08f5f1a5029 Liam R. Howlett       2022-04-26  633  	if (next && !insert=
) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  634  		if (end >=3D next-=
>vm_end) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  635  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  636  			 * vma expands, o=
verlapping all the next, and
^1da177e4c3f415 Linus Torvalds        2005-04-16  637  			 * perhaps the on=
e after too (mprotect case 6).
86d12e471d9f152 Andrea Arcangeli      2016-10-07  638  			 * The only other=
 cases that gets here are
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  639  			 * case 1, case 7=
 and case 8.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  640  			 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  641  			if (next =3D=3D e=
xpand) {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  642  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  643  				 * The only case=
 where we don't expand "vma"
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  644  				 * and we expand=
 "next" instead is case 8.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  645  				 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  646  				VM_WARN_ON(end !=
=3D next->vm_end);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  647  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  648  				 * remove_next =
=3D=3D 3 means we're
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  649  				 * removing "vma=
" and that to do so we
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  650  				 * swapped "vma"=
 and "next".
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  651  				 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  652  				remove_next =3D =
3;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  653  				VM_WARN_ON(file =
!=3D next->vm_file);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  654  				swap(vma, next);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  655  			} else {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  656  				VM_WARN_ON(expan=
d !=3D vma);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  657  				/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  658  				 * case 1, 6, 7,=
 remove_next =3D=3D 2 is case 6,
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  659  				 * remove_next =
=3D=3D 1 is case 1 or 7.
^1da177e4c3f415 Linus Torvalds        2005-04-16  660  				 */
734537c9cb725fc Kirill A. Shutemov    2016-07-28  661  				remove_next =3D =
1 + (end > next->vm_end);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  662  				next_next =3D fi=
nd_vma(mm, next->vm_end);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  663  				VM_WARN_ON(remov=
e_next =3D=3D 2 &&
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  664  					   end !=3D nex=
t_next->vm_end);
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  665  				/* trim end to n=
ext, for case 6 first pass */
^1da177e4c3f415 Linus Torvalds        2005-04-16  666  				end =3D next->vm=
_end;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  667  			}
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  668  =

287d97ac0321367 Linus Torvalds        2010-04-10  669  			exporter =3D next;
^1da177e4c3f415 Linus Torvalds        2005-04-16  670  			importer =3D vma;
734537c9cb725fc Kirill A. Shutemov    2016-07-28  671  =

734537c9cb725fc Kirill A. Shutemov    2016-07-28  672  			/*
734537c9cb725fc Kirill A. Shutemov    2016-07-28  673  			 * If next doesn'=
t have anon_vma, import from vma after
734537c9cb725fc Kirill A. Shutemov    2016-07-28  674  			 * next, if the v=
ma overlaps with it.
734537c9cb725fc Kirill A. Shutemov    2016-07-28  675  			 */
97a42cd4398162a Andrea Arcangeli      2016-10-07  676  			if (remove_next =
=3D=3D 2 && !next->anon_vma)
734537c9cb725fc Kirill A. Shutemov    2016-07-28  677  				exporter =3D nex=
t->vm_next;
734537c9cb725fc Kirill A. Shutemov    2016-07-28  678  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  679  		} else if (end > n=
ext->vm_start) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  680  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  681  			 * vma expands, o=
verlapping part of the next:
^1da177e4c3f415 Linus Torvalds        2005-04-16  682  			 * mprotect case =
5 shifting the boundary up.
^1da177e4c3f415 Linus Torvalds        2005-04-16  683  			 */
f9d86a60572295e Wei Yang              2020-10-13  684  			adjust_next =3D (=
end - next->vm_start);
287d97ac0321367 Linus Torvalds        2010-04-10  685  			exporter =3D next;
^1da177e4c3f415 Linus Torvalds        2005-04-16  686  			importer =3D vma;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  687  			VM_WARN_ON(expand=
 !=3D importer);
^1da177e4c3f415 Linus Torvalds        2005-04-16  688  		} else if (end < v=
ma->vm_end) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  689  			/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  690  			 * vma shrinks, a=
nd !insert tells it's not
^1da177e4c3f415 Linus Torvalds        2005-04-16  691  			 * split_vma inse=
rting another: so it must be
^1da177e4c3f415 Linus Torvalds        2005-04-16  692  			 * mprotect case =
4 shifting the boundary down.
^1da177e4c3f415 Linus Torvalds        2005-04-16  693  			 */
f9d86a60572295e Wei Yang              2020-10-13  694  			adjust_next =3D -=
(vma->vm_end - end);
287d97ac0321367 Linus Torvalds        2010-04-10  695  			exporter =3D vma;
^1da177e4c3f415 Linus Torvalds        2005-04-16  696  			importer =3D next;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  697  			VM_WARN_ON(expand=
 !=3D importer);
^1da177e4c3f415 Linus Torvalds        2005-04-16  698  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  699  =

5beb49305251e56 Rik van Riel          2010-03-05  700  		/*
5beb49305251e56 Rik van Riel          2010-03-05  701  		 * Easily overlook=
ed: when mprotect shifts the boundary,
5beb49305251e56 Rik van Riel          2010-03-05  702  		 * make sure the e=
xpanding vma has anon_vma set if the
5beb49305251e56 Rik van Riel          2010-03-05  703  		 * shrinking vma h=
ad, to cover any anon pages imported.
5beb49305251e56 Rik van Riel          2010-03-05  704  		 */
287d97ac0321367 Linus Torvalds        2010-04-10  705  		if (exporter && ex=
porter->anon_vma && !importer->anon_vma) {
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  706  			int error;
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  707  =

b800c91a0517071 Konstantin Khlebnikov 2015-01-11  708  			importer->anon_vm=
a =3D exporter->anon_vma;
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  709  			error =3D anon_vm=
a_clone(importer, exporter);
3fe89b3e2a7bbf3 Leon Yu               2015-03-25  710  			if (error)
c4ea95d7cd08d9f Daniel Forrest        2014-12-02  711  				return error;
b800c91a0517071 Konstantin Khlebnikov 2015-01-11  712  		}
5beb49305251e56 Rik van Riel          2010-03-05  713  	}
734537c9cb725fc Kirill A. Shutemov    2016-07-28  714  again:
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  715  	vma_adjust_trans_hu=
ge(orig_vma, start, end, adjust_next);
37f9f5595c26d3c Kirill A. Shutemov    2016-07-26  716  =

f90a08f5f1a5029 Liam R. Howlett       2022-04-26  717  	if (mas_preallocate=
(&mas, vma, GFP_KERNEL)) {
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  718  		if (exporter && ex=
porter->anon_vma)
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  719  			unlink_anon_vmas(=
importer);
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  720  		return -ENOMEM;
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  721  	}
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  722  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  723  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  724  		mapping =3D file->=
f_mapping;
^1da177e4c3f415 Linus Torvalds        2005-04-16  725  		root =3D &mapping-=
>i_mmap;
cbc91f71b51b833 Srikar Dronamraju     2012-04-11  726  		uprobe_munmap(vma,=
 vma->vm_start, vma->vm_end);
682968e0c425c60 Srikar Dronamraju     2012-03-30  727  =

682968e0c425c60 Srikar Dronamraju     2012-03-30  728  		if (adjust_next)
27ba0644ea9dfe6 Kirill A. Shutemov    2015-02-10  729  			uprobe_munmap(nex=
t, next->vm_start, next->vm_end);
682968e0c425c60 Srikar Dronamraju     2012-03-30  730  =

83cde9e8ba95d18 Davidlohr Bueso       2014-12-12  731  		i_mmap_lock_write(=
mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  732  		if (insert) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  733  			/*
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  734  			 * Put into inter=
val tree now, so instantiated pages
^1da177e4c3f415 Linus Torvalds        2005-04-16  735  			 * are visible to=
 arm/parisc __flush_dcache_page
^1da177e4c3f415 Linus Torvalds        2005-04-16  736  			 * throughout; bu=
t we cannot insert into address
^1da177e4c3f415 Linus Torvalds        2005-04-16  737  			 * space until vm=
a start or end is updated.
^1da177e4c3f415 Linus Torvalds        2005-04-16  738  			 */
^1da177e4c3f415 Linus Torvalds        2005-04-16  739  			__vma_link_file(i=
nsert);
^1da177e4c3f415 Linus Torvalds        2005-04-16  740  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  741  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  742  =

012f18004da33ba Rik van Riel          2010-08-09  743  	anon_vma =3D vma->a=
non_vma;
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  744  	if (!anon_vma && ad=
just_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  745  		anon_vma =3D next-=
>anon_vma;
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  746  	if (anon_vma) {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  747  		VM_WARN_ON(adjust_=
next && next->anon_vma &&
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  748  			   anon_vma !=3D =
next->anon_vma);
4fc3f1d66b1ef0d Ingo Molnar           2012-12-02  749  		anon_vma_lock_writ=
e(anon_vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  750  		anon_vma_interval_=
tree_pre_update_vma(vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  751  		if (adjust_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  752  			anon_vma_interval=
_tree_pre_update_vma(next);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  753  	}
012f18004da33ba Rik van Riel          2010-08-09  754  =

0fc48a6e213ab8e Wei Yang              2020-10-13  755  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  756  		flush_dcache_mmap_=
lock(mapping);
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  757  		vma_interval_tree_=
remove(vma, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  758  		if (adjust_next)
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  759  			vma_interval_tree=
_remove(next, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  760  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  761  =

d37371870ceb1d2 Michel Lespinasse     2012-12-11  762  	if (start !=3D vma-=
>vm_start) {
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  763  		if (vma->vm_start =
< start)
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  764  			vma_mt_szero(mm, =
vma->vm_start, start);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  765  		else
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  766  			vma_changed =3D t=
rue;
^1da177e4c3f415 Linus Torvalds        2005-04-16  767  		vma->vm_start =3D =
start;
d37371870ceb1d2 Michel Lespinasse     2012-12-11  768  	}
d37371870ceb1d2 Michel Lespinasse     2012-12-11  769  	if (end !=3D vma->v=
m_end) {
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  770  		if (vma->vm_end > =
end)
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  771  			vma_mt_szero(mm, =
end, vma->vm_end);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  772  		else
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  773  			vma_changed =3D t=
rue;
^1da177e4c3f415 Linus Torvalds        2005-04-16  774  		vma->vm_end =3D en=
d;
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  775  		if (!next)
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  776  			mm->highest_vm_en=
d =3D vm_end_gap(vma);
d37371870ceb1d2 Michel Lespinasse     2012-12-11  777  	}
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  778  =

48c8a6f751a2c87 Liam R. Howlett       2022-04-26  779  	if (vma_changed)
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  780  		vma_mas_store(vma,=
 &mas);
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  781  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  782  	vma->vm_pgoff =3D p=
goff;
^1da177e4c3f415 Linus Torvalds        2005-04-16  783  	if (adjust_next) {
f9d86a60572295e Wei Yang              2020-10-13  784  		next->vm_start +=
=3D adjust_next;
f9d86a60572295e Wei Yang              2020-10-13  785  		next->vm_pgoff +=
=3D adjust_next >> PAGE_SHIFT;
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  786  		vma_mas_store(next=
, &mas);
^1da177e4c3f415 Linus Torvalds        2005-04-16  787  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  788  =

0fc48a6e213ab8e Wei Yang              2020-10-13  789  	if (file) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  790  		if (adjust_next)
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  791  			vma_interval_tree=
_insert(next, root);
6b2dbba8b6ac4df Michel Lespinasse     2012-10-08  792  		vma_interval_tree_=
insert(vma, root);
^1da177e4c3f415 Linus Torvalds        2005-04-16  793  		flush_dcache_mmap_=
unlock(mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  794  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  795  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  796  	if (remove_next) {
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  797  		__vma_unlink_list(=
mm, next);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  798  		/* Kill the cache =
*/
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  799  		vmacache_invalidat=
e(mm);
^1da177e4c3f415 Linus Torvalds        2005-04-16  800  		if (file)
^1da177e4c3f415 Linus Torvalds        2005-04-16  801  			__remove_shared_v=
m_struct(next, file, mapping);
^1da177e4c3f415 Linus Torvalds        2005-04-16  802  	} else if (insert) {
^1da177e4c3f415 Linus Torvalds        2005-04-16  803  		/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  804  		 * split_vma has s=
plit insert from vma, and needs
^1da177e4c3f415 Linus Torvalds        2005-04-16  805  		 * us to insert it=
 before dropping the locks
^1da177e4c3f415 Linus Torvalds        2005-04-16  806  		 * (it may either =
follow vma or precede it).
^1da177e4c3f415 Linus Torvalds        2005-04-16  807  		 */
f90a08f5f1a5029 Liam R. Howlett       2022-04-26  808  		__insert_vm_struct=
(mm, &mas, insert);
^1da177e4c3f415 Linus Torvalds        2005-04-16  809  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  810  =

bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  811  	if (anon_vma) {
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  812  		anon_vma_interval_=
tree_post_update_vma(vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  813  		if (adjust_next)
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  814  			anon_vma_interval=
_tree_post_update_vma(next);
08b52706d505658 Konstantin Khlebnikov 2013-02-22  815  		anon_vma_unlock_wr=
ite(anon_vma);
bf181b9f9d8dfbb Michel Lespinasse     2012-10-08  816  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  817  =

0fc48a6e213ab8e Wei Yang              2020-10-13  818  	if (file) {
808fbdbea05f1e9 Wei Yang              2020-10-13  819  		i_mmap_unlock_writ=
e(mapping);
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  820  		uprobe_mmap(vma);
2b144498350860b Srikar Dronamraju     2012-02-09  821  =

2b144498350860b Srikar Dronamraju     2012-02-09  822  		if (adjust_next)
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  823  			uprobe_mmap(next);
2b144498350860b Srikar Dronamraju     2012-02-09  824  	}
2b144498350860b Srikar Dronamraju     2012-02-09  825  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  826  	if (remove_next) {
925d1c401fa6cfd Matt Helsley          2008-04-29  827  		if (file) {
cbc91f71b51b833 Srikar Dronamraju     2012-04-11  828  			uprobe_munmap(nex=
t, next->vm_start, next->vm_end);
^1da177e4c3f415 Linus Torvalds        2005-04-16  829  			fput(file);
925d1c401fa6cfd Matt Helsley          2008-04-29  830  		}
5beb49305251e56 Rik van Riel          2010-03-05  831  		if (next->anon_vma)
5beb49305251e56 Rik van Riel          2010-03-05  832  			anon_vma_merge(vm=
a, next);
^1da177e4c3f415 Linus Torvalds        2005-04-16  833  		mm->map_count--;
3964acd0dbec123 Oleg Nesterov         2013-07-31  834  		mpol_put(vma_polic=
y(next));
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  835  		BUG_ON(vma->vm_end=
 < next->vm_end);
3928d4f5ee37cdc Linus Torvalds        2018-07-21  836  		vm_area_free(next);
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  837  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  838  		/*
^1da177e4c3f415 Linus Torvalds        2005-04-16  839  		 * In mprotect's c=
ase 6 (see comments on vma_merge),
^1da177e4c3f415 Linus Torvalds        2005-04-16  840  		 * we must remove =
another next too. It would clutter
^1da177e4c3f415 Linus Torvalds        2005-04-16  841  		 * up the code too=
 much to do both in one go.
^1da177e4c3f415 Linus Torvalds        2005-04-16  842  		 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  843  		if (remove_next !=
=3D 3) {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  844  			/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  845  			 * If "next" was =
removed and vma->vm_end was
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  846  			 * expanded (up) =
over it, in turn
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  847  			 * "next->vm_prev=
->vm_end" changed and the
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  848  			 * "vma->vm_next"=
 gap must be updated.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  849  			 */
48c8a6f751a2c87 Liam R. Howlett       2022-04-26 @850  			next =3D next_nex=
t;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  851  		} else {
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  852  			/*
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  853  			 * For the scope =
of the comment "next" and
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  854  			 * "vma" consider=
ed pre-swap(): if "vma" was
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  855  			 * removed, next-=
>vm_start was expanded (down)
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  856  			 * over it and th=
e "next" gap must be updated.
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  857  			 * Because of the=
 swap() the post-swap() "vma"
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  858  			 * actually point=
s to pre-swap() "next"
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  859  			 * (post-swap() "=
next" as opposed is now a
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  860  			 * dangling point=
er).
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  861  			 */
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  862  			next =3D vma;
e86f15ee64d8ee4 Andrea Arcangeli      2016-10-07  863  		}
734537c9cb725fc Kirill A. Shutemov    2016-07-28  864  		if (remove_next =
=3D=3D 2) {
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  865  			mas_reset(&mas);
734537c9cb725fc Kirill A. Shutemov    2016-07-28  866  			remove_next =3D 1;
734537c9cb725fc Kirill A. Shutemov    2016-07-28  867  			end =3D next->vm_=
end;
^1da177e4c3f415 Linus Torvalds        2005-04-16  868  			goto again;
48c8a6f751a2c87 Liam R. Howlett       2022-04-26  869  		} else if (!next) {
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  870  			/*
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  871  			 * If remove_next=
 =3D=3D 2 we obviously can't
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  872  			 * reach this pat=
h.
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  873  			 *
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  874  			 * If remove_next=
 =3D=3D 3 we can't reach this
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  875  			 * path because p=
re-swap() next is always not
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  876  			 * NULL. pre-swap=
() "next" is not being
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  877  			 * removed and it=
s next->vm_end is not altered
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  878  			 * (and furthermo=
re "end" already matches
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  879  			 * next->vm_end i=
n remove_next =3D=3D 3).
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  880  			 *
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  881  			 * We reach this =
only in the remove_next =3D=3D 1
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  882  			 * case if the "n=
ext" vma that was removed was
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  883  			 * the highest vm=
a of the mm. However in such
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  884  			 * case next->vm_=
end =3D=3D "end" and the extended
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  885  			 * "vma" has vma-=
>vm_end =3D=3D next->vm_end so
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  886  			 * mm->highest_vm=
_end doesn't need any update
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  887  			 * in remove_next=
 =3D=3D 1 case.
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  888  			 */
1be7107fbe18eed Hugh Dickins          2017-06-19  889  			VM_WARN_ON(mm->hi=
ghest_vm_end !=3D vm_end_gap(vma));
fb8c41e9ad1f356 Andrea Arcangeli      2016-10-07  890  		}
^1da177e4c3f415 Linus Torvalds        2005-04-16  891  	}
2b144498350860b Srikar Dronamraju     2012-02-09  892  	if (insert && file)
7b2d81d48a2d8e3 Ingo Molnar           2012-02-17  893  		uprobe_mmap(insert=
);
^1da177e4c3f415 Linus Torvalds        2005-04-16  894  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  895  	validate_mm(mm);
5beb49305251e56 Rik van Riel          2010-03-05  896  	return 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  897  }
^1da177e4c3f415 Linus Torvalds        2005-04-16  898  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0384181019782869537==--

