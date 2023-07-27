Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09116C8EA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690473979; x=1722009979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LBHPiR+jtyBmiaDX4IqOU9u7XRa3XfYzraTANELFZDA=;
  b=XOLPPacC4ajl7eHTwjxnSFoz2gHUWNG5ERgawMu5ULKKAb3JhyGILfZc
   bzwxdX0SCU1NHjEeAAk+jYHltZQERa0ePl2yiHOSgKu3GUaCrJR8sYBXV
   tcFtetv9Q0CBzOkH24kjoieXH2jirjOlk/8M3x+zmXoYPubpCsWgul3Zv
   xQFRLmOrtZ98kj5Ozkn8ya/VBxuajGdhKoIB+rn/Vw6X1s+Rbwc0/erZz
   c9B5SpHNo1dT2xQh2qOTzvBbja4dHGv7cRrzZQMGpxmK/kctIuQ/jwvWQ
   qXamaPiNDhcXxLftBVIw3Zp64NrnwTTbK9OO3NZJrnneQW5E2rZtl6KMt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="347965257"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="347965257"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 09:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="850859302"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="850859302"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Jul 2023 09:03:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP3Sy-0002Oh-1y;
	Thu, 27 Jul 2023 16:03:52 +0000
Date: Fri, 28 Jul 2023 00:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 4/5] minmax: Allow comparisons of 'int'
 against 'unsigned char/short'.
Message-ID: <202307272330.7hEVht8F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/xfs/libxfs/xfs_trans_resv.c:341:39: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
References: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230727]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a3309fcd947a4fb3826f1e8b8b9da585%40AcuMS.aculab.com
patch subject: [PATCH next resend 4/5] minmax: Allow comparisons of 'int' against 'unsigned char/short'.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r093-20230725 (https://download.01.org/0day-ci/archive/20230727/202307272330.7hEVht8F-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272330.7hEVht8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307272330.7hEVht8F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/xfs/libxfs/xfs_trans_resv.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> fs/xfs/libxfs/xfs_trans_resv.c:341:39: sparse: sparse: too long token expansion
   fs/xfs/libxfs/xfs_trans_resv.c:413:39: sparse: sparse: too long token expansion

vim +341 fs/xfs/libxfs/xfs_trans_resv.c

7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  268  
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  269  /*
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  270   * In a write transaction we can allocate a maximum of 2
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  271   * extents.  This gives (t1):
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  272   *    the inode getting the new extents: inode size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  273   *    the inode's bmap btree: max depth * block size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  274   *    the agfs of the ags from which the extents are allocated: 2 * sector
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  275   *    the superblock free block counter: sector size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  276   *    the allocation btrees: 2 exts * 2 trees * (2 * max depth - 1) * block size
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  277   * Or, if we're writing to a realtime file (t2):
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  278   *    the inode getting the new extents: inode size
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  279   *    the inode's bmap btree: max depth * block size
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  280   *    the agfs of the ags from which the extents are allocated: 2 * sector
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  281   *    the superblock free block counter: sector size
95f0b95e2b686c fs/xfs/libxfs/xfs_trans_resv.c Chandan Babu R  2021-08-09  282   *    the realtime bitmap: ((XFS_BMBT_MAX_EXTLEN / rtextsize) / NBBY) bytes
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  283   *    the realtime summary: 1 block
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  284   *    the allocation btrees: 2 trees * (2 * max depth - 1) * block size
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  285   * And the bmap_finish transaction can free bmap blocks in a join (t3):
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  286   *    the agfs of the ags containing the blocks: 2 * sector size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  287   *    the agfls of the ags containing the blocks: 2 * sector size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  288   *    the super block free block counter: sector size
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  289   *    the allocation btrees: 2 exts * 2 trees * (2 * max depth - 1) * block size
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  290   * And any refcount updates that happen in a separate transaction (t4).
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  291   */
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  292  STATIC uint
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  293  xfs_calc_write_reservation(
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  294  	struct xfs_mount	*mp,
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  295  	bool			for_minlogsize)
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  296  {
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  297  	unsigned int		t1, t2, t3, t4;
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  298  	unsigned int		blksz = XFS_FSB_TO_B(mp, 1);
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  299  
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  300  	t1 = xfs_calc_inode_res(mp, 1) +
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  301  	     xfs_calc_buf_res(XFS_BM_MAXLEVELS(mp, XFS_DATA_FORK), blksz) +
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  302  	     xfs_calc_buf_res(3, mp->m_sb.sb_sectsize) +
6ed7e509d23045 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  303  	     xfs_calc_buf_res(xfs_allocfree_block_count(mp, 2), blksz);
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  304  
ebd9027d088b3a fs/xfs/libxfs/xfs_trans_resv.c Dave Chinner    2021-08-18  305  	if (xfs_has_realtime(mp)) {
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  306  		t2 = xfs_calc_inode_res(mp, 1) +
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  307  		     xfs_calc_buf_res(XFS_BM_MAXLEVELS(mp, XFS_DATA_FORK),
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  308  				     blksz) +
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  309  		     xfs_calc_buf_res(3, mp->m_sb.sb_sectsize) +
6ed7e509d23045 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  310  		     xfs_calc_buf_res(xfs_rtalloc_block_count(mp, 1), blksz) +
6ed7e509d23045 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  311  		     xfs_calc_buf_res(xfs_allocfree_block_count(mp, 1), blksz);
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  312  	} else {
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  313  		t2 = 0;
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  314  	}
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  315  
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  316  	t3 = xfs_calc_buf_res(5, mp->m_sb.sb_sectsize) +
6ed7e509d23045 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  317  	     xfs_calc_buf_res(xfs_allocfree_block_count(mp, 2), blksz);
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  318  
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  319  	/*
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  320  	 * In the early days of reflink, we included enough reservation to log
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  321  	 * two refcountbt splits for each transaction.  The codebase runs
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  322  	 * refcountbt updates in separate transactions now, so to compute the
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  323  	 * minimum log size, add the refcountbtree splits back to t1 and t3 and
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  324  	 * do not account them separately as t4.  Reflink did not support
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  325  	 * realtime when the reservations were established, so no adjustment to
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  326  	 * t2 is needed.
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  327  	 */
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  328  	if (for_minlogsize) {
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  329  		unsigned int	adj = 0;
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  330  
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  331  		if (xfs_has_reflink(mp))
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  332  			adj = xfs_calc_buf_res(
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  333  					xfs_refcountbt_block_count(mp, 2),
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  334  					blksz);
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  335  		t1 += adj;
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  336  		t3 += adj;
b1de6fc7520fe1 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2019-12-11  337  		return XFS_DQUOT_LOGRES(mp) + max3(t1, t2, t3);
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  338  	}
7fd36c4418ee86 fs/xfs/xfs_trans_resv.c        Dave Chinner    2013-08-12  339  
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  340  	t4 = xfs_calc_refcountbt_reservation(mp, 1);
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25 @341  	return XFS_DQUOT_LOGRES(mp) + max(t4, max3(t1, t2, t3));
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  342  }
b037c4eed2df45 fs/xfs/libxfs/xfs_trans_resv.c Darrick J. Wong 2022-04-25  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
