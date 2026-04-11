Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468A17B425
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 04:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775880303; cv=none; b=LPVibxE8hlx/tCHT0A8Tz+1DRyPsCnXrqFv1TwXq46L8QHJO3j8X7owrrdTTY2ZjhGm6NAtVJerqwgia30/CE39KDH0hKmOUDzigqBwT3MOVuOFxYZw6fxq2a8xeDLPBdaJ4pzoN+o0dQ0KZcPLzrZ31ktOw4DstOyn+dDrImgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775880303; c=relaxed/simple;
	bh=LIw13jFo4hrwX6GXsLjgRycTPQpWDTBagaivKLHwwbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ePhFpdC/4vqJ0nrCjDwgLwkwWcSC20PdNyKhbL7hQwrXJpRrPYG0zOxV71+5uz7I0PMxDK605ETqvHO3onroD6gBUJOkME9z6TayeyDjbkqfZEuLgOTjYlSuzpDD3kIDcuTRkEzd3pvKBTJLg/hndn8bKzhL1+rerQ2aV75SlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVDYUG68; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVDYUG68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775880302; x=1807416302;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LIw13jFo4hrwX6GXsLjgRycTPQpWDTBagaivKLHwwbQ=;
  b=PVDYUG68K0YHIbJ8V4nH3oQ84/amdCUC2eR82i57f4gNBXEFtSYxYGil
   nwPgHMOLZVI+OunhDK6hqiqC54c/NUO6pVeRAuiiNIX/wofZ2aeJGocOl
   VqxiK6V70lPqB6j3NnqS4xBZhHMgEnysaGRV2gkoAVPTJbH1wG8Kj9+Sk
   XHGrkc8GuoH+T+Jr/oZVtOAXU6X+J2tTX+YOEPciz3+EwkLNm79if9Qao
   96EQdqIjTq7qpHoqlMa/BDkqPyzg4JQvw0bCDGeaF3mCK4u6xRj2nWnSE
   Rpawcys5vqTxSVf51xNI+0TPHgsCRsb0RnlEDJrBN91bOo+iXA/eKaWGr
   Q==;
X-CSE-ConnectionGUID: xLkpeeTwRtyjufWFuBTXGA==
X-CSE-MsgGUID: 0URUcTWYTVCGJO1o5HxFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76970375"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76970375"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 21:05:01 -0700
X-CSE-ConnectionGUID: Qy/7J063S8m4k+PCWSkNYg==
X-CSE-MsgGUID: fyCh8UwjTVaFE56QVydzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252451465"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 21:04:58 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBPab-000000000jR-2A57;
	Sat, 11 Apr 2026 04:04:57 +0000
