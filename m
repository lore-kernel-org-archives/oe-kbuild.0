Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA83CAE7F
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967868; cv=none; b=Y6efk+2Rl25kJ3Zs4P0BtjNNcrs2hkRED69FNf031+r4RgVWO25nimsceVDdoQ/c/lwN+K3f+RE6IqkNs0sJQVTVcbZ4VTFJqg+xmojeE9ypypuS5Gj12hKseZtYm17Mb8jaSzGqOYVtK7ZvCpDlA9uQs0Dq2xacaWiWcwOWa/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967868; c=relaxed/simple;
	bh=SextPs8YLYqF1umB0sFM8rw4UP3ox1CzCfXF16wU/WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KarwXQFm+gXINhUWbWSwvDDTaO+7Z0elzICK9nUkpdM12zI9GIHuTTAii3A7f1CS0f7JWEpptJFZhcdk0TKaRuUjKuDtnC3foU5etgOGFWwo5ND16L5qtvPgR/fRCAGo5TjUMFFpvYVvdnJcy+FQG5HN1Al7gy/YThe6vvdjhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEcBks0T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEcBks0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777967866; x=1809503866;
  h=date:from:to:cc:subject:message-id;
  bh=SextPs8YLYqF1umB0sFM8rw4UP3ox1CzCfXF16wU/WQ=;
  b=DEcBks0TrROyekoE3WpXvnOq1LJAmdfLjm1rl7UsPA5GQHlwd5PcrjSZ
   X53mp11cT3xDPNaIjDnZ9zYvaUlwrRjH58BAPGp9mBftpb94YuV3MBxZC
   MHYKKfK4BqS4KwF/J5qJv+GK8ZJbpMjBQoaTo9BMwLJI/AzHUhVUpFew/
   vRkVaRK++vq7pfl/dxCczQ+xRwxImCZM8aAo2+cAR9ANOCa8RPRHCzC5v
   903R8IArU/rFGAGyHSOBC1QtxOfOryjwKrgeI5/v9Z2T9gz7c3EagwGtU
   gUrwuVStyuRutR1y6SuHj8+T6zG7WyXGXj/OkGVhnd1d1vpGUV7VFpXa4
   Q==;
X-CSE-ConnectionGUID: UGsYhy4gT52IphKgMKv8GA==
X-CSE-MsgGUID: yGZ1F6ZtTTqtzIhQz4EdEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="81394534"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="81394534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:57:45 -0700
X-CSE-ConnectionGUID: TZ55zRuDSnyyzF7grUpATA==
X-CSE-MsgGUID: syAL1ljJS2mKOc/NOwK9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="239735993"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2026 00:57:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAez-000000004Mn-495V;
	Tue, 05 May 2026 07:57:41 +0000
Date: Tue, 05 May 2026 15:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ntfs/attrib.c:4227:13-14: WARNING kmalloc is used to
 allocate this memory at line 4167
Message-ID: <202605051558.aBuydHK8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: nios2-randconfig-r054-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051558.aBuydHK8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605051558.aBuydHK8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ntfs/attrib.c:4227:13-14: WARNING kmalloc is used to allocate this memory at line 4167
--
>> fs/ntfs/mft.c:2504:16-23: WARNING opportunity for kmemdup
--
>> fs/ntfs/attrib.c:1738:5-41: opportunity for str_plural(ntfs_bytes_to_cluster ( vol , new_size ))
>> fs/ntfs/attrib.c:375:3-15: opportunity for str_write_read(write_locked)

vim +4227 fs/ntfs/attrib.c

