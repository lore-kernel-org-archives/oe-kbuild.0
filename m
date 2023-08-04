Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E61AA9F
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691185789; x=1722721789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tPhIWvowTP6uGeZT7mNErEVHm2EVK6iYh/t1Zy8zGIM=;
  b=gnvHyUgtjmdfkFLy9h0KAodUj/ZUNZYUC1QHfJFbdc1lMlLN3WDBfWcx
   cwMJBDJKNdC6cGKBvHq16Y1UdFczJMXU6Y7hUC6q+ydx7dHxM/p/MyH/c
   6Aq4LudcawDvVQFDb2R/3I8tFhjgS7h7bscrUKjKW/vGiciKdctrbfPRR
   rfaCXj9VEFfHQLkTL4elrLd/ha0Pa74pW6NXYAat6ZvAyD+9tRdgWWKmA
   U7X5qkYk0URBUg7T/yOQw/3XSoE2d8CMUiieMRDTp87pAbRV8Y+nlesHe
   uDn5e/oz1riaY1kP1XFgFATZUrjRmLtzhih4NbEffIvL7Jj71T6U3AEKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350561962"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350561962"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 14:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="1060938805"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="1060938805"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 14:49:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS2g6-00037n-2c;
	Fri, 04 Aug 2023 21:49:46 +0000
