Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070126159E
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782342626; cv=none; b=LJsSY3cVaEwG5c06FD4NS82ADbW6+KngTvKVLBlITa9dED4h/0jnTOv+1+MmI8oG9OWnqPWpFyBsLOzW2/XSncb4wTyFrwFhoSchYrL0HW1OpGwSFjyROFR7hrIvlNg7F7yVdrFhb3/UUFnePejdxoJ8T1dUWHcIDSFGIyNM0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782342626; c=relaxed/simple;
	bh=FH9yR4inm1en7UKu+rLJ+corRSzdHsmBj8L1vjii/Sk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=APSsfjiJi0/6dQWniqIo4gMpz2XWsjZNi9DrWIqDbyOYUVzWDluqD57pGvo0+od1ou3keIT+r3Hzc3N7abMklOwdKnFa6MBzaCHiLC9lt61sLq9I7A7NXgmBzYSMimJ6jQ72h+By3qp3y8U2u2JgM3zh4rRKvNQmsCLLbun3EG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3UxJ0LA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3UxJ0LA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782342623; x=1813878623;
  h=date:from:to:cc:subject:message-id;
  bh=FH9yR4inm1en7UKu+rLJ+corRSzdHsmBj8L1vjii/Sk=;
  b=K3UxJ0LABj+48F9Nko/xpS94A3zKC/Rc393vLb5MjSTObS901quuY18T
   vdkaAkeQx+hzZcqvuobS5HGtf8dvGeOYxd9sSj6eJhzsHR2D+6iq8M+cB
   iPZBntLdIZzw6VLHt/W8WtUbg1vEIt9kmv6GifIvT29YAMDPcyw+cFkPD
   FN70eUGO0JCDRwjNY80cNvCvds1aiMlm64SXj9aezDTIZ0e/TuRqVHELc
   MSHOuXD24TM7B5frCBui7nz1Og5mh+9aJOG4yAceami0Ezexd6TKigzD+
   71GBNdk13Ijus30oFmc7z20pw9asBaC6JnLmYMSvR1mYZVEX61hoVehrW
   g==;
X-CSE-ConnectionGUID: ohOSEEZXQk2TcvIHTYJsvw==
X-CSE-MsgGUID: tW742AfmT8qwndD4YTxo/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94510604"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="94510604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 16:10:23 -0700
X-CSE-ConnectionGUID: 0uDh0z94SbWWWS5R2mqzAA==
X-CSE-MsgGUID: 6eNVzzSZToah5vXwnRu1Sg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2026 16:10:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcWjW-000000003jB-1NOZ;
	Wed, 24 Jun 2026 23:10:16 +0000
Date: Thu, 25 Jun 2026 07:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11135/15099] drivers/rtc/rtc-m48t59.c:133
 m48t59_rtc_set_time() error: calling 'spin_unlock_irqrestore()' with bogus
 flags
Message-ID: <202606250647.EPF3zhCj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [11135/15099] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 34 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250647.EPF3zhCj-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606250647.EPF3zhCj-lkp@intel.com/

New smatch warnings:
drivers/rtc/rtc-m48t59.c:133 m48t59_rtc_set_time() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rtc/rtc-m48t59.c:335 m48t59_nvram_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-picolcd_core.c:108 picolcd_send_and_wait() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hv/hv_balloon.c:910 handle_pg_range() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-picolcd_fb.c:267 picolcd_fb_update() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwmon/xgene-hwmon.c:437 xgene_hwmon_evt_work() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/hid/hid-picolcd_fb.c:276 picolcd_fb_update() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +133 drivers/rtc/rtc-m48t59.c

