Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A854666
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxl8Ohyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701385325; x=1732921325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXLgGv3Mohcr9D26+jHEwkpN8/UB8NlHhQyClVvU8v8=;
  b=lxl8OhyvnRb/PanqB8PcbIvRMj3QsSKSIlzsrVANFNpdZb+u+cm92InE
   ualhsqzuKYkOWq6mlMZCycNKTh1KZLxlCnqvm9F1Y3a74N7nIsBsYzoW/
   TWpqdMmoHbuqENzB9Qoz1XZxQ8GnJWUKUO8Bn/0aCwD2PZ+8XICqS6QIy
   EzBg65hXjp4DO5P/BH4fhzdExXCtQ2a6s4VdeRHcXeo8s8u+Y4caYFS5F
   xHlnNnIOqi0H+5xH8oDzNsYzZypJmUDsBMmzYVG0NxN1fW+r3H50ub3hy
   scA2nkstZ2OFT0xrC+/34KlBBcNV9HbVXLnB4ceKA7oTAa4zKgfO1iRS5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378433762"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="378433762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="835563209"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="835563209"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2023 15:02:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8q2j-0002lx-0Z;
	Thu, 30 Nov 2023 23:02:01 +0000
Date: Fri, 1 Dec 2023 07:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect type
 in initializer (incompatible argument 2 (different address spaces))
Message-ID: <202312010633.oPEUSquw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: da2a68b3eb47b9fb071def3f374258b2ce454096 watchdog: Enable COMPILE_TEST where possible
date:   7 years ago
:::::: branch date: 32 hours ago
:::::: commit date: 7 years ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231201/202312010633.oPEUSquw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010633.oPEUSquw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010633.oPEUSquw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/ath79_wdt.c:165:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got char const * @@
   drivers/watchdog/ath79_wdt.c:165:37: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/watchdog/ath79_wdt.c:165:37: sparse:     got char const *
>> drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/ath79_wdt.c:239:27: sparse:     expected int ( *write )( ... )
   drivers/watchdog/ath79_wdt.c:239:27: sparse:     got int ( * )( ... )

