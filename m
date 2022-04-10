Content-Type: multipart/mixed; boundary="===============2264330142376045436=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/ref_tracker.c:92:29: warning: Parameter 'trackerp' can be declared with const [constParameter]
Date: Sun, 10 Apr 2022 13:16:45 +0800
Message-ID: <202204101301.8ln2LlBp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2264330142376045436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: 914a7b5000d08f1487e0efa52f27c4b7ea75b893 lib: add tests for referen=
ce tracker
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 914a7b5000d08f1487e0efa52f27c4b7ea75b893
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/ref_tracker.c:92:29: warning: Parameter 'trackerp' can be declared w=
ith const [constParameter]
          struct ref_tracker **trackerp)
                               ^
>> lib/ref_tracker.c:54:17: warning: Uninitialized variable: tracker->alloc=
_stack_handle [uninitvar]
      if (tracker->alloc_stack_handle)
                   ^
--
>> net/mctp/device.c:125:13: warning: Uninitialized variable: idx [uninitva=
r]
    mcb->idx =3D idx;
               ^
   net/mctp/device.c:102:16: note: Assuming condition is false
    for (; mcb->h < NETDEV_HASHENTRIES; mcb->h++, mcb->idx =3D 0) {
                  ^
   net/mctp/device.c:125:13: note: Uninitialized variable: idx
    mcb->idx =3D idx;
               ^
--
>> net/ipv6/ipv6_sockglue.c:1401:7: warning: Local variable 'flags' shadows=
 outer argument [shadowArgument]
     int flags;
         ^
   net/ipv6/ipv6_sockglue.c:1134:61: note: Shadowed declaration
         char __user *optval, int __user *optlen, unsigned int flags)
                                                               ^
   net/ipv6/ipv6_sockglue.c:1401:7: note: Shadow variable
     int flags;
         ^

vim +/trackerp +92 lib/ref_tracker.c

4e66934eaadc83 Eric Dumazet 2021-12-04  42  =

4e66934eaadc83 Eric Dumazet 2021-12-04  43  void ref_tracker_dir_print(stru=
ct ref_tracker_dir *dir,
4e66934eaadc83 Eric Dumazet 2021-12-04  44  			   unsigned int display_limi=
t)
4e66934eaadc83 Eric Dumazet 2021-12-04  45  {
4e66934eaadc83 Eric Dumazet 2021-12-04  46  	struct ref_tracker *tracker;
4e66934eaadc83 Eric Dumazet 2021-12-04  47  	unsigned long flags;
4e66934eaadc83 Eric Dumazet 2021-12-04  48  	unsigned int i =3D 0;
4e66934eaadc83 Eric Dumazet 2021-12-04  49  =

4e66934eaadc83 Eric Dumazet 2021-12-04  50  	spin_lock_irqsave(&dir->lock, =
flags);
4e66934eaadc83 Eric Dumazet 2021-12-04  51  	list_for_each_entry(tracker, &=
dir->list, head) {
4e66934eaadc83 Eric Dumazet 2021-12-04  52  		if (i < display_limit) {
4e66934eaadc83 Eric Dumazet 2021-12-04  53  			pr_err("leaked reference.\n"=
);
4e66934eaadc83 Eric Dumazet 2021-12-04 @54  			if (tracker->alloc_stack_han=
dle)
4e66934eaadc83 Eric Dumazet 2021-12-04  55  				stack_depot_print(tracker->=
alloc_stack_handle);
4e66934eaadc83 Eric Dumazet 2021-12-04  56  			i++;
4e66934eaadc83 Eric Dumazet 2021-12-04  57  		} else {
4e66934eaadc83 Eric Dumazet 2021-12-04  58  			break;
4e66934eaadc83 Eric Dumazet 2021-12-04  59  		}
4e66934eaadc83 Eric Dumazet 2021-12-04  60  	}
4e66934eaadc83 Eric Dumazet 2021-12-04  61  	spin_unlock_irqrestore(&dir->l=
ock, flags);
4e66934eaadc83 Eric Dumazet 2021-12-04  62  }
4e66934eaadc83 Eric Dumazet 2021-12-04  63  EXPORT_SYMBOL(ref_tracker_dir_p=
rint);
4e66934eaadc83 Eric Dumazet 2021-12-04  64  =

