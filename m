Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8FC40858
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193512; cv=none; b=krT1gxhER3s4gTxyNar61y5r1XpVzYEA27zYvH8Xxo7qnomrdNMPxidFsLjItdXsIEeeTMjpfOiG4zXuXs3hx8M8mi464JQOjZtRv6rR37EovpfFGIDeiEKVZY4vPFPGOMpwnioNGEFs//bJiUZn32VUVzPXtCyPqwOYaL1OQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193512; c=relaxed/simple;
	bh=vI8S9OKjkj9oeTZxVPdUKAyL7nkI8jLVZjd+lE9WlkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JxZrqUUrk0N5L3mtF7nBM8nP9e+emHcfNb/qlLyvLr2e1tcSq8lDS4x7BcOwXkCZvZu/QSRcY7sah9ZG3Wlikdtlggff5WFWXS/56S5ljeurxLhj+Ipc1o0dpzY1Xoyzst08lhy5bwhtwZH9hF8JQ9hKDELKFwZVlfHjRW6Rwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgXgHXuF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgXgHXuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729193507; x=1760729507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vI8S9OKjkj9oeTZxVPdUKAyL7nkI8jLVZjd+lE9WlkI=;
  b=RgXgHXuFPPgvri27bkBnk3txN6y+zPrBLrISR2Om1LNUOSOMNMtSLQxR
   3tfgcoZh4RK6tZGaQ1IUhomLmnbHyWxj7BZ3pXkqSNVlLTCjDhOZkmD54
   D1sjmWK/tWBNARmxlrgKmFUgvvLliIQcJ2QHcQw5mEkqlaaM4KGug8sAI
   RZ6Jb1Bo92L30eWuQDAgg7lIQ1FhJgbm6MaJe/lG6TWBYddSE1Lvza2rj
   LDiy01JfKH5eKUHk6Vf6ExnuY3oG3ydnuuO8glX2O51I6Aw5IxqEIt4oi
   hzAE8iYPwvJ3wgfuZ4sFICjKTy4UyhaFVxFI4+QGocI3mtsAs8VxMgy7j
   w==;
X-CSE-ConnectionGUID: Bl1AFOxiS4ul0Sei23ppLQ==
X-CSE-MsgGUID: Pbs0MjhtRAyLLUU4jG4p7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28854699"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28854699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 12:31:45 -0700
X-CSE-ConnectionGUID: SbTmLHHuSzmgJaEy4mrkVA==
X-CSE-MsgGUID: wCQ4DpYNSoC3JmPnliIKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="83204465"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2024 12:31:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1WDm-000MpL-09;
	Thu, 17 Oct 2024 19:31:42 +0000
Date: Fri, 18 Oct 2024 03:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] f2fs: multidevice: add stats in debugfs
Message-ID: <202410180307.GcJVXKTl-lkp@intel.com>
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
In-Reply-To: <20241016082420.610844-1-chao@kernel.org>
References: <20241016082420.610844-1-chao@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-multidevice-add-stats-in-debugfs/20241016-162613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241016082420.610844-1-chao%40kernel.org
patch subject: [PATCH] f2fs: multidevice: add stats in debugfs
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-r073-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180307.GcJVXKTl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410180307.GcJVXKTl-lkp@intel.com/

smatch warnings:
fs/f2fs/debug.c:118 update_multidevice_stats() warn: check sign expansion for '-1'

vim +118 fs/f2fs/debug.c

