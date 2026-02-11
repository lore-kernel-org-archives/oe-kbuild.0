Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955662DBF45
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 05:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787955; cv=none; b=gzqubR49luSq8F8eKv8EYPeu+37EqSn6jhnh7/I6owXXpeXG8GAgO0R0/Ub9Ux3Oi3/eoLsPrKBoQ6RCrME875GV+t20luSQyXeIt4Z1VO6UUKgY7lpg1NcLqHbs9riIZpS5IhY2R08l/mibOht55jn1Qp9IUni7xjaduSjRRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787955; c=relaxed/simple;
	bh=DKEnYEJIcjH9VsyVQXmd7gFdtPdOjiuL6VHjR+j9W2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RCd1TZV79EvLbA5AZ8DkSdDuhAs+3juyzvC3EG1uKumjz7NqQm9FJTOGrt0d9gVpW9yCsZYkGV2PpbtpSySNFhPM5i2LYCLaPdQeJ5ZjyGlI1TK6bByJSvaTwJ5kVx20oPGCo1iqYwnmOpibmxBJg0925AzWA/GTdmfS7KNOrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oIVX6njy; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIVX6njy"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so26932495e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 21:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770787952; x=1771392752; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCLQnA8Q5b4PenKSuKJMmgZbDykH+EY39Wyasz8gTF8=;
        b=oIVX6njyZjOe4YCDCb2TGJ26PPoGi+aNn4VzGAyeLYpP2L1NeHQyCUoF/hl33vqSql
         /LEJRWSrfLAAvBAdWlZTfiq6rUQa77WY3uP/HM2+FBRmGeSDKc6GleWwkyC/UUOT/Ksu
         kB6N2WeJn9jLMW0OrbfbKfxE3lEqxH/rADpMIYYiK5YUiVk41MZlMngyHKCl8+6fhqXb
         9ccCX3yqUV+SfTI5KpuqQW6ubbxP2jbyKjPtly9jp0rBOjVNwvik4BJei2wpUrSwRfIm
         IXVIMGVPDYnrLeOi3l2SrS6DYwR9W4cu46eL67MRGe4/l3Z3trmQHj9yhaAiKJNuEv0o
         UM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770787952; x=1771392752;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCLQnA8Q5b4PenKSuKJMmgZbDykH+EY39Wyasz8gTF8=;
        b=jWCJGLhiubXc2leXIikw1GHPxm8d87OpJRZeRTyYoTb72DyUVJ24o4/0X/xTXNtL8m
         KL1B9Vm9HgVfKrw4etqnwt6idxvv6AGprVOSXzi3SgffElOH1VP+fdfGZjV0hNrnHKpU
         IK8Uyi4MwbY0VgYfXumDu7hR5niRD5stbbXV1fs9SVqJV+Ho3AP0hkVfM4F/bz6+a8CG
         PIUxbosx7ZoOtQaabFH7BEeBvae7FvupZ7ksOdpKQ63rWZ3YujlZPyFdEkHzsioP3LgM
         13VSsv+EaU1Dnd9ZWrZdQx4Lk97rPQIkI78pm1nQGTUUq7KsPQnQklb3eF2vTSOtbefc
         eJlA==
X-Gm-Message-State: AOJu0YwM872ATXrIwu/cxXDkHApHh4TbwlPiryRKl6xMjbXQ+Q7Z6XVM
	1Q7m0HOdy/LNTT/J8hxSBKioPAZ5tgAYnfs0m7lrEtQh7moUHPXENOe6XFzctBvv/5wv+062+7Q
	EvqFezec=
X-Gm-Gg: AZuq6aI+CRueFGoIQ6oYa9TcoRMRXV8ZSlwL6nUPrdcHvnaUKoz2Jg+ONVWxkoNrLsU
	bH8kc5pN/MnhoNKopwpphQVQ908OMCQkDQCSR3AmMaYgNW3bztW7j3GG6V/iVB25bKINRvJMKZF
	jSecGjU+scHnST4KWp2q4I1RR1tAGUo9NmiJxRdz0OirMJ3YIeLVmqBiUD2E4xz6C2ilR1/S3Dy
	YbwFmsU+tYyx8afZtZ4taUGHhc6ZtU3lEUyvRgKiIE3lIX91uxnEzPwxuCOeMlwVJF51CJUMRdL
	73ZsFHB/KIVEtx9Ypyh6VVEZmk0zAFkzEBolSb9h8hF2sZtd9bKvtNlvYe1/K1p2EAr9VwvlzY6
	cz049DZU+TeJ0p1yKYMoD5/ujDodkIOKdDp8xr77YrD/k7fk/FK2uXeXY13RFMinH3BQ/g8lENY
	XIchk+Q367RCO5ZHFqjfBNDaSHye4w
