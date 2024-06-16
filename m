Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C112B87
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jun 2024 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718550445; cv=none; b=Xm1bwgdQ5dKInGAcMGlNoIOCwuY/+9vtkpGqnT1yOZBBPgjagnp3ncnpIs4wPmvYlFbfA+LXAxDAzlHzVVGEokVMqTmZ1nobBQE8lD/4Hhz0J5/Mq3T3q68Cg3P9jF+567K2g2c1aseRy9JCOGTmuf3mm5UayW87/YnxqAwe/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718550445; c=relaxed/simple;
	bh=Wd6Ir0rwLIlphZACifyq3u8s6fpbZs7Ga3sSkOyD+c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYbUCeMPXWj1sIN1csdGMaS2pVpRJs0stcPynpsghT5/dZfPuavrHLjPqQr+IaZYgySfH1dDCpjthjz0ZgywBLoBLSmSspIZsnzAMJpRGWMN/kZ+84v29xiUSooSAbhjQescFqJ7FXlAOtDV8I6DphgnswY7W1Esb2h9d6jFt84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebr50Q0X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebr50Q0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718550444; x=1750086444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wd6Ir0rwLIlphZACifyq3u8s6fpbZs7Ga3sSkOyD+c0=;
  b=ebr50Q0XneL/+RF1qztvCXOFVyxARZe8zO29xRyuETVbt+97HEW0SqBF
   orXBeRl81X/9QejmlFlFqZrq97XBVqb6b6OibXcgdg03tCDJW+pJPDNOl
   ykPWfq3Wht7Crfl1TfkCulUT+/cMUDAGwoVJTgZhvgefFbbmqzRop5gib
   gr1OWGQzE3HuKsEWH+MHcHIDwoYawkuyqvGHSo2NLaasX5Zf6BwlysZYH
   59ugHpNRXDXmIvZoyaQa7Dc1lrWDR803pxp0UpWknNk8P6FvCh/ZEK/Nq
   8y+0SMiOEY4EHiDTIaWquNV2vo5kWjxOmQiydabvXxnAUH3Flu23M0MfB
   g==;
X-CSE-ConnectionGUID: VxeBxXhZR2W2pN7zNMhSag==
X-CSE-MsgGUID: PnlgzHByRmSNyAelAg0i9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15109028"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="15109028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 08:07:23 -0700
X-CSE-ConnectionGUID: tFS14V4EQ/2QuLAjzJneUg==
X-CSE-MsgGUID: UGrBPgW6QjOgWsk2jXJ0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="64180524"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2024 08:07:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIrTU-0002wI-18;
	Sun, 16 Jun 2024 15:07:20 +0000
Date: Sun, 16 Jun 2024 23:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] nfs: remove dead code for the old swap over NFS
 implementation
Message-ID: <202406162226.EHq7u0eB-lkp@intel.com>
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
In-Reply-To: <20240615080827.1239935-1-hch@lst.de>
References: <20240615080827.1239935-1-hch@lst.de>
TO: Christoph Hellwig <hch@lst.de>
TO: trondmy@kernel.org
TO: anna@kernel.org
CC: linux-nfs@vger.kernel.org

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.10-rc3]
[cannot apply to next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/nfs-remove-dead-code-for-the-old-swap-over-NFS-implementation/20240615-161031
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240615080827.1239935-1-hch%40lst.de
patch subject: [PATCH] nfs: remove dead code for the old swap over NFS implementation
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240616 (https://download.01.org/0day-ci/archive/20240616/202406162226.EHq7u0eB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406162226.EHq7u0eB-lkp@intel.com/

smatch warnings:
fs/nfs/write.c:737 nfs_inode_remove_request() warn: variable dereferenced before check 'folio' (see line 734)

vim +/folio +737 fs/nfs/write.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  724  
^1da177e4c3f41 Linus Torvalds          2005-04-16  725  /*
89a09141df6ac1 Peter Zijlstra          2007-03-16  726   * Remove a write request from an inode
^1da177e4c3f41 Linus Torvalds          2005-04-16  727   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  728  static void nfs_inode_remove_request(struct nfs_page *req)
^1da177e4c3f41 Linus Torvalds          2005-04-16  729  {
6a6d4644ce935d Scott Mayhew            2023-10-11  730  	struct nfs_inode *nfsi = NFS_I(nfs_page_to_inode(req));
6a6d4644ce935d Scott Mayhew            2023-10-11  731  
20633f042fd090 Weston Andros Adamson   2014-05-15  732  	if (nfs_page_group_sync_on_bit(req, PG_REMOVE)) {
0c493b5cf16e28 Trond Myklebust         2023-01-19  733  		struct folio *folio = nfs_page_to_folio(req->wb_head);
a43a94f57a0e00 Christoph Hellwig       2024-06-15 @734  		struct address_space *mapping = folio->mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  735  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  736) 		spin_lock(&mapping->i_private_lock);
a43a94f57a0e00 Christoph Hellwig       2024-06-15 @737  		if (likely(folio)) {
0c493b5cf16e28 Trond Myklebust         2023-01-19  738  			folio->private = NULL;
0c493b5cf16e28 Trond Myklebust         2023-01-19  739  			folio_clear_private(folio);
0c493b5cf16e28 Trond Myklebust         2023-01-19  740  			clear_bit(PG_MAPPED, &req->wb_head->wb_flags);
29418aa4bd487c Mel Gorman              2012-07-31  741  		}
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  742) 		spin_unlock(&mapping->i_private_lock);
20633f042fd090 Weston Andros Adamson   2014-05-15  743  	}
17089a29a25a3b Weston Andros Adamson   2014-07-11  744  
33ea5aaa87cdae ZhangXiaoxu             2019-09-26  745  	if (test_and_clear_bit(PG_INODE_REF, &req->wb_flags)) {
6a6d4644ce935d Scott Mayhew            2023-10-11  746  		atomic_long_dec(&nfsi->nrequests);
dd1b2026323a2d Jeff Layton             2023-09-19  747  		nfs_release_request(req);
33ea5aaa87cdae ZhangXiaoxu             2019-09-26  748  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  749  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  750  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
