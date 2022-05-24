Content-Type: multipart/mixed; boundary="===============2143151700378064107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12341/13934] drivers/thermal/k3_j72xx_bandgap.c:521 k3_j72xx_bandgap_probe() warn: possible memory leak of 'ref_table'
Date: Tue, 24 May 2022 16:26:02 +0800
Message-ID: <202205241527.HnmfEBAn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2143151700378064107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Keerthy <j-keerthy@ti.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cc63e8e92cb872081f249ea16e6c460642f3e4fb
commit: ffcb2fc86eb7ebc9f5524525fb57e1cccfbd1fc0 [12341/13934] thermal: k3_=
j72xx_bandgap: Add the bandgap driver support
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-m031-20220523 (https://download.01.org/0day-ci/=
archive/20220524/202205241527.HnmfEBAn-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/k3_j72xx_bandgap.c:521 k3_j72xx_bandgap_probe() warn: possi=
ble memory leak of 'ref_table'

vim +/ref_table +521 drivers/thermal/k3_j72xx_bandgap.c

ffcb2fc86eb7eb Keerthy 2022-05-17  354  =

ffcb2fc86eb7eb Keerthy 2022-05-17  355  static int k3_j72xx_bandgap_probe(s=
truct platform_device *pdev)
ffcb2fc86eb7eb Keerthy 2022-05-17  356  {
ffcb2fc86eb7eb Keerthy 2022-05-17  357  	int ret =3D 0, cnt, val, id;
ffcb2fc86eb7eb Keerthy 2022-05-17  358  	int high_max, low_temp;
ffcb2fc86eb7eb Keerthy 2022-05-17  359  	struct resource *res;
ffcb2fc86eb7eb Keerthy 2022-05-17  360  	struct device *dev =3D &pdev->dev;
ffcb2fc86eb7eb Keerthy 2022-05-17  361  	struct k3_j72xx_bandgap *bgp;
ffcb2fc86eb7eb Keerthy 2022-05-17  362  	struct k3_thermal_data *data;
ffcb2fc86eb7eb Keerthy 2022-05-17  363  	int workaround_needed =3D 0;
ffcb2fc86eb7eb Keerthy 2022-05-17  364  	const struct k3_j72xx_bandgap_data=
 *driver_data;
ffcb2fc86eb7eb Keerthy 2022-05-17  365  	struct thermal_zone_device *ti_the=
rmal;
ffcb2fc86eb7eb Keerthy 2022-05-17  366  	int *ref_table;
ffcb2fc86eb7eb Keerthy 2022-05-17  367  	struct err_values err_vals;
ffcb2fc86eb7eb Keerthy 2022-05-17  368  =

ffcb2fc86eb7eb Keerthy 2022-05-17  369  	const s64 golden_factors[] =3D {
ffcb2fc86eb7eb Keerthy 2022-05-17  370  		-490019999999999936,
ffcb2fc86eb7eb Keerthy 2022-05-17  371  		3251200000000000,
ffcb2fc86eb7eb Keerthy 2022-05-17  372  		-1705800000000,
ffcb2fc86eb7eb Keerthy 2022-05-17  373  		603730000,
ffcb2fc86eb7eb Keerthy 2022-05-17  374  		-92627,
ffcb2fc86eb7eb Keerthy 2022-05-17  375  	};
ffcb2fc86eb7eb Keerthy 2022-05-17  376  =

ffcb2fc86eb7eb Keerthy 2022-05-17  377  	const s64 pvt_wa_factors[] =3D {
ffcb2fc86eb7eb Keerthy 2022-05-17  378  		-415230000000000000,
ffcb2fc86eb7eb Keerthy 2022-05-17  379  		3126600000000000,
ffcb2fc86eb7eb Keerthy 2022-05-17  380  		-1157800000000,
ffcb2fc86eb7eb Keerthy 2022-05-17  381  	};
ffcb2fc86eb7eb Keerthy 2022-05-17  382  =

ffcb2fc86eb7eb Keerthy 2022-05-17  383  	bgp =3D devm_kzalloc(&pdev->dev, s=
izeof(*bgp), GFP_KERNEL);
ffcb2fc86eb7eb Keerthy 2022-05-17  384  	if (!bgp)
ffcb2fc86eb7eb Keerthy 2022-05-17  385  		return -ENOMEM;
ffcb2fc86eb7eb Keerthy 2022-05-17  386  =

ffcb2fc86eb7eb Keerthy 2022-05-17  387  	bgp->dev =3D dev;
ffcb2fc86eb7eb Keerthy 2022-05-17  388  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 0);
ffcb2fc86eb7eb Keerthy 2022-05-17  389  	bgp->base =3D devm_ioremap_resourc=
e(dev, res);
ffcb2fc86eb7eb Keerthy 2022-05-17  390  	if (IS_ERR(bgp->base))
ffcb2fc86eb7eb Keerthy 2022-05-17  391  		return PTR_ERR(bgp->base);
ffcb2fc86eb7eb Keerthy 2022-05-17  392  =

ffcb2fc86eb7eb Keerthy 2022-05-17  393  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 1);
ffcb2fc86eb7eb Keerthy 2022-05-17  394  	bgp->cfg2_base =3D devm_ioremap_re=
source(dev, res);
ffcb2fc86eb7eb Keerthy 2022-05-17  395  	if (IS_ERR(bgp->cfg2_base))
ffcb2fc86eb7eb Keerthy 2022-05-17  396  		return PTR_ERR(bgp->cfg2_base);
ffcb2fc86eb7eb Keerthy 2022-05-17  397  =

