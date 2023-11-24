Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC131726
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQtmD4hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840550; x=1732376550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPslkgfHycr8U7poyvIs8e5tcWN3MuVew1ITNVYGd8E=;
  b=BQtmD4hspSjpFucyQ11+mV82FGKNwkfblxXOv+SlSugtU2Qsa68+5f9z
   0geSCxKwnb67mcOJ6403zUUqq3AVpQHncsChAuULSsYwAOUVT0iwDVN5+
   9uh7tZ7h/vura43SMSXa3wS1iiYgSdkWxVUBQTRdaJ3V/48ROIdMkOvUf
   crr01QV4WEjkyxYRb/Ae2BQPPmRrZlqgtek0YYW9mTGBG0pXg4pK2wewl
   T5LicCC8ZZ6GWKashpu03Wj7UhSSvxOenqZXIpOpdBRJI1piZGGJz4IEs
   nTxdC/yv6QomwIQ54XURaYgPQ9Mm54SzIG0VdsGWwiiXPdXGkN5t0FY8B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257445"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257445"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510990"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510990"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yc-0l;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:misc-next 24/31] fs/btrfs/dev-replace.c:574
 btrfs_finish_block_group_to_copy() error: 'map' dereferencing possible
 ERR_PTR()
Message-ID: <202311242020.x5C0zFI9-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   110d210b5f1015cc49543a2dfe0940ebe5cf3dd4
commit: 88957e909b0c28704734ab078069e8149c51c235 [24/31] btrfs: use a dedicated data structure for chunk maps
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-r071-20231124 (https://download.01.org/0day-ci/archive/20231124/202311242020.x5C0zFI9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311242020.x5C0zFI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311242020.x5C0zFI9-lkp@intel.com/

smatch warnings:
fs/btrfs/dev-replace.c:574 btrfs_finish_block_group_to_copy() error: 'map' dereferencing possible ERR_PTR()

vim +/map +574 fs/btrfs/dev-replace.c

78ce9fc269af6e Naohiro Aota  2021-02-04  547  
78ce9fc269af6e Naohiro Aota  2021-02-04  548  bool btrfs_finish_block_group_to_copy(struct btrfs_device *srcdev,
78ce9fc269af6e Naohiro Aota  2021-02-04  549  				      struct btrfs_block_group *cache,
78ce9fc269af6e Naohiro Aota  2021-02-04  550  				      u64 physical)
78ce9fc269af6e Naohiro Aota  2021-02-04  551  {
78ce9fc269af6e Naohiro Aota  2021-02-04  552  	struct btrfs_fs_info *fs_info = cache->fs_info;
88957e909b0c28 Filipe Manana 2023-11-21  553  	struct btrfs_chunk_map *map;
78ce9fc269af6e Naohiro Aota  2021-02-04  554  	u64 chunk_offset = cache->start;
78ce9fc269af6e Naohiro Aota  2021-02-04  555  	int num_extents, cur_extent;
78ce9fc269af6e Naohiro Aota  2021-02-04  556  	int i;
78ce9fc269af6e Naohiro Aota  2021-02-04  557  
78ce9fc269af6e Naohiro Aota  2021-02-04  558  	/* Do not use "to_copy" on non zoned filesystem for now */
78ce9fc269af6e Naohiro Aota  2021-02-04  559  	if (!btrfs_is_zoned(fs_info))
78ce9fc269af6e Naohiro Aota  2021-02-04  560  		return true;
78ce9fc269af6e Naohiro Aota  2021-02-04  561  
78ce9fc269af6e Naohiro Aota  2021-02-04  562  	spin_lock(&cache->lock);
3349b57fd47b5d Josef Bacik   2022-07-15  563  	if (test_bit(BLOCK_GROUP_FLAG_REMOVED, &cache->runtime_flags)) {
78ce9fc269af6e Naohiro Aota  2021-02-04  564  		spin_unlock(&cache->lock);
78ce9fc269af6e Naohiro Aota  2021-02-04  565  		return true;
78ce9fc269af6e Naohiro Aota  2021-02-04  566  	}
78ce9fc269af6e Naohiro Aota  2021-02-04  567  	spin_unlock(&cache->lock);
78ce9fc269af6e Naohiro Aota  2021-02-04  568  
88957e909b0c28 Filipe Manana 2023-11-21  569  	map = btrfs_get_chunk_map(fs_info, chunk_offset, 1);
88957e909b0c28 Filipe Manana 2023-11-21  570  	ASSERT(!IS_ERR(map));
78ce9fc269af6e Naohiro Aota  2021-02-04  571  
c1867eb33e15b9 David Sterba  2022-06-21  572  	num_extents = 0;
c1867eb33e15b9 David Sterba  2022-06-21  573  	cur_extent = 0;
78ce9fc269af6e Naohiro Aota  2021-02-04 @574  	for (i = 0; i < map->num_stripes; i++) {
78ce9fc269af6e Naohiro Aota  2021-02-04  575  		/* We have more device extent to copy */
78ce9fc269af6e Naohiro Aota  2021-02-04  576  		if (srcdev != map->stripes[i].dev)
78ce9fc269af6e Naohiro Aota  2021-02-04  577  			continue;
78ce9fc269af6e Naohiro Aota  2021-02-04  578  
78ce9fc269af6e Naohiro Aota  2021-02-04  579  		num_extents++;
78ce9fc269af6e Naohiro Aota  2021-02-04  580  		if (physical == map->stripes[i].physical)
78ce9fc269af6e Naohiro Aota  2021-02-04  581  			cur_extent = i;
78ce9fc269af6e Naohiro Aota  2021-02-04  582  	}
78ce9fc269af6e Naohiro Aota  2021-02-04  583  
88957e909b0c28 Filipe Manana 2023-11-21  584  	btrfs_free_chunk_map(map);
78ce9fc269af6e Naohiro Aota  2021-02-04  585  
78ce9fc269af6e Naohiro Aota  2021-02-04  586  	if (num_extents > 1 && cur_extent < num_extents - 1) {
78ce9fc269af6e Naohiro Aota  2021-02-04  587  		/*
78ce9fc269af6e Naohiro Aota  2021-02-04  588  		 * Has more stripes on this device. Keep this block group
78ce9fc269af6e Naohiro Aota  2021-02-04  589  		 * readonly until we finish all the stripes.
78ce9fc269af6e Naohiro Aota  2021-02-04  590  		 */
78ce9fc269af6e Naohiro Aota  2021-02-04  591  		return false;
78ce9fc269af6e Naohiro Aota  2021-02-04  592  	}
78ce9fc269af6e Naohiro Aota  2021-02-04  593  
78ce9fc269af6e Naohiro Aota  2021-02-04  594  	/* Last stripe on this device */
3349b57fd47b5d Josef Bacik   2022-07-15  595  	clear_bit(BLOCK_GROUP_FLAG_TO_COPY, &cache->runtime_flags);
78ce9fc269af6e Naohiro Aota  2021-02-04  596  
78ce9fc269af6e Naohiro Aota  2021-02-04  597  	return true;
78ce9fc269af6e Naohiro Aota  2021-02-04  598  }
78ce9fc269af6e Naohiro Aota  2021-02-04  599  

:::::: The code at line 574 was first introduced by commit
:::::: 78ce9fc269af6e69c1399ab910ba6bc81c934f67 btrfs: zoned: mark block groups to copy for device-replace

:::::: TO: Naohiro Aota <naohiro.aota@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