vim +239 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos 2011-01-04  152  
f8394f61c66f48 Gabor Juhos 2011-01-04  153  static ssize_t ath79_wdt_write(struct file *file, const char *data,
f8394f61c66f48 Gabor Juhos 2011-01-04  154  				size_t len, loff_t *ppos)
f8394f61c66f48 Gabor Juhos 2011-01-04  155  {
f8394f61c66f48 Gabor Juhos 2011-01-04  156  	if (len) {
f8394f61c66f48 Gabor Juhos 2011-01-04  157  		if (!nowayout) {
f8394f61c66f48 Gabor Juhos 2011-01-04  158  			size_t i;
f8394f61c66f48 Gabor Juhos 2011-01-04  159  
f8394f61c66f48 Gabor Juhos 2011-01-04  160  			clear_bit(WDT_FLAGS_EXPECT_CLOSE, &wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  161  
f8394f61c66f48 Gabor Juhos 2011-01-04  162  			for (i = 0; i != len; i++) {
f8394f61c66f48 Gabor Juhos 2011-01-04  163  				char c;
f8394f61c66f48 Gabor Juhos 2011-01-04  164  
f8394f61c66f48 Gabor Juhos 2011-01-04 @165  				if (get_user(c, data + i))
f8394f61c66f48 Gabor Juhos 2011-01-04  166  					return -EFAULT;
f8394f61c66f48 Gabor Juhos 2011-01-04  167  
f8394f61c66f48 Gabor Juhos 2011-01-04  168  				if (c == 'V')
f8394f61c66f48 Gabor Juhos 2011-01-04  169  					set_bit(WDT_FLAGS_EXPECT_CLOSE,
f8394f61c66f48 Gabor Juhos 2011-01-04  170  						&wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  171  			}
f8394f61c66f48 Gabor Juhos 2011-01-04  172  		}
f8394f61c66f48 Gabor Juhos 2011-01-04  173  
f8394f61c66f48 Gabor Juhos 2011-01-04  174  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  175  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  176  
f8394f61c66f48 Gabor Juhos 2011-01-04  177  	return len;
f8394f61c66f48 Gabor Juhos 2011-01-04  178  }
f8394f61c66f48 Gabor Juhos 2011-01-04  179  
f8394f61c66f48 Gabor Juhos 2011-01-04  180  static const struct watchdog_info ath79_wdt_info = {
f8394f61c66f48 Gabor Juhos 2011-01-04  181  	.options		= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
f8394f61c66f48 Gabor Juhos 2011-01-04  182  				  WDIOF_MAGICCLOSE | WDIOF_CARDRESET,
f8394f61c66f48 Gabor Juhos 2011-01-04  183  	.firmware_version	= 0,
f8394f61c66f48 Gabor Juhos 2011-01-04  184  	.identity		= "ATH79 watchdog",
f8394f61c66f48 Gabor Juhos 2011-01-04  185  };
f8394f61c66f48 Gabor Juhos 2011-01-04  186  
f8394f61c66f48 Gabor Juhos 2011-01-04  187  static long ath79_wdt_ioctl(struct file *file, unsigned int cmd,
f8394f61c66f48 Gabor Juhos 2011-01-04  188  			    unsigned long arg)
f8394f61c66f48 Gabor Juhos 2011-01-04  189  {
f8394f61c66f48 Gabor Juhos 2011-01-04  190  	void __user *argp = (void __user *)arg;
f8394f61c66f48 Gabor Juhos 2011-01-04  191  	int __user *p = argp;
f8394f61c66f48 Gabor Juhos 2011-01-04  192  	int err;
f8394f61c66f48 Gabor Juhos 2011-01-04  193  	int t;
f8394f61c66f48 Gabor Juhos 2011-01-04  194  
f8394f61c66f48 Gabor Juhos 2011-01-04  195  	switch (cmd) {
f8394f61c66f48 Gabor Juhos 2011-01-04  196  	case WDIOC_GETSUPPORT:
f8394f61c66f48 Gabor Juhos 2011-01-04  197  		err = copy_to_user(argp, &ath79_wdt_info,
f8394f61c66f48 Gabor Juhos 2011-01-04  198  				   sizeof(ath79_wdt_info)) ? -EFAULT : 0;
f8394f61c66f48 Gabor Juhos 2011-01-04  199  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  200  
f8394f61c66f48 Gabor Juhos 2011-01-04  201  	case WDIOC_GETSTATUS:
f8394f61c66f48 Gabor Juhos 2011-01-04  202  		err = put_user(0, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  203  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  204  
f8394f61c66f48 Gabor Juhos 2011-01-04  205  	case WDIOC_GETBOOTSTATUS:
f8394f61c66f48 Gabor Juhos 2011-01-04  206  		err = put_user(boot_status, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  207  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  208  
f8394f61c66f48 Gabor Juhos 2011-01-04  209  	case WDIOC_KEEPALIVE:
f8394f61c66f48 Gabor Juhos 2011-01-04  210  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  211  		err = 0;
f8394f61c66f48 Gabor Juhos 2011-01-04  212  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  213  
f8394f61c66f48 Gabor Juhos 2011-01-04  214  	case WDIOC_SETTIMEOUT:
f8394f61c66f48 Gabor Juhos 2011-01-04  215  		err = get_user(t, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  216  		if (err)
f8394f61c66f48 Gabor Juhos 2011-01-04  217  			break;
f8394f61c66f48 Gabor Juhos 2011-01-04  218  
f8394f61c66f48 Gabor Juhos 2011-01-04  219  		err = ath79_wdt_set_timeout(t);
f8394f61c66f48 Gabor Juhos 2011-01-04  220  		if (err)
f8394f61c66f48 Gabor Juhos 2011-01-04  221  			break;
f8394f61c66f48 Gabor Juhos 2011-01-04  222  
f8394f61c66f48 Gabor Juhos 2011-01-04  223  		/* fallthrough */
f8394f61c66f48 Gabor Juhos 2011-01-04  224  	case WDIOC_GETTIMEOUT:
f8394f61c66f48 Gabor Juhos 2011-01-04  225  		err = put_user(timeout, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  226  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  227  
f8394f61c66f48 Gabor Juhos 2011-01-04  228  	default:
f8394f61c66f48 Gabor Juhos 2011-01-04  229  		err = -ENOTTY;
f8394f61c66f48 Gabor Juhos 2011-01-04  230  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  231  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  232  
f8394f61c66f48 Gabor Juhos 2011-01-04  233  	return err;
f8394f61c66f48 Gabor Juhos 2011-01-04  234  }
f8394f61c66f48 Gabor Juhos 2011-01-04  235  
f8394f61c66f48 Gabor Juhos 2011-01-04  236  static const struct file_operations ath79_wdt_fops = {
f8394f61c66f48 Gabor Juhos 2011-01-04  237  	.owner		= THIS_MODULE,
f8394f61c66f48 Gabor Juhos 2011-01-04  238  	.llseek		= no_llseek,
f8394f61c66f48 Gabor Juhos 2011-01-04 @239  	.write		= ath79_wdt_write,
f8394f61c66f48 Gabor Juhos 2011-01-04  240  	.unlocked_ioctl	= ath79_wdt_ioctl,
f8394f61c66f48 Gabor Juhos 2011-01-04  241  	.open		= ath79_wdt_open,
f8394f61c66f48 Gabor Juhos 2011-01-04  242  	.release	= ath79_wdt_release,
f8394f61c66f48 Gabor Juhos 2011-01-04  243  };
f8394f61c66f48 Gabor Juhos 2011-01-04  244  

:::::: The code at line 239 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for the Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
