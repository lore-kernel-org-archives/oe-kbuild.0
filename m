Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F1D2C028A
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204675; cv=none; b=l9ENOXcPyNRbd5illK/gxPiBESz67VALAnWOjpAZdca57mKTqPCMiEkBjPwocW9uVUicSCUedNOXkYpnaCQ+5qKHCoTYLYFiQLl/u9i5QZA35YpZpoeGOLv8vfe49ALAnjelGg8/TYzsFP5EKbx/AS7PREzJ/eyMhkUcOiCs2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204675; c=relaxed/simple;
	bh=aFRDzPkcK9NfGl8UTUu2FSysM7F5S+eQ7XxMTHyQQzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=E76GqEZ+EPVghVnROwWPL6B7P7hj7SB93j+LSoUl6Pnpp11D9iloNsphluUWv5GXUOgtjQsbF6uWNVYwjc9h7jnsLl7AqPJ6Sq+KZCDJNXng9+/1q8k4r4Uykh13MXtbm+ezEFlSJ3GH7GM5G4OvQE3G2V71zgOW8thBPa50v5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqm1brHr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqm1brHr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so4450865e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204672; x=1761809472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Zl0NzO6dgztEpIBfhUUKoZHrDlf3kwSQWoMIJPwEA=;
        b=oqm1brHrDz5awLjuAi2EHwU9F0eDn7LFBfxCcfVWZghZuQIutIsW/GST/39Cjn5LIr
         rxroQ90UkLnMe/WNh1BHoSA5CVlOvRLjE7umXTw7OnUyZ1uaqJ/cPK0TBZ1I6dvC3+D4
         eZRHkEy5NdcATohmo8Z2D1QseWtAF73K2DrxMN+LzOka7Mj5eICPVBQHc8PooEPNbOWh
         wBazBsYUuM/BUsedv6wdTgNcE4efS8HOmfkPnmnzl0r5YKzsjNCvxR4RW80iRDq6Q2TE
         Mz7FJaAnrbzWpsFBPh32uPScAhiyMUj/V9r7nqtZbUYsa9REExEtYuAyOgxXAlld58mn
         Svlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204672; x=1761809472;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Zl0NzO6dgztEpIBfhUUKoZHrDlf3kwSQWoMIJPwEA=;
        b=ZITR5u9W4xRAIUlsJBvMxtU3vZETe4JdRIku6g2cZnPDYAc3ydfesL3A26wijAT+Hz
         3Hx5jG6RmAQys/MdjrDhYyMm4LqnxZHQlyb3pz0tP3PYsz1tVXOUJ9Tmlcp7t/VesCAU
         LTJuHCWssTp9ngpTsCviBfTUG5hGRdnHWNM5XPxIe6mKdlfVHWWrcBPCzudNyzTZM9ic
         xGU83RxJ26oyjB9xxgfJ0LEPnAe7DCYo7F6/pPgE6YC9toNZrL9zyMXFbmVL83kLTERf
         Vb9/Doe1c68sihbVYRSgkM1kUBbmgwZnBPo9dYMK5dFagevzrTghjI052pRmURan5Pyp
         z5HA==
X-Gm-Message-State: AOJu0YyoTIwt6C+88qEIAvaz7zxaqnm/pEYGMBiRp8yjpkPs7I1vvgqs
	lgI1dBUF2BYB1mprtAsu8aDCxtMkAqClG9xjTpZxINLVJVgT08YuMydVVI7xwPbefRJWrKtgIkH
	akWru
