Content-Type: multipart/mixed; boundary="===============7231264616915069008=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sched/act_api.c:875:15: warning: Uninitialized variable: id_ptr->id [uninitvar]
Date: Sun, 17 Apr 2022 03:53:31 +0800
Message-ID: <202204170317.JecwK3dT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7231264616915069008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Baowen Zheng <baowen.zheng@corigine.com>
CC: Louis Peens <louis.peens@corigine.com>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: 13926d19a11e303f12571df61b7bb64f17cb4561 flow_offload: add reoffloa=
d process to update hw_count
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 13926d19a11e303f12571df61b7bb64f17cb4561
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/sched/act_api.c:1166:60: warning: Parameter 'actions' can be declare=
d with const [constParameter]
   int tcf_action_dump(struct sk_buff *skb, struct tc_action *actions[],
                                                              ^
   net/sched/act_api.c:2005:54: warning: Parameter 'nla' can be declared wi=
th const [constParameter]
   static struct nlattr *find_dump_kind(struct nlattr **nla)
                                                        ^
>> net/sched/act_api.c:875:15: warning: Uninitialized variable: id_ptr->id =
[uninitvar]
     if (id_ptr->id =3D=3D id) {
                 ^
   net/sched/act_api.c:901:15: warning: Uninitialized variable: id_ptr->id =
[uninitvar]
     if (id_ptr->id =3D=3D id) {
                 ^
--
>> net/sched/cls_flower.c:1954:33: warning: Parameter 'fold' can be declare=
d with const [constParameter]
             struct cls_fl_filter *fold,
                                   ^
>> net/sched/cls_flower.c:268:30: warning: Uninitialized variables: filter.=
mask, filter.ht_node, filter.mkey, filter.exts, filter.res, filter.key, fil=
ter.list, filter.hw_list, filter.handle, filter.flags, filter.in_hw_count, =
filter.rwork, filter.hw_dev, filter.refcnt, filter.deleted [uninitvar]
     if (!fl_range_port_dst_cmp(filter, key, mkey))
                                ^
>> net/sched/cls_flower.c:319:35: warning: Uninitialized variables: mask.ke=
y, mask.range, mask.flags, mask.ht_node, mask.ht, mask.filter_ht_params, ma=
sk.dissector, mask.filters, mask.rwork, mask.list, mask.refcnt [uninitvar]
     fl_clear_masked_range(&skb_key, mask);
                                     ^
>> net/sched/cls_flower.c:587:20: warning: Uninitialized variables: f.mask,=
 f.ht_node, f.mkey, f.exts, f.res, f.key, f.list, f.hw_list, f.handle, f.fl=
ags, f.in_hw_count, f.rwork, f.hw_dev, f.refcnt, f.deleted [uninitvar]
      __fl_delete(tp, f, &last, rtnl_held, extack);
                      ^

vim +875 net/sched/act_api.c

13926d19a11e30 Baowen Zheng 2021-12-17  867  =

13926d19a11e30 Baowen Zheng 2021-12-17  868  static int tcf_pernet_add_id_l=
ist(unsigned int id)
13926d19a11e30 Baowen Zheng 2021-12-17  869  {
13926d19a11e30 Baowen Zheng 2021-12-17  870  	struct tc_act_pernet_id *id_p=
tr;
13926d19a11e30 Baowen Zheng 2021-12-17  871  	int ret =3D 0;
13926d19a11e30 Baowen Zheng 2021-12-17  872  =

13926d19a11e30 Baowen Zheng 2021-12-17  873  	mutex_lock(&act_id_mutex);
13926d19a11e30 Baowen Zheng 2021-12-17  874  	list_for_each_entry(id_ptr, &=
act_pernet_id_list, list) {
13926d19a11e30 Baowen Zheng 2021-12-17 @875  		if (id_ptr->id =3D=3D id) {
13926d19a11e30 Baowen Zheng 2021-12-17  876  			ret =3D -EEXIST;
13926d19a11e30 Baowen Zheng 2021-12-17  877  			goto err_out;
13926d19a11e30 Baowen Zheng 2021-12-17  878  		}
13926d19a11e30 Baowen Zheng 2021-12-17  879  	}
13926d19a11e30 Baowen Zheng 2021-12-17  880  =

13926d19a11e30 Baowen Zheng 2021-12-17  881  	id_ptr =3D kzalloc(sizeof(*id=
_ptr), GFP_KERNEL);
13926d19a11e30 Baowen Zheng 2021-12-17  882  	if (!id_ptr) {
13926d19a11e30 Baowen Zheng 2021-12-17  883  		ret =3D -ENOMEM;
13926d19a11e30 Baowen Zheng 2021-12-17  884  		goto err_out;
13926d19a11e30 Baowen Zheng 2021-12-17  885  	}
13926d19a11e30 Baowen Zheng 2021-12-17  886  	id_ptr->id =3D id;
13926d19a11e30 Baowen Zheng 2021-12-17  887  =

13926d19a11e30 Baowen Zheng 2021-12-17  888  	list_add_tail(&id_ptr->list, =
&act_pernet_id_list);
13926d19a11e30 Baowen Zheng 2021-12-17  889  =

13926d19a11e30 Baowen Zheng 2021-12-17  890  err_out:
13926d19a11e30 Baowen Zheng 2021-12-17  891  	mutex_unlock(&act_id_mutex);
13926d19a11e30 Baowen Zheng 2021-12-17  892  	return ret;
13926d19a11e30 Baowen Zheng 2021-12-17  893  }
13926d19a11e30 Baowen Zheng 2021-12-17  894  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7231264616915069008==--

