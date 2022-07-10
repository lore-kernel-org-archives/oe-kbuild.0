Content-Type: multipart/mixed; boundary="===============7931022210807796390=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 1095/1208] drivers/clk/clk-xlnx-clock-wizard-v.c:668:16-24: ERROR: reference preceded by free on line 650
Date: Sun, 10 Jul 2022 21:25:02 +0800
Message-ID: <202207102112.zjlU3igG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7931022210807796390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Wilken Gottwalt <wilken.gottwalt@posteo.net>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   e7187edf49c883a9b51f102175d5b6b135a5c11e
commit: 94e73979d5943bc6494bdea22c5a0f295d2dde83 [1095/1208] clk: clk-xlnx-=
clock-wizard-v: fix missing bitfield include
:::::: branch date: 10 days ago
:::::: commit date: 3 months ago
config: h8300-randconfig-c023-20220710 (https://download.01.org/0day-ci/arc=
hive/20220710/202207102112.zjlU3igG-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-xlnx-clock-wizard-v.c:668:16-24: ERROR: reference preced=
ed by free on line 650

vim +668 drivers/clk/clk-xlnx-clock-wizard-v.c

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  540  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  541  static SIMPLE_DEV_PM_OPS=
(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  542  			 clk_wzrd_resume);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  543  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  544  static int clk_wzrd_prob=
e(struct platform_device *pdev)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  545  {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  546  	int i, ret;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  547  	u32 regl, regh, edge, m=
ult;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  548  	u32 regld, reghd, edged=
, div;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  549  	unsigned long rate;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  550  	const char *clk_name;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  551  	struct clk_wzrd *clk_wz=
rd;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  552  	struct resource *mem;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  553  	int outputs;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  554  	struct device_node *np =
=3D pdev->dev.of_node;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  555  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  556  	clk_wzrd =3D devm_kzall=
oc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  557  	if (!clk_wzrd)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  558  		return -ENOMEM;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  559  	platform_set_drvdata(pd=
ev, clk_wzrd);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  560  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  561  	mem =3D platform_get_re=
source(pdev, IORESOURCE_MEM, 0);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  562  	clk_wzrd->base =3D devm=
_ioremap_resource(&pdev->dev, mem);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  563  	if (IS_ERR(clk_wzrd->ba=
se))
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  564  		return PTR_ERR(clk_wzr=
d->base);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  565  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  566  	clk_wzrd->clk_in1 =3D d=
evm_clk_get(&pdev->dev, "clk_in1");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  567  	if (IS_ERR(clk_wzrd->cl=
k_in1)) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  568  		if (clk_wzrd->clk_in1 =
!=3D ERR_PTR(-EPROBE_DEFER))
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  569  			dev_err(&pdev->dev, "=
clk_in1 not found\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  570  		return PTR_ERR(clk_wzr=
d->clk_in1);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  571  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  572  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  573  	clk_wzrd->axi_clk =3D d=
evm_clk_get(&pdev->dev, "s_axi_aclk");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  574  	if (IS_ERR(clk_wzrd->ax=
i_clk)) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  575  		if (clk_wzrd->axi_clk =
!=3D ERR_PTR(-EPROBE_DEFER))
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  576  			dev_err(&pdev->dev, "=
s_axi_aclk not found\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  577  		return PTR_ERR(clk_wzr=
d->axi_clk);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  578  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  579  	ret =3D clk_prepare_ena=
ble(clk_wzrd->axi_clk);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  580  	if (ret) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  581  		dev_err(&pdev->dev, "e=
nabling s_axi_aclk failed\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  582  		return ret;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  583  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  584  	rate =3D clk_get_rate(c=
lk_wzrd->axi_clk);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  585  	if (rate > WZRD_ACLK_MA=
X_FREQ) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  586  		dev_err(&pdev->dev, "s=
_axi_aclk frequency (%lu) too high\n",
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  587  			rate);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  588  		ret =3D -EINVAL;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  589  		goto err_disable_clk;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  590  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  591  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  592  	outputs =3D of_property=
_count_strings(np, "clock-output-names");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  593  	clk_name =3D kasprintf(=
GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  594  	if (!clk_name) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  595  		ret =3D -ENOMEM;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  596  		goto err_rm_int_clk;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  597  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  598  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  599  	if (outputs =3D=3D 1) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  600  		const char *clkout_nam=
e;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  601  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  602  		if (of_property_read_s=
tring_index(np, "clock-output-names", i,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  603  						  &clkout_name)) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  604  			dev_err(&pdev->dev,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  605  				"clock output name n=
ot specified\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  606  			ret =3D -EINVAL;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  607  			goto err_rm_int_clks;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  608  		}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  609  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  610  		clk_wzrd->clkout[0] =
=3D clk_wzrd_register_divider
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  611  				(&pdev->dev, clkout_=
name,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  612  				__clk_get_name(clk_w=
zrd->clk_in1), 0,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  613  				clk_wzrd->base, WZRD=
_CLK_CFG_REG(3),
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  614  				WZRD_CLKOUT_DIVIDE_S=
HIFT,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  615  				WZRD_CLKOUT_DIVIDE_W=
IDTH,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  616  				CLK_DIVIDER_ONE_BASE=
D | CLK_DIVIDER_ALLOW_ZERO,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  617  				DIV_ALL, &clkwzrd_lo=
ck);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  618  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  619  		goto out;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  620  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  621  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  622  	/* register multiplier =
*/
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  623  	edge =3D !!(readl(clk_w=
zrd->base + WZRD_CLK_CFG_REG(0)) & BIT(8));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  624  	regl =3D (readl(clk_wzr=
d->base + WZRD_CLK_CFG_REG(1)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  625  		     WZRD_CLKFBOUT_L_M=
ASK) >> WZRD_CLKFBOUT_L_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  626  	regh =3D (readl(clk_wzr=
d->base + WZRD_CLK_CFG_REG(1)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  627  		     WZRD_CLKFBOUT_H_M=
ASK) >> WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  628  	mult =3D (regl  + regh =
+ edge);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  629  	if (!mult)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  630  		mult =3D 1;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  631  	mult =3D mult * 64;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  632  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  633  	regl =3D readl(clk_wzrd=
->base + WZRD_CLK_CFG_REG(51)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  634  		     WZRD_CLKFBOUT_FRA=
C_EN;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  635  	if (regl) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  636  		regl =3D readl(clk_wzr=
d->base + WZRD_CLK_CFG_REG(48)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  637  			WZRD_CLKFBOUT_FRAC_MA=
SK;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  638  		mult =3D mult + regl;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  639  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  640  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  641  	clk_name =3D kasprintf(=
GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  642  	if (!clk_name) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  643  		ret =3D -ENOMEM;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  644  		goto err_disable_clk;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  645  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  646  	clk_wzrd->clks_internal=
[wzrd_clk_mul] =3D clk_register_fixed_factor
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  647  			(&pdev->dev, clk_name,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  648  			 __clk_get_name(clk_w=
zrd->clk_in1),
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  649  			0, mult, 64);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31 @650  	kfree(clk_name);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  651  	if (IS_ERR(clk_wzrd->cl=
ks_internal[wzrd_clk_mul])) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  652  		dev_err(&pdev->dev, "u=
nable to register fixed-factor clock\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  653  		ret =3D PTR_ERR(clk_wz=
rd->clks_internal[wzrd_clk_mul]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  654  		goto err_disable_clk;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  655  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  656  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  657  	/* register div */
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  658  	edged =3D !!(readl(clk_=
wzrd->base + WZRD_CLK_CFG_REG(20)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  659  		     BIT(10));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  660  	regld =3D (readl(clk_wz=
rd->base + WZRD_CLK_CFG_REG(21)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  661  		     WZRD_CLKFBOUT_L_M=
ASK) >> WZRD_CLKFBOUT_L_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  662  	reghd =3D (readl(clk_wz=
rd->base + WZRD_CLK_CFG_REG(21)) &
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  663  		     WZRD_CLKFBOUT_H_M=
ASK) >> WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  664  	div =3D (regld  + reghd=
 + edged);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  665  	if (!div)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  666  		div =3D 1;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  667  	clk_wzrd->clks_internal=
[wzrd_clk_mul_div] =3D clk_register_fixed_factor
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31 @668  			(&pdev->dev, clk_name,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  669  			 __clk_get_name(clk_w=
zrd->clks_internal[wzrd_clk_mul]),
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  670  			0, 1, div);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  671  	if (IS_ERR(clk_wzrd->cl=
ks_internal[wzrd_clk_mul_div])) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  672  		dev_err(&pdev->dev, "u=
nable to register divider clock\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  673  		ret =3D PTR_ERR(clk_wz=
rd->clks_internal[wzrd_clk_mul_div]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  674  		goto err_rm_int_clk;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  675  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  676  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  677  	/* register div per out=
put */
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  678  	for (i =3D outputs - 1;=
 i >=3D 0 ; i--) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  679  		const char *clkout_nam=
e;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  680  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  681  		if (of_property_read_s=
tring_index(np, "clock-output-names", i,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  682  						  &clkout_name)) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  683  			dev_err(&pdev->dev,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  684  				"clock output name n=
ot specified\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  685  			ret =3D -EINVAL;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  686  			goto err_rm_int_clks;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  687  		}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  688  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  689  			clk_wzrd->clkout[i] =
=3D clk_wzrd_register_divider
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  690  				(&pdev->dev, clkout_=
name,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  691  				clk_name, 0,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  692  				clk_wzrd->base, (WZR=
D_CLK_CFG_REG(3) + i * 8),
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  693  				WZRD_CLKOUT_DIVIDE_S=
HIFT,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  694  				WZRD_CLKOUT_DIVIDE_W=
IDTH,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  695  				CLK_DIVIDER_ONE_BASE=
D | CLK_DIVIDER_ALLOW_ZERO,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  696  				DIV_O, &clkwzrd_lock=
);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  697  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  698  		if (IS_ERR(clk_wzrd->c=
lkout[i])) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  699  			int j;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  700  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  701  			for (j =3D i + 1; j <=
 outputs; j++)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  702  				clk_unregister(clk_w=
zrd->clkout[j]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  703  			dev_err(&pdev->dev,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  704  				"unable to register =
divider clock\n");
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  705  			ret =3D PTR_ERR(clk_w=
zrd->clkout[i]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  706  			goto err_rm_int_clks;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  707  		}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  708  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  709  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  710  	kfree(clk_name);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  711  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  712  out:
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  713  	clk_wzrd->clk_data.clks=
 =3D clk_wzrd->clkout;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  714  	clk_wzrd->clk_data.clk_=
num =3D ARRAY_SIZE(clk_wzrd->clkout);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  715  	of_clk_add_provider(np,=
 of_clk_src_onecell_get, &clk_wzrd->clk_data);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  716  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  717  	return 0;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  718  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  719  err_rm_int_clks:
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  720  	clk_unregister(clk_wzrd=
->clks_internal[1]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  721  err_rm_int_clk:
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  722  	kfree(clk_name);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  723  	clk_unregister(clk_wzrd=
->clks_internal[0]);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  724  err_disable_clk:
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  725  	clk_disable_unprepare(c=
lk_wzrd->axi_clk);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  726  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  727  	return ret;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  728  }
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  729  =


:::::: The code at line 668 was first introduced by commit
:::::: 8b5383767cb4c856283824baee568f4286ecc0db clocking-wizard: Add versal=
 clocking wizard support

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7931022210807796390==--

