Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0E21D00A
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 07:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768028488; cv=none; b=idiUC5X/dZ+F0cFIaOOSBIpSIXealGRR8dsAaUJZxW1W3gBVcIDiviUY4lSM3rsGEIuaDRElxX88FbXOwdjBM5yg66ZZAm0RT+PiNTBk02HsX2DkgNx9Txd3n0YKkfUOdLFdlyhqQRZ0R9NL1FvYC6mBEG9dtUKSwMpmcZy7E8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768028488; c=relaxed/simple;
	bh=8d8lbUOZ1ucar8KctlDsuaFG01OJaZZoOAdFRIGbjGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbmfWhnv2s7Q9o7C4e6H0WcL9Qaq+3RBUpF9eccY3azu3ve3VLOyXMGkWP92lZDOkD/j/qWYdZvp165CyoNKI1FNC0tXRAE1DFzb9SnWS71zI0zzAlkAwjoEajk8MrRx/LEXQAzT8Z+aTTPp7K/ylhH3sDzrIUJ+N/Uz61wWEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYkeLcXo; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYkeLcXo"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-432d28870ddso1365049f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 23:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768028485; x=1768633285; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNcP1mXijjNl4kCMnxSr+8xKGWS9vM9citNIhHTXf2o=;
        b=jYkeLcXo5FGGzklr7Gj8zxxAF8HSCbGPMFfLZdgqSA6xt+FSXUpcHyZVjKDr/O0t9v
         9x+lUGG5GONB6cLdXCjLGOA56JP8uvehKfkr5o1hSBzy01nfN4IedyTkQ7xvdyz6XC3T
         IFkftQm36EV0wF4w3klzVRR0Tkb44v5WIP4T4vK5Fov86ABD4rw0fZaEfKSZ3tQzcgJc
         6IN49iOFOES9aXOMzFKmxfaQ39SaoYEgsaQP6qE4tCT30dXzT7FKx0uHTKbx02lBjv1Y
         E4mn1kgFnF6TcNfpL9SMc7Gm45Y+C4UtxKOuWwswzB3JEPZPg4Ioox3vgfW8BM4K5GNM
         IJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768028485; x=1768633285;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNcP1mXijjNl4kCMnxSr+8xKGWS9vM9citNIhHTXf2o=;
        b=sUrLdRUFFY5uypjgi6fRYEAoxfHr3m4qTuCpGIA+Cmgs5hm4YavDLAFj8+jb9WAss1
         nXqJT4nDj2E4TpxXmctNl6n5OcPsqKLwi+erhqIViWFMdLGNo8klV42e2UnlagxA6+aH
         eLeJFQHyeFsCF70dUc30NO2va90vMdlwt1a92tBxCNw17QAM2mVXpfvqLcAl2HBIxobZ
         lbP1RSPIv8c/lURujYL6vPPr62U9Z1otaKkyUnNmvL2gsS/y0UKzoql4NWY+j93VYfxw
         /lDjFwDeS6w7A/0FCSe8XJVqWcDPSyAqMf3qvOQZw107CAscCW993Tz+/YV9ULFpmzhT
         BuSA==
X-Gm-Message-State: AOJu0Yz3lTsDIP/F+L6cACIq9bDcxSHUiO0DKRpNlq7MpYglTvYUXsXD
	RBG1mzWN/vcffMIx+C/h9fpI7LgGeMPMR/ruN/FJj/qx2EgX+gAFhlLq2hu4XpcY3ukSyr0qh4c
	fZCAo
X-Gm-Gg: AY/fxX77aQ3uAnOC8/zUHFEKMr74XYl/SzTYsKIj5/WOyhSF/NYWldm5oFIFgZSCM9y
	Lqs0uvKPW0UngsrbGZaFHwxsIChalczVcl+cj+d7tvTiVreRPkS9pGBAHpLeIZtnLguHt/KJoLz
	n+cMn2kLhpHQidsOBhuHXJO9XQHN/Qo6p+t2LszKc6vLdq8Naf6T6vbTMu8xKXngR4CG5AbDVOH
	CJ7f3kpA61gg6i5105UR5scJzDjQKdh4/VcteANsBGsUetnuu1dsBR812v7S5/I0X25/j7C0uxn
	AYHvfwMX3DtDRkAbsnYiqcCkGVaXeeBTtOveUgqqQasFnxqcXzN8/MjOVwZ3dbEsqhthmNztBpZ
	V+PCs8cB0qoLkRs7WTXUujMj24ymVpOenzVlzsZtkvYMaevWZW6egyQCj4M/2P/G2YWa63NwUUw
	kUPQGK0OY266x70tzT
