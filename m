Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370838A725
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674823; cv=none; b=K/jpmh52Na+bDI7MR+5Hlwlt2K9MsJSO6Wv/au+/lKkT/LAs030LNjNvOAnrYhUAXLyDjVPptbnOmJjgPKUT096xd/kTwBfxHFIfK41bF4N21iamzC3nYAIrhodvbbhMlWXtZkaDbR8B9mao2GCamLnYMohw7iuk2sy7xuajvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674823; c=relaxed/simple;
	bh=fqr4yP63cn9xLJfr747fhoVG/CUkjTPZohm4pEJ1DHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NWx2cgmAE7UvnVOg1EmboR+cpIg6wpipswH1bW2NLTLeL1jLxtuoYjQj0QK3qteijuKoLwVljQ6dWOduvaw35I25K/WphqNwf4wPy/NKT+edk/A+9jhhSrQ0TXWIYoIgGO6SOhkmirSKZ5uOOAvW9W5c4Z5/K/IwoVv/XegMqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWlBIRG5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWlBIRG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776674822; x=1808210822;
  h=date:from:to:cc:subject:message-id;
  bh=fqr4yP63cn9xLJfr747fhoVG/CUkjTPZohm4pEJ1DHU=;
  b=kWlBIRG5G8Dez9fvUreqhoBF/5XKl4XHSgXiD9dD7Ml63ObnbkmUK7tk
   0pkOrlKMoO6Wh2Z4Bz9hnCOe6C1ZC+NRs7jPwdhd0gY9WZLJ5iNgOPSSz
   sSWidT87VFjhFRSoY2XZW/vYSMtev2QYnCINi+FlEPGdlL/xfwc71qOhT
   BI7spTVmaPhmmVPpdX2rCQRuF+tptFivE7DPbWjjN4HeluOYlxw+2z8Zo
   59Jyuo9Ssb8/O6ucyRjyd+zRhrQAvaifV2aH7jmY+Q7HeF9GYG7y4Jdb1
   vB9sbkgvhFXlzXzhPbdcAdOxWT40CF0P6DYmUSb2TMLqw1yzRnP8Z1pes
   w==;
X-CSE-ConnectionGUID: h3NTcQ6iQom2k/NdttpSSg==
X-CSE-MsgGUID: dMoUCyXnSKSJmA7TYJNsLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="94986813"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="94986813"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: GArsw5JsS366+PUE4FNN7A==
X-CSE-MsgGUID: 4Y4lvKQDRp20RYF0VykYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="255140492"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 Apr 2026 01:47:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEkHS-000000002Er-3WcC;
	Mon, 20 Apr 2026 08:46:58 +0000
Date: Mon, 20 Apr 2026 10:46:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thermal:thermal/cooling-device-with-id-v2 6/14]
 ./include/linux/thermal.h:329: multiple definition of
 `devm_thermal_cooling_device_register';
 drivers/power/supply/power_supply_core.o:./include/linux/thermal.h:329: first
 defined here
Message-ID: <202604201001.wOviDvCE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id-v2
head:   a1f086d250b04a9b833e71a6fa865e3600c5dac0
commit: 729cfe840489da5dcaf0bf3b57361263c2cbf125 [6/14] thermal/core: Register cooling device non-OF drivers
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260420/202604201001.wOviDvCE-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201001.wOviDvCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201001.wOviDvCE-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: drivers/hwmon/hwmon.o: in function `devm_thermal_cooling_device_register':
>> ./include/linux/thermal.h:329: multiple definition of `devm_thermal_cooling_device_register'; drivers/power/supply/power_supply_core.o:./include/linux/thermal.h:329: first defined here


vim +329 ./include/linux/thermal.h

729cfe840489da Daniel Lezcano 2026-04-08  325  
729cfe840489da Daniel Lezcano 2026-04-08  326  struct thermal_cooling_device *
729cfe840489da Daniel Lezcano 2026-04-08  327  devm_thermal_cooling_device_register(struct device *dev, const char *type,
729cfe840489da Daniel Lezcano 2026-04-08  328  				     void *devdata, const struct thermal_cooling_device_ops *ops)
729cfe840489da Daniel Lezcano 2026-04-08 @329  {
729cfe840489da Daniel Lezcano 2026-04-08  330  	return ERR_PTR(-ENODEV);
729cfe840489da Daniel Lezcano 2026-04-08  331  }
729cfe840489da Daniel Lezcano 2026-04-08  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
