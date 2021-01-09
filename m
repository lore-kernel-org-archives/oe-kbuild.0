Content-Type: multipart/mixed; boundary="===============6619843539442852630=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/cadence/macb_main.c:4661:14: warning: Either the condition 'macb_config' is redundant or there is possible null pointer dereference: macb_config.
Date: Sat, 09 Jan 2021 14:34:36 +0800
Message-ID: <202101091428.LDIhbcWF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6619843539442852630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   996e435fd401de35df62ac943ab9402cfe85c430
commit: edac63861db72a462ccdfad0b5dfa66985d58bd5 net: macb: add userio bits=
 as platform configuration
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/cadence/macb_main.c:2908:5: warning: %d in format s=
tring (no. 1) requires 'int' but the argument type is 'unsigned int'. [inva=
lidPrintfArgType_sint]
       snprintf(stat_string, ETH_GSTRING_LEN, "q%d_%s",
       ^
>> drivers/net/ethernet/cadence/macb_main.c:4661:14: warning: Either the co=
ndition 'macb_config' is redundant or there is possible null pointer derefe=
rence: macb_config. [nullPointerRedundantCheck]
    bp->usrio =3D macb_config->usrio;
                ^
   drivers/net/ethernet/cadence/macb_main.c:4646:6: note: Assuming that con=
dition 'macb_config' is not redundant
    if (macb_config)
        ^
   drivers/net/ethernet/cadence/macb_main.c:4661:14: note: Null pointer der=
eference
    bp->usrio =3D macb_config->usrio;
                ^

vim +/macb_config +4661 drivers/net/ethernet/cadence/macb_main.c

83a77e9ec4150ee drivers/net/ethernet/cadence/macb.c      Bartosz Folta     =
            2016-12-14  4573  =

421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4574  static int macb_probe(struct platform_device =
*pdev)
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4575  {
83a77e9ec4150ee drivers/net/ethernet/cadence/macb.c      Bartosz Folta     =
            2016-12-14  4576  	const struct macb_config *macb_config =3D &d=
efault_gem_config;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4577  	int (*clk_init)(struct platform_device *, st=
ruct clk **,
f5473d1d44e4b42 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4578  			struct clk **, struct clk **,  struct clk =
**,
f5473d1d44e4b42 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4579  			struct clk **) =3D macb_config->clk_init;
83a77e9ec4150ee drivers/net/ethernet/cadence/macb.c      Bartosz Folta     =
            2016-12-14  4580  	int (*init)(struct platform_device *) =3D ma=
cb_config->init;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4581  	struct device_node *np =3D pdev->dev.of_node;
aead88bd0e99054 drivers/net/ethernet/cadence/macb.c      shubhrajyoti.datta=
(a)xilinx.com 2016-08-16  4582  	struct clk *pclk, *hclk =3D NULL, *tx_clk =
=3D NULL, *rx_clk =3D NULL;
f5473d1d44e4b42 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4583  	struct clk *tsu_clk =3D NULL;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4584  	unsigned int queue_mask, num_queues;
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4585  	bool native_io;
0c65b2b90d13c1d drivers/net/ethernet/cadence/macb_main.c Andrew Lunn       =
            2019-11-04  4586  	phy_interface_t interface;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4587  	struct net_device *dev;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4588  	struct resource *regs;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4589  	void __iomem *mem;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4590  	const char *mac;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4591  	struct macb *bp;
404cd086f29e867 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2018-07-06  4592  	int err, val;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4593  =

f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4594  	regs =3D platform_get_resource(pdev, IORESOU=
RCE_MEM, 0);
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4595  	mem =3D devm_ioremap_resource(&pdev->dev, re=
gs);
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4596  	if (IS_ERR(mem))
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4597  		return PTR_ERR(mem);
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4598  =

c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4599  	if (np) {
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4600  		const struct of_device_id *match;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4601  =

c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4602  		match =3D of_match_node(macb_dt_ids, np);
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4603  		if (match && match->data) {
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4604  			macb_config =3D match->data;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4605  			clk_init =3D macb_config->clk_init;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4606  			init =3D macb_config->init;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4607  		}
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4608  	}
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4609  =

f5473d1d44e4b42 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4610  	err =3D clk_init(pdev, &pclk, &hclk, &tx_clk=
, &rx_clk, &tsu_clk);
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4611  	if (err)
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4612  		return err;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4613  =

d54f89af6cc4d6d drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4614  	pm_runtime_set_autosuspend_delay(&pdev->dev,=
 MACB_PM_TIMEOUT);
d54f89af6cc4d6d drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4615  	pm_runtime_use_autosuspend(&pdev->dev);
d54f89af6cc4d6d drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4616  	pm_runtime_get_noresume(&pdev->dev);
d54f89af6cc4d6d drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4617  	pm_runtime_set_active(&pdev->dev);
d54f89af6cc4d6d drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4618  	pm_runtime_enable(&pdev->dev);
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4619  	native_io =3D hw_is_native_io(mem);
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4620  =

f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4621  	macb_probe_queues(mem, native_io, &queue_mas=
k, &num_queues);
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4622  	dev =3D alloc_etherdev_mq(sizeof(*bp), num_q=
ueues);
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4623  	if (!dev) {
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4624  		err =3D -ENOMEM;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4625  		goto err_disable_clocks;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4626  	}
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4627  =

421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4628  	dev->base_addr =3D regs->start;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4629  =

421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4630  	SET_NETDEV_DEV(dev, &pdev->dev);
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4631  =

421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4632  	bp =3D netdev_priv(dev);
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4633  	bp->pdev =3D pdev;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4634  	bp->dev =3D dev;
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4635  	bp->regs =3D mem;
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4636  	bp->native_io =3D native_io;
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4637  	if (native_io) {
7a6e0706c09b121 drivers/net/ethernet/cadence/macb.c      David S. Miller   =
            2015-07-27  4638  		bp->macb_reg_readl =3D hw_readl_native;
7a6e0706c09b121 drivers/net/ethernet/cadence/macb.c      David S. Miller   =
            2015-07-27  4639  		bp->macb_reg_writel =3D hw_writel_native;
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4640  	} else {
7a6e0706c09b121 drivers/net/ethernet/cadence/macb.c      David S. Miller   =
            2015-07-27  4641  		bp->macb_reg_readl =3D hw_readl;
7a6e0706c09b121 drivers/net/ethernet/cadence/macb.c      David S. Miller   =
            2015-07-27  4642  		bp->macb_reg_writel =3D hw_writel;
f2ce8a9e48385f4 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4643  	}
421d9df0628be16 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen   =
            2015-03-07  4644  	bp->num_queues =3D num_queues;
bfa0914afa95d44 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4645  	bp->queue_mask =3D queue_mask;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4646  	if (macb_config)
f6970505defd0e7 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4647  		bp->dma_burst_length =3D macb_config->dma_b=
urst_length;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4648  	bp->pclk =3D pclk;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4649  	bp->hclk =3D hclk;
c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4650  	bp->tx_clk =3D tx_clk;
aead88bd0e99054 drivers/net/ethernet/cadence/macb.c      shubhrajyoti.datta=
(a)xilinx.com 2016-08-16  4651  	bp->rx_clk =3D rx_clk;
f5473d1d44e4b42 drivers/net/ethernet/cadence/macb_main.c Harini Katakam    =
            2019-03-01  4652  	bp->tsu_clk =3D tsu_clk;
f36dbe6a285e062 drivers/net/ethernet/cadence/macb.c      Andy Shevchenko   =
            2015-07-24  4653  	if (macb_config)
98b5a0f4a2282fb drivers/net/ethernet/cadence/macb.c      Harini Katakam    =
            2015-05-06  4654  		bp->jumbo_max_len =3D macb_config->jumbo_ma=
x_len;
98b5a0f4a2282fb drivers/net/ethernet/cadence/macb.c      Harini Katakam    =
            2015-05-06  4655  =

3e2a5e153906432 drivers/net/ethernet/cadence/macb.c      Sergio Prado      =
            2016-02-09  4656  	bp->wol =3D 0;
7c4a1d0cfdc169b drivers/net/ethernet/cadence/macb.c      Sergio Prado      =
            2016-02-16  4657  	if (of_get_property(np, "magic-packet", NULL=
))
3e2a5e153906432 drivers/net/ethernet/cadence/macb.c      Sergio Prado      =
            2016-02-09  4658  		bp->wol |=3D MACB_WOL_HAS_MAGIC_PACKET;
ced4799d0637592 drivers/net/ethernet/cadence/macb_main.c Nicolas Ferre     =
            2020-07-10  4659  	device_set_wakeup_capable(&pdev->dev, bp->wo=
l & MACB_WOL_HAS_MAGIC_PACKET);
3e2a5e153906432 drivers/net/ethernet/cadence/macb.c      Sergio Prado      =
            2016-02-09  4660  =

edac63861db72a4 drivers/net/ethernet/cadence/macb_main.c Claudiu Beznea    =
            2020-12-09 @4661  	bp->usrio =3D macb_config->usrio;
edac63861db72a4 drivers/net/ethernet/cadence/macb_main.c Claudiu Beznea    =
            2020-12-09  4662  =

c69618b3e4f220f drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4663  	spin_lock_init(&bp->lock);
f6970505defd0e7 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4664  =

ad78347f06581e4 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4665  	/* setup capabilities */
f6970505defd0e7 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4666  	macb_configure_caps(bp, macb_config);
f6970505defd0e7 drivers/net/ethernet/cadence/macb.c      Nicolas Ferre     =
            2015-03-31  4667  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6619843539442852630==--

