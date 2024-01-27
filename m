Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982BD8F40
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706319120; cv=none; b=Y28rPqQCk/Hgj/7x+TDTq3Ake2NdBElWzOyy/MUF0ZPbYU4Bt6wr8D3TGjwNqavMJvGghAJ2xXNGspt99LvHBn86L8VdONqAZRdFWgQmN8wmhzN/ZlLvTikup+2RotKuKd57zBCm8Qq7wSAX5Fgz7JGtyVaEClSRtUPusuwWdIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706319120; c=relaxed/simple;
	bh=TMZxuHeOzlOaMec7u/cewAHYIlN4/ZNRiTGbB+1qQYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXcck1p/ukbH3+lW/CfQQR91yZMJqeD2Y2X+LGyR5d9N5dXkpAndLQq9xhdo+FjEIGWYKMLbMpsP0ZDWIYorp3jbku42yxjWgYF2ySbwmgQdqSDDKsHyTrwKSy24vNecCJyldwBAdavKBUdb+ZUrUVZAoVglAT+VpoxU/8QMW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STQjKM7n; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STQjKM7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706319118; x=1737855118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMZxuHeOzlOaMec7u/cewAHYIlN4/ZNRiTGbB+1qQYU=;
  b=STQjKM7nDhJjnif4stppExgpL9RgZT5K9wjrD/Z1kVmofQ0ZUtrVmeuj
   8THnfia6MvX7EhJzyQMYBjUbpyLRdMafMuh5kYhe80w2ti+kEq7l7rmOC
   yITjZ7ImCvVSQIyj7ISPKccIzw2ip+oPGGI3pYOL8sdp8KDDQJ0nRgipi
   BpQOx5M5ssjCs9tEBA8H4+LxeBkAxNcKzSrTaIOEFaxoTA5FwK0x9qn7R
   /PatE0/At5Nu1TE4bzlJJZflMnawdDY7+LpnEm1DlE57mhBuULio7s5mP
   hIhJ0prh9B6Bnf9sCjzbw6X1unSffzDRUrgT1H9FJwCouUKKl4rp5yXdg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433778882"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433778882"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 17:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906480439"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="906480439"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2024 17:31:56 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTXY2-0001Wo-2m;
	Sat, 27 Jan 2024 01:31:54 +0000
Date: Sat, 27 Jan 2024 09:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/watchdog/at91rm9200_wdt.c:221:27: sparse: sparse: incorrect
 type in initializer (incompatible argument 2 (different address spaces))
