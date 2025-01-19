Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7041885A1
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737320545; cv=none; b=XCbpinYYFl7kLJoWXvDsa6C6UKSoWcyePpsvujggyoS/3vg0NFlDbwhnOnSglsmi2mGSeXsdavVEguZJIjtt8YHq3ZUP7D6tDue4ZDHBGrqaW1y8Vr0c9nsQT81k2iuUdKEgs1sIKUPcdZ92TpSQB1pPG+0jLT8qy9fcsKwsygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737320545; c=relaxed/simple;
	bh=b8nRoK3hLxOAoQk7kpcWyUhq/GuKj/4qfkCIxqII/i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgDr2lywIVTioMarHF2fyvzHFtBuXOa6TF6ucdceeFlyemXLSyG1eqZMxMWb0yYi41RLmB0iNH9WnAW2OmpcKysSymSpVWHfhtMLAVlcc9RZVYZFREyWdzH7pzwOmLlYfMqdiJcZ8cnWt2QCO/8J/I1IiNjVGnwOrYX5JFLfPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijy2Lwzs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijy2Lwzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737320543; x=1768856543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8nRoK3hLxOAoQk7kpcWyUhq/GuKj/4qfkCIxqII/i4=;
  b=ijy2LwzsdHufMSDRJ6D/gyYYOVUfSfs22wQZaOSYFk2vn0FmKfs1BnRj
   FVYnV3Kt9JC8zbrbIi9dWpKmVez8+3NwdQbCt+QoMb3v7KjM5WF0Ip1jm
   y9SAs9TkmGw+wJ273nEo/qyw3gRXhaMVt5AfwgQiQPRk7FE5XU/p261Nh
   RdUmxggHCQBEFFE899ib/5FrzKWUFi6YZs5K2COgWU9weZFhCM5RS8J7x
   zjrTNnBO2aUtdgwb4C+G383ZJH01Uv483jYxZDfMk6eXovUURRtvnyUDf
   F+L+Kk7r3EVb0hAab6gD8BIP2qf5dclulj1ZwAKqecov8x/PBqecRQrfC
   Q==;
X-CSE-ConnectionGUID: dTT86Er4Q7OU7+EN5YmqXw==
X-CSE-MsgGUID: fBrTOHbYQburgNe0/ZlqHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="25279589"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="25279589"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 13:02:22 -0800
X-CSE-ConnectionGUID: ieTcFrgDScy313YQ66cB1Q==
X-CSE-MsgGUID: 1nregC5TTHSvoSixRgbPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111278643"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2025 13:02:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZcR0-000VqN-2d;
	Sun, 19 Jan 2025 21:02:18 +0000
Date: Mon, 20 Jan 2025 05:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xiang-erofs:dev-test 8/10] fs/erofs/zdata.c:554
 z_erofs_bind_cache() error: uninitialized symbol 'newfolio'.
