Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DFE7F7CB
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306323; cv=none; b=ekc02dfZsQzaMcLCLMiq2aiNmS5+QDd2YC4N1DaAIsS9/ELRA3xODiTUUI9B0pZOMq71EW6q9UW06dQNrHBknR1pfDXldnahFt80FyGQWJ8VJCuUZ49u8YilzZ9O2HIMZgc3V4nZYOZ8T4BmMOcarpE3WlwAvWB8k9UaHxxq9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306323; c=relaxed/simple;
	bh=xISzmojLsDLGl7/oDlZmJ5er1RJ3umBe4NFqy8Uh/f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hGD/jVJbiZEnKk7ZkUONnBiwDbUcX8hg3vcfcI+oLAD1z6SN92hl16UXe3M59TM7amPoGDxM4JxDUi7hGYvXnGDbNa/dNY27CeK9TD4AZizL4I0yI7rCKVp4R0akCgyVEGi2FbtuFYwUAs+aN3LYIgIoeo0Q7VVp9VL5rPt4Nk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jNU7c0C1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jNU7c0C1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso2723658a12.2
        for <oe-kbuild@lists.linux.dev>; Fri, 05 Apr 2024 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712306320; x=1712911120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubTb0fgVnrfBS5bggRD1QN9w4aDFQXkPd91AMrgys1Q=;
        b=jNU7c0C1Sy3M/fl40XNPbl9f3BE2ciQs6Thc5JnfRO3YJhe6RUtizRjpTePsx12Pj9
         Zh8SDS25NqW6COvpZyG2M+km3XkzMp96c4XXc1N2RCoSRl2r4V5DWRoanKSYo8i/lNGn
         DCy0ngCSjRBWe1IuAGPmb8HBezoGJyibZjQGYdomTqVN0XGScAqtl21ycO/irZOHLwHM
         6NP8cr1P1IR+kGSTeekZwinoyAEilqvBAKvvNZehLselO9b3BE8GYycTO7sfvSpyY440
         U+flWRrSrB77ZeYVZi3vUi8hWOYZ/dWTjIM47UpsZXu9ukv7fnWhLDShiBBswPfsf0hi
         3XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306320; x=1712911120;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubTb0fgVnrfBS5bggRD1QN9w4aDFQXkPd91AMrgys1Q=;
        b=rybCJoCwktwg2rUDfYs3w3Y4dS34Obq9wE3jrlFeFzVJB3PP2C08rriB/d0sBvc11f
         i+mYI0yH5A501DGp71sxTt0TTO6GguJWwKdOfP6KIZdX/QQ0F+u76X/j0OvsRHbStUUd
         CETegQDkcLN9/DeXm+EpprvVRk8JLP3HcAxfDbK1AqULpKhkpNZorcXGchrUwmt0XjJ9
         b/5N1HfcCUwoF3FecglClgT3/bFYMalx04d5aU/LrYMTpqzCm8bx2qbm6EaSfMcs/lYm
         eM4sUa+Eoi/3LV1vz3tyu7ucW0YNLvEUJTodR//LKyftUuwKYfKBDh99nIZqDl4nLxn6
         Masg==
X-Gm-Message-State: AOJu0Yx9XGPvzieWJw+sbBofd4rMcUIe7e+FIn3C1s2B0pzol3G+4t6i
	pp7hNm26YfrWlkmYnXGZ/0kubL9Ei0mvT26Tm2B2xCA5K0fcJEhmg6hr+lORj58fic6eXJu82/l
	S
X-Google-Smtp-Source: AGHT+IEbsXOh/N7WNWmlYpCZzHx5wkzHFgy5SzPZtE5tZZGTZhrkAvGSYXBlZD3FtsmRpsA6biQgGQ==
X-Received: by 2002:a17:906:2798:b0:a45:e3ab:152f with SMTP id j24-20020a170906279800b00a45e3ab152fmr499838ejc.21.1712306319804;
        Fri, 05 Apr 2024 01:38:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b00a4e2ad2cef0sm570122ejb.203.2024.04.05.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:38:39 -0700 (PDT)
Date: Fri, 5 Apr 2024 11:38:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v2 02/18] PCI: endpoint: Introduce pci_epc_map_align()
Message-ID: <2b9ad9b2-c5df-4364-99cb-c2b41cdfee52@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330041928.1555578-3-dlemoal@kernel.org>

Hi Damien,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Le-Moal/PCI-endpoint-Introduce-pci_epc_function_is_valid/20240330-122311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240330041928.1555578-3-dlemoal%40kernel.org
patch subject: [PATCH v2 02/18] PCI: endpoint: Introduce pci_epc_map_align()
config: parisc-randconfig-r071-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051508.hvNRDVZq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404051508.hvNRDVZq-lkp@intel.com/

