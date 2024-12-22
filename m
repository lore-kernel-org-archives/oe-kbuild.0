Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4C2CA9
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734836179; cv=none; b=Dv3RXzUmlMA8pwKR7MwaORntUS5FebYLhyVZWHHNd5nG0jQ+CBTAR6JOZuMSBe828BGz2jXCEOrT5QUREQwTqbIwqCbw7EJKt+K93OQJhxZ5qbm5D/SLqFIpDCT93Lf7KzZg8p3v52Z1h8eAXa7kyW5OCgcnTe5SVM9+I71dzhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734836179; c=relaxed/simple;
	bh=HgfhSuvTXwozDX0eh0/xozM9N1KyiQZY8HJHQDPsKd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F78SDQTkZI5q6I9oA6I9M19XRNyNwE68WPfuKuoxuDPZ/rhuU8o2DH+II1IEvPFr3hV6bFguanUfYoCPZX8gtB1RkjmeKGEWTSLtg7NHh9nDhAZHB7rvvXOvsBoAc/z+YG1Y6ww1+m27iqIt4Hyawm+u1CQEQJePGYJt393kDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xeg7mtsI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xeg7mtsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734836178; x=1766372178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgfhSuvTXwozDX0eh0/xozM9N1KyiQZY8HJHQDPsKd8=;
  b=Xeg7mtsIqRdKAvPdSt03qAFqRT7/Ydwy9QBnPLhtISeLXfuax/nmxFNK
   zYNK2Sj7ZxD1/oZrjtw3jzD7q5JN+7Y4zoH8vLpjsq3rhlk4n1eznvA+x
   0m907o1BwX+pNmVi7uLEN2Xet1Io3PhdaAHz+ZSsg3yU2KkhksQNs2Ezp
   4doS6En0INMiLTIocv9guSYJwdmk+NCdcExcodCWFGJQr1jINZLJvgkS/
   /F9TaUdxkJsvnRdrt372DlZwZcJmoez/rhVcIZm4ZtAeI5GwrRFgnqFpx
   TNWnuKkDGSSIxs7LXmsWzf1XLZ2LiYOvYf+wxt8SRwPyU+Bg3Z/B1BZ3t
   w==;
X-CSE-ConnectionGUID: og02npdZQxuKPWWhHpmWAw==
X-CSE-MsgGUID: iqLxmOANS+SuEE6AWK4h4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35052125"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35052125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:56:18 -0800
X-CSE-ConnectionGUID: HnGizYi2Smig2cUjYCUclQ==
X-CSE-MsgGUID: Aq4nHWeYS9KusprEq8viFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103848785"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2024 18:56:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPC8b-0002hV-34;
	Sun, 22 Dec 2024 02:56:13 +0000
Date: Sun, 22 Dec 2024 10:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:zoned 140/144] fs/xfs/libxfs/xfs_zones.c:164
 xfs_zone_validate() warn: signedness bug returning '(-5)'
Message-ID: <202412221007.JUrl8Z6K-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git zoned
head:   e438c133cc544cff3b44f8c3fde87a8ab5f8a3de
commit: 89f3e23cc043cf574275ea94a8f126eb4c806fc3 [140/144] xfs: support zone gaps
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221007.JUrl8Z6K-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412221007.JUrl8Z6K-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_zones.c:164 xfs_zone_validate() warn: signedness bug returning '(-5)'

vim +164 fs/xfs/libxfs/xfs_zones.c

39f9a996878403 Christoph Hellwig 2024-12-19  131  
39f9a996878403 Christoph Hellwig 2024-12-19  132  bool
39f9a996878403 Christoph Hellwig 2024-12-19  133  xfs_zone_validate(
39f9a996878403 Christoph Hellwig 2024-12-19  134  	struct blk_zone		*zone,
39f9a996878403 Christoph Hellwig 2024-12-19  135  	struct xfs_rtgroup	*rtg,
39f9a996878403 Christoph Hellwig 2024-12-19  136  	xfs_rgblock_t		*write_pointer)
39f9a996878403 Christoph Hellwig 2024-12-19  137  {
39f9a996878403 Christoph Hellwig 2024-12-19  138  	struct xfs_mount	*mp = rtg_mount(rtg);
39f9a996878403 Christoph Hellwig 2024-12-19  139  	struct xfs_groups	*g = &mp->m_groups[XG_TYPE_RTG];
89f3e23cc043cf Christoph Hellwig 2024-12-19  140  	uint32_t		expected_size;
39f9a996878403 Christoph Hellwig 2024-12-19  141  
39f9a996878403 Christoph Hellwig 2024-12-19  142  	/*
39f9a996878403 Christoph Hellwig 2024-12-19  143  	 * Check that the zone capacity matches the rtgroup size stored in the
39f9a996878403 Christoph Hellwig 2024-12-19  144  	 * superblock.  Note that all zones including the last one must have a
39f9a996878403 Christoph Hellwig 2024-12-19  145  	 * uniform capacity.
39f9a996878403 Christoph Hellwig 2024-12-19  146  	 */
39f9a996878403 Christoph Hellwig 2024-12-19  147  	if (XFS_BB_TO_FSB(mp, zone->capacity) != g->blocks) {
39f9a996878403 Christoph Hellwig 2024-12-19  148  		xfs_warn(mp,
39f9a996878403 Christoph Hellwig 2024-12-19  149  "zone %u capacity (0x%llx) does not match RT group size (0x%x).",
39f9a996878403 Christoph Hellwig 2024-12-19  150  			rtg_rgno(rtg), XFS_BB_TO_FSB(mp, zone->capacity),
39f9a996878403 Christoph Hellwig 2024-12-19  151  			g->blocks);
39f9a996878403 Christoph Hellwig 2024-12-19  152  		return false;
39f9a996878403 Christoph Hellwig 2024-12-19  153  	}
39f9a996878403 Christoph Hellwig 2024-12-19  154  
89f3e23cc043cf Christoph Hellwig 2024-12-19  155  	if (g->has_daddr_gaps) {
89f3e23cc043cf Christoph Hellwig 2024-12-19  156  		expected_size = 1 << g->blklog;
89f3e23cc043cf Christoph Hellwig 2024-12-19  157  	} else {
89f3e23cc043cf Christoph Hellwig 2024-12-19  158  		if (zone->len != zone->capacity) {
89f3e23cc043cf Christoph Hellwig 2024-12-19  159  			xfs_warn(mp,
89f3e23cc043cf Christoph Hellwig 2024-12-19  160  "zone %u has capacity != size ((0x%llx vs 0x%llx)",
89f3e23cc043cf Christoph Hellwig 2024-12-19  161  				rtg_rgno(rtg),
89f3e23cc043cf Christoph Hellwig 2024-12-19  162  				XFS_BB_TO_FSB(mp, zone->len),
89f3e23cc043cf Christoph Hellwig 2024-12-19  163  				XFS_BB_TO_FSB(mp, zone->capacity));
89f3e23cc043cf Christoph Hellwig 2024-12-19 @164  			return -EIO;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
