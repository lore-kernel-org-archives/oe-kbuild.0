Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01232E6B6
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354756; cv=none; b=d9/mF1s1RRHzbauBkFKUHxx9lcHkmm196dp8A4vVfTaOuSGLG+D4pBjMtwcmJEUhevaKbbeiR3xY642lMbWmjWu7xfAVDpfy0T+8uLDpchuL14NtuxvM0g4cdTY6zafkS/hjRMKoIaPuFgDgqeXtG+wKbvf/I4rHevg2hy8Enj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354756; c=relaxed/simple;
	bh=en7TeJlKBrx/C+nM4gOVy8baN0W/O3amap3OUmtB08E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BIXqC3ylrFDJfwaZZyqXErkku17aEArODzqFE0KhK8OzUP3B0Vwujn58pTrbnO3P/VxCH1XtoZfOSzgaWMDstRl+qde1Pl+Wq3yi3GLcnbAWQeu2UojbW02vdtJX7Z+sy60AICz/GXqLIeQx7Sn7Ti9+oaI+Dzw2lzr5YCbUcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ck4FNE+2; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ck4FNE+2"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64034284521so11620723a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Nov 2025 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762354750; x=1762959550; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1Ufgq26KO/UiFTVQ2dwsBFNMe828bkTGONCB7/Nzc8=;
        b=ck4FNE+2bczvF+og4ewooss/H8+bOx3n28TDiqZSi5ThxDNge6kAVA5yZy6a+x3J8g
         QPl8XcC7uNLMWGqwKrk7ze6qW3fU/NZKcoG1DSJq5VRyUVM8U+xqv5K7F91Irqwl+lPA
         JXAlX91UIAHMarg0N1eSiI7PYWguvMpMQhNS9qgKjONSZGY2xSTaHdcFjsZwyjWTDlcl
         lvAh2joFZnYeXjVIEI7yNCG8CVWl2Zeu9xICi++la+9xaj/8llSIvlYia7nNB8aEU0y8
         Oh7hhEr5nYjBJnOBDmR2Gmwf6fTTLPXmuu3YA7yzfv2PPNNgPFA1T+QqSENXZrzOeZmc
         CiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354750; x=1762959550;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1Ufgq26KO/UiFTVQ2dwsBFNMe828bkTGONCB7/Nzc8=;
        b=VbZVulamuwoEmrZEGBG69REJ7ur0oD3HQkOfDAhnIdy8bQCi47DV1V28VkpPcjDjZb
         1TTJxeOZ+MWYLJxDl/tX2XeMI23Vx5Xi0X8X6BzBV0V2RxSbC8eGOLZa3zvrfDVPF8XU
         q1/kyqd3e/Gm7ersG0Ugk7QVbdXcNbMQlHZVWe1VufJ/AgMEcJQXeYcMxbfU22okBO7t
         xHSCm0GReC4GI8eW3Uro+pqBo8Klt+SMVEIe+pR/X+O6LEH4Em0QZ/mC+gNaLUJQUlCT
         yzdTPTIViOg9G8Ke3Okl6j8hYG/+Xpx9x82D40JndwDtdqbKf/jbwOshzgw/shJiRCf6
         mAoQ==
X-Gm-Message-State: AOJu0YxRNmH95YLNkfPevYw1L3YrOz3STDKPsDYYME6oocsQSoeRQFGg
	FswQ69kBmvie/SuSEsca0JjA/13kNH4hXGjVBu6OQckkmlJEGbIMVsVfby9n/JgUqRsstPxHS15
	Sa0xZ
X-Gm-Gg: ASbGncuTa5aku6yaD+u9ZSZ2ThTBdv69trMPo9CFqDSY5G5EPTHwX1c3cPqTobsixZ2
	7jznksZ7/dvM9RKg1xJgPgbkt+83SLFsc7Hvo52pdnzxGweQj5pSbFyIvZw5usXHOTYMgeK3Uc9
	07QAUfVlMmeGEHSaJk+p+oeIYw39hisZlxxfeAZdHy9BUEhAIf8+9jPIIMtcORFlqV5AAjFcNk0
	gCfBolYSp5Mbs/F23OL5nUpXl12bx+ZBGoviIZobGDCXOWL0KLpS23azGdj72E0knOW2crmXCff
	j39WMLgT81Zf3Y6OU+yEJSOC7QzZn/uYMQhDOw62owaOxPAAMSsOYguOmsbZ3TkxGZcB2XGtgWJ
	Quv6lUbsBWNMuEb2UyIfdUQid6BLUfkITYHv4bXOisYXUIZ2Z7C4Te2gzYngGBn/+szOheexcOI
	2qoPlYavB+P7h4
X-Google-Smtp-Source: AGHT+IGEbVOfoRG0NwUxUVx0a5u94ZVJ5b6JB4ndJ053yQljV9xOuZD9inglS4LiJinn4sWEM84qBw==
X-Received: by 2002:a17:906:6a1a:b0:b6d:55ee:506d with SMTP id a640c23a62f3a-b72656bf24bmr350804766b.65.1762354750093;
        Wed, 05 Nov 2025 06:59:10 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72676121b1sm207002366b.75.2025.11.05.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:59:09 -0800 (PST)
