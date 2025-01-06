Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAAC15990C
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163566; cv=none; b=nXJSDoNGIg/ew2qxGfjObrNNMh7wbidaP8Y4GmhD//1BkqscHLV7jkoJTh1nvp2jm00dDg+kuJaYQ9tWIh33wF0KKveGwiq8IuWn3W2K3RQHfjj7vJVCpkAILLKyVi+bKeQf51CI9RsKmCxjSVRe6XOIHJQ/S18i4PUfvfCOCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163566; c=relaxed/simple;
	bh=26pjsa9xFHb9OG9vxKGj54thfd/2fsofHqoCepdK3/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8LNedvRz+RCcAV/fVJZjwvFgorML4FLU4dlfVch0m41/Q1CahLEcVb8CADrRa6xbwOgEkuQbeweN+ZZKUlvctPM6anapf/4v/3bNOOma4o7rRB3vuh6iMnrHVknQwCS0WYNDVm2rF0mzF4EITkL0p0ljWCq9eZ/LbMXSMLY0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqgEE8uj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqgEE8uj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so7840585f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736163563; x=1736768363; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGGE5ZgPMc/qWU6n7x03EMW8N+ct1TmxeLEwS/agbwU=;
        b=TqgEE8ujGlpP7rs6cvPa9YWAORKTvfmSaew45PuDkEX9+/IXfgWUgQBBCI8UYRzWC0
         ukmuoxrM0+rGrup7TZEp06OzeOuscmoqupuxUmeGS78Bq4EJJOAt+OEdclZds3XWG/kv
         jRnwRHM+ciBOyGZZeD4X1NAaTPKL8xl9DmVLSdNoEZse+4zJeHzujm19kv1Dz01VqcqG
         kL/kWHjSYzGBmGX1BPsb2BmFpKEqVR8+dYnMXXoW5dK7HpeiJc3EucdZRw8I1nKl+ci5
         oK6l2JUa4p1+K3fZLsr12HC5jzznlUh4J/TB83nY7A7NRPydxo4BIMSPfl4a7CRbYEl3
         5eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736163563; x=1736768363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGGE5ZgPMc/qWU6n7x03EMW8N+ct1TmxeLEwS/agbwU=;
        b=a5ReCBswLJKot97nbQQRMuwICa4DX9VuIzDpBVpyzlZDArUhAWVEQNae7Z3fDRY+cn
         V0CtDsywnLftyAuh5HS7YY7TjBEy286OV9LJdZBw5HQn9VAPQ+N/ss0w5OszscJrCxfE
         GmK9Mnuq/PI4FDJdYxt35Tn4dFW7DpzsKDW6rx/6EhlXhLJ8MhqEOEk7oVlavW4gKZvw
         WblnJx+cYLU+js2DKOYq6cf4Xvth3TheZJfa04FOU6LoDdzSc0w9qXkiBtvtyClkDz3z
         uxe+NcT7d1OwhJJZeHmfE/WM9ZntROF0zxTVoYzJg1pwdoAJ/u+U8mjvEaXKGvlLNVpj
         CCng==
X-Gm-Message-State: AOJu0Yz05Qu49y2rNtbeq/79B7sIwSty0/z02iZs3v6F5Pt3O0rveuac
	BEq3fzO/me6pfpcwik+ebMjGRMVK+RC3PwplvL2qMFythXbX2XA65Dn3j+RWI7R+xrthEZiI6EJ
	v
X-Gm-Gg: ASbGncv7SPOfRjMYR7NMIHm1Rt1ybQJfkEKHOAWZRJMOD0afMZYAu3i/7HsIvKNsmOW
	OU5apVJLXBh9jeJuphbPIKVPz3ZMUDypc7Sv0M2Ypj8hbgCwpG7vXGDstc8R+cg/heQXV8G+txN
	ZykkmBBqnBIVSc+l30tkbsv7HS0GoABg2Y1riGIkMuD2JqSnpu5S4dGPISABYVtLJZ5u2xv5S3K
	FyZuVhxJHBX74ph/JWBk83FHw/wd/1vMGGVt97ONAs17r2CZxDrws1x83jmQg==
X-Google-Smtp-Source: AGHT+IErqpiG9dUFlGsnpWUvGF4tVLHkOIJGkA1M5xs+/xZCEUFs+lJ2J8dnZD6u5ktnBPrPKucZQw==
X-Received: by 2002:a5d:64e9:0:b0:385:f56c:d90a with SMTP id ffacd0b85a97d-38a223fd452mr55871172f8f.55.1736163563247;
        Mon, 06 Jan 2025 03:39:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a636asm48935694f8f.88.2025.01.06.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:39:22 -0800 (PST)
Date: Mon, 6 Jan 2025 14:39:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anand Moon <linux.amoon@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [pci:controller/rockchip 1/3]
 drivers/pci/controller/pcie-rockchip.c:134 rockchip_pcie_parse_dt() warn:
 passing zero to 'dev_err_probe'
Message-ID: <dc020ef3-e48a-42cb-aa4c-81d46ebac338@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rockchip
head:   8261bf695c47b98a2d8f63e04e2fc2e4a8c6b12b
commit: fa0ce454cd4ee35703d4126c5b8e4a9a398cf198 [1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250104/202501040409.SUV09R80-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-rockchip.c:134 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +134 drivers/pci/controller/pcie-rockchip.c

964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  115  	rockchip->aclk_rst = devm_reset_control_get_exclusive(dev, "aclk");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  116  	if (IS_ERR(rockchip->aclk_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  117  		if (PTR_ERR(rockchip->aclk_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  118  			dev_err(dev, "missing aclk reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  119  		return PTR_ERR(rockchip->aclk_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  120  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  121  
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  122  	if (rockchip->is_rc)
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  123  		rockchip->perst_gpio = devm_gpiod_get_optional(dev, "ep",
840b7a5edf88fe drivers/pci/controller/pcie-rockchip.c Manivannan Sadhasivam 2024-04-16  124  							       GPIOD_OUT_LOW);
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  125  	else
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  126  		rockchip->perst_gpio = devm_gpiod_get_optional(dev, "reset",
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  127  							       GPIOD_IN);
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  128  	if (IS_ERR(rockchip->perst_gpio))
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  129  		return dev_err_probe(dev, PTR_ERR(rockchip->perst_gpio),
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  130  				     "failed to get PERST# GPIO\n");
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  131  
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  132  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  133  	if (rockchip->num_clks < 0)
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02 @134  		return dev_err_probe(dev, err, "failed to get clocks\n");


"err" is zero.  It should be "rockchip->num_clks".

4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  135  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  136  	return 0;
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  137  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

