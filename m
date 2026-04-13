Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66062F6931
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097215; cv=none; b=InDpoAcpOaKRsRrN5gITuEGoL27RyZkjjFDDmHwExxjuqm4iu9xVo9WNUK6VPFRv4uOtHq2q9aq78abQdNMNG0hv07412DweQjn2QeIptobzBzZfsJwmYlwQ8leZXDPP3gYW0KoERNiq5nZhd4ZBvMJBZQhoKW6r/QYdoEV8l2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097215; c=relaxed/simple;
	bh=7aaCLcBKo/uLHzZ34BUNU26SfgErEzKTaxabF9jhLrw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r6dyyJ1dNvsnCxqwNRmPbiTzdnWdW0QzM/5jnJoiGtjxmheUltzPDNCcsCznQiIaYXGex8kLDzvb1q6leVoh4AxpMkvXpcE2tl6fUqFnOSkOnzAkKzQg+RPb+rGOpI8tjGUI5lcwPmCs2tAQVTnC9ewu9DMkGOYolk9wPymEg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA1CAcgG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA1CAcgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776097214; x=1807633214;
  h=date:from:to:cc:subject:message-id;
  bh=7aaCLcBKo/uLHzZ34BUNU26SfgErEzKTaxabF9jhLrw=;
  b=iA1CAcgGaTqn/NeOfwpdk/TsX9afcmtgENuMgfmxT2SZChSBFh9nod79
   7x28Jsv/5uIxpC0L6nijGPu1h3CwRhGGM0x4EOl9T21yBiv5CmpjhYUKK
   16+iYFNCELhUj/8Xy904qtjTtpwS4tEUt7dBc3fGpHD0HzVAmZ4xOqjn+
   NK57DTyE9hW5/8UQpWSXB10R3uOAMLmRNJ7oKuETcPKKFLsTEqwxti8rw
   FWo9voXu6LendSAPi+bNVONkZ8dThy7t/sdIEZpPwuIDs2jNitj0YfL+o
   XpWwNduEIXOQIvAzFGgBFxJqXbDmQHED4xCfzsatQPAZuyqDOx5R1sd7Y
   g==;
X-CSE-ConnectionGUID: /CIyEAM3TWGSm8ThETc2tA==
X-CSE-MsgGUID: 1Uvs1PXcR020WEpnmwgW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87740365"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="87740365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 09:20:13 -0700
X-CSE-ConnectionGUID: DRJlp+mZQBmk1gaiwc3KxA==
X-CSE-MsgGUID: BVk3ztZTRFCPI0FRQno1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225096053"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2026 09:20:12 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCK1B-000000000fR-2pbh;
	Mon, 13 Apr 2026 16:20:09 +0000
Date: Tue, 14 Apr 2026 00:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/extent_io.c:4261:2-11: second lock on line 4261
Message-ID: <202604140012.Fi2BvZXn-lkp@intel.com>
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
head:   028ef9c96e96197026887c0f092424679298aae8
commit: 19d7f65f032f898df8c164d378be502901772eb7 btrfs: convert the buffer_radix to an xarray
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r054-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140012.Fi2BvZXn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 19d7f65f032f ("btrfs: convert the buffer_radix to an xarray")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604140012.Fi2BvZXn-lkp@intel.com/

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
