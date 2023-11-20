Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C014F83
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="we6DoAHe"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507a3b8b113so6061324e87.0
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700480107; x=1701084907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnHXXBG/PcSIOhkoJ9kEnpC6kzNN9AjZ6LY10zqo+h0=;
        b=we6DoAHeHrDUdrDGDdihT1u0jTL3m8iibFoDlxYN5VphQG/zcDHf6WvHGM+yBSg53l
         /aKQQCsZKFj1OdzCY1flI0nSQHbkjcFJQ9kDw7+InkV36lclqarGgyzXbSAR1vnoblK/
         wwrgLanLw4Ox9HFGwwknCAXC4xX7o6jDcs8pRGml5kccECGqC/2XLZGH5svLuEqns5WV
         pBoBNWSLEgbG4DoQHg68QRvlBHHnI9/K9OYCfk76e2yaMs60d4XRewRrxcm70N//uA85
         CihkIWh+EEsfIx7Odu+TCmW+2d694w/EteREMg5g6s3YxL/8AA5bpk2Q3AdngiCqLoXF
         uaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700480107; x=1701084907;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnHXXBG/PcSIOhkoJ9kEnpC6kzNN9AjZ6LY10zqo+h0=;
        b=iILohOyhUEcxpIUb6+er3KH59Vmkm82NoJTNN22CjqJw/eP7GI9+rx2YWAA4vO8ENH
         yofq2ngrdAua6jcjrUdBHe6i/CHbh1D0ZCcGrBdJY/jSt6ga8WnWNXsgOtZpumdMoJg1
         bIoMeCaUZ5VpmR56QV5+4OAkmJ9TRCbXoJPJtsuodqoUgxiZQibLBx4s5w03NnYy1sNv
         RR305vA/gvXxotBV/9RjAHZXxTSQCXk829HqBLaw0FmvefQNBZQei0dTEAwuIP12HVLx
         k+xouLYfCaIEBONR/mKTVwOOLIedV+frq4vVJJqwJpPDVQTW77OrtJ8aASlQiv0yqv4a
         D+vQ==
X-Gm-Message-State: AOJu0YyItEEO5PchAqhiB2dG4EZBFEEfllY/ERTVrjk5bPkAD4NjTwcf
	ZEfmrIUh/4jv4dHR40+WCE7GkfM5vBVVB21F+2E=
X-Google-Smtp-Source: AGHT+IE4p1HjJUlGRGxGDBmDUsbIOwoBbIXNzM2Hj8ktYhCtgv5uw2xJHZLQAN5AdJEy4CeFtILz0A==
X-Received: by 2002:a05:6512:360e:b0:509:8e13:48e0 with SMTP id f14-20020a056512360e00b005098e1348e0mr4603700lfs.37.1700480107308;
        Mon, 20 Nov 2023 03:35:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c4e9300b00405d9a950a2sm17666272wmq.28.2023.11.20.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:35:07 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 06:35:04 -0500
To: oe-kbuild@lists.linux.dev, Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/2] rtc: max31335: add driver support
Message-ID: <ad78bb08-d415-481d-8f26-0b0195a1ad9d@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109101449.8347-2-antoniu.miclaus@analog.com>

Hi Antoniu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/rtc-max31335-add-driver-support/20231109-231755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20231109101449.8347-2-antoniu.miclaus%40analog.com
patch subject: [PATCH v7 2/2] rtc: max31335: add driver support
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110943.V2lcrQlf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110943.V2lcrQlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110943.V2lcrQlf-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-max31335.c:415 max31335_trickle_charger_setup() error: uninitialized symbol 'trickle_cfg'.

vim +/trickle_cfg +415 drivers/rtc/rtc-max31335.c

d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  383  static int max31335_trickle_charger_setup(struct device *dev,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  384  					  struct max31335_data *max31335)
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  385  {
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  386  	u32 ohms, chargeable;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  387  	int i, trickle_cfg;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  388  	const char *diode;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  389  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  390  	if (device_property_read_u32(dev, "aux-voltage-chargeable",
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  391  				     &chargeable))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  392  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  393  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  394  	if (device_property_read_u32(dev, "trickle-resistor-ohms", &ohms))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  395  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  396  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  397  	if (device_property_read_string(dev, "adi,tc-diode", &diode))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  398  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  399  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  400  	if (!strcmp(diode, "schottky"))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  401  		trickle_cfg = MAX31335_TRICKLE_SCHOTTKY_DIODE;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  402  	else if (!strcmp(diode, "standard+schottky"))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  403  		trickle_cfg = MAX31335_TRICKLE_STANDARD_DIODE;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  404  	else
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  405  		dev_err_probe(dev, -EINVAL, "Invalid tc-diode value: %s\n",
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  406  			      diode);

Probably was intended to be return dev_err_probe();

d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  407  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  408  	for (i = 0; i < ARRAY_SIZE(max31335_trickle_resistors); i++)
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  409  		if (ohms == max31335_trickle_resistors[i])
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  410  			break;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  411  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  412  	if (i >= ARRAY_SIZE(max31335_trickle_resistors))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  413  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  414  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09 @415  	i = i + trickle_cfg;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  416  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  417  	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  418  			    FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  419  			    FIELD_PREP(MAX31335_TRICKLE_REG_EN_TRICKLE,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  420  				       chargeable));
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  421  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

