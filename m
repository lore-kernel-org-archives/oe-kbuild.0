Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EC22576E
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804801; cv=none; b=NY/EmMVzKVD7O2RfPRIbxXwoZ5/NMVJr7O6Ac+wBwNsDW4kLfIgDZHz0EG+Tz1e6tlqOzFIw5RXOBjMkxvVh55X23V5kR/zN1rE8Q9TF70Y6nLJv+3YXORFE23lJQBQJ0vjlx7OETsSHnG9yccdliUYen5fLKU3Kk1JkAx3qFIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804801; c=relaxed/simple;
	bh=YE5jezai2biwr3Gnu5tpda+uRI0xIpqVr5jQ76BFhaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GAD7iwJuaMVRWtO2CYaRsqjhgnzLv/Wtp3bWKwIuWhhcCKXwYoyWrTT3KGSVBXjieQVN8FViNE0vjcFuWkIDKJrJ0Q+AuZhokFSgVdf7Ykk4kmJ4KbfG85qPsq05zyxm21BYL2k4Hfk4zaoXLu+N+n682JkMLi3syxUbuxVnvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0yvjbZN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0yvjbZN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so27687635e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 22:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804798; x=1769409598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhpuhf8aqRruGu7L/fSfGH0BgTbK0i1Gv5JjSOJHbPQ=;
        b=B0yvjbZNRbrEsjtxkJ6eKib1MdfyNMvYzh9GfoskWvgb2wd9F9EeSKsuP0XwJ9u+2S
         Gapr9RT3dV495Ilcg9ltZ2BuEt/HZAGszWX2ye3edIMzhp6/as2lUyPcDph+YJYJxZ4E
         pJ/f6rtURrpbQw5LmpyIrsDEZyrw56s5ZITzZ/0nlzUksdCymvRNMJjw5tnjYlPtZ6dm
         wV3HKJY2WTkdTCnfJxjaiEeFhNSC4KdhQBSkDyqz3u8l1LK00GCeVxNl+WqSALjcLvSE
         piH/44H8N4W6Be1B6SAKg8sAG3BUtbnDqkwl7I2JgmON5f2Z4AsdUOMJQ/4tcfkperXb
         yaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804798; x=1769409598;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhpuhf8aqRruGu7L/fSfGH0BgTbK0i1Gv5JjSOJHbPQ=;
        b=f9TOAHYDEhGt1YrrbQ2LmsL0gjaDNX3mke/od+MN0i62bBRlMKcOZ9btnz0wE2ZNMX
         D9ngbwaygf69dCp64gfhJywEXXazPfHIseHjbjbLS9gB87wTzyNQhjcouynSofTgH1rj
         j6pnK0PRqNoq6MSMWf9zxOeYREBycU/WXCLmzjI3HHyDvZEAM3X5U1R9QlHQPC91bgk5
         cVX04/PJWX5zktdndchZlTvfxrkaXfyZkIv6ptV7esIOCLCWsqRvNvOYtrf3GuO+tIe8
         1EcbxbuqXnbqpg6gKq+jSyk/3HqyaXCHiyfKdEnhErQRcT7cY/xTDp4711ajS31ReVgr
         B2Xg==
X-Gm-Message-State: AOJu0Yy3OP98hvrl6F2LU18hzU/aUD6mirufPk+Klu1sbqsdmgNrcTR/
	eB8GAaIn2QBX35ASvwkgMLUVZ4bVP1UP0SfMdIq7TGOz64VvGT7xV4wxcMuLHyaS5mhT9jGN8da
	4A7u0T7g=
X-Gm-Gg: AY/fxX4Qcp4SbumIcw4KMThEBD1ERZP7HMmA3Q+mlEjz6y06hN5vUsZ1XWkANQOulfB
	L676i/oM5rgL+GtNLZa8RfHzpz/LnLigKtpcQSPgvkO8uI4KuGb2J5Uisg7NodLjAWIU+BM+W5l
	NDwHhQ3GQ43SEDJTuC5Z+JNFzEcg4zLMV1VfSJOcxDEJqVmSVgh3yMLzpsESlvRwZEawKk7Xb07
	wxkcbSZ2C+bavw38F4k+YZ1NmYW55HbPsTKM5AmXmEqZ3U/LP/4Pz0yiD2a00oMHvrvnvVuu4fL
	I3T4+Ve3QcAnvV+vNjNs6bnTN+c7hcAwuaP+0LJwQuapNJ1GAt24VjmUh7Mv/xXjNM9S17Eresp
	/1t7VLv8kow3LPnV3yawjpO7MiarB2nV4eyZMevtKBLFT4ZG+TLmsmeAIR7fx86AyJOnmz/X3uz
	KoceLvUA+NmmPRAk8v
X-Received: by 2002:a05:600c:4f8f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-4801e33c2a5mr130322625e9.19.1768804797300;
        Sun, 18 Jan 2026 22:39:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe3ae95sm77473395e9.4.2026.01.18.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:39:56 -0800 (PST)
Date: Mon, 19 Jan 2026 09:39:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, fdmanana@kernel.org,
	linux-btrfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
Message-ID: <202601170636.WsePMV5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana@suse.com>
Message-ID: <20260119063954.y7muOEEGJCClk8HsOVfyuBr60UShM_4F8qW2Th7k7Nw@z>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-use-the-btrfs_block_group_end-helper-everywhere/20260116-183655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana%40suse.com
patch subject: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
config: alpha-randconfig-r072-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170636.WsePMV5H-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170636.WsePMV5H-lkp@intel.com/

New smatch warnings:
fs/btrfs/free-space-cache.c:1207 write_pinned_extent_entries() warn: variable dereferenced before check 'block_group' (see line 1203)

vim +/block_group +1207 fs/btrfs/free-space-cache.c

6701bdb39ceb48 David Sterba    2019-03-20  1196  static noinline_for_stack int write_pinned_extent_entries(
6b45f64172e130 Nikolay Borisov 2020-01-20  1197  			    struct btrfs_trans_handle *trans,
32da5386d9a4fd David Sterba    2019-10-29  1198  			    struct btrfs_block_group *block_group,
4c6d1d85ad89fd Chris Mason     2015-04-06  1199  			    struct btrfs_io_ctl *io_ctl,
d4452bc526c431 Chris Mason     2014-05-19  1200  			    int *entries)
d4452bc526c431 Chris Mason     2014-05-19  1201  {
d4452bc526c431 Chris Mason     2014-05-19  1202  	u64 start, extent_start, extent_end, len;
7fc5a6968403c7 Filipe Manana   2026-01-16 @1203  	const u64 block_group_end = btrfs_block_group_end(block_group);
                                                                                                          ^^^^^^^^^^^^
Dereferenced.

d4452bc526c431 Chris Mason     2014-05-19  1204  	struct extent_io_tree *unpin = NULL;
d4452bc526c431 Chris Mason     2014-05-19  1205  	int ret;
43be21462d8c26 Josef Bacik     2011-04-01  1206  
5349d6c3ffead2 Miao Xie        2014-06-19 @1207  	if (!block_group)
                                                             ^^^^^^^^^^^
Too late.

5349d6c3ffead2 Miao Xie        2014-06-19  1208  		return 0;
5349d6c3ffead2 Miao Xie        2014-06-19  1209  
43be21462d8c26 Josef Bacik     2011-04-01  1210  	/*
43be21462d8c26 Josef Bacik     2011-04-01  1211  	 * We want to add any pinned extents to our free space cache
43be21462d8c26 Josef Bacik     2011-04-01  1212  	 * so we don't leak the space

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

