Content-Type: multipart/mixed; boundary="===============7462061353035184856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] ax25: add refcount in ax25_dev to avoid UAF bugs
Date: Sun, 30 Jan 2022 05:56:58 +0800
Message-ID: <202201300456.Cd80NVTx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7462061353035184856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duomi=
ng@zju.edu.cn>
References: <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duomin=
g@zju.edu.cn>
TO: Duoming Zhou <duoming@zju.edu.cn>

Hi Duoming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Duoming-Zhou/ax25-fix-NPD-=
and-UAF-bugs-when-detaching-ax25-device/20220128-125826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
23a46422c56144939c091c76cf389aa863ce9c18
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20130/202201300456.Cd80NVTx-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7133514cbe444a4937ff7768f=
b6283e3c4e3c57d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Duoming-Zhou/ax25-fix-NPD-and-UAF-=
bugs-when-detaching-ax25-device/20220128-125826
        git checkout 7133514cbe444a4937ff7768fb6283e3c4e3c57d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                           ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   kernel/sched/fair.c:9859:2: note: Assuming the condition is false
           schedstat_inc(sd->lb_count[idle]);
           ^
   kernel/sched/stats.h:37:40: note: expanded from macro 'schedstat_inc'
   #define   schedstat_inc(var)            do { if (schedstat_enabled()) { =
var++; } } while (0)
                                                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/stats.h:35:32: note: expanded from macro 'schedstat_enabled'
   #define   schedstat_enabled()           static_branch_unlikely(&sched_sc=
hedstats)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/jump_label.h:420:2: note: expanded from macro 'static_key_=
enabled'
           static_key_count((struct static_key *)x) > 0;                   =
        \
           ^
   include/linux/compiler.h:80:39: note: expanded from macro 'unlikely_notr=
ace'
   # define unlikely_notrace(x)    unlikely(x)
                                   ~~~~~~~~~^~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/sched/fair.c:9859:2: note: Taking false branch
           schedstat_inc(sd->lb_count[idle]);
           ^
   kernel/sched/stats.h:37:36: note: expanded from macro 'schedstat_inc'
   #define   schedstat_inc(var)            do { if (schedstat_enabled()) { =
var++; } } while (0)
                                                ^
   kernel/sched/fair.c:9859:2: note: Loop condition is false.  Exiting loop
           schedstat_inc(sd->lb_count[idle]);
           ^
   kernel/sched/stats.h:37:31: note: expanded from macro 'schedstat_inc'
   #define   schedstat_inc(var)            do { if (schedstat_enabled()) { =
