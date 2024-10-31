Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3621487FE
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357740; cv=none; b=c5MvljPNRQhqrhsAl+yf2jYztPbMqGxdq/dO24R5T8VvJt3MCsKoEKYewBcZCkd2j9+kO8C8sSVXtUZa1kqP7KVrEYo1vPV1fjk3FASUr/uXI75HnWctVstMkXtwCjh27WP/RGPi9iQaD9Z7Mz+9vcgOT21r1eA3Fx6+7a6vVVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357740; c=relaxed/simple;
	bh=jXA9oFykw3OuBucI2N+CAj/uLbtHiwfjVgTejzv6jXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGNOdcwytJfQk6ZrQUSOhGx/NVFQZxvJ2MyUzqXD+hmPBbR6bB1b986w6+CwGzPqx3QmyzyfIWy62ONFhwkv5Hm9MfJRpXMPPv0KDeLfZHKQjSbHkyeRWo7nJ0bi7CHfbNWtAqk5qyq4udOQ/cP6B5+577HI8Ttb+7aekgeSf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCklP0uR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCklP0uR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315eac969aso3140725e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730357736; x=1730962536; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8D9+puWVwIzoPSk4HJ7n7MMOEH8VE9g3cY2YZH179xQ=;
        b=aCklP0uRVS+jdM2gi4zmiDzKnPT0+QCwj7ICGhNDIoQ90VtoIFV/89rMbicoxTrWOI
         3NnA3r/pPrxQKfBmgXGsHoKHt0kr2P5CGC+xjm7Azyn3BecmRjZTCP6MTgad75QriXkQ
         aQ9beEtwZ+m3tkoRX3M9nGMtz8izfesJfY+PH8NwAUSxlR1MVl2STh2XC5Oa7kCy/oZw
         tUn0S98X6nf+HuUjcPXst164Tbg+L3bPK7ZZo7/CiOreV+EkHBai4QIwAXxwsBfEJ2lg
         ieAUNmiiWETGBmauVyFb/WQEpY/5m8RyutOOV8TH+NtX9DSU41xGldCqWEDGJwFbBcDH
         szwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730357736; x=1730962536;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D9+puWVwIzoPSk4HJ7n7MMOEH8VE9g3cY2YZH179xQ=;
        b=guFCGQ3jAJWa3+Y1GDOsSs8msPh0n7hPVKJEc4cDW0Q2vQY01Q5facVWJ0VImaYNj2
         OrWeQcWzindx8YeFn1tiYm6TP4xHs+3kHp19aAYohZrlgXpWighKsbu1tXFnJ5Qz59MK
         0wz1T05XtxKUws2ri+lH+/FZq7eYwZ0wSGNr+K5g70dxYRdRIJrEsPGYrkdDishAnBjT
         fXrr+4HdVKfXaMU/VNdrjUHGj20dM4tDlGXlcztCVr4wq1CnhM+MENcC/Pjk/8NB/oeo
         rfMb53gjIB8BfHpYq/H4zr7CVWRmkJO9EepadKrQt+ue6ZhG7QrJqtTaJMUN6nX+UGfw
         mn4w==
X-Gm-Message-State: AOJu0Yzr+J7AlkwgRMuWp++zscEG+fUd1/yPLy50/c9TgEkcshE8Px4r
	GZojcY7SZ/Go8Bp+Y6OGGDdtXbA5TmBhe4i/WJKS21uATWmzv7ek5zvdyeI8lrMswKPjTORiH1v
	j
X-Google-Smtp-Source: AGHT+IEOF2QFdJBPAHDsR7qGVAzEOGZBYXlj1xAfpsKEmVWbpFfp1A7I0+ODLRmd/9Wl1MkTLOxxRg==
X-Received: by 2002:a05:600c:4f87:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-4327dbd09afmr7992885e9.15.1730357735990;
        Wed, 30 Oct 2024 23:55:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e5e3sm1104741f8f.82.2024.10.30.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:55:35 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:55:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Shengyang Chen <shengyang.chen@starfivetech.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: drivers/phy/starfive/phy-jh7110-dphy-tx.c:335 stf_dphy_init() warn:
 'dphy->txesc_clk' from clk_prepare_enable() not released on lines: 332.
