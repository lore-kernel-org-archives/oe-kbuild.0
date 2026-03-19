Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5898421ABC9
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935468; cv=none; b=Z8XLck9O2v0aSTcae9IpoC1wFPHk8xdqqjdAW+r3Zd1ZrgZ9KTiv0sqPcYvR9zb3GiulgeIOhgL/qKPiegXLA6xgBuihoxxFB4PPZpNqKDbUeCWVn2pvmpS7hAO50gtWV80BgCOqe+hxDl09aw8M1EAFMlonmwnouxLnv58mS0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935468; c=relaxed/simple;
	bh=htbKaCcPsqzgp0/d0xa0hAnmfuRE6MBP7rNT/fVsEJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=F6AQP2SNgT4iU2Y6Q7zLBbAIYXeXrQmXxSH52uHc05J8AvmGlsmvxgP4i1LJZ3uWiEnXOoRqJoD0wLvBYeQR9iIr6wt2BnqqWkk1IJ/rxgjgWsPM6eKzqFiu27lSJEi3dNSBj3Zsdzls6tPojaf1LealNy6Jw2gXwgGQDfuMVKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yh7oEPez; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh7oEPez"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-667acaeae82so1336862a12.3
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935465; x=1774540265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xF1PTk3vkRprEYqnuXa/M55cUPdQPeSRT5BOEVfLuaM=;
        b=yh7oEPezld7hTUEGKkIGBXattSUufqR3kpjORYHGysCo/MQiF4zk2sfq1w5Q0C3Kgu
         wDNObZ3Z84UxtCPDpYxxoEW50AL8UtRz1F26GXEwmJVnwfZ/pbJ28N2UZ17t+JKfGvhF
         poPmNznZRBqnho2vcqhCL2em64Oi+/b8pkmv5FVmBA8rDfzL3jCIuQnyKKqi1TcpmAlw
         M+379QPrG+86P52rDmwWHMqL4I4pETh1BVtKWNLT5FIj3VI5jRSrUXmU49EXV2Lb+3CI
         04sxG+UoQHkpV3Akeo7xoTMFD3+f3lfzcu7CuRXtOkcDgglXcAmgWPoIoKM6ywG945xw
         UJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935465; x=1774540265;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF1PTk3vkRprEYqnuXa/M55cUPdQPeSRT5BOEVfLuaM=;
        b=Jt2iVnPaR6YiKNTNjCwDSQi2s6b/ngRDjyiEuMt42OXV4O1IbKVieZRx1ZirTYkY5p
         JFki/8RiayV3Kn75ZWlxMVed6oroHKkrc53jl+gmm/UYPIXc25Ga/i6HfAnC/XMN8W3K
         OCM1c007CN8LYSijJ0vvp/58hFb4g6Ty1u4pt7YO7qGUB74mODQu/93vEqLQd4q3GCT8
         2ppsMxUeljoGwbtkLH57ed+BTqnYorscrUUjkyaXp7frhXIpfozdI3C+K2ndJHqqneCl
         zQVVvtdgDnCrRvQyhdEvn+YNhuXC5ZLaGy572TaZZxG6x4hIXy3fN7y3VswbStpuMMXw
         CmCw==
X-Gm-Message-State: AOJu0Yy/gvM7aj5ZhGfn/Z3GVJto1I9ZDGfzrbiZUc5VpN/hR+i4VkUs
	H2BtsQkHQ3ACmNBCYzElwJn0dcwzz27L3vNpKal+DbibXG4sq0AMy1STFNBLWxXif5YWpSJC2z8
	oTZ/3
