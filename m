Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2564314B89
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604372; cv=none; b=a0ey4jAJppQx5ycGFk6Jk2gdHo3UvMtRRq3MUgapYCMomjmszD9TbiG8WZwe/cd2Rj9OpmuS0zeL/TXVayWuMA2BimGUH7NhlCJ1JOEcOUCVxVmFKGLBHioaK1HowOHZ3Axi/cOpks3kHNQifxciGrOus05nhz9xIEpf7DEmZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604372; c=relaxed/simple;
	bh=3UCFT90Q0oh9/Dl+6NqNoE11AibDccbM5HK8mLk/12w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEez/CnJux6haXBQAG+F2w1KVpoPdUxLzqikRy+N5pEGqewt/nXwSI1aC/BYCbp+9uHAu0pSc+gdpggvKqE0et2wTGzqntPMmy3HSQtWKB61zkvPoTJJA1qf/qMoEc5AwxuKSQVkuqQYcRXRFzrPWAEXRfHvhxiSRccwRI7MWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fI5EflhH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI5EflhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768604370; x=1800140370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UCFT90Q0oh9/Dl+6NqNoE11AibDccbM5HK8mLk/12w=;
  b=fI5EflhHHCpZh8RKa+LUG5jETLP8TLdEAHN29h25vwVuRDySNqD9RWA5
   YZdFRvoBV3OLCe1UPG5Z86Djp0rucYu/b4cQXndlAp/dEEFXkxhkEqo9z
   v40ZINxycdvOyHidQzZNfyDEasEQWJw+ffevJKRVaKdDSXLFsQ5KtVJ8W
   8/C4r9/J1T+GIBSIyOpHJtJMnjPTcSWX+bX+Op38oe8EfX4wKTm4eb+C+
   jhcB3JdrmtUhJZSw4tUqzIihG5j91Cl6GMBVZLGWZxHAEH4lVoRn6qHZo
   oYuPvRVQCgLv3+8LAAsWPuvLTWTEu+qZg0pGYC6WXEmOz22kDiKYODMav
   A==;
X-CSE-ConnectionGUID: nSVJ9A76TeinBRQ+M99HHQ==
X-CSE-MsgGUID: Yu6VZOWQR1GIc2oSnvpf0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80561549"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80561549"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:59:27 -0800
X-CSE-ConnectionGUID: O2n7fDh7SWmlbRJGcqzS4w==
X-CSE-MsgGUID: FvJtSHcaRU28VqsnAIEN8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205157455"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2026 14:59:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsmo-00000000LKA-2cSv;
	Fri, 16 Jan 2026 22:59:22 +0000
Date: Sat, 17 Jan 2026 06:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana@suse.com>
References: <f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana@suse.com>
TO: fdmanana@kernel.org
TO: linux-btrfs@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-use-the-btrfs_block_group_end-helper-everywhere/20260116-183655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana%40suse.com
patch subject: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: alpha-randconfig-r072-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170636.WsePMV5H-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601170636.WsePMV5H-lkp@intel.com/

New smatch warnings:
fs/btrfs/free-space-cache.c:1207 write_pinned_extent_entries() warn: variable dereferenced before check 'block_group' (see line 1203)

Old smatch warnings:
fs/btrfs/free-space-cache.c:2393 insert_into_bitmap() warn: variable dereferenced before check 'info' (see line 2324)

vim +/block_group +1207 fs/btrfs/free-space-cache.c

