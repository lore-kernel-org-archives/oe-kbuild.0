Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584533;
	b=CMhxqs9ZQPk1GAZ+nmmEFQ/5lZQQHPwHxLOJXYnVXOhFEL4JODAAo89bZqYZPRthRR09
	 c+W7OJCx07m9iyI4Q8nciJcvpE8izM6K/1JV5WRiiWvkDhWu7W89NXuU0/Xj05s30QHtm
	 UmwcHbbF92IGfb2LvR4+AK2NcNUfr2hIGaTp0y8nNjxMLv176EJPOL1ODlV5ZTXEVq3z2
	 mJBi5BlSAR033uESqbr5rdPQp2YUH5xL7luTqPJl7xU1lHU96gH0cjPbJRLaR5sMFUEYk
	 /YaA4jSaFZQggneUHXWS+tVv3qsxf77OSdatE3HYj+n6ACUFlzdErwtLKmtCCqbaVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584533;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HtF0rCGCuAi0eNkZeuWbAzpIWVFp4G/WnmEbSy6TL3g=;
	b=LBDUwiuSgI9M2eCTtTitug19fsb194Idw/2Kgr1ey30pSYHCbJlqvq64RSHNjKX+1mBa
	 3vE0D8kgRUICTA4YSxyydVb3sJLZhwvo9wgpsWNW6hs6Kx17lprN4n7Z2ramgCaIm86NS
	 qQTrz0/Me1tHS79nM8FTYRA665FIWkAPOgwV+Hph6BDRTH3CgNTbsCU60PPwSw0CHiuPS
	 ol/KOE/dJ2n3jQQXV0IPp4UAGvL3BjZrUZZCo46xkhdkNEv1AnNpXOJJ2SnNg/TBIX5Px
	 wSIzILtX7gBK+pCE9Y//sDFed+kx2GokrXtVD+aMQcyNpu3FXPiEn0mQBAs389OtLNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z1bxsfWQ;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F1606A32E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 15:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B8F1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z1bxsfWQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794584533; x=1826120533;
  h=date:from:to:cc:subject:message-id;
  bh=hsvJwmo+4SlzxgCxVwWl3sT2SDgk09wU8BsA4PAGtfk=;
  b=Z1bxsfWQmdsHShlVNA+v9INgQNX2dGGrOEw07YIbYN23mXjYuCKasH71
   IV4dFBbeZ3DuylSiIb1M3qR9Dwagl9Ib2BHL0UznT8bFd5hNo+Aqd6wgF
   g6w1XI4h9FTbuZUwDJEJW1p8NaqLRmOGBx8cIUuIhpIsP0KlY53ZD4n61
   odk1m/CJPKcyzAXi/fz9ZrYk0BOfOCas9OMlT7w2IJAeC7pwhBh1qGjXN
   wJC/2/V5M/N9QJw67Iy9nvPjLK+FI6DjIkOenfROuyEvPjUHP16bUe7Jy
   VmNgRBaljzBvMblEx/+bmY+hh6j+OhLTFCa4+vD/lP/cfrDcaMMwfd2Rp
   A==;
X-CSE-ConnectionGUID: y00DIaCXQGe0mMrtynek4Q==
X-CSE-MsgGUID: 9BtXZacKTCq0RZnuc53+kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3422199"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3422199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:42:08 -0800
X-CSE-ConnectionGUID: L++bGagHSHqfysEIp+rGow==
X-CSE-MsgGUID: khWNoeB0Rb+deb26U2EWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8795842"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2026 07:42:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRtPc-000000001IJ-3exe;
	Fri, 13 Nov 2026 15:42:00 +0000
Date: Fri, 13 Nov 2026 16:41:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 1/1] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <202611131629.SXBAJFYx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2dd32fade2dca128646233fe3da83b8bd13a3f45
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [1/1] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 9 months ago
config: x86_64-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131629.SXBAJFYx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131629.SXBAJFYx-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c

1e1de38792e0ae Qu Wenruo 2021-05-31  321  
0138f46fea3f5a Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
bd610c0937aaf0 Qu Wenruo 2024-09-02  323  				 struct folio *folio, unsigned long bitmap)
bd610c0937aaf0 Qu Wenruo 2024-09-02  324  {
bd610c0937aaf0 Qu Wenruo 2024-09-02  325  	struct btrfs_subpage *subpage = folio_get_private(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02 @326  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
bd610c0937aaf0 Qu Wenruo 2024-09-02  327  	unsigned long flags;
bd610c0937aaf0 Qu Wenruo 2024-09-02  328  	bool last = false;
bd610c0937aaf0 Qu Wenruo 2024-09-02  329  	int cleared = 0;
bd610c0937aaf0 Qu Wenruo 2024-09-02  330  	int bit;
bd610c0937aaf0 Qu Wenruo 2024-09-02  331  
bd610c0937aaf0 Qu Wenruo 2024-09-02 @332  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  333  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  334  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  335  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  336  
0138f46fea3f5a Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
0138f46fea3f5a Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf0 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  340  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  341  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  342  
bd610c0937aaf0 Qu Wenruo 2024-09-02  343  	spin_lock_irqsave(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  344  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  345  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
bd610c0937aaf0 Qu Wenruo 2024-09-02  346  			cleared++;
bd610c0937aaf0 Qu Wenruo 2024-09-02  347  	}
0138f46fea3f5a Qu Wenruo 2024-10-09  348  	ASSERT(atomic_read(&subpage->nr_locked) >= cleared);
0138f46fea3f5a Qu Wenruo 2024-10-09  349  	last = atomic_sub_and_test(cleared, &subpage->nr_locked);
bd610c0937aaf0 Qu Wenruo 2024-09-02  350  	spin_unlock_irqrestore(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  351  	if (last)
bd610c0937aaf0 Qu Wenruo 2024-09-02  352  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  353  }
bd610c0937aaf0 Qu Wenruo 2024-09-02  354  

:::::: The code at line 332 was first introduced by commit
:::::: bd610c0937aaf03b2835638ada1fab8b0524c61a btrfs: only unlock the to-be-submitted ranges inside a folio

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