X-Google-Smtp-Source: AGHT+IF2US9uup8IwauoxzjQLkxlPJBhLxw8xjlRqJl3sVhhufhsAH2jDaxrPo+KmfwUF7U6GzvJFQ==
X-Received: by 2002:a05:6000:2204:b0:430:ff41:5c87 with SMTP id ffacd0b85a97d-432c3775a44mr14199493f8f.60.1768028484456;
        Fri, 09 Jan 2026 23:01:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm25902853f8f.4.2026.01.09.23.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 23:01:24 -0800 (PST)
Date: Sat, 10 Jan 2026 10:01:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] drivers/leds/leds-lp50xx.c:503
 lp50xx_probe_dt() warn: missing unwind goto?
Message-ID: <202601100636.DdfDM5g5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260110070120.0cnredXe8dMWVkCvG4WfVEQAH6IYt8YINWvs9zbb2UI@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ab8dd06cde55677f939e0642df31f06126d507d4
commit: 01c412e31d9838cbc71c66dc03569e66ab00bb53 [4/4] leds: leds-lp50xx: Handle reg to get correct multi_index
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100636.DdfDM5g5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601100636.DdfDM5g5-lkp@intel.com/

smatch warnings:
drivers/leds/leds-lp50xx.c:503 lp50xx_probe_dt() warn: missing unwind goto?

vim +503 drivers/leds/leds-lp50xx.c

