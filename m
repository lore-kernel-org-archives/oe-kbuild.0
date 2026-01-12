Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFB339878
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204647; cv=none; b=sx/a0iBh9EYh6buuzIpqCdRJ0hYqqFMjcv735RIPCxtMFTq0VoUit7PC6CwPLzXOySJ0gKirFZy4qX157W09rqh7UxGOalO+hM/8Z1JihIawwPa9X+NbeV8UVIPlbIpzYC3GoRGF0mBPj18SAta0Zv2GvtQaIt46ylBMQ5cdKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204647; c=relaxed/simple;
	bh=xJsrVMye5Gxd+KJoZVkqplX/4R2uP5UbfHEvPcP7uUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhgZ8MdbOyIUsyOBuOzGLqSKwEDEUOe6fdSeJ+cHS9VnC+ZfbCfdHjhtWU3gK5T9ymEl18UCJZw+Xz5a+pdWCUJJKUHFxCa/3r4+58qCIVkoYN60TEoWwPSu6tqz7pjTgRWj4ROW69INszAaPitROrUUysavtm+f+GBYAIPoxRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HshTIPuw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HshTIPuw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327555464cso3565338f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768204643; x=1768809443; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHcSpt0J//n9tWUuyEeRMDpqtJxrFluPI+axYyMOc4c=;
        b=HshTIPuwAZZ3MQKSBrmZF6iZN4kjl5td552Y47dSj4rOF55OMcLaQkZfd9Dr7jkz4n
         /EBU5HJ+Ga/HHQ0M10d1f9iuxC4EoDZhMT9Cd4Xq3siXbPOr6GlNZLuBqyaXAQoM/NxX
         W4L/dOIPt+8xjwJmdMi2269SJX9sJcAnVqK6Kr3zvCoCAnBcoh0Vi2aErTTR1J+T6b6w
         S3Lz8/k6HU6D8MfEVPXmJfFlSmEO61kusTL78ma+hgacUof1HQhSXIWwr/bnHIfjriUZ
         1WHoY5mJ/04fRfBRU8Wn83eScyIR9NSpKSPpIWMzcvexf5dXr2LDtL3DHwhYBCYd3Qmm
         TGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204643; x=1768809443;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHcSpt0J//n9tWUuyEeRMDpqtJxrFluPI+axYyMOc4c=;
        b=GSGjPGtvHsq4Yq/we5IMQEacDAKPZBZ7Eqw/vckg6uWEwREjPWM+0R4JiPFUdP3Kni
         46GKydwjH3ZfmbNVsVrEhqAdOo4jjfAwQeCbzaLQxR9DTnx6P/qHq6Pkpe6D6snd0Cqe
         9Omhp3d91vDkLdAZz7zM9OEwdGCxycB7e9kYUscBalW0vlqvWaSaOYI9f9njvIhfeEoG
         oS8zKxhNEBv4JJqdK5rwM5quYRmnH4Hd7shwM8hfTHH3TMwnUN9g7pITHJjsSt4z1Oca
         h3DdumaJLnyFl3cVQPo2nH47FflOYkHGPNbSTf/2QDIwZ2VW13zshrHwMmhCPyQFqtE1
         Rbrw==
X-Gm-Message-State: AOJu0Yy3CKCUwIDSpW0PMPECGyPbNf0NDGMVOmg5ZUr4Rev30KdDEn9c
	2NDK26NayQHedmeBtxpkUXv9+VnKDbmllGNdvbbwRbMdEpojVCj68lcogA5KEyt11NfgNFxhpQP
	ceuIR
