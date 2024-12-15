Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7131482E3
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734263137; cv=none; b=m1+eZseMAxPwN9b6X1dQyT3nzQeFhiAcW3r8JE2l0jCU+qXXoINfkJ6cOHGAqNT/TXfhcCQCOsqm5mI7Dp/i+9s09S2BdBz6uWUbAfVHcZ/RmHx62Swvtx+JP9RNgbJX+L83HYpBdc3Weu1irMnLrRkJha7UpHQeTwHgcF/ftwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734263137; c=relaxed/simple;
	bh=8IijU3bRYZeLXG/Z+c5Q/FXFvc7maYt8Df7M+WeFIFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOvljRwo2rLVhnSFgBdCjFp2fAsTQt0VUDXCTb+plGlmWPwHXM9YRNWk7T99uEBZGN0eAsiV1rfIyi369ijwXpXDLBNeKtFJ24yNaAB69jPg5O+Qjfw0q1wT7+mWIHj4nDP0OzjCKbY80LO9DW2YoPh/3pSKgrrWNWEoC0FX/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Facz+d5+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Facz+d5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734263135; x=1765799135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IijU3bRYZeLXG/Z+c5Q/FXFvc7maYt8Df7M+WeFIFM=;
  b=Facz+d5+Z7fNhxKxnMbZSfoLWYPlacq2a3DkOsl6FbZqUROqmKBqjpxp
   E0+Obj4EYvRIby/dacy01khM/mmIoL5d1i/e0GZA+B7eGWIUzrcqwTray
   uga9rpoKc6QGi11cVPHE9PYGIs4tiZdqWkZ07QB1jSCG/sBH+6eBrbgqo
   t60UjNpLxcLWL5LcUPFCzOs5T1Y0alY1t9F6mBw5RJ9fN8wbDyNqv/5O9
   pLaoKicFgVPXTU3CIenJ9kXxIgu5qELdAWByrx7dExOC80polIQkUcLVH
   VYjSTIixszB1T/2oc66W8dY3xO0LSjK+NY5KQcWDaxBxvw8Y3Qn14K/C/
   Q==;
X-CSE-ConnectionGUID: 9hIPrRd9ShObzmOV6emVJg==
X-CSE-MsgGUID: /Tk469PeQZCA6gKKcBqyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38589946"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38589946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 03:45:34 -0800
X-CSE-ConnectionGUID: fNx6D+0wSHO3KpuuvNA5Ww==
X-CSE-MsgGUID: 2D1YAcgiRyywQY4oC/r8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="127766805"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2024 03:45:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMn3y-000Das-0i;
	Sun, 15 Dec 2024 11:45:30 +0000
Date: Sun, 15 Dec 2024 19:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:metadata 21/49]
 drivers/media/i2c/ccs/ccs-core.c:781 ccs_set_ctrl() error: uninitialized
 symbol 'pa_src'.
Message-ID: <202412151912.5usBc4dS-lkp@intel.com>
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
head:   f9bbbd9a696df5b2232bac2d6cf7bbab3c31e57a
commit: fcd063eee9887f64bce67f1173dbc2a496b05629 [21/49] media: ccs: Rely on sub-device state locking
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: nios2-randconfig-r073-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151912.5usBc4dS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412151912.5usBc4dS-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ccs/ccs-core.c:781 ccs_set_ctrl() error: uninitialized symbol 'pa_src'.

vim +/pa_src +781 drivers/media/i2c/ccs/ccs-core.c

