Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7E2F29
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Nov 2025 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762813132; cv=none; b=Oxizb/H6UBC6Q2X76G1ChJ078cEwQaNO3s+qIaChFe6+GWTd+TJJ8OSu1wNcXh6RYUzIOhwCqRFFcLhotJQa8R78h0hjjrxYO1sf6RkTPVI7xqF3joYxnnJyaaYvF3REj6K2UkA0CZcouAk5z8Avf3svhWTaVX0MexVnliJDP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762813132; c=relaxed/simple;
	bh=i/mKtoHCf4IOJsDFMRBepsclp21Nj4Kl4VK/RST5hqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nx3i+YNZPhBCEVg9G4jqZoBfhLenT1f7GNw7HBLEcXnbAkfP4HPktcO7oppMayEftkM7sIQlZR9HTI1a0yJSQdNMRX6bqzTR1quVbuKAM5tTZ6tgnszvIaIi3l+1ACVcnUqfBByyer3kr8sUHBTkxusRCr4NH6pG9/r/NiLEAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJYYloCo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJYYloCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762813130; x=1794349130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/mKtoHCf4IOJsDFMRBepsclp21Nj4Kl4VK/RST5hqI=;
  b=UJYYloCoi3b++lJudh81QOdgGiWlekrn9lSv1X7i3BNIVVKV5bhYheCX
   zgp9QNz77Xku1Dns8cHMlpV5AOjL0iDl/yO+XGJeQWpPxFLFvbCuGLKcS
   2wb3rPLjIyorP5CxOSbzxQHJStlJdKzMhYnJlGmkOKyF8fFwk2pBXhGzp
   3MFCz5oyd4asHyyxgIPFGmVg4WSxw+MLOgMRvKs5MXnRR7SZU3QXgWATR
   GiJoneBF83koYvEr0SMY0tVhde0ajyr05xlgrIBm77VBF3iTPPsYG5IXT
   aq2PEXuZIMvANCssTXpwnWmeXHEmrd2RuNjNrCmASzbxBsum+iSfLBe8o
   g==;
X-CSE-ConnectionGUID: AyiJdBCuSh6saSwJl58UZw==
X-CSE-MsgGUID: 5p0syGPCRbaV2wyewLKTsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75975352"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="75975352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 14:18:48 -0800
X-CSE-ConnectionGUID: nVcsDt9nTsylvyEXf6dHiA==
X-CSE-MsgGUID: ZXQf0zUAQXCUEEJhokYhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="193045068"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 14:18:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIaDk-00014x-0R;
	Mon, 10 Nov 2025 22:18:44 +0000
Date: Tue, 11 Nov 2025 06:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chao:bugfix/common 3/3] fs/f2fs/segment.c:3075 change_curseg()
 error: uninitialized symbol 'sum_node'.
