Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D52213E7B
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752519001; cv=none; b=Fg1GdfZTep1GOlBM50H6bgsx0/W1iL/LtjHFhv5Kt4K2/Ml1I1LmMC8vK1ipbxpetGX5OmQk0H4UvWJRngdWWl8323NoqbtFkCDTCyeAKIK4DCqRyAF1sMzndktLLl8ycyjfdESGSfeOzbcMyhZc7ZXTDUihuu/PnLPKziYybv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752519001; c=relaxed/simple;
	bh=4ENEbEabocZhxwKZ0XCWaDzsi8OTd4Jn0LpT1+5gnyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqCGaBvcYkEPK8SmBKfl2CsTvmMIdAcC1bIujkNMrclP8DLDT31QZI/WGN2eXvlfAGtZuSMq1inF/xCv886aY2nFHBVyIzPHL4l8PCSDm7zVN1pl7rM91hBixWyK+9J485tyzT+A776FOoHhJuPHEnNgn4pngb6JogJ/nUWNMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6vD1P0T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6vD1P0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752518999; x=1784054999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ENEbEabocZhxwKZ0XCWaDzsi8OTd4Jn0LpT1+5gnyg=;
  b=Q6vD1P0T0pLaQ8HEFDk56DK451YnoqwWtP3/4/YRmRi1hBA4BcTZAma3
   +sdUuZcjV6p6c8JsAB+D3wW+6zR1cWvNWYPvCIbESX0rzobq1DXHlKQOK
   LiMgJKUf4atnNfORZsw2jJsNccPi/R/5qfFUkjC/JdEoPS4fCBfYEeo3C
   szEWqo5cK5pwP/3NFGa48CToGAwyKLJXViU2Lon+kRsGl+Q/ClI/iDQrN
   trp4djPd/FD1n49Gzdir38yDmcNtXgLM1mdQNiegqI3Kh25fEq4ANUKYG
   guFRoJGScimFKh3ugMDRo4hFiE8ltcpQgsGtMSX9nLTBNMOC/Ye2ohIuL
   A==;
X-CSE-ConnectionGUID: o8VOcO2ASHy5LPxOffXgwg==
X-CSE-MsgGUID: rEB7g7gfS7yEB69hv/pwLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66171343"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="66171343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 11:49:57 -0700
X-CSE-ConnectionGUID: NWUL+EIBTgu/qqhWJanmjA==
X-CSE-MsgGUID: SGsUNdDUR/mzwSYBbTTnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156651282"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 11:49:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubOFM-0009ER-26;
	Mon, 14 Jul 2025 18:49:52 +0000
Date: Tue, 15 Jul 2025 02:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/swapfile.c:3578 __do_sys_swapon() error: uninitialized symbol
 'swap_header'.
Message-ID: <202507150251.o3y0SHWq-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 97b76796ccd07727b58ed739fcd60f2174d5ac18 swap: convert swapon() to use a folio
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150251.o3y0SHWq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150251.o3y0SHWq-lkp@intel.com/

smatch warnings:
mm/swapfile.c:3578 __do_sys_swapon() error: uninitialized symbol 'swap_header'.
mm/swapfile.c:3578 __do_sys_swapon() error: uninitialized symbol 'swap_header'.

vim +/swap_header +3578 mm/swapfile.c

