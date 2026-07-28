Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956240F743
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230535; cv=none; b=U4XxYPxkMzu+oAQivtAp7QH4qsCwDz9F/jETFcWtrMra5gCj6CVON5nYKu69NlbhoskcmsyE9ytboDVXJL38YLQ1/DsXWA+p/gYk2h1VY5Y+dr0vLjcsb0aHL3NlEy86ketGrNdrKd+7yJvD06fbM7m9TP30AsvgeTPi5BlKFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230535; c=relaxed/simple;
	bh=j9pqIqDoR0Fch1GkqfQT3VyTdKSTG/1sIIhTHUExl0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hc9/kXMpQiNAKd8CkaJ/GQL12DL122xJYVFQWomMXBFTRUs8wypDPiuPL2PrvgwAg5jYGQ8UgrVI4hX6a284exqONUHmRYjs7vA17/FpAmoVssvE/UUn3V0ZbVR4rAle/d/xF+aE1Nww65j6D+Sw4ye2c40CASwCaodMCRa7jrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kftx4BUM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kftx4BUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785230534; x=1816766534;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j9pqIqDoR0Fch1GkqfQT3VyTdKSTG/1sIIhTHUExl0k=;
  b=kftx4BUMlfTNKm1J1Nfm0MIqg/xaqiXRBbXLH5hTN+RoPfM6RMSncWg6
   FFG5ogiiTPeJIgmBcqT5OJC+rm1d4UNOP6RHIWP0b6ntXcXOSbHKGf1GE
   868zU91FTX2y5hEjA16PEvueflXviTXM+kWfJN7rpkF9JElwmezC1wEx7
   Tmb/CGHAFvsosL625ZC1aFCOU9fcfbRK9mhOuQlu/bVi68YiTZIcudP2+
   M3Lv/HUzinN9UMgdc+MeoHiMeZglbeF/nSUBeW6f4ewHWSRgjPbIxT5zn
   CR7BY8lRZ1U1ft3s40BJrB1RCQ7iCEVVv6G8oBsWx/M/PDqMGouVacjk2
   A==;
X-CSE-ConnectionGUID: MrwNPdYHRCq80uTqgj3uDw==
X-CSE-MsgGUID: y1nemLTUQjWQQUtGpH3f/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="73347026"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="73347026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:22:02 -0700
X-CSE-ConnectionGUID: VgP01eeNT5Gro0JR+LWlWA==
X-CSE-MsgGUID: M3wRkXygQUCGFPs6ADMKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="297886721"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 02:22:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woe0Y-00000000eBX-3pfk;
	Tue, 28 Jul 2026 09:21:56 +0000
