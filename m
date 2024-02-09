Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6280C0D
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498719; cv=none; b=cBRrVPZBSCgWsHJm6C8Y3QIUoJqOK9f89HmZlJsrSJZFJEUS+IAxmks+dy1wtOHuR4bvEGo5UOyP/wStvUFOd7ubVkUXGn6Ih/apw1JIC2xuGKgDLc+4dZ4GfUCjY/kZ/Ik4DJp2YfTFzaHgzdjAGmduv98YdrnU+mSF6aEzJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498719; c=relaxed/simple;
	bh=uBXa1G+h4BG6CpiX4pgjvA79P/or7/cF4fVnQiDpxWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuzXN9Sb+sZOvwKDHH70h8uyMRLucbeUJJ3hDTUoU9UM5X47iiHg6ITgk/GTDE2La4cyeGlzXA0K8YEr2ykBNJDe+bYfnDtNcVX/sGp/r+a/OmT6h2HNiwcUJcoFWkJ5O9pw00gQTU1wh+g4aiYcOapCB45cFBt8NHB5/vK2n2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q9DEIs82; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9DEIs82"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e0507eb60cso831815b3a.3
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Feb 2024 09:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707498717; x=1708103517; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKDaFEKDf3M5+RLQofTsLbvyKTMDtF18ICqSKZ0WLRQ=;
        b=Q9DEIs82yGwBTXMo0gASjNOMjtW8OEApcQDTdd9wqDKYNaeoyE9qLAJSx0zyyUwA55
         aRzvEjaffi4pilZedoFvorUcho7ZxUCj2zg5eEkjVJYnJEQpqS6RtIuR/ImowLBw3hAo
         jgZy3r7Kptf+nbqgLncMxlw7lLHwhWHpl1K6nTEORbPHgSph0pvoFjzpdnAYUWTOHNJM
         OzjckdNIlhOQpZspFQWsEIeRyAR3934Rg+tddcygoXT6w01euh+6erJV9q2w9bXOd8zn
         mKJK023HxW8XpvM2fSNN9eEDiRFX5Ext6wL4TL4uJ6JHtrM8gEfrLbB3Gzg7C15Nd6No
         E74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707498717; x=1708103517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKDaFEKDf3M5+RLQofTsLbvyKTMDtF18ICqSKZ0WLRQ=;
        b=qsAM4Rd3QXhS8gzOMC9MiUvR7YiwOzMCq7KvCXVcAagHvnGdMS7YFcJraIhcuclWY7
         4edhEDEOUCsRXLwWlbOJzD27czRnPBMxrdIz9vRl8BKvSlrnkroP5F9RtK0ZqY8Xwpgs
         Nxg5Jyw+PbpnMb+SSImTmUoCiRIsMFXAfNRcVDEYOg/BiW139F1gR+a5hKtvJTspPRH/
         fPsGC8WivFLGnXZ4R3QMM0PWG7nV/wBG5HWKLaJk4gxBCFSQGYbKFFUxTYCVz4x4rlFO
         Z7OUT7QDFo5fqTQZRgetrz5EhJPWwJ1sxGGVDXAfObN5xPCzrs2NwiPt/BuiTihppYX8
         zfLQ==
X-Gm-Message-State: AOJu0YyU1JrnLP6ZSufUO6a3ZvgOR/nU0hAt5jFfocpvvdpOUdFWQpuQ
	nDiQ00NE6bgC/i7Cqg5X10WWddnM9j2t4zkpdGdRxX73fhiT/C5CmlyRkqof8w==
X-Google-Smtp-Source: AGHT+IGMj/UcXGGayRnB/SeVZid1zac0tr5hP7LPr9u0jYjdRznTCi+OIWFpankR3E+qPbjxlpiJww==
X-Received: by 2002:a05:6a00:3a8a:b0:6e0:8f06:1103 with SMTP id fk10-20020a056a003a8a00b006e08f061103mr1814914pfb.20.1707498716876;
        Fri, 09 Feb 2024 09:11:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1b+Q36/q1KITK1TQvGypCaT3kj41tmS+hICWXqlR8dw8m5D6BQVmy+PCF2jJuoRl44/KVFELqjqTjZNhcaSnfuqqDOXVroBrNH5ujB5q2p/QY/wlAo2kJfaewuMMWOfh0OP1UqtZc62wxjK47pyx6I1Of/nrdRws5docMIq9QzDktvkQehJsmhSdUNk8mzB4fYJo4fM8xjdHS+SQ=