0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  646  
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  647  static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  648  {
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  649  	struct ccs_sensor *sensor =
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  650  		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  651  			->sensor;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  652  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  653  	struct v4l2_subdev_state *state;
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  654  	struct v4l2_rect *pa_src;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  655  	int pm_status;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  656  	u32 orient = 0;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  657  	unsigned int i;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  658  	int exposure;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  659  	int rval;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  660  
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  661  	if (ctrl->id == V4L2_CID_VBLANK || ctrl->id == V4L2_CID_HBLANK) {
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  662  		state = v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  663  		pa_src = v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  664  						    CCS_STREAM_PIXEL);
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  665  	}
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  666  
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  667  	switch (ctrl->id) {
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  668  	case V4L2_CID_HFLIP:
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  669  	case V4L2_CID_VFLIP:
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  670  		if (sensor->streaming)
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  671  			return -EBUSY;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  672  
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  673  		if (sensor->hflip->val)
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  674  			orient |= CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  675  
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  676  		if (sensor->vflip->val)
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  677  			orient |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  678  
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  679  		ccs_update_mbus_formats(sensor);
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  680  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  681  		break;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  682  	case V4L2_CID_VBLANK:
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  683  		exposure = sensor->exposure->val;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  684  
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  685  		__ccs_update_exposure_limits(sensor, pa_src);
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  686  
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  687  		if (exposure > sensor->exposure->maximum) {
2aa8e838a303c7c drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2016-09-08  688  			sensor->exposure->val =	sensor->exposure->maximum;
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  689  			rval = ccs_set_ctrl(sensor->exposure);
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  690  			if (rval < 0)
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  691  				return rval;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  692  		}
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  693  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  694  		break;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  695  	case V4L2_CID_LINK_FREQ:
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  696  		if (sensor->streaming)
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  697  			return -EBUSY;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  698  
161cc847370a92f drivers/media/i2c/smiapp/ccs-core.c      Sakari Ailus 2020-02-11  699  		rval = ccs_pll_update(sensor);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  700  		if (rval)
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  701  			return rval;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  702  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  703  		return 0;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  704  	case V4L2_CID_TEST_PATTERN:
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  705  		for (i = 0; i < ARRAY_SIZE(sensor->test_data); i++)
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  706  			v4l2_ctrl_activate(
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  707  				sensor->test_data[i],
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  708  				ctrl->val ==
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  709  				V4L2_SMIAPP_TEST_PATTERN_MODE_SOLID_COLOUR);
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  710  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  711  		break;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  712  	}
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  713  
c0ef3df8dbaef51 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2024-01-30  714  	pm_status = pm_runtime_get_if_active(&client->dev);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  715  	if (!pm_status)
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  716  		return 0;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  717  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  718  	switch (ctrl->id) {
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  719  	case V4L2_CID_ANALOGUE_GAIN:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  720  		rval = ccs_write(sensor, ANALOG_GAIN_CODE_GLOBAL, ctrl->val);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  721  
7eb5a7e1e7b6cf7 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  722  		break;
7eb5a7e1e7b6cf7 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  723  
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  724  	case V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN:
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  725  		rval = ccs_write(sensor, ANALOG_LINEAR_GAIN_GLOBAL, ctrl->val);
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  726  
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  727  		break;
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  728  
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  729  	case V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN:
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  730  		rval = ccs_write(sensor, ANALOG_EXPONENTIAL_GAIN_GLOBAL,
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  731  				 ctrl->val);
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  732  
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  733  		break;
57801b6aa72bee1 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-24  734  
7eb5a7e1e7b6cf7 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  735  	case V4L2_CID_DIGITAL_GAIN:
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  736  		if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  737  		    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL) {
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  738  			rval = ccs_write(sensor, DIGITAL_GAIN_GLOBAL,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  739  					 ctrl->val);
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  740  			break;
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  741  		}
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  742  
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  743  		rval = ccs_write_addr(sensor,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  744  				      SMIAPP_REG_U16_DIGITAL_GAIN_GREENR,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  745  				      ctrl->val);
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  746  		if (rval)
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  747  			break;
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  748  
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  749  		rval = ccs_write_addr(sensor,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  750  				      SMIAPP_REG_U16_DIGITAL_GAIN_RED,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  751  				      ctrl->val);
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  752  		if (rval)
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  753  			break;
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  754  
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  755  		rval = ccs_write_addr(sensor,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  756  				      SMIAPP_REG_U16_DIGITAL_GAIN_BLUE,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  757  				      ctrl->val);
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  758  		if (rval)
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  759  			break;
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  760  
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  761  		rval = ccs_write_addr(sensor,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  762  				      SMIAPP_REG_U16_DIGITAL_GAIN_GREENB,
821878578975bae drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  763  				      ctrl->val);
7eb5a7e1e7b6cf7 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-23  764  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  765  		break;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  766  	case V4L2_CID_EXPOSURE:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  767  		rval = ccs_write(sensor, COARSE_INTEGRATION_TIME, ctrl->val);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  768  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  769  		break;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  770  	case V4L2_CID_HFLIP:
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  771  	case V4L2_CID_VFLIP:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  772  		rval = ccs_write(sensor, IMAGE_ORIENTATION, orient);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  773  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  774  		break;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  775  	case V4L2_CID_VBLANK:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  776  		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  777  				 pa_src->height + ctrl->val);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  778  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  779  		break;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  780  	case V4L2_CID_HBLANK:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11 @781  		rval = ccs_write(sensor, LINE_LENGTH_PCK,
fcd063eee9887f6 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2023-09-06  782  				 pa_src->width + ctrl->val);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  783  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  784  		break;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  785  	case V4L2_CID_TEST_PATTERN:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  786  		rval = ccs_write(sensor, TEST_PATTERN_MODE, ctrl->val);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  787  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  788  		break;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  789  	case V4L2_CID_TEST_PATTERN_RED:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  790  		rval = ccs_write(sensor, TEST_DATA_RED, ctrl->val);
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  791  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  792  		break;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  793  	case V4L2_CID_TEST_PATTERN_GREENR:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  794  		rval = ccs_write(sensor, TEST_DATA_GREENR, ctrl->val);
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  795  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  796  		break;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  797  	case V4L2_CID_TEST_PATTERN_BLUE:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  798  		rval = ccs_write(sensor, TEST_DATA_BLUE, ctrl->val);
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  799  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  800  		break;
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  801  	case V4L2_CID_TEST_PATTERN_GREENB:
42aab58f456a28a drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2020-02-11  802  		rval = ccs_write(sensor, TEST_DATA_GREENB, ctrl->val);
0e2a6b7f2b93034 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-05-21  803  
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  804  		break;
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  805  	case V4L2_CID_CCS_SHADING_CORRECTION:
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  806  		rval = ccs_write(sensor, SHADING_CORRECTION_EN,
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  807  				 ctrl->val ? CCS_SHADING_CORRECTION_EN_ENABLE :
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  808  				 0);
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  809  
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  810  		if (!rval && sensor->luminance_level)
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  811  			v4l2_ctrl_activate(sensor->luminance_level, ctrl->val);
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  812  
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  813  		break;
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  814  	case V4L2_CID_CCS_LUMINANCE_CORRECTION_LEVEL:
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  815  		rval = ccs_write(sensor, LUMINANCE_CORRECTION_LEVEL, ctrl->val);
33039a888071019 drivers/media/i2c/ccs/ccs-core.c         Sakari Ailus 2020-09-25  816  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  817  		break;
a328e7e3fd30309 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-06-11  818  	case V4L2_CID_PIXEL_RATE:
a328e7e3fd30309 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-06-11  819  		/* For v4l2_ctrl_s_ctrl_int64() used internally. */
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  820  		rval = 0;
a328e7e3fd30309 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2014-06-11  821  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  822  		break;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  823  	default:
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  824  		rval = -EINVAL;
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  825  	}
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  826  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  827  	if (pm_status > 0) {
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  828  		pm_runtime_mark_last_busy(&client->dev);
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  829  		pm_runtime_put_autosuspend(&client->dev);
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  830  	}
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  831  
96e3a6b92f23a97 drivers/media/i2c/smiapp/smiapp-core.c   Sakari Ailus 2019-09-30  832  	return rval;
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  833  }
ccfc97bdb5ae8b8 drivers/media/video/smiapp/smiapp-core.c Sakari Ailus 2012-03-03  834  

:::::: The code at line 781 was first introduced by commit
:::::: 42aab58f456a28a5d4b175e7cf7d43276ed3d06b media: smiapp: Use CCS registers

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
