Content-Type: multipart/mixed; boundary="===============9189598654284522659=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sched/act_api.c:875:15: warning: Uninitialized variable: id_ptr->id [uninitvar]
Date: Thu, 21 Apr 2022 14:40:54 +0800
Message-ID: <202204202313.OEXXHsTC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9189598654284522659==
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
head:   559089e0a93d44280ec3ab478830af319c56dbe3
commit: 13926d19a11e303f12571df61b7bb64f17cb4561 flow_offload: add reoffloa=
d process to update hw_count
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 13926d19a11e303f12571df61b7bb64f17cb4561
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/x25/af_x25.c:308:75: warning: Parameter 'nb' can be declared with co=
nst [constParameter]
   static struct sock *__x25_find_socket(unsigned int lci, struct x25_neigh=
 *nb)
                                                                           =
  ^
>> net/x25/af_x25.c:1628:5: warning: Redundant initialization for 'rc'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    rc =3D -EFAULT;
       ^
   net/x25/af_x25.c:1626:9: note: rc is initialized
    int rc =3D -EINVAL;
           ^
   net/x25/af_x25.c:1628:5: note: rc is overwritten
    rc =3D -EFAULT;
       ^
--
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
--===============9189598654284522659==--