902829aa0b7225 Greg Kroah-Hartman 2012-11-03   61  
fc7100ea2a52fc Hridya Valsaraju   2020-01-22   62  #ifdef CONFIG_DEBUG_FS
e0f06ffda84d64 Chao Yu            2024-10-16   63  static void update_multidevice_stats(struct f2fs_sb_info *sbi)
e0f06ffda84d64 Chao Yu            2024-10-16   64  {
e0f06ffda84d64 Chao Yu            2024-10-16   65  	struct f2fs_stat_info *si = F2FS_STAT(sbi);
e0f06ffda84d64 Chao Yu            2024-10-16   66  	struct f2fs_dev_stats *dev_stats = si->dev_stats;
e0f06ffda84d64 Chao Yu            2024-10-16   67  	int i, j;
e0f06ffda84d64 Chao Yu            2024-10-16   68  
e0f06ffda84d64 Chao Yu            2024-10-16   69  	if (!f2fs_is_multi_device(sbi))
e0f06ffda84d64 Chao Yu            2024-10-16   70  		return;
e0f06ffda84d64 Chao Yu            2024-10-16   71  
e0f06ffda84d64 Chao Yu            2024-10-16   72  	memset(dev_stats, 0, sizeof(struct f2fs_dev_stats) * sbi->s_ndevs);
e0f06ffda84d64 Chao Yu            2024-10-16   73  	for (i = 0; i < sbi->s_ndevs; i++) {
e0f06ffda84d64 Chao Yu            2024-10-16   74  		unsigned int start_segno, end_segno;
e0f06ffda84d64 Chao Yu            2024-10-16   75  		block_t start_blk, end_blk;
e0f06ffda84d64 Chao Yu            2024-10-16   76  
e0f06ffda84d64 Chao Yu            2024-10-16   77  		if (i == 0) {
e0f06ffda84d64 Chao Yu            2024-10-16   78  			start_blk = MAIN_BLKADDR(sbi);
e0f06ffda84d64 Chao Yu            2024-10-16   79  			end_blk = FDEV(i).end_blk + 1 - SEG0_BLKADDR(sbi);
e0f06ffda84d64 Chao Yu            2024-10-16   80  		} else {
e0f06ffda84d64 Chao Yu            2024-10-16   81  			start_blk = FDEV(i).start_blk;
e0f06ffda84d64 Chao Yu            2024-10-16   82  			end_blk = FDEV(i).end_blk + 1;
e0f06ffda84d64 Chao Yu            2024-10-16   83  		}
e0f06ffda84d64 Chao Yu            2024-10-16   84  
e0f06ffda84d64 Chao Yu            2024-10-16   85  		start_segno = GET_SEGNO(sbi, start_blk);
e0f06ffda84d64 Chao Yu            2024-10-16   86  		end_segno = GET_SEGNO(sbi, end_blk);
e0f06ffda84d64 Chao Yu            2024-10-16   87  
e0f06ffda84d64 Chao Yu            2024-10-16   88  		for (j = start_segno; j < end_segno; j++) {
e0f06ffda84d64 Chao Yu            2024-10-16   89  			unsigned int seg_blks, sec_blks;
e0f06ffda84d64 Chao Yu            2024-10-16   90  
e0f06ffda84d64 Chao Yu            2024-10-16   91  			seg_blks = get_seg_entry(sbi, j)->valid_blocks;
e0f06ffda84d64 Chao Yu            2024-10-16   92  
e0f06ffda84d64 Chao Yu            2024-10-16   93  			/* update segment stats */
e0f06ffda84d64 Chao Yu            2024-10-16   94  			if (IS_CURSEG(sbi, j))
e0f06ffda84d64 Chao Yu            2024-10-16   95  				dev_stats[i].devstats[0][DEVSTAT_INUSE]++;
e0f06ffda84d64 Chao Yu            2024-10-16   96  			else if (seg_blks == BLKS_PER_SEG(sbi))
e0f06ffda84d64 Chao Yu            2024-10-16   97  				dev_stats[i].devstats[0][DEVSTAT_FULL]++;
e0f06ffda84d64 Chao Yu            2024-10-16   98  			else if (seg_blks != 0)
e0f06ffda84d64 Chao Yu            2024-10-16   99  				dev_stats[i].devstats[0][DEVSTAT_DIRTY]++;
e0f06ffda84d64 Chao Yu            2024-10-16  100  			else if (!test_bit(j, FREE_I(sbi)->free_segmap))
e0f06ffda84d64 Chao Yu            2024-10-16  101  				dev_stats[i].devstats[0][DEVSTAT_FREE]++;
e0f06ffda84d64 Chao Yu            2024-10-16  102  			else
e0f06ffda84d64 Chao Yu            2024-10-16  103  				dev_stats[i].devstats[0][DEVSTAT_PREFREE]++;
e0f06ffda84d64 Chao Yu            2024-10-16  104  
e0f06ffda84d64 Chao Yu            2024-10-16  105  			if (!__is_large_section(sbi) ||
e0f06ffda84d64 Chao Yu            2024-10-16  106  				(j % SEGS_PER_SEC(sbi)) != 0)
e0f06ffda84d64 Chao Yu            2024-10-16  107  				continue;
e0f06ffda84d64 Chao Yu            2024-10-16  108  
e0f06ffda84d64 Chao Yu            2024-10-16  109  			sec_blks = get_sec_entry(sbi, j)->valid_blocks;
e0f06ffda84d64 Chao Yu            2024-10-16  110  
e0f06ffda84d64 Chao Yu            2024-10-16  111  			/* update section stats */
e0f06ffda84d64 Chao Yu            2024-10-16  112  			if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, j)))
e0f06ffda84d64 Chao Yu            2024-10-16  113  				dev_stats[i].devstats[1][DEVSTAT_INUSE]++;
e0f06ffda84d64 Chao Yu            2024-10-16  114  			else if (sec_blks == BLKS_PER_SEC(sbi))
e0f06ffda84d64 Chao Yu            2024-10-16  115  				dev_stats[i].devstats[1][DEVSTAT_FULL]++;
e0f06ffda84d64 Chao Yu            2024-10-16  116  			else if (sec_blks != 0)
e0f06ffda84d64 Chao Yu            2024-10-16  117  				dev_stats[i].devstats[1][DEVSTAT_DIRTY]++;
e0f06ffda84d64 Chao Yu            2024-10-16 @118  			else if (!test_bit(GET_SEC_FROM_SEG(sbi, j),
e0f06ffda84d64 Chao Yu            2024-10-16  119  					FREE_I(sbi)->free_secmap))
e0f06ffda84d64 Chao Yu            2024-10-16  120  				dev_stats[i].devstats[1][DEVSTAT_FREE]++;
e0f06ffda84d64 Chao Yu            2024-10-16  121  			else
e0f06ffda84d64 Chao Yu            2024-10-16  122  				dev_stats[i].devstats[1][DEVSTAT_PREFREE]++;
e0f06ffda84d64 Chao Yu            2024-10-16  123  		}
e0f06ffda84d64 Chao Yu            2024-10-16  124  	}
e0f06ffda84d64 Chao Yu            2024-10-16  125  }
e0f06ffda84d64 Chao Yu            2024-10-16  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
