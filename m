Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9DE4B1E40
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 05:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747546502; cv=none; b=nERuB6eEHZa/QV4PR/huNlNMdhM1Zn+kBGhCGv6agX5e3su0dimayieKaI1WUFNWiBbW1MCcLCPyVoKFqgHRLXXo67EuvymBFYOf3AnRcoZOkgPnijJrLWWHlLdPkmgkHY2lkMkhA7XYZXgZlZ2zkahjAeE8S4mILPgAl4h66mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747546502; c=relaxed/simple;
	bh=ucT8bWCoTzMotI1/iyY4uanYMmw9dxSbD3263++XnVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgY7QutAdIbrKJSjgwLUH3YgxWSxWjotTOPvLPleiVw2eYvuGp2ZBKLYtJMyXRN4wBy3fHq+CNLkzqsRht046irvuO/bz+D2qDcVINJkYZkjctHKb55Lx8fjS+/AxXfTM1NNr3bru+Y9FS3Et1tQVu7vth3MQfA5JEPy9uRgS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPJCxUex; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPJCxUex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747546500; x=1779082500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucT8bWCoTzMotI1/iyY4uanYMmw9dxSbD3263++XnVY=;
  b=dPJCxUexl6PeSvHZrEUGiPtrBkAdPK+VD3hRRqvdRKKe2vt1mUCAv4eI
   hGoURl3jkRQb6qxG5drqxhIhGgfB5WxgQPAErtXXfl7ofGvldA/7Mo7g3
   qYcACkglz5n/bvoLHBBfQGVGy3Jxx4NZ1XkyyCWwzbLZhH8dY+KyHaPaW
   RrqZUMo7AIzh/oY6AyFlPURRkLaAptV8kxe862Zt65crZ6PLFHeRptVNa
   YoZkri8Y8/HNt3v/N1swXwsOHVhaeaFiK2Ul1Hlfug5KPtJMxElKl0w7s
   3FXWYLqXPsfL4AiAd3BACIDlH45HgtKZWn3OJFT9RNOR+UzHtHBa7Drkk
   w==;
X-CSE-ConnectionGUID: EJQmTRTBTSWcxHMoO9zO7Q==
X-CSE-MsgGUID: kFoOlBmYQSmKXVAva9qHyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60498925"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60498925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 22:35:00 -0700
X-CSE-ConnectionGUID: 9853ehbZRdWb85HZ9bZPhQ==
X-CSE-MsgGUID: NFTjiT4fSrCTit4FrkIveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139587159"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2025 22:34:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGWfo-000KeJ-1A;
	Sun, 18 May 2025 05:34:56 +0000
Date: Sun, 18 May 2025 13:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/inode.o: warning: objtool: wait_subpage_spinlock+0xe4:
 unreachable instruction
Message-ID: <202505181312.TsLbBoZt-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: fcc384be06aa28d246ace6ca38c8d2b8eb4bf5a4 btrfs: require strict data/metadata split for subpage checks
date:   9 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250518/202505181312.TsLbBoZt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181312.TsLbBoZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505181312.TsLbBoZt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/asm-generic/io.h:1108,
                    from arch/loongarch/include/asm/io.h:82,
                    from arch/loongarch/include/asm/kasan.h:10,
                    from include/linux/kasan.h:21,
                    from include/linux/slab.h:256,
                    from include/linux/crypto.h:17,
                    from include/crypto/hash.h:12,
                    from fs/btrfs/inode.c:6:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:578:16: note: in expansion of macro '__swp_entry_to_pmd'
     578 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> fs/btrfs/inode.o: warning: objtool: wait_subpage_spinlock+0xe4: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_add_inode_to_root+0x124: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: insert_inline_extent+0xf8: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_del_delalloc_inode+0x11c: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_set_delalloc_extent+0x258: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_evict_inode+0x3ac: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_get_extent+0x6a4: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_create_io_em+0xd0: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: cow_file_range+0x2e0: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: run_delalloc_nocow+0x2f4: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: compress_file_range+0x258: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_finish_one_ordered+0x638: unreachable instruction
   fs/btrfs/inode.o: warning: objtool: btrfs_invalidate_folio+0x178: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
