Content-Type: multipart/mixed; boundary="===============3534786625392910609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 4/4] thermal: k3_j72xx_bandgap: Add the bandgap driver support
Date: Tue, 03 May 2022 01:02:37 +0800
Message-ID: <202205030045.5GxgWkst-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3534786625392910609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427064635.24898-5-j-keerthy@ti.com>
References: <20220427064635.24898-5-j-keerthy@ti.com>
TO: Keerthy <j-keerthy@ti.com>
TO: robh+dt(a)kernel.org
TO: daniel.lezcano(a)linaro.org
TO: rui.zhang(a)intel.com
TO: amitk(a)kernel.org
TO: kristo(a)kernel.org
TO: vigneshr(a)ti.com
TO: krzysztof.kozlowski(a)linaro.org
CC: j-keerthy(a)ti.com
CC: linux-pm(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Keerthy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rafael-pm/thermal v5.18-rc5 next-20220502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Keerthy/thermal-k3_j=
72xx_bandgap-Add-the-bandgap-driver-support/20220427-144949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-m031-20220501 (https://download.01.org/0day-ci/archi=
ve/20220503/202205030045.5GxgWkst-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/k3_j72xx_bandgap.c:521 k3_j72xx_bandgap_probe() warn: possi=
ble memory leak of 'ref_table'

vim +/ref_table +521 drivers/thermal/k3_j72xx_bandgap.c

bb7f95a68cbaa1 Keerthy 2022-04-27  354  =

bb7f95a68cbaa1 Keerthy 2022-04-27  355  static int k3_j72xx_bandgap_probe(s=
truct platform_device *pdev)
bb7f95a68cbaa1 Keerthy 2022-04-27  356  {
bb7f95a68cbaa1 Keerthy 2022-04-27  357  	int ret =3D 0, cnt, val, id;
bb7f95a68cbaa1 Keerthy 2022-04-27  358  	int high_max, low_temp;
bb7f95a68cbaa1 Keerthy 2022-04-27  359  	struct resource *res;
bb7f95a68cbaa1 Keerthy 2022-04-27  360  	struct device *dev =3D &pdev->dev;
bb7f95a68cbaa1 Keerthy 2022-04-27  361  	struct k3_j72xx_bandgap *bgp;
bb7f95a68cbaa1 Keerthy 2022-04-27  362  	struct k3_thermal_data *data;
bb7f95a68cbaa1 Keerthy 2022-04-27  363  	int workaround_needed =3D 0;
bb7f95a68cbaa1 Keerthy 2022-04-27  364  	const struct k3_j72xx_bandgap_data=
 *driver_data;
bb7f95a68cbaa1 Keerthy 2022-04-27  365  	struct thermal_zone_device *ti_the=
rmal;
bb7f95a68cbaa1 Keerthy 2022-04-27  366  	int *ref_table;
bb7f95a68cbaa1 Keerthy 2022-04-27  367  	struct err_values err_vals;
bb7f95a68cbaa1 Keerthy 2022-04-27  368  =

bb7f95a68cbaa1 Keerthy 2022-04-27  369  	const s64 golden_factors[] =3D {
bb7f95a68cbaa1 Keerthy 2022-04-27  370  		-490019999999999936,
bb7f95a68cbaa1 Keerthy 2022-04-27  371  		3251200000000000,
bb7f95a68cbaa1 Keerthy 2022-04-27  372  		-1705800000000,
bb7f95a68cbaa1 Keerthy 2022-04-27  373  		603730000,
bb7f95a68cbaa1 Keerthy 2022-04-27  374  		-92627,
bb7f95a68cbaa1 Keerthy 2022-04-27  375  	};
bb7f95a68cbaa1 Keerthy 2022-04-27  376  =

bb7f95a68cbaa1 Keerthy 2022-04-27  377  	const s64 pvt_wa_factors[] =3D {
bb7f95a68cbaa1 Keerthy 2022-04-27  378  		-415230000000000000,
bb7f95a68cbaa1 Keerthy 2022-04-27  379  		3126600000000000,
bb7f95a68cbaa1 Keerthy 2022-04-27  380  		-1157800000000,
bb7f95a68cbaa1 Keerthy 2022-04-27  381  	};
bb7f95a68cbaa1 Keerthy 2022-04-27  382  =

bb7f95a68cbaa1 Keerthy 2022-04-27  383  	bgp =3D devm_kzalloc(&pdev->dev, s=
izeof(*bgp), GFP_KERNEL);
bb7f95a68cbaa1 Keerthy 2022-04-27  384  	if (!bgp)
bb7f95a68cbaa1 Keerthy 2022-04-27  385  		return -ENOMEM;
bb7f95a68cbaa1 Keerthy 2022-04-27  386  =

bb7f95a68cbaa1 Keerthy 2022-04-27  387  	bgp->dev =3D dev;
bb7f95a68cbaa1 Keerthy 2022-04-27  388  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 0);
bb7f95a68cbaa1 Keerthy 2022-04-27  389  	bgp->base =3D devm_ioremap_resourc=
e(dev, res);
bb7f95a68cbaa1 Keerthy 2022-04-27  390  	if (IS_ERR(bgp->base))
bb7f95a68cbaa1 Keerthy 2022-04-27  391  		return PTR_ERR(bgp->base);
bb7f95a68cbaa1 Keerthy 2022-04-27  392  =

bb7f95a68cbaa1 Keerthy 2022-04-27  393  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 1);
bb7f95a68cbaa1 Keerthy 2022-04-27  394  	bgp->cfg2_base =3D devm_ioremap_re=
source(dev, res);
bb7f95a68cbaa1 Keerthy 2022-04-27  395  	if (IS_ERR(bgp->cfg2_base))
bb7f95a68cbaa1 Keerthy 2022-04-27  396  		return PTR_ERR(bgp->cfg2_base);
bb7f95a68cbaa1 Keerthy 2022-04-27  397  =

bb7f95a68cbaa1 Keerthy 2022-04-27  398  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 2);
bb7f95a68cbaa1 Keerthy 2022-04-27  399  	bgp->fuse_base =3D devm_ioremap_re=
source(dev, res);
bb7f95a68cbaa1 Keerthy 2022-04-27  400  	if (IS_ERR(bgp->fuse_base))
bb7f95a68cbaa1 Keerthy 2022-04-27  401  		return PTR_ERR(bgp->fuse_base);
bb7f95a68cbaa1 Keerthy 2022-04-27  402  =

