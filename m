Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DC1C68F
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 01:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767318476; cv=none; b=IaaXhDE4lXG+MPSIWMamysXKXeJ5I/go5QH0l+1O12XLYve5Ev4+D6X6SXdPn7ygzIvnUnhVRzGH0AgADEMmtDWqqbTrMRChG/4IgccmiiKMvUHG1ywDoyZb5Kaz2K9YGh0TKtV3nuT0hT5dJhQLNI8iRCLan83yw0uOIF4OfTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767318476; c=relaxed/simple;
	bh=K+nz7FtBhMSOYMzWM2mm+ANFOij06iSvQHV/ugj8cpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UukPb4I2NOYU/gQSEe10v7fEdzjTp+YKU3tPMn94lmHmTey+TwMXeICCAYrDGkn9Wi1p10DoZNlqiXpon5tcY0My0kRfS+OYF6+KgpQevmwFV5Xno17HWRBjSEkAqBHWJWGU2Mh+rYWmyZxkFLdumXRZOG2bjbZ1wzV1HljHHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ER+19q0r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ER+19q0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767318474; x=1798854474;
  h=date:from:to:cc:subject:message-id;
  bh=K+nz7FtBhMSOYMzWM2mm+ANFOij06iSvQHV/ugj8cpc=;
  b=ER+19q0rv3cweP8XTtao1Tb7CkGfodpfZgLyyMlSw0+Gik0RrYxlPmkB
   92CWIZD2VWgmBZ4MIt+KMC5uZdw0RKylGK/sJGY8ty22W8vo+r9tvXztj
   o4o6WdlBi3YfsNG2ohSuCxz04NeUiJCGxroEAkV+a0gmtaC4K2DtYT7i9
   mybmGOAqvpLOK3VkbMMvwsWsrFe6lO6tu3N6ShVRBqCG7MRhChmApFwOP
   vJjmjpl/hjW3s4+0/gB5PNhERC4pEoiIGAi2Oc17vnzOjPao9QucT11x0
   CfR145B0h3a+0CeZEPR3eZnsiLgW4POhx9BZAptqYf2c9o/MFRGbYgP3Q
   g==;
X-CSE-ConnectionGUID: 2pyF76XoSuuBbOYD9E5Mwg==
X-CSE-MsgGUID: LiA13iQrRUOgONmxCqph6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68813959"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68813959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 17:47:53 -0800
X-CSE-ConnectionGUID: HuO26EvURHmtBKFeRVnyXg==
X-CSE-MsgGUID: 5PN6AQNCTbWEUh0PuwFhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="206774970"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jan 2026 17:47:51 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbUGb-0000000025l-2Qus;
	Fri, 02 Jan 2026 01:47:49 +0000
Date: Fri, 02 Jan 2026 09:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/extent_io.c:4261:2-11: second lock on line 4261
Message-ID: <202601020925.cQnSoaYh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 19d7f65f032f898df8c164d378be502901772eb7 btrfs: convert the buffer_radix to an xarray
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020925.cQnSoaYh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601020925.cQnSoaYh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/extent_io.c:4261:2-11: second lock on line 4261

vim +4261 fs/btrfs/extent_io.c

6af118ce51b52c Chris Mason 2008-07-22  4245  
0145aa38cb39a0 Li Zetao    2024-08-29  4246  static int try_release_subpage_extent_buffer(struct folio *folio)
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4247  {
0145aa38cb39a0 Li Zetao    2024-08-29  4248  	struct btrfs_fs_info *fs_info = folio_to_fs_info(folio);
19d7f65f032f89 Josef Bacik 2025-04-28  4249  	struct extent_buffer *eb;
19d7f65f032f89 Josef Bacik 2025-04-28  4250  	unsigned long start = (folio_pos(folio) >> fs_info->sectorsize_bits);
19d7f65f032f89 Josef Bacik 2025-04-28  4251  	unsigned long index = start;
19d7f65f032f89 Josef Bacik 2025-04-28  4252  	unsigned long end = index + (PAGE_SIZE >> fs_info->sectorsize_bits) - 1;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4253  	int ret;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4254  
19d7f65f032f89 Josef Bacik 2025-04-28  4255  	xa_lock_irq(&fs_info->buffer_tree);
19d7f65f032f89 Josef Bacik 2025-04-28  4256  	xa_for_each_range(&fs_info->buffer_tree, index, eb, start, end) {
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4257  		/*
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4258  		 * The same as try_release_extent_buffer(), to ensure the eb
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4259  		 * won't disappear out from under us.
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4260  		 */
d1e86e3fc34f24 Qu Wenruo   2021-01-26 @4261  		spin_lock(&eb->refs_lock);
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4262  		if (atomic_read(&eb->refs) != 1 || extent_buffer_under_io(eb)) {
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4263  			spin_unlock(&eb->refs_lock);
19d7f65f032f89 Josef Bacik 2025-04-28  4264  			continue;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4265  		}
19d7f65f032f89 Josef Bacik 2025-04-28  4266  		xa_unlock_irq(&fs_info->buffer_tree);
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4267  
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4268  		/*
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4269  		 * If tree ref isn't set then we know the ref on this eb is a
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4270  		 * real ref, so just return, this eb will likely be freed soon
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4271  		 * anyway.
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4272  		 */
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4273  		if (!test_and_clear_bit(EXTENT_BUFFER_TREE_REF, &eb->bflags)) {
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4274  			spin_unlock(&eb->refs_lock);
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4275  			break;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4276  		}
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4277  
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4278  		/*
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4279  		 * Here we don't care about the return value, we will always
cfbf07e2787e4d Qu Wenruo   2023-11-17  4280  		 * check the folio private at the end.  And
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4281  		 * release_extent_buffer() will release the refs_lock.
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4282  		 */
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4283  		release_extent_buffer(eb);
19d7f65f032f89 Josef Bacik 2025-04-28  4284  		xa_lock_irq(&fs_info->buffer_tree);
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4285  	}
19d7f65f032f89 Josef Bacik 2025-04-28  4286  	xa_unlock_irq(&fs_info->buffer_tree);
19d7f65f032f89 Josef Bacik 2025-04-28  4287  
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4288  	/*
cfbf07e2787e4d Qu Wenruo   2023-11-17  4289  	 * Finally to check if we have cleared folio private, as if we have
cfbf07e2787e4d Qu Wenruo   2023-11-17  4290  	 * released all ebs in the page, the folio private should be cleared now.
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4291  	 */
0145aa38cb39a0 Li Zetao    2024-08-29  4292  	spin_lock(&folio->mapping->i_private_lock);
0145aa38cb39a0 Li Zetao    2024-08-29  4293  	if (!folio_test_private(folio))
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4294  		ret = 1;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4295  	else
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4296  		ret = 0;
0145aa38cb39a0 Li Zetao    2024-08-29  4297  	spin_unlock(&folio->mapping->i_private_lock);
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4298  	return ret;
d1e86e3fc34f24 Qu Wenruo   2021-01-26  4299  

:::::: The code at line 4261 was first introduced by commit
:::::: d1e86e3fc34f24b090d86949ad7f3db7a4c1861f btrfs: support subpage in try_release_extent_buffer()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
