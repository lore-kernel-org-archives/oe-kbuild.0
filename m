Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F857C700
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201225; cv=none; b=OmzNYA8wkezVonQonyZzYAKejDMOfhipbFTLgIlwodl2YIa6Y4qrXHn1iWtsJUZSZ3Rme9XXO2lmQTE+HjEqIZaGY2IeZrgTHRIIIVOjz5uczWs5wj8urSfyUHfvGh1X4rgMFv8YYWyuWwDkqF9+USmVQ5ibxCJY6y3EkDTzLz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201225; c=relaxed/simple;
	bh=/wPz7I5sP7KPjagycNRKqnUTfI+OCao7Ns92hb8cBhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HBgRo9KOmynfcwTQ4cKBXr1WfxnrTtpRtjKr1mtbev5MZBD7aw8AflfxtNGH22ZvGSO8SPpYjPtddni81Zx5NGW1Gtg8QdPDcU35Z6kMaDWtZROUbNIjc3TUcoiSNuPRKb7dRLyX0TCxhS/6jYT3J/79n2uYwM0PQTlZhKUbbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7oNUVaG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7oNUVaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790201221; x=1821737221;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/wPz7I5sP7KPjagycNRKqnUTfI+OCao7Ns92hb8cBhM=;
  b=H7oNUVaGaWxFFP5Vp0G9uMabTMkWc95dsO1vIqvFw7CtbTNiLj5jR9/e
   IlIu3JuoPIN4mugHaYc3zgYMVC0WNU5RV/dKgc4mj+ElzMumGmVxuIEv9
   Avmgjr+rYyPhnMUZEKkW43Ts3J11CSME8jq3mngA50eWQEeLC2jsYgf9R
   svVBvqvq5HLxbNFNLtnb50f6upmhADeeOYOHVwRtf4uYhUlBd+xdtac81
   By900XGYnOS8BO55MOtivBqwnrPQeiKhfp4xh1NjnacMZdjlMfHwHtjUb
   Ap5VGVcBrcFTAkHQv7scKskJ+wLxADCOME9fHzzaXKnCdHb6nRqXKHM9J
   w==;
X-CSE-ConnectionGUID: BkGTuMyMRGaIDuqoPV50HQ==
X-CSE-MsgGUID: 2J4ua1N9S5yU5Dp4TGVk5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94765068"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94765068"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 15:06:40 -0700
X-CSE-ConnectionGUID: h6DNaSU7QQOnZnU4jFeHaw==
X-CSE-MsgGUID: cnLDIU+UQw61mJ1oDHkOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5056506"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 15:06:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9V6q-00000000Hr6-40XP;
	Wed, 23 Sep 2026 22:06:36 +0000
Date: Thu, 24 Sep 2026 06:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/host/bcma-hcd.c:470:12: error: invalid storage
 class for function 'bcma_hcd_suspend'
