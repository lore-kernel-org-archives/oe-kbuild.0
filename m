Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A3286D42
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772264; cv=none; b=O6YVZwfTDPo0yeJy6GNkAwbws9awrzBSI9AL6OUxUv6uBDef+47Qv8gdOZpDptZ+zOwXiq/geAyiGefmiEEvIsdBhjyfUHABiK90QQEVzPNb2mnC26tFvgP/QBcUNoXhE0cIOsWP8rVnKQCuhVilC2nr5yEzR8iX5eSGQ/dkblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772264; c=relaxed/simple;
	bh=zOB5AlMqj9KmwU0E0756V4dbbBGTNkAVB/Tcxft+kGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=W5rq5b46fVUHL3H5khXkRIxH+mrF++ec8qaC7XUS0xGv8q4uyw5vVxPqSf3A+yknfF6ab4WgGg8Y/aSBeHFtCgkeXzpR7gqg01FRPrkpzi+7yvHRbB70ee4CSoVuOcfcjXfChYkn+bz7d2PII8ibTjB61C+VNBUWiFErIws377Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKZESJPk; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKZESJPk"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73ac5680bb0so112625a34.3
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772261; x=1751377061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wpNGwNorSJRHHGcPXLQ8fs2LYNu4R8xKyEQ7qynXL3M=;
        b=mKZESJPkd+imfI9PY1tn/4NlEjMolNLbD4xavPnUCkuq752JZDfVUMi4EbX5aJUpNO
         qGRBtGFFR87dU0wZHVsVqYgGwd8YHUATtvjEuXkdvbYlaNxlQmX+J+AMmRG1ujkiSVur
         251r48E7wJfJ/eIDq6lC/6eb7TmUDb2ti3N8LrdgchnjD93CqDZ0OFEHKUEtn0fuWMrW
         3PMNaeYLVVLP34eD24+aU8Shl+v9B2ZrUaCb2huJkGboRtaxRUWfUU3X3xlHJFgan2Z5
         hp3MRNL9uRwQUg8f1CC0+rVbkD0WgWnTK2/lsHw9HCt8Wbm+7WiuVVE5x33DCmGMOFAx
         YFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772261; x=1751377061;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpNGwNorSJRHHGcPXLQ8fs2LYNu4R8xKyEQ7qynXL3M=;
        b=KiQ6DNNjQ+lzRqEywIFyDeMSf62eqKaCOsuC487roBDEprISrSczmAWrfvSq8CgRni
         dyuUHAXBwhsB9cRysKat+9FECuXpHjgR/rYxopBRfIrRsdma5U48xygQ0p0XADtCYmVG
         lqCfU48qPKMlrVXMRg6nNAQFkYI5OiaUa0BxZp1Wg1GlmAovjLpIeBSikJwQsKfBDG8X
         RtysgwIvgIftEcDyJFBnfE2Ds5kfgNDy+9vzFDmr7VqchzG+xrdh6BXOjkBnycZGZdW2
         fibUigd2GbBVSbTiCf15warZIaL4iAICSa6S+yTSZNecBSZXjGQ7uKGbDQo/NJnh3Ysn
         DMlw==
X-Gm-Message-State: AOJu0YxbS1W/QnGbSRxXp6LSDa9g8O1KGAhGmmu1EQoXRk+Tza3biVtK
	RClVGGG+aMXCTwIo7rEr4iSgmPFNHtT7bsIHMYipRszGVSPlobNp+IuUGpTYBMcLRD+N5Un6WsH
	O1fsB
