Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71133B6D1
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792429; cv=none; b=SGVne3gAuoG4gP5OFPLu3FnneY0OY4llD5/EQpQta9XHO0rczfLa0gm3+nMLNUSZYDo5QyuVFV/5IkLxCVOahMM7+zOT8e1i0UDo7MU4qB8ttWSbRM8tmSgSudkkQ5XVPonpdfvU7l6D3MOx2czORrcTi7uDHknv80g/5nW8JxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792429; c=relaxed/simple;
	bh=KQcarlRRa2LKL9L0+Ax5J49XTgySGr7sTK5uNyZx2DU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgfJPASQNAQ9ory8sJ8NW7DfjntzofsiwruUxJ2zb8Asy2nG5qBg5am4zbgjm/ALcopAZtHYKA5DWrBqCcObeWvSt40hgisFw5oTtb93OG96t2w37f3s1azid6rTDPzJVDIm4EWKHecUdFRqPxVUDN5CE+tRCdsrMf8d2twFnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjRiA+ME; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjRiA+ME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772792428; x=1804328428;
  h=date:from:to:cc:subject:message-id;
  bh=KQcarlRRa2LKL9L0+Ax5J49XTgySGr7sTK5uNyZx2DU=;
  b=UjRiA+ME3KYXId5I54IWL0XTiYSYG62kEg7ZPe2ac5wgEze0ldY0SdEK
   koNuoOwuzjFDEkIX9dgh6zI85hrEFIQOQp2YJKqDagXtiYSxlYSxpkg84
   4vHnL/O18aRuHQ+GwADZB0+cvRLwpLUrRdY4VKYm7oEBT5DK6loMyVbQu
   AP0cpKh//uelvu/zVDgAiVgiFc7VwGd3t6IjzG44I8SSUUvgDQQFHIdVG
   eSNSfWUWvRXsYwSqFCA7iVeJoQY27szusbSX9qwkmmHF7wI4QG4zXfTIV
   DaLfRyXu3A61WSpgMx8VZ8xL7P/OnzhpsZekpls7I4LW5Ca5Prli9opph
   w==;
X-CSE-ConnectionGUID: ORmY0HxCQjWO6OuKqzQunw==
X-CSE-MsgGUID: BcqQwDYBS6mr5b3I8eP0cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77499642"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="77499642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 02:20:28 -0800
X-CSE-ConnectionGUID: 64UlrAvSQLaSCfQS88nj3Q==
X-CSE-MsgGUID: UQAuPbKYTNGybhdSVHYhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="241979649"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 02:20:27 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vySIC-000000000ij-3P9C;
	Fri, 06 Mar 2026 10:20:24 +0000
Date: Fri, 06 Mar 2026 18:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-leds:for-leds-next-next 2/2]
 drivers/leds/led-class-multicolor.c:51:24: error: call to
 '__compiletime_assert_210' declared with 'error' attribute:
 min(intensity_value[i], led_cdev->max_brightness) signedness error
