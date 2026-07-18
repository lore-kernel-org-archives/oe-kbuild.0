Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD52D73B5
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344988; cv=none; b=aQhetOoUlaTiM08x6bwQad9wORhy+aQkTJ0U05J8tJ/qWCcQotgntc91UUfER63YokblP+8OKU32KFPPsiyrPdTkgBH4U+VYvRXjlB2jlZInXscnD5rGw+uSUCutY/XL6USl7TZFTGlG6VbJM31FdpTxy6QID/NB5tf/BA2+7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344988; c=relaxed/simple;
	bh=GQEVaIAaiBv7SNZ6H7hzGF3a17nygPGa0wbHkF/xHfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnJ6A7PinfGuC4q0RGFHXspumcDkX796UYfl4NYIR5sMCp/N9eIB0gFLknKqbrJW6ddflq9wgr+tCtm8sI7ELnmMknkRUjLk2vAqaWy11DDDhQd0zNmYc3+CK1VsynRUEjgyVKRM0T1HHER3jKAq+Q1Q5QUhIIPPjY+ztBMsDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myPsB4cg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myPsB4cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784344986; x=1815880986;
  h=date:from:to:cc:subject:message-id;
  bh=GQEVaIAaiBv7SNZ6H7hzGF3a17nygPGa0wbHkF/xHfw=;
  b=myPsB4cgohlXEMnqbCjAmlUcdrDZY6tag4a+SNVTOjAa6FFPfvdquH6A
   vpjuqjBr5ak/0I2/+RIeiMP0OEDokrinNOdYVGY42QNz5A18kV+jBtMbl
   jb28HlkefzmUHt4DWJSMFnUbKJES47yEBO+l9h4fJ2kuGrNw9/lWH20GK
   w2fWm2TFSYhC0zOky4qpOUtfsHvC0cA3Hy23csV0HH3WZb2QfMHrxDqAy
   FrQqpcWme9Pj6mE4Z76VIl/C+ob0S8DISOTqtQOLinhOFFZLzhaM4weWt
   4FIJKCOiT0oZ0v0fwrFO9PUpH2hMeyKVgVHyUSNbiFsaouupRLfFebcfk
   A==;
X-CSE-ConnectionGUID: giYHNtdxQqGfOVc1tr7JcQ==
X-CSE-MsgGUID: ZuqLCHqgTraYyXuRDFFZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88832821"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88832821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:23:02 -0700
X-CSE-ConnectionGUID: 5b8q/vQXSkOE1gF3dEiqLQ==
X-CSE-MsgGUID: nYivCHllT5Wtzzd+p2qLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261911141"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 20:23:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvdi-00000000TQ1-3yDL;
	Sat, 18 Jul 2026 03:22:58 +0000
Date: Sat, 18 Jul 2026 11:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-crc 9/51] fs/iomap/ioend.c:246
 iomap_add_to_ioend() warn: bitwise AND condition is false here
Message-ID: <202607181110.ufaVKPb7-lkp@intel.com>
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
commit: a77902e5f160c28d37d861f2317c8c05d820f471 [9/51] iomap: add a IOMAP_IOEND_INTEGRITY flag
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: nios2-randconfig-r071-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181110.ufaVKPb7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607181110.ufaVKPb7-lkp@intel.com/

New smatch warnings:
fs/iomap/ioend.c:246 iomap_add_to_ioend() warn: bitwise AND condition is false here

Old smatch warnings:
fs/iomap/internal.h:15 iomap_max_bio_size() warn: bitwise AND condition is false here

vim +246 fs/iomap/ioend.c

