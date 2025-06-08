Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDB1B040B
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 22:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749423435; cv=none; b=uass9d3OWshHZ+6CGWGB2GeqJys9CoTXopWO4NyKx/Xr5J0Jk1o+0RCd2qa1ppqIR0s01+307ODTDlS5gQ5i9ko96YcVj5boKkUdhme8AxKxZU8xE8dgrJaAheSCud0aUZKoadkre5IRJivS3yTBxjxg2wgmWj8IPGwAWjn5Oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749423435; c=relaxed/simple;
	bh=3X+NVPWkCOye++Db48UAFUt7/wAeZy37cjYD4IAVyqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=roh4IMFnDXvySobWATsAlP5dN7byF5O4C0DysLbpJpJ3yulJrwWpIU7ziMN+w4rgYW5luCpjsrBOYpIXr4mXGF9mX2YqwBlbz4Z0yLB3ZvWuhvr6nKlBHbt3dbUYP0OUjEn/hQqe1I8onYESGqTzmBxjzSxQQEqrA6QH5MziUwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZYoWnUM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZYoWnUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749423433; x=1780959433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3X+NVPWkCOye++Db48UAFUt7/wAeZy37cjYD4IAVyqk=;
  b=BZYoWnUMPzrtZZP/JBY878XyjNRry646K02evaStT6pT6xlg9kVKyar6
   coUWMe+mzaApAAVQ7f4nf/vuSanOZf4FPlQFpNw19EN+tC6rhta6UWu/N
   BR5vA6Fj9UsW8cFZ1Ug6piWuZXnE2EH9lpLQu+OsOGnxmL9JvrYBtBG8I
   u3XL9nJnWHuZ+/VpsR5jPQLGuC4RzbghZJkxrJJAHHYg2wz/8uoirAZId
   oV8LgN9Eb3WjfFdqxKouBs6Tx0+hj514w0M8SNioVfKi0tdLrwmiuNdA2
   sSSlodHR4EsehSQhwgSb6S8E6WqsraEp+vp1aE3VrHAYZe0cygDInNpoD
   Q==;
X-CSE-ConnectionGUID: aSWKmA9BRsWgjgrYiYu98w==
X-CSE-MsgGUID: x/oaAkYhR+W1exqp+qKVJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="50601604"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="50601604"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 15:57:12 -0700
X-CSE-ConnectionGUID: m+ooq5kkS1+dA8tLm23Q9w==
X-CSE-MsgGUID: PXlEtavVSpafih1ibXCuIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="146932360"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jun 2025 15:57:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOOwu-0006c9-22;
	Sun, 08 Jun 2025 22:57:08 +0000
Date: Mon, 9 Jun 2025 06:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/extent_io.c:4261:2-11: second lock on line 4261
Message-ID: <202506090637.jjgXwrmn-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   939f15e640f193616691d3bcde0089760e75b0d3
commit: 19d7f65f032f898df8c164d378be502901772eb7 btrfs: convert the buffer_radix to an xarray
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: openrisc-randconfig-r063-20250608 (https://download.01.org/0day-ci/archive/20250609/202506090637.jjgXwrmn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506090637.jjgXwrmn-lkp@intel.com/

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
