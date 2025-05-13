Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D9C645
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 04:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110968; cv=none; b=Ttg2vUfwnwVlhPpwthT66LdVZlv8uqjIuTEzXCKbIAcH8iFEJo+cRSlukyDKYkrkZKmpVFNNxE0k8CXzkKGxFfzzc7NBQGtqWDlon12F1y6MomlUFFT8xU4m9uN9vgZzN47aAuM0Eq6IyGvEyrFbJztoBeOv5gz+OzcbU9CSRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110968; c=relaxed/simple;
	bh=QJSHjOYPGwasxbxyvxivl9UnG11b4HzVLxSr4MAj2h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBTpkaQLTNmtpjPyQaz0gE+LBUAH3nsCTtEevpKhWchseNxiUOyBAXeA2alD97p0C+JDc8Fu2sn3cyCk6MumByt5+hGUXzU8etZF0XpswAf7eGCtIa6cfUHgGSJg+1OFSGm6XhCboqg/sEaEF0Zv4DNWjMH+PSv+SK1ZKj1mxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvFsajKK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvFsajKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747110966; x=1778646966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJSHjOYPGwasxbxyvxivl9UnG11b4HzVLxSr4MAj2h8=;
  b=OvFsajKKX/pNrZ1Ph6U2yYR9da9wP5haFyqISCSohyTVCyZYmMv3AxG1
   oN8VPYMDvtajvKt0Zmu7yx0PhCWk6JOTXeLnMQfKFPBeN1CuW+qu0TobU
   VJRJXAzmSVelBLquEivIhM0QfRFA9lRAZFyyqxG5uBMkhJUnLOyTfEcUN
   u9Gc5rv1nNU29j1ANxCGOx29eDoWwLmiYVDT3Ct6YmHl1Rcg2CTOUdDX6
   14nBbbrScsJfeW5oxxOSH6nClNgVo+MRMM0qJWL9wotu9PH9s7sf9VdlZ
   ELyDa99ggCRwDGIm53MbD7idVgaML2bEPluKyTBV+ampLhXTvfP91MgBr
   A==;
X-CSE-ConnectionGUID: 4Hctj3iYQvGpWq1XHWtSgg==
X-CSE-MsgGUID: rAcDmqe3QjeK+OHIvTmieA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48928317"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48928317"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:36:06 -0700
X-CSE-ConnectionGUID: TyW1RzPxTMaHXbsqmrBJCQ==
X-CSE-MsgGUID: GmKXqUXyQeWLcw2e8M7ZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168493826"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 May 2025 21:36:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEhN4-000Fe7-0x;
	Tue, 13 May 2025 04:36:02 +0000
Date: Tue, 13 May 2025 12:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/zoned.o: warning: objtool:
 btrfs_reset_unused_block_groups+0x354: unreachable instruction
Message-ID: <202505131230.w39juDKb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Naohiro Aota <naohiro.aota@wdc.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   627277ba7c2398dc4f95cc9be8222bb2d9477800
commit: 453a73c3069a268c3c4dd00695fc2a95f7880438 btrfs: zoned: reclaim unused zone by zone resetting
date:   4 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131230.w39juDKb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131230.w39juDKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131230.w39juDKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/zoned.o: warning: objtool: sb_zone_number+0x58: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_get_dev_zone_info+0x454: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_find_allocatable_zones+0x17c: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_ensure_empty_zones+0xe0: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_finish_ordered_zoned+0x180: unreachable instruction
>> fs/btrfs/zoned.o: warning: objtool: btrfs_reset_unused_block_groups+0x354: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
