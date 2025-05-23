Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561E1DE2A5
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984225; cv=none; b=etoY69dmn8q54WNpMgxvxFgAfQiiwxJsASARyFihReGYoJijubk+7K2h0qAqQSgeVPh4v2205RukLm5TC6fK0lq8yznxcK7hoL/dYjNfwPyj/UZSgVy5S60zxGwcanoF8lojgWj5QyEsZ4HI143/gYImHgasqSZcDCD1a5x5Psc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984225; c=relaxed/simple;
	bh=NJLk1vS/yLP7coe12bGjLNqH2BBhJbsnLLDHCB/zdXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkPa72Ee973fsduRsCKa/QNPypTEVWPHfY0K80IMHjRY+C4qXtmS+mcAtkcBuiSYnorqYBZ/aCyfPmI6E+5cAP7XySJ/uwG6MzxY16cfTA8aZX0zcjK6bhai8x6NbAqjDwowUg0JAbbyG5LtLuWoExm9S/UAcqbjamw1KNXL6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/6bFY3+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/6bFY3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747984224; x=1779520224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJLk1vS/yLP7coe12bGjLNqH2BBhJbsnLLDHCB/zdXA=;
  b=B/6bFY3+Y+I1ikoOnn3Fft/FlKhJGVSJ0IFRb5lPZJJ+89zJGl150VeS
   e0dLXcQvLH9OwiCRUlFiaEWuyO9xnTlXSssN7ylEfxDsnP5dAZC2HOrxA
   iAfjVMpM/ZyLh1lX4g8CxsRsSsgbxe6MzXlbHLAg/0xbIRwCOSEMsyrBe
   8Inn2Idnl+dYSBiOmO/LYWU0y+oHCwyZH0BQwF9NFcn+80+iRwb2Ouluc
   V14xWldFIq0TkQzw5SY+XP5oOkdMPSjPSrVqCkeqsdr0/rFjW+sc3TWBL
   29qvSU1DHDQx7Ee1ZpPemdw24kZ2iqVQA5jorxXoL453SQhaGlomxBSJ2
   w==;
X-CSE-ConnectionGUID: s4qv0s9fSf+a4Tg3rcBw0w==
X-CSE-MsgGUID: E8RGIOdkTZSlCzf6t9S90w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61083109"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="61083109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 00:10:23 -0700
X-CSE-ConnectionGUID: SuwMCj0lTJymePBWjw2HLw==
X-CSE-MsgGUID: ODmfWxWlQNSYmDkyUgN8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141081310"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 May 2025 00:10:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIMXr-000Q8k-2w;
	Fri, 23 May 2025 07:10:19 +0000
Date: Fri, 23 May 2025 15:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/inode.o: warning: objtool: submit_one_async_extent+0x144:
 unreachable instruction
Message-ID: <202505231543.gvEijzEL-lkp@intel.com>
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
TO: Boris Burkov <boris@bur.io>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94305e83eccb3120c921cd3a015cd74731140bac
commit: a0fd1c6098633f9a95fc2f636383546c82b704c3 btrfs: fix folio leak in submit_one_async_extent()
date:   11 days ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250523/202505231543.gvEijzEL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231543.gvEijzEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505231543.gvEijzEL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/inode.o: warning: objtool: wait_subpage_spinlock+0x84: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_add_inode_to_root+0xcc: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: insert_inline_extent+0xb4: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_del_delalloc_inode+0xc8: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_set_delalloc_extent+0x1dc: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_evict_inode+0x1cc: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_get_extent+0x61c: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_create_io_em+0x78: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: cow_file_range+0x154: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: run_delalloc_nocow+0xf0: unreachable instruction
>> fs/btrfs/inode.o: warning: objtool: submit_one_async_extent+0x144: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: compress_file_range+0x1b0: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_finish_one_ordered+0x30c: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_invalidate_folio+0x1b4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
