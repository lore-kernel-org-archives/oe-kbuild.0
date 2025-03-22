Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3A198E76
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742628618; cv=none; b=QpR7m+lvjeUIXoG3A6UK0X0zMtQKqaHEFKiJjtv3iJZU4iEE7hmL3aD4VQ0Gx91Dfa6jo3AKa5OPtKAPpkwD+GpD+ZtKOTmM48xlzI0bV/Wgdqsvz9HzNU3i7ejLNMvuRPfejThNmfwouTsytpJGTswnJTx1QHqh81FT4I2f7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742628618; c=relaxed/simple;
	bh=92RQh55jsrGFROKnG6xoihCWbNixqwF+HTtLMlW0uWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RwQsA1gTTrpBEbHzhusA2v82FRoPMrxhhmRWIHW1nkWQeMg4RIY8tZWioFmzsNPA6OZLtGfqcXzNVZaTdxaqoxTGzQIuDGTz2Et3MTP5jYw6Xh7bRz5zKDajGBCAXgMQXV4cJMzUXZsYXV0/97WSL6DBARVik9XZLItGHWlynu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYtrQbAn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYtrQbAn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so12911805e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742628614; x=1743233414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMKeYU6q3OdefJ5qoJnBTsWhUmldL9PQbm5T/LBiBo8=;
        b=fYtrQbAnEhEBOCO96osV03BKWJ3EwI4VEcmtQXHmPs/8G64x3UqryW2bRvpYikJjMk
         Jp5IdAgn84wy+u1yeHI9Uogx7DLSbmH7snUsVK41/Ie8QXu1sul+3d9SGtYAVAWFHWFp
         E78VF7jM0dfEEOoa8JgWtrQGfckxl/cp557HIyMDNRSDiSCmcWY3j8AkisLdN+NC7llL
         dFUsY5q3KTGA971EPsgAiu/yuCQwF2zIY9GHdD7DU7q9y8QISjF1duuoJQuPNFzEcDof
         cK4JWnJyJiyz5XgtfW/xs8RSGyqDZXxjOZLwTtJEln35BJkyAeVU2FMXVZiLI9XDR9BQ
         bjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742628614; x=1743233414;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMKeYU6q3OdefJ5qoJnBTsWhUmldL9PQbm5T/LBiBo8=;
        b=EPwkcQCw13cr9JdHJG0xydnIP6f22aubo+rOFNX4EFfmmIeViTYAiCjdXiv+7FqGcR
         JzTmNZRXXE2G0jHX5tNkRYbNC/CesLuaI5426rVHFlWmjuAAISD4Ra07nzPi21OMnMYs
         rY3PEWertQFb1BFnNLXYx/9V3xT3ogIrGIQ550/fPPdvOfQ7LDolkJ2ijRQbCeEUrBeK
         qYcITmklVnfu3iZQwV1bR20AyQkfZdQ809wal28umb/IpBBk6bF1gOoiQHOWvcUR5cKB
         Tgjprzst1GfirJaDAOORB2mBGvTZ1WAFr5cvAMmS06TXiZvoMhDvvUXs7KLm4WPiaE+2
         Q6Lg==
X-Gm-Message-State: AOJu0YyXG9p7xCmJkc75t5VIMfjk7JB4VqH+hmQYRfUqY+emsk0pKBvt
	5wvI1kIKRYJ1kVr+X74/Hy+h/TTqIVoWV/cUjcfPnTn0caFnkH4e7/SUegHWlRRPIBfeZiyOLY9
	u
X-Gm-Gg: ASbGncvCxOTyQLa5N0wdRXYnS8A8nWtCmytyRSMLHCsO7td0ohm9ihd0yPiuqJ+O3oG
	l3AJ1ft3QS5r9OeL3LKNvsOB/aqYLeo3WCvQuVGRKycj9jynfWQHItPMfdjgrqvmxgGC1xDxYKF
	jowf2KX0ZQx6bX/umaKmTLsUregakWwAwVzOXLBZSRbx4YmFeU8mY2c14TC/InCERA1dhAuWWKB
	V7IGtjksWJOlLf0qZFHMQraaj7kk6tECahC5GfQh6IIbGkZ3vQgSLCQ7vvNvjox2hj7lF2aRPz5
	I0wcdYeoEFk2+yxZslTDrsmXY3IQmt8t7BhPTTcYmFe9AW0Uqg==
