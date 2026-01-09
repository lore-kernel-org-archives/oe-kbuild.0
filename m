Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8116B1C3C08
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946350; cv=none; b=OTn+sczA7mz2aG2oXmCuklPQimKoPP4HdYgepXzIhKR0FK0DrLI7+WGXd4fMrwDhwrlOZzk+DuK3FCgjPro+toBWhg47cflzf2+ZvTxC/BIWor+YcRK8zGulVhjqsEjQ+ZuEM0lvpDsWr2jiMv33xgP7MRKDVo0JkKAD76CusqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946350; c=relaxed/simple;
	bh=VMWsFn0Obctiympb8lvr2rPeur8BfwJBo6MZPaF/tZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=USCNjgMYtv010foo+zu4fJL1c3mRIFNKMeXpm/7a82q2Izm+utq618eLjiL3h1TaP/bqyf1LP2HrtILXycl6q9782SaHPjEWW0J+M1uL0fmuOEVJ1JmTqMl222TEBPWZxWVmyOm6go8dlG1dEHj/a6lAQXB19fVIX8ncs5SJzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvJOzIQ9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvJOzIQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767946347; x=1799482347;
  h=date:from:to:cc:subject:message-id;
  bh=VMWsFn0Obctiympb8lvr2rPeur8BfwJBo6MZPaF/tZE=;
  b=QvJOzIQ9XYEeV2HyfeAn38j1UG1Zo9nEjLSpKQ7GaG26DkKP91p3ghsF
   S0tE5uCzzSbQKDIp1ABYCl8AJTqvKYG4vODL0bFYD57yF6WQilq7kvVb2
   OC1txa3SBiYJa7lAjVGP38yYYlKoXcnRst+JJAdWDVZqqfymUISNsr4hM
   E3DFpt/ip+OElh9TXO8rrjv7jaLz/BZqsVEaxGTMZ0HiJAxCvpa75pgM6
   JzVYVJ+NbM6vXWrRnM+1n6SU+Beq2ziAZOmES8HWFz2TuSnjyOX+l6SxK
   iqXiz+bG+6JnYHXa1r8YcgIoD8ZoezAHWV8ByXT48WuJKf4eLiyNic0qR
   Q==;
X-CSE-ConnectionGUID: W7Oz1aHZTOK77K13am7HMA==
X-CSE-MsgGUID: Aldj/ozqRBWWHKGiEH3a7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86914488"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="86914488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:12:26 -0800
X-CSE-ConnectionGUID: k/n0C6P6TuKhHDJR3oQ4Ew==
X-CSE-MsgGUID: fc7O64lMQROBD9W695cznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207893435"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2026 00:12:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve7bb-000000005dY-2CH6;
	Fri, 09 Jan 2026 08:12:23 +0000
Date: Fri, 09 Jan 2026 16:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/fs-writeback.c:718 cleanup_offline_cgwb() error:
 uninitialized symbol 'new_wb'.
Message-ID: <202601091632.CoQY1L7N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
commit: e1b849cfa6b61f1c866a908c9e8dd9b5aaab820b writeback: Avoid contention on wb->list_lock when switching inodes
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: hexagon-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091632.CoQY1L7N-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601091632.CoQY1L7N-lkp@intel.com/

smatch warnings:
fs/fs-writeback.c:718 cleanup_offline_cgwb() error: uninitialized symbol 'new_wb'.

vim +/new_wb +718 fs/fs-writeback.c