X-Gm-Gg: ASbGncuTvfssC/ClN/pRONOA+TYVmwoPN/2qPISjARVtTCaYuuW/s04klX86NDH2zZS
	k1q79AAVaUg105XoRgcdXurVkLR+JV0JFUOxPHF2mzUq3vmkCy32X3+sX78CgkORrWpYVlIAw4r
	Q7U3iLDCIrdOKKXj25G+uXxu3kNfsmGKK8tx2c6x+4cUx54ve5/kI3/gcE24TpxwE95Vc0gUuig
	/MKAkX33h4qZ3oQnDMR4MepRlKw5uZzZmF6YNc/BEold44Q7ND9mduYnCH5v7FWR2TdLbFdl+SF
	fnrEusOX0fG6aMxJvGj0t/mqNCG+RK+xZPYX4ii1HoQGWkDqiz437Vf6bKG/4dtAVlzrHQ==
X-Google-Smtp-Source: AGHT+IGP56xPtHiCZXhQKN8Uu2rZMFi/qagY8sczFmEtrJpJ17nQfRRSLKweF5R/GISgkaBHUgpwwg==
X-Received: by 2002:a05:6830:840d:b0:734:f5e2:8cbc with SMTP id 46e09a7af769-73a91d24190mr7043470a34.18.1750772261285;
        Tue, 24 Jun 2025 06:37:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm1849930a34.0.2025.06.24.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:37:40 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:37:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Badal Nilawar <badal.nilawar@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <b92f6d9d-974f-4309-8d83-e6d737e1c41b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-3-badal.nilawar@intel.com>

Hi Badal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-3-badal.nilawar%40intel.com
patch subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241103.XiG3WA7g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241103.XiG3WA7g-lkp@intel.com/

smatch warnings:
drivers/misc/mei/late_bind/mei_late_bind.c:203 mei_late_bind_component_match() warn: was && intended here instead of ||?

vim +203 drivers/misc/mei/late_bind/mei_late_bind.c

b4fe758cb831cd Alexander Usyskin 2025-06-19  186  static int mei_late_bind_component_match(struct device *dev, int subcomponent,
b4fe758cb831cd Alexander Usyskin 2025-06-19  187  					 void *data)
b4fe758cb831cd Alexander Usyskin 2025-06-19  188  {
b4fe758cb831cd Alexander Usyskin 2025-06-19  189  	struct device *base = data;
b4fe758cb831cd Alexander Usyskin 2025-06-19  190  	struct pci_dev *pdev;
b4fe758cb831cd Alexander Usyskin 2025-06-19  191  
b4fe758cb831cd Alexander Usyskin 2025-06-19  192  	if (!dev)
b4fe758cb831cd Alexander Usyskin 2025-06-19  193  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  194  
b4fe758cb831cd Alexander Usyskin 2025-06-19  195  	if (!dev_is_pci(dev))
b4fe758cb831cd Alexander Usyskin 2025-06-19  196  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  197  
b4fe758cb831cd Alexander Usyskin 2025-06-19  198  	pdev = to_pci_dev(dev);
b4fe758cb831cd Alexander Usyskin 2025-06-19  199  
b4fe758cb831cd Alexander Usyskin 2025-06-19  200  	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
b4fe758cb831cd Alexander Usyskin 2025-06-19  201  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  202  
b4fe758cb831cd Alexander Usyskin 2025-06-19 @203  	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||

This || should be &&.  Currently the function will always return 0.

b4fe758cb831cd Alexander Usyskin 2025-06-19  204  	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
b4fe758cb831cd Alexander Usyskin 2025-06-19  205  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  206  
b4fe758cb831cd Alexander Usyskin 2025-06-19  207  	if (subcomponent != I915_COMPONENT_LATE_BIND)
b4fe758cb831cd Alexander Usyskin 2025-06-19  208  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  209  
b4fe758cb831cd Alexander Usyskin 2025-06-19  210  	base = base->parent;
b4fe758cb831cd Alexander Usyskin 2025-06-19  211  	if (!base) /* mei device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  212  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  213  
b4fe758cb831cd Alexander Usyskin 2025-06-19  214  	base = base->parent; /* pci device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  215  
b4fe758cb831cd Alexander Usyskin 2025-06-19  216  	return !!base && dev == base;
b4fe758cb831cd Alexander Usyskin 2025-06-19  217  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

