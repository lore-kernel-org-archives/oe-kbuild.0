Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8982DC786
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977727; cv=none; b=QEDnbPwrtxRRwJ6MtOFm+YVsxk9L4Lb1n492iO3morcHiyavPsDfo3lwTmCWJrH5mXD28gYvjyAXlLDzGRcrPLPA8qOyY/W8Myg7qiZd7EPADTSNrqqrVveVFCrsN3g1MpI7RbmISEYBow4xFnoyw59BJ/bq6enILjJ+zty0uXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977727; c=relaxed/simple;
	bh=dfexrW4nez7MxsueaqX2SboUJPMJafnyVZVNHvA34f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+MVPQnCDIShKmP7pXq80XPr4//zTNebflRtL6nh/JBQlEwx7lxvJTW+h+TkOaUW4MzQDrirgOuFSkTDz62c6ynf2GEZX9zKsk3ab+kttx7fIIMQYl5t/oxaEPaOtWlNA1Xbz2INn8mMuGUraC5E1rQwtY6u/hKgbw7UqE03FMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEmxhtnW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEmxhtnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745977726; x=1777513726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfexrW4nez7MxsueaqX2SboUJPMJafnyVZVNHvA34f4=;
  b=aEmxhtnWuQkgA13DrItJaszbCikkVZAApiTeP4RKSvnco9UnhLU/4cNc
   1KQLI3fMFLfJUqcDgwKwL8ENnNDpqWcJyT4qbW3HWxqiGMeJMo6/nL4aR
   Z0aZb6RcY55jxVMyaD8eiDaHv2TwRmIzfgDnQq59YosKUkzJ6vycNB737
   M4v9DEZjba7VTHu+GE3kSMDLndhV7YtBmAW+qJ5kCnlItWkUkuUNTw/9+
   hpl6VUJYd78XwsVkhrDPpL3dV9bKVmSW24Kdjyjsnol63Px+qgV5NDHUk
   vQ9eXAjcGtbR5fix9pQN/o3tnFPYWpxmraYwOnlLDLFTWmCG02zAJxpZ3
   g==;
X-CSE-ConnectionGUID: lB27Ie98S8aO9J5oiUxWqA==
X-CSE-MsgGUID: okVhIMZUT3Gmnh+fncOsCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51440149"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51440149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:48:44 -0700
X-CSE-ConnectionGUID: Yoj8NYXpQ++9yVF48JzfQw==
X-CSE-MsgGUID: 8QbOnRwCS0i8kbeoQp5XkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133926046"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 18:48:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9wYy-00035Q-1l;
	Wed, 30 Apr 2025 01:48:40 +0000
Date: Wed, 30 Apr 2025 09:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ceph/addr.c:1283:10-17: ERROR: PTR_ERR applied after
 initialization to constant on line 1282
Message-ID: <202504300933.l6UNPehu-lkp@intel.com>
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
TO: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
commit: ce80b76dd32764cc914975777e058d4fae4f0ea0 ceph: introduce ceph_process_folio_batch() method
date:   9 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 weeks ago
config: arc-randconfig-r063-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300933.l6UNPehu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504300933.l6UNPehu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ceph/addr.c:1283:10-17: ERROR: PTR_ERR applied after initialization to constant on line 1282

vim +1283 fs/ceph/addr.c

ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1254  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1255  static inline
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1256  int ceph_move_dirty_page_in_page_array(struct address_space *mapping,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1257  					struct writeback_control *wbc,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1258  					struct ceph_writeback_ctl *ceph_wbc,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1259  					struct page *page)
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1260  {
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1261  	struct inode *inode = mapping->host;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1262  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1263  	struct ceph_client *cl = fsc->client;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1264  	struct page **pages = ceph_wbc->pages;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1265  	unsigned int index = ceph_wbc->locked_pages;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1266  	gfp_t gfp_flags = ceph_wbc->locked_pages ? GFP_NOWAIT : GFP_NOFS;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1267  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1268  	if (IS_ENCRYPTED(inode)) {
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1269  		pages[index] = fscrypt_encrypt_pagecache_blocks(page,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1270  								PAGE_SIZE,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1271  								0,
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1272  								gfp_flags);
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1273  		if (IS_ERR(pages[index])) {
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1274  			if (PTR_ERR(pages[index]) == -EINVAL) {
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1275  				pr_err_client(cl, "inode->i_blkbits=%hhu\n",
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1276  						inode->i_blkbits);
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1277  			}
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1278  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1279  			/* better not fail on first page! */
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1280  			BUG_ON(ceph_wbc->locked_pages == 0);
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1281  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04 @1282  			pages[index] = NULL;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04 @1283  			return PTR_ERR(pages[index]);
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1284  		}
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1285  	} else {
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1286  		pages[index] = page;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1287  	}
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1288  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1289  	ceph_wbc->locked_pages++;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1290  
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1291  	return 0;
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1292  }
ce80b76dd32764 Viacheslav Dubeyko 2025-02-04  1293  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
