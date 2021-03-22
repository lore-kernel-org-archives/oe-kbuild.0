Content-Type: multipart/mixed; boundary="===============0215926343774258444=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/staging/qlge/qlge_main.c:4564 qlge_probe() warn: missing error code 'err'
Date: Mon, 22 Mar 2021 18:14:08 +0300
Message-ID: <20210322151408.GH1667@kadam>
In-Reply-To: <20210310002137.chikq3biol5vyxgp@Rk>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0215926343774258444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 08:21:37AM +0800, Coiby Xu wrote:
> Hi Dan,
> =

> Thanks for finding this issue! I'll submit all the patches including the
> one for the previous issue reported by you ("[bug report] staging: qlge:
> Initialize devlink health dump framework") after finishing all items list=
ed
> in drivers/staging/qlge/TODO.
> =


I just sent a patch for this.

Part of my QC process before I send a patch is to search my inbox to
see if I have already sent the patch before.  I have the memory of a
gnat and static checker warnings all look the same after a while so I
once wrote the same patch three times before I implemented this as part
of my QC process.

Anyway, it turns out that I did report this bug already but since you
hadn't sent a fix, I decided to just send my fix instead of deleting it.

When kbuild detects a bug in your patch then please fix it as soon as
you can.  Certainly don't wait until "all the TODO items" are done.  (0_0)
Just do what I do and promise to "fix it tomorrow morning" and then
forget about it forever.  ;)

regards,
dan carpenter

> On Thu, Feb 25, 2021 at 01:03:03PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   29c395c77a9a514c5857c45ceae2665e9bd99ac7
> > commit: 953b94009377419f28fd0153f91fcd5b5a347608 staging: qlge: Initial=
ize devlink health dump framework
> > config: i386-randconfig-m021-20210225 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/staging/qlge/qlge_main.c:4564 qlge_probe() warn: missing error =
code 'err'
> > =

> > vim +/err +4564 drivers/staging/qlge/qlge_main.c
> > =