Date: Sat, 5 Aug 2023 05:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050550.HJtYgHLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/xfs/scrub/repair.c:297:16: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-r073-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050550.HJtYgHLX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050550.HJtYgHLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050550.HJtYgHLX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/xfs/scrub/repair.c: note: in included file (through include/linux/blkdev.h, fs/xfs/xfs_linux.h, fs/xfs/xfs.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/xfs/scrub/repair.c:297:16: sparse: sparse: too long token expansion
   fs/xfs/scrub/repair.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
--
   drivers/mtd/ubi/block.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/mtd/ubi/block.c: note: in included file:
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/mtd/ubi/block.c:222:9: sparse: sparse: too long token expansion
>> drivers/mtd/ubi/block.c:222:9: sparse: sparse: too long token expansion

vim +297 fs/xfs/scrub/repair.c

0a9633fa2f9a7a Darrick J. Wong   2018-05-29  184  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  185  /*
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  186   * Figure out how many blocks to reserve for an AG repair.  We calculate the
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  187   * worst case estimate for the number of blocks we'd need to rebuild one of
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  188   * any type of per-AG btree.
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  189   */
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  190  xfs_extlen_t
b5e2196e9c7217 Darrick J. Wong   2018-07-19  191  xrep_calc_ag_resblks(
1d8a748a8aa94a Darrick J. Wong   2018-07-19  192  	struct xfs_scrub		*sc)
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  193  {
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  194  	struct xfs_mount		*mp = sc->mp;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  195  	struct xfs_scrub_metadata	*sm = sc->sm;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  196  	struct xfs_perag		*pag;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  197  	struct xfs_buf			*bp;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  198  	xfs_agino_t			icount = NULLAGINO;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  199  	xfs_extlen_t			aglen = NULLAGBLOCK;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  200  	xfs_extlen_t			usedlen;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  201  	xfs_extlen_t			freelen;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  202  	xfs_extlen_t			bnobt_sz;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  203  	xfs_extlen_t			inobt_sz;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  204  	xfs_extlen_t			rmapbt_sz;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  205  	xfs_extlen_t			refcbt_sz;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  206  	int				error;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  207  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  208  	if (!(sm->sm_flags & XFS_SCRUB_IFLAG_REPAIR))
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  209  		return 0;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  210  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  211  	pag = xfs_perag_get(mp, sm->sm_agno);
7ac2ff8bb3713c Dave Chinner      2023-02-13  212  	if (xfs_perag_initialised_agi(pag)) {
1fc25f51d7c18e Darrick J. Wong   2018-08-10  213  		/* Use in-core icount if possible. */
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  214  		icount = pag->pagi_count;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  215  	} else {
1fc25f51d7c18e Darrick J. Wong   2018-08-10  216  		/* Try to get the actual counters from disk. */
99b13c7f0bd35d Dave Chinner      2022-07-07  217  		error = xfs_ialloc_read_agi(pag, NULL, &bp);
1fc25f51d7c18e Darrick J. Wong   2018-08-10  218  		if (!error) {
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  219  			icount = pag->pagi_count;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  220  			xfs_buf_relse(bp);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  221  		}
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  222  	}
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  223  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  224  	/* Now grab the block counters from the AGF. */
08d3e84feeb8cb Dave Chinner      2022-07-07  225  	error = xfs_alloc_read_agf(pag, NULL, 0, &bp);
1aa26707ebd65e Darrick J. Wong   2021-03-22  226  	if (error) {
3829c9a10fc7da Dave Chinner      2022-07-07  227  		aglen = pag->block_count;
1aa26707ebd65e Darrick J. Wong   2021-03-22  228  		freelen = aglen;
1aa26707ebd65e Darrick J. Wong   2021-03-22  229  		usedlen = aglen;
1aa26707ebd65e Darrick J. Wong   2021-03-22  230  	} else {
9798f615ad2be4 Christoph Hellwig 2020-03-10  231  		struct xfs_agf	*agf = bp->b_addr;
9798f615ad2be4 Christoph Hellwig 2020-03-10  232  
9798f615ad2be4 Christoph Hellwig 2020-03-10  233  		aglen = be32_to_cpu(agf->agf_length);
9798f615ad2be4 Christoph Hellwig 2020-03-10  234  		freelen = be32_to_cpu(agf->agf_freeblks);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  235  		usedlen = aglen - freelen;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  236  		xfs_buf_relse(bp);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  237  	}
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  238  
1fc25f51d7c18e Darrick J. Wong   2018-08-10  239  	/* If the icount is impossible, make some worst-case assumptions. */
1fc25f51d7c18e Darrick J. Wong   2018-08-10  240  	if (icount == NULLAGINO ||
2d6ca8321c354e Dave Chinner      2022-07-07  241  	    !xfs_verify_agino(pag, icount)) {
2d6ca8321c354e Dave Chinner      2022-07-07  242  		icount = pag->agino_max - pag->agino_min + 1;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  243  	}
1fc25f51d7c18e Darrick J. Wong   2018-08-10  244  
1fc25f51d7c18e Darrick J. Wong   2018-08-10  245  	/* If the block counts are impossible, make worst-case assumptions. */
1fc25f51d7c18e Darrick J. Wong   2018-08-10  246  	if (aglen == NULLAGBLOCK ||
3829c9a10fc7da Dave Chinner      2022-07-07  247  	    aglen != pag->block_count ||
1fc25f51d7c18e Darrick J. Wong   2018-08-10  248  	    freelen >= aglen) {
3829c9a10fc7da Dave Chinner      2022-07-07  249  		aglen = pag->block_count;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  250  		freelen = aglen;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  251  		usedlen = aglen;
1fc25f51d7c18e Darrick J. Wong   2018-08-10  252  	}
3829c9a10fc7da Dave Chinner      2022-07-07  253  	xfs_perag_put(pag);
1fc25f51d7c18e Darrick J. Wong   2018-08-10  254  
b5e2196e9c7217 Darrick J. Wong   2018-07-19  255  	trace_xrep_calc_ag_resblks(mp, sm->sm_agno, icount, aglen,
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  256  			freelen, usedlen);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  257  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  258  	/*
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  259  	 * Figure out how many blocks we'd need worst case to rebuild
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  260  	 * each type of btree.  Note that we can only rebuild the
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  261  	 * bnobt/cntbt or inobt/finobt as pairs.
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  262  	 */
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  263  	bnobt_sz = 2 * xfs_allocbt_calc_size(mp, freelen);
38c26bfd90e199 Dave Chinner      2021-08-18  264  	if (xfs_has_sparseinodes(mp))
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  265  		inobt_sz = xfs_iallocbt_calc_size(mp, icount /
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  266  				XFS_INODES_PER_HOLEMASK_BIT);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  267  	else
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  268  		inobt_sz = xfs_iallocbt_calc_size(mp, icount /
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  269  				XFS_INODES_PER_CHUNK);
38c26bfd90e199 Dave Chinner      2021-08-18  270  	if (xfs_has_finobt(mp))
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  271  		inobt_sz *= 2;
38c26bfd90e199 Dave Chinner      2021-08-18  272  	if (xfs_has_reflink(mp))
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  273  		refcbt_sz = xfs_refcountbt_calc_size(mp, usedlen);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  274  	else
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  275  		refcbt_sz = 0;
38c26bfd90e199 Dave Chinner      2021-08-18  276  	if (xfs_has_rmapbt(mp)) {
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  277  		/*
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  278  		 * Guess how many blocks we need to rebuild the rmapbt.
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  279  		 * For non-reflink filesystems we can't have more records than
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  280  		 * used blocks.  However, with reflink it's possible to have
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  281  		 * more than one rmap record per AG block.  We don't know how
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  282  		 * many rmaps there could be in the AG, so we start off with
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  283  		 * what we hope is an generous over-estimation.
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  284  		 */
38c26bfd90e199 Dave Chinner      2021-08-18  285  		if (xfs_has_reflink(mp))
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  286  			rmapbt_sz = xfs_rmapbt_calc_size(mp,
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  287  					(unsigned long long)aglen * 2);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  288  		else
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  289  			rmapbt_sz = xfs_rmapbt_calc_size(mp, usedlen);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  290  	} else {
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  291  		rmapbt_sz = 0;
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  292  	}
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  293  
b5e2196e9c7217 Darrick J. Wong   2018-07-19  294  	trace_xrep_calc_ag_resblks_btsize(mp, sm->sm_agno, bnobt_sz,
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  295  			inobt_sz, rmapbt_sz, refcbt_sz);
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  296  
0a9633fa2f9a7a Darrick J. Wong   2018-05-29 @297  	return max(max(bnobt_sz, inobt_sz), max(rmapbt_sz, refcbt_sz));
0a9633fa2f9a7a Darrick J. Wong   2018-05-29  298  }
73d6b42aa4dcdd Darrick J. Wong   2018-05-29  299  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
