Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E951D61B7
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 00:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773966369; cv=none; b=i8KUq0GHhTgmMkLB8SPHWh5UU+I9QnvmaiBQT6LjgwpkRpTl9S+lbR96Pe4mKHPJLsoFK2d9AXstM5Kfl8B2vy8khoKGXyWzC8Kgll29BIUwfrSM14X/wDTtw3Yl0TMVsMSypuu0Hy+bQvRGrEtAWkD3UksNKeLJNh4XFvfI5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773966369; c=relaxed/simple;
	bh=yXymDnDYyyCKiX86CZuyN+62dd5mCr9BpQYkIEhZB0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iR5NFL/jXXQlClp1MNUPA6MrZysFd1RV32VjCIpiMRnKKDCMXlzg7WB4MAKdd4Br9Cn8tgGJyyO7h7NVL6OssT+fGLSPb0DoU0I4N+qw+NYB25U2TfEMd3DECbhHmWxcI4EPxr1ADjT0NzZ2k+MupG7sRaawoOeOd7V5VHxygiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koZXsCrd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koZXsCrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773966367; x=1805502367;
  h=date:from:to:cc:subject:message-id;
  bh=yXymDnDYyyCKiX86CZuyN+62dd5mCr9BpQYkIEhZB0g=;
  b=koZXsCrdD9S5gd54NILzImitZQaebT6/Ev2b6QYCyA/4gUlXrSQsIS4n
   jgA8/45DM7Tfxr6xY59BhMmIlNp+jSR7NkKpSTCZ8qAFyGWXpb+B2sxOi
   KLikSvOSCMZdCvjBdPIpHyD+Vjql2lbDEKWNHiy3lFnjRW7sXpxnEZ86J
   rzGQqpz4ZhMo4zXvW/5l+NiY35ZRORiwFJs67CdWXl4ObqyaOQQbaEOy8
   SsCOkDFxCMJXZPvXWjp0IhBP8HFeCGA7Y1zfjI4BrB58zky4AERuud2Nc
   H5LHxb53Bw1NwOI5tv+I6bl18Z3uKj9+2kXKNEXgmMDv1cTJ341exg/KO
   g==;
X-CSE-ConnectionGUID: uxJBASP9Q7eOxzmgWUIIGA==
X-CSE-MsgGUID: r+W0+WlTSjqSD1zfvHolSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75236710"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75236710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 17:26:05 -0700
X-CSE-ConnectionGUID: h771u4RGTOa2TSZ+xIDlTQ==
X-CSE-MsgGUID: fe9bJUAcSZily3Sln/BI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218525140"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2026 17:26:04 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Nga-000000001ob-1t6g;
	Fri, 20 Mar 2026 00:25:56 +0000
Date: Fri, 20 Mar 2026 08:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool:
 can_skip_one_ordered_range+0xe4: unreachable instruction
Message-ID: <202603200823.4JSF9ViZ-lkp@intel.com>
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
CC: Filipe Manana <fdmanana@suse.com>

Hi Qu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a1d9d8e833781c44ab688708804ce35f20f3cbbd
commit: d2da21a6e06c40b9fd380ada93f1b48279e48b16 btrfs: introduce a read path dedicated extent lock helper
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260320/202603200823.4JSF9ViZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200823.4JSF9ViZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603200823.4JSF9ViZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent_io.o: warning: objtool: can_skip_one_ordered_range+0xe4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: set_delalloc_bitmap+0x100: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0xc4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x1d0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: writepage_delalloc+0x410: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0x108: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x10c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: end_bbio_data_write+0x16c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_folio+0xd8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_sector+0xcc: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x204: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0x220: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x244: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_clear_buffer_dirty+0x268: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
