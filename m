Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35C332EC8
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559504; cv=none; b=tPukeWuzr/A/PQmqkDM6Kf/0DIRmtu5Ac1zHR5WOekLsv32xL3ZEyBO2dmflmxDYyPKyh3/vyW1X8oxunZEFKaHJaVOA4srjXMsQVDq/Hg8ZC1qBOcihHRE2yA4yDLhT4V0G1wJ3sg8psal+Ict7ZNgtvER8tVolpG38UDYUzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559504; c=relaxed/simple;
	bh=FV+N87suUUs+iLHlfFjEEsfrN2RzK6MoF3lJkQQJeYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5hTXFIjrGYRC9MfwCxo48MvVZXW3Ru3vDXI6QWAK4mlnBHkkVuc3eAefiKdz+/Imk5jwjI5peQO52UqVmkqPdlRVGK1vXeLSeDuVSm6tnlPxWqaxX4gimN0NaKALoifz7SYxRSMsrB8cltIDQmiFFKvYqC4+HZc9+fgSRSkfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru3ZspAp; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru3ZspAp"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91563382bcfso54662785a.0
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jun 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559502; x=1781164302; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMjb4giZH4nYOsBgqkE4+V82FGKxrHLIUiOWlEV+G84=;
        b=Ru3ZspApIZ7oBDMc3ATRon1ThdicEw81ICcgdim/NtHTUlbKTBYQMHtnEI7i21T2j0
         HDe2B7FZUdwlfzuQIHCn6maaSdJkJkyedgUnrJsca8DTDzabdj0Puh4Ztnwj3yE/zhed
         92dc0yJXMV3je13cB7iBPu2FpG6VFOfaE1N0/9YE10cUMx6aVu4N806438OCdh7kVBpp
         WcIZh0tDbo6mg4hLe4VfUJSoxyHwRx+sPGUbYXJjyoJywPgOoxge9VASYIZ6s+TDz25R
         MvP0Bn6XGjjkmTgmTfIWhRqXEbrUe7YYrRVE8kKb+ucA6Wq4OxvntUNBVvHBWSB9/F+W
         CIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559502; x=1781164302;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMjb4giZH4nYOsBgqkE4+V82FGKxrHLIUiOWlEV+G84=;
        b=TeD3U3m9luBf4bQsQdVlTu45OiJ0cNFZvGc2YpNL6xZCJsW49ID35eUpYOy0R2Hiu0
         3Uk9RZFE84EdYLKnWPTKkOgvSAOOWPvjaNaA+a7K/gE4/kzr4ppuwrvaNohFfmMUK8qi
         5+cBiGhHB2zsFtyApsscEqf4eQoFlCuGr9SmhPmv1Kg3giV8qsT8nD+pxzQ9OCTNIEmN
         3HMovySNcobqbxXtbBSrcRiik2Vgc9Y7BMSmyaVw0EWX/0wYIjVaY3sFH1wn2Amc2KN6
         oEH2u3l5HKpolYDOso7yRsioPDGwkePTwv78YXiWolCR5A/ACf8eaLeKyofIkntcDqE4
         D6zg==
X-Gm-Message-State: AOJu0YzQPPeMgZIgfb9YWRkydBG85j3Krv9HOecb1U3tnW9PQVdnnTc0
	CkCK3Nmt1A71ZzdVBV0+1qdxoR+JDhaEvoiM0L+sKSCLLGdUP57ngPw2yMwmpXpU
X-Gm-Gg: Acq92OEaQHSUpuXa+BMCd8lQgl+YC9Xzd6u6a1c38kGBy4DOV0i5qZj9a8OSjf737e3
	GjrRKyQx4O1KmqpXXsoN2156cuC/BtWS1y3RPeBZs0I9ZV0sYSHJEmGL0GzdML88CADHucsGEct
	odigGy1XUoTh+xORdXNw/3U6T5RkZW05F2JqHiKKBZl8hgsMwixZumvug51W0dW8CcyyCyqeY4Q
	KxEedySXXAaEE1fzJz9p51RUmYpNswPbFW5DUma1L8q/DqJcsXxItRmEqXy2iTFkoGMAl6djWaE
	ieiEyq/BafhnDEDHaJiGTumpnVH7IVvfpau886J+nwopmMsd2LqRNxLqRL32ZYrrULRhV7yzv6W
	zVkAr4GoqVefsF84otalnM73SoefONCU5U/gM/OtEr/3YmTt4pjbckVWcZtexDqxGi3zLmcyPkA
	MQQCyuKG94L5zFdTKKooXevRHGgFw=
X-Received: by 2002:a05:620a:1722:b0:912:1206:ddd1 with SMTP id af79cd13be357-9158a656cbcmr1068462185a.1.1780559502030;
        Thu, 04 Jun 2026 00:51:42 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a243f24sm524092285a.20.2026.06.04.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:51:41 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:51:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Mark Harmstone <mark@harmstone.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Subject: [kdave:for-7.0-rc6 63/199] fs/btrfs/relocation.c:5080
 do_remap_reloc_trans() warn: variable dereferenced before check 'dest_bg'
 (see line 5014)
