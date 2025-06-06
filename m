Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BF23817A
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 23:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252223; cv=none; b=aIIHC+bRwLEe9374pB4qKOGzb8vwMDs/DvIinqlq1iYlyxaCepnY9epjlWe4k5/H5mD64BD5faNeh8LtdNKW5pa/9iDuH7XgKcS9Fd2JMHcf3H5RPdkqWpxYx87oy14lloOW8MN41MEthL/GfaBAp0jjAPFyjT6LaAxItjwO7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252223; c=relaxed/simple;
	bh=E0wsNQ5Y9eY9DcRX8Z7Hp84m2k8/9NqtAEgafab7P+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbF24bdI+Jcz1YoRoGbTP2+oQKIlb815ypSaqyBaSM9ZG0nv0qc91UzNX9ugJELE+uKsqHl6Yagl9BcrvPVhCrerP8+o4KhbN7nF7lO2t993yoQD99MgnvFIJDFlFLGO6jNRxD/R8R8asDcwlA4rJkSapanH6IM9UNRuLvePG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDTO8GSN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDTO8GSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749252221; x=1780788221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0wsNQ5Y9eY9DcRX8Z7Hp84m2k8/9NqtAEgafab7P+E=;
  b=oDTO8GSN6zwnAQOdGc0Kbrnuze6dmyfoYOnhqr466hohqLksuZzgVoS1
   P6w/RgahpVHXBi6AcBU+b+H3nk+bkiYgLh8UrYwGozj80lYCljdzwS0VD
   1pBS9N/OZ5RPutVohuKxLPx3vWZIpouugjlXigXxgejHAzARPP5rEONkL
   VCjci4uQ9nJ8wsOpQg8MbllE3FsuZNu1MTgccr2nrjwoMa8MDEXAvDSFL
   +v3j7KzILlot3gN7/vX/Q1c+HDmvtERc1UFdlOpRTNFaZWsGawT2JIfp4
   BdMqg1S7be8nDbt0vTzFz440eYc3Og8MHxCPEDpkXuCRLNcWCLwknNWyC
   w==;
X-CSE-ConnectionGUID: ck0HTaBZTuer7qfyXqJAJQ==
X-CSE-MsgGUID: l2/MsWDXQ3GyqC9YWPwn5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62809851"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62809851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 16:23:38 -0700
X-CSE-ConnectionGUID: 3R3k6pBYQcuIvuQZG2adZw==
X-CSE-MsgGUID: pnJ+8M6lQl6KxQbJ5H9/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145878078"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2025 16:23:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNgPO-0005Kr-2n;
	Fri, 06 Jun 2025 23:23:34 +0000
Date: Sat, 7 Jun 2025 07:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 12/12] btrfs: replace identity maps with actual remaps
 when doing relocations
Message-ID: <202506070726.RNG32ur3-lkp@intel.com>
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
In-Reply-To: <20250605162345.2561026-13-maharmstone@fb.com>
References: <20250605162345.2561026-13-maharmstone@fb.com>
TO: Mark Harmstone <maharmstone@fb.com>
TO: linux-btrfs@vger.kernel.org
CC: Mark Harmstone <maharmstone@fb.com>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20250606]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Harmstone/btrfs-add-definitions-and-constants-for-remap-tree/20250606-002804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20250605162345.2561026-13-maharmstone%40fb.com
patch subject: [PATCH 12/12] btrfs: replace identity maps with actual remaps when doing relocations
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: hexagon-randconfig-r072-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070726.RNG32ur3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506070726.RNG32ur3-lkp@intel.com/

smatch warnings:
fs/btrfs/relocation.c:5167 do_remap_tree_reloc_trans() warn: variable dereferenced before check 'dest_bg' (see line 5096)

vim +/dest_bg +5167 fs/btrfs/relocation.c

