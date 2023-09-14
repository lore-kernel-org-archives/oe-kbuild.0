Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B588191
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 00:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694651000; x=1726187000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+UlneO/H8spGePlq3BR0HSExrmBtbt2tbye9uUFRAGE=;
  b=j/yNK7WjfWcyVdrxnFMCqU+3vF8kur3VJeQfntJE/VKdA7RfAsfs2NDq
   hE8iDnMZ2PKaXYM+WMRmNZMGi0Bsk88gS2eQ7oa+uuRsE6jXEfhbwkVFD
   plgYSS6UUSRGJRqAdRA4jaH3OK7od2M+YDJLNPVoMDf/3N3pBcctngt5R
   /mQvHd2xY9hIYsQ1wdi9l3ykFI8B0rfXTCooObr5kRmv41tXO+ULnT7kF
   e0pItCP8g8LHuS82j9XO2mJS38KNObi2fjZ7FCAJNYW8Rm8PZjtnb/ydZ
   VHfthXlvOfKyPI/sVEtKtVV2HkHnMAu34RiLHJzqkM/mpg+D+3IGWbljU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378743038"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="378743038"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 17:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918043401"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="918043401"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 17:23:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qga8Y-0000rZ-1W;
	Thu, 14 Sep 2023 00:23:15 +0000
Date: Thu, 14 Sep 2023 08:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] leds: triggers: gpio: Rewrite to use trigger-sources
Message-ID: <202309140825.cVUTHU1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda@linaro.org>
References: <20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: "Jan Kundrát" <jan.kundrat@cesnet.cz>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/dt-bindings-leds-Mention-GPIO-triggers/20230912-214554
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda%40linaro.org
patch subject: [PATCH 2/2] leds: triggers: gpio: Rewrite to use trigger-sources
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140825.cVUTHU1K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140825.cVUTHU1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309140825.cVUTHU1K-lkp@intel.com/

smatch warnings:
drivers/leds/trigger/ledtrig-gpio.c:98 gpio_trig_activate() error: dereferencing freed memory 'gpio_data'

vim +/gpio_data +98 drivers/leds/trigger/ledtrig-gpio.c

9bfd7d9e5d6353 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02   77  
2282e125a406e0 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02   78  static int gpio_trig_activate(struct led_classdev *led)
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   79  {
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   80  	struct gpio_trig_data *gpio_data;
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   81  	struct device *dev = led->dev;
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   82  	int ret;
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   83  
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   84  	gpio_data = kzalloc(sizeof(*gpio_data), GFP_KERNEL);
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   85  	if (!gpio_data)
9bfd7d9e5d6353 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02   86  		return -ENOMEM;
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17   87  
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   88  	/*
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   89  	 * The generic property "trigger-sources" is followed,
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   90  	 * and we hope that this is a GPIO.
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   91  	 */
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   92  	gpio_data->gpiod = fwnode_gpiod_get_index(dev->fwnode,
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   93  						  "trigger-sources",
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   94  						  0, GPIOD_IN,
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   95  						  "led-trigger");
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   96  	if (IS_ERR(gpio_data->gpiod)) {
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   97  		kfree(gpio_data);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  @98  		return PTR_ERR(gpio_data->gpiod);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   99  	}
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  100  	if (!gpio_data->gpiod) {
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  101  		dev_err(dev, "no valid GPIO for the trigger\n");
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  102  		kfree(gpio_data);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  103  		return -EINVAL;
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  104  	}
4e4210402639f1 drivers/leds/trigger/ledtrig-gpio.c Andy Shevchenko  2019-08-30  105  
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  106  	gpio_data->led = led;
9bfd7d9e5d6353 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02  107  	led_set_trigger_data(led, gpio_data);
2282e125a406e0 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02  108  
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  109  	ret = request_threaded_irq(gpiod_to_irq(gpio_data->gpiod), NULL, gpio_trig_irq,
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  110  			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  111  			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  112  	if (ret) {
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  113  		dev_err(dev, "request_irq failed with error %d\n", ret);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  114  		gpiod_put(gpio_data->gpiod);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  115  		kfree(gpio_data);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  116  		return ret;
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  117  	}
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  118  
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  119  	/* Finally update the LED to initial status */
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  120  	gpio_trig_irq(0, led);
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  121  
2282e125a406e0 drivers/leds/trigger/ledtrig-gpio.c Uwe Kleine-König 2018-07-02  122  	return 0;
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17  123  }
17354bfe85275f drivers/leds/ledtrig-gpio.c         Felipe Balbi     2009-02-17  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
