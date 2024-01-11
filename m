Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC5C495FB
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jan 2024 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXzJ/xGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704988430; x=1736524430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWnkHcZ/p2WoHEW1DutIU4bnxtyEO5g18x9EyzZrPfQ=;
  b=CXzJ/xGIIGBztKhhcoNGwFVxA591AHiIltUKxRSwIZTc0ylzorjpLGzA
   1Ak/ADe6HQDX7NcQiLm0B6W+sXTI8oOld0gPPCz8ewAJiG7Pe2ne5JHJS
   XvgvuLI0Q83eQQXYsFe43uDApg42/hP2ARnu220PUYhzP4s5MG2Mm/Rpm
   fMODbpyKCJmkO/P15N0yRGiRohESLQgN1y+E6GROahvEQkXpRF64Y+wC1
   WL0/xVURClt8SssOhU/urrb0ezp8TM3Cpr2+nse/Evt2x2MxmLIsINQSy
   8zdkGLuLWG/+ozP6lzbGhHAd1pd9GT9RFwsZz+Mxa3li7fwiQd/0/jx9G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12373823"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="12373823"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 07:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="732271118"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="732271118"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2024 07:53:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNxNI-0008QC-2u;
	Thu, 11 Jan 2024 15:53:45 +0000
Date: Thu, 11 Jan 2024 23:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:metadata 34/36] drivers/media/i2c/ov2740.c:947
 ov2740_enable_streams() warn: missing unwind goto?
Message-ID: <202401112346.2nUZ8Jyd-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   77a04fb9d17b29287728b8fe1da7a196b3364e44
commit: 575405277b30f2459e65cd2a1e6176f34d2440b3 [34/36] media: ov2740: Switch to {enable,disable}_streams
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112346.2nUZ8Jyd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401112346.2nUZ8Jyd-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov2740.c:947 ov2740_enable_streams() warn: missing unwind goto?

vim +947 drivers/media/i2c/ov2740.c

5e6fd339b68df8 Bingbu Cao      2020-11-13  921  
575405277b30f2 Sakari Ailus    2023-10-03  922  static int ov2740_enable_streams(struct v4l2_subdev *sd,
575405277b30f2 Sakari Ailus    2023-10-03  923  				 struct v4l2_subdev_state *state, u32 pad,
575405277b30f2 Sakari Ailus    2023-10-03  924  				 u64 streams_mask)
866edc895171f1 Bingbu Cao      2020-05-11  925  {
575405277b30f2 Sakari Ailus    2023-10-03  926  	struct i2c_client *client = v4l2_get_subdevdata(sd);
575405277b30f2 Sakari Ailus    2023-10-03  927  	struct ov2740 *ov2740 = to_ov2740(sd);
866edc895171f1 Bingbu Cao      2020-05-11  928  	const struct ov2740_reg_list *reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  929  	int link_freq_index;
3b0d0f33795403 Andy Shevchenko 2022-07-26  930  	int ret;
866edc895171f1 Bingbu Cao      2020-05-11  931  
575405277b30f2 Sakari Ailus    2023-10-03  932  	ret = pm_runtime_resume_and_get(&client->dev);
575405277b30f2 Sakari Ailus    2023-10-03  933  	if (ret < 0)
575405277b30f2 Sakari Ailus    2023-10-03  934  		return ret;
575405277b30f2 Sakari Ailus    2023-10-03  935  
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  936  	ret = ov2740_identify_module(ov2740);
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  937  	if (ret)
575405277b30f2 Sakari Ailus    2023-10-03  938  		goto out_pm_put;
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  939  
39cc0f20d1bc2b Andy Shevchenko 2022-07-26  940  	if (ov2740->nvm)
39cc0f20d1bc2b Andy Shevchenko 2022-07-26  941  		ov2740_load_otp_data(ov2740->nvm);
5e6fd339b68df8 Bingbu Cao      2020-11-13  942  
efff0a80bc66dc Hans de Goede   2023-12-04  943  	/* Reset the sensor */
efff0a80bc66dc Hans de Goede   2023-12-04  944  	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
efff0a80bc66dc Hans de Goede   2023-12-04  945  	if (ret) {
efff0a80bc66dc Hans de Goede   2023-12-04  946  		dev_err(&client->dev, "failed to reset\n");
efff0a80bc66dc Hans de Goede   2023-12-04 @947  		return ret;
efff0a80bc66dc Hans de Goede   2023-12-04  948  	}
efff0a80bc66dc Hans de Goede   2023-12-04  949  
efff0a80bc66dc Hans de Goede   2023-12-04  950  	usleep_range(10000, 15000);
efff0a80bc66dc Hans de Goede   2023-12-04  951  
866edc895171f1 Bingbu Cao      2020-05-11  952  	link_freq_index = ov2740->cur_mode->link_freq_index;
866edc895171f1 Bingbu Cao      2020-05-11  953  	reg_list = &link_freq_configs[link_freq_index].reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  954  	ret = ov2740_write_reg_list(ov2740, reg_list);
866edc895171f1 Bingbu Cao      2020-05-11  955  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  956  		dev_err(&client->dev, "failed to set plls\n");
575405277b30f2 Sakari Ailus    2023-10-03  957  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  958  	}
866edc895171f1 Bingbu Cao      2020-05-11  959  
866edc895171f1 Bingbu Cao      2020-05-11  960  	reg_list = &ov2740->cur_mode->reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  961  	ret = ov2740_write_reg_list(ov2740, reg_list);
866edc895171f1 Bingbu Cao      2020-05-11  962  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  963  		dev_err(&client->dev, "failed to set mode\n");
575405277b30f2 Sakari Ailus    2023-10-03  964  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  965  	}
866edc895171f1 Bingbu Cao      2020-05-11  966  
866edc895171f1 Bingbu Cao      2020-05-11  967  	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
866edc895171f1 Bingbu Cao      2020-05-11  968  	if (ret)
575405277b30f2 Sakari Ailus    2023-10-03  969  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  970  
866edc895171f1 Bingbu Cao      2020-05-11  971  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
866edc895171f1 Bingbu Cao      2020-05-11  972  			       OV2740_MODE_STREAMING);
575405277b30f2 Sakari Ailus    2023-10-03  973  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  974  		dev_err(&client->dev, "failed to start streaming\n");
575405277b30f2 Sakari Ailus    2023-10-03  975  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  976  	}
866edc895171f1 Bingbu Cao      2020-05-11  977  
575405277b30f2 Sakari Ailus    2023-10-03  978  	return 0;
575405277b30f2 Sakari Ailus    2023-10-03  979  
575405277b30f2 Sakari Ailus    2023-10-03  980  out_pm_put:
575405277b30f2 Sakari Ailus    2023-10-03  981  	pm_runtime_put_noidle(&client->dev);
866edc895171f1 Bingbu Cao      2020-05-11  982  
575405277b30f2 Sakari Ailus    2023-10-03  983  	return ret;
866edc895171f1 Bingbu Cao      2020-05-11  984  }
866edc895171f1 Bingbu Cao      2020-05-11  985  

:::::: The code at line 947 was first introduced by commit
:::::: efff0a80bc66dcba08e4810fc9eb91c78d5586cf media: ov2740: Add a sleep after resetting the sensor

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