8f02cecd80b993 Christoph Hellwig 2025-07-10  201  
8f02cecd80b993 Christoph Hellwig 2025-07-10  202  /*
8f02cecd80b993 Christoph Hellwig 2025-07-10  203   * Test to see if we have an existing ioend structure that we could append to
8f02cecd80b993 Christoph Hellwig 2025-07-10  204   * first; otherwise finish off the current ioend and start another.
8f02cecd80b993 Christoph Hellwig 2025-07-10  205   *
8f02cecd80b993 Christoph Hellwig 2025-07-10  206   * If a new ioend is created and cached, the old ioend is submitted to the block
8f02cecd80b993 Christoph Hellwig 2025-07-10  207   * layer instantly.  Batching optimisations are provided by higher level block
8f02cecd80b993 Christoph Hellwig 2025-07-10  208   * plugging.
8f02cecd80b993 Christoph Hellwig 2025-07-10  209   *
8f02cecd80b993 Christoph Hellwig 2025-07-10  210   * At the end of a writeback pass, there will be a cached ioend remaining on the
8f02cecd80b993 Christoph Hellwig 2025-07-10  211   * writepage context that the caller will need to submit.
8f02cecd80b993 Christoph Hellwig 2025-07-10  212   */
8f02cecd80b993 Christoph Hellwig 2025-07-10  213  ssize_t iomap_add_to_ioend(struct iomap_writepage_ctx *wpc, struct folio *folio,
8f02cecd80b993 Christoph Hellwig 2025-07-10  214  		loff_t pos, loff_t end_pos, unsigned int dirty_len)
8f02cecd80b993 Christoph Hellwig 2025-07-10  215  {
8f02cecd80b993 Christoph Hellwig 2025-07-10  216  	struct iomap_ioend *ioend = wpc->wb_ctx;
8f02cecd80b993 Christoph Hellwig 2025-07-10  217  	size_t poff = offset_in_folio(folio, pos);
8f02cecd80b993 Christoph Hellwig 2025-07-10  218  	unsigned int ioend_flags = 0;
8f02cecd80b993 Christoph Hellwig 2025-07-10  219  	unsigned int map_len = min_t(u64, dirty_len,
8f02cecd80b993 Christoph Hellwig 2025-07-10  220  		wpc->iomap.offset + wpc->iomap.length - pos);
8f02cecd80b993 Christoph Hellwig 2025-07-10  221  	int error;
8f02cecd80b993 Christoph Hellwig 2025-07-10  222  
8f02cecd80b993 Christoph Hellwig 2025-07-10  223  	trace_iomap_add_to_ioend(wpc->inode, pos, dirty_len, &wpc->iomap);
8f02cecd80b993 Christoph Hellwig 2025-07-10  224  
8f02cecd80b993 Christoph Hellwig 2025-07-10  225  	WARN_ON_ONCE(!folio->private && map_len < dirty_len);
8f02cecd80b993 Christoph Hellwig 2025-07-10  226  
8f02cecd80b993 Christoph Hellwig 2025-07-10  227  	switch (wpc->iomap.type) {
d320f160aa5ff3 Darrick J. Wong   2026-03-02  228  	case IOMAP_UNWRITTEN:
d320f160aa5ff3 Darrick J. Wong   2026-03-02  229  		ioend_flags |= IOMAP_IOEND_UNWRITTEN;
d320f160aa5ff3 Darrick J. Wong   2026-03-02  230  		break;
d320f160aa5ff3 Darrick J. Wong   2026-03-02  231  	case IOMAP_MAPPED:
d320f160aa5ff3 Darrick J. Wong   2026-03-02  232  		break;
8f02cecd80b993 Christoph Hellwig 2025-07-10  233  	case IOMAP_HOLE:
8f02cecd80b993 Christoph Hellwig 2025-07-10  234  		return map_len;
8f02cecd80b993 Christoph Hellwig 2025-07-10  235  	default:
d320f160aa5ff3 Darrick J. Wong   2026-03-02  236  		WARN_ON_ONCE(1);
d320f160aa5ff3 Darrick J. Wong   2026-03-02  237  		return -EIO;
8f02cecd80b993 Christoph Hellwig 2025-07-10  238  	}
8f02cecd80b993 Christoph Hellwig 2025-07-10  239  
8f02cecd80b993 Christoph Hellwig 2025-07-10  240  	if (wpc->iomap.flags & IOMAP_F_SHARED)
8f02cecd80b993 Christoph Hellwig 2025-07-10  241  		ioend_flags |= IOMAP_IOEND_SHARED;
8f02cecd80b993 Christoph Hellwig 2025-07-10  242  	if (folio_test_dropbehind(folio))
8f02cecd80b993 Christoph Hellwig 2025-07-10  243  		ioend_flags |= IOMAP_IOEND_DONTCACHE;
8f02cecd80b993 Christoph Hellwig 2025-07-10  244  	if (pos == wpc->iomap.offset && (wpc->iomap.flags & IOMAP_F_BOUNDARY))
8f02cecd80b993 Christoph Hellwig 2025-07-10  245  		ioend_flags |= IOMAP_IOEND_BOUNDARY;
a77902e5f160c2 Christoph Hellwig 2026-07-07 @246  	if (wpc->iomap.flags & IOMAP_F_INTEGRITY)
a77902e5f160c2 Christoph Hellwig 2026-07-07  247  		ioend_flags |= IOMAP_IOEND_INTEGRITY;
8f02cecd80b993 Christoph Hellwig 2025-07-10  248  
0b10a370529cbd Christoph Hellwig 2026-02-23  249  	if (!ioend || !iomap_can_add_to_ioend(wpc, pos, map_len, ioend_flags)) {
8f02cecd80b993 Christoph Hellwig 2025-07-10  250  new_ioend:
8f02cecd80b993 Christoph Hellwig 2025-07-10  251  		if (ioend) {
8f02cecd80b993 Christoph Hellwig 2025-07-10  252  			error = wpc->ops->writeback_submit(wpc, 0);
8f02cecd80b993 Christoph Hellwig 2025-07-10  253  			if (error)
8f02cecd80b993 Christoph Hellwig 2025-07-10  254  				return error;
8f02cecd80b993 Christoph Hellwig 2025-07-10  255  		}
8f02cecd80b993 Christoph Hellwig 2025-07-10  256  		wpc->wb_ctx = ioend = iomap_alloc_ioend(wpc, pos, ioend_flags);
8f02cecd80b993 Christoph Hellwig 2025-07-10  257  	}
8f02cecd80b993 Christoph Hellwig 2025-07-10  258  
8f02cecd80b993 Christoph Hellwig 2025-07-10  259  	if (!bio_add_folio(&ioend->io_bio, folio, map_len, poff))
8f02cecd80b993 Christoph Hellwig 2025-07-10  260  		goto new_ioend;
8f02cecd80b993 Christoph Hellwig 2025-07-10  261  
8f02cecd80b993 Christoph Hellwig 2025-07-10  262  	/*
8f02cecd80b993 Christoph Hellwig 2025-07-10  263  	 * Clamp io_offset and io_size to the incore EOF so that ondisk
8f02cecd80b993 Christoph Hellwig 2025-07-10  264  	 * file size updates in the ioend completion are byte-accurate.
8f02cecd80b993 Christoph Hellwig 2025-07-10  265  	 * This avoids recovering files with zeroed tail regions when
8f02cecd80b993 Christoph Hellwig 2025-07-10  266  	 * writeback races with appending writes:
8f02cecd80b993 Christoph Hellwig 2025-07-10  267  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  268  	 *    Thread 1:                  Thread 2:
8f02cecd80b993 Christoph Hellwig 2025-07-10  269  	 *    ------------               -----------
8f02cecd80b993 Christoph Hellwig 2025-07-10  270  	 *    write [A, A+B]
8f02cecd80b993 Christoph Hellwig 2025-07-10  271  	 *    update inode size to A+B
8f02cecd80b993 Christoph Hellwig 2025-07-10  272  	 *    submit I/O [A, A+BS]
8f02cecd80b993 Christoph Hellwig 2025-07-10  273  	 *                               write [A+B, A+B+C]
8f02cecd80b993 Christoph Hellwig 2025-07-10  274  	 *                               update inode size to A+B+C
8f02cecd80b993 Christoph Hellwig 2025-07-10  275  	 *    <I/O completes, updates disk size to min(A+B+C, A+BS)>
8f02cecd80b993 Christoph Hellwig 2025-07-10  276  	 *    <power failure>
8f02cecd80b993 Christoph Hellwig 2025-07-10  277  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  278  	 *  After reboot:
8f02cecd80b993 Christoph Hellwig 2025-07-10  279  	 *    1) with A+B+C < A+BS, the file has zero padding in range
8f02cecd80b993 Christoph Hellwig 2025-07-10  280  	 *       [A+B, A+B+C]
8f02cecd80b993 Christoph Hellwig 2025-07-10  281  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  282  	 *    |<     Block Size (BS)   >|
8f02cecd80b993 Christoph Hellwig 2025-07-10  283  	 *    |DDDDDDDDDDDD0000000000000|
8f02cecd80b993 Christoph Hellwig 2025-07-10  284  	 *    ^           ^        ^
8f02cecd80b993 Christoph Hellwig 2025-07-10  285  	 *    A          A+B     A+B+C
8f02cecd80b993 Christoph Hellwig 2025-07-10  286  	 *                       (EOF)
8f02cecd80b993 Christoph Hellwig 2025-07-10  287  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  288  	 *    2) with A+B+C > A+BS, the file has zero padding in range
8f02cecd80b993 Christoph Hellwig 2025-07-10  289  	 *       [A+B, A+BS]
8f02cecd80b993 Christoph Hellwig 2025-07-10  290  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  291  	 *    |<     Block Size (BS)   >|<     Block Size (BS)    >|
8f02cecd80b993 Christoph Hellwig 2025-07-10  292  	 *    |DDDDDDDDDDDD0000000000000|00000000000000000000000000|
8f02cecd80b993 Christoph Hellwig 2025-07-10  293  	 *    ^           ^             ^           ^
8f02cecd80b993 Christoph Hellwig 2025-07-10  294  	 *    A          A+B           A+BS       A+B+C
8f02cecd80b993 Christoph Hellwig 2025-07-10  295  	 *                             (EOF)
8f02cecd80b993 Christoph Hellwig 2025-07-10  296  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  297  	 *    D = Valid Data
8f02cecd80b993 Christoph Hellwig 2025-07-10  298  	 *    0 = Zero Padding
8f02cecd80b993 Christoph Hellwig 2025-07-10  299  	 *
8f02cecd80b993 Christoph Hellwig 2025-07-10  300  	 * Note that this defeats the ability to chain the ioends of
8f02cecd80b993 Christoph Hellwig 2025-07-10  301  	 * appending writes.
8f02cecd80b993 Christoph Hellwig 2025-07-10  302  	 */
8f02cecd80b993 Christoph Hellwig 2025-07-10  303  	ioend->io_size += map_len;
55ec50d046c03b Morduan Zang      2026-06-24  304  	if (ioend->io_offset + ioend->io_size > end_pos) {
55ec50d046c03b Morduan Zang      2026-06-24  305  		if (ioend->io_offset >= end_pos)
55ec50d046c03b Morduan Zang      2026-06-24  306  			ioend->io_size = 0;
55ec50d046c03b Morduan Zang      2026-06-24  307  		else
8f02cecd80b993 Christoph Hellwig 2025-07-10  308  			ioend->io_size = end_pos - ioend->io_offset;
55ec50d046c03b Morduan Zang      2026-06-24  309  	}
8f02cecd80b993 Christoph Hellwig 2025-07-10  310  
8f02cecd80b993 Christoph Hellwig 2025-07-10  311  	wbc_account_cgroup_owner(wpc->wbc, folio, map_len);
8f02cecd80b993 Christoph Hellwig 2025-07-10  312  	return map_len;
8f02cecd80b993 Christoph Hellwig 2025-07-10  313  }
8f02cecd80b993 Christoph Hellwig 2025-07-10  314  EXPORT_SYMBOL_GPL(iomap_add_to_ioend);
8f02cecd80b993 Christoph Hellwig 2025-07-10  315  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
