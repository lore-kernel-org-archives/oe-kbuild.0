Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F381DDA1B
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739343555; cv=none; b=rn346PBobym59kzvSLxAZdvtVUai+XQ2yBmsEZfuHe01zhWDyzf49xY/zrAPRVW4qW8bpTIyyTam+EJY5gMQ7ffLAB0uzUlAMZcOmA2C/kkJ58QpGF5CJT6ke+vmjcJ+xdyTcaxOSz0BvOk6gVEcn/DHmua6hObeyAcHOJpfe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739343555; c=relaxed/simple;
	bh=t186L27iB0nWt+q/eWnV8fzNRjfN7H1ae5X4NzSWLcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IytDHa100mzCAptABHVa9JNmlzf7Jo8RRIPnoWu2QYLoAz+4iRHBd7nBtsqIq4Yg8pLruGqaXZAEOMGlBjCcZu2SekHGx8sOsDZj7bU3CslXnHXhd93dO8HX7sSaw+nryXgq0zUWsrqWb4VtTAi/KZvtbVVj3Tt9uXs+Z8LuCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9i9ydtb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9i9ydtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739343554; x=1770879554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t186L27iB0nWt+q/eWnV8fzNRjfN7H1ae5X4NzSWLcU=;
  b=a9i9ydtb840WvWAZYdkvNN/HLY9PsTsKoG+oXRReFAp4tQXJOeEGSTY/
   wvLzCBE8FZNSi5wKu0nsisQ+fWhif+x1qrhF51G8EiVvUxirp4wsvW0Ba
   NBr6Sv+5oiDMojguVmXLq1HaChNe0sOKxdkJ/yLjI3DK9JJGgunH9zaDs
   +94StyhHQqQCVvRpMZu8omGVmyd9jEFpIV+LtLBmKSlUAF/CjYbVxtthe
   5icMTBTgkvnS8LWG937O4m4MIz+lIn0kzIAelXo2peyuO4tfP4mXNu/1S
   GQgZN3LB3IPGtn2KOld9XXA/UDiUNXlWFrmaZ7GqTUEEnbY1ALW/39U8O
   g==;
X-CSE-ConnectionGUID: 8rpUIr6XQ5ClemHUwoXf6g==
X-CSE-MsgGUID: 7y84cAyzSqacE+2S+/vk/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40107517"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="40107517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 22:59:14 -0800
X-CSE-ConnectionGUID: 4sQS/KljQZW6DIOVSazjpg==
X-CSE-MsgGUID: H/JdRNOLRNCfsG+lx5TMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="143581678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 22:59:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti6iD-0015Fz-2M;
	Wed, 12 Feb 2025 06:59:09 +0000
Date: Wed, 12 Feb 2025 14:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-freecounters 2/5] fs/xfs/xfs_super.c:1100
 xfs_init_percpu_counters() error: buffer overflow 'mp->m_free' 2 <= u32max
Message-ID: <202502121406.RZwuvkY4-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-freecounters
head:   3bbffc404041adfe745be0979943086ab448915d
commit: 401cd937aa9d718776bb7ce5379d248388c093bf [2/5] xfs: generalize the freespace and reserved blocks handling
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r073-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121406.RZwuvkY4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502121406.RZwuvkY4-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_super.c:1100 xfs_init_percpu_counters() error: buffer overflow 'mp->m_free' 2 <= u32max

vim +1100 fs/xfs/xfs_super.c

