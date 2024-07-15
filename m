Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6361FFA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721081795; cv=none; b=g6astXQLt9me/MAnKMjHtYSQ/7k3NZqEmSgSC3Usfy5You3bKjjBc7Vp2sc9Dgd368p8d7tOm+l0o6Yb4jHpRX2RPShxTHIrKmWIGenWuIs4CG/HHexmBCfOPhEC12kEyfTH1snQS38ZDTwuGzn0XGFqsxtNilEJHvbR8W24YZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721081795; c=relaxed/simple;
	bh=Bq29HzNRFuXolk8EmvCPph8TvRvlViLK1pvJYzv0fTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CkR8ju/TBZ6gvI85n901jl+WrN/uivCpVWCAebg+hM7qyDKgJZZZikoritXxnUrzlABAFx8XU/qH2T5qZvbSbewKf6AZRQrALkTY6aEPCHKiIDEr/ct0pD4SNEjip4Y58Hbb/QS5Fz/8YEYewCZR5pW7218Y7vLrVF+YOjM0pkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMLiJov3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMLiJov3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721081793; x=1752617793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bq29HzNRFuXolk8EmvCPph8TvRvlViLK1pvJYzv0fTA=;
  b=kMLiJov31dzVSUH7lHYsz8Q/7VDLqTfmWTQPw9uSdPkpqSOaVsFM8C38
   EJT7VyrKvxylrOqXB4Mrr49E3EpxNhoIeTGkKK6hAVi1OgsYtODdt1vEo
   9gBRYqvOievnZHSR0ZsjOZGGB9AA0eVeMyxsIoEQLt6ST7DAjdKIDmqlb
   Xm8I+X6saMBLdJj5yWpBKjPz1ydWF/g86QFaBN8IjwxxFRNR6y7fBf8mY
   mcY/QwyAyFtjy/tGpemjTr7OrSTKCO8RUdsyYy8QS6LXdB6VT/IPnx3j9
   Q2Yj7GGQDsFf9luEqXzZAI8uyZJyP2zc9b8bA2au9Qp1Cvp9NMMEC5vMs
   g==;
X-CSE-ConnectionGUID: HJvOZU7aSc6esHEkZiUrcg==
X-CSE-MsgGUID: jBKHZR/DSQuJkNzRQucBuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="36030837"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="36030837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 15:16:32 -0700
X-CSE-ConnectionGUID: Y9hAaNC8TJmdtGyWmoJwHA==
X-CSE-MsgGUID: 2U/3KllDTPuyMzdYfGp5xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49857224"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jul 2024 15:16:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTTzg-000ecI-0q;
	Mon, 15 Jul 2024 22:16:28 +0000
Date: Tue, 16 Jul 2024 06:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-lts:6.6/linux 5/6] drivers/media/i2c/ar0234.c:2216:8-33:
 WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
 (unless it is nested IRQ)