bb7f95a68cbaa1 Keerthy 2022-04-27  403  	driver_data =3D of_device_get_matc=
h_data(dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  404  	if (driver_data)
bb7f95a68cbaa1 Keerthy 2022-04-27  405  		workaround_needed =3D driver_data=
->has_errata_i2128;
bb7f95a68cbaa1 Keerthy 2022-04-27  406  =

bb7f95a68cbaa1 Keerthy 2022-04-27  407  	pm_runtime_enable(dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  408  	ret =3D pm_runtime_get_sync(dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  409  	if (ret < 0) {
bb7f95a68cbaa1 Keerthy 2022-04-27  410  		pm_runtime_put_noidle(dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  411  		pm_runtime_disable(dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  412  		return ret;
bb7f95a68cbaa1 Keerthy 2022-04-27  413  	}
bb7f95a68cbaa1 Keerthy 2022-04-27  414  =

bb7f95a68cbaa1 Keerthy 2022-04-27  415  	/* Get the sensor count in the VTM=
 */
bb7f95a68cbaa1 Keerthy 2022-04-27  416  	val =3D readl(bgp->base + K3_VTM_D=
EVINFO_PWR0_OFFSET);
bb7f95a68cbaa1 Keerthy 2022-04-27  417  	cnt =3D val & K3_VTM_DEVINFO_PWR0_=
TEMPSENS_CT_MASK;
bb7f95a68cbaa1 Keerthy 2022-04-27  418  	cnt >>=3D __ffs(K3_VTM_DEVINFO_PWR=
0_TEMPSENS_CT_MASK);
bb7f95a68cbaa1 Keerthy 2022-04-27  419  =

bb7f95a68cbaa1 Keerthy 2022-04-27  420  	data =3D devm_kcalloc(bgp->dev, cn=
t, sizeof(*data), GFP_KERNEL);
bb7f95a68cbaa1 Keerthy 2022-04-27  421  	if (!data) {
bb7f95a68cbaa1 Keerthy 2022-04-27  422  		ret =3D -ENOMEM;
bb7f95a68cbaa1 Keerthy 2022-04-27  423  		goto err_alloc;
bb7f95a68cbaa1 Keerthy 2022-04-27  424  	}
bb7f95a68cbaa1 Keerthy 2022-04-27  425  =

bb7f95a68cbaa1 Keerthy 2022-04-27  426  	ref_table =3D kzalloc(sizeof(*ref_=
table) * TABLE_SIZE, GFP_KERNEL);
bb7f95a68cbaa1 Keerthy 2022-04-27  427  	if (!ref_table) {
bb7f95a68cbaa1 Keerthy 2022-04-27  428  		ret =3D -ENOMEM;
bb7f95a68cbaa1 Keerthy 2022-04-27  429  		goto err_alloc;
bb7f95a68cbaa1 Keerthy 2022-04-27  430  	}
bb7f95a68cbaa1 Keerthy 2022-04-27  431  =

bb7f95a68cbaa1 Keerthy 2022-04-27  432  	derived_table =3D devm_kzalloc(bgp=
->dev, sizeof(*derived_table) * TABLE_SIZE,
bb7f95a68cbaa1 Keerthy 2022-04-27  433  				     GFP_KERNEL);
bb7f95a68cbaa1 Keerthy 2022-04-27  434  	if (!derived_table) {
bb7f95a68cbaa1 Keerthy 2022-04-27  435  		ret =3D -ENOMEM;
bb7f95a68cbaa1 Keerthy 2022-04-27  436  		goto err_alloc;
bb7f95a68cbaa1 Keerthy 2022-04-27  437  	}
bb7f95a68cbaa1 Keerthy 2022-04-27  438  =

bb7f95a68cbaa1 Keerthy 2022-04-27  439  	/* Workaround not needed if bit30/=
bit31 is set even for J721e */
bb7f95a68cbaa1 Keerthy 2022-04-27  440  	if (workaround_needed && (readl(bg=
p->fuse_base + 0x0) & 0xc0000000) =3D=3D 0xc0000000)
bb7f95a68cbaa1 Keerthy 2022-04-27  441  		workaround_needed =3D false;
bb7f95a68cbaa1 Keerthy 2022-04-27  442  =

bb7f95a68cbaa1 Keerthy 2022-04-27  443  	dev_dbg(bgp->dev, "Work around %sn=
eeded\n",
bb7f95a68cbaa1 Keerthy 2022-04-27  444  		workaround_needed ? "not " : "");
bb7f95a68cbaa1 Keerthy 2022-04-27  445  =

bb7f95a68cbaa1 Keerthy 2022-04-27  446  	if (!workaround_needed)
bb7f95a68cbaa1 Keerthy 2022-04-27  447  		init_table(5, ref_table, golden_f=
actors);
bb7f95a68cbaa1 Keerthy 2022-04-27  448  	else
bb7f95a68cbaa1 Keerthy 2022-04-27  449  		init_table(3, ref_table, pvt_wa_f=
actors);
bb7f95a68cbaa1 Keerthy 2022-04-27  450  =

bb7f95a68cbaa1 Keerthy 2022-04-27  451  	/* Register the thermal sensors */
bb7f95a68cbaa1 Keerthy 2022-04-27  452  	for (id =3D 0; id < cnt; id++) {
bb7f95a68cbaa1 Keerthy 2022-04-27  453  		data[id].bgp =3D bgp;
bb7f95a68cbaa1 Keerthy 2022-04-27  454  		data[id].ctrl_offset =3D K3_VTM_T=
MPSENS0_CTRL_OFFSET + id * 0x20;
bb7f95a68cbaa1 Keerthy 2022-04-27  455  		data[id].stat_offset =3D data[id]=
.ctrl_offset +
bb7f95a68cbaa1 Keerthy 2022-04-27  456  					K3_VTM_TMPSENS_STAT_OFFSET;
bb7f95a68cbaa1 Keerthy 2022-04-27  457  =

bb7f95a68cbaa1 Keerthy 2022-04-27  458  		if (workaround_needed) {
bb7f95a68cbaa1 Keerthy 2022-04-27  459  			/* ref adc values for -40C, 30C =
& 125C respectively */
bb7f95a68cbaa1 Keerthy 2022-04-27  460  			err_vals.refs[0] =3D MINUS40CREF;
bb7f95a68cbaa1 Keerthy 2022-04-27  461  			err_vals.refs[1] =3D PLUS30CREF;
bb7f95a68cbaa1 Keerthy 2022-04-27  462  			err_vals.refs[2] =3D PLUS125CREF;
bb7f95a68cbaa1 Keerthy 2022-04-27  463  			err_vals.refs[3] =3D PLUS150CREF;
bb7f95a68cbaa1 Keerthy 2022-04-27  464  			get_efuse_values(id, &data[id], =
err_vals.errs, bgp);
bb7f95a68cbaa1 Keerthy 2022-04-27  465  		}
bb7f95a68cbaa1 Keerthy 2022-04-27  466  =

bb7f95a68cbaa1 Keerthy 2022-04-27  467  		if (id =3D=3D 0 && workaround_nee=
ded)
bb7f95a68cbaa1 Keerthy 2022-04-27  468  			prep_lookup_table(&err_vals, ref=
_table);
bb7f95a68cbaa1 Keerthy 2022-04-27  469  		else if (id =3D=3D 0 && !workarou=
nd_needed)
bb7f95a68cbaa1 Keerthy 2022-04-27  470  			memcpy(derived_table, ref_table,=
 TABLE_SIZE * 4);
bb7f95a68cbaa1 Keerthy 2022-04-27  471  =

bb7f95a68cbaa1 Keerthy 2022-04-27  472  		val =3D readl(data[id].bgp->cfg2_=
base + data[id].ctrl_offset);
bb7f95a68cbaa1 Keerthy 2022-04-27  473  		val |=3D (K3_VTM_TMPSENS_CTRL_MAX=
T_OUTRG_EN |
bb7f95a68cbaa1 Keerthy 2022-04-27  474  			K3_VTM_TMPSENS_CTRL_SOC |
bb7f95a68cbaa1 Keerthy 2022-04-27  475  			K3_VTM_TMPSENS_CTRL_CLRZ | BIT(4=
));
bb7f95a68cbaa1 Keerthy 2022-04-27  476  		writel(val, data[id].bgp->cfg2_ba=
se + data[id].ctrl_offset);
bb7f95a68cbaa1 Keerthy 2022-04-27  477  =

bb7f95a68cbaa1 Keerthy 2022-04-27  478  		bgp->ts_data[id] =3D &data[id];
bb7f95a68cbaa1 Keerthy 2022-04-27  479  		ti_thermal =3D
bb7f95a68cbaa1 Keerthy 2022-04-27  480  		devm_thermal_zone_of_sensor_regis=
ter(bgp->dev, id,
bb7f95a68cbaa1 Keerthy 2022-04-27  481  						     &data[id],
bb7f95a68cbaa1 Keerthy 2022-04-27  482  						     &k3_of_thermal_ops);
bb7f95a68cbaa1 Keerthy 2022-04-27  483  		if (IS_ERR(ti_thermal)) {
bb7f95a68cbaa1 Keerthy 2022-04-27  484  			dev_err(bgp->dev, "thermal zone =
device is NULL\n");
bb7f95a68cbaa1 Keerthy 2022-04-27  485  			ret =3D PTR_ERR(ti_thermal);
bb7f95a68cbaa1 Keerthy 2022-04-27  486  			goto err_alloc;
bb7f95a68cbaa1 Keerthy 2022-04-27  487  		}
bb7f95a68cbaa1 Keerthy 2022-04-27  488  	}
bb7f95a68cbaa1 Keerthy 2022-04-27  489  =

bb7f95a68cbaa1 Keerthy 2022-04-27  490  	/*
bb7f95a68cbaa1 Keerthy 2022-04-27  491  	 * Program TSHUT thresholds
bb7f95a68cbaa1 Keerthy 2022-04-27  492  	 * Step 1: set the thresholds to ~=
123C and 105C WKUP_VTM_MISC_CTRL2
bb7f95a68cbaa1 Keerthy 2022-04-27  493  	 * Step 2: WKUP_VTM_TMPSENS_CTRL_j=
 set the MAXT_OUTRG_EN  bit
bb7f95a68cbaa1 Keerthy 2022-04-27  494  	 *         This is already taken c=
are as per of init
bb7f95a68cbaa1 Keerthy 2022-04-27  495  	 * Step 3: WKUP_VTM_MISC_CTRL set =
the ANYMAXT_OUTRG_ALERT_EN  bit
bb7f95a68cbaa1 Keerthy 2022-04-27  496  	 */
bb7f95a68cbaa1 Keerthy 2022-04-27  497  	high_max =3D k3_j72xx_bandgap_temp=
_to_adc_code(MAX_TEMP);
bb7f95a68cbaa1 Keerthy 2022-04-27  498  	low_temp =3D k3_j72xx_bandgap_temp=
_to_adc_code(COOL_DOWN_TEMP);
bb7f95a68cbaa1 Keerthy 2022-04-27  499  =

bb7f95a68cbaa1 Keerthy 2022-04-27  500  	writel((low_temp << 16) | high_max=
, data[0].bgp->cfg2_base +
bb7f95a68cbaa1 Keerthy 2022-04-27  501  	       K3_VTM_MISC_CTRL2_OFFSET);
bb7f95a68cbaa1 Keerthy 2022-04-27  502  	mdelay(100);
bb7f95a68cbaa1 Keerthy 2022-04-27  503  	writel(K3_VTM_ANYMAXT_OUTRG_ALERT_=
EN, data[0].bgp->cfg2_base +
bb7f95a68cbaa1 Keerthy 2022-04-27  504  	       K3_VTM_MISC_CTRL_OFFSET);
bb7f95a68cbaa1 Keerthy 2022-04-27  505  =

bb7f95a68cbaa1 Keerthy 2022-04-27  506  	platform_set_drvdata(pdev, bgp);
bb7f95a68cbaa1 Keerthy 2022-04-27  507  =

bb7f95a68cbaa1 Keerthy 2022-04-27  508  	print_look_up_table(dev, ref_table=
);
bb7f95a68cbaa1 Keerthy 2022-04-27  509  	/*
bb7f95a68cbaa1 Keerthy 2022-04-27  510  	 * Now that the derived_table has =
the appropriate look up values
bb7f95a68cbaa1 Keerthy 2022-04-27  511  	 * Free up the ref_table
bb7f95a68cbaa1 Keerthy 2022-04-27  512  	 */
bb7f95a68cbaa1 Keerthy 2022-04-27  513  	kfree(ref_table);
bb7f95a68cbaa1 Keerthy 2022-04-27  514  =

bb7f95a68cbaa1 Keerthy 2022-04-27  515  	return 0;
bb7f95a68cbaa1 Keerthy 2022-04-27  516  =

bb7f95a68cbaa1 Keerthy 2022-04-27  517  err_alloc:
bb7f95a68cbaa1 Keerthy 2022-04-27  518  	pm_runtime_put_sync(&pdev->dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  519  	pm_runtime_disable(&pdev->dev);
bb7f95a68cbaa1 Keerthy 2022-04-27  520  =

bb7f95a68cbaa1 Keerthy 2022-04-27 @521  	return ret;
bb7f95a68cbaa1 Keerthy 2022-04-27  522  }
bb7f95a68cbaa1 Keerthy 2022-04-27  523  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3534786625392910609==--

