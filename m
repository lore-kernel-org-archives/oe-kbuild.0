Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8917729
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiXXx4WD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702750603; x=1734286603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBUjZv2xkaH9jxGZVvUmTcd9tYeAsE9mTba6tm/unfc=;
  b=FiXXx4WD79Kcf9qpQIIoX5dPx9s7MeufeKonBsJbnf6t6x2jei2dBoz6
   ZUaRbkNOY1H+jUjMwK4DaX2gOjBFivYUVHiO6RxdTPCN0FSyfuRtjlL7V
   WL1l+dyXdSlXK+aWEWpgvTQLAnGJdNFkKiYJdd618gnB/MX8UUpD817pH
   WR/jzjiln9YZ9RMLpH05QJF8rbzR6m2iSzSTecWgYvvRyl4Csh1xhtmr3
   eshCREFqRg9P5IgtlojXHwmLKWGYozMeGvO66C2P0jnxpJIvmaOQA4Me7
   4gdXKXRlES1IbgMAvzoamJIJyXZq3Nh8VOuMVElHPOCD53luteNInG+Ep
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8741947"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="8741947"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 10:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778628143"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="778628143"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 10:16:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEZDK-00020U-1V;
	Sat, 16 Dec 2023 18:16:38 +0000
Date: Sun, 17 Dec 2023 02:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 08/12] usb: yurex: Replace snprintf() with the safer
 scnprintf() variant
Message-ID: <202312170252.3udgrIcP-lkp@intel.com>
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
In-Reply-To: <20231213164246.1021885-9-lee@kernel.org>
References: <20231213164246.1021885-9-lee@kernel.org>
TO: Lee Jones <lee@kernel.org>

Hi Lee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus lee-leds/for-leds-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Jones/usb-gadget-configfs-Replace-snprintf-with-the-safer-scnprintf-variant/20231214-004543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231213164246.1021885-9-lee%40kernel.org
patch subject: [PATCH 08/12] usb: yurex: Replace snprintf() with the safer scnprintf() variant
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170252.3udgrIcP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312170252.3udgrIcP-lkp@intel.com/

smatch warnings:
drivers/usb/misc/yurex.c:425 yurex_read() warn: inconsistent returns '&dev->io_mutex'.

vim +425 drivers/usb/misc/yurex.c

6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  400  
1cc373c654acde Sudip Mukherjee  2014-10-10  401  static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
1cc373c654acde Sudip Mukherjee  2014-10-10  402  			  loff_t *ppos)
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  403  {
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  404  	struct usb_yurex *dev;
f1e255d60ae66a Jann Horn        2018-07-06  405  	int len = 0;
d9c494521b9f1e Lee Jones        2023-12-13  406  	char in_buffer[MAX_S64_STRLEN];
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  407  	unsigned long flags;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  408  
113ad911ad4a1c Arjun Sreedharan 2014-08-19  409  	dev = file->private_data;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  410  
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  411  	mutex_lock(&dev->io_mutex);
aafb00a977cf7d Johan Hovold     2019-10-09  412  	if (dev->disconnected) {		/* already disconnected */
f1e255d60ae66a Jann Horn        2018-07-06  413  		mutex_unlock(&dev->io_mutex);
f1e255d60ae66a Jann Horn        2018-07-06  414  		return -ENODEV;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  415  	}
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  416  
d9c494521b9f1e Lee Jones        2023-12-13  417  	if (WARN_ON_ONCE(dev->bbu > S64_MAX || dev->bbu < S64_MIN))
d9c494521b9f1e Lee Jones        2023-12-13  418  		return -EIO;
d9c494521b9f1e Lee Jones        2023-12-13  419  
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  420  	spin_lock_irqsave(&dev->lock, flags);
d9c494521b9f1e Lee Jones        2023-12-13  421  	scnprintf(in_buffer, MAX_S64_STRLEN, "%lld\n", dev->bbu);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  422  	spin_unlock_irqrestore(&dev->lock, flags);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  423  	mutex_unlock(&dev->io_mutex);
f1e255d60ae66a Jann Horn        2018-07-06  424  
f1e255d60ae66a Jann Horn        2018-07-06 @425  	return simple_read_from_buffer(buffer, count, ppos, in_buffer, len);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  426  }
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
