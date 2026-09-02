Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAA361DAE
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359374; cv=none; b=n9/Nc2/WXe9mUJhqusLjwrmQo9BvEsZVqWV4QMwcLurupVPvicDOq/VucxVVkwDMBnEQQ5EtnGpk8UcnLEhctHfOsBrqN5GoPSOX8GMK2PlJ320jOHOzcWhrxuKr9hTKxa9Iovu42gfMUk5HSBbYjVWbIsYT6/24HKAnGZUnHv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359374; c=relaxed/simple;
	bh=BwGzsCHd79Rv1VjFxLlZT7IghC47Jl0YHSKAFJ7ZksA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FuM7kOQEbcPVa6xLGJ/ZoEOggoKjQAvtdHsQEZUK40/Czpb4xLEnhvZ2ZYjvW+uER7Mipod2cpxNx6Sk+1NmCDD0ZNLSVvlYutl0ayTzkQepIMPPyRu4JDJJCnE3lVpbP6ojDP0t7vqS7+CyT7AdljuS41J7t6Q5b1X61Q4O+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTmXHgyO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTmXHgyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788359370; x=1819895370;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BwGzsCHd79Rv1VjFxLlZT7IghC47Jl0YHSKAFJ7ZksA=;
  b=TTmXHgyOOnNgdN6pa4mtrt2ft4IRv+LwSHzSfWCpki6jMWRbVWFVEmyn
   Qg64oVMwpEeEvT1wDcOqqYqtJV2VbMJvT8d8WadYOX1nSjocaZ3F0rHpP
   yiiQa0q62hzKu12JflkTUyiofhokuAXNPK22fJykCRGYWoHfP+2n9gCpL
   o9/fL8lYJtlu5xczCMRd/FUTgxHZsms/vf5wg8iCb89vjnmWmvHxEwzh7
   KaAQakoQofoKsAPeQ8nG4z2/2plmkbj6ZNVgJBbATEnEXVG36XcM/NgyD
   bcYtN0t3/oMONQqN5sJGx/Ipy12v6ANQAr0joatbWpXofwADlB8WoXYVZ
   w==;
X-CSE-ConnectionGUID: qZpVdmRARLCBpcmGQEkanA==
X-CSE-MsgGUID: Otc+s3SWTQG7T8INaFPwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76370399"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="76370399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:29:30 -0700
X-CSE-ConnectionGUID: XuTbpGm1Ri+VO1M4qH15Yg==
X-CSE-MsgGUID: AjnPxe7MSyyJdgthFXbgJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266826679"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 07:29:29 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1lxu-000000002qK-135O;
	Wed, 02 Sep 2026 14:29:26 +0000
Date: Wed, 02 Sep 2026 22:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/classmate-laptop.c:1033
 cmpc_ipml_probe() warn: 'ipml->rf' is an error pointer or valid
Message-ID: <202609022215.3KRQQCGe-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: 069b06f8dfc9821fa54f0c5109ebbde891ea363a platform/x86: classmate-la=
ptop: Convert ipml driver to a platform one
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20260902 (https://download.01.org/0day-ci/archi=
ve/20260902/202609022215.3KRQQCGe-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 069b06f8dfc9 ("platform/x86: classmate-laptop: Convert ipml driver=
 to a platform one")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609022215.3KRQQCGe-lkp@intel.com/

smatch warnings:
drivers/platform/x86/classmate-laptop.c:1033 cmpc_ipml_probe() warn: 'ipml-=
>rf' is an error pointer or valid

vim +1033 drivers/platform/x86/classmate-laptop.c

d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27   999 =20
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1000  static int =
cmpc_ipml_probe(struct platform_device *pdev)
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1001  {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1002  	int retval;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1003  	struct ipm=
l200_dev *ipml;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1004  	struct bac=
klight_properties props;
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1005  	acpi_handl=
e handle;
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1006 =20
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1007  	handle =3D =
ACPI_HANDLE(&pdev->dev);
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1008  	if (!handl=
e)
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1009  		return -E=
NODEV;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1010 =20
bf4afc53b77aeaa Linus Torvalds                2026-02-21  1011  	ipml =3D k=
malloc_obj(*ipml);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1012  	if (ipml =
=3D=3D NULL)
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1013  		return -E=
NOMEM;
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1014 =20
a19a6ee6cad2b20 Matthew Garrett               2010-02-17  1015  	memset(&pr=
ops, 0, sizeof(struct backlight_properties));
bb7ca747f8d6243 Matthew Garrett               2011-03-22  1016  	props.type=
 =3D BACKLIGHT_PLATFORM;
a19a6ee6cad2b20 Matthew Garrett               2010-02-17  1017  	props.max_=
brightness =3D 7;
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1018  	ipml->bd =
=3D backlight_device_register("cmpc_bl", &pdev->dev,
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1019  					     h=
andle, &cmpc_bl_ops,
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1020  					     &=
props);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1021  	if (IS_ERR=
(ipml->bd)) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1022  		retval =
=3D PTR_ERR(ipml->bd);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1023  		goto out_=
bd;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1024  	}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1025 =20
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1026  	ipml->rf =
=3D rfkill_alloc("cmpc_rfkill", &pdev->dev, RFKILL_TYPE_WLAN,
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1027  				&cmpc_r=
fkill_ops, handle);
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1028  	/*
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1029  	 * If RFKI=
LL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1030  	 * This is=
 OK, however, since all other uses of the device will not
3b329cfec7522b5 Bhaskar Chowdhury             2021-03-17  1031  	 * derefer=
ence it.
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09  1032  	 */
b95d13eaf3d4ea0 Thadeu Lima de Souza Cascardo 2010-06-09 @1033  	if (ipml->=
rf) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1034  		retval =
=3D rfkill_register(ipml->rf);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1035  		if (retva=
l) {
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1036  			rfkill_d=
estroy(ipml->rf);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1037  			ipml->rf=
 =3D NULL;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1038  		}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1039  	}
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1040 =20
069b06f8dfc9821 Rafael J. Wysocki             2026-05-11  1041  	platform_s=
et_drvdata(pdev, ipml);
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1042  	return 0;
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1043 =20
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1044  out_bd:
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1045  	kfree(ipml=
);
d5c051f1080e0ee Thadeu Lima de Souza Cascardo 2010-04-27  1046  	return ret=
val;
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1047  }
529aa8cb0a59367 Thadeu Lima de Souza Cascardo 2009-12-21  1048 =20

:::::: The code at line 1033 was first introduced by commit
:::::: b95d13eaf3d4ea093aba95c7f615f3b10708a2c4 classmate-laptop: should ch=
eck for NULL as retval for rfkill_alloc

:::::: TO: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
