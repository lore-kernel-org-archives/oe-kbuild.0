Content-Type: multipart/mixed; boundary="===============7561827404019006592=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:broonie/sound/for-5.20 28/56] sound/soc/fsl/fsl_mqs.c:206:26: warning: dereference of NULL '0' [CWE-476]
Date: Sun, 12 Jun 2022 04:20:05 +0800
Message-ID: <202206120456.jvGYlF6s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7561827404019006592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: sound/soc=
/fsl/fsl_mqs.c:206:26: warning: dereference of NULL '0' [CWE-476] [-Wanalyz=
er-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block broonie/sound/for-5.20
head:   55e1c007e1bd3b30efac683f6d7eba6d4a13928d
commit: 063c915502b914a5a621458c763dfc28286f7606 [28/56] ASoC: fsl_mqs: sim=
plify the code with adding fsl_mqs_soc_data
:::::: branch date: 27 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
612/202206120456.jvGYlF6s-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/063c915502b914a=
5a621458c763dfc28286f7606
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block broonie/sound/for-5.20
        git checkout 063c915502b914a5a621458c763dfc28286f7606
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   sound/soc/fsl/fsl_mqs.c: In function 'fsl_mqs_probe':
>> sound/soc/fsl/fsl_mqs.c:206:26: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     206 |         if (mqs_priv->soc->use_gpr) {
         |             ~~~~~~~~~~~~~^~~~~~~~~
     'fsl_mqs_probe': events 1-4
       |
       |  197 |         if (!mqs_priv)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  204 |         mqs_priv->soc =3D of_device_get_match_data(&pdev->d=
ev);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) ...to here
       |      |                       (3) '0' is NULL
       |  205 | =

       |  206 |         if (mqs_priv->soc->use_gpr) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) dereference of NULL '0'
       |

vim +/0 +206 sound/soc/fsl/fsl_mqs.c

9e28f6532c611c Shengjiu Wang 2019-09-13  187  =

