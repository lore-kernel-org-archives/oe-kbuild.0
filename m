Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974F51339A4
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762017477; cv=none; b=VyQpjFT6Tlpp9/T+BesjDi6holyCVyMcPcRgrOVBhCiDQzx+g5nRAV80wMqBP8AaiL+L+rKG1NVYQWacLdlh+/v0dZNTbhI+xgfXxterAbD7/Qi9M9R/ykDqF325qnn0Bg1kIO2IPf20GLEZ+kWdXGCI70Ru6e9jIrISGeyDnlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762017477; c=relaxed/simple;
	bh=rqCBrAojpS73Pjzqi8Q5EjbqRNB8/OXs6gsWwFRAVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URf/INR7kDIRlTRaKyDXK+UWSz0WFZ6zMbpjFsYSB/mYFnydHh508NHj2xRl2NgfZfj35tP4DyfWONBZEnWCqTjpPHWj5AMSfRE5Bd+WEBIDiL3D4X2K+in1wsu0M2tVFrE5v92dILsNl8O2byg64TDtFf3dLvAleq5nMsBGpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ol4sK5Vz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ol4sK5Vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762017475; x=1793553475;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rqCBrAojpS73Pjzqi8Q5EjbqRNB8/OXs6gsWwFRAVVM=;
  b=Ol4sK5Vzobx0jtivYumFPeqVlPufHy67okmfNnyU3ucEMEvOxrXggECE
   QJHXOFSaow5iX00Xtd+7U7c6sAgYtPD/1hJeP/13q08Ank6VbS48nJOLa
   I3t80Jg00uZgkYfzAOv1qyIln/L+smK9l5bgQhYfmHZlb4vDpPyW+b91i
   wL2RaYI/hl6OTTVE1iQ/YKhxkvC7KEP4VFzpQmtCZ+FTZ4+CkrVkR6AO/
   A83n5WaOYytAt5DWakfCqIw8QQebevPA9tAVhG8GX3yEfw/rzEUPcyCcz
   vBabThQsteHj9XY8MKridavCDzv2BLSwKOSAGTRU6Tx+9IxpFEtmxg0Rt
   w==;
X-CSE-ConnectionGUID: GpFXLiZ7QHm3KCIG97WWSA==
X-CSE-MsgGUID: uYE4DjIdSlOE6y8CjfN4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="75606019"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="75606019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 10:17:55 -0700
X-CSE-ConnectionGUID: FmKMPLADQFywv1aUtYAGqw==
X-CSE-MsgGUID: 8QsIAnEIRAOjE2MvKyfJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186162333"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2025 10:17:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFFEd-000OWW-2H;
	Sat, 01 Nov 2025 17:17:51 +0000
Date: Sun, 2 Nov 2025 01:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/6] platform/x86: lenovo-wmi-{capdata,other}: Support
 multiple Capability Data
Message-ID: <202511020004.reA5tdqa-lkp@intel.com>
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
In-Reply-To: <20251030193955.107148-4-i@rong.moe>
References: <20251030193955.107148-4-i@rong.moe>
TO: Rong Zhang <i@rong.moe>
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
TO: "Derek J. Clark" <derekjohn.clark@gmail.com>
TO: Armin Wolf <W_Armin@gmx.de>
TO: Hans de Goede <hansg@kernel.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Rong Zhang <i@rong.moe>
CC: Guenter Roeck <linux@roeck-us.net>
CC: platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hwmon@vger.kernel.org

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-lenovo-wmi-helpers-convert-returned-4B-buffer-into-u32/20251031-034358
base:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
patch link:    https://lore.kernel.org/r/20251030193955.107148-4-i%40rong.moe
patch subject: [PATCH v2 3/6] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020004.reA5tdqa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020004.reA5tdqa-lkp@intel.com/

smatch warnings:
drivers/platform/x86/lenovo/wmi-capdata.c:405 lwmi_cd_match_add_all() warn: variable dereferenced before IS_ERR check 'matchptr' (see line 395)

vim +/matchptr +405 drivers/platform/x86/lenovo/wmi-capdata.c

6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  381  
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  382  /**
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  383   * lwmi_cd_match_add_all() - Add all match rule for the master driver.
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  384   * @master: Pointer to the master device.
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  385   * @matchptr: Pointer to the returned component_match pointer.
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  386   *
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  387   * Adds all component matches to the list stored in @matchptr for the @master
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  388   * device. @matchptr must be initialized to NULL. This matches all available
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  389   * capdata types on the machine.
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  390   */
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  391  void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr)
e1a5fe662b5931 drivers/platform/x86/lenovo/wmi-capdata01.c Derek J. Clark 2025-07-01  392  {
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  393  	int i;
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  394  
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31 @395  	if (WARN_ON(*matchptr))
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  396  		return;
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  397  
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  398  	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  399  		if (!lwmi_cd_table[i].guid_string ||
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  400  		    !wmi_has_guid(lwmi_cd_table[i].guid_string))
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  401  			continue;
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  402  
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  403  		component_match_add(master, matchptr, lwmi_cd_match,
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  404  				    (void *)&lwmi_cd_table[i].type);
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31 @405  		if (IS_ERR(matchptr))
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  406  			return;
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  407  	}
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  408  
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  409  	if (!*matchptr) {
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  410  		pr_warn("a master driver requested capability data, but nothing is available\n");
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  411  		*matchptr = ERR_PTR(-ENODEV);
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  412  	}
e1a5fe662b5931 drivers/platform/x86/lenovo/wmi-capdata01.c Derek J. Clark 2025-07-01  413  }
6afc07a60a5d91 drivers/platform/x86/lenovo/wmi-capdata.c   Rong Zhang     2025-10-31  414  EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
e1a5fe662b5931 drivers/platform/x86/lenovo/wmi-capdata01.c Derek J. Clark 2025-07-01  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