smatch warnings:
drivers/pci/endpoint/pci-epc-core.c:493 pci_epc_map_align() error: we previously assumed 'features' could be null (see line 487)

vim +/features +493 drivers/pci/endpoint/pci-epc-core.c

9d2f10d2ace040 Damien Le Moal         2024-03-30  458  int pci_epc_map_align(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
9d2f10d2ace040 Damien Le Moal         2024-03-30  459  		      u64 pci_addr, size_t size, struct pci_epc_map *map)
9d2f10d2ace040 Damien Le Moal         2024-03-30  460  {
9d2f10d2ace040 Damien Le Moal         2024-03-30  461  	const struct pci_epc_features *features;
9d2f10d2ace040 Damien Le Moal         2024-03-30  462  	size_t mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  463  	int ret;
9d2f10d2ace040 Damien Le Moal         2024-03-30  464  
9d2f10d2ace040 Damien Le Moal         2024-03-30  465  	if (!pci_epc_function_is_valid(epc, func_no, vfunc_no))
9d2f10d2ace040 Damien Le Moal         2024-03-30  466  		return -EINVAL;
9d2f10d2ace040 Damien Le Moal         2024-03-30  467  
9d2f10d2ace040 Damien Le Moal         2024-03-30  468  	if (!size || !map)
9d2f10d2ace040 Damien Le Moal         2024-03-30  469  		return -EINVAL;
9d2f10d2ace040 Damien Le Moal         2024-03-30  470  
9d2f10d2ace040 Damien Le Moal         2024-03-30  471  	memset(map, 0, sizeof(*map));
9d2f10d2ace040 Damien Le Moal         2024-03-30  472  	map->pci_addr = pci_addr;
9d2f10d2ace040 Damien Le Moal         2024-03-30  473  	map->pci_size = size;
9d2f10d2ace040 Damien Le Moal         2024-03-30  474  
9d2f10d2ace040 Damien Le Moal         2024-03-30  475  	if (epc->ops->map_align) {
9d2f10d2ace040 Damien Le Moal         2024-03-30  476  		mutex_lock(&epc->lock);
9d2f10d2ace040 Damien Le Moal         2024-03-30  477  		ret = epc->ops->map_align(epc, func_no, vfunc_no, map);
9d2f10d2ace040 Damien Le Moal         2024-03-30  478  		mutex_unlock(&epc->lock);
9d2f10d2ace040 Damien Le Moal         2024-03-30  479  		return ret;
9d2f10d2ace040 Damien Le Moal         2024-03-30  480  	}
9d2f10d2ace040 Damien Le Moal         2024-03-30  481  
9d2f10d2ace040 Damien Le Moal         2024-03-30  482  	/*
9d2f10d2ace040 Damien Le Moal         2024-03-30  483  	 * Assume a fixed alignment constraint as specified by the controller
9d2f10d2ace040 Damien Le Moal         2024-03-30  484  	 * features.
9d2f10d2ace040 Damien Le Moal         2024-03-30  485  	 */
9d2f10d2ace040 Damien Le Moal         2024-03-30  486  	features = pci_epc_get_features(epc, func_no, vfunc_no);
9d2f10d2ace040 Damien Le Moal         2024-03-30 @487  	if (!features || !features->align) {
                                                            ^^^^^^^^^
Check for NULL

9d2f10d2ace040 Damien Le Moal         2024-03-30  488  		map->map_pci_addr = pci_addr;
9d2f10d2ace040 Damien Le Moal         2024-03-30  489  		map->map_size = size;
9d2f10d2ace040 Damien Le Moal         2024-03-30  490  		map->map_ofst = 0;

Missing return 0?

9d2f10d2ace040 Damien Le Moal         2024-03-30  491  	}
9d2f10d2ace040 Damien Le Moal         2024-03-30  492  
9d2f10d2ace040 Damien Le Moal         2024-03-30 @493  	mask = features->align - 1;
                                                               ^^^^^^^^^^

9d2f10d2ace040 Damien Le Moal         2024-03-30  494  	map->map_pci_addr = map->pci_addr & ~mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  495  	map->map_ofst = map->pci_addr & mask;
9d2f10d2ace040 Damien Le Moal         2024-03-30  496  	map->map_size = ALIGN(map->map_ofst + map->pci_size, features->align);
9d2f10d2ace040 Damien Le Moal         2024-03-30  497  
9d2f10d2ace040 Damien Le Moal         2024-03-30  498  	return 0;
9d2f10d2ace040 Damien Le Moal         2024-03-30  499  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

