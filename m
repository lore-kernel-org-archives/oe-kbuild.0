Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F54374174
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639271; cv=none; b=XeF7H5yV89sFydINm8FgNMaWVmOcWV0FcMswxIkE0imLKC5uG5VJFIr6iVd2Hfo5W2uREO+aOTwH8VHf5ZFujJ+qYhsrpjJVKKiABcW8cADTYGQh60aVMGKpyDbSDGqPNpiHCvJ/7JItnVBtrs7JIsbygR3Ktzbr9AlzjJIGBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639271; c=relaxed/simple;
	bh=Qeu5oh2oGSMKfG8R5FFv5pXPyWvMjM4Up7P8B+MHFyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTDPYywnYnaH/iHZVaXpRdRofUtNhX8MzV9sAP4ZrXm4YrimXbpPPWVb0TUdImxOVf5hFpcW8y6KhsZ/3esvjR64fFmZY5XSF+HhYEunIF5cY9r/rO5m5X0jJ+cuAueUGGUvUrUqoaQQDFmOFoYC8jLA9kY80Dxj3NFKUpM/FhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gx1+Njif; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gx1+Njif"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso36992875e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Feb 2026 04:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770639269; x=1771244069; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjSHuG+TJw3YDM3QUjeBL+voKHjwYsAUwUEREaHyjX8=;
        b=Gx1+Njif4s05RinpZUrzVi99G/tTbKCiXE/n0hHEVBCTo0y8TAOirdAO/IJY8mh84D
         7jvIsb0kmR1Y/UShnLQ8tRzWLSb4SJdahzPDTYgds36vdtzO5iuRGGu8lLyxKGgRRLQX
         7nAl6UHdpwsUs7acycaHZZ7ncXJeI8pKT9RvmKooML4drCepIyAc7baYCDCfqa/v7MzK
         P/9AABzhotVGXGmsP8SOIubY54Z4E58uZgdu513ESQEzQzLbwLBPlbx8v+A0L2bs32ah
         isUqRBV3edIJgRJJ88nOHNF00dPGGuwp7s22o10M8fxIQc0RRd+MAnzqLGY9cZqSc+YT
         WRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770639269; x=1771244069;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjSHuG+TJw3YDM3QUjeBL+voKHjwYsAUwUEREaHyjX8=;
        b=wi+dEhG0RJXErChQkRtUTkwY+87WIt0gTZjn9gtCI5elagiR00FmiwWHevcDvoYbP7
         hn3arr4q9GlFuRVThWe4efuwVvYKziECkfSJk+zoqqI58dBeFPuezi3jKNdkqAuCltka
         iigDViKi3IkcTyN5NTKY/FPgzBVSAjBthAfaK4bfrMfVeFc4Jkr+Q4CGVMQFy5h4YOzj
         c1rLIkXM/yWNjj12rOojdxCfch4DeFBagS2MPk5W+Jp9A/BRz4lyMUm3unVnmT8bs/ri
         5M8rxIxpvOFshIkCHK3PJKuIR4xfu/73lXmGm8y621BAHQDi3KJQMxfJSxTu7/2vsGxN
         9itA==
X-Gm-Message-State: AOJu0Yy2SrbhL/9ADwhI+hWo8UzAwVnxoAP3/t1ulBRLsagmryPZDtWq
	u6ofhMB61xyTa96y1nWwD3DgE6I5pNXjhJHENcb1I/DGbzQ0jn7ZlPRWUmJDD5AgScnWcOZ95JF
	WC+jI
X-Gm-Gg: AZuq6aJCiTNk1DY30It+6H9EbTEjG5PbxXzHVP04Pz9MCzAYrbYA3w6w23YToXYUvlM
	L/PJqk8nXS1FK5ex/w5Jr8IGOxV8OkDmGHaHmjYrBdg6AKTkGlkHnibyucalc+MJwcHtH1Pt6zK
	fc5FnfwI2Al2FZikG3NiW90OTL+TTnJ+ADfBBDEmI8xykhJNbHJWfTKDpjTCsLu4QfbGfckPv7O
	dJKgaSxoraRQyVEZO3PKyAM2DorOPIt8rrPunJS5m6Nis4jOnsGwjZIn29JqJ+eq8PQIEMa5ccK
	JCB8X7A4LsL6Gr8ljmRyFcIhhtHGiDvdZIglzAaGPsJEFgP7wx3UmnQAU/VmFIMzoJleBhdq0hW
	XU3IYsPCTmEHRlef0Bx67WQeKunCQ2CcRxSWVBNiyHZzzw9X01wC+eJYxU3P9MxZtpRw5d272qe
	KfQbNBap9V0A8T/rXc
