Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2B7F
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676621653; x=1708157653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPSSRks9405Gdma4NBChmjvGuHNfqIHtOvkOgN5OwVk=;
  b=UZhUd362QSZBp698XKW75IaMqS66Kp0EuBa5tigy5z1dXOxJ/83EgX0y
   is18Xhz7B4GcrhtGM87LOZ59BwjnbariuIAPYzvN1pjkn4upT7w4cZDe8
   t5SiTuZY4RShVZFKUC3jAMrJcpcEtgXamAi7eXW1Q+lS5RTWPvG3AStpd
   CcAFDv/0OxHWaWIMP6PgTFiv8Y+OLyJEle4ZXvpCpUl2y/3mUIl8rSlX8
   +mNEQ7gV9J7PTFUWzwwPV0umAv3GavAZ7kaWlt9qzCYNdLiYENUPov9BF
   AbDJ5i7kiEH4MBDQGIUbQrbChRH5i6nLrySj3KMykqqV45eExRHGi+3G8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331939866"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331939866"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 00:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739190549"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739190549"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 00:14:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSvsY-000BEG-36;
	Fri, 17 Feb 2023 08:14:02 +0000
Date: Fri, 17 Feb 2023 16:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 266/268] fs/xfs/xfs_buf.c:799
 xfs_buf_find_insert() warn: bitwise AND condition is false here
Message-ID: <202302171616.9NCGaEvl-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   b1434f1ffff0b89a85493bd8ab8c880b3887ca75
commit: 3b9a83b2ec03f048cfe315fe6fe94128de8e6e0b [266/268] xfs: map xfile pages directly into xfs_buf
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230217/202302171616.9NCGaEvl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302171616.9NCGaEvl-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:799 xfs_buf_find_insert() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:1749 xfs_buf_ioapply_in_memory() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:917 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 899)

vim +799 fs/xfs/xfs_buf.c

8925a3dc477100 fs/xfs/xfs_buf.c           Dave Chinner      2018-04-18  773  
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  774  /*
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  775   * Insert the new_bp into the hash table. This consumes the perag reference
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  776   * taken for the lookup regardless of the result of the insert.
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  777   */
b027d4c97b9675 fs/xfs/xfs_buf.c           Dave Chinner      2018-04-18  778  static int
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  779  xfs_buf_find_insert(
e70b73f84f474c fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  780  	struct xfs_buftarg	*btp,
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  781  	struct xfs_perag	*pag,
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  782  	spinlock_t		*hashlock,
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  783  	struct rhashtable	*bufhash,
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  784  	struct xfs_buf_map	*cmap,
6dde27077eaf59 fs/xfs/xfs_buf.c           Dave Chinner      2012-06-22  785  	struct xfs_buf_map	*map,
6dde27077eaf59 fs/xfs/xfs_buf.c           Dave Chinner      2012-06-22  786  	int			nmaps,
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  787  	xfs_buf_flags_t		flags,
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  788  	struct xfs_buf		**bpp)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  789  {
3815832a2aa4df fs/xfs/xfs_buf.c           Dave Chinner      2011-09-30  790  	struct xfs_buf		*new_bp;
e82226138b20d4 fs/xfs/xfs_buf.c           Dave Chinner      2020-12-16  791  	struct xfs_buf		*bp;
9bb38aa080394f fs/xfs/xfs_buf.c           Shaokun Zhang     2021-06-18  792  	int			error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  793  
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  794  	error = _xfs_buf_alloc(btp, map, nmaps, flags, &new_bp);
32dff5e5d1b588 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  795  	if (error)
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  796  		goto out_drop_pag;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  797  
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  798  	/* Try to map pages directly, or fall back to memory. */
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14 @799  	if (btp->bt_flags & XFS_BUFTARG_DIRECT_MAP) {
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  800  		error = xfs_buf_alloc_direct_pages(new_bp, flags);
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  801  		if (error && error != -ENOTBLK)
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  802  			goto out_free_buf;
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  803  	}
3b9a83b2ec03f0 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  804  
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  805  	/*
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  806  	 * For buffers that fit entirely within a single page, first attempt to
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  807  	 * allocate the memory from the heap to minimise memory usage. If we
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  808  	 * can't get heap memory for these small buffers, we fall back to using
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  809  	 * the page allocator.
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  810  	 */
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  811  	if (BBTOB(new_bp->b_length) >= PAGE_SIZE ||
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  812  	    xfs_buf_alloc_kmem(new_bp, flags) < 0) {
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  813  		error = xfs_buf_alloc_pages(new_bp, flags);
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  814  		if (error)
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  815  			goto out_free_buf;
8bcac7448a942f fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  816  	}
fe2429b0966a7e fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  817  
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  818  	spin_lock(hashlock);
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  819  	bp = rhashtable_lookup_get_insert_fast(bufhash, &new_bp->b_rhash_head,
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  820  			xfs_buf_hash_params);
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  821  	if (IS_ERR(bp)) {
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  822  		error = PTR_ERR(bp);
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  823  		spin_unlock(hashlock);
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  824  		goto out_free_buf;
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  825  	}
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  826  	if (bp) {
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  827  		/* found an existing buffer */
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  828  		atomic_inc(&bp->b_hold);
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  829  		spin_unlock(hashlock);
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  830  		error = xfs_buf_find_lock(bp, flags);
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  831  		if (error)
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  832  			xfs_buf_rele(bp);
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  833  		else
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  834  			*bpp = bp;
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  835  		goto out_free_buf;
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  836  	}
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  837  
32dd4f9c506b1b fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  838  	/* The new buffer keeps the perag reference until it is freed. */
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  839  	new_bp->b_pag = pag;
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  840  	new_bp->b_state |= XFS_BSTATE_CACHED;
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  841  	spin_unlock(hashlock);
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  842  	*bpp = new_bp;
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  843  	return 0;
3815832a2aa4df fs/xfs/xfs_buf.c           Dave Chinner      2011-09-30  844  
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  845  out_free_buf:
fe2429b0966a7e fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  846  	xfs_buf_free(new_bp);
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  847  out_drop_pag:
42362a7aabdfd5 fs/xfs/xfs_buf.c           Darrick J. Wong   2022-07-14  848  	if (pag)
348000804a0f4d fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  849  		xfs_perag_put(pag);
de67dc575434dc fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  850  	return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  851  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