X-Google-Smtp-Source: AGHT+IG7qXonJx7QL3b5p+TPntVrGtmStjhpGd7w6D7GZ0R8PBo0Dj1oOcNu9xVsk8AEIq0wbiW2bg==
X-Received: by 2002:a05:600c:1548:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43d509f73admr57076085e9.14.1742628614427;
        Sat, 22 Mar 2025 00:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e6767sm4506984f8f.66.2025.03.22.00.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 00:30:14 -0700 (PDT)
Date: Sat, 22 Mar 2025 10:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthias Fend <matthias.fend@emfend.at>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Fend <matthias.fend@emfend.at>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <87955568-f73b-4df1-bc94-9acb4c337c0e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>

Hi Matthias,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/dt-bindings-leds-add-Texas-Instruments-TPS6131x-flash-LED-driver/20250318-154318
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250318-leds-tps6131x-v2-2-bc09c7a50b2e%40emfend.at
patch subject: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503221153.G9HPVANn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503221153.G9HPVANn-lkp@intel.com/

smatch warnings:
drivers/leds/flash/leds-tps6131x.c:534 tps6131x_parse_node() warn: 'num_channels' unsigned <= 0

vim +/num_channels +534 drivers/leds/flash/leds-tps6131x.c

02e7ee00455be1 Matthias Fend 2025-03-18  512  static int tps6131x_parse_node(struct tps6131x *tps6131x)
02e7ee00455be1 Matthias Fend 2025-03-18  513  {
02e7ee00455be1 Matthias Fend 2025-03-18  514  	const struct tps6131x_timer_config *timer_config;
02e7ee00455be1 Matthias Fend 2025-03-18  515  	struct device *dev = tps6131x->dev;
02e7ee00455be1 Matthias Fend 2025-03-18  516  	u32 channels[TPS6131X_MAX_CHANNELS];
02e7ee00455be1 Matthias Fend 2025-03-18  517  	u32 current_step_multiplier;
02e7ee00455be1 Matthias Fend 2025-03-18  518  	u32 current_ua;
02e7ee00455be1 Matthias Fend 2025-03-18  519  	u32 max_current_flash_ma, max_current_torch_ma;
02e7ee00455be1 Matthias Fend 2025-03-18  520  	u32 num_channels;
02e7ee00455be1 Matthias Fend 2025-03-18  521  	u32 timeout_us;
02e7ee00455be1 Matthias Fend 2025-03-18  522  	int i;
02e7ee00455be1 Matthias Fend 2025-03-18  523  	int ret;
02e7ee00455be1 Matthias Fend 2025-03-18  524  
02e7ee00455be1 Matthias Fend 2025-03-18  525  	tps6131x->valley_current_limit = device_property_read_bool(dev, "ti,valley-current-limit");
02e7ee00455be1 Matthias Fend 2025-03-18  526  
02e7ee00455be1 Matthias Fend 2025-03-18  527  	tps6131x->led_node = fwnode_get_next_available_child_node(dev->fwnode, NULL);
02e7ee00455be1 Matthias Fend 2025-03-18  528  	if (!tps6131x->led_node) {
02e7ee00455be1 Matthias Fend 2025-03-18  529  		dev_err(dev, "Missing LED node\n");
02e7ee00455be1 Matthias Fend 2025-03-18  530  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  531  	}
02e7ee00455be1 Matthias Fend 2025-03-18  532  
02e7ee00455be1 Matthias Fend 2025-03-18  533  	num_channels = fwnode_property_count_u32(tps6131x->led_node, "led-sources");
02e7ee00455be1 Matthias Fend 2025-03-18 @534  	if (num_channels <= 0) {

num_channels needs to be signed.

02e7ee00455be1 Matthias Fend 2025-03-18  535  		dev_err(dev, "Failed to read led-sources property\n");
02e7ee00455be1 Matthias Fend 2025-03-18  536  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  537  	}
02e7ee00455be1 Matthias Fend 2025-03-18  538  
02e7ee00455be1 Matthias Fend 2025-03-18  539  	if (num_channels > TPS6131X_MAX_CHANNELS) {
02e7ee00455be1 Matthias Fend 2025-03-18  540  		dev_err(dev, "led-sources count %u exceeds maximum channel count %u\n",
02e7ee00455be1 Matthias Fend 2025-03-18  541  			num_channels, TPS6131X_MAX_CHANNELS);
02e7ee00455be1 Matthias Fend 2025-03-18  542  		return -EINVAL;
02e7ee00455be1 Matthias Fend 2025-03-18  543  	}
02e7ee00455be1 Matthias Fend 2025-03-18  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

