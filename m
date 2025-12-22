Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B6D333440
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426855; cv=none; b=e+5nStTkCfBS/gNWbLkpCZD0Fm6glkRWcgFl7a/11OPqB5/YPVh8DpKTUiWYW2SKrBnSE2eVrmIxtliKT7TMDTdVGBPtL5rDOYFeZDO+FamYWNzOYDo5zU46/EL+t1dRwqxXBss31CS518fml0yIVGM43GMx4O/wx6HKcGl8KN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426855; c=relaxed/simple;
	bh=3mi85ilEhj3pw+e0AwNZDVamOXNAk6FB8RRhPXderyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+xvR2RLmVhKwSp/A27rND752lzgGSjir6GFoT2hi7RRxqrJHjQ5lbmJl4a5W6ewk6n9zX3F3XdzBUI48kB3RHsqUPPWuSb+rldrL7wGHhIhs1cwJCdGMl+NIn0HnO2Ad3JA8ljnQzCUZuvTsaohZaD/lTZmzd8t//3nbKP6Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpKOTtOM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpKOTtOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766426853; x=1797962853;
  h=date:from:to:cc:subject:message-id;
  bh=3mi85ilEhj3pw+e0AwNZDVamOXNAk6FB8RRhPXderyU=;
  b=UpKOTtOM4GhnJm4SRUiK4sGZuIR5dSnczLQTwAyF07xjwEBufOdrCm9o
   rfyDywOdLIdXEN7bsawH979jH2OjNk7JWGoZqu70EcLCJAe/gqxRs5MIg
   291awZi1THOKCV7Daf9kFah5JvQKZ9LXEyts7tDk0zIpBmnxlQyg+gBph
   ejZ2c9hzrIc26vdpJXztJpetyi8u9MPILBxJeDQTyISIKbaTDEShDTcab
   0HlIJtq0kQeNzXlyKt7IBVKgUoOJkj2Bv6qFLTh8fRZjPJAVHOhHo1F9y
   xlk1Tj9t/EuIhxC3vVfLJbHiXpw+9faVJKXDc49ztF6Av1BF+KCMmawLg
   w==;
X-CSE-ConnectionGUID: YUOJDh4PSH6ObBv6AhAdyA==
X-CSE-MsgGUID: yM8885daSCu346b5upoP1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79738457"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79738457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:07:30 -0800
X-CSE-ConnectionGUID: 9z1OnHd/RgaRCOaF4n/zAA==
X-CSE-MsgGUID: V0C4z4jxSvqv2D91S0UAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199494216"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 10:07:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkJa-000000000xl-1XoS;
	Mon, 22 Dec 2025 18:07:26 +0000
Date: Tue, 23 Dec 2025 02:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_rtalloc.c:1268 xfs_growfs_check_rtgeom() warn:
 missing unwind goto?
Message-ID: <202512230141.HX00uSxH-lkp@intel.com>
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
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: dc68c0f601691010dd5ae53442f8523f41a53131 xfs: fix the zoned RT growfs check for zone alignment
date:   5 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r071-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230141.HX00uSxH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230141.HX00uSxH-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1268 xfs_growfs_check_rtgeom() warn: missing unwind goto?

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:333 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:1301 xfs_growfs_rt_prep_groups() warn: impossible condition '(*new_rgcount > ((-1))) => (0-u32max > u32max)'
fs/xfs/xfs_rtalloc.c:1693 xfs_rtmount_inodes() error: uninitialized symbol 'error'.

vim +1268 fs/xfs/xfs_rtalloc.c

