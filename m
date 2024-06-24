Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB01BC2A
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jun 2024 20:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719261929; cv=none; b=l8giVs2r3GbHWQKDfaSQyQYmwPoDIGhIguXooPLUt/6JKtW+0xczb/qwwdQ574IzKSLIoYDRyhtWKQhGOQPnB3Rk1O9ID4SSI6ZMuBd5vJhbPXscBn14f4wJQJ/Hlwk3XbiyAZzddSl7L7B9ZpplcSARYPt6K4LJxFGgXykaOII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719261929; c=relaxed/simple;
	bh=Te9Z6kcipRSr+cqKTQyAvJRvmGc1fQVnzcjQQRz/xo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHM8GDQCKmoYgp3shbuxx9bj0QiKY9cQNt8vsxiKC05AS6mdOoxt3p8fh96XC7rOo3MGAyCbll5CU3Z358iEZAUALe+WEEhiEayMb4J1WftGatCuqVbdLSQXYa2xtBBQEUx2yRi/+e/8xez4WQGD3fOIfouOSI5NVfMuuVMPIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCNr+VW5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCNr+VW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719261927; x=1750797927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Te9Z6kcipRSr+cqKTQyAvJRvmGc1fQVnzcjQQRz/xo0=;
  b=lCNr+VW54pymLTSzIajWsLUByi4Lvxy6jYKakMO1E6cTxj+VHDwyZsoe
   hnpRfqGxYS65OlrCJ0plVzHTbQxP7J81WyNFdlq3AMpK9qt34yhLxfF5G
   7g6/psSPHAbmyk+UIPTC7tUf1UME6Lmqv2Emm3IdvXnZmuryAiXrWvrI0
   6mQQvvGJiQYbyQPZX+Xnv5B2WSHSLZ600hQljleIpmNY9DPWPLIEJz1db
   YjEUxzD/TDknNGFK+rHcXsb0VJTwDUnVkxV8LTwhyFWnlaYArTtmH+F52
   a62sULyqqhDCZTtKW+cM7ebsvftnllqa/8T8fShBc+eyD/BL4i+7fKiiX
   w==;
X-CSE-ConnectionGUID: wTk/2kNzSHmZ0opa+zfMZg==
X-CSE-MsgGUID: qPkfZ/ObTUyk2aw/fWDNvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33794125"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="33794125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 13:45:27 -0700
X-CSE-ConnectionGUID: mj2iUPdPTjKBhRHfz37jhA==
X-CSE-MsgGUID: L0HgYtVaTW++p5Z9l7p81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43492147"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2024 13:45:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLqZ1-000Dic-2c;
	Mon, 24 Jun 2024 20:45:23 +0000
Date: Tue, 25 Jun 2024 04:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/cpu/resctrl/monitor.c:404
 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented
Message-ID: <202406250440.Y22jIztK-lkp@intel.com>
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
CC: Shaopeng Tan <tan.shaopeng@fujitsu.com>
CC: Reinette Chatre <reinette.chatre@intel.com>
CC: Babu Moger <babu.moger@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55027e689933ba2e64f3d245fb1ff185b3e7fc81
commit: 6eac36bb9eb0349c983313c71692c19d50b56878 x86/resctrl: Allocate the cleanest CLOSID by searching closid_num_dirty_rmid
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250440.Y22jIztK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406250440.Y22jIztK-lkp@intel.com/

smatch warnings:
arch/x86/kernel/cpu/resctrl/monitor.c:404 resctrl_find_cleanest_closid() warn: iterator 'i' not incremented

vim +/i +404 arch/x86/kernel/cpu/resctrl/monitor.c

