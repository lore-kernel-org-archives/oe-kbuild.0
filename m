Content-Type: multipart/mixed; boundary="===============3707657925613406414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/imx/clk-scu.c:642:23: warning: Parameter 'prate' can be declared with const [constParameter]
Date: Sun, 22 May 2022 21:51:09 +0800
Message-ID: <202205222158.qfK6TSps-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3707657925613406414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dong Aisheng <aisheng.dong@nxp.com>
CC: Abel Vesa <abel.vesa@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 5392c5de096a1cad7cc06265a8cbf18de2da22c7 clk: imx: scu: add gpr clo=
cks support
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5392c5de096a1cad7cc06265a8cbf18de2da22c7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/keystone/syscon-clk.c:89:9: warning: Returning pointer to lo=
cal variable 'init' that will be invalid when returning. [returnDanglingLif=
etime]
    return &priv->hw;
           ^
   drivers/clk/keystone/syscon-clk.c:83:18: note: Address of variable taken=
 here.
    priv->hw.init =3D &init;
                    ^
   drivers/clk/keystone/syscon-clk.c:86:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/clk/keystone/syscon-clk.c:89:9: note: Address of variable taken =
here.
    return &priv->hw;
           ^
   drivers/clk/keystone/syscon-clk.c:67:23: note: Variable created here.
    struct clk_init_data init;
                         ^
   drivers/clk/keystone/syscon-clk.c:89:9: note: Returning pointer to local=
 variable 'init' that will be invalid when returning.
    return &priv->hw;
           ^
--
>> drivers/clk/imx/clk-scu.c:642:23: warning: Parameter 'prate' can be decl=
ared with const [constParameter]
          unsigned long *prate)
                         ^
>> drivers/clk/imx/clk-scu.c:463:12: warning: Uninitialized variable: clk->=
clk_type [uninitvar]
     if (clk->clk_type =3D=3D idx)
              ^

vim +/prate +642 drivers/clk/imx/clk-scu.c

77d8f3068c63ee Dong Aisheng 2020-07-29  453  =

