Content-Type: multipart/mixed; boundary="===============2307488497151233660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/sge.c:2566 cxgb4_ethofld_send_flowc() warn: missing error code 'ret'
Date: Wed, 09 Mar 2022 23:27:16 +0800
Message-ID: <202203092354.8QMmp2o7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2307488497151233660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "=C3=8D=C3=B1igo Huguet" <ihuguet@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 52bfcdd87e83d9e69d22da5f26b1512ffc81deed net:CXGB4: fix leak if sk_=
buff is not used
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-m031-20220308 (https://download.01.org/0day-c=
i/archive/20220309/202203092354.8QMmp2o7-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/sge.c:2566 cxgb4_ethofld_send_flowc() wa=
rn: missing error code 'ret'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
drivers/net/ethernet/chelsio/cxgb4/sge.c:4169 process_intrq() warn: potenti=
al spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4484 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4491 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.egr_map' [w]

vim +/ret +2566 drivers/net/ethernet/chelsio/cxgb4/sge.c

69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2524  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2525  /**
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2526   * cxgb4_ethofld_send=
_flowc - Send ETHOFLD flowc request to bind eotid to tc.
29bbf5d7f5efe84 Rahul Lakkireddy    2020-06-24  2527   * @dev: netdevice
29bbf5d7f5efe84 Rahul Lakkireddy    2020-06-24  2528   * @eotid: ETHOFLD ti=
d to bind/unbind
29bbf5d7f5efe84 Rahul Lakkireddy    2020-06-24  2529   * @tc: traffic class=
. If set to FW_SCHED_CLS_NONE, then unbinds the @eotid
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2530   *
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2531   * Send a FLOWC work =
request to bind an ETHOFLD TID to a traffic class.
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2532   * If @tc is set to F=
W_SCHED_CLS_NONE, then the @eotid is unbound from
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2533   * a traffic class.
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2534   */
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2535  int cxgb4_ethofld_sen=
d_flowc(struct net_device *dev, u32 eotid, u32 tc)
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2536  {
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2537  	struct port_info *pi=
 =3D netdev2pinfo(dev);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2538  	struct adapter *adap=
 =3D netdev2adap(dev);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2539  	enum sge_eosw_state =
next_state;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2540  	struct sge_eosw_txq =
*eosw_txq;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2541  	u32 len, len16, npar=
ams =3D 6;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2542  	struct fw_flowc_wr *=
flowc;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2543  	struct eotid_entry *=
entry;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2544  	struct sge_ofld_rxq =
*rxq;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2545  	struct sk_buff *skb;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2546  	int ret =3D 0;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2547  =

a422d5ff6defb1c Gustavo A. R. Silva 2020-06-19  2548  	len =3D struct_size(=
flowc, mnemval, nparams);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2549  	len16 =3D DIV_ROUND_=
UP(len, 16);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2550  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2551  	entry =3D cxgb4_look=
up_eotid(&adap->tids, eotid);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2552  	if (!entry)
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2553  		return -ENOMEM;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2554  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2555  	eosw_txq =3D (struct=
 sge_eosw_txq *)entry->data;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2556  	if (!eosw_txq)
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2557  		return -ENOMEM;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2558  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2559  	skb =3D alloc_skb(le=
n, GFP_KERNEL);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2560  	if (!skb)
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2561  		return -ENOMEM;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2562  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2563  	spin_lock_bh(&eosw_t=
xq->lock);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2564  	if (tc !=3D FW_SCHED=
_CLS_NONE) {
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2565  		if (eosw_txq->state=
 !=3D CXGB4_EO_STATE_CLOSED)
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05 @2566  			goto out=
_free_skb;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2567  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2568  		next_state =3D CXGB=
4_EO_STATE_FLOWC_OPEN_SEND;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2569  	} else {
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2570  		if (eosw_txq->state=
 !=3D CXGB4_EO_STATE_ACTIVE)
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2571  			goto out=
_free_skb;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2572  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2573  		next_state =3D CXGB=
4_EO_STATE_FLOWC_CLOSE_SEND;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2574  	}
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2575  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2576  	flowc =3D __skb_put(=
skb, len);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2577  	memset(flowc, 0, len=
);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2578  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2579  	rxq =3D &adap->sge.e=
ohw_rxq[eosw_txq->hwqid];
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2580  	flowc->flowid_len16 =
=3D cpu_to_be32(FW_WR_LEN16_V(len16) |
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2581  					  FW_WR_FLOWID_V=
(eosw_txq->hwtid));
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2582  	flowc->op_to_nparams=
 =3D cpu_to_be32(FW_WR_OP_V(FW_FLOWC_WR) |
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2583  					   FW_FLOWC_WR_N=
PARAMS_V(nparams) |
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2584  					   FW_WR_COMPL_V=
(1));
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2585  	flowc->mnemval[0].mn=
emonic =3D FW_FLOWC_MNEM_PFNVFN;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2586  	flowc->mnemval[0].va=
l =3D cpu_to_be32(FW_PFVF_CMD_PFN_V(adap->pf));
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2587  	flowc->mnemval[1].mn=
emonic =3D FW_FLOWC_MNEM_CH;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2588  	flowc->mnemval[1].va=
l =3D cpu_to_be32(pi->tx_chan);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2589  	flowc->mnemval[2].mn=
emonic =3D FW_FLOWC_MNEM_PORT;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2590  	flowc->mnemval[2].va=
l =3D cpu_to_be32(pi->tx_chan);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2591  	flowc->mnemval[3].mn=
emonic =3D FW_FLOWC_MNEM_IQID;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2592  	flowc->mnemval[3].va=
l =3D cpu_to_be32(rxq->rspq.abs_id);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2593  	flowc->mnemval[4].mn=
emonic =3D FW_FLOWC_MNEM_SCHEDCLASS;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2594  	flowc->mnemval[4].va=
l =3D cpu_to_be32(tc);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2595  	flowc->mnemval[5].mn=
emonic =3D FW_FLOWC_MNEM_EOSTATE;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2596  	flowc->mnemval[5].va=
l =3D cpu_to_be32(tc =3D=3D FW_SCHED_CLS_NONE ?
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2597  					    FW_FLOWC_MNE=
M_EOSTATE_CLOSING :
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2598  					    FW_FLOWC_MNE=
M_EOSTATE_ESTABLISHED);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2599  =

69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2600  	/* Free up any pendi=
ng skbs to ensure there's room for
69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2601  	 * termination FLOWC.
69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2602  	 */
69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2603  	if (tc =3D=3D FW_SCH=
ED_CLS_NONE)
69422a7e5d578aa Rahul Lakkireddy    2020-04-30  2604  		eosw_txq_flush_pend=
ing_skbs(eosw_txq);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2605  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2606  	ret =3D eosw_txq_enq=
ueue(eosw_txq, skb);
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2607  	if (ret)
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2608  		goto out_=
free_skb;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2609  =

0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2610  	eosw_txq->state =3D =
next_state;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2611  	eosw_txq->flowc_idx =
=3D eosw_txq->pidx;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2612  	eosw_txq_advance(eos=
w_txq, 1);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2613  	ethofld_xmit(dev, eo=
sw_txq);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2614  =

52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2615  	spin_unloc=
k_bh(&eosw_txq->lock);
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2616  	return 0;
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2617  =

52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2618  out_free_sk=
b:
52bfcdd87e83d9e =C3=8D=C3=B1igo Huguet        2021-05-05  2619  	dev_consum=
e_skb_any(skb);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2620  	spin_unlock_bh(&eosw=
_txq->lock);
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2621  	return ret;
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2622  }
0e395b3cb1fb82f Rahul Lakkireddy    2019-11-07  2623  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2307488497151233660==--

