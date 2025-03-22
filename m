Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D238234994
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742673811; cv=none; b=fZ/lEZHihKwkHFKSSZhnYiuBIQco19lW8hvcNHLa7IBjORMoVgC/IDx6o+g11PNa/mvwgphM1e2k6mMyQjyolAdMZ9lsR+5YZ704+rqdpy/GiQXBKJ8UmoiROjlnma6JHoyQgIg6GUv3uGb+HgQOzJDrR68DJ6IDXfq0MXRM388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742673811; c=relaxed/simple;
	bh=xa+CQ195XiQ3/ZYdzsM34AsT3uUSxtYGGXhBVJhVSTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W86+xZx+DaSO36QC7jLhhic3Ck8X/dDUYDzMBKAv7NF9x/zliT0p3JSI7nocQB7e2KJKV7Jgd7+MUyBpEU4UL+9IaSwiTKCOpgBc2i4aUDhI5dBNt+IXW6S1Nwr3OmvRrOrXuE5mT+94f9A7MjNhcTpD+6bMxm4ewiHuI+QvUdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGdeHS6g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGdeHS6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742673809; x=1774209809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xa+CQ195XiQ3/ZYdzsM34AsT3uUSxtYGGXhBVJhVSTM=;
  b=IGdeHS6gPx3JsZDwfkFuv54cH4FHVB0w5RIwSdcYsP0swYKPZpvp1n/3
   FDTVCqFwKC8e2/MIjxeOYXs8ggSGiYBHApA29uRa6MTScSEpXDSdP72Td
   n+ll+6fUg7Cwtkry7zEGz0x+4SvSrQZbO+LWl0oLCnqh0eP22rthzdMHP
   ENXxMSHIqp34mZt3Xo9IgcfX6UuJyzvFZSIFWzMTja4DP1NpDHFp6Z/nI
   RyxgVqivuy34QtQCZ2G5uNFxbQf5M5qWCnFGgKzHCRYYCD2R8DqpnRjnC
   sVFCrMbwtrwb7pn/x50aQTp90ftgzj8nr9q/RKESMDOr9ohEebw42iJQ6
   g==;
X-CSE-ConnectionGUID: U12reSOHSzGwwCRkbPirNQ==
X-CSE-MsgGUID: HHRKmGNSSd25+++5YAx04Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54549006"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="54549006"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 13:03:26 -0700
X-CSE-ConnectionGUID: l0lRtyyTT6SlUb56kR9Fsw==
X-CSE-MsgGUID: tKnSOxpiTVSPvZO/EWDh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="128744587"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Mar 2025 13:03:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw53y-0002Mh-1H;
	Sat, 22 Mar 2025 20:03:22 +0000
Date: Sun, 23 Mar 2025 04:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: adding support for PAC194X
Message-ID: <202503230315.DVkVt7Ag-lkp@intel.com>
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
In-Reply-To: <20250317090803.30003-3-marius.cristea@microchip.com>
References: <20250317090803.30003-3-marius.cristea@microchip.com>
TO: marius.cristea@microchip.com
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: oskar.andero@gmail.com
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: marius.cristea@microchip.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 577a66e2e634f712384c57a98f504c44ea4b47da]

url:    https://github.com/intel-lab-lkp/linux/commits/marius-cristea-microchip-com/dt-bindings-iio-adc-adding-support-for-PAC194X/20250317-171150
base:   577a66e2e634f712384c57a98f504c44ea4b47da
patch link:    https://lore.kernel.org/r/20250317090803.30003-3-marius.cristea%40microchip.com
patch subject: [PATCH v2 2/2] iio: adc: adding support for PAC194X
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230315.DVkVt7Ag-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503230315.DVkVt7Ag-lkp@intel.com/

smatch warnings:
drivers/iio/adc/pac1944.c:1707 pac1944_retrieve_data() error: uninitialized symbol 'ret'.
drivers/iio/adc/pac1944.c:2463 pac1944_write_thresh() warn: inconsistent indenting

vim +/ret +1707 drivers/iio/adc/pac1944.c

e227d6e5b38646 Marius Cristea 2025-03-17  1680  
e227d6e5b38646 Marius Cristea 2025-03-17  1681  static int pac1944_retrieve_data(struct pac1944_chip_info *info, u32 wait_time)
e227d6e5b38646 Marius Cristea 2025-03-17  1682  {
e227d6e5b38646 Marius Cristea 2025-03-17  1683  	int ret;
e227d6e5b38646 Marius Cristea 2025-03-17  1684  
e227d6e5b38646 Marius Cristea 2025-03-17  1685  	/*
e227d6e5b38646 Marius Cristea 2025-03-17  1686  	 * Check if the minimal elapsed time has passed and if so,
e227d6e5b38646 Marius Cristea 2025-03-17  1687  	 * re-read the chip, otherwise the cached info is just fine
e227d6e5b38646 Marius Cristea 2025-03-17  1688  	 */
e227d6e5b38646 Marius Cristea 2025-03-17  1689  	if (time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
e227d6e5b38646 Marius Cristea 2025-03-17  1690  		       msecs_to_jiffies(PAC1944_MIN_POLLING_TIME_MS))) {
e227d6e5b38646 Marius Cristea 2025-03-17  1691  		/*
e227d6e5b38646 Marius Cristea 2025-03-17  1692  		 * We need to re-read the chip values
e227d6e5b38646 Marius Cristea 2025-03-17  1693  		 * call the pac1944_reg_snapshot
e227d6e5b38646 Marius Cristea 2025-03-17  1694  		 */
e227d6e5b38646 Marius Cristea 2025-03-17  1695  		ret = pac1944_reg_snapshot(info, true,
e227d6e5b38646 Marius Cristea 2025-03-17  1696  					   PAC1944_REFRESH_REG_ADDR,
e227d6e5b38646 Marius Cristea 2025-03-17  1697  					   wait_time);
e227d6e5b38646 Marius Cristea 2025-03-17  1698  		/*
e227d6e5b38646 Marius Cristea 2025-03-17  1699  		 * Re-schedule the work for the read registers timeout
e227d6e5b38646 Marius Cristea 2025-03-17  1700  		 * (to prevent chip regs saturation)
e227d6e5b38646 Marius Cristea 2025-03-17  1701  		 */
e227d6e5b38646 Marius Cristea 2025-03-17  1702  		cancel_delayed_work_sync(&info->work_chip_rfsh);
e227d6e5b38646 Marius Cristea 2025-03-17  1703  		schedule_delayed_work(&info->work_chip_rfsh,
e227d6e5b38646 Marius Cristea 2025-03-17  1704  				      msecs_to_jiffies(PAC1944_MAX_RFSH_LIMIT_MS));
e227d6e5b38646 Marius Cristea 2025-03-17  1705  	}
e227d6e5b38646 Marius Cristea 2025-03-17  1706  
e227d6e5b38646 Marius Cristea 2025-03-17 @1707  	return ret;
e227d6e5b38646 Marius Cristea 2025-03-17  1708  }
e227d6e5b38646 Marius Cristea 2025-03-17  1709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
