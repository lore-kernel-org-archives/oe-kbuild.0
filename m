Content-Type: multipart/mixed; boundary="===============7719260008492388755=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC net-next 2/4] net: stmmac: move to threaded IRQ
Date: Sat, 11 Dec 2021 17:49:19 +0800
Message-ID: <202112111750.g2bjweCW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7719260008492388755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211210193556.1349090-3-yannick.vignon@oss.nxp.com>
References: <20211210193556.1349090-3-yannick.vignon@oss.nxp.com>
TO: Yannick Vignon <yannick.vignon@oss.nxp.com>

Hi Yannick,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Yannick-Vignon/net-Improvi=
ng-network-scheduling-latencies/20211211-035854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
e1b539bd73a76dc8a7bf82befe6eac4ae79c76b3
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112111750.g2bjweCW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3591 stmmac_request_irq_m=
ulti_msi() warn: 'dev->irq' not released on lines: 3591.

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1736 init_dma_rx_desc_rin=
gs() warn: always true condition '(queue >=3D 0) =3D> (0-u32max >=3D 0)'
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1736 init_dma_rx_desc_rin=
gs() warn: always true condition '(queue >=3D 0) =3D> (0-u32max >=3D 0)'
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4744 stmmac_xdp_run_prog(=
) error: (-2147483647) too low for ERR_PTR
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4810 stmmac_dispatch_skb_=
zc() error: uninitialized symbol 'hash'.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4810 stmmac_dispatch_skb_=
zc() error: uninitialized symbol 'hash_type'.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5312 stmmac_rx() error: u=
ninitialized symbol 'hash'.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5312 stmmac_rx() error: u=
ninitialized symbol 'hash_type'.

vim +3591 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