2e774c7caf84455 Mark Zhan        2007-07-17   98  
2e774c7caf84455 Mark Zhan        2007-07-17   99  static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
2e774c7caf84455 Mark Zhan        2007-07-17  100  {
85368bb9de63666 Wolfram Sang     2018-04-19  101  	struct m48t59_plat_data *pdata = dev_get_platdata(dev);
85368bb9de63666 Wolfram Sang     2018-04-19  102  	struct m48t59_private *m48t59 = dev_get_drvdata(dev);
2e774c7caf84455 Mark Zhan        2007-07-17  103  	unsigned long flags;
2e774c7caf84455 Mark Zhan        2007-07-17  104  	u8 val = 0;
a06e4a93067cd8f Finn Thain       2024-11-13  105  	int year = tm->tm_year - pdata->yy_offset;
2e774c7caf84455 Mark Zhan        2007-07-17  106  
2e774c7caf84455 Mark Zhan        2007-07-17  107  	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
12a9ee3cce256ae Krzysztof Helt   2008-10-29  108  		year + 1900, tm->tm_mon, tm->tm_mday,
2e774c7caf84455 Mark Zhan        2007-07-17  109  		tm->tm_hour, tm->tm_min, tm->tm_sec);
2e774c7caf84455 Mark Zhan        2007-07-17  110  
12a9ee3cce256ae Krzysztof Helt   2008-10-29  111  	if (year < 0)
12a9ee3cce256ae Krzysztof Helt   2008-10-29  112  		return -EINVAL;
12a9ee3cce256ae Krzysztof Helt   2008-10-29  113  
2e774c7caf84455 Mark Zhan        2007-07-17  114  	spin_lock_irqsave(&m48t59->lock, flags);
2e774c7caf84455 Mark Zhan        2007-07-17  115  	/* Issue the WRITE command */
2e774c7caf84455 Mark Zhan        2007-07-17  116  	M48T59_SET_BITS(M48T59_CNTL_WRITE, M48T59_CNTL);
2e774c7caf84455 Mark Zhan        2007-07-17  117  
fe20ba70abf7d6e Adrian Bunk      2008-10-18  118  	M48T59_WRITE((bin2bcd(tm->tm_sec) & 0x7F), M48T59_SEC);
fe20ba70abf7d6e Adrian Bunk      2008-10-18  119  	M48T59_WRITE((bin2bcd(tm->tm_min) & 0x7F), M48T59_MIN);
fe20ba70abf7d6e Adrian Bunk      2008-10-18  120  	M48T59_WRITE((bin2bcd(tm->tm_hour) & 0x3F), M48T59_HOUR);
fe20ba70abf7d6e Adrian Bunk      2008-10-18  121  	M48T59_WRITE((bin2bcd(tm->tm_mday) & 0x3F), M48T59_MDAY);
2e774c7caf84455 Mark Zhan        2007-07-17  122  	/* tm_mon is 0-11 */
fe20ba70abf7d6e Adrian Bunk      2008-10-18  123  	M48T59_WRITE((bin2bcd(tm->tm_mon + 1) & 0x1F), M48T59_MONTH);
12a9ee3cce256ae Krzysztof Helt   2008-10-29  124  	M48T59_WRITE(bin2bcd(year % 100), M48T59_YEAR);
2e774c7caf84455 Mark Zhan        2007-07-17  125  
60a06efc56d7d33 Abhishek Tamboli 2024-08-09  126  	if (pdata->type == M48T59RTC_TYPE_M48T59 && (year >= 100))
2e774c7caf84455 Mark Zhan        2007-07-17  127  		val = (M48T59_WDAY_CEB | M48T59_WDAY_CB);
fe20ba70abf7d6e Adrian Bunk      2008-10-18  128  	val |= (bin2bcd(tm->tm_wday) & 0x07);
2e774c7caf84455 Mark Zhan        2007-07-17  129  	M48T59_WRITE(val, M48T59_WDAY);
2e774c7caf84455 Mark Zhan        2007-07-17  130  
2e774c7caf84455 Mark Zhan        2007-07-17  131  	/* Clear the WRITE bit */
2e774c7caf84455 Mark Zhan        2007-07-17  132  	M48T59_CLEAR_BITS(M48T59_CNTL_WRITE, M48T59_CNTL);
2e774c7caf84455 Mark Zhan        2007-07-17 @133  	spin_unlock_irqrestore(&m48t59->lock, flags);
2e774c7caf84455 Mark Zhan        2007-07-17  134  	return 0;
2e774c7caf84455 Mark Zhan        2007-07-17  135  }
2e774c7caf84455 Mark Zhan        2007-07-17  136  

:::::: The code at line 133 was first introduced by commit
:::::: 2e774c7caf84455d5e7d492d123bad6f417818b5 rtc: add support for the ST M48T59 RTC

:::::: TO: Mark Zhan <rongkai.zhan@windriver.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
