Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D084734F4
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269472; cv=none; b=S9g/3NorHttcA5rwdDLj+duPooSqAyL65ym8crHr1Lb80A2EQ7ttahBun6r+zH1VAngvLNys2zsJqnl0XqSprHJ3vVK8jAOJMbk4cDitcl+x/A+yEJ6nqMsXYQym0FWqSsudWwzFj52bvbzCbJWRkoRvDtNVV9qXC+hMqH1D/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269472; c=relaxed/simple;
	bh=NJutWvP9c1WNNlnPdyLYrk5z53RLGdXRNru3omtkdm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CnmLjPjhbhTE0kSGFfLR1fdGI2nLpqvLdehEnF3rPOS+Bos449j21pLcm/8VIeC+xUnS6heTn2IT0YeGwBb5sjjMXooCiPcMmjnWLZvNBXkJOuNKFxcn/PNVx4vFMlfySVHOHxBt6Z+9/tdQDMuljt61ublLluE+qZKJQIM/KNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1imCFmS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1imCFmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785269470; x=1816805470;
  h=date:from:to:cc:subject:message-id;
  bh=NJutWvP9c1WNNlnPdyLYrk5z53RLGdXRNru3omtkdm8=;
  b=C1imCFmSeYYs/ULpJsYgB1adlPvgEyFT2S7faSrfJ8B1p/nRBRQcqsim
   9zZngywG4WjzU/lA6iaQNAwbvO9ZbAvjWQl4q+Lg3KMCgIrduTtn+4y/E
   ab+sKn3MSs7gJPzIDhQglJ6StUUc4JUOfAvM9clAmPcSgEEhDaz+8F5MI
   tcwAda0dkC1Cyu/6DL9XDEH7+OZv2Sx6xWaF2Waps/Lz8cE/e3/nnU/C8
   fCw2/chgCbRt/EKvB824/oQmQzAE4/vB0wiBSjN8bz3wiQGjDhgPJAj+v
   ZFUuxWBKJAFC/FvP7ctu77WQMsSxlbhA8ZNMIxAPRuc/Md8Qe+PiJ0wk0
   g==;
X-CSE-ConnectionGUID: 7R2tvYTsQVep27SsI8jlSA==
X-CSE-MsgGUID: e+TzcyBwTMyoTMziiKppfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97379184"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="97379184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:11:09 -0700
X-CSE-ConnectionGUID: bN+66joWStSl/8EAqil9Tw==
X-CSE-MsgGUID: 9mZIbQWYQ+WX6MVdk2BALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="263289590"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Jul 2026 13:11:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woo8k-00000000ejn-01YH;
	Tue, 28 Jul 2026 20:11:02 +0000
Date: Wed, 29 Jul 2026 04:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.10 1/1] fs/f2fs/iostat.c:210
 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[idx]' 3 <=
 3
Message-ID: <202607290313.p90dfy5i-lkp@intel.com>
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
head:   68b45855d7865a3c7836a9f017f8c337f3a15367
commit: d95bf22a4d1cbeebc288b87af27f0ea181a57218 [1/1] f2fs: introduce periodic iostat io latency traces
:::::: branch date: 4 days ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-161-20260728 (https://download.01.org/0day-ci/archive/20260729/202607290313.p90dfy5i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607290313.p90dfy5i-lkp@intel.com/

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
