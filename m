Content-Type: multipart/mixed; boundary="===============3313252081591900803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 net-next 10/12] flow_offload: add reoffload process to update hw_count
Date: Sat, 04 Dec 2021 14:57:04 +0800
Message-ID: <202112041452.e8URxHJp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3313252081591900803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203122444.11756-11-simon.horman@corigine.com>
References: <20211203122444.11756-11-simon.horman@corigine.com>
TO: Simon Horman <simon.horman@corigine.com>
TO: netdev(a)vger.kernel.org
CC: Cong Wang <xiyou.wangcong@gmail.com>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Jamal Hadi Salim <jhs@mojatatu.com>
CC: Jiri Pirko <jiri@resnulli.us>
CC: Oz Shlomo <ozsh@nvidia.com>
CC: Roi Dayan <roid@nvidia.com>
CC: Vlad Buslov <vladbu@nvidia.com>
CC: Baowen Zheng <baowen.zheng@corigine.com>
CC: Louis Peens <louis.peens@corigine.com>

Hi Simon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Simon-Horman/allow-user-to=
-offload-tc-action-to-net-device/20211203-202602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
43332cf97425a3e5508c827c82201ecc5ddd54e0
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-c002-20211203 (https://download.01.org/0day-ci/archi=
ve/20211204/202112041452.e8URxHJp-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/d99abedd4989e77746fd53394=
4253094f5e8965b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Simon-Horman/allow-user-to-offload=
-tc-action-to-net-device/20211203-202602
        git checkout d99abedd4989e77746fd533944253094f5e8965b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   net/core/dev.c:3122:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3122:4: note: Value stored to 'name' is never read
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3124:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:3124:4: note: Value stored to 'name' is never read
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:7145:19: warning: Access to field 'lower_level' results i=
n a dereference of a null pointer (loaded from variable 'dev') [clang-analy=
zer-core.NullDereference]
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
                            ^
   net/core/dev.c:7604:33: note: Passing value via 2nd parameter 'upper_dev'
           __netdev_upper_dev_unlink(dev, upper_dev, &priv);
                                          ^~~~~~~~~
   net/core/dev.c:7604:2: note: Calling '__netdev_upper_dev_unlink'
           __netdev_upper_dev_unlink(dev, upper_dev, &priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7568:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:180:46: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                                ^~~~~~~~~
   include/asm-generic/bug.h:173:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/core/dev.c:7568:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ^
   include/asm-generic/bug.h:174:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/core/dev.c:7570:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:7583:30: note: Passing null pointer value via 1st paramet=
er 'dev'
           __netdev_update_lower_level(upper_dev, priv);
                                       ^~~~~~~~~
   net/core/dev.c:7583:2: note: Calling '__netdev_update_lower_level'
           __netdev_update_lower_level(upper_dev, priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7145:19: note: Access to field 'lower_level' results in a=
 dereference of a null pointer (loaded from variable 'dev')
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
           ~~~              ^
   net/core/dev.c:10213:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dev->name, name);
           ^~~~~~
   net/core/dev.c:10213:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(dev->name, name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/sched/act_api.c:946:25: warning: Dereference of null pointer (loaded=
 from field 'id') [clang-analyzer-core.NullDereference]
           tcf_pernet_del_id_list(*ops->id);
                                  ^     ~~
   net/sched/act_api.c:915:6: note: Assuming field 'act' is non-null
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
               ^~~~~~~~~
   net/sched/act_api.c:915:6: note: Left side of '||' is false
   net/sched/act_api.c:915:19: note: Assuming field 'dump' is non-null
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
                            ^~~~~~~~~~
   net/sched/act_api.c:915:6: note: Left side of '||' is false
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
               ^
   net/sched/act_api.c:915:33: note: Assuming field 'init' is non-null
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
                                          ^~~~~~~~~~
   net/sched/act_api.c:915:6: note: Left side of '||' is false
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
               ^
   net/sched/act_api.c:915:47: note: Assuming field 'walk' is non-null
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
                                                        ^~~~~~~~~~
   net/sched/act_api.c:915:6: note: Left side of '||' is false
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
               ^
   net/sched/act_api.c:915:61: note: Assuming field 'lookup' is non-null
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
                                                                      ^~~~~=
~~~~~~~
   net/sched/act_api.c:915:2: note: Taking false branch
           if (!act->act || !act->dump || !act->init || !act->walk || !act-=
>lookup)
           ^
   net/sched/act_api.c:922:8: note: Value assigned to field 'id'
           ret =3D register_pernet_subsys(ops);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_api.c:923:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   net/sched/act_api.c:923:2: note: Taking false branch
           if (ret)
           ^
   net/sched/act_api.c:926:6: note: Assuming field 'id' is null
           if (ops->id) {
               ^~~~~~~
   net/sched/act_api.c:926:2: note: Taking false branch
           if (ops->id) {
           ^
   net/sched/act_api.c:933:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(a, &act_base, head) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/sched/act_api.c:934:7: note: Assuming 'act->id' is equal to 'a->id'
                   if (act->id =3D=3D a->id || (strcmp(act->kind, a->kind) =
=3D=3D 0)) {
                       ^~~~~~~~~~~~~~~~
   net/sched/act_api.c:934:24: note: Left side of '||' is true
                   if (act->id =3D=3D a->id || (strcmp(act->kind, a->kind) =
=3D=3D 0)) {
                                        ^
   net/sched/act_api.c:936:4: note: Control jumps to line 945
                           goto err_out;
                           ^
   net/sched/act_api.c:946:25: note: Dereference of null pointer (loaded fr=
om field 'id')
           tcf_pernet_del_id_list(*ops->id);
                                  ^     ~~
   net/sched/act_api.c:2033:17: warning: Value stored to 't' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tcamsg *t =3D (struct tcamsg *) nlmsg_data(cb->nlh);
                          ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_api.c:2033:17: note: Value stored to 't' during its initia=
lization is never read
           struct tcamsg *t =3D (struct tcamsg *) nlmsg_data(cb->nlh);
                          ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/sched/cls_flower.c:2178:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           __fl_put(f);
           ^        ~
   net/sched/cls_flower.c:2176:8: note: Calling '__fl_delete'
           err =3D __fl_delete(tp, f, &last_on_mask, rtnl_held, extack);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flower.c:545:6: note: Assuming field 'deleted' is false
           if (f->deleted) {
               ^~~~~~~~~~
   net/sched/cls_flower.c:545:2: note: Taking false branch
           if (f->deleted) {
           ^
   net/sched/cls_flower.c:558:2: note: Taking false branch
           if (!tc_skip_hw(f->flags))
           ^
   net/sched/cls_flower.c:561:2: note: Calling '__fl_put'
           __fl_put(f);
           ^~~~~~~~~~~
   net/sched/cls_flower.c:514:6: note: Assuming the condition is false
           if (!refcount_dec_and_test(&f->refcnt))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flower.c:514:2: note: Taking false branch
           if (!refcount_dec_and_test(&f->refcnt))
           ^
   net/sched/cls_flower.c:517:2: note: Taking false branch

vim +/id +946 net/sched/act_api.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  908  =

ddf97ccdd7cb7e WANG Cong        2016-02-22  909  int tcf_register_action(st=
ruct tc_action_ops *act,
ddf97ccdd7cb7e WANG Cong        2016-02-22  910  			struct pernet_operation=
s *ops)
^1da177e4c3f41 Linus Torvalds   2005-04-16  911  {
1f747c26c48bb2 WANG Cong        2013-12-15  912  	struct tc_action_ops *a;
ddf97ccdd7cb7e WANG Cong        2016-02-22  913  	int ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  914  =

ddf97ccdd7cb7e WANG Cong        2016-02-22  915  	if (!act->act || !act->du=
mp || !act->init || !act->walk || !act->lookup)
76c82d7a3d24a4 Jamal Hadi Salim 2013-12-04  916  		return -EINVAL;
76c82d7a3d24a4 Jamal Hadi Salim 2013-12-04  917  =

ab102b80cef28c WANG Cong        2016-10-11  918  	/* We have to register pe=
rnet ops before making the action ops visible,
ab102b80cef28c WANG Cong        2016-10-11  919  	 * otherwise tcf_action_i=
nit_1() could get a partially initialized
ab102b80cef28c WANG Cong        2016-10-11  920  	 * netns.
ab102b80cef28c WANG Cong        2016-10-11  921  	 */
ab102b80cef28c WANG Cong        2016-10-11  922  	ret =3D register_pernet_s=
ubsys(ops);
ab102b80cef28c WANG Cong        2016-10-11  923  	if (ret)
ab102b80cef28c WANG Cong        2016-10-11  924  		return ret;
ab102b80cef28c WANG Cong        2016-10-11  925  =

d99abedd4989e7 Baowen Zheng     2021-12-03  926  	if (ops->id) {
d99abedd4989e7 Baowen Zheng     2021-12-03  927  		ret =3D tcf_pernet_add_i=
d_list(*ops->id);
d99abedd4989e7 Baowen Zheng     2021-12-03  928  		if (ret)
d99abedd4989e7 Baowen Zheng     2021-12-03  929  			goto err_id;
d99abedd4989e7 Baowen Zheng     2021-12-03  930  	}
d99abedd4989e7 Baowen Zheng     2021-12-03  931  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  932  	write_lock(&act_mod_lock);
1f747c26c48bb2 WANG Cong        2013-12-15  933  	list_for_each_entry(a, &a=
ct_base, head) {
eddd2cf195d6fb Eli Cohen        2019-02-10  934  		if (act->id =3D=3D a->id=
 || (strcmp(act->kind, a->kind) =3D=3D 0)) {
d99abedd4989e7 Baowen Zheng     2021-12-03  935  			ret =3D -EEXIST;
d99abedd4989e7 Baowen Zheng     2021-12-03  936  			goto err_out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  937  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  938  	}
1f747c26c48bb2 WANG Cong        2013-12-15  939  	list_add_tail(&act->head,=
 &act_base);
^1da177e4c3f41 Linus Torvalds   2005-04-16  940  	write_unlock(&act_mod_loc=
k);
ddf97ccdd7cb7e WANG Cong        2016-02-22  941  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  942  	return 0;
d99abedd4989e7 Baowen Zheng     2021-12-03  943  =

d99abedd4989e7 Baowen Zheng     2021-12-03  944  err_out:
d99abedd4989e7 Baowen Zheng     2021-12-03  945  	write_unlock(&act_mod_loc=
k);
d99abedd4989e7 Baowen Zheng     2021-12-03 @946  	tcf_pernet_del_id_list(*o=
ps->id);
d99abedd4989e7 Baowen Zheng     2021-12-03  947  err_id:
d99abedd4989e7 Baowen Zheng     2021-12-03  948  	unregister_pernet_subsys(=
ops);
d99abedd4989e7 Baowen Zheng     2021-12-03  949  	return ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  950  }
62e3ba1b558e5f Patrick McHardy  2008-01-22  951  EXPORT_SYMBOL(tcf_register=
_action);
^1da177e4c3f41 Linus Torvalds   2005-04-16  952  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3313252081591900803==--

