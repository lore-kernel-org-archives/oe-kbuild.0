Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE332937A
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023017; cv=none; b=rDZxgYSw0rRwC1eAbTGO4MTIJWpSEnCt245QHIw6h6xOYD41XI+8l0eqV0//zpUdiCc9+BvHq4we1cksUDhTwdFOKZ/4+UTXK3eq5uoWyiAkRUiZqy6Gu01w5DDlclgfcz64lPWfxhA1baUn+51V46tg/XfiHy9qs6Atpahb2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023017; c=relaxed/simple;
	bh=RRWYEEvDUjxurZRqPpDmf2+b2ZMen40JY2aHaVPm3eE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FyV4PQayb6HTi1lmD+4NT77uS48ts77Zl8+9nE4cSXcmWgUEdIenU39x5ZG37rbrYTQ4oIsdlaNgaWPkLtpTjeAmM5aIgL9JiAdqpj0BKuZStkrJIvj7iTQlmdbeSeneK+/9jwaro5XuLAjIXc3xdQ8U+UOxmG9B/FZN0iJGBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLsONNPX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLsONNPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775023016; x=1806559016;
  h=date:from:to:cc:subject:message-id;
  bh=RRWYEEvDUjxurZRqPpDmf2+b2ZMen40JY2aHaVPm3eE=;
  b=DLsONNPXJONKR+radGq6ex6S1G1Skz0a0FLk8pkrIH6D9niu0a/ZWQlu
   EbQ3TQXoEfFqnWPkfQomTSCg+nOiwBZIDjIb+gTs/7vjDfyOIT+Qc+JuN
   87wkwW2sTROnH2/lryl2bfPL4mPW2x8avvt/+5LmGaammP3/kKepF/1Cu
   43m2afD9n8gHmsMSDoxQXHz8Yfv6+7ludqQr8IrZC/NoxckTG0ufSzglT
   Fk0V/+TkLULC4HsJFMMZXWI6lvbqWFBgnadAf9Y9ihIPqy2e6xkr/4Kis
   EjpT1k20WMEb88YoK0aKjhegx1v7ye6CljevnbCk69Zt66oAOsIa5aTyT
   A==;
X-CSE-ConnectionGUID: otYOt6oJSaOqEfuIPp3NmQ==
X-CSE-MsgGUID: h/7+eelxRWiy82x0+rbWrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98661032"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="98661032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 22:56:53 -0700
X-CSE-ConnectionGUID: 8DSS3OdyTfuQOZPA13tNjA==
X-CSE-MsgGUID: mu7v/WwWSomb/fzAIvI+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226559378"
Received: from lkp-server01.sh.intel.com (HELO beaa6a812b8c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2026 22:56:52 -0700
Received: from kbuild by beaa6a812b8c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7oZN-0000000003z-2PjH;
	Wed, 01 Apr 2026 05:56:49 +0000
Date: Wed, 01 Apr 2026 13:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-poly-aosp-pixel-malibu 4/4]
 fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable
 dereferenced before check 'fs_info' (see line 326)
Message-ID: <202604011348.FuiAdGBG-lkp@intel.com>
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
head:   9cbd7eeda1fe517f9ce3451fb3d7b4663df71429
commit: 0138f46fea3f5a250a5f49c33bd6174dec138369 [4/4] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260331 (https://download.01.org/0day-ci/archive/20260401/202604011348.FuiAdGBG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604011348.FuiAdGBG-lkp@intel.com/

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