9d106e9eb328ac Mark Harmstone 2025-06-05  5019  
d273bbfb12e73f Mark Harmstone 2025-06-05  5020  static int do_remap_tree_reloc_trans(struct btrfs_fs_info *fs_info,
d273bbfb12e73f Mark Harmstone 2025-06-05  5021  				     struct btrfs_block_group *src_bg,
d273bbfb12e73f Mark Harmstone 2025-06-05  5022  				     struct btrfs_path *path, u64 *last_start)
d273bbfb12e73f Mark Harmstone 2025-06-05  5023  {
d273bbfb12e73f Mark Harmstone 2025-06-05  5024  	struct btrfs_trans_handle *trans;
d273bbfb12e73f Mark Harmstone 2025-06-05  5025  	struct btrfs_root *extent_root;
d273bbfb12e73f Mark Harmstone 2025-06-05  5026  	struct btrfs_key ins;
d273bbfb12e73f Mark Harmstone 2025-06-05  5027  	struct btrfs_block_group *dest_bg = NULL;
d273bbfb12e73f Mark Harmstone 2025-06-05  5028  	struct btrfs_chunk_map *chunk;
d273bbfb12e73f Mark Harmstone 2025-06-05  5029  	u64 start, remap_length, length, new_addr, min_size;
d273bbfb12e73f Mark Harmstone 2025-06-05  5030  	int ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5031  	bool no_more = false;
d273bbfb12e73f Mark Harmstone 2025-06-05  5032  	bool is_data = src_bg->flags & BTRFS_BLOCK_GROUP_DATA;
d273bbfb12e73f Mark Harmstone 2025-06-05  5033  	bool made_reservation = false, bg_needs_free_space;
d273bbfb12e73f Mark Harmstone 2025-06-05  5034  	struct btrfs_space_info *sinfo = src_bg->space_info;
d273bbfb12e73f Mark Harmstone 2025-06-05  5035  
d273bbfb12e73f Mark Harmstone 2025-06-05  5036  	extent_root = btrfs_extent_root(fs_info, src_bg->start);
d273bbfb12e73f Mark Harmstone 2025-06-05  5037  
d273bbfb12e73f Mark Harmstone 2025-06-05  5038  	trans = btrfs_start_transaction(extent_root, 0);
d273bbfb12e73f Mark Harmstone 2025-06-05  5039  	if (IS_ERR(trans))
d273bbfb12e73f Mark Harmstone 2025-06-05  5040  		return PTR_ERR(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5041  
d273bbfb12e73f Mark Harmstone 2025-06-05  5042  	mutex_lock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5043  
d273bbfb12e73f Mark Harmstone 2025-06-05  5044  	ret = find_next_identity_remap(trans, path, src_bg->start + src_bg->length,
d273bbfb12e73f Mark Harmstone 2025-06-05  5045  				       *last_start, &start, &remap_length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5046  	if (ret == -ENOENT) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5047  		no_more = true;
d273bbfb12e73f Mark Harmstone 2025-06-05  5048  		goto next;
d273bbfb12e73f Mark Harmstone 2025-06-05  5049  	} else if (ret) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5050  		mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5051  		btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5052  		return ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5053  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5054  
d273bbfb12e73f Mark Harmstone 2025-06-05  5055  	/* Try to reserve enough space for block. */
d273bbfb12e73f Mark Harmstone 2025-06-05  5056  
d273bbfb12e73f Mark Harmstone 2025-06-05  5057  	spin_lock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5058  	btrfs_space_info_update_bytes_may_use(sinfo, remap_length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5059  	spin_unlock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5060  
d273bbfb12e73f Mark Harmstone 2025-06-05  5061  	if (is_data)
d273bbfb12e73f Mark Harmstone 2025-06-05  5062  		min_size = fs_info->sectorsize;
d273bbfb12e73f Mark Harmstone 2025-06-05  5063  	else
d273bbfb12e73f Mark Harmstone 2025-06-05  5064  		min_size = fs_info->nodesize;
d273bbfb12e73f Mark Harmstone 2025-06-05  5065  
d273bbfb12e73f Mark Harmstone 2025-06-05  5066  	ret = btrfs_reserve_extent(fs_info->fs_root, remap_length,
d273bbfb12e73f Mark Harmstone 2025-06-05  5067  				   remap_length, min_size,
d273bbfb12e73f Mark Harmstone 2025-06-05  5068  				   0, 0, &ins, is_data, false);
d273bbfb12e73f Mark Harmstone 2025-06-05  5069  	if (ret) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5070  		spin_lock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5071  		btrfs_space_info_update_bytes_may_use(sinfo, -remap_length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5072  		spin_unlock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5073  
d273bbfb12e73f Mark Harmstone 2025-06-05  5074  		mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5075  		btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5076  		return ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5077  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5078  
d273bbfb12e73f Mark Harmstone 2025-06-05  5079  	made_reservation = true;
d273bbfb12e73f Mark Harmstone 2025-06-05  5080  
d273bbfb12e73f Mark Harmstone 2025-06-05  5081  	new_addr = ins.objectid;
d273bbfb12e73f Mark Harmstone 2025-06-05  5082  	length = ins.offset;
d273bbfb12e73f Mark Harmstone 2025-06-05  5083  
d273bbfb12e73f Mark Harmstone 2025-06-05  5084  	if (!is_data && !IS_ALIGNED(length, fs_info->nodesize)) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5085  		u64 new_length = ALIGN_DOWN(length, fs_info->nodesize);
d273bbfb12e73f Mark Harmstone 2025-06-05  5086  
d273bbfb12e73f Mark Harmstone 2025-06-05  5087  		btrfs_free_reserved_extent(fs_info, new_addr + new_length,
d273bbfb12e73f Mark Harmstone 2025-06-05  5088  					   length - new_length, 0);
d273bbfb12e73f Mark Harmstone 2025-06-05  5089  
d273bbfb12e73f Mark Harmstone 2025-06-05  5090  		length = new_length;
d273bbfb12e73f Mark Harmstone 2025-06-05  5091  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5092  
d273bbfb12e73f Mark Harmstone 2025-06-05  5093  	dest_bg = btrfs_lookup_block_group(fs_info, new_addr);
d273bbfb12e73f Mark Harmstone 2025-06-05  5094  
d273bbfb12e73f Mark Harmstone 2025-06-05  5095  	mutex_lock(&dest_bg->free_space_lock);
d273bbfb12e73f Mark Harmstone 2025-06-05 @5096  	bg_needs_free_space = test_bit(BLOCK_GROUP_FLAG_NEEDS_FREE_SPACE,
d273bbfb12e73f Mark Harmstone 2025-06-05  5097  				       &dest_bg->runtime_flags);
d273bbfb12e73f Mark Harmstone 2025-06-05  5098  	mutex_unlock(&dest_bg->free_space_lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5099  
d273bbfb12e73f Mark Harmstone 2025-06-05  5100  	if (bg_needs_free_space) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5101  		ret = add_block_group_free_space(trans, dest_bg);
d273bbfb12e73f Mark Harmstone 2025-06-05  5102  		if (ret)
d273bbfb12e73f Mark Harmstone 2025-06-05  5103  			goto fail;
d273bbfb12e73f Mark Harmstone 2025-06-05  5104  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5105  
d273bbfb12e73f Mark Harmstone 2025-06-05  5106  	ret = do_copy(fs_info, start, new_addr, length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5107  	if (ret)
d273bbfb12e73f Mark Harmstone 2025-06-05  5108  		goto fail;
d273bbfb12e73f Mark Harmstone 2025-06-05  5109  
d273bbfb12e73f Mark Harmstone 2025-06-05  5110  	ret = remove_from_free_space_tree(trans, new_addr, length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5111  	if (ret)
d273bbfb12e73f Mark Harmstone 2025-06-05  5112  		goto fail;
d273bbfb12e73f Mark Harmstone 2025-06-05  5113  
d273bbfb12e73f Mark Harmstone 2025-06-05  5114  	ret = add_remap_entry(trans, path, src_bg, start, new_addr, length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5115  	if (ret) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5116  		add_to_free_space_tree(trans, new_addr, length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5117  		goto fail;
d273bbfb12e73f Mark Harmstone 2025-06-05  5118  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5119  
d273bbfb12e73f Mark Harmstone 2025-06-05  5120  	adjust_block_group_remap_bytes(trans, dest_bg, length);
d273bbfb12e73f Mark Harmstone 2025-06-05  5121  	btrfs_free_reserved_bytes(dest_bg, length, 0);
d273bbfb12e73f Mark Harmstone 2025-06-05  5122  
d273bbfb12e73f Mark Harmstone 2025-06-05  5123  	spin_lock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5124  	sinfo->bytes_readonly += length;
d273bbfb12e73f Mark Harmstone 2025-06-05  5125  	spin_unlock(&sinfo->lock);
d273bbfb12e73f Mark Harmstone 2025-06-05  5126  
d273bbfb12e73f Mark Harmstone 2025-06-05  5127  next:
d273bbfb12e73f Mark Harmstone 2025-06-05  5128  	if (dest_bg)
d273bbfb12e73f Mark Harmstone 2025-06-05  5129  		btrfs_put_block_group(dest_bg);
d273bbfb12e73f Mark Harmstone 2025-06-05  5130  
d273bbfb12e73f Mark Harmstone 2025-06-05  5131  	if (made_reservation)
d273bbfb12e73f Mark Harmstone 2025-06-05  5132  		btrfs_dec_block_group_reservations(fs_info, new_addr);
d273bbfb12e73f Mark Harmstone 2025-06-05  5133  
d273bbfb12e73f Mark Harmstone 2025-06-05  5134  	if (src_bg->used == 0 && src_bg->remap_bytes == 0) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5135  		chunk = btrfs_find_chunk_map(fs_info, src_bg->start, 1);
d273bbfb12e73f Mark Harmstone 2025-06-05  5136  		if (!chunk) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5137  			mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5138  			btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5139  			return -ENOENT;
d273bbfb12e73f Mark Harmstone 2025-06-05  5140  		}
d273bbfb12e73f Mark Harmstone 2025-06-05  5141  
d273bbfb12e73f Mark Harmstone 2025-06-05  5142  		ret = last_identity_remap_gone(trans, chunk, src_bg, path);
d273bbfb12e73f Mark Harmstone 2025-06-05  5143  		if (ret) {
d273bbfb12e73f Mark Harmstone 2025-06-05  5144  			btrfs_free_chunk_map(chunk);
d273bbfb12e73f Mark Harmstone 2025-06-05  5145  			mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5146  			btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5147  			return ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5148  		}
d273bbfb12e73f Mark Harmstone 2025-06-05  5149  
d273bbfb12e73f Mark Harmstone 2025-06-05  5150  		btrfs_free_chunk_map(chunk);
d273bbfb12e73f Mark Harmstone 2025-06-05  5151  	}
d273bbfb12e73f Mark Harmstone 2025-06-05  5152  
d273bbfb12e73f Mark Harmstone 2025-06-05  5153  	mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5154  
d273bbfb12e73f Mark Harmstone 2025-06-05  5155  	ret = btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5156  	if (ret)
d273bbfb12e73f Mark Harmstone 2025-06-05  5157  		return ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5158  
d273bbfb12e73f Mark Harmstone 2025-06-05  5159  	if (no_more)
d273bbfb12e73f Mark Harmstone 2025-06-05  5160  		return 1;
d273bbfb12e73f Mark Harmstone 2025-06-05  5161  
d273bbfb12e73f Mark Harmstone 2025-06-05  5162  	*last_start = start;
d273bbfb12e73f Mark Harmstone 2025-06-05  5163  
d273bbfb12e73f Mark Harmstone 2025-06-05  5164  	return 0;
d273bbfb12e73f Mark Harmstone 2025-06-05  5165  
d273bbfb12e73f Mark Harmstone 2025-06-05  5166  fail:
d273bbfb12e73f Mark Harmstone 2025-06-05 @5167  	if (dest_bg)
d273bbfb12e73f Mark Harmstone 2025-06-05  5168  		btrfs_put_block_group(dest_bg);
d273bbfb12e73f Mark Harmstone 2025-06-05  5169  
d273bbfb12e73f Mark Harmstone 2025-06-05  5170  	btrfs_free_reserved_extent(fs_info, new_addr, length, 0);
d273bbfb12e73f Mark Harmstone 2025-06-05  5171  
d273bbfb12e73f Mark Harmstone 2025-06-05  5172  	mutex_unlock(&fs_info->remap_mutex);
d273bbfb12e73f Mark Harmstone 2025-06-05  5173  	btrfs_end_transaction(trans);
d273bbfb12e73f Mark Harmstone 2025-06-05  5174  
d273bbfb12e73f Mark Harmstone 2025-06-05  5175  	return ret;
d273bbfb12e73f Mark Harmstone 2025-06-05  5176  }
d273bbfb12e73f Mark Harmstone 2025-06-05  5177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
