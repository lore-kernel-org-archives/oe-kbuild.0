Content-Type: multipart/mixed; boundary="===============5671669749478931035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:sch_bpf 4/4] net/sched/sch_api.c:374 ____bpf_skb_tc_classify() error: uninitialized symbol 'tp'.
Date: Fri, 27 May 2022 21:12:24 +0800
Message-ID: <202205272139.ach2sccy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5671669749478931035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>

tree:   https://github.com/congwang/linux.git sch_bpf
head:   d7144f4291a2882e698a6d9d83f7e614d97be9c8
commit: d7144f4291a2882e698a6d9d83f7e614d97be9c8 [4/4] net_sched: introduce=
 helper bpf_skb_tc_classify()
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: microblaze-randconfig-m031-20220524 (https://download.01.org/0day-c=
i/archive/20220527/202205272139.ach2sccy-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/sched/sch_api.c:374 ____bpf_skb_tc_classify() error: uninitialized symb=
ol 'tp'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/tp +374 net/sched/sch_api.c

3a7d0d07a38671 Vlad Buslov 2018-09-24  334  =

d7144f4291a288 Cong Wang   2022-05-21  335  BPF_CALL_3(bpf_skb_tc_classify,=
 struct sk_buff *, skb, int, ifindex, u32, handle)
d7144f4291a288 Cong Wang   2022-05-21  336  {
d7144f4291a288 Cong Wang   2022-05-21  337  	struct net *net =3D dev_net(sk=
b->dev);
d7144f4291a288 Cong Wang   2022-05-21  338  	const struct Qdisc_class_ops *=
cops;
d7144f4291a288 Cong Wang   2022-05-21  339  	struct tcf_result res =3D {};
d7144f4291a288 Cong Wang   2022-05-21  340  	struct tcf_block *block;
d7144f4291a288 Cong Wang   2022-05-21  341  	struct tcf_chain *chain;
d7144f4291a288 Cong Wang   2022-05-21  342  	struct net_device *dev;
d7144f4291a288 Cong Wang   2022-05-21  343  	unsigned long cl =3D 0;
d7144f4291a288 Cong Wang   2022-05-21  344  	struct Qdisc *q;
d7144f4291a288 Cong Wang   2022-05-21  345  	int result;
d7144f4291a288 Cong Wang   2022-05-21  346  =

d7144f4291a288 Cong Wang   2022-05-21  347  	rcu_read_lock();
d7144f4291a288 Cong Wang   2022-05-21  348  	dev =3D dev_get_by_index_rcu(n=
et, ifindex);
d7144f4291a288 Cong Wang   2022-05-21  349  	if (!dev)
d7144f4291a288 Cong Wang   2022-05-21  350  		goto out;
d7144f4291a288 Cong Wang   2022-05-21  351  	q =3D qdisc_lookup_rcu(dev, ha=
ndle);
d7144f4291a288 Cong Wang   2022-05-21  352  	if (!q)
d7144f4291a288 Cong Wang   2022-05-21  353  		goto out;
d7144f4291a288 Cong Wang   2022-05-21  354  =

d7144f4291a288 Cong Wang   2022-05-21  355  	cops =3D q->ops->cl_ops;
d7144f4291a288 Cong Wang   2022-05-21  356  	if (!cops)
d7144f4291a288 Cong Wang   2022-05-21  357  		goto out;
d7144f4291a288 Cong Wang   2022-05-21  358  	if (!cops->tcf_block)
d7144f4291a288 Cong Wang   2022-05-21  359  		goto out;
d7144f4291a288 Cong Wang   2022-05-21  360  	if (TC_H_MIN(handle)) {
d7144f4291a288 Cong Wang   2022-05-21  361  		cl =3D cops->find(q, handle);
d7144f4291a288 Cong Wang   2022-05-21  362  		if (cl =3D=3D 0)
d7144f4291a288 Cong Wang   2022-05-21  363  			goto out;
d7144f4291a288 Cong Wang   2022-05-21  364  	}
d7144f4291a288 Cong Wang   2022-05-21  365  	block =3D cops->tcf_block(q, c=
l, NULL);
d7144f4291a288 Cong Wang   2022-05-21  366  	if (!block)
d7144f4291a288 Cong Wang   2022-05-21  367  		goto out;
d7144f4291a288 Cong Wang   2022-05-21  368  =

d7144f4291a288 Cong Wang   2022-05-21  369  	for (chain =3D tcf_get_next_ch=
ain(block, NULL);
d7144f4291a288 Cong Wang   2022-05-21  370  	     chain;
d7144f4291a288 Cong Wang   2022-05-21  371  	     chain =3D tcf_get_next_ch=
ain(block, chain)) {
d7144f4291a288 Cong Wang   2022-05-21  372  		struct tcf_proto *tp;
d7144f4291a288 Cong Wang   2022-05-21  373  =

d7144f4291a288 Cong Wang   2022-05-21 @374  		result =3D tcf_classify(skb, =
NULL, tp, &res, false);
d7144f4291a288 Cong Wang   2022-05-21  375  		if (result  >=3D 0) {
d7144f4291a288 Cong Wang   2022-05-21  376  #ifdef CONFIG_NET_CLS_ACT
d7144f4291a288 Cong Wang   2022-05-21  377  			switch (result) {
d7144f4291a288 Cong Wang   2022-05-21  378  			case TC_ACT_QUEUED:
d7144f4291a288 Cong Wang   2022-05-21  379  			case TC_ACT_STOLEN:
d7144f4291a288 Cong Wang   2022-05-21  380  			case TC_ACT_TRAP:
d7144f4291a288 Cong Wang   2022-05-21  381  				fallthrough;
d7144f4291a288 Cong Wang   2022-05-21  382  			case TC_ACT_SHOT:
d7144f4291a288 Cong Wang   2022-05-21  383  				rcu_read_unlock();
d7144f4291a288 Cong Wang   2022-05-21  384  				return 0;
d7144f4291a288 Cong Wang   2022-05-21  385  			}
d7144f4291a288 Cong Wang   2022-05-21  386  #endif
d7144f4291a288 Cong Wang   2022-05-21  387  		}
d7144f4291a288 Cong Wang   2022-05-21  388  	}
d7144f4291a288 Cong Wang   2022-05-21  389  out:
d7144f4291a288 Cong Wang   2022-05-21  390  	rcu_read_unlock();
d7144f4291a288 Cong Wang   2022-05-21  391  	return res.class;
d7144f4291a288 Cong Wang   2022-05-21  392  }
d7144f4291a288 Cong Wang   2022-05-21  393  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5671669749478931035==--

