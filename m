Content-Type: multipart/mixed; boundary="===============9085420286778959747=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH for-5.8 v2] usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails
Date: Sat, 04 Jul 2020 14:04:10 +0800
Message-ID: <202007041356.9lXHcAMi%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9085420286778959747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200703225043.387769-1-martin.blumenstingl@googlemail.com>
References: <20200703225043.387769-1-martin.blumenstingl@googlemail.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
TO: hminas(a)synopsys.com
TO: gregkh(a)linuxfoundation.org
TO: linux-usb(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: marex(a)denx.de
CC: stable(a)vger.kernel.org
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Hi Martin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v5.8-rc3 next-20200703]
[cannot apply to balbi-usb/testing/next peter.chen-usb/ci-for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Martin-Blumenstingl/usb-dw=
c2-Add-missing-cleanups-when-usb_add_gadget_udc-fails/20200704-065314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-s022-20200702 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-3-gfa153962-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/dwc2/platform.c:591:1: sparse: sparse: unused label 'error_d=
ebugfs'

# https://github.com/0day-ci/linux/commit/67a20d5fad7c28a1e955244ff3712266b=
0a4bc76
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 67a20d5fad7c28a1e955244ff3712266b0a4bc76
vim +/error_debugfs +591 drivers/usb/dwc2/platform.c

65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  395  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  396  /**
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  397   * dwc2_driver_probe() - Called when the DWC_otg core is bound=
 to the DWC_otg
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  398   * driver
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  399   *
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  400   * @dev: Platform device
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  401   *
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  402   * This routine creates the driver components required to cont=
rol the device
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  403   * (core, HCD, and PCD) and initializes the device. The driver=
 components are
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  404   * stored in a dwc2_hsotg structure. A reference to the dwc2_h=
sotg is saved
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  405   * in the device private data. This allows the driver to acces=
s the dwc2_hsotg
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  406   * structure on subsequent calls to driver methods for this de=
vice.
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  407   */
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  408  static int dwc2_driver_probe(struct platform_device *dev)
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  409  {
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  410  	struct dwc2_hsotg *hsotg;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  411  	struct resource *res;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  412  	int retval;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  413  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  414  	hsotg =3D devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  415  	if (!hsotg)
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  416  		return -ENOMEM;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  417  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  418  	hsotg->dev =3D &dev->dev;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  419  =

642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  420  	/*
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  421  	 * Use reasonable defaults so platforms don't have to provide=
 these.
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  422  	 */
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  423  	if (!dev->dev.dma_mask)
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  424  		dev->dev.dma_mask =3D &dev->dev.coherent_dma_mask;
4cdbb4ff7fe456 drivers/staging/dwc2/platform.c Russell King            2013=
-06-10  425  	retval =3D dma_set_coherent_mask(&dev->dev, DMA_BIT_MASK(32));
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  426  	if (retval) {
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  427  		dev_err(&dev->dev, "can't set coherent DMA mask: %d\n", retv=
al);
4cdbb4ff7fe456 drivers/staging/dwc2/platform.c Russell King            2013=
-06-10  428  		return retval;
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  429  	}
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  430  =

5bf7e2883f1242 drivers/usb/dwc2/platform.c     Dejin Zheng             2020=
-03-24  431  	hsotg->regs =3D devm_platform_get_and_ioremap_resource(dev, 0=
, &res);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  432  	if (IS_ERR(hsotg->regs))
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  433  		return PTR_ERR(hsotg->regs);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  434  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  435  	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  436  		(unsigned long)res->start, hsotg->regs);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  437  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  438  	retval =3D dwc2_lowlevel_hw_init(hsotg);
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  439  	if (retval)
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  440  		return retval;
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  441  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  442  	spin_lock_init(&hsotg->lock);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  443  =

a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  444  	hsotg->irq =3D platform_get_irq(dev, 0);
b33f37064b743d drivers/usb/dwc2/platform.c     Stephen Boyd            2019=
-07-30  445  	if (hsotg->irq < 0)
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  446  		return hsotg->irq;
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  447  =

f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  448  	dev_dbg(hsotg->dev, "registering common handler for irq%d\n",
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  449  		hsotg->irq);
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  450  	retval =3D devm_request_irq(hsotg->dev, hsotg->irq,
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  451  				  dwc2_handle_common_intr, IRQF_SHARED,
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  452  				  dev_name(hsotg->dev), hsotg);
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  453  	if (retval)
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  454  		return retval;
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  455  =

e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  456  	hsotg->vbus_supply =3D devm_regulator_get_optional(hsotg->dev=
, "vbus");
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  457  	if (IS_ERR(hsotg->vbus_supply)) {
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  458  		retval =3D PTR_ERR(hsotg->vbus_supply);
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  459  		hsotg->vbus_supply =3D NULL;
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  460  		if (retval !=3D -ENODEV)
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  461  			return retval;
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  462  	}
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  463  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  464  	retval =3D dwc2_lowlevel_hw_enable(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  465  	if (retval)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  466  		return retval;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  467  =

d9707490077bee drivers/usb/dwc2/platform.c     Bruno Meirelles Herrera 2018=
-08-27  468  	hsotg->needs_byte_swap =3D dwc2_check_core_endianness(hsotg);
d9707490077bee drivers/usb/dwc2/platform.c     Bruno Meirelles Herrera 2018=
-08-27  469  =

5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  470  	retval =3D dwc2_get_dr_mode(hsotg);
5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  471  	if (retval)
a6ef3e02542a33 drivers/usb/dwc2/platform.c     John Youn               2016=
-04-27  472  		goto error;
5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  473  =

c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  474  	hsotg->need_phy_for_wake =3D
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  475  		of_property_read_bool(dev->dev.of_node,
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  476  				      "snps,need-phy-for-wake");
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  477  =

65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  478  	/*
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  479  	 * Before performing any core related operations
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  480  	 * check core version.
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  481  	 */
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  482  	retval =3D dwc2_check_core_version(hsotg);
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  483  	if (retval)
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  484  		goto error;
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  485  =

03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  486  	/*
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  487  	 * Reset before dwc2_get_hwparams() then it could get power-o=
n real
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  488  	 * reset value form registers.
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  489  	 */
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  490  	retval =3D dwc2_core_reset(hsotg, false);
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  491  	if (retval)
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  492  		goto error;
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  493  =

03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  494  	/* Detect config values from hardware */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  495  	retval =3D dwc2_get_hwparams(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  496  	if (retval)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  497  		goto error;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  498  =

13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  499  	/*
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  500  	 * For OTG cores, set the force mode bits to reflect the value
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  501  	 * of dr_mode. Force mode bits should not be touched at any
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  502  	 * other time after this.
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  503  	 */
25362d318371e1 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  504  	dwc2_force_dr_mode(hsotg);
263b7fb557f797 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  505  =

334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  506  	retval =3D dwc2_init_params(hsotg);
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  507  	if (retval)
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  508  		goto error;
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  509  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  510  	if (hsotg->params.activate_stm_id_vb_detection) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  511  		u32 ggpio;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  512  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  513  		hsotg->usb33d =3D devm_regulator_get(hsotg->dev, "usb33d");
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  514  		if (IS_ERR(hsotg->usb33d)) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  515  			retval =3D PTR_ERR(hsotg->usb33d);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  516  			if (retval !=3D -EPROBE_DEFER)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  517  				dev_err(hsotg->dev,
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  518  					"failed to request usb33d supply: %d\n",
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  519  					retval);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  520  			goto error;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  521  		}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  522  		retval =3D regulator_enable(hsotg->usb33d);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  523  		if (retval) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  524  			dev_err(hsotg->dev,
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  525  				"failed to enable usb33d supply: %d\n", retval);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  526  			goto error;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  527  		}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  528  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  529  		ggpio =3D dwc2_readl(hsotg, GGPIO);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  530  		ggpio |=3D GGPIO_STM32_OTG_GCCFG_IDEN;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  531  		ggpio |=3D GGPIO_STM32_OTG_GCCFG_VBDEN;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  532  		dwc2_writel(hsotg, ggpio, GGPIO);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  533  	}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  534  =

