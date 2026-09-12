Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB3301486
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254475; cv=none; b=pSPPQUCUkFUuDqBXrJHZgSOStNMmmbCOsh+CjjpiQgV18lO2f2Gu2JFJhd54D1dCunBwCsI+1gCr+Nmhk5vC4VbkuLgOVYc4iwkV8+9RMf/8GTjNtHbeFhODmo+oTffKeaasbm1Un91djjE8MY7x3RZ15DHV13jtTcLYeIc6/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254475; c=relaxed/simple;
	bh=unIUNEH104kszlbOvbIVRq2Vj7BnwyaleFsiLj62a7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REPwpxNDWtSNeaxyDtZAGmVmF8ooK+Ys8fHeFXRPcp0ZrSqwUr+UhNqJ4Y7Hq8VcZBwh/2ok59x1fFGi4PrxITZ0XvJ+sHogxY4RlYQqmIm93QPdVjC51X+8Peh4Qd4S4drQZkpoXiaXMX19K7OgZGZK3ARH7lj/bCjgObDckfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwZWIbeF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwZWIbeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789254473; x=1820790473;
  h=date:from:to:cc:subject:message-id;
  bh=unIUNEH104kszlbOvbIVRq2Vj7BnwyaleFsiLj62a7k=;
  b=OwZWIbeFQzmI/5j6z/qnAxIPUMM6JzImIHyZLZH7TzkVkeSpLwnIsfCX
   EO0OcvBl05wZmbtChQelXgPefVhrfYZbOTy8ofgIA/tPv1mUuPA7ls7i1
   iRCi+AaYkPWi7K6sVdE/jSBORrxUrrt1d/4uYh7YLG4MWalMwz6NDiXXe
   hWQs/aMJ3EDGhuP4l71MuXmq4BRvDA+4bwEPqz7OSsQtKOQLYtjB9SE1C
   NbjmSlD2jI0OIO7tuC+9CMyhcHgR/FQ+YubPYo/3EUjnoptDhpf1/g6Mn
   RM7milowNXxckgzB/HxxMNg/Z8YU5FynQdterpqXufDx2GkZHxKHflkmi
   g==;
X-CSE-ConnectionGUID: 7Fi7MpMCSb+gTZjZeNNKpw==
X-CSE-MsgGUID: boF5lGrhRHudhnhDOgtwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="100269804"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100269804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 16:07:53 -0700
X-CSE-ConnectionGUID: tY5hxXzpS4Sl47raQLTNQA==
X-CSE-MsgGUID: 8wkkJsgKSF6eMIbGcSY3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="270480651"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2026 16:07:52 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Wp3-000000003Ml-3UHE;
	Sat, 12 Sep 2026 23:07:49 +0000
Date: Sun, 13 Sep 2026 07:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid56.o: warning: objtool:
 raid56_parity_cache_data_folios+0x78: unreachable instruction
Message-ID: <202609130746.GuFroPOk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cba2348ab114391f5b1a00fa65c5b739f13f0563
commit: 5fbaae4b8567b19cd65b847043588e10af86eb60 btrfs: prepare scrub to support bs > ps cases
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r061-20260906 (https://download.01.org/0day-ci/archive/20260913/202609130746.GuFroPOk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130746.GuFroPOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5fbaae4b8567 ("btrfs: prepare scrub to support bs > ps cases")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609130746.GuFroPOk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/raid56.o: warning: objtool: raid_wait_read_end_io+0x74: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_rbio_range_error+0x70: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: alloc_rbio.isra.0+0x70: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_add_io_sector+0xb8: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: sector_in_rbio+0xd0: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_stripe_sector+0x88: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: assert_rbio+0x6c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: finish_parity_scrub+0x94: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rmw_assemble_write_bios.constprop.0+0x5c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rmw_rbio+0x26c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_recover+0x118: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x8c: unreachable instruction
>> fs/btrfs/raid56.o: warning: objtool: raid56_parity_cache_data_folios+0x78: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
