Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFABA13D539
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778211309; cv=none; b=dKApCJkn2EFv2eYEcxd44dHlLNwAN//QO96/sx+DNRHG6fcANOExvdR8nHWoC/yEt7clH9DWxOtLXlpZImtXNA8GR36iZ5AS2dDvpr4zRYziByLwTBoJfB7+iEOzCNgSSfCnoUhqUXycJVAutB20H+zBjVCpeQa4nxopRj0dV40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778211309; c=relaxed/simple;
	bh=b7DxStvzWG0D+0FhNNPquyxPqyx3iCSk/y6SkF0+3Uk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n4o7DPCqMZDThZF+zpHfVjQwChDXATr3JinkYNAj5Z9EmI369YuvneOu1t0CdNPv81iss/SmZ9CS0vZS56l6I4wH/6rXpny9dRLxMWL8SzSpysTfbhoVleYUJ6R3gqORZglDzw3J7IxUtlAUXzT72x3Dlgmacr8Wpl7r2ruOZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7ZT4fDB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7ZT4fDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778211307; x=1809747307;
  h=date:from:to:cc:subject:message-id;
  bh=b7DxStvzWG0D+0FhNNPquyxPqyx3iCSk/y6SkF0+3Uk=;
  b=K7ZT4fDBc/TOT0pGSTSteOmhCAuwfZlgAAfkGsqk5DzLIEmxnHb6hXPl
   ge1GhjFBxy126TrxKeXA/RuWIe+D9aRemqT7VQAXYFbwIbkFngxL8DiiX
   wXCw/Yb0bxkKUOmbc+Hk+bSIwfCiAzgXc+twq0b0eOU4DVSvuCyPp3Y8j
   xWHPHkwkm+cxqFyzIrH1aujxIo8WdfKtPFZ8Wu3/8CKiRHbWomr1PECFx
   HDl0odvxuk1KTIaazLWWIyCSLBWIpuRG9eQesYar0AvQFDSaMiuv++Tba
   SQwRYz6BiLqmiUUH3K4HHV+v4iG/p2ktoir7i+hYX3VhohIdapwDy9A9/
   g==;
X-CSE-ConnectionGUID: L7u/Zt+kSISK/p64A4d2Gg==
X-CSE-MsgGUID: X8spqn+lSnmzZQLtl6lHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79030094"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79030094"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 20:35:07 -0700
X-CSE-ConnectionGUID: Sc5wTFaGSQSLyZg0TWm2vQ==
X-CSE-MsgGUID: JPF/Hj24SICKDV54BbrI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="236584120"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2026 20:35:06 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLBzT-000000000kj-2Dhs;
	Fri, 08 May 2026 03:35:03 +0000
Date: Fri, 08 May 2026 11:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_aops.c:665 xfs_zoned_writeback_submit() warn:
 bitwise AND condition is false here
Message-ID: <202605081108.wSTy5QEA-lkp@intel.com>
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
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: 6bbb4d96f797d42d4baef1691a27a62275727146 xfs: support T10 protection information
date:   8 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081108.wSTy5QEA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6bbb4d96f797 ("xfs: support T10 protection information")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605081108.wSTy5QEA-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_aops.c:665 xfs_zoned_writeback_submit() warn: bitwise AND condition is false here

vim +665 fs/xfs/xfs_aops.c

fb7399cf2d0b338 Christoph Hellwig 2025-07-10  651  
058dd70c65ab736 Christoph Hellwig 2025-02-13  652  static int
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  653  xfs_zoned_writeback_submit(
058dd70c65ab736 Christoph Hellwig 2025-02-13  654  	struct iomap_writepage_ctx	*wpc,
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  655  	int				error)
058dd70c65ab736 Christoph Hellwig 2025-02-13  656  {
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  657  	struct iomap_ioend		*ioend = wpc->wb_ctx;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  658  
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  659  	ioend->io_bio.bi_end_io = xfs_end_bio;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  660  	if (error) {
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  661  		ioend->io_bio.bi_status = errno_to_blk_status(error);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  662  		bio_endio(&ioend->io_bio);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  663  		return error;
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  664  	}
6bbb4d96f797d42 Christoph Hellwig 2026-02-23 @665  	if (wpc->iomap.flags & IOMAP_F_INTEGRITY)
6bbb4d96f797d42 Christoph Hellwig 2026-02-23  666  		fs_bio_integrity_generate(&ioend->io_bio);
f4fa7981fa26c66 Christoph Hellwig 2025-07-10  667  	xfs_zone_alloc_and_submit(ioend, &XFS_ZWPC(wpc)->open_zone);
058dd70c65ab736 Christoph Hellwig 2025-02-13  668  	return 0;
058dd70c65ab736 Christoph Hellwig 2025-02-13  669  }
058dd70c65ab736 Christoph Hellwig 2025-02-13  670  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