8757c38f2cf6e5 Ian Kent          2019-11-04  1065  
8757c38f2cf6e5 Ian Kent          2019-11-04  1066  static int
8757c38f2cf6e5 Ian Kent          2019-11-04  1067  xfs_init_percpu_counters(
8757c38f2cf6e5 Ian Kent          2019-11-04  1068  	struct xfs_mount	*mp)
8757c38f2cf6e5 Ian Kent          2019-11-04  1069  {
8757c38f2cf6e5 Ian Kent          2019-11-04  1070  	int			error;
401cd937aa9d71 Christoph Hellwig 2025-02-09  1071  	enum xfs_free_counter	i;
8757c38f2cf6e5 Ian Kent          2019-11-04  1072  
8757c38f2cf6e5 Ian Kent          2019-11-04  1073  	error = percpu_counter_init(&mp->m_icount, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1074  	if (error)
8757c38f2cf6e5 Ian Kent          2019-11-04  1075  		return -ENOMEM;
8757c38f2cf6e5 Ian Kent          2019-11-04  1076  
8757c38f2cf6e5 Ian Kent          2019-11-04  1077  	error = percpu_counter_init(&mp->m_ifree, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1078  	if (error)
8757c38f2cf6e5 Ian Kent          2019-11-04  1079  		goto free_icount;
8757c38f2cf6e5 Ian Kent          2019-11-04  1080  
8757c38f2cf6e5 Ian Kent          2019-11-04  1081  	error = percpu_counter_init(&mp->m_delalloc_blks, 0, GFP_KERNEL);
8757c38f2cf6e5 Ian Kent          2019-11-04  1082  	if (error)
401cd937aa9d71 Christoph Hellwig 2025-02-09  1083  		goto free_ifree;
8757c38f2cf6e5 Ian Kent          2019-11-04  1084  
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1085  	error = percpu_counter_init(&mp->m_delalloc_rtextents, 0, GFP_KERNEL);
2229276c528326 Darrick J. Wong   2022-04-12  1086  	if (error)
2229276c528326 Darrick J. Wong   2022-04-12  1087  		goto free_delalloc;
2229276c528326 Darrick J. Wong   2022-04-12  1088  
401cd937aa9d71 Christoph Hellwig 2025-02-09  1089  	for (i = 0; i < XC_FREE_NR; i++) {
401cd937aa9d71 Christoph Hellwig 2025-02-09  1090  		error = percpu_counter_init(&mp->m_free[i].count, 0,
401cd937aa9d71 Christoph Hellwig 2025-02-09  1091  				GFP_KERNEL);
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1092  		if (error)
401cd937aa9d71 Christoph Hellwig 2025-02-09  1093  			goto free_freecounters;
401cd937aa9d71 Christoph Hellwig 2025-02-09  1094  	}
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1095  
8757c38f2cf6e5 Ian Kent          2019-11-04  1096  	return 0;
8757c38f2cf6e5 Ian Kent          2019-11-04  1097  
401cd937aa9d71 Christoph Hellwig 2025-02-09  1098  free_freecounters:
401cd937aa9d71 Christoph Hellwig 2025-02-09  1099  	while (--i > 0)
401cd937aa9d71 Christoph Hellwig 2025-02-09 @1100  		percpu_counter_destroy(&mp->m_free[i].count);
7099bd0f243fa7 Christoph Hellwig 2024-04-22  1101  	percpu_counter_destroy(&mp->m_delalloc_rtextents);
2229276c528326 Darrick J. Wong   2022-04-12  1102  free_delalloc:
2229276c528326 Darrick J. Wong   2022-04-12  1103  	percpu_counter_destroy(&mp->m_delalloc_blks);
8757c38f2cf6e5 Ian Kent          2019-11-04  1104  free_ifree:
8757c38f2cf6e5 Ian Kent          2019-11-04  1105  	percpu_counter_destroy(&mp->m_ifree);
8757c38f2cf6e5 Ian Kent          2019-11-04  1106  free_icount:
8757c38f2cf6e5 Ian Kent          2019-11-04  1107  	percpu_counter_destroy(&mp->m_icount);
8757c38f2cf6e5 Ian Kent          2019-11-04  1108  	return -ENOMEM;
8757c38f2cf6e5 Ian Kent          2019-11-04  1109  }
8757c38f2cf6e5 Ian Kent          2019-11-04  1110  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
