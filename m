Content-Type: multipart/mixed; boundary="===============0118209350473673561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [groeck-staging:watchdog-next 12/32] drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to 'PTR_ERR'
Date: Thu, 09 Dec 2021 10:20:43 +0800
Message-ID: <202112091052.ZSHK1XkV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0118209350473673561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-hwmon(a)vger.kernel.org
TO: Sam Protsenko <semen.protsenko@linaro.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git watchdog-next
head:   59a29872ed5c746bba5898ed8e77c3e33d3aa9b6
commit: 5c0145c7f9262dfd7085239eca95b15967c539fe [12/32] watchdog: s3c2410:=
 Support separate source clock
:::::: branch date: 9 hours ago
:::::: commit date: 10 days ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211209/202112091052.ZSHK1XkV-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to=
 'PTR_ERR'

vim +/PTR_ERR +663 drivers/watchdog/s3c2410_wdt.c

4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  600  =

2d991a164a6185 drivers/watchdog/s3c2410_wdt.c      Bill Pemberton          =
 2012-11-19  601  static int s3c2410wdt_probe(struct platform_device *pdev)
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  602  {
08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-03-13  603  	struct device *dev =3D &pdev->dev;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  604  	struct s3c2410_wdt *wdt;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  605  	struct resource *wdt_irq;
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  606  	unsigned int wtcon;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  607  	int ret;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  608  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  609  	wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  610  	if (!wdt)
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  611  		return -ENOMEM;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  612  =

08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-03-13  613  	wdt->dev =3D dev;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  614  	spin_lock_init(&wdt->lock);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  615  	wdt->wdt_device =3D s3c2410_wdd;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  616  =

e3a60ead2c9b81 drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-02-24  617  	wdt->drv_data =3D s3c2410_get_wdt_drv_data(pdev);
cffc9a60ebac3b drivers/watchdog/s3c2410_wdt.c      Doug Anderson           =
 2013-12-06  618  	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  619  		wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of=
_node,
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  620  						"samsung,syscon-phandle");
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  621  		if (IS_ERR(wdt->pmureg)) {
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  622  			dev_err(dev, "syscon regmap lookup failed.\n");
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  623  			return PTR_ERR(wdt->pmureg);
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  624  		}
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  625  	}
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  626  =

78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  627  	wdt_irq =3D platform_get_resource(pdev, IORESOURCE_IRQ, =
0);
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  628  	if (wdt_irq =3D=3D NULL) {
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  629  		dev_err(dev, "no irq resource specified\n");
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  630  		ret =3D -ENOENT;
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  631  		goto err;
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  632  	}
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  633  =

78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  634  	/* get the memory region for the watchdog timer */
0f0a6a285ec0c7 drivers/watchdog/s3c2410_wdt.c      Guenter Roeck           =
 2019-04-02  635  	wdt->reg_base =3D devm_platform_ioremap_resource(pdev, 0=
);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  636  	if (IS_ERR(wdt->reg_base)) {
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  637  		ret =3D PTR_ERR(wdt->reg_base);
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-01-10  638  		goto err;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  639  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  640  =

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  641  	wdt->bus_clk =3D devm_clk_get(dev, "watchdog");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  642  	if (IS_ERR(wdt->bus_clk)) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  643  		dev_err(dev, "failed to find bus clock\n");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  644  		ret =3D PTR_ERR(wdt->bus_clk);
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-01-10  645  		goto err;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  646  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  647  =

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  648  	ret =3D clk_prepare_enable(wdt->bus_clk);
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat            =
 2014-03-04  649  	if (ret < 0) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  650  		dev_err(dev, "failed to enable bus clock\n");
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat            =
 2014-03-04  651  		return ret;
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat            =
 2014-03-04  652  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  653  =

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  654  	/*
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  655  	 * "watchdog_src" clock is optional; if it's not present=
 -- just skip it
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  656  	 * and use "watchdog" clock as both bus and source clock.
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  657  	 */
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  658  	wdt->src_clk =3D devm_clk_get(dev, "watchdog_src");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  659  	if (!IS_ERR(wdt->src_clk)) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  660  		ret =3D clk_prepare_enable(wdt->src_clk);
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  661  		if (ret < 0) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  662  			dev_err(dev, "failed to enable source clock\n");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07 @663  			ret =3D PTR_ERR(wdt->src_clk);
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  664  			goto err_bus_clk;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  665  		}
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  666  	} else {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  667  		wdt->src_clk =3D NULL;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  668  	}
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  669  =

882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas=
 2016-03-01  670  	wdt->wdt_device.min_timeout =3D 1;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  671  	wdt->wdt_device.max_timeout =3D s3c2410wdt_max_timeout(w=
dt);
882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas=
 2016-03-01  672  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  673  	ret =3D s3c2410wdt_cpufreq_register(wdt);
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  674  	if (ret < 0) {
3828924af2e24a drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-03-14  675  		dev_err(dev, "failed to register cpufreq\n");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  676  		goto err_src_clk;
e02f838eedef15 drivers/watchdog/s3c2410_wdt.c      Ben Dooks               =
 2009-10-30  677  	}
e02f838eedef15 drivers/watchdog/s3c2410_wdt.c      Ben Dooks               =
 2009-10-30  678  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  679  	watchdog_set_drvdata(&wdt->wdt_device, wdt);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  680  =

