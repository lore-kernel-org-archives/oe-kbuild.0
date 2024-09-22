Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A370A22338
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727025245; cv=none; b=rNBlQelCEhvIi+E5UXMY/pGJEBzVvb6SPeanI4MTEGtlZRsFUB4Bu4JNqLfr92/X8pLGjpBzlLPxwqsaHaTa709IZeTEsWtYgvMeFmIipPYgUfCaBTo5ebJ5N/FqKYUnyapaGdHJ9usrC3iUZmuMPGEISDOD7cqkgCnH6Ku9RF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727025245; c=relaxed/simple;
	bh=1Yf53lrwews5SRH/IPzwTjFhAtYiCc5GJPPu9XgdFgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkfFIaalabqm771o3jTQj9jyoDl/p5fVrdBLUyKfC8QsIbtzVuXUPfOUpd3rMwAujJBXG1ZsYIuDCVSN+wHekC+/LZk06evihCEWqatguZv96kDM6KLPc9alODAlFdD5LXTh3NMdi/nCXLOCvLFgZu60Qva2+o6zDJeagpF4Ho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyQvRCEa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyQvRCEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727025244; x=1758561244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Yf53lrwews5SRH/IPzwTjFhAtYiCc5GJPPu9XgdFgA=;
  b=EyQvRCEaP8eNW0A8IQuatdRdadEC6mOhF5+ZGakPjTRzXrPcsT6GZOFC
   EFO3ZZofpWxcIJ2K4ihJ3R4sgSL0qCxhgo9xskcXyjH565gJWXjv+O93N
   rjqWQ0q2cqwEFLpLFcUEV1N7CMTR6iQqwtqfSPjcGupGfHjIY5NcQYCCL
   WdMCZzqveENzoI87UFgEjaptIV5Qe3odUMOdhiPi4DB2Id7M9HZyrg2ip
   PwBbBxKMJIXKInflJI4zQsfqi09jgLKvU/IOMB4eKnYXuPKZ8E2fmCDtM
   zU7mi0pQreZPwwU5vQx0JUlR0Qn2mR52BjWNa+6eiFkIHf9qALl7SkSx/
   Q==;
X-CSE-ConnectionGUID: HAQEhz0pT/25hn8Ob07iVw==
X-CSE-MsgGUID: TO2/Hl9TTzWHFF4/7PDlWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25797841"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25797841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 10:14:03 -0700
X-CSE-ConnectionGUID: jgWj6GajSbG50K1vfcTaCw==
X-CSE-MsgGUID: PmPTZnIORCiSg3QtOrTTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75611378"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2024 10:14:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssQ9n-000GWk-0a;
	Sun, 22 Sep 2024 17:13:59 +0000
Date: Mon, 23 Sep 2024 01:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <202409230158.XhvhLOyY-lkp@intel.com>
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
In-Reply-To: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
References: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
TO: Mary Strodl <mstrodl@csh.rit.edu>
TO: linux-kernel@vger.kernel.org
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org
CC: Mary Strodl <mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-add-support-for-FTDI-s-MPSSE-as-GPIO/20240919-221626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240919141014.4000958-1-mstrodl%40csh.rit.edu
patch subject: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230158.XhvhLOyY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230158.XhvhLOyY-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mpsse.c:211 gpio_mpsse_get_multiple() warn: inconsistent returns '&priv->io_mutex'.

vim +211 drivers/gpio/gpio-mpsse.c

be777399e9baea Mary Strodl 2024-09-19  189  
be777399e9baea Mary Strodl 2024-09-19  190  static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long *mask,
be777399e9baea Mary Strodl 2024-09-19  191  				   unsigned long *bits)
be777399e9baea Mary Strodl 2024-09-19  192  {
be777399e9baea Mary Strodl 2024-09-19  193  	unsigned long i, bank, bank_mask;
be777399e9baea Mary Strodl 2024-09-19  194  	int ret;
be777399e9baea Mary Strodl 2024-09-19  195  	struct mpsse_priv *priv = gpiochip_get_data(chip);
be777399e9baea Mary Strodl 2024-09-19  196  
be777399e9baea Mary Strodl 2024-09-19  197  	mutex_lock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  198  	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
be777399e9baea Mary Strodl 2024-09-19  199  		bank = i / 8;
be777399e9baea Mary Strodl 2024-09-19  200  
be777399e9baea Mary Strodl 2024-09-19  201  		if (bank_mask) {
be777399e9baea Mary Strodl 2024-09-19  202  			ret = gpio_mpsse_get_bank(priv, bank);
be777399e9baea Mary Strodl 2024-09-19  203  			if (ret < 0)
be777399e9baea Mary Strodl 2024-09-19  204  				return ret;
be777399e9baea Mary Strodl 2024-09-19  205  
be777399e9baea Mary Strodl 2024-09-19  206  			bitmap_set_value8(bits, ret & bank_mask, i);
be777399e9baea Mary Strodl 2024-09-19  207  		}
be777399e9baea Mary Strodl 2024-09-19  208  	}
be777399e9baea Mary Strodl 2024-09-19  209  	mutex_unlock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  210  
be777399e9baea Mary Strodl 2024-09-19 @211  	return 0;
be777399e9baea Mary Strodl 2024-09-19  212  }
be777399e9baea Mary Strodl 2024-09-19  213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
