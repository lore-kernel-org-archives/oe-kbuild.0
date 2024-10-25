Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3170803
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861510; cv=none; b=Yd5fQRRK73sdAs50+4H47OELF/+3M0mYCKmi6tlxKLncJ7Hz6B9+ek3UoHlkzFmACIsSA0XNCKFAaBhWCbD3O7mwnUjyix83/8Ard6zLZMFDzkawrPm26OS+wBP7/RQzjUCdDMhqW3Si7eUXOxif0Ix8x0fKDAXn5E9tFUVgf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861510; c=relaxed/simple;
	bh=R9APtkNVotKh5JltS1PH6AZRNH+iuc1XKGkzYXYPmnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkFApsdc2sbrfNdov+s7EL5b4+Yq3em7pPJT5HobkAvEH2OZc46HD3ecTElQ8WfnGLRxLrYGghpvMmdaZLQ+7rIwfctLlLsollg7BpZs0jGrULn1Fz++Q6SKtiAp9KeSkuM6S/9M7/Q3/XSWCPcm+sj5/VOcNqyQfZr4jPOiEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMrYw/Vq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMrYw/Vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729861508; x=1761397508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9APtkNVotKh5JltS1PH6AZRNH+iuc1XKGkzYXYPmnE=;
  b=mMrYw/VqeQTaALcGoVdZnTBuNOErTj4PVqLZu4bJZ0VD1dZ2fE4Dm6vQ
   8B7v0Dp/wRdZuT1btfP0BuCzsKTvOcTWPSAvdqhjt77FwmSBF9nDc0W+d
   B7Sqtuv3THkBHHotjb0FQemLT3FtoWHIp0OWtfQHrCmQNYmu9Afl/8hD9
   kg6RloQKUL6NcPnqgZcAO0J58QNMrKZ8ULzpcqM1/9acNBJ2ikQ64yjRX
   dFY+tI197Lcm6EzfPEvRq2FF1B96TPKjB59/rR+HKh7GiIOd5MDODagQw
   1HDKVp84FGG263CYwHNSShR2mImTOZQXjOM9bEgGtxBl2V7cB6S5mLJw5
   w==;
X-CSE-ConnectionGUID: uv9RiwlfSLSWoHkpxGu9Bg==
X-CSE-MsgGUID: mO7ssmACRvKSOXlndhH7KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47012317"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="47012317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:03:07 -0700
X-CSE-ConnectionGUID: wYGaxpJCSwax4HsyPcqkOw==
X-CSE-MsgGUID: XS88JJLqRYiGiPXc98xfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118369475"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2024 06:03:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Jy3-000YGi-01;
	Fri, 25 Oct 2024 13:03:03 +0000
Date: Fri, 25 Oct 2024 21:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4500/7183] drivers/gpu/drm/xe/xe_gsc.c:283
 gsc_upload_and_init() error: uninitialized symbol 'fw_ref'.
Message-ID: <202410252023.jnZWtvCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: 21eb4f178d719ef32b9b1910afb33bc87395ea6d [4500/7183] drm/xe/gsc: Update handling of xe_force_wake_get return
:::::: branch date: 7 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20241023 (https://download.01.org/0day-ci/archive/20241025/202410252023.jnZWtvCj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410252023.jnZWtvCj-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_gsc.c:283 gsc_upload_and_init() error: uninitialized symbol 'fw_ref'.

vim +/fw_ref +283 drivers/gpu/drm/xe/xe_gsc.c

997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  259  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  260  static int gsc_upload_and_init(struct xe_gsc *gsc)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  261  {
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  262  	struct xe_gt *gt = gsc_to_gt(gsc);
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  263  	struct xe_tile *tile = gt_to_tile(gt);
21eb4f178d719e Himal Prasad Ghimiray  2024-10-14  264  	unsigned int fw_ref;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  265  	int ret;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  266  
e422c0bfd9e47e Daniele Ceraolo Spurio 2024-08-07  267  	if (XE_WA(tile->primary_gt, 14018094691)) {
21eb4f178d719e Himal Prasad Ghimiray  2024-10-14  268  		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  269  
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  270  		/*
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  271  		 * If the forcewake fails we want to keep going, because the worst
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  272  		 * case outcome in failing to apply the WA is that PXP won't work,
21eb4f178d719e Himal Prasad Ghimiray  2024-10-14  273  		 * which is not fatal. Forcewake get warns implicitly in case of failure
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  274  		 */
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  275  		xe_gt_mcr_multicast_write(tile->primary_gt,
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  276  					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  277  					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  278  	}
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  279  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  280  	ret = gsc_upload(gsc);
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  281  
e422c0bfd9e47e Daniele Ceraolo Spurio 2024-08-07  282  	if (XE_WA(tile->primary_gt, 14018094691))
21eb4f178d719e Himal Prasad Ghimiray  2024-10-14 @283  		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
d62753a57de254 Daniele Ceraolo Spurio 2024-03-26  284  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  285  	if (ret)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  286  		return ret;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  287  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  288  	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  289  
3b1592fb783549 Vinay Belgaumkar       2024-06-20  290  	/* GSC load is done, restore expected GT frequencies */
3b1592fb783549 Vinay Belgaumkar       2024-06-20  291  	xe_gt_sanitize_freq(gt);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  292  
dd0e89e5edc20d Daniele Ceraolo Spurio 2023-11-17  293  	xe_gt_dbg(gt, "GSC FW async load completed\n");
dd0e89e5edc20d Daniele Ceraolo Spurio 2023-11-17  294  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  295  	/* HuC auth failure is not fatal */
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  296  	if (xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GUC))
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  297  		xe_huc_auth(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  298  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  299  	ret = xe_gsc_proxy_start(gsc);
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  300  	if (ret)
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  301  		return ret;
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  302  
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  303  	xe_gt_dbg(gt, "GSC proxy init completed\n");
997a55caa1c3b7 Daniele Ceraolo Spurio 2024-01-17  304  
dd0e89e5edc20d Daniele Ceraolo Spurio 2023-11-17  305  	return 0;
dd0e89e5edc20d Daniele Ceraolo Spurio 2023-11-17  306  }
dd0e89e5edc20d Daniele Ceraolo Spurio 2023-11-17  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
