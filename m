Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47FE566A
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695026081; x=1726562081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uNfAR82U/JeMk1UEjOeimCCRM0zsVItFGETEWMATcPc=;
  b=djCAR/EzpbuTnf/ME4Gco5EPYsJe6T8M9FAVeb44pjHA+XwekEO/Z4a7
   9gA9MNoDZAH/G3fZ7u9dkhnkIg/VshPHtG0A+CA2N9AuuCy2qJltz/AeP
   CsDJJayi0SM3h4mTV5QS+pqSZxMdFkSb57ufoS0Es2CzOMJ045Yp0MDpi
   Y1W7fI4LSeKz2RyZRwrwS03Ik2P7hj4foywHGGbHYe44AiX3OLYabkAux
   /j9MT7+I6/wXTsD/dVAEm+sGY0VQadq+iHzm5M54Aw1FcmKeY4j83JcRB
   XRLZgqBLl03xWJrjBBEOB289oXNuGRJypt66zgH8fREe3K0gjxWgABqSJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382344233"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="382344233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 01:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="815936750"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="815936750"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2023 01:34:39 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi9iF-0005w4-2a;
	Mon, 18 Sep 2023 08:34:36 +0000
Date: Mon, 18 Sep 2023 16:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-stable:pending-4.14 33/147] fs/udf/inode.c:909
 inode_getblk() error: uninitialized symbol 'newblock'.
