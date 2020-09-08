Content-Type: multipart/mixed; boundary="===============7377055395497713221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC 04/10] mm, kfence: insert KFENCE hooks for SLAB
Date: Tue, 08 Sep 2020 09:45:54 +0800
Message-ID: <202009080933.MLbrQs13%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7377055395497713221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200907134055.2878499-5-elver@google.com>
References: <20200907134055.2878499-5-elver@google.com>
TO: Marco Elver <elver@google.com>

Hi Marco,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on hnaz-linux-mm/master]
[also build test WARNING on arm64/for-next/core linus/master v5.9-rc4 next-=
20200903]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marco-Elver/KFENCE-A-low-o=
verhead-sampling-based-memory-safety-error-detector/20200907-214229
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   mm/slab.c:906:6: warning: Variable 'ret' is reassigned a value before th=
e old one has been used. [redundantAssignment]
    ret =3D init_cache_node(cachep, node, gfp);
        ^
   mm/slab.c:886:0: note: Variable 'ret' is reassigned a value before the o=
ld one has been used.
    int ret =3D -ENOMEM;
   ^
   mm/slab.c:906:6: note: Variable 'ret' is reassigned a value before the o=
ld one has been used.
    ret =3D init_cache_node(cachep, node, gfp);
        ^
   mm/slab.c:3316:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_alloc_debugcheck_after(cachep, flags, objp, caller);
         ^
   mm/slab.c:3454:7: warning: Redundant assignment of 'objp' to itself. [se=
lfAssignment]
    objp =3D cache_free_debugcheck(cachep, objp, caller);
         ^
   mm/slab.c:3514:8: warning: Redundant assignment of 'p[i]' to itself. [se=
lfAssignment]
     p[i] =3D cache_alloc_debugcheck_after(s, flags, p[i], caller);
          ^
   mm/slab.c:3342:16: warning: Local variable page shadows outer variable [=
shadowVar]
     struct page *page;
                  ^
   mm/slab.c:3336:15: note: Shadowed declaration
    struct page *page;
                 ^
   mm/slab.c:3342:16: note: Shadow variable
     struct page *page;
                  ^
>> mm/slab.c:3872:12: warning: Same expression on both sides of '&&' becaus=
e 'limit' and 'shared' represent the same value. [knownConditionTrueFalse]
    if (limit && shared && batchcount)
              ^
   mm/slab.c:3864:14: note: 'limit' is assigned value '0' here.
    int limit =3D 0;
                ^
   mm/slab.c:3865:15: note: 'shared' is assigned value '0' here.
    int shared =3D 0;
                 ^
   mm/slab.c:3872:12: note: Same expression on both sides of '&&' because '=
limit' and 'shared' represent the same value.
    if (limit && shared && batchcount)
              ^
>> mm/slab.c:3872:22: warning: Same expression on both sides of '&&' becaus=
e 'batchcount' and 'shared' represent the same value. [knownConditionTrueFa=
lse]
    if (limit && shared && batchcount)
                        ^
   mm/slab.c:3866:19: note: 'batchcount' is assigned value '0' here.
    int batchcount =3D 0;
                     ^
   mm/slab.c:3865:15: note: 'shared' is assigned value '0' here.
    int shared =3D 0;
                 ^
   mm/slab.c:3872:22: note: Same expression on both sides of '&&' because '=
batchcount' and 'shared' represent the same value.
    if (limit && shared && batchcount)
                        ^

# https://github.com/0day-ci/linux/commit/62475f64212ac70b313ca25aeaf677151=
914ac00
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Marco-Elver/KFENCE-A-low-overhead-sampling=
-based-memory-safety-error-detector/20200907-214229
git checkout 62475f64212ac70b313ca25aeaf677151914ac00
vim +3872 mm/slab.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3859  =

18004c5d4084d9 Christoph Lameter 2012-07-06  3860  /* Called with slab_mute=
x held always */
83b519e8b9572c Pekka Enberg      2009-06-10  3861  static int enable_cpucac=
he(struct kmem_cache *cachep, gfp_t gfp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3862  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3863  	int err;
943a451a87d229 Glauber Costa     2012-12-18  3864  	int limit =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3865  	int shared =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3866  	int batchcount =3D 0;
943a451a87d229 Glauber Costa     2012-12-18  3867  =

7c00fce98c3e15 Thomas Garnier    2016-07-26  3868  	err =3D cache_random_se=
q_create(cachep, cachep->num, gfp);
c7ce4f60ac199f Thomas Garnier    2016-05-19  3869  	if (err)
c7ce4f60ac199f Thomas Garnier    2016-05-19  3870  		goto end;
c7ce4f60ac199f Thomas Garnier    2016-05-19  3871  =

943a451a87d229 Glauber Costa     2012-12-18 @3872  	if (limit && shared && =
batchcount)
943a451a87d229 Glauber Costa     2012-12-18  3873  		goto skip_setup;
a737b3e2fcf96f Andrew Morton     2006-03-22  3874  	/*
a737b3e2fcf96f Andrew Morton     2006-03-22  3875  	 * The head array serve=
s three purposes:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3876  	 * - create a LIFO orde=
ring, i.e. return objects that are cache-warm
^1da177e4c3f41 Linus Torvalds    2005-04-16  3877  	 * - reduce the number =
of spinlock operations.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3878  	 * - reduce the number =
of linked list operations on the slab and
^1da177e4c3f41 Linus Torvalds    2005-04-16  3879  	 *   bufctl chains: arr=
ay operations are cheaper.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3880  	 * The numbers are gues=
sed, we should auto-tune as described by
^1da177e4c3f41 Linus Torvalds    2005-04-16  3881  	 * Bonwick.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3882  	 */
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3883  	if (cachep->size > 1310=
72)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3884  		limit =3D 1;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3885  	else if (cachep->size >=
 PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3886  		limit =3D 8;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3887  	else if (cachep->size >=
 1024)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3888  		limit =3D 24;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3889  	else if (cachep->size >=
 256)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3890  		limit =3D 54;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3891  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  3892  		limit =3D 120;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3893  =

a737b3e2fcf96f Andrew Morton     2006-03-22  3894  	/*
a737b3e2fcf96f Andrew Morton     2006-03-22  3895  	 * CPU bound tasks (e.g=
. network routing) can exhibit cpu bound
^1da177e4c3f41 Linus Torvalds    2005-04-16  3896  	 * allocation behaviour=
: Most allocs on one cpu, most free operations
^1da177e4c3f41 Linus Torvalds    2005-04-16  3897  	 * on another cpu. For =
these cases, an efficient object passing between
^1da177e4c3f41 Linus Torvalds    2005-04-16  3898  	 * cpus is necessary. T=
his is provided by a shared array. The array
^1da177e4c3f41 Linus Torvalds    2005-04-16  3899  	 * replaces Bonwick's m=
agazine layer.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3900  	 * On uniprocessor, it'=
s functionally equivalent (but less efficient)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3901  	 * to a larger limit. T=
hus disabled by default.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3902  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3903  	shared =3D 0;
3b0efdfa1e7193 Christoph Lameter 2012-06-13  3904  	if (cachep->size <=3D P=
AGE_SIZE && num_possible_cpus() > 1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3905  		shared =3D 8;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3906  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7377055395497713221==--

