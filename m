Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2428D8DB
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135982; cv=none; b=sIVfQ94Wbkkc8fTYkFD/3TM4l5WW8tMKE13/h+gs4fPjUHQT2YHB9TZYItwDcG9SOx+xdXWZQ1WK9+2MT3qeOccJI/zPLgmUL4aDMMAZ7bzd8bA5hc27qVVgBm9okpFoVT+4kfblA3vx5wMT62uNRWglA2x1wNHayWBY/ifUMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135982; c=relaxed/simple;
	bh=qiymtearJIQYJKl2xHD4TkRnw/gUyxW1cX0fxQDfTnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijpljHgNvQgxYhauxJQvMEvkdD2zc83Z8CeQvdxln8rtrvX/+QZDszWIi9xyJKvt4FXWZWN1DOAc7NAKWWQ5tjm1DzgS2yddyMwktBG69Wj/DKEJtzWZqZmPqHcyTPj+IAXEXbGW5+yGKOl/IPlEJzr4i2REX30hsW7F2KGpe8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHnZhdrs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHnZhdrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747135980; x=1778671980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiymtearJIQYJKl2xHD4TkRnw/gUyxW1cX0fxQDfTnQ=;
  b=NHnZhdrsS9Inakb+tEFcP1M7aMJzZk84g0LGfKoyVdwUQV/io3NSagjM
   U2d+k4bTvyq1b4owFAc6CPe6d+v42j1rRJaJwK1PRNVhuDEpbJX5hWUxa
   L2zXPvd0lZGLm3ExyjN+acHlwx8khKuWicEduIbENmxdZ5syoPzmbe8tT
   hXLfQfOdr+4TmXZDXQIO4sm6Sx76g68/kivMauWXdlQ6cgiL5CL+jMZZz
   j8iE0kO2KFWhTIZWKduIyWD0ssAlo4Kcu6eunXMcFzfxY9LKnvnfS0B5W
   wguQS8bcHF13tzhoeoax8I0h4ut2lrG8UTkFXn2eru7MoWxmi3hZyGMxJ
   g==;
X-CSE-ConnectionGUID: 1cmXYslfSSmo61lp8HM20Q==
X-CSE-MsgGUID: vEo814ViSR2OIeNUdph5Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59614252"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="59614252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 04:32:59 -0700
X-CSE-ConnectionGUID: Gpk5B2VcQDyxbu0/uR787Q==
X-CSE-MsgGUID: AdvX/rxTTb627Tk8ssxtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142440000"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2025 04:32:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEnsU-000G0l-1t;
	Tue, 13 May 2025 11:32:54 +0000
Date: Tue, 13 May 2025 19:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8556/10491] fs/btrfs/scrub.o: warning: objtool:
 scrub_stripe_report_errors+0x774: unreachable instruction
Message-ID: <202505131942.tTg0hrdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 8c5631cbe419128627d7eec71040fd21d0d6df4f [8556/10491] btrfs: scrub: aggregate small bitmaps into a larger one
:::::: branch date: 25 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131942.tTg0hrdi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131942.tTg0hrdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131942.tTg0hrdi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/scrub.o: warning: objtool: scrub_stripe_submit_repair_read+0x150: unreachable instruction
>> fs/btrfs/scrub.o: warning: objtool: scrub_stripe_report_errors+0x774: unreachable instruction
>> fs/btrfs/scrub.o: warning: objtool: scrub_verify_one_sector+0x23c: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_submit_extent_sector_read+0x154: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_submit_initial_read+0xe4: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: submit_initial_group_read+0xc4: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: flush_scrub_stripes+0x364: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_find_fill_first_stripe+0x3d0: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_raid56_parity_stripe+0x3c8: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_simple_mirror+0x23c: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_simple_stripe+0xd4: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_stripe+0x30c: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: btrfs_scrub_dev+0x130: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
