Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060217ED
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681961836; x=1713497836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tVy6bBPjgKK/ZKoLllK4Cegr7pp3zvwIN0ntcNpxHE=;
  b=IHtl3af1GaNuEmnJ9TKIEb+5mlPV1SNJgG5mEJNHwQAhD1jz7J27jgi5
   VgRys2VC4OSNqdTJhNRwWzL6CIXvE4zGuoqfX0tw23ozXxJ5lhAmDIZsH
   gmy5JmrbK4XTGIr1Wh2AmOv1tO94VkjHq8Uas78J55U+c0G6w2+KHHhzw
   MvlqB5GYTkwdrp8jbMHEsXUufvY4tcuysmUEhxJOg0dg3ljctYNdNCyty
   90F+hzQSmNh8ptoc0geCaL13+f3R1l578ElQ4bVt4bWgzhPwg4irODP/x
   q4AXg+NoFLsFHhEwglU12D7QSKhW3RkXlOrUHylcwrjsBmuBStZUIJ/hc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334444173"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="334444173"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="866066095"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="866066095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 20:37:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppL6f-000fQC-2O;
	Thu, 20 Apr 2023 03:37:13 +0000
Date: Thu, 20 Apr 2023 11:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/chrome/chromeos_acpi.c:202
 chromeos_attr_show_gpio_0() error: uninitialized symbol 'num'.
Message-ID: <202304201147.zmuhNk0o-lkp@intel.com>
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
head:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
commit: 0a4cad9c11ad46662ede48d94f08ecb7cd9f6916 platform/chrome: Add ChromeOS ACPI device driver
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304201147.zmuhNk0o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304201147.zmuhNk0o-lkp@intel.com/

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

0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  196  
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  197  /*
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  198   * Every platform can have a different number of GPIO attribute groups.
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  199   * Define upper limit groups. At run time, the platform decides to show
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  200   * the present number of groups only, others are hidden.
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  201   */
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @202  GPIO_ATTR_GROUP(gpio0, "GPIO.0", 0)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @203  GPIO_ATTR_GROUP(gpio1, "GPIO.1", 1)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @204  GPIO_ATTR_GROUP(gpio2, "GPIO.2", 2)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @205  GPIO_ATTR_GROUP(gpio3, "GPIO.3", 3)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @206  GPIO_ATTR_GROUP(gpio4, "GPIO.4", 4)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @207  GPIO_ATTR_GROUP(gpio5, "GPIO.5", 5)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @208  GPIO_ATTR_GROUP(gpio6, "GPIO.6", 6)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13 @209  GPIO_ATTR_GROUP(gpio7, "GPIO.7", 7)
0a4cad9c11ad466 Enric Balletbo i Serra 2022-05-13  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