e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  535  	if (hsotg->dr_mode !=3D USB_DR_MODE_HOST) {
f3768997013e1c drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2017=
-12-25  536  		retval =3D dwc2_gadget_init(hsotg);
117777b2c3bb96 drivers/usb/dwc2/platform.c     Dinh Nguyen             2014=
-11-11  537  		if (retval)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  538  			goto error_init;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  539  		hsotg->gadget_enabled =3D 1;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  540  	}
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  541  =

c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  542  	/*
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  543  	 * If we need PHY for wakeup we must be wakeup capable.
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  544  	 * When we have a device that can wake without the PHY we
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  545  	 * can adjust this condition.
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  546  	 */
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  547  	if (hsotg->need_phy_for_wake)
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  548  		device_set_wakeup_capable(&dev->dev, true);
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  549  =

c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  550  	hsotg->reset_phy_on_wake =3D
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  551  		of_property_read_bool(dev->dev.of_node,
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  552  				      "snps,reset-phy-on-wake");
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  553  	if (hsotg->reset_phy_on_wake && !hsotg->phy) {
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  554  		dev_warn(hsotg->dev,
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  555  			 "Quirk reset-phy-on-wake only supports generic PHYs\n");
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  556  		hsotg->reset_phy_on_wake =3D false;
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  557  	}
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  558  =