Date: Sat, 11 Apr 2026 12:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 3/3]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202604111133.Y9gWRtAh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7d8deb5e05aad8da2ebfe9fa852654185821b6e2
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [3/3] ANDROID: usb: gadget=
: configfs: Add Uevent to notify userspace
:::::: branch date: 30 hours ago
:::::: commit date: 1 year, 9 months ago
config: x86_64-randconfig-161-20260411 (https://download.01.org/0day-ci/arc=
hive/20260411/202604111133.Y9gWRtAh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604111133.Y9gWRtAh-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi=
->composite.gadget_driver.driver.name' (line 2048)

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1980 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1981  static struct co=
nfig_group *gadgets_make(
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1982  		struct config_=
group *group,
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1983  		const char *na=
me)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1984  {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1985  	struct gadget_i=
nfo *gi;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1986 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1987  	gi =3D kzalloc(=
sizeof(*gi), GFP_KERNEL);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1988  	if (!gi)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1989  		return ERR_PTR=
(-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1990 =20
1ae1602de028ac Christoph Hellwig         2016-02-26  1991  	config_group_in=
it_type_name(&gi->group, name, &gadget_root_type);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1992 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1993  	config_group_in=
it_type_name(&gi->functions_group, "functions",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1994  			&functions_ty=
pe);
1ae1602de028ac Christoph Hellwig         2016-02-26  1995  	configfs_add_de=
fault_group(&gi->functions_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  1996 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1997  	config_group_in=
it_type_name(&gi->configs_group, "configs",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1998  			&config_desc_=
type);
1ae1602de028ac Christoph Hellwig         2016-02-26  1999  	configfs_add_de=
fault_group(&gi->configs_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  2000 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2001  	config_group_in=
it_type_name(&gi->strings_group, "strings",
6e2a512d9532c5 Daniel Scally             2023-02-06  2002  			&gadget_langu=
age_strings_type);
1ae1602de028ac Christoph Hellwig         2016-02-26  2003  	configfs_add_de=
fault_group(&gi->strings_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  2004 =20
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  2005  	config_group_in=
it_type_name(&gi->os_desc_group, "os_desc",
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  2006  			&os_desc_type=
);
1ae1602de028ac Christoph Hellwig         2016-02-26  2007  	configfs_add_de=
fault_group(&gi->os_desc_group, &gi->group);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2008 =20
93c473948c5889 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2009  	confi=
g_group_init_type_name(&gi->webusb_group, "webusb",
93c473948c5889 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2010  			&we=
busb_type);
93c473948c5889 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2011  	confi=
gfs_add_default_group(&gi->webusb_group, &gi->group);
93c473948c5889 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2012 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2013  	gi->composite.b=
ind =3D configfs_do_nothing;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2014  	gi->composite.u=
nbind =3D configfs_do_nothing;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2015  	gi->composite.s=
uspend =3D NULL;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2016  	gi->composite.r=
esume =3D NULL;
e2459108b5a060 taehyun.cho               2021-01-07  2017  	gi->composite.m=
ax_speed =3D USB_SPEED_SUPER_PLUS;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2018 =20
093edc2baad2c2 Wei Yongjun               2019-10-30  2019  	spin_lock_init(=
&gi->spinlock);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2020  	mutex_init(&gi-=
>lock);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2021  	INIT_LIST_HEAD(=
&gi->string_list);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2022  	INIT_LIST_HEAD(=
&gi->available_func);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2023 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2024  	composite_init_=
dev(&gi->cdev);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2025  	gi->cdev.desc.b=
Length =3D USB_DT_DEVICE_SIZE;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2026  	gi->cdev.desc.b=
DescriptorType =3D USB_DT_DEVICE;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2027  	gi->cdev.desc.b=
cdDevice =3D cpu_to_le16(get_default_bcdDevice());
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2028 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2029  	gi->composite.g=
adget_driver =3D configfs_driver_template;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2030 =20
7c07553807c512 Chanh Nguyen              2023-01-11  2031  	gi->composite.g=
adget_driver.driver.name =3D kasprintf(GFP_KERNEL,
7c07553807c512 Chanh Nguyen              2023-01-11  2032  							    "conf=
igfs-gadget.%s", name);
7c07553807c512 Chanh Nguyen              2023-01-11  2033  	if (!gi->compos=
ite.gadget_driver.driver.name)
7c07553807c512 Chanh Nguyen              2023-01-11  2034  		goto err;
7c07553807c512 Chanh Nguyen              2023-01-11  2035 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2036  	gi->composite.g=
adget_driver.function =3D kstrdup(name, GFP_KERNEL);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2037  	gi->composite.n=
ame =3D gi->composite.gadget_driver.function;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2038 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2039  	if (!gi->compos=
ite.gadget_driver.function)
7c07553807c512 Chanh Nguyen              2023-01-11  2040  		goto out_free_=
driver_name;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2041 =20
957b40b3b769bc Neill Kapron              2024-02-01  2042  	if (android_dev=
ice_create(&gi->cdev.android_opts))
957b40b3b769bc Neill Kapron              2024-02-01  2043  		goto out_free_=
driver_name_and_function;
957b40b3b769bc Neill Kapron              2024-02-01  2044 =20
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2045  	return &gi->gro=
up;
7c07553807c512 Chanh Nguyen              2023-01-11  2046 =20
7c07553807c512 Chanh Nguyen              2023-01-11  2047  out_free_driver_=
name:
7c07553807c512 Chanh Nguyen              2023-01-11 @2048  	kfree(gi->compo=
site.gadget_driver.driver.name);
957b40b3b769bc Neill Kapron              2024-02-01  2049  out_free_driver_=
name_and_function:
957b40b3b769bc Neill Kapron              2024-02-01 @2050  	kfree(gi->compo=
site.gadget_driver.driver.name);
957b40b3b769bc Neill Kapron              2024-02-01  2051  	kfree(gi->compo=
site.gadget_driver.function);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(=
-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2055  }
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2056 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
