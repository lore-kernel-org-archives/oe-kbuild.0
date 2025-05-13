Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E5205AD7
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176616; cv=none; b=o1LInaEAue73mgsIbg+9YcV9e2SKfcNlxsfme9zISHBXAdE3GN/tjx3VusVn9KcNhscNcnVAo3mk+Zdk5NQxEUPcXd9jJetBkXiDvYEMgJA769L5SbPnYMZWnhu5dI9WTCC6LR+HryBvrAUjfgT4SIT+wikRagFgmRG+Te5AtPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176616; c=relaxed/simple;
	bh=R9ypbE9K1B7bGbfCh3ckyhLQyf3t73r5PvNKkHUCGb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEZgP9n+X9LUFiCOSY/hNqoU4TDo6tDQaOuCCMhqouKsGiKgawSuKj0gFgYslIFT4KbXaixM16007Lc2wyZ61FnC2vuRemThHmcA8zSqEcDKWV6nd+8OCvoSNH5+gFre6A7nbzP8bsV61MoUblvGZsp9pzDK+n+9N6uI49YHR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7HYpDi8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7HYpDi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747176615; x=1778712615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9ypbE9K1B7bGbfCh3ckyhLQyf3t73r5PvNKkHUCGb8=;
  b=m7HYpDi8pLIwOTSWmlosXTRNwdAZkj3iKdEr3ho7eYIMkA8lvh9JYkfD
   rFdmlvp8wVvzHHTSXFQ0mkWgy7+6VBnp1y3fE2o91hU8z7MTph/WRRgjm
   ZGKs5Ndaq8Nk/OoMnhBqdDVTC7sG+SOZ+395k6loHpcHNBBBd/zAiQx3Y
   5esQroKAQwlF8xyWTIz4LspZHHXcURTpz7c5w1zEFJovjksw3Z7MqvER4
   Rg3nsEAYxwekrhIvdC33fefrB6tQkFzWGbHlmDE6KCMo7xczjaIdC1ONL
   S0FcT2/60lNIEAEazs+M+JIzDrn0FG5LcSVcKL4EhnqqCerA4Z7wOQ3Y0
   w==;
X-CSE-ConnectionGUID: /LpkpxjFTHSnK8WfYBhztw==
X-CSE-MsgGUID: SRBSVJK+S5SEywuhp9e23g==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48303083"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48303083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 15:50:14 -0700
X-CSE-ConnectionGUID: MZz7NdI+TbyL8u/v/pZWCA==
X-CSE-MsgGUID: tZ6jTQUfQsaI526nfECudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137726189"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2025 15:50:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEyRv-000GTF-00;
	Tue, 13 May 2025 22:50:11 +0000
Date: Wed, 14 May 2025 06:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid-stripe-tree.o: warning: objtool:
 btrfs_partially_delete_raid_extent+0x158: unreachable instruction
Message-ID: <202505140610.SrCUFRn6-lkp@intel.com>
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
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: a678543e609dfb145f0498f895bee05bbc7994a5 btrfs: fix front delete range calculation for RAID stripe extents
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250514/202505140610.SrCUFRn6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140610.SrCUFRn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505140610.SrCUFRn6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/raid-stripe-tree.o: warning: objtool: btrfs_partially_delete_raid_extent+0x158: unreachable instruction
>> fs/btrfs/raid-stripe-tree.o: warning: objtool: btrfs_delete_raid_extent+0x534: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
