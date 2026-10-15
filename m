Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CA46EC79
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098248; cv=none; b=b/eZfMOBU4+Q5szuSNPK+sJxj4a93DL5RcpjJ8hUxdI49OGVR9Deh8+mYstm4C3SxGInajN2m2IHOAg3nQnj+oJy38Fp3AbWsKgd5CABpA0KCl+9CM2VBNPqJIbcAP2KWGwtGZD3OBxXIgE4qKMhN4DVDOhx2E8r9uO7UiRZ2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098248; c=relaxed/simple;
	bh=VNd+zytz37tXVYWaylg+aB+nzmTiw9O2AxAD82cvUAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S5EZ5tWtZtBZkhhcwiKo+uhfMX9q8oGgvMj16kugM7E8ep3lWzYkYDUwASJOlD1dtqKPvxtAHy16SsOn/tdYUDd1s4r5eP+Ff2XC5faLNr7jExB5xf9N0PDWv9JY3XumSoT0BuYsxGlHMJr0wIsOaOfzI6T9Xr2lUfE/4PGf0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckJ850Re; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckJ850Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792098243; x=1823634243;
  h=date:from:to:cc:subject:message-id;
  bh=VNd+zytz37tXVYWaylg+aB+nzmTiw9O2AxAD82cvUAA=;
  b=ckJ850RehawWssxFegVCa39N1wIboS8ZnhzPkyAXQVWVUEDg/67VQQCf
   5Kv7j2mDSDl4GnKlOBKmyP3fiYfzrR6fuzr7xXsCnMJrN7t1XHSp5DKHy
   hfD6Lu1HvZFpTQ4k1Apu65eiPpZDzE0A8PKv6E8nVOZgOumqIIAypLdWW
   MLN1COvchYe97aokLLG862ceKp7BF2U/RKb1o56uRJA00ZFxIij40X7gP
   AFog7wt0OmizOXB6iToE/zuT+9WxHcp1KzcfJk7pi0y/swKbZ+zKA7HtF
   knuu4r2TO+DP7AZuhjNis8QJsKxpt2XWBwiukMt3Omaz975TTs7TzvAFx
   g==;
X-CSE-ConnectionGUID: nW249UGeRCSKuDpqecpRug==
X-CSE-MsgGUID: fMEjYYuqQ+aR33kSSW/h0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="899720"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="899720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:04:02 -0700
X-CSE-ConnectionGUID: qwG9uxLhQFq9k6wiDRTyIQ==
X-CSE-MsgGUID: WbOQxhKXSjWOkEU9LlAE4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1677220"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2026 14:04:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHScI-00000000BqL-2IUw;
	Thu, 15 Oct 2026 21:03:58 +0000
Date: Thu, 15 Oct 2026 23:03:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5778/17613]
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648 mt8189_mck_enable() warn:
 missing unwind goto?
Message-ID: <202610152233.eVrGPEyh-lkp@intel.com>
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
TO: bui duc phuc <phucduc.bui@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b810335a0699d1810683796b0e3ffe8827ddfe6c
commit: bd9a8d9def207a8d7eeaa4dda1c53c5b4fca4008 [5778/17613] ASoC: mediatek: mt8189: Propagate MCK enable errors
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261015/202610152233.eVrGPEyh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610152233.eVrGPEyh-lkp@intel.com/

smatch warnings:
sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648 mt8189_mck_enable() warn: missing unwind goto?

vim +648 sound/soc/mediatek/mt8189/mt8189-afe-clk.c

