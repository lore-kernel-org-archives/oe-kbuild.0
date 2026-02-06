Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE925D1E9
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 02:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770344082; cv=none; b=YdlkFrTTL0UfNDL57jhS+3n9kb0EzpXuM3x2hAieV6v1msAoFK+dVPFYnCss0GsQrqNgkKCNWrR6nvfwmORpbt4ouBz3ax5qXVaY5Emqi+GmXJMLHo/kew4m/NN09E4C7HEbAIM5KzYNnkp14+xa3tVLGKIMX9SHPqRXX+WqpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770344082; c=relaxed/simple;
	bh=fZPZ4TleVI7C0ut/KWr77q6O5S+XO6LixKpj+vRa+GY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E9B9oLei2qjS/Ece5YArR1IHerBF1pxoOJz6k3srVkJsrHJsiIZPozn9jHQGuUV625vUoGCEooVyBPZaEHCewg66KOznS6ELZDNpnPQNAML4ElAZYRn663YHElv89YezR9foVf4jGMKpF+vPAC7ltKdysm5rAKZ/VYky3D0JB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX8j3ziM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX8j3ziM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770344082; x=1801880082;
  h=date:from:to:cc:subject:message-id;
  bh=fZPZ4TleVI7C0ut/KWr77q6O5S+XO6LixKpj+vRa+GY=;
  b=nX8j3ziMvKMpoRXe9bZKFflQ/LANcbZRKQMgZfiwjc5Xh5v6Pior2ZVr
   3FRX9BDv4NQhgff0Q5By+vjBri2v9orqt2cCHtqwblP7kJL8dn5dJ7sSJ
   wGONSXeRO5USt96SPZSS6E/RyhfFw18jWgLTRHVgysCNzaWd2njSYgHWj
   EcjKjPsjiFTJkLaQgo9Txfdebyz5LnMWb2HcP9i7ilpu3RbyQjdTJt7Nj
   RcJONzQ5wfgCS/MbwB/SeVq4sDh6VR7c+cPeXpXuP15R7BTBC0C10hwCy
   fraRuGPWzj4uWkRhMZnxwcvHZkbeLxVIswuWkiwgMX864kE4G+fQK3bhz
   g==;
X-CSE-ConnectionGUID: LLOwnSqBRvCYBnoQC9jSqw==
X-CSE-MsgGUID: dwvz/hUSQQW9XeEsprrUmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82992895"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="82992895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:14:41 -0800
X-CSE-ConnectionGUID: wp7uAKNGQY2CEouT+5dSGw==
X-CSE-MsgGUID: faAn/kvWRayb2xHLY5bwWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210123742"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2026 18:14:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voBMj-00000000kMk-1ocI;
	Fri, 06 Feb 2026 02:14:37 +0000
Date: Fri, 06 Feb 2026 10:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-leds:for-leds-next-next 19/19]
 drivers/leds/led-class-multicolor.c:51:24: error: call to
 '__compiletime_assert_209' declared with 'error' attribute:
 min(intensity_value[i], led_cdev->max_brightness) signedness error
Message-ID: <202602061003.VsMdbQy5-lkp@intel.com>
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
head:   129f82752bcecd554936209aac4dbdd888e92224
commit: 129f82752bcecd554936209aac4dbdd888e92224 [19/19] leds: multicolor: Limit intensity to max_brightness of LED
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260206/202602061003.VsMdbQy5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061003.VsMdbQy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602061003.VsMdbQy5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/led-class-multicolor.c:51:24: error: call to '__compiletime_assert_209' declared with 'error' attribute: min(intensity_value[i], led_cdev->max_brightness) signedness error
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
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_209
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
129f82752bcecd Michael Tretter 2026-01-23 @51  		intensity_value[i] = min(intensity_value[i],
129f82752bcecd Michael Tretter 2026-01-23  52  					 led_cdev->max_brightness);
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
