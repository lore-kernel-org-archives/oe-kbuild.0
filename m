Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C026E173
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765652178; cv=none; b=dU0T4XWdKZlHVIgoJBd8qAqhI6qz9USCIRIpQh2Jm49VVlwx+Z4gE2VMfGJ1n08K/D0M5iUQ0f44C8lUISA3EkH/qCoi6LAdVgHdLvtE0fbK6WOIocwefUg9lBOZm46/ujykH+KA1wdAF4kc59RcFZIz1gVc/UH7x6bMMxBkjLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765652178; c=relaxed/simple;
	bh=A+CIm1uHhpXlTB+Phn6AHvZjaSRHhdg1Up8013kft84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kv7RL9UwFeEHfpDCIneDMM5ouC53cbimJlhFAbGTxoERjvrUgFQUG9ULNjgOcxWz/NJFzX8ns63I9YemNtQjO490zjxUYCkoIWNfw9R59wV5BYaeiJUtcaz6B9DwmSO3bLrnm+v9epkMHNZo7MxPYEyayu8p98WE0vu5MJV264Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfURo4pS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfURo4pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765652176; x=1797188176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+CIm1uHhpXlTB+Phn6AHvZjaSRHhdg1Up8013kft84=;
  b=bfURo4pSecGtMKf2cEpnNe44fLNi/OlpnjA8e0EhZfVrnYzG/Tamiuie
   Jq4q+PPg5avdhlYfc/J6Rvk1WoJc1GG98Q927RImLNl+vE0gXw97w/uEA
   zX1FiVE3jBjIMlChbk8wwCKwRvdgRt2+jOxspNq1d1NVR2UPjBmwLfGpZ
   GL9IHLE4KKmUI/aRsXs1Jwost6aA4v6LWQvLL7w/7VPIhvgGcCoMgBvJ2
   bV++QIWOXYgyqNWlsNLMsjUWOsXJ6/28eFBApFodImdczJiOexzyTJ+Sx
   3g0KJ2ozLofrn+1PaoNtHOxYgIDZbVH5IW4q7R3xnViKW+CeW7kJ4dRxt
   A==;
X-CSE-ConnectionGUID: dBQDoMK9RMyeUDkcBQ6elg==
X-CSE-MsgGUID: RH/iQh5mQi+O3Szci4wrDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78258958"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78258958"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:56:13 -0800
X-CSE-ConnectionGUID: jfhCrV0+QkKxt+9p5QPeiA==
X-CSE-MsgGUID: h/bZWeL9TOyh4IQdP+uvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197856445"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 10:56:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUmo-0000000085J-3HMs;
	Sat, 13 Dec 2025 18:56:10 +0000
Date: Sun, 14 Dec 2025 02:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 6/15] drivers/gpio/gpio-litex.c:438:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512140227.i39RPJ25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-litex.c:438:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Robert Winkler <rwinkler@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Marek Czerski <m.czerski@ap-tech.pl>
CC: Stafford Horne <shorne@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: a660177ff3fbae37ae7f2537ff1605956d930e7d [6/15] LiteX: driver for LiteGPIO interface
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140227.i39RPJ25-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140227.i39RPJ25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140227.i39RPJ25-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-litex.c:438:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-litex.c:438:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-litex.c:439:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-litex.c:439:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-litex.c:440:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-litex.c:440:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +438 drivers/gpio/gpio-litex.c

a660177ff3fbae3 Robert Winkler 2020-12-22  437  
a660177ff3fbae3 Robert Winkler 2020-12-22 @438  MODULE_DESCRIPTION("LiteX gpio driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
