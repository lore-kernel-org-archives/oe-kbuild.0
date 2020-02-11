Content-Type: multipart/mixed; boundary="===============5820283705161417524=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 1249/1397] drivers/hwmon/axi-fan-control.c:418 axi_fan_control_probe() error: potentially dereferencing uninitialized 'res'.
Date: Tue, 11 Feb 2020 13:46:42 +0300
Message-ID: <20200211104642.GA7838@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5820283705161417524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ac431e2d7b1be81bfe58163b9f81ba79bc987dc3
commit: 690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2 [1249/1397] hwmon: Support=
 ADI Fan Control IP

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/axi-fan-control.c:418 axi_fan_control_probe() error: potentia=
lly dereferencing uninitialized 'res'.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2
vim +/res +418 drivers/hwmon/axi-fan-control.c

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  386  static int axi_fan_control_pro=
be(struct platform_device *pdev)
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  387  {
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  388  	struct axi_fan_control_data *=
ctl;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  389  	struct clk *clk;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  390  	const struct of_device_id *id;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  391  	const char *name =3D "axi_fan=
_control";
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  392  	struct resource *res;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  393  	u32 version;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  394  	int ret;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  395  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  396  	id =3D of_match_node(axi_fan_=
control_of_match, pdev->dev.of_node);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  397  	if (!id)
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  398  		return -EINVAL;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  399  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  400  	ctl =3D devm_kzalloc(&pdev->d=
ev, sizeof(*ctl), GFP_KERNEL);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  401  	if (!ctl)
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  402  		return -ENOMEM;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  403  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  404  	ctl->base =3D devm_platform_i=
oremap_resource(pdev, 0);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  405  	if (IS_ERR(ctl->base))
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  406  		return PTR_ERR(ctl->base);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  407  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  408  	clk =3D devm_clk_get(&pdev->d=
ev, NULL);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  409  	if (IS_ERR(clk)) {
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  410  		dev_err(&pdev->dev, "clk_get=
 failed with %ld\n", PTR_ERR(clk));
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  411  		return PTR_ERR(clk);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  412  	}
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  413  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  414  	ctl->clk_rate =3D clk_get_rat=
e(clk);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  415  	if (!ctl->clk_rate)
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  416  		return -EINVAL;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  417  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09 @418  	dev_dbg(&pdev->dev, "Re-mappe=
d from 0x%08llX to %p\n",
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  419  		(unsigned long long)res->sta=
rt, ctl->base);
                                                                           =
 ^^^^^^^^^^
"res" is never set or used anywhere.

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  420  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  421  	version =3D axi_ioread(ADI_AX=
I_REG_VERSION, ctl);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  422  	if (ADI_AXI_PCORE_VER_MAJOR(v=
ersion) !=3D
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  423  	    ADI_AXI_PCORE_VER_MAJOR((=
*(u32 *)id->data))) {
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  424  		dev_err(&pdev->dev, "Major v=
ersion mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  425  			ADI_AXI_PCORE_VER_MAJOR((*(=
u32 *)id->data)),
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  426  			ADI_AXI_PCORE_VER_MINOR((*(=
u32 *)id->data)),
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  427  			ADI_AXI_PCORE_VER_PATCH((*(=
u32 *)id->data)),
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  428  			ADI_AXI_PCORE_VER_MAJOR(ver=
sion),
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  429  			ADI_AXI_PCORE_VER_MINOR(ver=
sion),
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  430  			ADI_AXI_PCORE_VER_PATCH(ver=
sion));
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  431  		return -ENODEV;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  432  	}
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  433  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  434  	ctl->irq =3D platform_get_irq=
(pdev, 0);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  435  	if (ctl->irq < 0)
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  436  		return ctl->irq;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  437  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  438  	ret =3D devm_request_threaded=
_irq(&pdev->dev, ctl->irq, NULL,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  439  					axi_fan_control_irq_handl=
er,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  440  					IRQF_ONESHOT | IRQF_TRIGG=
ER_HIGH,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  441  					pdev->driver_override, ct=
l);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  442  	if (ret) {
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  443  		dev_err(&pdev->dev, "failed =
to request an irq, %d", ret);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  444  		return ret;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  445  	}
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  446  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  447  	ret =3D axi_fan_control_init(=
ctl, pdev->dev.of_node);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  448  	if (ret) {
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  449  		dev_err(&pdev->dev, "Failed =
to initialize device\n");
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  450  		return ret;
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  451  	}
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  452  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  453  	ctl->hdev =3D devm_hwmon_devi=
ce_register_with_info(&pdev->dev,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  454  							 name,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  455  							 ctl,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  456  							 &axi_chip_info,
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  457  							 NULL);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  458  =

690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  459  	return PTR_ERR_OR_ZERO(ctl->h=
dev);
690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  460  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5820283705161417524==--

