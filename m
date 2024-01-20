Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841B10FD
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705723710; cv=none; b=KmFoVmnbNzwLf517zyHvyNz0DVEW+44bCAJQZpS8PaGGrQfvxqfN/h1SjMGUuTYejxpSqSIheIoBOtYMEgp1uG0t7AROLb2LURmw6L4N09vHe9CalyNXMN7pZJIYg+4W54QlGtznKH1VfyT/XbxNrcQtzRx6PVOLaQkx3olGwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705723710; c=relaxed/simple;
	bh=i6QnFI3ouKB8Ej5AnpvqvewFWHC7D1dW2B/5rLQUi7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Orx1IXN79JffA3BiAuG5ihIOkC9AVjkZJ8xZaiE4Pe2oD4R0zU/YQJru77bU8SGf4aSqCOf5B7KTQOjkuElJS+fgtHDSihxRlcXJ7uw7eHlBfgErKNpUmaozqF1HgjnsqAV/AFCUCCTpD7/xdZiUnril3YYzw4HjKc8F4tV6HeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLe0OCi1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLe0OCi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705723709; x=1737259709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6QnFI3ouKB8Ej5AnpvqvewFWHC7D1dW2B/5rLQUi7M=;
  b=nLe0OCi1Ev5kwSxeeF94Epjlrp2OmwVRP2p85WVzqjLa9/1Mmvaw0A4O
   Nf07pxzRoIQDZYzyNhKWx0UFRMuEjXC+1hkFU3zkSC8TSRKTUet+6vCdP
   r9Cugae2GinrfSSDFRrCcTExK5CZVvEgVqtvEhJkH36MDfNP75CQAK0F+
   S+KINXf2pdBHUEnHKTYYmqvpYGGWOiIiHYK6ufHX7Wa7wv8GpLTrkBuvV
   YDFpjK2c5jrF9c8L6/YBb2lVsGTJh65LWDzHZQEyj/778UI9dqZmd+xYM
   rpWtH/Vap68uwmr85ldqPQWboi7DStSxyBRJUiyX2vPK8MS/uPAqdfyC5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="784965"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="784965"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819218425"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="819218425"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2024 20:08:25 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR2ed-0004iz-1k;
	Sat, 20 Jan 2024 04:08:23 +0000
Date: Sat, 20 Jan 2024 12:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] f2fs: fix zoned block device information
 initialization
Message-ID: <202401201237.ovVyEKvs-lkp@intel.com>
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
In-Reply-To: <20240116140513.1222-1-qwjhust@gmail.com>
References: <20240116140513.1222-1-qwjhust@gmail.com>
TO: Wenjie Qi <qwjhust@gmail.com>
TO: jaegeuk@kernel.org
TO: chao@kernel.org
TO: linux-f2fs-devel@lists.sourceforge.net
TO: linux-kernel@vger.kernel.org
CC: hustqwj@hust.edu.cn
CC: Wenjie Qi <qwjhust@gmail.com>

Hi Wenjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenjie-Qi/f2fs-fix-zoned-block-device-information-initialization/20240116-220824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240116140513.1222-1-qwjhust%40gmail.com
patch subject: [PATCH v2] f2fs: fix zoned block device information initialization
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240120/202401201237.ovVyEKvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401201237.ovVyEKvs-lkp@intel.com/

New smatch warnings:
fs/f2fs/super.c:2393 f2fs_remount() warn: missing error code 'err'

Old smatch warnings:
fs/f2fs/super.c:4040 read_raw_super_block() warn: possible memory leak of 'super'

vim +/err +2393 fs/f2fs/super.c

4b2414d04e9912 Chao Yu        2017-08-08  2371  
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2372  	/* recover superblocks we couldn't write due to previous RO mount */
1751e8a6cb935e Linus Torvalds 2017-11-27  2373  	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2374  		err = f2fs_commit_super(sbi, false);
dcbb4c10e6d969 Joe Perches    2019-06-18  2375  		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
dcbb4c10e6d969 Joe Perches    2019-06-18  2376  			  err);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2377  		if (!err)
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2378  			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2379  	}
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2380  
458c15dfbce62c Chao Yu        2023-05-23  2381  	default_options(sbi, true);
26666c8a4366de Chao Yu        2014-09-15  2382  
696c018c7718f5 Namjae Jeon    2013-06-16  2383  	/* parse mount options */
ed318a6cc0b620 Eric Biggers   2020-05-12  2384  	err = parse_options(sb, data, true);
696c018c7718f5 Namjae Jeon    2013-06-16  2385  	if (err)
696c018c7718f5 Namjae Jeon    2013-06-16  2386  		goto restore_opts;
696c018c7718f5 Namjae Jeon    2013-06-16  2387  
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2388  #ifdef CONFIG_BLK_DEV_ZONED
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2389  	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2390  		f2fs_err(sbi,
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2391  			"zoned: max active zones %u is too small, need at least %u active zones",
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2392  				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
ed7a1efe8afd55 Wenjie Qi      2024-01-16 @2393  		goto restore_opts;
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2394  	}
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2395  #endif
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2396  
b62e71be2110d8 Chao Yu        2023-04-23  2397  	/* flush outstanding errors before changing fs state */
b62e71be2110d8 Chao Yu        2023-04-23  2398  	flush_work(&sbi->s_error_work);
b62e71be2110d8 Chao Yu        2023-04-23  2399  
696c018c7718f5 Namjae Jeon    2013-06-16  2400  	/*
696c018c7718f5 Namjae Jeon    2013-06-16  2401  	 * Previous and new state of filesystem is RO,
876dc59eb1f013 Gu Zheng       2014-04-11  2402  	 * so skip checking GC and FLUSH_MERGE conditions.
696c018c7718f5 Namjae Jeon    2013-06-16  2403  	 */
1751e8a6cb935e Linus Torvalds 2017-11-27  2404  	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
696c018c7718f5 Namjae Jeon    2013-06-16  2405  		goto skip;
696c018c7718f5 Namjae Jeon    2013-06-16  2406  
d78dfefcde9d31 Chao Yu        2023-04-04  2407  	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2408  		err = -EROFS;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2409  		goto restore_opts;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2410  	}
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
