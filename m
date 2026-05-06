Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A748BD3B
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080518; cv=none; b=PwiTCObuTEF2pamTAY5GZgouiBlWWRTWRRhwaycSNHJ++zrmGjUBSRQ/IADVkq2qaAV4G7jKugK71qgSstaOD87wdJvPkojZnFiCwJehaVm3Wb+rFkobZfBrG/lC4E7IFDV/BFfOqTkwDreCHaJW6Bpt2bzRIhDwVa1iYIVavm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080518; c=relaxed/simple;
	bh=GeAsgj/syQy8B/YuXn128ZlOVDyGDk3XRaHNnBgHlF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nw10M/WQC5itKou+4VWCcNZ6dL1NEn7tcwLAiL5dIddOHQw+3HKSC/bavfbLYVPVJZiYLQo5MWRLoCaVYeZLhfJnIdmCHklEPj+f1B4rzaKGGPQUgvE7gKntv7xRiS+rzcHDBhHM44JPkUBPZRmiT9R6NkeFIcvIJqP3m6vG754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoYw2AO4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoYw2AO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778080513; x=1809616513;
  h=date:from:to:cc:subject:message-id;
  bh=GeAsgj/syQy8B/YuXn128ZlOVDyGDk3XRaHNnBgHlF0=;
  b=ZoYw2AO49HInNrBYlfoGco4oOBdR+1vzONXm6bIR1HlwEuJFJHffuIXs
   slwfFUS53Hl9q8bi64Low8PJFkAz7A2WHne50siucBB8AOiCy5wqvucdb
   x5z25Txl2wUnkIyx9rYyU+LCnO0EYaLhHVGEqfHv9e4TZBqHZadDn7T91
   jIdOaBv6qe9ueiT27bLFTjrAp9rNDQAix/yISrarlBXt6Knp0twEPB/Pl
   LIZNc9v050xffg/HVjwrhP4RGLeXPmau+zZURTNHvbax1fpNqatJ5+HVV
   IyOpasG+OfUavZte4f4fvPoPXdJclQeoyY2qPHvnsSFROnb+7ecjtdUhu
   g==;
X-CSE-ConnectionGUID: SG4dz+KiTL6EayiwleIphw==
X-CSE-MsgGUID: SYd6gKYiQJWGLu/ixaPgtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78907064"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78907064"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:15:13 -0700
X-CSE-ConnectionGUID: 6+WrKxqjRUi+dBUflVSJIQ==
X-CSE-MsgGUID: Ndy9fCa9Tsan8vgoVxNNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="241175784"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2026 08:15:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKdxr-0000000010b-2kwC;
	Wed, 06 May 2026 15:15:07 +0000
Date: Wed, 06 May 2026 23:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave:for-7.0-rc6 61/199] fs/btrfs/relocation.c:4043
 create_remap_tree_entries() warn: potentially one past the end of array
 'space_runs[num_space_runs]'
Message-ID: <202605062302.A1rxKdqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Harmstone <mark@harmstone.com>
CC: David Sterba <dsterba@suse.com>
CC: Boris Burkov <boris@bur.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-7.0-rc6
head:   316fb1b3169efb081d2db910cbbfef445afa03b9
commit: b56f35560b82e7f8d79aa9ee72720b06639a473c [61/199] btrfs: handle setting up relocation of block group with remap-tree
:::::: branch date: 5 weeks ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r072-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062302.A1rxKdqR-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605062302.A1rxKdqR-lkp@intel.com/

New smatch warnings:
fs/btrfs/relocation.c:4043 create_remap_tree_entries() warn: potentially one past the end of array 'space_runs[num_space_runs]'
fs/btrfs/relocation.c:4043 create_remap_tree_entries() warn: potentially one past the end of array 'space_runs[num_space_runs]'

Old smatch warnings:
fs/btrfs/relocation.c:4044 create_remap_tree_entries() warn: potentially one past the end of array 'space_runs[num_space_runs]'
fs/btrfs/relocation.c:4044 create_remap_tree_entries() warn: potentially one past the end of array 'space_runs[num_space_runs]'

