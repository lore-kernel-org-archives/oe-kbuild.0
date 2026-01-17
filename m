Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500930DED8
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 02:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616196; cv=none; b=KPs7efoWalVWzHxmdcSTT9zU0G/UPpkAXhZ3wu5L8jaBb//as2OWMraRvtUFGACD24hwEZpvtiAfJqubbg6EiHv39JLAoEBm8M3dYLYXwiYyORSNMzkkSMV5foEXMh/S1yF6rhdFtCH3lz27hfLpDc4kaU0DWX/vOe8HBRTlTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616196; c=relaxed/simple;
	bh=1yqV0/G6wAa1/i3paAW6yCZwlF3qT2cisArKZGScJFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uU7HDVJCYzhyZpBfd92HzTHLGA9qtRuEcPJF1XCMXwif6KFpusy9mr8+MQXwv/UYpVsMRN3S8UAJK9pksGxYmTdV+DlqZajc+TtGNZw0CaYE2qZYFWKEFogLUXBlFsfRCevdpBj9Psu9ZF0ATB4NIs1wLzge7Pg01W9vTczqQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxTta0M9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxTta0M9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768616194; x=1800152194;
  h=date:from:to:cc:subject:message-id;
  bh=1yqV0/G6wAa1/i3paAW6yCZwlF3qT2cisArKZGScJFs=;
  b=AxTta0M9ma8nxu4Fazi5ukD3+zuYgcXzFf2ePMzuFdC7lHgZ6nY5bPKy
   B4thuyWqvYMxct24ks45lIMWKckwb9BkfwOjhrmOWMKk4jfgsZMN2UyBJ
   VehQjiZI1TjXZMetqeoUr10fekhV3BcsQ0edt0pT2MdP8wZVgSQpwxL2V
   qEULeUgE+WUOyEo6Kzurets6+kKtyPDoTdupztfdnhXMM5LQEbimndVcA
   D3yDpN9215+bA61alT6pjBHj9dLJ1LarPO9ZgPH61pulAFVVG+CuYji/p
   0OA9OzU1gCqgP6XDaX4oKGXzWJGk8XsoHWjRwiIu2aaCWc2wmVHKoNdR5
   g==;
X-CSE-ConnectionGUID: OU2rqT1oQuicaARLukSl0A==
X-CSE-MsgGUID: quHbxMJETF2XnacVkELZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69980070"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69980070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 18:16:34 -0800
X-CSE-ConnectionGUID: MKWIjkkxRmWDZyqGzEhRWA==
X-CSE-MsgGUID: Uue+mLLgTQG/azOekp+Ftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="210257581"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 18:16:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgvrb-00000000LSv-1jWa;
	Sat, 17 Jan 2026 02:16:31 +0000
Date: Sat, 17 Jan 2026 10:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 51/99]
 drivers/iio/dac/mcp47feb02.c:1248:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601171009.3eG1ZdVv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/dac/mcp47feb02.c:1248:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ariana Lazar <ariana.lazar@microchip.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
commit: bf394cc8036989c9cc7d82ddede4c57e24912dc4 [51/99] iio: dac: adding support for Microchip MCP47FEB02
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r123-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171009.3eG1ZdVv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171009.3eG1ZdVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171009.3eG1ZdVv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/dac/mcp47feb02.c:1248:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/mcp47feb02.c:1248:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/dac/mcp47feb02.c:1249:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/mcp47feb02.c:1249:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/dac/mcp47feb02.c:1250:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/mcp47feb02.c:1250:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/dac/mcp47feb02.c:1250:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/mcp47feb02.c:1250:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1248 drivers/iio/dac/mcp47feb02.c

bf394cc8036989 Ariana Lazar 2025-12-16  1247  
bf394cc8036989 Ariana Lazar 2025-12-16 @1248  MODULE_AUTHOR("Ariana Lazar <ariana.lazar@microchip.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
