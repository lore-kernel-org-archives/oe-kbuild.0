Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76424329E5A
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629769; cv=none; b=gFQ35afN+m9DSMoTO411pF8whpQRd8e/o11xn4/k8T03gzZjDIazO/s+l7+1SJQMIIk8F6R2b0FajSluPxnj2DnGVYu29uekCryozq83wG/76HYReviZl2ERZGsMGO+3vNdr79DPvDrfDzxwFbzYhFazDaLStVKnDmhZkFbICm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629769; c=relaxed/simple;
	bh=Y3FRgO62NHA2qjq6ZKaMnp/20BviGYhGrskWGsxfRA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8qZnIFV/4bdZkm5fcZAm1nQziB/+Q2fA8rSJTpHhz97oVJGDhfVz3IMu22aWCZK7G0MBIfqoYA4RQ0XwHL0QsOhn47T0vQfMWy1hlnEdKy6ciicX7LG9lLj4k1AG/dOY7w7Qj+Sbz5J9i1vZtb9mMcEOcKTt7bypBQRRFG0gf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUB71UHR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUB71UHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774629768; x=1806165768;
  h=date:from:to:cc:subject:message-id;
  bh=Y3FRgO62NHA2qjq6ZKaMnp/20BviGYhGrskWGsxfRA0=;
  b=YUB71UHROURQrOYTgiqRBX0pZhsw/R72vEcPzp+g6LJBHYkhf6ES3pCR
   2NV2UUdab5IOlX+fJaN0YpSlPu7AssfVojgBJspeIr1k+YZxRvq5hVps+
   jjlUUEIFcD5lwhRJhhDUkjLQrvvl2uOPxGKdoWMisN8EeCOK0OlDE5H5t
   U5AkmAuRs8+Msdyd6uW0KW4TJ95omXik8pL5e5m4cBYgZsgb9dET0OTF5
   WhOy5Jh/3pYWTH+AH/uwr6LoSQW16BoQssH5p5l74n5RNE1CL/SrKvQay
   M2bt7qiCeGAo7Av57Q8INpxk0frrZAkL99PumOM5rgJnetleQ6jdfV1bC
   w==;
X-CSE-ConnectionGUID: zFdacBvfRJmMXi58qWjlIA==
X-CSE-MsgGUID: adSHT+ZWTPi277WBFXhqiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75420807"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75420807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:42:48 -0700
X-CSE-ConnectionGUID: pcEbsE0KSS2mYPh8TbtbOA==
X-CSE-MsgGUID: +KZnNsZ5TLOVqgFEoFlAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224409015"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Mar 2026 09:42:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6AGi-00000000ATv-2DRV;
	Fri, 27 Mar 2026 16:42:44 +0000
Date: Sat, 28 Mar 2026 00:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linuxtv-media-pending:next 165/183]
 drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <202603280011.CCbaQy6n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Kate Hsuan <hpa@redhat.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Hans de Goede <johannes.goede@oss.qualcomm.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   4fbeef21f5387234111b5d52924e77757626faa5
commit: fd55319692151de2b89c21356d1445bce364769b [165/183] media: Add t4ka3 camera sensor driver
:::::: branch date: 19 hours ago
:::::: commit date: 29 hours ago
config: um-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280011.CCbaQy6n-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280011.CCbaQy6n-lkp@intel.com/

smatch warnings:
drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success

vim +577 drivers/media/i2c/t4ka3.c

fd55319692151d Kate Hsuan 2026-03-25  557  
fd55319692151d Kate Hsuan 2026-03-25  558  static int t4ka3_enable_stream(struct v4l2_subdev *sd,
fd55319692151d Kate Hsuan 2026-03-25  559  			       struct v4l2_subdev_state *state,
fd55319692151d Kate Hsuan 2026-03-25  560  			       u32 pad, u64 streams_mask)
fd55319692151d Kate Hsuan 2026-03-25  561  {
fd55319692151d Kate Hsuan 2026-03-25  562  	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
fd55319692151d Kate Hsuan 2026-03-25  563  	int ret;
fd55319692151d Kate Hsuan 2026-03-25  564  
fd55319692151d Kate Hsuan 2026-03-25  565  	ret = pm_runtime_get_sync(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  566  	if (ret < 0) {
fd55319692151d Kate Hsuan 2026-03-25  567  		dev_err(sensor->dev, "power-up err.\n");
fd55319692151d Kate Hsuan 2026-03-25  568  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  569  	}
fd55319692151d Kate Hsuan 2026-03-25  570  
fd55319692151d Kate Hsuan 2026-03-25  571  	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
fd55319692151d Kate Hsuan 2026-03-25  572  			    ARRAY_SIZE(t4ka3_init_config), &ret);
fd55319692151d Kate Hsuan 2026-03-25  573  	/* enable group hold */
fd55319692151d Kate Hsuan 2026-03-25  574  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  575  	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  576  			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
fd55319692151d Kate Hsuan 2026-03-25 @577  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  578  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  579  
fd55319692151d Kate Hsuan 2026-03-25  580  	ret = t4ka3_set_mode(sensor, state);
fd55319692151d Kate Hsuan 2026-03-25  581  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  582  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  583  
fd55319692151d Kate Hsuan 2026-03-25  584  	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  585  				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
fd55319692151d Kate Hsuan 2026-03-25  586  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  587  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  588  
fd55319692151d Kate Hsuan 2026-03-25  589  	/* Restore value of all ctrls */
fd55319692151d Kate Hsuan 2026-03-25  590  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
fd55319692151d Kate Hsuan 2026-03-25  591  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  592  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  593  
fd55319692151d Kate Hsuan 2026-03-25  594  	/* disable group hold */
fd55319692151d Kate Hsuan 2026-03-25  595  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
fd55319692151d Kate Hsuan 2026-03-25  596  	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  597  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  598  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  599  
fd55319692151d Kate Hsuan 2026-03-25  600  	sensor->streaming = 1;
fd55319692151d Kate Hsuan 2026-03-25  601  
fd55319692151d Kate Hsuan 2026-03-25  602  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  603  
fd55319692151d Kate Hsuan 2026-03-25  604  error_powerdown:
fd55319692151d Kate Hsuan 2026-03-25  605  	pm_runtime_put(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  606  
fd55319692151d Kate Hsuan 2026-03-25  607  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  608  }
fd55319692151d Kate Hsuan 2026-03-25  609  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
