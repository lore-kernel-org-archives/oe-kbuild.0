Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCD32D7DA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833925; cv=none; b=HWQpjxCOt6x+v+uhOUreGV9pvo+LYfvBGejU57564AT45rH0Rmc/1GOhpH7qRii6BUChYKJUp/fs93HL6olPg1U+5JFpmSBaDQx6pbLLtxqOQaaM/w4hjchz6x66JgUONYO9zmAwPz+o9iDFpIXjphC+o8Xc2MkmUBF3Nx7aNrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833925; c=relaxed/simple;
	bh=MN7Yx+HgQgh7bCCu2vuxC50GCcCYFpxJnEz1Bz4ppd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcHwe3/h1V1Upf9DCCpeiB3fjKd3ZjB+VIfSmTlsY9fASjAItpcLY7beJqRK+zOQ53CK/OvkwfkYA1tiQ4mx96tjLVfe69xAhofoPnaMJnBjpcJCj1MDG/B08VNkbgr2u7c6OX8GXt+w0fZhZgr+7tNqnlrVsunGwPsZ+5x3mXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wjkb2Moy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wjkb2Moy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765833924; x=1797369924;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MN7Yx+HgQgh7bCCu2vuxC50GCcCYFpxJnEz1Bz4ppd4=;
  b=Wjkb2MoylNfISgn1anWMz2ocE/CLbM35aZqGpowjtnC5kyreowQI4VxG
   sHZvNO7X8b7+ZXkMeocCQQyodsppAZlC0ts91uhBI9pZUy1nWKB1No2MT
   7licU/B2jWMROGDJaVOgFIIv+Lp/bdS5LECRup2STqCGgDdGozdCRoQp+
   ik90qDnUoHHdiivbIIAUw12e9o/D5MNlIwtRk+RwTjE5qWCB9EjEuO+9q
   NR3jO7W1kbi6a29PX5p1LPUIjOlcjItAn1VfD6KFxUvHjI/GkbjTDRa1/
   W+ju6L2EIwHrrv67KkGRRdoCwftIBLj7TP+oEr3qh0GYyNnYds+g5DQBO
   w==;
X-CSE-ConnectionGUID: de5orEeHSu6lWaTfiZsmZg==
X-CSE-MsgGUID: XG1Q1GwZSMy8j/z9YLA1kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78865991"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78865991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:25:23 -0800
X-CSE-ConnectionGUID: au0slv+kTgu5gWt7zad0Rw==
X-CSE-MsgGUID: pcMveI8bSj6P1hnZowFk4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="228487003"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 13:25:22 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVG48-000000000oc-0pcg;
	Mon, 15 Dec 2025 21:25:12 +0000
Date: Tue, 16 Dec 2025 05:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill()
 warn: 'atp_rfk->rfkill' is an error pointer or valid
Message-ID: <202512160527.nMGw3i54-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 651b57dd40871d4d0d61fb291e7f26e2b8bd69b1 platform/x86: Move Lenovo files into lenovo subdir
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160527.nMGw3i54-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160527.nMGw3i54-lkp@intel.com/

smatch warnings:
drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/lenovo/thinkpad_acpi.c:2662 hotkey_inputdev_close() warn: bitwise AND condition is false here
drivers/platform/x86/lenovo/thinkpad_acpi.c:3669 hotkey_notify_hotkey() warn: bitwise AND condition is false here

vim +1206 drivers/platform/x86/lenovo/thinkpad_acpi.c

19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1184  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1185  static int __init tpacpi_new_rfkill(const enum tpacpi_rfk_id id,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1186  			const struct tpacpi_rfk_ops *tp_rfkops,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1187  			const enum rfkill_type rfktype,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1188  			const char *name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1189  			const bool set_default)
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1190  {
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1191  	struct tpacpi_rfk *atp_rfk;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1192  	int res;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1193  	bool sw_state = false;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1194  	bool hw_state;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1195  	int sw_status;
90d9d3c79c44bc drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-01-11  1196  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1197  	BUG_ON(id >= TPACPI_RFK_SW_MAX || tpacpi_rfkill_switches[id]);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1198  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1199  	atp_rfk = kzalloc(sizeof(struct tpacpi_rfk), GFP_KERNEL);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1200  	if (atp_rfk)
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1201  		atp_rfk->rfkill = rfkill_alloc(name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1202  						&tpacpi_pdev->dev,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1203  						rfktype,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1204  						&tpacpi_rfk_rfkill_ops,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1205  						atp_rfk);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02 @1206  	if (!atp_rfk || !atp_rfk->rfkill) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1207  		pr_err("failed to allocate memory for rfkill class\n");
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1208  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1209  		return -ENOMEM;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1210  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1211  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1212  	atp_rfk->id = id;
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1213  	atp_rfk->ops = tp_rfkops;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1214  
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1215  	sw_status = (tp_rfkops->get_status)();
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1216  	if (sw_status < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1217  		pr_err("failed to read initial state for %s, error %d\n",
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1218  		       name, sw_status);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1219  	} else {
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1220  		sw_state = (sw_status == TPACPI_RFK_RADIO_OFF);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1221  		if (set_default) {
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1222  			/* try to keep the initial state, since we ask the
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1223  			 * firmware to preserve it across S5 in NVRAM */
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1224  			rfkill_init_sw_state(atp_rfk->rfkill, sw_state);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1225  		}
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1226  	}
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1227  	hw_state = tpacpi_rfk_check_hwblock_state();
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1228  	rfkill_set_hw_state(atp_rfk->rfkill, hw_state);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1229  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1230  	res = rfkill_register(atp_rfk->rfkill);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1231  	if (res < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1232  		pr_err("failed to register %s rfkill switch: %d\n", name, res);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1233  		rfkill_destroy(atp_rfk->rfkill);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1234  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1235  		return res;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1236  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1237  
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1238  	tpacpi_rfkill_switches[id] = atp_rfk;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1239  
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1240  	pr_info("rfkill switch %s: radio is %sblocked\n",
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1241  		name, (sw_state || hw_state) ? "" : "un");
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1242  	return 0;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1243  }
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1244  

:::::: The code at line 1206 was first introduced by commit
:::::: 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5 rfkill: rewrite

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
