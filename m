Content-Type: multipart/mixed; boundary="===============8640002355994913527=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [RFC PATCH 05/11] net: Infrastructure for per queue aRFS
Date: Sun, 28 Jun 2020 16:56:21 +0800
Message-ID: <6d86e991-fb4b-a443-35ba-e6aff748a4aa@intel.com>
In-Reply-To: <202006250519.6SBBbpsR%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8640002355994913527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

reported

On 6/25/20 5:50 AM, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> In-Reply-To: <20200624171749.11927-6-tom@herbertland.com>
> References: <20200624171749.11927-6-tom@herbertland.com>
> TO: Tom Herbert <tom@herbertland.com>
>
> Hi Tom,
>
> [FYI, it's a private test report for your RFC patch.]
> [auto build test WARNING on net/master]
> [also build test WARNING on ipvs/master net-next/master linus/master v5.8=
-rc2 next-20200624]
> [cannot apply to cgroup/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Tom-Herbert/ptq-Per-Thre=
ad-Queues/20200625-012135
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 027=
5875530f692c725c6f993aced2eca2d6ac50c
> :::::: branch date: 4 hours ago
> :::::: commit date: 4 hours ago
> config: s390-randconfig-s031-20200624 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>          # apt-get install sparse
>          # sparse version: v0.6.2-dirty
>          # save the attached .config to linux build tree
>          make W=3D1 C=3D1 ARCH=3Ds390 CF=3D'-fdiagnostic-prefix -D__CHECK=
_ENDIAN__'
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned int [usertype] val @@     g=
ot restricted __wsum @@
>     net/core/dev.c:3264:23: sparse:     expected unsigned int [usertype] =
val
>     net/core/dev.c:3264:23: sparse:     got restricted __wsum
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>     net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __wsum [usertype] csum @@=
     got unsigned int @@
>     net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usert=
ype] csum
>     net/core/dev.c:3264:23: sparse:     got unsigned int
>     net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>>> net/core/dev.c:4451:27: sparse: sparse: cast to non-scalar
>>> net/core/dev.c:4451:27: sparse: sparse: cast from non-scalar
>     net/core/dev.c:5614:1: sparse: sparse: symbol '__pcpu_scope_flush_wor=
ks' was not declared. Should it be static?
>     net/core/dev.c:3747:26: sparse: sparse: context imbalance in '__dev_q=
ueue_xmit' - different lock contexts for basic block
>     net/core/dev.c:4922:44: sparse: sparse: context imbalance in 'net_tx_=
action' - unexpected unlock
>
> # https://github.com/0day-ci/linux/commit/8cf630e2a48d7b6e18be2f46f90cebf=
8ec5d506c
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 8cf630e2a48d7b6e18be2f46f90cebf8ec5d506c
> vim +4451 net/core/dev.c
>
> c445477d74ab37 Ben Hutchings 2011-01-19  4426
> c445477d74ab37 Ben Hutchings 2011-01-19  4427  /**
> c445477d74ab37 Ben Hutchings 2011-01-19  4428   * rps_may_expire_flow - c=
heck whether an RFS hardware filter may be removed
> c445477d74ab37 Ben Hutchings 2011-01-19  4429   * @dev: Device on which t=
he filter was set
> c445477d74ab37 Ben Hutchings 2011-01-19  4430   * @rxq_index: RX queue in=
dex
> c445477d74ab37 Ben Hutchings 2011-01-19  4431   * @flow_id: Flow ID passe=
d to ndo_rx_flow_steer()
> c445477d74ab37 Ben Hutchings 2011-01-19  4432   * @filter_id: Filter ID r=
eturned by ndo_rx_flow_steer()
> c445477d74ab37 Ben Hutchings 2011-01-19  4433   *
> c445477d74ab37 Ben Hutchings 2011-01-19  4434   * Drivers that implement =
ndo_rx_flow_steer() should periodically call
> c445477d74ab37 Ben Hutchings 2011-01-19  4435   * this function for each =
installed filter and remove the filters for
> c445477d74ab37 Ben Hutchings 2011-01-19  4436   * which it returns %true.
> c445477d74ab37 Ben Hutchings 2011-01-19  4437   */
> c445477d74ab37 Ben Hutchings 2011-01-19  4438  bool rps_may_expire_flow(s=
truct net_device *dev, u16 rxq_index,
> c445477d74ab37 Ben Hutchings 2011-01-19  4439  			 u32 flow_id, u16 filte=
r_id)
> c445477d74ab37 Ben Hutchings 2011-01-19  4440  {
> c445477d74ab37 Ben Hutchings 2011-01-19  4441  	struct netdev_rx_queue *r=
xqueue =3D dev->_rx + rxq_index;
> c445477d74ab37 Ben Hutchings 2011-01-19  4442  	struct rps_dev_flow_table=
 *flow_table;
> 8cf630e2a48d7b Tom Herbert   2020-06-24  4443  	struct rps_cpu_qid cpu_qi=
d;
> c445477d74ab37 Ben Hutchings 2011-01-19  4444  	struct rps_dev_flow *rflo=
w;
> c445477d74ab37 Ben Hutchings 2011-01-19  4445  	bool expire =3D true;
> c445477d74ab37 Ben Hutchings 2011-01-19  4446
> c445477d74ab37 Ben Hutchings 2011-01-19  4447  	rcu_read_lock();
> c445477d74ab37 Ben Hutchings 2011-01-19  4448  	flow_table =3D rcu_derefe=
rence(rxqueue->rps_flow_table);
> c445477d74ab37 Ben Hutchings 2011-01-19  4449  	if (flow_table && flow_id=
 <=3D flow_table->mask) {
> c445477d74ab37 Ben Hutchings 2011-01-19  4450  		rflow =3D &flow_table->f=
lows[flow_id];
> 8cf630e2a48d7b Tom Herbert   2020-06-24 @4451  		cpu_qid =3D READ_ONCE(rf=
low->cpu_qid);
> 8cf630e2a48d7b Tom Herbert   2020-06-24  4452  		if (rflow->filter =3D=3D=
 filter_id && !cpu_qid.use_qid &&
> 8cf630e2a48d7b Tom Herbert   2020-06-24  4453  		    cpu_qid.cpu < nr_cpu=
_ids &&
> 8cf630e2a48d7b Tom Herbert   2020-06-24  4454  		    ((int)(per_cpu(softn=
et_data, cpu_qid.cpu).input_queue_head -
> c445477d74ab37 Ben Hutchings 2011-01-19  4455  			   rflow->last_qtail) <
> c445477d74ab37 Ben Hutchings 2011-01-19  4456  		     (int)(10 * flow_tab=
le->mask)))
> c445477d74ab37 Ben Hutchings 2011-01-19  4457  			expire =3D false;
> c445477d74ab37 Ben Hutchings 2011-01-19  4458  	}
> c445477d74ab37 Ben Hutchings 2011-01-19  4459  	rcu_read_unlock();
> c445477d74ab37 Ben Hutchings 2011-01-19  4460  	return expire;
> c445477d74ab37 Ben Hutchings 2011-01-19  4461  }
> c445477d74ab37 Ben Hutchings 2011-01-19  4462  EXPORT_SYMBOL(rps_may_expi=
re_flow);
> c445477d74ab37 Ben Hutchings 2011-01-19  4463
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============8640002355994913527==--

