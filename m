Content-Type: multipart/mixed; boundary="===============7745300304185345485=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v4 2/3] net: atlantic: Implement xdp data plane
Date: Tue, 19 Apr 2022 21:12:02 +0800
Message-ID: <202204192150.Gnb9kD2I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7745300304185345485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408181714.15354-3-ap420073@gmail.com>
References: <20220408181714.15354-3-ap420073@gmail.com>
TO: Taehee Yoo <ap420073@gmail.com>
TO: davem(a)davemloft.net
TO: kuba(a)kernel.org
TO: pabeni(a)redhat.com
TO: netdev(a)vger.kernel.org
TO: irusskikh(a)marvell.com
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: hawk(a)kernel.org
TO: john.fastabend(a)gmail.com
TO: andrii(a)kernel.org
TO: kafai(a)fb.com
TO: songliubraving(a)fb.com
TO: yhs(a)fb.com
TO: kpsingh(a)kernel.org
TO: bpf(a)vger.kernel.org
CC: ap420073(a)gmail.com

Hi Taehee,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/net-atlan=
tic-Add-XDP-support/20220409-024326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
e8bd70250a821edb541c3abe1eacdad9f8dc7adf
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: ia64-randconfig-m031-20220418 (https://download.01.org/0day-ci/arch=
ive/20220419/202204192150.Gnb9kD2I-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/aquantia/atlantic/aq_ring.c:485 aq_xdp_run_prog() erro=
r: (-2147483647) too low for ERR_PTR

vim +485 drivers/net/ethernet/aquantia/atlantic/aq_ring.c

ad703c2b9127f9a Dmitry Bogdanov 2018-11-09  403  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  404  static struct sk_buff *aq_=
xdp_run_prog(struct aq_nic_s *aq_nic,
cf4452ec03cfd3d Taehee Yoo      2022-04-08  405  				       struct xdp_buff=
 *xdp,
cf4452ec03cfd3d Taehee Yoo      2022-04-08  406  				       struct aq_ring_=
s *rx_ring,
cf4452ec03cfd3d Taehee Yoo      2022-04-08  407  				       struct aq_ring_=
buff_s *buff)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  408  {
cf4452ec03cfd3d Taehee Yoo      2022-04-08  409  	int result =3D NETDEV_TX_=
BUSY;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  410  	struct aq_ring_s *tx_ring;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  411  	struct xdp_frame *xdpf;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  412  	struct bpf_prog *prog;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  413  	u32 act =3D XDP_ABORTED;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  414  	struct sk_buff *skb;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  415  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  416  	u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  417  	++rx_ring->stats.rx.packe=
ts;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  418  	rx_ring->stats.rx.bytes +=
=3D xdp_get_buff_len(xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  419  	u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  420  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  421  	prog =3D READ_ONCE(rx_rin=
g->xdp_prog);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  422  	if (!prog)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  423  		goto pass;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  424  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  425  	prefetchw(xdp->data_hard_=
start); /* xdp_frame write */
cf4452ec03cfd3d Taehee Yoo      2022-04-08  426  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  427  	/* single buffer XDP prog=
ram, but packet is multi buffer, aborted */
cf4452ec03cfd3d Taehee Yoo      2022-04-08  428  	if (xdp_buff_has_frags(xd=
p) && !prog->aux->xdp_has_frags)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  429  		goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  430  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08  431  	act =3D bpf_prog_run_xdp(=
prog, xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  432  	switch (act) {
cf4452ec03cfd3d Taehee Yoo      2022-04-08  433  	case XDP_PASS:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  434  pass:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  435  		xdpf =3D xdp_convert_buf=
f_to_frame(xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  436  		if (unlikely(!xdpf))
cf4452ec03cfd3d Taehee Yoo      2022-04-08  437  			goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  438  		skb =3D xdp_build_skb_fr=
om_frame(xdpf, aq_nic->ndev);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  439  		if (!skb)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  440  			goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  441  		u64_stats_update_begin(&=
rx_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  442  		++rx_ring->stats.rx.xdp_=
pass;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  443  		u64_stats_update_end(&rx=
_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  444  		aq_unset_rxpage_xdp(rx_r=
ing, buff, &aq_nic->ndev->dev, xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  445  		return skb;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  446  	case XDP_TX:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  447  		xdpf =3D xdp_convert_buf=
f_to_frame(xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  448  		if (unlikely(!xdpf))
cf4452ec03cfd3d Taehee Yoo      2022-04-08  449  			goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  450  		tx_ring =3D aq_nic->aq_r=
ing_tx[rx_ring->idx];
cf4452ec03cfd3d Taehee Yoo      2022-04-08  451  		result =3D aq_nic_xmit_x=
dpf(aq_nic, tx_ring, xdpf);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  452  		if (result =3D=3D NETDEV=
_TX_BUSY)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  453  			goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  454  		u64_stats_update_begin(&=
rx_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  455  		++rx_ring->stats.rx.xdp_=
tx;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  456  		u64_stats_update_end(&rx=
_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  457  		aq_unset_rxpage_xdp(rx_r=
ing, buff, &aq_nic->ndev->dev, xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  458  		break;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  459  	case XDP_REDIRECT:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  460  		if (xdp_do_redirect(aq_n=
ic->ndev, xdp, prog) < 0)
cf4452ec03cfd3d Taehee Yoo      2022-04-08  461  			goto out_aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  462  		xdp_do_flush();
cf4452ec03cfd3d Taehee Yoo      2022-04-08  463  		u64_stats_update_begin(&=
rx_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  464  		++rx_ring->stats.rx.xdp_=
redirect;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  465  		u64_stats_update_end(&rx=
_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  466  		aq_unset_rxpage_xdp(rx_r=
ing, buff, &aq_nic->ndev->dev, xdp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  467  		break;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  468  	default:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  469  		fallthrough;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  470  	case XDP_ABORTED:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  471  out_aborted:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  472  		u64_stats_update_begin(&=
rx_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  473  		++rx_ring->stats.rx.xdp_=
aborted;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  474  		u64_stats_update_end(&rx=
_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  475  		trace_xdp_exception(aq_n=
ic->ndev, prog, act);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  476  		bpf_warn_invalid_xdp_act=
ion(aq_nic->ndev, prog, act);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  477  		break;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  478  	case XDP_DROP:
cf4452ec03cfd3d Taehee Yoo      2022-04-08  479  		u64_stats_update_begin(&=
rx_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  480  		++rx_ring->stats.rx.xdp_=
drop;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  481  		u64_stats_update_end(&rx=
_ring->stats.rx.syncp);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  482  		break;
cf4452ec03cfd3d Taehee Yoo      2022-04-08  483  	}
cf4452ec03cfd3d Taehee Yoo      2022-04-08  484  =

cf4452ec03cfd3d Taehee Yoo      2022-04-08 @485  	return ERR_PTR(-result);
cf4452ec03cfd3d Taehee Yoo      2022-04-08  486  }
cf4452ec03cfd3d Taehee Yoo      2022-04-08  487  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7745300304185345485==--

