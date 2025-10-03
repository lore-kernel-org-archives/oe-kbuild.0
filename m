Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB226CE04
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759480571; cv=none; b=BXHJ0vorrbCigvYJthcQfuAY4i717wcL+Z1XMlqLaz2CQOFMG/FwT/jv0wNVKAFhYspTvOKI5O8PIMhBsJPOKfl8UA6Bg0ke7GrRqRIIcwW4HvzOB3Xindg9+Thd+zxvC3XchALivaRDkj/v3OVVKnkhJvkBmRTjKjSm9W7H1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759480571; c=relaxed/simple;
	bh=PKc37E4toOI+coMwxopVyqNk25skEmj4ksL4V0/afI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dvXhiSLWdos+h6XFMVPswEwz/Ov4ltVUrCZ2MHYcspk33gn5VY6bmqTnzX5GhJKaLa8qN2esTo6GZuMW6fm8tAGpEysjFauyfis/UJR3Ai+HCv5o7PPolh81rSbTsJb4LNSdJUIVeAJmprhixinkCbHGNLScnMJSCUjaBtO1jcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3T/Oqip; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3T/Oqip"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso12805565e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Oct 2025 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759480568; x=1760085368; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=L3T/OqipEgEr/kfjsqrAmXu+I0PhG01/8vBzrueLBSjXARxah74A75a2DjnkzD187E
         T7WxmV3rRCM+AYGfgTz3Sv8yJ+jPmqYezqWMq7A7rHQY7KJllKjBTWI7+vhmpL8gcXVg
         yxLtu9dbY3XQ4ubs7cPWeudftGMayl5XT0Zw1oS9RGJgH1H4hM6FcCRhLiL45VzAk1iH
         cq/+ANP/J/GNKLFxGU5IjTuudzt/2+yefretoPUYMAYNBAr+aGy0HeTVEDZL2iShhY6m
         QSL8PBhSkwXoHpWFc8hu+j4iFIv78tZGYweEyae4ZpNYvhDAJXl3FPlnw41cFnOOxZVj
         ZmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759480568; x=1760085368;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=eyAP41uQqXt3B2+cy4Je1H0smGo2ry+qMSTST0S3Ev38QAM/bHggmF5WUCV6ZFYZhY
         p6mysAmR9lxmC7IeTBl1QrSW+qqhGk1SUZFPbkNDvUs7+t+vBv0IWQD7UFPIU981aD/N
         R/M1kIYiQ8DEzL8HQiabaIX3j1Lz2iS0aHOjHkRDkPMwjxZ16awGM6UCsgO/Wte7zLI/
         So0zSVwV5i5TNtQRsWESIU+lkd1ZPKBx9cPztHF67Y3VtMaEwUfV9bpkYUAV9Pi0tV6g
         d1bqm8EssZETFisa1/QSnG21OUvYXA5c9MaBIiWK9s8zgVIdmqgoKHPpnq9McwTQEjgA
         0zSg==
X-Gm-Message-State: AOJu0YzONvjOg1A7+fLDuObrPjZrEZGbBhqhIWoI5nPKEL5Ck02HJ8HF
	oSBl4Guf7mXR4Gp6oh5AWr9ML61cocsVzY4TfYGBcz++ML+gsfvAbBizLhzPq6Napni84WcNhOE
	+QG40
X-Gm-Gg: ASbGnct2aw/Wbu6P/DbqQAJACj8pQ6+fVTpvRm+WcnubndD+8zltvPzqPgZAkg/USWT
	n4OlgIPy6QXLfFJOYWK59hlYQ7WkkA4LLLf16vTFB9PkXvDS9zMI1NIqNkZt+9rTAP/PdaX0VGD
	ctd/maqvDBMKUDFCxNGQ2kOdbGHdV1yGlH9eIUderuSlq18Yi+jnu5GZbGOXvyRb3NaRxTvhKez
	lHUfmlr+nU1osMCEW+4uzrMZ+Rp0/xwkCh4I1PnnDGTPdmFM9IzCcJkk5dJyRH0H9AGZOgxN8g0
	btBGuW+Xi1W9scNteJc6vwCAkLG6gmpudqsQk8dvytChVwSWWi8+OjKS5OO8wl+V20eCIAGhyy0
	tCluoF+Mc96JccbV73CDatI1W5jXjzz+r4irqCNXZbMF38knDNZacpdr+
X-Google-Smtp-Source: AGHT+IE76AssVOnYZ6flrpm/T7LxOGT/eMAoKYwNOlcK4L0ObcJKZqXObYnm2Ncd1mks7lx/eY9Deg==
X-Received: by 2002:a05:6000:2887:b0:3ee:126a:7aab with SMTP id ffacd0b85a97d-425671c3abemr1117681f8f.57.1759480567855;
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8abf0bsm6826213f8f.17.2025.10.03.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Date: Fri, 3 Oct 2025 11:36:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <202510030902.aQS5rL8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002090028.1796462-7-angelogioacchino.delregno@collabora.com>
Message-ID: <20251003083603.E3wqN6SS5q-IejRbMUCTrSxKOj_Rp2jlEWj2gFjLHxI@z>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251002-170532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251002090028.1796462-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
config: arm-randconfig-r071-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030902.aQS5rL8n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510030902.aQS5rL8n-lkp@intel.com/

smatch warnings:
drivers/regulator/mt6373-regulator.c:664 mt6373_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +664 drivers/regulator/mt6373-regulator.c

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  645  static int mt6373_regulator_probe(struct platform_device *pdev)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  646  {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  647  	struct irq_fwspec fwspec = {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  648  		.param_count = 2,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  649  		.param = { 0, IRQ_TYPE_LEVEL_HIGH },
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  650  	};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  651  	struct device_node *interrupt_parent;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  652  	struct regulator_config config = {};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  653  	struct mt6373_regulator_info *info;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  654  	struct device *dev = &pdev->dev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  655  	struct regulator_dev *rdev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  656  	struct irq_domain *domain;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  657  	bool is_vbuck4_hw_ctrl;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  658  	bool is_cw_variant;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  659  	int i, ret;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  660  	u32 val;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  661  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  662  	config.regmap = mt6373_spmi_register_regmap(dev);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  663  	if (!config.regmap)

This should be if (IS_ERR(config.regmap)) ...

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02 @664  		return dev_err_probe(dev, PTR_ERR(config.regmap)i,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  665  				     "Cannot get regmap\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  666  	config.dev = dev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

