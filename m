Content-Type: multipart/mixed; boundary="===============6047985353929768298=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4218/9128] drivers/clk/imx/clk-imx8qxp-lpcg.c:258 imx_lpcg_parse_clks_from_dt() error: buffer overflow 'clk_hws' 8 <= 8
Date: Mon, 28 Feb 2022 03:30:15 +0800
Message-ID: <202202280348.GvA8u6Xg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6047985353929768298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 1c1d836b96ba1bd773881c7f4784c77b94d58e25 [4218/9128] overflow: Prov=
ide constant expression struct_size
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-m031-20220227 (https://download.01.org/0day-ci/arc=
hive/20220228/202202280348.GvA8u6Xg-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/clk/imx/clk-imx8qxp-lpcg.c:258 imx_lpcg_parse_clks_from_dt() error:=
 buffer overflow 'clk_hws' 8 <=3D 8

Old smatch warnings:
drivers/clk/imx/clk-imx8qxp-lpcg.c:261 imx_lpcg_parse_clks_from_dt() error:=
 buffer overflow 'clk_hws' 8 <=3D 8
drivers/clk/imx/clk-imx8qxp-lpcg.c:264 imx_lpcg_parse_clks_from_dt() error:=
 buffer overflow 'clk_hws' 8 <=3D 8

vim +/clk_hws +258 drivers/clk/imx/clk-imx8qxp-lpcg.c

d5f1e6a2bb61db Dong Aisheng 2020-07-29  177  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  178  static int imx_lpcg_parse_clks=
_from_dt(struct platform_device *pdev,
d5f1e6a2bb61db Dong Aisheng 2020-07-29  179  				       struct device_node =
*np)
d5f1e6a2bb61db Dong Aisheng 2020-07-29  180  {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  181  	const char *output_names[IMX_=
LPCG_MAX_CLKS];
d5f1e6a2bb61db Dong Aisheng 2020-07-29  182  	const char *parent_names[IMX_=
LPCG_MAX_CLKS];
d5f1e6a2bb61db Dong Aisheng 2020-07-29  183  	unsigned int bit_offset[IMX_L=
PCG_MAX_CLKS];
d5f1e6a2bb61db Dong Aisheng 2020-07-29  184  	struct clk_hw_onecell_data *c=
lk_data;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  185  	struct clk_hw **clk_hws;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  186  	struct resource *res;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  187  	void __iomem *base;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  188  	int count;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  189  	int idx;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  190  	int ret;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  191  	int i;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  192  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  193  	if (!of_device_is_compatible(=
np, "fsl,imx8qxp-lpcg"))
d5f1e6a2bb61db Dong Aisheng 2020-07-29  194  		return -EINVAL;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  195  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  196  	res =3D platform_get_resource=
(pdev, IORESOURCE_MEM, 0);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  197  	base =3D devm_ioremap_resourc=
e(&pdev->dev, res);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  198  	if (IS_ERR(base))
d5f1e6a2bb61db Dong Aisheng 2020-07-29  199  		return PTR_ERR(base);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  200  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  201  	count =3D of_property_count_u=
32_elems(np, "clock-indices");
d5f1e6a2bb61db Dong Aisheng 2020-07-29  202  	if (count < 0) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  203  		dev_err(&pdev->dev, "failed =
to count clocks\n");
d5f1e6a2bb61db Dong Aisheng 2020-07-29  204  		return -EINVAL;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  205  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  206  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  207  	/*
d5f1e6a2bb61db Dong Aisheng 2020-07-29  208  	 * A trick here is that we se=
t the num of clks to the MAX instead
d5f1e6a2bb61db Dong Aisheng 2020-07-29  209  	 * of the count from clock-in=
dices because one LPCG supports up to
d5f1e6a2bb61db Dong Aisheng 2020-07-29  210  	 * 8 clock outputs which each=
 of them is fixed to 4 bits. Then we can
d5f1e6a2bb61db Dong Aisheng 2020-07-29  211  	 * easily get the clock by cl=
k-indices (bit-offset) / 4.
d5f1e6a2bb61db Dong Aisheng 2020-07-29  212  	 * And the cost is very limit=
ed few pointers.
d5f1e6a2bb61db Dong Aisheng 2020-07-29  213  	 */
d5f1e6a2bb61db Dong Aisheng 2020-07-29  214  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  215  	clk_data =3D devm_kzalloc(&pd=
ev->dev, struct_size(clk_data, hws,
d5f1e6a2bb61db Dong Aisheng 2020-07-29  216  				IMX_LPCG_MAX_CLKS), GFP_KE=
RNEL);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  217  	if (!clk_data)
d5f1e6a2bb61db Dong Aisheng 2020-07-29  218  		return -ENOMEM;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  219  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  220  	clk_data->num =3D IMX_LPCG_MA=
X_CLKS;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  221  	clk_hws =3D clk_data->hws;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  222  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  223  	ret =3D of_property_read_u32_=
array(np, "clock-indices", bit_offset,
d5f1e6a2bb61db Dong Aisheng 2020-07-29  224  					 count);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  225  	if (ret < 0) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  226  		dev_err(&pdev->dev, "failed =
to read clock-indices\n");
d5f1e6a2bb61db Dong Aisheng 2020-07-29  227  		return -EINVAL;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  228  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  229  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  230  	ret =3D of_clk_parent_fill(np=
, parent_names, count);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  231  	if (ret !=3D count) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  232  		dev_err(&pdev->dev, "failed =
to get clock parent names\n");
d5f1e6a2bb61db Dong Aisheng 2020-07-29  233  		return count;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  234  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  235  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  236  	ret =3D of_property_read_stri=
ng_array(np, "clock-output-names",
d5f1e6a2bb61db Dong Aisheng 2020-07-29  237  					    output_names, count);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  238  	if (ret !=3D count) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  239  		dev_err(&pdev->dev, "failed =
to read clock-output-names\n");
d5f1e6a2bb61db Dong Aisheng 2020-07-29  240  		return -EINVAL;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  241  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  242  =

18cdbad40c6c13 Dong Aisheng 2020-07-29  243  	pm_runtime_get_noresume(&pdev=
->dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  244  	pm_runtime_set_active(&pdev->=
dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  245  	pm_runtime_set_autosuspend_de=
lay(&pdev->dev, 500);
18cdbad40c6c13 Dong Aisheng 2020-07-29  246  	pm_runtime_use_autosuspend(&p=
dev->dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  247  	pm_runtime_enable(&pdev->dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  248  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  249  	for (i =3D 0; i < count; i++)=
 {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  250  		idx =3D bit_offset[i] / 4;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  251  		if (idx > IMX_LPCG_MAX_CLKS)=
 {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  252  			dev_warn(&pdev->dev, "inval=
id bit offset of clock %d\n",
d5f1e6a2bb61db Dong Aisheng 2020-07-29  253  				 i);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  254  			ret =3D -EINVAL;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  255  			goto unreg;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  256  		}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  257  =

18cdbad40c6c13 Dong Aisheng 2020-07-29 @258  		clk_hws[idx] =3D imx_clk_lpc=
g_scu_dev(&pdev->dev, output_names[i],
d5f1e6a2bb61db Dong Aisheng 2020-07-29  259  						    parent_names[i], 0, =
base,
d5f1e6a2bb61db Dong Aisheng 2020-07-29  260  						    bit_offset[i], false=
);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  261  		if (IS_ERR(clk_hws[idx])) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  262  			dev_warn(&pdev->dev, "faile=
d to register clock %d\n",
d5f1e6a2bb61db Dong Aisheng 2020-07-29  263  				 idx);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  264  			ret =3D PTR_ERR(clk_hws[idx=
]);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  265  			goto unreg;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  266  		}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  267  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  268  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  269  	ret =3D devm_of_clk_add_hw_pr=
ovider(&pdev->dev, imx_lpcg_of_clk_src_get,
d5f1e6a2bb61db Dong Aisheng 2020-07-29  270  					  clk_data);
18cdbad40c6c13 Dong Aisheng 2020-07-29  271  	if (ret)
18cdbad40c6c13 Dong Aisheng 2020-07-29  272  		goto unreg;
18cdbad40c6c13 Dong Aisheng 2020-07-29  273  =

18cdbad40c6c13 Dong Aisheng 2020-07-29  274  	pm_runtime_mark_last_busy(&pd=
ev->dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  275  	pm_runtime_put_autosuspend(&p=
dev->dev);
18cdbad40c6c13 Dong Aisheng 2020-07-29  276  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  277  	return 0;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  278  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  279  unreg:
d5f1e6a2bb61db Dong Aisheng 2020-07-29  280  	while (--i >=3D 0) {
d5f1e6a2bb61db Dong Aisheng 2020-07-29  281  		idx =3D bit_offset[i] / 4;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  282  		if (clk_hws[idx])
d5f1e6a2bb61db Dong Aisheng 2020-07-29  283  			imx_clk_lpcg_scu_unregister=
(clk_hws[idx]);
d5f1e6a2bb61db Dong Aisheng 2020-07-29  284  	}
d5f1e6a2bb61db Dong Aisheng 2020-07-29  285  =

18cdbad40c6c13 Dong Aisheng 2020-07-29  286  	pm_runtime_disable(&pdev->dev=
);
18cdbad40c6c13 Dong Aisheng 2020-07-29  287  =

d5f1e6a2bb61db Dong Aisheng 2020-07-29  288  	return ret;
d5f1e6a2bb61db Dong Aisheng 2020-07-29  289  }
d5f1e6a2bb61db Dong Aisheng 2020-07-29  290  =


:::::: The code at line 258 was first introduced by commit
:::::: 18cdbad40c6c138edf62273417180227e12b198a clk: imx: clk-imx8qxp-lpcg:=
 add runtime pm support

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6047985353929768298==--