d4452bc526c431 Chris Mason     2014-05-19  1195  
6701bdb39ceb48 David Sterba    2019-03-20  1196  static noinline_for_stack int write_pinned_extent_entries(
6b45f64172e130 Nikolay Borisov 2020-01-20  1197  			    struct btrfs_trans_handle *trans,
32da5386d9a4fd David Sterba    2019-10-29  1198  			    struct btrfs_block_group *block_group,
4c6d1d85ad89fd Chris Mason     2015-04-06  1199  			    struct btrfs_io_ctl *io_ctl,
d4452bc526c431 Chris Mason     2014-05-19  1200  			    int *entries)
d4452bc526c431 Chris Mason     2014-05-19  1201  {
d4452bc526c431 Chris Mason     2014-05-19  1202  	u64 start, extent_start, extent_end, len;
7fc5a6968403c7 Filipe Manana   2026-01-16 @1203  	const u64 block_group_end = btrfs_block_group_end(block_group);
d4452bc526c431 Chris Mason     2014-05-19  1204  	struct extent_io_tree *unpin = NULL;
d4452bc526c431 Chris Mason     2014-05-19  1205  	int ret;
43be21462d8c26 Josef Bacik     2011-04-01  1206  
5349d6c3ffead2 Miao Xie        2014-06-19 @1207  	if (!block_group)
5349d6c3ffead2 Miao Xie        2014-06-19  1208  		return 0;
5349d6c3ffead2 Miao Xie        2014-06-19  1209  
43be21462d8c26 Josef Bacik     2011-04-01  1210  	/*
43be21462d8c26 Josef Bacik     2011-04-01  1211  	 * We want to add any pinned extents to our free space cache
43be21462d8c26 Josef Bacik     2011-04-01  1212  	 * so we don't leak the space
d4452bc526c431 Chris Mason     2014-05-19  1213  	 *
db804f23a72bad Li Zefan        2012-01-10  1214  	 * We shouldn't have switched the pinned extents yet so this is the
db804f23a72bad Li Zefan        2012-01-10  1215  	 * right one
db804f23a72bad Li Zefan        2012-01-10  1216  	 */
fe119a6eeb6705 Nikolay Borisov 2020-01-20  1217  	unpin = &trans->transaction->pinned_extents;
db804f23a72bad Li Zefan        2012-01-10  1218  
b3470b5dbe1300 David Sterba    2019-10-23  1219  	start = block_group->start;
db804f23a72bad Li Zefan        2012-01-10  1220  
7fc5a6968403c7 Filipe Manana   2026-01-16  1221  	while (start < block_group_end) {
66da9c1bed9755 Filipe Manana   2025-04-03  1222  		if (!btrfs_find_first_extent_bit(unpin, start,
db804f23a72bad Li Zefan        2012-01-10  1223  						 &extent_start, &extent_end,
e5860f8207ed34 Filipe Manana   2023-06-30  1224  						 EXTENT_DIRTY, NULL))
5349d6c3ffead2 Miao Xie        2014-06-19  1225  			return 0;
43be21462d8c26 Josef Bacik     2011-04-01  1226  
43be21462d8c26 Josef Bacik     2011-04-01  1227  		/* This pinned extent is out of our range */
7fc5a6968403c7 Filipe Manana   2026-01-16  1228  		if (extent_start >= block_group_end)
5349d6c3ffead2 Miao Xie        2014-06-19  1229  			return 0;
43be21462d8c26 Josef Bacik     2011-04-01  1230  
db804f23a72bad Li Zefan        2012-01-10  1231  		extent_start = max(extent_start, start);
7fc5a6968403c7 Filipe Manana   2026-01-16  1232  		extent_end = min(block_group_end, extent_end + 1);
db804f23a72bad Li Zefan        2012-01-10  1233  		len = extent_end - extent_start;
43be21462d8c26 Josef Bacik     2011-04-01  1234  
d4452bc526c431 Chris Mason     2014-05-19  1235  		*entries += 1;
d4452bc526c431 Chris Mason     2014-05-19  1236  		ret = io_ctl_add_entry(io_ctl, extent_start, len, NULL);
a67509c30079f4 Josef Bacik     2011-10-05  1237  		if (ret)
5349d6c3ffead2 Miao Xie        2014-06-19  1238  			return -ENOSPC;
43be21462d8c26 Josef Bacik     2011-04-01  1239  
db804f23a72bad Li Zefan        2012-01-10  1240  		start = extent_end;
2f356126c589d5 Josef Bacik     2011-06-10  1241  	}
2f356126c589d5 Josef Bacik     2011-06-10  1242  
5349d6c3ffead2 Miao Xie        2014-06-19  1243  	return 0;
5349d6c3ffead2 Miao Xie        2014-06-19  1244  }
5349d6c3ffead2 Miao Xie        2014-06-19  1245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
