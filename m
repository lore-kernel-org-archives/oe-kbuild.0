Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B111C07D9
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Mar 2025 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741903678; cv=none; b=seAsfEsagTZlxf9UwCN+aEzFKDgRBaHKTvOBmUA0rTz7VEDu/S2x/vHP4hxOyUl7BuIELpgh8YWby0CeR4l2TSEVOrOr3xDawWLaeXEsd20v8Wc9BezUJ7Gkr2utUsGgbGgzxwW49KYZO5DfmheJBkIAMsS2NMNRL4Lo2KI5GYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741903678; c=relaxed/simple;
	bh=1xsOc82ez0rIH2Q1xlpPjvZQwko6X52/OS9XbD6SI9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIFKnXDe/OQRxFNIeHIaDWnfUI07mGSHG7iAgFjlmKlyUqXQiLmmuflxtWWr8VR6NVRTDo0kqr/woZL+JcXxw37JUmGNgM6xauGIZFJwuV8K1Jx+fm8kkY+EPEmsIasFHGyoOKhIHl8XoCY5Cd3RD6PRsiTQrRFA153aBNqIXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw2woBRN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw2woBRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741903676; x=1773439676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xsOc82ez0rIH2Q1xlpPjvZQwko6X52/OS9XbD6SI9E=;
  b=Kw2woBRNdAkKPjCgTMA9HslEbkuMyfkgFOq5n0VVBJ77S0EC1IoLEcsX
   ryDIyHM1jbPWhOFLQk8blGKP4v1Sw+PIhvQeuaFJEwXKDE9EroL0Sr1fL
   05RgmOI4nKaZge8t8HuoqvEWGQKaQ0wNPNTm0G32aUYUpM4vxDtbPVezq
   BwHTUnllrNQ58pmt3bt1Y6NUlpie5UOwq9/aeLjeKHLgRtSvQa9dVSwel
   CuEcNpjOFF2g7NgnmSt29v6etN0TrArNcAmapTMwKLR1hYBodR+OKTApf
   0I35ntVNEY0PbjGG2Y6ITHv7WoZE0i0rtrXOBAWZ4jexXtMzUAx4dQqW2
   w==;
X-CSE-ConnectionGUID: TTYtDoJZQjKFeX2mz8Vt/Q==
X-CSE-MsgGUID: lW4xtC61TWKevCzqU2z0Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="45813735"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="45813735"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 15:07:56 -0700
X-CSE-ConnectionGUID: 5scq3NiGQ8K+IIGsSrkCXQ==
X-CSE-MsgGUID: 2bhtpsaORJu7NMkTsxLbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="126123289"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Mar 2025 15:07:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsqiW-0009xA-1z;
	Thu, 13 Mar 2025 22:07:52 +0000
Date: Fri, 14 Mar 2025 06:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Message-ID: <202503140559.3mp2n2oI-lkp@intel.com>
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
In-Reply-To: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
TO: Pratap Nirujogi <pratap.nirujogi@amd.com>
TO: mchehab@kernel.org
TO: sakari.ailus@linux.intel.com
TO: hverkuil@xs4all.nl
TO: laurent.pinchart@ideasonboard.com
TO: dave.stevenson@raspberrypi.com
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: benjamin.chan@amd.com
CC: Pratap Nirujogi <pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master sailus-media-tree/master v6.14-rc6 next-20250313]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/media-i2c-Add-OV05C-camera-sensor-driver/20250301-005638
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250228165317.3468075-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] media: i2c: Add OV05C camera sensor driver
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250314/202503140559.3mp2n2oI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503140559.3mp2n2oI-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov05c.c:936 ov05c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +936 drivers/media/i2c/ov05c.c

6da03431f4f1e18 Pratap Nirujogi 2025-02-28  921  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  922  static int ov05c_probe(struct i2c_client *client)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  923  {
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  924  	struct ov05c *ov05c;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  925  	int i, ret;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  926  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  927  	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  928  	if (!ov05c)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  929  		return -ENOMEM;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  930  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  931  	client->dev.init_name = DRV_NAME;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  932  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  933  	/* create sensor enable gpio control */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  934  	ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  935  	if (IS_ERR_OR_NULL(ov05c->enable_gpio))
6da03431f4f1e18 Pratap Nirujogi 2025-02-28 @936  		return PTR_ERR(ov05c->enable_gpio);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  937  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  938  	/* Initialize subdev */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  939  	v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  940  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  941  	/* Initialize CCI */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  942  	ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  943  	if (IS_ERR(ov05c->regmap)) {
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  944  		dev_err(&client->dev, "Failed to initialize CCI\n");
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  945  		return PTR_ERR(ov05c->regmap);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  946  	}
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  947  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  948  	/* Set default mode to max resolution */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  949  	ov05c->cur_mode = &supported_modes[0];
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  950  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  951  	/* Initialize V4L2 controls */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  952  	ret = ov05c_init_controls(ov05c);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  953  	if (ret)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  954  		return ret;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  955  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  956  	/* Initialize V4L2 subdev */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  957  	ov05c->sd.internal_ops = &ov05c_internal_ops;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  958  	ov05c->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  959  	ov05c->sd.entity.ops = &ov05c_subdev_entity_ops;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  960  	ov05c->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  961  	ov05c->sd.entity.name = "OV05C";
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  962  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  963  	/* Initialize source pad */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  964  	for (i = 0; i < NUM_OF_PADS; i++)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  965  		ov05c->pads[i].flags = MEDIA_PAD_FL_SOURCE;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  966  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  967  	ret = media_entity_pads_init(&ov05c->sd.entity, NUM_OF_PADS, ov05c->pads);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  968  	if (ret)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  969  		goto error_handler_free;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  970  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  971  	ret = v4l2_async_register_subdev_sensor(&ov05c->sd);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  972  	if (ret)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  973  		goto error_media_entity;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  974  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  975  	/*
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  976  	 * Device is already turned on by i2c-core with ACPI domain PM.
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  977  	 * Enable runtime PM and turn off the device.
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  978  	 */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  979  	pm_runtime_set_active(&client->dev);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  980  	pm_runtime_enable(&client->dev);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  981  	pm_runtime_idle(&client->dev);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  982  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  983  	dev_info(&client->dev, "%s success", __func__);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  984  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  985  	return 0;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  986  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  987  error_media_entity:
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  988  	media_entity_cleanup(&ov05c->sd.entity);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  989  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  990  error_handler_free:
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  991  	ov05c_free_controls(ov05c);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  992  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  993  	return ret;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  994  }
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  995  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