Date: Tue, 28 Jul 2026 17:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 5/5]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202607281748.tMhAiK8E-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   579215f16d4e5c3062e423a583897e83473e1435
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [5/5] ANDROID: usb: gadget=
: configfs: Add Uevent to notify userspace
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/202607=
28/202607281748.tMhAiK8E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607281748.tMhAiK8E-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi=
->composite.gadget_driver.driver.name' (line 2048)

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1980 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1981  static struct c=
onfig_group *gadgets_make(
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1982  		struct config=
_group *group,
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1983  		const char *n=
ame)
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1984  {
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1985  	struct gadget_=
info *gi;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1986 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1987  	gi =3D kzalloc=
(sizeof(*gi), GFP_KERNEL);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1988  	if (!gi)
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1989  		return ERR_PT=
R(-ENOMEM);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1990 =20
1ae1602de028aca Christoph Hellwig         2016-02-26  1991  	config_group_i=
nit_type_name(&gi->group, name, &gadget_root_type);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1992 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1993  	config_group_i=
nit_type_name(&gi->functions_group, "functions",
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1994  			&functions_t=
ype);
1ae1602de028aca Christoph Hellwig         2016-02-26  1995  	configfs_add_d=
efault_group(&gi->functions_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  1996 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1997  	config_group_i=
nit_type_name(&gi->configs_group, "configs",
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1998  			&config_desc=
_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  1999  	configfs_add_d=
efault_group(&gi->configs_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  2000 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2001  	config_group_i=
nit_type_name(&gi->strings_group, "strings",
6e2a512d9532c51 Daniel Scally             2023-02-06  2002  			&gadget_lang=
uage_strings_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  2003  	configfs_add_d=
efault_group(&gi->strings_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  2004 =20
87213d388e927aa Andrzej Pietrasiewicz     2014-05-08  2005  	config_group_i=
nit_type_name(&gi->os_desc_group, "os_desc",
87213d388e927aa Andrzej Pietrasiewicz     2014-05-08  2006  			&os_desc_typ=
e);
1ae1602de028aca Christoph Hellwig         2016-02-26  2007  	configfs_add_d=
efault_group(&gi->os_desc_group, &gi->group);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2008 =20
93c473948c58897 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2009  	conf=
ig_group_init_type_name(&gi->webusb_group, "webusb",
93c473948c58897 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2010  			&w=
ebusb_type);
93c473948c58897 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2011  	conf=
igfs_add_default_group(&gi->webusb_group, &gi->group);
93c473948c58897 J=C3=B3 =C3=81gila Bitsch           2023-01-13  2012 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2013  	gi->composite.=
bind =3D configfs_do_nothing;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2014  	gi->composite.=
unbind =3D configfs_do_nothing;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2015  	gi->composite.=
suspend =3D NULL;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2016  	gi->composite.=
resume =3D NULL;
e2459108b5a0604 taehyun.cho               2021-01-07  2017  	gi->composite.=
max_speed =3D USB_SPEED_SUPER_PLUS;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2018 =20
093edc2baad2c25 Wei Yongjun               2019-10-30  2019  	spin_lock_init=
(&gi->spinlock);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2020  	mutex_init(&gi=
->lock);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2021  	INIT_LIST_HEAD=
(&gi->string_list);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2022  	INIT_LIST_HEAD=
(&gi->available_func);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2023 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2024  	composite_init=
_dev(&gi->cdev);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2025  	gi->cdev.desc.=
bLength =3D USB_DT_DEVICE_SIZE;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2026  	gi->cdev.desc.=
bDescriptorType =3D USB_DT_DEVICE;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2027  	gi->cdev.desc.=
bcdDevice =3D cpu_to_le16(get_default_bcdDevice());
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2028 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2029  	gi->composite.=
gadget_driver =3D configfs_driver_template;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2030 =20
7c07553807c5125 Chanh Nguyen              2023-01-11  2031  	gi->composite.=
gadget_driver.driver.name =3D kasprintf(GFP_KERNEL,
7c07553807c5125 Chanh Nguyen              2023-01-11  2032  							    "con=
figfs-gadget.%s", name);
7c07553807c5125 Chanh Nguyen              2023-01-11  2033  	if (!gi->compo=
site.gadget_driver.driver.name)
7c07553807c5125 Chanh Nguyen              2023-01-11  2034  		goto err;
7c07553807c5125 Chanh Nguyen              2023-01-11  2035 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2036  	gi->composite.=
gadget_driver.function =3D kstrdup(name, GFP_KERNEL);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2037  	gi->composite.=
name =3D gi->composite.gadget_driver.function;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2038 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2039  	if (!gi->compo=
site.gadget_driver.function)
7c07553807c5125 Chanh Nguyen              2023-01-11  2040  		goto out_free=
_driver_name;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2041 =20
957b40b3b769bc2 Neill Kapron              2024-02-01  2042  	if (android_de=
vice_create(&gi->cdev.android_opts))
957b40b3b769bc2 Neill Kapron              2024-02-01  2043  		goto out_free=
_driver_name_and_function;
957b40b3b769bc2 Neill Kapron              2024-02-01  2044 =20
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2045  	return &gi->gr=
oup;
7c07553807c5125 Chanh Nguyen              2023-01-11  2046 =20
7c07553807c5125 Chanh Nguyen              2023-01-11  2047  out_free_driver=
_name:
7c07553807c5125 Chanh Nguyen              2023-01-11 @2048  	kfree(gi->comp=
osite.gadget_driver.driver.name);
957b40b3b769bc2 Neill Kapron              2024-02-01  2049  out_free_driver=
_name_and_function:
957b40b3b769bc2 Neill Kapron              2024-02-01 @2050  	kfree(gi->comp=
osite.gadget_driver.driver.name);
957b40b3b769bc2 Neill Kapron              2024-02-01  2051  	kfree(gi->comp=
osite.gadget_driver.function);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR=
(-ENOMEM);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2055  }
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2056 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
