Content-Type: multipart/mixed; boundary="===============8452358790435614009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/sge.c:2566 cxgb4_ethofld_send_flowc() warn: missing error code 'ret'
Date: Fri, 25 Mar 2022 07:20:59 +0800
Message-ID: <202203250702.DyxwnTwp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8452358790435614009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "=C3=8D=C3=B1igo Huguet" <ihuguet@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52deda9551a01879b3562e7b41748e85c591f14c
commit: 52bfcdd87e83d9e69d22da5f26b1512ffc81deed net:CXGB4: fix leak if sk_=
buff is not used
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220325/202203250702.DyxwnTwp-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/sge.c:2566 cxgb4_ethofld_send_flowc() wa=
rn: missing error code 'ret'

Old smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/sge.c:4169 process_intrq() warn: potenti=
al spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4484 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4491 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.egr_map' [w]

vim +/ret +2566 drivers/net/ethernet/chelsio/cxgb4/sge.c

69422a7e5d578a Rahul Lakkireddy    2020-04-30  2524  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2525  /**
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2526   * cxgb4_ethofld_send_=
flowc - Send ETHOFLD flowc request to bind eotid to tc.
29bbf5d7f5efe8 Rahul Lakkireddy    2020-06-24  2527   * @dev: netdevice
29bbf5d7f5efe8 Rahul Lakkireddy    2020-06-24  2528   * @eotid: ETHOFLD tid=
 to bind/unbind
29bbf5d7f5efe8 Rahul Lakkireddy    2020-06-24  2529   * @tc: traffic class.=
 If set to FW_SCHED_CLS_NONE, then unbinds the @eotid
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2530   *
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2531   * Send a FLOWC work r=
equest to bind an ETHOFLD TID to a traffic class.
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2532   * If @tc is set to FW=
_SCHED_CLS_NONE, then the @eotid is unbound from
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2533   * a traffic class.
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2534   */
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2535  int cxgb4_ethofld_send=
_flowc(struct net_device *dev, u32 eotid, u32 tc)
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2536  {
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2537  	struct port_info *pi =
=3D netdev2pinfo(dev);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2538  	struct adapter *adap =
=3D netdev2adap(dev);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2539  	enum sge_eosw_state n=
ext_state;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2540  	struct sge_eosw_txq *=
eosw_txq;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2541  	u32 len, len16, npara=
ms =3D 6;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2542  	struct fw_flowc_wr *f=
lowc;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2543  	struct eotid_entry *e=
ntry;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2544  	struct sge_ofld_rxq *=
rxq;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2545  	struct sk_buff *skb;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2546  	int ret =3D 0;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2547  =

a422d5ff6defb1 Gustavo A. R. Silva 2020-06-19  2548  	len =3D struct_size(f=
lowc, mnemval, nparams);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2549  	len16 =3D DIV_ROUND_U=
P(len, 16);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2550  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2551  	entry =3D cxgb4_looku=
p_eotid(&adap->tids, eotid);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2552  	if (!entry)
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2553  		return -ENOMEM;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2554  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2555  	eosw_txq =3D (struct =
sge_eosw_txq *)entry->data;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2556  	if (!eosw_txq)
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2557  		return -ENOMEM;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2558  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2559  	skb =3D alloc_skb(len=
, GFP_KERNEL);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2560  	if (!skb)
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2561  		return -ENOMEM;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2562  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2563  	spin_lock_bh(&eosw_tx=
q->lock);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2564  	if (tc !=3D FW_SCHED_=
CLS_NONE) {
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2565  		if (eosw_txq->state =
!=3D CXGB4_EO_STATE_CLOSED)
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05 @2566  			goto out_=
free_skb;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2567  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2568  		next_state =3D CXGB4=
_EO_STATE_FLOWC_OPEN_SEND;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2569  	} else {
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2570  		if (eosw_txq->state =
!=3D CXGB4_EO_STATE_ACTIVE)
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2571  			goto out_=
free_skb;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2572  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2573  		next_state =3D CXGB4=
_EO_STATE_FLOWC_CLOSE_SEND;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2574  	}
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2575  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2576  	flowc =3D __skb_put(s=
kb, len);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2577  	memset(flowc, 0, len);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2578  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2579  	rxq =3D &adap->sge.eo=
hw_rxq[eosw_txq->hwqid];
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2580  	flowc->flowid_len16 =
=3D cpu_to_be32(FW_WR_LEN16_V(len16) |
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2581  					  FW_WR_FLOWID_V(=
eosw_txq->hwtid));
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2582  	flowc->op_to_nparams =
=3D cpu_to_be32(FW_WR_OP_V(FW_FLOWC_WR) |
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2583  					   FW_FLOWC_WR_NP=
ARAMS_V(nparams) |
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2584  					   FW_WR_COMPL_V(=
1));
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2585  	flowc->mnemval[0].mne=
monic =3D FW_FLOWC_MNEM_PFNVFN;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2586  	flowc->mnemval[0].val=
 =3D cpu_to_be32(FW_PFVF_CMD_PFN_V(adap->pf));
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2587  	flowc->mnemval[1].mne=
monic =3D FW_FLOWC_MNEM_CH;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2588  	flowc->mnemval[1].val=
 =3D cpu_to_be32(pi->tx_chan);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2589  	flowc->mnemval[2].mne=
monic =3D FW_FLOWC_MNEM_PORT;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2590  	flowc->mnemval[2].val=
 =3D cpu_to_be32(pi->tx_chan);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2591  	flowc->mnemval[3].mne=
monic =3D FW_FLOWC_MNEM_IQID;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2592  	flowc->mnemval[3].val=
 =3D cpu_to_be32(rxq->rspq.abs_id);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2593  	flowc->mnemval[4].mne=
monic =3D FW_FLOWC_MNEM_SCHEDCLASS;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2594  	flowc->mnemval[4].val=
 =3D cpu_to_be32(tc);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2595  	flowc->mnemval[5].mne=
monic =3D FW_FLOWC_MNEM_EOSTATE;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2596  	flowc->mnemval[5].val=
 =3D cpu_to_be32(tc =3D=3D FW_SCHED_CLS_NONE ?
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2597  					    FW_FLOWC_MNEM=
_EOSTATE_CLOSING :
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2598  					    FW_FLOWC_MNEM=
_EOSTATE_ESTABLISHED);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2599  =

69422a7e5d578a Rahul Lakkireddy    2020-04-30  2600  	/* Free up any pendin=
g skbs to ensure there's room for
69422a7e5d578a Rahul Lakkireddy    2020-04-30  2601  	 * termination FLOWC.
69422a7e5d578a Rahul Lakkireddy    2020-04-30  2602  	 */
69422a7e5d578a Rahul Lakkireddy    2020-04-30  2603  	if (tc =3D=3D FW_SCHE=
D_CLS_NONE)
69422a7e5d578a Rahul Lakkireddy    2020-04-30  2604  		eosw_txq_flush_pendi=
ng_skbs(eosw_txq);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2605  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2606  	ret =3D eosw_txq_enqu=
eue(eosw_txq, skb);
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2607  	if (ret)
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2608  		goto out_f=
ree_skb;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2609  =

0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2610  	eosw_txq->state =3D n=
ext_state;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2611  	eosw_txq->flowc_idx =
=3D eosw_txq->pidx;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2612  	eosw_txq_advance(eosw=
_txq, 1);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2613  	ethofld_xmit(dev, eos=
w_txq);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2614  =

52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2615  	spin_unlock=
_bh(&eosw_txq->lock);
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2616  	return 0;
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2617  =

52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2618  out_free_skb:
52bfcdd87e83d9 =C3=8D=C3=B1igo Huguet        2021-05-05  2619  	dev_consume=
_skb_any(skb);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2620  	spin_unlock_bh(&eosw_=
txq->lock);
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2621  	return ret;
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2622  }
0e395b3cb1fb82 Rahul Lakkireddy    2019-11-07  2623  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8452358790435614009==--

