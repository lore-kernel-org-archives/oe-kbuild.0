Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC41402BB0
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551519; cv=none; b=s2Sltd2xxgAJZ9Oe34Q24/Yi26xHFeL4iDtfaEYw/Y/ssqKC7bbpW36Ca94NvJzpNvquH9b/jqKrePiWug5QbY7IbMS7hbDZ0l8HkO2QxPu105VoA+sveqLbyhONkhw/ymiBh/E9XeL1+gaQQtDBfEOiJigf1EprYgbhu78Aqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551519; c=relaxed/simple;
	bh=XXHMzq0uaDJZstsVdofeaeGrnHA+DQ4JlFsdbyDzh6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=POqXW5lScX4h9REtaOs1ddEYxGMst+s1k9f6NgGho3sco2DJ3Xv1ZNbYbO4X67VWaaGgz+e8qI1a8usk7f7zloUyQyTiWS7dBCY5F0z86wkv5f6zuJxGtE0sZFm9jI6FBKuqqvl6I3Xi2om9NBIj5Uvubcsacw3/1UXlQpKP0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ4e4K+H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ4e4K+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777551517; x=1809087517;
  h=date:from:to:cc:subject:message-id;
  bh=XXHMzq0uaDJZstsVdofeaeGrnHA+DQ4JlFsdbyDzh6s=;
  b=QQ4e4K+H1OdbwRxegKVA9OKHyIItaxpyqvVi/BWW83mDI+AuVKJmS8yv
   sVgMDRGxoYbqBKrbSG9R7AWRNIpQOMY5b01ueb00F8Ap1EJ9TCzgoR/Zf
   gpXU5/GRZ+w+4spYKiT5LLn08CNYeYUknS8cgD3kys+QyxOMKMDCQFrjY
   qNQDywhYaeRHq5o5ht6bZSnhjgTpVrVv3TyapmGCf/Z5SSuiK/2EThYnN
   Si/b0V4xqyw+P05FYujFCoRfKytn5crijn4WuW1VTKlT+32onoEnGF+yY
   /iGwwQJicOt+LBDs2kjBOamrVgn7Yf+5eP6ld8VXU1LIsZ5zRSrUc4aw8
   Q==;
X-CSE-ConnectionGUID: SFGOVAw5Q8qYPHM/VqUSWA==
X-CSE-MsgGUID: RiqRLdm8TBuy2x5e8090Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101163772"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="101163772"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:18:37 -0700
X-CSE-ConnectionGUID: TchRTtKGQF2ASO0dGyHfWw==
X-CSE-MsgGUID: rKBHNYXySNaJs9M9sRs65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233724599"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 05:18:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQLh-000000004or-3NiC;
	Thu, 30 Apr 2026 12:18:33 +0000
Date: Thu, 30 Apr 2026 14:18:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: fs/eventpoll.c:1700 function parameter 'ctx' not
 described in 'reverse_path_check'
Message-ID: <202604301445.B4tUS3uM-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>
CC: 0day robot <lkp@intel.com>

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/eventpoll-expand-top-of-file-overview-locking-doc/20260426-022145
head:   6df7cb04a8a776b71a161394ded496ea3ddc8662
commit: 6df7cb04a8a776b71a161394ded496ea3ddc8662 eventpoll: hoist CTL_ADD scratch state into struct ep_ctl_ctx
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604301445.B4tUS3uM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301445.B4tUS3uM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301445.B4tUS3uM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/eventpoll.c:1700 function parameter 'ctx' not described in 'reverse_path_check'
>> Warning: fs/eventpoll.c:2365 function parameter 'ctx' not described in 'ep_loop_check_proc'
>> Warning: fs/eventpoll.c:1700 function parameter 'ctx' not described in 'reverse_path_check'
>> Warning: fs/eventpoll.c:2365 function parameter 'ctx' not described in 'ep_loop_check_proc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
