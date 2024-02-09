Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB874E04
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 17:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498151; cv=none; b=YPfQLxIMjPu0uWNCalVVAH47WYAc4wRB4uXO/5Wd4hv3ZzgnnrrHHCwckdtH4X/MoMFsoevkjpXLi0CWk8F8IBikq9SXOrsRQR3Utfa9TVqYbrPYTCmAVyNkftfRqAUppvmo7Am3eeYKPCtNEKQ7de+6eolrzL1EuxM1VcbIEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498151; c=relaxed/simple;
	bh=lnhEn9vY6QlxiFk2rpKMoidP2MF7gVLrYSZhxeR+9kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tk/Fp5bASZLeVLyLmoFUcO67BfBIH5VPTGO9tv3zc+YT6kXCzk1+iToxjdYMbRUHY0We5mdFgyZSvqNxQAA1j9HKoypKHz65zHKD2dH3JYvAxyIIfntsrwUxo0UXD5rxFs01Pr3YrsOXc/Fk7y8Xg/u459/CIVNkeT4JtpITsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZZnb1hq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZZnb1hq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5601eb97b29so2312639a12.0
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Feb 2024 09:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707498146; x=1708102946; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZYxkJvmyvwo7sccM5VPUtTxUyq0KncuIUTdYNLgjm0=;
        b=hZZnb1hqqYcKqriY66r1MVQB/7roz+eztlHHyISwPX075NG8SM3yN93MCKQ7IRT/Ht
         Q4JDcEZebahxDpdRepTWGHo0AHNcc+jyAYs7HgrLhJZf7b9X8blp2dtVJOdOARRblOmy
         xtXA7U5r1apw2WfP7KPOxwWxSdcXxQVo8oCNymt58nQuEjopU/6sQkHNoKY33G1dbSVB
         9etFANlwwk7sy3tx7GSFdVTZIoLP7T9GmkHMcmcWUqgl90tUzKyLKY/UZzG6amfkaNsg
         GuRn6izn2Ed3ltifSK5zVcbFYUYINRyTz3BrMdWvefiNghcvPzOoTEwGYLA6zTF/5NcT
         kT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707498146; x=1708102946;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZYxkJvmyvwo7sccM5VPUtTxUyq0KncuIUTdYNLgjm0=;
        b=UxKdGXFInYqavLutDswxdcEAJL6AVEIMrfvww/RspIKANR3Fry5nwh49b0mooWppLX
         ROY3CjLlBo/bl69wyAATT83dxEHxvWChPCNfDCSMibInw1R/5zO03aoHDg53hzL+XAtD
         cpGwjbt/R6YtLmSnKNVnQtrcRweQfB8kHUIrw/m8bCM0YlDsUqgxVJx4BqLxm0ypQKRq
         SW9NMgDyttQxGIkmFzfshtAG+2Xth34fAH4urqJzi0LKBc+CfHxmwINuXZnUL2FHzrQQ
         WBeRYhK/agiWpwYGreVUTMcY6VlPi3IbPwXLTcy1p9L3K0FvnACIp3VkP+0Jpi1AG8H2
         vaOA==
X-Gm-Message-State: AOJu0Yxjl2X7+VhvfiOv3ZsPWE4XiH5I76+jW9X0YaBCBEkUAcIul0LG
	/0p/bIYJmZcV1WGcIqV9xLblJO3MAdE7LYfwt6z/FrZfPo1uGbw4MrJVn3SH5d42eTF/jg9+2ea
	D
