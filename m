Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA642317D
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 06:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062653; cv=none; b=R0L+Tq1+zFMrLslUtc+crutsFvvykkhZPYi6jYhzoEuaHZa9yscpCOtRewXKvAfI4Cw1jdiC0vmamVpHC+kpQ0AzQgSffgahZBkzL74yKpyTKBaKS2yNR0bdSGO+gSSBegKVEA2qHW3Nz4dFsOdx8cHY0j78LWZlLj/mb36Hwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062653; c=relaxed/simple;
	bh=HwQQ/e13d2XeVp13BFe2FpMedQM5DZhp8KcD4K71ego=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QBxqEdF9KYLQ8J2PtvtXrPkS/nn1N2HZBd1kGLwyuMu1cYiGzBJdJzqau9sHYbYOeol1WA2RWKUqqHjEacOtSiKoExVWqCsQLPDa01siDA89wRwDqQrwi4LXnkH0v9YN8/PyNlwegnOAvUJUbYoS2y/59+cpjzOjwO9+YraV6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyQ+niyJ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyQ+niyJ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so4287465e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 22:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769062644; x=1769667444; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFWxi+AFltNFDVpcrpAcnDmVTxmCRVFES1AkiIw22SY=;
        b=eyQ+niyJiaEA+TK48YkRPYEMCzuRLIIQNomVlaIcNWejtO737zUo6rlkb6cAVDEiQb
         8t4joZkp4PrhZchH0aFlsVezqGh71ejVpvkGZSJaKaebKA5mMKxwHVwZn4ZbH5KxBPhx
         bsd1CL7uQQoet6p1dfY4n+w8sXGoD4b8Ob4/D9kRLjx0igdLH8ROWCbxjpvGUcB5+qps
         9cTlrGOY1cs67q3Pl1gh9W9JyZNCc2pYWOcT4wRSkKyd7d1q9RDlvOihwyUucIrZ89oA
         8x/PjC91eMu7Xohxh+xyuMMIdJ996NrLYq6KM+Oe28MWo0ljrcN+VTldnbIZwufStzDg
         ZYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062644; x=1769667444;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFWxi+AFltNFDVpcrpAcnDmVTxmCRVFES1AkiIw22SY=;
        b=ihUOkTQFkDGpdtoZTy8i+waH67rNeBU5o+rgtK36w7QokcO+Vpd8N6i/GXQ2cNKP5W
         tkWH4iRvq0h2xvz9VWQrDb404+hx5NZ7VNkgofCCZbbX6hLsxKW5TdGIakRJFqBOFRd5
         t2ZaQ/ZxTuFCKb1d4ioOGfunO2rpavKoBmE8vLQRneochI3aY72Xn8R6WlNR2eh9v9tz
         2dpV6ssR2oAwdEQ7CuP2nrf2lATe02EkhVv2FBqHjaNCrLVl9CEHbBMn2yLRXmX5CUYf
         +cAdtQbMk9yIPf/eHUUlbtKYhbPhHjWk3xQQC07O9yL4GK/E8XD50Z0T5IJFbpvATF03
         ZmmA==
X-Gm-Message-State: AOJu0YzUXwqpKj16pGgm+tKNTHVT5tJfSw1L2BSIzHBKE8K+uQx5lU8N
	l5+j1p5Zcg7Q9vWji2KDz+4BXjgusb96XHwfRTUlWTDXshK672NWMH2bVY8NVLwEG1sD9sKBVLY
	c0tGbJHQ=
X-Gm-Gg: AZuq6aKSmyiGpz6Ykzn6+SHtoEtBiJeNOQh9vCGTVdmhOJQ1tg7d+iSQtQVGbmGVtGo
	mFeBlzjlV7TBhyLHh59f/rkuZk72wgZwqJSzBrTJN0+068BMvrKE0MF1tQ360jq4o7BTB/WVzar
	le2fMVcK38mclb8Non6Drjj9w977bS8cfyihGip+11I8tDSGqwYSNNHs99IvrPNIHVLfJMZ0Ite
	lJRhCXkIjZy3hQkCE690TzyRTcCLd3a+UyavBoq18BhK+f99SjA/TamOK+fL4mLBGyD6AvHyblF
	Ua/trWXghBEUh/wpegD5xwmQ0Kc2HtxZZbuSBmrlXw4T4bkxu9AVdtS6JdWwAg4y7wfzS517v4z
	imZpwW5gePa/ZLWRQ779a++vD/x/+hKEFvPzlh7BK5Uhr9PGfyLsYAlFvsJ7d5lSdc80mVKkAM2
	DqSzk8enf4iGTfTYkn
