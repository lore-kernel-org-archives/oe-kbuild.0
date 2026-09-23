Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E041835F
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198623; cv=none; b=KIMvQ/i/yFTrXWY+ahWntGqGPb8bLOn6ytXXDgvzD4k0H2BprJ8EACNVo/Z5gFIGcH727jb1we5Q9+W/Z6fCkzs2c+5EQPyAjhAReoZE1XapFAlc9dbtiYHRDdKS+wZA7ue0XCMUwUgRXXJTtxxaKMOJC9NxGLa13XYXJdKZG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198623; c=relaxed/simple;
	bh=gVhu4C1AfxOgTatIT5BbTqJmwOLJ5oo4C1/rDEyvfX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=St4hIfYacXahKSFtO0+xSO6cFfG663UD7nq3Pqy2Wul4MOfmPRoZpZmBrEIMWoxFU+Ok2znRJ+HpBQvlnMa49r5lySlzqh5UBkGDxp/L+hxTHpnGa1kMi9m5wxhYtWTlB25//ZnfWg8C/vxI3UqpuAAGC2iULb+aS6NLosZWiX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWpxV1hf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWpxV1hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790198620; x=1821734620;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gVhu4C1AfxOgTatIT5BbTqJmwOLJ5oo4C1/rDEyvfX0=;
  b=GWpxV1hfPMMJHAluizhTzsDzFbUJBjHyCLkAI4n5FODUg8Hib9Cbx6cY
   QwIyrdstQlEv/NakGKgffws02BbKJ8bHiRZTYT9EWcpyd0m1VHjoLihcF
   tn9IHU7y5hUlzQSlZsx3i7lYPqSCeoWhNXYPlOLGjfTq+rSyu2SNnbrsm
   VdMFuWOxGRliIadeL0yi6aJP8SpD21Y5e8xAhfaey5XOpz/4F8n6L3EjS
   8gw5t5gS6I9AXxdhm0y+nMwNLdynkLPeqN9U4NF2rI8VsPaCzky99m2Bc
   SyTZm/AyosvcuoRpGhrYKfZuZRhyxCrnMwO//2/A9m0d0Ft8pjTTPKUen
   g==;
X-CSE-ConnectionGUID: Gp3u8517TcCjSuqxQvAtmw==
X-CSE-MsgGUID: KTCtSM52Td21NeLYLH4nlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90963979"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90963979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:23:36 -0700
X-CSE-ConnectionGUID: 0zszuwpjQsmNPeuiyAoXFw==
X-CSE-MsgGUID: 7/dRyF++R5mNjodHYYzZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281871133"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 14:23:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9URA-00000000Hkz-2UbZ;
	Wed, 23 Sep 2026 21:23:32 +0000
Date: Thu, 24 Sep 2026 05:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/host/bcma-hcd.c:448:13: error: invalid storage
 class for function 'bcma_hcd_remove'