X-Gm-Gg: AY/fxX7unfyj1Lbd2n//rLf2I87xdiq+F3RchlwEAJEMobqgtzx8T26GjA7d7obKLaD
	zL02Eq87q3GNh0GbyQS7pLFhFeyLQZc7xPphNRmDDNJdIFLhR9jH7kUvnzbFGxxXtQudhTZEzHS
	Iw0l5KJ5dnlb8gRGl9tLBUsSTTxWVEFYRAcKvUAq9qvsPDsY7CK+WJbDZgddZYfruN5b1+95xY4
	aWu35QhWc/6uBbNTEdeCe/AhsB+7zmvRauh2EQkXenOa/yy+T74l4U8Ru3XPUi/3YiJCVtgIsBa
	SMD2vaFAOQES7KrMeRDHXTFuWlzzu3zlP2bliFLUOw/aj6UylzDNAwZTmlZCHiZwgWUNfOqBM5i
	Rl3X33FzoNSsUbDut+/DymIrjTG5a4GVz9KnGUFx3RjnKfUtgTFDODmQpseKI4ONb8MNbXck/hH
	d6pW4Wi3piWoLiTRkd
X-Google-Smtp-Source: AGHT+IHVU3uwgmuYvSLIBEuChOaTGJ1itV2wYM6ORLIdCQZS9BFIJGw3/RWBYiCCesKrugKb6K7gZA==
X-Received: by 2002:a05:600c:45d3:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d84b21188mr198858515e9.12.1768204643000;
        Sun, 11 Jan 2026 23:57:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm37420251f8f.36.2026.01.11.23.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:57:22 -0800 (PST)
Date: Mon, 12 Jan 2026 10:57:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn:
 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.
Message-ID: <202601111406.ZVV3YaiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260112075719.cR0zm9W2jnyOCy9ElkD58khvRiBokhcC5dUJHco3krg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 390c01073f5d0bd64db37926ddb232f33b83620d soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
config: m68k-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111406.ZVV3YaiU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/

smatch warnings:
drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn: 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.

vim +143 drivers/soc/imx/soc-imx8m.c

390c01073f5d0b Peng Fan 2025-04-23  119  static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
390c01073f5d0b Peng Fan 2025-04-23  120  {
390c01073f5d0b Peng Fan 2025-04-23  121  	struct device_node *np __free(device_node) =
390c01073f5d0b Peng Fan 2025-04-23  122  		of_find_compatible_node(NULL, NULL, ocotp_compatible);
390c01073f5d0b Peng Fan 2025-04-23  123  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
390c01073f5d0b Peng Fan 2025-04-23  124  	int ret = 0;
390c01073f5d0b Peng Fan 2025-04-23  125  
390c01073f5d0b Peng Fan 2025-04-23  126  	if (!np)
390c01073f5d0b Peng Fan 2025-04-23  127  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  128  
390c01073f5d0b Peng Fan 2025-04-23  129  	drvdata->ocotp_base = of_iomap(np, 0);
390c01073f5d0b Peng Fan 2025-04-23  130  	if (!drvdata->ocotp_base)
390c01073f5d0b Peng Fan 2025-04-23  131  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  132  
390c01073f5d0b Peng Fan 2025-04-23  133  	drvdata->clk = of_clk_get_by_name(np, NULL);
390c01073f5d0b Peng Fan 2025-04-23  134  	if (IS_ERR(drvdata->clk)) {
390c01073f5d0b Peng Fan 2025-04-23  135  		ret = PTR_ERR(drvdata->clk);
390c01073f5d0b Peng Fan 2025-04-23  136  		goto err_clk;
390c01073f5d0b Peng Fan 2025-04-23  137  	}
390c01073f5d0b Peng Fan 2025-04-23  138  
390c01073f5d0b Peng Fan 2025-04-23  139  	return clk_prepare_enable(drvdata->clk);

Call iounmap() if clk_prepare_enable() fails?

390c01073f5d0b Peng Fan 2025-04-23  140  
390c01073f5d0b Peng Fan 2025-04-23  141  err_clk:
390c01073f5d0b Peng Fan 2025-04-23  142  	iounmap(drvdata->ocotp_base);
390c01073f5d0b Peng Fan 2025-04-23 @143  	return ret;
390c01073f5d0b Peng Fan 2025-04-23  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

