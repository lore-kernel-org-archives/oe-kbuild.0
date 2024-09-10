Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADFB18C003
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725969271; cv=none; b=h9ti23D/fDpkfwGHjfdPnYY2mnsdY9Zyyb8SuqFhQCaKhH4argno7CSMmYB9neS4657NiMnt2V/6kjswpVOs4j/8TcO/PLYJ+rpNoziUuIcMrM5MZJv3gHYV5ZKACf5vWs6LLzjKtgZSeFmNeyAXI81e0VMDQhIkTYLG9rc/Y/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725969271; c=relaxed/simple;
	bh=qeLpBdiiO1YeNjPy0FL+9TfZPTZM7Wqdtm8S7wOEGrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YClszDOyOEu18nIvvLXEnnOWR4xrqeFAoYIQCXlIBJBqn9lGBP88aisDwuF9lWdAHhVWr7SZxR0rlcwa6ktbSOa9ix3QFx2gDc0INNziAdOs3NJJs5R4BQo7Us2TqCo6wRy4/qRQZNypPA5fIrgXKxKkJtReZlEPvFk6L3/sXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEW47fbx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEW47fbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725969269; x=1757505269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qeLpBdiiO1YeNjPy0FL+9TfZPTZM7Wqdtm8S7wOEGrg=;
  b=cEW47fbx4TkIcRG/wgLXgYAT2ynbVaKiHlVBOayfhB0HOMl1kX/LiG5K
   dw53Wlb0lzw59ZjHZY16i3pacAOQteHVruRjI8WC+4c8fVwWoeChEB1Hu
   ywCVdqnubUZe/063oI1Q8Pd4jyfldWIdONRrVQCX9XZL9m3TbQr/hC7VH
   PdB8AsDIY4ulC70YmwqtZGl5PJN7FCq1heiii5CtyyAIQ5RMpi2Rx1Cs2
   HtUQRA+eS1WFlzA91t62Bke5aP31FtkD+TVsz8pXwyofSRCmoeVA/+ZsS
   NCEwGLLBQcckdtJpJNMaPOzlXEXaLbgxYTXV58FcGrZVDpq22P5hoiU2P
   g==;
X-CSE-ConnectionGUID: MB9VWREJT2S6uAOSKagHZg==
X-CSE-MsgGUID: ncH3hmvRQbiJEFWzgYg0vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42227243"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="42227243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:54:29 -0700
X-CSE-ConnectionGUID: PwIwCHx2SFqhpnSd9pKY+A==
X-CSE-MsgGUID: GbNPu2l4SKGtWWlQXzfiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="90290040"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2024 04:54:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snzRx-00020w-2a;
	Tue, 10 Sep 2024 11:54:25 +0000
Date: Tue, 10 Sep 2024 19:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9813/10862] fs/btrfs/subpage.c:437
 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before
 check 'fs_info' (see line 431)
Message-ID: <202409101924.XTvd0yQv-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6708132e80a2ced620bde9b9c36e426183544a23
commit: 966416b380926c94751476747ea68571004eac24 [9813/10862] btrfs: only unlock the to-be-submitted ranges inside a folio
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101924.XTvd0yQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409101924.XTvd0yQv-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:437 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 431)

vim +/fs_info +437 fs/btrfs/subpage.c

1e1de38792e0ae Qu Wenruo 2021-05-31  426  
966416b380926c Qu Wenruo 2024-09-02  427  void btrfs_folio_end_writer_lock_bitmap(const struct btrfs_fs_info *fs_info,
966416b380926c Qu Wenruo 2024-09-02  428  					struct folio *folio, unsigned long bitmap)
966416b380926c Qu Wenruo 2024-09-02  429  {
966416b380926c Qu Wenruo 2024-09-02  430  	struct btrfs_subpage *subpage = folio_get_private(folio);
966416b380926c Qu Wenruo 2024-09-02 @431  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
966416b380926c Qu Wenruo 2024-09-02  432  	unsigned long flags;
966416b380926c Qu Wenruo 2024-09-02  433  	bool last = false;
966416b380926c Qu Wenruo 2024-09-02  434  	int cleared = 0;
966416b380926c Qu Wenruo 2024-09-02  435  	int bit;
966416b380926c Qu Wenruo 2024-09-02  436  
966416b380926c Qu Wenruo 2024-09-02 @437  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
966416b380926c Qu Wenruo 2024-09-02  438  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  439  		return;
966416b380926c Qu Wenruo 2024-09-02  440  	}
966416b380926c Qu Wenruo 2024-09-02  441  
966416b380926c Qu Wenruo 2024-09-02  442  	if (atomic_read(&subpage->writers) == 0) {
966416b380926c Qu Wenruo 2024-09-02  443  		/* No writers, locked by plain lock_page(). */
966416b380926c Qu Wenruo 2024-09-02  444  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  445  		return;
966416b380926c Qu Wenruo 2024-09-02  446  	}
966416b380926c Qu Wenruo 2024-09-02  447  
966416b380926c Qu Wenruo 2024-09-02  448  	spin_lock_irqsave(&subpage->lock, flags);
966416b380926c Qu Wenruo 2024-09-02  449  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
966416b380926c Qu Wenruo 2024-09-02  450  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
966416b380926c Qu Wenruo 2024-09-02  451  			cleared++;
966416b380926c Qu Wenruo 2024-09-02  452  	}
966416b380926c Qu Wenruo 2024-09-02  453  	ASSERT(atomic_read(&subpage->writers) >= cleared);
966416b380926c Qu Wenruo 2024-09-02  454  	last = atomic_sub_and_test(cleared, &subpage->writers);
966416b380926c Qu Wenruo 2024-09-02  455  	spin_unlock_irqrestore(&subpage->lock, flags);
966416b380926c Qu Wenruo 2024-09-02  456  	if (last)
966416b380926c Qu Wenruo 2024-09-02  457  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  458  }
966416b380926c Qu Wenruo 2024-09-02  459  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
