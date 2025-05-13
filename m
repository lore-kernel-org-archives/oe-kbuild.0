Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8420E309
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125454; cv=none; b=Oeext5J0uNXzb6DVaugk0etZev6fNRx9Ap8FNkDPa692A0EHMBj5iInM9DDgkYxYUj+TToHpY+JrG7daNIZl1ynFP/8CRnoaUTVSC4Xg+EhhkRr49B2lJ1ZNzfV/wr6BEG800cxMQhqY1la3ZQa3Rff520RyHifxZRarbS1AeKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125454; c=relaxed/simple;
	bh=zgDdmSeWkLaUaASI/n7ZfCuk6pqpPiC1M4wAYicsvv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8QkM4wJ2gyE9x7FB/YyLrsQvs5daeIBNAIqlUWuMEnJJJGMRO8fkRDlLbBsty55t7YCKI30H4j+Z+NFUt/3zOKct/4muGkkFkUJuLdEx0cNgOb8Xys7YWIDsBLFDuh8Qcfth4lqdGaIdVYye931cYvdD+ETql8LbITmibQC0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/N7aObK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/N7aObK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747125453; x=1778661453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgDdmSeWkLaUaASI/n7ZfCuk6pqpPiC1M4wAYicsvv0=;
  b=T/N7aObKynmxsM+ITY118+4wP/cG2phCdh5f5ZGfnZljB1O5J3gCqdYU
   R+OT90n8d+NMLkiAqQCXTqoNSn3dRj1zdUWIvG4tQ+yPwa2qaUPAiTMeh
   Rj/XKOcNJNTtxAoYI+ekl5UKGt7bwmGJCcQdX25qtyGp8xxZD87NkOnAA
   qXcQMmsJC4dtiZE7UXNyZ4LAv9/k/DUQhjk1LWoiiorFfD332QHerN9Xf
   2hO2nM6lYpOtdpKzpSrfjB7nbkS3pI7Rarx2nG8f3S48Noym8U9jKnCjM
   A1DaWZVaIU0c5yaXQ8XuGq5J3YLe9n5/9GT/6QMYaQ09Vp42p909OElIK
   g==;
X-CSE-ConnectionGUID: YBscVCXYRMu48HOs9VN6Jg==
X-CSE-MsgGUID: XHv4YQwfTvOw4oMNJXNmJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49038038"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="49038038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 01:37:32 -0700
X-CSE-ConnectionGUID: RxnrsCqhTi6Cpk88TP2oVA==
X-CSE-MsgGUID: 3MFLd93bTieoptLrG5hGyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142578210"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2025 01:37:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEl8j-000Fsm-0t;
	Tue, 13 May 2025 08:37:29 +0000
Date: Tue, 13 May 2025 16:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent-tree.o: warning: objtool:
 btrfs_cross_ref_exist+0x12c: unreachable instruction
Message-ID: <202505131614.cWLXbQcX-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: 88694f74f4853b01dae678fb8d5f2c46948ae620 btrfs: add assertions and comment about path expectations to btrfs_cross_ref_exist()
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131614.cWLXbQcX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131614.cWLXbQcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131614.cWLXbQcX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent-tree.o: warning: objtool: find_free_extent_update_loop+0x3a8: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: visit_node_for_delete+0xcc: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: do_allocation_zoned.isra.0+0x22c: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: find_free_extent+0xf78: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: btrfs_get_extent_inline_ref_type+0x130: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: lookup_inline_extent_backref+0x538: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: btrfs_inc_extent_ref+0x8c: unreachable instruction
>> fs/btrfs/extent-tree.o: warning: objtool: btrfs_cross_ref_exist+0x12c: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: walk_down_proc+0x2c8: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: walk_up_proc+0x16c: unreachable instruction
   fs/btrfs/extent-tree.o: warning: objtool: btrfs_drop_snapshot+0x5a0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
