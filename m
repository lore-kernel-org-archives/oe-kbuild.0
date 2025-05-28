Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE6205AA8
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748418220; cv=none; b=gx+K/wt+EOuD+95P84ssRLkU58VyPe7fNyxsAOr6tImL+UDuNuCnqr7jAmk01C1JwWbaPFBLAhKundLOZIzpNVuWYgCCleMe6C21zaEtHJdHZBVd8lcJDbbuar7TwVt5tm9y07LBj5G0r0bUgq5rXwSK7/1G0OthCskbTKgAhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748418220; c=relaxed/simple;
	bh=pPI/KLTmzF+/yfU5LSdgSgrlZBoPC24xdVdYbc4iefI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjqR146IfmZlGMeyAeTwtFqcl1IcVe8ElRumxIM+wUsRG2JFpLDMwvuSp15kFxklmfssnZrbDwqMtGn5fPQ0RGHLqVCNpyv1PSy+9J9R4learNGfrvcOqQEv8AIEUXrAngrx8wp57qw3KVRAaBTLzixfclM0Tk11GORaRo2DBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fieCx89d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fieCx89d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso2997711f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748418217; x=1749023017; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EQWlfCjtDnfKxeAaJ1r+er3G/sxFT4dgHxXDNXVy+0=;
        b=fieCx89dP0e7rKDTBFvxRTuFrDKHf4Vt6B+8IfKQyGAO0vFtnoF10I74g+FRZWPsNj
         ujt90y0ATRW+SP52NF1tthZHvWJxgbeLsZLkc3IPb+guZOSmmJcI4mSe7VTI0bK1DvhK
         dCr2AVI744RY7Fxm84a0t2dPzlFxOec8lYBF31qI/XAgFJ9Wr6l12Y2ICi6eGjq0Dt8Q
         RLknL5vCwHEqkKEhGKQQxt5E/2fRMKAoUsZc4L+oSTfOhucfq/fp+xXJxDnIDAs0MwRq
         ggVzZjagaUp85IVb2eIgNOJzR/vxHMd6WNx97SuHAsC92Olg/K9Q3DtpuOJdnraD3z+1
         6wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748418217; x=1749023017;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EQWlfCjtDnfKxeAaJ1r+er3G/sxFT4dgHxXDNXVy+0=;
        b=s5AezCrfirXN39h9Mw3PxAl8d13jrIjStzijhWCIbTvAEK2R6yPB7IGfEILWjSqMMz
         1/DXYeJSM0wfZ/Yvs6GuQd525svm8HfboiHnn4lJXfd5u6dwYUb5H2WifgFcL+gcJ1Ie
         7kCqKDLXzeIrzYeFDir/6P1cFW5z9hZRuLPVSIBiwkUtxZOts64l00jCspzOGZz2WwB9
         uANfS+6dYRjU/eCnwg737R8K+kuJk8B6d66MkjXwWAicyzqg3SEh59P08V2ZjdRpp44f
         X5vdhrCCPejj3pijHqz6XeZEiLux2LWcjp+MfxJtXAYY5VXG5uLl4ykkJ2aVqRqXAzYy
         qy0g==
X-Gm-Message-State: AOJu0Yz2rmCtLguMgtxo+cJjOayVaiC8TjoL8/jgEhgdYOojveHsaIjE
	ORkbRR5joUW+/j0jNMpp+q2rK0WygQ5wOVUy+vwKtnx9gdAExT/ihgyBEN+PNsPr8NCLdXAalHC
	jXHpi
X-Gm-Gg: ASbGncs7deGLWBsoni5qKX7rcMY5oTMK1oIWmXEEWR6PojWvToPQbx/trgwpjGjF5tP
	lvFte0EetGWJGQdirxJqavDvDmDRM12TuMDXOPbGJbMYLaRxFoCe6RDRJS7QrevPvnRGIr6PVxd
	Pqym5DNX8oE/4VzUoI5+mhGVCw2rjLKf6MyDrs8Vd58xcgxukpTwlZ3ThxTn8AGUIZJkZcir9ig
	CeTpWSzAIfngDTvhCpy1v68HEUaiBWWxl9EnABV7Zo6DRjZu+gSShTuBne2zuddIAAduWpail5Q
	uMCUf9epHTPswbMtQhkuVtJ7Sc4IYjDPB8PnEgFHOQITlmI5t1uf7u+veO94Wx7aBrE=
X-Google-Smtp-Source: AGHT+IHcAGqLdQbuzELTi8NDAjVIRC+cQ4KcI1IKdbeORa87cgvw1HjBGO2TwzgXcMTSoPiTkkq9sg==
X-Received: by 2002:a05:6000:2913:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a4dfc2bbafmr7119625f8f.26.1748418216668;
        Wed, 28 May 2025 00:43:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4500e1dd630sm12338565e9.34.2025.05.28.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:43:36 -0700 (PDT)
Date: Wed, 28 May 2025 10:43:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-spi:for-next 9/11] drivers/spi/spi-pci1xxxx.c:768
 pci1xxxx_spi_probe() warn: missing error code? 'ret'
Message-ID: <202505281417.WyCoNJlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250528074332.mAjr_hce8X3rc5J-hcD0St4n34m9nNlGMrHvhHeGzC0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
head:   6aae49917bd543677e539df17556071edd9a273a
commit: b4608e944177531334a79f3df2cd14275b47808c [9/11] spi: spi-pci1xxxx: Fix Probe failure with Dual SPI instance with INTx interrupts
config: riscv-randconfig-r073-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281417.WyCoNJlC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505281417.WyCoNJlC-lkp@intel.com/

smatch warnings:
drivers/spi/spi-pci1xxxx.c:768 pci1xxxx_spi_probe() warn: missing error code? 'ret'

vim +/ret +768 drivers/spi/spi-pci1xxxx.c

1cc0cbea7167af5 Tharun Kumar P       2022-10-06  748  		spi_sub_ptr->parent = spi_bus;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  749  		spi_sub_ptr->spi_xfer_in_progress = false;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  750  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  751  		if (!iter) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  752  			ret = pcim_enable_device(pdev);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  753  			if (ret)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  754  				return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  755  
d981e7b3f25fbab Philipp Stanner      2025-04-17  756  			ret = pcim_request_all_regions(pdev, DRV_NAME);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  757  			if (ret)
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  758  				return -ENOMEM;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  759  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  760  			spi_bus->reg_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
d981e7b3f25fbab Philipp Stanner      2025-04-17  761  			if (!spi_bus->reg_base)
d981e7b3f25fbab Philipp Stanner      2025-04-17  762  				return -EINVAL;
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  763  
b4608e944177531 Thangaraj Samynathan 2025-05-27  764  			num_vector = pci_alloc_irq_vectors(pdev, 1, hw_inst_cnt,
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  765  							   PCI_IRQ_ALL_TYPES);
b4608e944177531 Thangaraj Samynathan 2025-05-27  766  			if (num_vector < 0) {
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  767  				dev_err(&pdev->dev, "Error allocating MSI vectors\n");
d981e7b3f25fbab Philipp Stanner      2025-04-17 @768  				return ret;

	return num_vector;

1cc0cbea7167af5 Tharun Kumar P       2022-10-06  769  			}
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  770  
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  771  			init_completion(&spi_sub_ptr->spi_xfer_done);
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  772  			/* Initialize Interrupts - SPI_INT */
1cc0cbea7167af5 Tharun Kumar P       2022-10-06  773  			regval = readl(spi_bus->reg_base +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

