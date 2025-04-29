Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD029E059
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923459; cv=none; b=ZmRTu73uHNKX/DFd0Nh1BOZm+1oDWc/KqekgXBnbR3o3TTcModj0zWaDhoJr/wSQwYPmZD8iso1R9VNS4sN6bbc8SOKvdXjkYskVrYYFkshrebr859kkjoEPy3awocgwDw6/TaU2FchUht/GpWBvn3Hd/RUEeSOdCyKTf0BilsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923459; c=relaxed/simple;
	bh=I7VkdIO/tKc/L8AsoeB+YgZt+s4lhWMwd4org3IxhEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctbcvxhN7dei0tOqK+9ZYYlql48aEpEcDnD2740sWNQe4uJ1ZNB/8luWNh0S7Mta7PAeqa19J0DY8xrajie0znUWVdyY7iZ17gKhYZ8LAfq5t42EO2+r8AVpZ2nBiMailGrNtRy8l7Pj9f9RfBvxn6uwu0bEZFshEE/TxjuRWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/BCILyl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/BCILyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745923454; x=1777459454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7VkdIO/tKc/L8AsoeB+YgZt+s4lhWMwd4org3IxhEs=;
  b=T/BCILyl1BBKllXAAzOOvh6XmkaoAGpmTCaBJiF287mfnnOwuWPxS53j
   9w9x5/FYvGwDn57hDCUseXjQMukxZvK4HTpa9YTRVdsrZAMHtc6cyVfA3
   cRX/eh80aM1JTkcSq6Mk3V/KIK7aZ36CIKHfVUxn9EkfnTRwKT+i+MTNZ
   TaQK1n4MHlXdeM9V6MKhTQzyKd1EmcQfSx/7duCOIONRlZY/plLQOdUa4
   xmowLKfdsZgyucUCHt2WxMYZiZVkx4VdTgkTkRyxu6aWIAUI0iKub69M4
   QEdacPQNX2d/bEYGNTy0N2Tqvzm/Bp+CPPOboqOUUmpNrUS704SBqIuNB
   Q==;
X-CSE-ConnectionGUID: JM1MQ3LpQ7eG9BCuGWoPYg==
X-CSE-MsgGUID: 6KZ1ASAfReuOtKHmax5yBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47422749"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47422749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 03:44:14 -0700
X-CSE-ConnectionGUID: J+cUFlVPStWlUsQwMRqO8g==
X-CSE-MsgGUID: q9X8OYG0TbGwQSmBWPmiQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="137829326"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 03:44:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9iRd-0000f9-0s;
	Tue, 29 Apr 2025 10:44:09 +0000
Date: Tue, 29 Apr 2025 18:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.4 1/1] fs/f2fs/data.c:300
 f2fs_read_end_io() warn: bitwise AND condition is false here
Message-ID: <202504291841.5NpDfkME-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   cd8e74fa0fa3de9f66c12c5c2c2868442d2f6728
commit: df0f904d74036f724050cf2aa4ca5200cf4a9b1a [1/1] f2fs: clean up post-read processing
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 3 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291841.5NpDfkME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504291841.5NpDfkME-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:300 f2fs_read_end_io() warn: bitwise AND condition is false here

Old smatch warnings:
fs/f2fs/data.c:229 f2fs_verify_and_finish_bio() warn: bitwise AND condition is false here
fs/f2fs/data.c:276 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:279 f2fs_post_read_work() warn: bitwise AND condition is false here

vim +300 fs/f2fs/data.c

6dbb17961f46b2 Eric Biggers      2018-04-18  284  
6dbb17961f46b2 Eric Biggers      2018-04-18  285  static void f2fs_read_end_io(struct bio *bio)
6dbb17961f46b2 Eric Biggers      2018-04-18  286  {
3d6b1a34f2a3f2 Chao Yu           2019-11-01  287  	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
df0f904d74036f Eric Biggers      2021-01-04  288  	struct bio_post_read_ctx *ctx = bio->bi_private;
3d6b1a34f2a3f2 Chao Yu           2019-11-01  289  
3d6b1a34f2a3f2 Chao Yu           2019-11-01  290  	if (time_to_inject(sbi, FAULT_READ_IO)) {
3d6b1a34f2a3f2 Chao Yu           2019-11-01  291  		f2fs_show_injection_info(sbi, FAULT_READ_IO);
4e4cbee93d5613 Christoph Hellwig 2017-06-03  292  		bio->bi_status = BLK_STS_IOERR;
55523519bc7227 Chao Yu           2017-02-25  293  	}
8b038c70dfe4fd Chao Yu           2016-09-18  294  
df0f904d74036f Eric Biggers      2021-01-04  295  	if (bio->bi_status) {
df0f904d74036f Eric Biggers      2021-01-04  296  		f2fs_finish_read_bio(bio);
4375a33664de17 Jaegeuk Kim       2015-04-23  297  		return;
4375a33664de17 Jaegeuk Kim       2015-04-23  298  	}
4375a33664de17 Jaegeuk Kim       2015-04-23  299  
df0f904d74036f Eric Biggers      2021-01-04 @300  	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
df0f904d74036f Eric Biggers      2021-01-04  301  		INIT_WORK(&ctx->work, f2fs_post_read_work);
df0f904d74036f Eric Biggers      2021-01-04  302  		queue_work(ctx->sbi->post_read_wq, &ctx->work);
df0f904d74036f Eric Biggers      2021-01-04  303  	} else {
df0f904d74036f Eric Biggers      2021-01-04  304  		f2fs_verify_and_finish_bio(bio);
df0f904d74036f Eric Biggers      2021-01-04  305  	}
f1e8866016b53b Jaegeuk Kim       2015-04-09  306  }
f1e8866016b53b Jaegeuk Kim       2015-04-09  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