4e66934eaadc83 Eric Dumazet 2021-12-04  65  int ref_tracker_alloc(struct re=
f_tracker_dir *dir,
4e66934eaadc83 Eric Dumazet 2021-12-04  66  		      struct ref_tracker **tr=
ackerp,
4e66934eaadc83 Eric Dumazet 2021-12-04  67  		      gfp_t gfp)
4e66934eaadc83 Eric Dumazet 2021-12-04  68  {
4e66934eaadc83 Eric Dumazet 2021-12-04  69  	unsigned long entries[REF_TRAC=
KER_STACK_ENTRIES];
4e66934eaadc83 Eric Dumazet 2021-12-04  70  	struct ref_tracker *tracker;
4e66934eaadc83 Eric Dumazet 2021-12-04  71  	unsigned int nr_entries;
4e66934eaadc83 Eric Dumazet 2021-12-04  72  	unsigned long flags;
4e66934eaadc83 Eric Dumazet 2021-12-04  73  =

4e66934eaadc83 Eric Dumazet 2021-12-04  74  	*trackerp =3D tracker =3D kzal=
loc(sizeof(*tracker), gfp | __GFP_NOFAIL);
4e66934eaadc83 Eric Dumazet 2021-12-04  75  	if (unlikely(!tracker)) {
4e66934eaadc83 Eric Dumazet 2021-12-04  76  		pr_err_once("memory allocatio=
n failure, unreliable refcount tracker.\n");
4e66934eaadc83 Eric Dumazet 2021-12-04  77  		refcount_inc(&dir->untracked);
4e66934eaadc83 Eric Dumazet 2021-12-04  78  		return -ENOMEM;
4e66934eaadc83 Eric Dumazet 2021-12-04  79  	}
4e66934eaadc83 Eric Dumazet 2021-12-04  80  	nr_entries =3D stack_trace_sav=
e(entries, ARRAY_SIZE(entries), 1);
4e66934eaadc83 Eric Dumazet 2021-12-04  81  	nr_entries =3D filter_irq_stac=
ks(entries, nr_entries);
4e66934eaadc83 Eric Dumazet 2021-12-04  82  	tracker->alloc_stack_handle =
=3D stack_depot_save(entries, nr_entries, gfp);
4e66934eaadc83 Eric Dumazet 2021-12-04  83  =

4e66934eaadc83 Eric Dumazet 2021-12-04  84  	spin_lock_irqsave(&dir->lock, =
flags);
4e66934eaadc83 Eric Dumazet 2021-12-04  85  	list_add(&tracker->head, &dir-=
>list);
4e66934eaadc83 Eric Dumazet 2021-12-04  86  	spin_unlock_irqrestore(&dir->l=
ock, flags);
4e66934eaadc83 Eric Dumazet 2021-12-04  87  	return 0;
4e66934eaadc83 Eric Dumazet 2021-12-04  88  }
4e66934eaadc83 Eric Dumazet 2021-12-04  89  EXPORT_SYMBOL_GPL(ref_tracker_a=
lloc);
4e66934eaadc83 Eric Dumazet 2021-12-04  90  =

4e66934eaadc83 Eric Dumazet 2021-12-04  91  int ref_tracker_free(struct ref=
_tracker_dir *dir,
4e66934eaadc83 Eric Dumazet 2021-12-04 @92  		     struct ref_tracker **tra=
ckerp)

:::::: The code at line 92 was first introduced by commit
:::::: 4e66934eaadc83b27ada8d42b60894018f3bfabf lib: add reference counting=
 tracking infrastructure

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2264330142376045436==--

