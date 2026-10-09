Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485D49DBB9
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542090; cv=none; b=owIToGfOwKgm+DsOJw/by01NTI0zEbHEDf6fBSmAT5cr2D78NI+YVjBhXnTAcCmUmqyEIoVjL2QNKecZZZqzmwfczqJd3mC1mGQvvXUJ9TgzBcKT75s0+53CB41JTEuH7ijcO4iEf34Mpy1kBZ3qe8ZvNjwnYpxC9XGpdCZc35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542090; c=relaxed/simple;
	bh=gva8dRzsU66XOfL+MYY3MALcneove1cKRMKElUjCXXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CBvTYKo9pPm7jAdO1vRA5GQ4WibmpskhAYwaqBFboAPgHOztoodi57kD0j1V7wWTEcua3yvLvIcHfSkmL4j3ioVfg11CjKzWU7F2ykOfC+oYOdKiYHttsXhqfj/02iUN6GbVWAujXreXRpx7WV82bntkyGGuwMmR6od4mP3BAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAfCdJ0w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAfCdJ0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791542087; x=1823078087;
  h=date:from:to:cc:subject:message-id;
  bh=gva8dRzsU66XOfL+MYY3MALcneove1cKRMKElUjCXXA=;
  b=oAfCdJ0w6nYIa5vttjNH8Q0MOzGPjr/UZKO5h7UMz0mpnPT/yk9QjmSX
   AKE9+Agg5j5iyUwynvFSyLCIFV/AmpwuscCYqkGvssH6+HoUbm7QxYTcR
   Zpp/hPKl8NYZQ9b5Auwd69TgTnFCvubbn7FyuUzf9n3WB5U8WfXcKk3BM
   UQLsySVL7ZPO5tWlV2DrPRPJBwf9wVyWa0rXLDCzHgh4MSZ7/do3VTcbm
   f3kwHDFdUXq2533OZHF9t8drwHkk3+Xc5YztEqwxQK5oYCCZYoDjEgjDH
   xsaq+HbZp2njGWtiMsC7opS4akNTx8XuK+voTVOBti1O9o8xmY+4W5o6z
   g==;
X-CSE-ConnectionGUID: q6kGWUw3RxCm+5gVwiKJtw==
X-CSE-MsgGUID: HWhutor6RZuEapK+ePhOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="226267"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="226267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:34:45 -0700
X-CSE-ConnectionGUID: ht27tXzcRhOPykePZHM2Vw==
X-CSE-MsgGUID: 7BECLefgR8eIXsCV38+IVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="605177"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 03:34:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF7w1-000000006yF-2Hx1;
	Fri, 09 Oct 2026 10:34:41 +0000
Date: Fri, 09 Oct 2026 12:34:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linuxtv-media:next 25/25] drivers/media/i2c/imx576.c:884
 imx576_init_controls() error: buffer overflow 'link_freqs' 3 <= 32
Message-ID: <202610091256.CO5XdQYV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.linuxtv.org/media.git next
head:   ee2e9bf41d3e78b85486986cb861305576c6fe21
commit: ee2e9bf41d3e78b85486986cb861305576c6fe21 [25/25] media: i2c: add imx576 image sensor driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r2202-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091256.CO5XdQYV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 63d485c3ddee18e2838ba7235a4c519eb8fe08b9)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610091256.CO5XdQYV-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx576.c:884 imx576_init_controls() error: buffer overflow 'link_freqs' 3 <= 32

vim +/link_freqs +884 drivers/media/i2c/imx576.c

ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  867  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  868  static int imx576_init_controls(struct imx576 *imx576)
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  869  {
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  870  	struct v4l2_fwnode_device_properties props;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  871  	u64 vblank_def, hblank_def;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  872  	struct v4l2_ctrl_handler *ctrl_hdlr;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  873  	u32 lpfr;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  874  	int ret;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  875  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  876  	ret = v4l2_fwnode_device_parse(imx576->dev, &props);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  877  	if (ret)
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  878  		return ret;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  879  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  880  	ctrl_hdlr = &imx576->handler;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  881  	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  882  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  883  	ret = imx576_pll_calculate(imx576,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19 @884  				   link_freqs[__ffs(imx576->link_freq_bitmap)]);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  885  	if (ret) {
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  886  		v4l2_ctrl_handler_free(ctrl_hdlr);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  887  		dev_err(imx576->sd.dev, "PLL calculations failed: %d\n", ret);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  888  		return ret;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  889  	}
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  890  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  891  	vblank_def = IMX576_VBLANK_DEF - imx576_active_area.height;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  892  	lpfr = vblank_def + imx576_active_area.height;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  893  	imx576->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  894  					     V4L2_CID_EXPOSURE,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  895  					     IMX576_EXPOSURE_MIN,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  896  					     lpfr - IMX576_EXPOSURE_OFFSET,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  897  					     IMX576_EXPOSURE_STEP,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  898  					     IMX576_EXPOSURE_DEFAULT);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  899  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  900  	imx576->gain = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  901  					 V4L2_CID_ANALOGUE_GAIN,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  902  					 IMX576_ANA_GAIN_MIN,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  903  					 IMX576_ANA_GAIN_MAX,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  904  					 IMX576_ANA_GAIN_STEP,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  905  					 IMX576_ANA_GAIN_DEFAULT);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  906  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  907  	imx576->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  908  					   V4L2_CID_VBLANK, vblank_def,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  909  					   IMX576_VBLANK_MAX, 1, vblank_def);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  910  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  911  	v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops, V4L2_CID_PIXEL_RATE,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  912  			  imx576->pll.pixel_rate_pixel_array,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  913  			  imx576->pll.pixel_rate_pixel_array, 1,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  914  			  imx576->pll.pixel_rate_pixel_array);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  915  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  916  	imx576->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx576_ctrl_ops,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  917  						   V4L2_CID_LINK_FREQ,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  918  						   ARRAY_SIZE(link_freqs) - 1,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  919  						   imx576->link_freq_index,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  920  						   link_freqs);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  921  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  922  	hblank_def =  IMX576_LINE_LENGTH - imx576_active_area.width;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  923  	imx576->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  924  					   V4L2_CID_HBLANK, hblank_def,
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  925  					   hblank_def, 1, hblank_def);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  926  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  927  	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx576_ctrl_ops, &props);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  928  	if (ret)
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  929  		goto err_handler_free;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  930  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  931  	if (ctrl_hdlr->error) {
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  932  		ret = ctrl_hdlr->error;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  933  		goto err_handler_free;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  934  	}
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  935  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  936  	imx576->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  937  	imx576->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  938  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  939  	imx576->sd.ctrl_handler = ctrl_hdlr;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  940  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  941  	return 0;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  942  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  943  err_handler_free:
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  944  	v4l2_ctrl_handler_free(ctrl_hdlr);
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  945  
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  946  	return ret;
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  947  }
ee2e9bf41d3e78 Himanshu Bhavani 2026-08-19  948  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