Message-ID: <bd0b71a2-2e54-43ef-b775-3afbd05fc7de@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: d3ab7955330843699cdcc413edd7993923e6c016 phy: starfive: Add mipi dphy tx support
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310715.duo3ShR4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410310715.duo3ShR4-lkp@intel.com/

smatch warnings:
drivers/phy/starfive/phy-jh7110-dphy-tx.c:335 stf_dphy_init() warn: 'dphy->txesc_clk' from clk_prepare_enable() not released on lines: 332.

vim +335 drivers/phy/starfive/phy-jh7110-dphy-tx.c

d3ab7955330843 Shengyang Chen 2024-04-18  309  static int stf_dphy_init(struct phy *phy)
d3ab7955330843 Shengyang Chen 2024-04-18  310  {
d3ab7955330843 Shengyang Chen 2024-04-18  311  	struct stf_dphy *dphy = phy_get_drvdata(phy);
d3ab7955330843 Shengyang Chen 2024-04-18  312  	int ret;
d3ab7955330843 Shengyang Chen 2024-04-18  313  
d3ab7955330843 Shengyang Chen 2024-04-18  314  	stf_dphy_hw_reset(dphy, 1);
d3ab7955330843 Shengyang Chen 2024-04-18  315  
d3ab7955330843 Shengyang Chen 2024-04-18  316  	writel(FIELD_PREP(STF_DPHY_SCFG_PPI_C_READY_SEL, 0) |
d3ab7955330843 Shengyang Chen 2024-04-18  317  	       FIELD_PREP(STF_DPHY_SCFG_DSI_TXREADY_ESC_SEL, 0),
d3ab7955330843 Shengyang Chen 2024-04-18  318  	       dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(48));
d3ab7955330843 Shengyang Chen 2024-04-18  319  
d3ab7955330843 Shengyang Chen 2024-04-18  320  	writel(FIELD_PREP(STF_DPHY_SCFG_C_HS_PRE_ZERO_TIME, 0x30),
d3ab7955330843 Shengyang Chen 2024-04-18  321  	       dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(44));
d3ab7955330843 Shengyang Chen 2024-04-18  322  
d3ab7955330843 Shengyang Chen 2024-04-18  323  	ret = clk_prepare_enable(dphy->txesc_clk);
d3ab7955330843 Shengyang Chen 2024-04-18  324  	if (ret) {
d3ab7955330843 Shengyang Chen 2024-04-18  325  		dev_err(dphy->dev, "Failed to prepare/enable txesc_clk\n");
d3ab7955330843 Shengyang Chen 2024-04-18  326  		return ret;
d3ab7955330843 Shengyang Chen 2024-04-18  327  	}
d3ab7955330843 Shengyang Chen 2024-04-18  328  
d3ab7955330843 Shengyang Chen 2024-04-18  329  	ret = reset_control_deassert(dphy->sys_rst);
d3ab7955330843 Shengyang Chen 2024-04-18  330  	if (ret) {
d3ab7955330843 Shengyang Chen 2024-04-18  331  		dev_err(dphy->dev, "Failed to deassert sys_rst\n");

clk_disable_unprepare(dphy->txesc_clk);?

d3ab7955330843 Shengyang Chen 2024-04-18  332  		return ret;
d3ab7955330843 Shengyang Chen 2024-04-18  333  	}
d3ab7955330843 Shengyang Chen 2024-04-18  334  
d3ab7955330843 Shengyang Chen 2024-04-18 @335  	return 0;
d3ab7955330843 Shengyang Chen 2024-04-18  336  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

