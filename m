Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D61474DA
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721414907; cv=none; b=WH72ww9zXxppPcTQS4LhD81UBU1Vzt2lWYW48iXaC5Z14v1R40X3VCbxEZ5lQSUeke472EM4nClqDsKYaa7P8B64J2iuhOHcxBKYDwRn5aHrd0r3yRVujrfks5i4iuOTjBIs27BadPjVpp2cJZJx/YXHbPnxPghLEPTHa62fseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721414907; c=relaxed/simple;
	bh=KSP3qFQimIB/KWgpWhEu0lTlpGLv27AIGOdpzPyZz9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LcOeqt8lgwvKmh5jndEl+FhVXpUStXq1GuCqSK+P3Uv2GxfFSQFzI5EB5i73HazRHd5aju8nmICsgneQRNsAepcJN/nEZgSstHdF2AYNqKX9LlyIiVLFTzJR2FHALYgMmiNN25GYHzJMMRDJPsDuhawbTKt6GwBFM99RtIEo1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DSvHU4yX; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DSvHU4yX"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d9e13ef9aaso1305752b6e.1
        for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721414904; x=1722019704; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ukG7Uje2tjlYAEnwiivgrAC4JGlADujKudhRv8xZLpk=;
        b=DSvHU4yXkC6EAuXqexHsetyTnz0ahCI2EP1WuXGZPe+dc/UHu/F4GgvSNy5UGsQETX
         QY0Be9aj7CPYxI1PpMrDWHwa4tmTtcckzkz7eUmQNHRnkjl4WJDDC6CjIxFENowd0Glx
         piwt3L7fTcO6mcWolYH0AVRqQK/yaa4QLooBgJzvHxHQwdRma2m+Hud81EblfYxNHrSz
         UJMFA7xubstOgYXOvKoorIfXBFGukHHAVGZWi4yVkUl3m2nZio/vpGmR1QevySZimsYR
         Ci2LB5N5HFTG11J1CZFuS5WVEMe4FFHh8ze8QKU4MiECleCFaX1rNtLdat+srQ9/2m6x
         7JzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721414904; x=1722019704;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukG7Uje2tjlYAEnwiivgrAC4JGlADujKudhRv8xZLpk=;
        b=ISam1GB9+v/VOztAJ3ktbBxB7pb/VLVA4Y0yiEXqJ+SY0ld5RO2ZJ7JMI0W2xVCrWi
         svMBR9Q45Kz9kxT5iXp6kchTr4EncgmCwi9pSftAYEhP4JRezf1gJtOY736Hdzc3bR2I
         c36788CDSHQ3GvkbLGdJvSzGFtJccjceda3XIhGdLfm66bB73ZLFmNLZ8Dn1D1FiJzBa
         vIKbNtqt12QMx8a/LXLCeBlgDDfe23QTrnJt4VbNEzYyiEsNWssydf0pyneAbZMwXkR7
         mF+tQbRkpsHQrpGeLrLu+lJp4bQ2T1LsgXwWd9zhxKl0DwLuAicNcvfDgkLvcYwSxnmE
         PVWg==
X-Gm-Message-State: AOJu0Yw1vx6rkpq/LqnM1N1LXwCehdn4aQ14pqcBB/jZuTFqtebWy9bB
	d4E8cIA+sHBZ+bwmMjmmD4KK/tb4UOq7u5ewt8FEkBh+VtcsYVIQfeTZCZu+RsG6u03/WVL17ZO
	7
X-Google-Smtp-Source: AGHT+IFUGjfozpT7NMN/T1JZs9styGTo80iaJ/5feWyL+K6jzfZXUSsuGczjQ3mCsZm/CiHApe701Q==
X-Received: by 2002:a05:6808:1b20:b0:3d2:1fdd:286f with SMTP id 5614622812f47-3dad1f7c310mr8527058b6e.49.1721414904156;
        Fri, 19 Jul 2024 11:48:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:4528:a9e:1eaf:80c5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae09cf1ffsm386578b6e.36.2024.07.19.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:48:23 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:48:21 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sunyeal Hong <sunyeal.hong@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: Re: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Message-ID: <a82340ab-a1db-4089-a804-acf9882782f4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707231331.3433340-4-sunyeal.hong@samsung.com>

Hi Sunyeal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunyeal-Hong/dt-bindings-clock-add-Exynos-Auto-v920-SoC-CMU-bindings/20240708-072150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20240707231331.3433340-4-sunyeal.hong%40samsung.com
patch subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
config: arc-randconfig-r071-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200028.5AADGhmj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407200028.5AADGhmj-lkp@intel.com/

smatch warnings:
drivers/clk/samsung/clk-pll.c:1292 samsung_pll531x_recalc_rate() warn: mask and shift to zero: expr='fdiv >> 31'

vim +1292 drivers/clk/samsung/clk-pll.c

5c788df7a25de7 Sunyeal Hong 2024-07-08  1277  static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
5c788df7a25de7 Sunyeal Hong 2024-07-08  1278  						 unsigned long parent_rate)
5c788df7a25de7 Sunyeal Hong 2024-07-08  1279  {
5c788df7a25de7 Sunyeal Hong 2024-07-08  1280  	struct samsung_clk_pll *pll = to_clk_pll(hw);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1281  	u32 mdiv, pdiv, sdiv, pll_con0, pll_con8;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1282  	s32 fdiv;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1283  	u64 fout = parent_rate;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1284  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1285  	pll_con0 = readl_relaxed(pll->con_reg);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1286  	pll_con8 = readl_relaxed(pll->con_reg + 20);
5c788df7a25de7 Sunyeal Hong 2024-07-08  1287  	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1288  	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1289  	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1290  	fdiv = (s32)(pll_con8 & PLL531X_FDIV_MASK);

PLL531X_FDIV_MASK is 0xffff.  Was this supposed to be a cast to s16
instead of s32?  Why is fdiv signed?  Shifting negative values is
undefined in C.

5c788df7a25de7 Sunyeal Hong 2024-07-08  1291  
5c788df7a25de7 Sunyeal Hong 2024-07-08 @1292  	if (fdiv >> 31)

It's really unclear what's happening here.  If I had to guess, I'd say
that this was testing to see if fdiv was negative.

5c788df7a25de7 Sunyeal Hong 2024-07-08  1293  		mdiv--;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1294  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1295  	fout *= ((u64)mdiv << 24) + (fdiv >> 8);
                                                                             ^^^^^^^^^
More shifting.

5c788df7a25de7 Sunyeal Hong 2024-07-08  1296  	do_div(fout, (pdiv << sdiv));
5c788df7a25de7 Sunyeal Hong 2024-07-08  1297  	fout >>= 24;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1298  
5c788df7a25de7 Sunyeal Hong 2024-07-08  1299  	return (unsigned long)fout;
5c788df7a25de7 Sunyeal Hong 2024-07-08  1300  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

