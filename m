Content-Type: multipart/mixed; boundary="===============5982842798637852217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 4/4] thermal: k3_j72xx_bandgap: Add the bandgap driver support
Date: Fri, 15 Apr 2022 11:58:23 +0800
Message-ID: <202204151117.NLsoANXl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5982842798637852217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412101409.7980-5-j-keerthy@ti.com>
References: <20220412101409.7980-5-j-keerthy@ti.com>
TO: Keerthy <j-keerthy@ti.com>
TO: robh+dt(a)kernel.org
TO: daniel.lezcano(a)linaro.org
TO: rui.zhang(a)intel.com
TO: amitk(a)kernel.org
TO: kristo(a)kernel.org
CC: j-keerthy(a)ti.com
CC: linux-pm(a)vger.kernel.org
CC: vigneshr(a)ti.com
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Keerthy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rafael-pm/thermal v5.18-rc2 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Keerthy/thermal-k3_j=
72xx_bandgap-Add-the-bandgap-driver-support/20220412-193526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220415/202204151117.NLsoANXl-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/k3_j72xx_bandgap.c:570 k3_j72xx_bandgap_probe() warn: passi=
ng devm_ allocated variable to kfree. 'ref_table'

vim +/ref_table +570 drivers/thermal/k3_j72xx_bandgap.c

de47884b9759d9 Keerthy 2022-04-12  410  =

de47884b9759d9 Keerthy 2022-04-12  411  static int k3_j72xx_bandgap_probe(s=
truct platform_device *pdev)
de47884b9759d9 Keerthy 2022-04-12  412  {
de47884b9759d9 Keerthy 2022-04-12  413  	int ret =3D 0, cnt, val, id, table=
_size =3D 1024;
de47884b9759d9 Keerthy 2022-04-12  414  	int high_max, low_temp;
de47884b9759d9 Keerthy 2022-04-12  415  	struct resource *res;
de47884b9759d9 Keerthy 2022-04-12  416  	struct device *dev =3D &pdev->dev;
de47884b9759d9 Keerthy 2022-04-12  417  	struct k3_j72xx_bandgap *bgp;
de47884b9759d9 Keerthy 2022-04-12  418  	struct k3_thermal_data *data;
de47884b9759d9 Keerthy 2022-04-12  419  	int workaround_needed =3D 0;
de47884b9759d9 Keerthy 2022-04-12  420  	const struct k3_j72xx_bandgap_data=
 *driver_data;
de47884b9759d9 Keerthy 2022-04-12  421  	struct thermal_zone_device *ti_the=
rmal;
de47884b9759d9 Keerthy 2022-04-12  422  	int *ref_table;
de47884b9759d9 Keerthy 2022-04-12  423  	struct err_values err_vals;
de47884b9759d9 Keerthy 2022-04-12  424  =

de47884b9759d9 Keerthy 2022-04-12  425  	s64 golden_factors[] =3D {
de47884b9759d9 Keerthy 2022-04-12  426  		-490019999999999936,
de47884b9759d9 Keerthy 2022-04-12  427  		3251200000000000,
de47884b9759d9 Keerthy 2022-04-12  428  		-1705800000000,
de47884b9759d9 Keerthy 2022-04-12  429  		603730000,
de47884b9759d9 Keerthy 2022-04-12  430  		-92627,
de47884b9759d9 Keerthy 2022-04-12  431  	};
de47884b9759d9 Keerthy 2022-04-12  432  =

de47884b9759d9 Keerthy 2022-04-12  433  	s64 pvt_wa_factors[] =3D {
de47884b9759d9 Keerthy 2022-04-12  434  		-415230000000000000,
de47884b9759d9 Keerthy 2022-04-12  435  		3126600000000000,
de47884b9759d9 Keerthy 2022-04-12  436  		-1157800000000,
de47884b9759d9 Keerthy 2022-04-12  437  	};
de47884b9759d9 Keerthy 2022-04-12  438  =

de47884b9759d9 Keerthy 2022-04-12  439  	bgp =3D devm_kzalloc(&pdev->dev, s=
izeof(*bgp), GFP_KERNEL);
de47884b9759d9 Keerthy 2022-04-12  440  	if (!bgp)
de47884b9759d9 Keerthy 2022-04-12  441  		return -ENOMEM;
de47884b9759d9 Keerthy 2022-04-12  442  =

de47884b9759d9 Keerthy 2022-04-12  443  	bgp->dev =3D dev;
de47884b9759d9 Keerthy 2022-04-12  444  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 0);
de47884b9759d9 Keerthy 2022-04-12  445  	bgp->base =3D devm_ioremap_resourc=
e(dev, res);
de47884b9759d9 Keerthy 2022-04-12  446  	if (IS_ERR(bgp->base))
de47884b9759d9 Keerthy 2022-04-12  447  		return PTR_ERR(bgp->base);
de47884b9759d9 Keerthy 2022-04-12  448  =

