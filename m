Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD855202C4C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Feb 2025 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739461857; cv=none; b=pJt/AdbhKjxb2CzUOnJIChtSykeVDUfAGBbrMcMAaLstLa0+3bG/Q5kNKoIW+pKzOPsSLtH3dO0lcyseioJV6+sZpVGNjbStvdhfRmprV36NeC25oUTPeX1kEMqd9+Vf8OYH6PnBBcn4I76xS9vi2iL7i6YwG/jDBpKsnaqpyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739461857; c=relaxed/simple;
	bh=CA1twI4V1m+PTO/50uTqBKIfp05yA6lYwHe+cF7hU0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhvNqWfZ1KFcetipTR78IZugWQlG5ZhDSZ3DP5V9T2wXfx6EP5pTiXlbkI1H8SfGI27HlfpdIPoVQjMTw6+He1qPDGD06OtLgMFdd6UXTwM/23tkvWvl69sV09iy0q2uC4+eP1NTjfDZVaYdwhYChHYY5Ane1gf0dWjIwOTII54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNqibgHI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNqibgHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739461855; x=1770997855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CA1twI4V1m+PTO/50uTqBKIfp05yA6lYwHe+cF7hU0o=;
  b=iNqibgHI+7zrZkCMnDeFmwNNvQdT0knPyl2pBpLe8hjufA0URFMaiCS4
   3ITV2vp5oHKsw0a9u4bJM8mtINfw4NtJIh4sc4Y1/EB7BjEC4/QylJhXE
   i2PhrEyJa8IY9o8kPROXv26RcBb7geQDmJsuvm0bakFbGxkZnwX+tdO/q
   8NSjdtiWrW+ap6WUoRLbHMwHAL0Sg25L67dK8P/AF9UBokNQnI4lWqiRT
   X+K6nrSLU9LyC5LMLQ3O9Vh22gHw16ZV9OPmYF45reAU97ojQs4iIAyww
   2RnlzBiH9StSJ8nEUqIgmE/BiY0alul8vYpy48Veruq62E4IhWg5TJxbv
   A==;
X-CSE-ConnectionGUID: WOGbRpSETOybo5s7IK3zxg==
X-CSE-MsgGUID: HnYd6587S2SvJEf2zHa64A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44102482"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44102482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 07:50:55 -0800
X-CSE-ConnectionGUID: IzTQw2LVR9imsln7j0r8CA==
X-CSE-MsgGUID: Ra1x8f1aR3qxvMiUg8ADNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="144032711"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2025 07:50:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tibUJ-0018NP-1C;
	Thu, 13 Feb 2025 15:50:51 +0000
Date: Thu, 13 Feb 2025 23:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2427/3437] fs/btrfs/subpage.c:733
 btrfs_folio_set_lock() warn: variable dereferenced before check 'fs_info'
 (see line 729)
Message-ID: <202502132324.uDXDybX2-lkp@intel.com>
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
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: 8685d7a75e5f60f1432ed677cdf9f5068400bc0d [2427/3437] btrfs: remove btrfs_fs_info::sectors_per_page
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132324.uDXDybX2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502132324.uDXDybX2-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:733 btrfs_folio_set_lock() warn: variable dereferenced before check 'fs_info' (see line 729)

vim +/fs_info +733 fs/btrfs/subpage.c

e55a0de185726c Qu Wenruo 2021-09-27  714  
bca707e54276de Qu Wenruo 2024-02-19  715  /*
bca707e54276de Qu Wenruo 2024-02-19  716   * This is for folio already locked by plain lock_page()/folio_lock(), which
bca707e54276de Qu Wenruo 2024-02-19  717   * doesn't have any subpage awareness.
bca707e54276de Qu Wenruo 2024-02-19  718   *
bca707e54276de Qu Wenruo 2024-02-19  719   * This populates the involved subpage ranges so that subpage helpers can
bca707e54276de Qu Wenruo 2024-02-19  720   * properly unlock them.
bca707e54276de Qu Wenruo 2024-02-19  721   */
0f712026658449 Qu Wenruo 2024-10-09  722  void btrfs_folio_set_lock(const struct btrfs_fs_info *fs_info,
bca707e54276de Qu Wenruo 2024-02-19  723  			  struct folio *folio, u64 start, u32 len)
bca707e54276de Qu Wenruo 2024-02-19  724  {
bca707e54276de Qu Wenruo 2024-02-19  725  	struct btrfs_subpage *subpage;
bca707e54276de Qu Wenruo 2024-02-19  726  	unsigned long flags;
bca707e54276de Qu Wenruo 2024-02-19  727  	unsigned int start_bit;
bca707e54276de Qu Wenruo 2024-02-19  728  	unsigned int nbits;
8685d7a75e5f60 Qu Wenruo 2025-01-24 @729  	const unsigned int blocks_per_folio = btrfs_blocks_per_folio(fs_info, folio);
bca707e54276de Qu Wenruo 2024-02-19  730  	int ret;
bca707e54276de Qu Wenruo 2024-02-19  731  
bca707e54276de Qu Wenruo 2024-02-19  732  	ASSERT(folio_test_locked(folio));
bca707e54276de Qu Wenruo 2024-02-19 @733  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping))
bca707e54276de Qu Wenruo 2024-02-19  734  		return;
bca707e54276de Qu Wenruo 2024-02-19  735  
bca707e54276de Qu Wenruo 2024-02-19  736  	subpage = folio_get_private(folio);
bca707e54276de Qu Wenruo 2024-02-19  737  	start_bit = subpage_calc_start_bit(fs_info, folio, locked, start, len);
bca707e54276de Qu Wenruo 2024-02-19  738  	nbits = len >> fs_info->sectorsize_bits;
bca707e54276de Qu Wenruo 2024-02-19  739  	spin_lock_irqsave(&subpage->lock, flags);
bca707e54276de Qu Wenruo 2024-02-19  740  	/* Target range should not yet be locked. */
61d730731b47ee Qu Wenruo 2024-12-12  741  	if (unlikely(!bitmap_test_range_all_zero(subpage->bitmaps, start_bit, nbits))) {
61d730731b47ee Qu Wenruo 2024-12-12  742  		SUBPAGE_DUMP_BITMAP(fs_info, folio, locked, start, len);
bca707e54276de Qu Wenruo 2024-02-19  743  		ASSERT(bitmap_test_range_all_zero(subpage->bitmaps, start_bit, nbits));
61d730731b47ee Qu Wenruo 2024-12-12  744  	}
bca707e54276de Qu Wenruo 2024-02-19  745  	bitmap_set(subpage->bitmaps, start_bit, nbits);
0f712026658449 Qu Wenruo 2024-10-09  746  	ret = atomic_add_return(nbits, &subpage->nr_locked);
8685d7a75e5f60 Qu Wenruo 2025-01-24  747  	ASSERT(ret <= blocks_per_folio);
bca707e54276de Qu Wenruo 2024-02-19  748  	spin_unlock_irqrestore(&subpage->lock, flags);
bca707e54276de Qu Wenruo 2024-02-19  749  }
bca707e54276de Qu Wenruo 2024-02-19  750  

:::::: The code at line 733 was first introduced by commit
:::::: bca707e54276de828a8cad82b723192374e73e00 btrfs: subpage: introduce helpers to handle subpage delalloc locking

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