Date: Wed, 5 Nov 2025 17:59:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
Message-ID: <246ce503-015e-4c2a-b979-24086df2646c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/memory-tegra210-Support-interconnect-framework/20251028-015017
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251027-t210-actmon-p2-v6-1-1c4bd227d676%40gmail.com
patch subject: [PATCH v6] memory: tegra210: Support interconnect framework
config: arm-randconfig-r071-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030812.rbcbrDyU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511030812.rbcbrDyU-lkp@intel.com/

New smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1984 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1985 tegra210_emc_opp_table_init() warn: missing error code 'err'

Old smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1989 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1997 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1984 drivers/memory/tegra/tegra210-emc-core.c

7b344327c279ff Aaron Kling 2025-10-27  1958  static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
7b344327c279ff Aaron Kling 2025-10-27  1959  {
7b344327c279ff Aaron Kling 2025-10-27  1960  	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
7b344327c279ff Aaron Kling 2025-10-27  1961  	struct dev_pm_opp *opp;
7b344327c279ff Aaron Kling 2025-10-27  1962  	unsigned long rate;
7b344327c279ff Aaron Kling 2025-10-27  1963  	int opp_token, err, max_opps, i;
7b344327c279ff Aaron Kling 2025-10-27  1964  
7b344327c279ff Aaron Kling 2025-10-27  1965  	err = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
7b344327c279ff Aaron Kling 2025-10-27  1966  	if (err < 0)
7b344327c279ff Aaron Kling 2025-10-27  1967  		return dev_err_probe(emc->dev, err, "failed to set OPP supported HW\n");
7b344327c279ff Aaron Kling 2025-10-27  1968  
7b344327c279ff Aaron Kling 2025-10-27  1969  	opp_token = err;
7b344327c279ff Aaron Kling 2025-10-27  1970  
7b344327c279ff Aaron Kling 2025-10-27  1971  	err = dev_pm_opp_of_add_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1972  	if (err) {
7b344327c279ff Aaron Kling 2025-10-27  1973  		if (err == -ENODEV)
7b344327c279ff Aaron Kling 2025-10-27  1974  			dev_err_probe(emc->dev, err,
7b344327c279ff Aaron Kling 2025-10-27  1975  				      "OPP table not found, please update your device tree\n");
7b344327c279ff Aaron Kling 2025-10-27  1976  		else
7b344327c279ff Aaron Kling 2025-10-27  1977  			dev_err_probe(emc->dev, err, "failed to add OPP table\n");
7b344327c279ff Aaron Kling 2025-10-27  1978  
7b344327c279ff Aaron Kling 2025-10-27  1979  		goto put_hw_table;
7b344327c279ff Aaron Kling 2025-10-27  1980  	}
7b344327c279ff Aaron Kling 2025-10-27  1981  
7b344327c279ff Aaron Kling 2025-10-27  1982  	max_opps = dev_pm_opp_get_opp_count(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1983  	if (max_opps <= 0) {
7b344327c279ff Aaron Kling 2025-10-27 @1984  		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");

If max_opps being zero is an error then we need to set the error
then we need to set the error code.  If it's not an error, then
we shouldn't print an error code.

7b344327c279ff Aaron Kling 2025-10-27 @1985  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1986  	}
7b344327c279ff Aaron Kling 2025-10-27  1987  
7b344327c279ff Aaron Kling 2025-10-27  1988  	if (emc->num_timings != max_opps) {
7b344327c279ff Aaron Kling 2025-10-27  1989  		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
7b344327c279ff Aaron Kling 2025-10-27  1990  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1991  	}
7b344327c279ff Aaron Kling 2025-10-27  1992  
7b344327c279ff Aaron Kling 2025-10-27  1993  	for (i = 0; i < emc->num_timings; i++) {
7b344327c279ff Aaron Kling 2025-10-27  1994  		rate = emc->timings[i].rate * 1000;
7b344327c279ff Aaron Kling 2025-10-27  1995  		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
7b344327c279ff Aaron Kling 2025-10-27  1996  		if (IS_ERR(opp)) {
7b344327c279ff Aaron Kling 2025-10-27  1997  			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
7b344327c279ff Aaron Kling 2025-10-27  1998  			goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1999  		}
7b344327c279ff Aaron Kling 2025-10-27  2000  
7b344327c279ff Aaron Kling 2025-10-27  2001  		dev_pm_opp_put(opp);
7b344327c279ff Aaron Kling 2025-10-27  2002  	}
7b344327c279ff Aaron Kling 2025-10-27  2003  
7b344327c279ff Aaron Kling 2025-10-27  2004  	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
7b344327c279ff Aaron Kling 2025-10-27  2005  		      hw_version, clk_get_rate(emc->clk) / 1000000);
7b344327c279ff Aaron Kling 2025-10-27  2006  
7b344327c279ff Aaron Kling 2025-10-27  2007  	return 0;
7b344327c279ff Aaron Kling 2025-10-27  2008  
7b344327c279ff Aaron Kling 2025-10-27  2009  remove_table:
7b344327c279ff Aaron Kling 2025-10-27  2010  	dev_pm_opp_of_remove_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  2011  put_hw_table:
7b344327c279ff Aaron Kling 2025-10-27  2012  	dev_pm_opp_put_supported_hw(opp_token);
7b344327c279ff Aaron Kling 2025-10-27  2013  
7b344327c279ff Aaron Kling 2025-10-27  2014  	return err;
7b344327c279ff Aaron Kling 2025-10-27  2015  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