Message-ID: <202606041517.HaryVyGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260604075136.WPxa_v0YDXCJBqj2IVHmPtVf2u-kJqt9F4ZOvffiqCs@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-7.0-rc6
head:   316fb1b3169efb081d2db910cbbfef445afa03b9
commit: fd6594b1446cc753450bad8d0da6288da1ad7b96 [63/199] btrfs: replace identity remaps with actual remaps when doing relocations
config: sparc-randconfig-r073-20260604 (https://download.01.org/0day-ci/archive/20260604/202606041517.HaryVyGy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606041517.HaryVyGy-lkp@intel.com/

smatch warnings:
fs/btrfs/relocation.c:5080 do_remap_reloc_trans() warn: variable dereferenced before check 'dest_bg' (see line 5014)

vim +/dest_bg +5080 fs/btrfs/relocation.c

fd6594b1446cc7 Mark Harmstone 2026-01-07  4931  static int do_remap_reloc_trans(struct btrfs_fs_info *fs_info,
fd6594b1446cc7 Mark Harmstone 2026-01-07  4932  				struct btrfs_block_group *src_bg,
fd6594b1446cc7 Mark Harmstone 2026-01-07  4933  				struct btrfs_path *path, u64 *last_start)
fd6594b1446cc7 Mark Harmstone 2026-01-07  4934  {
fd6594b1446cc7 Mark Harmstone 2026-01-07  4935  	struct btrfs_trans_handle *trans;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4936  	struct btrfs_root *extent_root;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4937  	struct btrfs_key ins;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4938  	struct btrfs_block_group *dest_bg = NULL;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4939  	u64 start = 0, remap_length = 0;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4940  	u64 length, new_addr, min_size;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4941  	int ret;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4942  	const bool is_data = (src_bg->flags & BTRFS_BLOCK_GROUP_DATA);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4943  	bool no_more = false;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4944  	bool made_reservation = false, bg_needs_free_space;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4945  	struct btrfs_space_info *sinfo = src_bg->space_info;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4946  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4947  	extent_root = btrfs_extent_root(fs_info, src_bg->start);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4948  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4949  	trans = btrfs_start_transaction(extent_root, 0);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4950  	if (IS_ERR(trans))
fd6594b1446cc7 Mark Harmstone 2026-01-07  4951  		return PTR_ERR(trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4952  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4953  	mutex_lock(&fs_info->remap_mutex);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4954  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4955  	ret = find_next_identity_remap(trans, path, src_bg->start + src_bg->length,
fd6594b1446cc7 Mark Harmstone 2026-01-07  4956  				       *last_start, &start, &remap_length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4957  	if (ret == -ENOENT) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  4958  		no_more = true;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4959  		goto next;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4960  	} else if (ret) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  4961  		mutex_unlock(&fs_info->remap_mutex);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4962  		btrfs_end_transaction(trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4963  		return ret;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4964  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  4965  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4966  	/* Try to reserve enough space for block. */
fd6594b1446cc7 Mark Harmstone 2026-01-07  4967  	spin_lock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4968  	btrfs_space_info_update_bytes_may_use(sinfo, remap_length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4969  	spin_unlock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4970  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4971  	if (is_data)
fd6594b1446cc7 Mark Harmstone 2026-01-07  4972  		min_size = fs_info->sectorsize;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4973  	else
fd6594b1446cc7 Mark Harmstone 2026-01-07  4974  		min_size = fs_info->nodesize;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4975  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4976  	/*
fd6594b1446cc7 Mark Harmstone 2026-01-07  4977  	 * We're using btrfs_reserve_extent() to allocate a contiguous
fd6594b1446cc7 Mark Harmstone 2026-01-07  4978  	 * logical address range, but this will become a remap item rather than
fd6594b1446cc7 Mark Harmstone 2026-01-07  4979  	 * an extent in the extent tree.
fd6594b1446cc7 Mark Harmstone 2026-01-07  4980  	 *
fd6594b1446cc7 Mark Harmstone 2026-01-07  4981  	 * Short allocations are fine: it means that we chop off the beginning
fd6594b1446cc7 Mark Harmstone 2026-01-07  4982  	 * of the identity remap that we're processing, and will tackle the
fd6594b1446cc7 Mark Harmstone 2026-01-07  4983  	 * rest of it the next time round.
fd6594b1446cc7 Mark Harmstone 2026-01-07  4984  	 */
fd6594b1446cc7 Mark Harmstone 2026-01-07  4985  	ret = btrfs_reserve_extent(fs_info->fs_root, remap_length, remap_length,
fd6594b1446cc7 Mark Harmstone 2026-01-07  4986  				   min_size, 0, 0, &ins, is_data, false);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4987  	if (ret) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  4988  		spin_lock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4989  		btrfs_space_info_update_bytes_may_use(sinfo, -remap_length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4990  		spin_unlock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4991  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4992  		mutex_unlock(&fs_info->remap_mutex);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4993  		btrfs_end_transaction(trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  4994  		return ret;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4995  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  4996  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4997  	made_reservation = true;
fd6594b1446cc7 Mark Harmstone 2026-01-07  4998  
fd6594b1446cc7 Mark Harmstone 2026-01-07  4999  	new_addr = ins.objectid;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5000  	length = ins.offset;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5001  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5002  	if (!is_data && !IS_ALIGNED(length, fs_info->nodesize)) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  5003  		u64 new_length = ALIGN_DOWN(length, fs_info->nodesize);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5004  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5005  		btrfs_free_reserved_extent(fs_info, new_addr + new_length,
fd6594b1446cc7 Mark Harmstone 2026-01-07  5006  					   length - new_length, 0);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5007  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5008  		length = new_length;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5009  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  5010  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5011  	dest_bg = btrfs_lookup_block_group(fs_info, new_addr);

Do we not need to check for NULL returns from btrfs_lookup_block_group()?

fd6594b1446cc7 Mark Harmstone 2026-01-07  5012  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5013  	mutex_lock(&dest_bg->free_space_lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07 @5014  	bg_needs_free_space = test_bit(BLOCK_GROUP_FLAG_NEEDS_FREE_SPACE,
fd6594b1446cc7 Mark Harmstone 2026-01-07  5015  				       &dest_bg->runtime_flags);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5016  	mutex_unlock(&dest_bg->free_space_lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5017  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5018  	if (bg_needs_free_space) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  5019  		ret = btrfs_add_block_group_free_space(trans, dest_bg);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5020  		if (ret)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5021  			goto fail;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5022  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  5023  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5024  	ret = copy_remapped_data(fs_info, start, new_addr, length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5025  	if (ret)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5026  		goto fail;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5027  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5028  	ret = btrfs_remove_from_free_space_tree(trans, new_addr, length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5029  	if (ret)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5030  		goto fail;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5031  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5032  	ret = add_remap_entry(trans, path, src_bg, start, new_addr, length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5033  	if (ret) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  5034  		btrfs_add_to_free_space_tree(trans, new_addr, length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5035  		goto fail;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5036  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  5037  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5038  	adjust_block_group_remap_bytes(trans, dest_bg, length);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5039  	btrfs_free_reserved_bytes(dest_bg, length, 0);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5040  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5041  	spin_lock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5042  	sinfo->bytes_readonly += length;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5043  	spin_unlock(&sinfo->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5044  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5045  next:
fd6594b1446cc7 Mark Harmstone 2026-01-07  5046  	if (dest_bg)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5047  		btrfs_put_block_group(dest_bg);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5048  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5049  	if (made_reservation)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5050  		btrfs_dec_block_group_reservations(fs_info, new_addr);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5051  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5052  	mutex_unlock(&fs_info->remap_mutex);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5053  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5054  	if (src_bg->identity_remap_count == 0) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  5055  		bool mark_fully_remapped = false;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5056  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5057  		spin_lock(&src_bg->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5058  		if (!test_bit(BLOCK_GROUP_FLAG_FULLY_REMAPPED, &src_bg->runtime_flags)) {
fd6594b1446cc7 Mark Harmstone 2026-01-07  5059  			mark_fully_remapped = true;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5060  			set_bit(BLOCK_GROUP_FLAG_FULLY_REMAPPED, &src_bg->runtime_flags);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5061  		}
fd6594b1446cc7 Mark Harmstone 2026-01-07  5062  		spin_unlock(&src_bg->lock);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5063  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5064  		if (mark_fully_remapped)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5065  			btrfs_mark_bg_fully_remapped(src_bg, trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5066  	}
fd6594b1446cc7 Mark Harmstone 2026-01-07  5067  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5068  	ret = btrfs_end_transaction(trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5069  	if (ret)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5070  		return ret;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5071  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5072  	if (no_more)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5073  		return 1;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5074  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5075  	*last_start = start;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5076  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5077  	return 0;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5078  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5079  fail:
fd6594b1446cc7 Mark Harmstone 2026-01-07 @5080  	if (dest_bg)
fd6594b1446cc7 Mark Harmstone 2026-01-07  5081  		btrfs_put_block_group(dest_bg);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5082  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5083  	btrfs_free_reserved_extent(fs_info, new_addr, length, 0);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5084  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5085  	mutex_unlock(&fs_info->remap_mutex);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5086  	btrfs_end_transaction(trans);
fd6594b1446cc7 Mark Harmstone 2026-01-07  5087  
fd6594b1446cc7 Mark Harmstone 2026-01-07  5088  	return ret;
fd6594b1446cc7 Mark Harmstone 2026-01-07  5089  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

