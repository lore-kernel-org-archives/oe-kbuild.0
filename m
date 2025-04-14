Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280031F2360
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Apr 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617742; cv=none; b=GWAuj5nBdHWk3+TWJJK9rZptlOqOHZMZ4uUQl9v+Xsi9Wk/ZrDt/YfouXsS7z0oSyykR4DwsC8Skzk7w+A699Dtoaa8G7ZbYXZH4wyZMruQKw6hzRwM8rGZnO6zPHAUlIAysUD1VUfXBHxyQducgh9Oa6K2gD8B6uvehSGSLDAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617742; c=relaxed/simple;
	bh=nQWgyIyZchPpBMUd27Ybx+nG+4p+KDvUmQLpNEiaWkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+mAk4PfFz/jrO+BSYJF1Yd62Mm1YShhhXLsn3A/YmTemjN7ix7fBKaHNDnYbiFDSSyC4EgLoxj5JGAlKguqwBHLGQH/gDdO01HmBZ7LNcNt+plt4dLqe+jV/l3cz37qmpPw4RL/GKpQIPgD3BO3Eh2TR3KlNg27DlnFR6INIzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuasWpy6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuasWpy6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2f391864so2167305f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Apr 2025 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744617738; x=1745222538; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7w/s+hccjNe4bB/Dyc37dVWQh9Lnz1WZC1fXPq+WmKg=;
        b=KuasWpy6DuuotBQerQMrLER3N16eQBwaaDxjGiDmrLa07bdcmJ6RbndBX0CvjFPCMy
         YKbSCSY7xQVnwk+y/Ef/BHOPJYBZOXBrkaD5+Fr9eVyUtGTB1VS41fO8+MdHbJVVl30l
         +sYphw4I4CYT9sDr4yzvjCOtuu+bH2GcKU/lPiL2BtinsuX3u0MgbaAarv45h2JK7B9B
         PEE+2IE5eiVsJURONL8WY01+aZWnFmtzoB8xF5RHw+ZNpP0j5phaTYRXe1V8xZ80bc4S
         AQ4RaTle7nPi5bvQ1fxeMW+GbAu6AhGPYASQdv06UuQaSKjgaytLOV/vV6asyzeHVsTv
         OkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617738; x=1745222538;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w/s+hccjNe4bB/Dyc37dVWQh9Lnz1WZC1fXPq+WmKg=;
        b=EqNIcTxacU+ZPaLSUKeMq5rdiQlawJmyuk7/6e/Scj4gn8hcvx3mX7kMHOAHbKSU8r
         epj9LB+Vs8z74tsSAVOFcQhZB6fa9qp+65zLyYMPHAIlLeYrdR31OxuxosUx+/MSjnid
         P47zhhYTLMW4dIyoZJEygUe2FJJYC1zT4t0PtSFXUBrosWGvV4b1FBmaGfepKMKHrAqK
         8vOggV8hLob7iEeVq5qGNlaJSkSCkanqHOaCF02oZ/aSe8xlXW3WRXiNSORY0iJYVwCq
         9ybcU5KVJxNf3tpYvpR2CKe/JiE9XmTMVq2pxobRJDoTiRHFyKTsWZ91kH1PxAkiVOVD
         FRtg==
X-Gm-Message-State: AOJu0Yz5gtR/RlDmWXKp17fAzM4rvhATQbDZeXCrHPKLjKXPy9WU+Evc
	rJRycCiNywjmYzdLahtM7kNPqSk3leF7GE5rsV9RjkgTGuLOcfyKEMPawhIMqXAQUpJWj51xpaC
	U
X-Gm-Gg: ASbGncvHm31xM/1f33OAekwRiiwj6JlFrw/vqzxswrv0Noi3Tic33ke/TbzDq31QABh
	zJoozYFp/SuqoBUHMGIzecHj3I+ZrDorskxzj0OgzN0iCnr8rY42kB3aAhMXOG925ntoWkmAH+i
	wzHddV+NE0jSo9C0K3rQNMnNVKUf7NKT78cRBhXgjzHocfcCg/2NmkkXLdAO7nkuoI9I9zH22G0
	alQXW8svb18fuL9zjue0M6CxU5JS4UoucnY6ZHtouWVP67MdaLmySnIvs/kwhZWJity6Sc5Cydz
	ILRAQzkTSHIIpQEw8rcG5ar8ZZ3XVqc6oEZsa2B2KRwmDg==
X-Google-Smtp-Source: AGHT+IH3Rxtz2FdCZzj4cm7At+o5gn8JLnMOQwwzZgYbuyAdsDYzHnfnvKOJWt4MTJ8SQFcjBrSYzQ==
X-Received: by 2002:a05:6000:420f:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-39eaaed2cd7mr9019382f8f.51.1744617738045;
        Mon, 14 Apr 2025 01:02:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae963c15sm10438528f8f.13.2025.04.14.01.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:02:17 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:02:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Angelo Dureghello <adureghello@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 145/170] drivers/iio/adc/ad7606_spi.c:321
 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202504131808.qk2lrRY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250414080214.PbD6C_MnFePb6imoP4nQbkEayTkjFZp3goJ_-JNF7-g@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   251fedd7b6dc495c433b959e31c29a867c079872
commit: b9c731a0e9a582b17128cb335a816163ac21734d [145/170] iio: adc: ad7606: add SPI offload support
config: i386-randconfig-141-20250413 (https://download.01.org/0day-ci/archive/20250413/202504131808.qk2lrRY4-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504131808.qk2lrRY4-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606_spi.c:321 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +321 drivers/iio/adc/ad7606_spi.c

b9c731a0e9a582 Angelo Dureghello 2025-04-03  311  	/* TODO: PWM setup should be ok, done for the backend. PWM mutex ? */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  312  	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  313  							     bus_data->offload);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  314  	if (IS_ERR(rx_dma))
b9c731a0e9a582 Angelo Dureghello 2025-04-03  315  		return dev_err_probe(dev, PTR_ERR(rx_dma),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  316  				     "failed to get offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  317  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  318  	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  319  		rx_dma, IIO_BUFFER_DIRECTION_IN);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  320  	if (ret)
b9c731a0e9a582 Angelo Dureghello 2025-04-03 @321  		return dev_err_probe(dev, PTR_ERR(rx_dma),

s/PTR_ERR(rx_dma)/ret/

b9c731a0e9a582 Angelo Dureghello 2025-04-03  322  				     "failed to setup offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  323  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  324  	/* Use offload ops. */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  325  	indio_dev->setup_ops = &ad7606_offload_buffer_setup_ops;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  326  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  327  	st->offload_en = true;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  328  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  329  	return 0;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  330  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

