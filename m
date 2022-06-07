Content-Type: multipart/mixed; boundary="===============7472721753377172156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/vaddr.c:158 __damon_va_three_regions() error: uninitialized symbol 'start'.
Date: Tue, 07 Jun 2022 14:58:55 +0800
Message-ID: <202206071442.joHmyadx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7472721753377172156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sjpark@amazon.de>
CC: Leonard Foerster <foersleo@amazon.de>
CC: Fernand Sieber <sieberf@amazon.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: 3f49584b262cf8f42b25f4c1ad9f5bfd3bdc1bca mm/damon: implement primit=
ives for the virtual memory address spaces
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220607/202206071442.joHmyadx-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/vaddr.c:158 __damon_va_three_regions() error: uninitialized symbol=
 'start'.

vim +/start +158 mm/damon/vaddr.c

3f49584b262cf8f SeongJae Park 2021-09-07  109  =

3f49584b262cf8f SeongJae Park 2021-09-07  110  /*
3f49584b262cf8f SeongJae Park 2021-09-07  111   * Find three regions separa=
ted by two biggest unmapped regions
3f49584b262cf8f SeongJae Park 2021-09-07  112   *
3f49584b262cf8f SeongJae Park 2021-09-07  113   * vma		the head vma of the =
target address space
3f49584b262cf8f SeongJae Park 2021-09-07  114   * regions	an array of three=
 address ranges that results will be saved
3f49584b262cf8f SeongJae Park 2021-09-07  115   *
3f49584b262cf8f SeongJae Park 2021-09-07  116   * This function receives an=
 address space and finds three regions in it which
3f49584b262cf8f SeongJae Park 2021-09-07  117   * separated by the two bigg=
est unmapped regions in the space.  Please refer to
3f49584b262cf8f SeongJae Park 2021-09-07  118   * below comments of '__damo=
n_va_init_regions()' function to know why this is
3f49584b262cf8f SeongJae Park 2021-09-07  119   * necessary.
3f49584b262cf8f SeongJae Park 2021-09-07  120   *
3f49584b262cf8f SeongJae Park 2021-09-07  121   * Returns 0 if success, or =
negative error code otherwise.
3f49584b262cf8f SeongJae Park 2021-09-07  122   */
3f49584b262cf8f SeongJae Park 2021-09-07  123  static int __damon_va_three_=
regions(struct vm_area_struct *vma,
3f49584b262cf8f SeongJae Park 2021-09-07  124  				       struct damon_addr=
_range regions[3])
3f49584b262cf8f SeongJae Park 2021-09-07  125  {
3f49584b262cf8f SeongJae Park 2021-09-07  126  	struct damon_addr_range gap=
 =3D {0}, first_gap =3D {0}, second_gap =3D {0};
3f49584b262cf8f SeongJae Park 2021-09-07  127  	struct vm_area_struct *last=
_vma =3D NULL;
3f49584b262cf8f SeongJae Park 2021-09-07  128  	unsigned long start =3D 0;
3f49584b262cf8f SeongJae Park 2021-09-07  129  	struct rb_root rbroot;
3f49584b262cf8f SeongJae Park 2021-09-07  130  =

3f49584b262cf8f SeongJae Park 2021-09-07  131  	/* Find two biggest gaps so=
 that first_gap > second_gap > others */
3f49584b262cf8f SeongJae Park 2021-09-07  132  	for (; vma; vma =3D vma->vm=
_next) {
3f49584b262cf8f SeongJae Park 2021-09-07  133  		if (!last_vma) {
3f49584b262cf8f SeongJae Park 2021-09-07  134  			start =3D vma->vm_start;
3f49584b262cf8f SeongJae Park 2021-09-07  135  			goto next;
3f49584b262cf8f SeongJae Park 2021-09-07  136  		}
3f49584b262cf8f SeongJae Park 2021-09-07  137  =

3f49584b262cf8f SeongJae Park 2021-09-07  138  		if (vma->rb_subtree_gap <=
=3D sz_range(&second_gap)) {
3f49584b262cf8f SeongJae Park 2021-09-07  139  			rbroot.rb_node =3D &vma->=
vm_rb;
3f49584b262cf8f SeongJae Park 2021-09-07  140  			vma =3D rb_entry(rb_last(=
&rbroot),
3f49584b262cf8f SeongJae Park 2021-09-07  141  					struct vm_area_struct, =
vm_rb);
3f49584b262cf8f SeongJae Park 2021-09-07  142  			goto next;
3f49584b262cf8f SeongJae Park 2021-09-07  143  		}
3f49584b262cf8f SeongJae Park 2021-09-07  144  =

3f49584b262cf8f SeongJae Park 2021-09-07  145  		gap.start =3D last_vma->vm=
_end;
3f49584b262cf8f SeongJae Park 2021-09-07  146  		gap.end =3D vma->vm_start;
3f49584b262cf8f SeongJae Park 2021-09-07  147  		if (sz_range(&gap) > sz_ra=
nge(&second_gap)) {
3f49584b262cf8f SeongJae Park 2021-09-07  148  			swap_ranges(&gap, &second=
_gap);
3f49584b262cf8f SeongJae Park 2021-09-07  149  			if (sz_range(&second_gap)=
 > sz_range(&first_gap))
3f49584b262cf8f SeongJae Park 2021-09-07  150  				swap_ranges(&second_gap,=
 &first_gap);
3f49584b262cf8f SeongJae Park 2021-09-07  151  		}
3f49584b262cf8f SeongJae Park 2021-09-07  152  next:
3f49584b262cf8f SeongJae Park 2021-09-07  153  		last_vma =3D vma;
3f49584b262cf8f SeongJae Park 2021-09-07  154  	}
3f49584b262cf8f SeongJae Park 2021-09-07  155  =

3f49584b262cf8f SeongJae Park 2021-09-07  156  	if (!sz_range(&second_gap) =
|| !sz_range(&first_gap))
3f49584b262cf8f SeongJae Park 2021-09-07  157  		return -EINVAL;
3f49584b262cf8f SeongJae Park 2021-09-07 @158  =

3f49584b262cf8f SeongJae Park 2021-09-07  159  	/* Sort the two biggest gap=
s by address */
3f49584b262cf8f SeongJae Park 2021-09-07  160  	if (first_gap.start > secon=
d_gap.start)
3f49584b262cf8f SeongJae Park 2021-09-07  161  		swap_ranges(&first_gap, &s=
econd_gap);
3f49584b262cf8f SeongJae Park 2021-09-07  162  =

3f49584b262cf8f SeongJae Park 2021-09-07  163  	/* Store the result */
3f49584b262cf8f SeongJae Park 2021-09-07  164  	regions[0].start =3D ALIGN(=
start, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  165  	regions[0].end =3D ALIGN(fi=
rst_gap.start, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  166  	regions[1].start =3D ALIGN(=
first_gap.end, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  167  	regions[1].end =3D ALIGN(se=
cond_gap.start, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  168  	regions[2].start =3D ALIGN(=
second_gap.end, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  169  	regions[2].end =3D ALIGN(la=
st_vma->vm_end, DAMON_MIN_REGION);
3f49584b262cf8f SeongJae Park 2021-09-07  170  =

3f49584b262cf8f SeongJae Park 2021-09-07  171  	return 0;
3f49584b262cf8f SeongJae Park 2021-09-07  172  }
3f49584b262cf8f SeongJae Park 2021-09-07  173  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7472721753377172156==--

