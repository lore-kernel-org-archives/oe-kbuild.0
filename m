Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997525B305
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540545; cv=none; b=SETKAKFCck+f7TrrXCZhECo+1qpthNit1DRR86LRBjw3rtmdnMOTqGdxlxmryw1UL/d1o+chCzTHn0ZQMG0GXa5/Grmkl1KdYnT0n3a6+2ffzaoKKhkmJiIXnYDseUFiMxS/usY3z1ZFURQnXbZnUEYHaHUpfwBK+f8uIgrpkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540545; c=relaxed/simple;
	bh=xsLFGIPjKtqlnhW6wtCxF9vd86HTweIFArppCYZ0KJ4=;
	h=Date:From:To:Subject:Message-ID; b=a9BgRwbaD+uQ7YVoOEBXUSYMuhDLVWmvEN8r9wS8UcywVRZ+Af1039npVjnBty33hexy8L/kHBqp08SqPeJyKyIvpxlKQvsREXyR1BLwcYZ/t1hCbkbyVL2J3iIehrUmtt6UhHKEDgv6QDqaOA0xhHNabzWlVQdAbpru0Y8kq6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmPXDwRh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmPXDwRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540545; x=1803076545;
  h=date:from:to:subject:message-id;
  bh=xsLFGIPjKtqlnhW6wtCxF9vd86HTweIFArppCYZ0KJ4=;
  b=BmPXDwRhW60++M/mNY+oh/wZYrzlDWrWOca6oGAZMal/JAx3jcu2KsuC
   oaeOHyLyXTefN9lJXrXxYH3EDTn2J68IyaAFJ5jcwMt+4xNRGMrDoSvN4
   lO68z9bQGt40RxpbaCaaAV9r8gXEs6yLX9/AiS97+wvmicA8ufbt8A0VJ
   hRFrumfdT/h/GAcoaYuYYRVAxbPtrZJn1aKeOwBQ/cLuSTnvZCqrTqNXZ
   uXkoGQfjtJexr/w6UgQJLltXg53ySov4c6csiZEfCwAi+0SrgPwvPnIbM
   Sj0ZlVI4sr6UP2DZSaLIS57ZuO2ZBtSMPGD74r+MWPELjHJ1xtva8Cpax
   g==;
X-CSE-ConnectionGUID: 103kI1bvRByh5O9yzqzA3w==
X-CSE-MsgGUID: UcIGz+kkQd6WedI7tqpUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="98103740"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="98103740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:35:44 -0800
X-CSE-ConnectionGUID: ZzHpRhV2QU2b2+HmrP8fOg==
X-CSE-MsgGUID: +Xxj9RuNQLuPsant0fdauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213286999"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2026 14:35:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCcX-0000000044L-2foi
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:35:41 +0000
Date: Thu, 19 Feb 2026 23:34:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jfern:nova/mm 6/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202602192318.R8Xr2q2u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   d44aeb89db2e47449220a4721f5e89202bd7b128
commit: 6e05d1c7b5efa36e6e1c8581e1645c00eb6ab0f9 [6/31] rust: gpu: Add GPU buddy allocator bindings
:::::: branch date: 38 minutes ago
:::::: commit date: 38 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192318.R8Xr2q2u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#595: FILE: rust/kernel/gpu/buddy.rs:495:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#599: FILE: rust/kernel/gpu/buddy.rs:499:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
