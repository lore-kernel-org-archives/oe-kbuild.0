Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EA33F8C7
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134899; cv=none; b=MxUidhQyyKEIUnx8SqVc/mkxnZggCMsl6m7ybl8DQ9Gjj6KW4Lmdjo8/ESU2xpHNpUNzqlKnUSBAH7kGG2yPACm8lyWZH7Cn05g0Fkhb9YjdpBN7D3DGHB2ipoLPu+63hXp/espE/LPdYc+l/LLeydJVNzPvblkYa5LlCLQPn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134899; c=relaxed/simple;
	bh=tZhHNi5tiOiq5ZyFScnnqPfCNqj/bQHHe9aIYrpZW4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iO7g0fFRhJX71vgZKduVpRTBkBWelLnwdTnxLJbRGvfac3veRXLLSkMlwGM65NwARbJqtHLSgXLRywKkSvVghHdva+rGR3ol1TymWIy0vEn4NqzlHnVbPQNWhNkkMkLGXcHakXzdOgb3f4H5GBGiSXiQVc0R7Qql/UshrO9kMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYEZ1uBB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYEZ1uBB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so11585685e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 05:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134895; x=1761739695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvbnSMIYk5HD128ctAAfLOD94aj1lQC5qodcVPOSef8=;
        b=mYEZ1uBB4TTssHTgAhMKw7oMhJ7NPFtTy81iSrr7I30f2b035EHgd9Kq3DQoeSONk6
         6pE7O9kQaO/vANCSdthYvl767nNLOCSjFJM4eNuJARpIgz6VsCd2deYdUjjRt4MtQI13
         Be8jMHy6+A1W7EYs5p9NPQ/ZUQwp+U1P69pvMedJVxBKgyVJEU8I+14JTbKo6+6VXxvL
         vWtkp+/1EOIEY/toVZ9a3wucfL4sbW7YqgR+mp6BHpqdh8yR1XAljwOG50oSDINS2rxC
         uP0aN43hw6VyqmtUF4Mp+8AjwuaSYegrWYMLBKXwzkVswytXfruCZWsMQYVF/ymlWJ85
         N0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134895; x=1761739695;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvbnSMIYk5HD128ctAAfLOD94aj1lQC5qodcVPOSef8=;
        b=RffKqnjYPDAQ2alO6QNlFmfg+mvWUbrFIvFztzSbJVkEHcV6+saiS3OnQVYa/H2WwB
         W+4H42cv0Qoss7RxJmrje44Tlhf0rTyQseGhyC7ftKAKEwZ8EQc5jVu2AIPEAvQC8AW4
         ELEPaCV2gMkOIhuwi1z1g5tC5OdRJnQbZv4t540QjZpP/kALZB1fivoUwuXToc14ylJH
         izqK0lbXdPYv6qcoWrC30tewDv7U2kEO9NHKvvTHb49+KN7WB+JgQfhrAjf/JbiJsltV
         S53Rc6Swh/q1AmJ9zMP1q4kHmSrB5CMQOrgazhMfefveZ4ThXE6Wp4lmWKPrLDkLNCTr
         AeXw==
X-Gm-Message-State: AOJu0YwPNdJ10aaLHfDKxrirTtV7dkcmsuKnOSkwvl1co4VKR1t/w+A6
	QJvO63p2z3/m6tdBM42cJmJXaXMOsXjvFb6PPGZ9iBNXHC2N22roEaM0xtpmltmL7cfGqOL7i0W
	IDYtc
X-Gm-Gg: ASbGncuS/Zw/HfHWLnmawtBPFuLnOG/OzJ6DgZOrWFu7jkYN8G3Gd40KCbHaXCgPdgh
	IWHzB11yUmD3YUB8Cp5DjWFCXzaEUCN4BOCeCBpS/6W7xneP9TXXTVdW4PBPiFVK/tJOBh9hk2R
	cUUgFqa+bc8bHeGlcXYzS6EVxUYog+JTlkM0i0rKQDE6qK7qKa1Ef614Kb7Nsq9upEA3He/lcno
	dQlboNllOVNbnVCf3sO5ZdTm0rIjKehr5xpAH4ygG0cv28pekPoPSFeFiGL6yFkQy9Dl1J/RAM0
	JMOGtq37aUWVPj5CjP8kwhgMdEYkOMsTJVDPEgUlLiGvcSbhmhkZRDMq3Ci7rGw2AFzLDjj0zJp
	5Vk5K4jRTQyNqe/0+gZQM0eQLCWxKhph2gZ1N/55sbv509axOYbkdv69P6C3ahmqJE/zGBLMLkx
	4XUVvkeVzUmVCbcMQf
X-Google-Smtp-Source: AGHT+IFtLElvxR81Tckw5mAAABXqwaPNv/lBu1tgkcuWlvZJfGpip3RMbzFOLoUXkftAvfjFkop/kg==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr12489147f8f.18.1761134895206;
        Wed, 22 Oct 2025 05:08:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496cf3b51sm35168225e9.9.2025.10.22.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:08:14 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:08:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Artem Shimko <a.shimko.dev@gmail.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Artem Shimko <a.shimko.dev@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
Message-ID: <202510221508.PY6fB9CB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017102950.206443-3-a.shimko.dev@gmail.com>
Message-ID: <20251022120810.SMSP9-QrqBDBtA-ulo2ujWtv71W2U40tsvZseE44xcQ@z>

Hi Artem,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/dmaengine-dw-axi-dmac-simplify-PM-functions-and-use-modern-macros/20251017-183103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251017102950.206443-3-a.shimko.dev%40gmail.com
patch subject: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251022/202510221508.PY6fB9CB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510221508.PY6fB9CB-lkp@intel.com/

New smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->core_clk' from clk_prepare_enable() not released on lines: 1350.

Old smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1237 dma_chan_pause() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1284 axi_chan_resume() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->cfgr_clk' from clk_prepare_enable() not released on lines: 1346,1350.

vim +1355 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

45fdf99125b2bf7 Artem Shimko    2025-10-17  1335  static int axi_dma_resume(struct device *dev)

I guess kbuild bot thinks these are new warnings because the function
was renamed.  In the past we've just ignored clk_prepare_enable() warnings.
Perhaps that's the correct thing to do in a resume function.
The indenting in dma_chan_pause() and axi_chan_resume() could be cleaned up.

1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1336  {
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1337  	int ret;
45fdf99125b2bf7 Artem Shimko    2025-10-17  1338  	struct axi_dma_chip *chip = dev_get_drvdata(dev);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1339  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1340  	ret = clk_prepare_enable(chip->cfgr_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1341  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1342  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1343  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1344  	ret = clk_prepare_enable(chip->core_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1345  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1346  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1347  
9c360f02c387f93 Artem Shimko    2025-10-17  1348  	ret = reset_control_deassert(chip->resets);
9c360f02c387f93 Artem Shimko    2025-10-17  1349  	if (ret)
9c360f02c387f93 Artem Shimko    2025-10-17  1350  		return ret;
9c360f02c387f93 Artem Shimko    2025-10-17  1351  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1352  	axi_dma_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1353  	axi_dma_irq_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1354  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06 @1355  	return 0;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1356  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

