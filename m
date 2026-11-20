Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139323;
	b=pWxqOKPVeZZWUWMbeCJJE4e7FAr1FQ/oOflmD6b/6iysVRLAYHKRnwhUphNuispwTktA
	 YWuMoh0t5rZJ73g6OiK9HcUN9Q16RetaWc3bQGRmMUJSKru7uO+MdV/5kk3WTxOUb8HOa
	 m+9BXpoIsOtNRvyz+2nwX7vAHwDjzbH5FflahkSwvZSj0ZQwHCtNgO5UOf5aVwS/FDaeh
	 xLWU7HkjiIHEH4F1ebOp7XNTGq4GJTgpzf4tYp7F7DWltdnGRISfv40+mAXVCzrydV72v
	 5dmPxrmmm5cnHqFlEfHLyATxy9Ic0OzMn/yeqHk5NVzdMQU2Zv49bnXh3xLqNX1cXOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139323;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3vigQ8HsxyyVhIWhdb79VY6rRPpMR2yuCR+KxEwaSxU=;
	b=uXc4Mwdp1mEGI1qLXh8hV6S+/XgrHZOQbSZciPl6MMww61gny7B4WPRfasAM6NUD0ve/
	 MS8XxkRxUZmUuDJvAQ470So9H6mb74nx1K4mV/wbt5oluCOc4y5ciwUkq5VaSQ7Vup12j
	 ITy/iHshj26Fh/5GB8vbGc5xTD3rdZhiNWz3NiNICemIlLCgeCwsjFiB11r5rzNJ19EMW
	 rDhz5LCPe0HmCuT9Upg41Ze1zKo6Vl9s0rGU58jiVV8PXxX7nTyAmnc6Icyjoov9tucQo
	 ST6HXkexCiVLO7GboJbTFqP9R9D290trvsq++c+i5behFDvYL19JoyjuSLYtJYQtNqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFMHoXRB;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01948606A320
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 01:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01948606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFMHoXRB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795139323; x=1826675323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vxf4aPv1O7btmg53L/TUUpnsDhaycPx/tIqdO8To+Sk=;
  b=lFMHoXRB8BkeIFF0FTbV1JqKzU5yk3GgS1X0zsqOMrhJMwrpqwS9hUk4
   OojoyHZ2VRngYnvAWsVcDgmDqMmX+MF4eINNme7+/zPDyrL4bQSevO5n1
   whlCaF0Yh+K9gyINBJH6tSmii9JQatj9Gtq1c3Hufq8OnvCp/dCrfHjhu
   V4sd1EzIHLmtMPWsQo/A/uSArVmWuVBCCUH1iG8mXfcBaHrpFnl/wAH9h
   +kFXF2twsQxAEHZigfiVhmJtb90vlG/wac4ofRaNyj4LOP863qSubGEn1
   AisQGpMt328LEsePLTl0i9Xce53YDlJLIp2r3iLzeXLcyDWMYsYyPrUV8
   Q==;
X-CSE-ConnectionGUID: MnvKS10oRoqLA9Cyz7y8Rg==
X-CSE-MsgGUID: p9mnj2H0SEeTTpAPtL6xtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3903830"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3903830"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 17:48:42 -0800
X-CSE-ConnectionGUID: pjz2+a2HT42vfhZNlR9tjg==
X-CSE-MsgGUID: 5CUVQVOLQz6URBAlQXQIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10570814"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2026 17:48:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUDjz-000000003vB-21tJ;
	Fri, 20 Nov 2026 01:48:39 +0000
Date: Fri, 20 Nov 2026 02:47:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5015/9862]
 drivers/platform/asus/asus-wmi.c:2513 asus_new_rfkill() warn: '*rfkill' is an
 error pointer or valid
Message-ID: <20261120024705.y3mEBTWi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chipang Kao <chipang_kao@asus.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>

Hi Chipang,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adcad7f4e6332cff3d6d7165f41584899f598534
commit: ef696e89f836c31825b754abe181b490b82fbee7 [5015/9862] platform/asus:=
 Move ASUS platform drivers out of drivers/platform/x86
:::::: branch date: 7 hours ago
:::::: commit date: 9 days ago
config: riscv-randconfig-2200-20261120 (https://download.01.org/0day-ci/arc=
hive/20261120/20261120024705.y3mEBTWi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261120024705.y3mEBTWi-lkp@intel.com/

smatch warnings:
drivers/platform/asus/asus-wmi.c:2513 asus_new_rfkill() warn: '*rfkill' is =
an error pointer or valid

vim +2513 drivers/platform/asus/asus-wmi.c

ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2496 =20
e12e6d94db24e9 drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2497  static int asus_new_rfkill(struct asus_wmi *asus,
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2498  			   struct asus_rfkill *arfkill,
e12e6d94db24e9 drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2499  			   const char *name, enum rfkill_type type, int dev_id)
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2500  {
1d070f89a723bd drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2501  	int result =3D asus_wmi_get_devstate_simple(asus, dev_id);
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2502  	struct rfkill **rfkill =3D &arfkill->rfkill;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2503 =20
5c95638d115f9c drivers/platform/x86/eeepc-wmi.c Corentin Chary 2011-02-06  =
2504  	if (result < 0)
5c95638d115f9c drivers/platform/x86/eeepc-wmi.c Corentin Chary 2011-02-06  =
2505  		return result;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2506 =20
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2507  	arfkill->dev_id =3D dev_id;
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2508  	arfkill->asus =3D asus;
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2509 =20
e12e6d94db24e9 drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2510  	*rfkill =3D rfkill_alloc(name, &asus->platform_device->dev, type,
a7ce3f041e640d drivers/platform/x86/asus-wmi.c  Corentin Chary 2011-02-26  =
2511  			       &asus_rfkill_ops, arfkill);
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2512 =20
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29 @=
2513  	if (!*rfkill)
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2514  		return -EINVAL;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2515 =20
e8f56c80aedacf drivers/platform/x86/asus-wmi.c  AceLan Kao     2013-05-30  =
2516  	if ((dev_id =3D=3D ASUS_WMI_DEVID_WLAN) &&
f515623cac706e drivers/platform/x86/asus-wmi.c  AceLan Kao     2014-07-09  =
2517  			(asus->driver->quirks->wapf > 0))
6cae06e603339f drivers/platform/x86/asus-wmi.c  AceLan Kao     2012-07-27  =
2518  		rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
6cae06e603339f drivers/platform/x86/asus-wmi.c  AceLan Kao     2012-07-27  =
2519 =20
5c95638d115f9c drivers/platform/x86/eeepc-wmi.c Corentin Chary 2011-02-06  =
2520  	rfkill_init_sw_state(*rfkill, !result);
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2521  	result =3D rfkill_register(*rfkill);
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2522  	if (result) {
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2523  		rfkill_destroy(*rfkill);
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2524  		*rfkill =3D NULL;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2525  		return result;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2526  	}
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2527  	return 0;
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2528  }
ba48fdb969d040 drivers/platform/x86/eeepc-wmi.c Corentin Chary 2010-11-29  =
2529 =20

:::::: The code at line 2513 was first introduced by commit
:::::: ba48fdb969d0404d54f6fa0266373afecbbd19d7 eeepc-wmi: add rfkill suppo=
rt for wlan, bluetooth and 3g

:::::: TO: Corentin Chary <corentincj@iksaif.net>
:::::: CC: Matthew Garrett <mjg@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
