Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83822F3C3A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268434; cv=none; b=Ri87lsJ58MKhtd0G3ipBgYb1ZisbXbb0TL89m6a0ytxY7xUmqNfcLG1gqGtRfq0fqS0SrYUE00DqvzKBTleivYV5VQ4cQI+3m6x2nkIIPr563rEJPazApsXZe2rOqGIF47j5B+BnnzRrB6t1udusT0bkLwjqmTATQjRIJNu2tJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268434; c=relaxed/simple;
	bh=ac+dj0rndcYqjmn89tRE8u9Zk6zsyI4KTZ3RrPJLnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DldoZRYJixbZ4XYDvS9DH+ihZoodyS2pHSeO8ahf748z2BDuI2IfOVDQyVTvCWkL70iBOEunfVZuGOoOUEtJ7El+mT3D6ubJYci7SgOjdAFxbkC4Hm2X1qr4CVcfUjh2Vk0xJWDy+vJfdksDiLAM5FA1+a+NHCj21cyg8UVl2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nbhg1C2t; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nbhg1C2t"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40a8013d961so1101949b6e.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268430; x=1750873230; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=Nbhg1C2tn2z4J8CqBf3SaTj9zkzI8ukH8DuLZ8wkkB833bsrbq/UNtfRs1hv2F3bb6
         K/7bEyp2IWiSm6nt0JCJlNAbaLoUkSqJE0xfBixzIfRQ3qfTzexTuYlKLoiJRViMwDx7
         q9/ZtALAAuEzD+Uea/+bcpwmMAka6mE/mDXUNzKm3ovLlKllr7zu0NuNEHMKmtIA7M8x
         vwXKnMlOFCpJrjLltHCOPv4oonN5jYPVXX2sP1jtuAW2im4+HrOxtetXpZE1Uqaxsvou
         mFUBJq4e4T0HPoA7P4IEM21+Mku/MamjM8wqHTVAO1TJe02j7CN/yRcA+5KscemPJDvV
         /EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=DcGBhAHkkuAZmvX7qAbFbAE1BmwI4aOhhr06X0+BvzWtSDW2peusMhhVyt265vGpq4
         vvSRqtsxa1PJdJADSbXt3BjKQSeMAQEXDd2UgozK0XA/UQb7RSFihGfkljtFa483BK27
         8PYtDEP+1pWb6R4Zobf79hmxSM1Bq6JKcXgkZCdyUkO5iuWJwrL2XGseDO0YQsLabZZc
         QEJvpMoSnaCiQIe3mRqCc/OXaWuaHgEPDO4exG99lqBrjpjwLOHDUX6TMVBLO48k1egy
         2oqcKz+EJBgfKY/h9qoKYu/yzDTgPQzABLRBli03ycjGqaWMiOfswBifMzfyf1DaMOL5
         2CVw==
X-Gm-Message-State: AOJu0YzqJl43Ze/4GMdE7Z//uBSUe+mfAQztgFzHEVbEwAC69aC23Rin
	7pjSqTSGf8jzzCcpESo1zkIzT2p0JcOhyrnJmPuzS1pWIrhQ9aV9LNWlCgNPQDEXZdmD0Cgxv73
	cShiU
X-Gm-Gg: ASbGncvQ4IWt3rn9kjGLCELfaX0u7BrIwIcRZiI2y+nrsje5CwTJA0r1eoHalsO9JJY
	NuEzIjmyMTqKRspldGakn9ju25IBLd3AqYJu5ReMFPytI59h1LgmN3evCriDeXL0pDAHAreqj8v
	RmnE+/wqvVskEpBD+aYyhnrhcXCgPluQY/Q7xjhajxeh6B4vpOHpz0cCjLQrPusOLTY3PUWQX+6
	429hgz9y7Mz7gPzWzETcItT7+vaWklwqtLkpwtuRLEX+YOHtvVeiV0BEzAyCab8wtMrz44BNT5p
	UP8Shza1Hy894BRg4Y0iUzD0Df5+w8mePihiBn8zNh5PUcY/Y6kek+L7AI8DEE5gDyzkEQ==
X-Google-Smtp-Source: AGHT+IECG3DT0XZa253ZiAtrOyEDWibKqgxLSniShtQDZC/Qv6j2rHi/ZcKJqvX1Mm8kJIJS9Lnp8g==
X-Received: by 2002:a05:6808:4fec:b0:406:7769:d351 with SMTP id 5614622812f47-40a7c20ba96mr10089279b6e.23.1750268430492;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418c881sm2415408b6e.41.2025.06.18.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:40:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>,
	dmitry.torokhov@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomas Jurena <jurenatomas@gmail.com>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <eef98df0-5beb-40c1-a4e6-722012635812@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250614/202506140034.iXbhyNCx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140034.iXbhyNCx-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/tca6416-keypad.c:263 tca6416_keypad_probe() error: we previously assumed 'pdata' could be null (see line 253)

vim +/pdata +263 drivers/input/keyboard/tca6416-keypad.c

3da11976b80c663 Uwe Kleine-König             2022-11-18  236  static int tca6416_keypad_probe(struct i2c_client *client)
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  237  {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  238  	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  239  	struct tca6416_keys_platform_data *pdata;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  240  	struct tca6416_keypad_chip *chip;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  241  	struct input_dev *input;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  242  	int error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  243  	int i;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  244  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  245  	/* Check functionality */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  246  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  247  		dev_err(&client->dev, "%s adapter not supported\n",
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  248  			dev_driver_string(&client->adapter->dev));
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  249  		return -ENODEV;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  250  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  251  
c838cb3d477f797 Jingoo Han                   2013-12-05  252  	pdata = dev_get_platdata(&client->dev);
c4c4a926acb6b1c Tomas Jurena                 2025-06-10 @253  	if (!pdata && dev_fwnode(&client->dev)) {

Imagine pdata is NULL and so is dev_fwnode()

c4c4a926acb6b1c Tomas Jurena                 2025-06-10  254  		pdata = tca6416_parse_properties(&client->dev, io_size);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  255  		if (!pdata) {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  256  			dev_err(&client->dev,
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  257  				"Failed to parse device configuration from properties\n");
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  258  			return -EINVAL;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  259  		}
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  260  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  261  
91a4c69052bb660 Yangtao Li                   2023-07-23  262  	chip = devm_kzalloc(&client->dev,
91a4c69052bb660 Yangtao Li                   2023-07-23 @263  			    struct_size(chip, buttons, pdata->nbuttons),
                                                                                                               ^^^^^^^^^^^^^^^
Then it will crash

91a4c69052bb660 Yangtao Li                   2023-07-23  264  			    GFP_KERNEL);
91a4c69052bb660 Yangtao Li                   2023-07-23  265  	if (!chip)
91a4c69052bb660 Yangtao Li                   2023-07-23  266  		return -ENOMEM;
91a4c69052bb660 Yangtao Li                   2023-07-23  267  
91a4c69052bb660 Yangtao Li                   2023-07-23  268  	input = devm_input_allocate_device(&client->dev);
91a4c69052bb660 Yangtao Li                   2023-07-23  269  	if (!input)
91a4c69052bb660 Yangtao Li                   2023-07-23  270  		return -ENOMEM;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  271  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  272  	chip->client = client;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  273  	chip->input = input;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

