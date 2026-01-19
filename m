Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B8376BCC
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831879; cv=none; b=PPwOTPcO693IAzARjDlba3QW9m61enycjuL6dnDO+y1Es7EFUB9ezCSJzolH7pCLLlnzLTdXoFSBHDTnrX6uusBBc9e/a0aPT/uzeiip8YPQZh72UytFH3ryfdJJIua3QOqTnBwNwJNKVN+w7linpPwphlcjkDHiYIY8xFYs9y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831879; c=relaxed/simple;
	bh=qgyY1fgtkz55G2aCTMjY0jxufr/nbIFOox5rN6FrZQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=inA7ufQtopNmzaj64WDw1HWmxu8tadNpaahpeyMij+geGZhsCzwMkGlRzydkOupXZkJ0iQsRROF0KgPLOm2f+AXpaH5rIwmpiPUSzuzhzoPT0lcvyieCQOrJ9PuK0f/BukXvdW33fSRrN/nDLIJBWjmM1HlQ2ss5FOeIOcx6x28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BigaXk/C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BigaXk/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768831877; x=1800367877;
  h=date:from:to:cc:subject:message-id;
  bh=qgyY1fgtkz55G2aCTMjY0jxufr/nbIFOox5rN6FrZQo=;
  b=BigaXk/CWyy/iKN/XwPDxo/6Vc7aL1skHcYP3u+ssMvQE+josxOUxgXE
   6LXGTCMzDOPk75Ak+t5podRuTSW7bpLs9rgU2L5mzeqnMFMcAaLVz2y2u
   9d7jQrwsEOnXcdTWNPFmb74PtNOW8LscvpU8lEeCI9ula09FxJq+PT4RE
   OSC3yuaaUgHrvq5J75b82csDtxJCNgJaXkCE7ruknn9f4qf7U2/H5SDzN
   9Tm0xlxWwYOltuwfo83WOfNFnj6/tJ81l6gOphhdXlZc8QJWVRkYUrv7B
   Y499yXdaBEPDW7vfU8d9CMmEQ0k7g8wZAL5CL3dQFkWtp9XAIUPFQNz79
   Q==;
X-CSE-ConnectionGUID: OdRpJFHfSyew7EvwcFjiCw==
X-CSE-MsgGUID: OBKSRCW8QPGgl9n+EBbIbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73671645"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73671645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 06:11:17 -0800
X-CSE-ConnectionGUID: IrRYyujbRDSWJktYr+/Hdw==
X-CSE-MsgGUID: 3576w1olTPO6jTMu6DuYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205663721"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2026 06:11:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpyL-00000000Ns1-0hGq;
	Mon, 19 Jan 2026 14:11:13 +0000
Date: Mon, 19 Jan 2026 22:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:277:2-8: ERROR:
 missing put_device; call of_find_device_by_node on line 266, but without a
 corresponding object release within this function.
Message-ID: <202601192256.GbxxuIfX-lkp@intel.com>
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
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 86b1e68fe0869bdcb38ed5283a25931a5581ffcc drm/mediatek: mtk_hdmi: Split driver and add common probe function
date:   9 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: arm64-randconfig-r052-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192256.GbxxuIfX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601192256.GbxxuIfX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_common.c:277:2-8: ERROR: missing put_device; call of_find_device_by_node on line 266, but without a corresponding object release within this function.
   drivers/gpu/drm/mediatek/mtk_hdmi_common.c:287:2-8: ERROR: missing put_device; call of_find_device_by_node on line 266, but without a corresponding object release within this function.

vim +277 drivers/gpu/drm/mediatek/mtk_hdmi_common.c

86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  254  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  255  static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  256  {
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  257  	struct platform_device *cec_pdev;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  258  	struct device_node *cec_np;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  259  	int ret;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  260  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  261  	/* The CEC module handles HDMI hotplug detection */
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  262  	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  263  	if (!cec_np)
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  264  		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  265  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23 @266  	cec_pdev = of_find_device_by_node(cec_np);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  267  	if (!cec_pdev) {
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  268  		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  269  			cec_np);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  270  		of_node_put(cec_np);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  271  		return -EPROBE_DEFER;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  272  	}
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  273  	of_node_put(cec_np);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  274  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  275  	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_device, &cec_pdev->dev);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  276  	if (ret)
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23 @277  		return ret;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  278  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  279  	/*
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  280  	 * The mediatek,syscon-hdmi property contains a phandle link to the
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  281  	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  282  	 * registers it contains.
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  283  	 */
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  284  	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  285  								1, &hdmi->sys_offset);
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  286  	if (IS_ERR(hdmi->sys_regmap))
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  287  		return dev_err_probe(dev, PTR_ERR(hdmi->sys_regmap),
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  288  				     "Failed to get system configuration registers\n");
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  289  
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  290  	hdmi->cec_dev = &cec_pdev->dev;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  291  	return 0;
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  292  }
86b1e68fe0869b AngeloGioacchino Del Regno 2025-10-23  293  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