Message-ID: <202401270907.itiKvpMj-lkp@intel.com>
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
head:   3a5879d495b226d0404098e3564462d5f1daa33b
commit: da2a68b3eb47b9fb071def3f374258b2ce454096 watchdog: Enable COMPILE_TEST where possible
date:   7 years ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 years ago
config: openrisc-randconfig-s041-20230115 (https://download.01.org/0day-ci/archive/20240127/202401270907.itiKvpMj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240127/202401270907.itiKvpMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401270907.itiKvpMj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/at91rm9200_wdt.c:171:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *argp @@
   drivers/watchdog/at91rm9200_wdt.c:171:37: sparse:     expected void *to
   drivers/watchdog/at91rm9200_wdt.c:171:37: sparse:     got void [noderef] <asn:1> *argp
   drivers/watchdog/at91rm9200_wdt.c:175:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *__pu_addr @@     got int [noderef] <asn:1> *p @@
   drivers/watchdog/at91rm9200_wdt.c:175:24: sparse:     expected int *__pu_addr
   drivers/watchdog/at91rm9200_wdt.c:175:24: sparse:     got int [noderef] <asn:1> *p
   drivers/watchdog/at91rm9200_wdt.c:177:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const *__gu_addr @@     got int [noderef] <asn:1> *p @@
   drivers/watchdog/at91rm9200_wdt.c:177:21: sparse:     expected int const *__gu_addr
   drivers/watchdog/at91rm9200_wdt.c:177:21: sparse:     got int [noderef] <asn:1> *p
   drivers/watchdog/at91rm9200_wdt.c:188:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const *__gu_addr @@     got int [noderef] <asn:1> *p @@
   drivers/watchdog/at91rm9200_wdt.c:188:21: sparse:     expected int const *__gu_addr
   drivers/watchdog/at91rm9200_wdt.c:188:21: sparse:     got int [noderef] <asn:1> *p
   drivers/watchdog/at91rm9200_wdt.c:195:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *__pu_addr @@     got int [noderef] <asn:1> *p @@
   drivers/watchdog/at91rm9200_wdt.c:195:24: sparse:     expected int *__pu_addr
   drivers/watchdog/at91rm9200_wdt.c:195:24: sparse:     got int [noderef] <asn:1> *p
   drivers/watchdog/at91rm9200_wdt.c:197:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *__pu_addr @@     got int [noderef] <asn:1> *p @@
   drivers/watchdog/at91rm9200_wdt.c:197:24: sparse:     expected int *__pu_addr
   drivers/watchdog/at91rm9200_wdt.c:197:24: sparse:     got int [noderef] <asn:1> *p
>> drivers/watchdog/at91rm9200_wdt.c:221:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/at91rm9200_wdt.c:221:27: sparse:     expected int ( *write )( ... )
   drivers/watchdog/at91rm9200_wdt.c:221:27: sparse:     got int ( * )( ... )
   In file included from include/linux/kernel.h:11,
                    from include/linux/delay.h:10,
                    from drivers/watchdog/at91rm9200_wdt.c:15:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~
   In file included from drivers/watchdog/at91rm9200_wdt.c:24:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'at91_wdt_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:340:1: note: in expansion of macro 'module_exit'
     340 | module_exit(at91_wdt_exit);
         | ^~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:334:20: note: 'cleanup_module' target declared here
     334 | static void __exit at91_wdt_exit(void)
         |                    ^~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'at91_wdt_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:339:1: note: in expansion of macro 'module_init'
     339 | module_init(at91_wdt_init);
         | ^~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:321:19: note: 'init_module' target declared here
     321 | static int __init at91_wdt_init(void)
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:5,
                    from drivers/watchdog/at91rm9200_wdt.c:31:
   drivers/watchdog/at91rm9200_wdt.c: In function 'at91_wdt_ioctl':
   arch/openrisc/include/asm/uaccess.h:237:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     237 |         __asm__ __volatile__(                           52-      |         ^~~~~~~
   arch/openrisc/include/asm/uaccess.h:214:17: note: in expansion of macro '__get_user_asm2'
     214 |         case 8: __get_user_asm2(x, ptr, retval);                        55-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:200:17: note: in expansion of macro '__get_user_size'
     200 |                 __get_user_size(__gu_val, __gu_addr, (size), __gu_err); 58-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:104:9: note: in expansion of macro '__get_user_check'
     104 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:177:21: note: in expansion of macro 'get_user'
     177 |                 if (get_user(new_value, p))
         |                     ^~~~~~~~
   arch/openrisc/include/asm/uaccess.h:215:9: note: here
     215 |         default: (x) = __get_user_bad();                                67-      |         ^~~~~~~
   arch/openrisc/include/asm/uaccess.h:200:17: note: in expansion of macro '__get_user_size'
     200 |                 __get_user_size(__gu_val, __gu_addr, (size), __gu_err); 70-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:104:9: note: in expansion of macro '__get_user_check'
     104 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:177:21: note: in expansion of macro 'get_user'
     177 |                 if (get_user(new_value, p))
         |                     ^~~~~~~~
   arch/openrisc/include/asm/uaccess.h:237:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     237 |         __asm__ __volatile__(                           79-      |         ^~~~~~~
   arch/openrisc/include/asm/uaccess.h:214:17: note: in expansion of macro '__get_user_asm2'
     214 |         case 8: __get_user_asm2(x, ptr, retval);                        82-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:200:17: note: in expansion of macro '__get_user_size'
     200 |                 __get_user_size(__gu_val, __gu_addr, (size), __gu_err); 85-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:104:9: note: in expansion of macro '__get_user_check'
     104 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:188:21: note: in expansion of macro 'get_user'
     188 |                 if (get_user(new_value, p))
         |                     ^~~~~~~~
   arch/openrisc/include/asm/uaccess.h:215:9: note: here
     215 |         default: (x) = __get_user_bad();                                94-      |         ^~~~~~~
   arch/openrisc/include/asm/uaccess.h:200:17: note: in expansion of macro '__get_user_size'
     200 |                 __get_user_size(__gu_val, __gu_addr, (size), __gu_err); 97-      |                 ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:104:9: note: in expansion of macro '__get_user_check'
     104 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~~~~
   drivers/watchdog/at91rm9200_wdt.c:188:21: note: in expansion of macro 'get_user'
     188 |                 if (get_user(new_value, p))
         |                     ^~~~~~~~

vim +221 drivers/watchdog/at91rm9200_wdt.c

853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  158  
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  159  /*
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  160   * Handle commands from user-space.
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  161   */
3c4fafd65055d1 drivers/watchdog/at91rm9200_wdt.c Adrian Bunk      2008-08-08  162  static long at91_wdt_ioctl(struct file *file,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  163  					unsigned int cmd, unsigned long arg)
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  164  {
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  165  	void __user *argp = (void __user *)arg;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  166  	int __user *p = argp;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  167  	int new_value;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  168  
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  169  	switch (cmd) {
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  170  	case WDIOC_GETSUPPORT:
2760600da2a13d drivers/watchdog/at91rm9200_wdt.c Alan Cox         2008-05-19  171  		return copy_to_user(argp, &at91_wdt_info,
2760600da2a13d drivers/watchdog/at91rm9200_wdt.c Alan Cox         2008-05-19  172  				sizeof(at91_wdt_info)) ? -EFAULT : 0;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  173  	case WDIOC_GETSTATUS:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  174  	case WDIOC_GETBOOTSTATUS:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  175  		return put_user(0, p);
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  176  	case WDIOC_SETOPTIONS:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  177  		if (get_user(new_value, p))
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  178  			return -EFAULT;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  179  		if (new_value & WDIOS_DISABLECARD)
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  180  			at91_wdt_stop();
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  181  		if (new_value & WDIOS_ENABLECARD)
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  182  			at91_wdt_start();
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  183  		return 0;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  184  	case WDIOC_KEEPALIVE:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  185  		at91_wdt_reload();	/* pat the watchdog */
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  186  		return 0;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  187  	case WDIOC_SETTIMEOUT:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14 @188  		if (get_user(new_value, p))
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  189  			return -EFAULT;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  190  		if (at91_wdt_settimeout(new_value))
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  191  			return -EINVAL;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  192  		/* Enable new time value */
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  193  		at91_wdt_start();
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  194  		/* Return current value */
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  195  		return put_user(wdt_time, p);
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  196  	case WDIOC_GETTIMEOUT:
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  197  		return put_user(wdt_time, p);
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  198  	default:
795b89d207d8ff drivers/char/watchdog/at91_wdt.c  Samuel Tardieu   2006-09-09  199  		return -ENOTTY;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  200  	}
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  201  }
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  202  
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  203  /*
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  204   * Pat the watchdog whenever device is written to.
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  205   */
2760600da2a13d drivers/watchdog/at91rm9200_wdt.c Alan Cox         2008-05-19  206  static ssize_t at91_wdt_write(struct file *file, const char *data,
2760600da2a13d drivers/watchdog/at91rm9200_wdt.c Alan Cox         2008-05-19  207  						size_t len, loff_t *ppos)
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  208  {
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  209  	at91_wdt_reload();		/* pat the watchdog */
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  210  	return len;
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  211  }
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  212  
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  213  /* ......................................................................... */
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  214  
62322d2554d2f9 drivers/char/watchdog/at91_wdt.c  Arjan van de Ven 2006-07-03  215  static const struct file_operations at91wdt_fops = {
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  216  	.owner		= THIS_MODULE,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  217  	.llseek		= no_llseek,
2760600da2a13d drivers/watchdog/at91rm9200_wdt.c Alan Cox         2008-05-19  218  	.unlocked_ioctl	= at91_wdt_ioctl,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  219  	.open		= at91_wdt_open,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  220  	.release	= at91_wdt_close,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14 @221  	.write		= at91_wdt_write,
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  222  };
853807fb500a94 drivers/char/watchdog/at91_wdt.c  Andrew Victor    2006-03-14  223  

:::::: The code at line 221 was first introduced by commit
:::::: 853807fb500a9442d88646b7be92bfa51334f8e8 [WATCHDOG] at91_wdt.c - Atmel AT91RM9200 watchdog driver

:::::: TO: Andrew Victor <andrew@sanpeople.com>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