X-Gm-Gg: ASbGncvzQaiC2uJ9TnJi9fohzi34zhFU3apkSZCNy/fPX7LtT7Wgg/+1zQGHjTbqH3b
	zc8CNBwj2U4EdG1KjpgFUxnB7uueYHF2uU/8cIfksrLMt1M2nhJAfVGxRdGsB0N/kGFXS4JrH8B
	6WwrdDIplxodXZrWR5oNge1OetnKT88zdp66Wg6CYt0F3A/t2+ItooP+AgL+NWfVFhzz3TMSIlG
	17Ao2bcL2ErCCL8l/PiUsQq60g0GUUTk8Y8uXlugBLaydCJtpp4GcNLVE0qf6GGYIUQNv2KJrtU
	Q8nVzEZzXBsTzHm3bNTWD2WOv1wWTmWC4y+6zJxj9GcVrZXYEgSsPYPpSybN2MfmIz8Zqs0SR4V
	Hxr+45av7EbTL6GRppM6m6nkT8iechq9SEb+4N+0xRN/0AfxEtre4SV7ZpGDw3n8sQ53TiqJEtu
	xjatHfNIF3NLv/6DBB
X-Google-Smtp-Source: AGHT+IGlhOgrTrFS3lTljK8PD6tgtfOcB8wV5TTCZ+KMjcR3xg+VWPl4LfT+6SvDqRlsNkBtYEe0Eg==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr162939935e9.26.1761204671516;
        Thu, 23 Oct 2025 00:31:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428dafesm80214005e9.6.2025.10.23.00.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:31:11 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:31:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ariana Lazar <ariana.lazar@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ariana Lazar <ariana.lazar@microchip.com>
Subject: Re: [PATCH 2/2] iio: adc: adding support for PAC1711
Message-ID: <202510230847.CEW0lvJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-pac1711-v1-2-976949e36367@microchip.com>
Message-ID: <20251023073107.RtcJ4d4u0wPmLpkLvRtdTfXeEk3ohCyUqCvvnnkzVK4@z>

Hi Ariana,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ariana-Lazar/dt-bindings-iio-adc-adding-support-for-PAC1711/20251016-002337
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20251015-pac1711-v1-2-976949e36367%40microchip.com
patch subject: [PATCH 2/2] iio: adc: adding support for PAC1711
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251023/202510230847.CEW0lvJl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510230847.CEW0lvJl-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/pac1711.c:473 pac1711_retrieve_data() error: uninitialized symbol 'ret'.
drivers/iio/adc/pac1711.c:924 pac1711_read_raw() error: uninitialized symbol 'tmp'.
drivers/iio/adc/pac1711.c:1124 pac1711_of_parse_channel_config() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/iio/adc/pac1711.c:1079 pac1711_setup_vbus_range() warn: unsigned 'ret' is never less than zero.
drivers/iio/adc/pac1711.c:1079 pac1711_setup_vbus_range() warn: error code type promoted to positive: 'ret'
drivers/iio/adc/pac1711.c:1102 pac1711_setup_vsense_range() warn: unsigned 'ret' is never less than zero.
drivers/iio/adc/pac1711.c:1102 pac1711_setup_vsense_range() warn: error code type promoted to positive: 'ret'
drivers/iio/adc/pac1711.c:1377 pac1711_probe() warn: passing positive error code '1' to 'dev_err_probe'

vim +/ret +473 drivers/iio/adc/pac1711.c

de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  450  static int pac1711_retrieve_data(struct pac1711_chip_info *info,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  451  				 u32 wait_time)
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  452  {
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  453  	int ret;
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  454  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  455  	/*
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  456  	 * check if the minimal elapsed time has passed and if so,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  457  	 * re-read the chip, otherwise the cached info is just fine
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  458  	 */
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  459  	if (time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  460  			msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS))) {
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  461  		ret = pac1711_reg_snapshot(info, true, PAC1711_REFRESH_REG_ADDR,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  462  					   wait_time);
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  463  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  464  		/*
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  465  		 * Re-schedule the work for the read registers timeout
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  466  		 * (to prevent chip regs saturation)
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  467  		 */
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  468  		cancel_delayed_work_sync(&info->work_chip_rfsh);
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  469  		schedule_delayed_work(&info->work_chip_rfsh,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  470  				      msecs_to_jiffies(PAC1711_MAX_RFSH_LIMIT_MS));
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  471  	}

ret isn't initialized on the else path.

de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  472  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15 @473  	return ret;
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  474  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

