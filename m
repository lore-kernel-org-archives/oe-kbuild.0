Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F7547072
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384359; cv=none; b=mL8PegVD/pIAM9ZDN02+0+RlD2N6HbddM4Kv6ex5cD5E9l1OBhzzZMyYM1dfuAVxBdDkb3OBkCT7DQBt5R9pDhihz0mF9Nngr6xMx27CfEXGJaJl8aMOcTbT0HpFK5ZNJylJljdjZ9cxWovuFPnG2uiX6rsC5Atfkc0uBUQzMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384359; c=relaxed/simple;
	bh=J98fr4BXFVpeQEQHWs/3JPpiC+ziMZC+tqdxVLz16lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWvKKsuMSEbw+I2ReMi1eYyCEIKxAWrBXLxZXxShJxljDLqSM7zGrkVxKzhBlVhJTib5FdgU/iltj3ZX35btbZdWgE7nF9fh9B5bK1LSihfnkUDRtDl/OQfbweeavLWDKW68gNJHhKnVeIHj9jlyFgqYpyUKfH5z/4xPaWeygng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adD5t1Fd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adD5t1Fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790384356; x=1821920356;
  h=date:from:to:cc:subject:message-id;
  bh=J98fr4BXFVpeQEQHWs/3JPpiC+ziMZC+tqdxVLz16lk=;
  b=adD5t1FdlgKQsmgORM23JB9Y8Mq6T+PnXAjo5AchN3J1sYEBnIRPwHEX
   aeIox4KY0Jz/jocRTB2OxGEtdTc4U18FUCW3/cVFsl1a1MeQ7x2+k5U7t
   tJe6dHzedzp6WeHrjE4SJt714z+JVvHCjPsy4KU3y3cpkhl9RHtXMfrwe
   U7Josk8/z4QZ/iH8kjlhCR4FcwXZeKsGNxh0cdccnppRodEMPYnLjaH+T
   n3i0boduggjHc4g67c5ZDpSSisaBZWpRE4ZJ5hampFN9JngQR9gzQ85fA
   s7HBMcK0RyoJBu6uhAJ96mCte6hVXFmpzFAMtP59muz+C1Jb5zyytfI6+
   g==;
X-CSE-ConnectionGUID: ve3YilA9SMKXBHVcFJqblw==
X-CSE-MsgGUID: ahDmZKCzQAaNwFQi8sxnnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90078999"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90078999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:59:15 -0700
X-CSE-ConnectionGUID: MuacwnjySbmdiyWQs8LuBw==
X-CSE-MsgGUID: fygT6+ycQvWTChUQ4/hjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277837592"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 17:59:14 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAGkv-00000000095-15W7;
	Sat, 26 Sep 2026 00:59:09 +0000
Date: Sat, 26 Sep 2026 02:58:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arnd-playground:randconfig-7.3-next 428/673] mm/mmap.c:630
 __do_sys_mmap2() warn: bitwise AND condition is false here
Message-ID: <202609260253.DKqZX8BZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 4d3c9be36cf7289309c7c25302ca4aa669df9032 [428/673] treewide: replace mmap_pgoff() with mmap2()
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260253.DKqZX8BZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609260253.DKqZX8BZ-lkp@intel.com/

smatch warnings:
mm/mmap.c:630 __do_sys_mmap2() warn: bitwise AND condition is false here
mm/mmap.c:630 __do_sys_mmap2() warn: bitwise AND condition is false here

vim +630 mm/mmap.c

66f0dc481e5b80 Hugh Dickins      2009-12-30  625  
4d3c9be36cf728 Arnd Bergmann     2021-12-22  626  SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
a90f590a1bee36 Dominik Brodowski 2018-03-11  627  		unsigned long, prot, unsigned long, flags,
4d3c9be36cf728 Arnd Bergmann     2021-12-22  628  		unsigned long, fd, unsigned long, off_4k)
a90f590a1bee36 Dominik Brodowski 2018-03-11  629  {
4d3c9be36cf728 Arnd Bergmann     2021-12-22 @630  	if (off_4k & (~PAGE_MASK >> 12))
4d3c9be36cf728 Arnd Bergmann     2021-12-22  631  		return -EINVAL;
4d3c9be36cf728 Arnd Bergmann     2021-12-22  632  
4d3c9be36cf728 Arnd Bergmann     2021-12-22  633  	off_4k >>= (PAGE_SHIFT - 12);
4d3c9be36cf728 Arnd Bergmann     2021-12-22  634  
4d3c9be36cf728 Arnd Bergmann     2021-12-22  635  	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off_4k);
a90f590a1bee36 Dominik Brodowski 2018-03-11  636  }
a90f590a1bee36 Dominik Brodowski 2018-03-11  637  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
