Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD22D21D3F5
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 05:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302093; cv=none; b=JhvfHQLcITLj/RJ4hW2eWAKxeOY6tBCEOIdI/P0J2hqL/CSRlqCUziNyF2aLl3TwTXOUh1QT1a67Sfiy1BGjcloibbLQ8jayPKYejj+DWHnQxkJxJ0LzKMQAX68hFr290au9LEM0fVq7Nzjy866pJNPmDImBMacsP0byqBMMJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302093; c=relaxed/simple;
	bh=BYA7M26wz9RqwE6Pxb0jQuiCMUttpqjx5eiXyA1Syn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XnX2SxC81o3fbuqUmuuOiN7Q/MvAu276ebqdtkJ+fZUylmQmqFzfHCEm90F0pnBb8/I5eaDEmrCqQW0QclpF1kz77/+ZM/aibokgJne5LoS9UUeNkN+cMapFsPIX/USBo79KPhkhFBklU1R163NWk9f0P8KBUzLxP4fccRaA8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JR3pFD+g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JR3pFD+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785302092; x=1816838092;
  h=date:from:to:cc:subject:message-id;
  bh=BYA7M26wz9RqwE6Pxb0jQuiCMUttpqjx5eiXyA1Syn8=;
  b=JR3pFD+gkYfQp3Bna6EkOyytdGaq4hMT+AZTuznxlsshKVCGas1L5k1M
   dUhhV4xm4XZoQcviUIIe53NNxP9OiE2+Z/lu9OP4U6m3GOuRSZuherv3/
   nh0dMdXY99GsbMaV/v3i58tOELh/QOnTAmDxL42/IGG872xzO6v2GtYBG
   cGEwFe6pDqbSa0L2wQ9uiNckaR2BvCDmCYj1QvHGevb9cDGWtwsLRv0lD
   WxgU+8YzuUiuEw7fWldg9+DVrnlicBLLd3OFBd3WJPGfjyrxjY31D7prX
   1i3AZcmYXwFm/zhEm7DRhzvVaM5O+OKCHC+scRGjcWaAxZviNPwQCUy7q
   w==;
X-CSE-ConnectionGUID: OXbJDTOQSDePSMmLT+ERDQ==
X-CSE-MsgGUID: m5Dl3fkSQtyw5SbDL04+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85843496"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85843496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 22:14:52 -0700
X-CSE-ConnectionGUID: yC6H/51MQJuAPqFMiTBijQ==
X-CSE-MsgGUID: hC616fyWSL252hs4NBb7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="284450113"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2026 22:14:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wowcx-00000000f3b-3Ycj;
	Wed, 29 Jul 2026 05:14:47 +0000
Date: Wed, 29 Jul 2026 13:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:277:2-8: ERROR:
 missing put_device; call of_find_device_by_node on line 266, but without a
 corresponding object release within this function.
Message-ID: <202607291325.ZFrDm6Mz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
commit: 86b1e68fe0869bdcb38ed5283a25931a5581ffcc drm/mediatek: mtk_hdmi: Split driver and add common probe function
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: nios2-randconfig-r053-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291325.ZFrDm6Mz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 86b1e68fe086 ("drm/mediatek: mtk_hdmi: Split driver and add common probe function")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607291325.ZFrDm6Mz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_common.c:277:2-8: ERROR: missing put_device; call of_find_device_by_node on line 266, but without a corresponding object release within this function.
   drivers/gpu/drm/mediatek/mtk_hdmi_common.c:287:2-8: ERROR: missing put_device; call of_find_device_by_node on line 266, but without a corresponding object release within this function.

vim +277 drivers/gpu/drm/mediatek/mtk_hdmi_common.c

86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  254  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  255  static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  256  {
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  257  	struct platform_device *cec_pdev;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  258  	struct device_node *cec_np;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  259  	int ret;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  260  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  261  	/* The CEC module handles HDMI hotplug detection */
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  262  	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  263  	if (!cec_np)
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  264  		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  265  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23 @266  	cec_pdev = of_find_device_by_node(cec_np);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  267  	if (!cec_pdev) {
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  268  		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  269  			cec_np);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  270  		of_node_put(cec_np);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  271  		return -EPROBE_DEFER;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  272  	}
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  273  	of_node_put(cec_np);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  274  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  275  	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_device, &cec_pdev->dev);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  276  	if (ret)
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23 @277  		return ret;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  278  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  279  	/*
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  280  	 * The mediatek,syscon-hdmi property contains a phandle link to the
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  281  	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  282  	 * registers it contains.
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  283  	 */
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  284  	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  285  								1, &hdmi->sys_offset);
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  286  	if (IS_ERR(hdmi->sys_regmap))
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  287  		return dev_err_probe(dev, PTR_ERR(hdmi->sys_regmap),
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  288  				     "Failed to get system configuration registers\n");
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  289  
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  290  	hdmi->cec_dev = &cec_pdev->dev;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  291  	return 0;
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  292  }
86b1e68fe0869bd AngeloGioacchino Del Regno 2025-10-23  293  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