X-Gm-Gg: ATEYQzw62lA0N0HX2gQwPhw9bneqJxDmdf7c0dKufIdvAS+4/rQCulFGS+BFhVRWpQC
	hPA3Z98+/DX3HSbF5F9PKxwXoCESF8vqrU5ZRg6HxL+JkpiOxr2mhGuevQ+1siqkqWMJxEs65LO
	3zKkgd9tXe08Rktb0pP8y/AGPRvayNE6t9YOm0NL8BI5CKno5ScdhUW8NkuoxRqmaHucPsypWeY
	+JAFcp4Jzgva+6Ba/4aDfgQmuAIHgHRY2tZ1IufS2aMoCaJqVTnYghzgMDTjYFNkOGIN/Dx4O8K
	LNSMAFKXbzKfyZiD9Lo7/hKj5R0QoJa6W3gjhPGRksmwze1/FhaOmoaD2l/UZJ5vakoqwXdec19
	1XFgyjqQOTD6vVZYPaCHMEsKWYclDHmBmWLTJThkMVOlLFmL5tKrZQnChDMRnCavszbuV5YjUa5
	qwOEB079Vir/aKPi6o/0Mfiw+fT6np
X-Received: by 2002:a05:6402:51c8:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-667b30fa581mr4994027a12.20.1773935464564;
        Thu, 19 Mar 2026 08:51:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668621dde0esm1353353a12.24.2026.03.19.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:51:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:50:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>,
	shenyang39@huawei.com, broonie@kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in
 hisi_spi_flush_fifo
Message-ID: <202603192159.S0PIjhlg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01@kylinos.cn>
Message-ID: <20260319155059.kPDMSphOfky-RVCJzBMjaa9mc8HepCmTb08rG77G3RA@z>

Hi Pei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-hisi-kunpeng-prevent-infinite-while-loop-in-hisi_spi_flush_fifo/20260318-211321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01%40kylinos.cn
patch subject: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in hisi_spi_flush_fifo
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192159.S0PIjhlg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603192159.S0PIjhlg-lkp@intel.com/

smatch warnings:
drivers/spi/spi-hisi-kunpeng.c:206 hisi_spi_flush_fifo() warn: should this be 'inner_limit == -1'

vim +206 drivers/spi/spi-hisi-kunpeng.c

c770d8631e1810 Jay Fang 2021-03-27  193  
c770d8631e1810 Jay Fang 2021-03-27  194  static void hisi_spi_flush_fifo(struct hisi_spi *hs)
c770d8631e1810 Jay Fang 2021-03-27  195  {
c770d8631e1810 Jay Fang 2021-03-27  196  	unsigned long limit = loops_per_jiffy << 1;
c770d8631e1810 Jay Fang 2021-03-27  197  
c770d8631e1810 Jay Fang 2021-03-27  198  	do {
e8821f559fed86 Pei Xiao 2026-03-18  199  		unsigned long inner_limit = loops_per_jiffy;
e8821f559fed86 Pei Xiao 2026-03-18  200  
e8821f559fed86 Pei Xiao 2026-03-18  201  		while (hisi_spi_rx_not_empty(hs) && inner_limit--) {
c770d8631e1810 Jay Fang 2021-03-27  202  			readl(hs->regs + HISI_SPI_DOUT);
e8821f559fed86 Pei Xiao 2026-03-18  203  			cpu_relax();
e8821f559fed86 Pei Xiao 2026-03-18  204  		}
e8821f559fed86 Pei Xiao 2026-03-18  205  
e8821f559fed86 Pei Xiao 2026-03-18 @206  		if (!inner_limit) {

This test is wrong.  Maybe change inner_limit-- to
--inner_limit.

e8821f559fed86 Pei Xiao 2026-03-18  207  			dev_warn_ratelimited(hs->dev, "RX FIFO flush timeout\n");
e8821f559fed86 Pei Xiao 2026-03-18  208  			break;
e8821f559fed86 Pei Xiao 2026-03-18  209  		}
e8821f559fed86 Pei Xiao 2026-03-18  210  
c770d8631e1810 Jay Fang 2021-03-27  211  	} while (hisi_spi_busy(hs) && limit--);
e8821f559fed86 Pei Xiao 2026-03-18  212  
e8821f559fed86 Pei Xiao 2026-03-18  213  	if (!limit)
e8821f559fed86 Pei Xiao 2026-03-18  214  		dev_warn_ratelimited(hs->dev, "SPI busy timeout\n");
c770d8631e1810 Jay Fang 2021-03-27  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