var++; } } while (0)
                                           ^
   kernel/sched/fair.c:9862:2: note: Taking false branch
           if (!should_we_balance(&env)) {
           ^
   kernel/sched/fair.c:9867:10: note: Calling 'find_busiest_group'
           group =3D find_busiest_group(&env);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9479:2: note: Calling 'update_sd_lb_stats'
           update_sd_lb_stats(env, &sds);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9211:2: note: 'sg' initialized here
           struct sched_group *sg =3D env->sd->groups;
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9221:7: note: Assuming 'local_group' is 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9221:3: note: Taking false branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9230:32: note: Passing 'sg' via 3rd parameter 'group'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                                                ^~
   kernel/sched/fair.c:9230:3: note: Calling 'update_sg_lb_stats'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8668:16: note: Assuming 'group' is equal to field 'l=
ocal'
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8668:16: note: Assuming pointer value is null
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8670:2: note: Assuming 'i' is >=3D 'nr_cpu_ids'
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:326:3: note: expanded from macro 'for_each_cpu_a=
nd'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8670:2: note: Loop condition is false. Execution con=
tinues on line 8711
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:324:2: note: expanded from macro 'for_each_cpu_a=
nd'
           for ((cpu) =3D -1;                                              =
  \
           ^
   kernel/sched/fair.c:8711:24: note: Access to field 'sgc' results in a de=
reference of a null pointer (loaded from variable 'group')
           sgs->group_capacity =3D group->sgc->capacity;
                                 ^~~~~
   Suppressed 18 warnings (7 in non-user code, 11 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> net/ax25/ax25_dev.c:122:3: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                   ax25_dev_put(ax25_dev);
                   ^            ~~~~~~~~
   net/ax25/ax25_dev.c:98:6: note: Assuming the condition is false
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:98:2: note: Taking false branch
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
           ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is false. Execution cont=
inues on line 116
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:116:6: note: Assuming the condition is true
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:116:2: note: Taking true branch
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
           ^
   net/ax25/ax25_dev.c:118:3: note: Calling 'ax25_dev_put'
                   ax25_dev_put(ax25_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/net/ax25.h:302:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&ax25_dev->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ax25.h:302:2: note: Taking true branch
           if (refcount_dec_and_test(&ax25_dev->refcount)) {
           ^
   include/net/ax25.h:303:3: note: Memory is released
                   kfree(ax25_dev);
                   ^~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:118:3: note: Returning; memory was released via 1st =
parameter
                   ax25_dev_put(ax25_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:122:3: note: Use of memory after it is freed
                   ax25_dev_put(ax25_dev);
                   ^            ~~~~~~~~
   net/ax25/ax25_dev.c:133:4: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                           ax25_dev_put(ax25_dev);
                           ^            ~~~~~~~~
   net/ax25/ax25_dev.c:98:6: note: Assuming the condition is false
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:98:2: note: Taking false branch
           if ((ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)
           ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is not equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is true.  Entering loop =
body
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:113:7: note: Assuming 'dev' is not equal to field 'f=
orward'
                   if (s->forward =3D=3D dev)
                       ^~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:113:3: note: Taking false branch
                   if (s->forward =3D=3D dev)
                   ^
   net/ax25/ax25_dev.c:112:26: note: Assuming 's' is equal to NULL
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
                                   ^~~~~~~~~
   net/ax25/ax25_dev.c:112:2: note: Loop condition is false. Execution cont=
inues on line 116
           for (s =3D ax25_dev_list; s !=3D NULL; s =3D s->next)
           ^
   net/ax25/ax25_dev.c:116:6: note: Assuming the condition is false
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/ax25_dev.c:116:2: note: Taking false branch
           if ((s =3D ax25_dev_list) =3D=3D ax25_dev) {
           ^
   net/ax25/ax25_dev.c:126:9: note: 's' is not equal to NULL
           while (s !=3D NULL && s->next !=3D NULL) {
                  ^
   net/ax25/ax25_dev.c:126:9: note: Left side of '&&' is true
   net/ax25/ax25_dev.c:126:25: note: Field 'next' is not equal to NULL

vim +122 net/ax25/ax25_dev.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  108  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  109  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  	 *	Remove any packet forwar=
ding that points to this device.
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  112  	for (s =3D ax25_dev_list; s=
 !=3D NULL; s =3D s->next)
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  		if (s->forward =3D=3D dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  114  			s->forward =3D NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  116  	if ((s =3D ax25_dev_list) =
=3D=3D ax25_dev) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  117  		ax25_dev_list =3D s->next;
7133514cbe444a Duoming Zhou   2022-01-28  118  		ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  		spin_unlock_bh(&ax25_dev_l=
ock);
c433570458e49b Cong Wang      2018-12-29  120  		dev->ax25_ptr =3D NULL;
66ce07f7802b68 Eric Dumazet   2021-12-06  121  		dev_put_track(dev, &ax25_d=
ev->dev_tracker);
7133514cbe444a Duoming Zhou   2022-01-28 @122  		ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  123  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  124  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  125  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  126  	while (s !=3D NULL && s->ne=
xt !=3D NULL) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  127  		if (s->next =3D=3D ax25_de=
v) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  128  			s->next =3D ax25_dev->nex=
t;
7133514cbe444a Duoming Zhou   2022-01-28  129  			ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  130  			spin_unlock_bh(&ax25_dev_=
lock);
c433570458e49b Cong Wang      2018-12-29  131  			dev->ax25_ptr =3D NULL;
66ce07f7802b68 Eric Dumazet   2021-12-06  132  			dev_put_track(dev, &ax25_=
dev->dev_tracker);
7133514cbe444a Duoming Zhou   2022-01-28  133  			ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  134  			return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  135  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  136  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  137  		s =3D s->next;
^1da177e4c3f41 Linus Torvalds 2005-04-16  138  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  139  	spin_unlock_bh(&ax25_dev_lo=
ck);
^1da177e4c3f41 Linus Torvalds 2005-04-16  140  	dev->ax25_ptr =3D NULL;
7133514cbe444a Duoming Zhou   2022-01-28  141  	ax25_dev_put(ax25_dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  142  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7462061353035184856==--