X-Received: by 2002:a05:600c:638f:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4835b941194mr16396425e9.31.1770787951347;
        Tue, 10 Feb 2026 21:32:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba3e4b5sm13598315e9.5.2026.02.10.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 21:32:30 -0800 (PST)
Date: Wed, 11 Feb 2026 08:32:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: drivers/pmdomain/mediatek/mtk-pm-domains.c:824
 scpsys_add_one_domain() error: we previously assumed 'pd->data' could be
 null (see line 799)
Message-ID: <202602110354.a2w7BlHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260211053227.JPxd5T5_XEEe4sZ_uZgOyfS6bV3O85_geBSSYKkLmyU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72c395024dac5e215136cbff793455f065603b06
commit: 88914db077b6c2920b29a3ec76109a2fd3cf8d38 pmdomain: mediatek: Add support for Hardware Voter power domains
date:   3 months ago
config: arm64-randconfig-r072-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110354.a2w7BlHC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602110354.a2w7BlHC-lkp@intel.com/

New smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:824 scpsys_add_one_domain() error: we previously assumed 'pd->data' could be null (see line 799)

Old smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:1192 scpsys_probe() warn: missing unwind goto?

vim +824 drivers/pmdomain/mediatek/mtk-pm-domains.c

59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  677  static struct
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  678  generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  679  {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  680  	const struct scpsys_domain_data *domain_data;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  681  	const struct scpsys_hwv_domain_data *hwv_domain_data;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  682  	struct scpsys_domain *pd;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  683  	struct property *prop;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  684  	const char *clk_name;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  685  	int i, ret, num_clks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  686  	struct clk *clk;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  687  	int clk_ind = 0;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  688  	u32 id;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  689  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  690  	ret = of_property_read_u32(node, "reg", &id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  691  	if (ret) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  692  		dev_err(scpsys->dev, "%pOF: failed to retrieve domain id from reg: %d\n",
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  693  			node, ret);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  694  		return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  695  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  696  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  697  	switch (scpsys->soc_data->type) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  698  	case SCPSYS_MTCMOS_TYPE_DIRECT_CTL:
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  699  		if (id >= scpsys->soc_data->num_domains) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  700  			dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  701  			return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  702  		}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  703  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  704  		domain_data = &scpsys->soc_data->domains_data[id];
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  705  		hwv_domain_data = NULL;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  706  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  707  		if (domain_data->sta_mask == 0) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  708  			dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  709  			return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  710  		}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  711  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  712  		break;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  713  	case SCPSYS_MTCMOS_TYPE_HW_VOTER:
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  714  		if (id >= scpsys->soc_data->num_hwv_domains) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  715  			dev_err(scpsys->dev, "%pOF: invalid HWV domain id %d\n", node, id);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  716  			return ERR_PTR(-EINVAL);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  717  		}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  718  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  719  		domain_data = NULL;

The NULL is only for SCPSYS_MTCMOS_TYPE_HW_VOTER.

