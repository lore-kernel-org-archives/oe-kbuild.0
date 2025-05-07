Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF62147FC
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613596; cv=none; b=sFfQEjJ2fj/uY6k3/L0Bvq9Y4kue2O9AkZ9q0dBqqSXXrO07bLAmduFzOU83loAEzD9J2G+J9GFgA4Uus/wu//zYim+y5X3dcIhMTUaUxQz16oQT1Vssbzo6o9ffVjPZJSurQYueC4a8TEwy0wbBZ/xpwd/t/Z2/7x/aUhoHO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613596; c=relaxed/simple;
	bh=t8FMpGCqTaVVIo8x5qieaGRFoOtJnVWB7K+kqLoswRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSmfMhe4kdBUeogTJSAjkj2IwYvIVNSSZeD5ba6fEVP0ljng82vwDUJQVp+8uF/PZf0aF3n8x3tUjUVuMQ7n3kNz/+dufzu1gtfVWxXOeY804TmXDDeWGO5J31MhgzR1BRvyDz4/I0Lr7qBIGyvXREioOHLiImNTOzXpIOMBUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhgEegRf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhgEegRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746613595; x=1778149595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8FMpGCqTaVVIo8x5qieaGRFoOtJnVWB7K+kqLoswRQ=;
  b=mhgEegRf1QcI/TNGP2YnQl6G4MyL3YJpOG7FJmUaTLQZ+xH/rDqLCBEM
   g05pOc0uDekzzWAiBu+kCI8ZvFkhCmeBZ0C3LdWKY21n0sFBhxaE2o37K
   PX62y6VG5aXuOMPSLvpK2edoCown3knR4RNEqQlvtjWgZ4eDufk/JICMv
   qadOdz+l+/xESuiAwlS2x3/fHSXHuiUKnuqyHIRADMwrY/0qpeeiJArfY
   XkZCMDe3nhZEX9r9FvNfxB3hFJ4EGs6Y3XbC4gY8lS3czMozxxTIIlLZT
   +scZTYLXn+SqTFFklmoqhiw1RM1bLT0N99kYakzhgdgd2av4QkbTFcu8f
   A==;
X-CSE-ConnectionGUID: kKGkZZuWSjaqrSnvyl3fIw==
X-CSE-MsgGUID: ihWvhYjsT7abCF24jZjYZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48484145"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48484145"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:26:14 -0700
X-CSE-ConnectionGUID: NJzlXPFmS6WFe4+pWmsRqw==
X-CSE-MsgGUID: ssdb2FwxSD2TrDDtroAGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135819771"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:26:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbyc-0007bG-33;
	Wed, 07 May 2025 10:26:10 +0000
Date: Wed, 7 May 2025 18:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-ID: <202505071850.XaOkcCkX-lkp@intel.com>
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
TO: Shivank Garg <shivankg@amd.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 39ed4d1a0e03ce3ac2145ee7ef0714c78bae9c61 [7893/8235] jfs: implement migrate_folio for jfs_metapage_aops
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071850.XaOkcCkX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505071850.XaOkcCkX-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_metapage.c:245 __metapage_migrate_folio() error: we previously assumed 'mp' could be null (see line 235)

vim +/mp +245 fs/jfs/jfs_metapage.c

7fab479bebb96b Dave Kleikamp 2005-05-02  226  
39ed4d1a0e03ce Shivank Garg  2025-04-30  227  static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
39ed4d1a0e03ce Shivank Garg  2025-04-30  228  				    struct folio *src, enum migrate_mode mode)
39ed4d1a0e03ce Shivank Garg  2025-04-30  229  {
39ed4d1a0e03ce Shivank Garg  2025-04-30  230  	struct metapage *mp;
39ed4d1a0e03ce Shivank Garg  2025-04-30  231  	int page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  232  	int rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  233  
39ed4d1a0e03ce Shivank Garg  2025-04-30  234  	mp = folio_to_mp(src, 0);
39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
39ed4d1a0e03ce Shivank Garg  2025-04-30  236  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  237  
39ed4d1a0e03ce Shivank Garg  2025-04-30  238  	rc = filemap_migrate_folio(mapping, dst, src, mode);
39ed4d1a0e03ce Shivank Garg  2025-04-30  239  	if (rc != MIGRATEPAGE_SUCCESS)
39ed4d1a0e03ce Shivank Garg  2025-04-30  240  		return rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  241  
39ed4d1a0e03ce Shivank Garg  2025-04-30  242  	if (unlikely(insert_metapage(dst, mp)))
39ed4d1a0e03ce Shivank Garg  2025-04-30  243  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  244  
39ed4d1a0e03ce Shivank Garg  2025-04-30 @245  	page_offset = mp->data - folio_address(src);
39ed4d1a0e03ce Shivank Garg  2025-04-30  246  	mp->data = folio_address(dst) + page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  247  	mp->folio = dst;
39ed4d1a0e03ce Shivank Garg  2025-04-30  248  	remove_metapage(src, mp);
39ed4d1a0e03ce Shivank Garg  2025-04-30  249  
39ed4d1a0e03ce Shivank Garg  2025-04-30  250  	return MIGRATEPAGE_SUCCESS;
39ed4d1a0e03ce Shivank Garg  2025-04-30  251  }
39ed4d1a0e03ce Shivank Garg  2025-04-30  252  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