dc637ffeed6c32 Cyril Chao   2025-10-31  614  
dc637ffeed6c32 Cyril Chao   2025-10-31  615  int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
dc637ffeed6c32 Cyril Chao   2025-10-31  616  {
dc637ffeed6c32 Cyril Chao   2025-10-31  617  	struct mt8189_afe_private *afe_priv = afe->platform_priv;
dc637ffeed6c32 Cyril Chao   2025-10-31  618  	int apll = mt8189_get_apll_by_rate(afe, rate);
dc637ffeed6c32 Cyril Chao   2025-10-31  619  	int apll_clk_id = apll == MT8189_APLL1 ?
dc637ffeed6c32 Cyril Chao   2025-10-31  620  			  MT8189_CLK_TOP_MUX_AUD_1 : MT8189_CLK_TOP_MUX_AUD_2;
dc637ffeed6c32 Cyril Chao   2025-10-31  621  	int m_sel_id;
dc637ffeed6c32 Cyril Chao   2025-10-31  622  	int div_clk_id;
dc637ffeed6c32 Cyril Chao   2025-10-31  623  	int ret;
dc637ffeed6c32 Cyril Chao   2025-10-31  624  
dc637ffeed6c32 Cyril Chao   2025-10-31  625  	dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
dc637ffeed6c32 Cyril Chao   2025-10-31  626  
dc637ffeed6c32 Cyril Chao   2025-10-31  627  	if (mck_id >= MT8189_MCK_NUM || mck_id < 0)
dc637ffeed6c32 Cyril Chao   2025-10-31  628  		return -EINVAL;
dc637ffeed6c32 Cyril Chao   2025-10-31  629  
dc637ffeed6c32 Cyril Chao   2025-10-31  630  	m_sel_id = mck_div[mck_id].m_sel_id;
dc637ffeed6c32 Cyril Chao   2025-10-31  631  	div_clk_id = mck_div[mck_id].div_clk_id;
dc637ffeed6c32 Cyril Chao   2025-10-31  632  
dc637ffeed6c32 Cyril Chao   2025-10-31  633  	/* select apll */
dc637ffeed6c32 Cyril Chao   2025-10-31  634  	if (m_sel_id >= 0) {
dc637ffeed6c32 Cyril Chao   2025-10-31  635  		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[m_sel_id]);
dc637ffeed6c32 Cyril Chao   2025-10-31  636  		if (ret)
dc637ffeed6c32 Cyril Chao   2025-10-31  637  			return ret;
dc637ffeed6c32 Cyril Chao   2025-10-31  638  
dc637ffeed6c32 Cyril Chao   2025-10-31  639  		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
dc637ffeed6c32 Cyril Chao   2025-10-31  640  						afe_priv->clk[apll_clk_id]);
dc637ffeed6c32 Cyril Chao   2025-10-31  641  		if (ret)
bd9a8d9def207a bui duc phuc 2026-09-16  642  			goto err_disable_m_sel_clk;
dc637ffeed6c32 Cyril Chao   2025-10-31  643  	}
dc637ffeed6c32 Cyril Chao   2025-10-31  644  
dc637ffeed6c32 Cyril Chao   2025-10-31  645  	/* enable div, set rate */
dc637ffeed6c32 Cyril Chao   2025-10-31  646  	if (div_clk_id < 0) {
dc637ffeed6c32 Cyril Chao   2025-10-31  647  		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
dc637ffeed6c32 Cyril Chao   2025-10-31 @648  		return -EINVAL;
dc637ffeed6c32 Cyril Chao   2025-10-31  649  	}
dc637ffeed6c32 Cyril Chao   2025-10-31  650  
dc637ffeed6c32 Cyril Chao   2025-10-31  651  	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
dc637ffeed6c32 Cyril Chao   2025-10-31  652  	if (ret)
bd9a8d9def207a bui duc phuc 2026-09-16  653  		goto err_disable_m_sel_clk;
dc637ffeed6c32 Cyril Chao   2025-10-31  654  
dc637ffeed6c32 Cyril Chao   2025-10-31  655  	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
dc637ffeed6c32 Cyril Chao   2025-10-31  656  	if (ret)
bd9a8d9def207a bui duc phuc 2026-09-16  657  		goto err_disable_div_clk;
dc637ffeed6c32 Cyril Chao   2025-10-31  658  
dc637ffeed6c32 Cyril Chao   2025-10-31  659  	return 0;
bd9a8d9def207a bui duc phuc 2026-09-16  660  
bd9a8d9def207a bui duc phuc 2026-09-16  661  err_disable_div_clk:
bd9a8d9def207a bui duc phuc 2026-09-16  662  	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
bd9a8d9def207a bui duc phuc 2026-09-16  663  err_disable_m_sel_clk:
bd9a8d9def207a bui duc phuc 2026-09-16  664  	if (m_sel_id >= 0)
bd9a8d9def207a bui duc phuc 2026-09-16  665  		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
bd9a8d9def207a bui duc phuc 2026-09-16  666  
bd9a8d9def207a bui duc phuc 2026-09-16  667  	return ret;
dc637ffeed6c32 Cyril Chao   2025-10-31  668  }
dc637ffeed6c32 Cyril Chao   2025-10-31  669  

:::::: The code at line 648 was first introduced by commit
:::::: dc637ffeed6c32c951520774897601ebd9ffc3d5 ASoC: mediatek: mt8189: support audio clock control

:::::: TO: Cyril Chao <Cyril.Chao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
