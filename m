Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72241DF25F
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845887; cv=none; b=XXEspLW+QOXcsNaCWAgo5ro1UH7N2IB5jqpqVP0WqehJMPAqqtMrlLIn17xNVByBgMDA9r1pRdsrqDMIw6svmjeRzHtLjIb9D/Be0eNzZI4xcWdJ0nlhjwkNbjAlxsLrd7ufPXgLcSwvISk3ehA2T+FZMEu4CSXhLdYR4TLzdls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845887; c=relaxed/simple;
	bh=NJQkNOZTYjNRzHtGlhqZVzUGth67K3OfhG5q/lshNiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8MQOCZ6KD44h+ZXhFGFtnQDfBEhf4JDpAckxILArg6gl1J+hNRu/qOHV26mQrDbp5n75ArRLY3YLjC3mWOYxYELSV0W6/vj4g5+JoNBj6VfwVq8xnftfwuUBUpaGh1na7jVX3byko5ONgWeDoX6CAzR4OzapLHppnaTgPvgAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijpPISNS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijpPISNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764845886; x=1796381886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJQkNOZTYjNRzHtGlhqZVzUGth67K3OfhG5q/lshNiM=;
  b=ijpPISNSqclRSPu9+wKoMRjOU/BXc963qOPIPTVb4+cUpH5O5GJJsfLV
   np4xcgM9SDktSwHPfjGm4zbR/EYkFMV0zBLJVY1ffdTAtGAQ25w8+A0U6
   yZjgMQ6rAaVz/LvVPyZykxeQdtKXiFKgB5e2kic/5H0ajZqADdXay2ffv
   K1uJKsWvKATWyJsRLpKDOi9rxcPhGHoAqxB3R4lsnhhbezlj/sRI2YHiL
   fnB5QMvQhn4SrSui0yvLYOHn4Ehihryis3yq0LOR9MLqoh8yJ1sAYHU+K
   1yFbkb+oDWuEIN2CeCS28p6wVxaTO1wEdyZaidk/zhvdztMyqefx6tbtR
   w==;
X-CSE-ConnectionGUID: 0zUj4LRkRAW7aE02zwLdeA==
X-CSE-MsgGUID: 6imUR58PR/acZ9608eGp9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84255599"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="84255599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:58:04 -0800
X-CSE-ConnectionGUID: BgcF+ArpRT+KQaOFmpU9HA==
X-CSE-MsgGUID: gkBkgiwRTn2zFEp8Bi5Eug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195192718"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2025 02:58:03 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR728-00000000Dj1-2zdV;
	Thu, 04 Dec 2025 10:58:00 +0000
Date: Thu, 4 Dec 2025 18:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 5/5] fs/f2fs/super.c:412
 f2fs_printk() error: we previously assumed 'sbi' could be null (see line
 405)
Message-ID: <202512041824.Rr334IOp-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ef2f661f7812939553f0ae21dbc880750b09a1c8
commit: 1444d806aafbff95eed142f5fdfe178c3541c889 [5/5] ANDROID: vendor_hooks: add hooks for f2fs_printk
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041824.Rr334IOp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512041824.Rr334IOp-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:412 f2fs_printk() error: we previously assumed 'sbi' could be null (see line 405)

vim +/sbi +412 fs/f2fs/super.c

d185351325237d Hongbo Li   2025-07-10  384  
b1c9d3f833ba60 Chao Yu     2024-01-26  385  void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
b1c9d3f833ba60 Chao Yu     2024-01-26  386  					const char *fmt, ...)
a07ef784356cf9 Namjae Jeon 2012-12-30  387  {
a07ef784356cf9 Namjae Jeon 2012-12-30  388  	struct va_format vaf;
a07ef784356cf9 Namjae Jeon 2012-12-30  389  	va_list args;
dcbb4c10e6d969 Joe Perches 2019-06-18  390  	int level;
a07ef784356cf9 Namjae Jeon 2012-12-30  391  
a07ef784356cf9 Namjae Jeon 2012-12-30  392  	va_start(args, fmt);
dcbb4c10e6d969 Joe Perches 2019-06-18  393  
dcbb4c10e6d969 Joe Perches 2019-06-18  394  	level = printk_get_level(fmt);
dcbb4c10e6d969 Joe Perches 2019-06-18  395  	vaf.fmt = printk_skip_level(fmt);
a07ef784356cf9 Namjae Jeon 2012-12-30  396  	vaf.va = &args;
b1c9d3f833ba60 Chao Yu     2024-01-26  397  	if (limit_rate)
19c4b380f23e5a Hongbo Li   2025-07-10  398  		if (sbi)
b1c9d3f833ba60 Chao Yu     2024-01-26  399  			printk_ratelimited("%c%cF2FS-fs (%s): %pV\n",
b1c9d3f833ba60 Chao Yu     2024-01-26  400  				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
b1c9d3f833ba60 Chao Yu     2024-01-26  401  		else
19c4b380f23e5a Hongbo Li   2025-07-10  402  			printk_ratelimited("%c%cF2FS-fs: %pV\n",
19c4b380f23e5a Hongbo Li   2025-07-10  403  				KERN_SOH_ASCII, level, &vaf);
19c4b380f23e5a Hongbo Li   2025-07-10  404  	else
19c4b380f23e5a Hongbo Li   2025-07-10 @405  		if (sbi)
dcbb4c10e6d969 Joe Perches 2019-06-18  406  			printk("%c%cF2FS-fs (%s): %pV\n",
dcbb4c10e6d969 Joe Perches 2019-06-18  407  				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
19c4b380f23e5a Hongbo Li   2025-07-10  408  		else
19c4b380f23e5a Hongbo Li   2025-07-10  409  			printk("%c%cF2FS-fs: %pV\n",
19c4b380f23e5a Hongbo Li   2025-07-10  410  				KERN_SOH_ASCII, level, &vaf);
dcbb4c10e6d969 Joe Perches 2019-06-18  411  
1444d806aafbff Rui Chen    2025-02-10 @412  	trace_android_vh_f2fs_printk(sbi->s_flag, &vaf, level, limit_rate);
a07ef784356cf9 Namjae Jeon 2012-12-30  413  	va_end(args);
a07ef784356cf9 Namjae Jeon 2012-12-30  414  }
a07ef784356cf9 Namjae Jeon 2012-12-30  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