Message-ID: <202501200425.hQ3emWTb-lkp@intel.com>
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
CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs@lists.ozlabs.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   6e2c2342e2b608264cf763a27410295b05995191
commit: e180b8c4c23beb876927a999c49c18b361fa7975 [8/10] erofs: convert z_erofs_bind_cache() to folios
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r073-20250119 (https://download.01.org/0day-ci/archive/20250120/202501200425.hQ3emWTb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501200425.hQ3emWTb-lkp@intel.com/

New smatch warnings:
fs/erofs/zdata.c:554 z_erofs_bind_cache() error: uninitialized symbol 'newfolio'.

Old smatch warnings:
fs/erofs/zdata.c:1028 z_erofs_scan_folio() error: we previously assumed 'f->pcl' could be null (see line 1024)

vim +/newfolio +554 fs/erofs/zdata.c

1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  512  
6f435e94a19ad2 fs/erofs/zdata.c                  Gao Xiang 2025-01-14  513  static void z_erofs_bind_cache(struct z_erofs_frontend *fe)
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  514  {
6f39d1e1ca4678 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  515  	struct address_space *mc = MNGD_MAPPING(EROFS_I_SB(fe->inode));
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  516  	struct z_erofs_pcluster *pcl = fe->pcl;
54ed3fdd66055d fs/erofs/zdata.c                  Gao Xiang 2023-12-06  517  	unsigned int pclusterpages = z_erofs_pclusterpages(pcl);
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  518  	bool shouldalloc = z_erofs_should_alloc_cache(fe);
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  519  	bool may_bypass = true;
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  520  	/* Optimistic allocation, as in-place I/O can be used as a fallback */
1825c8d7ce93c4 fs/erofs/zdata.c                  Gao Xiang 2020-12-09  521  	gfp_t gfp = (mapping_gfp_mask(mc) & ~__GFP_DIRECT_RECLAIM) |
1825c8d7ce93c4 fs/erofs/zdata.c                  Gao Xiang 2020-12-09  522  			__GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  523  	struct folio *folio, *newfolio;
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  524  	unsigned int i;
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-12-08  525  
cc4b2dd95f0d1e fs/erofs/zdata.c                  Gao Xiang 2024-01-25  526  	if (i_blocksize(fe->inode) != PAGE_SIZE ||
cc4b2dd95f0d1e fs/erofs/zdata.c                  Gao Xiang 2024-01-25  527  	    fe->mode < Z_EROFS_PCLUSTER_FOLLOWED)
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-12-08  528  		return;
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  529  
54ed3fdd66055d fs/erofs/zdata.c                  Gao Xiang 2023-12-06  530  	for (i = 0; i < pclusterpages; ++i) {
cc4b2dd95f0d1e fs/erofs/zdata.c                  Gao Xiang 2024-01-25  531  		/* Inaccurate check w/o locking to avoid unneeded lookups */
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  532  		if (READ_ONCE(pcl->compressed_bvecs[i].page))
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  533  			continue;
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  534  
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  535  		folio = filemap_get_folio(mc, pcl->index + i);
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  536  		if (IS_ERR(folio)) {
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  537  			may_bypass = false;
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  538  			if (!shouldalloc)
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  539  				continue;
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  540  
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  541  			/*
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  542  			 * Allocate a managed folio for cached I/O, or it may be
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  543  			 * then filled with a file-backed folio for in-place I/O
1282dea37b0908 fs/erofs/zdata.c                  Gao Xiang 2022-12-06  544  			 */
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  545  			newfolio = filemap_alloc_folio(gfp, 0);
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  546  			if (!newfolio)
0b964600d3aae5 fs/erofs/zdata.c                  Gao Xiang 2021-03-22  547  				continue;
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  548  			newfolio->private = Z_EROFS_PREALLOCATED_FOLIO;
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  549  			folio = NULL;
0b964600d3aae5 fs/erofs/zdata.c                  Gao Xiang 2021-03-22  550  		}
bf1aa03980f4eb fs/erofs/zdata.c                  Gao Xiang 2024-10-21  551  		spin_lock(&pcl->lockref.lock);
cc4b2dd95f0d1e fs/erofs/zdata.c                  Gao Xiang 2024-01-25  552  		if (!pcl->compressed_bvecs[i].page) {
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  553  			pcl->compressed_bvecs[i].page =
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14 @554  				folio_page(folio ?: newfolio, 0);
bf1aa03980f4eb fs/erofs/zdata.c                  Gao Xiang 2024-10-21  555  			spin_unlock(&pcl->lockref.lock);
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  556  			continue;
cc4b2dd95f0d1e fs/erofs/zdata.c                  Gao Xiang 2024-01-25  557  		}
bf1aa03980f4eb fs/erofs/zdata.c                  Gao Xiang 2024-10-21  558  		spin_unlock(&pcl->lockref.lock);
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  559  		folio_put(folio ?: newfolio);
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  560  	}
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-12-08  561  
0b964600d3aae5 fs/erofs/zdata.c                  Gao Xiang 2021-03-22  562  	/*
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  563  	 * Don't perform in-place I/O if all compressed pages are available in
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  564  	 * the managed cache, as the pcluster can be moved to the bypass queue.
0b964600d3aae5 fs/erofs/zdata.c                  Gao Xiang 2021-03-22  565  	 */
e180b8c4c23beb fs/erofs/zdata.c                  Gao Xiang 2025-01-14  566  	if (may_bypass)
db166fc2020d30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  567  		fe->mode = Z_EROFS_PCLUSTER_FOLLOWED_NOINPLACE;
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  568  }
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