e3088ae2dcae3c1 Christoph Hellwig 2024-11-03  1230  
59a57acbce282d5 Darrick J. Wong   2024-11-20  1231  int
bde86b42d2825db Christoph Hellwig 2024-11-03  1232  xfs_growfs_check_rtgeom(
bde86b42d2825db Christoph Hellwig 2024-11-03  1233  	const struct xfs_mount	*mp,
59a57acbce282d5 Darrick J. Wong   2024-11-20  1234  	xfs_rfsblock_t		dblocks,
bde86b42d2825db Christoph Hellwig 2024-11-03  1235  	xfs_rfsblock_t		rblocks,
bde86b42d2825db Christoph Hellwig 2024-11-03  1236  	xfs_extlen_t		rextsize)
bde86b42d2825db Christoph Hellwig 2024-11-03  1237  {
59a57acbce282d5 Darrick J. Wong   2024-11-20  1238  	xfs_extlen_t		min_logfsbs;
bde86b42d2825db Christoph Hellwig 2024-11-03  1239  	struct xfs_mount	*nmp;
bde86b42d2825db Christoph Hellwig 2024-11-03  1240  
bde86b42d2825db Christoph Hellwig 2024-11-03  1241  	nmp = xfs_growfs_rt_alloc_fake_mount(mp, rblocks, rextsize);
bde86b42d2825db Christoph Hellwig 2024-11-03  1242  	if (!nmp)
bde86b42d2825db Christoph Hellwig 2024-11-03  1243  		return -ENOMEM;
59a57acbce282d5 Darrick J. Wong   2024-11-20  1244  	nmp->m_sb.sb_dblocks = dblocks;
59a57acbce282d5 Darrick J. Wong   2024-11-20  1245  
59a57acbce282d5 Darrick J. Wong   2024-11-20  1246  	xfs_rtrmapbt_compute_maxlevels(nmp);
88a70768df138b9 Darrick J. Wong   2024-11-20  1247  	xfs_rtrefcountbt_compute_maxlevels(nmp);
59a57acbce282d5 Darrick J. Wong   2024-11-20  1248  	xfs_trans_resv_calc(nmp, M_RES(nmp));
bde86b42d2825db Christoph Hellwig 2024-11-03  1249  
bde86b42d2825db Christoph Hellwig 2024-11-03  1250  	/*
bde86b42d2825db Christoph Hellwig 2024-11-03  1251  	 * New summary size can't be more than half the size of the log.  This
bde86b42d2825db Christoph Hellwig 2024-11-03  1252  	 * prevents us from getting a log overflow, since we'll log basically
bde86b42d2825db Christoph Hellwig 2024-11-03  1253  	 * the whole summary file at once.
bde86b42d2825db Christoph Hellwig 2024-11-03  1254  	 */
59a57acbce282d5 Darrick J. Wong   2024-11-20  1255  	min_logfsbs = min_t(xfs_extlen_t, xfs_log_calc_minimum_size(nmp),
59a57acbce282d5 Darrick J. Wong   2024-11-20  1256  			nmp->m_rsumblocks * 2);
bde86b42d2825db Christoph Hellwig 2024-11-03  1257  
db44d088a5ab030 Darrick J. Wong   2025-06-12  1258  	trace_xfs_growfs_check_rtgeom(mp, min_logfsbs);
db44d088a5ab030 Darrick J. Wong   2025-06-12  1259  
59a57acbce282d5 Darrick J. Wong   2024-11-20  1260  	if (min_logfsbs > mp->m_sb.sb_logblocks)
dc68c0f60169101 Christoph Hellwig 2025-12-16  1261  		goto out_inval;
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1262  
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1263  	if (xfs_has_zoned(mp)) {
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1264  		uint32_t	gblocks = mp->m_groups[XG_TYPE_RTG].blocks;
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1265  		uint32_t	rem;
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1266  
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1267  		if (rextsize != 1)
01b71e64bb875b3 Christoph Hellwig 2024-11-17 @1268  			return -EINVAL;
dc68c0f60169101 Christoph Hellwig 2025-12-16  1269  		div_u64_rem(nmp->m_sb.sb_rblocks, gblocks, &rem);
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1270  		if (rem) {
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1271  			xfs_warn(mp,
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1272  "new RT volume size (%lld) not aligned to RT group size (%d)",
dc68c0f60169101 Christoph Hellwig 2025-12-16  1273  				nmp->m_sb.sb_rblocks, gblocks);
dc68c0f60169101 Christoph Hellwig 2025-12-16  1274  			goto out_inval;
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1275  		}
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1276  	}
01b71e64bb875b3 Christoph Hellwig 2024-11-17  1277  
dc68c0f60169101 Christoph Hellwig 2025-12-16  1278  	kfree(nmp);
59a57acbce282d5 Darrick J. Wong   2024-11-20  1279  	return 0;
dc68c0f60169101 Christoph Hellwig 2025-12-16  1280  out_inval:
dc68c0f60169101 Christoph Hellwig 2025-12-16  1281  	kfree(nmp);
dc68c0f60169101 Christoph Hellwig 2025-12-16  1282  	return -EINVAL;
bde86b42d2825db Christoph Hellwig 2024-11-03  1283  }
bde86b42d2825db Christoph Hellwig 2024-11-03  1284  

:::::: The code at line 1268 was first introduced by commit
:::::: 01b71e64bb875b329e5b04715d96a477b86ba5de xfs: support growfs on zoned file systems

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
