Content-Type: multipart/mixed; boundary="===============4720939102307861329=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [lkundrak-linux-mmp:lr/ariel 11/60] drivers/usb/phy/phy-mv-usb.c:814:1: warning: Label 'err_remove_phy' is not used. [unusedLabel]
Date: Wed, 22 Apr 2020 10:26:44 +0800
Message-ID: <202004221036.pTQbH1Yo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4720939102307861329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lubomir Rintel <lkundrak@v3.sk>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.gi=
t lr/ariel
head:   483c7451896cff86b5c00af0e8ead82fcf47fcf8
commit: 9004883d4ec0540803c869c6019f0046b4157416 [11/60] Merge remote-track=
ing branch 'xo/lr/olpc-xo175-fixes10' into merged
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/usb/phy/phy-mv-usb.c:814:1: warning: Label 'err_remove_phy' is n=
ot used. [unusedLabel]
   err_remove_phy:
   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.git/co=
mmit/?id=3D9004883d4ec0540803c869c6019f0046b4157416
git remote add lkundrak-linux-mmp git://git.kernel.org/pub/scm/linux/kernel=
/git/lkundrak/linux-mmp.git
git remote update lkundrak-linux-mmp
git checkout 9004883d4ec0540803c869c6019f0046b4157416
vim +/err_remove_phy +814 drivers/usb/phy/phy-mv-usb.c

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  660=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  661=
  static int mv_otg_probe(struct platform_device *pdev)
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  662=
  {
19f9e188deb4bb drivers/usb/phy/phy-mv-usb.c Jingoo Han      2013-07-30  663=
  	struct mv_usb_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  664=
  	struct mv_otg *mvotg;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  665=
  	struct usb_otg *otg;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  666=
  	struct resource *r;
df18fedae5f787 drivers/usb/phy/phy-mv-usb.c Chao Xie        2013-03-25  667=
  	int retval =3D 0, i;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  668=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  669=
  	if (pdata =3D=3D NULL) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  670=
  		dev_err(&pdev->dev, "failed to get platform data\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  671=
  		return -ENODEV;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  672=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  673=
  =

df18fedae5f787 drivers/usb/phy/phy-mv-usb.c Chao Xie        2013-03-25  674=
  	mvotg =3D devm_kzalloc(&pdev->dev, sizeof(*mvotg), GFP_KERNEL);
aa10c7b00eff82 drivers/usb/phy/phy-mv-usb.c Peter Chen      2014-10-14  675=
  	if (!mvotg)
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  676=
  		return -ENOMEM;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  677=
  =

fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  678=
  	otg =3D devm_kzalloc(&pdev->dev, sizeof(*otg), GFP_KERNEL);
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  679=
  	if (!otg)
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  680=
  		return -ENOMEM;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  681=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  682=
  	platform_set_drvdata(pdev, mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  683=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  684=
  	mvotg->pdev =3D pdev;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  685=
  	mvotg->pdata =3D pdata;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  686=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  687=
  	mvotg->phy =3D devm_phy_get(&pdev->dev, "usb");
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  688=
  	if (IS_ERR(mvotg->phy))
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  689=
  		return PTR_ERR(mvotg->phy);
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  690=
  =

df18fedae5f787 drivers/usb/phy/phy-mv-usb.c Chao Xie        2013-03-25  691=
  	mvotg->clk =3D devm_clk_get(&pdev->dev, NULL);
df18fedae5f787 drivers/usb/phy/phy-mv-usb.c Chao Xie        2013-03-25  692=
  	if (IS_ERR(mvotg->clk))
df18fedae5f787 drivers/usb/phy/phy-mv-usb.c Chao Xie        2013-03-25  693=
  		return PTR_ERR(mvotg->clk);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  694=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  695=
  	mvotg->qwork =3D create_singlethread_workqueue("mv_otg_queue");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  696=
  	if (!mvotg->qwork) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  697=
  		dev_dbg(&pdev->dev, "cannot create workqueue for OTG\n");
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  698=
  		return -ENOMEM;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  699=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  700=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  701=
  	INIT_DELAYED_WORK(&mvotg->work, mv_otg_work);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  702=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  703=
  	/* OTG common part */
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  704=
  	mvotg->pdev =3D pdev;
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  705=
  	mvotg->usb_phy.dev =3D &pdev->dev;
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  706=
  	mvotg->usb_phy.otg =3D otg;
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  707=
  	mvotg->usb_phy.label =3D driver_name;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  708=
  =

e47d92545c2972 drivers/usb/phy/phy-mv-usb.c Antoine Tenart  2014-10-30  709=
  	otg->state =3D OTG_STATE_UNDEFINED;
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  710=
  	otg->usb_phy =3D &mvotg->usb_phy;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  711=
  	otg->set_host =3D mv_otg_set_host;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  712=
  	otg->set_peripheral =3D mv_otg_set_peripheral;
b1c711d6293585 drivers/usb/otg/mv_otg.c     Heikki Krogerus 2012-02-13  713=
  	otg->set_vbus =3D mv_otg_set_vbus;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  714=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  715=
  	for (i =3D 0; i < OTG_TIMER_NUM; i++)
9718756ffd327f drivers/usb/phy/phy-mv-usb.c Kees Cook       2017-10-16  716=
  		timer_setup(&mvotg->otg_ctrl.timer[i],
9718756ffd327f drivers/usb/phy/phy-mv-usb.c Kees Cook       2017-10-16  717=
  			    mv_otg_timer_await_bcon, 0);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  718=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  719=
  	r =3D platform_get_resource(mvotg->pdev, IORESOURCE_MEM, 0);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  720=
  	if (r =3D=3D NULL) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  721=
  		dev_err(&pdev->dev, "no I/O memory resource defined\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  722=
  		retval =3D -ENODEV;
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  723=
  		goto err_destroy_workqueue;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  724=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  725=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  726=
  	mvotg->base =3D devm_ioremap(&pdev->dev, r->start, resource_size(r));
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  727=
  	if (mvotg->base =3D=3D NULL) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  728=
  		dev_err(&pdev->dev, "failed to map I/O memory\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  729=
  		retval =3D -EFAULT;
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  730=
  		goto err_destroy_workqueue;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  731=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  732=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  733=
  	mvotg->cap_regs =3D
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  734=
  		(void __iomem *) ((unsigned long)mvotg->base + U2x_CAPREGS_OFFSET);
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  735=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  736=
  	/* we will acces controller register, so enable the udc controller */
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  737=
  	retval =3D mv_otg_enable_internal(mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  738=
  	if (retval) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  739=
  		dev_err(&pdev->dev, "mv otg enable error %d\n", retval);
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  740=
  		goto err_destroy_workqueue;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  741=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  742=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  743=
  	mvotg->op_regs =3D
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  744=
  		(struct mv_otg_regs __iomem *) ((unsigned long) mvotg->cap_regs
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  745=
  			+ (readl(mvotg->cap_regs) & CAPLENGTH_MASK));
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  746=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  747=
  	if (pdata->id) {
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  748=
  		retval =3D devm_request_threaded_irq(&pdev->dev, pdata->id->irq,
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  749=
  						NULL, mv_otg_inputs_irq,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  750=
  						IRQF_ONESHOT, "id", mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  751=
  		if (retval) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  752=
  			dev_info(&pdev->dev,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  753=
  				 "Failed to request irq for ID\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  754=
  			pdata->id =3D NULL;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  755=
  		}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  756=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  757=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  758=
  	if (pdata->vbus) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  759=
  		mvotg->clock_gating =3D 1;
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  760=
  		retval =3D devm_request_threaded_irq(&pdev->dev, pdata->vbus->irq,
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  761=
  						NULL, mv_otg_inputs_irq,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  762=
  						IRQF_ONESHOT, "vbus", mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  763=
  		if (retval) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  764=
  			dev_info(&pdev->dev,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  765=
  				 "Failed to request irq for VBUS, "
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  766=
  				 "disable clock gating\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  767=
  			mvotg->clock_gating =3D 0;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  768=
  			pdata->vbus =3D NULL;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  769=
  		}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  770=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  771=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  772=
  	if (pdata->disable_otg_clock_gating)
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  773=
  		mvotg->clock_gating =3D 0;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  774=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  775=
  	mv_otg_reset(mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  776=
  	mv_otg_init_irq(mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  777=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  778=
  	r =3D platform_get_resource(mvotg->pdev, IORESOURCE_IRQ, 0);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  779=
  	if (r =3D=3D NULL) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  780=
  		dev_err(&pdev->dev, "no IRQ resource defined\n");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  781=
  		retval =3D -ENODEV;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  782=
  		goto err_disable_clk;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  783=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  784=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  785=
  	mvotg->irq =3D r->start;
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  786=
  	if (devm_request_irq(&pdev->dev, mvotg->irq, mv_otg_irq, IRQF_SHARED,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  787=
  			driver_name, mvotg)) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  788=
  		dev_err(&pdev->dev, "Request irq %d for OTG failed\n",
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  789=
  			mvotg->irq);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  790=
  		mvotg->irq =3D 0;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  791=
  		retval =3D -ENODEV;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  792=
  		goto err_disable_clk;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  793=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  794=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  795=
  	retval =3D usb_add_phy(&mvotg->usb_phy, USB_PHY_TYPE_USB2);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  796=
  	if (retval < 0) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  797=
  		dev_err(&pdev->dev, "can't register transceiver, %d\n",
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  798=
  			retval);
fb3dfe13d0cc7e drivers/usb/otg/mv_otg.c     Chao Xie        2013-01-24  799=
  		goto err_disable_clk;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  800=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  801=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  802=
  	spin_lock_init(&mvotg->wq_lock);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  803=
  	if (spin_trylock(&mvotg->wq_lock)) {
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  804=
  		mv_otg_run_state_machine(mvotg, 2 * HZ);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  805=
  		spin_unlock(&mvotg->wq_lock);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  806=
  	}
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  807=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  808=
  	dev_info(&pdev->dev,
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  809=
  		 "successful probe OTG device %s clock gating.\n",
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  810=
  		 mvotg->clock_gating ? "with" : "without");
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  811=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  812=
  	return 0;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  813=
  =

848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11 @814=
  err_remove_phy:
848ef37fd3c5f1 drivers/usb/phy/phy-mv-usb.c Lubomir Rintel  2018-08-11  815=
  	usb_remove_phy(&mvotg->usb_phy);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  816=
  err_disable_clk:
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  817=
  	mv_otg_disable_internal(mvotg);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  818=
  err_destroy_workqueue:
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  819=
  	flush_workqueue(mvotg->qwork);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  820=
  	destroy_workqueue(mvotg->qwork);
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  821=
  =

277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  822=
  	return retval;
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  823=
  }
277164f03f466b drivers/usb/otg/mv_otg.c     Neil Zhang      2011-12-20  824=
  =


:::::: The code at line 814 was first introduced by commit
:::::: 848ef37fd3c5f1566918df14fa4e0f09e46e056f USB: phy-mv-usb: use phy-px=
a-usb

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Lubomir Rintel <lkundrak@v3.sk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4720939102307861329==--