^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  681  	/* see if we can actually set the requested timer margin=
, and if
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  682  	 * not, try the default value */
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  683  =

08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-03-13  684  	watchdog_init_timeout(&wdt->wdt_device, tmr_margin, dev);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  685  	ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  686  					wdt->wdt_device.timeout);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  687  	if (ret) {
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  688  		ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
4f21195d42ef93 drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-02-24  689  					       S3C2410_WATCHDOG_DEFAULT_TIME);
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  690  		if (ret =3D=3D 0) {
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  691  			dev_warn(dev, "tmr_margin value out of range, default =
%d used\n",
4f21195d42ef93 drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-02-24  692  				 S3C2410_WATCHDOG_DEFAULT_TIME);
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  693  		} else {
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  694  			dev_err(dev, "failed to use default timeout\n");
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  695  			goto err_cpufreq;
dc6b8f70304cf4 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  696  		}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  697  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  698  =

04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-01-10  699  	ret =3D devm_request_irq(dev, wdt_irq->start, s3c2410wdt=
_irq, 0,
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-01-10  700  				pdev->name, pdev);
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  701  	if (ret !=3D 0) {
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  702  		dev_err(dev, "failed to install irq (%d)\n", ret);
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  703  		goto err_cpufreq;
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  704  	}
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  705  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  706  	watchdog_set_nowayout(&wdt->wdt_device, nowayout);
c71f5cd25f946f drivers/watchdog/s3c2410_wdt.c      Damien Riegel           =
 2015-11-16  707  	watchdog_set_restart_priority(&wdt->wdt_device, 128);
ff0b3cd4a416bc drivers/watchdog/s3c2410_wdt.c      Wim Van Sebroeck        =
 2011-11-29  708  =

cffc9a60ebac3b drivers/watchdog/s3c2410_wdt.c      Doug Anderson           =
 2013-12-06  709  	wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus=
(wdt);
08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski     =
 2017-03-13  710  	wdt->wdt_device.parent =3D dev;
cffc9a60ebac3b drivers/watchdog/s3c2410_wdt.c      Doug Anderson           =
 2013-12-06  711  =

a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  712  	/*
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  713  	 * If "tmr_atboot" param is non-zero, start the watchdog=
 right now. Also
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  714  	 * set WDOG_HW_RUNNING bit, so that watchdog core can ki=
ck the watchdog.
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  715  	 *
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  716  	 * If we're not enabling the watchdog, then ensure it is=
 disabled if it
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  717  	 * has been left running from the bootloader or other so=
urce.
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  718  	 */
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  719  	if (tmr_atboot) {
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  720  		dev_info(dev, "starting watchdog timer\n");
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  721  		s3c2410wdt_start(&wdt->wdt_device);
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  722  		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  723  	} else {
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  724  		s3c2410wdt_stop(&wdt->wdt_device);
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  725  	}
a0b8623b8dd800 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  726  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  727  	ret =3D watchdog_register_device(&wdt->wdt_device);
386f465ae6dfd8 drivers/watchdog/s3c2410_wdt.c      Wolfram Sang            =
 2019-05-18  728  	if (ret)
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han              =
 2013-01-10  729  		goto err_cpufreq;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  730  =

e8ee578c1bd049 drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-24  731  	ret =3D s3c2410wdt_enable(wdt, true);
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  732  	if (ret < 0)
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  733  		goto err_unregister;
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  734  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  735  	platform_set_drvdata(pdev, wdt);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  736  =

46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  737  	/* print out a statement of readiness */
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  738  =

af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  739  	wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  740  =

e8ef92b8dc939c drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  741  	dev_info(dev, "watchdog %sactive, reset %sabled, irq %sa=
bled\n",
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  742  		 (wtcon & S3C2410_WTCON_ENABLE) ?  "" : "in",
20403e845f9988 drivers/watchdog/s3c2410_wdt.c      Dmitry Artamonow        =
 2011-11-16  743  		 (wtcon & S3C2410_WTCON_RSTEN) ? "en" : "dis",
20403e845f9988 drivers/watchdog/s3c2410_wdt.c      Dmitry Artamonow        =
 2011-11-16  744  		 (wtcon & S3C2410_WTCON_INTEN) ? "en" : "dis");
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2007-06-14  745  =

^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  746  	return 0;
0b6dd8a640fbaf drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2006-12-18  747  =

4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  748   err_unregister:
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  749  	watchdog_unregister_device(&wdt->wdt_device);
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-12-06  750  =

e02f838eedef15 drivers/watchdog/s3c2410_wdt.c      Ben Dooks               =
 2009-10-30  751   err_cpufreq:
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala   =
 2013-08-27  752  	s3c2410wdt_cpufreq_deregister(wdt);
e02f838eedef15 drivers/watchdog/s3c2410_wdt.c      Ben Dooks               =
 2009-10-30  753  =

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  754   err_src_clk:
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  755  	clk_disable_unprepare(wdt->src_clk);
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  756  =

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  757   err_bus_clk:
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko           =
 2021-11-07  758  	clk_disable_unprepare(wdt->bus_clk);
0b6dd8a640fbaf drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2006-12-18  759  =

78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham            =
 2012-01-13  760   err:
0b6dd8a640fbaf drivers/char/watchdog/s3c2410_wdt.c Ben Dooks               =
 2006-12-18  761  	return ret;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  762  }
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds          =
 2005-04-16  763  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0118209350473673561==--