Message-ID: <202609240509.gwpv3AFR-lkp@intel.com>
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
config: csky-randconfig-1000-20260924 (https://download.01.org/0day-ci/arch=
ive/20260924/202609240509.gwpv3AFR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260924/202609240509.gwpv3AFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240509.gwpv3AFR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/usb/host/bcma-hcd.c: In function 'bcma_hcd_probe':
>> drivers/usb/host/bcma-hcd.c:448:13: error: invalid storage class for fun=
ction 'bcma_hcd_remove'
     448 | static void bcma_hcd_remove(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~
>> drivers/usb/host/bcma-hcd.c:462:13: error: invalid storage class for fun=
ction 'bcma_hcd_shutdown'
     462 | static void bcma_hcd_shutdown(struct bcma_device *dev)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/usb/host/bcma-hcd.c:505:1: warning: 'alias' attribute ignored [-=
Wattributes]
     505 | MODULE_DEVICE_TABLE(bcma, bcma_hcd_table);
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/bcma-hcd.c:511:27: error: initializer element is not co=
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
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:38,
                    from include/linux/bcma/bcma.h:5,
                    from drivers/usb/host/bcma-hcd.c:21:
>> drivers/usb/host/bcma-hcd.c:516:20: error: invalid storage class for fun=
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
   In file included from include/linux/pci.h:31:
   drivers/usb/host/bcma-hcd.c:516:20: error: initializer element is not co=
nstant
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/init.h:267:55: note: in definition of macro '____define_in=
itcall'
     267 |                 __attribute__((__section__(__sec))) =3D fn;
         |                                                       ^~
   include/linux/init.h:282:9: note: in expansion of macro '__unique_initca=
ll'
     282 |         __unique_initcall(fn, id, __sec, __iid)                 =
        \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:293:9: note: in expansion of macro '____define_init=
call_modname'
     293 |         ____define_initcall_modname(fn, id, .initcall##id, __ini=
tcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:295:41: note: in expansion of macro '__define_initc=
all_modname'
     295 | #define __builtin_module_initcall(fn)   __define_initcall_modnam=
e(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:89:25: note: in expansion of macro '__builtin_mod=
ule_initcall'
      89 | #define module_init(x)  __builtin_module_initcall(x);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/usb/host/bcma-hcd.c:516:20: error: initializer element is not co=
nstant
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/init.h:264:49: note: in definition of macro '__initcall_fn=
_ptr'
     264 | #define __initcall_fn_ptr(fn, __iid, id)        fn
         |                                                 ^~
   include/linux/init.h:293:9: note: in expansion of macro '____define_init=
call_modname'
     293 |         ____define_initcall_modname(fn, id, .initcall##id, __ini=
tcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:295:41: note: in expansion of macro '__define_initc=
all_modname'
     295 | #define __builtin_module_initcall(fn)   __define_initcall_modnam=
e(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:89:25: note: in expansion of macro '__builtin_mod=
ule_initcall'
      89 | #define module_init(x)  __builtin_module_initcall(x);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/usb/host/bcma-hcd.c:516:20: note: (near initialization for '__mo=
dname_bcma_hcd_driver_init.initcall_fn')
   include/linux/init.h:264:49: note: in definition of macro '__initcall_fn=
_ptr'
     264 | #define __initcall_fn_ptr(fn, __iid, id)        fn
         |                                                 ^~
   include/linux/init.h:293:9: note: in expansion of macro '____define_init=
call_modname'
     293 |         ____define_initcall_modname(fn, id, .initcall##id, __ini=
tcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:295:41: note: in expansion of macro '__define_initc=
all_modname'
     295 | #define __builtin_module_initcall(fn)   __define_initcall_modnam=
e(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:89:25: note: in expansion of macro '__builtin_mod=
ule_initcall'
      89 | #define module_init(x)  __builtin_module_initcall(x);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/usb/host/bcma-hcd.c:516:20: error: invalid storage class for fun=
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
   drivers/usb/host/bcma-hcd.c:516:20: error: initializer element is not co=
nstant
     516 | module_bcma_driver(bcma_hcd_driver);
         |                    ^~~~~~~~~~~~~~~
   include/linux/init.h:337:57: note: in definition of macro '__exitcall'
     337 |         static exitcall_t __exitcall_##fn __exit_call =3D fn
         |                                                         ^~
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
   In file included from include/linux/compiler_types.h:88,
                    from <command-line>:
>> include/linux/init.h:287:46: error: expected declaration or statement at=
 end of input
     287 |                 __aligned(__alignof__(struct initcall_modname)) =
=3D {     \
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:33:68: note: in definition of macro =
'__aligned'
      33 | #define __aligned(x)                    __attribute__((__aligned=
__(x)))
         |                                                                 =
   ^
   include/linux/init.h:293:9: note: in expansion of macro '____define_init=
call_modname'
     293 |         ____define_initcall_modname(fn, id, .initcall##id, __ini=
tcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:295:41: note: in expansion of macro '__define_initc=
all_modname'
     295 | #define __builtin_module_initcall(fn)   __define_initcall_modnam=
e(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:89:25: note: in expansion of macro '__builtin_mod=
ule_initcall'
      89 | #define module_init(x)  __builtin_module_initcall(x);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/usb/host/bcma-hcd.c: At top level:
>> drivers/usb/host/bcma-hcd.c:401:12: warning: 'bcma_hcd_probe' defined bu=
t not used [-Wunused-function]
     401 | static int bcma_hcd_probe(struct bcma_device *core)
         |            ^~~~~~~~~~~~~~


vim +/bcma_hcd_remove +448 drivers/usb/host/bcma-hcd.c

3cc7e7b7872ebd Rafa=C5=82 Mi=C5=82ecki  2016-07-08  400 =20
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05 @401  static int bcma_hc=
d_probe(struct bcma_device *core)
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  402  {
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  403  	int err;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  404  	struct bcma_hcd_d=
evice *usb_dev;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  405 =20
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  406  	/* TODO: Probably=
 need checks here; is the core connected? */
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  407 =20
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  408  	usb_dev =3D devm_=
kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  409  			       GFP_KERN=
EL);
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  410  	if (!usb_dev)
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  411  		return -ENOMEM;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  412  	usb_dev->core =3D =
core;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  413 =20
d7916d6794e6a7 Rosen Penev    2026-09-20  414  	usb_dev->regulator =3D devm=
_regulator_get_optional(&core->dev, "vbus");
d7916d6794e6a7 Rosen Penev    2026-09-20  415  	if (IS_ERR(usb_dev->regulat=
or)) {
d7916d6794e6a7 Rosen Penev    2026-09-20  416  		return PTR_ERR(usb_dev->re=
gulator);
d7916d6794e6a7 Rosen Penev    2026-09-20  417 =20
d7916d6794e6a7 Rosen Penev    2026-09-20  418  	err =3D regulator_enable(us=
b_dev->regulator);
d7916d6794e6a7 Rosen Penev    2026-09-20  419  	if (err)
d7916d6794e6a7 Rosen Penev    2026-09-20  420  		return dev_err_probe(&core=
->dev, err,
d7916d6794e6a7 Rosen Penev    2026-09-20  421  				     "error enabling VCC=
 regulator");
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  422 =20
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  423  	switch (core->id.=
id) {
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  424  	case BCMA_CORE_US=
B20_HOST:
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  425  		if (IS_ENABLED(C=
ONFIG_ARM))
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  426  			err =3D bcma_hc=
d_usb20_old_arm_init(usb_dev);
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  427  		else if (IS_ENAB=
LED(CONFIG_MIPS))
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  428  			err =3D bcma_hc=
d_usb20_init(usb_dev);
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  429  		else
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  430  			err =3D -ENOTSU=
PP;
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  431  		break;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  432  	case BCMA_CORE_NS=
_USB20:
e8624859dde2ad Rafa=C5=82 Mi=C5=82ecki  2016-09-21  433  		err =3D bcma_hcd=
_usb20_ns_init(usb_dev);
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  434  		break;
3cc7e7b7872ebd Rafa=C5=82 Mi=C5=82ecki  2016-07-08  435  	case BCMA_CORE_NS=
_USB30:
3cc7e7b7872ebd Rafa=C5=82 Mi=C5=82ecki  2016-07-08  436  		err =3D bcma_hcd=
_usb30_init(usb_dev);
3cc7e7b7872ebd Rafa=C5=82 Mi=C5=82ecki  2016-07-08  437  		break;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  438  	default:
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  439  		return -ENODEV;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  440  	}
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  441  	if (err)
d6b76c4ddb124d Rafa=C5=82 Mi=C5=82ecki  2016-08-10  442  		return err;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  443 =20
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  444  	bcma_set_drvdata(=
core, usb_dev);
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  445  	return 0;
adbff3a4f93d85 Rafa=C5=82 Mi=C5=82ecki  2015-12-05  446  }
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
62e11d1bada331 Hauke Mehrtens 2012-03-15 @462  static void bcma_hcd_shutdow=
n(struct bcma_device *dev)
62e11d1bada331 Hauke Mehrtens 2012-03-15  463  {
d7916d6794e6a7 Rosen Penev    2026-09-20  464  	bcma_hci_platform_power(dev=
, false);
62e11d1bada331 Hauke Mehrtens 2012-03-15  465  	bcma_core_disable(dev, 0);
62e11d1bada331 Hauke Mehrtens 2012-03-15  466  }
62e11d1bada331 Hauke Mehrtens 2012-03-15  467 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  468  #ifdef CONFIG_PM
62e11d1bada331 Hauke Mehrtens 2012-03-15  469 =20
1f6155f5faabb7 Dan Carpenter  2012-04-19  470  static int bcma_hcd_suspend(=
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
62e11d1bada331 Hauke Mehrtens 2012-03-15  482  static int bcma_hcd_resume(s=
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
62e11d1bada331 Hauke Mehrtens 2012-03-15 @505  MODULE_DEVICE_TABLE(bcma, bc=
ma_hcd_table);
62e11d1bada331 Hauke Mehrtens 2012-03-15  506 =20
62e11d1bada331 Hauke Mehrtens 2012-03-15  507  static struct bcma_driver bc=
ma_hcd_driver =3D {
62e11d1bada331 Hauke Mehrtens 2012-03-15  508  	.name		=3D KBUILD_MODNAME,
62e11d1bada331 Hauke Mehrtens 2012-03-15  509  	.id_table	=3D bcma_hcd_tabl=
e,
62e11d1bada331 Hauke Mehrtens 2012-03-15  510  	.probe		=3D bcma_hcd_probe,
7690417db5085f Bill Pemberton 2012-11-19 @511  	.remove		=3D bcma_hcd_remov=
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
