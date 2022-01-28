Content-Type: multipart/mixed; boundary="===============0893086916808967380=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/hdmi/hdmi.c:572:8: warning: sscanf() without field width limits can crash with huge input data. [invalidscanf]
Date: Sat, 29 Jan 2022 05:03:27 +0800
Message-ID: <202201290202.pHo7p9y6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0893086916808967380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   145d9b498fc827b79c1260b4caa29a8e59d4c2b9
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/hdmi/hdmi.c:572:8: warning: sscanf() without field w=
idth limits can crash with huge input data. [invalidscanf]
      if (sscanf(name, "qcom,hdmi-tx-%s", name3))
          ^

vim +572 drivers/gpu/drm/msm/hdmi/hdmi.c

f14270161a2362 Srinivas Kandagatla 2016-06-10  530  =

fcda50c8f484cf Arnd Bergmann       2016-02-22  531  static int msm_hdmi_bin=
d(struct device *dev, struct device *master, void *data)
fc886107c55634 Mark Charlebois     2014-08-29  532  {
d1a717bd2719d6 Rob Clark           2014-11-18  533  	struct drm_device *drm=
 =3D dev_get_drvdata(master);
d1a717bd2719d6 Rob Clark           2014-11-18  534  	struct msm_drm_private=
 *priv =3D drm->dev_private;
671465198e3970 YueHaibing          2018-11-14  535  	struct hdmi_platform_c=
onfig *hdmi_cfg;
067fef372c7356 Rob Clark           2014-11-04  536  	struct hdmi *hdmi;
fc886107c55634 Mark Charlebois     2014-08-29  537  	struct device_node *of=
_node =3D dev->of_node;
f14270161a2362 Srinivas Kandagatla 2016-06-10  538  	int i, err;
dada25bd22a52a Rob Clark           2013-12-01  539  =

1fd6a4412c98a4 Archit Taneja       2015-10-30  540  	hdmi_cfg =3D (struct h=
dmi_platform_config *)
1fd6a4412c98a4 Archit Taneja       2015-10-30  541  			of_device_get_match_=
data(dev);
1fd6a4412c98a4 Archit Taneja       2015-10-30  542  	if (!hdmi_cfg) {
6a41da17e87dee Mamta Shukla        2018-10-20  543  		DRM_DEV_ERROR(dev, "u=
nknown hdmi_cfg: %pOFn\n", of_node);
5eba5d870f7234 Stephane Viau       2015-01-07  544  		return -ENXIO;
41e69778c80764 Rob Clark           2013-12-15  545  	}
41e69778c80764 Rob Clark           2013-12-15  546  =

5eba5d870f7234 Stephane Viau       2015-01-07  547  	hdmi_cfg->mmio_name   =
  =3D "core_physical";
c6a57a50ad562a jilai wang          2015-04-02  548  	hdmi_cfg->qfprom_mmio_=
name =3D "qfprom_physical";
dc50f782c99a48 Archit Taneja       2016-02-25  549  =

dc50f782c99a48 Archit Taneja       2016-02-25  550  	for (i =3D 0; i < HDMI=
_MAX_NUM_GPIO; i++) {
a44769b407ecd9 Linus Walleij       2019-06-29  551  		const char *name =3D =
msm_hdmi_gpio_pdata[i].name;
a44769b407ecd9 Linus Walleij       2019-06-29  552  		struct gpio_desc *gpi=
od;
a44769b407ecd9 Linus Walleij       2019-06-29  553  =

a44769b407ecd9 Linus Walleij       2019-06-29  554  		/*
a44769b407ecd9 Linus Walleij       2019-06-29  555  		 * We are fetching th=
e GPIO lines "as is" since the connector
a44769b407ecd9 Linus Walleij       2019-06-29  556  		 * code is enabling a=
nd disabling the lines. Until that point
a44769b407ecd9 Linus Walleij       2019-06-29  557  		 * the power-on defau=
lt value will be kept.
a44769b407ecd9 Linus Walleij       2019-06-29  558  		 */
a44769b407ecd9 Linus Walleij       2019-06-29  559  		gpiod =3D devm_gpiod_=
get_optional(dev, name, GPIOD_ASIS);
a44769b407ecd9 Linus Walleij       2019-06-29  560  		/* This will catch e.=
g. -PROBE_DEFER */
a44769b407ecd9 Linus Walleij       2019-06-29  561  		if (IS_ERR(gpiod))
a44769b407ecd9 Linus Walleij       2019-06-29  562  			return PTR_ERR(gpiod=
);
a44769b407ecd9 Linus Walleij       2019-06-29  563  		if (!gpiod) {
a44769b407ecd9 Linus Walleij       2019-06-29  564  			/* Try a second time=
, stripping down the name */
a44769b407ecd9 Linus Walleij       2019-06-29  565  			char name3[32];
a44769b407ecd9 Linus Walleij       2019-06-29  566  =

a44769b407ecd9 Linus Walleij       2019-06-29  567  			/*
a44769b407ecd9 Linus Walleij       2019-06-29  568  			 * Try again after s=
tripping out the "qcom,hdmi-tx"
a44769b407ecd9 Linus Walleij       2019-06-29  569  			 * prefix. This is m=
ainly to match "hpd-gpios" used
a44769b407ecd9 Linus Walleij       2019-06-29  570  			 * in the upstream b=
indings.
a44769b407ecd9 Linus Walleij       2019-06-29  571  			 */
a44769b407ecd9 Linus Walleij       2019-06-29 @572  			if (sscanf(name, "qc=
om,hdmi-tx-%s", name3))
a44769b407ecd9 Linus Walleij       2019-06-29  573  				gpiod =3D devm_gpio=
d_get_optional(dev, name3, GPIOD_ASIS);
a44769b407ecd9 Linus Walleij       2019-06-29  574  			if (IS_ERR(gpiod))
a44769b407ecd9 Linus Walleij       2019-06-29  575  				return PTR_ERR(gpio=
d);
a44769b407ecd9 Linus Walleij       2019-06-29  576  			if (!gpiod)
a44769b407ecd9 Linus Walleij       2019-06-29  577  				DBG("failed to get =
gpio: %s", name);
a44769b407ecd9 Linus Walleij       2019-06-29  578  		}
a44769b407ecd9 Linus Walleij       2019-06-29  579  		hdmi_cfg->gpios[i].gp=
iod =3D gpiod;
a44769b407ecd9 Linus Walleij       2019-06-29  580  		if (gpiod)
a44769b407ecd9 Linus Walleij       2019-06-29  581  			gpiod_set_consumer_n=
ame(gpiod, msm_hdmi_gpio_pdata[i].label);
fcda50c8f484cf Arnd Bergmann       2016-02-22  582  		hdmi_cfg->gpios[i].ou=
tput =3D msm_hdmi_gpio_pdata[i].output;
fcda50c8f484cf Arnd Bergmann       2016-02-22  583  		hdmi_cfg->gpios[i].va=
lue =3D msm_hdmi_gpio_pdata[i].value;
dc50f782c99a48 Archit Taneja       2016-02-25  584  	}
dada25bd22a52a Rob Clark           2013-12-01  585  =

5eba5d870f7234 Stephane Viau       2015-01-07  586  	dev->platform_data =3D=
 hdmi_cfg;
5eba5d870f7234 Stephane Viau       2015-01-07  587  =

fcda50c8f484cf Arnd Bergmann       2016-02-22  588  	hdmi =3D msm_hdmi_init=
(to_platform_device(dev));
067fef372c7356 Rob Clark           2014-11-04  589  	if (IS_ERR(hdmi))
067fef372c7356 Rob Clark           2014-11-04  590  		return PTR_ERR(hdmi);
d1a717bd2719d6 Rob Clark           2014-11-18  591  	priv->hdmi =3D hdmi;
5eba5d870f7234 Stephane Viau       2015-01-07  592  =

f14270161a2362 Srinivas Kandagatla 2016-06-10  593  	err =3D msm_hdmi_regis=
ter_audio_driver(hdmi, dev);
f14270161a2362 Srinivas Kandagatla 2016-06-10  594  	if (err) {
f14270161a2362 Srinivas Kandagatla 2016-06-10  595  		DRM_ERROR("Failed to =
attach an audio codec %d\n", err);
f14270161a2362 Srinivas Kandagatla 2016-06-10  596  		hdmi->audio_pdev =3D =
NULL;
f14270161a2362 Srinivas Kandagatla 2016-06-10  597  	}
f14270161a2362 Srinivas Kandagatla 2016-06-10  598  =

c8afe684c95cd1 Rob Clark           2013-06-26  599  	return 0;
c8afe684c95cd1 Rob Clark           2013-06-26  600  }
c8afe684c95cd1 Rob Clark           2013-06-26  601  =


:::::: The code at line 572 was first introduced by commit
:::::: a44769b407ecd9df2dd86d8b855412e3aff8b41b drm/msm/hdmi: Convert to us=
e GPIO descriptors

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0893086916808967380==--

