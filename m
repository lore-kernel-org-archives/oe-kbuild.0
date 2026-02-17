Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A32DC764
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344055; cv=none; b=it2yrNuRpFuFKUsbZdUqZVwyPWbeo+EcG8jywnKRRE3UwPUyqtDEy+vje/pnqupxf2e52f8b5ZUNnSW2ir+Ptzu6qfdaef1Xi3BvK5GEPcQq7oZ6FRze6ZjG//Tamij2Wv+tHxxQW9TcryCUQwd42aJviD+lBNztH7z2xsQn5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344055; c=relaxed/simple;
	bh=iOIeBW3gVe/aYeHar0PV1jPppv2ZH5IV8KPqT/YQYoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uSgSMbH97pgfzNHVgNjeFARSt5uJtStWqn26myfEDW2Bpus4+FRoIyKnZVMTWM7eq5/OM48DW/Sv0AUu4waKxwGGZ1T8hIR6WE6V3mlU9iRfWJ1G/GJ1VeCPrgmGyrOYAQnqQLWfhGV+qntSTHsKNdQbxxL15letxDUND+Vgvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtK6iG/c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtK6iG/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771344054; x=1802880054;
  h=date:from:to:cc:subject:message-id;
  bh=iOIeBW3gVe/aYeHar0PV1jPppv2ZH5IV8KPqT/YQYoo=;
  b=NtK6iG/c+rnnSHasXGpyvli9mTKLz7ZoHIG64NIwye7lXwyLO9uhl1oG
   O78heKxD2Bj3H+blo5jQrmm6vfFwih780FJW4MuLfehQM9Iqv78jIUWcf
   /NzrcCcnleuvirDQHnBmOHr+4ZDLvdl170zqpXIqMcM4rn34kasch2dmz
   fORxsrcnIUl1zYBcfEAe8dMXnNUF5UONtO0Q/POESQcMQG8IWgypXMqsl
   tyM3WCGxgrkFneXsMn4na8NSNXKE2dSvSzoUZU47dS+7TgIZOzG5LyyQc
   hb2AINIOlWHDOGKkgfsaRei68kPeSD6wmn75MwMNCf6M+NB264QP6cyIz
   Q==;
X-CSE-ConnectionGUID: eZ7Bib4RQr6qBOzQBvYfLw==
X-CSE-MsgGUID: bZAjqYsOSwubSisIMprvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72482598"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72482598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 08:00:53 -0800
X-CSE-ConnectionGUID: GJzeAxeDTDa1/2FhoGxRtg==
X-CSE-MsgGUID: 0gGMuqYoQMqHoyeVhiKbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="218053004"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2026 08:00:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsNVJ-0000000118A-0vzV;
	Tue, 17 Feb 2026 16:00:49 +0000