77d8f3068c63ee Dong Aisheng 2020-07-29  454  struct clk_hw *imx_scu_of_clk_=
src_get(struct of_phandle_args *clkspec,
77d8f3068c63ee Dong Aisheng 2020-07-29  455  				      void *data)
77d8f3068c63ee Dong Aisheng 2020-07-29  456  {
77d8f3068c63ee Dong Aisheng 2020-07-29  457  	unsigned int rsrc =3D clkspec=
->args[0];
77d8f3068c63ee Dong Aisheng 2020-07-29  458  	unsigned int idx =3D clkspec-=
>args[1];
77d8f3068c63ee Dong Aisheng 2020-07-29  459  	struct list_head *scu_clks =
=3D data;
77d8f3068c63ee Dong Aisheng 2020-07-29  460  	struct imx_scu_clk_node *clk;
77d8f3068c63ee Dong Aisheng 2020-07-29  461  =

77d8f3068c63ee Dong Aisheng 2020-07-29  462  	list_for_each_entry(clk, &scu=
_clks[rsrc], node) {
77d8f3068c63ee Dong Aisheng 2020-07-29 @463  		if (clk->clk_type =3D=3D idx)
77d8f3068c63ee Dong Aisheng 2020-07-29  464  			return clk->hw;
77d8f3068c63ee Dong Aisheng 2020-07-29  465  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  466  =

77d8f3068c63ee Dong Aisheng 2020-07-29  467  	return ERR_PTR(-ENODEV);
77d8f3068c63ee Dong Aisheng 2020-07-29  468  }
77d8f3068c63ee Dong Aisheng 2020-07-29  469  =

77d8f3068c63ee Dong Aisheng 2020-07-29  470  static int imx_clk_scu_probe(s=
truct platform_device *pdev)
77d8f3068c63ee Dong Aisheng 2020-07-29  471  {
77d8f3068c63ee Dong Aisheng 2020-07-29  472  	struct device *dev =3D &pdev-=
>dev;
77d8f3068c63ee Dong Aisheng 2020-07-29  473  	struct imx_scu_clk_node *clk =
=3D dev_get_platdata(dev);
77d8f3068c63ee Dong Aisheng 2020-07-29  474  	struct clk_hw *hw;
78edeb080330ca Dong Aisheng 2020-07-29  475  	int ret;
78edeb080330ca Dong Aisheng 2020-07-29  476  =

78edeb080330ca Dong Aisheng 2020-07-29  477  	pm_runtime_set_suspended(dev);
78edeb080330ca Dong Aisheng 2020-07-29  478  	pm_runtime_set_autosuspend_de=
lay(dev, 50);
78edeb080330ca Dong Aisheng 2020-07-29  479  	pm_runtime_use_autosuspend(&p=
dev->dev);
78edeb080330ca Dong Aisheng 2020-07-29  480  	pm_runtime_enable(dev);
78edeb080330ca Dong Aisheng 2020-07-29  481  =

78edeb080330ca Dong Aisheng 2020-07-29  482  	ret =3D pm_runtime_get_sync(d=
ev);
78edeb080330ca Dong Aisheng 2020-07-29  483  	if (ret) {
78edeb080330ca Dong Aisheng 2020-07-29  484  		pm_runtime_disable(dev);
78edeb080330ca Dong Aisheng 2020-07-29  485  		return ret;
78edeb080330ca Dong Aisheng 2020-07-29  486  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  487  =

78edeb080330ca Dong Aisheng 2020-07-29  488  	hw =3D __imx_clk_scu(dev, clk=
->name, clk->parents, clk->num_parents,
77d8f3068c63ee Dong Aisheng 2020-07-29  489  			   clk->rsrc, clk->clk_type=
);
78edeb080330ca Dong Aisheng 2020-07-29  490  	if (IS_ERR(hw)) {
78edeb080330ca Dong Aisheng 2020-07-29  491  		pm_runtime_disable(dev);
77d8f3068c63ee Dong Aisheng 2020-07-29  492  		return PTR_ERR(hw);
78edeb080330ca Dong Aisheng 2020-07-29  493  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  494  =

77d8f3068c63ee Dong Aisheng 2020-07-29  495  	clk->hw =3D hw;
77d8f3068c63ee Dong Aisheng 2020-07-29  496  	list_add_tail(&clk->node, &im=
x_scu_clks[clk->rsrc]);
77d8f3068c63ee Dong Aisheng 2020-07-29  497  =

78edeb080330ca Dong Aisheng 2020-07-29  498  	pm_runtime_mark_last_busy(&pd=
ev->dev);
78edeb080330ca Dong Aisheng 2020-07-29  499  	pm_runtime_put_autosuspend(&p=
dev->dev);
78edeb080330ca Dong Aisheng 2020-07-29  500  =

77d8f3068c63ee Dong Aisheng 2020-07-29  501  	dev_dbg(dev, "register SCU cl=
ock rsrc:%d type:%d\n", clk->rsrc,
77d8f3068c63ee Dong Aisheng 2020-07-29  502  		clk->clk_type);
77d8f3068c63ee Dong Aisheng 2020-07-29  503  =

77d8f3068c63ee Dong Aisheng 2020-07-29  504  	return 0;
77d8f3068c63ee Dong Aisheng 2020-07-29  505  }
77d8f3068c63ee Dong Aisheng 2020-07-29  506  =

d0409631f466ae Dong Aisheng 2020-07-29  507  static int __maybe_unused imx_=
clk_scu_suspend(struct device *dev)
d0409631f466ae Dong Aisheng 2020-07-29  508  {
d0409631f466ae Dong Aisheng 2020-07-29  509  	struct clk_scu *clk =3D dev_g=
et_drvdata(dev);
d0409631f466ae Dong Aisheng 2020-07-29  510  =

d0409631f466ae Dong Aisheng 2020-07-29  511  	clk->rate =3D clk_hw_get_rate=
(&clk->hw);
d0409631f466ae Dong Aisheng 2020-07-29  512  	clk->is_enabled =3D clk_hw_is=
_enabled(&clk->hw);
d0409631f466ae Dong Aisheng 2020-07-29  513  =

d0409631f466ae Dong Aisheng 2020-07-29  514  	if (clk->rate)
d0409631f466ae Dong Aisheng 2020-07-29  515  		dev_dbg(dev, "save rate %d\n=
", clk->rate);
d0409631f466ae Dong Aisheng 2020-07-29  516  =

d0409631f466ae Dong Aisheng 2020-07-29  517  	if (clk->is_enabled)
d0409631f466ae Dong Aisheng 2020-07-29  518  		dev_dbg(dev, "save enabled s=
tate\n");
d0409631f466ae Dong Aisheng 2020-07-29  519  =

d0409631f466ae Dong Aisheng 2020-07-29  520  	return 0;
d0409631f466ae Dong Aisheng 2020-07-29  521  }
d0409631f466ae Dong Aisheng 2020-07-29  522  =

d0409631f466ae Dong Aisheng 2020-07-29  523  static int __maybe_unused imx_=
clk_scu_resume(struct device *dev)
d0409631f466ae Dong Aisheng 2020-07-29  524  {
d0409631f466ae Dong Aisheng 2020-07-29  525  	struct clk_scu *clk =3D dev_g=
et_drvdata(dev);
d0409631f466ae Dong Aisheng 2020-07-29  526  	int ret =3D 0;
d0409631f466ae Dong Aisheng 2020-07-29  527  =

d0409631f466ae Dong Aisheng 2020-07-29  528  	if (clk->rate) {
d0409631f466ae Dong Aisheng 2020-07-29  529  		ret =3D clk_scu_set_rate(&cl=
k->hw, clk->rate, 0);
d0409631f466ae Dong Aisheng 2020-07-29  530  		dev_dbg(dev, "restore rate %=
d %s\n", clk->rate,
d0409631f466ae Dong Aisheng 2020-07-29  531  			!ret ? "success" : "failed"=
);
d0409631f466ae Dong Aisheng 2020-07-29  532  	}
d0409631f466ae Dong Aisheng 2020-07-29  533  =

d0409631f466ae Dong Aisheng 2020-07-29  534  	if (clk->is_enabled) {
d0409631f466ae Dong Aisheng 2020-07-29  535  		ret =3D clk_scu_prepare(&clk=
->hw);
d0409631f466ae Dong Aisheng 2020-07-29  536  		dev_dbg(dev, "restore enable=
d state %s\n",
d0409631f466ae Dong Aisheng 2020-07-29  537  			!ret ? "success" : "failed"=
);
d0409631f466ae Dong Aisheng 2020-07-29  538  	}
d0409631f466ae Dong Aisheng 2020-07-29  539  =

d0409631f466ae Dong Aisheng 2020-07-29  540  	return ret;
d0409631f466ae Dong Aisheng 2020-07-29  541  }
d0409631f466ae Dong Aisheng 2020-07-29  542  =

d0409631f466ae Dong Aisheng 2020-07-29  543  static const struct dev_pm_ops=
 imx_clk_scu_pm_ops =3D {
d0409631f466ae Dong Aisheng 2020-07-29  544  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS=
(imx_clk_scu_suspend,
d0409631f466ae Dong Aisheng 2020-07-29  545  				      imx_clk_scu_resume)
d0409631f466ae Dong Aisheng 2020-07-29  546  };
d0409631f466ae Dong Aisheng 2020-07-29  547  =

77d8f3068c63ee Dong Aisheng 2020-07-29  548  static struct platform_driver =
imx_clk_scu_driver =3D {
77d8f3068c63ee Dong Aisheng 2020-07-29  549  	.driver =3D {
77d8f3068c63ee Dong Aisheng 2020-07-29  550  		.name =3D "imx-scu-clk",
77d8f3068c63ee Dong Aisheng 2020-07-29  551  		.suppress_bind_attrs =3D tru=
e,
d0409631f466ae Dong Aisheng 2020-07-29  552  		.pm =3D &imx_clk_scu_pm_ops,
77d8f3068c63ee Dong Aisheng 2020-07-29  553  	},
77d8f3068c63ee Dong Aisheng 2020-07-29  554  	.probe =3D imx_clk_scu_probe,
77d8f3068c63ee Dong Aisheng 2020-07-29  555  };
77d8f3068c63ee Dong Aisheng 2020-07-29  556  =

77d8f3068c63ee Dong Aisheng 2020-07-29  557  static int imx_clk_scu_attach_=
pd(struct device *dev, u32 rsrc_id)
77d8f3068c63ee Dong Aisheng 2020-07-29  558  {
77d8f3068c63ee Dong Aisheng 2020-07-29  559  	struct of_phandle_args genpds=
pec =3D {
77d8f3068c63ee Dong Aisheng 2020-07-29  560  		.np =3D pd_np,
77d8f3068c63ee Dong Aisheng 2020-07-29  561  		.args_count =3D 1,
77d8f3068c63ee Dong Aisheng 2020-07-29  562  		.args[0] =3D rsrc_id,
77d8f3068c63ee Dong Aisheng 2020-07-29  563  	};
77d8f3068c63ee Dong Aisheng 2020-07-29  564  =

0d5f1f4731b52e Dong Aisheng 2020-07-29  565  	if (rsrc_id =3D=3D IMX_SC_R_A=
35 || rsrc_id =3D=3D IMX_SC_R_A53 ||
0d5f1f4731b52e Dong Aisheng 2020-07-29  566  	    rsrc_id =3D=3D IMX_SC_R_A=
72)
0d5f1f4731b52e Dong Aisheng 2020-07-29  567  		return 0;
0d5f1f4731b52e Dong Aisheng 2020-07-29  568  =

77d8f3068c63ee Dong Aisheng 2020-07-29  569  	return of_genpd_add_device(&g=
enpdspec, dev);
77d8f3068c63ee Dong Aisheng 2020-07-29  570  }
77d8f3068c63ee Dong Aisheng 2020-07-29  571  =

77d8f3068c63ee Dong Aisheng 2020-07-29  572  struct clk_hw *imx_clk_scu_all=
oc_dev(const char *name,
77d8f3068c63ee Dong Aisheng 2020-07-29  573  				     const char * const *p=
arents,
77d8f3068c63ee Dong Aisheng 2020-07-29  574  				     int num_parents, u32 =
rsrc_id, u8 clk_type)
77d8f3068c63ee Dong Aisheng 2020-07-29  575  {
77d8f3068c63ee Dong Aisheng 2020-07-29  576  	struct imx_scu_clk_node clk =
=3D {
77d8f3068c63ee Dong Aisheng 2020-07-29  577  		.name =3D name,
77d8f3068c63ee Dong Aisheng 2020-07-29  578  		.rsrc =3D rsrc_id,
77d8f3068c63ee Dong Aisheng 2020-07-29  579  		.clk_type =3D clk_type,
77d8f3068c63ee Dong Aisheng 2020-07-29  580  		.parents =3D parents,
77d8f3068c63ee Dong Aisheng 2020-07-29  581  		.num_parents =3D num_parents,
77d8f3068c63ee Dong Aisheng 2020-07-29  582  	};
77d8f3068c63ee Dong Aisheng 2020-07-29  583  	struct platform_device *pdev;
77d8f3068c63ee Dong Aisheng 2020-07-29  584  	int ret;
77d8f3068c63ee Dong Aisheng 2020-07-29  585  =

77d8f3068c63ee Dong Aisheng 2020-07-29  586  	pdev =3D platform_device_allo=
c(name, PLATFORM_DEVID_NONE);
77d8f3068c63ee Dong Aisheng 2020-07-29  587  	if (!pdev) {
77d8f3068c63ee Dong Aisheng 2020-07-29  588  		pr_err("%s: failed to alloca=
te scu clk dev rsrc %d type %d\n",
77d8f3068c63ee Dong Aisheng 2020-07-29  589  		       name, rsrc_id, clk_ty=
pe);
77d8f3068c63ee Dong Aisheng 2020-07-29  590  		return ERR_PTR(-ENOMEM);
77d8f3068c63ee Dong Aisheng 2020-07-29  591  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  592  =

77d8f3068c63ee Dong Aisheng 2020-07-29  593  	ret =3D platform_device_add_d=
ata(pdev, &clk, sizeof(clk));
77d8f3068c63ee Dong Aisheng 2020-07-29  594  	if (ret) {
77d8f3068c63ee Dong Aisheng 2020-07-29  595  		platform_device_put(pdev);
77d8f3068c63ee Dong Aisheng 2020-07-29  596  		return ERR_PTR(ret);
77d8f3068c63ee Dong Aisheng 2020-07-29  597  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  598  =

77d8f3068c63ee Dong Aisheng 2020-07-29  599  	pdev->driver_override =3D "im=
x-scu-clk";
77d8f3068c63ee Dong Aisheng 2020-07-29  600  =

77d8f3068c63ee Dong Aisheng 2020-07-29  601  	ret =3D imx_clk_scu_attach_pd=
(&pdev->dev, rsrc_id);
77d8f3068c63ee Dong Aisheng 2020-07-29  602  	if (ret)
77d8f3068c63ee Dong Aisheng 2020-07-29  603  		pr_warn("%s: failed to attac=
hed the power domain %d\n",
77d8f3068c63ee Dong Aisheng 2020-07-29  604  			name, ret);
77d8f3068c63ee Dong Aisheng 2020-07-29  605  =

77d8f3068c63ee Dong Aisheng 2020-07-29  606  	platform_device_add(pdev);
77d8f3068c63ee Dong Aisheng 2020-07-29  607  =

77d8f3068c63ee Dong Aisheng 2020-07-29  608  	/* For API backwards compatib=
lilty, simply return NULL for success */
77d8f3068c63ee Dong Aisheng 2020-07-29  609  	return NULL;
77d8f3068c63ee Dong Aisheng 2020-07-29  610  }
77d8f3068c63ee Dong Aisheng 2020-07-29  611  =

77d8f3068c63ee Dong Aisheng 2020-07-29  612  void imx_clk_scu_unregister(vo=
id)
77d8f3068c63ee Dong Aisheng 2020-07-29  613  {
77d8f3068c63ee Dong Aisheng 2020-07-29  614  	struct imx_scu_clk_node *clk;
77d8f3068c63ee Dong Aisheng 2020-07-29  615  	int i;
77d8f3068c63ee Dong Aisheng 2020-07-29  616  =

77d8f3068c63ee Dong Aisheng 2020-07-29  617  	for (i =3D 0; i < IMX_SC_R_LA=
ST; i++) {
77d8f3068c63ee Dong Aisheng 2020-07-29  618  		list_for_each_entry(clk, &im=
x_scu_clks[i], node) {
77d8f3068c63ee Dong Aisheng 2020-07-29  619  			clk_hw_unregister(clk->hw);
77d8f3068c63ee Dong Aisheng 2020-07-29  620  			kfree(clk);
77d8f3068c63ee Dong Aisheng 2020-07-29  621  		}
77d8f3068c63ee Dong Aisheng 2020-07-29  622  	}
77d8f3068c63ee Dong Aisheng 2020-07-29  623  }
5392c5de096a1c Dong Aisheng 2021-04-23  624  =

5392c5de096a1c Dong Aisheng 2021-04-23  625  static unsigned long clk_gpr_d=
iv_scu_recalc_rate(struct clk_hw *hw,
5392c5de096a1c Dong Aisheng 2021-04-23  626  						 unsigned long parent_ra=
te)
5392c5de096a1c Dong Aisheng 2021-04-23  627  {
5392c5de096a1c Dong Aisheng 2021-04-23  628  	struct clk_gpr_scu *clk =3D t=
o_clk_gpr_scu(hw);
5392c5de096a1c Dong Aisheng 2021-04-23  629  	unsigned long rate =3D 0;
5392c5de096a1c Dong Aisheng 2021-04-23  630  	u32 val;
5392c5de096a1c Dong Aisheng 2021-04-23  631  	int err;
5392c5de096a1c Dong Aisheng 2021-04-23  632  =

5392c5de096a1c Dong Aisheng 2021-04-23  633  	err =3D imx_sc_misc_get_contr=
ol(ccm_ipc_handle, clk->rsrc_id,
5392c5de096a1c Dong Aisheng 2021-04-23  634  				      clk->gpr_id, &val);
5392c5de096a1c Dong Aisheng 2021-04-23  635  =

5392c5de096a1c Dong Aisheng 2021-04-23  636  	rate  =3D val ? parent_rate /=
 2 : parent_rate;
5392c5de096a1c Dong Aisheng 2021-04-23  637  =

5392c5de096a1c Dong Aisheng 2021-04-23  638  	return err ? 0 : rate;
5392c5de096a1c Dong Aisheng 2021-04-23  639  }
5392c5de096a1c Dong Aisheng 2021-04-23  640  =

5392c5de096a1c Dong Aisheng 2021-04-23  641  static long clk_gpr_div_scu_ro=
und_rate(struct clk_hw *hw, unsigned long rate,
5392c5de096a1c Dong Aisheng 2021-04-23 @642  				   unsigned long *prate)
5392c5de096a1c Dong Aisheng 2021-04-23  643  {
5392c5de096a1c Dong Aisheng 2021-04-23  644  	if (rate < *prate)
5392c5de096a1c Dong Aisheng 2021-04-23  645  		rate =3D *prate / 2;
5392c5de096a1c Dong Aisheng 2021-04-23  646  	else
5392c5de096a1c Dong Aisheng 2021-04-23  647  		rate =3D *prate;
5392c5de096a1c Dong Aisheng 2021-04-23  648  =

5392c5de096a1c Dong Aisheng 2021-04-23  649  	return rate;
5392c5de096a1c Dong Aisheng 2021-04-23  650  }
5392c5de096a1c Dong Aisheng 2021-04-23  651  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3707657925613406414==--

