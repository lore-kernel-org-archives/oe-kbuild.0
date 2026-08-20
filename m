Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68697440636
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787267753; cv=none; b=jGTjvylmyLJOZuQYxTOJx3KuX3cx3yVYOojRk4MaOuFo6l02QhH/EwGX0H6BhwjNKzYBbcDFn833kclivT+LAlMtMuOYdoZ6/XNbusE1HT5hvr+Y+Xii85ByuV0krS9B6I57ram2p2KbyExoJKbeTFMDEgRbHEzJ8JHqjiKTNLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787267753; c=relaxed/simple;
	bh=O0f+zsQ4wQnukKV+t6NUOUhs9Y21KRhz26n1FM0mZl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Grgw+ZcxT241/Sal7I6nTZJAVmFqEVYurg6ArsPP76keIl290lqSuBLjv36rJ+iRdd4UQerwnCue6FoPOsNFGzyq6J67i9XaQiSSmq+BFP1cluSuTHNGnobIH+eEvOMSNdIMkWUuiW2niMFvFE8i/cLfjGenDPtFL8Ubbs+Mp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTRndP8S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTRndP8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787267753; x=1818803753;
  h=date:from:to:cc:subject:message-id;
  bh=O0f+zsQ4wQnukKV+t6NUOUhs9Y21KRhz26n1FM0mZl0=;
  b=NTRndP8SmNbYTzdUUnKGLZL/IXPtbfLpzoXQHbtgQ17PYU9MQOX0RPGP
   xl32e/2bBdq244A+DFEPokmoUK/8YjC0HnfYH+Asx2IthAhNwVc7ajC2b
   F9/QBcSifblC6opTYvXr3AaM5JEIyjnHQmZWI/yoggVjNWjTAlnv8GRP4
   pvn4xI9EPRSG/CPNf/BVeE50jID0hS0UiKg9OzcLC59cNDl3mJRFzrt4W
   F/fCbOh7MAXh6IcTeyjlBKSqDSsHx+6ToDdg1/6R7JSW4xhMbAkT6mA5s
   3Pknx/JddOtjB65589qtHNLgh5WBuOAsbgh+/xyp6l3SSD5tih6arS1qW
   A==;
X-CSE-ConnectionGUID: 6n7xysxqSy2ePz68JYHH+Q==
X-CSE-MsgGUID: 1jHSiBgSR2K5353U1FDNYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90333333"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="90333333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 16:15:52 -0700
X-CSE-ConnectionGUID: cIoOLh6LSNO50luWEGi98A==
X-CSE-MsgGUID: Fvdc0k+4TwOf2lfixw6aKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="261902962"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2026 16:15:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxBzA-00000000o2v-29kU;
	Thu, 20 Aug 2026 23:15:48 +0000
Date: Fri, 21 Aug 2026 07:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_aops.c:665 xfs_zoned_writeback_submit() warn:
 bitwise AND condition is false here
Message-ID: <202608210755.0RuTKJXP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 6bbb4d96f797d42d4baef1691a27a62275727146 xfs: support T10 protection information
date:   5 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 5 months ago
config: hexagon-randconfig-r071-20260821 (https://download.01.org/0day-ci/archive/20260821/202608210755.0RuTKJXP-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6bbb4d96f797 ("xfs: support T10 protection information")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608210755.0RuTKJXP-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_aops.c:665 xfs_zoned_writeback_submit() warn: bitwise AND condition is false here

vim +665 fs/xfs/xfs_aops.c

fb7399cf2d0b33 Christoph Hellwig 2025-07-10  651  
058dd70c65ab73 Christoph Hellwig 2025-02-13  652  static int
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  653  xfs_zoned_writeback_submit(
058dd70c65ab73 Christoph Hellwig 2025-02-13  654  	struct iomap_writepage_ctx	*wpc,
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  655  	int				error)
058dd70c65ab73 Christoph Hellwig 2025-02-13  656  {
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  657  	struct iomap_ioend		*ioend = wpc->wb_ctx;
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  658  
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  659  	ioend->io_bio.bi_end_io = xfs_end_bio;
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  660  	if (error) {
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  661  		ioend->io_bio.bi_status = errno_to_blk_status(error);
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  662  		bio_endio(&ioend->io_bio);
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  663  		return error;
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  664  	}
6bbb4d96f797d4 Christoph Hellwig 2026-02-23 @665  	if (wpc->iomap.flags & IOMAP_F_INTEGRITY)
6bbb4d96f797d4 Christoph Hellwig 2026-02-23  666  		fs_bio_integrity_generate(&ioend->io_bio);
f4fa7981fa26c6 Christoph Hellwig 2025-07-10  667  	xfs_zone_alloc_and_submit(ioend, &XFS_ZWPC(wpc)->open_zone);
058dd70c65ab73 Christoph Hellwig 2025-02-13  668  	return 0;
058dd70c65ab73 Christoph Hellwig 2025-02-13  669  }
058dd70c65ab73 Christoph Hellwig 2025-02-13  670  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