Message-ID: <202407160649.U51XlYUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: linya14x <linx.yang@intel.com>
CC: "sys_oak" <sys_oak@intel.com>
CC: zouxiaoh <xiaohong.zou@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   4a129142a97f831bbe99a8f9f94921db80d2d885
commit: 4097a55dada8c5e010edb399bd044b9494cb3e17 [5/6] media: i2c: change ar0234 Kconfig depends on
:::::: branch date: 6 days ago
:::::: commit date: 4 months ago
config: mips-randconfig-r054-20240715 (https://download.01.org/0day-ci/archive/20240716/202407160649.U51XlYUC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202407160649.U51XlYUC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ar0234.c:2216:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +2216 drivers/media/i2c/ar0234.c

e986ee1ba98444c zouxiaoh 2024-01-18  2161  
e986ee1ba98444c zouxiaoh 2024-01-18  2162  static int ar0234_probe(struct i2c_client *client)
e986ee1ba98444c zouxiaoh 2024-01-18  2163  {
e986ee1ba98444c zouxiaoh 2024-01-18  2164  	struct ar0234 *ar0234;
e986ee1ba98444c zouxiaoh 2024-01-18  2165  	int ret;
e986ee1ba98444c zouxiaoh 2024-01-18  2166  
e986ee1ba98444c zouxiaoh 2024-01-18  2167  	ar0234 = devm_kzalloc(&client->dev, sizeof(*ar0234), GFP_KERNEL);
e986ee1ba98444c zouxiaoh 2024-01-18  2168  	if (!ar0234)
e986ee1ba98444c zouxiaoh 2024-01-18  2169  		return -ENOMEM;
e986ee1ba98444c zouxiaoh 2024-01-18  2170  
e986ee1ba98444c zouxiaoh 2024-01-18  2171  	ar0234->platform_data = client->dev.platform_data;
e986ee1ba98444c zouxiaoh 2024-01-18  2172  	if (ar0234->platform_data == NULL) {
e986ee1ba98444c zouxiaoh 2024-01-18  2173  		dev_err(&client->dev, "no platform data provided\n");
e986ee1ba98444c zouxiaoh 2024-01-18  2174  		return -EINVAL;
e986ee1ba98444c zouxiaoh 2024-01-18  2175  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2176  	v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
e986ee1ba98444c zouxiaoh 2024-01-18  2177  	ret = ar0234_identify_module(ar0234);
e986ee1ba98444c zouxiaoh 2024-01-18  2178  	if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2179  		dev_err(&client->dev, "failed to find sensor: %d", ret);
e986ee1ba98444c zouxiaoh 2024-01-18  2180  		return ret;
e986ee1ba98444c zouxiaoh 2024-01-18  2181  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2182  
e986ee1ba98444c zouxiaoh 2024-01-18  2183  	if (ar0234->platform_data->suffix)
e986ee1ba98444c zouxiaoh 2024-01-18  2184  		snprintf(ar0234->sd.name,
e986ee1ba98444c zouxiaoh 2024-01-18  2185  				sizeof(ar0234->sd.name), "ar0234 %c",
e986ee1ba98444c zouxiaoh 2024-01-18  2186  				ar0234->platform_data->suffix);
e986ee1ba98444c zouxiaoh 2024-01-18  2187  
e986ee1ba98444c zouxiaoh 2024-01-18  2188  	mutex_init(&ar0234->mutex);
e986ee1ba98444c zouxiaoh 2024-01-18  2189  	ar0234->cur_mode = &supported_modes[0];
e986ee1ba98444c zouxiaoh 2024-01-18  2190  	ret = ar0234_init_controls(ar0234);
e986ee1ba98444c zouxiaoh 2024-01-18  2191  	if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2192  		dev_err(&client->dev, "failed to init controls: %d", ret);
e986ee1ba98444c zouxiaoh 2024-01-18  2193  		goto probe_error_v4l2_ctrl_handler_free;
e986ee1ba98444c zouxiaoh 2024-01-18  2194  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2195  
e986ee1ba98444c zouxiaoh 2024-01-18  2196  	ar0234->sd.internal_ops = &ar0234_internal_ops;
e986ee1ba98444c zouxiaoh 2024-01-18  2197  	ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
e986ee1ba98444c zouxiaoh 2024-01-18  2198  	ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
e986ee1ba98444c zouxiaoh 2024-01-18  2199  	ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
e986ee1ba98444c zouxiaoh 2024-01-18  2200  	ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
e986ee1ba98444c zouxiaoh 2024-01-18  2201  	ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
e986ee1ba98444c zouxiaoh 2024-01-18  2202  	if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2203  		dev_err(&client->dev, "failed to init entity pads: %d", ret);
e986ee1ba98444c zouxiaoh 2024-01-18  2204  		goto probe_error_v4l2_ctrl_handler_free;
e986ee1ba98444c zouxiaoh 2024-01-18  2205  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2206  
e986ee1ba98444c zouxiaoh 2024-01-18  2207  	if ((ar0234->platform_data->gpios[0] != -1) && (ar0234->platform_data->irq_pin != -1)) {
e986ee1ba98444c zouxiaoh 2024-01-18  2208  		ret = devm_gpio_request(&client->dev,
e986ee1ba98444c zouxiaoh 2024-01-18  2209  				ar0234->platform_data->irq_pin,
e986ee1ba98444c zouxiaoh 2024-01-18  2210  				ar0234->platform_data->irq_pin_name);
e986ee1ba98444c zouxiaoh 2024-01-18  2211  		if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2212  			dev_err(&client->dev, "IRQ pin request failed!\n");
e986ee1ba98444c zouxiaoh 2024-01-18  2213  			goto probe_error_v4l2_ctrl_handler_free;
e986ee1ba98444c zouxiaoh 2024-01-18  2214  		}
e986ee1ba98444c zouxiaoh 2024-01-18  2215  		gpio_direction_input(ar0234->platform_data->irq_pin);
e986ee1ba98444c zouxiaoh 2024-01-18 @2216  		ret = devm_request_threaded_irq(&client->dev,
e986ee1ba98444c zouxiaoh 2024-01-18  2217  				gpio_to_irq(ar0234->platform_data->irq_pin),
e986ee1ba98444c zouxiaoh 2024-01-18  2218  				NULL, ar0234_threaded_irq_fn,
e986ee1ba98444c zouxiaoh 2024-01-18  2219  				ar0234->platform_data->irq_pin_flags,
e986ee1ba98444c zouxiaoh 2024-01-18  2220  				ar0234->platform_data->irq_pin_name,
e986ee1ba98444c zouxiaoh 2024-01-18  2221  				ar0234);
e986ee1ba98444c zouxiaoh 2024-01-18  2222  		if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2223  			dev_err(&client->dev, "IRQ request failed!\n");
e986ee1ba98444c zouxiaoh 2024-01-18  2224  			goto probe_error_v4l2_ctrl_handler_free;
e986ee1ba98444c zouxiaoh 2024-01-18  2225  		}
e986ee1ba98444c zouxiaoh 2024-01-18  2226  
e986ee1ba98444c zouxiaoh 2024-01-18  2227  		ret = devm_gpio_request_one(&client->dev,
e986ee1ba98444c zouxiaoh 2024-01-18  2228  				ar0234->platform_data->gpios[0],
e986ee1ba98444c zouxiaoh 2024-01-18  2229  				GPIOF_OUT_INIT_LOW, "LED");
e986ee1ba98444c zouxiaoh 2024-01-18  2230  		if (ret) {
e986ee1ba98444c zouxiaoh 2024-01-18  2231  			dev_err(&client->dev, "LED GPIO pin request failed!\n");
e986ee1ba98444c zouxiaoh 2024-01-18  2232  			goto probe_error_v4l2_ctrl_handler_free;
e986ee1ba98444c zouxiaoh 2024-01-18  2233  		}
e986ee1ba98444c zouxiaoh 2024-01-18  2234  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2235  
e986ee1ba98444c zouxiaoh 2024-01-18  2236  	ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
e986ee1ba98444c zouxiaoh 2024-01-18  2237  	if (ret < 0) {
e986ee1ba98444c zouxiaoh 2024-01-18  2238  		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
e986ee1ba98444c zouxiaoh 2024-01-18  2239  			ret);
e986ee1ba98444c zouxiaoh 2024-01-18  2240  		goto probe_error_media_entity_cleanup;
e986ee1ba98444c zouxiaoh 2024-01-18  2241  	}
e986ee1ba98444c zouxiaoh 2024-01-18  2242  
e986ee1ba98444c zouxiaoh 2024-01-18  2243  	/*
e986ee1ba98444c zouxiaoh 2024-01-18  2244  	 * Device is already turned on by i2c-core with ACPI domain PM.
e986ee1ba98444c zouxiaoh 2024-01-18  2245  	 * Enable runtime PM and turn off the device.
e986ee1ba98444c zouxiaoh 2024-01-18  2246  	 */
e986ee1ba98444c zouxiaoh 2024-01-18  2247  	pm_runtime_set_active(&client->dev);
e986ee1ba98444c zouxiaoh 2024-01-18  2248  	pm_runtime_enable(&client->dev);
e986ee1ba98444c zouxiaoh 2024-01-18  2249  	pm_runtime_idle(&client->dev);
e986ee1ba98444c zouxiaoh 2024-01-18  2250  	dev_err(&client->dev, "%s Probe Succeeded", ar0234->sd.name);
e986ee1ba98444c zouxiaoh 2024-01-18  2251  
e986ee1ba98444c zouxiaoh 2024-01-18  2252  	return 0;
e986ee1ba98444c zouxiaoh 2024-01-18  2253  
e986ee1ba98444c zouxiaoh 2024-01-18  2254  probe_error_media_entity_cleanup:
e986ee1ba98444c zouxiaoh 2024-01-18  2255  	media_entity_cleanup(&ar0234->sd.entity);
e986ee1ba98444c zouxiaoh 2024-01-18  2256  
e986ee1ba98444c zouxiaoh 2024-01-18  2257  probe_error_v4l2_ctrl_handler_free:
e986ee1ba98444c zouxiaoh 2024-01-18  2258  	v4l2_ctrl_handler_free(ar0234->sd.ctrl_handler);
e986ee1ba98444c zouxiaoh 2024-01-18  2259  	mutex_destroy(&ar0234->mutex);
e986ee1ba98444c zouxiaoh 2024-01-18  2260  	dev_err(&client->dev, "%s Probe Failed", ar0234->sd.name);
e986ee1ba98444c zouxiaoh 2024-01-18  2261  
e986ee1ba98444c zouxiaoh 2024-01-18  2262  	return ret;
e986ee1ba98444c zouxiaoh 2024-01-18  2263  }
e986ee1ba98444c zouxiaoh 2024-01-18  2264  

:::::: The code at line 2216 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
