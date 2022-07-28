Content-Type: multipart/mixed; boundary="===============6042956947963868295=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/rcar/rcar_can.c:812:6: warning: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Thu, 28 Jul 2022 19:56:53 +0800
Message-ID: <202207281908.9KmisYaP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6042956947963868295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/can/rcar/rcar_can.c:812:6: warning: Redundant initialization f=
or 'err'. The initialized value is overwritten before it is read. [redundan=
tInitialization]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6e7765cb477a9753670d4351d14de93f1e9dbbd4
commit: ac4224087312d7212bd3411f1e393f4b7cb1ff15 can: rcar: Kconfig: Add he=
lper dependency on COMPILE_TEST
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ac4224087312d7212bd3411f1e393f4b7cb1ff15
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/can/rcar/rcar_can.c:812:6: warning: Redundant initialization=
 for 'err'. The initialized value is overwritten before it is read. [redund=
antInitialization]
    err =3D register_candev(ndev);
        ^
   drivers/net/can/rcar/rcar_can.c:749:10: note: err is initialized
    int err =3D -ENODEV;
            ^
   drivers/net/can/rcar/rcar_can.c:812:6: note: err is overwritten
    err =3D register_candev(ndev);
        ^
>> drivers/net/can/rcar/rcar_can.c:480:9: warning: Shifting signed 32-bit v=
alue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    writel(RCAR_CAN_FIDCR_IDE | RCAR_CAN_FIDCR_RTR, &priv->regs->fidcr[1]);
           ^
   drivers/net/can/rcar/rcar_can.c:603:40: warning: Shifting signed 32-bit =
value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigne=
d]
     data =3D (cf->can_id & CAN_EFF_MASK) | RCAR_CAN_IDE;
                                          ^
   drivers/net/can/rcar/rcar_can.c:656:13: warning: Shifting signed 32-bit =
value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigne=
d]
    if (data & RCAR_CAN_IDE)
               ^
>> drivers/net/can/rcar/rcar_can.c:480:9: warning: Signed integer overflow =
for expression '1<<31'. [integerOverflow]
    writel(RCAR_CAN_FIDCR_IDE | RCAR_CAN_FIDCR_RTR, &priv->regs->fidcr[1]);
           ^
   drivers/net/can/rcar/rcar_can.c:603:40: warning: Signed integer overflow=
 for expression '1<<31'. [integerOverflow]
     data =3D (cf->can_id & CAN_EFF_MASK) | RCAR_CAN_IDE;
                                          ^
   drivers/net/can/rcar/rcar_can.c:656:13: warning: Signed integer overflow=
 for expression '1<<31'. [integerOverflow]
    if (data & RCAR_CAN_IDE)
               ^

vim +/err +812 drivers/net/can/rcar/rcar_can.c

