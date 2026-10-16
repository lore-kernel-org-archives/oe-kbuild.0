Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096321C862F
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137378; cv=none; b=Wn2Oqb6XRk69zqNRXgt6AK6VWNtKoubIOChQY+GI0+8a1gDxfAc0d7q6ug66p0FuidpoxyO5ilzoxcJiDF/6PiY+0SGR6mA6sLlOMAJtbJgBeBsUky3KbieeFfiLnH0WVKU7Ayps6noycGJZWbp+n9hpz4J59s6RZdo+h8WC8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137378; c=relaxed/simple;
	bh=hvwbX552oM2suY7P305d3B5WENa/WpDtdIW/Mzfxb4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q887VgzqQk02Kox5o49YKwqQe27qGtyqhtF3tvjOwZsGiPYCoZAKPpep++QB3gWNEU5UUkGfUdvferm6YYXQ0GYb9Nces2AVSDBgBxvwpkqBcNagol8WHLpctBtMYCBELDqPBzgSAr5a04Iu1V6190YSKmRYOvpA5Du6MdQwX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZdSrGvk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZdSrGvk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so435519f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 00:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792137375; x=1792742175; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCWQ3v49kNCrQr0bcb3Fgd2+tgxAz2mTLi1UP2zL1Xs=;
        b=AZdSrGvkCvwqrGefnOizEzZc1KWIMUj9FtN77OjR7U1OlDkp4PYMatHlNgq2C076ot
         RytCjWNUb2TnUPLcufHIGIpF4Z48MlqmvCFA9IeDuYUC8jaLTc3hK9bH+ItI939zgy4e
         aG0ZhwFUUaQpv8cSyXPYIsh8jeS7PoajKZLzVAVAHNGTOHPQX5lsjRtX3cFQhihrSQCO
         yiIMXLMZdpIC1+kcEn6sKdXUPtx2n7Z2eJNeTP3Jd0znDY9tonyxtrZ4szfLvJNd97yY
         gETw4BbX1E6NiTgahCar2MAKIzcMYF/MR/i5FHNDCev5gNMQwuWV2tonwPiK0FJ6uk5v
         2TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137375; x=1792742175;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCWQ3v49kNCrQr0bcb3Fgd2+tgxAz2mTLi1UP2zL1Xs=;
        b=j17bApADNQ+JHQ8sIIEycwjBXJANQlskAX/II+rfCOksNCRZPq4EjMBU6FUN1GSrnz
         Qw6LWOkfXv0DP/MLsGPvYdEVA4i+KN5rbkve1C2tW9REUmsRDFsqkFkJCEHPohblCAGX
         MLv39RGSfuOwXzK1SSJfezvMroLFeilVERwk3RNn7nAvDDIGkTT4FYt0ewzEn+/MaQx+
         NsthveRCyhaPrysdclK64yc8r4s6O8n/bNXDHaP3WbetDWwFptzfsNQWxKIS5vDdVshO
         xyuTZm6vgl+00B3uycH47VOCOOwWptt0V+bMgT+n0DcKKL0y+JIIv5OfSvliteKvzQjF
         x1iA==
X-Gm-Message-State: AFq9FYKz0MV1tkZBTpdvCj8IqGmTRelR24L9mR2o/XM/F+2mGdhfr8b+
	d9XzpNFGqdC0f7HwEGzYLwQ/qTrhC1m1HVq97JAtgrU7VmaRZmXrBgfp+pZbwt57WvL1pw==
X-Gm-Gg: AYBFou2+WsFBcwI2Crn06j9ktSGKAo46F2OaJCrahxkANe+77TOgo8HSO7N1s2fz3/8
	tzNFL751rCqQQWn3AfaxM0kgEUQT6/2uszKeNRBAXJ2Xy7NmH7lTLixoSWlohSXq3L10jPAAGEI
	dD8qcaS5z3Xu6KZ3P/r9eaLaYWmZBYQTiMHiMAHxRDRG2KvPJYP2LRnlMBOrH+XBtNE5vfJWusq
	Z7CXQWWrkkOK4VPr4cfwSa65PJS2QGmh+qlWeQXHZSsz80+j15y29ciSbvegYaRAeTy8Lv7R37+
	gb4Vyd9Zs/C8uVdEKPjUgEdvfEjhMxQPgRhPuZiyeklsH84gB4/Fkt0jp10FfsDDbWwuqAxaqPg
	leG5LaVtpYZU7l6WAMIiMr/yCXg6OhZpYhF2hoq5w3++r2X+2eY47HoRDQdf//gTf2kThxf3Opm
	7eLF77lrb9z3Hhi1Fz2c3WoFgh/1PQfwwxaRLklaqum0ZG2nbV1tdKed4R/r/ntLmvKzM=
X-Received: by 2002:a5d:584f:0:b0:48d:fbe0:62e1 with SMTP id ffacd0b85a97d-48dfbe06466mr4728747f8f.27.1792137374714;
        Fri, 16 Oct 2026 00:56:14 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm2889606f8f.7.2026.10.16.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:56:14 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:56:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, bui duc phuc <phucduc.bui@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 5778/17613]
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648 mt8189_mck_enable() warn:
 missing unwind goto?
Message-ID: <202610152233.eVrGPEyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261016075610.MTpRenqOPkervPpSmoX1ei7Zt0co8dM5umC4nXdsf14@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b810335a0699d1810683796b0e3ffe8827ddfe6c
commit: bd9a8d9def207a8d7eeaa4dda1c53c5b4fca4008 [5778/17613] ASoC: mediatek: mt8189: Propagate MCK enable errors
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

cleanup added here

dc637ffeed6c32 Cyril Chao   2025-10-31  643  	}
dc637ffeed6c32 Cyril Chao   2025-10-31  644  
dc637ffeed6c32 Cyril Chao   2025-10-31  645  	/* enable div, set rate */
dc637ffeed6c32 Cyril Chao   2025-10-31  646  	if (div_clk_id < 0) {
dc637ffeed6c32 Cyril Chao   2025-10-31  647  		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
dc637ffeed6c32 Cyril Chao   2025-10-31 @648  		return -EINVAL;

should probably also be added here

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

