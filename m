Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97841F95C
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764998; cv=none; b=d7QXgUaPkTAMXBvsgdIDwLE9J8/oCfd+jjz4WxtmJJqIsglB1mzMFV0CjckGmqkt/1P3seb8nRhlN81vUKx8OvJI+dNrKOXStkoTb20rEGSec+Z4YHlC085YHvJmzIdHpOW9c/HEjmVxNdePsS6Ew4/DMTZDHZ2I8PdQrFlT/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764998; c=relaxed/simple;
	bh=TeMWBzw5XaQgeqZgrRWQNgARxPy22ZbVbgZbIQ2Je4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5kQpsj37biTC0LWqwT7byv3c/SrCQkf/O4IqhRI/FFsYRBfbzfINrN4vR3tSL7AAEr7jbzhMseR4cfM7S7NlBPGW38u+4DjZpkzFJIiEFWlDV/y6lKqVOTC8cQdSIPiHLsbdWNDs8js/YuGp59en5ODuJDtcKb27U4Yltc5Igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqyPyJQm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqyPyJQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758764996; x=1790300996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeMWBzw5XaQgeqZgrRWQNgARxPy22ZbVbgZbIQ2Je4I=;
  b=FqyPyJQmSInA6kjKSSxf5cuOYVJcJkE/DSRs7FuYTR1tJ6WdFO4P3DmN
   nfjugcOi/dOlEQRUaqrYkLEtXShEXly9SE1Evh6pNSIBbGQu1x2w4GLmv
   eDE6tqqNNxFOfPm/Iu+yKsQioXlRuhVbcJwoQ0iuwCWbKkeID5NbMsTri
   W06VxSn122FQ7a/b+yxfOY+cmTYprYUUt4AUn3GejwNSDGgYAptc8H28K
   1EBuhwViKrkKg2T7yFYORCIVMXZpO4YheBz58m2OAtB199GywETYuf52e
   Ym6izLpmSwULKYmuuDlGuKWlx5fiiK8VaOjKHpBsMKBv5m7loV+S6zKhO
   A==;
X-CSE-ConnectionGUID: X7E8Snz3RZGE33mengei7g==
X-CSE-MsgGUID: s1bW863LRciSVPbfm1oLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60966634"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60966634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:49:55 -0700
X-CSE-ConnectionGUID: gO5IR21FSL20WN1rKTqa2Q==
X-CSE-MsgGUID: W4ZyhG5fTLiAx3iHZNkbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="182472641"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2025 18:49:52 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1b7G-0004pn-0w;
	Thu, 25 Sep 2025 01:49:50 +0000
Date: Thu, 25 Sep 2025 09:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11380/12207] fs/btrfs/extent_io.c:401
 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be
 null (see line 378)
Message-ID: <202509250925.4L4JQTtn-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5a4da2c459f79a2c87c867398f1c0c315779781
commit: 7b26da407420e5054e3f06c5d13271697add9423 [11380/12207] btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250925.4L4JQTtn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509250925.4L4JQTtn-lkp@intel.com/

smatch warnings:
fs/btrfs/extent_io.c:401 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be null (see line 378)

vim +/fs_info +401 fs/btrfs/extent_io.c