Message-ID: <202603061843.snQjuQDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-leds@vger.kernel.org
TO: Michael Tretter <m.tretter@pengutronix.de>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
head:   787130d7bc49ec01604277a3480f42ba1557385e
commit: 787130d7bc49ec01604277a3480f42ba1557385e [2/2] leds: multicolor: Limit intensity to max_brightness of LED
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-buildonly-randconfig-003-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061843.snQjuQDA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061843.snQjuQDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603061843.snQjuQDA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_210' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
      51 |                 intensity_value[i] = min(intensity_value[i],
         |                                      ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:185:1: note: expanded from here
     185 | __compiletime_assert_210
         | ^
   1 error generated.


vim +51 drivers/leds/led-class-multicolor.c

55d5d3b46b08a4 Dan Murphy      2020-07-16  29  
55d5d3b46b08a4 Dan Murphy      2020-07-16  30  static ssize_t multi_intensity_store(struct device *dev,
55d5d3b46b08a4 Dan Murphy      2020-07-16  31  				struct device_attribute *intensity_attr,
55d5d3b46b08a4 Dan Murphy      2020-07-16  32  				const char *buf, size_t size)
55d5d3b46b08a4 Dan Murphy      2020-07-16  33  {
55d5d3b46b08a4 Dan Murphy      2020-07-16  34  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
55d5d3b46b08a4 Dan Murphy      2020-07-16  35  	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
55d5d3b46b08a4 Dan Murphy      2020-07-16  36  	int nrchars, offset = 0;
55d5d3b46b08a4 Dan Murphy      2020-07-16  37  	int intensity_value[LED_COLOR_ID_MAX];
55d5d3b46b08a4 Dan Murphy      2020-07-16  38  	int i;
55d5d3b46b08a4 Dan Murphy      2020-07-16  39  	ssize_t ret;
55d5d3b46b08a4 Dan Murphy      2020-07-16  40  
55d5d3b46b08a4 Dan Murphy      2020-07-16  41  	mutex_lock(&led_cdev->led_access);
55d5d3b46b08a4 Dan Murphy      2020-07-16  42  
55d5d3b46b08a4 Dan Murphy      2020-07-16  43  	for (i = 0; i < mcled_cdev->num_colors; i++) {
55d5d3b46b08a4 Dan Murphy      2020-07-16  44  		ret = sscanf(buf + offset, "%i%n",
55d5d3b46b08a4 Dan Murphy      2020-07-16  45  			     &intensity_value[i], &nrchars);
55d5d3b46b08a4 Dan Murphy      2020-07-16  46  		if (ret != 1) {
55d5d3b46b08a4 Dan Murphy      2020-07-16  47  			ret = -EINVAL;
55d5d3b46b08a4 Dan Murphy      2020-07-16  48  			goto err_out;
55d5d3b46b08a4 Dan Murphy      2020-07-16  49  		}
55d5d3b46b08a4 Dan Murphy      2020-07-16  50  		offset += nrchars;
787130d7bc49ec Michael Tretter 2026-01-23 @51  		intensity_value[i] = min(intensity_value[i],
787130d7bc49ec Michael Tretter 2026-01-23  52  					 led_cdev->max_brightness);
55d5d3b46b08a4 Dan Murphy      2020-07-16  53  	}
55d5d3b46b08a4 Dan Murphy      2020-07-16  54  
55d5d3b46b08a4 Dan Murphy      2020-07-16  55  	offset++;
55d5d3b46b08a4 Dan Murphy      2020-07-16  56  	if (offset < size) {
55d5d3b46b08a4 Dan Murphy      2020-07-16  57  		ret = -EINVAL;
55d5d3b46b08a4 Dan Murphy      2020-07-16  58  		goto err_out;
55d5d3b46b08a4 Dan Murphy      2020-07-16  59  	}
55d5d3b46b08a4 Dan Murphy      2020-07-16  60  
55d5d3b46b08a4 Dan Murphy      2020-07-16  61  	for (i = 0; i < mcled_cdev->num_colors; i++)
55d5d3b46b08a4 Dan Murphy      2020-07-16  62  		mcled_cdev->subled_info[i].intensity = intensity_value[i];
55d5d3b46b08a4 Dan Murphy      2020-07-16  63  
e35ca991a777ef Sven Schwermer  2025-04-04  64  	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
55d5d3b46b08a4 Dan Murphy      2020-07-16  65  		led_set_brightness(led_cdev, led_cdev->brightness);
55d5d3b46b08a4 Dan Murphy      2020-07-16  66  	ret = size;
55d5d3b46b08a4 Dan Murphy      2020-07-16  67  err_out:
55d5d3b46b08a4 Dan Murphy      2020-07-16  68  	mutex_unlock(&led_cdev->led_access);
55d5d3b46b08a4 Dan Murphy      2020-07-16  69  	return ret;
55d5d3b46b08a4 Dan Murphy      2020-07-16  70  }
55d5d3b46b08a4 Dan Murphy      2020-07-16  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