242b81170fb8a4 Dan Murphy         2020-08-12  440  static int lp50xx_probe_dt(struct lp50xx *priv)
242b81170fb8a4 Dan Murphy         2020-08-12  441  {
242b81170fb8a4 Dan Murphy         2020-08-12  442  	struct fwnode_handle *child = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  443  	struct fwnode_handle *led_node = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  444  	struct led_init_data init_data = {};
242b81170fb8a4 Dan Murphy         2020-08-12  445  	struct led_classdev *led_cdev;
242b81170fb8a4 Dan Murphy         2020-08-12  446  	struct mc_subled *mc_led_info;
242b81170fb8a4 Dan Murphy         2020-08-12  447  	struct lp50xx_led *led;
242b81170fb8a4 Dan Murphy         2020-08-12  448  	int ret = -EINVAL;
242b81170fb8a4 Dan Murphy         2020-08-12  449  	int num_colors;
242b81170fb8a4 Dan Murphy         2020-08-12  450  	u32 color_id;
242b81170fb8a4 Dan Murphy         2020-08-12  451  	int i = 0;
242b81170fb8a4 Dan Murphy         2020-08-12  452  
242b81170fb8a4 Dan Murphy         2020-08-12  453  	priv->enable_gpio = devm_gpiod_get_optional(priv->dev, "enable", GPIOD_OUT_LOW);
9a10def9ceb5fa Andy Shevchenko    2021-02-16  454  	if (IS_ERR(priv->enable_gpio))
9a10def9ceb5fa Andy Shevchenko    2021-02-16  455  		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
9a10def9ceb5fa Andy Shevchenko    2021-02-16  456  				     "Failed to get enable GPIO\n");
242b81170fb8a4 Dan Murphy         2020-08-12  457  
242b81170fb8a4 Dan Murphy         2020-08-12  458  	priv->regulator = devm_regulator_get(priv->dev, "vled");
242b81170fb8a4 Dan Murphy         2020-08-12  459  	if (IS_ERR(priv->regulator))
242b81170fb8a4 Dan Murphy         2020-08-12  460  		priv->regulator = NULL;
242b81170fb8a4 Dan Murphy         2020-08-12  461  
242b81170fb8a4 Dan Murphy         2020-08-12  462  	device_for_each_child_node(priv->dev, child) {
242b81170fb8a4 Dan Murphy         2020-08-12  463  		led = &priv->leds[i];
242b81170fb8a4 Dan Murphy         2020-08-12  464  		ret = fwnode_property_count_u32(child, "reg");
242b81170fb8a4 Dan Murphy         2020-08-12  465  		if (ret < 0) {
556f15fe023ec1 Andy Shevchenko    2021-02-16  466  			dev_err(priv->dev, "reg property is invalid\n");
242b81170fb8a4 Dan Murphy         2020-08-12  467  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  468  		}
242b81170fb8a4 Dan Murphy         2020-08-12  469  
242b81170fb8a4 Dan Murphy         2020-08-12  470  		ret = lp50xx_probe_leds(child, priv, led, ret);
242b81170fb8a4 Dan Murphy         2020-08-12  471  		if (ret)
242b81170fb8a4 Dan Murphy         2020-08-12  472  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  473  
242b81170fb8a4 Dan Murphy         2020-08-12  474  		init_data.fwnode = child;
242b81170fb8a4 Dan Murphy         2020-08-12  475  		num_colors = 0;
242b81170fb8a4 Dan Murphy         2020-08-12  476  
242b81170fb8a4 Dan Murphy         2020-08-12  477  		/*
242b81170fb8a4 Dan Murphy         2020-08-12  478  		 * There are only 3 LEDs per module otherwise they should be
242b81170fb8a4 Dan Murphy         2020-08-12  479  		 * banked which also is presented as 3 LEDs.
242b81170fb8a4 Dan Murphy         2020-08-12  480  		 */
242b81170fb8a4 Dan Murphy         2020-08-12  481  		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
242b81170fb8a4 Dan Murphy         2020-08-12  482  					   sizeof(*mc_led_info), GFP_KERNEL);
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  483  		if (!mc_led_info) {
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  484  			ret = -ENOMEM;
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  485  			goto child_out;
6d8d014c7dcf85 Christophe JAILLET 2020-09-22  486  		}
242b81170fb8a4 Dan Murphy         2020-08-12  487  
242b81170fb8a4 Dan Murphy         2020-08-12  488  		fwnode_for_each_child_node(child, led_node) {
01c412e31d9838 Johan Adolfsson    2025-06-17  489  			int multi_index;
242b81170fb8a4 Dan Murphy         2020-08-12  490  			ret = fwnode_property_read_u32(led_node, "color",
242b81170fb8a4 Dan Murphy         2020-08-12  491  						       &color_id);
242b81170fb8a4 Dan Murphy         2020-08-12  492  			if (ret) {
f1e1d532da7e6e Andy Shevchenko    2021-05-10  493  				fwnode_handle_put(led_node);
242b81170fb8a4 Dan Murphy         2020-08-12  494  				dev_err(priv->dev, "Cannot read color\n");
242b81170fb8a4 Dan Murphy         2020-08-12  495  				goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  496  			}
01c412e31d9838 Johan Adolfsson    2025-06-17  497  			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
01c412e31d9838 Johan Adolfsson    2025-06-17  498  			if (ret != 0) {
01c412e31d9838 Johan Adolfsson    2025-06-17  499  				dev_err(priv->dev, "reg must be set\n");
01c412e31d9838 Johan Adolfsson    2025-06-17  500  				return -EINVAL;
01c412e31d9838 Johan Adolfsson    2025-06-17  501  			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
01c412e31d9838 Johan Adolfsson    2025-06-17  502  				dev_err(priv->dev, "reg %i out of range\n", multi_index);
01c412e31d9838 Johan Adolfsson    2025-06-17 @503  				return -EINVAL;

Missing calls to both fwnode_handle_put(led_node) and
fwnode_handle_put(child).  Better to use the _scoped()
loops.

01c412e31d9838 Johan Adolfsson    2025-06-17  504  			}
242b81170fb8a4 Dan Murphy         2020-08-12  505  
01c412e31d9838 Johan Adolfsson    2025-06-17  506  			mc_led_info[multi_index].color_index = color_id;
242b81170fb8a4 Dan Murphy         2020-08-12  507  			num_colors++;
242b81170fb8a4 Dan Murphy         2020-08-12  508  		}
242b81170fb8a4 Dan Murphy         2020-08-12  509  
242b81170fb8a4 Dan Murphy         2020-08-12  510  		led->priv = priv;
242b81170fb8a4 Dan Murphy         2020-08-12  511  		led->mc_cdev.num_colors = num_colors;
242b81170fb8a4 Dan Murphy         2020-08-12  512  		led->mc_cdev.subled_info = mc_led_info;
242b81170fb8a4 Dan Murphy         2020-08-12  513  		led_cdev = &led->mc_cdev.led_cdev;
242b81170fb8a4 Dan Murphy         2020-08-12  514  		led_cdev->brightness_set_blocking = lp50xx_brightness_set;
242b81170fb8a4 Dan Murphy         2020-08-12  515  
556f15fe023ec1 Andy Shevchenko    2021-02-16  516  		ret = devm_led_classdev_multicolor_register_ext(priv->dev,
242b81170fb8a4 Dan Murphy         2020-08-12  517  						       &led->mc_cdev,
242b81170fb8a4 Dan Murphy         2020-08-12  518  						       &init_data);
242b81170fb8a4 Dan Murphy         2020-08-12  519  		if (ret) {
556f15fe023ec1 Andy Shevchenko    2021-02-16  520  			dev_err(priv->dev, "led register err: %d\n", ret);
242b81170fb8a4 Dan Murphy         2020-08-12  521  			goto child_out;
242b81170fb8a4 Dan Murphy         2020-08-12  522  		}
242b81170fb8a4 Dan Murphy         2020-08-12  523  		i++;
242b81170fb8a4 Dan Murphy         2020-08-12  524  	}
242b81170fb8a4 Dan Murphy         2020-08-12  525  
242b81170fb8a4 Dan Murphy         2020-08-12  526  	return 0;
242b81170fb8a4 Dan Murphy         2020-08-12  527  
242b81170fb8a4 Dan Murphy         2020-08-12  528  child_out:
242b81170fb8a4 Dan Murphy         2020-08-12  529  	fwnode_handle_put(child);
242b81170fb8a4 Dan Murphy         2020-08-12  530  	return ret;
242b81170fb8a4 Dan Murphy         2020-08-12  531  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

