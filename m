Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD53F242930
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369136; cv=none; b=qlhT8PQu0ZNlP8n5m22e1owPMqfyix0o74pHOHr7GdtH/2EkPaxEgfqM/w8cFTN/mgWHIuVaPyFpTFNp9hoNCr5h8KvWOn3iZYIvV4s9iZA+Y9MiGkHzQopK3RjnX95IHW7WKePQbYT9ubNwUFCq0TvX6NsKFLdDHux4b6Nyy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369136; c=relaxed/simple;
	bh=A6iritQzi/XyfqabjcET0S9R6vuI/pOfYHbEPn2e2YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aXktq6zD4+uZxgGYNeEeGUHPmm9wTgkvofxDVOLsroYrCzR6MTcaC66j8FoGQ6AwfDv+5aIkh36sQ6YQq+6tYa/Rl5bTm4KwpTUiUNYikWvNZz70MoyVhjW8fSsQ/ZQa+WBCg2O8QY1JysMUmIKNZJVpdKv7+3GK+nXFv8nHnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hY3fXcEa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hY3fXcEa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bdf0cbb6bso12432725e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 07 Mar 2025 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741369132; x=1741973932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbhsOaksWfSrIW8u1uBJdU7SRRrY2hqIxanWZ0O00C8=;
        b=hY3fXcEajTMM99PrYqFh3H3yLyJIdOb9yFvfQobXgyThSPwfYXAvahzdV4dMuL9hsM
         OTMeauc7+0WYL9UCf4Z7rw4J7cmNZErP3Jxk3WgSzhkQ/TjSYQFSGA8pgCFEYpG38B8e
         bDLvHBFr4VIEcDiOvfJqiu/61W5KojG4ZrvmpeXIvWvZk5YoSF6Vk+iXGhFU1qIgjKRs
         d8Yzl8vWOG5ksDIx83IoY5Q3cySnJ47I8BSKpJKnLbXkwBOH6FaNoV/4eyKxN0g+Wq91
         tERANWtYi6DAEj2oMTt0TYt5laCSA1pbYDGjNIqqFuHwnngUJmTNGdAVtEOUN5gXMsiT
         L9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369132; x=1741973932;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbhsOaksWfSrIW8u1uBJdU7SRRrY2hqIxanWZ0O00C8=;
        b=cJibyr+FhL0eE/yhYZKzjmNbhq2gtmkVi4nWAvX/SzEv/h4tjtePVo28RQw9cekQCB
         X7oV7zwK9SpA7wRAqfTpjcsrQ/BX3rzVmZrZ1FCwn97ST4hiqYMZ9z0Xc8xB3S3UHZFQ
         fg7eReD3ZJpnzQfniioguYlmXvmTwkMwE4xDPp5KDI6MA5GkKifape6Cv7UH2SXhbEHr
         htqmIXjuB9waoreZTr2Km8EVtXOT4/FLmexduZzZf0Qq6ITRoUlLd0rnQUpqmwhsH9+U
         xZUItfZJYnU8HXsBslKBTg23LWctcv8h8AqXlsca0GpM5EF8DGa1hpnzIiM8LSu96eio
         SZMA==
X-Gm-Message-State: AOJu0YzLPLJT2LT5Xx0yPbdPXa989UHVjQl/8LKZHQ6u0aviXgfJ9/zh
	8sAQJAsPXQgBGgDpytyBLxnpF/yn1BfOAQbbsoSdrImpecCLTYF4fQI7wGrgQTlCaZPd0jPE3bQ
	2
X-Gm-Gg: ASbGncuP5JTB6IqD/MPl8yZDA8U/jcBfcoilbx2ldZJbaQQtlyCxcHj9WLskSCA4r66
	q/7w7u09fnsimXC4nw9W14lUYZrWSGQu60dUdWHJt0LcvO16NeGRpOHLB/j+1eN/T8pJIx9Nxp6
	id8gyRt8nk6fUuvQuFbwi1kZAv0Cf8nm31+bSShSaZ1+s57Jcv9KNvzAhYUSsRbBPbx1Pogh0ze
	pk0wIvcttYwZKhYrgIM6SxWVjZDzSQWU6zPbKPS+WeCHK9UCviUuEOB0p2tLTLZX9SH989M1H5Z
	5dqG0I8MkKHxxvIgzILs6zY7fLshu7MqTCeErZRBc/RAVp5+Cw==