vim +4043 fs/btrfs/relocation.c

979e1dc3d69e4c8 Mark Harmstone 2026-01-07  3968  
b56f35560b82e7f Mark Harmstone 2026-01-07  3969  static int create_remap_tree_entries(struct btrfs_trans_handle *trans,
b56f35560b82e7f Mark Harmstone 2026-01-07  3970  				     struct btrfs_path *path,
b56f35560b82e7f Mark Harmstone 2026-01-07  3971  				     struct btrfs_block_group *bg)
b56f35560b82e7f Mark Harmstone 2026-01-07  3972  {
b56f35560b82e7f Mark Harmstone 2026-01-07  3973  	struct btrfs_fs_info *fs_info = trans->fs_info;
b56f35560b82e7f Mark Harmstone 2026-01-07  3974  	struct btrfs_free_space_info *fsi;
b56f35560b82e7f Mark Harmstone 2026-01-07  3975  	struct btrfs_key key, found_key;
b56f35560b82e7f Mark Harmstone 2026-01-07  3976  	struct extent_buffer *leaf;
b56f35560b82e7f Mark Harmstone 2026-01-07  3977  	struct btrfs_root *space_root;
b56f35560b82e7f Mark Harmstone 2026-01-07  3978  	u32 extent_count;
b56f35560b82e7f Mark Harmstone 2026-01-07  3979  	struct space_run *space_runs = NULL;
b56f35560b82e7f Mark Harmstone 2026-01-07  3980  	unsigned int num_space_runs = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  3981  	struct btrfs_key *entries = NULL;
b56f35560b82e7f Mark Harmstone 2026-01-07  3982  	unsigned int max_entries, num_entries;
b56f35560b82e7f Mark Harmstone 2026-01-07  3983  	int ret;
b56f35560b82e7f Mark Harmstone 2026-01-07  3984  
b56f35560b82e7f Mark Harmstone 2026-01-07  3985  	mutex_lock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  3986  
b56f35560b82e7f Mark Harmstone 2026-01-07  3987  	if (test_bit(BLOCK_GROUP_FLAG_NEEDS_FREE_SPACE, &bg->runtime_flags)) {
b56f35560b82e7f Mark Harmstone 2026-01-07  3988  		mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  3989  
b56f35560b82e7f Mark Harmstone 2026-01-07  3990  		ret = btrfs_add_block_group_free_space(trans, bg);
b56f35560b82e7f Mark Harmstone 2026-01-07  3991  		if (ret)
b56f35560b82e7f Mark Harmstone 2026-01-07  3992  			return ret;
b56f35560b82e7f Mark Harmstone 2026-01-07  3993  
b56f35560b82e7f Mark Harmstone 2026-01-07  3994  		mutex_lock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  3995  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  3996  
b56f35560b82e7f Mark Harmstone 2026-01-07  3997  	fsi = btrfs_search_free_space_info(trans, bg, path, 0);
b56f35560b82e7f Mark Harmstone 2026-01-07  3998  	if (IS_ERR(fsi)) {
b56f35560b82e7f Mark Harmstone 2026-01-07  3999  		mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  4000  		return PTR_ERR(fsi);
b56f35560b82e7f Mark Harmstone 2026-01-07  4001  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4002  
b56f35560b82e7f Mark Harmstone 2026-01-07  4003  	extent_count = btrfs_free_space_extent_count(path->nodes[0], fsi);
b56f35560b82e7f Mark Harmstone 2026-01-07  4004  
b56f35560b82e7f Mark Harmstone 2026-01-07  4005  	btrfs_release_path(path);
b56f35560b82e7f Mark Harmstone 2026-01-07  4006  
b56f35560b82e7f Mark Harmstone 2026-01-07  4007  	space_runs = kmalloc(sizeof(*space_runs) * extent_count, GFP_NOFS);
b56f35560b82e7f Mark Harmstone 2026-01-07  4008  	if (!space_runs) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4009  		mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  4010  		return -ENOMEM;
b56f35560b82e7f Mark Harmstone 2026-01-07  4011  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4012  
b56f35560b82e7f Mark Harmstone 2026-01-07  4013  	key.objectid = bg->start;
b56f35560b82e7f Mark Harmstone 2026-01-07  4014  	key.type = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  4015  	key.offset = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  4016  
b56f35560b82e7f Mark Harmstone 2026-01-07  4017  	space_root = btrfs_free_space_root(bg);
b56f35560b82e7f Mark Harmstone 2026-01-07  4018  
b56f35560b82e7f Mark Harmstone 2026-01-07  4019  	ret = btrfs_search_slot(trans, space_root, &key, path, 0, 0);
b56f35560b82e7f Mark Harmstone 2026-01-07  4020  	if (ret < 0) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4021  		mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  4022  		goto out;
b56f35560b82e7f Mark Harmstone 2026-01-07  4023  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4024  
b56f35560b82e7f Mark Harmstone 2026-01-07  4025  	ret = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  4026  
b56f35560b82e7f Mark Harmstone 2026-01-07  4027  	while (true) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4028  		leaf = path->nodes[0];
b56f35560b82e7f Mark Harmstone 2026-01-07  4029  
b56f35560b82e7f Mark Harmstone 2026-01-07  4030  		btrfs_item_key_to_cpu(leaf, &found_key, path->slots[0]);
b56f35560b82e7f Mark Harmstone 2026-01-07  4031  
b56f35560b82e7f Mark Harmstone 2026-01-07  4032  		if (found_key.objectid >= bg->start + bg->length)
b56f35560b82e7f Mark Harmstone 2026-01-07  4033  			break;
b56f35560b82e7f Mark Harmstone 2026-01-07  4034  
b56f35560b82e7f Mark Harmstone 2026-01-07  4035  		if (found_key.type == BTRFS_FREE_SPACE_EXTENT_KEY) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4036  			if (num_space_runs != 0 &&
b56f35560b82e7f Mark Harmstone 2026-01-07  4037  			    space_runs[num_space_runs - 1].end == found_key.objectid) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4038  				space_runs[num_space_runs - 1].end =
b56f35560b82e7f Mark Harmstone 2026-01-07  4039  					found_key.objectid + found_key.offset;
b56f35560b82e7f Mark Harmstone 2026-01-07  4040  			} else {
b56f35560b82e7f Mark Harmstone 2026-01-07  4041  				ASSERT(num_space_runs < extent_count);
b56f35560b82e7f Mark Harmstone 2026-01-07  4042  
b56f35560b82e7f Mark Harmstone 2026-01-07 @4043  				space_runs[num_space_runs].start = found_key.objectid;
b56f35560b82e7f Mark Harmstone 2026-01-07  4044  				space_runs[num_space_runs].end =
b56f35560b82e7f Mark Harmstone 2026-01-07  4045  					found_key.objectid + found_key.offset;
b56f35560b82e7f Mark Harmstone 2026-01-07  4046  
b56f35560b82e7f Mark Harmstone 2026-01-07  4047  				num_space_runs++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4048  			}
b56f35560b82e7f Mark Harmstone 2026-01-07  4049  		} else if (found_key.type == BTRFS_FREE_SPACE_BITMAP_KEY) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4050  			void *bitmap;
b56f35560b82e7f Mark Harmstone 2026-01-07  4051  			unsigned long offset;
b56f35560b82e7f Mark Harmstone 2026-01-07  4052  			u32 data_size;
b56f35560b82e7f Mark Harmstone 2026-01-07  4053  
b56f35560b82e7f Mark Harmstone 2026-01-07  4054  			offset = btrfs_item_ptr_offset(leaf, path->slots[0]);
b56f35560b82e7f Mark Harmstone 2026-01-07  4055  			data_size = btrfs_item_size(leaf, path->slots[0]);
b56f35560b82e7f Mark Harmstone 2026-01-07  4056  
b56f35560b82e7f Mark Harmstone 2026-01-07  4057  			if (data_size != 0) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4058  				bitmap = kmalloc(data_size, GFP_NOFS);
b56f35560b82e7f Mark Harmstone 2026-01-07  4059  				if (!bitmap) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4060  					mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  4061  					ret = -ENOMEM;
b56f35560b82e7f Mark Harmstone 2026-01-07  4062  					goto out;
b56f35560b82e7f Mark Harmstone 2026-01-07  4063  				}
b56f35560b82e7f Mark Harmstone 2026-01-07  4064  
b56f35560b82e7f Mark Harmstone 2026-01-07  4065  				read_extent_buffer(leaf, bitmap, offset, data_size);
b56f35560b82e7f Mark Harmstone 2026-01-07  4066  
b56f35560b82e7f Mark Harmstone 2026-01-07  4067  				parse_bitmap(fs_info->sectorsize, bitmap,
b56f35560b82e7f Mark Harmstone 2026-01-07  4068  					     data_size * BITS_PER_BYTE,
b56f35560b82e7f Mark Harmstone 2026-01-07  4069  					     found_key.objectid, space_runs,
b56f35560b82e7f Mark Harmstone 2026-01-07  4070  					     &num_space_runs);
b56f35560b82e7f Mark Harmstone 2026-01-07  4071  
b56f35560b82e7f Mark Harmstone 2026-01-07  4072  				ASSERT(num_space_runs <= extent_count);
b56f35560b82e7f Mark Harmstone 2026-01-07  4073  
b56f35560b82e7f Mark Harmstone 2026-01-07  4074  				kfree(bitmap);
b56f35560b82e7f Mark Harmstone 2026-01-07  4075  			}
b56f35560b82e7f Mark Harmstone 2026-01-07  4076  		}
b56f35560b82e7f Mark Harmstone 2026-01-07  4077  
b56f35560b82e7f Mark Harmstone 2026-01-07  4078  		path->slots[0]++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4079  
b56f35560b82e7f Mark Harmstone 2026-01-07  4080  		if (path->slots[0] >= btrfs_header_nritems(leaf)) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4081  			ret = btrfs_next_leaf(space_root, path);
b56f35560b82e7f Mark Harmstone 2026-01-07  4082  			if (ret != 0) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4083  				if (ret == 1)
b56f35560b82e7f Mark Harmstone 2026-01-07  4084  					ret = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  4085  				break;
b56f35560b82e7f Mark Harmstone 2026-01-07  4086  			}
b56f35560b82e7f Mark Harmstone 2026-01-07  4087  			leaf = path->nodes[0];
b56f35560b82e7f Mark Harmstone 2026-01-07  4088  		}
b56f35560b82e7f Mark Harmstone 2026-01-07  4089  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4090  
b56f35560b82e7f Mark Harmstone 2026-01-07  4091  	btrfs_release_path(path);
b56f35560b82e7f Mark Harmstone 2026-01-07  4092  
b56f35560b82e7f Mark Harmstone 2026-01-07  4093  	mutex_unlock(&bg->free_space_lock);
b56f35560b82e7f Mark Harmstone 2026-01-07  4094  
b56f35560b82e7f Mark Harmstone 2026-01-07  4095  	max_entries = extent_count + 2;
b56f35560b82e7f Mark Harmstone 2026-01-07  4096  	entries = kmalloc(sizeof(*entries) * max_entries, GFP_NOFS);
b56f35560b82e7f Mark Harmstone 2026-01-07  4097  	if (!entries) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4098  		ret = -ENOMEM;
b56f35560b82e7f Mark Harmstone 2026-01-07  4099  		goto out;
b56f35560b82e7f Mark Harmstone 2026-01-07  4100  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4101  
b56f35560b82e7f Mark Harmstone 2026-01-07  4102  	num_entries = 0;
b56f35560b82e7f Mark Harmstone 2026-01-07  4103  
b56f35560b82e7f Mark Harmstone 2026-01-07  4104  	if (num_space_runs == 0) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4105  		entries[num_entries].objectid = bg->start;
b56f35560b82e7f Mark Harmstone 2026-01-07  4106  		entries[num_entries].type = BTRFS_IDENTITY_REMAP_KEY;
b56f35560b82e7f Mark Harmstone 2026-01-07  4107  		entries[num_entries].offset = bg->length;
b56f35560b82e7f Mark Harmstone 2026-01-07  4108  		num_entries++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4109  	} else {
b56f35560b82e7f Mark Harmstone 2026-01-07  4110  		if (space_runs[0].start > bg->start) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4111  			entries[num_entries].objectid = bg->start;
b56f35560b82e7f Mark Harmstone 2026-01-07  4112  			entries[num_entries].type = BTRFS_IDENTITY_REMAP_KEY;
b56f35560b82e7f Mark Harmstone 2026-01-07  4113  			entries[num_entries].offset = space_runs[0].start - bg->start;
b56f35560b82e7f Mark Harmstone 2026-01-07  4114  			num_entries++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4115  		}
b56f35560b82e7f Mark Harmstone 2026-01-07  4116  
b56f35560b82e7f Mark Harmstone 2026-01-07  4117  		for (unsigned int i = 1; i < num_space_runs; i++) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4118  			entries[num_entries].objectid = space_runs[i - 1].end;
b56f35560b82e7f Mark Harmstone 2026-01-07  4119  			entries[num_entries].type = BTRFS_IDENTITY_REMAP_KEY;
b56f35560b82e7f Mark Harmstone 2026-01-07  4120  			entries[num_entries].offset =
b56f35560b82e7f Mark Harmstone 2026-01-07  4121  				space_runs[i].start - space_runs[i - 1].end;
b56f35560b82e7f Mark Harmstone 2026-01-07  4122  			num_entries++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4123  		}
b56f35560b82e7f Mark Harmstone 2026-01-07  4124  
b56f35560b82e7f Mark Harmstone 2026-01-07  4125  		if (space_runs[num_space_runs - 1].end < bg->start + bg->length) {
b56f35560b82e7f Mark Harmstone 2026-01-07  4126  			entries[num_entries].objectid =
b56f35560b82e7f Mark Harmstone 2026-01-07  4127  				space_runs[num_space_runs - 1].end;
b56f35560b82e7f Mark Harmstone 2026-01-07  4128  			entries[num_entries].type = BTRFS_IDENTITY_REMAP_KEY;
b56f35560b82e7f Mark Harmstone 2026-01-07  4129  			entries[num_entries].offset =
b56f35560b82e7f Mark Harmstone 2026-01-07  4130  				bg->start + bg->length - space_runs[num_space_runs - 1].end;
b56f35560b82e7f Mark Harmstone 2026-01-07  4131  			num_entries++;
b56f35560b82e7f Mark Harmstone 2026-01-07  4132  		}
b56f35560b82e7f Mark Harmstone 2026-01-07  4133  
b56f35560b82e7f Mark Harmstone 2026-01-07  4134  		if (num_entries == 0)
b56f35560b82e7f Mark Harmstone 2026-01-07  4135  			goto out;
b56f35560b82e7f Mark Harmstone 2026-01-07  4136  	}
b56f35560b82e7f Mark Harmstone 2026-01-07  4137  
b56f35560b82e7f Mark Harmstone 2026-01-07  4138  	bg->identity_remap_count = num_entries;
b56f35560b82e7f Mark Harmstone 2026-01-07  4139  
b56f35560b82e7f Mark Harmstone 2026-01-07  4140  	ret = add_remap_tree_entries(trans, path, entries, num_entries);
b56f35560b82e7f Mark Harmstone 2026-01-07  4141  
b56f35560b82e7f Mark Harmstone 2026-01-07  4142  out:
b56f35560b82e7f Mark Harmstone 2026-01-07  4143  	kfree(entries);
b56f35560b82e7f Mark Harmstone 2026-01-07  4144  	kfree(space_runs);
b56f35560b82e7f Mark Harmstone 2026-01-07  4145  
b56f35560b82e7f Mark Harmstone 2026-01-07  4146  	return ret;
b56f35560b82e7f Mark Harmstone 2026-01-07  4147  }
b56f35560b82e7f Mark Harmstone 2026-01-07  4148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
