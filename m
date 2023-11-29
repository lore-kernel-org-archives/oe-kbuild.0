Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA45DF03
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUD1A6hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701282753; x=1732818753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a8Vw7seW+DZSRBZecfNAF+V+3+vJkY8zxio5mIeW+TY=;
  b=TUD1A6hccmV8hZFL6Fc36ODaNy/5U7e6KYCGjLiSeD2W1+WeGDK2hQRU
   K8Te0aq7Pnd9U8A+3mXYDzZohg7pW8lA3rTQKgc/twYbIeRKxvZ3cnFb6
   LQvyiSNL2E7j20UFPW+OlZSxfRxOfSpyDMraXqI6xSxJWdGyqcfjYVTzM
   Eb5nEhlTvN2b8VTPzeHEoK6HGKJZdvwJ6DuOrU9z55ulKjs0fRSpvWUNT
   MZa9j9y5HE3kb69RzFP8nbpoZZKi0nr07uaXVjq/2AFBBplaaV3HIo6Vy
   pt3kXQWHwldIz0+s9ZaoZhdLO7FZWwio7mlMEianFg8KPNnX/Eoba9T6D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="191415"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="191415"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772773868"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="772773868"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 10:32:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8PMJ-0000dI-1Z;
	Wed, 29 Nov 2023 18:32:27 +0000
Date: Thu, 30 Nov 2023 02:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/power/runtime.c:365: warning: Excess function parameter
 'dev' description in '__rpm_callback'
Message-ID: <202311300112.x5xFd09N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/base/power/runtime.c:365: warning: Excess function parameter 'dev' description in '__rpm_callback'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 366bb35a8e48198cefcd3484ac6b2374d1347873 LoongArch: Add suspend (ACPI S3) support
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231130/202311300112.x5xFd09N-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300112.x5xFd09N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311300112.x5xFd09N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/runtime.c:365: warning: Excess function parameter 'dev' description in '__rpm_callback'
--
>> drivers/base/power/domain_governor.c:409: warning: cannot understand function prototype: 'struct dev_power_governor pm_domain_always_on_gov = '

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/nvs.c:140:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *kaddr @@
   drivers/acpi/nvs.c:140:54: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/nvs.c:140:54: sparse:     got void *kaddr
>> drivers/acpi/nvs.c:143:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *kaddr @@
   drivers/acpi/nvs.c:143:66: sparse:     expected void [noderef] __iomem *virt
   drivers/acpi/nvs.c:143:66: sparse:     got void *kaddr
>> drivers/acpi/nvs.c:182:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *kaddr @@     got void [noderef] __iomem * @@
   drivers/acpi/nvs.c:182:38: sparse:     expected void *kaddr
   drivers/acpi/nvs.c:182:38: sparse:     got void [noderef] __iomem *
   drivers/acpi/nvs.c:184:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *kaddr @@     got void [noderef] __iomem * @@
   drivers/acpi/nvs.c:184:46: sparse:     expected void *kaddr
   drivers/acpi/nvs.c:184:46: sparse:     got void [noderef] __iomem *
--
>> drivers/acpi/sleep.c:556:46: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/sleep.c:656:50: sparse: sparse: restricted suspend_state_t degrades to integer
--
>> kernel/power/main.c:133:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:133:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:134:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:134:26: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:136:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:137:62: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:133:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:162:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:162:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:163:54: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:162:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:188:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:188:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:188:39: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:188:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:579:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:579:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:580:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:581:57: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:579:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:608:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:608:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:609:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:608:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:629:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:629:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:635:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:635:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:703:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:703:36: sparse: sparse: restricted suspend_state_t degrades to integer

vim +365 drivers/base/power/runtime.c

21d5c57b372616 Rafael J. Wysocki 2016-10-30  357  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  358  /**
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  359   * __rpm_callback - Run a given runtime PM callback for a given device.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  360   * @cb: Runtime PM callback to run.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  361   * @dev: Device to run the callback for.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  362   */
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  363  static int __rpm_callback(int (*cb)(struct device *), struct device *dev)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  364  	__releases(&dev->power.lock) __acquires(&dev->power.lock)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @365  {
63d00be69348fd Ulf Hansson       2021-06-08  366  	int retval = 0, idx;
0cab893f409c53 Rafael J. Wysocki 2021-03-19  367  	bool use_links = dev->power.links_count > 0;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  368  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  369  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  370  		spin_unlock(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  371  	} else {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  372  		spin_unlock_irq(&dev->power.lock);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  373  
0cab893f409c53 Rafael J. Wysocki 2021-03-19  374  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  375  		 * Resume suppliers if necessary.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  376  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  377  		 * The device's runtime PM status cannot change until this
0cab893f409c53 Rafael J. Wysocki 2021-03-19  378  		 * routine returns, so it is safe to read the status outside of
0cab893f409c53 Rafael J. Wysocki 2021-03-19  379  		 * the lock.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  380  		 */
0cab893f409c53 Rafael J. Wysocki 2021-03-19  381  		if (use_links && dev->power.runtime_status == RPM_RESUMING) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  382  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  383  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  384  			retval = rpm_get_suppliers(dev);
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  385  			if (retval) {
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  386  				rpm_put_suppliers(dev);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  387  				goto fail;
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  388  			}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  389  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  390  			device_links_read_unlock(idx);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  391  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  392  	}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  393  
63d00be69348fd Ulf Hansson       2021-06-08  394  	if (cb)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  395  		retval = cb(dev);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  396  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  397  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  398  		spin_lock(&dev->power.lock);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  399  	} else {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  400  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  401  		 * If the device is suspending and the callback has returned
0cab893f409c53 Rafael J. Wysocki 2021-03-19  402  		 * success, drop the usage counters of the suppliers that have
0cab893f409c53 Rafael J. Wysocki 2021-03-19  403  		 * been reference counted on its resume.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  404  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  405  		 * Do that if resume fails too.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  406  		 */
0cab893f409c53 Rafael J. Wysocki 2021-03-19  407  		if (use_links
0cab893f409c53 Rafael J. Wysocki 2021-03-19  408  		    && ((dev->power.runtime_status == RPM_SUSPENDING && !retval)
0cab893f409c53 Rafael J. Wysocki 2021-03-19  409  		    || (dev->power.runtime_status == RPM_RESUMING && retval))) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  410  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  411  
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  412  			__rpm_put_suppliers(dev, false);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  413  
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  414  fail:
21d5c57b372616 Rafael J. Wysocki 2016-10-30  415  			device_links_read_unlock(idx);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  416  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  417  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  418  		spin_lock_irq(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  419  	}
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  420  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  421  	return retval;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  422  }
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  423  

:::::: The code at line 365 was first introduced by commit
:::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run callbacks under lock for power.irq_safe set

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
