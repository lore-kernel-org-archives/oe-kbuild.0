Content-Type: multipart/mixed; boundary="===============1456850422133695693=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [congwang:qdisc_reset 4/4] net/sched/sch_atm.c:101:28: sparse: sparse: not enough arguments for function qdisc_reset
Date: Thu, 09 Apr 2020 13:18:25 +0800
Message-ID: <202004091315.ikvwLbu9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1456850422133695693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Cong Wang <xiyou.wangcong@gmail.com>

tree:   https://github.com/congwang/linux.git qdisc_reset
head:   38863d24700b866973c7513e981971a261bd3d3c
commit: 38863d24700b866973c7513e981971a261bd3d3c [4/4] net_sched: avoid unn=
ecessary resetting in qdisc_destroy()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-188-g79f7ac98-dirty
        git checkout 38863d24700b866973c7513e981971a261bd3d3c
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/sched/sch_atm.c:101:28: sparse: sparse: not enough arguments for fun=
ction qdisc_reset
--
   net/sched/sch_generic.c:189:50: sparse: sparse: context imbalance in 'tr=
y_bulk_dequeue_skb_slow' - different lock contexts for basic block
   net/sched/sch_generic.c:248:17: sparse: sparse: context imbalance in 'de=
queue_skb' - different lock contexts for basic block
   net/sched/sch_generic.c:294:28: sparse: sparse: context imbalance in 'sc=
h_direct_xmit' - unexpected unlock
>> net/sched/sch_generic.c:1126:9: sparse: sparse: context imbalance in '__=
dev_deactivate_queue' - different lock contexts for basic block

# https://github.com/congwang/linux/commit/38863d24700b866973c7513e981971a2=
61bd3d3c
git remote add congwang https://github.com/congwang/linux.git
git remote update congwang
git checkout 38863d24700b866973c7513e981971a261bd3d3c
vim +101 net/sched/sch_atm.c

^1da177e4c3f415 Linus Torvalds    2005-04-16   84  =

^1da177e4c3f415 Linus Torvalds    2005-04-16   85  static int atm_tc_graft(=
struct Qdisc *sch, unsigned long arg,
653d6fd68d8e5b4 Alexander Aring   2017-12-20   86  			struct Qdisc *new, st=
ruct Qdisc **old,
653d6fd68d8e5b4 Alexander Aring   2017-12-20   87  			struct netlink_ext_ac=
k *extack)
^1da177e4c3f415 Linus Torvalds    2005-04-16   88  {
786a90366f7571b Stephen Hemminger 2008-01-21   89  	struct atm_qdisc_data *=
p =3D qdisc_priv(sch);
^1da177e4c3f415 Linus Torvalds    2005-04-16   90  	struct atm_flow_data *f=
low =3D (struct atm_flow_data *)arg;
^1da177e4c3f415 Linus Torvalds    2005-04-16   91  =

786a90366f7571b Stephen Hemminger 2008-01-21   92  	pr_debug("atm_tc_graft(=
sch %p,[qdisc %p],flow %p,new %p,old %p)\n",
b0188d4dbe5f428 Patrick McHardy   2007-07-15   93  		sch, p, flow, new, old=
);
6accec76f6889f8 David S. Miller   2010-07-18   94  	if (list_empty(&flow->l=
ist))
b0188d4dbe5f428 Patrick McHardy   2007-07-15   95  		return -EINVAL;
b0188d4dbe5f428 Patrick McHardy   2007-07-15   96  	if (!new)
b0188d4dbe5f428 Patrick McHardy   2007-07-15   97  		new =3D &noop_qdisc;
b94c8afcba3ae65 Patrick McHardy   2008-11-20   98  	*old =3D flow->q;
b94c8afcba3ae65 Patrick McHardy   2008-11-20   99  	flow->q =3D new;
b0188d4dbe5f428 Patrick McHardy   2007-07-15  100  	if (*old)
b0188d4dbe5f428 Patrick McHardy   2007-07-15 @101  		qdisc_reset(*old);
^1da177e4c3f415 Linus Torvalds    2005-04-16  102  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  103  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  104  =


:::::: The code at line 101 was first introduced by commit
:::::: b0188d4dbe5f4285372dd033acf7c92a97006629 [NET_SCHED]: sch_atm: Linde=
nt

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1456850422133695693==--