8532f613bc78b6 Ong Boon Leong 2021-03-26  3441  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3442  static int stmmac_request_i=
rq_multi_msi(struct net_device *dev)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3443  {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3444  	struct stmmac_priv *priv =
=3D netdev_priv(dev);
3e6dc7b650250f Wong Vee Khee  2021-06-11  3445  	enum request_irq_err irq_e=
rr;
8deec94c6040bb Ong Boon Leong 2021-04-01  3446  	cpumask_t cpu_mask;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3447  	int irq_idx =3D 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3448  	char *int_name;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3449  	int ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3450  	int i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3451  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3452  	/* For common interrupt */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3453  	int_name =3D priv->int_nam=
e_mac;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3454  	sprintf(int_name, "%s:%s",=
 dev->name, "mac");
b5d79af3830aed Yannick Vignon 2021-12-10  3455  	ret =3D request_threaded_i=
rq(dev->irq, NULL, stmmac_interrupt,
b5d79af3830aed Yannick Vignon 2021-12-10  3456  			  IRQF_ONESHOT, int_name=
, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3457  	if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3458  		netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3459  			   "%s: alloc mac MSI %d=
 (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3460  			   __func__, dev->irq, r=
et);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3461  		irq_err =3D REQ_IRQ_ERR_M=
AC;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3462  		goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3463  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3464  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3465  	/* Request the Wake IRQ in=
 case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3466  	 * is used for WoL
8532f613bc78b6 Ong Boon Leong 2021-03-26  3467  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3468  	if (priv->wol_irq > 0 && p=
riv->wol_irq !=3D dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3469  		int_name =3D priv->int_na=
me_wol;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3470  		sprintf(int_name, "%s:%s"=
, dev->name, "wol");
b5d79af3830aed Yannick Vignon 2021-12-10  3471  		ret =3D request_threaded_=
irq(priv->wol_irq,
b5d79af3830aed Yannick Vignon 2021-12-10  3472  				  NULL, stmmac_mac_inte=
rrupt,
b5d79af3830aed Yannick Vignon 2021-12-10  3473  				  IRQF_ONESHOT, int_nam=
e, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3474  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3475  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3476  				   "%s: alloc wol MSI %=
d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3477  				   __func__, priv->wol_=
irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3478  			irq_err =3D REQ_IRQ_ERR_=
WOL;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3479  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3480  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3481  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3482  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3483  	/* Request the LPI IRQ in =
case of another line
8532f613bc78b6 Ong Boon Leong 2021-03-26  3484  	 * is used for LPI
8532f613bc78b6 Ong Boon Leong 2021-03-26  3485  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3486  	if (priv->lpi_irq > 0 && p=
riv->lpi_irq !=3D dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3487  		int_name =3D priv->int_na=
me_lpi;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3488  		sprintf(int_name, "%s:%s"=
, dev->name, "lpi");
b5d79af3830aed Yannick Vignon 2021-12-10  3489  		ret =3D request_threaded_=
irq(priv->lpi_irq,
b5d79af3830aed Yannick Vignon 2021-12-10  3490  				  NULL, stmmac_mac_inte=
rrupt,
b5d79af3830aed Yannick Vignon 2021-12-10  3491  				  IRQF_ONESHOT, int_nam=
e, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3492  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3493  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3494  				   "%s: alloc lpi MSI %=
d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3495  				   __func__, priv->lpi_=
irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3496  			irq_err =3D REQ_IRQ_ERR_=
LPI;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3497  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3498  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3499  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3500  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3501  	/* Request the Safety Feat=
ure Correctible Error line in
8532f613bc78b6 Ong Boon Leong 2021-03-26  3502  	 * case of another line is=
 used
8532f613bc78b6 Ong Boon Leong 2021-03-26  3503  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3504  	if (priv->sfty_ce_irq > 0 =
&& priv->sfty_ce_irq !=3D dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3505  		int_name =3D priv->int_na=
me_sfty_ce;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3506  		sprintf(int_name, "%s:%s"=
, dev->name, "safety-ce");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3507  		ret =3D request_irq(priv-=
>sfty_ce_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3508  				  stmmac_safety_interru=
pt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3509  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3510  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3511  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3512  				   "%s: alloc sfty ce M=
SI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3513  				   __func__, priv->sfty=
_ce_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3514  			irq_err =3D REQ_IRQ_ERR_=
SFTY_CE;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3515  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3516  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3517  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3518  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3519  	/* Request the Safety Feat=
ure Uncorrectible Error line in
8532f613bc78b6 Ong Boon Leong 2021-03-26  3520  	 * case of another line is=
 used
8532f613bc78b6 Ong Boon Leong 2021-03-26  3521  	 */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3522  	if (priv->sfty_ue_irq > 0 =
&& priv->sfty_ue_irq !=3D dev->irq) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3523  		int_name =3D priv->int_na=
me_sfty_ue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3524  		sprintf(int_name, "%s:%s"=
, dev->name, "safety-ue");
8532f613bc78b6 Ong Boon Leong 2021-03-26  3525  		ret =3D request_irq(priv-=
>sfty_ue_irq,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3526  				  stmmac_safety_interru=
pt,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3527  				  0, int_name, dev);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3528  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3529  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3530  				   "%s: alloc sfty ue M=
SI %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3531  				   __func__, priv->sfty=
_ue_irq, ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3532  			irq_err =3D REQ_IRQ_ERR_=
SFTY_UE;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3533  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3534  		}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3535  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3536  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3537  	/* Request Rx MSI irq */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3538  	for (i =3D 0; i < priv->pl=
at->rx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann  2021-09-27  3539  		if (i >=3D MTL_MAX_RX_QUE=
UES)
3e0d5699a97571 Arnd Bergmann  2021-09-27  3540  			break;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3541  		if (priv->rx_irq[i] =3D=
=3D 0)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3542  			continue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3543  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3544  		int_name =3D priv->int_na=
me_rx_irq[i];
8532f613bc78b6 Ong Boon Leong 2021-03-26  3545  		sprintf(int_name, "%s:%s-=
%d", dev->name, "rx", i);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3546  		ret =3D request_irq(priv-=
>rx_irq[i],
8532f613bc78b6 Ong Boon Leong 2021-03-26  3547  				  stmmac_msi_intr_rx,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3548  				  0, int_name, &priv->r=
x_queue[i]);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3549  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3550  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3551  				   "%s: alloc rx-%d  MS=
I %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3552  				   __func__, i, priv->r=
x_irq[i], ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3553  			irq_err =3D REQ_IRQ_ERR_=
RX;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3554  			irq_idx =3D i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3555  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3556  		}
8deec94c6040bb Ong Boon Leong 2021-04-01  3557  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3558  		cpumask_set_cpu(i % num_o=
nline_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3559  		irq_set_affinity_hint(pri=
v->rx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3560  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3561  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3562  	/* Request Tx MSI irq */
8532f613bc78b6 Ong Boon Leong 2021-03-26  3563  	for (i =3D 0; i < priv->pl=
at->tx_queues_to_use; i++) {
d68c2e1d19c540 Arnd Bergmann  2021-09-27  3564  		if (i >=3D MTL_MAX_TX_QUE=
UES)
3e0d5699a97571 Arnd Bergmann  2021-09-27  3565  			break;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3566  		if (priv->tx_irq[i] =3D=
=3D 0)
8532f613bc78b6 Ong Boon Leong 2021-03-26  3567  			continue;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3568  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3569  		int_name =3D priv->int_na=
me_tx_irq[i];
8532f613bc78b6 Ong Boon Leong 2021-03-26  3570  		sprintf(int_name, "%s:%s-=
%d", dev->name, "tx", i);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3571  		ret =3D request_irq(priv-=
>tx_irq[i],
8532f613bc78b6 Ong Boon Leong 2021-03-26  3572  				  stmmac_msi_intr_tx,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3573  				  0, int_name, &priv->t=
x_queue[i]);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3574  		if (unlikely(ret < 0)) {
8532f613bc78b6 Ong Boon Leong 2021-03-26  3575  			netdev_err(priv->dev,
8532f613bc78b6 Ong Boon Leong 2021-03-26  3576  				   "%s: alloc tx-%d  MS=
I %d (error: %d)\n",
8532f613bc78b6 Ong Boon Leong 2021-03-26  3577  				   __func__, i, priv->t=
x_irq[i], ret);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3578  			irq_err =3D REQ_IRQ_ERR_=
TX;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3579  			irq_idx =3D i;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3580  			goto irq_error;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3581  		}
8deec94c6040bb Ong Boon Leong 2021-04-01  3582  		cpumask_clear(&cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3583  		cpumask_set_cpu(i % num_o=
nline_cpus(), &cpu_mask);
8deec94c6040bb Ong Boon Leong 2021-04-01  3584  		irq_set_affinity_hint(pri=
v->tx_irq[i], &cpu_mask);
8532f613bc78b6 Ong Boon Leong 2021-03-26  3585  	}
8532f613bc78b6 Ong Boon Leong 2021-03-26  3586  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3587  	return 0;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3588  =

8532f613bc78b6 Ong Boon Leong 2021-03-26  3589  irq_error:
8532f613bc78b6 Ong Boon Leong 2021-03-26  3590  	stmmac_free_irq(dev, irq_e=
rr, irq_idx);
8532f613bc78b6 Ong Boon Leong 2021-03-26 @3591  	return ret;
8532f613bc78b6 Ong Boon Leong 2021-03-26  3592  }
8532f613bc78b6 Ong Boon Leong 2021-03-26  3593  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7719260008492388755==--

