Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF551E9B3D
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541535; cv=none; b=P0D+j+HWNedDzTA4veMv7YtlzKgL47O2wkfEgKOVrZELr9uqzsdwsPt8155tcZt+g1W92jNJCEOVaCasXvV4EI/eVBjgJGR23SYyFg2DEgMWrtXFtFBCFus9FqxXxjBhcCHENkZrYBldZHxk1XYFxJb767ZU/rOZL2PA4OraqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541535; c=relaxed/simple;
	bh=IgK9084NGAv4h9/8W/PrClL6cUAYWqSbnxp4NiHxjA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YZGmYoVawMovNIYuiq8J37lRadiv60OP+GSz0gBdbaf5BwUkR8FNWAxY19qn2PWvFDY/Ql/DQXfG0yBtkmp/PVSrIf/ETVqzfmbn4clwIhHQsaluRQzKLyeCXTaWu4vTL9fiLhQP2VX/3I9vCgitA5fTnbw5ngam4nUmuGzNFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fveveLOx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fveveLOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769541533; x=1801077533;
  h=date:from:to:cc:subject:message-id;
  bh=IgK9084NGAv4h9/8W/PrClL6cUAYWqSbnxp4NiHxjA0=;
  b=fveveLOxIOhqvZxtbtaJN1zccUBEzUs5o77RReXXAHtGPDtBQHiLUkOl
   /Ors5zcjrIkz8YCrph9pFbKEdmx2mF3d+jFyC39dqZjhIbXEx8B0Me6n6
   IbQ8+9w0ZJGVTp2Su+5+RFVSuJdgbgD/YG7FqvskgIPJ+4NISf3u1CjVC
   9vQ9jLUcomXPq43cNb4yRGpEeUd/LvEqYwqN8rMA5otLB7EixSo8ilLY6
   b2fTE18BvFXlbiEsOoWER/yycmF6i7bnYHZ7qmpyNR/CsPQa5L4T4NTUK
   PQXeT+ioeXrw9/fKDtpLTGpOTVoOuFj/KRFTuZX81OTzBfDqcFEe5KHvk
   w==;
X-CSE-ConnectionGUID: ZiVgUBCZQp6MR1gMUtTt/A==
X-CSE-MsgGUID: 9sQGzOWrQiKGxbLEuLhmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88165060"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="88165060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:18:53 -0800
X-CSE-ConnectionGUID: m4hq2httSnqLn7r+oKqm6w==
X-CSE-MsgGUID: bBeWpu2gSWagalm+ppNwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207297629"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jan 2026 11:18:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkoaP-00000000YsS-1m6A;
	Tue, 27 Jan 2026 19:18:49 +0000
Date: Wed, 28 Jan 2026 03:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2560/9906]
 drivers/iio/adc/ad4062.c:817:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601280352.HxU02ziv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/ad4062.c:817:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jorge Marques <jorge.marques@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
commit: d5284402d28f30dbbe74b9823a324a998a8306d8 [2560/9906] iio: adc: Add support for ad4062
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r132-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280352.HxU02ziv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280352.HxU02ziv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280352.HxU02ziv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad4062.c:817:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4062.c:817:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/ad4062.c:818:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4062.c:818:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ad4062.c:819:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4062.c:819:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +817 drivers/iio/adc/ad4062.c

d5284402d28f30 Jorge Marques 2025-12-17  816  
d5284402d28f30 Jorge Marques 2025-12-17 @817  MODULE_AUTHOR("Jorge Marques <jorge.marques@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