X-Google-Smtp-Source: AGHT+IGjlugzKmmxYS6YdwzXxtlXE4bzioPLgN5lZda7k+mvVXrIjN3iK1ETSrhFkaR7AXVaN1i8cA==
X-Received: by 2002:a05:600c:4f11:b0:439:9f97:7d67 with SMTP id 5b1f17b1804b1-43c601e1173mr37208455e9.16.1741369132091;
        Fri, 07 Mar 2025 09:38:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42c6203sm87520795e9.24.2025.03.07.09.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:38:51 -0800 (PST)
Date: Fri, 7 Mar 2025 20:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
Message-ID: <551a7b8d-1f2d-429f-b7fd-c8ea1afdcf25@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-phy-rename-qcom-snps-eusb2-phy-binding-to-snps-eusb2-phy/20250223-202709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223122227.725233-5-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072305.Osodtcnk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503072305.Osodtcnk-lkp@intel.com/

smatch warnings:
drivers/phy/phy-snps-eusb2.c:452 snps_eusb2_hsphy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +452 drivers/phy/phy-snps-eusb2.c

15a1981f608b0f Ivaylo Ivanov 2025-02-23  399  static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  400  {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  401  	struct device *dev = &pdev->dev;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  402  	struct device_node *np = dev->of_node;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  403  	struct snps_eusb2_hsphy *phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  404  	struct phy_provider *phy_provider;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  405  	struct phy *generic_phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  406  	const struct snps_eusb2_phy_drvdata *drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  407  	int ret, i;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  408  	int num;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  409  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  410  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  411  	if (!phy)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  412  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  413  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  414  	drv_data = of_device_get_match_data(dev);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  415  	if (!drv_data)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  416  		return -EINVAL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  417  	phy->data = drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  418  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  419  	phy->base = devm_platform_ioremap_resource(pdev, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  420  	if (IS_ERR(phy->base))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  421  		return PTR_ERR(phy->base);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  422  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  423  	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  424  	if (IS_ERR(phy->phy_reset))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  425  		return PTR_ERR(phy->phy_reset);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  426  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  427  	phy->clks = devm_kcalloc(dev,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  428  				 phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  429  				 sizeof(*phy->clks),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  430  				 GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  431  	if (!phy->clks)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  432  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  433  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  434  	for (int i = 0; i < phy->data->num_clks; ++i)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  435  		phy->clks[i].id = phy->data->clk_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  436  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  437  	ret = devm_clk_bulk_get(dev, phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  438  				phy->clks);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  439  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  440  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  441  				     "failed to get phy clock(s)\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  442  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  443  	phy->ref_clk = NULL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  444  	for (int i = 0; i < phy->data->num_clks; ++i) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  445  		if (!strcmp(phy->clks[i].id, "ref")) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  446  			phy->ref_clk = phy->clks[i].clk;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  447  			break;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  448  		}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  449  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  450  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  451  	if (IS_ERR_OR_NULL(phy->ref_clk))
15a1981f608b0f Ivaylo Ivanov 2025-02-23 @452  		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),

PTR_ERR(phy->ref_clk) is success.

15a1981f608b0f Ivaylo Ivanov 2025-02-23  453  				     "failed to get ref clk\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  454  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  455  	num = ARRAY_SIZE(phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  456  	for (i = 0; i < num; i++)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  457  		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  458  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  459  	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  460  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  461  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  462  				     "failed to get regulator supplies\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  463  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  464  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  465  	if (IS_ERR(phy->repeater))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  466  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  467  				     "failed to get repeater\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  468  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  469  	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  470  	if (IS_ERR(generic_phy)) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  471  		dev_err(dev, "failed to create phy %d\n", ret);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  472  		return PTR_ERR(generic_phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  473  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  474  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  475  	dev_set_drvdata(dev, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  476  	phy_set_drvdata(generic_phy, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  477  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  478  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  479  	if (IS_ERR(phy_provider))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  480  		return PTR_ERR(phy_provider);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  481  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  482  	dev_info(dev, "Registered Snps-eUSB2 phy\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  483  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  484  	return 0;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  485  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

