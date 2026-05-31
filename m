Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4E22424C
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780192916; cv=none; b=mfe6TeF4JVBJZ8jlAiEHqc5S+goACsyei58FsDb6MoAtDWfsrD8FIdm3DYdnOwYx9zxGhqHbhU3/1ELX/WEIchd005VQJQHqCOdfTWau2vfz6hGgUZeutQ4l1kdLHGMc9cXbMlkoP3H8JN0kSppaiK9GWfU2BoWLPU9JT38tubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780192916; c=relaxed/simple;
	bh=9h+0K921v9OzN4rfRtFk3mBiWGCavbVbj4JqwTfpByo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ga1luRIDctJAF4d64wG81Z7eRvNhPFzWqADDTyXMr8jVkEjJBhZmDLjxZ7LRmxMgbBjwMvbMZqCRZdbBvaClqbrvevLoyCRHrMlA3hJnmckRcip27wfyJoVe/do32E4pokH3RuWFzXDTLmwmtut5qUO8EGmX6bLjsIjfstYp7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL1mGb6x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL1mGb6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780192915; x=1811728915;
  h=date:from:to:cc:subject:message-id;
  bh=9h+0K921v9OzN4rfRtFk3mBiWGCavbVbj4JqwTfpByo=;
  b=PL1mGb6xtxlRWeSdWVzwAkLX2U8VSdeRsiUyxtGgoTHpIu1BPkDLKQS8
   Lh60TmxGEZHNSxk4QlAtqLkYgtQuqTyte+lX0RVkwJy2pVAm46g5JtJ83
   FIyXP74ABaykWhbAJ9uYFuf0UybuluWxk+Rk7/G4rSRYUUsLDB/dPcLas
   X01UFIgMQziVp7r710tzPSvd7l3u5imqsJUzYR82lTKtyz7UIBLMnR4N2
   ZVBsdBq0oLFlWWHqXMQ5gezvLr04zy/CdO6HZFRXl9ZYhvO7lc2xPFW1H
   E337IB1gXYV2K7tazs96hr5Q/Lg75TmYRY2cMHBnTbV91Et7R54P5jpKo
   A==;
X-CSE-ConnectionGUID: z9oKSTrhSeGgTDWpt54DTw==
X-CSE-MsgGUID: LXZEUpqsTRG9j7gZ206RoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="84881342"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="84881342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 19:01:54 -0700
X-CSE-ConnectionGUID: GAMq7Ki4TLa0h9bF+UzCFA==
X-CSE-MsgGUID: X/GHlJ+zSsivlqDyNTCVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="242407115"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2026 19:01:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTVUs-0000000095u-0YfQ;
	Sun, 31 May 2026 02:01:50 +0000
Date: Sun, 31 May 2026 10:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9064/9137] fs/btrfs/subpage.c:296
 btrfs_folio_end_lock_bitmap() error: calling 'spin_unlock_irqrestore()' with
 bogus flags
Message-ID: <202605310912.mnESubwP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 773b2974089b9750cd5f1c09f91ed98c62631beb [9064/9137] Merge branch 'master' of git://git.code.sf.net/p/tomoyo/tomoyo.git
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260529 (https://download.01.org/0day-ci/archive/20260531/202605310912.mnESubwP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310912.mnESubwP-lkp@intel.com/

New smatch warnings:
fs/btrfs/subpage.c:296 btrfs_folio_end_lock_bitmap() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_lib.c:602 scsi_run_host_queues() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/scsi/scsi_lib.c:544 scsi_starved_list_run() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +296 fs/btrfs/subpage.c

1e1de38792e0ae Qu Wenruo 2021-05-31  270  
0f712026658449 Qu Wenruo 2024-10-09  271  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
80551189b5c12e Qu Wenruo 2026-05-13  272  				 struct folio *folio, unsigned long *bitmap)
bd610c0937aaf0 Qu Wenruo 2024-09-02  273  {
582cd4bad4332c Qu Wenruo 2025-06-02  274  	struct btrfs_folio_state *bfs = folio_get_private(folio);
619611e87fcca1 Qu Wenruo 2025-01-24  275  	const unsigned int blocks_per_folio = btrfs_blocks_per_folio(fs_info, folio);
80551189b5c12e Qu Wenruo 2026-05-13  276  	const unsigned int nbits = bitmap_weight(bitmap, blocks_per_folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  277  	unsigned long flags;
bd610c0937aaf0 Qu Wenruo 2024-09-02  278  	bool last = false;
bd610c0937aaf0 Qu Wenruo 2024-09-02  279  
4c14d5c85503da Qu Wenruo 2025-03-10  280  	if (!btrfs_is_subpage(fs_info, folio)) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  281  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  282  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  283  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  284  
582cd4bad4332c Qu Wenruo 2025-06-02  285  	if (atomic_read(&bfs->nr_locked) == 0) {
0f712026658449 Qu Wenruo 2024-10-09  286  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf0 Qu Wenruo 2024-09-02  287  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  288  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  289  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  290  
582cd4bad4332c Qu Wenruo 2025-06-02  291  	spin_lock_irqsave(&bfs->lock, flags);
7c0100a296a40d Qu Wenruo 2026-05-09  292  	ASSERT(atomic_read(&bfs->nr_locked) >= nbits,
7c0100a296a40d Qu Wenruo 2026-05-09  293  	       "atomic_read(&bfs->nr_locked)=%d nbits=%d",
7c0100a296a40d Qu Wenruo 2026-05-09  294  	       atomic_read(&bfs->nr_locked), nbits);
7c0100a296a40d Qu Wenruo 2026-05-09  295  	last = atomic_sub_and_test(nbits, &bfs->nr_locked);
582cd4bad4332c Qu Wenruo 2025-06-02 @296  	spin_unlock_irqrestore(&bfs->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  297  	if (last)
bd610c0937aaf0 Qu Wenruo 2024-09-02  298  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  299  }
bd610c0937aaf0 Qu Wenruo 2024-09-02  300  

:::::: The code at line 296 was first introduced by commit
:::::: 582cd4bad4332cca95c578e99442eb148366eb82 btrfs: rename btrfs_subpage structure

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
