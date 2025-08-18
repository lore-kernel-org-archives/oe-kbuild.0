Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF33E27876E
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501461; cv=none; b=ocZnTpZNqUVyI16UEDxciky1tuXtRuKOp4gFquHWY/vQrbVNFHT7wJvmLqmAaTNnVRuitGbDQ5JnHRu0xny7BscfeRUocdJjWKQzCTbYswPQIt2L8fmeZcmVRa2noyzrwEtIhlqHv+PIuyX+fR+Lg81m1kxzHfrG80hJ2oVRU0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501461; c=relaxed/simple;
	bh=GRtOJJ4TU25SLYLaBruGe/0cKnzINtKI69UBlywJ0HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cEx8j9qZphYyBUsa4f6cabqstVD97n43d0lRY2um21KTASMmBeavsEXplpLLoFD9YLDrdIeN2wDRKBvo0/qhIMBWDMWpzmYYD+fESCyyGZ3HZPeSJk7rxUg6H7BW25LfZthWFei+ZkPlHiFGUAlNrLwlRGVjMfX2eSgQXLff2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXtVAONB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXtVAONB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso3607879f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755501455; x=1756106255; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00HmFiTKWlOUviqLOmDiviucp/G1KSLyabeRXjoLhH4=;
        b=YXtVAONBqoKUsIb04tj2uhRnCd+1qPwoGBHsxefnRYzgoQKGJpW1ptUvJFiEMyzDwF
         kWuU53RLHHwyIT1zfkZpAyqAqwLvFI4DU3eADO7/jaXxUjlEHKAelMoA60eO4v6LvT8I
         UlFl0FT4MXwXlTV5w/6u61yQjNAl1g5lW3GRLevMqmIBY7VwFMy5vZkkTWD7m0vc7Em/
         bsimejr+66cVNoOMUB6+xAepHr44yhNln2Iuq+63qfpU6ntUd+Ojs1XrB4M/goTpYqtW
         2t8u/rWwAK3IW5jm3XOecATu28Jb6NDUbOTI2RQmtu66XE2cnCvjL9HKCNhwlTFCmpGA
         CM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501455; x=1756106255;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00HmFiTKWlOUviqLOmDiviucp/G1KSLyabeRXjoLhH4=;
        b=gX1yPmoMImjNgbED8cWpXCOQF2DkAz2jDaPVuYaUw67v53UUARpEU4DXPz60EuvqFV
         qA0VAP0MrGUTRy4rUf5KydhYomNnbdHqxI+tIOTz/vaUIztiGJe1km6mqNpcghIDJtC1
         vwIPUJBQWXsO+oqCpRCyNAH6UPylSXVykQwi6NZnxuB7iFXK3WzLcdVDhcupkZm2EQpX
         f3mGmM4d6lV8dRjqB90iQ3uyytS0WduQp+O0mz0oGArTxlTNx+mHAzTXNshQnjS6RFfA
         7oqN60QSO56t4V113LGb3AS5Md7KKBiL4B/arKtcGvv/q1uVwhEUZuoFuvmcDhHB85uP
         k6Aw==
X-Gm-Message-State: AOJu0YzGmmQQBz5woKOHREM+I+gx6ye10sIHKtjoYPVYlCEPW044NwSS
	MaQWugkCXOwgRPdvZWe+kEBQn1PYwlIIn6U1nYY0YjTQ8igdzIw6+W+E77sMOj6/VUWNlRPWJ4T
	4e6j9
X-Gm-Gg: ASbGncvMP1n1SmdVajh/yxCEXF4LQiRccV7j3LzxBYrOZ4ZVuac7jUcvZPeJp+Cakau
	sSN/3UODqWLihSPFoVSSjVWpZaI4HR0AIvjPah9Apcj+ryvY1LfQsERekL+f1AGcR42ei5rqRp7
	xPe7ansq3rgAUifSELxkJm8c88t2gkRdfva/sy/h6GDMp2aKkqpUxfsAYOzH8frVQb4Uk1R3hR4
	jGjTmFQXN5WVmEpsd0WINAhkKZOuKZtWi5sbedC6FyvrV2NTjHITmh5XJ+YQmoEksXkBrzZz90m
	Qp0OcFp7koB2WNBLez4xQtslVfFG0LLVFqL/6MoFht1JFdblZENNatIWfGv48BX3RFnyNDvEIC8
	I0gBrfnspeJcG+XjfVB1KC4OXkznwQ6b0LxZfFOSL/Bg=
