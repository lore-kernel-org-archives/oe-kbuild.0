Content-Type: multipart/mixed; boundary="===============0417950099664923579=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 net-next 10/12] flow_offload: add reoffload process to update hw_count
Date: Tue, 07 Dec 2021 09:32:18 +0800
Message-ID: <202112070927.kCpOi5qD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0417950099664923579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20211203 (https://download.01.org/0day-ci/arch=
ive/20211207/202112070927.kCpOi5qD-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/sched/act_api.c:946 tcf_register_action() error: we previously assumed =
'ops->id' could be null (see line 926)

Old smatch warnings:
net/sched/act_api.c:1362 tcf_action_init_1() error: uninitialized symbol 'a=
'.
net/sched/act_api.c:1365 tcf_action_init_1() error: potentially dereferenci=
ng uninitialized 'a'.
net/sched/act_api.c:1367 tcf_action_init_1() error: uninitialized symbol 'a=
'.
net/sched/act_api.c:1611 tcf_action_get_1() error: uninitialized symbol 'a'.

vim +946 net/sched/act_api.c

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

d99abedd4989e7 Baowen Zheng     2021-12-03 @926  	if (ops->id) {
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
--===============0417950099664923579==--