Message-ID: <202511110657.uXJDPyWL-lkp@intel.com>
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
CC: Chao Yu <chao@kernel.org>
TO: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   b7778d525fe14d1d671a7036ab62a3b72488a4f9
commit: b7778d525fe14d1d671a7036ab62a3b72488a4f9 [3/3] [WIP] f2fs: cache entire summary block in curseg
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251110 (https://download.01.org/0day-ci/archive/20251111/202511110657.uXJDPyWL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511110657.uXJDPyWL-lkp@intel.com/

New smatch warnings:
fs/f2fs/segment.c:3075 change_curseg() error: uninitialized symbol 'sum_node'.

Old smatch warnings:
fs/f2fs/segment.c:827 __remove_dirty_segment() warn: check sign expansion for '-1'

vim +/sum_node +3075 fs/f2fs/segment.c

61461fc921b756 Chao Yu                 2021-03-24  3038  
0a8165d7c2cf13 Jaegeuk Kim             2012-11-29  3039  /*
351df4b2011573 Jaegeuk Kim             2012-11-02  3040   * This function always allocates a used segment(from dirty seglist) by SSR
351df4b2011573 Jaegeuk Kim             2012-11-02  3041   * manner, so it should recover the existing segment information of valid blocks
351df4b2011573 Jaegeuk Kim             2012-11-02  3042   */
245930617c9bd8 Zhiguo Niu              2024-03-11  3043  static int change_curseg(struct f2fs_sb_info *sbi, int type)
351df4b2011573 Jaegeuk Kim             2012-11-02  3044  {
351df4b2011573 Jaegeuk Kim             2012-11-02  3045  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
351df4b2011573 Jaegeuk Kim             2012-11-02  3046  	struct curseg_info *curseg = CURSEG_I(sbi, type);
351df4b2011573 Jaegeuk Kim             2012-11-02  3047  	unsigned int new_segno = curseg->next_segno;
b7778d525fe14d Chao Yu                 2025-11-08  3048  	bool exchange_sumblk = GET_SEC_FROM_SEG(sbi, curseg->segno) !=
b7778d525fe14d Chao Yu                 2025-11-08  3049  				GET_SEC_FROM_SEG(sbi, new_segno);
351df4b2011573 Jaegeuk Kim             2012-11-02  3050  
b7778d525fe14d Chao Yu                 2025-11-08  3051  	if (curseg->inited && exchange_sumblk)
e9b020f3803a13 Daeho Jeong             2025-11-04  3052  		write_sum_page(sbi, curseg->sum_blk, curseg->segno);
093749e296e29a Chao Yu                 2020-08-04  3053  
351df4b2011573 Jaegeuk Kim             2012-11-02  3054  	__set_test_and_inuse(sbi, new_segno);
351df4b2011573 Jaegeuk Kim             2012-11-02  3055  
351df4b2011573 Jaegeuk Kim             2012-11-02  3056  	mutex_lock(&dirty_i->seglist_lock);
351df4b2011573 Jaegeuk Kim             2012-11-02  3057  	__remove_dirty_segment(sbi, new_segno, PRE);
351df4b2011573 Jaegeuk Kim             2012-11-02  3058  	__remove_dirty_segment(sbi, new_segno, DIRTY);
351df4b2011573 Jaegeuk Kim             2012-11-02  3059  	mutex_unlock(&dirty_i->seglist_lock);
351df4b2011573 Jaegeuk Kim             2012-11-02  3060  
351df4b2011573 Jaegeuk Kim             2012-11-02  3061  	reset_curseg(sbi, type, 1);
351df4b2011573 Jaegeuk Kim             2012-11-02  3062  	curseg->alloc_type = SSR;
453e2ff8e4ff27 Chao Yu                 2021-04-13  3063  	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
351df4b2011573 Jaegeuk Kim             2012-11-02  3064  
b7778d525fe14d Chao Yu                 2025-11-08  3065  	if (exchange_sumblk) {
b7778d525fe14d Chao Yu                 2025-11-08  3066  		struct f2fs_summary_block *sum_node;
b7778d525fe14d Chao Yu                 2025-11-08  3067  		struct folio *sum_folio;
b7778d525fe14d Chao Yu                 2025-11-08  3068  
0e1073f850fce4 Matthew Wilcox (Oracle  2025-03-31  3069) 		sum_folio = f2fs_get_sum_folio(sbi, new_segno);
0e1073f850fce4 Matthew Wilcox (Oracle  2025-03-31  3070) 		if (IS_ERR(sum_folio)) {
86f33603f8c515 Jaegeuk Kim             2020-10-02  3071  			/* GC won't be able to use stale summary pages by cp_error */
b7778d525fe14d Chao Yu                 2025-11-08  3072  			memset(curseg->sum_blk, 0, F2FS_BLKSIZE);
0e1073f850fce4 Matthew Wilcox (Oracle  2025-03-31  3073) 			return PTR_ERR(sum_folio);
86f33603f8c515 Jaegeuk Kim             2020-10-02  3074  		}
b7778d525fe14d Chao Yu                 2025-11-08 @3075  		memcpy(curseg->sum_blk, sum_node, F2FS_BLKSIZE);
0e1073f850fce4 Matthew Wilcox (Oracle  2025-03-31  3076) 		f2fs_folio_put(sum_folio, true);
b7778d525fe14d Chao Yu                 2025-11-08  3077  	}
245930617c9bd8 Zhiguo Niu              2024-03-11  3078  	return 0;
351df4b2011573 Jaegeuk Kim             2012-11-02  3079  }
351df4b2011573 Jaegeuk Kim             2012-11-02  3080  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
