Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90372C324C
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765480127; cv=none; b=u1L+GydzRaAczPi1sYRZuQ7sJzJ2m4zwGybOciXrpzahVlIoK8xn28LQ9D7cBj6h2E00eQP7vYeKQakfiYSfIuP0WU/QF6BBc/K+3sECEvibQnWutXHtSSgCLo4KDbabxyv3WTAGWHi+iiDRALGF/wBK7kohGFNR3lNLVfoGzVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765480127; c=relaxed/simple;
	bh=K5wOBYhke53v6j4lwpQTvNC3FqBc1b3SfqfnH580hqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bT3m9UlM4ABpaggeHbPwWGlS9FVCpcQZSt6JMZWWqxff6IOaCp75iwlF0baFEL0SJK5ItjTVeHaqd3gCTlmzgQ9bCdxmjOdGBrmUC5RFMo4rJqYz8Cd68TxCnAFUsIj9bwacsYhrIICharFOPbpUV3OAMwzjUV5zGiFvNqlZx7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXnajyYC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXnajyYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765480126; x=1797016126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5wOBYhke53v6j4lwpQTvNC3FqBc1b3SfqfnH580hqI=;
  b=cXnajyYCBZxK/lvBWg1mOUBsrTup4UhKyztFfTh4xPOBCaB4bCAVP5Sx
   QsGP7cTO9aiLjuDYY/zq9Qbsph81BYup9DaV1AxSd/SnMQuxUkiJ5q07p
   qO/JRdA3rSFX1bbpAiz5kdPKiHKK0JD0Q+yzY8CEZfjSHQ8woOwxcgVnC
   lpP0/Wkj/KDUjR4iFlncQAIw0oqHvzxlPixHnWG23je8tovcDTlm47aua
   cRbHxqkZ2XSkhilmbzd+NMgk8DZDclHjuz/M74qqUGXQD/AtWUm23B0AF
   yPe2/OjCLlhcpKApW4114zpTohbnP9CLw+lCiDZUBt3MFIyCRqDemUGc7
   g==;
X-CSE-ConnectionGUID: Q43DoYmbQnud5ipltPNIpw==
X-CSE-MsgGUID: YdiGDw+LQved5MyWmYUMpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78935238"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78935238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:08:44 -0800
X-CSE-ConnectionGUID: 6gCI/YhBR7KnP+AXhwz21w==
X-CSE-MsgGUID: kLGunr82TkSBUwXhxCvdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196164313"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 11:08:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTm1n-000000004zn-3fu4;
	Thu, 11 Dec 2025 19:08:39 +0000
Date: Fri, 12 Dec 2025 03:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/afs/dir.c:499 afs_dir_iterate_contents() warn: 'i_size' unsigned
 <= 0
Message-ID: <202512120223.iPcGtRZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 6dd80936618c4ff852d4db73aca400351d9bd9f0 afs: Use netfslib for directories
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: nios2-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120223.iPcGtRZD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120223.iPcGtRZD-lkp@intel.com/

smatch warnings:
fs/afs/dir.c:499 afs_dir_iterate_contents() warn: 'i_size' unsigned <= 0

vim +/i_size +499 fs/afs/dir.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  485  
6dd80936618c4ff David Howells  2024-12-16  486  /*
6dd80936618c4ff David Howells  2024-12-16  487   * Iterate through the directory folios.
6dd80936618c4ff David Howells  2024-12-16  488   */
6dd80936618c4ff David Howells  2024-12-16  489  static int afs_dir_iterate_contents(struct inode *dir, struct dir_context *dir_ctx)
6dd80936618c4ff David Howells  2024-12-16  490  {
6dd80936618c4ff David Howells  2024-12-16  491  	struct afs_dir_iteration_ctx ctx = { .dir_ctx = dir_ctx };
6dd80936618c4ff David Howells  2024-12-16  492  	struct afs_vnode *dvnode = AFS_FS_I(dir);
6dd80936618c4ff David Howells  2024-12-16  493  	struct iov_iter iter;
6dd80936618c4ff David Howells  2024-12-16  494  	unsigned long long i_size = i_size_read(dir);
^1da177e4c3f415 Linus Torvalds 2005-04-16  495  
6dd80936618c4ff David Howells  2024-12-16  496  	/* Round the file position up to the next entry boundary */
6dd80936618c4ff David Howells  2024-12-16  497  	dir_ctx->pos = round_up(dir_ctx->pos, sizeof(union afs_xdr_dirent));
^1da177e4c3f415 Linus Torvalds 2005-04-16  498  
6dd80936618c4ff David Howells  2024-12-16 @499  	if (i_size <= 0 || dir_ctx->pos >= i_size)
6dd80936618c4ff David Howells  2024-12-16  500  		return 0;
6dd80936618c4ff David Howells  2024-12-16  501  
6dd80936618c4ff David Howells  2024-12-16  502  	iov_iter_folio_queue(&iter, ITER_SOURCE, dvnode->directory, 0, 0, i_size);
6dd80936618c4ff David Howells  2024-12-16  503  	iov_iter_advance(&iter, round_down(dir_ctx->pos, AFS_DIR_BLOCK_SIZE));
6dd80936618c4ff David Howells  2024-12-16  504  
6dd80936618c4ff David Howells  2024-12-16  505  	iterate_folioq(&iter, iov_iter_count(&iter), dvnode, &ctx,
6dd80936618c4ff David Howells  2024-12-16  506  		       afs_dir_iterate_step);
^1da177e4c3f415 Linus Torvalds 2005-04-16  507  
6dd80936618c4ff David Howells  2024-12-16  508  	if (ctx.error == -ESTALE)
6dd80936618c4ff David Howells  2024-12-16  509  		afs_invalidate_dir(dvnode, afs_dir_invalid_iter_stale);
6dd80936618c4ff David Howells  2024-12-16  510  	return ctx.error;
^1da177e4c3f415 Linus Torvalds 2005-04-16  511  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  512  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
