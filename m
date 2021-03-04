Content-Type: multipart/mixed; boundary="===============2851729699537698367=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slab.c:3880:12: warning: Same expression on both sides of '&&' because 'limit' and 'shared' represent the same value.
Date: Thu, 04 Mar 2021 10:01:23 +0800
Message-ID: <202103041010.rBck42m1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2851729699537698367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f69d02e37a85645aa90d18cacfff36dba370f797
commit: 8e7f37f2aaa56b723a24f6872817cf9c6410b613 mm: Add mem_dump_obj() to =
print source of memory block
date:   6 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 weeks ago
compiler: mips64el-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   mm/slab.c:3309:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_alloc_debugcheck_after(cachep, flags, objp, caller);
         ^
   mm/slab.c:3442:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_free_debugcheck(cachep, objp, caller);
         ^
   mm/slab.c:3502:8: warning: Redundant assignment of 'p[i]' to itself. [se=
lfAssignment]
     p[i] =3D cache_alloc_debugcheck_after(s, flags, p[i], caller);
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/slab.c:3880:12: warning: Same expression on both sides of '&&' becaus=
e 'limit' and 'shared' represent the same value. [knownConditionTrueFalse]
    if (limit && shared && batchcount)
              ^
   mm/slab.c:3872:14: note: 'limit' is assigned value '0' here.
    int limit =3D 0;
                ^
   mm/slab.c:3873:15: note: 'shared' is assigned value '0' here.
    int shared =3D 0;
                 ^
   mm/slab.c:3880:12: note: Same expression on both sides of '&&' because '=
limit' and 'shared' represent the same value.
    if (limit && shared && batchcount)
              ^
>> mm/slab.c:3880:22: warning: Same expression on both sides of '&&' becaus=
e 'batchcount' and 'shared' represent the same value. [knownConditionTrueFa=
lse]
    if (limit && shared && batchcount)
                        ^
   mm/slab.c:3874:19: note: 'batchcount' is assigned value '0' here.
    int batchcount =3D 0;
                     ^
   mm/slab.c:3873:15: note: 'shared' is assigned value '0' here.
    int shared =3D 0;
                 ^
   mm/slab.c:3880:22: note: Same expression on both sides of '&&' because '=
batchcount' and 'shared' represent the same value.
    if (limit && shared && batchcount)
                        ^

vim +3880 mm/slab.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3867  =

18004c5d4084d9 Christoph Lameter 2012-07-06  3868  /* Called with slab_mute=
x held always */
83b519e8b9572c Pekka Enberg      2009-06-10  3869  static int enable_cpucac=
he(struct kmem_cache *cachep, gfp_t gfp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3870  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3871  	int err;
943a451a87d229 Glauber Costa     2012-12-18  3872  	int limit =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3873  	int shared =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3874  	int batchcount =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3875  =

7c00fce98c3e15 Thomas Garnier    2016-07-26  3876  	err =3D cache_random_se=
q_create(cachep, cachep->num, gfp);
c7ce4f60ac199f Thomas Garnier    2016-05-19  3877  	if (err)
c7ce4f60ac199f Thomas Garnier    2016-05-19  3878  		goto end;
c7ce4f60ac199f Thomas Garnier    2016-05-19  3879  =

943a451a87d229 Glauber Costa     2012-12-18 @3880  	if (limit && shared && =
batchcount)
943a451a87d229 Glauber Costa     2012-12-18  3881  		goto skip_setup;
a737b3e2fcf96f Andrew Morton     2006-03-22  3882  	/*
a737b3e2fcf96f Andrew Morton     2006-03-22  3883  	 * The head array serve=
s three purposes:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3884  	 * - create a LIFO orde=
ring, i.e. return objects that are cache-warm
^1da177e4c3f41 Linus Torvalds    2005-04-16  3885  	 * - reduce the number =
of spinlock operations.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3886  	 * - reduce the number =
of linked list operations on the slab and
^1da177e4c3f41 Linus Torvalds    2005-04-16  3887  	 *   bufctl chains: arr=
ay operations are cheaper.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3888  	 * The numbers are gues=
sed, we should auto-tune as described by
^1da177e4c3f41 Linus Torvalds    2005-04-16  3889  	 * Bonwick.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3890  	 */
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3891  	if (cachep->size > 1310=
72)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3892  		limit =3D 1;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3893  	else if (cachep->size >=
 PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3894  		limit =3D 8;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3895  	else if (cachep->size >=
 1024)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3896  		limit =3D 24;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3897  	else if (cachep->size >=
 256)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3898  		limit =3D 54;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3899  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3900  		limit =3D 120;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3901  =

a737b3e2fcf96f Andrew Morton     2006-03-22  3902  	/*
a737b3e2fcf96f Andrew Morton     2006-03-22  3903  	 * CPU bound tasks (e.g=
. network routing) can exhibit cpu bound
^1da177e4c3f41 Linus Torvalds    2005-04-16  3904  	 * allocation behaviour=
: Most allocs on one cpu, most free operations
^1da177e4c3f41 Linus Torvalds    2005-04-16  3905  	 * on another cpu. For =
these cases, an efficient object passing between
^1da177e4c3f41 Linus Torvalds    2005-04-16  3906  	 * cpus is necessary. T=
his is provided by a shared array. The array
^1da177e4c3f41 Linus Torvalds    2005-04-16  3907  	 * replaces Bonwick's m=
agazine layer.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3908  	 * On uniprocessor, it'=
s functionally equivalent (but less efficient)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3909  	 * to a larger limit. T=
hus disabled by default.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3910  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3911  	shared =3D 0;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3912  	if (cachep->size <=3D P=
AGE_SIZE && num_possible_cpus() > 1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3913  		shared =3D 8;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3914  =


:::::: The code at line 3880 was first introduced by commit
:::::: 943a451a87d229ca564a27274b58eaeae35fde5d slab: propagate tunable val=
ues

:::::: TO: Glauber Costa <glommer@parallels.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2851729699537698367==--

