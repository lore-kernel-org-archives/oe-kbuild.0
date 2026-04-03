Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B4537B00F
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205603; cv=none; b=dKThEhFWZui2NBc5IO2d1Uk12li1tzM0TsRYaXZiikQ6+NQiR98UVA5cTqBDiCciREq2180h0q//HMZMNXSVvJbHa5o70IjGzgs7wYe4tRYZgzSRpGmkFNjOVWQfkitaBPOAzFADs6Wb+KfD1rcbD5PgNd4RyFLubhYr0rvMNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205603; c=relaxed/simple;
	bh=pHVq57ecSNw2p3A9zUMRFVKlnKtJr+Y6myF+8z8a0Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPuqmH9fFmPDQDRrtBtMng+ZuzyFxl56bz6vKtEIpuKdeiUKL2bz23j+ARbl81AoNf5jN9A63csuOLxMaWU5ZIhHEEJkCzckmoRKPV9M2tkEYcbjiNwmZDXzbGsexyj6au3bL/uAsamOqaMp+z9PpvYxlmKedJQFSeLw/hPpxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rhvl3SGK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rhvl3SGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205601; x=1806741601;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pHVq57ecSNw2p3A9zUMRFVKlnKtJr+Y6myF+8z8a0Ww=;
  b=Rhvl3SGKGiuXpOZflQyKMHQatyClBhh556PpvfWjnF1bMY0vLruuJLnT
   r/62ulqdfOoAhr/QkdSHwOTf8sfaBP1ppUr0uw9vM3PZTVRsi6xPGatxM
   j8HHm1RMBpC5Dd/bq79/W8d6MVNQUuqnyVOAL6bwnC4cr3EzniHBIJZ0/
   GO7YsHOLnHOdX8Z7753h3Pl1rgf44I1/ED0zbCSzcx1KYDYT3J84vkGmB
   NYaZSeFE2t4R2IhHzAzT1/rTUEt2InecJRg31c7hkAmDYIm9eJztwCzDD
   Ut+lFWPUrgMGfLfe8EJVXCC/FHF00dwmcN6Wnt6hmYEyaGfKFpbveGQ10
   g==;
X-CSE-ConnectionGUID: cy9EOgq7RxiziHon5azywA==
X-CSE-MsgGUID: DPOLJImsQZWdF7f/yTDCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76153055"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76153055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:59 -0700
X-CSE-ConnectionGUID: 3eYzAarITomJBWO21w6tOQ==
X-CSE-MsgGUID: c7AaZDVISaSDRwh5VpwxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="257678121"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4I-0000000011n-0GHb;
	Fri, 03 Apr 2026 08:39:54 +0000
Date: Fri, 03 Apr 2026 16:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/lenovo/thinkpad_acpi.c:1206
 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
Message-ID: <202604021355.MRJTlijl-lkp@intel.com>
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
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mark,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: 651b57dd40871d4d0d61fb291e7f26e2b8bd69b1 platform/x86: Move Lenovo =
files into lenovo subdir
date:   10 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-r071-20260402 (https://download.01.org/0day-ci/arch=
ive/20260402/202604021355.MRJTlijl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604021355.MRJTlijl-lkp@intel.com/

smatch warnings:
drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill() warn: =
'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/lenovo/thinkpad_acpi.c:2662 hotkey_inputdev_close() wa=
rn: bitwise AND condition is false here
drivers/platform/x86/lenovo/thinkpad_acpi.c:3669 hotkey_notify_hotkey() war=
n: bitwise AND condition is false here

vim +1206 drivers/platform/x86/lenovo/thinkpad_acpi.c

19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1184 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1185  static int __init tpacpi_new_rfkill(const enum tpacp=
i_rfk_id id,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1186  			const struct tpacpi_rfk_ops *tp_rfkops,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1187  			const enum rfkill_type rfktype,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1188  			const char *name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1189  			const bool set_default)
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1190  {
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1191  	struct tpacpi_rfk *atp_rfk;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1192  	int res;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1193  	bool sw_state =3D false;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1194  	bool hw_state;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1195  	int sw_status;
90d9d3c79c44bc drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-01-11  1196 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1197  	BUG_ON(id >=3D TPACPI_RFK_SW_MAX || tpacpi_rfkill_s=
witches[id]);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1198 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1199  	atp_rfk =3D kzalloc(sizeof(struct tpacpi_rfk), GFP_=
KERNEL);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1200  	if (atp_rfk)
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1201  		atp_rfk->rfkill =3D rfkill_alloc(name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1202  						&tpacpi_pdev->dev,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1203  						rfktype,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1204  						&tpacpi_rfk_rfkill_ops,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1205  						atp_rfk);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02 @1206  	if (!atp_rfk || !atp_rfk->rfkill) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1207  		pr_err("failed to allocate memory for rfkill class=
\n");
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1208  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1209  		return -ENOMEM;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1210  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1211 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1212  	atp_rfk->id =3D id;
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1213  	atp_rfk->ops =3D tp_rfkops;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1214 =20
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1215  	sw_status =3D (tp_rfkops->get_status)();
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1216  	if (sw_status < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1217  		pr_err("failed to read initial state for %s, error=
 %d\n",
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1218  		       name, sw_status);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1219  	} else {
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1220  		sw_state =3D (sw_status =3D=3D TPACPI_RFK_RADIO_OF=
F);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1221  		if (set_default) {
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1222  			/* try to keep the initial state, since we ask the
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1223  			 * firmware to preserve it across S5 in NVRAM */
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1224  			rfkill_init_sw_state(atp_rfk->rfkill, sw_state);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1225  		}
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1226  	}
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1227  	hw_state =3D tpacpi_rfk_check_hwblock_state();
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1228  	rfkill_set_hw_state(atp_rfk->rfkill, hw_state);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1229 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1230  	res =3D rfkill_register(atp_rfk->rfkill);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1231  	if (res < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1232  		pr_err("failed to register %s rfkill switch: %d\n"=
, name, res);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1233  		rfkill_destroy(atp_rfk->rfkill);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1234  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1235  		return res;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1236  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1237 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1238  	tpacpi_rfkill_switches[id] =3D atp_rfk;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1239 =20
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1240  	pr_info("rfkill switch %s: radio is %sblocked\n",
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1241  		name, (sw_state || hw_state) ? "" : "un");
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1242  	return 0;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1243  }
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1244 =20

:::::: The code at line 1206 was first introduced by commit
:::::: 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5 rfkill: rewrite

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
