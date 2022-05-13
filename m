Content-Type: multipart/mixed; boundary="===============8438274322699679304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V12 7/9] regulator: Add a regulator driver for the PM8008 PMIC
Date: Fri, 13 May 2022 09:41:25 +0800
Message-ID: <202205130908.O31s3mhc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8438274322699679304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1652275113-10277-8-git-send-email-quic_c_skakit@quicinc.com>
References: <1652275113-10277-8-git-send-email-quic_c_skakit@quicinc.com>
TO: Satya Priya <quic_c_skakit@quicinc.com>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
CC: Lee Jones <lee.jones@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: linux-arm-msm(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: swboyd(a)chromium.org
CC: quic_collinsd(a)quicinc.com
CC: quic_subbaram(a)quicinc.com
CC: quic_jprakash(a)quicinc.com
CC: Satya Priya <quic_c_skakit@quicinc.com>

Hi Satya,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on robh/for-next broonie-regulator/for-next v5.18-=
rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Satya-Priya/Add-Qual=
comm-Technologies-Inc-PM8008-regulator-driver/20220511-212136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd=
-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-m031-20220512 (https://download.01.org/0day-ci/arc=
hive/20220513/202205130908.O31s3mhc-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/regulator/qcom-pm8008-regulator.c:174 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)

Old smatch warnings:
drivers/regulator/qcom-pm8008-regulator.c:175 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:176 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:178 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:180 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:180 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:182 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:186 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)
drivers/regulator/qcom-pm8008-regulator.c:196 pm8008_regulator_probe() erro=
r: buffer overflow 'reg_data' 7 <=3D 7 (assuming for loop doesn't break)

vim +174 drivers/regulator/qcom-pm8008-regulator.c

3337142527c77d Satya Priya 2022-05-11  121  =

3337142527c77d Satya Priya 2022-05-11  122  static int pm8008_regulator_pro=
be(struct platform_device *pdev)
3337142527c77d Satya Priya 2022-05-11  123  {
3337142527c77d Satya Priya 2022-05-11  124  	int rc, i;
3337142527c77d Satya Priya 2022-05-11  125  	u32 base;
3337142527c77d Satya Priya 2022-05-11  126  	unsigned int reg;
3337142527c77d Satya Priya 2022-05-11  127  	const char *name;
3337142527c77d Satya Priya 2022-05-11  128  	struct device *dev =3D &pdev->=
dev;
3337142527c77d Satya Priya 2022-05-11  129  	struct regulator_config reg_co=
nfig =3D {};
3337142527c77d Satya Priya 2022-05-11  130  	struct regulator_dev    *rdev;
3337142527c77d Satya Priya 2022-05-11  131  	const struct pm8008_data *chip=
 =3D dev_get_drvdata(pdev->dev.parent);
3337142527c77d Satya Priya 2022-05-11  132  	struct pm8008_regulator *pm800=
8_reg;
3337142527c77d Satya Priya 2022-05-11  133  =

3337142527c77d Satya Priya 2022-05-11  134  	pm8008_reg =3D devm_kzalloc(de=
v, sizeof(*pm8008_reg), GFP_KERNEL);
3337142527c77d Satya Priya 2022-05-11  135  	if (!pm8008_reg)
3337142527c77d Satya Priya 2022-05-11  136  		return -ENOMEM;
3337142527c77d Satya Priya 2022-05-11  137  =

3337142527c77d Satya Priya 2022-05-11  138  	pm8008_reg->regmap =3D pm8008_=
get_regmap(chip);
3337142527c77d Satya Priya 2022-05-11  139  	if (!pm8008_reg->regmap) {
3337142527c77d Satya Priya 2022-05-11  140  		dev_err(dev, "parent regmap i=
s missing\n");
3337142527c77d Satya Priya 2022-05-11  141  		return -EINVAL;
3337142527c77d Satya Priya 2022-05-11  142  	}
3337142527c77d Satya Priya 2022-05-11  143  =

3337142527c77d Satya Priya 2022-05-11  144  	pm8008_reg->dev =3D dev;
3337142527c77d Satya Priya 2022-05-11  145  =

3337142527c77d Satya Priya 2022-05-11  146  	rc =3D of_property_read_string=
(dev->of_node, "regulator-name", &name);
3337142527c77d Satya Priya 2022-05-11  147  	if (rc)
3337142527c77d Satya Priya 2022-05-11  148  		return rc;
3337142527c77d Satya Priya 2022-05-11  149  =

3337142527c77d Satya Priya 2022-05-11  150  	/* get the required regulator =
data */
3337142527c77d Satya Priya 2022-05-11  151  	for (i =3D 0; i < ARRAY_SIZE(r=
eg_data); i++)
3337142527c77d Satya Priya 2022-05-11  152  		if (strstr(name, reg_data[i].=
name))
3337142527c77d Satya Priya 2022-05-11  153  			break;
3337142527c77d Satya Priya 2022-05-11  154  =

3337142527c77d Satya Priya 2022-05-11  155  	rc =3D of_property_read_u32_in=
dex(dev->of_node, "reg", 1, &base);
3337142527c77d Satya Priya 2022-05-11  156  	if (rc < 0) {
3337142527c77d Satya Priya 2022-05-11  157  		dev_err(dev, "%s: failed to g=
et regulator base rc=3D%d\n", name, rc);
3337142527c77d Satya Priya 2022-05-11  158  		return rc;
3337142527c77d Satya Priya 2022-05-11  159  	}
3337142527c77d Satya Priya 2022-05-11  160  	pm8008_reg->base =3D base;
3337142527c77d Satya Priya 2022-05-11  161  =

3337142527c77d Satya Priya 2022-05-11  162  	/* get slew rate */
3337142527c77d Satya Priya 2022-05-11  163  	rc =3D regmap_bulk_read(pm8008=
_reg->regmap,
3337142527c77d Satya Priya 2022-05-11  164  			LDO_STEPPER_CTL_REG(pm8008_r=
eg->base), &reg, 1);
3337142527c77d Satya Priya 2022-05-11  165  	if (rc < 0) {
3337142527c77d Satya Priya 2022-05-11  166  		dev_err(dev, "failed to read =
step rate configuration rc=3D%d\n", rc);
3337142527c77d Satya Priya 2022-05-11  167  		return rc;
3337142527c77d Satya Priya 2022-05-11  168  	}
3337142527c77d Satya Priya 2022-05-11  169  	reg &=3D STEP_RATE_MASK;
3337142527c77d Satya Priya 2022-05-11  170  	pm8008_reg->step_rate =3D DEFA=
ULT_VOLTAGE_STEPPER_RATE >> reg;
3337142527c77d Satya Priya 2022-05-11  171  =

3337142527c77d Satya Priya 2022-05-11  172  	pm8008_reg->rdesc.type =3D REG=
ULATOR_VOLTAGE;
3337142527c77d Satya Priya 2022-05-11  173  	pm8008_reg->rdesc.ops =3D &pm8=
008_regulator_ops;
3337142527c77d Satya Priya 2022-05-11 @174  	pm8008_reg->rdesc.name =3D reg=
_data[i].name;
3337142527c77d Satya Priya 2022-05-11  175  	pm8008_reg->rdesc.supply_name =
=3D reg_data[i].supply_name;
3337142527c77d Satya Priya 2022-05-11  176  	pm8008_reg->rdesc.of_match =3D=
 reg_data[i].name;
3337142527c77d Satya Priya 2022-05-11  177  	pm8008_reg->rdesc.uV_step =3D =
VSET_STEP_UV;
3337142527c77d Satya Priya 2022-05-11  178  	pm8008_reg->rdesc.min_uV =3D r=
eg_data[i].min_uv;
3337142527c77d Satya Priya 2022-05-11  179  	pm8008_reg->rdesc.n_voltages
3337142527c77d Satya Priya 2022-05-11  180  		=3D ((reg_data[i].max_uv - re=
g_data[i].min_uv)
3337142527c77d Satya Priya 2022-05-11  181  			/ pm8008_reg->rdesc.uV_step)=
 + 1;
3337142527c77d Satya Priya 2022-05-11  182  	pm8008_reg->rdesc.linear_range=
s =3D reg_data[i].voltage_range;
3337142527c77d Satya Priya 2022-05-11  183  	pm8008_reg->rdesc.n_linear_ran=
ges =3D 1;
3337142527c77d Satya Priya 2022-05-11  184  	pm8008_reg->rdesc.enable_reg =
=3D LDO_ENABLE_REG(pm8008_reg->base);
3337142527c77d Satya Priya 2022-05-11  185  	pm8008_reg->rdesc.enable_mask =
=3D ENABLE_BIT;
3337142527c77d Satya Priya 2022-05-11  186  	pm8008_reg->rdesc.min_dropout_=
uV =3D reg_data[i].min_dropout_uv;
3337142527c77d Satya Priya 2022-05-11  187  	pm8008_reg->voltage_selector =
=3D -ENOTRECOVERABLE;
3337142527c77d Satya Priya 2022-05-11  188  =

3337142527c77d Satya Priya 2022-05-11  189  	reg_config.dev =3D dev->parent;
3337142527c77d Satya Priya 2022-05-11  190  	reg_config.driver_data =3D pm8=
008_reg;
3337142527c77d Satya Priya 2022-05-11  191  	reg_config.regmap =3D pm8008_r=
eg->regmap;
3337142527c77d Satya Priya 2022-05-11  192  =

3337142527c77d Satya Priya 2022-05-11  193  	rdev =3D devm_regulator_regist=
er(dev, &pm8008_reg->rdesc, &reg_config);
3337142527c77d Satya Priya 2022-05-11  194  	if (IS_ERR(rdev)) {
3337142527c77d Satya Priya 2022-05-11  195  		rc =3D PTR_ERR(rdev);
3337142527c77d Satya Priya 2022-05-11  196  		dev_err(dev, "%s: failed to r=
egister regulator rc=3D%d\n",
3337142527c77d Satya Priya 2022-05-11  197  				reg_data[i].name, rc);
3337142527c77d Satya Priya 2022-05-11  198  		return rc;
3337142527c77d Satya Priya 2022-05-11  199  	}
3337142527c77d Satya Priya 2022-05-11  200  =

3337142527c77d Satya Priya 2022-05-11  201  	return 0;
3337142527c77d Satya Priya 2022-05-11  202  }
3337142527c77d Satya Priya 2022-05-11  203  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8438274322699679304==--

