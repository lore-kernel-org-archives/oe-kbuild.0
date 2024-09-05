Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D6C13D;
	Thu,  5 Sep 2024 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725499843; cv=none; b=PXf6ZdWZ4y9jy9YqYYhckRU3FXRsz5Asyum1hBTMZNgdfmKGrL6uWtllEHGydZ16DzodWxPGNAKcSNA/enDLOjrVK36719o4oFwj3ZLy4OGdPwTufJS0nuqmHBaJoEt46MlFTi3Z061o9a5FJYmoiBWyfM9ByO9b2ZPJJ3X7/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725499843; c=relaxed/simple;
	bh=vdH827GExo+/8gFunl3W5hr33UzB/PVnFjxuY+ZGU7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mbtx7tGzBpmMAwLx1EM5QPfb7r62BKby5HNBioz8Mp+gvE9OuEZqawL7F9B/Ai1OCOkjpIvUSZi8MMGZelD+b6u4ZAuMxmGEjKjO78blZf/kuL2ywZqGF6KV3HlT67IeqECCtk5ikeMb1gxyO+1xBnpjMyIHr7FdqT6tN9zlcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wzhcn1NKCz2DbjD;
	Thu,  5 Sep 2024 09:30:17 +0800 (CST)
Received: from dggpeml100021.china.huawei.com (unknown [7.185.36.148])
	by mail.maildlp.com (Postfix) with ESMTPS id 53467180042;
	Thu,  5 Sep 2024 09:30:38 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.174) by dggpeml100021.china.huawei.com
 (7.185.36.148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 5 Sep
 2024 09:30:37 +0800
Message-ID: <c2711f3d-6bee-414c-952f-5c33da315a1a@huawei.com>
Date: Thu, 5 Sep 2024 09:30:37 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
To: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Jan Kara <jack@suse.cz>,
	<oe-kbuild@lists.linux.dev>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, Yang
 Erkun <yangerkun@huawei.com>
References: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
Content-Language: en-US
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100021.china.huawei.com (7.185.36.148)

On 2024/9/5 1:39, Dan Carpenter wrote:
> Hi Baokun,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
> commit: 92bbb922166cd7a829bf60d168372ffa1c54e81d [8348/9291] ext4: make some fast commit functions reuse extents path
> config: x86_64-randconfig-161-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050044.EGobujzB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409050044.EGobujzB-lkp@intel.com/

Thanks for the report!

We've identified this issue before, and this is a regression introduced
by Ted when resolving patch conflicts.
For more details, please see:
https://lore.kernel.org/all/7480a81b-4b95-45cc-bf4e-da34ff148790@huawei.com/

Now Ted has fixed this problem in his branch:
https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/commit/?h=dev&id=2352e3e461926b59f01c1e39fbb0494891cff997

Ted, could you please help push the corrected commit to the next branch?

Thanks,
Baokun
> smatch warnings:
> fs/ext4/extents.c:6155 ext4_ext_clear_bb() error: double free of 'path'
>
> vim +/path +6155 fs/ext4/extents.c
>
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6108  int ext4_ext_clear_bb(struct inode *inode)
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6109  {
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6110  	struct ext4_ext_path *path = NULL;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6111  	struct ext4_extent *ex;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6112  	ext4_lblk_t cur = 0, end;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6113  	int j, ret = 0;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6114  	struct ext4_map_blocks map;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6115
> 1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6116  	if (ext4_test_inode_flag(inode, EXT4_INODE_INLINE_DATA))
> 1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6117  		return 0;
> 1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6118
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6119  	/* Determin the size of the file first */
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6120  	path = ext4_find_extent(inode, EXT_MAX_BLOCKS - 1, NULL,
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6121  					EXT4_EX_NOCACHE);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6122  	if (IS_ERR(path))
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6123  		return PTR_ERR(path);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6124  	ex = path[path->p_depth].p_ext;
> 92bbb922166cd7 Baokun Li          2024-08-22  6125  	if (!ex)
> 92bbb922166cd7 Baokun Li          2024-08-22  6126  		goto out;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6127  	end = le32_to_cpu(ex->ee_block) + ext4_ext_get_actual_len(ex);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6128
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6129  	cur = 0;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6130  	while (cur < end) {
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6131  		map.m_lblk = cur;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6132  		map.m_len = end - cur;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6133  		ret = ext4_map_blocks(NULL, inode, &map, 0);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6134  		if (ret < 0)
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6135  			break;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6136  		if (ret > 0) {
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6137  			path = ext4_find_extent(inode, map.m_lblk, NULL, 0);
> b2e662cb86ca9f Li Zetao           2024-08-20  6138  			if (!IS_ERR(path)) {
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6139  				for (j = 0; j < path->p_depth; j++) {
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6140  					ext4_mb_mark_bb(inode->i_sb,
> d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6141  							path[j].p_block, 1, false);
> 599ea31d13617c Xin Yin            2022-01-10  6142  					ext4_fc_record_regions(inode->i_sb, inode->i_ino,
> 599ea31d13617c Xin Yin            2022-01-10  6143  							0, path[j].p_block, 1, 1);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6144  				}
> 7ff5fddaddf2cc Ye Bin             2022-09-24  6145  				ext4_free_ext_path(path);
>                                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^
> Freed
>
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6146  			}
> d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6147  			ext4_mb_mark_bb(inode->i_sb, map.m_pblk, map.m_len, false);
> 599ea31d13617c Xin Yin            2022-01-10  6148  			ext4_fc_record_regions(inode->i_sb, inode->i_ino,
> 599ea31d13617c Xin Yin            2022-01-10  6149  					map.m_lblk, map.m_pblk, map.m_len, 1);
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6150  		}
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6151  		cur = cur + map.m_len;
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6152  	}
> 8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6153
> 92bbb922166cd7 Baokun Li          2024-08-22  6154  out:
> 92bbb922166cd7 Baokun Li          2024-08-22 @6155  	ext4_free_ext_path(path);
>                                                          ^^^^^^^^^^^^^^^^^^^^^^^^
> Double free
>
>
-- 
With Best Regards,
Baokun Li

