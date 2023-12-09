Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC939125CC
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htlHrzEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702119855; x=1733655855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0eBqN74YLOowtqqoLRhYMmNBELThYztnY1/NDjFCr8M=;
  b=htlHrzEloygepHgyu9ZDgqqUe3KjyHRbZUij5d8CUbZrAbVasyQVaQOi
   wrgFjtKN7QuWmOrJBm3KO+JQ0tkXjV/1mjXcM3LzeSIdjX84caB09Jgky
   RsFGGdUaQI8BszGv4QwbvDFzMEsb88bei6yBr6C2yUGKHwmlwmqWjNT2S
   tans1zfgszRVUSVX+GOBzWHYG3QBcNGgGuCgQGrrKRsNyxbnhnySjM5P8
   XWNAh/rDmZ8RtnPs56IwWSTyKCysowDn0AF/Ynlp8JzarDOPykcQpSawB
   42ectb+HK3Jp8uUcH4R0vHlXlQ3G58BGKMZRXa8ULnIr1b3Zb1Xs0vPMe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7864097"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="7864097"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 03:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="765773720"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="765773720"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2023 03:04:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBv7W-000FFZ-1D;
	Sat, 09 Dec 2023 11:04:07 +0000
Date: Sat, 9 Dec 2023 19:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312091851.OVvu4Nax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only include/linux/compiler_types.h file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines by functionality
date:   3 years, 4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 years, 4 months ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231209/202312091851.OVvu4Nax-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091851.OVvu4Nax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312091851.OVvu4Nax-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got char const * @@
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     got char const *
   drivers/watchdog/ath79_wdt.c:235:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     expected int ( *write )( ... )
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     got int ( * )( ... )

vim +161 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos 2011-01-04  148  
f8394f61c66f48 Gabor Juhos 2011-01-04  149  static ssize_t ath79_wdt_write(struct file *file, const char *data,
f8394f61c66f48 Gabor Juhos 2011-01-04  150  				size_t len, loff_t *ppos)
f8394f61c66f48 Gabor Juhos 2011-01-04  151  {
f8394f61c66f48 Gabor Juhos 2011-01-04  152  	if (len) {
f8394f61c66f48 Gabor Juhos 2011-01-04  153  		if (!nowayout) {
f8394f61c66f48 Gabor Juhos 2011-01-04  154  			size_t i;
f8394f61c66f48 Gabor Juhos 2011-01-04  155  
f8394f61c66f48 Gabor Juhos 2011-01-04  156  			clear_bit(WDT_FLAGS_EXPECT_CLOSE, &wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  157  
f8394f61c66f48 Gabor Juhos 2011-01-04  158  			for (i = 0; i != len; i++) {
f8394f61c66f48 Gabor Juhos 2011-01-04  159  				char c;
f8394f61c66f48 Gabor Juhos 2011-01-04  160  
f8394f61c66f48 Gabor Juhos 2011-01-04 @161  				if (get_user(c, data + i))
f8394f61c66f48 Gabor Juhos 2011-01-04  162  					return -EFAULT;
f8394f61c66f48 Gabor Juhos 2011-01-04  163  
f8394f61c66f48 Gabor Juhos 2011-01-04  164  				if (c == 'V')
f8394f61c66f48 Gabor Juhos 2011-01-04  165  					set_bit(WDT_FLAGS_EXPECT_CLOSE,
f8394f61c66f48 Gabor Juhos 2011-01-04  166  						&wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  167  			}
f8394f61c66f48 Gabor Juhos 2011-01-04  168  		}
f8394f61c66f48 Gabor Juhos 2011-01-04  169  
f8394f61c66f48 Gabor Juhos 2011-01-04  170  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  171  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  172  
f8394f61c66f48 Gabor Juhos 2011-01-04  173  	return len;
f8394f61c66f48 Gabor Juhos 2011-01-04  174  }
f8394f61c66f48 Gabor Juhos 2011-01-04  175  

:::::: The code at line 161 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for the Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