X-Received: by 2002:a05:600c:19c7:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-483202291bemr146178905e9.32.1770639268401;
        Mon, 09 Feb 2026 04:14:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320983f18sm128998195e9.8.2026.02.09.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:14:27 -0800 (PST)
Date: Mon, 9 Feb 2026 15:14:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Filipe Manana <fdmanana@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [fdmanana:for-next 15/17] fs/btrfs/free-space-tree.c:1157
 populate_free_space_tree() warn: inconsistent returns
 '&block_group->free_space_lock'.
Message-ID: <202602091703.F4BhrHHr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260209121424.AGi57_bPHRzP81LkgPcscgFtd0QhMfuCk6fSngCDfJo@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git for-next
head:   5a96a405b78b87a71b34c2587942af29d85da506
commit: 0f57b1b3bcd514fc65690a93ec694ef732d46985 [15/17] btrfs: check for NULL root after calls to btrfs_extent_root()
config: x86_64-randconfig-161-20260209 (https://download.01.org/0day-ci/archive/20260209/202602091703.F4BhrHHr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602091703.F4BhrHHr-lkp@intel.com/

smatch warnings:
fs/btrfs/free-space-tree.c:1157 populate_free_space_tree() warn: inconsistent returns '&block_group->free_space_lock'.

vim +1157 fs/btrfs/free-space-tree.c

a5ed91828518ab0 Omar Sandoval   2015-09-29  1052  static int populate_free_space_tree(struct btrfs_trans_handle *trans,
32da5386d9a4fd5 David Sterba    2019-10-29  1053  				    struct btrfs_block_group *block_group)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1054  {
29cbcf401793f4e Josef Bacik     2021-11-05  1055  	struct btrfs_root *extent_root;
3bfd9ead8131e02 David Sterba    2025-02-24  1056  	BTRFS_PATH_AUTO_FREE(path);
3bfd9ead8131e02 David Sterba    2025-02-24  1057  	BTRFS_PATH_AUTO_FREE(path2);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1058  	struct btrfs_key key;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1059  	u64 start, end;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1060  	int ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1061  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1062  	path = btrfs_alloc_path();
a5ed91828518ab0 Omar Sandoval   2015-09-29  1063  	if (!path)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1064  		return -ENOMEM;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1065  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1066  	path2 = btrfs_alloc_path();
3bfd9ead8131e02 David Sterba    2025-02-24  1067  	if (!path2)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1068  		return -ENOMEM;
3bfd9ead8131e02 David Sterba    2025-02-24  1069  
3bfd9ead8131e02 David Sterba    2025-02-24  1070  	path->reada = READA_FORWARD;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1071  
66afee18485932a Nikolay Borisov 2018-05-10  1072  	ret = add_new_free_space_info(trans, block_group, path2);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1073  	if (ret)
3bfd9ead8131e02 David Sterba    2025-02-24  1074  		return ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1075  
511711af91f21d8 Chris Mason     2015-12-30  1076  	mutex_lock(&block_group->free_space_lock);
511711af91f21d8 Chris Mason     2015-12-30  1077  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1078  	/*
a5ed91828518ab0 Omar Sandoval   2015-09-29  1079  	 * Iterate through all of the extent and metadata items in this block
a5ed91828518ab0 Omar Sandoval   2015-09-29  1080  	 * group, adding the free space between them and the free space at the
a5ed91828518ab0 Omar Sandoval   2015-09-29  1081  	 * end. Note that EXTENT_ITEM and METADATA_ITEM are less than
a5ed91828518ab0 Omar Sandoval   2015-09-29  1082  	 * BLOCK_GROUP_ITEM, so an extent may precede the block group that it's
a5ed91828518ab0 Omar Sandoval   2015-09-29  1083  	 * contained in.
a5ed91828518ab0 Omar Sandoval   2015-09-29  1084  	 */
b3470b5dbe1300d David Sterba    2019-10-23  1085  	key.objectid = block_group->start;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1086  	key.type = BTRFS_EXTENT_ITEM_KEY;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1087  	key.offset = 0;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1088  
29cbcf401793f4e Josef Bacik     2021-11-05  1089  	extent_root = btrfs_extent_root(trans->fs_info, key.objectid);
0f57b1b3bcd514f Filipe Manana   2026-02-08  1090  	if (unlikely(!extent_root)) {
0f57b1b3bcd514f Filipe Manana   2026-02-08  1091  		btrfs_err(trans->fs_info,
0f57b1b3bcd514f Filipe Manana   2026-02-08  1092  			  "missing extent root for block group at offset %llu",
0f57b1b3bcd514f Filipe Manana   2026-02-08  1093  			  key.objectid);
0f57b1b3bcd514f Filipe Manana   2026-02-08  1094  		return -EUCLEAN;

ret =  -EUCLEAN;
goto out_locked;

0f57b1b3bcd514f Filipe Manana   2026-02-08  1095  	}
0f57b1b3bcd514f Filipe Manana   2026-02-08  1096  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1097  	ret = btrfs_search_slot_for_read(extent_root, &key, path, 1, 0);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1098  	if (ret < 0)
511711af91f21d8 Chris Mason     2015-12-30  1099  		goto out_locked;
1961d20f6fa8903 Filipe Manana   2025-06-05  1100  	/*
1961d20f6fa8903 Filipe Manana   2025-06-05  1101  	 * If ret is 1 (no key found), it means this is an empty block group,
1961d20f6fa8903 Filipe Manana   2025-06-05  1102  	 * without any extents allocated from it and there's no block group
1961d20f6fa8903 Filipe Manana   2025-06-05  1103  	 * item (key BTRFS_BLOCK_GROUP_ITEM_KEY) located in the extent tree
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1104  	 * because we are using the block group tree feature (so block group
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1105  	 * items are stored in the block group tree) or this is a new block
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1106  	 * group created in the current transaction and its block group item
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1107  	 * was not yet inserted in the extent tree (that happens in
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1108  	 * btrfs_create_pending_block_groups() -> insert_block_group_item()).
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1109  	 * It also means there are no extents allocated for block groups with a
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1110  	 * start offset beyond this block group's end offset (this is the last,
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1111  	 * highest, block group).
1961d20f6fa8903 Filipe Manana   2025-06-05  1112  	 */
b3470b5dbe1300d David Sterba    2019-10-23  1113  	start = block_group->start;
4ac81c381102beb Filipe Manana   2026-01-16  1114  	end = btrfs_block_group_end(block_group);
1961d20f6fa8903 Filipe Manana   2025-06-05  1115  	while (ret == 0) {
a5ed91828518ab0 Omar Sandoval   2015-09-29  1116  		btrfs_item_key_to_cpu(path->nodes[0], &key, path->slots[0]);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1117  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1118  		if (key.type == BTRFS_EXTENT_ITEM_KEY ||
a5ed91828518ab0 Omar Sandoval   2015-09-29  1119  		    key.type == BTRFS_METADATA_ITEM_KEY) {
a5ed91828518ab0 Omar Sandoval   2015-09-29  1120  			if (key.objectid >= end)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1121  				break;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1122  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1123  			if (start < key.objectid) {
6fc5ef7829887c5 Filipe Manana   2025-06-11  1124  				ret = __btrfs_add_to_free_space_tree(trans,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1125  								     block_group,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1126  								     path2, start,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1127  								     key.objectid -
a5ed91828518ab0 Omar Sandoval   2015-09-29  1128  								     start);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1129  				if (ret)
511711af91f21d8 Chris Mason     2015-12-30  1130  					goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1131  			}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1132  			start = key.objectid;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1133  			if (key.type == BTRFS_METADATA_ITEM_KEY)
ffa9a9ef2f08c61 Nikolay Borisov 2018-05-10  1134  				start += trans->fs_info->nodesize;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1135  			else
a5ed91828518ab0 Omar Sandoval   2015-09-29  1136  				start += key.offset;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1137  		} else if (key.type == BTRFS_BLOCK_GROUP_ITEM_KEY) {
b3470b5dbe1300d David Sterba    2019-10-23  1138  			if (key.objectid != block_group->start)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1139  				break;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1140  		}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1141  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1142  		ret = btrfs_next_item(extent_root, path);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1143  		if (ret < 0)
511711af91f21d8 Chris Mason     2015-12-30  1144  			goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1145  	}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1146  	if (start < end) {
6fc5ef7829887c5 Filipe Manana   2025-06-11  1147  		ret = __btrfs_add_to_free_space_tree(trans, block_group, path2,
2d5cffa1b0d5eca Nikolay Borisov 2018-05-10  1148  						     start, end - start);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1149  		if (ret)
511711af91f21d8 Chris Mason     2015-12-30  1150  			goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1151  	}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1152  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1153  	ret = 0;
511711af91f21d8 Chris Mason     2015-12-30  1154  out_locked:
511711af91f21d8 Chris Mason     2015-12-30  1155  	mutex_unlock(&block_group->free_space_lock);
3bfd9ead8131e02 David Sterba    2025-02-24  1156  
a5ed91828518ab0 Omar Sandoval   2015-09-29 @1157  	return ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1158  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

