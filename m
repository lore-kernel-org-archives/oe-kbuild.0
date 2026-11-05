Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888286;
	b=uwnCOG2MyEhJoRu5CsKPIsOx6pzLpsQiJxWjP5LlBSKoGbgA64e77Hu97T1WjoIWANzq
	 IAIgTRd1YnoFEWRwnUB+Dzx5pWyvI6eiuIxkyk9UzwXlsZkhs/hZbC2lXjfjJXyLxFSyn
	 qCSXGUic028VMj4ch9TW0+eEIW3zQ9MNYZLAsR2RsDOsoezeSBjLGxLNVH5WhbU2J6Vrd
	 jVlDxYEOec9w+BUCPeQ+pTDDtQtzwEabmkujQMujZcwAvIyT7CcL2aIrqY1jXcm4ZaRZj
	 UBmjS9/AcXMCEWImZupKaoPiG1pxtCSAu7txl4yTeesp8hZRiLbYECRUTVpfXitz2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=00LE7BfL2cYtRCrCOs04ulEWIDht2PUIGLeR01vpBqs=;
	b=VHRcMetMYL60+8k9rkp7LTYMwNEbgeK7ZIj4SOtzbe7A591mWwXvKiiSKxaQ3Ax766xT
	 gtXLvEEpVxFlol6fHIjVlDbgpLkkjdyPbpGpLmnXAm1kpCWuCPvlU5SNtLrOn3l1/LDNE
	 Z/D0V43NS6XNB3qKsZRxzu5xD8sXm6Kh4bpnB5ogJ8ZtR3f29rxIxFlR3qsWj3fPJuJaI
	 n/8ZIEBcrBR5quNLhQjR48eZ9mX5BMNYhls0MEZgy4sOUxsyNV4Bb6iHKm/H4422ETmsF
	 djMDdwbFXDCOXyzTZR+T/YBByoIbkAzgKS+eomFcV10wmMUDCwdf3RLigqLExNh6a6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRNI86WH;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5C606D83C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 14:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB5C606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRNI86WH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793888285; x=1825424285;
  h=date:from:to:cc:subject:message-id;
  bh=rWIqowX5PQLovN0hTORU0aS3UlI17+9bcK1lBRBLGIk=;
  b=NRNI86WHvNTUjouqNDmLXhoM0A4mMf75NHay7Uzyh3G+QaHeKIvUqbZF
   9FSbal6w1SKS+BSnKPfL4yyeIuahgiIRFY2JMiWWLS96xRNK0WzeOVzex
   8PYJ1tI8vS8r9C8yR6QnqweD6fqsOCheqUfhWp2qaYybRSfSwR3RraJwH
   jz71SNJ8VS2x155MeHU7PXpGZRftpHaR8S84A5QVGHryZrXxkOQkD9XPe
   HJmUOCmgFmZXtgYpUFkV/XdrEy/ym1gZegsd/Z1wvtEqI11ehZeGi9DIO
   Mt/i8tjQqkqoihTPJkjjXzq1SiHWJA30SH9GoCMslC3Nlx5lpV+hp0zIi
   g==;
X-CSE-ConnectionGUID: iRLAyJupTz2FjYb5bmbs9w==
X-CSE-MsgGUID: qOQpPsPxQii+DYqu6KhXeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2553177"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2553177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:18:05 -0800
X-CSE-ConnectionGUID: Vkjg6OugSEKv4IRESKeXqA==
X-CSE-MsgGUID: sgPrQESSStWSJIw2H2zN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6882709"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2026 06:18:04 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyHx-000000009fb-1t5i;
	Thu, 05 Nov 2026 14:18:01 +0000
Date: Thu, 05 Nov 2026 15:17:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:277:2-8: ERROR:
 missing put_device; call of_find_device_by_node on line 266, but without a
 corresponding object release within this function.
Message-ID: <202611051538.u00o2X4n-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05441d697f7f9a927264f4058cbbc6a03dfcac9d
commit: 86b1e68fe0869bdcb38ed5283a25931a5581ffcc drm/mediatek: mtk_hdmi: Split driver and add common probe function
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261105/202611051538.u00o2X4n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 86b1e68fe086 ("drm/mediatek: mtk_hdmi: Split driver and add common probe function")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611051538.u00o2X4n-lkp@intel.com/

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
