Content-Type: multipart/mixed; boundary="===============6337640327118240486=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4133/9759] drivers/net/ethernet/aquantia/atlantic/aq_ring.c:473 aq_xdp_run_prog() error: (-2147483647) too low for ERR_PTR
Date: Mon, 09 May 2022 09:36:29 +0800
Message-ID: <202205090901.gHKTToGt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6337640327118240486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Taehee Yoo <ap420073@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 26efaef759a1bc43e819ee44cfd8a1fc4514e8c9 [4133/9759] net: atlantic:=
 Implement xdp data plane
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: ia64-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205090901.gHKTToGt-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/aquantia/atlantic/aq_ring.c:473 aq_xdp_run_prog() erro=
r: (-2147483647) too low for ERR_PTR

vim +473 drivers/net/ethernet/aquantia/atlantic/aq_ring.c

ad703c2b9127f9 Dmitry Bogdanov 2018-11-09  391  =

26efaef759a1bc Taehee Yoo      2022-04-17  392  static struct sk_buff *aq_x=
dp_run_prog(struct aq_nic_s *aq_nic,
26efaef759a1bc Taehee Yoo      2022-04-17  393  				       struct xdp_buff =
*xdp,
26efaef759a1bc Taehee Yoo      2022-04-17  394  				       struct aq_ring_s=
 *rx_ring,
26efaef759a1bc Taehee Yoo      2022-04-17  395  				       struct aq_ring_b=
uff_s *buff)
26efaef759a1bc Taehee Yoo      2022-04-17  396  {
26efaef759a1bc Taehee Yoo      2022-04-17  397  	int result =3D NETDEV_TX_B=
USY;
26efaef759a1bc Taehee Yoo      2022-04-17  398  	struct aq_ring_s *tx_ring;
26efaef759a1bc Taehee Yoo      2022-04-17  399  	struct xdp_frame *xdpf;
26efaef759a1bc Taehee Yoo      2022-04-17  400  	struct bpf_prog *prog;
26efaef759a1bc Taehee Yoo      2022-04-17  401  	u32 act =3D XDP_ABORTED;
26efaef759a1bc Taehee Yoo      2022-04-17  402  	struct sk_buff *skb;
26efaef759a1bc Taehee Yoo      2022-04-17  403  =

26efaef759a1bc Taehee Yoo      2022-04-17  404  	u64_stats_update_begin(&rx=
_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  405  	++rx_ring->stats.rx.packet=
s;
26efaef759a1bc Taehee Yoo      2022-04-17  406  	rx_ring->stats.rx.bytes +=
=3D xdp_get_buff_len(xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  407  	u64_stats_update_end(&rx_r=
ing->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  408  =

26efaef759a1bc Taehee Yoo      2022-04-17  409  	prog =3D READ_ONCE(rx_ring=
->xdp_prog);
26efaef759a1bc Taehee Yoo      2022-04-17  410  	if (!prog)
26efaef759a1bc Taehee Yoo      2022-04-17  411  		goto pass;
26efaef759a1bc Taehee Yoo      2022-04-17  412  =

26efaef759a1bc Taehee Yoo      2022-04-17  413  	prefetchw(xdp->data_hard_s=
tart); /* xdp_frame write */
26efaef759a1bc Taehee Yoo      2022-04-17  414  =

26efaef759a1bc Taehee Yoo      2022-04-17  415  	/* single buffer XDP progr=
am, but packet is multi buffer, aborted */
26efaef759a1bc Taehee Yoo      2022-04-17  416  	if (xdp_buff_has_frags(xdp=
) && !prog->aux->xdp_has_frags)
26efaef759a1bc Taehee Yoo      2022-04-17  417  		goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  418  =

26efaef759a1bc Taehee Yoo      2022-04-17  419  	act =3D bpf_prog_run_xdp(p=
rog, xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  420  	switch (act) {
26efaef759a1bc Taehee Yoo      2022-04-17  421  	case XDP_PASS:
26efaef759a1bc Taehee Yoo      2022-04-17  422  pass:
26efaef759a1bc Taehee Yoo      2022-04-17  423  		xdpf =3D xdp_convert_buff=
_to_frame(xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  424  		if (unlikely(!xdpf))
26efaef759a1bc Taehee Yoo      2022-04-17  425  			goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  426  		skb =3D xdp_build_skb_fro=
m_frame(xdpf, aq_nic->ndev);
26efaef759a1bc Taehee Yoo      2022-04-17  427  		if (!skb)
26efaef759a1bc Taehee Yoo      2022-04-17  428  			goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  429  		u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  430  		++rx_ring->stats.rx.xdp_p=
ass;
26efaef759a1bc Taehee Yoo      2022-04-17  431  		u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  432  		aq_get_rxpages_xdp(buff, =
xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  433  		return skb;
26efaef759a1bc Taehee Yoo      2022-04-17  434  	case XDP_TX:
26efaef759a1bc Taehee Yoo      2022-04-17  435  		xdpf =3D xdp_convert_buff=
_to_frame(xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  436  		if (unlikely(!xdpf))
26efaef759a1bc Taehee Yoo      2022-04-17  437  			goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  438  		tx_ring =3D aq_nic->aq_ri=
ng_tx[rx_ring->idx];
26efaef759a1bc Taehee Yoo      2022-04-17  439  		result =3D aq_nic_xmit_xd=
pf(aq_nic, tx_ring, xdpf);
26efaef759a1bc Taehee Yoo      2022-04-17  440  		if (result =3D=3D NETDEV_=
TX_BUSY)
26efaef759a1bc Taehee Yoo      2022-04-17  441  			goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  442  		u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  443  		++rx_ring->stats.rx.xdp_t=
x;
26efaef759a1bc Taehee Yoo      2022-04-17  444  		u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  445  		aq_get_rxpages_xdp(buff, =
xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  446  		break;
26efaef759a1bc Taehee Yoo      2022-04-17  447  	case XDP_REDIRECT:
26efaef759a1bc Taehee Yoo      2022-04-17  448  		if (xdp_do_redirect(aq_ni=
c->ndev, xdp, prog) < 0)
26efaef759a1bc Taehee Yoo      2022-04-17  449  			goto out_aborted;
26efaef759a1bc Taehee Yoo      2022-04-17  450  		xdp_do_flush();
26efaef759a1bc Taehee Yoo      2022-04-17  451  		u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  452  		++rx_ring->stats.rx.xdp_r=
edirect;
26efaef759a1bc Taehee Yoo      2022-04-17  453  		u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  454  		aq_get_rxpages_xdp(buff, =
xdp);
26efaef759a1bc Taehee Yoo      2022-04-17  455  		break;
26efaef759a1bc Taehee Yoo      2022-04-17  456  	default:
26efaef759a1bc Taehee Yoo      2022-04-17  457  		fallthrough;
26efaef759a1bc Taehee Yoo      2022-04-17  458  	case XDP_ABORTED:
26efaef759a1bc Taehee Yoo      2022-04-17  459  out_aborted:
26efaef759a1bc Taehee Yoo      2022-04-17  460  		u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  461  		++rx_ring->stats.rx.xdp_a=
borted;
26efaef759a1bc Taehee Yoo      2022-04-17  462  		u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  463  		trace_xdp_exception(aq_ni=
c->ndev, prog, act);
26efaef759a1bc Taehee Yoo      2022-04-17  464  		bpf_warn_invalid_xdp_acti=
on(aq_nic->ndev, prog, act);
26efaef759a1bc Taehee Yoo      2022-04-17  465  		break;
26efaef759a1bc Taehee Yoo      2022-04-17  466  	case XDP_DROP:
26efaef759a1bc Taehee Yoo      2022-04-17  467  		u64_stats_update_begin(&r=
x_ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  468  		++rx_ring->stats.rx.xdp_d=
rop;
26efaef759a1bc Taehee Yoo      2022-04-17  469  		u64_stats_update_end(&rx_=
ring->stats.rx.syncp);
26efaef759a1bc Taehee Yoo      2022-04-17  470  		break;
26efaef759a1bc Taehee Yoo      2022-04-17  471  	}
26efaef759a1bc Taehee Yoo      2022-04-17  472  =

26efaef759a1bc Taehee Yoo      2022-04-17 @473  	return ERR_PTR(-result);
26efaef759a1bc Taehee Yoo      2022-04-17  474  }
26efaef759a1bc Taehee Yoo      2022-04-17  475  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6337640327118240486==--

