Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE2921E0A2
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868969; cv=none; b=D9nmYag3w45xhfsPvP91CWBV9qKuN5D+ODXiWQkkou9bkuntYhmeMGMaXnSAOQ+VvpWOZpLTYSp/hjkyiEAbUMJWLLjkYV6smnHGrFWVIRhmh1eVqutXhogZSIk/O/XHn8FxJLCv8Srs+b96UW+b6x2MctxM6enShhrBtYItpag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868969; c=relaxed/simple;
	bh=ZEkTMsLU1tW/01/Yo7gcuUZMhAUQXmtFPl7n/izIBCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZ0scuJTYIkVLuIjLk6ePdP83I5O1ddAJ7aRlWEzLp+Twq7CWph5NpVH1rWRTiZKJlpebBgOqmA1AYRQJUWg02hn+R1Vi0e0p5sLNA0gTjO5N0MAxVRcVffQJ2UK7nm3zgJ21l4spEPiQmIDT2e7FOHkT8kbmVBqqOi0lmao7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjFpcI+S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjFpcI+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747868967; x=1779404967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEkTMsLU1tW/01/Yo7gcuUZMhAUQXmtFPl7n/izIBCo=;
  b=TjFpcI+SbtrqzLaqWwZ/9X2pk39gqKFADZd6RzqtOu8HqEGblsEAEAfn
   emeG/fiOU7QQEXMobKV3L+ofUKuhJQc1iUfdRdFxHFM+1hDb0PD59VCbM
   j/TpNGCdI0H8lOpBSCUsf1qtk/UiBJs6PE/ilYjgNvW9kL8AwrC45wSa2
   iwEJDmAUjsNZVhLkLP4Jdof3nPGvl0pqCeKbcovdzm+1RPCbBgZrNE5C8
   BHAw0wmV/Y5KOga6AynPOdUHEpAYSd4W+4XC2EscztBZN1izO1k9PPJGW
   VcOIaUa/SuNv69F7zzPZFGhETe3O5IJwP8g3ebxJfqPjBOSGAtlOpYboY
   A==;
X-CSE-ConnectionGUID: vsF93lkZQj6vqKBhADxEwg==
X-CSE-MsgGUID: JpAJjA0rR5ujJidfsr1xPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67428675"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="67428675"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:09:26 -0700
X-CSE-ConnectionGUID: cFZlkCHXQDGtOs/eYj/2nw==
X-CSE-MsgGUID: v5yzJvPqQtKLQ8V/2b6AiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="144273608"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2025 16:09:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHsYt-000OiO-1E;
	Wed, 21 May 2025 23:09:23 +0000
Date: Thu, 22 May 2025 07:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
Message-ID: <202505220651.U5WqBCdF-lkp@intel.com>
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
In-Reply-To: <20250517114106.43494-24-hdegoede@redhat.com>
References: <20250517114106.43494-24-hdegoede@redhat.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: Andy Shevchenko <andy@kernel.org>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-staging@lists.linux.dev

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on next-20250521]
[cannot apply to staging/staging-testing staging/staging-next staging/staging-linus linuxtv-media-pending/master linus/master sailus-media-tree/streams v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-gc0310-Rename-dev-function-variable-to-sensor/20250517-194501
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250517114106.43494-24-hdegoede%40redhat.com
patch subject: [PATCH 23/23] media: Move gc0310 sensor drivers to drivers/media/i2c/
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220651.U5WqBCdF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505220651.U5WqBCdF-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/gc0310.c:462 gc0310_enable_streams() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +462 drivers/media/i2c/gc0310.c

ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  452  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  453  static int gc0310_enable_streams(struct v4l2_subdev *sd,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  454  				 struct v4l2_subdev_state *state,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  455  				 u32 pad, u64 streams_mask)
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  456  {
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  457  	struct gc0310_device *sensor = to_gc0310_sensor(sd);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  458  	struct i2c_client *client = v4l2_get_subdevdata(sd);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  459  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  460  
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  461  	ret = pm_runtime_get_sync(&client->dev);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17 @462  	if (ret)
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  463  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  464  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  465  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  466  				     gc0310_reset_register,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  467  				     ARRAY_SIZE(gc0310_reset_register));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  468  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  469  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  470  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  471  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  472  				     gc0310_VGA_30fps,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  473  				     ARRAY_SIZE(gc0310_VGA_30fps));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  474  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  475  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  476  
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  477  	/* restore value of all ctrls */
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  478  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  479  
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  480  	/* enable per frame MIPI and sensor ctrl reset  */
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  481  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  482  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  483  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  484  		  GC0310_REGISTER_PAGE_3, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  485  	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  486  		  GC0310_START_STREAMING, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  487  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  488  		  GC0310_REGISTER_PAGE_0, &ret);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  489  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  490  error_power_down:
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  491  	if (ret)
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  492  		pm_runtime_put(&client->dev);
2b2297b11bb506 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  493  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  494  	return ret;
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  495  }
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  496  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