X-Google-Smtp-Source: AGHT+IEPsqXgXKcs68otjzIQp/EHpgEv+qOgU4M4KwBEoT0L0vU4N0DPI8e2G3PMVJ/OvZRFwXvBVg==
X-Received: by 2002:a05:6402:54e:b0:560:a95:5271 with SMTP id i14-20020a056402054e00b005600a955271mr1560824edx.5.1707498146318;
        Fri, 09 Feb 2024 09:02:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTJ6byOiY5/ZTv1DsPdr4JBmrnUlxJ30Wv3YwT6xIzX6fTBUu1lnOlQByeHBIG4JXLwzQbctLP5LRlCqIMgedqDVi+C4IF3LKcmyE4Q5yo4/CIMtAIbOuc5OZip+26NT4orG+/lPrQ9mJfkieK22hZ9UIWKujh8OdJd6FQyn6Dd4fD5wu3S2EdsiUr99ZB7ZS1Bs2Zt2ByFxiQNKe4jZKQeKNzKphPLhxoC6vbU1UL9kNwR3YO/NOfOUk9D/hVXW+yPAoc1D00dbs=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e16-20020a50d4d0000000b005605716e755sm993471edj.52.2024.02.09.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:02:25 -0800 (PST)
Date: Fri, 9 Feb 2024 20:02:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [pci:endpoint 3/5] drivers/pci/endpoint/pci-epf-core.c:275
 pci_epf_alloc_space() error: uninitialized symbol 'dev'.
Message-ID: <7ea6ca33-3954-43a0-a9b8-a09c5db095b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git endpoint
head:   f7bcec825e728e0baecf96118e36c8afb7b93f8a
commit: 6441639b8a253254b00d7ccfbc2c9c67a8f42d10 [3/5] PCI: endpoint: Improve pci_epf_alloc_space() API
config: x86_64-randconfig-161-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100046.9zcFnPl3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402100046.9zcFnPl3-lkp@intel.com/

smatch warnings:
drivers/pci/endpoint/pci-epf-core.c:275 pci_epf_alloc_space() error: uninitialized symbol 'dev'.

vim +/dev +275 drivers/pci/endpoint/pci-epf-core.c

2a9a801620efac Kishon Vijay Abraham I 2019-03-25  259  void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
e891becdccaa90 Niklas Cassel          2024-02-07  260  			  const struct pci_epc_features *epc_features,
e891becdccaa90 Niklas Cassel          2024-02-07  261  			  enum pci_epc_interface_type type)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  262  {
6441639b8a2532 Niklas Cassel          2024-02-07  263  	u64 bar_fixed_size = epc_features->bar_fixed_size[bar];
e891becdccaa90 Niklas Cassel          2024-02-07  264  	size_t align = epc_features->align;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  265  	struct pci_epf_bar *epf_bar;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  266  	dma_addr_t phys_addr;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  267  	struct pci_epc *epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  268  	struct device *dev;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  269  	void *space;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  270  
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  271  	if (size < 128)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  272  		size = 128;
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  273  
6441639b8a2532 Niklas Cassel          2024-02-07  274  	if (bar_fixed_size && size > bar_fixed_size) {
6441639b8a2532 Niklas Cassel          2024-02-07 @275  		dev_err(dev, "requested BAR size is larger than fixed size\n");

"dev" is uninitialized.

6441639b8a2532 Niklas Cassel          2024-02-07  276  		return NULL;
6441639b8a2532 Niklas Cassel          2024-02-07  277  	}
6441639b8a2532 Niklas Cassel          2024-02-07  278  
6441639b8a2532 Niklas Cassel          2024-02-07  279  	if (bar_fixed_size)
6441639b8a2532 Niklas Cassel          2024-02-07  280  		size = bar_fixed_size;
6441639b8a2532 Niklas Cassel          2024-02-07  281  
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  282  	if (align)
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  283  		size = ALIGN(size, align);
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  284  	else
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  285  		size = roundup_pow_of_two(size);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  286  
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  287  	if (type == PRIMARY_INTERFACE) {
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  288  		epc = epf->epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  289  		epf_bar = epf->bar;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  290  	} else {
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  291  		epc = epf->sec_epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  292  		epf_bar = epf->sec_epc_bar;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  293  	}
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  294  
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  295  	dev = epc->dev.parent;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  296  	space = dma_alloc_coherent(dev, size, &phys_addr, GFP_KERNEL);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  297  	if (!space) {
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  298  		dev_err(dev, "failed to allocate mem space\n");
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  299  		return NULL;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  300  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

