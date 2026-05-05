Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761436C5BB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008086; cv=none; b=lm49hy1HQzMTVsP6n5E1KR0QpLAWbExHQ6fVyD34wlM71NrCRAxq3vgxNDT47URDRnB62nMBuoeUXtRbQZZMcIulgOt4/8+thE/zPbjDBIhKYULnJ7G8ha5YXHkWQ9XAWXv8JXIfoWeQIBB/Fhglvjuh/jQWXpmT6Yx9tZNGIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008086; c=relaxed/simple;
	bh=V6Qotm2ixmbUPYZnRK4hcwBhjDYIkLeydPZVQGAon78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8gVN2tuA8m99djkL5g6s9pKSw4pCKKN4H4moGOSEWfw+uqSDa18+KBHrhcwT0VpTwDZa+5lgyf4g9p4xEl5iPmcAviGRAxqPu/dqx6E0mRVGI1FWjyiQEdY3jQ0cMGe4G+yDmKegdOpZ0f8RD6x1MowU3GR/om+DCLZiAa1PyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY9iFVgR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY9iFVgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778008084; x=1809544084;
  h=date:from:to:cc:subject:message-id;
  bh=V6Qotm2ixmbUPYZnRK4hcwBhjDYIkLeydPZVQGAon78=;
  b=NY9iFVgRsoOHcylD3A4ohz5cdi1frjWso5fFE36l7HSJNzqfw1v4F33r
   /CcDj24HTRcxmmXNsPfl9fKGl5sFBFBdK9M43wYNE5AP6acP3qUQuCI03
   VRWzN5JlPJdzJ5polI5TSPMMZIiJG6I25Kkz+VrBvoHbXe3Ag+uhMTJaD
   yVoM/VcMX3VENCdBS5Q3YaunIVfUlHSRl0M6py7GTtaoq++2SmI+Ga9gv
   ZS/P3ku/9PsMnxTaLc7L8KSbEPSdRONuyaQCkbOiIise1cbkwoJlU9akA
   NDRkNSjaXlOaEuU3vWGU3LhTzEZDmpEKBu+STOL/BL8h+ZiRS9HeYoqAV
   g==;
X-CSE-ConnectionGUID: JC2tPnsvQa22nmt6iK/Pcg==
X-CSE-MsgGUID: X0K3iJrVTWalPS8BBHEEZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96458569"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96458569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:08:03 -0700
X-CSE-ConnectionGUID: FJ/sR3MwQq29ZAINa/2jtQ==
X-CSE-MsgGUID: bdc9ZtQ6R/6ZxdTELMyzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="274033471"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2026 12:08:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKL7g-000000006IX-3FlS;
	Tue, 05 May 2026 19:08:00 +0000
Date: Tue, 05 May 2026 21:07:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:block-thread-safety 18/27] Error:
 drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
Message-ID: <202605052137.UK6cW2DX-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux block-thread-safety
head:   10259f322f6fbd9089c9e695daed50e886455b9c
commit: a7ef3bd0a35d3e0476cf41e21c11614fd8bda149 [18/27] loop: Add lock context annotations
:::::: branch date: 5 hours ago
:::::: commit date: 7 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260505/202605052137.UK6cW2DX-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605052137.UK6cW2DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605052137.UK6cW2DX-lkp@intel.com/

Note: the bvanassche/block-thread-safety HEAD 10259f322f6fbd9089c9e695daed50e886455b9c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 164:
   	'static int loop_global_lock_killable(struct loop_device *lo, bool global)         __cond_acquires(0, &lo->lo_mutex)         __context_unsafe(conditional locking on @global)'
   Error: drivers/block/loop.c: CMatch: Unexpected token '@' on pos 152:
   	'static void loop_global_unlock(struct loop_device *lo, bool global)         __releases(&lo->lo_mutex)         __context_unsafe(conditional unlocking on @global)'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
