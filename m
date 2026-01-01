Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11A239E75
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767291168; cv=none; b=tpeWBuS277fI8kPuw4LginnXKm0KVqUFKYy/hdHOTokSS5PqMuTEIFB+vPC/BbC4fq6YHao1H3BHnyGrlH+jQkr8c89HoOmq/QJNWBlBSRy4G3++OaWEb+eOTXQibq6FBkVoui5y7Y9EGAassZBaZdLiSGkjQZNYWwxXxm0uOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767291168; c=relaxed/simple;
	bh=BbQKbiaWtHAJ+ZHTuQ7pzdJSilE+DHYzXFBZ81vWtqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EPvV13VdZwq4yN992f4EjftB7vgibr5X7HCK1HUeFD+E7ITZzgoJF9rio3RKGZexyi3ESMcQyRsLAwLRl32qiqolG1jS8yc5YBmvWGlSx8d0jzjYVs2b70d/PHUMBGffp5EAg4f78eZPuKKn9GaDUYJL12s/egh9j3UP8GfMygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXUt+sol; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXUt+sol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767291165; x=1798827165;
  h=date:from:to:cc:subject:message-id;
  bh=BbQKbiaWtHAJ+ZHTuQ7pzdJSilE+DHYzXFBZ81vWtqc=;
  b=lXUt+solmPUDD8SQECU7QVD1SGyAmR7nqUyO6xmxihSRzukXZG08RqbT
   dEXXd0ABRIFH+ZH4kRa2ByespSaPUDZyIl5/P/HcscZGj5epuNH15xWXF
   FKv6rHj2XqqjnjTXA6e91Qhsm63bdjbKQZDUx861+OsaQkDtbwCrdz4dh
   XvBt+miByii9ZuFOPqyTH2kmRAcvMlRgLgcMpGIHzeGnQWuzxD2i5qykO
   Zmx5U6xDNLyseabx3TBHhdh9UwzUz6Iz7gaQ9Bv8GsYG+LUNhzduNK8tr
   M7qRRgE/zyM/VW5YHo2uKFI6KczdbAXv3bFf7fZJbHXkjkuUB9QZi/kOt
   A==;
X-CSE-ConnectionGUID: 9+s7geyDSuO3cAopqe1FwA==
X-CSE-MsgGUID: PJTK47a4Rg2Z84yza8Q2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67828662"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67828662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 10:12:45 -0800
X-CSE-ConnectionGUID: q6y0zfsFT5ub1o3uVsKSwQ==
X-CSE-MsgGUID: NSmM7/VgQ3CTocN6XNOeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="206724497"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jan 2026 10:12:44 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbNAA-000000001yr-0Wqj;
	Thu, 01 Jan 2026 18:12:42 +0000
Date: Fri, 02 Jan 2026 02:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 14/66]
 drivers/iio/adc/ti-ads131m02.c:966:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601020246.OSSCR7Pb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/ti-ads131m02.c:966:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Jander <david@protonic.nl>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   fb2f4eb29a258145b0336601f00509cab6e93e7c
commit: 4aa91223fd6c9b9e6c73f9dc6ffb55cbf04df4ac [14/66] iio: adc: Add TI ADS131M0x ADC driver
:::::: branch date: 25 hours ago
:::::: commit date: 11 days ago
config: openrisc-randconfig-r133-20260101 (https://download.01.org/0day-ci/archive/20260102/202601020246.OSSCR7Pb-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020246.OSSCR7Pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601020246.OSSCR7Pb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ti-ads131m02.c:966:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads131m02.c:966:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads131m02.c:967:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads131m02.c:967:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads131m02.c:968:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads131m02.c:968:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +966 drivers/iio/adc/ti-ads131m02.c

4aa91223fd6c9b David Jander 2025-11-18  965  
4aa91223fd6c9b David Jander 2025-11-18 @966  MODULE_AUTHOR("David Jander <david@protonic.nl>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