88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  720  		hwv_domain_data = &scpsys->soc_data->hwv_domains_data[id];
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  721  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  722  		break;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  723  	default:
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  724  		return ERR_PTR(-EINVAL);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  725  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  726  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  727  	pd = devm_kzalloc(scpsys->dev, sizeof(*pd), GFP_KERNEL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  728  	if (!pd)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  729  		return ERR_PTR(-ENOMEM);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  730  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  731  	pd->data = domain_data;
                                                                                                        ^^^^^^^^^^^^^^^^^^^^^^^
Assigned

88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  732  	pd->hwv_data = hwv_domain_data;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  733  	pd->scpsys = scpsys;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  734  
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  735  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
ca824b2d69c52b drivers/pmdomain/mediatek/mtk-pm-domains.c Chen-Yu Tsai               2024-09-30  736  		pd->supply = devm_of_regulator_get_optional(scpsys->dev, node, "domain");
391a2e64d757a0 drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li                  2024-08-28  737  		if (IS_ERR(pd->supply))
391a2e64d757a0 drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li                  2024-08-28  738  			return dev_err_cast_probe(scpsys->dev, pd->supply,
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  739  				      "%pOF: failed to get power supply.\n",
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  740  				      node);
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  741  	}
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  742  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  743  	num_clks = of_clk_get_parent_count(node);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  744  	if (num_clks > 0) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  745  		/* Calculate number of subsys_clks */
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  746  		of_property_for_each_string(node, "clock-names", prop, clk_name) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  747  			char *subsys;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  748  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  749  			subsys = strchr(clk_name, '-');
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  750  			if (subsys)
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  751  				pd->num_subsys_clks++;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  752  			else
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  753  				pd->num_clks++;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  754  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  755  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  756  		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  757  		if (!pd->clks)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  758  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  759  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  760  		pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  761  					       sizeof(*pd->subsys_clks), GFP_KERNEL);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  762  		if (!pd->subsys_clks)
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  763  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  764  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  765  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  766  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  767  	for (i = 0; i < pd->num_clks; i++) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  768  		clk = of_clk_get(node, i);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  769  		if (IS_ERR(clk)) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  770  			ret = PTR_ERR(clk);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  771  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  772  				      "%pOF: failed to get clk at index %d\n", node, i);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  773  			goto err_put_clocks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  774  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  775  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  776  		pd->clks[clk_ind++].clk = clk;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  777  	}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  778  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  779  	for (i = 0; i < pd->num_subsys_clks; i++) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  780  		clk = of_clk_get(node, i + clk_ind);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  781  		if (IS_ERR(clk)) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  782  			ret = PTR_ERR(clk);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  783  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  784  				      "%pOF: failed to get clk at index %d\n", node,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  785  				      i + clk_ind);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  786  			goto err_put_subsys_clocks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  787  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  788  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  789  		pd->subsys_clks[i].clk = clk;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  790  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  791  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  792  	if (scpsys->domains[id]) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  793  		ret = -EINVAL;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  794  		dev_err(scpsys->dev,
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  795  			"power domain with id %d already exists, check your device-tree\n", id);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  796  		goto err_put_subsys_clocks;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  797  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  798  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25 @799  	if (pd->data && pd->data->name)
                                                                                                            ^^^^^^^^


88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  800  		pd->genpd.name = pd->data->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  801  	else if (pd->hwv_data && pd->hwv_data->name)
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  802  		pd->genpd.name = pd->hwv_data->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  803  	else
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  804  		pd->genpd.name = node->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  805  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  806  	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_DIRECT_CTL) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  807  		pd->genpd.power_off = scpsys_power_off;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  808  		pd->genpd.power_on = scpsys_power_on;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  809  	} else {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  810  		pd->genpd.power_off = scpsys_hwv_power_off;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  811  		pd->genpd.power_on = scpsys_hwv_power_on;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  812  
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  813  		/* HW-Voter code can be invoked in atomic context */
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  814  		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  815  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  816  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  817  	/*
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  818  	 * Initially turn on all domains to make the domains usable
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  819  	 * with !CONFIG_PM and to get the hardware in sync with the
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  820  	 * software.  The unused domains will be switched off during
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  821  	 * late_init time.
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  822  	 */
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  823  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30 @824  		if (scpsys_domain_is_on(pd))

Can pd->data be NULL here?  It's dereferenced inside the
scpsys_domain_is_on() function.

c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  825  			dev_warn(scpsys->dev,
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  826  				 "%pOF: A default off power domain has been ON\n", node);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  827  	} else {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  828  		ret = pd->genpd.power_on(&pd->genpd);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  829  		if (ret < 0) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  830  			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
f0fce06e345dc4 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2021-06-01  831  			goto err_put_subsys_clocks;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  832  		}
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  833  
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  834  		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  835  			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  836  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  837  
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  838  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  839  		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  840  
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  841  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  842  		pm_genpd_init(&pd->genpd, NULL, true);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  843  	else
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  844  		pm_genpd_init(&pd->genpd, NULL, false);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  845  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  846  	scpsys->domains[id] = &pd->genpd;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  847  
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  848  	return scpsys->pd_data.domains[id];
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  849  
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  850  err_put_subsys_clocks:
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  851  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  852  err_put_clocks:
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  853  	clk_bulk_put(pd->num_clks, pd->clks);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  854  	return ERR_PTR(ret);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  855  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

