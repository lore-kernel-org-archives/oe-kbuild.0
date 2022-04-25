Content-Type: multipart/mixed; boundary="===============7084309408485083737=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slab_common.c:443:24: warning: Uninitialized variables: s.object_size, s.size, s.align, s.flags, s.useroffset, s.usersize, s.name, s.refcount, s.ctor, s.list [uninitvar]
Date: Tue, 26 Apr 2022 03:16:35 +0800
Message-ID: <202204260334.oGF4hjn2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7084309408485083737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: 401fb12c68c257b9c9116b1475c0ac26b646fcc0 mm/sl*b: Differentiate str=
uct slab fields by sl*b implementations
date:   4 months ago
:::::: branch date: 75 minutes ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 401fb12c68c257b9c9116b1475c0ac26b646fcc0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/slab_common.c:187:48: warning: Parameter 'ctor' can be declared with =
const [constParameter]
     slab_flags_t flags, const char *name, void (*ctor)(void *))
                                                  ^
>> mm/slab_common.c:443:24: warning: Uninitialized variables: s.object_size=
, s.size, s.align, s.flags, s.useroffset, s.usersize, s.name, s.refcount, s=
.ctor, s.list [uninitvar]
     debugfs_slab_release(s);
                          ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:437:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:443:24: note: Uninitialized variables: s.object_size, s=
.size, s.align, s.flags, s.useroffset, s.usersize, s.name, s.refcount, s.ct=
or, s.list
     debugfs_slab_release(s);
                          ^

vim +443 mm/slab_common.c

3965fc36522446 Vladimir Davydov    2014-01-23  418  =

657dc2f9722092 Tejun Heo           2017-02-22  419  static void slab_caches=
_to_rcu_destroy_workfn(struct work_struct *work)
d5b3cf7139b877 Vladimir Davydov    2015-02-10  420  {
657dc2f9722092 Tejun Heo           2017-02-22  421  	LIST_HEAD(to_destroy);
657dc2f9722092 Tejun Heo           2017-02-22  422  	struct kmem_cache *s, =
*s2;
d5b3cf7139b877 Vladimir Davydov    2015-02-10  423  =

657dc2f9722092 Tejun Heo           2017-02-22  424  	/*
5f0d5a3ae7cff0 Paul E. McKenney    2017-01-18  425  	 * On destruction, SLA=
B_TYPESAFE_BY_RCU kmem_caches are put on the
657dc2f9722092 Tejun Heo           2017-02-22  426  	 * @slab_caches_to_rcu=
_destroy list.  The slab pages are freed
081a06fa299066 Randy Dunlap        2020-08-11  427  	 * through RCU and the=
 associated kmem_cache are dereferenced
657dc2f9722092 Tejun Heo           2017-02-22  428  	 * while freeing the p=
ages, so the kmem_caches should be freed only
657dc2f9722092 Tejun Heo           2017-02-22  429  	 * after the pending R=
CU operations are finished.  As rcu_barrier()
657dc2f9722092 Tejun Heo           2017-02-22  430  	 * is a pretty slow op=
eration, we batch all pending destructions
657dc2f9722092 Tejun Heo           2017-02-22  431  	 * asynchronously.
657dc2f9722092 Tejun Heo           2017-02-22  432  	 */
657dc2f9722092 Tejun Heo           2017-02-22  433  	mutex_lock(&slab_mutex=
);
657dc2f9722092 Tejun Heo           2017-02-22  434  	list_splice_init(&slab=
_caches_to_rcu_destroy, &to_destroy);
657dc2f9722092 Tejun Heo           2017-02-22  435  	mutex_unlock(&slab_mut=
ex);
d5b3cf7139b877 Vladimir Davydov    2015-02-10  436  =

657dc2f9722092 Tejun Heo           2017-02-22  437  	if (list_empty(&to_des=
troy))
657dc2f9722092 Tejun Heo           2017-02-22  438  		return;
657dc2f9722092 Tejun Heo           2017-02-22  439  =

657dc2f9722092 Tejun Heo           2017-02-22  440  	rcu_barrier();
657dc2f9722092 Tejun Heo           2017-02-22  441  =

657dc2f9722092 Tejun Heo           2017-02-22  442  	list_for_each_entry_sa=
fe(s, s2, &to_destroy, list) {
64dd68497be76a Faiyaz Mohammed     2021-06-28 @443  		debugfs_slab_release(=
s);
d3fb45f370d927 Alexander Potapenko 2021-02-25  444  		kfence_shutdown_cache=
(s);
657dc2f9722092 Tejun Heo           2017-02-22  445  #ifdef SLAB_SUPPORTS_SY=
SFS
657dc2f9722092 Tejun Heo           2017-02-22  446  		sysfs_slab_release(s);
657dc2f9722092 Tejun Heo           2017-02-22  447  #else
657dc2f9722092 Tejun Heo           2017-02-22  448  		slab_kmem_cache_relea=
se(s);
657dc2f9722092 Tejun Heo           2017-02-22  449  #endif
657dc2f9722092 Tejun Heo           2017-02-22  450  	}
d5b3cf7139b877 Vladimir Davydov    2015-02-10  451  }
d5b3cf7139b877 Vladimir Davydov    2015-02-10  452  =


:::::: The code at line 443 was first introduced by commit
:::::: 64dd68497be76ab4e237cca06f5324e220d0f050 mm: slub: move sysfs slab a=
lloc/free interfaces to debugfs

:::::: TO: Faiyaz Mohammed <faiyazm@codeaurora.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7084309408485083737==--

