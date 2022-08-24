Content-Type: multipart/mixed; boundary="===============6821120661337269767=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2401/2594] mm/damon/vaddr.c:158 __damon_va_three_regions() error: uninitialized symbol 'start'.
Date: Wed, 24 Aug 2022 08:44:32 +0800
Message-ID: <202208240856.gg9IJraK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6821120661337269767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: SeongJae Park <sj@kernel.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   05477f3653b82d8b3bcf39d2937d9893124976db
commit: 5bd2dd86a506aec7ea613400ac8d7b6ff9a312e5 [2401/2594] damon: convert=
 __damon_va_three_regions to use the VMA iterator
:::::: branch date: 19 hours ago
:::::: commit date: 26 hours ago
config: nios2-randconfig-m031-20220824 (https://download.01.org/0day-ci/arc=
hive/20220824/202208240856.gg9IJraK-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/vaddr.c:158 __damon_va_three_regions() error: uninitialized symbol=
 'start'.

vim +/start +158 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park   2021-09-07  102  =

3f49584b262cf8 SeongJae Park   2021-09-07  103  /*
3f49584b262cf8 SeongJae Park   2021-09-07  104   * Find three regions separ=
ated by two biggest unmapped regions
3f49584b262cf8 SeongJae Park   2021-09-07  105   *
3f49584b262cf8 SeongJae Park   2021-09-07  106   * vma		the head vma of the=
 target address space
3f49584b262cf8 SeongJae Park   2021-09-07  107   * regions	an array of thre=
e address ranges that results will be saved
3f49584b262cf8 SeongJae Park   2021-09-07  108   *
3f49584b262cf8 SeongJae Park   2021-09-07  109   * This function receives a=
n address space and finds three regions in it which
3f49584b262cf8 SeongJae Park   2021-09-07  110   * separated by the two big=
gest unmapped regions in the space.  Please refer to
3f49584b262cf8 SeongJae Park   2021-09-07  111   * below comments of '__dam=
on_va_init_regions()' function to know why this is
3f49584b262cf8 SeongJae Park   2021-09-07  112   * necessary.
3f49584b262cf8 SeongJae Park   2021-09-07  113   *
3f49584b262cf8 SeongJae Park   2021-09-07  114   * Returns 0 if success, or=
 negative error code otherwise.
3f49584b262cf8 SeongJae Park   2021-09-07  115   */
5bd2dd86a506ae Liam R. Howlett 2022-08-22  116  static int __damon_va_three=
_regions(struct mm_struct *mm,
3f49584b262cf8 SeongJae Park   2021-09-07  117  				       struct damon_add=
r_range regions[3])
3f49584b262cf8 SeongJae Park   2021-09-07  118  {
5bd2dd86a506ae Liam R. Howlett 2022-08-22  119  	struct damon_addr_range fi=
rst_gap =3D {0}, second_gap =3D {0};
5bd2dd86a506ae Liam R. Howlett 2022-08-22  120  	VMA_ITERATOR(vmi, mm, 0);
5bd2dd86a506ae Liam R. Howlett 2022-08-22  121  	struct vm_area_struct *vma=
, *prev =3D NULL;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  122  	unsigned long start;
3f49584b262cf8 SeongJae Park   2021-09-07  123  =

5bd2dd86a506ae Liam R. Howlett 2022-08-22  124  	/*
5bd2dd86a506ae Liam R. Howlett 2022-08-22  125  	 * Find the two biggest ga=
ps so that first_gap > second_gap > others.
5bd2dd86a506ae Liam R. Howlett 2022-08-22  126  	 * If this is too slow, it=
 can be optimised to examine the maple
5bd2dd86a506ae Liam R. Howlett 2022-08-22  127  	 * tree gaps.
5bd2dd86a506ae Liam R. Howlett 2022-08-22  128  	 */
5bd2dd86a506ae Liam R. Howlett 2022-08-22  129  	for_each_vma(vmi, vma) {
5bd2dd86a506ae Liam R. Howlett 2022-08-22  130  		unsigned long gap;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  131  =

5bd2dd86a506ae Liam R. Howlett 2022-08-22  132  		if (!prev) {
5bd2dd86a506ae Liam R. Howlett 2022-08-22  133  			start =3D vma->vm_start;
3f49584b262cf8 SeongJae Park   2021-09-07  134  			goto next;
3f49584b262cf8 SeongJae Park   2021-09-07  135  		}
5bd2dd86a506ae Liam R. Howlett 2022-08-22  136  		gap =3D vma->vm_start - p=
rev->vm_end;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  137  =

5bd2dd86a506ae Liam R. Howlett 2022-08-22  138  		if (gap > sz_range(&first=
_gap)) {
5bd2dd86a506ae Liam R. Howlett 2022-08-22  139  			second_gap =3D first_gap;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  140  			first_gap.start =3D prev=
->vm_end;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  141  			first_gap.end =3D vma->v=
m_start;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  142  		} else if (gap > sz_range=
(&second_gap)) {
5bd2dd86a506ae Liam R. Howlett 2022-08-22  143  			second_gap.start =3D pre=
v->vm_end;
5bd2dd86a506ae Liam R. Howlett 2022-08-22  144  			second_gap.end =3D vma->=
vm_start;
3f49584b262cf8 SeongJae Park   2021-09-07  145  		}
3f49584b262cf8 SeongJae Park   2021-09-07  146  next:
5bd2dd86a506ae Liam R. Howlett 2022-08-22  147  		prev =3D vma;
3f49584b262cf8 SeongJae Park   2021-09-07  148  	}
3f49584b262cf8 SeongJae Park   2021-09-07  149  =

3f49584b262cf8 SeongJae Park   2021-09-07  150  	if (!sz_range(&second_gap)=
 || !sz_range(&first_gap))
3f49584b262cf8 SeongJae Park   2021-09-07  151  		return -EINVAL;
3f49584b262cf8 SeongJae Park   2021-09-07  152  =

3f49584b262cf8 SeongJae Park   2021-09-07  153  	/* Sort the two biggest ga=
ps by address */
3f49584b262cf8 SeongJae Park   2021-09-07  154  	if (first_gap.start > seco=
nd_gap.start)
8bd0b9da03c915 Yihao Han       2022-01-14  155  		swap(first_gap, second_ga=
p);
3f49584b262cf8 SeongJae Park   2021-09-07  156  =

3f49584b262cf8 SeongJae Park   2021-09-07  157  	/* Store the result */
3f49584b262cf8 SeongJae Park   2021-09-07 @158  	regions[0].start =3D ALIGN=
(start, DAMON_MIN_REGION);
3f49584b262cf8 SeongJae Park   2021-09-07  159  	regions[0].end =3D ALIGN(f=
irst_gap.start, DAMON_MIN_REGION);
3f49584b262cf8 SeongJae Park   2021-09-07  160  	regions[1].start =3D ALIGN=
(first_gap.end, DAMON_MIN_REGION);
3f49584b262cf8 SeongJae Park   2021-09-07  161  	regions[1].end =3D ALIGN(s=
econd_gap.start, DAMON_MIN_REGION);
3f49584b262cf8 SeongJae Park   2021-09-07  162  	regions[2].start =3D ALIGN=
(second_gap.end, DAMON_MIN_REGION);
5bd2dd86a506ae Liam R. Howlett 2022-08-22  163  	regions[2].end =3D ALIGN(p=
rev->vm_end, DAMON_MIN_REGION);
3f49584b262cf8 SeongJae Park   2021-09-07  164  =

3f49584b262cf8 SeongJae Park   2021-09-07  165  	return 0;
3f49584b262cf8 SeongJae Park   2021-09-07  166  }
3f49584b262cf8 SeongJae Park   2021-09-07  167  =


:::::: The code at line 158 was first introduced by commit
:::::: 3f49584b262cf8f42b25f4c1ad9f5bfd3bdc1bca mm/damon: implement primiti=
ves for the virtual memory address spaces

:::::: TO: SeongJae Park <sjpark@amazon.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6821120661337269767==--