Received: from thinkpad ([103.28.246.136])
        by smtp.gmail.com with ESMTPSA id o20-20020a056a001b5400b006e051fcc0f4sm764256pfv.47.2024.02.09.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:11:56 -0800 (PST)
Date: Fri, 9 Feb 2024 22:41:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [pci:endpoint 3/5] drivers/pci/endpoint/pci-epf-core.c:275
 pci_epf_alloc_space() error: uninitialized symbol 'dev'.
Message-ID: <20240209171152.GI12035@thinkpad>
References: <7ea6ca33-3954-43a0-a9b8-a09c5db095b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ea6ca33-3954-43a0-a9b8-a09c5db095b6@moroto.mountain>

On Fri, Feb 09, 2024 at 08:02:21PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git endpoint
> head:   f7bcec825e728e0baecf96118e36c8afb7b93f8a
> commit: 6441639b8a253254b00d7ccfbc2c9c67a8f42d10 [3/5] PCI: endpoint: Improve pci_epf_alloc_space() API
> config: x86_64-randconfig-161-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100046.9zcFnPl3-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202402100046.9zcFnPl3-lkp@intel.com/
> 

Thanks for the report. Fixed the issue in offending commit.

- Mani

> smatch warnings:
> drivers/pci/endpoint/pci-epf-core.c:275 pci_epf_alloc_space() error: uninitialized symbol 'dev'.
> 
> vim +/dev +275 drivers/pci/endpoint/pci-epf-core.c
> 
> 2a9a801620efac Kishon Vijay Abraham I 2019-03-25  259  void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
> e891becdccaa90 Niklas Cassel          2024-02-07  260  			  const struct pci_epc_features *epc_features,
> e891becdccaa90 Niklas Cassel          2024-02-07  261  			  enum pci_epc_interface_type type)
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  262  {
> 6441639b8a2532 Niklas Cassel          2024-02-07  263  	u64 bar_fixed_size = epc_features->bar_fixed_size[bar];
> e891becdccaa90 Niklas Cassel          2024-02-07  264  	size_t align = epc_features->align;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  265  	struct pci_epf_bar *epf_bar;
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  266  	dma_addr_t phys_addr;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  267  	struct pci_epc *epc;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  268  	struct device *dev;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  269  	void *space;
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  270  
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  271  	if (size < 128)
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  272  		size = 128;
> 2a9a801620efac Kishon Vijay Abraham I 2019-03-25  273  
> 6441639b8a2532 Niklas Cassel          2024-02-07  274  	if (bar_fixed_size && size > bar_fixed_size) {
> 6441639b8a2532 Niklas Cassel          2024-02-07 @275  		dev_err(dev, "requested BAR size is larger than fixed size\n");
> 
> "dev" is uninitialized.
> 
> 6441639b8a2532 Niklas Cassel          2024-02-07  276  		return NULL;
> 6441639b8a2532 Niklas Cassel          2024-02-07  277  	}
> 6441639b8a2532 Niklas Cassel          2024-02-07  278  
> 6441639b8a2532 Niklas Cassel          2024-02-07  279  	if (bar_fixed_size)
> 6441639b8a2532 Niklas Cassel          2024-02-07  280  		size = bar_fixed_size;
> 6441639b8a2532 Niklas Cassel          2024-02-07  281  
> 2a9a801620efac Kishon Vijay Abraham I 2019-03-25  282  	if (align)
> 2a9a801620efac Kishon Vijay Abraham I 2019-03-25  283  		size = ALIGN(size, align);
> 2a9a801620efac Kishon Vijay Abraham I 2019-03-25  284  	else
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  285  		size = roundup_pow_of_two(size);
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  286  
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  287  	if (type == PRIMARY_INTERFACE) {
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  288  		epc = epf->epc;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  289  		epf_bar = epf->bar;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  290  	} else {
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  291  		epc = epf->sec_epc;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  292  		epf_bar = epf->sec_epc_bar;
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  293  	}
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  294  
> 63840ff5322373 Kishon Vijay Abraham I 2021-02-02  295  	dev = epc->dev.parent;
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  296  	space = dma_alloc_coherent(dev, size, &phys_addr, GFP_KERNEL);
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  297  	if (!space) {
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  298  		dev_err(dev, "failed to allocate mem space\n");
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  299  		return NULL;
> 5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  300  	}
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
மணிவண்ணன் சதாசிவம்