de47884b9759d9 Keerthy 2022-04-12  449  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 1);
de47884b9759d9 Keerthy 2022-04-12  450  	bgp->cfg2_base =3D devm_ioremap_re=
source(dev, res);
de47884b9759d9 Keerthy 2022-04-12  451  	if (IS_ERR(bgp->cfg2_base))
de47884b9759d9 Keerthy 2022-04-12  452  		return PTR_ERR(bgp->cfg2_base);
de47884b9759d9 Keerthy 2022-04-12  453  =

de47884b9759d9 Keerthy 2022-04-12  454  	res =3D platform_get_resource(pdev=
, IORESOURCE_MEM, 2);
de47884b9759d9 Keerthy 2022-04-12  455  	bgp->fuse_base =3D devm_ioremap_re=
source(dev, res);
de47884b9759d9 Keerthy 2022-04-12  456  	if (IS_ERR(bgp->fuse_base))
de47884b9759d9 Keerthy 2022-04-12  457  		return PTR_ERR(bgp->fuse_base);
de47884b9759d9 Keerthy 2022-04-12  458  =

de47884b9759d9 Keerthy 2022-04-12  459  	driver_data =3D of_device_get_matc=
h_data(dev);
de47884b9759d9 Keerthy 2022-04-12  460  	if (driver_data)
de47884b9759d9 Keerthy 2022-04-12  461  		workaround_needed =3D driver_data=
->has_errata_i2128;
de47884b9759d9 Keerthy 2022-04-12  462  =

de47884b9759d9 Keerthy 2022-04-12  463  	pm_runtime_enable(dev);
de47884b9759d9 Keerthy 2022-04-12  464  	ret =3D pm_runtime_get_sync(dev);
de47884b9759d9 Keerthy 2022-04-12  465  	if (ret < 0) {
de47884b9759d9 Keerthy 2022-04-12  466  		pm_runtime_put_noidle(dev);
de47884b9759d9 Keerthy 2022-04-12  467  		pm_runtime_disable(dev);
de47884b9759d9 Keerthy 2022-04-12  468  		return ret;
de47884b9759d9 Keerthy 2022-04-12  469  	}
de47884b9759d9 Keerthy 2022-04-12  470  =

de47884b9759d9 Keerthy 2022-04-12  471  	/* Get the sensor count in the VTM=
 */
de47884b9759d9 Keerthy 2022-04-12  472  	val =3D readl(bgp->base + K3_VTM_D=
EVINFO_PWR0_OFFSET);
de47884b9759d9 Keerthy 2022-04-12  473  	cnt =3D val & K3_VTM_DEVINFO_PWR0_=
TEMPSENS_CT_MASK;
de47884b9759d9 Keerthy 2022-04-12  474  	cnt >>=3D __ffs(K3_VTM_DEVINFO_PWR=
0_TEMPSENS_CT_MASK);
de47884b9759d9 Keerthy 2022-04-12  475  =

de47884b9759d9 Keerthy 2022-04-12  476  	data =3D devm_kcalloc(bgp->dev, cn=
t, sizeof(*data), GFP_KERNEL);
de47884b9759d9 Keerthy 2022-04-12  477  	if (!data) {
de47884b9759d9 Keerthy 2022-04-12  478  		ret =3D -ENOMEM;
de47884b9759d9 Keerthy 2022-04-12  479  		goto err_alloc;
de47884b9759d9 Keerthy 2022-04-12  480  	}
de47884b9759d9 Keerthy 2022-04-12  481  =

de47884b9759d9 Keerthy 2022-04-12  482  	ref_table =3D devm_kzalloc(bgp->de=
v, sizeof(*ref_table) * table_size,
de47884b9759d9 Keerthy 2022-04-12  483  				 GFP_KERNEL);
de47884b9759d9 Keerthy 2022-04-12  484  	if (!ref_table) {
de47884b9759d9 Keerthy 2022-04-12  485  		ret =3D -ENOMEM;
de47884b9759d9 Keerthy 2022-04-12  486  		goto err_alloc;
de47884b9759d9 Keerthy 2022-04-12  487  	}
de47884b9759d9 Keerthy 2022-04-12  488  =

de47884b9759d9 Keerthy 2022-04-12  489  	derived_table =3D devm_kzalloc(bgp=
->dev, sizeof(*derived_table) * table_size,
de47884b9759d9 Keerthy 2022-04-12  490  				     GFP_KERNEL);
de47884b9759d9 Keerthy 2022-04-12  491  	if (!derived_table) {
de47884b9759d9 Keerthy 2022-04-12  492  		ret =3D -ENOMEM;
de47884b9759d9 Keerthy 2022-04-12  493  		goto err_alloc;
de47884b9759d9 Keerthy 2022-04-12  494  	}
de47884b9759d9 Keerthy 2022-04-12  495  =