> > 5d8e87265715a1 drivers/net/ethernet/qlogic/qlge/qlge_main.c Bill Pember=
ton     2012-12-03  4544  static int qlge_probe(struct pci_dev *pdev,
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4545  		      const struct pci_device_id *pci_entry)
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4546  {
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4547  	struct qlge_netdev_priv *ndev_priv;
> > f8c047be540197 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4548  	struct qlge_adapter *qdev =3D NULL;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4549  	struct net_device *ndev =3D NULL;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4550  	struct devlink *devlink;
> > f41e1a0a9462fc drivers/staging/qlge/qlge_main.c             Dorothea Eh=
rl      2019-11-27  4551  	static int cards_found;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4552  	int err =3D 0;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4553
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4554  	devlink =3D devlink_alloc(&qlge_devlink_ops, siz=
eof(struct qlge_adapter));
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4555  	if (!devlink)
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4556  		return -ENOMEM;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4557
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4558  	qdev =3D devlink_priv(devlink);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4559
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4560  	ndev =3D alloc_etherdev_mq(sizeof(struct qlge_ne=
tdev_priv),
> > 1b998958b301fb drivers/staging/qlge/qlge_main.c             Scott Schaf=
er      2019-12-11  4561  				 min(MAX_CPUS,
> > 1b998958b301fb drivers/staging/qlge/qlge_main.c             Scott Schaf=
er      2019-12-11  4562  				     netif_get_num_default_rss_queues()));
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4563  	if (!ndev)
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23 @4564  		goto devlink_free;
> > =

> > "err =3D -ENOMEM;"
> > =

> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4565
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4566  	ndev_priv =3D netdev_priv(ndev);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4567  	ndev_priv->qdev =3D qdev;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4568  	ndev_priv->ndev =3D ndev;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4569  	qdev->ndev =3D ndev;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4570  	err =3D qlge_init_device(pdev, qdev, cards_found=
);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4571  	if (err < 0)
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4572  		goto netdev_free;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4573
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4574  	SET_NETDEV_DEV(ndev, &pdev->dev);
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4575  	ndev->hw_features =3D NETIF_F_SG |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4576  		NETIF_F_IP_CSUM |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4577  		NETIF_F_TSO |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4578  		NETIF_F_TSO_ECN |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4579  		NETIF_F_HW_VLAN_CTAG_TX |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4580  		NETIF_F_HW_VLAN_CTAG_RX |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4581  		NETIF_F_HW_VLAN_CTAG_FILTER |
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4582  		NETIF_F_RXCSUM;
> > a45adbe8d35247 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2013-09-27  4583  	ndev->features =3D ndev->hw_features;
> > 1a0150a93c4969 drivers/net/ethernet/qlogic/qlge/qlge_main.c brenohl(a)b=
r.ibm.com 2012-07-27  4584  	ndev->vlan_features =3D ndev->hw_features;
> > 51bb352f15595f drivers/net/ethernet/qlogic/qlge/qlge_main.c Jitendra Ka=
lsaria  2014-01-14  4585  	/* vlan gets same features (except vlan filter) =
*/
> > f6d1ac4b5f15f5 drivers/net/ethernet/qlogic/qlge/qlge_main.c Vlad Yasevi=
ch      2014-03-27  4586  	ndev->vlan_features &=3D ~(NETIF_F_HW_VLAN_CTAG_=
FILTER |
> > f6d1ac4b5f15f5 drivers/net/ethernet/qlogic/qlge/qlge_main.c Vlad Yasevi=
ch      2014-03-27  4587  				 NETIF_F_HW_VLAN_CTAG_TX |
> > f6d1ac4b5f15f5 drivers/net/ethernet/qlogic/qlge/qlge_main.c Vlad Yasevi=
ch      2014-03-27  4588  				 NETIF_F_HW_VLAN_CTAG_RX);
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4589
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4590  	if (test_bit(QL_DMA64, &qdev->flags))
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4591  		ndev->features |=3D NETIF_F_HIGHDMA;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4592
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4593  	/*
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4594  	 * Set up net_device structure.
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4595  	 */
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4596  	ndev->tx_queue_len =3D qdev->tx_ring_size;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4597  	ndev->irq =3D pdev->irq;
> > 25ed784910e43e drivers/net/qlge/qlge_main.c                 Stephen Hem=
minger  2008-11-21  4598
> > 25ed784910e43e drivers/net/qlge/qlge_main.c                 Stephen Hem=
minger  2008-11-21  4599  	ndev->netdev_ops =3D &qlge_netdev_ops;
> > 7ad24ea4bf620a drivers/net/ethernet/qlogic/qlge/qlge_main.c Wilfried Kl=
aebe    2014-05-11  4600  	ndev->ethtool_ops =3D &qlge_ethtool_ops;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4601  	ndev->watchdog_timeo =3D 10 * HZ;
> > 25ed784910e43e drivers/net/qlge/qlge_main.c                 Stephen Hem=
minger  2008-11-21  4602
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4603  	/* MTU range: this driver only supports 1500 or =
9000, so this only
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4604  	 * filters out values above or below, and we'll =
rely on
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4605  	 * qlge_change_mtu to make sure only 1500 or 900=
0 are allowed
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4606  	 */
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4607  	ndev->min_mtu =3D ETH_DATA_LEN;
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4608  	ndev->max_mtu =3D 9000;
> > d894be57ca92c8 drivers/net/ethernet/qlogic/qlge/qlge_main.c Jarod Wilso=
n       2016-10-20  4609
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4610  	err =3D register_netdev(ndev);
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4611  	if (err) {
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4612  		dev_err(&pdev->dev, "net device registration fa=
iled.\n");
> > f8c047be540197 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4613  		qlge_release_all(pdev);
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4614  		pci_disable_device(pdev);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4615  		goto netdev_free;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4616  	}
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4617
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4618  	err =3D devlink_register(devlink, &pdev->dev);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4619  	if (err)
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4620  		goto netdev_free;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4621
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4622  	qlge_health_create_reporters(qdev);
> > 15c052fc7f4a1b drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2010-02-04  4623  	/* Start up the timer to trigger EEH if
> > 15c052fc7f4a1b drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2010-02-04  4624  	 * the bus goes dead
> > 15c052fc7f4a1b drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2010-02-04  4625  	 */
> > f8c047be540197 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4626  	timer_setup(&qdev->timer, qlge_timer, TIMER_DEFE=
RRABLE);
> > df7e828c1b6997 drivers/net/ethernet/qlogic/qlge/qlge_main.c Kees Cook  =
        2017-10-04  4627  	mod_timer(&qdev->timer, jiffies + (5 * HZ));
> > f8c047be540197 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4628  	qlge_link_off(qdev);
> > f8c047be540197 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4629  	qlge_display_dev_info(ndev);
> > 9dfbbaa6b0b9f7 drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2009-10-30  4630  	atomic_set(&qdev->lb_count, 0);
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4631  	cards_found++;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4632  	return 0;
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4633
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4634  netdev_free:
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4635  	free_netdev(ndev);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4636  devlink_free:
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4637  	devlink_free(devlink);
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4638
> > 953b9400937741 drivers/staging/qlge/qlge_main.c             Coiby Xu   =
        2021-01-23  4639  	return err;
> > c4e84bde1d595d drivers/net/qlge/qlge_main.c                 Ron Mercer =
        2008-09-18  4640  }
> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> =

> =

> -- =

> Best regards,
> Coiby
--===============0215926343774258444==--

