Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F01D63FF
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779773; cv=none; b=c5GsqJVtrtGg3KF8LbaEYytHR31xaBff5Sa6USPD1WNrU/wDhMvmeRy8Q3BezegjuyCq0JGtfZN1phuC8S8ENv4DpblweFitsEyDKu3XwnK6fciaUf+3IaOrsOHBRlaiG5CISxXZ7Ektvby4RuMtQrWtPuqckjyOxdeiC+HkePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779773; c=relaxed/simple;
	bh=Wlmt8IxYi26GIh+HR6SeAjyTX7mTS7euqolMWb6NH/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5jt7rjqJtvJ/ipd6Y7d/3R7MPGtCwDeCbrM1JV+8s25Xw92CsFN7R+xfP7OxdeKRK3C3PAxzN6yUqbo5MDoIeZkM4VZ3EwsUNSDHl7j2BRVWYeYl3z2dcOUl0HrPVyKj37K64Hd9JBpTXXUBMhqIamBaNGi1mjCqWj26GZgluo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8L8q/kj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8L8q/kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741779772; x=1773315772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wlmt8IxYi26GIh+HR6SeAjyTX7mTS7euqolMWb6NH/s=;
  b=f8L8q/kj9mSSnq/8f9YjIhkyv12MLb4QZDy4+Rl3t17ak4wE0cbwqXjz
   QYQH5IgIBNhvVj9NxgpR0d/N2Igzf2iTceCj082mZfHy8QriumEhml9bs
   N07X+s0v53utCL+F9eTbJ7Ft9xy3H22lSObBdBbYWcsU91y/LxfWgb6YJ
   1Y8lvEheaLHaoOILzEA+VginqSo/WptuhXsM9QhE89pnPTS9MY8yi/kg+
   melqMQ0QbVZ32ULAaRSPHSng0/1J07kIilB9OPLJcAgrYfDk9JwqskdhC
   18Q8vexRQdhHl93xWrplVsofkpZRYMjaERyxa1Ga0IUwyehn9HqIIZCpi
   A==;
X-CSE-ConnectionGUID: HQjH0GHBRc6CX/Ls8Hn7aw==
X-CSE-MsgGUID: EOeO68/oR7ispyIwNyer9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30436152"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="30436152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:42:51 -0700
X-CSE-ConnectionGUID: JyG4sbXBQQCP0GJyWHIB4w==
X-CSE-MsgGUID: qP7Q/mcFSQujO5xjJ8vYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125662096"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 04:42:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsKU3-0008Ts-1f;
	Wed, 12 Mar 2025 11:42:47 +0000
Date: Wed, 12 Mar 2025 19:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 2/2] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <202503121943.LRPJGfum-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   501e3c4dad2caa7d89416bbca980b0b803316a2e
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [2/2] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 13 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121943.LRPJGfum-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503121943.LRPJGfum-lkp@intel.com/

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
