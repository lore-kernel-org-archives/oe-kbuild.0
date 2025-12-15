Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A1327BE2
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790547; cv=none; b=eb1aKqU4E4MbWFvkTNRyhY87z5dX2PujXmt+hh1Y8Pxteya94a06YyL7v9svTRp8xbLgQQDnRNV/zgIsiObBPScg6Oj8aFTHgVzOVin5c93ArFylcBsogXCRUfvkaMh2u25yNtTGJ/QpuEBQxkAZ07Lv0+rhXVKxwXmsiAQc+no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790547; c=relaxed/simple;
	bh=1J0QdY00wB4PJO+YgVHnaMOLl0QgYV3MI07wp0Bf3uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ML+hAcNPYR55DIqs5DiRjqu4cXvK4HDaNIE3n7umu1oBf/xAmQj3OkfFOR4nL0z0OsQHHWeTRmKn8wewcZJxDqhR7gSsgUR8YjcHo3uWP/pAAxIAWzsc98wb0wFLjrbYeO256bBNH8+rTqM5IFTIU6hK+L6CRNkHKkNPDidznSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o07deQt/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o07deQt/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a1c28778so36691175e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765790543; x=1766395343; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2VXxX616Xa5Cko+/2ttqFKgeLLoj3bQjcWSa30krj8=;
        b=o07deQt/stpZQunSh8HYGVoFOf5rzZddjuO0xmEM7XrTp4K5m081dbRj5eBiilAgt+
         tGmH+swzbSMOYqS2uSQQCla5H/FTza7CYFHsBvWwaDlo17jT3cyq8MAPfKEHsr/d3S+C
         rslQ8ZnjH9P0FpHgHcu+tt3Q0GzyD/0EZ7ZFY1aTBzXRRAKaNV/NcEbfIIVsjgmQYxC5
         cqFMIhl3JM08UW6N7Kkm2tMerR0yj5LGYK7jixZj49Ps5GLYlNcZjZP/EL3q/yCRNzZe
         BjXHC+Ui9Ls/iR5UFzL2ERnywuCpgJd1yOKg5VwHvWYBl13sJMfSzdh3J7WulDOzF2eu
         SFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790543; x=1766395343;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2VXxX616Xa5Cko+/2ttqFKgeLLoj3bQjcWSa30krj8=;
        b=mx2ZViCgjvlbfRv2OjAjgCe7DIb/BC8PKn7uIrG4rgyuLPdYq3nn9mnXzWmyxOFbu7
         Tk/kcrg/Cy01xVVpeXe1f/YYZVOiv5xJ0TnJOaBtjG7yeWQSyR4q+CiU+utJsTliwLIo
         EpR4BpmWnrdTn6vlDVugzuTtcYJfO8LIBTz2ImaGu7ysxpw9WbK2SNpPjeVEpNZl4Qfq
         cTvbbwCpZpM3N1Lnr6GGlXCEavppPCTgOukvCTtLhinnsdRsOgMbPfWeR/kJRW85FOdX
         6NhsT84Rvs3GKfJICQhwdxX7Xhsr9bVNWu7LzkyXhi8M/TfqHb4r9CAj+PVcl4NEwNZj
         uLRg==
X-Gm-Message-State: AOJu0Yz+sXoKNpXm/0OAU226myKfPZ7CAWXyYBNq7wevZKCXpMYTmshD
	JhhcWHQfoH6LfaeXorKEGpyxylohxYC/yX+7T7eE7Q5NDwHZC3jNO1NN9N76O1RrpceYKpya6l0
	m3wCb
X-Gm-Gg: AY/fxX7Ivrwv4sANHxNH0y8VBl8/zBA3obqOwgDftkakl53TipYuTTKgd8xQBd+EwWg
	7C5lu+/nBbp1nYJwjRNKFBGGTnl4RX9wOUd3rnDMCfyiUKTdJVX73QLpPR9kqI31icvco8U+iDj
	i5t05FFtmdfrcGB2M/bVue8gGZ1wrJj5LfsiBzaSX+9QMdtAxpVXqb/pTa7BUUtKxVfn2G/5pIN
	0afGpl4QJxI3k4mhsCptt2c/06ysQUosETMibkQ50Pju8I3GNGtg7liy+F3Ag1QFiKN2xFSMhF5
	ZqT5ARJ/i/LURMY2+OXBxmj0yPJre1xDhOfgurVVanhRh2OEcGJ5WWMa8YZ2eeCHQwQgER1f0gO
	aCqDp/XI9yNDUzqSRVyDzQT3Zp+gkoQ/tYJkAIzypsaRhmzS8lTGsrWwBdhd3n6f5ubtSDvxSjs
	a2B8f+Ut/I+4BWl+zd
X-Google-Smtp-Source: AGHT+IE7Knx5lMleMfeMPsA8aVy7Wl2m2eXYgXjZ8WdEgLLRycfAIbcFrV8EyUjms/49oisAl+1Y/g==
X-Received: by 2002:a05:600c:4f09:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47a8f916685mr86996195e9.34.1765790543149;
        Mon, 15 Dec 2025 01:22:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6e5baasm186959115e9.13.2025.12.15.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:22:22 -0800 (PST)
Date: Mon, 15 Dec 2025 12:22:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andy Yan <andy.yan@rock-chips.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202512151515.PjP26FTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251215092219.L4C4Jj9KvBI4YbvJV7F3_IevS-8yuiryy1Dx4i4QI-M@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174 drm/rockchip: Add RK3588 DPTX output support
config: arm64-randconfig-r071-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151515.PjP26FTp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512151515.PjP26FTp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +2080 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  2068  	ret = phy_init(dp->phy);
86eecc3a9c2e06 Andy Yan 2025-08-22  2069  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2070  		dev_err_probe(dev, ret, "phy init failed\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2071  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2072  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2073  
86eecc3a9c2e06 Andy Yan 2025-08-22  2074  	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2075  	if (ret)
86eecc3a9c2e06 Andy Yan 2025-08-22  2076  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2077  
86eecc3a9c2e06 Andy Yan 2025-08-22  2078  	dp->irq = platform_get_irq(pdev, 0);
86eecc3a9c2e06 Andy Yan 2025-08-22  2079  	if (dp->irq < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22 @2080  		return ERR_PTR(ret);

s/ret/dp->irq/

86eecc3a9c2e06 Andy Yan 2025-08-22  2081  
86eecc3a9c2e06 Andy Yan 2025-08-22  2082  	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
86eecc3a9c2e06 Andy Yan 2025-08-22  2083  					IRQF_ONESHOT, dev_name(dev), dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2084  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2085  		dev_err_probe(dev, ret, "failed to request irq\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2086  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2087  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2088  
86eecc3a9c2e06 Andy Yan 2025-08-22  2089  	return dp;
86eecc3a9c2e06 Andy Yan 2025-08-22  2090  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