e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  559  	if (hsotg->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
4fe160d51e4226 drivers/usb/dwc2/platform.c     Heiner Kallweit         2017=
-01-25  560  		retval =3D dwc2_hcd_init(hsotg);
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  561  		if (retval) {
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  562  			if (hsotg->gadget_enabled)
1f91b4cc03556b drivers/usb/dwc2/platform.c     Felipe Balbi            2015=
-08-06  563  				dwc2_hsotg_remove(hsotg);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  564  			goto error_init;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  565  		}
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  566  		hsotg->hcd_enabled =3D 1;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  567  	}
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  568  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  569  	platform_set_drvdata(dev, hsotg);
20fe440982e72d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  570  	hsotg->hibernated =3D 0;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  571  =

f91eea447ac32d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  572  	dwc2_debugfs_init(hsotg);
f91eea447ac32d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  573  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  574  	/* Gadget code manages lowlevel hw on its own */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  575  	if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  576  		dwc2_lowlevel_hw_disable(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  577  =

207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  578  #if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  579  	IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  580  	/* Postponed adding a new gadget to the udc class driver list=
 */
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  581  	if (hsotg->gadget_enabled) {
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  582  		retval =3D usb_add_gadget_udc(hsotg->dev, &hsotg->gadget);
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  583  		if (retval) {
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  584  			dwc2_hsotg_remove(hsotg);
67a20d5fad7c28 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  585  			goto error_debugfs;
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  586  		}
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  587  	}
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  588  #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_R=
OLE */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  589  	return 0;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  590  =

67a20d5fad7c28 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04 @591  error_debugfs:
67a20d5fad7c28 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  592  	dwc2_debugfs_exit(hsotg);
67a20d5fad7c28 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  593  	if (hsotg->hcd_enabled)
67a20d5fad7c28 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  594  		dwc2_hcd_remove(hsotg);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  595  error_init:
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  596  	if (hsotg->params.activate_stm_id_vb_detection)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  597  		regulator_disable(hsotg->usb33d);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  598  error:
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  599  	dwc2_lowlevel_hw_disable(hsotg);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  600  	return retval;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  601  }
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  602  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9085420286778959747==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
KHUCLGhCnD1xvVQ0ygPnf4LcaXTvfQIA
--===============9085420286778959747==--

