Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997817E772
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Apr 2024 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651039; cv=none; b=DTwBKTQZCkIp1/YJOe87dABSi+0P8tueoeXbg2uIJ6eJetCPeJ86gQH5bejkMaQDYXAIB96olLJr8A9wFAczYIIqVLxsehoB6Xes5ExEo07LrDmTVNyEHQiaKr6T23/PzslQWG/w5HH5FqxKw3BPcE7xSIlakGU7De9yyJjYW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651039; c=relaxed/simple;
	bh=syZ441P2tpn8ykHO3F9fdN/TwI5daUC0WQOVbHFbkiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZ66bZ8VDRTGGNgSa+oRjqUjnyPZCUYy1gHgHYzCM4DJkd7mKxjNFi1yR60SWZbTQspLn19kKflpEGRZZEopLq+B8yYFq3mynSMIGqYbssvBBP0Tft6Qr4/x99KBpaW0KjJjoGhjJbdUJThzDw+DlZ5UXj82wk1k4vNeWXSb1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1NADFqV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1NADFqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651037; x=1744187037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syZ441P2tpn8ykHO3F9fdN/TwI5daUC0WQOVbHFbkiA=;
  b=I1NADFqVBJDF87c198uWYy5ZLi/t27rgtglhu0xoie89bVggP/HXH0yx
   uhrx8Ks6YMpczTiAEfHbqFVnfw5kSZzG/uUbxM9kwsv4TR8WqXb4lGAqk
   6A5eXHLNo1JYMff3s0NCO94ePTuPdJyfWU7CVWOS6DC2Llqd4/+iexe6k
   VOU3dpk4QwcWteJzOAzrkqrMrwX5Ei2s+jVYEABhTLtqq69tzrsHoIhEw
   ob5URTgQnvTaOL2S0rcYEC0Xfjue3G6njH5M3CLIcztp1krOf1Al70Q2N
   DfBAvn9IHQJdLv+e1OnosZF9kH2lVD6G1yGa/EZlEZ53GAJYr8L18JNHP
   w==;
X-CSE-ConnectionGUID: TpkeHLilTNCPb4oVmJKwsg==
X-CSE-MsgGUID: YxZqwFYNQMGYFotv8GuW/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7826272"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7826272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:23:56 -0700
X-CSE-ConnectionGUID: +2Fra4FhSkiM5kMO/5qJQQ==
X-CSE-MsgGUID: W6medzgmThWuXpSP/XTJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20275255"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Apr 2024 01:23:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru6ll-0005tu-1e;
	Tue, 09 Apr 2024 08:23:53 +0000
Date: Tue, 9 Apr 2024 16:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 80/153] drivers/misc/lkdtm/core.c:318
 direct_entry() warn: potential spectre issue 'buf' [w]
Message-ID: <202404091654.YAGBm7Lb-lkp@intel.com>
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
head:   8d5e62882d13747268ce489ec43048c8eff31b7a
commit: 0647905ab98a446b7f8b37479744f576d8db0e54 [80/153] misc: lkdtm: convert to read/write iterators
:::::: branch date: 5 hours ago
:::::: commit date: 15 hours ago
config: microblaze-randconfig-r071-20240409 (https://download.01.org/0day-ci/archive/20240409/202404091654.YAGBm7Lb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404091654.YAGBm7Lb-lkp@intel.com/

smatch warnings:
drivers/misc/lkdtm/core.c:318 direct_entry() warn: potential spectre issue 'buf' [w]

vim +/buf +318 drivers/misc/lkdtm/core.c

0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  296  
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  297  /* Special entry to just crash directly. Available without KPROBEs */
0647905ab98a446 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  298  static ssize_t direct_entry(struct kiocb *iocb, struct iov_iter *from)
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  299  {
75f98b7ab748a6f drivers/misc/lkdtm_core.c Kees Cook        2017-10-20  300  	const struct crashtype *crashtype;
0647905ab98a446 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  301  	size_t count = iov_iter_count(from);
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  302  	char *buf;
84022cff50511e2 drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  303  	int err;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  304  
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  305  	if (count >= PAGE_SIZE)
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  306  		return -EINVAL;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  307  	if (count < 1)
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  308  		return -EINVAL;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  309  
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  310  	buf = (char *)__get_free_page(GFP_KERNEL);
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  311  	if (!buf)
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  312  		return -ENOMEM;
0647905ab98a446 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  313  	if (!copy_from_iter_full(buf, count, from)) {
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  314  		free_page((unsigned long) buf);
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  315  		return -EFAULT;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  316  	}
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  317  	/* NULL-terminate and remove enter */
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05 @318  	buf[count] = '\0';
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  319  	strim(buf);
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  320  
c479e3fd88703c4 drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  321  	crashtype = find_crashtype(buf);
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  322  	free_page((unsigned long) buf);
c479e3fd88703c4 drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  323  	if (!crashtype)
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  324  		return -EINVAL;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  325  
c479e3fd88703c4 drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  326  	pr_info("Performing direct entry %s\n", crashtype->name);
84022cff50511e2 drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  327  	err = lkdtm_do_action(crashtype);
0647905ab98a446 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  328  	iocb->ki_pos += count;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  329  
84022cff50511e2 drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  330  	if (err)
84022cff50511e2 drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  331  		return err;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  332  	return count;
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  333  }
0347af4ee392222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  334  

:::::: The code at line 318 was first introduced by commit
:::::: 0347af4ee3922220f6bfe74b87b526aa709a0365 lkdtm: add debugfs access and loosen KPROBE ties

:::::: TO: Simon Kagstrom <simon.kagstrom@netinsight.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
