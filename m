Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00B14D2A0
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 05:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433683; cv=none; b=ml1XdKUY6LINJMIaFzfelD948pxBDrRGwJeVQlWnVGzjokTG7Dl3qNm2b46lVrI/i5830N/d3yjquQc8AkTd7MUoq9bt57rV2frqSudSCAUCXFzA7xg5uJlHqgXbIk/F7SWQd29ZEFY/0fozS0jNlH7ljEOaHU0q9gNBt4O4gPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433683; c=relaxed/simple;
	bh=ug9ERWAO923dBbuTmYLjTr+m1OUwoUExROZzmkN9HVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozFPG4djtc2PM/74sIoGl+SSNFQReb0kF4P8mUBbjFC8k2bJe5LSojky8hLAgP0caOWOV7TYoZVfZiigbozuzJbLpaBSmEcSs4Hj4E3wYs2GAbG+Ys60uU6yQ0v+klghzwwH1zZabeygVbg77c1X8uN9fHV+HgYg93uBfKr1j0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0i9V5NB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0i9V5NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751433682; x=1782969682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ug9ERWAO923dBbuTmYLjTr+m1OUwoUExROZzmkN9HVo=;
  b=a0i9V5NBvwY0RjQK/2aF2ANfA6a2NAy6kQUAdwiCYAzNXXV20zZyl8DJ
   cYj2BtdmMTVsVjUzXBUZT7vMAduCJy/oOv3eIn8rJSLREpt84pypEvxsy
   Dy3eQre4lINvgLUJ9bPCD17PFKvM4tkxQxKnLlOQ3TatmDdnA4B63cD0H
   clLGaKlWEZc/ydKlkjcdFS/+HL4d/tmZt/l/+uh5DkUxvpW7x8EmWQdQt
   PuY4jbeapqqJp4Zy4g7zxANfeUQad7gHCR1AA5vUKQdOX4VhoI35hLNGU
   HD48FB8JQJ2Fu+HvNi0vjPEULUtE07LTqTF01ocJ8nIyI6t2wb5eWxWNP
   A==;
X-CSE-ConnectionGUID: 5F+G7MXcSwqCto7G/0y3vg==
X-CSE-MsgGUID: ZNwyV96cSR6tgaQhIN39sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53676366"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53676366"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 22:21:21 -0700
X-CSE-ConnectionGUID: usKcKvD4RNufKqXJwHsddg==
X-CSE-MsgGUID: 5alyicdSS2K/25CJ/z/Xvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154297855"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2025 22:21:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWpuI-0000D7-0T;
	Wed, 02 Jul 2025 05:21:18 +0000
Date: Wed, 2 Jul 2025 13:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000
Message-ID: <202507021345.YPA17Mfu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66701750d5565c574af42bef0b789ce0203e3071
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250702/202507021345.YPA17Mfu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021345.YPA17Mfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507021345.YPA17Mfu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000
>> ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