Message-ID: <202609240634.IItx1goN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/Rosen-Penev/usb-bcma-control-VBUS-vi=
a-a-regulator-instead-of-a-GPIO/20260920-141355, commit: d7916d6794e6a7c02e=
96256f39f0e9a0d319c399"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/usb-bcma=
-control-VBUS-via-a-regulator-instead-of-a-GPIO/20260920-141355
head:   2560cd381820a9c2099175b6b43167f30ec17f79
commit: d7916d6794e6a7c02e96256f39f0e9a0d319c399 usb: bcma: control VBUS vi=
a a regulator instead of a GPIO
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-buildonly-randconfig-1005-20260924 (https://download.01.org/=
0day-ci/archive/20260924/202609240634.IItx1goN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260924/202609240634.IItx1goN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240634.IItx1goN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/bcma-hcd.c: In function 'bcma_hcd_probe':
   drivers/usb/host/bcma-hcd.c:448:13: error: invalid storage class for fun=
ction 'bcma_hcd_remove'
     448 | static void bcma_hcd_remove(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:462:13: error: invalid storage class for fun=
ction 'bcma_hcd_shutdown'
     462 | static void bcma_hcd_shutdown(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/usb/host/bcma-hcd.c:470:12: error: invalid storage class for fun=
ction 'bcma_hcd_suspend'
     470 | static int bcma_hcd_suspend(struct bcma_device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/usb/host/bcma-hcd.c:482:12: error: invalid storage class for fun=
ction 'bcma_hcd_resume'
     482 | static int bcma_hcd_resume(struct bcma_device *dev)
         |            ^~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:505:1: warning: 'alias' attribute ignored [-=
Wattributes]
     505 | MODULE_DEVICE_TABLE(bcma, bcma_hcd_table);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:511:27: error: initializer element is not co=
nstant
     511 |         .remove         =3D bcma_hcd_remove,
         |                           ^~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:511:27: note: (near initialization for 'bcma=
_hcd_driver.remove')
   drivers/usb/host/bcma-hcd.c:512:27: error: initializer element is not co=
nstant
     512 |         .shutdown       =3D bcma_hcd_shutdown,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:512:27: note: (near initialization for 'bcma=
_hcd_driver.shutdown')
   drivers/usb/host/bcma-hcd.c:513:27: error: initializer element is not co=
nstant
     513 |         .suspend        =3D bcma_hcd_suspend,
         |                           ^~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:513:27: note: (near initialization for 'bcma=
_hcd_driver.suspend')
   drivers/usb/host/bcma-hcd.c:514:27: error: initializer element is not co=
nstant
     514 |         .resume         =3D bcma_hcd_resume,
         |                           ^~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:514:27: note: (near initialization for 'bcma=
_hcd_driver.resume')
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:38,
                    from include/linux/bcma/bcma.h:5,
                    from drivers/usb/host/bcma-hcd.c:21:
   drivers/usb/host/bcma-hcd.c:516:20: error: invalid storage class for fun=
ction 'bcma_hcd_driver_init'
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/device/driver.h:267:19: note: in definition of macro 'modu=
le_driver'
     267 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: note: in expansion of macro 'module_b=
cma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device/driver.h:21:
>> include/linux/module.h:132:49: error: invalid storage class for function=
 '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)=
                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:271:1: note: in expansion of macro 'module=
_init'
     271 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/bcma/bcma.h:325:9: note: in expansion of macro 'module_dri=
ver'
     325 |         module_driver(__bcma_driver, bcma_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: note: in expansion of macro 'module_b=
cma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: warning: 'alias' attribute ignored [-=
Wattributes]
   drivers/usb/host/bcma-hcd.c:516:20: error: invalid storage class for fun=
ction 'bcma_hcd_driver_exit'
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/device/driver.h:272:20: note: in definition of macro 'modu=
le_driver'
     272 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: note: in expansion of macro 'module_b=
cma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/module.h:140:49: error: invalid storage class for function=
 '__exittest'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)=
                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:276:1: note: in expansion of macro 'module=
_exit'
     276 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/bcma/bcma.h:325:9: note: in expansion of macro 'module_dri=
ver'
     325 |         module_driver(__bcma_driver, bcma_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: note: in expansion of macro 'module_b=
cma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:516:1: warning: 'alias' attribute ignored [-=
Wattributes]
>> drivers/usb/host/bcma-hcd.c:516:1: error: expected declaration or statem=
ent at end of input
   drivers/usb/host/bcma-hcd.c: At top level:
   drivers/usb/host/bcma-hcd.c:401:12: warning: 'bcma_hcd_probe' defined bu=
t not used [-Wunused-function]
     401 | static int bcma_hcd_probe(struct bcma_device *core)
         |            ^~~~~~~~~~~~~~
--
   bcma-hcd.c: In function 'bcma_hcd_probe':
   bcma-hcd.c:448:13: error: invalid storage class for function 'bcma_hcd_r=
emove'
     448 | static void bcma_hcd_remove(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~
   bcma-hcd.c:462:13: error: invalid storage class for function 'bcma_hcd_s=
hutdown'
     462 | static void bcma_hcd_shutdown(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~~~
   bcma-hcd.c:470:12: error: invalid storage class for function 'bcma_hcd_s=
uspend'
     470 | static int bcma_hcd_suspend(struct bcma_device *dev)
         |            ^~~~~~~~~~~~~~~~
   bcma-hcd.c:482:12: error: invalid storage class for function 'bcma_hcd_r=
esume'
     482 | static int bcma_hcd_resume(struct bcma_device *dev)
         |            ^~~~~~~~~~~~~~~
   bcma-hcd.c:505:1: warning: 'alias' attribute ignored [-Wattributes]
     505 | MODULE_DEVICE_TABLE(bcma, bcma_hcd_table);
         | ^~~~~~~~~~~~~~~~~~~
   bcma-hcd.c:511:27: error: initializer element is not constant
     511 |         .remove         =3D bcma_hcd_remove,
         |                           ^~~~~~~~~~~~~~~
   bcma-hcd.c:511:27: note: (near initialization for 'bcma_hcd_driver.remov=
e')
   bcma-hcd.c:512:27: error: initializer element is not constant
     512 |         .shutdown       =3D bcma_hcd_shutdown,
         |                           ^~~~~~~~~~~~~~~~~
   bcma-hcd.c:512:27: note: (near initialization for 'bcma_hcd_driver.shutd=
own')
   bcma-hcd.c:513:27: error: initializer element is not constant
     513 |         .suspend        =3D bcma_hcd_suspend,
         |                           ^~~~~~~~~~~~~~~~
   bcma-hcd.c:513:27: note: (near initialization for 'bcma_hcd_driver.suspe=
nd')
   bcma-hcd.c:514:27: error: initializer element is not constant
     514 |         .resume         =3D bcma_hcd_resume,
         |                           ^~~~~~~~~~~~~~~
   bcma-hcd.c:514:27: note: (near initialization for 'bcma_hcd_driver.resum=
e')
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:38,
                    from include/linux/bcma/bcma.h:5,
                    from bcma-hcd.c:21:
   bcma-hcd.c:516:20: error: invalid storage class for function 'bcma_hcd_d=
river_init'
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/device/driver.h:267:19: note: in definition of macro 'modu=
le_driver'
     267 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   bcma-hcd.c:516:1: note: in expansion of macro 'module_bcma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device/driver.h:21:
>> include/linux/module.h:132:49: error: invalid storage class for function=
 '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)=
                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:271:1: note: in expansion of macro 'module=
_init'
     271 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/bcma/bcma.h:325:9: note: in expansion of macro 'module_dri=
ver'
     325 |         module_driver(__bcma_driver, bcma_driver_register, \
         |         ^~~~~~~~~~~~~
   bcma-hcd.c:516:1: note: in expansion of macro 'module_bcma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   bcma-hcd.c:516:1: warning: 'alias' attribute ignored [-Wattributes]
   bcma-hcd.c:516:20: error: invalid storage class for function 'bcma_hcd_d=
river_exit'
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/device/driver.h:272:20: note: in definition of macro 'modu=
le_driver'
     272 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   bcma-hcd.c:516:1: note: in expansion of macro 'module_bcma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/module.h:140:49: error: invalid storage class for function=
 '__exittest'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)=
                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:276:1: note: in expansion of macro 'module=
_exit'
     276 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/bcma/bcma.h:325:9: note: in expansion of macro 'module_dri=
ver'
     325 |         module_driver(__bcma_driver, bcma_driver_register, \
         |         ^~~~~~~~~~~~~
   bcma-hcd.c:516:1: note: in expansion of macro 'module_bcma_driver'
     516 | module_bcma_driver(bcma_hcd_driver);
         | ^~~~~~~~~~~~~~~~~~
   bcma-hcd.c:516:1: warning: 'alias' attribute ignored [-Wattributes]
   bcma-hcd.c:516:1: error: expected declaration or statement at end of inp=
ut
   bcma-hcd.c: At top level:
   bcma-hcd.c:401:12: warning: 'bcma_hcd_probe' defined but not used [-Wunu=
sed-function]
     401 | static int bcma_hcd_probe(struct bcma_device *core)
         |            ^~~~~~~~~~~~~~


vim +/bcma_hcd_suspend +470 drivers/usb/host/bcma-hcd.c

adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  447 =20
fb4e98ab63433c Bill Pemberton 2012-11-19 @448  static void bcma_hcd_remove(=
struct bcma_device *dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  449  {
62e11d1bada331 Hauke Mehrtens 2012-03-15  450  	struct bcma_hcd_device *usb=
_dev =3D bcma_get_drvdata(dev);
62e11d1bada331 Hauke Mehrtens 2012-03-15  451  	struct platform_device *ohc=
i_dev =3D usb_dev->ohci_dev;
62e11d1bada331 Hauke Mehrtens 2012-03-15  452  	struct platform_device *ehc=
i_dev =3D usb_dev->ehci_dev;
62e11d1bada331 Hauke Mehrtens 2012-03-15  453 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  454  	if (ohci_dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  455  		platform_device_unregister=
(ohci_dev);
62e11d1bada331 Hauke Mehrtens 2012-03-15  456  	if (ehci_dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  457  		platform_device_unregister=
(ehci_dev);
62e11d1bada331 Hauke Mehrtens 2012-03-15  458 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  459  	bcma_core_disable(dev, 0);
62e11d1bada331 Hauke Mehrtens 2012-03-15  460  }
62e11d1bada331 Hauke Mehrtens 2012-03-15  461 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  462  static void bcma_hcd_shutdow=
n(struct bcma_device *dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  463  {
d7916d6794e6a7 Rosen Penev    2026-09-20  464  	bcma_hci_platform_power(dev=
, false);
62e11d1bada331 Hauke Mehrtens 2012-03-15  465  	bcma_core_disable(dev, 0);
62e11d1bada331 Hauke Mehrtens 2012-03-15  466  }
62e11d1bada331 Hauke Mehrtens 2012-03-15  467 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  468  #ifdef CONFIG_PM
62e11d1bada331 Hauke Mehrtens 2012-03-15  469 =20
1f6155f5faabb7 Dan Carpenter  2012-04-19 @470  static int bcma_hcd_suspend(=
struct bcma_device *dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  471  {
d7916d6794e6a7 Rosen Penev    2026-09-20  472  	int err;
d7916d6794e6a7 Rosen Penev    2026-09-20  473 =20
d7916d6794e6a7 Rosen Penev    2026-09-20  474  	err =3D bcma_hci_platform_p=
ower(dev, false);
d7916d6794e6a7 Rosen Penev    2026-09-20  475  	if (err)
d7916d6794e6a7 Rosen Penev    2026-09-20  476  		return err;
62e11d1bada331 Hauke Mehrtens 2012-03-15  477  	bcma_core_disable(dev, 0);
62e11d1bada331 Hauke Mehrtens 2012-03-15  478 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  479  	return 0;
62e11d1bada331 Hauke Mehrtens 2012-03-15  480  }
62e11d1bada331 Hauke Mehrtens 2012-03-15  481 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15 @482  static int bcma_hcd_resume(s=
truct bcma_device *dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  483  {
d7916d6794e6a7 Rosen Penev    2026-09-20  484  	int err;
d7916d6794e6a7 Rosen Penev    2026-09-20  485 =20
d7916d6794e6a7 Rosen Penev    2026-09-20  486  	err =3D bcma_hci_platform_p=
ower(dev, true);
d7916d6794e6a7 Rosen Penev    2026-09-20  487  	if (err)
d7916d6794e6a7 Rosen Penev    2026-09-20  488  		return err;
62e11d1bada331 Hauke Mehrtens 2012-03-15  489  	bcma_core_enable(dev, 0);
62e11d1bada331 Hauke Mehrtens 2012-03-15  490 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  491  	return 0;
62e11d1bada331 Hauke Mehrtens 2012-03-15  492  }
62e11d1bada331 Hauke Mehrtens 2012-03-15  493 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  494  #else /* !CONFIG_PM */
62e11d1bada331 Hauke Mehrtens 2012-03-15  495  #define bcma_hcd_suspend	NULL
62e11d1bada331 Hauke Mehrtens 2012-03-15  496  #define bcma_hcd_resume	NULL
62e11d1bada331 Hauke Mehrtens 2012-03-15  497  #endif /* CONFIG_PM */
62e11d1bada331 Hauke Mehrtens 2012-03-15  498 =20
2f82686e8c261d Bill Pemberton 2012-11-19  499  static const struct bcma_dev=
ice_id bcma_hcd_table[] =3D {
62e11d1bada331 Hauke Mehrtens 2012-03-15  500  	BCMA_CORE(BCMA_MANUF_BCM, B=
CMA_CORE_USB20_HOST, BCMA_ANY_REV, BCMA_ANY_CLASS),
10bc04b744c69f Hauke Mehrtens 2015-06-11  501  	BCMA_CORE(BCMA_MANUF_BCM, B=
CMA_CORE_NS_USB20, BCMA_ANY_REV, BCMA_ANY_CLASS),
3cc7e7b7872ebd Rafa=C5=82 Mi=C5=82ecki  2016-07-08  502  	BCMA_CORE(BCMA_MA=
NUF_BCM, BCMA_CORE_NS_USB30, BCMA_ANY_REV, BCMA_ANY_CLASS),
f7219b527b5710 Joe Perches    2015-02-10  503  	{},
62e11d1bada331 Hauke Mehrtens 2012-03-15  504  };
62e11d1bada331 Hauke Mehrtens 2012-03-15  505  MODULE_DEVICE_TABLE(bcma, bc=
ma_hcd_table);
62e11d1bada331 Hauke Mehrtens 2012-03-15  506 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  507  static struct bcma_driver bc=
ma_hcd_driver =3D {
62e11d1bada331 Hauke Mehrtens 2012-03-15  508  	.name		=3D KBUILD_MODNAME,
62e11d1bada331 Hauke Mehrtens 2012-03-15  509  	.id_table	=3D bcma_hcd_tabl=
e,
62e11d1bada331 Hauke Mehrtens 2012-03-15  510  	.probe		=3D bcma_hcd_probe,
7690417db5085f Bill Pemberton 2012-11-19  511  	.remove		=3D bcma_hcd_remov=
e,
62e11d1bada331 Hauke Mehrtens 2012-03-15  512  	.shutdown	=3D bcma_hcd_shut=
down,
62e11d1bada331 Hauke Mehrtens 2012-03-15  513  	.suspend	=3D bcma_hcd_suspe=
nd,
62e11d1bada331 Hauke Mehrtens 2012-03-15  514  	.resume		=3D bcma_hcd_resum=
e,
62e11d1bada331 Hauke Mehrtens 2012-03-15  515  };
0895660941164c Liu Shixin     2020-09-18 @516  module_bcma_driver(bcma_hcd_=
driver);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