Date: Tue, 17 Feb 2026 23:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/relocation.c:4343:1-7: preceding lock on line 4204
Message-ID: <202602172307.S6ZqYvQn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Harmstone <mark@harmstone.com>
CC: David Sterba <dsterba@suse.com>
CC: Boris Burkov <boris@bur.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: bbea42dfb91f6901243958c83f26bbbd3a4a85fa btrfs: move existing remaps before relocating block group
date:   2 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r064-20260215 (https://download.01.org/0day-ci/archive/20260217/202602172307.S6ZqYvQn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602172307.S6ZqYvQn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/relocation.c:4343:1-7: preceding lock on line 4204

vim +4343 fs/btrfs/relocation.c

bbea42dfb91f69 Mark Harmstone 2026-01-07  4148  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4149  static int move_existing_remap(struct btrfs_fs_info *fs_info,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4150  			       struct btrfs_path *path,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4151  			       struct btrfs_block_group *bg, u64 new_addr,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4152  			       u64 length, u64 old_addr)
bbea42dfb91f69 Mark Harmstone 2026-01-07  4153  {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4154  	struct btrfs_trans_handle *trans;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4155  	struct extent_buffer *leaf;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4156  	struct btrfs_remap_item *remap_ptr;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4157  	struct btrfs_remap_item remap = { 0 };
bbea42dfb91f69 Mark Harmstone 2026-01-07  4158  	struct btrfs_key key, ins;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4159  	u64 dest_addr, dest_length, min_size;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4160  	struct btrfs_block_group *dest_bg;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4161  	int ret;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4162  	const bool is_data = (bg->flags & BTRFS_BLOCK_GROUP_DATA);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4163  	struct btrfs_space_info *sinfo = bg->space_info;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4164  	bool mutex_taken = false;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4165  	bool bg_needs_free_space;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4166  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4167  	spin_lock(&sinfo->lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4168  	btrfs_space_info_update_bytes_may_use(sinfo, length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4169  	spin_unlock(&sinfo->lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4170  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4171  	if (is_data)
bbea42dfb91f69 Mark Harmstone 2026-01-07  4172  		min_size = fs_info->sectorsize;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4173  	else
bbea42dfb91f69 Mark Harmstone 2026-01-07  4174  		min_size = fs_info->nodesize;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4175  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4176  	ret = btrfs_reserve_extent(fs_info->fs_root, length, length, min_size,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4177  				   0, 0, &ins, is_data, false);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4178  	if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4179  		spin_lock(&sinfo->lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4180  		btrfs_space_info_update_bytes_may_use(sinfo, -length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4181  		spin_unlock(&sinfo->lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4182  		return ret;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4183  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4184  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4185  	dest_addr = ins.objectid;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4186  	dest_length = ins.offset;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4187  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4188  	if (!is_data && !IS_ALIGNED(dest_length, fs_info->nodesize)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4189  		u64 new_length = ALIGN_DOWN(dest_length, fs_info->nodesize);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4190  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4191  		btrfs_free_reserved_extent(fs_info, dest_addr + new_length,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4192  					   dest_length - new_length, 0);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4193  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4194  		dest_length = new_length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4195  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4196  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4197  	trans = btrfs_join_transaction(fs_info->remap_root);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4198  	if (IS_ERR(trans)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4199  		ret = PTR_ERR(trans);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4200  		trans = NULL;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4201  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4202  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4203  
bbea42dfb91f69 Mark Harmstone 2026-01-07 @4204  	mutex_lock(&fs_info->remap_mutex);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4205  	mutex_taken = true;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4206  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4207  	/* Find old remap entry. */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4208  	key.objectid = old_addr;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4209  	key.type = BTRFS_REMAP_KEY;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4210  	key.offset = length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4211  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4212  	ret = btrfs_search_slot(trans, fs_info->remap_root, &key, path, 0, 1);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4213  	if (ret == 1) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4214  		/*
bbea42dfb91f69 Mark Harmstone 2026-01-07  4215  		 * Not a problem if the remap entry wasn't found: that means
bbea42dfb91f69 Mark Harmstone 2026-01-07  4216  		 * that another transaction has deallocated the data.
bbea42dfb91f69 Mark Harmstone 2026-01-07  4217  		 * move_existing_remaps() loops until the BG contains no
bbea42dfb91f69 Mark Harmstone 2026-01-07  4218  		 * remaps, so we can just return 0 in this case.
bbea42dfb91f69 Mark Harmstone 2026-01-07  4219  		 */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4220  		btrfs_release_path(path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4221  		ret = 0;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4222  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4223  	} else if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4224  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4225  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4226  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4227  	ret = copy_remapped_data(fs_info, new_addr, dest_addr, dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4228  	if (unlikely(ret))
bbea42dfb91f69 Mark Harmstone 2026-01-07  4229  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4230  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4231  	/* Change data of old remap entry. */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4232  	leaf = path->nodes[0];
bbea42dfb91f69 Mark Harmstone 2026-01-07  4233  	remap_ptr = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_remap_item);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4234  	btrfs_set_remap_address(leaf, remap_ptr, dest_addr);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4235  	btrfs_mark_buffer_dirty(trans, leaf);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4236  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4237  	if (dest_length != length) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4238  		key.offset = dest_length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4239  		btrfs_set_item_key_safe(trans, path, &key);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4240  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4241  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4242  	btrfs_release_path(path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4243  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4244  	if (dest_length != length) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4245  		/* Add remap item for remainder. */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4246  		ret = add_remap_item(trans, path, new_addr + dest_length,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4247  				     length - dest_length, old_addr + dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4248  		if (unlikely(ret))
bbea42dfb91f69 Mark Harmstone 2026-01-07  4249  			goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4250  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4251  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4252  	/* Change or remove old backref. */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4253  	key.objectid = new_addr;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4254  	key.type = BTRFS_REMAP_BACKREF_KEY;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4255  	key.offset = length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4256  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4257  	ret = btrfs_search_slot(trans, fs_info->remap_root, &key, path, -1, 1);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4258  	if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4259  		if (ret == 1) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4260  			btrfs_release_path(path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4261  			ret = -ENOENT;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4262  		}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4263  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4264  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4265  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4266  	leaf = path->nodes[0];
bbea42dfb91f69 Mark Harmstone 2026-01-07  4267  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4268  	if (dest_length == length) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4269  		ret = btrfs_del_item(trans, fs_info->remap_root, path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4270  		if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4271  			btrfs_release_path(path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4272  			goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4273  		}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4274  	} else {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4275  		key.objectid += dest_length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4276  		key.offset -= dest_length;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4277  		btrfs_set_item_key_safe(trans, path, &key);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4278  		btrfs_set_stack_remap_address(&remap, old_addr + dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4279  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4280  		write_extent_buffer(leaf, &remap,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4281  				    btrfs_item_ptr_offset(leaf, path->slots[0]),
bbea42dfb91f69 Mark Harmstone 2026-01-07  4282  				    sizeof(struct btrfs_remap_item));
bbea42dfb91f69 Mark Harmstone 2026-01-07  4283  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4284  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4285  	btrfs_release_path(path);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4286  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4287  	/* Add new backref. */
bbea42dfb91f69 Mark Harmstone 2026-01-07  4288  	ret = add_remap_backref_item(trans, path, dest_addr, dest_length, old_addr);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4289  	if (unlikely(ret))
bbea42dfb91f69 Mark Harmstone 2026-01-07  4290  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4291  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4292  	adjust_block_group_remap_bytes(trans, bg, -dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4293  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4294  	ret = btrfs_add_to_free_space_tree(trans, new_addr, dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4295  	if (unlikely(ret))
bbea42dfb91f69 Mark Harmstone 2026-01-07  4296  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4297  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4298  	dest_bg = btrfs_lookup_block_group(fs_info, dest_addr);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4299  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4300  	adjust_block_group_remap_bytes(trans, dest_bg, dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4301  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4302  	mutex_lock(&dest_bg->free_space_lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4303  	bg_needs_free_space = test_bit(BLOCK_GROUP_FLAG_NEEDS_FREE_SPACE,
bbea42dfb91f69 Mark Harmstone 2026-01-07  4304  				       &dest_bg->runtime_flags);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4305  	mutex_unlock(&dest_bg->free_space_lock);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4306  	btrfs_put_block_group(dest_bg);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4307  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4308  	if (bg_needs_free_space) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4309  		ret = btrfs_add_block_group_free_space(trans, dest_bg);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4310  		if (unlikely(ret))
bbea42dfb91f69 Mark Harmstone 2026-01-07  4311  			goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4312  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4313  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4314  	ret = btrfs_remove_from_free_space_tree(trans, dest_addr, dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4315  	if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4316  		btrfs_remove_from_free_space_tree(trans, new_addr, dest_length);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4317  		goto end;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4318  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4319  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4320  	ret = 0;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4321  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4322  end:
bbea42dfb91f69 Mark Harmstone 2026-01-07  4323  	if (mutex_taken)
bbea42dfb91f69 Mark Harmstone 2026-01-07  4324  		mutex_unlock(&fs_info->remap_mutex);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4325  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4326  	btrfs_dec_block_group_reservations(fs_info, dest_addr);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4327  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4328  	if (unlikely(ret)) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4329  		btrfs_free_reserved_extent(fs_info, dest_addr, dest_length, 0);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4330  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4331  		if (trans) {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4332  			btrfs_abort_transaction(trans, ret);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4333  			btrfs_end_transaction(trans);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4334  		}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4335  	} else {
bbea42dfb91f69 Mark Harmstone 2026-01-07  4336  		dest_bg = btrfs_lookup_block_group(fs_info, dest_addr);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4337  		btrfs_free_reserved_bytes(dest_bg, dest_length, 0);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4338  		btrfs_put_block_group(dest_bg);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4339  
bbea42dfb91f69 Mark Harmstone 2026-01-07  4340  		ret = btrfs_commit_transaction(trans);
bbea42dfb91f69 Mark Harmstone 2026-01-07  4341  	}
bbea42dfb91f69 Mark Harmstone 2026-01-07  4342  
bbea42dfb91f69 Mark Harmstone 2026-01-07 @4343  	return ret;
bbea42dfb91f69 Mark Harmstone 2026-01-07  4344  }
bbea42dfb91f69 Mark Harmstone 2026-01-07  4345  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
