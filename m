Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192113E41A
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729628586; cv=none; b=XqR7nztw/WBIZzwVOItzJ+HyLRukXhCy9o+yR8qdb2NF8+fiWo8I34dc5kYmkYYYLerunaVgSrD0YbK3hzif5yekBA5MpSTnN53w/SpOqdmrAFnOcOnZsW/993wASRT8q7Vi78XTKSs7eBI2saw2Zd9f0igVUg2hJATWd3LMWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729628586; c=relaxed/simple;
	bh=f1iGRFECxOyYeyobr7By2Kuvcpfv41m7qyrPfOmHoAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIiBLOtzTu7yQMSiUa5E3oJYjs83K3rIIrNklQ1b2ac7MIyyCucyGZiRKr0PKEHMuy+phA6ne0qGWBIERWasjTsLpdcji2twZDNT9elLpdPhW3E+wdf9t+xojIfHIaPHxDOTLnhmmv5QXtfZgDsDwDqAxdoeSuz8SAuL0QGfWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2/eHyfg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2/eHyfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729628584; x=1761164584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1iGRFECxOyYeyobr7By2Kuvcpfv41m7qyrPfOmHoAE=;
  b=Y2/eHyfgz6hfLh0pQ2nQq67fhyySfM6O3Mt9ZkXFF9hZSlm4qgUAwxcl
   5gog075c5dCe5HbmM6R3pSjrVSg5TIGRoMBfF4Am6GlTMc1i0j//jZc2a
   am+PIYVs/auZMf2bXMcF+OoAR5E/dAnY4fZJyxFjVe+zV9L9oB5o7QGqd
   KTIzxSWG4vd6CTavZ+ifgpOXfi9j50MZ0E41W9nL2XIYyC0Aesm0s5u6y
   t+M+Yiio+jlbgIytJ7tmTPYX/tEwtVdsulY5+httbcrAv3PXjD3qkk0p9
   3Xisbm+rjIiTgJ0RxaeEYVIVfducK2djNHTtf8mRkyqUYt9GabdLFn2Kp
   g==;
X-CSE-ConnectionGUID: rQA1A+PsQsu0b6uEilU3LQ==
X-CSE-MsgGUID: WLUScG0pRS2eJPmiOtYeTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40560096"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="40560096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 13:23:03 -0700
X-CSE-ConnectionGUID: osDfKcAhRtOHPMlW6XxrlQ==
X-CSE-MsgGUID: VJ63FfPWTiKiWKwrJqay2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="117442994"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 13:23:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3LP9-000U3S-2L;
	Tue, 22 Oct 2024 20:22:59 +0000
Date: Wed, 23 Oct 2024 04:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:test-for-next 78/86] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <202410230432.QbEXhcm1-lkp@intel.com>
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

tree:   https://github.com/kdave/btrfs-devel.git test-for-next
head:   bf6531230d457f76c7eaef675bf4364634701ce4
commit: 8a1e6576deee2baede43827c092b3b183687a9e7 [78/86] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
:::::: branch date: 6 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230432.QbEXhcm1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410230432.QbEXhcm1-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c

1e1de38792e0ae Qu Wenruo 2021-05-31  321  
8a1e6576deee2b Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
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
8a1e6576deee2b Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
8a1e6576deee2b Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf0 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  340  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  341  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  342  
bd610c0937aaf0 Qu Wenruo 2024-09-02  343  	spin_lock_irqsave(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  344  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  345  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
bd610c0937aaf0 Qu Wenruo 2024-09-02  346  			cleared++;
bd610c0937aaf0 Qu Wenruo 2024-09-02  347  	}
8a1e6576deee2b Qu Wenruo 2024-10-09  348  	ASSERT(atomic_read(&subpage->nr_locked) >= cleared);
8a1e6576deee2b Qu Wenruo 2024-10-09  349  	last = atomic_sub_and_test(cleared, &subpage->nr_locked);
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