ffcb2fc86eb7eb Keerthy 2022-05-17  398  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 2);
ffcb2fc86eb7eb Keerthy 2022-05-17  399  	bgp->fuse_base =3D devm_ioremap_re=
source(dev, res);
ffcb2fc86eb7eb Keerthy 2022-05-17  400  	if (IS_ERR(bgp->fuse_base))
ffcb2fc86eb7eb Keerthy 2022-05-17  401  		return PTR_ERR(bgp->fuse_base);
ffcb2fc86eb7eb Keerthy 2022-05-17  402  =

ffcb2fc86eb7eb Keerthy 2022-05-17  403  	driver_data =3D of_device_get_matc=
h_data(dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  404  	if (driver_data)
ffcb2fc86eb7eb Keerthy 2022-05-17  405  		workaround_needed =3D driver_data=
->has_errata_i2128;
ffcb2fc86eb7eb Keerthy 2022-05-17  406  =

ffcb2fc86eb7eb Keerthy 2022-05-17  407  	pm_runtime_enable(dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  408  	ret =3D pm_runtime_get_sync(dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  409  	if (ret < 0) {
ffcb2fc86eb7eb Keerthy 2022-05-17  410  		pm_runtime_put_noidle(dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  411  		pm_runtime_disable(dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  412  		return ret;
ffcb2fc86eb7eb Keerthy 2022-05-17  413  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  414  =

ffcb2fc86eb7eb Keerthy 2022-05-17  415  	/* Get the sensor count in the VTM=
 */
ffcb2fc86eb7eb Keerthy 2022-05-17  416  	val =3D readl(bgp->base + K3_VTM_D=
EVINFO_PWR0_OFFSET);
ffcb2fc86eb7eb Keerthy 2022-05-17  417  	cnt =3D val & K3_VTM_DEVINFO_PWR0_=
TEMPSENS_CT_MASK;
ffcb2fc86eb7eb Keerthy 2022-05-17  418  	cnt >>=3D __ffs(K3_VTM_DEVINFO_PWR=
0_TEMPSENS_CT_MASK);
ffcb2fc86eb7eb Keerthy 2022-05-17  419  =

ffcb2fc86eb7eb Keerthy 2022-05-17  420  	data =3D devm_kcalloc(bgp->dev, cn=
t, sizeof(*data), GFP_KERNEL);
ffcb2fc86eb7eb Keerthy 2022-05-17  421  	if (!data) {
ffcb2fc86eb7eb Keerthy 2022-05-17  422  		ret =3D -ENOMEM;
ffcb2fc86eb7eb Keerthy 2022-05-17  423  		goto err_alloc;
ffcb2fc86eb7eb Keerthy 2022-05-17  424  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  425  =

ffcb2fc86eb7eb Keerthy 2022-05-17  426  	ref_table =3D kzalloc(sizeof(*ref_=
table) * TABLE_SIZE, GFP_KERNEL);
ffcb2fc86eb7eb Keerthy 2022-05-17  427  	if (!ref_table) {
ffcb2fc86eb7eb Keerthy 2022-05-17  428  		ret =3D -ENOMEM;
ffcb2fc86eb7eb Keerthy 2022-05-17  429  		goto err_alloc;
ffcb2fc86eb7eb Keerthy 2022-05-17  430  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  431  =

ffcb2fc86eb7eb Keerthy 2022-05-17  432  	derived_table =3D devm_kzalloc(bgp=
->dev, sizeof(*derived_table) * TABLE_SIZE,
ffcb2fc86eb7eb Keerthy 2022-05-17  433  				     GFP_KERNEL);
ffcb2fc86eb7eb Keerthy 2022-05-17  434  	if (!derived_table) {
ffcb2fc86eb7eb Keerthy 2022-05-17  435  		ret =3D -ENOMEM;
ffcb2fc86eb7eb Keerthy 2022-05-17  436  		goto err_alloc;
ffcb2fc86eb7eb Keerthy 2022-05-17  437  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  438  =

ffcb2fc86eb7eb Keerthy 2022-05-17  439  	/* Workaround not needed if bit30/=
bit31 is set even for J721e */
ffcb2fc86eb7eb Keerthy 2022-05-17  440  	if (workaround_needed && (readl(bg=
p->fuse_base + 0x0) & 0xc0000000) =3D=3D 0xc0000000)
ffcb2fc86eb7eb Keerthy 2022-05-17  441  		workaround_needed =3D false;
ffcb2fc86eb7eb Keerthy 2022-05-17  442  =

ffcb2fc86eb7eb Keerthy 2022-05-17  443  	dev_dbg(bgp->dev, "Work around %sn=
eeded\n",
ffcb2fc86eb7eb Keerthy 2022-05-17  444  		workaround_needed ? "not " : "");
ffcb2fc86eb7eb Keerthy 2022-05-17  445  =

ffcb2fc86eb7eb Keerthy 2022-05-17  446  	if (!workaround_needed)
ffcb2fc86eb7eb Keerthy 2022-05-17  447  		init_table(5, ref_table, golden_f=
actors);
ffcb2fc86eb7eb Keerthy 2022-05-17  448  	else
ffcb2fc86eb7eb Keerthy 2022-05-17  449  		init_table(3, ref_table, pvt_wa_f=
actors);
ffcb2fc86eb7eb Keerthy 2022-05-17  450  =

ffcb2fc86eb7eb Keerthy 2022-05-17  451  	/* Register the thermal sensors */
ffcb2fc86eb7eb Keerthy 2022-05-17  452  	for (id =3D 0; id < cnt; id++) {
ffcb2fc86eb7eb Keerthy 2022-05-17  453  		data[id].bgp =3D bgp;
ffcb2fc86eb7eb Keerthy 2022-05-17  454  		data[id].ctrl_offset =3D K3_VTM_T=
MPSENS0_CTRL_OFFSET + id * 0x20;
ffcb2fc86eb7eb Keerthy 2022-05-17  455  		data[id].stat_offset =3D data[id]=
.ctrl_offset +
ffcb2fc86eb7eb Keerthy 2022-05-17  456  					K3_VTM_TMPSENS_STAT_OFFSET;
ffcb2fc86eb7eb Keerthy 2022-05-17  457  =

ffcb2fc86eb7eb Keerthy 2022-05-17  458  		if (workaround_needed) {
ffcb2fc86eb7eb Keerthy 2022-05-17  459  			/* ref adc values for -40C, 30C =
& 125C respectively */
ffcb2fc86eb7eb Keerthy 2022-05-17  460  			err_vals.refs[0] =3D MINUS40CREF;
ffcb2fc86eb7eb Keerthy 2022-05-17  461  			err_vals.refs[1] =3D PLUS30CREF;
ffcb2fc86eb7eb Keerthy 2022-05-17  462  			err_vals.refs[2] =3D PLUS125CREF;
ffcb2fc86eb7eb Keerthy 2022-05-17  463  			err_vals.refs[3] =3D PLUS150CREF;
ffcb2fc86eb7eb Keerthy 2022-05-17  464  			get_efuse_values(id, &data[id], =
err_vals.errs, bgp);
ffcb2fc86eb7eb Keerthy 2022-05-17  465  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  466  =

ffcb2fc86eb7eb Keerthy 2022-05-17  467  		if (id =3D=3D 0 && workaround_nee=
ded)
ffcb2fc86eb7eb Keerthy 2022-05-17  468  			prep_lookup_table(&err_vals, ref=
_table);
ffcb2fc86eb7eb Keerthy 2022-05-17  469  		else if (id =3D=3D 0 && !workarou=
nd_needed)
ffcb2fc86eb7eb Keerthy 2022-05-17  470  			memcpy(derived_table, ref_table,=
 TABLE_SIZE * 4);
ffcb2fc86eb7eb Keerthy 2022-05-17  471  =

ffcb2fc86eb7eb Keerthy 2022-05-17  472  		val =3D readl(data[id].bgp->cfg2_=
base + data[id].ctrl_offset);
ffcb2fc86eb7eb Keerthy 2022-05-17  473  		val |=3D (K3_VTM_TMPSENS_CTRL_MAX=
T_OUTRG_EN |
ffcb2fc86eb7eb Keerthy 2022-05-17  474  			K3_VTM_TMPSENS_CTRL_SOC |
ffcb2fc86eb7eb Keerthy 2022-05-17  475  			K3_VTM_TMPSENS_CTRL_CLRZ | BIT(4=
));
ffcb2fc86eb7eb Keerthy 2022-05-17  476  		writel(val, data[id].bgp->cfg2_ba=
se + data[id].ctrl_offset);
ffcb2fc86eb7eb Keerthy 2022-05-17  477  =

ffcb2fc86eb7eb Keerthy 2022-05-17  478  		bgp->ts_data[id] =3D &data[id];
ffcb2fc86eb7eb Keerthy 2022-05-17  479  		ti_thermal =3D
ffcb2fc86eb7eb Keerthy 2022-05-17  480  		devm_thermal_zone_of_sensor_regis=
ter(bgp->dev, id,
ffcb2fc86eb7eb Keerthy 2022-05-17  481  						     &data[id],
ffcb2fc86eb7eb Keerthy 2022-05-17  482  						     &k3_of_thermal_ops);
ffcb2fc86eb7eb Keerthy 2022-05-17  483  		if (IS_ERR(ti_thermal)) {
ffcb2fc86eb7eb Keerthy 2022-05-17  484  			dev_err(bgp->dev, "thermal zone =
device is NULL\n");
ffcb2fc86eb7eb Keerthy 2022-05-17  485  			ret =3D PTR_ERR(ti_thermal);
ffcb2fc86eb7eb Keerthy 2022-05-17  486  			goto err_alloc;
ffcb2fc86eb7eb Keerthy 2022-05-17  487  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  488  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  489  =

ffcb2fc86eb7eb Keerthy 2022-05-17  490  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17  491  	 * Program TSHUT thresholds
ffcb2fc86eb7eb Keerthy 2022-05-17  492  	 * Step 1: set the thresholds to ~=
123C and 105C WKUP_VTM_MISC_CTRL2
ffcb2fc86eb7eb Keerthy 2022-05-17  493  	 * Step 2: WKUP_VTM_TMPSENS_CTRL_j=
 set the MAXT_OUTRG_EN  bit
ffcb2fc86eb7eb Keerthy 2022-05-17  494  	 *         This is already taken c=
are as per of init
ffcb2fc86eb7eb Keerthy 2022-05-17  495  	 * Step 3: WKUP_VTM_MISC_CTRL set =
the ANYMAXT_OUTRG_ALERT_EN  bit
ffcb2fc86eb7eb Keerthy 2022-05-17  496  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  497  	high_max =3D k3_j72xx_bandgap_temp=
_to_adc_code(MAX_TEMP);
ffcb2fc86eb7eb Keerthy 2022-05-17  498  	low_temp =3D k3_j72xx_bandgap_temp=
_to_adc_code(COOL_DOWN_TEMP);
ffcb2fc86eb7eb Keerthy 2022-05-17  499  =

ffcb2fc86eb7eb Keerthy 2022-05-17  500  	writel((low_temp << 16) | high_max=
, data[0].bgp->cfg2_base +
ffcb2fc86eb7eb Keerthy 2022-05-17  501  	       K3_VTM_MISC_CTRL2_OFFSET);
ffcb2fc86eb7eb Keerthy 2022-05-17  502  	mdelay(100);
ffcb2fc86eb7eb Keerthy 2022-05-17  503  	writel(K3_VTM_ANYMAXT_OUTRG_ALERT_=
EN, data[0].bgp->cfg2_base +
ffcb2fc86eb7eb Keerthy 2022-05-17  504  	       K3_VTM_MISC_CTRL_OFFSET);
ffcb2fc86eb7eb Keerthy 2022-05-17  505  =

ffcb2fc86eb7eb Keerthy 2022-05-17  506  	platform_set_drvdata(pdev, bgp);
ffcb2fc86eb7eb Keerthy 2022-05-17  507  =

ffcb2fc86eb7eb Keerthy 2022-05-17  508  	print_look_up_table(dev, ref_table=
);
ffcb2fc86eb7eb Keerthy 2022-05-17  509  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17  510  	 * Now that the derived_table has =
the appropriate look up values
ffcb2fc86eb7eb Keerthy 2022-05-17  511  	 * Free up the ref_table
ffcb2fc86eb7eb Keerthy 2022-05-17  512  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  513  	kfree(ref_table);
ffcb2fc86eb7eb Keerthy 2022-05-17  514  =

ffcb2fc86eb7eb Keerthy 2022-05-17  515  	return 0;
ffcb2fc86eb7eb Keerthy 2022-05-17  516  =

ffcb2fc86eb7eb Keerthy 2022-05-17  517  err_alloc:
ffcb2fc86eb7eb Keerthy 2022-05-17  518  	pm_runtime_put_sync(&pdev->dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  519  	pm_runtime_disable(&pdev->dev);
ffcb2fc86eb7eb Keerthy 2022-05-17  520  =

ffcb2fc86eb7eb Keerthy 2022-05-17 @521  	return ret;
ffcb2fc86eb7eb Keerthy 2022-05-17  522  }
ffcb2fc86eb7eb Keerthy 2022-05-17  523  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2143151700378064107==--