862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  742  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  743  static int rcar_can_probe(struct platform_device *pdev)
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  744  {
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  745  	struct rcar_can_priv *priv;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  746  	struct net_device *ndev;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  747  	void __iomem *addr;
a268de6c68e493 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  748  	u32 clock_select =3D CLKR_CLKP1;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  749  	int err =3D -ENODEV;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  750  	int irq;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  751  =

30cc0ed73e3390 drivers/net/can/rcar/rcar_can.c Geert Uytterhoeven 2019-08-1=
4  752  	of_property_read_u32(pdev->dev.of_node, "renesas,can-clock-select",
30cc0ed73e3390 drivers/net/can/rcar/rcar_can.c Geert Uytterhoeven 2019-08-1=
4  753  			     &clock_select);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  754  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  755  	irq =3D platform_get_irq(pdev, 0);
5e63e6baa159fa drivers/net/can/rcar_can.c      Sergei Shtylyov    2015-06-2=
0  756  	if (irq < 0) {
5e63e6baa159fa drivers/net/can/rcar_can.c      Sergei Shtylyov    2015-06-2=
0  757  		err =3D irq;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  758  		goto fail;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  759  	}
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  760  =

ac9921ded292bf drivers/net/can/rcar/rcar_can.c YueHaibing         2019-10-1=
5  761  	addr =3D devm_platform_ioremap_resource(pdev, 0);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  762  	if (IS_ERR(addr)) {
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  763  		err =3D PTR_ERR(addr);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  764  		goto fail;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  765  	}
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  766  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  767  	ndev =3D alloc_candev(sizeof(struct rcar_can_priv), RCAR_CAN_FIFO_=
DEPTH);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  768  	if (!ndev) {
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  769  		dev_err(&pdev->dev, "alloc_candev() failed\n");
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  770  		err =3D -ENOMEM;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  771  		goto fail;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  772  	}
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  773  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  774  	priv =3D netdev_priv(ndev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  775  =

862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  776  	priv->clk =3D devm_clk_get(&pdev->dev, "clkp1");
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  777  	if (IS_ERR(priv->clk)) {
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  778  		err =3D PTR_ERR(priv->clk);
585bc2ac4cc0e2 drivers/net/can/rcar_can.c      Sergei Shtylyov    2015-06-2=
0  779  		dev_err(&pdev->dev, "cannot get peripheral clock, error %d\n",
585bc2ac4cc0e2 drivers/net/can/rcar_can.c      Sergei Shtylyov    2015-06-2=
0  780  			err);
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  781  		goto fail_clk;
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  782  	}
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  783  =

68c8d209cd4337 drivers/net/can/rcar/rcar_can.c Fabrizio Castro    2018-09-1=
0  784  	if (!(BIT(clock_select) & RCAR_SUPPORTED_CLOCKS)) {
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  785  		err =3D -EINVAL;
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  786  		dev_err(&pdev->dev, "invalid CAN clock selected\n");
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  787  		goto fail_clk;
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  788  	}
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  789  	priv->can_clk =3D devm_clk_get(&pdev->dev, clock_names[clock_selec=
t]);
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  790  	if (IS_ERR(priv->can_clk)) {
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  791  		err =3D PTR_ERR(priv->can_clk);
585bc2ac4cc0e2 drivers/net/can/rcar_can.c      Sergei Shtylyov    2015-06-2=
0  792  		dev_err(&pdev->dev, "cannot get CAN clock, error %d\n", err);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  793  		goto fail_clk;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  794  	}
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  795  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  796  	ndev->netdev_ops =3D &rcar_can_netdev_ops;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  797  	ndev->irq =3D irq;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  798  	ndev->flags |=3D IFF_ECHO;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  799  	priv->ndev =3D ndev;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  800  	priv->regs =3D addr;
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  801  	priv->clock_select =3D clock_select;
862e2b6af9413b drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-08-0=
1  802  	priv->can.clock.freq =3D clk_get_rate(priv->can_clk);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  803  	priv->can.bittiming_const =3D &rcar_can_bittiming_const;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  804  	priv->can.do_set_mode =3D rcar_can_do_set_mode;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  805  	priv->can.do_get_berr_counter =3D rcar_can_get_berr_counter;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  806  	priv->can.ctrlmode_supported =3D CAN_CTRLMODE_BERR_REPORTING;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  807  	platform_set_drvdata(pdev, ndev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  808  	SET_NETDEV_DEV(ndev, &pdev->dev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  809  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  810  	netif_napi_add(ndev, &priv->napi, rcar_can_rx_poll,
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  811  		       RCAR_CAN_NAPI_WEIGHT);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7 @812  	err =3D register_candev(ndev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  813  	if (err) {
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  814  		dev_err(&pdev->dev, "register_candev() failed, error %d\n",
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  815  			err);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  816  		goto fail_candev;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  817  	}
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  818  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  819  	devm_can_led_init(ndev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  820  =

ca257b9e2d807a drivers/net/can/rcar/rcar_can.c Geert Uytterhoeven 2017-04-0=
3  821  	dev_info(&pdev->dev, "device registered (IRQ%d)\n", ndev->irq);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  822  =

fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  823  	return 0;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  824  fail_candev:
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  825  	netif_napi_del(&priv->napi);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  826  fail_clk:
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  827  	free_candev(ndev);
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  828  fail:
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  829  	return err;
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  830  }
fd1159318e55e9 drivers/net/can/rcar_can.c      Sergei Shtylyov    2014-05-1=
7  831  =


:::::: The code at line 812 was first introduced by commit
:::::: fd1159318e55e901cf269de90163b19fd62938cb can: add Renesas R-Car CAN =
driver

:::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6042956947963868295==--

