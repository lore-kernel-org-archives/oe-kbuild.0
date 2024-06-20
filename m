Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA44F211
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893510; cv=none; b=WPfkB2oyUzvLYzkfb9XbnibXId7MYFHKbjwIkPvNHintGA/Ro0IIvEacpd/uYY8p5l68yAPl4Tjxv4UiOcrEJN92R2d8OBmMu9GKQbUQ29uD+8rItaYj8ymvSMzUFNhUOqwQi20oAoVg2twTvbmj4SSYkJPZX5J6DeJSO3VyB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893510; c=relaxed/simple;
	bh=5Y3Vrg6580pHiugQAf6Hk4YyQ1JKByEKjhNemsRG1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJxOeXu2jH3WBjPu+jCBTeLaRAJvG+MEjmwR0VKVLhjsVPg4QYR6dIXPYNYWTgvq/OD5L8keCJyZ0Z6mUzZrUIJKuD3kP3011N8iroGSoUSi0pp9tWu+6uajE7kq2fWqtkNLTh32X8n55rZqjB/WSWGgiAFZSb4gymNGcuwleQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbRnW7GV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbRnW7GV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718893508; x=1750429508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Y3Vrg6580pHiugQAf6Hk4YyQ1JKByEKjhNemsRG1JE=;
  b=QbRnW7GVFnjliT/7POLMpskrwrv1ytVEiGEThpXZh/zt6HqFR33OpRGD
   yYygFz//jVaiGgIzA8oNNOglRfyqqzM3jTbeIrSulk5zwXaic0eJZPbFX
   Thssj1V7QMpLBYxCvKN+jqMRdch+C4t3gKL4C9JpaC0OC04ZL7V27Ddys
   l7/vJ2Apu7ETKlSaWZx8EGhMEYtNoyNNaA51KGVUHkCLAIxSdkDLYiCeW
   U7quUZRy8nuX8J6+lRlPxXjp1H6M23iQGb2OdVJ9Nvc7jILeirXx1LzNh
   CzExu14VYm1OyHL6TTJ1HuVopBmRZ3oS8z/XjzPZ8H8zezSZc4TanBOy5
   A==;
X-CSE-ConnectionGUID: 1tTTXn/0SzCDBVthmR6JWA==
X-CSE-MsgGUID: 7hD9Rxx4SOaKVmZB81LXVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16015143"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="16015143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 07:25:07 -0700
X-CSE-ConnectionGUID: YY9D8QW9TGWkAXQ3nYHfrA==
X-CSE-MsgGUID: juEOln9aS/KpfW7ChdtxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46710588"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 07:25:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKIim-0007fy-1n;
	Thu, 20 Jun 2024 14:25:04 +0000
Date: Thu, 20 Jun 2024 22:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hid:for-next 1/2] include/linux/platform_data/x86/asus-wmi.h:205:9:
 sparse: sparse: missing braces around initializer
Message-ID: <202406202228.HqKAah1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/platform_data/x86/asus-wmi.h:205:9: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-input@vger.kernel.org
TO: "Luke D. Jones" <luke@ljones.dev>
CC: Jiri Kosina <jikos@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   fa9057ccb9c323816e0f2599a2d91f5c856b0004
commit: bda38f9a41d89b47dce54932f88d0e0edee00cae [1/2] HID: asus: use hid for brightness control on keyboard
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-r111-20240620 (https://download.01.org/0day-ci/archive/20240620/202406202228.HqKAah1K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406202228.HqKAah1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406202228.HqKAah1K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-asus.c: note: in included file:
>> include/linux/platform_data/x86/asus-wmi.h:205:9: sparse: sparse: missing braces around initializer

vim +205 include/linux/platform_data/x86/asus-wmi.h

bda38f9a41d89b Luke D. Jones 2024-06-07  173  
bda38f9a41d89b Luke D. Jones 2024-06-07  174  static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
bda38f9a41d89b Luke D. Jones 2024-06-07  175  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  176  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  177  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
bda38f9a41d89b Luke D. Jones 2024-06-07  178  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  179  	},
bda38f9a41d89b Luke D. Jones 2024-06-07  180  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  181  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  182  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
bda38f9a41d89b Luke D. Jones 2024-06-07  183  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  184  	},
bda38f9a41d89b Luke D. Jones 2024-06-07  185  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  186  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  187  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
bda38f9a41d89b Luke D. Jones 2024-06-07  188  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  189  	},
bda38f9a41d89b Luke D. Jones 2024-06-07  190  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  191  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  192  			DMI_MATCH(DMI_BOARD_NAME, "GA403"),
bda38f9a41d89b Luke D. Jones 2024-06-07  193  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  194  	},
bda38f9a41d89b Luke D. Jones 2024-06-07  195  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  196  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  197  			DMI_MATCH(DMI_BOARD_NAME, "GU605"),
bda38f9a41d89b Luke D. Jones 2024-06-07  198  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  199  	},
bda38f9a41d89b Luke D. Jones 2024-06-07  200  	{
bda38f9a41d89b Luke D. Jones 2024-06-07  201  		.matches = {
bda38f9a41d89b Luke D. Jones 2024-06-07  202  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
bda38f9a41d89b Luke D. Jones 2024-06-07  203  		},
bda38f9a41d89b Luke D. Jones 2024-06-07  204  	},
bda38f9a41d89b Luke D. Jones 2024-06-07 @205  	NULL,
bda38f9a41d89b Luke D. Jones 2024-06-07  206  };
bda38f9a41d89b Luke D. Jones 2024-06-07  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
