Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3FB15A862
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722267085; cv=none; b=aOCrFkmIG6tU+x4VZFq0YDg/ZpnIrABBqgOZ1tcQH/JQwGnchvVKCcGDzw9rm/UVPbk0k3l26t5S+ubdLR2g+MlVGeYLllFpn5ByNWkPJD2YApNwtc8EKYxJJuCNiM25qZQPi6Yzs0OoVwM+LEX3SiuqvzsQ3RjBvMEGRkCZziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722267085; c=relaxed/simple;
	bh=nMRedrIDpiQfBKEZwZLAtsO2l+vfALPP2GCneA2DJeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=exDagflFH8prdLglGLjSp0hTbR7ziVobF2UCl6KnuOfaK17PXWR6BVIuWpOF0a5dm8uE6goXTD2TJ4eo0ajgVITa3kUQ0pzskOGiH7vXJ8flhkV2A1Pd+O2v9GF6DXVkGpArxxvaOvPJBQOR5qJ6ehbhxtZRu3CLYJ2CGISLsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eu0z09LC; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eu0z09LC"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-264a12e05b9so2321988fac.1
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722267082; x=1722871882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxgOzZ9wt6xYia5fWSbdpgGngVyCVzmloiaeIDkpJyU=;
        b=Eu0z09LCNShTiTEsFHn0t7b8q+ig5Dk5zTDQluHqLWIJTvWP1KqH51WckYqk05Jovh
         zLcSYSUBnibIv4EAFyIEFZdI+BA5Tp8ZnqcwxgclRdcZIvouA5qzjiYM0GUO/pZDuo7E
         kxWRWsXAt2n2UNmZmjloW0iAnyjbCJEwdJz7nshpoWiMbiTwWvgIJmjg2tTiA97QTSxi
         0fJHzy7wkL3iKtvRnXyaToFnTsdii2U1s6GjGvBwxWCKesBMOXD1Kv82h5fKnoOMaKSF
         pDS+bXz1R5l7wqW7MQzzG7bLemKU6gdYx2caUA5iELysfGBJFBygWHh5lp3SVzCElkwP
         c+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267082; x=1722871882;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxgOzZ9wt6xYia5fWSbdpgGngVyCVzmloiaeIDkpJyU=;
        b=QpvcsP3axclVaxC2YJ1ZxS4PCNTFwFRiC87jEFtIQRuqH8jiuDzXMh4srW2OrVfQUJ
         SQjTuHscg8w4MO9iTx2oFPSjjwojQKsb1+nWv8Kvv1I3x5xLW2r+khIGkRtNbca4V4iv
         nlnot6K9PRitiGOy0JIfqth1OdwsstmmkXdHAJ9Ek0wsY+G4QhRJkIuWQF2DM86uvSUg
         lSzRsQQXg2xu8X89SnMNCJpt1zdl9pvQbPgCtRR4y7TYOBt1tLBCIAGWdEgInLvuIeah
         o3B9hxLmylM1vdLpxOe26LzgfCB5citU/zRwvGx8Tw3h+hdEK4k1l/G2/NJcHixJz8ol
         a/Zg==
X-Gm-Message-State: AOJu0YzPPb4+6MlhgsHe1wrQxsOA0vpQUqKwdkxRXH93z4yySfwIZLyB
	ZMY6XxNQNZfT/OEo9lTUIvQNIHR35A9pKQWwx587aM9VixoGnCT0ZSSeck2ExKPx0wMUVrpz3ks
	z1PI=
X-Google-Smtp-Source: AGHT+IHaNouuhzQ1M1UrMMhpFB2OYkekDxpOwvZS4ZCvpyA/cVxQfuO1chwsPix33xJ5/ckC5Qt+ig==
X-Received: by 2002:a05:6870:b625:b0:260:fb01:5651 with SMTP id 586e51a60fabf-267d4d2dc08mr9917991fac.12.1722267082223;
        Mon, 29 Jul 2024 08:31:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2653cfcf7edsm1889857fac.3.2024.07.29.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:31:21 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:31:20 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	linux-iio@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Marius Cristea <marius.cristea@microchip.com>,
	Ivan Mikhaylov <fr0st61te@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Liam Beguin <liambeguin@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] drivers: iio: adc: add support for ad777x family
Message-ID: <ee65606b-aef1-48c1-8e61-3f00302416ff@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724155517.12470-5-ramona.nechita@analog.com>

Hi Ramona,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramona-Alexandra-Nechita/dt-bindings-iio-adc-add-a7779-doc/20240725-000001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240724155517.12470-5-ramona.nechita%40analog.com
patch subject: [PATCH v4 3/3] drivers: iio: adc: add support for ad777x family
config: hexagon-randconfig-r081-20240728 (https://download.01.org/0day-ci/archive/20240729/202407290151.pCUNfKeG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407290151.pCUNfKeG-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7779.c:779 ad7779_probe() error: uninitialized symbol 'ret'.

vim +/ret +779 drivers/iio/adc/ad7779.c

ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  761  static int ad7779_probe(struct spi_device *spi)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  762  {
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  763  	struct iio_dev *indio_dev;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  764  	struct ad7779_state *st;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  765  	struct gpio_desc *reset_gpio, *start_gpio;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  766  	int ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  767  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  768  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  769  	if (!indio_dev)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  770  		return -ENOMEM;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  771  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  772  	st = iio_priv(indio_dev);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  773  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  774  	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  775  	if (IS_ERR(st->mclk))
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  776  		return PTR_ERR(st->mclk);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  777  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  778  	if (!spi->irq)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24 @779  		return dev_err_probe(&spi->dev, ret,
                                                                                                        ^^^
s/ret/-EINVAL/

ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  780  				     "DRDY irq not present\n"); 
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  781  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  782  	reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  783  	if (IS_ERR(reset_gpio))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

