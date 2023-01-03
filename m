Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DC7F
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Jan 2023 00:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672707550; x=1704243550;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Pn4dmbxivzlScolg6jQ2Igceu1+D10wrjSSSWjuiSAQ=;
  b=JUZfGflh7JlvfbU5g2QAEEY99BGthJTF98Vflf2j/3yRQ0eMn+2ao7EX
   or0LQ8Eb32Cqq8e6OXhqDkf+ranecLwsg3zZCA0PY6IAU/wntdp7mxSxF
   LBaSOmOWq2Xbqt7EbSf6YGp5YIfAeUTqDBFBSqtn5OLFNuhvaEcqBsiCS
   PTj415SOEH7o8XUsr/7FmimwtLuSWRRac/xE3yLzfHVSladdk6J6gbTrr
   lPAFABTw0B92eLD0PwWvEJQTj3Ary8zPgzdy5xG6yOUyeru8lD2KzIiv8
   TaclgBKXaZWUPfnfAzPpKZUb3SJ4y8Cv2ui5IWxHuE4e74LJuNy45UFaR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="383856703"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="383856703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 16:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="778686599"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="778686599"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jan 2023 16:59:08 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCVdz-000RdT-2Y;
	Tue, 03 Jan 2023 00:59:07 +0000
Date: Tue, 3 Jan 2023 08:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable:
 of_flags [uninitvar]
Message-ID: <202301030823.hPWJiWdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable: of_flags [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: a2b5e207cade33b4d2dfd920f783f13b1f173e78 gpiolib: rework quirk handling in of_find_gpio()
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a2b5e207cade33b4d2dfd920f783f13b1f173e78
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable: of_flags [uninitvar]
    const of_find_gpio_quirk *q;
   ^
   drivers/gpio/gpiolib-of.c:711:28: warning: Parameter 'hog' can be declared as pointer to const [constParameter]
          struct device_node *hog)
                              ^

vim +510 drivers/gpio/gpiolib-of.c

a2b5e207cade33 Dmitry Torokhov  2022-09-07  504  
ea713bc450054a Linus Walleij    2016-10-03  505  struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
fed7026adc7c3a Andy Shevchenko  2019-04-10  506  			       unsigned int idx, unsigned long *flags)
ea713bc450054a Linus Walleij    2016-10-03  507  {
ea713bc450054a Linus Walleij    2016-10-03  508  	char prop_name[32]; /* 32 is max size of property name */
ea713bc450054a Linus Walleij    2016-10-03  509  	enum of_gpio_flags of_flags;
a2b5e207cade33 Dmitry Torokhov  2022-09-07 @510  	const of_find_gpio_quirk *q;
ea713bc450054a Linus Walleij    2016-10-03  511  	struct gpio_desc *desc;
ea713bc450054a Linus Walleij    2016-10-03  512  	unsigned int i;
ea713bc450054a Linus Walleij    2016-10-03  513  
c85823390215e5 Linus Walleij    2017-12-27  514  	/* Try GPIO property "foo-gpios" and "foo-gpio" */
ea713bc450054a Linus Walleij    2016-10-03  515  	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
ea713bc450054a Linus Walleij    2016-10-03  516  		if (con_id)
ea713bc450054a Linus Walleij    2016-10-03  517  			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
ea713bc450054a Linus Walleij    2016-10-03  518  				 gpio_suffixes[i]);
ea713bc450054a Linus Walleij    2016-10-03  519  		else
ea713bc450054a Linus Walleij    2016-10-03  520  			snprintf(prop_name, sizeof(prop_name), "%s",
ea713bc450054a Linus Walleij    2016-10-03  521  				 gpio_suffixes[i]);
ea713bc450054a Linus Walleij    2016-10-03  522  
ea713bc450054a Linus Walleij    2016-10-03  523  		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
ea713bc450054a Linus Walleij    2016-10-03  524  						&of_flags);
6662ae6af82df1 Maxime Ripard    2018-02-21  525  
7b58696d9a8415 Andy Shevchenko  2020-10-21  526  		if (!gpiod_not_found(desc))
ea713bc450054a Linus Walleij    2016-10-03  527  			break;
ea713bc450054a Linus Walleij    2016-10-03  528  	}
ea713bc450054a Linus Walleij    2016-10-03  529  
a2b5e207cade33 Dmitry Torokhov  2022-09-07  530  	/* Properly named GPIO was not found, try workarounds */
a2b5e207cade33 Dmitry Torokhov  2022-09-07  531  	for (q = of_find_gpio_quirks; gpiod_not_found(desc) && *q; q++)
a2b5e207cade33 Dmitry Torokhov  2022-09-07  532  		desc = (*q)(dev->of_node, con_id, idx, &of_flags);
6e24826d2c51a0 Linus Walleij    2020-04-15  533  
ea713bc450054a Linus Walleij    2016-10-03  534  	if (IS_ERR(desc))
ea713bc450054a Linus Walleij    2016-10-03  535  		return desc;
ea713bc450054a Linus Walleij    2016-10-03  536  
ea713bc450054a Linus Walleij    2016-10-03  537  	if (of_flags & OF_GPIO_ACTIVE_LOW)
ea713bc450054a Linus Walleij    2016-10-03  538  		*flags |= GPIO_ACTIVE_LOW;
ea713bc450054a Linus Walleij    2016-10-03  539  
ea713bc450054a Linus Walleij    2016-10-03  540  	if (of_flags & OF_GPIO_SINGLE_ENDED) {
4c0facddb7d88c Laxman Dewangan  2017-04-06  541  		if (of_flags & OF_GPIO_OPEN_DRAIN)
ea713bc450054a Linus Walleij    2016-10-03  542  			*flags |= GPIO_OPEN_DRAIN;
ea713bc450054a Linus Walleij    2016-10-03  543  		else
ea713bc450054a Linus Walleij    2016-10-03  544  			*flags |= GPIO_OPEN_SOURCE;
ea713bc450054a Linus Walleij    2016-10-03  545  	}
ea713bc450054a Linus Walleij    2016-10-03  546  
e10f72bf4b3e88 Andrew Jeffery   2017-11-30  547  	if (of_flags & OF_GPIO_TRANSITORY)
e10f72bf4b3e88 Andrew Jeffery   2017-11-30  548  		*flags |= GPIO_TRANSITORY;
05f479bf7d239f Charles Keepax   2017-05-23  549  
d449991c4d1d06 Thomas Petazzoni 2019-02-07  550  	if (of_flags & OF_GPIO_PULL_UP)
d449991c4d1d06 Thomas Petazzoni 2019-02-07  551  		*flags |= GPIO_PULL_UP;
d449991c4d1d06 Thomas Petazzoni 2019-02-07  552  	if (of_flags & OF_GPIO_PULL_DOWN)
d449991c4d1d06 Thomas Petazzoni 2019-02-07  553  		*flags |= GPIO_PULL_DOWN;
31bea23119cda8 Nuno Sá          2022-07-13  554  	if (of_flags & OF_GPIO_PULL_DISABLE)
31bea23119cda8 Nuno Sá          2022-07-13  555  		*flags |= GPIO_PULL_DISABLE;
d449991c4d1d06 Thomas Petazzoni 2019-02-07  556  
ea713bc450054a Linus Walleij    2016-10-03  557  	return desc;
ea713bc450054a Linus Walleij    2016-10-03  558  }
ea713bc450054a Linus Walleij    2016-10-03  559  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