X-Google-Smtp-Source: AGHT+IHyrx5So2JkHy8B3V9n10eIVkllRTMcnOfbIYL9Fak+QjG/0EyC3RMUePQ7ZAM0RE6YfPigZA==
X-Received: by 2002:a05:6000:250c:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3bb6646e10amr7831271f8f.9.1755501455230;
        Mon, 18 Aug 2025 00:17:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb67c902dbsm11683675f8f.47.2025.08.18.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:17:34 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:17:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Guodong Xu <guodong@riscstar.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	duje@dujemihanovic.xyz
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Guodong Xu <guodong@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
Message-ID: <202508181040.az8RxLrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com>
Message-ID: <20250818071731.6qmw6tIO0YOOu-CdjIDu-lcdYGUzRZ1dIIJGHp0-HM4@z>

Hi Guodong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-dma-Add-SpacemiT-K1-PDMA-controller/20250815-132049
base:   062b3e4a1f880f104a8d4b90b767788786aa7b78
patch link:    https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-4-62145ab6ea30%40riscstar.com
patch subject: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for controller abstraction
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181040.az8RxLrG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508181040.az8RxLrG-lkp@intel.com/

smatch warnings:
drivers/dma/mmp_pdma.c:546 mmp_pdma_prep_memcpy() warn: variable dereferenced before check 'dchan' (see line 542)
drivers/dma/mmp_pdma.c:712 mmp_pdma_prep_dma_cyclic() warn: variable dereferenced before check 'dchan' (see line 708)

vim +/dchan +546 drivers/dma/mmp_pdma.c

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  536  static struct dma_async_tx_descriptor *
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  537  mmp_pdma_prep_memcpy(struct dma_chan *dchan,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  538  		     dma_addr_t dma_dst, dma_addr_t dma_src,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  539  		     size_t len, unsigned long flags)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  540  {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  541  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @542  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
                                                                                                       ^^^^^^^^^^^^^
The patch adds a new dereference

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  543  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  544  	size_t copy = 0;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  545  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03 @546  	if (!dchan)
                                                            ^^^^^^
But the old existing code assumed dchan could be NULL

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  547  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  548  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  549  	if (!len)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  550  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  551  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  552  	chan = to_mmp_pdma_chan(dchan);

[ snip ]

2b7f65b11d87f9 Joe Perches      2013-11-17  701  static struct dma_async_tx_descriptor *
2b7f65b11d87f9 Joe Perches      2013-11-17  702  mmp_pdma_prep_dma_cyclic(struct dma_chan *dchan,
2b7f65b11d87f9 Joe Perches      2013-11-17  703  			 dma_addr_t buf_addr, size_t len, size_t period_len,
2b7f65b11d87f9 Joe Perches      2013-11-17  704  			 enum dma_transfer_direction direction,
31c1e5a1350ae8 Laurent Pinchart 2014-08-01  705  			 unsigned long flags)
50440d74aae318 Daniel Mack      2013-08-21  706  {
50440d74aae318 Daniel Mack      2013-08-21  707  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @708  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
                                                                                                       ^^^^^^^^^^^^^


50440d74aae318 Daniel Mack      2013-08-21  709  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
50440d74aae318 Daniel Mack      2013-08-21  710  	dma_addr_t dma_src, dma_dst;
50440d74aae318 Daniel Mack      2013-08-21  711  
50440d74aae318 Daniel Mack      2013-08-21 @712  	if (!dchan || !len || !period_len)
                                                            ^^^^^^
Same.


50440d74aae318 Daniel Mack      2013-08-21  713  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  714  
50440d74aae318 Daniel Mack      2013-08-21  715  	/* the buffer length must be a multiple of period_len */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

