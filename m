Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E30224E7
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 09:10:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-403012f27e1so7412365e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694682631; x=1695287431; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/p/h+1hjRJPkTJw7ohFZfNjwicd4vOn5u73LLVp5Pws=;
        b=PWWd2+qZ5AhUKZVXFZCOxSmlAbsMaHtB2KdCj4/1xPtEbhTUaA4aHTeB8v9KbS5QZz
         Kt0h4F6wiawgHHDWAuUiJRamV3/YaGz/g/HxPx15B7uPR0kWO+VwIg+7J1Z/HLZ/f3Gm
         IP1dAvxIuIYgqbGJYA0SQjeePdERtcxfCaSJRJCa1t3jPXiw1Qhw7toh6QtpWEdybE4m
         Iijl5wn/iDMOKtp8Yf+vE5MPss4cXwWMltGL7w5hYknyN0T3qUEhgxqbxcbObNfPRygZ
         uQD/wP2r21rLyeWnRlKdeRmv6E2r0Y8Hd/DJJcOnu30Ym7PXsvKcwXyPRd00LDAXK5bS
         Xmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682631; x=1695287431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/p/h+1hjRJPkTJw7ohFZfNjwicd4vOn5u73LLVp5Pws=;
        b=ern/ey6FCdSLxbvkpZW7K3aZx98inLQk9xCT9edvx+sBjrEV5wqWBQnM315fQuzcsy
         /JqC03AG6LDg+tX3eGwULWD2tuKKmvLXne9KeoRyT9U+GU4m4sd2ngSZj04Kng18oqdI
         IAcMY0c7VJwj/LNVmi41vAPmXusxy1A3xITg2Ku7hbTTs9MBNckUnrwgQ0ixr70jj2zs
         ShDOUWq0lOfduMJxXvnlyRY3gurUBnYMohutHEX0vWmTF1fS8nDDsJtGDY5SgvkB7s9S
         lT6XHSXWiROzA/oMk3/5LkWofvFqu6+oongrRyHYdlRWerVhMiA7R8xUmWVgkZHBiF5W
         9B3A==
X-Gm-Message-State: AOJu0YytgG3Ror682qc8KbktsDjfTdFGFie/PEpJmHpNe6t0J2RSsUaW
	CETQOkJKeNizZpqNeYhSjO1RtQdbvP7mnA/Ha5A=
X-Google-Smtp-Source: AGHT+IHOJr+9i6NWOvvuN/NveO9DgZMU7hC3xHft4L2jEtjxakLoHExd0GgllOpjdXdC9Tnpdx852A==
X-Received: by 2002:a7b:ce93:0:b0:401:daf2:2735 with SMTP id q19-20020a7bce93000000b00401daf22735mr4087319wmj.31.1694682630841;
        Thu, 14 Sep 2023 02:10:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c280700b003fed630f560sm1379458wmb.36.2023.09.14.02.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:10:30 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] leds: triggers: gpio: Rewrite to use trigger-sources
Message-ID: <21f871bb-d409-4337-9d90-27e5c9389aaf@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/dt-bindings-leds-Mention-GPIO-triggers/20230912-214554
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda%40linaro.org
patch subject: [PATCH 2/2] leds: triggers: gpio: Rewrite to use trigger-sources
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140825.cVUTHU1K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140825.cVUTHU1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309140825.cVUTHU1K-lkp@intel.com/

smatch warnings:
drivers/leds/trigger/ledtrig-gpio.c:98 gpio_trig_activate() error: dereferencing freed memory 'gpio_data'

vim +/gpio_data +98 drivers/leds/trigger/ledtrig-gpio.c

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
                                                                                                ^^^^^^^^^^^^^^^^

2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  @98  		return PTR_ERR(gpio_data->gpiod);
                                                                                                               ^^^^^^^^^^^^^^^^
Dereferencing freed memory.

2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12   99  	}
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  100  	if (!gpio_data->gpiod) {
2689cea6283a47 drivers/leds/trigger/ledtrig-gpio.c Linus Walleij    2023-09-12  101  		dev_err(dev, "no valid GPIO for the trigger\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

