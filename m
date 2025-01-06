Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F01D5CD9
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155940; cv=none; b=d5CtNz9XiHAhzSnFFLIf4nXIollhEzhD/Y7haY/VIzYq14gJSEqSUtX34OSbeLWJgwRIJf+OjPu1NpLpWqwEh5ba1P2RB8j/gD8NgEFkE8lCIjhWUgrvYoUr47rG0hfT/bOl64LqYnjkkBJS+jxTBFa0gJJJyFjiKiXZZcXuL6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155940; c=relaxed/simple;
	bh=j+5K/Yw15zWJf1U3wa5I1b3+ipxeNF3waXlDVublRJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmapAZMjsKfwgefTuUcfUzj3Qp3F9pqlsdsdjIM0On0gAKW4ocH2SWds0iVVp9M3sBqzGOS7jlFyb9nKBPyj3T8xPiAamk28gI5QP2Swyqbl4nTbA3UvAnggZAR4B9BAc/fBKapdz51L8Jlt+VFWrwD23Ol0Y/Ewncf+MYsvQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeMqsbQJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeMqsbQJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43675b1155bso133770395e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155937; x=1736760737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4wudLqt36meOHn2FyBRvJb7RBQuV91xkEx9ZCgxGr8=;
        b=oeMqsbQJ0T+vGB+gehEWyD+CznlyexrNGXeKkbTm+D2It+JwRusVtPL4QgsDUXisUG
         1m71BEsQxnW/5WpaDAvRZDx2WsRFPVHAwW0jACCibm7hJ39VTVhdLnD8wxt8AeN7KYaA
         beh8z/YvohRt7XGyL0pFEi1RLKv7bjwmSwAQJc6nF6qIR7Odf+UI5ARJyr8bPA9H2ZQZ
         LvSmL+ZEeaRpAHo2y+Purl/9LpkxhjLy3Fsgu4rATpPdVVVzxU9UpW/Gy62nlfaw0w0I
         1oe+Z0L8vkMueRpjdV8SdPgRed+C7v36dlm8WCo6+SvZ4Yf8fF4IX7ESnlPYzUg+tirv
         ZErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155937; x=1736760737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4wudLqt36meOHn2FyBRvJb7RBQuV91xkEx9ZCgxGr8=;
        b=NbFOz9pgjgB2G/42QF52zF1JgypYA+9DgDPaBhishJ+8eBqqXN08cnMQkGECiF5/XC
         valZwWcHr1TOl7Bv/mVtBw4qVQrA4d1X+jSzdPCZyvahzIdl5QqExci5GUUG9oU6Sdnn
         r0JyKdvX01mZ4IhzaUXdr+PJvKk3XInMDAZvN3oQPdrr8UbnygLiPGt85AP5g67nbXJK
         lQyI8Qo7NeR4/Sm+HRUielZNkjF6Cg/HLhk9KtHKQlw61UdK2NrZXOOHs06uiuiebXRg
         /o20MXGv+Szse9TGlpBU5/o3OcvUob3eFRYDjB8VtgAPfiw5ICePvIEIl9/4Zhv6ILrc
         ctPw==
X-Gm-Message-State: AOJu0YwL/KuRCqPwuZLghKGKUGbmlVNNCcJtzUIzBfa6I4DpF7ohR0iv
	+m7yH0BbTk+g5X4fUYCNzHezxtj5lBAwoRQquBFBn1MbAdQJo1EEAAaJC2OMg9SuNu+WkGvwN/F
	u
X-Gm-Gg: ASbGncuLEV5ZcSLUiFJr7NQUDMzBP9fXJMISRwwTbaTzgNY7PhWtCTQ5HSLYX7sQybT
	ZpOpbqXSXAMnCkunF+GQGIG7qLQCJdl1/rRz/QcIJzM5tgIHryEiQ/6qUPr3+bl2aI35X3FWEnr
	5Uw3r5dGUUyt7agxUKGcFSOOUN2licOMkCOcXjKozpWD7WIOHx1EQhEWY+kjUI0E0DYU4BgbBWd
	UU8jXF/RnScJ+G5YSPPCzziVekHbxumoTFQqqKDgTG3jmfMG87sutSduYpVpg==
X-Google-Smtp-Source: AGHT+IGznhjdf9roPTBUrh2MEvUFKUvamB3tHvYpuQ5p6JfZYitbi6+g1EMjzXBFszXoYz9UAtvwrg==
X-Received: by 2002:a05:6000:18a8:b0:385:f7d2:7e29 with SMTP id ffacd0b85a97d-38a221ea539mr47426696f8f.15.1736155936734;
        Mon, 06 Jan 2025 01:32:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acabbsm47077330f8f.93.2025.01.06.01.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:32:16 -0800 (PST)
Date: Mon, 6 Jan 2025 12:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: [linux-next:master 3636/5236] drivers/spi/atmel-quadspi.c:1282
 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
Message-ID: <f3b27d32-1440-4585-9a78-cbd2fd47a992@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [3636/5236] spi: atmel-quadspi: Add support for sama7g5 QSPI
config: nios2-randconfig-r072-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222135.I9vxNl6I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412222135.I9vxNl6I-lkp@intel.com/

smatch warnings:
drivers/spi/atmel-quadspi.c:1282 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/spi/atmel-quadspi.c

5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1274  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1275  {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1276  	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1277  	int ret;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1278  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1279  	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1280  	if (IS_ERR(aq->rx_chan)) {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1281  		aq->rx_chan = NULL;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28 @1282  		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
                                                                                                                                             ^^^^^^^^^^^
The error code was over-written with NULL on the previous line.

5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1283  				     "RX DMA channel is not available\n");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1284  	}
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1285  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1286  	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

