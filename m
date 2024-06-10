Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C127D41D
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718016459; cv=none; b=GzB/o9U8STL8dI/McHXVmawYQbrOsCY8qD2CMFLAwrnd39GgOBbXcl7kxQ1eDvn0eAP47me19B/dNh+883MaMFa0gizavz1gNe1ki1A+wp0EQaIcV0eomZlKYILSiveGm+HieS5af/dvi3CkSWC6NVDN+korOiwfuk4etD7fk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718016459; c=relaxed/simple;
	bh=yvsr1JPL5NbRppYD4Q21xImP5P+VwcuZ4fRapceJPK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gw0FYvFl6c2pedA/2P7iL4qO9TFE6k4pi8/RybXSbbxL65/FF3BCgIW6wJb5C8V4c/GVeLE7o/UgQzY69+mI8N9JOSHE2/eborrSg+x37+29zEpgm18S8gNkEdEm4cVOuuLtvAdi1QulkxGQWPsoqj0DW+0gloNw26Smx5XmTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB1H6J2t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB1H6J2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718016457; x=1749552457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvsr1JPL5NbRppYD4Q21xImP5P+VwcuZ4fRapceJPK0=;
  b=cB1H6J2tg+kTJYfb2UzTGeitGuZyEKA72tOwIgA2TWsyBryLHv/qruGs
   V+to69pNDSdx0LrDHcwdZGHxZ0g2wRCZWnsEA5RLLpVYT2RGd5fGC4AM8
   CKe7Duoar7O6LLUFwU+4da7blgJjzxzB7kWLS91l4NfKSlh0fhuoc7Gkm
   5asLsNkz2z9YfRUcbyCByEx/V4cHSTN2FOP+no1Xcxq/lRULy/4ddL/DB
   oTI58PowquFyxd1hXlapVlNB9uhexonZKVbxcxf0Ci/ywR2lAuKDk/eaf
   x6sknWFUyg4TBumJulwq/YcPB+Tmu7pdPII+HXr97RTBtvEqq+Egar45w
   Q==;
X-CSE-ConnectionGUID: MRojNr6JTEWG4UD2cmx56A==
X-CSE-MsgGUID: Hv5uFBlfTomsyCDvsYGilg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26080808"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26080808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:47:36 -0700
X-CSE-ConnectionGUID: Xoc0dPHNTp2/LsDU1RN0IA==
X-CSE-MsgGUID: YRVM7MFLQeGOeIcayCkVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="76482224"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2024 03:47:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGcYn-000257-1V;
	Mon, 10 Jun 2024 10:47:33 +0000
Date: Mon, 10 Jun 2024 18:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jmondi:imx8mp/media-state/extensible-format 6/8]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:467 rkisp1_isp_start()
 error: uninitialized symbol 'ret'.
Message-ID: <202406101851.Bxtiu89R-lkp@intel.com>
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
TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/media-state/extensible-format
head:   091749220cf4a01bcfc64c9125ab07d632d578fe
commit: 84e966f8b939937d8998c5866a1b63c7b420e504 [6/8] media: rkisp1: Propagate pre/post-config errors
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101851.Bxtiu89R-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406101851.Bxtiu89R-lkp@intel.com/

smatch warnings:
drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:467 rkisp1_isp_start() error: uninitialized symbol 'ret'.

vim +/ret +467 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  434  
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  435  static int rkisp1_isp_start(struct rkisp1_isp *isp,
91eef099f88e17 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-05-09  436  			    const struct v4l2_subdev_state *sd_state,
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  437  			    struct media_pad *source)
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  438  {
bba100df1730f6 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-06-14  439  	struct rkisp1_device *rkisp1 = isp->rkisp1;
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  440  	const struct v4l2_mbus_framefmt *src_fmt;
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  441  	const struct rkisp1_mbus_info *src_info;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  442  	u32 val;
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  443  	int ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  444  
bba100df1730f6 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-06-14  445  	rkisp1_config_clk(isp);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  446  
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  447  	if (rkisp1->info->isp_ver == RKISP1_V_IMX8MP) {
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  448  		ret = rkisp1_gasket_enable(rkisp1, source);
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  449  		if (ret)
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  450  			return ret;
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  451  	}
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  452  
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  453  	/* Activate ISP */
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  454  	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  455  	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  456  	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  457  	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
0ef7dc305bd44d drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-03-03  458  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
4b07e2b8f7b53e drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-08-17  459  
bc0e8d91feec72 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Sakari Ailus     2023-10-13  460  	src_fmt = v4l2_subdev_state_get_format(sd_state,
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  461  					       RKISP1_ISP_PAD_SOURCE_VIDEO);
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  462  	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  463  
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  464  	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
84e966f8b93993 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Jacopo Mondi     2024-05-30  465  		ret = rkisp1_params_post_configure(&rkisp1->params);
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  466  
84e966f8b93993 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Jacopo Mondi     2024-05-30 @467  	return ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  468  }
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