495e90fa334828d Namjae Jeon 2026-02-13  4051  
495e90fa334828d Namjae Jeon 2026-02-13  4052  /*
495e90fa334828d Namjae Jeon 2026-02-13  4053   * ntfs_non_resident_attr_expand - expand a non-resident, open ntfs attribute
495e90fa334828d Namjae Jeon 2026-02-13  4054   * @ni:			non-resident ntfs attribute to expand
495e90fa334828d Namjae Jeon 2026-02-13  4055   * @prealloc_size:	preallocation size (in bytes) to which to expand the attribute
495e90fa334828d Namjae Jeon 2026-02-13  4056   * @newsize:		new size (in bytes) to which to expand the attribute
495e90fa334828d Namjae Jeon 2026-02-13  4057   * @holes:		how to create a hole if expanding
495e90fa334828d Namjae Jeon 2026-02-13  4058   * @need_lock:		whether mrec lock is needed or not
495e90fa334828d Namjae Jeon 2026-02-13  4059   *
495e90fa334828d Namjae Jeon 2026-02-13  4060   * Expand the size of a non-resident, open ntfs attribute @na to @newsize bytes,
495e90fa334828d Namjae Jeon 2026-02-13  4061   * by allocating new clusters.
495e90fa334828d Namjae Jeon 2026-02-13  4062   */
495e90fa334828d Namjae Jeon 2026-02-13  4063  static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsize,
495e90fa334828d Namjae Jeon 2026-02-13  4064  		const s64 prealloc_size, unsigned int holes, bool need_lock)
495e90fa334828d Namjae Jeon 2026-02-13  4065  {
495e90fa334828d Namjae Jeon 2026-02-13  4066  	s64 lcn_seek_from;
495e90fa334828d Namjae Jeon 2026-02-13  4067  	s64 first_free_vcn;
495e90fa334828d Namjae Jeon 2026-02-13  4068  	struct ntfs_volume *vol;
495e90fa334828d Namjae Jeon 2026-02-13  4069  	struct ntfs_attr_search_ctx *ctx = NULL;
495e90fa334828d Namjae Jeon 2026-02-13  4070  	struct runlist_element *rl, *rln;
495e90fa334828d Namjae Jeon 2026-02-13  4071  	s64 org_alloc_size, org_compressed_size;
495e90fa334828d Namjae Jeon 2026-02-13  4072  	int err, err2;
495e90fa334828d Namjae Jeon 2026-02-13  4073  	struct ntfs_inode *base_ni;
495e90fa334828d Namjae Jeon 2026-02-13  4074  	struct super_block *sb = ni->vol->sb;
495e90fa334828d Namjae Jeon 2026-02-13  4075  	size_t new_rl_count;
495e90fa334828d Namjae Jeon 2026-02-13  4076  
495e90fa334828d Namjae Jeon 2026-02-13  4077  	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
495e90fa334828d Namjae Jeon 2026-02-13  4078  			(unsigned long long)ni->mft_no, ni->type,
495e90fa334828d Namjae Jeon 2026-02-13  4079  			(long long)newsize, (long long)ni->data_size);
495e90fa334828d Namjae Jeon 2026-02-13  4080  
495e90fa334828d Namjae Jeon 2026-02-13  4081  	vol = ni->vol;
495e90fa334828d Namjae Jeon 2026-02-13  4082  
495e90fa334828d Namjae Jeon 2026-02-13  4083  	if (NInoAttr(ni))
495e90fa334828d Namjae Jeon 2026-02-13  4084  		base_ni = ni->ext.base_ntfs_ino;
495e90fa334828d Namjae Jeon 2026-02-13  4085  	else
495e90fa334828d Namjae Jeon 2026-02-13  4086  		base_ni = ni;
495e90fa334828d Namjae Jeon 2026-02-13  4087  
495e90fa334828d Namjae Jeon 2026-02-13  4088  	/*
495e90fa334828d Namjae Jeon 2026-02-13  4089  	 * Check the attribute type and the corresponding maximum size
495e90fa334828d Namjae Jeon 2026-02-13  4090  	 * against @newsize and fail if @newsize is too big.
495e90fa334828d Namjae Jeon 2026-02-13  4091  	 */
495e90fa334828d Namjae Jeon 2026-02-13  4092  	err = ntfs_attr_size_bounds_check(vol, ni->type, newsize);
495e90fa334828d Namjae Jeon 2026-02-13  4093  	if (err	< 0) {
495e90fa334828d Namjae Jeon 2026-02-13  4094  		ntfs_error(sb, "%s: bounds check failed", __func__);
495e90fa334828d Namjae Jeon 2026-02-13  4095  		return err;
495e90fa334828d Namjae Jeon 2026-02-13  4096  	}
495e90fa334828d Namjae Jeon 2026-02-13  4097  
495e90fa334828d Namjae Jeon 2026-02-13  4098  	/* Save for future use. */
495e90fa334828d Namjae Jeon 2026-02-13  4099  	org_alloc_size = ni->allocated_size;
495e90fa334828d Namjae Jeon 2026-02-13  4100  	org_compressed_size = ni->itype.compressed.size;
495e90fa334828d Namjae Jeon 2026-02-13  4101  
495e90fa334828d Namjae Jeon 2026-02-13  4102  	/* The first cluster outside the new allocation. */
495e90fa334828d Namjae Jeon 2026-02-13  4103  	if (prealloc_size)
495e90fa334828d Namjae Jeon 2026-02-13  4104  		first_free_vcn =
495e90fa334828d Namjae Jeon 2026-02-13  4105  			ntfs_bytes_to_cluster(vol, prealloc_size + vol->cluster_size - 1);
495e90fa334828d Namjae Jeon 2026-02-13  4106  	else
495e90fa334828d Namjae Jeon 2026-02-13  4107  		first_free_vcn =
495e90fa334828d Namjae Jeon 2026-02-13  4108  			ntfs_bytes_to_cluster(vol, newsize + vol->cluster_size - 1);
495e90fa334828d Namjae Jeon 2026-02-13  4109  	if (first_free_vcn < 0)
495e90fa334828d Namjae Jeon 2026-02-13  4110  		return -EFBIG;
495e90fa334828d Namjae Jeon 2026-02-13  4111  
495e90fa334828d Namjae Jeon 2026-02-13  4112  	/*
495e90fa334828d Namjae Jeon 2026-02-13  4113  	 * Compare the new allocation with the old one and only allocate
495e90fa334828d Namjae Jeon 2026-02-13  4114  	 * clusters if there is a change.
495e90fa334828d Namjae Jeon 2026-02-13  4115  	 */
495e90fa334828d Namjae Jeon 2026-02-13  4116  	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
495e90fa334828d Namjae Jeon 2026-02-13  4117  		err = ntfs_attr_map_whole_runlist(ni);
495e90fa334828d Namjae Jeon 2026-02-13  4118  		if (err) {
495e90fa334828d Namjae Jeon 2026-02-13  4119  			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
495e90fa334828d Namjae Jeon 2026-02-13  4120  			return err;
495e90fa334828d Namjae Jeon 2026-02-13  4121  		}
495e90fa334828d Namjae Jeon 2026-02-13  4122  
495e90fa334828d Namjae Jeon 2026-02-13  4123  		/*
495e90fa334828d Namjae Jeon 2026-02-13  4124  		 * If we extend $DATA attribute on NTFS 3+ volume, we can add
495e90fa334828d Namjae Jeon 2026-02-13  4125  		 * sparse runs instead of real allocation of clusters.
495e90fa334828d Namjae Jeon 2026-02-13  4126  		 */
495e90fa334828d Namjae Jeon 2026-02-13  4127  		if ((ni->type == AT_DATA && (vol->major_ver >= 3 || !NInoSparseDisabled(ni))) &&
495e90fa334828d Namjae Jeon 2026-02-13  4128  		    (holes != HOLES_NO)) {
495e90fa334828d Namjae Jeon 2026-02-13  4129  			if (NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon 2026-02-13  4130  				int last = 0, i = 0;
495e90fa334828d Namjae Jeon 2026-02-13  4131  				s64 alloc_size;
495e90fa334828d Namjae Jeon 2026-02-13  4132  				u64 more_entries = round_up(first_free_vcn -
495e90fa334828d Namjae Jeon 2026-02-13  4133  						 ntfs_bytes_to_cluster(vol, ni->allocated_size),
495e90fa334828d Namjae Jeon 2026-02-13  4134  						 ni->itype.compressed.block_clusters);
495e90fa334828d Namjae Jeon 2026-02-13  4135  
495e90fa334828d Namjae Jeon 2026-02-13  4136  				do_div(more_entries, ni->itype.compressed.block_clusters);
495e90fa334828d Namjae Jeon 2026-02-13  4137  
495e90fa334828d Namjae Jeon 2026-02-13  4138  				while (ni->runlist.rl[last].length)
495e90fa334828d Namjae Jeon 2026-02-13  4139  					last++;
495e90fa334828d Namjae Jeon 2026-02-13  4140  
495e90fa334828d Namjae Jeon 2026-02-13  4141  				rl = ntfs_rl_realloc(ni->runlist.rl, last + 1,
495e90fa334828d Namjae Jeon 2026-02-13  4142  						last + more_entries + 1);
495e90fa334828d Namjae Jeon 2026-02-13  4143  				if (IS_ERR(rl)) {
495e90fa334828d Namjae Jeon 2026-02-13  4144  					err = -ENOMEM;
495e90fa334828d Namjae Jeon 2026-02-13  4145  					goto put_err_out;
495e90fa334828d Namjae Jeon 2026-02-13  4146  				}
495e90fa334828d Namjae Jeon 2026-02-13  4147  
495e90fa334828d Namjae Jeon 2026-02-13  4148  				alloc_size = ni->allocated_size;
495e90fa334828d Namjae Jeon 2026-02-13  4149  				while (i++ < more_entries) {
495e90fa334828d Namjae Jeon 2026-02-13  4150  					rl[last].vcn = ntfs_bytes_to_cluster(vol,
495e90fa334828d Namjae Jeon 2026-02-13  4151  							round_up(alloc_size, vol->cluster_size));
495e90fa334828d Namjae Jeon 2026-02-13  4152  					rl[last].length = ni->itype.compressed.block_clusters -
495e90fa334828d Namjae Jeon 2026-02-13  4153  						(rl[last].vcn &
495e90fa334828d Namjae Jeon 2026-02-13  4154  						 (ni->itype.compressed.block_clusters - 1));
495e90fa334828d Namjae Jeon 2026-02-13  4155  					rl[last].lcn = LCN_HOLE;
495e90fa334828d Namjae Jeon 2026-02-13  4156  					last++;
495e90fa334828d Namjae Jeon 2026-02-13  4157  					alloc_size += ni->itype.compressed.block_size;
495e90fa334828d Namjae Jeon 2026-02-13  4158  				}
495e90fa334828d Namjae Jeon 2026-02-13  4159  
495e90fa334828d Namjae Jeon 2026-02-13  4160  				rl[last].vcn = first_free_vcn;
495e90fa334828d Namjae Jeon 2026-02-13  4161  				rl[last].lcn = LCN_ENOENT;
495e90fa334828d Namjae Jeon 2026-02-13  4162  				rl[last].length = 0;
495e90fa334828d Namjae Jeon 2026-02-13  4163  
495e90fa334828d Namjae Jeon 2026-02-13  4164  				ni->runlist.rl = rl;
495e90fa334828d Namjae Jeon 2026-02-13  4165  				ni->runlist.count += more_entries;
495e90fa334828d Namjae Jeon 2026-02-13  4166  			} else {
495e90fa334828d Namjae Jeon 2026-02-13 @4167  				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
495e90fa334828d Namjae Jeon 2026-02-13  4168  				if (!rl) {
495e90fa334828d Namjae Jeon 2026-02-13  4169  					err = -ENOMEM;
495e90fa334828d Namjae Jeon 2026-02-13  4170  					goto put_err_out;
495e90fa334828d Namjae Jeon 2026-02-13  4171  				}
495e90fa334828d Namjae Jeon 2026-02-13  4172  
495e90fa334828d Namjae Jeon 2026-02-13  4173  				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
495e90fa334828d Namjae Jeon 2026-02-13  4174  				rl[0].lcn = LCN_HOLE;
495e90fa334828d Namjae Jeon 2026-02-13  4175  				rl[0].length = first_free_vcn -
495e90fa334828d Namjae Jeon 2026-02-13  4176  					ntfs_bytes_to_cluster(vol, ni->allocated_size);
495e90fa334828d Namjae Jeon 2026-02-13  4177  				rl[1].vcn = first_free_vcn;
495e90fa334828d Namjae Jeon 2026-02-13  4178  				rl[1].lcn = LCN_ENOENT;
495e90fa334828d Namjae Jeon 2026-02-13  4179  				rl[1].length = 0;
495e90fa334828d Namjae Jeon 2026-02-13  4180  			}
495e90fa334828d Namjae Jeon 2026-02-13  4181  		} else {
495e90fa334828d Namjae Jeon 2026-02-13  4182  			/*
495e90fa334828d Namjae Jeon 2026-02-13  4183  			 * Determine first after last LCN of attribute.
495e90fa334828d Namjae Jeon 2026-02-13  4184  			 * We will start seek clusters from this LCN to avoid
495e90fa334828d Namjae Jeon 2026-02-13  4185  			 * fragmentation.  If there are no valid LCNs in the
495e90fa334828d Namjae Jeon 2026-02-13  4186  			 * attribute let the cluster allocator choose the
495e90fa334828d Namjae Jeon 2026-02-13  4187  			 * starting LCN.
495e90fa334828d Namjae Jeon 2026-02-13  4188  			 */
495e90fa334828d Namjae Jeon 2026-02-13  4189  			lcn_seek_from = -1;
495e90fa334828d Namjae Jeon 2026-02-13  4190  			if (ni->runlist.rl->length) {
495e90fa334828d Namjae Jeon 2026-02-13  4191  				/* Seek to the last run list element. */
495e90fa334828d Namjae Jeon 2026-02-13  4192  				for (rl = ni->runlist.rl; (rl + 1)->length; rl++)
495e90fa334828d Namjae Jeon 2026-02-13  4193  					;
495e90fa334828d Namjae Jeon 2026-02-13  4194  				/*
495e90fa334828d Namjae Jeon 2026-02-13  4195  				 * If the last LCN is a hole or similar seek
495e90fa334828d Namjae Jeon 2026-02-13  4196  				 * back to last valid LCN.
495e90fa334828d Namjae Jeon 2026-02-13  4197  				 */
495e90fa334828d Namjae Jeon 2026-02-13  4198  				while (rl->lcn < 0 && rl != ni->runlist.rl)
495e90fa334828d Namjae Jeon 2026-02-13  4199  					rl--;
495e90fa334828d Namjae Jeon 2026-02-13  4200  				/*
495e90fa334828d Namjae Jeon 2026-02-13  4201  				 * Only set lcn_seek_from it the LCN is valid.
495e90fa334828d Namjae Jeon 2026-02-13  4202  				 */
495e90fa334828d Namjae Jeon 2026-02-13  4203  				if (rl->lcn >= 0)
495e90fa334828d Namjae Jeon 2026-02-13  4204  					lcn_seek_from = rl->lcn + rl->length;
495e90fa334828d Namjae Jeon 2026-02-13  4205  			}
495e90fa334828d Namjae Jeon 2026-02-13  4206  
495e90fa334828d Namjae Jeon 2026-02-13  4207  			rl = ntfs_cluster_alloc(vol,
495e90fa334828d Namjae Jeon 2026-02-13  4208  					ntfs_bytes_to_cluster(vol, ni->allocated_size),
495e90fa334828d Namjae Jeon 2026-02-13  4209  					first_free_vcn -
495e90fa334828d Namjae Jeon 2026-02-13  4210  					ntfs_bytes_to_cluster(vol, ni->allocated_size),
495e90fa334828d Namjae Jeon 2026-02-13  4211  					lcn_seek_from, DATA_ZONE, false, false, false);
495e90fa334828d Namjae Jeon 2026-02-13  4212  			if (IS_ERR(rl)) {
495e90fa334828d Namjae Jeon 2026-02-13  4213  				ntfs_debug("Cluster allocation failed (%lld)",
495e90fa334828d Namjae Jeon 2026-02-13  4214  						(long long)first_free_vcn -
495e90fa334828d Namjae Jeon 2026-02-13  4215  						ntfs_bytes_to_cluster(vol, ni->allocated_size));
495e90fa334828d Namjae Jeon 2026-02-13  4216  				return PTR_ERR(rl);
495e90fa334828d Namjae Jeon 2026-02-13  4217  			}
495e90fa334828d Namjae Jeon 2026-02-13  4218  		}
495e90fa334828d Namjae Jeon 2026-02-13  4219  
495e90fa334828d Namjae Jeon 2026-02-13  4220  		if (!NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon 2026-02-13  4221  			/* Append new clusters to attribute runlist. */
495e90fa334828d Namjae Jeon 2026-02-13  4222  			rln = ntfs_runlists_merge(&ni->runlist, rl, 0, &new_rl_count);
495e90fa334828d Namjae Jeon 2026-02-13  4223  			if (IS_ERR(rln)) {
495e90fa334828d Namjae Jeon 2026-02-13  4224  				/* Failed, free just allocated clusters. */
495e90fa334828d Namjae Jeon 2026-02-13  4225  				ntfs_error(sb, "Run list merge failed");
495e90fa334828d Namjae Jeon 2026-02-13  4226  				ntfs_cluster_free_from_rl(vol, rl);
495e90fa334828d Namjae Jeon 2026-02-13 @4227  				kvfree(rl);
495e90fa334828d Namjae Jeon 2026-02-13  4228  				return -EIO;
495e90fa334828d Namjae Jeon 2026-02-13  4229  			}
495e90fa334828d Namjae Jeon 2026-02-13  4230  			ni->runlist.rl = rln;
495e90fa334828d Namjae Jeon 2026-02-13  4231  			ni->runlist.count = new_rl_count;
495e90fa334828d Namjae Jeon 2026-02-13  4232  		}
495e90fa334828d Namjae Jeon 2026-02-13  4233  
495e90fa334828d Namjae Jeon 2026-02-13  4234  		/* Prepare to mapping pairs update. */
495e90fa334828d Namjae Jeon 2026-02-13  4235  		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
495e90fa334828d Namjae Jeon 2026-02-13  4236  		err = ntfs_attr_update_mapping_pairs(ni, 0);
495e90fa334828d Namjae Jeon 2026-02-13  4237  		if (err) {
495e90fa334828d Namjae Jeon 2026-02-13  4238  			ntfs_debug("Mapping pairs update failed");
495e90fa334828d Namjae Jeon 2026-02-13  4239  			goto rollback;
495e90fa334828d Namjae Jeon 2026-02-13  4240  		}
495e90fa334828d Namjae Jeon 2026-02-13  4241  	}
495e90fa334828d Namjae Jeon 2026-02-13  4242  
495e90fa334828d Namjae Jeon 2026-02-13  4243  	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
495e90fa334828d Namjae Jeon 2026-02-13  4244  	if (!ctx) {
495e90fa334828d Namjae Jeon 2026-02-13  4245  		err = -ENOMEM;
495e90fa334828d Namjae Jeon 2026-02-13  4246  		if (ni->allocated_size == org_alloc_size)
495e90fa334828d Namjae Jeon 2026-02-13  4247  			return err;
495e90fa334828d Namjae Jeon 2026-02-13  4248  		goto rollback;
495e90fa334828d Namjae Jeon 2026-02-13  4249  	}
495e90fa334828d Namjae Jeon 2026-02-13  4250  
495e90fa334828d Namjae Jeon 2026-02-13  4251  	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len, CASE_SENSITIVE,
495e90fa334828d Namjae Jeon 2026-02-13  4252  			       0, NULL, 0, ctx);
495e90fa334828d Namjae Jeon 2026-02-13  4253  	if (err) {
495e90fa334828d Namjae Jeon 2026-02-13  4254  		if (err == -ENOENT)
495e90fa334828d Namjae Jeon 2026-02-13  4255  			err = -EIO;
495e90fa334828d Namjae Jeon 2026-02-13  4256  		if (ni->allocated_size != org_alloc_size)
495e90fa334828d Namjae Jeon 2026-02-13  4257  			goto rollback;
495e90fa334828d Namjae Jeon 2026-02-13  4258  		goto put_err_out;
495e90fa334828d Namjae Jeon 2026-02-13  4259  	}
495e90fa334828d Namjae Jeon 2026-02-13  4260  
495e90fa334828d Namjae Jeon 2026-02-13  4261  	/* Update data size. */
495e90fa334828d Namjae Jeon 2026-02-13  4262  	ni->data_size = newsize;
495e90fa334828d Namjae Jeon 2026-02-13  4263  	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
495e90fa334828d Namjae Jeon 2026-02-13  4264  	/* Update data size in the index. */
495e90fa334828d Namjae Jeon 2026-02-13  4265  	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
495e90fa334828d Namjae Jeon 2026-02-13  4266  		NInoSetFileNameDirty(ni);
495e90fa334828d Namjae Jeon 2026-02-13  4267  	/* Set the inode dirty so it is written out later. */
495e90fa334828d Namjae Jeon 2026-02-13  4268  	mark_mft_record_dirty(ctx->ntfs_ino);
495e90fa334828d Namjae Jeon 2026-02-13  4269  	/* Done! */
495e90fa334828d Namjae Jeon 2026-02-13  4270  	ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  4271  	return 0;
495e90fa334828d Namjae Jeon 2026-02-13  4272  rollback:
495e90fa334828d Namjae Jeon 2026-02-13  4273  	/* Free allocated clusters. */
495e90fa334828d Namjae Jeon 2026-02-13  4274  	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
495e90fa334828d Namjae Jeon 2026-02-13  4275  				-1, ctx);
495e90fa334828d Namjae Jeon 2026-02-13  4276  	if (err2)
495e90fa334828d Namjae Jeon 2026-02-13  4277  		ntfs_debug("Leaking clusters");
495e90fa334828d Namjae Jeon 2026-02-13  4278  
495e90fa334828d Namjae Jeon 2026-02-13  4279  	/* Now, truncate the runlist itself. */
495e90fa334828d Namjae Jeon 2026-02-13  4280  	if (need_lock)
495e90fa334828d Namjae Jeon 2026-02-13  4281  		down_write(&ni->runlist.lock);
495e90fa334828d Namjae Jeon 2026-02-13  4282  	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
495e90fa334828d Namjae Jeon 2026-02-13  4283  			ntfs_bytes_to_cluster(vol, org_alloc_size));
495e90fa334828d Namjae Jeon 2026-02-13  4284  	if (need_lock)
495e90fa334828d Namjae Jeon 2026-02-13  4285  		up_write(&ni->runlist.lock);
495e90fa334828d Namjae Jeon 2026-02-13  4286  	if (err2) {
495e90fa334828d Namjae Jeon 2026-02-13  4287  		/*
495e90fa334828d Namjae Jeon 2026-02-13  4288  		 * Failed to truncate the runlist, so just throw it away, it
495e90fa334828d Namjae Jeon 2026-02-13  4289  		 * will be mapped afresh on next use.
495e90fa334828d Namjae Jeon 2026-02-13  4290  		 */
495e90fa334828d Namjae Jeon 2026-02-13  4291  		kvfree(ni->runlist.rl);
495e90fa334828d Namjae Jeon 2026-02-13  4292  		ni->runlist.rl = NULL;
495e90fa334828d Namjae Jeon 2026-02-13  4293  		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
495e90fa334828d Namjae Jeon 2026-02-13  4294  	} else {
495e90fa334828d Namjae Jeon 2026-02-13  4295  		/* Prepare to mapping pairs update. */
495e90fa334828d Namjae Jeon 2026-02-13  4296  		ni->allocated_size = org_alloc_size;
495e90fa334828d Namjae Jeon 2026-02-13  4297  		/* Restore mapping pairs. */
495e90fa334828d Namjae Jeon 2026-02-13  4298  		if (need_lock)
495e90fa334828d Namjae Jeon 2026-02-13  4299  			down_read(&ni->runlist.lock);
495e90fa334828d Namjae Jeon 2026-02-13  4300  		if (ntfs_attr_update_mapping_pairs(ni, 0))
495e90fa334828d Namjae Jeon 2026-02-13  4301  			ntfs_error(sb, "Failed to restore old mapping pairs");
495e90fa334828d Namjae Jeon 2026-02-13  4302  		if (need_lock)
495e90fa334828d Namjae Jeon 2026-02-13  4303  			up_read(&ni->runlist.lock);
495e90fa334828d Namjae Jeon 2026-02-13  4304  
495e90fa334828d Namjae Jeon 2026-02-13  4305  		if (NInoSparse(ni) || NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon 2026-02-13  4306  			ni->itype.compressed.size =  org_compressed_size;
495e90fa334828d Namjae Jeon 2026-02-13  4307  			VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
495e90fa334828d Namjae Jeon 2026-02-13  4308  		} else
495e90fa334828d Namjae Jeon 2026-02-13  4309  			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
495e90fa334828d Namjae Jeon 2026-02-13  4310  	}
495e90fa334828d Namjae Jeon 2026-02-13  4311  	if (ctx)
495e90fa334828d Namjae Jeon 2026-02-13  4312  		ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  4313  	return err;
495e90fa334828d Namjae Jeon 2026-02-13  4314  put_err_out:
495e90fa334828d Namjae Jeon 2026-02-13  4315  	if (ctx)
495e90fa334828d Namjae Jeon 2026-02-13  4316  		ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon 2026-02-13  4317  	return err;
495e90fa334828d Namjae Jeon 2026-02-13  4318  }
495e90fa334828d Namjae Jeon 2026-02-13  4319  

:::::: The code at line 4227 was first introduced by commit
:::::: 495e90fa334828d4119061e2726af51d0a0fb4ed ntfs: update attrib operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
