Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EE288D0
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784355117; cv=none; b=f5loE49yGgCtJBdrhKhvxv2Ob6y34kadiRJ3Xi88zNEJpVcOFJEgA3ZBe2Ec7j/IiELBEaAfalcrUbCWFYLixQVOH1XFDJukfNnKDgUl10uDKfHJbX7rQ1dTjSYJTjh2Jj19tAbn89q12wdvAwHP/YtAiYr8T7yT8jLez9gB1tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784355117; c=relaxed/simple;
	bh=ZFsP8eNpOf5CrImM8h4sXTxIim8hvB8GSYgPG5bRGKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SJWLC22D1Tak1OK4cHpisIV/SSwO/+XK04qYgHt8QTpDSuT4rLhy2F2YZ0KunetREWvpMI+Drd1zWiG4SISVThAFhevJH3whulv4BDAX1dSAw9q3L+id0KeUXh/SQXp65iPUpfTRrYNeogqKi4yGr0sv/8mN3FpRWrJXCOfTizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGegCIcs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGegCIcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784355114; x=1815891114;
  h=date:from:to:cc:subject:message-id;
  bh=ZFsP8eNpOf5CrImM8h4sXTxIim8hvB8GSYgPG5bRGKY=;
  b=jGegCIcsgYlKK15UY4xpNdAQ+l6hfOof48/gOdS5UEEZNlKBnOP5N0eU
   gwhTNn0HdyZo8ysaR9H6MvLXfOqSv6RwfxwrKIEp2B63A2d5qjTDr8DJ8
   gBC2ttuS8m8meBTq8xrkLjRcoNSAhl1yN0GE4h7naDQ5Zel0ANAl8alR+
   Hqb6jJaZrf0ml3wB8kvAu1FZTnezGuFjPv2dEbyD/VxLR6pfLbfeY9pMd
   FZeSY12Mfd370m6gzqb5/zHUUAs5F7yeCk0X0SlVLcKbMBtGpuvxsOUXJ
   PUdMSXR24+siEz20TQM+cXvbSFszI+sCvfq+db4aDqF/FRQXbcd6fjSma
   A==;
X-CSE-ConnectionGUID: 1AebZOhjQ06yZUr78JRduA==
X-CSE-MsgGUID: k/gqPigNT1S/xe2Fa9kVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95373224"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95373224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:11:54 -0700
X-CSE-ConnectionGUID: /BZNB28nRSemamojQKN+Ww==
X-CSE-MsgGUID: pb1ZqElRSM2yKxFhZ48+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="257049910"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 23:11:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyH8-00000000TUp-1mgL;
	Sat, 18 Jul 2026 06:11:50 +0000
Date: Sat, 18 Jul 2026 14:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 13/51] fs/xfs/xfs_buf.c:498
 xfs_buf_find_insert() warn: missing error code 'error'
Message-ID: <202607181404.fIa1qQEq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: 11d9e751fc9d77d02e9dc1ba35ece3db9ce361e4 [13/51] xfs: consolidate buffer locking in xfs_buf_get_map
:::::: branch date: 14 hours ago
:::::: commit date: 16 hours ago
config: nios2-randconfig-r071-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181404.fIa1qQEq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607181404.fIa1qQEq-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_buf.c:498 xfs_buf_find_insert() warn: missing error code 'error'

vim +/error +498 fs/xfs/xfs_buf.c

8925a3dc477100 fs/xfs/xfs_buf.c           Dave Chinner      2018-04-18  449  
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  450  /*
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  451   * Insert the new_bp into the hash table. This consumes the perag reference
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  452   * taken for the lookup regardless of the result of the insert.
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  453   */
b027d4c97b9675 fs/xfs/xfs_buf.c           Dave Chinner      2018-04-18  454  static int
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  455  xfs_buf_find_insert(
e70b73f84f474c fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  456  	struct xfs_buftarg	*btp,
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  457  	struct xfs_buf_map	*cmap,
6dde27077eaf59 fs/xfs/xfs_buf.c           Dave Chinner      2012-06-22  458  	struct xfs_buf_map	*map,
6dde27077eaf59 fs/xfs/xfs_buf.c           Dave Chinner      2012-06-22  459  	int			nmaps,
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  460  	xfs_buf_flags_t		flags,
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  461  	struct xfs_buf		**bpp)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  462  {
3815832a2aa4df fs/xfs/xfs_buf.c           Dave Chinner      2011-09-30  463  	struct xfs_buf		*new_bp;
e82226138b20d4 fs/xfs/xfs_buf.c           Dave Chinner      2020-12-16  464  	struct xfs_buf		*bp;
9bb38aa080394f fs/xfs/xfs_buf.c           Shaokun Zhang     2021-06-18  465  	int			error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  466  
1ec1207722c8bf fs/xfs/xfs_buf.c           Christoph Hellwig 2025-03-17  467  	error = xfs_buf_alloc(btp, map, nmaps, flags, &new_bp);
32dff5e5d1b588 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  468  	if (error)
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  469  		return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  470  
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  471  	/* The new buffer keeps the perag reference until it is freed. */
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  472  	if (!xfs_buftarg_is_mem(btp)) {
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  473  		new_bp->b_pag = xfs_perag_get(btp->bt_mount,
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  474  			xfs_daddr_to_agno(btp->bt_mount, cmap->bm_bn));
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  475  	}
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  476  
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  477  retry:
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  478  	rcu_read_lock();
497560b9ef42a4 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-03-23  479  	bp = rhashtable_lookup_get_insert_fast(&btp->bt_hash,
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  480  			&new_bp->b_rhash_head, xfs_buf_hash_params);
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  481  	if (IS_ERR(bp)) {
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  482  		rcu_read_unlock();
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  483  		error = PTR_ERR(bp);
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  484  		goto out_free_buf;
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  485  	}
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  486  	if (bp) {
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  487  		/*
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  488  		 * If there is an existing buffer with a dead lockref, retry
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  489  		 * until the new buffer is added, or a usable buffer is found.
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  490  		 */
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  491  		if (!lockref_get_not_dead(&bp->b_lockref)) {
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  492  			rcu_read_unlock();
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  493  			cpu_relax();
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  494  			goto retry;
c69439a891ccb3 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-05-18  495  		}
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  496  		rcu_read_unlock();
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  497  		*bpp = bp;
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07 @498  		goto out_free_buf;
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  499  	}
a9ab28b3d21aec fs/xfs/xfs_buf.c           Christoph Hellwig 2025-01-28  500  	rcu_read_unlock();
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  501  
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  502  	*bpp = new_bp;
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  503  	return 0;
3815832a2aa4df fs/xfs/xfs_buf.c           Dave Chinner      2011-09-30  504  
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  505  out_free_buf:
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  506  	if (new_bp->b_pag)
dd0a6bbb4546a7 fs/xfs/xfs_buf.c           Christoph Hellwig 2026-06-13  507  		xfs_perag_put(new_bp->b_pag);
fe2429b0966a7e fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  508  	xfs_buf_free(new_bp);
de67dc575434dc fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  509  	return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  510  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  511  

:::::: The code at line 498 was first introduced by commit
:::::: 170041f71596dad3f34dea40ee0ef0c848d3f906 xfs: cleanup error handling in xfs_buf_get_map

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Dave Chinner <david@fromorbit.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
