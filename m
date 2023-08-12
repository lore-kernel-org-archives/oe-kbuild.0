Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267FEA0
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691824093; x=1723360093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=moYX/HzEYf1zpSRAVH/yvMSho6kyy/06tOf57RP9u+k=;
  b=bjzP6i9i2AJ9l7Yom8QC3y/CQGC4uWyod8oK7RKHAA87XmsJVHfp45x8
   YksHSqYxmvW82Ko+pQVXJppUBEJTspuHGZUCSBCSCeAlFWzgVTJ6SMPs2
   tx/tPYZVC0v75vuhYJ5VZC7cyJYPDpujnfNjDt9Uts5MF/PY3AKwyS9mu
   hRRhaO6FcFPj2zTCVeRUena4eUkI5pW9aDApQv24A8fdvDS69pFRhxYej
   6V5pd94KjBAFhVmxzXfE3mwymnbhOAlpIOsv19yTvprK2wDVf5xL00Oj2
   0TonVNjiFHKgJI0Ceqz17zvh1GGs+BA83crBKr/02sZbrexGOTWUfzzmr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="351415793"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="351415793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 00:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="762411787"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="762411787"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2023 00:08:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUijF-0008M6-0j;
	Sat, 12 Aug 2023 07:08:05 +0000
Date: Sat, 12 Aug 2023 15:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:for-kernelci 1/2] drivers/watchdog/sa1100_wdt.c:149
 sa1100dog_ioctl() warn: check for integer overflow 'time'
Message-ID: <202308121408.x50QkVgj-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   fa388d0bb6108cf4ced53aadb5f9bca7753954de
commit: 11b42f6418bd440f99d1816557a31cc529645b6a [1/2] watchdog: Enable more drivers for COMPILE_TEST
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-m031-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121408.x50QkVgj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121408.x50QkVgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308121408.x50QkVgj-lkp@intel.com/

smatch warnings:
drivers/watchdog/sa1100_wdt.c:149 sa1100dog_ioctl() warn: check for integer overflow 'time'

vim +/time +149 drivers/watchdog/sa1100_wdt.c

^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  116  
f19e031265dc6e drivers/watchdog/sa1100_wdt.c      Alan Cox            2008-05-19  117  static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
f19e031265dc6e drivers/watchdog/sa1100_wdt.c      Alan Cox            2008-05-19  118  							unsigned long arg)
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  119  {
795b89d207d8ff drivers/char/watchdog/sa1100_wdt.c Samuel Tardieu      2006-09-09  120  	int ret = -ENOTTY;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  121  	int time;
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  122  	void __user *argp = (void __user *)arg;
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  123  	int __user *p = argp;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  124  
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  125  	switch (cmd) {
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  126  	case WDIOC_GETSUPPORT:
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  127  		ret = copy_to_user(argp, &ident,
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  128  				   sizeof(ident)) ? -EFAULT : 0;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  129  		break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  130  
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  131  	case WDIOC_GETSTATUS:
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  132  		ret = put_user(0, p);
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  133  		break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  134  
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  135  	case WDIOC_GETBOOTSTATUS:
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  136  		ret = put_user(boot_status, p);
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  137  		break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  138  
0c06090c9472db drivers/watchdog/sa1100_wdt.c      Wim Van Sebroeck    2008-07-18  139  	case WDIOC_KEEPALIVE:
e86bd43bcfc579 drivers/watchdog/sa1100_wdt.c      Arnd Bergmann       2019-09-08  140  		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
0c06090c9472db drivers/watchdog/sa1100_wdt.c      Wim Van Sebroeck    2008-07-18  141  		ret = 0;
0c06090c9472db drivers/watchdog/sa1100_wdt.c      Wim Van Sebroeck    2008-07-18  142  		break;
0c06090c9472db drivers/watchdog/sa1100_wdt.c      Wim Van Sebroeck    2008-07-18  143  
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  144  	case WDIOC_SETTIMEOUT:
3a69e5791379a7 drivers/char/watchdog/sa1100_wdt.c Ian Campbell        2005-11-07  145  		ret = get_user(time, p);
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  146  		if (ret)
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  147  			break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  148  
a6f052e39c3832 drivers/watchdog/sa1100_wdt.c      Raphael Assenat     2009-06-29 @149  		if (time <= 0 || (oscr_freq * (long long)time >= 0xffffffff)) {
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  150  			ret = -EINVAL;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  151  			break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  152  		}
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  153  
28a623855f737a drivers/watchdog/sa1100_wdt.c      Eric Miao           2008-12-24  154  		pre_margin = oscr_freq * time;
e86bd43bcfc579 drivers/watchdog/sa1100_wdt.c      Arnd Bergmann       2019-09-08  155  		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
bd490f8222510d drivers/watchdog/sa1100_wdt.c      Gustavo A. R. Silva 2020-07-07  156  		fallthrough;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  157  
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  158  	case WDIOC_GETTIMEOUT:
28a623855f737a drivers/watchdog/sa1100_wdt.c      Eric Miao           2008-12-24  159  		ret = put_user(pre_margin / oscr_freq, p);
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  160  		break;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  161  	}
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  162  	return ret;
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  163  }
^1da177e4c3f41 drivers/char/watchdog/sa1100_wdt.c Linus Torvalds      2005-04-16  164  

:::::: The code at line 149 was first introduced by commit
:::::: a6f052e39c3832b5842c4f44d9b3a4295dacfc4a [WATCHDOG] SA1100 watchdog maximum timeout

:::::: TO: Raphael Assenat <raph@8d.com>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
