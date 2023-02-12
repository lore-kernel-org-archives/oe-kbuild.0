Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA4FA4E
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 06:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676183680; x=1707719680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXjFAzW7yZci7QGjGVPA+UwhMSFtphWB0fwvHdjHF1U=;
  b=dqzTMuilj0h73yUI7G0O7amYahrJ5KucuFENDHIGP6U2ZSktECmIvccr
   zfO3Ye+DYv8T5UQE8Xr65M3LWtrFHT+kZg7F0Ud761Va8XBDSr2dAiuxN
   MdaeUMpLEHAxRIahVUoZ+j6tXa9yua6tk/3w9Wf32ejYvYad7pHb5n8cv
   VCw3pEWpuIfCGbrTCNISRjQ0hHv4UjnOxZakgP16InJBKflKvQtOF3woA
   csnCI9yUm5ZMAPDM1XPGKU9iSF4fBr67N7RfSm8+EKwMwPIousoXd0uCB
   Enu5IDrDrUq13PwyT8+D1jNdU76LChEM1ihO2zgprKalZnB2g8y4GcFJu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314335323"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314335323"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 22:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="670445943"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="670445943"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Feb 2023 22:34:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR5wc-00076P-19;
	Sun, 12 Feb 2023 06:34:38 +0000
Date: Sun, 12 Feb 2023 14:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/chrome/chromeos_acpi.c:202
 chromeos_attr_show_gpio_0() error: uninitialized symbol 'num'.
Message-ID: <202302121414.37lJ86g5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: "Tzung-Bi Shih" <tzungbi@kernel.org>
CC: Guenter Roeck <groeck@chromium.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f339c2597ebb00e738f2b6328c14804ed19f5d57
commit: 0a4cad9c11ad46662ede48d94f08ecb7cd9f6916 platform/chrome: Add ChromeOS ACPI device driver
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: ia64-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230212/202302121414.37lJ86g5-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302121414.37lJ86g5-lkp@intel.com/

smatch warnings:
drivers/platform/chrome/chromeos_acpi.c:202 chromeos_attr_show_gpio_0() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:203 chromeos_attr_show_gpio_1() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:204 chromeos_attr_show_gpio_2() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:205 chromeos_attr_show_gpio_3() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:206 chromeos_attr_show_gpio_4() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:207 chromeos_attr_show_gpio_5() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:208 chromeos_attr_show_gpio_6() error: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:209 chromeos_attr_show_gpio_7() error: uninitialized symbol 'num'.

vim +/num +202 drivers/platform/chrome/chromeos_acpi.c

0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  196  
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  197  /*
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  198   * Every platform can have a different number of GPIO attribute groups.
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  199   * Define upper limit groups. At run time, the platform decides to show
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  200   * the present number of groups only, others are hidden.
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  201   */
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @202  GPIO_ATTR_GROUP(gpio0, "GPIO.0", 0)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @203  GPIO_ATTR_GROUP(gpio1, "GPIO.1", 1)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @204  GPIO_ATTR_GROUP(gpio2, "GPIO.2", 2)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @205  GPIO_ATTR_GROUP(gpio3, "GPIO.3", 3)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @206  GPIO_ATTR_GROUP(gpio4, "GPIO.4", 4)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @207  GPIO_ATTR_GROUP(gpio5, "GPIO.5", 5)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @208  GPIO_ATTR_GROUP(gpio6, "GPIO.6", 6)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @209  GPIO_ATTR_GROUP(gpio7, "GPIO.7", 7)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
