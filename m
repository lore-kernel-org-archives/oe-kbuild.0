Content-Type: multipart/mixed; boundary="===============5764841430734477241=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/broadcom/genet/bcmgenet.c:4039:6: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Sat, 05 Sep 2020 06:27:13 +0800
Message-ID: <202009050606.POfSEmK1%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5764841430734477241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Doug Berger <opendmb@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59126901f200f5fc907153468b03c64e0081b6e6
commit: 3e370952287c55e5fd240cb8bb41ef8acff8829d net: bcmgenet: add support=
 for ethtool rxnfc flows
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/ethernet/broadcom/genet/bcmgenet.c:899:9: warning: Identical=
 condition 'ret', second condition is always false [identicalConditionAfter=
EarlyExit]
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:890:6: note: first condit=
ion
    if (ret)
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:899:9: note: second condi=
tion
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2764:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2734:6: note: first condi=
tion
    if (ret)
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2764:9: note: second cond=
ition
    return ret;
           ^
>> drivers/net/ethernet/broadcom/genet/bcmgenet.c:4039:6: warning: Variable=
 'err' is reassigned a value before the old one has been used. [redundantAs=
signment]
    err =3D devm_request_irq(&pdev->dev, priv->wol_irq, bcmgenet_wol_isr, 0,
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:3992:0: note: Variable 'e=
rr' is reassigned a value before the old one has been used.
    int err =3D -EIO;
   ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:4039:6: note: Variable 'e=
rr' is reassigned a value before the old one has been used.
    err =3D devm_request_irq(&pdev->dev, priv->wol_irq, bcmgenet_wol_isr, 0,
        ^
>> drivers/net/ethernet/broadcom/genet/bcmgenet.c:495:15: warning: Shifting=
 signed 32-bit value by 31 bits is undefined behaviour. See condition at li=
ne 494. [shiftTooManyBitsSigned]
     reg1 &=3D ~(1 << (f_index % 32));
                 ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:494:15: note: Assuming th=
at condition 'f_index<32' is not redundant
    if  (f_index < 32) {
                 ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:495:15: note: Shift
     reg1 &=3D ~(1 << (f_index % 32));
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3e370952287c55e5fd240cb8bb41ef8acff8829d
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 3e370952287c55e5fd240cb8bb41ef8acff8829d
vim +/err +4039 drivers/net/ethernet/broadcom/genet/bcmgenet.c

1c1008c793fa467 Florian Fainelli 2014-02-13  3984  =

1c1008c793fa467 Florian Fainelli 2014-02-13  3985  static int bcmgenet_prob=
e(struct platform_device *pdev)
1c1008c793fa467 Florian Fainelli 2014-02-13  3986  {
b0ba512e25d729a Petri Gynther    2014-12-01  3987  	struct bcmgenet_platfor=
m_data *pd =3D pdev->dev.platform_data;
a50e3a9931c1983 Stefan Wahren    2019-11-11  3988  	const struct bcmgenet_p=
lat_data *pdata;
1c1008c793fa467 Florian Fainelli 2014-02-13  3989  	struct bcmgenet_priv *p=
riv;
1c1008c793fa467 Florian Fainelli 2014-02-13  3990  	struct net_device *dev;
5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  3991  	unsigned int i;
1c1008c793fa467 Florian Fainelli 2014-02-13  3992  	int err =3D -EIO;
1c1008c793fa467 Florian Fainelli 2014-02-13  3993  =

3feafeed16f92b9 Petri Gynther    2015-03-05  3994  	/* Up to GENET_MAX_MQ_C=
NT + 1 TX queues and RX queues */
3feafeed16f92b9 Petri Gynther    2015-03-05  3995  	dev =3D alloc_etherdev_=
mqs(sizeof(*priv), GENET_MAX_MQ_CNT + 1,
3feafeed16f92b9 Petri Gynther    2015-03-05  3996  				 GENET_MAX_MQ_CNT + =
1);
1c1008c793fa467 Florian Fainelli 2014-02-13  3997  	if (!dev) {
1c1008c793fa467 Florian Fainelli 2014-02-13  3998  		dev_err(&pdev->dev, "c=
an't allocate net device\n");
1c1008c793fa467 Florian Fainelli 2014-02-13  3999  		return -ENOMEM;
1c1008c793fa467 Florian Fainelli 2014-02-13  4000  	}
1c1008c793fa467 Florian Fainelli 2014-02-13  4001  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4002  	priv =3D netdev_priv(de=
v);
1c1008c793fa467 Florian Fainelli 2014-02-13  4003  	priv->irq0 =3D platform=
_get_irq(pdev, 0);
2b65f93687fb248 Stefan Wahren    2019-11-11  4004  	if (priv->irq0 < 0) {
2b65f93687fb248 Stefan Wahren    2019-11-11  4005  		err =3D priv->irq0;
2b65f93687fb248 Stefan Wahren    2019-11-11  4006  		goto err;
2b65f93687fb248 Stefan Wahren    2019-11-11  4007  	}
1c1008c793fa467 Florian Fainelli 2014-02-13  4008  	priv->irq1 =3D platform=
_get_irq(pdev, 1);
2b65f93687fb248 Stefan Wahren    2019-11-11  4009  	if (priv->irq1 < 0) {
2b65f93687fb248 Stefan Wahren    2019-11-11  4010  		err =3D priv->irq1;
1c1008c793fa467 Florian Fainelli 2014-02-13  4011  		goto err;
1c1008c793fa467 Florian Fainelli 2014-02-13  4012  	}
2b65f93687fb248 Stefan Wahren    2019-11-11  4013  	priv->wol_irq =3D platf=
orm_get_irq_optional(pdev, 2);
1c1008c793fa467 Florian Fainelli 2014-02-13  4014  =

4ca3348dff9ac63 YueHaibing       2019-08-21  4015  	priv->base =3D devm_pla=
tform_ioremap_resource(pdev, 0);
5343a10d15362da Fabio Estevam    2014-02-24  4016  	if (IS_ERR(priv->base))=
 {
5343a10d15362da Fabio Estevam    2014-02-24  4017  		err =3D PTR_ERR(priv->=
base);
1c1008c793fa467 Florian Fainelli 2014-02-13  4018  		goto err;
1c1008c793fa467 Florian Fainelli 2014-02-13  4019  	}
1c1008c793fa467 Florian Fainelli 2014-02-13  4020  =

07c52d6a0b955a8 Doug Berger      2017-03-09  4021  	spin_lock_init(&priv->l=
ock);
07c52d6a0b955a8 Doug Berger      2017-03-09  4022  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4023  	SET_NETDEV_DEV(dev, &pd=
ev->dev);
1c1008c793fa467 Florian Fainelli 2014-02-13  4024  	dev_set_drvdata(&pdev->=
dev, dev);
1c1008c793fa467 Florian Fainelli 2014-02-13  4025  	dev->watchdog_timeo =3D=
 2 * HZ;
7ad24ea4bf620a3 Wilfried Klaebe  2014-05-11  4026  	dev->ethtool_ops =3D &b=
cmgenet_ethtool_ops;
1c1008c793fa467 Florian Fainelli 2014-02-13  4027  	dev->netdev_ops =3D &bc=
mgenet_netdev_ops;
1c1008c793fa467 Florian Fainelli 2014-02-13  4028  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4029  	priv->msg_enable =3D ne=
tif_msg_init(-1, GENET_MSG_DEFAULT);
1c1008c793fa467 Florian Fainelli 2014-02-13  4030  =

ae895c49905cd99 Doug Berger      2019-12-17  4031  	/* Set default features=
 */
ae895c49905cd99 Doug Berger      2019-12-17  4032  	dev->features |=3D NETI=
F_F_SG | NETIF_F_HIGHDMA | NETIF_F_HW_CSUM |
dd8e911b7f2af23 Doug Berger      2019-12-17  4033  			 NETIF_F_RXCSUM;
ae895c49905cd99 Doug Berger      2019-12-17  4034  	dev->hw_features |=3D d=
ev->features;
ae895c49905cd99 Doug Berger      2019-12-17  4035  	dev->vlan_features |=3D=
 dev->features;
1c1008c793fa467 Florian Fainelli 2014-02-13  4036  =

8562056f267db98 Florian Fainelli 2014-07-21  4037  	/* Request the WOL inte=
rrupt and advertise suspend if available */
8562056f267db98 Florian Fainelli 2014-07-21  4038  	priv->wol_irq_disabled =
=3D true;
8562056f267db98 Florian Fainelli 2014-07-21 @4039  	err =3D devm_request_ir=
q(&pdev->dev, priv->wol_irq, bcmgenet_wol_isr, 0,
8562056f267db98 Florian Fainelli 2014-07-21  4040  			       dev->name, pri=
v);
8562056f267db98 Florian Fainelli 2014-07-21  4041  	if (!err)
8562056f267db98 Florian Fainelli 2014-07-21  4042  		device_set_wakeup_capa=
ble(&pdev->dev, 1);
8562056f267db98 Florian Fainelli 2014-07-21  4043  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4044  	/* Set the needed headr=
oom to account for any possible
1c1008c793fa467 Florian Fainelli 2014-02-13  4045  	 * features enabling/di=
sabling at runtime
1c1008c793fa467 Florian Fainelli 2014-02-13  4046  	 */
1c1008c793fa467 Florian Fainelli 2014-02-13  4047  	dev->needed_headroom +=
=3D 64;
1c1008c793fa467 Florian Fainelli 2014-02-13  4048  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4049  	netdev_boot_setup_check=
(dev);
1c1008c793fa467 Florian Fainelli 2014-02-13  4050  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4051  	priv->dev =3D dev;
1c1008c793fa467 Florian Fainelli 2014-02-13  4052  	priv->pdev =3D pdev;
99c6b06a37d4cab Jeremy Linton    2020-02-24  4053  =

99c6b06a37d4cab Jeremy Linton    2020-02-24  4054  	pdata =3D device_get_ma=
tch_data(&pdev->dev);
99c6b06a37d4cab Jeremy Linton    2020-02-24  4055  	if (pdata) {
a50e3a9931c1983 Stefan Wahren    2019-11-11  4056  		priv->version =3D pdat=
a->version;
a50e3a9931c1983 Stefan Wahren    2019-11-11  4057  		priv->dma_max_burst_le=
ngth =3D pdata->dma_max_burst_length;
a50e3a9931c1983 Stefan Wahren    2019-11-11  4058  	} else {
b0ba512e25d729a Petri Gynther    2014-12-01  4059  		priv->version =3D pd->=
genet_version;
a50e3a9931c1983 Stefan Wahren    2019-11-11  4060  		priv->dma_max_burst_le=
ngth =3D DMA_MAX_BURST_LENGTH;
a50e3a9931c1983 Stefan Wahren    2019-11-11  4061  	}
1c1008c793fa467 Florian Fainelli 2014-02-13  4062  =

c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4063  	priv->clk =3D devm_clk_=
get_optional(&priv->pdev->dev, "enet");
7d5d3075b5910cf Florian Fainelli 2015-07-22  4064  	if (IS_ERR(priv->clk)) {
ae200c26b32b98f Jeremy Linton    2020-02-24  4065  		dev_dbg(&priv->pdev->d=
ev, "failed to get enet clock\n");
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4066  		err =3D PTR_ERR(priv->=
clk);
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4067  		goto err;
7d5d3075b5910cf Florian Fainelli 2015-07-22  4068  	}
e4a60a93c4a6e7d Florian Fainelli 2014-08-11  4069  =

c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4070  	err =3D clk_prepare_ena=
ble(priv->clk);
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4071  	if (err)
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4072  		goto err;
e4a60a93c4a6e7d Florian Fainelli 2014-08-11  4073  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4074  	bcmgenet_set_hw_params(=
priv);
1c1008c793fa467 Florian Fainelli 2014-02-13  4075  =

99d55638d4b053c Doug Berger      2019-12-17  4076  	err =3D -EIO;
99d55638d4b053c Doug Berger      2019-12-17  4077  	if (priv->hw_params->fl=
ags & GENET_HAS_40BITS)
99d55638d4b053c Doug Berger      2019-12-17  4078  		err =3D dma_set_mask_a=
nd_coherent(&pdev->dev, DMA_BIT_MASK(40));
99d55638d4b053c Doug Berger      2019-12-17  4079  	if (err)
99d55638d4b053c Doug Berger      2019-12-17  4080  		err =3D dma_set_mask_a=
nd_coherent(&pdev->dev, DMA_BIT_MASK(32));
99d55638d4b053c Doug Berger      2019-12-17  4081  	if (err)
99d55638d4b053c Doug Berger      2019-12-17  4082  		goto err;
99d55638d4b053c Doug Berger      2019-12-17  4083  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4084  	/* Mii wait queue */
1c1008c793fa467 Florian Fainelli 2014-02-13  4085  	init_waitqueue_head(&pr=
iv->wq);
1c1008c793fa467 Florian Fainelli 2014-02-13  4086  	/* Always use RX_BUF_LE=
NGTH (2KB) buffer for all chips */
1c1008c793fa467 Florian Fainelli 2014-02-13  4087  	priv->rx_buf_len =3D RX=
_BUF_LENGTH;
1c1008c793fa467 Florian Fainelli 2014-02-13  4088  	INIT_WORK(&priv->bcmgen=
et_irq_work, bcmgenet_irq_task);
1c1008c793fa467 Florian Fainelli 2014-02-13  4089  =

c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4090  	priv->clk_wol =3D devm_=
clk_get_optional(&priv->pdev->dev, "enet-wol");
7d5d3075b5910cf Florian Fainelli 2015-07-22  4091  	if (IS_ERR(priv->clk_wo=
l)) {
ae200c26b32b98f Jeremy Linton    2020-02-24  4092  		dev_dbg(&priv->pdev->d=
ev, "failed to get enet-wol clock\n");
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4093  		err =3D PTR_ERR(priv->=
clk_wol);
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4094  		goto err;
7d5d3075b5910cf Florian Fainelli 2015-07-22  4095  	}
1c1008c793fa467 Florian Fainelli 2014-02-13  4096  =

c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4097  	priv->clk_eee =3D devm_=
clk_get_optional(&priv->pdev->dev, "enet-eee");
6ef398ea60d931b Florian Fainelli 2014-11-25  4098  	if (IS_ERR(priv->clk_ee=
e)) {
ae200c26b32b98f Jeremy Linton    2020-02-24  4099  		dev_dbg(&priv->pdev->d=
ev, "failed to get enet-eee clock\n");
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4100  		err =3D PTR_ERR(priv->=
clk_eee);
c80d36ff63a5fb4 Andy Shevchenko  2020-04-21  4101  		goto err;
6ef398ea60d931b Florian Fainelli 2014-11-25  4102  	}
6ef398ea60d931b Florian Fainelli 2014-11-25  4103  =

6be371b053dc86f Doug Berger      2017-03-09  4104  	/* If this is an intern=
al GPHY, power it on now, before UniMAC is
6be371b053dc86f Doug Berger      2017-03-09  4105  	 * brought out of reset=
 as absolutely no UniMAC activity is allowed
6be371b053dc86f Doug Berger      2017-03-09  4106  	 */
99c6b06a37d4cab Jeremy Linton    2020-02-24  4107  	if (device_get_phy_mode=
(&pdev->dev) =3D=3D PHY_INTERFACE_MODE_INTERNAL)
6be371b053dc86f Doug Berger      2017-03-09  4108  		bcmgenet_power_up(priv=
, GENET_POWER_PASSIVE);
6be371b053dc86f Doug Berger      2017-03-09  4109  =

7d3cca75c169710 Andy Shevchenko  2020-04-21  4110  	if (pd && !IS_ERR_OR_NU=
LL(pd->mac_address))
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4111  		ether_addr_copy(dev->d=
ev_addr, pd->mac_address);
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4112  	else
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4113  		if (!device_get_mac_ad=
dress(&pdev->dev, dev->dev_addr, ETH_ALEN))
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4114  			if (has_acpi_companio=
n(&pdev->dev))
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4115  				bcmgenet_get_hw_addr=
(priv, dev->dev_addr);
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4116  =

26bd9cc64fafe3e Jeremy Linton    2020-02-24  4117  	if (!is_valid_ether_add=
r(dev->dev_addr)) {
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4118  		dev_warn(&pdev->dev, "=
using random Ethernet MAC\n");
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4119  		eth_hw_addr_random(dev=
);
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4120  	}
26bd9cc64fafe3e Jeremy Linton    2020-02-24  4121  =

28c2d1a7a0bfdf3 Doug Berger      2017-10-25  4122  	reset_umac(priv);
1c1008c793fa467 Florian Fainelli 2014-02-13  4123  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4124  	err =3D bcmgenet_mii_in=
it(dev);
1c1008c793fa467 Florian Fainelli 2014-02-13  4125  	if (err)
1c1008c793fa467 Florian Fainelli 2014-02-13  4126  		goto err_clk_disable;
1c1008c793fa467 Florian Fainelli 2014-02-13  4127  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4128  	/* setup number of real=
 queues  + 1 (GENET_V1 has 0 hardware queues
1c1008c793fa467 Florian Fainelli 2014-02-13  4129  	 * just the ring 16 des=
criptor based TX
1c1008c793fa467 Florian Fainelli 2014-02-13  4130  	 */
1c1008c793fa467 Florian Fainelli 2014-02-13  4131  	netif_set_real_num_tx_q=
ueues(priv->dev, priv->hw_params->tx_queues + 1);
1c1008c793fa467 Florian Fainelli 2014-02-13  4132  	netif_set_real_num_rx_q=
ueues(priv->dev, priv->hw_params->rx_queues + 1);
1c1008c793fa467 Florian Fainelli 2014-02-13  4133  =

5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  4134  	/* Set default coalesci=
ng parameters */
5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  4135  	for (i =3D 0; i < priv-=
>hw_params->rx_queues; i++)
5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  4136  		priv->rx_rings[i].rx_m=
ax_coalesced_frames =3D 1;
5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  4137  	priv->rx_rings[DESC_IND=
EX].rx_max_coalesced_frames =3D 1;
5e6ce1f1a4ca838 Florian Fainelli 2018-03-28  4138  =

219575eb6311ad0 Florian Fainelli 2014-06-26  4139  	/* libphy will determin=
e the link state */
219575eb6311ad0 Florian Fainelli 2014-06-26  4140  	netif_carrier_off(dev);
219575eb6311ad0 Florian Fainelli 2014-06-26  4141  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4142  	/* Turn off the main cl=
ock, WOL clock is handled separately */
1c1008c793fa467 Florian Fainelli 2014-02-13  4143  	clk_disable_unprepare(p=
riv->clk);
1c1008c793fa467 Florian Fainelli 2014-02-13  4144  =

0f50ce96b7c0488 Florian Fainelli 2014-06-26  4145  	err =3D register_netdev=
(dev);
0f50ce96b7c0488 Florian Fainelli 2014-06-26  4146  	if (err)
0f50ce96b7c0488 Florian Fainelli 2014-06-26  4147  		goto err;
0f50ce96b7c0488 Florian Fainelli 2014-06-26  4148  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4149  	return err;
1c1008c793fa467 Florian Fainelli 2014-02-13  4150  =

1c1008c793fa467 Florian Fainelli 2014-02-13  4151  err_clk_disable:
1c1008c793fa467 Florian Fainelli 2014-02-13  4152  	clk_disable_unprepare(p=
riv->clk);
1c1008c793fa467 Florian Fainelli 2014-02-13  4153  err:
1c1008c793fa467 Florian Fainelli 2014-02-13  4154  	free_netdev(dev);
1c1008c793fa467 Florian Fainelli 2014-02-13  4155  	return err;
1c1008c793fa467 Florian Fainelli 2014-02-13  4156  }
1c1008c793fa467 Florian Fainelli 2014-02-13  4157  =


:::::: The code at line 4039 was first introduced by commit
:::::: 8562056f267db98f5c078fcf7f071c8a4a752ef3 net: bcmgenet: request Wake=
-on-LAN interrupt

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5764841430734477241==--