c8b978188c9a0f Chris Mason        2008-10-29  352  
c8b978188c9a0f Chris Mason        2008-10-29  353  /*
3522e90301d7a6 Lu Fengqi          2018-11-29  354   * Find and lock a contiguous range of bytes in the file marked as delalloc, no
2749f7ef3643fe Qu Wenruo          2021-09-27  355   * more than @max_bytes.
c8b978188c9a0f Chris Mason        2008-10-29  356   *
2749f7ef3643fe Qu Wenruo          2021-09-27  357   * @start:	The original start bytenr to search.
2749f7ef3643fe Qu Wenruo          2021-09-27  358   *		Will store the extent range start bytenr.
2749f7ef3643fe Qu Wenruo          2021-09-27  359   * @end:	The original end bytenr of the search range
2749f7ef3643fe Qu Wenruo          2021-09-27  360   *		Will store the extent range end bytenr.
2749f7ef3643fe Qu Wenruo          2021-09-27  361   *
2749f7ef3643fe Qu Wenruo          2021-09-27  362   * Return true if we find a delalloc range which starts inside the original
2749f7ef3643fe Qu Wenruo          2021-09-27  363   * range, and @start/@end will store the delalloc range start/end.
2749f7ef3643fe Qu Wenruo          2021-09-27  364   *
2749f7ef3643fe Qu Wenruo          2021-09-27  365   * Return false if we can't find any delalloc range which starts inside the
2749f7ef3643fe Qu Wenruo          2021-09-27  366   * original range, and @start/@end will be the non-delalloc range start/end.
c8b978188c9a0f Chris Mason        2008-10-29  367   */
ce9f967f31ea91 Johannes Thumshirn 2018-11-19  368  EXPORT_FOR_TESTS
3522e90301d7a6 Lu Fengqi          2018-11-29  369  noinline_for_stack bool find_lock_delalloc_range(struct inode *inode,
c987f1e6d4435a Josef Bacik        2024-07-24  370  						 struct folio *locked_folio,
c987f1e6d4435a Josef Bacik        2024-07-24  371  						 u64 *start, u64 *end)
c8b978188c9a0f Chris Mason        2008-10-29  372  {
41044b41ad2c8c David Sterba       2023-09-14  373  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
9978059be8a1af Goldwyn Rodrigues  2019-06-21  374  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
2749f7ef3643fe Qu Wenruo          2021-09-27  375  	const u64 orig_start = *start;
2749f7ef3643fe Qu Wenruo          2021-09-27  376  	const u64 orig_end = *end;
f7b12a62f008a3 Naohiro Aota       2022-07-09  377  	/* The sanity tests may not set a valid fs_info. */
f7b12a62f008a3 Naohiro Aota       2022-07-09 @378  	u64 max_bytes = fs_info ? fs_info->max_extent_size : BTRFS_MAX_EXTENT_SIZE;
c8b978188c9a0f Chris Mason        2008-10-29  379  	u64 delalloc_start;
c8b978188c9a0f Chris Mason        2008-10-29  380  	u64 delalloc_end;
3522e90301d7a6 Lu Fengqi          2018-11-29  381  	bool found;
9655d2982b53fd Chris Mason        2009-09-02  382  	struct extent_state *cached_state = NULL;
c8b978188c9a0f Chris Mason        2008-10-29  383  	int ret;
c8b978188c9a0f Chris Mason        2008-10-29  384  	int loops = 0;
c8b978188c9a0f Chris Mason        2008-10-29  385  
2749f7ef3643fe Qu Wenruo          2021-09-27  386  	/* Caller should pass a valid @end to indicate the search range end */
2749f7ef3643fe Qu Wenruo          2021-09-27  387  	ASSERT(orig_end > orig_start);
2749f7ef3643fe Qu Wenruo          2021-09-27  388  
c987f1e6d4435a Josef Bacik        2024-07-24  389  	/* The range should at least cover part of the folio */
55cd57faa50346 David Sterba       2025-06-10  390  	ASSERT(!(orig_start >= folio_end(locked_folio) ||
c987f1e6d4435a Josef Bacik        2024-07-24  391  		 orig_end <= folio_pos(locked_folio)));
c8b978188c9a0f Chris Mason        2008-10-29  392  again:
c8b978188c9a0f Chris Mason        2008-10-29  393  	/* step one, find a bunch of delalloc bytes starting at start */
c8b978188c9a0f Chris Mason        2008-10-29  394  	delalloc_start = *start;
c8b978188c9a0f Chris Mason        2008-10-29  395  	delalloc_end = 0;
7b26da407420e5 Qu Wenruo          2025-09-19  396  
7b26da407420e5 Qu Wenruo          2025-09-19  397  	/*
7b26da407420e5 Qu Wenruo          2025-09-19  398  	 * If @max_bytes is smaller than a block, btrfs_find_delalloc_range() can
7b26da407420e5 Qu Wenruo          2025-09-19  399  	 * return early without handling any dirty ranges.
7b26da407420e5 Qu Wenruo          2025-09-19  400  	 */
7b26da407420e5 Qu Wenruo          2025-09-19 @401  	ASSERT(max_bytes >= fs_info->sectorsize);
7b26da407420e5 Qu Wenruo          2025-09-19  402  
083e75e7e6a9e2 Josef Bacik        2019-09-23  403  	found = btrfs_find_delalloc_range(tree, &delalloc_start, &delalloc_end,
c2a128d28a2e78 Josef Bacik        2010-02-02  404  					  max_bytes, &cached_state);
2749f7ef3643fe Qu Wenruo          2021-09-27  405  	if (!found || delalloc_end <= *start || delalloc_start > orig_end) {
c8b978188c9a0f Chris Mason        2008-10-29  406  		*start = delalloc_start;
2749f7ef3643fe Qu Wenruo          2021-09-27  407  
2749f7ef3643fe Qu Wenruo          2021-09-27  408  		/* @delalloc_end can be -1, never go beyond @orig_end */
2749f7ef3643fe Qu Wenruo          2021-09-27  409  		*end = min(delalloc_end, orig_end);
b351161f4f6643 Filipe Manana      2025-04-04  410  		btrfs_free_extent_state(cached_state);
3522e90301d7a6 Lu Fengqi          2018-11-29  411  		return false;
c8b978188c9a0f Chris Mason        2008-10-29  412  	}
c8b978188c9a0f Chris Mason        2008-10-29  413  
70b99e6959a4c2 Chris Mason        2008-10-31  414  	/*
c987f1e6d4435a Josef Bacik        2024-07-24  415  	 * start comes from the offset of locked_folio.  We have to lock
c987f1e6d4435a Josef Bacik        2024-07-24  416  	 * folios in order, so we can't process delalloc bytes before
c987f1e6d4435a Josef Bacik        2024-07-24  417  	 * locked_folio
70b99e6959a4c2 Chris Mason        2008-10-31  418  	 */
d397712bcc6a75 Chris Mason        2009-01-05  419  	if (delalloc_start < *start)
70b99e6959a4c2 Chris Mason        2008-10-31  420  		delalloc_start = *start;
70b99e6959a4c2 Chris Mason        2008-10-31  421  
c8b978188c9a0f Chris Mason        2008-10-29  422  	/*
c987f1e6d4435a Josef Bacik        2024-07-24  423  	 * make sure to limit the number of folios we try to lock down
c8b978188c9a0f Chris Mason        2008-10-29  424  	 */
7bf811a595a895 Josef Bacik        2013-10-07  425  	if (delalloc_end + 1 - delalloc_start > max_bytes)
7bf811a595a895 Josef Bacik        2013-10-07  426  		delalloc_end = delalloc_start + max_bytes - 1;
d397712bcc6a75 Chris Mason        2009-01-05  427  
17dc82dc1e77a6 David Sterba       2025-08-22  428  	/* step two, lock all the folios after the folios that has start */
e4d80ebe50de25 Josef Bacik        2024-07-24  429  	ret = lock_delalloc_folios(inode, locked_folio, delalloc_start,
e4d80ebe50de25 Josef Bacik        2024-07-24  430  				   delalloc_end);
9bfd61d9755a51 Nikolay Borisov    2018-10-26  431  	ASSERT(!ret || ret == -EAGAIN);
c8b978188c9a0f Chris Mason        2008-10-29  432  	if (ret == -EAGAIN) {
7b26da407420e5 Qu Wenruo          2025-09-19  433  		/*
7b26da407420e5 Qu Wenruo          2025-09-19  434  		 * Some of the folios are gone, lets avoid looping by
7b26da407420e5 Qu Wenruo          2025-09-19  435  		 * shortening the size of the delalloc range we're searching.
c8b978188c9a0f Chris Mason        2008-10-29  436  		 */
b351161f4f6643 Filipe Manana      2025-04-04  437  		btrfs_free_extent_state(cached_state);
7d78874273463a Chris Mason        2014-05-21  438  		cached_state = NULL;
c8b978188c9a0f Chris Mason        2008-10-29  439  		if (!loops) {
7b26da407420e5 Qu Wenruo          2025-09-19  440  			max_bytes = fs_info->sectorsize;
c8b978188c9a0f Chris Mason        2008-10-29  441  			loops = 1;
c8b978188c9a0f Chris Mason        2008-10-29  442  			goto again;
c8b978188c9a0f Chris Mason        2008-10-29  443  		} else {
3522e90301d7a6 Lu Fengqi          2018-11-29  444  			found = false;
c8b978188c9a0f Chris Mason        2008-10-29  445  			goto out_failed;
c8b978188c9a0f Chris Mason        2008-10-29  446  		}
c8b978188c9a0f Chris Mason        2008-10-29  447  	}
c8b978188c9a0f Chris Mason        2008-10-29  448  
c8b978188c9a0f Chris Mason        2008-10-29  449  	/* step three, lock the state bits for the whole range */
242570e80bfdf3 Filipe Manana      2025-03-31  450  	btrfs_lock_extent(tree, delalloc_start, delalloc_end, &cached_state);
c8b978188c9a0f Chris Mason        2008-10-29  451  
c8b978188c9a0f Chris Mason        2008-10-29  452  	/* then test to make sure it is all still delalloc */
f81c2aea711205 Filipe Manana      2025-04-04  453  	ret = btrfs_test_range_bit(tree, delalloc_start, delalloc_end,
893fe243999466 David Sterba       2020-08-14  454  				   EXTENT_DELALLOC, cached_state);
c0707c9e1e36d5 Josef Bacik        2024-02-12  455  
242570e80bfdf3 Filipe Manana      2025-03-31  456  	btrfs_unlock_extent(tree, delalloc_start, delalloc_end, &cached_state);
c8b978188c9a0f Chris Mason        2008-10-29  457  	if (!ret) {
2b41599bff1714 David Sterba       2025-01-09  458  		unlock_delalloc_folio(inode, locked_folio, delalloc_start,
79be4a28d834ea Josef Bacik        2024-07-24  459  				      delalloc_end);
c8b978188c9a0f Chris Mason        2008-10-29  460  		cond_resched();
c8b978188c9a0f Chris Mason        2008-10-29  461  		goto again;
c8b978188c9a0f Chris Mason        2008-10-29  462  	}
c8b978188c9a0f Chris Mason        2008-10-29  463  	*start = delalloc_start;
c8b978188c9a0f Chris Mason        2008-10-29  464  	*end = delalloc_end;
c8b978188c9a0f Chris Mason        2008-10-29  465  out_failed:
c8b978188c9a0f Chris Mason        2008-10-29  466  	return found;
c8b978188c9a0f Chris Mason        2008-10-29  467  }
c8b978188c9a0f Chris Mason        2008-10-29  468  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
