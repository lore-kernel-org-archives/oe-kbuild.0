Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A33FE7
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jun 2025 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749954966; cv=none; b=jAQJzu4+eQbIdGiDa56iBz4C9v05QlB55RjrEaO9V7aDXnpDpNyGuVWiFX2pKSkpyBrzJ0bnGF8cyWUYybmJDctS94RwI6AKeqdy9sQqsh2XmMCXfnk1hpmf9u91VizKPWlU1aVw1LfjnnIcRkHR8Bj+djxDbxPyDkeE5kxwII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749954966; c=relaxed/simple;
	bh=t7FuFgD0BrIdYZiJdAzVraMqfYDG2Nm6fmTkSaipqCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TppKjdmtbS2Qq+Kc9RFr0z9dp7e3L3YKKaNQwHl8peqqe8VqIjbVi5pVbfLvcGBwBnrDQST9P+zsWDj0zJrgDN/ye+yanOgkx+u+f1ulmLBZp1CiMiDkdboqQTJfCBuBbjHN5X1Rrhsg3kS2GrIVlKV4IZ1o7/+tnDqkEXByx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wu0aL5pI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wu0aL5pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749954963; x=1781490963;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t7FuFgD0BrIdYZiJdAzVraMqfYDG2Nm6fmTkSaipqCs=;
  b=Wu0aL5pIs4r8Uysvm9IOnaHjkXlY6km+OgBsHrj88OH8xZxRN8aCJHJ9
   9HPfSxraj8CN3oLETItRsCrdpxFXeKNg3rGz59YFUfsbelmDlwNW+o+NO
   5Jt4que9/aSczqMj668PvphcHal//A3A/Txos3FSwPHjNoJQL5sg2stgx
   6DwUd9IX+ye+NuWQfWiNORmo3NgR4uWy5/9CHC21THnXPHuXrA12LyQs4
   NbckdigkkAsXJfGTmLYHwlGYbxYUS1T+UnD6m9+ZSsluDaBQmSewFFtB9
   09AOGMhzSRZDNUl2mR0H2YAcSurEhr00wMReoOxqwwLKyzzgMtiL9hpjw
   Q==;
X-CSE-ConnectionGUID: czy6jfqfSw2gmNP9zgpknw==
X-CSE-MsgGUID: rjcoJ1F5SVigi9AH/4+9UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63163201"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="63163201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 19:36:03 -0700
X-CSE-ConnectionGUID: /KcC3t3NSBagiyzvdssw9A==
X-CSE-MsgGUID: Ip+EX9ajRG6ECSmD5V0TCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148046626"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2025 19:36:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQdDz-000E3g-1A;
	Sun, 15 Jun 2025 02:35:59 +0000
Date: Sun, 15 Jun 2025 10:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 7/16]
 drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill() warn:
 'atp_rfk->rfkill' is an error pointer or valid
Message-ID: <202506151006.LOmeIEcH-lkp@intel.com>
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
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   73f0f2b52c5ea67b3140b23f58d8079d158839c8
commit: 651b57dd40871d4d0d61fb291e7f26e2b8bd69b1 [7/16] platform/x86: Move Lenovo files into lenovo subdir
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250614 (https://download.01.org/0day-ci/archive/20250615/202506151006.LOmeIEcH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506151006.LOmeIEcH-lkp@intel.com/

smatch warnings:
drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/lenovo/thinkpad_acpi.c:2662 hotkey_inputdev_close() warn: bitwise AND condition is false here
drivers/platform/x86/lenovo/thinkpad_acpi.c:3669 hotkey_notify_hotkey() warn: bitwise AND condition is false here

vim +1206 drivers/platform/x86/lenovo/thinkpad_acpi.c

19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1184  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1185  static int __init tpacpi_new_rfkill(const enum tpacpi_rfk_id id,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1186  			const struct tpacpi_rfk_ops *tp_rfkops,
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1187  			const enum rfkill_type rfktype,
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1188  			const char *name,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1189  			const bool set_default)
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1190  {
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1191  	struct tpacpi_rfk *atp_rfk;
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1192  	int res;
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1193  	bool sw_state = false;
5451a923bbdcff6 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1194  	bool hw_state;
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1195  	int sw_status;
90d9d3c79c44bcf drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-01-11  1196  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1197  	BUG_ON(id >= TPACPI_RFK_SW_MAX || tpacpi_rfkill_switches[id]);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1198  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1199  	atp_rfk = kzalloc(sizeof(struct tpacpi_rfk), GFP_KERNEL);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1200  	if (atp_rfk)
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1201  		atp_rfk->rfkill = rfkill_alloc(name,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1202  						&tpacpi_pdev->dev,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1203  						rfktype,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1204  						&tpacpi_rfk_rfkill_ops,
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1205  						atp_rfk);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02 @1206  	if (!atp_rfk || !atp_rfk->rfkill) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1207  		pr_err("failed to allocate memory for rfkill class\n");
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1208  		kfree(atp_rfk);
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1209  		return -ENOMEM;
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1210  	}
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1211  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1212  	atp_rfk->id = id;
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1213  	atp_rfk->ops = tp_rfkops;
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1214  
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1215  	sw_status = (tp_rfkops->get_status)();
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1216  	if (sw_status < 0) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1217  		pr_err("failed to read initial state for %s, error %d\n",
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1218  		       name, sw_status);
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1219  	} else {
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1220  		sw_state = (sw_status == TPACPI_RFK_RADIO_OFF);
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1221  		if (set_default) {
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1222  			/* try to keep the initial state, since we ask the
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1223  			 * firmware to preserve it across S5 in NVRAM */
06d5caf47ef4fbd drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-16  1224  			rfkill_init_sw_state(atp_rfk->rfkill, sw_state);
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1225  		}
b3fa1329eaf2a7b drivers/platform/x86/thinkpad_acpi.c Alan Jenkins                2009-06-08  1226  	}
5451a923bbdcff6 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1227  	hw_state = tpacpi_rfk_check_hwblock_state();
5451a923bbdcff6 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1228  	rfkill_set_hw_state(atp_rfk->rfkill, hw_state);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1229  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1230  	res = rfkill_register(atp_rfk->rfkill);
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1231  	if (res < 0) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1232  		pr_err("failed to register %s rfkill switch: %d\n", name, res);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1233  		rfkill_destroy(atp_rfk->rfkill);
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1234  		kfree(atp_rfk);
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1235  		return res;
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1236  	}
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1237  
19d337dff95cbf7 drivers/platform/x86/thinkpad_acpi.c Johannes Berg               2009-06-02  1238  	tpacpi_rfkill_switches[id] = atp_rfk;
5451a923bbdcff6 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1239  
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches                 2011-04-04  1240  	pr_info("rfkill switch %s: radio is %sblocked\n",
5451a923bbdcff6 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-12-15  1241  		name, (sw_state || hw_state) ? "" : "un");
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1242  	return 0;
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1243  }
0e74dc2646db04b drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-07-21  1244  

:::::: The code at line 1206 was first introduced by commit
:::::: 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5 rfkill: rewrite

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