915d4d7bc0d719 Cesar Eduardo Barros    2011-03-22  3343  
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3344  SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3345  {
b85508d7de901c Barry Song              2024-08-08  3346  	struct swap_info_struct *si;
91a27b2a756784 Jeff Layton             2012-10-10  3347  	struct filename *name;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3348  	struct file *swap_file = NULL;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3349  	struct address_space *mapping;
51cc3a6620a6ca Hugh Dickins            2021-09-02  3350  	struct dentry *dentry;
40531542e28324 Cesar Eduardo Barros    2011-03-22  3351  	int prio;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3352  	int error;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3353  	union swap_header *swap_header;
915d4d7bc0d719 Cesar Eduardo Barros    2011-03-22  3354  	int nr_extents;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3355  	sector_t span;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3356  	unsigned long maxpages;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3357  	unsigned char *swap_map = NULL;
0ca0c24e321158 Usama Arif              2024-08-23  3358  	unsigned long *zeromap = NULL;
2a8f9449343260 Shaohua Li              2013-09-11  3359  	struct swap_cluster_info *cluster_info = NULL;
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3360) 	struct folio *folio = NULL;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3361  	struct inode *inode = NULL;
7cbf319234adaa Omar Sandoval           2018-05-25  3362  	bool inced_nr_rotate_swap = false;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3363  
d15cab975459fb Hugh Dickins            2012-03-28  3364  	if (swap_flags & ~SWAP_FLAGS_VALID)
d15cab975459fb Hugh Dickins            2012-03-28  3365  		return -EINVAL;
d15cab975459fb Hugh Dickins            2012-03-28  3366  
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3367  	if (!capable(CAP_SYS_ADMIN))
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3368  		return -EPERM;
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3369  
a2468cc9bfdff6 Aaron Lu                2017-09-06  3370  	if (!swap_avail_heads)
a2468cc9bfdff6 Aaron Lu                2017-09-06  3371  		return -ENOMEM;
a2468cc9bfdff6 Aaron Lu                2017-09-06  3372  
b85508d7de901c Barry Song              2024-08-08  3373  	si = alloc_swap_info();
b85508d7de901c Barry Song              2024-08-08  3374  	if (IS_ERR(si))
b85508d7de901c Barry Song              2024-08-08  3375  		return PTR_ERR(si);
53cbb2435f161f Cesar Eduardo Barros    2011-03-22  3376  
b85508d7de901c Barry Song              2024-08-08  3377  	INIT_WORK(&si->discard_work, swap_discard_work);
815c2c543d3aeb Shaohua Li              2013-09-11  3378  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3379  	name = getname(specialfile);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3380  	if (IS_ERR(name)) {
7de7fb6b3422e6 Cesar Eduardo Barros    2011-03-22  3381  		error = PTR_ERR(name);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3382  		name = NULL;
bd69010b042a60 Cesar Eduardo Barros    2011-03-22  3383  		goto bad_swap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3384  	}
51d908b3db0e58 Al Viro                 2024-04-17  3385  	swap_file = file_open_name(name, O_RDWR | O_LARGEFILE | O_EXCL, 0);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3386  	if (IS_ERR(swap_file)) {
7de7fb6b3422e6 Cesar Eduardo Barros    2011-03-22  3387  		error = PTR_ERR(swap_file);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3388  		swap_file = NULL;
bd69010b042a60 Cesar Eduardo Barros    2011-03-22  3389  		goto bad_swap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3390  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3391  
b85508d7de901c Barry Song              2024-08-08  3392  	si->swap_file = swap_file;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3393  	mapping = swap_file->f_mapping;
51cc3a6620a6ca Hugh Dickins            2021-09-02  3394  	dentry = swap_file->f_path.dentry;
2130781e2aaab6 Cesar Eduardo Barros    2011-03-22  3395  	inode = mapping->host;
6f179af88f60b3 Hugh Dickins            2015-08-17  3396  
b85508d7de901c Barry Song              2024-08-08  3397  	error = claim_swapfile(si, inode);
4d0e1e10752ca4 Cesar Eduardo Barros    2011-03-22  3398  	if (unlikely(error))
^1da177e4c3f41 Linus Torvalds          2005-04-16  3399  		goto bad_swap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3400  
d795a90e2ba024 Naohiro Aota            2020-03-28  3401  	inode_lock(inode);
51cc3a6620a6ca Hugh Dickins            2021-09-02  3402  	if (d_unlinked(dentry) || cant_mount(dentry)) {
51cc3a6620a6ca Hugh Dickins            2021-09-02  3403  		error = -ENOENT;
51cc3a6620a6ca Hugh Dickins            2021-09-02  3404  		goto bad_swap_unlock_inode;
51cc3a6620a6ca Hugh Dickins            2021-09-02  3405  	}
d795a90e2ba024 Naohiro Aota            2020-03-28  3406  	if (IS_SWAPFILE(inode)) {
d795a90e2ba024 Naohiro Aota            2020-03-28  3407  		error = -EBUSY;
d795a90e2ba024 Naohiro Aota            2020-03-28  3408  		goto bad_swap_unlock_inode;
d795a90e2ba024 Naohiro Aota            2020-03-28  3409  	}
d795a90e2ba024 Naohiro Aota            2020-03-28  3410  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3411  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  3412  	 * Read the swap header.
^1da177e4c3f41 Linus Torvalds          2005-04-16  3413  	 */
7e0a126519b826 Matthew Wilcox (Oracle  2022-04-29  3414) 	if (!mapping->a_ops->read_folio) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3415  		error = -EINVAL;
d795a90e2ba024 Naohiro Aota            2020-03-28  3416  		goto bad_swap_unlock_inode;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3417  	}
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3418) 	folio = read_mapping_folio(mapping, 0, swap_file);
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3419) 	if (IS_ERR(folio)) {
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3420) 		error = PTR_ERR(folio);
d795a90e2ba024 Naohiro Aota            2020-03-28  3421  		goto bad_swap_unlock_inode;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3422  	}
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3423) 	swap_header = kmap_local_folio(folio, 0);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3424  
b85508d7de901c Barry Song              2024-08-08  3425  	maxpages = read_swap_header(si, swap_header, inode);
ca8bd38bf6f054 Cesar Eduardo Barros    2011-03-22  3426  	if (unlikely(!maxpages)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3427  		error = -EINVAL;
d795a90e2ba024 Naohiro Aota            2020-03-28  3428  		goto bad_swap_unlock_inode;
5d1854e15ee979 Eric Sandeen            2006-12-06  3429  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3430  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3431  	/* OK, set up the swap map and apply the bad block list */
803d0c8351b47b Cesar Eduardo Barros    2011-03-22  3432  	swap_map = vzalloc(maxpages);
78ecba081224a2 Hugh Dickins            2008-07-23  3433  	if (!swap_map) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3434  		error = -ENOMEM;
d795a90e2ba024 Naohiro Aota            2020-03-28  3435  		goto bad_swap_unlock_inode;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3436  	}
f05714293a5910 Minchan Kim             2017-01-10  3437  
b843786b0bd01c Johannes Weiner         2024-08-22  3438  	error = swap_cgroup_swapon(si->type, maxpages);
b843786b0bd01c Johannes Weiner         2024-08-22  3439  	if (error)
b843786b0bd01c Johannes Weiner         2024-08-22  3440  		goto bad_swap_unlock_inode;
b843786b0bd01c Johannes Weiner         2024-08-22  3441  
b843786b0bd01c Johannes Weiner         2024-08-22  3442  	nr_extents = setup_swap_map_and_extents(si, swap_header, swap_map,
b843786b0bd01c Johannes Weiner         2024-08-22  3443  						maxpages, &span);
b843786b0bd01c Johannes Weiner         2024-08-22  3444  	if (unlikely(nr_extents < 0)) {
b843786b0bd01c Johannes Weiner         2024-08-22  3445  		error = nr_extents;
b843786b0bd01c Johannes Weiner         2024-08-22  3446  		goto bad_swap_unlock_inode;
b843786b0bd01c Johannes Weiner         2024-08-22  3447  	}
b843786b0bd01c Johannes Weiner         2024-08-22  3448  
0ca0c24e321158 Usama Arif              2024-08-23  3449  	/*
0ca0c24e321158 Usama Arif              2024-08-23  3450  	 * Use kvmalloc_array instead of bitmap_zalloc as the allocation order might
0ca0c24e321158 Usama Arif              2024-08-23  3451  	 * be above MAX_PAGE_ORDER incase of a large swap file.
0ca0c24e321158 Usama Arif              2024-08-23  3452  	 */
0ca0c24e321158 Usama Arif              2024-08-23  3453  	zeromap = kvmalloc_array(BITS_TO_LONGS(maxpages), sizeof(long),
0ca0c24e321158 Usama Arif              2024-08-23  3454  				    GFP_KERNEL | __GFP_ZERO);
0ca0c24e321158 Usama Arif              2024-08-23  3455  	if (!zeromap) {
0ca0c24e321158 Usama Arif              2024-08-23  3456  		error = -ENOMEM;
0ca0c24e321158 Usama Arif              2024-08-23  3457  		goto bad_swap_unlock_inode;
0ca0c24e321158 Usama Arif              2024-08-23  3458  	}
0ca0c24e321158 Usama Arif              2024-08-23  3459  
b85508d7de901c Barry Song              2024-08-08  3460  	if (si->bdev && bdev_stable_writes(si->bdev))
b85508d7de901c Barry Song              2024-08-08  3461  		si->flags |= SWP_STABLE_WRITES;
f05714293a5910 Minchan Kim             2017-01-10  3462  
b85508d7de901c Barry Song              2024-08-08  3463  	if (si->bdev && bdev_synchronous(si->bdev))
b85508d7de901c Barry Song              2024-08-08  3464  		si->flags |= SWP_SYNCHRONOUS_IO;
539a6fea7fdcad Minchan Kim             2017-11-15  3465  
b85508d7de901c Barry Song              2024-08-08  3466  	if (si->bdev && bdev_nonrot(si->bdev)) {
b85508d7de901c Barry Song              2024-08-08  3467  		si->flags |= SWP_SOLIDSTATE;
235b62176712b9 Huang, Ying             2017-02-22  3468  
b843786b0bd01c Johannes Weiner         2024-08-22  3469  		cluster_info = setup_clusters(si, swap_header, maxpages);
b843786b0bd01c Johannes Weiner         2024-08-22  3470  		if (IS_ERR(cluster_info)) {
b843786b0bd01c Johannes Weiner         2024-08-22  3471  			error = PTR_ERR(cluster_info);
b843786b0bd01c Johannes Weiner         2024-08-22  3472  			cluster_info = NULL;
d795a90e2ba024 Naohiro Aota            2020-03-28  3473  			goto bad_swap_unlock_inode;
ebc2a1a69111ea Shaohua Li              2013-09-11  3474  		}
7cbf319234adaa Omar Sandoval           2018-05-25  3475  	} else {
81a0298bdfab02 Huang Ying              2017-09-06  3476  		atomic_inc(&nr_rotate_swap);
7cbf319234adaa Omar Sandoval           2018-05-25  3477  		inced_nr_rotate_swap = true;
7cbf319234adaa Omar Sandoval           2018-05-25  3478  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3479  
70200574cc229f Christoph Hellwig       2022-04-15  3480  	if ((swap_flags & SWAP_FLAG_DISCARD) &&
b85508d7de901c Barry Song              2024-08-08  3481  	    si->bdev && bdev_max_discard_sectors(si->bdev)) {
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3482  		/*
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3483  		 * When discard is enabled for swap with no particular
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3484  		 * policy flagged, we set all swap discard flags here in
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3485  		 * order to sustain backward compatibility with older
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3486  		 * swapon(8) releases.
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3487  		 */
b85508d7de901c Barry Song              2024-08-08  3488  		si->flags |= (SWP_DISCARDABLE | SWP_AREA_DISCARD |
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3489  			     SWP_PAGE_DISCARD);
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3490  
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3491  		/*
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3492  		 * By flagging sys_swapon, a sysadmin can tell us to
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3493  		 * either do single-time area discards only, or to just
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3494  		 * perform discards for released swap page-clusters.
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3495  		 * Now it's time to adjust the p->flags accordingly.
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3496  		 */
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3497  		if (swap_flags & SWAP_FLAG_DISCARD_ONCE)
b85508d7de901c Barry Song              2024-08-08  3498  			si->flags &= ~SWP_PAGE_DISCARD;
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3499  		else if (swap_flags & SWAP_FLAG_DISCARD_PAGES)
b85508d7de901c Barry Song              2024-08-08  3500  			si->flags &= ~SWP_AREA_DISCARD;
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3501  
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3502  		/* issue a swapon-time discard if it's still required */
b85508d7de901c Barry Song              2024-08-08  3503  		if (si->flags & SWP_AREA_DISCARD) {
b85508d7de901c Barry Song              2024-08-08  3504  			int err = discard_swap(si);
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3505  			if (unlikely(err))
465c47fd8dc443 Andrew Morton           2013-09-11  3506  				pr_err("swapon: discard_swap(%p): %d\n",
b85508d7de901c Barry Song              2024-08-08  3507  					si, err);
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3508  		}
dcf6b7ddd7df89 Rafael Aquini           2013-07-03  3509  	}
6a6ba83175c029 Hugh Dickins            2009-01-06  3510  
b85508d7de901c Barry Song              2024-08-08  3511  	error = init_swap_address_space(si->type, maxpages);
4b3ef9daa4fc0b Huang, Ying             2017-02-22  3512  	if (error)
d795a90e2ba024 Naohiro Aota            2020-03-28  3513  		goto bad_swap_unlock_inode;
4b3ef9daa4fc0b Huang, Ying             2017-02-22  3514  
b85508d7de901c Barry Song              2024-08-08  3515  	error = zswap_swapon(si->type, maxpages);
bb29fd7760ae39 Chengming Zhou          2024-01-19  3516  	if (error)
bb29fd7760ae39 Chengming Zhou          2024-01-19  3517  		goto free_swap_address_space;
bb29fd7760ae39 Chengming Zhou          2024-01-19  3518  
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3519  	/*
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3520  	 * Flush any pending IO and dirty mappings before we start using this
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3521  	 * swap device.
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3522  	 */
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3523  	inode->i_flags |= S_SWAPFILE;
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3524  	error = inode_drain_writes(inode);
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3525  	if (error) {
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3526  		inode->i_flags &= ~S_SWAPFILE;
bb29fd7760ae39 Chengming Zhou          2024-01-19  3527  		goto free_swap_zswap;
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3528  	}
dc617f29dbe5ef Darrick J. Wong         2019-08-20  3529  
fc0abb1451c64c Ingo Molnar             2006-01-18  3530  	mutex_lock(&swapon_mutex);
40531542e28324 Cesar Eduardo Barros    2011-03-22  3531  	prio = -1;
78ecba081224a2 Hugh Dickins            2008-07-23  3532  	if (swap_flags & SWAP_FLAG_PREFER)
40531542e28324 Cesar Eduardo Barros    2011-03-22  3533  		prio =
78ecba081224a2 Hugh Dickins            2008-07-23  3534  		  (swap_flags & SWAP_FLAG_PRIO_MASK) >> SWAP_FLAG_PRIO_SHIFT;
0ca0c24e321158 Usama Arif              2024-08-23  3535  	enable_swap_info(si, prio, swap_map, cluster_info, zeromap);
c69dbfb84e8850 Cesar Eduardo Barros    2011-03-22  3536  
42c06a0e8ebe95 Johannes Weiner         2023-07-17  3537  	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
b85508d7de901c Barry Song              2024-08-08  3538  		K(si->pages), name->name, si->prio, nr_extents,
00cde0429bc507 ZhangPeng               2023-08-04  3539  		K((unsigned long long)span),
b85508d7de901c Barry Song              2024-08-08  3540  		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
b85508d7de901c Barry Song              2024-08-08  3541  		(si->flags & SWP_DISCARDABLE) ? "D" : "",
b85508d7de901c Barry Song              2024-08-08  3542  		(si->flags & SWP_AREA_DISCARD) ? "s" : "",
b85508d7de901c Barry Song              2024-08-08  3543  		(si->flags & SWP_PAGE_DISCARD) ? "c" : "");
c69dbfb84e8850 Cesar Eduardo Barros    2011-03-22  3544  
fc0abb1451c64c Ingo Molnar             2006-01-18  3545  	mutex_unlock(&swapon_mutex);
66d7dd518ae413 Kay Sievers             2010-10-26  3546  	atomic_inc(&proc_poll_event);
66d7dd518ae413 Kay Sievers             2010-10-26  3547  	wake_up_interruptible(&proc_poll_wait);
66d7dd518ae413 Kay Sievers             2010-10-26  3548  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3549  	error = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3550  	goto out;
bb29fd7760ae39 Chengming Zhou          2024-01-19  3551  free_swap_zswap:
b85508d7de901c Barry Song              2024-08-08  3552  	zswap_swapoff(si->type);
822bca52ee7eb2 Miaohe Lin              2020-10-13  3553  free_swap_address_space:
b85508d7de901c Barry Song              2024-08-08  3554  	exit_swap_address_space(si->type);
d795a90e2ba024 Naohiro Aota            2020-03-28  3555  bad_swap_unlock_inode:
d795a90e2ba024 Naohiro Aota            2020-03-28  3556  	inode_unlock(inode);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3557  bad_swap:
b85508d7de901c Barry Song              2024-08-08  3558  	free_percpu(si->percpu_cluster);
b85508d7de901c Barry Song              2024-08-08  3559  	si->percpu_cluster = NULL;
b85508d7de901c Barry Song              2024-08-08  3560  	free_percpu(si->cluster_next_cpu);
b85508d7de901c Barry Song              2024-08-08  3561  	si->cluster_next_cpu = NULL;
d795a90e2ba024 Naohiro Aota            2020-03-28  3562  	inode = NULL;
b85508d7de901c Barry Song              2024-08-08  3563  	destroy_swap_extents(si);
b85508d7de901c Barry Song              2024-08-08  3564  	swap_cgroup_swapoff(si->type);
5d337b9194b1ce Hugh Dickins            2005-09-03  3565  	spin_lock(&swap_lock);
b85508d7de901c Barry Song              2024-08-08  3566  	si->swap_file = NULL;
b85508d7de901c Barry Song              2024-08-08  3567  	si->flags = 0;
5d337b9194b1ce Hugh Dickins            2005-09-03  3568  	spin_unlock(&swap_lock);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3569  	vfree(swap_map);
0ca0c24e321158 Usama Arif              2024-08-23  3570  	kvfree(zeromap);
8606a1a94da5c4 Darrick J. Wong         2017-09-08  3571  	kvfree(cluster_info);
7cbf319234adaa Omar Sandoval           2018-05-25  3572  	if (inced_nr_rotate_swap)
7cbf319234adaa Omar Sandoval           2018-05-25  3573  		atomic_dec(&nr_rotate_swap);
d795a90e2ba024 Naohiro Aota            2020-03-28  3574  	if (swap_file)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3575  		filp_close(swap_file, NULL);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3576  out:
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26  3577) 	if (!IS_ERR_OR_NULL(folio))
97b76796ccd077 Matthew Wilcox (Oracle  2024-08-26 @3578) 		folio_release_kmap(folio, swap_header);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3579  	if (name)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3580  		putname(name);
1638045c36772b Darrick J. Wong         2019-08-20  3581  	if (inode)
5955102c9984fa Al Viro                 2016-01-22  3582  		inode_unlock(inode);
039939a6505985 Tim Chen                2017-02-22  3583  	if (!error)
039939a6505985 Tim Chen                2017-02-22  3584  		enable_swap_slots_cache();
^1da177e4c3f41 Linus Torvalds          2005-04-16  3585  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3586  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