Message-ID: <202309181631.h6Q1PmQY-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   3a8e760e18f26db47f6d15893870e6b056ca877a
commit: b279cbf5cb76a84f1082b8b62bd2d69cc148bcb4 [33/147] udf: Handle error when adding extent to a file
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20230918 (https://download.01.org/0day-ci/archive/20230918/202309181631.h6Q1PmQY-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309181631.h6Q1PmQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309181631.h6Q1PmQY-lkp@intel.com/

smatch warnings:
fs/udf/inode.c:909 inode_getblk() error: uninitialized symbol 'newblock'.

vim +/newblock +909 fs/udf/inode.c

7e49b6f2480cb9 Jan Kara          2010-10-22  683  
7b0b0933a3ff60 Jan Kara          2011-12-10  684  static sector_t inode_getblk(struct inode *inode, sector_t block,
7b0b0933a3ff60 Jan Kara          2011-12-10  685  			     int *err, int *new)
^1da177e4c3f41 Linus Torvalds    2005-04-16  686  {
5ca4e4be841e38 Pekka Enberg      2008-10-15  687  	struct kernel_long_ad laarr[EXTENT_MERGE_SIZE];
ff116fc8d1d439 Jan Kara          2007-05-08  688  	struct extent_position prev_epos, cur_epos, next_epos;
^1da177e4c3f41 Linus Torvalds    2005-04-16  689  	int count = 0, startnum = 0, endnum = 0;
85d71244f02583 Jan Kara          2007-06-01  690  	uint32_t elen = 0, tmpelen;
5ca4e4be841e38 Pekka Enberg      2008-10-15  691  	struct kernel_lb_addr eloc, tmpeloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  692  	int c = 1;
60448b1d6db4e8 Jan Kara          2007-05-08  693  	loff_t lbcount = 0, b_off = 0;
60448b1d6db4e8 Jan Kara          2007-05-08  694  	uint32_t newblocknum, newblock;
60448b1d6db4e8 Jan Kara          2007-05-08  695  	sector_t offset = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  696  	int8_t etype;
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  697  	struct udf_inode_info *iinfo = UDF_I(inode);
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  698  	int goal = 0, pgoal = iinfo->i_location.logicalBlockNum;
31170b6ad4ebe6 Jan Kara          2007-05-08  699  	int lastblock = 0;
fb719c59bdb4fc Namjae Jeon       2012-10-10  700  	bool isBeyondEOF;
^1da177e4c3f41 Linus Torvalds    2005-04-16  701  
7b0b0933a3ff60 Jan Kara          2011-12-10  702  	*err = 0;
7b0b0933a3ff60 Jan Kara          2011-12-10  703  	*new = 0;
ff116fc8d1d439 Jan Kara          2007-05-08  704  	prev_epos.offset = udf_file_entry_alloc_offset(inode);
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  705  	prev_epos.block = iinfo->i_location;
ff116fc8d1d439 Jan Kara          2007-05-08  706  	prev_epos.bh = NULL;
ff116fc8d1d439 Jan Kara          2007-05-08  707  	cur_epos = next_epos = prev_epos;
60448b1d6db4e8 Jan Kara          2007-05-08  708  	b_off = (loff_t)block << inode->i_sb->s_blocksize_bits;
^1da177e4c3f41 Linus Torvalds    2005-04-16  709  
^1da177e4c3f41 Linus Torvalds    2005-04-16  710  	/* find the extent which contains the block we are looking for.
^1da177e4c3f41 Linus Torvalds    2005-04-16  711  	   alternate between laarr[0] and laarr[1] for locations of the
^1da177e4c3f41 Linus Torvalds    2005-04-16  712  	   current extent, and the previous extent */
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  713  	do {
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  714  		if (prev_epos.bh != cur_epos.bh) {
3bf25cb40d899e Jan Kara          2007-05-08  715  			brelse(prev_epos.bh);
3bf25cb40d899e Jan Kara          2007-05-08  716  			get_bh(cur_epos.bh);
ff116fc8d1d439 Jan Kara          2007-05-08  717  			prev_epos.bh = cur_epos.bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  718  		}
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  719  		if (cur_epos.bh != next_epos.bh) {
3bf25cb40d899e Jan Kara          2007-05-08  720  			brelse(cur_epos.bh);
3bf25cb40d899e Jan Kara          2007-05-08  721  			get_bh(next_epos.bh);
ff116fc8d1d439 Jan Kara          2007-05-08  722  			cur_epos.bh = next_epos.bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  723  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  724  
^1da177e4c3f41 Linus Torvalds    2005-04-16  725  		lbcount += elen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  726  
ff116fc8d1d439 Jan Kara          2007-05-08  727  		prev_epos.block = cur_epos.block;
ff116fc8d1d439 Jan Kara          2007-05-08  728  		cur_epos.block = next_epos.block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  729  
ff116fc8d1d439 Jan Kara          2007-05-08  730  		prev_epos.offset = cur_epos.offset;
ff116fc8d1d439 Jan Kara          2007-05-08  731  		cur_epos.offset = next_epos.offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  732  
4b11111aba6c80 Marcin Slusarz    2008-02-08  733  		etype = udf_next_aext(inode, &next_epos, &eloc, &elen, 1);
4b11111aba6c80 Marcin Slusarz    2008-02-08  734  		if (etype == -1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  735  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  736  
^1da177e4c3f41 Linus Torvalds    2005-04-16  737  		c = !c;
^1da177e4c3f41 Linus Torvalds    2005-04-16  738  
^1da177e4c3f41 Linus Torvalds    2005-04-16  739  		laarr[c].extLength = (etype << 30) | elen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  740  		laarr[c].extLocation = eloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  741  
^1da177e4c3f41 Linus Torvalds    2005-04-16  742  		if (etype != (EXT_NOT_RECORDED_NOT_ALLOCATED >> 30))
^1da177e4c3f41 Linus Torvalds    2005-04-16  743  			pgoal = eloc.logicalBlockNum +
^1da177e4c3f41 Linus Torvalds    2005-04-16  744  				((elen + inode->i_sb->s_blocksize - 1) >>
^1da177e4c3f41 Linus Torvalds    2005-04-16  745  				 inode->i_sb->s_blocksize_bits);
^1da177e4c3f41 Linus Torvalds    2005-04-16  746  
^1da177e4c3f41 Linus Torvalds    2005-04-16  747  		count++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  748  	} while (lbcount + elen <= b_off);
^1da177e4c3f41 Linus Torvalds    2005-04-16  749  
^1da177e4c3f41 Linus Torvalds    2005-04-16  750  	b_off -= lbcount;
^1da177e4c3f41 Linus Torvalds    2005-04-16  751  	offset = b_off >> inode->i_sb->s_blocksize_bits;
85d71244f02583 Jan Kara          2007-06-01  752  	/*
85d71244f02583 Jan Kara          2007-06-01  753  	 * Move prev_epos and cur_epos into indirect extent if we are at
85d71244f02583 Jan Kara          2007-06-01  754  	 * the pointer to it
85d71244f02583 Jan Kara          2007-06-01  755  	 */
85d71244f02583 Jan Kara          2007-06-01  756  	udf_next_aext(inode, &prev_epos, &tmpeloc, &tmpelen, 0);
85d71244f02583 Jan Kara          2007-06-01  757  	udf_next_aext(inode, &cur_epos, &tmpeloc, &tmpelen, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  758  
^1da177e4c3f41 Linus Torvalds    2005-04-16  759  	/* if the extent is allocated and recorded, return the block
^1da177e4c3f41 Linus Torvalds    2005-04-16  760  	   if the extent is not a multiple of the blocksize, round up */
^1da177e4c3f41 Linus Torvalds    2005-04-16  761  
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  762  	if (etype == (EXT_RECORDED_ALLOCATED >> 30)) {
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  763  		if (elen & (inode->i_sb->s_blocksize - 1)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  764  			elen = EXT_RECORDED_ALLOCATED |
^1da177e4c3f41 Linus Torvalds    2005-04-16  765  				((elen + inode->i_sb->s_blocksize - 1) &
^1da177e4c3f41 Linus Torvalds    2005-04-16  766  				 ~(inode->i_sb->s_blocksize - 1));
7e49b6f2480cb9 Jan Kara          2010-10-22  767  			udf_write_aext(inode, &cur_epos, &eloc, elen, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  768  		}
97e961fdbf3248 Pekka Enberg      2008-10-15  769  		newblock = udf_get_lb_pblock(inode->i_sb, &eloc, offset);
02d4ca49fa2220 Fabian Frederick  2017-01-06  770  		goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  771  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  772  
9d361197941083 Jan Kara          2022-12-07  773  	/* Are we beyond EOF and preallocated extent? */
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  774  	if (etype == -1) {
31170b6ad4ebe6 Jan Kara          2007-05-08  775  		int ret;
541cb89c7581d5 Steven J. Magnani 2019-06-30  776  		loff_t hole_len;
9d361197941083 Jan Kara          2022-12-07  777  
6981498d7956e3 Fabian Frederick  2015-02-04  778  		isBeyondEOF = true;
31170b6ad4ebe6 Jan Kara          2007-05-08  779  		if (count) {
31170b6ad4ebe6 Jan Kara          2007-05-08  780  			if (c)
31170b6ad4ebe6 Jan Kara          2007-05-08  781  				laarr[0] = laarr[1];
31170b6ad4ebe6 Jan Kara          2007-05-08  782  			startnum = 1;
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  783  		} else {
31170b6ad4ebe6 Jan Kara          2007-05-08  784  			/* Create a fake extent when there's not one */
4b11111aba6c80 Marcin Slusarz    2008-02-08  785  			memset(&laarr[0].extLocation, 0x00,
5ca4e4be841e38 Pekka Enberg      2008-10-15  786  				sizeof(struct kernel_lb_addr));
31170b6ad4ebe6 Jan Kara          2007-05-08  787  			laarr[0].extLength = EXT_NOT_RECORDED_NOT_ALLOCATED;
7e49b6f2480cb9 Jan Kara          2010-10-22  788  			/* Will udf_do_extend_file() create real extent from
4b11111aba6c80 Marcin Slusarz    2008-02-08  789  			   a fake one? */
31170b6ad4ebe6 Jan Kara          2007-05-08  790  			startnum = (offset > 0);
31170b6ad4ebe6 Jan Kara          2007-05-08  791  		}
31170b6ad4ebe6 Jan Kara          2007-05-08  792  		/* Create extents for the hole between EOF and offset */
541cb89c7581d5 Steven J. Magnani 2019-06-30  793  		hole_len = (loff_t)offset << inode->i_blkbits;
541cb89c7581d5 Steven J. Magnani 2019-06-30  794  		ret = udf_do_extend_file(inode, &prev_epos, laarr, hole_len);
7e49b6f2480cb9 Jan Kara          2010-10-22  795  		if (ret < 0) {
7e49b6f2480cb9 Jan Kara          2010-10-22  796  			*err = ret;
02d4ca49fa2220 Fabian Frederick  2017-01-06  797  			newblock = 0;
02d4ca49fa2220 Fabian Frederick  2017-01-06  798  			goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  799  		}
31170b6ad4ebe6 Jan Kara          2007-05-08  800  		c = 0;
31170b6ad4ebe6 Jan Kara          2007-05-08  801  		offset = 0;
31170b6ad4ebe6 Jan Kara          2007-05-08  802  		count += ret;
6485b2efdb659b Jan Kara          2023-01-23  803  		/*
6485b2efdb659b Jan Kara          2023-01-23  804  		 * Is there any real extent? - otherwise we overwrite the fake
6485b2efdb659b Jan Kara          2023-01-23  805  		 * one...
6485b2efdb659b Jan Kara          2023-01-23  806  		 */
31170b6ad4ebe6 Jan Kara          2007-05-08  807  		if (count)
^1da177e4c3f41 Linus Torvalds    2005-04-16  808  			c = !c;
^1da177e4c3f41 Linus Torvalds    2005-04-16  809  		laarr[c].extLength = EXT_NOT_RECORDED_NOT_ALLOCATED |
31170b6ad4ebe6 Jan Kara          2007-05-08  810  			inode->i_sb->s_blocksize;
4b11111aba6c80 Marcin Slusarz    2008-02-08  811  		memset(&laarr[c].extLocation, 0x00,
5ca4e4be841e38 Pekka Enberg      2008-10-15  812  			sizeof(struct kernel_lb_addr));
^1da177e4c3f41 Linus Torvalds    2005-04-16  813  		count++;
31170b6ad4ebe6 Jan Kara          2007-05-08  814  		endnum = c + 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  815  		lastblock = 1;
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  816  	} else {
6981498d7956e3 Fabian Frederick  2015-02-04  817  		isBeyondEOF = false;
^1da177e4c3f41 Linus Torvalds    2005-04-16  818  		endnum = startnum = ((count > 2) ? 2 : count);
^1da177e4c3f41 Linus Torvalds    2005-04-16  819  
4b11111aba6c80 Marcin Slusarz    2008-02-08  820  		/* if the current extent is in position 0,
4b11111aba6c80 Marcin Slusarz    2008-02-08  821  		   swap it with the previous */
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  822  		if (!c && count != 1) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  823  			laarr[2] = laarr[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  824  			laarr[0] = laarr[1];
^1da177e4c3f41 Linus Torvalds    2005-04-16  825  			laarr[1] = laarr[2];
^1da177e4c3f41 Linus Torvalds    2005-04-16  826  			c = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  827  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  828  
4b11111aba6c80 Marcin Slusarz    2008-02-08  829  		/* if the current block is located in an extent,
4b11111aba6c80 Marcin Slusarz    2008-02-08  830  		   read the next extent */
4b11111aba6c80 Marcin Slusarz    2008-02-08  831  		etype = udf_next_aext(inode, &next_epos, &eloc, &elen, 0);
4b11111aba6c80 Marcin Slusarz    2008-02-08  832  		if (etype != -1) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  833  			laarr[c + 1].extLength = (etype << 30) | elen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  834  			laarr[c + 1].extLocation = eloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  835  			count++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  836  			startnum++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  837  			endnum++;
4b11111aba6c80 Marcin Slusarz    2008-02-08  838  		} else
^1da177e4c3f41 Linus Torvalds    2005-04-16  839  			lastblock = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  840  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  841  
^1da177e4c3f41 Linus Torvalds    2005-04-16  842  	/* if the current extent is not recorded but allocated, get the
28de7948a89676 Cyrill Gorcunov   2007-07-21  843  	 * block in the extent corresponding to the requested block */
4b11111aba6c80 Marcin Slusarz    2008-02-08  844  	if ((laarr[c].extLength >> 30) == (EXT_NOT_RECORDED_ALLOCATED >> 30))
^1da177e4c3f41 Linus Torvalds    2005-04-16  845  		newblocknum = laarr[c].extLocation.logicalBlockNum + offset;
4b11111aba6c80 Marcin Slusarz    2008-02-08  846  	else { /* otherwise, allocate a new block */
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  847  		if (iinfo->i_next_alloc_block == block)
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  848  			goal = iinfo->i_next_alloc_goal;
^1da177e4c3f41 Linus Torvalds    2005-04-16  849  
cb00ea3528eb3c Cyrill Gorcunov   2007-07-19  850  		if (!goal) {
4b11111aba6c80 Marcin Slusarz    2008-02-08  851  			if (!(goal = pgoal)) /* XXX: what was intended here? */
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  852  				goal = iinfo->i_location.logicalBlockNum + 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  853  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  854  
4b11111aba6c80 Marcin Slusarz    2008-02-08  855  		newblocknum = udf_new_block(inode->i_sb, inode,
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  856  				iinfo->i_location.partitionReferenceNum,
4b11111aba6c80 Marcin Slusarz    2008-02-08  857  				goal, err);
4b11111aba6c80 Marcin Slusarz    2008-02-08  858  		if (!newblocknum) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  859  			*err = -ENOSPC;
02d4ca49fa2220 Fabian Frederick  2017-01-06  860  			newblock = 0;
02d4ca49fa2220 Fabian Frederick  2017-01-06  861  			goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  862  		}
fb719c59bdb4fc Namjae Jeon       2012-10-10  863  		if (isBeyondEOF)
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  864  			iinfo->i_lenExtents += inode->i_sb->s_blocksize;
^1da177e4c3f41 Linus Torvalds    2005-04-16  865  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  866  
4b11111aba6c80 Marcin Slusarz    2008-02-08  867  	/* if the extent the requsted block is located in contains multiple
4b11111aba6c80 Marcin Slusarz    2008-02-08  868  	 * blocks, split the extent into at most three extents. blocks prior
4b11111aba6c80 Marcin Slusarz    2008-02-08  869  	 * to requested block, requested block, and blocks after requested
4b11111aba6c80 Marcin Slusarz    2008-02-08  870  	 * block */
^1da177e4c3f41 Linus Torvalds    2005-04-16  871  	udf_split_extents(inode, &c, offset, newblocknum, laarr, &endnum);
^1da177e4c3f41 Linus Torvalds    2005-04-16  872  
81056dd0446590 Jan Kara          2009-07-16  873  	/* We preallocate blocks only for regular files. It also makes sense
81056dd0446590 Jan Kara          2009-07-16  874  	 * for directories but there's a problem when to drop the
81056dd0446590 Jan Kara          2009-07-16  875  	 * preallocation. We might use some delayed work for that but I feel
81056dd0446590 Jan Kara          2009-07-16  876  	 * it's overengineering for a filesystem like UDF. */
81056dd0446590 Jan Kara          2009-07-16  877  	if (S_ISREG(inode->i_mode))
^1da177e4c3f41 Linus Torvalds    2005-04-16  878  		udf_prealloc_extents(inode, c, lastblock, laarr, &endnum);
^1da177e4c3f41 Linus Torvalds    2005-04-16  879  
^1da177e4c3f41 Linus Torvalds    2005-04-16  880  	/* merge any continuous blocks in laarr */
^1da177e4c3f41 Linus Torvalds    2005-04-16  881  	udf_merge_extents(inode, laarr, &endnum);
^1da177e4c3f41 Linus Torvalds    2005-04-16  882  
^1da177e4c3f41 Linus Torvalds    2005-04-16  883  	/* write back the new extents, inserting new extents if the new number
28de7948a89676 Cyrill Gorcunov   2007-07-21  884  	 * of extents is greater than the old number, and deleting extents if
28de7948a89676 Cyrill Gorcunov   2007-07-21  885  	 * the new number of extents is less than the old number */
b279cbf5cb76a8 Jan Kara          2022-12-19  886  	*err = udf_update_extents(inode, laarr, startnum, endnum, &prev_epos);
b279cbf5cb76a8 Jan Kara          2022-12-19  887  	if (*err < 0)
b279cbf5cb76a8 Jan Kara          2022-12-19  888  		goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  889  
4b11111aba6c80 Marcin Slusarz    2008-02-08  890  	newblock = udf_get_pblock(inode->i_sb, newblocknum,
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  891  				iinfo->i_location.partitionReferenceNum, 0);
7b0b0933a3ff60 Jan Kara          2011-12-10  892  	if (!newblock) {
7b0b0933a3ff60 Jan Kara          2011-12-10  893  		*err = -EIO;
02d4ca49fa2220 Fabian Frederick  2017-01-06  894  		goto out_free;
7b0b0933a3ff60 Jan Kara          2011-12-10  895  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  896  	*new = 1;
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  897  	iinfo->i_next_alloc_block = block;
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  898  	iinfo->i_next_alloc_goal = newblocknum;
c2050a454c7f12 Deepa Dinamani    2016-09-14  899  	inode->i_ctime = current_time(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  900  
^1da177e4c3f41 Linus Torvalds    2005-04-16  901  	if (IS_SYNC(inode))
^1da177e4c3f41 Linus Torvalds    2005-04-16  902  		udf_sync_inode(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  903  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  904  		mark_inode_dirty(inode);
02d4ca49fa2220 Fabian Frederick  2017-01-06  905  out_free:
02d4ca49fa2220 Fabian Frederick  2017-01-06  906  	brelse(prev_epos.bh);
02d4ca49fa2220 Fabian Frederick  2017-01-06  907  	brelse(cur_epos.bh);
02d4ca49fa2220 Fabian Frederick  2017-01-06  908  	brelse(next_epos.bh);
7b0b0933a3ff60 Jan Kara          2011-12-10 @909  	return newblock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  910  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  911  

:::::: The code at line 909 was first introduced by commit
:::::: 7b0b0933a3ff6052addf4d49ea99f75ab27df2d0 udf: Cleanup calling convention of inode_getblk()

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
