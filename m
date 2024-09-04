Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9B1E0B70
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725471578; cv=none; b=UiaA0BkV+JSLm/WT+KNq7DWBb+hhrdWnOY4KrYikoKSsZFCxmHPNxTl0uwnfgPbwnCQYJUUBuV7hzzLYd3sMncRtK0PRxZOzLbAkyaxPu27Qz7TTqZAZQ+3zT1rX7BN3zMC+8J9fNHS68MErVcb84M1qd0OHWI6a4/CCkuAGLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725471578; c=relaxed/simple;
	bh=MN4zFPdgpZ+HXlLRG/9oBCwOqeGe13OMMnivn7krIpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYUoPjONF8oSvmMFxf8+GtKqcZ0JwQc11YCl94hXLrk5t+/vhwixP8R1T6c7I8Ucuc4Ksh9fNCypWWunEGa6mtjCAMOsdltvLqJLuxiDgVLOmS2uMZvBvGYsFrU1pjIrlAbaUbJTP6sbdQWusnWMqXojGckOeg5bO4vVV+LR368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbCsuxfz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbCsuxfz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so48504095e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Sep 2024 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725471575; x=1726076375; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CATkMIz4II/GBnal0jBOxPFSbThdRSagEuNLcNi0eZs=;
        b=cbCsuxfzdlxsBjRGAlzkWTHh7Ipk3gYEpDRvoX0VXufUYwJyWrs6QKrs/CZzojhvfD
         tfabchDGfUGVjDz2YXTqHv8z0NAVkp75bTxnMGvNC91iO80ZdxgpRgd3secNhNvNgc2D
         /fNk4pSGzjb+C962j1teQJ3Qbq7vzauaThw0M4jwwD9yXUaVZ35i9zn653mKJfKdAQ3v
         ZMK/XEUuuJ5p+FvvliuHQ/rF/HSZ3Vz8U/jAaR3BCul/i6nHkEVvCld5TEhPYN77pXun
         hFSURehIlQbBi6G8fX/SAqS4jTi6e4zX3gxScqebcPyf/pf6gH3FBJ/psZ8RCSt8iUDL
         TK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725471575; x=1726076375;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CATkMIz4II/GBnal0jBOxPFSbThdRSagEuNLcNi0eZs=;
        b=ZW1oP5V0wifk1HqqyB2pulymq6YbVu9l7vubcjQsX0uBHqzkpFK8AaRR9wvzpLklTf
         BINDOFHYC5l2G/bTvdAFjFbSofrrVBrIiIWrJYZBG/Eu4mEV4M12cp3sFa+bUPslEzAd
         GwrjFggj8gZaWKna7OzctQBHHlJEDdqOpUPyB/xeB7qPZn7BBmmIJLo/Jilq2S9UaabP
         3VHbPxsLjPYcCj+CGc3tksvV7ZPGnV8CNdLWJv3PyysSK+GMQLqV+M1Ql6hHZa8lQlfH
         7l1kAphkDptsxCd70YtY0EUrvxHEChlngCvR0z5s9X9/xQJ+5YnsOf4ebNnkBH4OnCsC
         +PbA==
X-Gm-Message-State: AOJu0Yz4SEcHRgTh4nH7xcidZfqxtGbIEKa3kk5vsTRNVPd4OzlUy0m9
	gRyeoDgLrd3ehjHRyQCqS02Xn7YsewFmCM86/XbKsT0nM+jU2CJ9HPXq9UMyow1/TI+wOuezl0F
	v
X-Google-Smtp-Source: AGHT+IHOxL78H5no1Yx4ZYjtpCQJ82A2LWIBT6Ntm7D3MSDicRXtr9fyM/JKF1QwdfxyURJiimBLzw==
X-Received: by 2002:adf:ce92:0:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-374bd48fda5mr7780555f8f.20.1725471574729;
        Wed, 04 Sep 2024 10:39:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641db07sm243543435e9.34.2024.09.04.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 10:39:34 -0700 (PDT)
Date: Wed, 4 Sep 2024 20:39:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Baokun Li <libaokun1@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>
Subject: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
Message-ID: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baokun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 92bbb922166cd7a829bf60d168372ffa1c54e81d [8348/9291] ext4: make some fast commit functions reuse extents path
config: x86_64-randconfig-161-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050044.EGobujzB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409050044.EGobujzB-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:6155 ext4_ext_clear_bb() error: double free of 'path'

vim +/path +6155 fs/ext4/extents.c

8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6108  int ext4_ext_clear_bb(struct inode *inode)
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6109  {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6110  	struct ext4_ext_path *path = NULL;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6111  	struct ext4_extent *ex;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6112  	ext4_lblk_t cur = 0, end;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6113  	int j, ret = 0;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6114  	struct ext4_map_blocks map;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6115  
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6116  	if (ext4_test_inode_flag(inode, EXT4_INODE_INLINE_DATA))
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6117  		return 0;
1ebf21784b19d5 Harshad Shirwadkar 2021-10-15  6118  
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6119  	/* Determin the size of the file first */
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6120  	path = ext4_find_extent(inode, EXT_MAX_BLOCKS - 1, NULL,
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6121  					EXT4_EX_NOCACHE);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6122  	if (IS_ERR(path))
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6123  		return PTR_ERR(path);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6124  	ex = path[path->p_depth].p_ext;
92bbb922166cd7 Baokun Li          2024-08-22  6125  	if (!ex)
92bbb922166cd7 Baokun Li          2024-08-22  6126  		goto out;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6127  	end = le32_to_cpu(ex->ee_block) + ext4_ext_get_actual_len(ex);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6128  
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6129  	cur = 0;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6130  	while (cur < end) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6131  		map.m_lblk = cur;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6132  		map.m_len = end - cur;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6133  		ret = ext4_map_blocks(NULL, inode, &map, 0);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6134  		if (ret < 0)
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6135  			break;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6136  		if (ret > 0) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6137  			path = ext4_find_extent(inode, map.m_lblk, NULL, 0);
b2e662cb86ca9f Li Zetao           2024-08-20  6138  			if (!IS_ERR(path)) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6139  				for (j = 0; j < path->p_depth; j++) {
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6140  					ext4_mb_mark_bb(inode->i_sb,
d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6141  							path[j].p_block, 1, false);
599ea31d13617c Xin Yin            2022-01-10  6142  					ext4_fc_record_regions(inode->i_sb, inode->i_ino,
599ea31d13617c Xin Yin            2022-01-10  6143  							0, path[j].p_block, 1, 1);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6144  				}
7ff5fddaddf2cc Ye Bin             2022-09-24  6145  				ext4_free_ext_path(path);
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^
Freed

8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6146  			}
d2f7cf40ea89b4 Kemeng Shi         2023-09-29  6147  			ext4_mb_mark_bb(inode->i_sb, map.m_pblk, map.m_len, false);
599ea31d13617c Xin Yin            2022-01-10  6148  			ext4_fc_record_regions(inode->i_sb, inode->i_ino,
599ea31d13617c Xin Yin            2022-01-10  6149  					map.m_lblk, map.m_pblk, map.m_len, 1);
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6150  		}
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6151  		cur = cur + map.m_len;
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6152  	}
8016e29f4362e2 Harshad Shirwadkar 2020-10-15  6153  
92bbb922166cd7 Baokun Li          2024-08-22  6154  out:
92bbb922166cd7 Baokun Li          2024-08-22 @6155  	ext4_free_ext_path(path);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^
Double free


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

