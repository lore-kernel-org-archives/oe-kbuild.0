Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76D335568
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784412918; cv=none; b=fAf66V3ST9OzyAO0jRbYzPVqxzXlVPkqW6N4yHrX6FXUnTLr3LGZ5OWy5YTaslPjK7Ia59aZKUGLhh03QczHy0NoOgOgAMTQ9d6DpvcZh5d/FpXZmFp3/DE4+fdVUmAhfZOqx36jq20fbAaTYu42KuoagE9T8uF2ykPzL0OBjs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784412918; c=relaxed/simple;
	bh=tl0y3i3/JBi3ueHKWFT+M+miIYkB0lbS2WaohIFbeOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pyRRkDz3urfzKo5OwAES8wSQ4Q9TAy1cyTcwclIKeKaeebCyDYf9r1aU2QUjimi//NXpnTN0ilonog6kGg+ak4LOxV4Hc7tcSPIs+FCM/JFEh6ez5N8Q1SowF5fMouBhdff98+1fH/+8ILZmaitprWrCe/nnGFQkVnWhCW2GSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltY1NVHE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltY1NVHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784412915; x=1815948915;
  h=date:from:to:cc:subject:message-id;
  bh=tl0y3i3/JBi3ueHKWFT+M+miIYkB0lbS2WaohIFbeOY=;
  b=ltY1NVHEwBKgG66bj9+OsqheGBh+5Rxr4aTWjIeWi7Do9SNFtfBoC1D/
   RqLuJFVyzo94wtxIod0raUrZOSlJmDq/YbaF+lJfk8a+jrnH0CVB+9N+R
   k0NDoiCP1WZL8WQcaAZH3pm3Obkb0KHJa8MSzo6KDJbxdUTzqLJSPppPn
   S9bCvoMDD3Wu9mHOoBbPg/Ec4WIChkZkhEfTvTVwhwbT7qXNyJYjUSF55
   LYNUSWqIBF2Bt90GM/ifbtOVadxoXE8EhbLvMKTqH6qLw+6W7h3pbLO05
   kvigl7uKOYJ8a6cDtzSwpYtNXwNRlXz9TXhqLuJAZwBZmU7QIZZamqxyf
   g==;
X-CSE-ConnectionGUID: OQ9PKHGRRH+UpENPEXRirQ==
X-CSE-MsgGUID: 1fw/Jx1gTPa/iZ69EyAhZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95690655"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95690655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 15:15:13 -0700
X-CSE-ConnectionGUID: TkFe3awDTKaZssUC2p35Nw==
X-CSE-MsgGUID: /GbXtzOEQGWy6y7ftLao/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="260667405"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2026 15:15:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlDJJ-00000000V9t-0RvC;
	Sat, 18 Jul 2026 22:15:06 +0000
Date: Sun, 19 Jul 2026 06:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable
 dereferenced before check 'fs_info' (see line 326)
Message-ID: <202607190645.mhWLpewI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   2bfc8fe4015fcf2e39fc5989b95d20d6b5f7b566
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [1/1] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 5 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260719/202607190645.mhWLpewI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607190645.mhWLpewI-lkp@intel.com/

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
