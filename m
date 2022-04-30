Content-Type: multipart/mixed; boundary="===============1038740379660267319=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/ti_hecc.c:936:6: warning: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Sat, 30 Apr 2022 15:03:31 +0800
Message-ID: <202204301409.ZZdyXuf2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1038740379660267319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8013d1d3d2e33236dee13a133fba49ad55045e79
commit: eff104cf3cf328ade52469b269c1b9b81f78a3f5 can: ti_hecc: ti_hecc_prob=
e(): use platform_get_irq() to get the interrupt
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout eff104cf3cf328ade52469b269c1b9b81f78a3f5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/can/ti_hecc.c:936:6: warning: Redundant initialization for '=
err'. The initialized value is overwritten before it is read. [redundantIni=
tialization]
    err =3D clk_prepare_enable(priv->clk);
        ^
   drivers/net/can/ti_hecc.c:863:10: note: err is initialized
    int err =3D -ENODEV;
            ^
   drivers/net/can/ti_hecc.c:936:6: note: err is overwritten
    err =3D clk_prepare_enable(priv->clk);
        ^

vim +/err +936 drivers/net/can/ti_hecc.c

dabf54dd1c6369 Yegor Yefremov      2017-02-17  856  =

3758bf25db8cae Anant Gole          2009-10-07  857  static int ti_hecc_prob=
e(struct platform_device *pdev)
3758bf25db8cae Anant Gole          2009-10-07  858  {
3758bf25db8cae Anant Gole          2009-10-07  859  	struct net_device *nde=
v =3D (struct net_device *)0;
3758bf25db8cae Anant Gole          2009-10-07  860  	struct ti_hecc_priv *p=
riv;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  861  	struct device_node *np=
 =3D pdev->dev.of_node;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  862  	struct regulator *reg_=
xceiver;
3758bf25db8cae Anant Gole          2009-10-07  863  	int err =3D -ENODEV;
3758bf25db8cae Anant Gole          2009-10-07  864  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  865  	if (!IS_ENABLED(CONFIG=
_OF) || !np)
dabf54dd1c6369 Yegor Yefremov      2017-02-17  866  		return -EINVAL;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  867  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  868  	reg_xceiver =3D devm_r=
egulator_get(&pdev->dev, "xceiver");
dabf54dd1c6369 Yegor Yefremov      2017-02-17  869  	if (PTR_ERR(reg_xceive=
r) =3D=3D -EPROBE_DEFER)
dabf54dd1c6369 Yegor Yefremov      2017-02-17  870  		return -EPROBE_DEFER;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  871  	else if (IS_ERR(reg_xc=
eiver))
dabf54dd1c6369 Yegor Yefremov      2017-02-17  872  		reg_xceiver =3D NULL;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  873  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  874  	ndev =3D alloc_candev(=
sizeof(struct ti_hecc_priv), HECC_MAX_TX_MBOX);
dabf54dd1c6369 Yegor Yefremov      2017-02-17  875  	if (!ndev) {
dabf54dd1c6369 Yegor Yefremov      2017-02-17  876  		dev_err(&pdev->dev, "=
alloc_candev failed\n");
dabf54dd1c6369 Yegor Yefremov      2017-02-17  877  		return -ENOMEM;
3758bf25db8cae Anant Gole          2009-10-07  878  	}
dabf54dd1c6369 Yegor Yefremov      2017-02-17  879  	priv =3D netdev_priv(n=
dev);
3758bf25db8cae Anant Gole          2009-10-07  880  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  881  	/* handle hecc memory =
*/
0cf38586c2162a Dejin Zheng         2020-04-20  882  	priv->base =3D devm_pl=
atform_ioremap_resource_byname(pdev, "hecc");
b655f0e96d4061 Wei Yongjun         2017-04-25  883  	if (IS_ERR(priv->base)=
) {
dabf54dd1c6369 Yegor Yefremov      2017-02-17  884  		dev_err(&pdev->dev, "=
hecc ioremap failed\n");
7968c7c79d3be8 Zhang Qilong        2020-11-14  885  		err =3D PTR_ERR(priv-=
>base);
7968c7c79d3be8 Zhang Qilong        2020-11-14  886  		goto probe_exit_cande=
v;
3758bf25db8cae Anant Gole          2009-10-07  887  	}
dabf54dd1c6369 Yegor Yefremov      2017-02-17  888  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  889  	/* handle hecc-ram mem=
ory */
0cf38586c2162a Dejin Zheng         2020-04-20  890  	priv->hecc_ram =3D dev=
m_platform_ioremap_resource_byname(pdev,
0cf38586c2162a Dejin Zheng         2020-04-20  891  							       "hecc-ram=
");
b655f0e96d4061 Wei Yongjun         2017-04-25  892  	if (IS_ERR(priv->hecc_=
ram)) {
dabf54dd1c6369 Yegor Yefremov      2017-02-17  893  		dev_err(&pdev->dev, "=
hecc-ram ioremap failed\n");
7968c7c79d3be8 Zhang Qilong        2020-11-14  894  		err =3D PTR_ERR(priv-=
>hecc_ram);
7968c7c79d3be8 Zhang Qilong        2020-11-14  895  		goto probe_exit_cande=
v;
3758bf25db8cae Anant Gole          2009-10-07  896  	}
3758bf25db8cae Anant Gole          2009-10-07  897  =

dabf54dd1c6369 Yegor Yefremov      2017-02-17  898  	/* handle mbx memory */
0cf38586c2162a Dejin Zheng         2020-04-20  899  	priv->mbx =3D devm_pla=
tform_ioremap_resource_byname(pdev, "mbx");
b655f0e96d4061 Wei Yongjun         2017-04-25  900  	if (IS_ERR(priv->mbx))=
 {
dabf54dd1c6369 Yegor Yefremov      2017-02-17  901  		dev_err(&pdev->dev, "=
mbx ioremap failed\n");
7968c7c79d3be8 Zhang Qilong        2020-11-14  902  		err =3D PTR_ERR(priv-=
>mbx);
7968c7c79d3be8 Zhang Qilong        2020-11-14  903  		goto probe_exit_cande=
v;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  904  	}
dabf54dd1c6369 Yegor Yefremov      2017-02-17  905  =

eff104cf3cf328 Lad Prabhakar       2021-12-21  906  	ndev->irq =3D platform=
_get_irq(pdev, 0);
eff104cf3cf328 Lad Prabhakar       2021-12-21  907  	if (ndev->irq < 0) {
eff104cf3cf328 Lad Prabhakar       2021-12-21  908  		err =3D ndev->irq;
7968c7c79d3be8 Zhang Qilong        2020-11-14  909  		goto probe_exit_cande=
v;
3758bf25db8cae Anant Gole          2009-10-07  910  	}
3758bf25db8cae Anant Gole          2009-10-07  911  =

3758bf25db8cae Anant Gole          2009-10-07  912  	priv->ndev =3D ndev;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  913  	priv->reg_xceiver =3D =
reg_xceiver;
dabf54dd1c6369 Yegor Yefremov      2017-02-17  914  	priv->use_hecc1int =3D=
 of_property_read_bool(np, "ti,use-hecc1int");
3758bf25db8cae Anant Gole          2009-10-07  915  =

3758bf25db8cae Anant Gole          2009-10-07  916  	priv->can.bittiming_co=
nst =3D &ti_hecc_bittiming_const;
3758bf25db8cae Anant Gole          2009-10-07  917  	priv->can.do_set_mode =
=3D ti_hecc_do_set_mode;
79d0d8a7d5edca Wolfgang Grandegger 2012-02-01  918  	priv->can.do_get_berr_=
counter =3D ti_hecc_get_berr_counter;
ad72c347e56bf3 Christian Pellegrin 2010-01-14  919  	priv->can.ctrlmode_sup=
ported =3D CAN_CTRLMODE_3_SAMPLES;
3758bf25db8cae Anant Gole          2009-10-07  920  =

86ad47fff97a9e Abhilash K V        2011-08-23  921  	spin_lock_init(&priv->=
mbx_lock);
3758bf25db8cae Anant Gole          2009-10-07  922  	ndev->flags |=3D IFF_E=
CHO;
3758bf25db8cae Anant Gole          2009-10-07  923  	platform_set_drvdata(p=
dev, ndev);
3758bf25db8cae Anant Gole          2009-10-07  924  	SET_NETDEV_DEV(ndev, &=
pdev->dev);
3758bf25db8cae Anant Gole          2009-10-07  925  	ndev->netdev_ops =3D &=
ti_hecc_netdev_ops;
3758bf25db8cae Anant Gole          2009-10-07  926  =

3758bf25db8cae Anant Gole          2009-10-07  927  	priv->clk =3D clk_get(=
&pdev->dev, "hecc_ck");
3758bf25db8cae Anant Gole          2009-10-07  928  	if (IS_ERR(priv->clk))=
 {
3758bf25db8cae Anant Gole          2009-10-07  929  		dev_err(&pdev->dev, "=
No clock available\n");
3758bf25db8cae Anant Gole          2009-10-07  930  		err =3D PTR_ERR(priv-=
>clk);
3758bf25db8cae Anant Gole          2009-10-07  931  		priv->clk =3D NULL;
3758bf25db8cae Anant Gole          2009-10-07  932  		goto probe_exit_cande=
v;
3758bf25db8cae Anant Gole          2009-10-07  933  	}
3758bf25db8cae Anant Gole          2009-10-07  934  	priv->can.clock.freq =
=3D clk_get_rate(priv->clk);
3758bf25db8cae Anant Gole          2009-10-07  935  =

befa60113ce7ea Yegor Yefremov      2017-01-18 @936  	err =3D clk_prepare_en=
able(priv->clk);
befa60113ce7ea Yegor Yefremov      2017-01-18  937  	if (err) {
befa60113ce7ea Yegor Yefremov      2017-01-18  938  		dev_err(&pdev->dev, "=
clk_prepare_enable() failed\n");
e002103b36a695 Zhang Changzhong    2020-07-17  939  		goto probe_exit_relea=
se_clk;
befa60113ce7ea Yegor Yefremov      2017-01-18  940  	}
befa60113ce7ea Yegor Yefremov      2017-01-18  941  =

4c7f715485159a Jeroen Hofstee      2019-04-29  942  	priv->offload.mailbox_=
read =3D ti_hecc_mailbox_read;
4c7f715485159a Jeroen Hofstee      2019-04-29  943  	priv->offload.mb_first=
 =3D HECC_RX_FIRST_MBOX;
678d85ed8554e1 Jeroen Hofstee      2019-09-24  944  	priv->offload.mb_last =
=3D HECC_RX_LAST_MBOX;
4c7f715485159a Jeroen Hofstee      2019-04-29  945  	err =3D can_rx_offload=
_add_timestamp(ndev, &priv->offload);
4c7f715485159a Jeroen Hofstee      2019-04-29  946  	if (err) {
4c7f715485159a Jeroen Hofstee      2019-04-29  947  		dev_err(&pdev->dev, "=
can_rx_offload_add_timestamp() failed\n");
e002103b36a695 Zhang Changzhong    2020-07-17  948  		goto probe_exit_disab=
le_clk;
4c7f715485159a Jeroen Hofstee      2019-04-29  949  	}
4c7f715485159a Jeroen Hofstee      2019-04-29  950  =

3758bf25db8cae Anant Gole          2009-10-07  951  	err =3D register_cande=
v(ndev);
3758bf25db8cae Anant Gole          2009-10-07  952  	if (err) {
3758bf25db8cae Anant Gole          2009-10-07  953  		dev_err(&pdev->dev, "=
register_candev() failed\n");
4c7f715485159a Jeroen Hofstee      2019-04-29  954  		goto probe_exit_offlo=
ad;
3758bf25db8cae Anant Gole          2009-10-07  955  	}
d7ff5aae6ce367 Fabio Baltieri      2012-12-18  956  =

d7ff5aae6ce367 Fabio Baltieri      2012-12-18  957  	devm_can_led_init(ndev=
);
d7ff5aae6ce367 Fabio Baltieri      2012-12-18  958  =

3758bf25db8cae Anant Gole          2009-10-07  959  	dev_info(&pdev->dev, "=
device registered (reg_base=3D%p, irq=3D%u)\n",
3758bf25db8cae Anant Gole          2009-10-07  960  		 priv->base, (u32)nde=
v->irq);
3758bf25db8cae Anant Gole          2009-10-07  961  =

3758bf25db8cae Anant Gole          2009-10-07  962  	return 0;
3758bf25db8cae Anant Gole          2009-10-07  963  =

4c7f715485159a Jeroen Hofstee      2019-04-29  964  probe_exit_offload:
4c7f715485159a Jeroen Hofstee      2019-04-29  965  	can_rx_offload_del(&pr=
iv->offload);
e002103b36a695 Zhang Changzhong    2020-07-17  966  probe_exit_disable_clk:
e002103b36a695 Zhang Changzhong    2020-07-17  967  	clk_disable_unprepare(=
priv->clk);
e002103b36a695 Zhang Changzhong    2020-07-17  968  probe_exit_release_clk:
3758bf25db8cae Anant Gole          2009-10-07  969  	clk_put(priv->clk);
3758bf25db8cae Anant Gole          2009-10-07  970  probe_exit_candev:
3758bf25db8cae Anant Gole          2009-10-07  971  	free_candev(ndev);
7968c7c79d3be8 Zhang Qilong        2020-11-14  972  =

3758bf25db8cae Anant Gole          2009-10-07  973  	return err;
3758bf25db8cae Anant Gole          2009-10-07  974  }
3758bf25db8cae Anant Gole          2009-10-07  975  =


:::::: The code at line 936 was first introduced by commit
:::::: befa60113ce7ea270cb51eada28443ca2756f480 can: ti_hecc: add missing p=
repare and unprepare of the clock

:::::: TO: Yegor Yefremov <yegorslists@googlemail.com>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1038740379660267319==--