9e28f6532c611c Shengjiu Wang 2019-09-13  188  static int fsl_mqs_probe(stru=
ct platform_device *pdev)
9e28f6532c611c Shengjiu Wang 2019-09-13  189  {
9e28f6532c611c Shengjiu Wang 2019-09-13  190  	struct device_node *np =3D p=
dev->dev.of_node;
a9d273671440c4 Dan Carpenter 2019-10-04  191  	struct device_node *gpr_np =
=3D NULL;
9e28f6532c611c Shengjiu Wang 2019-09-13  192  	struct fsl_mqs *mqs_priv;
9e28f6532c611c Shengjiu Wang 2019-09-13  193  	void __iomem *regs;
a9d273671440c4 Dan Carpenter 2019-10-04  194  	int ret;
9e28f6532c611c Shengjiu Wang 2019-09-13  195  =

9e28f6532c611c Shengjiu Wang 2019-09-13  196  	mqs_priv =3D devm_kzalloc(&p=
dev->dev, sizeof(*mqs_priv), GFP_KERNEL);
9e28f6532c611c Shengjiu Wang 2019-09-13  197  	if (!mqs_priv)
9e28f6532c611c Shengjiu Wang 2019-09-13  198  		return -ENOMEM;
9e28f6532c611c Shengjiu Wang 2019-09-13  199  =

9e28f6532c611c Shengjiu Wang 2019-09-13  200  	/* On i.MX6sx the MQS contro=
l register is in GPR domain
9e28f6532c611c Shengjiu Wang 2019-09-13  201  	 * But in i.MX8QM/i.MX8QXP t=
he control register is moved
9e28f6532c611c Shengjiu Wang 2019-09-13  202  	 * to its own domain.
9e28f6532c611c Shengjiu Wang 2019-09-13  203  	 */
063c915502b914 Shengjiu Wang 2022-05-25  204  	mqs_priv->soc =3D of_device_=
get_match_data(&pdev->dev);
9e28f6532c611c Shengjiu Wang 2019-09-13  205  =

063c915502b914 Shengjiu Wang 2022-05-25 @206  	if (mqs_priv->soc->use_gpr) {
9e28f6532c611c Shengjiu Wang 2019-09-13  207  		gpr_np =3D of_parse_phandle=
(np, "gpr", 0);
a9d273671440c4 Dan Carpenter 2019-10-04  208  		if (!gpr_np) {
9e28f6532c611c Shengjiu Wang 2019-09-13  209  			dev_err(&pdev->dev, "faile=
d to get gpr node by phandle\n");
a9d273671440c4 Dan Carpenter 2019-10-04  210  			return -EINVAL;
9e28f6532c611c Shengjiu Wang 2019-09-13  211  		}
9e28f6532c611c Shengjiu Wang 2019-09-13  212  =

9e28f6532c611c Shengjiu Wang 2019-09-13  213  		mqs_priv->regmap =3D syscon=
_node_to_regmap(gpr_np);
9e28f6532c611c Shengjiu Wang 2019-09-13  214  		if (IS_ERR(mqs_priv->regmap=
)) {
9e28f6532c611c Shengjiu Wang 2019-09-13  215  			dev_err(&pdev->dev, "faile=
d to get gpr regmap\n");
9e28f6532c611c Shengjiu Wang 2019-09-13  216  			ret =3D PTR_ERR(mqs_priv->=
regmap);
a9d273671440c4 Dan Carpenter 2019-10-04  217  			goto err_free_gpr_np;
9e28f6532c611c Shengjiu Wang 2019-09-13  218  		}
9e28f6532c611c Shengjiu Wang 2019-09-13  219  	} else {
9e28f6532c611c Shengjiu Wang 2019-09-13  220  		regs =3D devm_platform_iore=
map_resource(pdev, 0);
9e28f6532c611c Shengjiu Wang 2019-09-13  221  		if (IS_ERR(regs))
9e28f6532c611c Shengjiu Wang 2019-09-13  222  			return PTR_ERR(regs);
9e28f6532c611c Shengjiu Wang 2019-09-13  223  =

9e28f6532c611c Shengjiu Wang 2019-09-13  224  		mqs_priv->regmap =3D devm_r=
egmap_init_mmio_clk(&pdev->dev,
9e28f6532c611c Shengjiu Wang 2019-09-13  225  							     "core",
9e28f6532c611c Shengjiu Wang 2019-09-13  226  							     regs,
9e28f6532c611c Shengjiu Wang 2019-09-13  227  							     &fsl_mqs_regmap_c=
onfig);
9e28f6532c611c Shengjiu Wang 2019-09-13  228  		if (IS_ERR(mqs_priv->regmap=
)) {
9e28f6532c611c Shengjiu Wang 2019-09-13  229  			dev_err(&pdev->dev, "faile=
d to init regmap: %ld\n",
9e28f6532c611c Shengjiu Wang 2019-09-13  230  				PTR_ERR(mqs_priv->regmap)=
);
9e28f6532c611c Shengjiu Wang 2019-09-13  231  			return PTR_ERR(mqs_priv->r=
egmap);
9e28f6532c611c Shengjiu Wang 2019-09-13  232  		}
9e28f6532c611c Shengjiu Wang 2019-09-13  233  =

9e28f6532c611c Shengjiu Wang 2019-09-13  234  		mqs_priv->ipg =3D devm_clk_=
get(&pdev->dev, "core");
9e28f6532c611c Shengjiu Wang 2019-09-13  235  		if (IS_ERR(mqs_priv->ipg)) {
9e28f6532c611c Shengjiu Wang 2019-09-13  236  			dev_err(&pdev->dev, "faile=
d to get the clock: %ld\n",
9e28f6532c611c Shengjiu Wang 2019-09-13  237  				PTR_ERR(mqs_priv->ipg));
a9d273671440c4 Dan Carpenter 2019-10-04  238  			return PTR_ERR(mqs_priv->i=
pg);
9e28f6532c611c Shengjiu Wang 2019-09-13  239  		}
9e28f6532c611c Shengjiu Wang 2019-09-13  240  	}
9e28f6532c611c Shengjiu Wang 2019-09-13  241  =

9e28f6532c611c Shengjiu Wang 2019-09-13  242  	mqs_priv->mclk =3D devm_clk_=
get(&pdev->dev, "mclk");
9e28f6532c611c Shengjiu Wang 2019-09-13  243  	if (IS_ERR(mqs_priv->mclk)) {
9e28f6532c611c Shengjiu Wang 2019-09-13  244  		dev_err(&pdev->dev, "failed=
 to get the clock: %ld\n",
9e28f6532c611c Shengjiu Wang 2019-09-13  245  			PTR_ERR(mqs_priv->mclk));
a9d273671440c4 Dan Carpenter 2019-10-04  246  		ret =3D PTR_ERR(mqs_priv->m=
clk);
a9d273671440c4 Dan Carpenter 2019-10-04  247  		goto err_free_gpr_np;
9e28f6532c611c Shengjiu Wang 2019-09-13  248  	}
9e28f6532c611c Shengjiu Wang 2019-09-13  249  =

9e28f6532c611c Shengjiu Wang 2019-09-13  250  	dev_set_drvdata(&pdev->dev, =
mqs_priv);
9e28f6532c611c Shengjiu Wang 2019-09-13  251  	pm_runtime_enable(&pdev->dev=
);
9e28f6532c611c Shengjiu Wang 2019-09-13  252  =

a9d273671440c4 Dan Carpenter 2019-10-04  253  	ret =3D devm_snd_soc_registe=
r_component(&pdev->dev, &soc_codec_fsl_mqs,
9e28f6532c611c Shengjiu Wang 2019-09-13  254  			&fsl_mqs_dai, 1);
a9d273671440c4 Dan Carpenter 2019-10-04  255  	if (ret)
a9d273671440c4 Dan Carpenter 2019-10-04  256  		goto err_free_gpr_np;
a9d273671440c4 Dan Carpenter 2019-10-04  257  	return 0;
a9d273671440c4 Dan Carpenter 2019-10-04  258  =

a9d273671440c4 Dan Carpenter 2019-10-04  259  err_free_gpr_np:
9e28f6532c611c Shengjiu Wang 2019-09-13  260  	of_node_put(gpr_np);
9e28f6532c611c Shengjiu Wang 2019-09-13  261  =

9e28f6532c611c Shengjiu Wang 2019-09-13  262  	return ret;
9e28f6532c611c Shengjiu Wang 2019-09-13  263  }
9e28f6532c611c Shengjiu Wang 2019-09-13  264  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7561827404019006592==--

