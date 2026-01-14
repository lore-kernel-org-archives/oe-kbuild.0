Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81A31B833
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413190; cv=none; b=almpfv2qJdbrIK+TX4eJkM2MxVtrT7V5mkDp1FtPW3rDa9+RLXSTQH+YyVT7Abs0jC5OrixOWukGNmwBF3oiMWMt0++iBQ9mNSh+qi7ptv7waUHFL2xMNzB1AKko3vOh3jk3LE2oygNgfroh+qtORX9rrrA34wBNEpnpWtPoC4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413190; c=relaxed/simple;
	bh=RcS880kFPO7SMYLd1jTi+tLiR2bLzBGeUO3k1cULMH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlpiweuvaY4fNfK7fzvaTAasjSvGDnyCZjQ8HbWPqfAoxz23xkL0TASmRhNzWe4HgfI7Ts3TsWF3vjvy85tqoEyn5lEEL7F2cQyCNYS8OkMMSDAsgsTffqaKOZ5zY6+BT11aWQQMUrWBBeac1oJbTU0J6g06SW2uRbNNFAVHhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PB4FlLyD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PB4FlLyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768413189; x=1799949189;
  h=date:from:to:cc:subject:message-id;
  bh=RcS880kFPO7SMYLd1jTi+tLiR2bLzBGeUO3k1cULMH8=;
  b=PB4FlLyDzkY880D2BKqnP4INYNUXfz9PEiEUxBHEJVUZrwaqWJn7RA2f
   EYpBSRnWH5BWDo5CJ2VVE+7oVZafsGdo+GEAhPePEmB2DZG/M36AVoaVb
   tMYiFV2I34K4Phcmwqycxf2XBg/TIgYym66DdaLgRJtlTSBPshuOARJjq
   +OVjjU3w/ZUOgUI25kP8KsVI0dFy95SvzsvzQk2tWamCEg7myjhGdRiQ1
   Mt9bYFlyo/zkvX35psL9LAt1wtY1caoXGTKhtC17ERORIR/Dwpjx2+ShN
   LKp9fWM+d57JVC5biSZY4dXHOie02O77jECGRIeKdGG3HpE9EgBnucbkw
   w==;
X-CSE-ConnectionGUID: lQyeXBY6ShqvZac1H9Za7g==
X-CSE-MsgGUID: PUX0VB6KSe2xiVn62AMcIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69695545"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69695545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 09:53:08 -0800
X-CSE-ConnectionGUID: phZgyZ4yT12FGqwit6jcCw==
X-CSE-MsgGUID: j5ciV+BDRlWWIIFwxGA1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="203952368"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 09:53:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg53J-00000000Glg-1O6v;
	Wed, 14 Jan 2026 17:53:05 +0000
Date: Thu, 15 Jan 2026 01:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4387/6121]
 drivers/spi/spi-axiado.c:1005:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601150122.HlgmF95K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spi-axiado.c:1005:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vladimir Moravcevic <vmoravcevic@axiado.com>
CC: Mark Brown <broonie@kernel.org>
CC: Prasad Bolisetty <pbolisetty@axiado.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: e75a6b00ad7962a7ed1c9c777e9ab1eb29043ec8 [4387/6121] spi: axiado: Add driver for Axiado SPI DB controller
:::::: branch date: 13 hours ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r123-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150122.HlgmF95K-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150122.HlgmF95K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601150122.HlgmF95K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-axiado.c:1005:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-axiado.c:1005:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/spi/spi-axiado.c:1006:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-axiado.c:1006:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/spi/spi-axiado.c:1007:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-axiado.c:1007:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/spi/spi-axiado.c:1007:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-axiado.c:1007:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/spi/spi-axiado.c: note: in included file (through arch/alpha/include/asm/core_titan.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/io_trivial.h:76:9: sparse: sparse: undefined identifier '__kernel_stb'

vim +1005 drivers/spi/spi-axiado.c

e75a6b00ad7962 Vladimir Moravcevic 2026-01-07  1004  
e75a6b00ad7962 Vladimir Moravcevic 2026-01-07 @1005  MODULE_AUTHOR("Axiado Corporation");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
