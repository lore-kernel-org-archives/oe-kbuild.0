Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C0519F135
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582522; cv=none; b=rLY+8UikAE0DtSU7UCJ8P2xRkwa6w2zw1L6tk4T6QjrUM44Vkn0D0YiUBeQxTvEYXOcVS60WB6wYyTVQgPGM08Lcfy0c+//X6jHmHIIm27uJ+lKc3CTMguh0isw41voqPGGMf+0cuZrdTB2AHmWW9H3SuZd/1+W14/2pKtA4BUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582522; c=relaxed/simple;
	bh=g0jq54RWbPl2mtNeBUSBXxJdK2MT58zqjNbhebfEqRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNLh7izV6Co6+jeG19BsikdTbjLVt1bdjzORfG3JxRbxC36xeneqMl3uiSmWuWguDCDTbPnxisH8VTkMVwKmvVH31Skv+cAfP+LxtoAIwtyApF7fNfnY80zsWZgvB6aPZ8cvvjPcKRn2HRfLxW04ScsHwEfu+dflSz0qqoOnij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0X5KfP/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0X5KfP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755582521; x=1787118521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0jq54RWbPl2mtNeBUSBXxJdK2MT58zqjNbhebfEqRI=;
  b=J0X5KfP/NOrlcWjj5G5ouxgIyM8leT99l/viMCSGzMnzT38BKST+3fEz
   DijuE3sRR6sqXl9UBwqAWSVzjDKjsjVL7Y60YPHz18BXrM8cAPM/Wz7oR
   cS+ny5CxZk2IGZd0tAFjKtuljTy5pd2e4C0KMDZqWXNHwJA0sBjzZy6sn
   BG7JOWCzelSqT8OcqyDROQaE9x5Ru6nTyZoVhOscJZwQvCSnaYOgT3yaI
   AOKyXkXKzx0dLTENCKoOU3il9YY+RInCyZM6bEypgBXjT2ozP5NiL5Bwg
   EiD/yTl4nM+G5vgnuwFF4+X9N3jyV3QzTCzOSS4SeoHhJvuqE3MfoVQko
   Q==;
X-CSE-ConnectionGUID: 9PFdIi1IQG66vqYlPXSwWA==
X-CSE-MsgGUID: fIU0XKS7Q+muViaVonPAfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57921206"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57921206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 22:48:40 -0700
X-CSE-ConnectionGUID: Hc0/S4YlSoipOpuRQqgcHw==
X-CSE-MsgGUID: SFHgUGLfRHuBmmze+Ipsww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="204909559"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2025 22:48:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoFD2-000GXn-26;
	Tue, 19 Aug 2025 05:48:36 +0000
Date: Tue, 19 Aug 2025 13:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
Message-ID: <202508191303.UzPStkjj-lkp@intel.com>
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
In-Reply-To: <20250816-bd71828-charger-v1-2-71b11bde5c73@kemnade.info>
References: <20250816-bd71828-charger-v1-2-71b11bde5c73@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/mfd-bd71828-bd71815-prepare-for-power-supply-support/20250817-032146
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250816-bd71828-charger-v1-2-71b11bde5c73%40kemnade.info
patch subject: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191303.UzPStkjj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508191303.UzPStkjj-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:298 bd71828_get_temp() error: uninitialized symbol 't'.
drivers/power/supply/bd71828-power.c:559 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/t +298 drivers/power/supply/bd71828-power.c

c57d31029550a0 Andreas Kemnade 2025-08-16  284  
c57d31029550a0 Andreas Kemnade 2025-08-16  285  /* Unit is tenths of degree C */
c57d31029550a0 Andreas Kemnade 2025-08-16  286  static int bd71828_get_temp(struct bd71828_power *pwr, int *temp)
c57d31029550a0 Andreas Kemnade 2025-08-16  287  {
c57d31029550a0 Andreas Kemnade 2025-08-16  288  	uint16_t t;
c57d31029550a0 Andreas Kemnade 2025-08-16  289  	int ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  290  	int tmp = 200 * 10000;
c57d31029550a0 Andreas Kemnade 2025-08-16  291  
c57d31029550a0 Andreas Kemnade 2025-08-16  292  	ret = bd7182x_read16_himask(pwr, pwr->regs->btemp_vth,
c57d31029550a0 Andreas Kemnade 2025-08-16  293  				    BD71828_MASK_VM_BTMP_U, &t);
c57d31029550a0 Andreas Kemnade 2025-08-16  294  	if (ret || t > 3200)
c57d31029550a0 Andreas Kemnade 2025-08-16  295  		dev_err(pwr->dev,
c57d31029550a0 Andreas Kemnade 2025-08-16  296  			"Failed to read system min average voltage\n");
c57d31029550a0 Andreas Kemnade 2025-08-16  297  
c57d31029550a0 Andreas Kemnade 2025-08-16 @298  	tmp -= 625ULL * (unsigned int)t;
c57d31029550a0 Andreas Kemnade 2025-08-16  299  	*temp = tmp / 1000;
c57d31029550a0 Andreas Kemnade 2025-08-16  300  
c57d31029550a0 Andreas Kemnade 2025-08-16  301  	return ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  302  }
c57d31029550a0 Andreas Kemnade 2025-08-16  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