c4c0376eefe185 James Morse 2024-02-13  388  
6eac36bb9eb034 James Morse 2024-02-13  389  /**
6eac36bb9eb034 James Morse 2024-02-13  390   * resctrl_find_cleanest_closid() - Find a CLOSID where all the associated
6eac36bb9eb034 James Morse 2024-02-13  391   *                                  RMID are clean, or the CLOSID that has
6eac36bb9eb034 James Morse 2024-02-13  392   *                                  the most clean RMID.
6eac36bb9eb034 James Morse 2024-02-13  393   *
6eac36bb9eb034 James Morse 2024-02-13  394   * MPAM's equivalent of RMID are per-CLOSID, meaning a freshly allocated CLOSID
6eac36bb9eb034 James Morse 2024-02-13  395   * may not be able to allocate clean RMID. To avoid this the allocator will
6eac36bb9eb034 James Morse 2024-02-13  396   * choose the CLOSID with the most clean RMID.
6eac36bb9eb034 James Morse 2024-02-13  397   *
6eac36bb9eb034 James Morse 2024-02-13  398   * When the CLOSID and RMID are independent numbers, the first free CLOSID will
6eac36bb9eb034 James Morse 2024-02-13  399   * be returned.
6eac36bb9eb034 James Morse 2024-02-13  400   */
6eac36bb9eb034 James Morse 2024-02-13  401  int resctrl_find_cleanest_closid(void)
6eac36bb9eb034 James Morse 2024-02-13  402  {
6eac36bb9eb034 James Morse 2024-02-13  403  	u32 cleanest_closid = ~0;
6eac36bb9eb034 James Morse 2024-02-13 @404  	int i = 0;
6eac36bb9eb034 James Morse 2024-02-13  405  
6eac36bb9eb034 James Morse 2024-02-13  406  	lockdep_assert_held(&rdtgroup_mutex);
6eac36bb9eb034 James Morse 2024-02-13  407  
6eac36bb9eb034 James Morse 2024-02-13  408  	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
6eac36bb9eb034 James Morse 2024-02-13  409  		return -EIO;
6eac36bb9eb034 James Morse 2024-02-13  410  
6eac36bb9eb034 James Morse 2024-02-13  411  	for (i = 0; i < closids_supported(); i++) {
6eac36bb9eb034 James Morse 2024-02-13  412  		int num_dirty;
6eac36bb9eb034 James Morse 2024-02-13  413  
6eac36bb9eb034 James Morse 2024-02-13  414  		if (closid_allocated(i))
6eac36bb9eb034 James Morse 2024-02-13  415  			continue;
6eac36bb9eb034 James Morse 2024-02-13  416  
6eac36bb9eb034 James Morse 2024-02-13  417  		num_dirty = closid_num_dirty_rmid[i];
6eac36bb9eb034 James Morse 2024-02-13  418  		if (num_dirty == 0)
6eac36bb9eb034 James Morse 2024-02-13  419  			return i;
6eac36bb9eb034 James Morse 2024-02-13  420  
6eac36bb9eb034 James Morse 2024-02-13  421  		if (cleanest_closid == ~0)
6eac36bb9eb034 James Morse 2024-02-13  422  			cleanest_closid = i;
6eac36bb9eb034 James Morse 2024-02-13  423  
6eac36bb9eb034 James Morse 2024-02-13  424  		if (num_dirty < closid_num_dirty_rmid[cleanest_closid])
6eac36bb9eb034 James Morse 2024-02-13  425  			cleanest_closid = i;
6eac36bb9eb034 James Morse 2024-02-13  426  	}
6eac36bb9eb034 James Morse 2024-02-13  427  
6eac36bb9eb034 James Morse 2024-02-13  428  	if (cleanest_closid == ~0)
6eac36bb9eb034 James Morse 2024-02-13  429  		return -ENOSPC;
6eac36bb9eb034 James Morse 2024-02-13  430  
6eac36bb9eb034 James Morse 2024-02-13  431  	return cleanest_closid;
6eac36bb9eb034 James Morse 2024-02-13  432  }
6eac36bb9eb034 James Morse 2024-02-13  433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