6654408a33e629 Jingbo Xu      2023-10-14  688  
c22d70a162d3cc Roman Gushchin 2021-06-28  689  /**
c22d70a162d3cc Roman Gushchin 2021-06-28  690   * cleanup_offline_cgwb - detach associated inodes
c22d70a162d3cc Roman Gushchin 2021-06-28  691   * @wb: target wb
c22d70a162d3cc Roman Gushchin 2021-06-28  692   *
c22d70a162d3cc Roman Gushchin 2021-06-28  693   * Switch all inodes attached to @wb to a nearest living ancestor's wb in order
c22d70a162d3cc Roman Gushchin 2021-06-28  694   * to eventually release the dying @wb.  Returns %true if not all inodes were
c22d70a162d3cc Roman Gushchin 2021-06-28  695   * switched and the function has to be restarted.
c22d70a162d3cc Roman Gushchin 2021-06-28  696   */
c22d70a162d3cc Roman Gushchin 2021-06-28  697  bool cleanup_offline_cgwb(struct bdi_writeback *wb)
c22d70a162d3cc Roman Gushchin 2021-06-28  698  {
c22d70a162d3cc Roman Gushchin 2021-06-28  699  	struct cgroup_subsys_state *memcg_css;
c22d70a162d3cc Roman Gushchin 2021-06-28  700  	struct inode_switch_wbs_context *isw;
e1b849cfa6b61f Jan Kara       2025-04-09  701  	struct bdi_writeback *new_wb;
c22d70a162d3cc Roman Gushchin 2021-06-28  702  	int nr;
c22d70a162d3cc Roman Gushchin 2021-06-28  703  	bool restart = false;
c22d70a162d3cc Roman Gushchin 2021-06-28  704  
98b160c828f312 Len Baker      2021-09-25  705  	isw = kzalloc(struct_size(isw, inodes, WB_MAX_INODES_PER_ISW),
98b160c828f312 Len Baker      2021-09-25  706  		      GFP_KERNEL);
c22d70a162d3cc Roman Gushchin 2021-06-28  707  	if (!isw)
c22d70a162d3cc Roman Gushchin 2021-06-28  708  		return restart;
c22d70a162d3cc Roman Gushchin 2021-06-28  709  
c22d70a162d3cc Roman Gushchin 2021-06-28  710  	atomic_inc(&isw_nr_in_flight);
c22d70a162d3cc Roman Gushchin 2021-06-28  711  
c22d70a162d3cc Roman Gushchin 2021-06-28  712  	for (memcg_css = wb->memcg_css->parent; memcg_css;
c22d70a162d3cc Roman Gushchin 2021-06-28  713  	     memcg_css = memcg_css->parent) {
e1b849cfa6b61f Jan Kara       2025-04-09  714  		new_wb = wb_get_create(wb->bdi, memcg_css, GFP_KERNEL);
e1b849cfa6b61f Jan Kara       2025-04-09  715  		if (new_wb)
c22d70a162d3cc Roman Gushchin 2021-06-28  716  			break;
c22d70a162d3cc Roman Gushchin 2021-06-28  717  	}
e1b849cfa6b61f Jan Kara       2025-04-09 @718  	if (unlikely(!new_wb))
e1b849cfa6b61f Jan Kara       2025-04-09  719  		new_wb = &wb->bdi->wb; /* wb_get() is noop for bdi's wb */
c22d70a162d3cc Roman Gushchin 2021-06-28  720  
c22d70a162d3cc Roman Gushchin 2021-06-28  721  	nr = 0;
c22d70a162d3cc Roman Gushchin 2021-06-28  722  	spin_lock(&wb->list_lock);
6654408a33e629 Jingbo Xu      2023-10-14  723  	/*
6654408a33e629 Jingbo Xu      2023-10-14  724  	 * In addition to the inodes that have completed writeback, also switch
6654408a33e629 Jingbo Xu      2023-10-14  725  	 * cgwbs for those inodes only with dirty timestamps. Otherwise, those
6654408a33e629 Jingbo Xu      2023-10-14  726  	 * inodes won't be written back for a long time when lazytime is
6654408a33e629 Jingbo Xu      2023-10-14  727  	 * enabled, and thus pinning the dying cgwbs. It won't break the
6654408a33e629 Jingbo Xu      2023-10-14  728  	 * bandwidth restrictions, as writeback of inode metadata is not
6654408a33e629 Jingbo Xu      2023-10-14  729  	 * accounted for.
6654408a33e629 Jingbo Xu      2023-10-14  730  	 */
e1b849cfa6b61f Jan Kara       2025-04-09  731  	restart = isw_prepare_wbs_switch(new_wb, isw, &wb->b_attached, &nr);
6654408a33e629 Jingbo Xu      2023-10-14  732  	if (!restart)
e1b849cfa6b61f Jan Kara       2025-04-09  733  		restart = isw_prepare_wbs_switch(new_wb, isw, &wb->b_dirty_time,
e1b849cfa6b61f Jan Kara       2025-04-09  734  						 &nr);
c22d70a162d3cc Roman Gushchin 2021-06-28  735  	spin_unlock(&wb->list_lock);
c22d70a162d3cc Roman Gushchin 2021-06-28  736  
c22d70a162d3cc Roman Gushchin 2021-06-28  737  	/* no attached inodes? bail out */
c22d70a162d3cc Roman Gushchin 2021-06-28  738  	if (nr == 0) {
c22d70a162d3cc Roman Gushchin 2021-06-28  739  		atomic_dec(&isw_nr_in_flight);
e1b849cfa6b61f Jan Kara       2025-04-09  740  		wb_put(new_wb);
c22d70a162d3cc Roman Gushchin 2021-06-28  741  		kfree(isw);
c22d70a162d3cc Roman Gushchin 2021-06-28  742  		return restart;
c22d70a162d3cc Roman Gushchin 2021-06-28  743  	}
c22d70a162d3cc Roman Gushchin 2021-06-28  744  
e1b849cfa6b61f Jan Kara       2025-04-09  745  	wb_queue_isw(new_wb, isw);
c22d70a162d3cc Roman Gushchin 2021-06-28  746  
c22d70a162d3cc Roman Gushchin 2021-06-28  747  	return restart;
c22d70a162d3cc Roman Gushchin 2021-06-28  748  }
c22d70a162d3cc Roman Gushchin 2021-06-28  749  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
