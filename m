Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13143AF656
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783639451; cv=none; b=sYzyC4Bw0V72p1nZ+mLEF8OOWFn48polw6pfabuSiD22LzZIVXF2/RqrRrALiQrrTselwXJlFt2eoFoeL9XzD5gSjJdS2XuvpYnsBxqPMDZ+noDC8JLtVWVh6CYVXkSbrhu5J3MG3ah724oOiz5DmLgezQtP5sIWfbbXVS+a8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783639451; c=relaxed/simple;
	bh=Pfk+FHScwXrvDBgrXzPrmdb4ezfxBqDPz9NmX49jka8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N4EIgKGgrV7zA91PvH5mivHxFIqvspqpOkZD7hAqcOE0zGmsISVJyLOFT7TaIWXicjq5whF18VrcTbih3yfrfI8lCsK0FGRCeswcf9zQYpmNO2nSAvIbRGLKB0fzc/eigtFp1uyKVPli3Bkov+VHCmHB9MfGq28Jc2yXYD0vYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAl9SuUy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAl9SuUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783639450; x=1815175450;
  h=date:from:to:cc:subject:message-id;
  bh=Pfk+FHScwXrvDBgrXzPrmdb4ezfxBqDPz9NmX49jka8=;
  b=GAl9SuUy6YR4FPO2ioimU3UfpLQgbq+vOG6Gf5JCyfXdmjbBGQX5Dxg6
   Xe7JvXWSTMhE5/a//Hwgn2oOLlZCeyyDZ+vR7Y689Iav4atR/aZsHGONl
   X2dXtXWt8YAvQCjNdjyvlNcSxw3rN0fynP1CBhlwyy0jWs2Gcntak1oDR
   OAnYaDB7uoAM0GTGJJ66ZGFLZrbulezU3QY1xhRScCHf9PUwNAQOYrboO
   PuCQJMybZAVhL3A8xLLOmuM9Ll6gs2Asodcxs0JvdvF8uWS4PLfF0CI3B
   t1zeuKfVtgRA3GeASnijcNdzGeQ1MKH1jrA5j3yao3bO4ouG38NmkS2vu
   Q==;
X-CSE-ConnectionGUID: CWt6U6NwSk2+n1UpSe3mKg==
X-CSE-MsgGUID: +insUt7bTfm/O6wrCmUS/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84309623"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84309623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 16:24:09 -0700
X-CSE-ConnectionGUID: LW9quvbcS2iHMZn80cEh2g==
X-CSE-MsgGUID: rvWYN6hqQguLF/HCKjGYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254238089"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2026 16:24:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1why69-00000000IEx-2S4l;
	Thu, 09 Jul 2026 23:24:05 +0000
Date: Fri, 10 Jul 2026 07:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <202607100734.dguSYSnH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kate Hsuan <hpa@redhat.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Hans de Goede <johannes.goede@oss.qualcomm.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: fd55319692151de2b89c21356d1445bce364769b media: Add t4ka3 camera sensor driver
date:   4 months ago
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
config: arc-randconfig-r072-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100734.dguSYSnH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd5531969215 ("media: Add t4ka3 camera sensor driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607100734.dguSYSnH-lkp@intel.com/

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
