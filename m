Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3C43147
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206023; cv=none; b=gK0p5xExxR5uUjikl1A3cUQyHONqGx4cDL0unmlwas+QDp5RrtgQxtpVmIDtIdzs7/98maR/0XEDU2v8TmOnLc+ZDj7w0vsde52VE5nYqGzPTrOTJ01WxKiKjnv4fYKtXQyAv9e+y/yS0cPTKTz3oqzsqwVsiArjVLtbl57YEMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206023; c=relaxed/simple;
	bh=zio391cJrq9JZW+EwYvWnEKe/XOQz6robULjJulWNz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X51ORuX7JTbe/21XysnCXKclFIUu2jqPcdrKag4iEafsGjlk/hkGwb4piFtpzUCinfBv730kLzEleO6+GormI3fTWjZeuk08msx5Q8UqZThokgb9oBQunCskvnYS65lNcTyRzVgKhHB8ti+5FKrJoFBH7tytEYbnKvTce6Y8cxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gT7IJACQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gT7IJACQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206023; x=1806742023;
  h=date:from:to:cc:subject:message-id;
  bh=zio391cJrq9JZW+EwYvWnEKe/XOQz6robULjJulWNz8=;
  b=gT7IJACQTgY06oPDjEe9wENxWIB0WQa7xUP+YgfpugYCzFcvdbQ62YtE
   4PAicd33UVhkZ9hRHR7cfHQLIdP5EWiAPWVZPyNlUEV/h1m1IuDtxPo1V
   9GUqiwoecsvrF4B6imbQob2fqGieYbHRGCPvNJpswupOS+TyE/xxwR0FI
   jJV7wEnxui+1yCauIIOyuU+MNU4r/2/ueHfJi259IL4iKwmu2M3D1HmF9
   jPoZNUCljDrMULA3IV9X9svMi2rvegjhg5BIA0Z6QcoJ6UDbo2GvL5Vos
   K4Vk63L1ASD4CBGyueO9+Kci9vDZwfopXp9xCHhTVdyyqjk8EBMWGRWWe
   g==;
X-CSE-ConnectionGUID: VC8OqKjxQT+EKrrfElmXKQ==
X-CSE-MsgGUID: rLLXMnXSQzOQ8MmnkuZmbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889130"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: J+M1i/ItRRy89nEsZh4ELQ==
X-CSE-MsgGUID: GSjqWSY7RF2P1SMkCU0BEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="231605136"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2026 01:47:00 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016j-3ENG;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-poly-aosp-pixel-malibu 4/4]
 fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable
 dereferenced before check 'fs_info' (see line 326)
Message-ID: <202604031213.e0emRUH0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   aa00e9e9abd8b1848b806e405774c2145acdf1f3
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [4/4] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 27 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260331 (https://download.01.org/0day-ci/archive/20260403/202604031213.e0emRUH0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031213.e0emRUH0-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c

1e1de38792e0ae2 Qu Wenruo 2021-05-31  321  
0138f46fea3f5a2 Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
bd610c0937aaf03 Qu Wenruo 2024-09-02  323  				 struct folio *folio, unsigned long bitmap)
bd610c0937aaf03 Qu Wenruo 2024-09-02  324  {
bd610c0937aaf03 Qu Wenruo 2024-09-02  325  	struct btrfs_subpage *subpage = folio_get_private(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02 @326  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
bd610c0937aaf03 Qu Wenruo 2024-09-02  327  	unsigned long flags;
bd610c0937aaf03 Qu Wenruo 2024-09-02  328  	bool last = false;
bd610c0937aaf03 Qu Wenruo 2024-09-02  329  	int cleared = 0;
bd610c0937aaf03 Qu Wenruo 2024-09-02  330  	int bit;
bd610c0937aaf03 Qu Wenruo 2024-09-02  331  
bd610c0937aaf03 Qu Wenruo 2024-09-02 @332  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
bd610c0937aaf03 Qu Wenruo 2024-09-02  333  		folio_unlock(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02  334  		return;
bd610c0937aaf03 Qu Wenruo 2024-09-02  335  	}
bd610c0937aaf03 Qu Wenruo 2024-09-02  336  
0138f46fea3f5a2 Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
0138f46fea3f5a2 Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf03 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02  340  		return;
bd610c0937aaf03 Qu Wenruo 2024-09-02  341  	}
bd610c0937aaf03 Qu Wenruo 2024-09-02  342  
bd610c0937aaf03 Qu Wenruo 2024-09-02  343  	spin_lock_irqsave(&subpage->lock, flags);
bd610c0937aaf03 Qu Wenruo 2024-09-02  344  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
bd610c0937aaf03 Qu Wenruo 2024-09-02  345  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
bd610c0937aaf03 Qu Wenruo 2024-09-02  346  			cleared++;
bd610c0937aaf03 Qu Wenruo 2024-09-02  347  	}
0138f46fea3f5a2 Qu Wenruo 2024-10-09  348  	ASSERT(atomic_read(&subpage->nr_locked) >= cleared);
0138f46fea3f5a2 Qu Wenruo 2024-10-09  349  	last = atomic_sub_and_test(cleared, &subpage->nr_locked);
bd610c0937aaf03 Qu Wenruo 2024-09-02  350  	spin_unlock_irqrestore(&subpage->lock, flags);
bd610c0937aaf03 Qu Wenruo 2024-09-02  351  	if (last)
bd610c0937aaf03 Qu Wenruo 2024-09-02  352  		folio_unlock(folio);
bd610c0937aaf03 Qu Wenruo 2024-09-02  353  }
bd610c0937aaf03 Qu Wenruo 2024-09-02  354  

:::::: The code at line 332 was first introduced by commit
:::::: bd610c0937aaf03b2835638ada1fab8b0524c61a btrfs: only unlock the to-be-submitted ranges inside a folio

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