X-Received: by 2002:a05:600c:83c8:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48028360726mr235733975e9.7.1769062643924;
        Wed, 21 Jan 2026 22:17:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b89bsm40122255e9.9.2026.01.21.22.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:17:23 -0800 (PST)
Date: Thu, 22 Jan 2026 09:17:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Josua Mayer <josua@solid-run.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202601221036.J0kR78Uw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-rz-sdio-mux-v6-2-38aa39527928@solid-run.com>
Message-ID: <20260122061720.ZbUhOO_28X8eGn1A9gW27wbOJO9_dnQw7MhOOgFsFG4@z>

Hi Josua,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260121-173607
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260121-rz-sdio-mux-v6-2-38aa39527928%40solid-run.com
patch subject: [PATCH v6 2/7] mux: Add helper functions for getting optional and selected mux-state
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601221036.J0kR78Uw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601221036.J0kR78Uw-lkp@intel.com/

New smatch warnings:
drivers/mux/core.c:776 __devm_mux_state_get() warn: passing zero to 'PTR_ERR'
drivers/mux/core.c:796 __devm_mux_state_get() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/mux/core.c:722 mux_state_get() warn: passing zero to 'ERR_CAST'

vim +/PTR_ERR +776 drivers/mux/core.c

0610cc3159b786 Josua Mayer       2026-01-21  761  static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
0610cc3159b786 Josua Mayer       2026-01-21  762  					      bool optional,
0610cc3159b786 Josua Mayer       2026-01-21  763  					      int (*init)(struct mux_state *mstate),
0610cc3159b786 Josua Mayer       2026-01-21  764  					      int (*exit)(struct mux_state *mstate))
0610cc3159b786 Josua Mayer       2026-01-21  765  {
0610cc3159b786 Josua Mayer       2026-01-21  766  	struct devm_mux_state_state *devm_state;
0610cc3159b786 Josua Mayer       2026-01-21  767  	struct mux_state *mstate;
0610cc3159b786 Josua Mayer       2026-01-21  768  	int ret;
84564481bc4520 Aswath Govindraju 2022-01-07  769  
0610cc3159b786 Josua Mayer       2026-01-21  770  	devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
0610cc3159b786 Josua Mayer       2026-01-21  771  	if (!devm_state)
0610cc3159b786 Josua Mayer       2026-01-21  772  		return ERR_PTR(-ENOMEM);
0610cc3159b786 Josua Mayer       2026-01-21  773  
0610cc3159b786 Josua Mayer       2026-01-21  774  	mstate = mux_state_get(dev, mux_name, optional);
0610cc3159b786 Josua Mayer       2026-01-21  775  	if (IS_ERR_OR_NULL(mstate)) {

Please, change this to if (IS_ERR(mstate)) {.  The mux_state_get() never
returns NULL.  I have written a blog about functions which return both
error pointers and NULL.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

0610cc3159b786 Josua Mayer       2026-01-21 @776  		ret = PTR_ERR(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  777  		goto err_mux_state_get;
0610cc3159b786 Josua Mayer       2026-01-21  778  	}
0610cc3159b786 Josua Mayer       2026-01-21  779  
0610cc3159b786 Josua Mayer       2026-01-21  780  	if (init) {
0610cc3159b786 Josua Mayer       2026-01-21  781  		ret = init(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  782  		if (ret)
0610cc3159b786 Josua Mayer       2026-01-21  783  			goto err_mux_state_init;
0610cc3159b786 Josua Mayer       2026-01-21  784  	}
0610cc3159b786 Josua Mayer       2026-01-21  785  
0610cc3159b786 Josua Mayer       2026-01-21  786  	devm_state->mstate = mstate;
0610cc3159b786 Josua Mayer       2026-01-21  787  	devm_state->exit = exit;
0610cc3159b786 Josua Mayer       2026-01-21  788  	devres_add(dev, devm_state);
0610cc3159b786 Josua Mayer       2026-01-21  789  
0610cc3159b786 Josua Mayer       2026-01-21  790  	return mstate;
0610cc3159b786 Josua Mayer       2026-01-21  791  
0610cc3159b786 Josua Mayer       2026-01-21  792  err_mux_state_init:
84564481bc4520 Aswath Govindraju 2022-01-07  793  	mux_state_put(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  794  err_mux_state_get:
0610cc3159b786 Josua Mayer       2026-01-21  795  	devres_free(devm_state);
0610cc3159b786 Josua Mayer       2026-01-21 @796  	return ERR_PTR(ret);
84564481bc4520 Aswath Govindraju 2022-01-07  797  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