de47884b9759d9 Keerthy 2022-04-12  496  	/* Workaround not needed if bit30/=
bit31 is set even for J721e */
de47884b9759d9 Keerthy 2022-04-12  497  	if (workaround_needed && (readl(bg=
p->fuse_base + 0x0) & 0xc0000000) =3D=3D 0xc0000000)
de47884b9759d9 Keerthy 2022-04-12  498  		workaround_needed =3D false;
de47884b9759d9 Keerthy 2022-04-12  499  =

de47884b9759d9 Keerthy 2022-04-12  500  	dev_dbg(bgp->dev, "Work around %sn=
eeded\n",
de47884b9759d9 Keerthy 2022-04-12  501  		workaround_needed ? "not " : "");
de47884b9759d9 Keerthy 2022-04-12  502  =

de47884b9759d9 Keerthy 2022-04-12  503  	if (!workaround_needed)
de47884b9759d9 Keerthy 2022-04-12  504  		init_table(5, ref_table, golden_f=
actors);
de47884b9759d9 Keerthy 2022-04-12  505  	else
de47884b9759d9 Keerthy 2022-04-12  506  		init_table(3, ref_table, pvt_wa_f=
actors);
de47884b9759d9 Keerthy 2022-04-12  507  =

de47884b9759d9 Keerthy 2022-04-12  508  	/* Register the thermal sensors */
de47884b9759d9 Keerthy 2022-04-12  509  	for (id =3D 0; id < cnt; id++) {
de47884b9759d9 Keerthy 2022-04-12  510  		data[id].bgp =3D bgp;
de47884b9759d9 Keerthy 2022-04-12  511  		data[id].ctrl_offset =3D K3_VTM_T=
MPSENS0_CTRL_OFFSET + id * 0x20;
de47884b9759d9 Keerthy 2022-04-12  512  		data[id].stat_offset =3D data[id]=
.ctrl_offset +
de47884b9759d9 Keerthy 2022-04-12  513  					K3_VTM_TMPSENS_STAT_OFFSET;
de47884b9759d9 Keerthy 2022-04-12  514  =

de47884b9759d9 Keerthy 2022-04-12  515  		if (workaround_needed) {
de47884b9759d9 Keerthy 2022-04-12  516  			/* ref adc values for -40C, 30C =
& 125C respectively */
de47884b9759d9 Keerthy 2022-04-12  517  			err_vals.refs[0] =3D MINUS40CREF;
de47884b9759d9 Keerthy 2022-04-12  518  			err_vals.refs[1] =3D PLUS30CREF;
de47884b9759d9 Keerthy 2022-04-12  519  			err_vals.refs[2] =3D PLUS125CREF;
de47884b9759d9 Keerthy 2022-04-12  520  			err_vals.refs[3] =3D PLUS150CREF;
de47884b9759d9 Keerthy 2022-04-12  521  			get_efuse_values(id, &data[id], =
err_vals.errs, bgp);
de47884b9759d9 Keerthy 2022-04-12  522  		}
de47884b9759d9 Keerthy 2022-04-12  523  =

de47884b9759d9 Keerthy 2022-04-12  524  		if (id =3D=3D 0 && workaround_nee=
ded)
de47884b9759d9 Keerthy 2022-04-12  525  			prep_lookup_table(&err_vals, ref=
_table);
de47884b9759d9 Keerthy 2022-04-12  526  		else if (id =3D=3D 0 && !workarou=
nd_needed)
de47884b9759d9 Keerthy 2022-04-12  527  			memcpy(derived_table, ref_table,=
 table_size * 4);
de47884b9759d9 Keerthy 2022-04-12  528  =

de47884b9759d9 Keerthy 2022-04-12  529  		val =3D readl(data[id].bgp->cfg2_=
base + data[id].ctrl_offset);
de47884b9759d9 Keerthy 2022-04-12  530  		val |=3D (K3_VTM_TMPSENS_CTRL_MAX=
T_OUTRG_EN |
de47884b9759d9 Keerthy 2022-04-12  531  			K3_VTM_TMPSENS_CTRL_SOC |
de47884b9759d9 Keerthy 2022-04-12  532  			K3_VTM_TMPSENS_CTRL_CLRZ | BIT(4=
));
de47884b9759d9 Keerthy 2022-04-12  533  		writel(val, data[id].bgp->cfg2_ba=
se + data[id].ctrl_offset);
de47884b9759d9 Keerthy 2022-04-12  534  =

de47884b9759d9 Keerthy 2022-04-12  535  		bgp->ts_data[id] =3D &data[id];
de47884b9759d9 Keerthy 2022-04-12  536  		ti_thermal =3D
de47884b9759d9 Keerthy 2022-04-12  537  		devm_thermal_zone_of_sensor_regis=
ter(bgp->dev, id,
de47884b9759d9 Keerthy 2022-04-12  538  						     &data[id],
de47884b9759d9 Keerthy 2022-04-12  539  						     &k3_of_thermal_ops);
de47884b9759d9 Keerthy 2022-04-12  540  		if (IS_ERR(ti_thermal)) {
de47884b9759d9 Keerthy 2022-04-12  541  			dev_err(bgp->dev, "thermal zone =
device is NULL\n");
de47884b9759d9 Keerthy 2022-04-12  542  			ret =3D PTR_ERR(ti_thermal);
de47884b9759d9 Keerthy 2022-04-12  543  			goto err_alloc;
de47884b9759d9 Keerthy 2022-04-12  544  		}
de47884b9759d9 Keerthy 2022-04-12  545  	}
de47884b9759d9 Keerthy 2022-04-12  546  =

de47884b9759d9 Keerthy 2022-04-12  547  	/*
de47884b9759d9 Keerthy 2022-04-12  548  	 * Program TSHUT thresholds
de47884b9759d9 Keerthy 2022-04-12  549  	 * Step 1: set the thresholds to ~=
123C and 105C WKUP_VTM_MISC_CTRL2
de47884b9759d9 Keerthy 2022-04-12  550  	 * Step 2: WKUP_VTM_TMPSENS_CTRL_j=
 set the MAXT_OUTRG_EN  bit
de47884b9759d9 Keerthy 2022-04-12  551  	 *         This is already taken c=
are as per of init
de47884b9759d9 Keerthy 2022-04-12  552  	 * Step 3: WKUP_VTM_MISC_CTRL set =
the ANYMAXT_OUTRG_ALERT_EN  bit
de47884b9759d9 Keerthy 2022-04-12  553  	 */
de47884b9759d9 Keerthy 2022-04-12  554  	high_max =3D k3_j72xx_bandgap_temp=
_to_adc_code(MAX_TEMP);
de47884b9759d9 Keerthy 2022-04-12  555  	low_temp =3D k3_j72xx_bandgap_temp=
_to_adc_code(COOL_DOWN_TEMP);
de47884b9759d9 Keerthy 2022-04-12  556  =

de47884b9759d9 Keerthy 2022-04-12  557  	writel((low_temp << 16) | high_max=
, data[0].bgp->cfg2_base +
de47884b9759d9 Keerthy 2022-04-12  558  	       K3_VTM_MISC_CTRL2_OFFSET);
de47884b9759d9 Keerthy 2022-04-12  559  	mdelay(100);
de47884b9759d9 Keerthy 2022-04-12  560  	writel(K3_VTM_ANYMAXT_OUTRG_ALERT_=
EN, data[0].bgp->cfg2_base +
de47884b9759d9 Keerthy 2022-04-12  561  	       K3_VTM_MISC_CTRL_OFFSET);
de47884b9759d9 Keerthy 2022-04-12  562  =

de47884b9759d9 Keerthy 2022-04-12  563  	platform_set_drvdata(pdev, bgp);
de47884b9759d9 Keerthy 2022-04-12  564  =

de47884b9759d9 Keerthy 2022-04-12  565  	print_look_up_table(dev, ref_table=
);
de47884b9759d9 Keerthy 2022-04-12  566  	/*
de47884b9759d9 Keerthy 2022-04-12  567  	 * Now that the derived_table has =
the appropriate look up values
de47884b9759d9 Keerthy 2022-04-12  568  	 * Free up the ref_table
de47884b9759d9 Keerthy 2022-04-12  569  	 */
de47884b9759d9 Keerthy 2022-04-12 @570  	kfree(ref_table);
de47884b9759d9 Keerthy 2022-04-12  571  =

de47884b9759d9 Keerthy 2022-04-12  572  	return 0;
de47884b9759d9 Keerthy 2022-04-12  573  =

de47884b9759d9 Keerthy 2022-04-12  574  err_alloc:
de47884b9759d9 Keerthy 2022-04-12  575  	pm_runtime_put_sync(&pdev->dev);
de47884b9759d9 Keerthy 2022-04-12  576  	pm_runtime_disable(&pdev->dev);
de47884b9759d9 Keerthy 2022-04-12  577  =

de47884b9759d9 Keerthy 2022-04-12  578  	return ret;
de47884b9759d9 Keerthy 2022-04-12  579  }
de47884b9759d9 Keerthy 2022-04-12  580  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5982842798637852217==--

