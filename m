Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAE33E1
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712888539; cv=none; b=ptgfABxcN3njZnTI8TzCgxcxuxvFjWBGpc8pDFjBQAiLAp6PZ5Ge3qgwXpyGkmiTA0b8ijXyjw1LAMEi0isR2Ct8pU59K0CcL+d8FtJePA+BbQN2INSCRtqFEVMigaiqtmEDHhS0pCBPgy5xyS9T07s6vJv1mpVm7RNqHVGo+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712888539; c=relaxed/simple;
	bh=5Q36lfLOWgThEyM32UXNa+URy57035UAsDv7bs73f+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNlE3bFQL0X4yF0W9VeCRAST59ildHd6q/mYMeX6gDttql8aLt2oHsg0ug1KezbG+b6ZBUX8SkL+HhNwSGthPZkt0dJegrONrhDSXQJXbWoR5KZrL2Li/1gqLnak5T4osBthWl23xLLpLnevTgwOaXPCN+jk7Z+w9GuyVOFxM5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImEjFIPl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImEjFIPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712888535; x=1744424535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Q36lfLOWgThEyM32UXNa+URy57035UAsDv7bs73f+E=;
  b=ImEjFIPliIqYwaa+X1m2f8IwheliUtS8I53hwEyV/lNcwX7Xe1b4C3y/
   Pp6GRzp3+jB+H3jlWXp8YgBvcld3aY+uIGh+9kiptNqr2Pu9ZsUcE2u1M
   gLf6V9j48EeFgL3VDkgYT6Eo7bSPpKSyeOR2zms1p0yNhxvJO1u/i5tiU
   yFDBJdRcxnkQQpcXLkz5K+352/kMqXSWYdZManR5JgnQ6l6wiPsUtWNRj
   8LIuTnTIMUMz/92gyaz6oKMbDFX7C5sKSfznMlf1GRL75i2HQ6BeoB9zY
   L+7ew/Vi+gcq9qnS+7xCcm6K9CsuNubp4sXirjpk9b5d70UOLUKWMKOAM
   w==;
X-CSE-ConnectionGUID: hTez74NpTOekYT6so6aOQA==
X-CSE-MsgGUID: GFbT5U/qTb68n5TSJtnk4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8499157"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8499157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 19:22:14 -0700
X-CSE-ConnectionGUID: J5aRD+jVRD62PORG6TUsUA==
X-CSE-MsgGUID: mBuoKOm0SB+eAD+HX4giJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="44375672"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2024 19:22:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv6YO-0009GY-2R;
	Fri, 12 Apr 2024 02:22:12 +0000
Date: Fri, 12 Apr 2024 10:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 201/415] drivers/misc/lkdtm/core.c:243
 lkdtm_debugfs_entry() warn: potential spectre issue 'buf' [w]
Message-ID: <202404121007.lwFNRpQt-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: a1a155c91686296745efd6a9fbb865ca4cef6ff5 [201/415] misc: lkdtm: convert to read/write iterators
:::::: branch date: 7 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240412/202404121007.lwFNRpQt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404121007.lwFNRpQt-lkp@intel.com/

New smatch warnings:
drivers/misc/lkdtm/core.c:243 lkdtm_debugfs_entry() warn: potential spectre issue 'buf' [w]

Old smatch warnings:
drivers/misc/lkdtm/core.c:318 direct_entry() warn: potential spectre issue 'buf' [w]

vim +/buf +243 drivers/misc/lkdtm/core.c

2b271cb7203dd4 drivers/misc/lkdtm_core.c Arnd Bergmann  2016-07-15  223  
a1a155c9168629 drivers/misc/lkdtm/core.c Jens Axboe     2024-04-05  224  static ssize_t lkdtm_debugfs_entry(struct kiocb *iocb, struct iov_iter *from)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  225  {
a1a155c9168629 drivers/misc/lkdtm/core.c Jens Axboe     2024-04-05  226  	struct crashpoint *crashpoint = file_inode(iocb->ki_filp)->i_private;
75f98b7ab748a6 drivers/misc/lkdtm_core.c Kees Cook      2017-10-20  227  	const struct crashtype *crashtype = NULL;
a1a155c9168629 drivers/misc/lkdtm/core.c Jens Axboe     2024-04-05  228  	size_t count = iov_iter_count(from);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  229  	char *buf;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  230  	int err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  231  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  232  	if (count >= PAGE_SIZE)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  233  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  234  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  235  	buf = (char *)__get_free_page(GFP_KERNEL);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  236  	if (!buf)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  237  		return -ENOMEM;
a1a155c9168629 drivers/misc/lkdtm/core.c Jens Axboe     2024-04-05  238  	if (!copy_from_iter_full(buf, count, from)) {
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  239  		free_page((unsigned long) buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  240  		return -EFAULT;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  241  	}
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  242  	/* NULL-terminate and remove enter */
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05 @243  	buf[count] = '\0';
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  244  	strim(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  245  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook      2016-06-29  246  	crashtype = find_crashtype(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  247  	free_page((unsigned long)buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  248  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook      2016-06-29  249  	if (!crashtype)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  250  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  251  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook      2016-06-29  252  	err = lkdtm_register_cpoint(crashpoint, crashtype);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  253  	if (err < 0)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  254  		return err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  255  
a1a155c9168629 drivers/misc/lkdtm/core.c Jens Axboe     2024-04-05  256  	iocb->ki_pos += count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  257  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  258  	return count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  259  }
2b271cb7203dd4 drivers/misc/lkdtm_core.c Arnd Bergmann  2016-07-15  260  #endif
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom 2010-03-05  261  

:::::: The code at line 243 was first introduced by commit
:::::: 0347af4ee3922220f6bfe74b87b526aa709a0365 lkdtm: add debugfs access and loosen KPROBE ties

:::::: TO: Simon Kagstrom <simon.kagstrom@netinsight.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
