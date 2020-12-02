Content-Type: multipart/mixed; boundary="===============9202993415227446919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slab.c:3858:22: warning: Same expression on both sides of '&&' because 'batchcount' and 'shared' represent the same value.
Date: Thu, 03 Dec 2020 06:01:46 +0800
Message-ID: <202012030632.fI960Dru-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9202993415227446919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bb61aa61828499a7d0f5e560051625fd02ae7e4
commit: 9dfc8ff34b951f83632815a87e97a625a11360f0 i915: use find_lock_page i=
nstead of find_lock_entry
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   mm/slab.c:3308:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_alloc_debugcheck_after(cachep, flags, objp, caller);
         ^
   mm/slab.c:3440:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_free_debugcheck(cachep, objp, caller);
         ^
   mm/slab.c:3500:8: warning: Redundant assignment of 'p[i]' to itself. [se=
lfAssignment]
     p[i] =3D cache_alloc_debugcheck_after(s, flags, p[i], caller);
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/slab.c:3858:22: warning: Same expression on both sides of '&&' becaus=
e 'batchcount' and 'shared' represent the same value. [knownConditionTrueFa=
lse]
    if (limit && shared && batchcount)
                        ^
   mm/slab.c:3852:19: note: 'batchcount' is assigned value '0' here.
    int batchcount =3D 0;
                     ^
   mm/slab.c:3851:15: note: 'shared' is assigned value '0' here.
    int shared =3D 0;
                 ^
   mm/slab.c:3858:22: note: Same expression on both sides of '&&' because '=
batchcount' and 'shared' represent the same value.
    if (limit && shared && batchcount)
                        ^

vim +3858 mm/slab.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  3845  =

18004c5d4084d96 Christoph Lameter 2012-07-06  3846  /* Called with slab_mut=
ex held always */
83b519e8b9572c3 Pekka Enberg      2009-06-10  3847  static int enable_cpuca=
che(struct kmem_cache *cachep, gfp_t gfp)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3848  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3849  	int err;
943a451a87d229c Glauber Costa     2012-12-18  3850  	int limit =3D 0;
943a451a87d229c Glauber Costa     2012-12-18  3851  	int shared =3D 0;
943a451a87d229c Glauber Costa     2012-12-18  3852  	int batchcount =3D 0;
943a451a87d229c Glauber Costa     2012-12-18  3853  =

7c00fce98c3e153 Thomas Garnier    2016-07-26  3854  	err =3D cache_random_s=
eq_create(cachep, cachep->num, gfp);
c7ce4f60ac199fb Thomas Garnier    2016-05-19  3855  	if (err)
c7ce4f60ac199fb Thomas Garnier    2016-05-19  3856  		goto end;
c7ce4f60ac199fb Thomas Garnier    2016-05-19  3857  =

943a451a87d229c Glauber Costa     2012-12-18 @3858  	if (limit && shared &&=
 batchcount)
943a451a87d229c Glauber Costa     2012-12-18  3859  		goto skip_setup;
a737b3e2fcf96f5 Andrew Morton     2006-03-22  3860  	/*
a737b3e2fcf96f5 Andrew Morton     2006-03-22  3861  	 * The head array serv=
es three purposes:
^1da177e4c3f415 Linus Torvalds    2005-04-16  3862  	 * - create a LIFO ord=
ering, i.e. return objects that are cache-warm
^1da177e4c3f415 Linus Torvalds    2005-04-16  3863  	 * - reduce the number=
 of spinlock operations.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3864  	 * - reduce the number=
 of linked list operations on the slab and
^1da177e4c3f415 Linus Torvalds    2005-04-16  3865  	 *   bufctl chains: ar=
ray operations are cheaper.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3866  	 * The numbers are gue=
ssed, we should auto-tune as described by
^1da177e4c3f415 Linus Torvalds    2005-04-16  3867  	 * Bonwick.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3868  	 */
3b0efdfa1e71930 Christoph Lameter 2012-06-13  3869  	if (cachep->size > 131=
072)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3870  		limit =3D 1;
3b0efdfa1e71930 Christoph Lameter 2012-06-13  3871  	else if (cachep->size =
> PAGE_SIZE)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3872  		limit =3D 8;
3b0efdfa1e71930 Christoph Lameter 2012-06-13  3873  	else if (cachep->size =
> 1024)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3874  		limit =3D 24;
3b0efdfa1e71930 Christoph Lameter 2012-06-13  3875  	else if (cachep->size =
> 256)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3876  		limit =3D 54;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3877  	else
^1da177e4c3f415 Linus Torvalds    2005-04-16  3878  		limit =3D 120;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3879  =

a737b3e2fcf96f5 Andrew Morton     2006-03-22  3880  	/*
a737b3e2fcf96f5 Andrew Morton     2006-03-22  3881  	 * CPU bound tasks (e.=
g. network routing) can exhibit cpu bound
^1da177e4c3f415 Linus Torvalds    2005-04-16  3882  	 * allocation behaviou=
r: Most allocs on one cpu, most free operations
^1da177e4c3f415 Linus Torvalds    2005-04-16  3883  	 * on another cpu. For=
 these cases, an efficient object passing between
^1da177e4c3f415 Linus Torvalds    2005-04-16  3884  	 * cpus is necessary. =
This is provided by a shared array. The array
^1da177e4c3f415 Linus Torvalds    2005-04-16  3885  	 * replaces Bonwick's =
magazine layer.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3886  	 * On uniprocessor, it=
's functionally equivalent (but less efficient)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3887  	 * to a larger limit. =
Thus disabled by default.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3888  	 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3889  	shared =3D 0;
3b0efdfa1e71930 Christoph Lameter 2012-06-13  3890  	if (cachep->size <=3D =
PAGE_SIZE && num_possible_cpus() > 1)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3891  		shared =3D 8;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3892  =


:::::: The code at line 3858 was first introduced by commit
:::::: 943a451a87d229ca564a27274b58eaeae35fde5d slab: propagate tunable val=
ues

:::::: TO: Glauber Costa <glommer@parallels.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9202993415227446919==--

