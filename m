Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA02F1FE2
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456084; cv=none; b=iAE0dbgB2sleRiIHlz4v8zGBxFsl97oUke7TOp9PKT7wckh7TTV/ZvPNpe7zfMk7pvRSJ9AjJNGLB/DgydCMQi/MQNXEDo2NaxSlfhB55qCyivCAhTqmYmbzoIwMPbuP37M9BX+dHZRND5qocPxr1q2Nv5X2TMDh2PEzzQGrxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456084; c=relaxed/simple;
	bh=4OHcjX6cNKTgxg5RVXGG2uMGyqC4HxLjxI+rDM1MU6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siEvZEerg+ZgMJW5VRyMSJYm91wBBIp9akUA80oI/57TNRiM+uAzhHLglPulWsrVYjSXlDBLL/3LQSfPm1FiH5UW22ADZ9l2mXkat1rGqYrhGe7QhtHNmUjCx4OQbvYHCjUUlzURihj3GIG0EZmVHSvT1sjYWElGkcJB/SEBkxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7tF2sQ4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7tF2sQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765456082; x=1796992082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OHcjX6cNKTgxg5RVXGG2uMGyqC4HxLjxI+rDM1MU6A=;
  b=j7tF2sQ4zuzCBoKytkzbgQzASjKOZ4pTPP/ZgRFZ4YcyoK9cd+yK7nHe
   WmQlhwZw5VYTnCWQX2QjNQcGypOYo/YPv/MHIxM21dFIm1CTqWvfAC+0y
   EiAzbz7Y4OmxEaOjC06Qh6kwf0x9GC8E6Tgf0ZQ48gNzYqa0RpuOiXOsU
   N2JDHzOOgIEtZe5yF4Q/EJcMAK8zDl2KikXxYBiSMQsZMSqnD3OxXm2FH
   n1t3qJCXoctPGhxewdAYQO08atuArYmKW9tRGjgTmSx/b3PfkxPdBqzmG
   un8OVbNYhtOR782sCfkosr+gmhkpuSel76pfTHkhw0JY3ohtWS4b/PJDM
   Q==;
X-CSE-ConnectionGUID: 4aODKRXqSrWFesNqa3e5Ug==
X-CSE-MsgGUID: 74q6ej0tSXqwVbtwQ1wLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67509361"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="67509361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:28:01 -0800
X-CSE-ConnectionGUID: wE3oZCUNSOeucP14WLdvUA==
X-CSE-MsgGUID: HorGubxwRkKGiFIoaI2llQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="196557473"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 04:27:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfm1-000000004dN-1XrE;
	Thu, 11 Dec 2025 12:27:57 +0000
Date: Thu, 11 Dec 2025 20:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/resctrl/monitor.c:239 resctrl_find_cleanest_closid() warn:
 iterator 'i' not incremented
Message-ID: <202512112050.p1aeMdM7-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: James Morse <james.morse@arm.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Reinette Chatre <reinette.chatre@intel.com>
CC: Fenghua Yu <fenghuay@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 7168ae330e8105296210b2b2d31d791d5c073345 x86,fs/resctrl: Move the resctrl filesystem code to live in /fs/resctrl
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112050.p1aeMdM7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512112050.p1aeMdM7-lkp@intel.com/

smatch warnings:
fs/resctrl/monitor.c:239 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented

vim +/i +239 fs/resctrl/monitor.c

7168ae330e8105 James Morse 2025-05-15  223  
7168ae330e8105 James Morse 2025-05-15  224  /**
7168ae330e8105 James Morse 2025-05-15  225   * resctrl_find_cleanest_closid() - Find a CLOSID where all the associated
7168ae330e8105 James Morse 2025-05-15  226   *                                  RMID are clean, or the CLOSID that has
7168ae330e8105 James Morse 2025-05-15  227   *                                  the most clean RMID.
7168ae330e8105 James Morse 2025-05-15  228   *
7168ae330e8105 James Morse 2025-05-15  229   * MPAM's equivalent of RMID are per-CLOSID, meaning a freshly allocated CLOSID
7168ae330e8105 James Morse 2025-05-15  230   * may not be able to allocate clean RMID. To avoid this the allocator will
7168ae330e8105 James Morse 2025-05-15  231   * choose the CLOSID with the most clean RMID.
7168ae330e8105 James Morse 2025-05-15  232   *
7168ae330e8105 James Morse 2025-05-15  233   * When the CLOSID and RMID are independent numbers, the first free CLOSID will
7168ae330e8105 James Morse 2025-05-15  234   * be returned.
7168ae330e8105 James Morse 2025-05-15  235   */
7168ae330e8105 James Morse 2025-05-15  236  int resctrl_find_cleanest_closid(void)
7168ae330e8105 James Morse 2025-05-15  237  {
7168ae330e8105 James Morse 2025-05-15  238  	u32 cleanest_closid = ~0;
7168ae330e8105 James Morse 2025-05-15 @239  	int i = 0;
7168ae330e8105 James Morse 2025-05-15  240  
7168ae330e8105 James Morse 2025-05-15  241  	lockdep_assert_held(&rdtgroup_mutex);
7168ae330e8105 James Morse 2025-05-15  242  
7168ae330e8105 James Morse 2025-05-15  243  	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
7168ae330e8105 James Morse 2025-05-15  244  		return -EIO;
7168ae330e8105 James Morse 2025-05-15  245  
7168ae330e8105 James Morse 2025-05-15  246  	for (i = 0; i < closids_supported(); i++) {
7168ae330e8105 James Morse 2025-05-15  247  		int num_dirty;
7168ae330e8105 James Morse 2025-05-15  248  
7168ae330e8105 James Morse 2025-05-15  249  		if (closid_allocated(i))
7168ae330e8105 James Morse 2025-05-15  250  			continue;
7168ae330e8105 James Morse 2025-05-15  251  
7168ae330e8105 James Morse 2025-05-15  252  		num_dirty = closid_num_dirty_rmid[i];
7168ae330e8105 James Morse 2025-05-15  253  		if (num_dirty == 0)
7168ae330e8105 James Morse 2025-05-15  254  			return i;
7168ae330e8105 James Morse 2025-05-15  255  
7168ae330e8105 James Morse 2025-05-15  256  		if (cleanest_closid == ~0)
7168ae330e8105 James Morse 2025-05-15  257  			cleanest_closid = i;
7168ae330e8105 James Morse 2025-05-15  258  
7168ae330e8105 James Morse 2025-05-15  259  		if (num_dirty < closid_num_dirty_rmid[cleanest_closid])
7168ae330e8105 James Morse 2025-05-15  260  			cleanest_closid = i;
7168ae330e8105 James Morse 2025-05-15  261  	}
7168ae330e8105 James Morse 2025-05-15  262  
7168ae330e8105 James Morse 2025-05-15  263  	if (cleanest_closid == ~0)
7168ae330e8105 James Morse 2025-05-15  264  		return -ENOSPC;
7168ae330e8105 James Morse 2025-05-15  265  
7168ae330e8105 James Morse 2025-05-15  266  	return cleanest_closid;
7168ae330e8105 James Morse 2025-05-15  267  }
7168ae330e8105 James Morse 2025-05-15  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
