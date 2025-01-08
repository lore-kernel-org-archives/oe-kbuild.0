Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B359113B797
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736312989; cv=none; b=PO5/RolW5HD7HKTeH17NGBJBn59cmfJBmkxiNdiMHBt4UuoDawQZt4nWOXuqpMdNjdK345O29joFtN+bUcQ0ZnutbQTJTiU2l/7wokqi6Uh++08r/S0q7YnQJGsKI3Zv/Xe2CgnWCs1FupVmziayeza+kFV6SptFGhfM7J+g0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736312989; c=relaxed/simple;
	bh=XxEvDsS6zVOwUQXst7/ndLTamxH8i6jl005xc5TEnpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOk3b/cFMgZC1DRE1XRHM4Azkrs2X0nzTYs/OOPxXsAwks9PAU6IoAfTyCfQDWCZrLqCvthGdXwA1wWku/Cn0OgiQ0NfbqNEujFL36QmoK3exJvryk1dVH3JEeAmENIoj0PRRa5daQ1isQxILG0mruI9TzO6SA/drGJyzXhQRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqJ+6COF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqJ+6COF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736312988; x=1767848988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxEvDsS6zVOwUQXst7/ndLTamxH8i6jl005xc5TEnpI=;
  b=cqJ+6COFc+W98M/k71sdXOceH7IqWdvLjbw42wETT9EOeeuPC6kDJTak
   poBi8Bpr9UGmJcxlcweoJQxMOMLojWk7ui+rYtiohvMkb4i8MnmdZ8PN2
   OoZG5g/Ko/v/OCTbbzdSBcvZyczkn4dnhr0Ph2Gf1C57VKtEjUl8D4yc6
   gUSfF+gzMW2indNR7V/Z6KtdfMa5IrZl8LXH7vY6OQ/hWwVYObevSqPu5
   dCv37LqKDbaiDt4PYEmOoY878pjkWFwpM0aberz841/MaRh8oB79ewA3x
   k6AMNkkL+YVbpzrgkkrHyX/y3ZQQi0u2dWmGZflBi1bocrDD9Q9hOFmEM
   A==;
X-CSE-ConnectionGUID: vogunJxQRIu4Ug3n/VkNiA==
X-CSE-MsgGUID: 7Wm3+8MmQ2y8MbNPWBuJyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40469232"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="40469232"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 21:09:47 -0800
X-CSE-ConnectionGUID: yavmKf8tQXidZo+9RqHcaA==
X-CSE-MsgGUID: t8I+pvSmRPy5+ofAlkj2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103198381"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 21:09:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVOK8-000Fe5-0s;
	Wed, 08 Jan 2025 05:09:44 +0000
Date: Wed, 8 Jan 2025 13:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [staging:staging-linus 11/11] (.text+0x4e8): multiple definition of
 `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first
 defined here
Message-ID: <202501081239.BAPhfAHJ-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20250108/202501081239.BAPhfAHJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081239.BAPhfAHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081239.BAPhfAHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/staging/gpib/tnt4882/mite.o: in function `mite_dma_disarm':
>> (.text+0x4e8): multiple definition of `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
