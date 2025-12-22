Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACA73009FC
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395911; cv=none; b=SiexvPnSMo7Ymx7RSZe+ppP/AF7tWG9D/2KRuGRN0z7D+w9xz4c3TZDv4BFqmT/9U1HlQAz5rwKnm2S0VZj2NTLl8jhPXfYzclUpbYMkv1/M0hPcOjE9qZw18fa5PAQONwHV1U90aMlbgH8+/QTEg6pCfS9weE+Kx4PMMfEzVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395911; c=relaxed/simple;
	bh=CnzYSMSfi0S8yLe9MuPdG2znYT8/ckxy1KKY/5Letz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K27V2bqAIM821UQ+Yek3ysbzwws8uNndTmNMrd/0Jo/z6KyapEgmXpyqrFrpovLt0qSoG9bY2m6H+pTnsTxis7G2x9Rappvtie3QqvC8rM3JmZo7rRYi0Eng1GG87XQ/TRs+dcsZVbYl8JIQCI6gqy0hcZj/fO6R9vLLFfm6G7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlaXl4f0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlaXl4f0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766395910; x=1797931910;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CnzYSMSfi0S8yLe9MuPdG2znYT8/ckxy1KKY/5Letz0=;
  b=LlaXl4f0aVEBCtZYShX00ijyslGrYN5dJM3pnLDj8wTClJGgZxTwmzpf
   374KqA1+tguT9Y4y+mdH1Z+WytmqI9HNXg6vlqJwWNNsHrj9pcjJZeikY
   aEOFrf4zRZa4ajlnmQ6bkUEPf1aaM938CyhqyCJHBN0nnJGD19RtfQ2J3
   vkOYcryURPma9xbPRqRS3RDahdLBCirqROsCKSrq68rumuX1TFM4PnqmT
   FWc3pZo8ZfbQ/yOBTKsz1wGRauSJHhZbutUWfdCtXhK+8ljfKMd/m77av
   Fmpl4917vG1ktNGduXzGnmP1yvxEfoaU8WEtJZ9M46sFjvNl46IjxYdNf
   Q==;
X-CSE-ConnectionGUID: cwBm4GJmRDWaUVKHb47kLw==
X-CSE-MsgGUID: YKSI62AzQ56xjgBrVsCHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68188349"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68188349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:31:49 -0800
X-CSE-ConnectionGUID: WvTdJPF8SlSeRtAhTcjHKQ==
X-CSE-MsgGUID: FVj9O26FSaW1tHnHkcfHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198713308"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 01:31:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXcGT-000000000KR-3Swm;
	Mon, 22 Dec 2025 09:31:41 +0000
Date: Mon, 22 Dec 2025 17:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 5/5]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202512221712.RohHSsdC-lkp@intel.com>
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
head:   3ce6827ad16244f83976f3267e13d63da0613660
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [5/5] ANDROID: usb: gadget=
: configfs: Add Uevent to notify userspace
:::::: branch date: 28 hours ago
:::::: commit date: 1 year, 5 months ago
config: i386-randconfig-141-20251222 (https://download.01.org/0day-ci/archi=
ve/20251222/202512221712.RohHSsdC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512221712.RohHSsdC-lkp@intel.com/

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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
