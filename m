Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063B38FA3
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519069; cv=none; b=eP1f9nDbrWZaNRoqWDcLu6A4OqcvyyDmPH1E7v3Em4ZK46ArqD4+CpklrBGC1+jSH19P7tMTinVFEfDqkxEqhu8JfO4VTSy7JFhjiw1NO3u1dK2VnaH0xF1k7AyuCGxU4A6iqlj5kFPWqaEKcXQZKxsuZQJBZcWuVX5TqsGmkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519069; c=relaxed/simple;
	bh=Oz9wUvn4oVTrlnQ6lbozUoWbfENFfIpd/nII5OuHINc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VvF7YSnHDqp/fuTIIBbB4Pcv5zehIFBC1yF7uqElHW0MeOzYzG6P9rXH6bmjtE7ZSuyJhVYQYnzH2Qx4+axxq5PWU0qweYKhmhGCu0kYJNBhUwBSqYyT+6vTUO3L9MRrh+pFgUPr3Q0S9LhE77z86U8cCPD0fgZ1U7hm99ilAms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCit0CF/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCit0CF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769519068; x=1801055068;
  h=date:from:to:cc:subject:message-id;
  bh=Oz9wUvn4oVTrlnQ6lbozUoWbfENFfIpd/nII5OuHINc=;
  b=hCit0CF/tlZHgVpnO/YSE9mFTdhI/6qAGs6thVSgbjYXu7GVOUAc8WNQ
   t9FddIbrqMWJ0uBp/taozHJpv3OY4uQWU3h+QAl9PH26mYDIrZaaWWg7N
   1PVPIXQW530IGdk9mqjeP3293GUmaEs+CXK8kfCnPHKqb+Tm7x3+qzmQ1
   2d47ntO/VlOKMZvJMZXSryEndV2BbnP4lWxGua2HgtghigrImgYJhYOEj
   SJjypuqSL82q4oQaebHz0FbJQ52Se0Yxah5Rn9S/cs5bUNA3juLu2uMAE
   bVyfwKwjGcTFz8nkAbBIGR0fRM1U+uXscoy97tjFHhwgy8Eb6hZufx/9M
   Q==;
X-CSE-ConnectionGUID: WifwvoXGRfuSSs+z1kh13w==
X-CSE-MsgGUID: ITJKCHYfSCqggKEn4xwTXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81016555"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81016555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:04:28 -0800
X-CSE-ConnectionGUID: xGCoQMIgQhC0zgogFoOuYg==
X-CSE-MsgGUID: YBLfWZpoQ2K+0T5cnuyMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212436420"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2026 05:04:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkik4-00000000YUo-10wI;
	Tue, 27 Jan 2026 13:04:24 +0000
Date: Tue, 27 Jan 2026 21:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.10 1/1] fs/f2fs/iostat.c:210
 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <=
 3
Message-ID: <202601272004.HnjloZC4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   8b96c137bec0cc9c414f85dc958b9a5785a0790f
commit: d95bf22a4d1cbeebc288b87af27f0ea181a57218 [1/1] f2fs: introduce periodic iostat io latency traces
:::::: branch date: 16 hours ago
:::::: commit date: 4 years, 5 months ago
config: x86_64-randconfig-161-20260126 (https://download.01.org/0day-ci/archive/20260127/202601272004.HnjloZC4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601272004.HnjloZC4-lkp@intel.com/

New smatch warnings:
fs/f2fs/iostat.c:210 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <= 3
fs/f2fs/iostat.c:211 __update_iostat_latency() error: buffer overflow 'io_lat->bio_cnt[idx]' 3 <= 3
fs/f2fs/iostat.c:212 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

Old smatch warnings:
fs/f2fs/iostat.c:213 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[idx]' 3 <= 3

vim +210 fs/f2fs/iostat.c

d20508aceea564 Daeho Jeong 2021-08-19  182  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  183  static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
d95bf22a4d1cbe Daeho Jeong 2021-08-20  184  				int rw, bool is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  185  {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  186  	unsigned long ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  187  	unsigned int iotype = iostat_ctx->type;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  188  	unsigned long flags;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  189  	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  190  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  191  	int idx;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  192  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  193  	if (!sbi->iostat_enable)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  194  		return;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  195  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  196  	ts_diff = jiffies - iostat_ctx->submit_ts;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  197  	if (iotype >= META_FLUSH)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  198  		iotype = META;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  199  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  200  	if (rw == 0) {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  201  		idx = READ_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  202  	} else {
d95bf22a4d1cbe Daeho Jeong 2021-08-20  203  		if (is_sync)
d95bf22a4d1cbe Daeho Jeong 2021-08-20  204  			idx = WRITE_SYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  205  		else
d95bf22a4d1cbe Daeho Jeong 2021-08-20  206  			idx = WRITE_ASYNC_IO;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  207  	}
d95bf22a4d1cbe Daeho Jeong 2021-08-20  208  
d95bf22a4d1cbe Daeho Jeong 2021-08-20  209  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @210  	io_lat->sum_lat[idx][iotype] += ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @211  	io_lat->bio_cnt[idx][iotype]++;
d95bf22a4d1cbe Daeho Jeong 2021-08-20 @212  	if (ts_diff > io_lat->peak_lat[idx][iotype])
d95bf22a4d1cbe Daeho Jeong 2021-08-20  213  		io_lat->peak_lat[idx][iotype] = ts_diff;
d95bf22a4d1cbe Daeho Jeong 2021-08-20  214  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
d95bf22a4d1cbe Daeho Jeong 2021-08-20  215  }
d95bf22a4d1cbe Daeho Jeong 2021-08-20  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
