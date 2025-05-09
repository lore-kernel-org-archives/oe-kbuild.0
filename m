Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13FE221DA8
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756676; cv=none; b=AmgaMcWF4LvECjRcdYN4xJTwUj6+N1LLuK6uvYEtQneKEnBPW7tZydLj/k3ZA+IodSvxfB6ZSdGvNSozc12Ii8X8i2rY+MF3ayGyHF/wjyum3MpLKnWMp9wGTS26OY4YMMbXGmheqeigKBrsYqXfV9DNz879fZQMX/Fy2MiFvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756676; c=relaxed/simple;
	bh=55TJKrrNijw99hdou4wZW48jgk2bo4gNSmpXBNy4V4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8mDm5x26oxH/K/XgLqqNee5ErV3KSzWMsvBGeSth6GV0xNrBVivKdgpMMMcpIB48/7cYTisYBFgQPXgWKJtMAntpYJOZEVgh+DNCQkL4iWXfS01RpjNsFRfC+lXVfOSSiY2CEk81cu7JNs7ZHMtRlOd0jvF94yze+bmtnBJY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFxS5wct; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFxS5wct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746756674; x=1778292674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55TJKrrNijw99hdou4wZW48jgk2bo4gNSmpXBNy4V4g=;
  b=hFxS5wctI4QhpQmqL+mgerrAe3s2z2ATDWACI7PIhrBUUyQ6YPJ5CNkD
   PSuXmETyyG3PKnfYkIIDcq8NULSoBZMFIO0bucdfqwTLsFKv1c45SqP4Y
   n8uMwytc9j3pUZh2h9JDVfUS7CTzDZD5KYz5QgqKQfue9+5ke8UEuvBLD
   pXSuUa8EN9L983pOnw7nX23hqUidHpYT5MZfNIsxozpp4UbGW6zwj4eG3
   82EjKMI98MQsFhBx6k0mJUVw5Vkh/cJRHjy+7GQzlhy1bcXfIk8TK1eeG
   EqWkdC4f3qXVrIHG8vFuoNw8esVDFNQOE+M5AODhk6fddwVEk9mbwJ6Zw
   w==;
X-CSE-ConnectionGUID: m4glqUrRRfadrb45NP18MQ==
X-CSE-MsgGUID: LLyERGyxS6G/TyAAEJKVpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48478483"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48478483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:11:13 -0700
X-CSE-ConnectionGUID: unuspF5DTfGIuJkvx4BmRg==
X-CSE-MsgGUID: 6bwkUsqRTuyXe+AyVOb9WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136179899"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 19:11:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDDCf-000Ba7-1q;
	Fri, 09 May 2025 02:11:09 +0000
Date: Fri, 9 May 2025 10:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] memory: tegra210-emc: Support Device Tree EMC Tables
Message-ID: <202505090927.326G2S8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com>
References: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com>
TO: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8bac8898fe398ffa3e09075ecea2be511725fb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/memory-tegra210-emc-Support-Device-Tree-EMC-Tables/20250501-020252
base:   8bac8898fe398ffa3e09075ecea2be511725fb0b
patch link:    https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-99896fa69341%40gmail.com
patch subject: [PATCH] memory: tegra210-emc: Support Device Tree EMC Tables
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250509/202505090927.326G2S8V-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505090927.326G2S8V-lkp@intel.com/

smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:2081 tegra210_emc_probe() warn: missing unwind goto?

vim +2081 drivers/memory/tegra/tegra210-emc-core.c

10de21148f7d28 Joseph Lo       2019-05-29  2029  
10de21148f7d28 Joseph Lo       2019-05-29  2030  static int tegra210_emc_probe(struct platform_device *pdev)
10de21148f7d28 Joseph Lo       2019-05-29  2031  {
0553d7b204ef48 Thierry Reding  2020-04-03  2032  	struct thermal_cooling_device *cd;
10de21148f7d28 Joseph Lo       2019-05-29  2033  	unsigned long current_rate;
10de21148f7d28 Joseph Lo       2019-05-29  2034  	struct tegra210_emc *emc;
10de21148f7d28 Joseph Lo       2019-05-29  2035  	struct device_node *np;
10de21148f7d28 Joseph Lo       2019-05-29  2036  	unsigned int i;
10de21148f7d28 Joseph Lo       2019-05-29  2037  	int err;
48e6cf9a684da2 Aaron Kling     2025-04-30  2038  	bool have_dt_tables = false;
10de21148f7d28 Joseph Lo       2019-05-29  2039  
10de21148f7d28 Joseph Lo       2019-05-29  2040  	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
10de21148f7d28 Joseph Lo       2019-05-29  2041  	if (!emc)
10de21148f7d28 Joseph Lo       2019-05-29  2042  		return -ENOMEM;
10de21148f7d28 Joseph Lo       2019-05-29  2043  
10de21148f7d28 Joseph Lo       2019-05-29  2044  	emc->clk = devm_clk_get(&pdev->dev, "emc");
10de21148f7d28 Joseph Lo       2019-05-29  2045  	if (IS_ERR(emc->clk))
10de21148f7d28 Joseph Lo       2019-05-29  2046  		return PTR_ERR(emc->clk);
10de21148f7d28 Joseph Lo       2019-05-29  2047  
10de21148f7d28 Joseph Lo       2019-05-29  2048  	platform_set_drvdata(pdev, emc);
10de21148f7d28 Joseph Lo       2019-05-29  2049  	spin_lock_init(&emc->lock);
10de21148f7d28 Joseph Lo       2019-05-29  2050  	emc->dev = &pdev->dev;
10de21148f7d28 Joseph Lo       2019-05-29  2051  
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2052  	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2053  	if (IS_ERR(emc->mc))
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2054  		return PTR_ERR(emc->mc);
10de21148f7d28 Joseph Lo       2019-05-29  2055  
10de21148f7d28 Joseph Lo       2019-05-29  2056  	emc->regs = devm_platform_ioremap_resource(pdev, 0);
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2057  	if (IS_ERR(emc->regs))
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2058  		return PTR_ERR(emc->regs);
10de21148f7d28 Joseph Lo       2019-05-29  2059  
10de21148f7d28 Joseph Lo       2019-05-29  2060  	for (i = 0; i < 2; i++) {
10de21148f7d28 Joseph Lo       2019-05-29  2061  		emc->channel[i] = devm_platform_ioremap_resource(pdev, 1 + i);
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2062  		if (IS_ERR(emc->channel[i]))
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2063  			return PTR_ERR(emc->channel[i]);
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2064  
10de21148f7d28 Joseph Lo       2019-05-29  2065  	}
10de21148f7d28 Joseph Lo       2019-05-29  2066  
10de21148f7d28 Joseph Lo       2019-05-29  2067  	tegra210_emc_detect(emc);
10de21148f7d28 Joseph Lo       2019-05-29  2068  	np = pdev->dev.of_node;
10de21148f7d28 Joseph Lo       2019-05-29  2069  
0553d7b204ef48 Thierry Reding  2020-04-03  2070  	/* attach to the nominal and (optional) derated tables */
48e6cf9a684da2 Aaron Kling     2025-04-30  2071  	if (of_reserved_mem_device_init_by_name(emc->dev, np, "nominal") >= 0) {
0553d7b204ef48 Thierry Reding  2020-04-03  2072  		err = of_reserved_mem_device_init_by_name(emc->dev, np, "derated");
0553d7b204ef48 Thierry Reding  2020-04-03  2073  		if (err < 0 && err != -ENODEV) {
0553d7b204ef48 Thierry Reding  2020-04-03  2074  			dev_err(emc->dev, "failed to get derated EMC table: %d\n", err);
0553d7b204ef48 Thierry Reding  2020-04-03  2075  			goto release;
0553d7b204ef48 Thierry Reding  2020-04-03  2076  		}
48e6cf9a684da2 Aaron Kling     2025-04-30  2077  	} else {
48e6cf9a684da2 Aaron Kling     2025-04-30  2078  		err = tegra210_emc_parse_dt(emc);
48e6cf9a684da2 Aaron Kling     2025-04-30  2079  		if (err < 0) {
48e6cf9a684da2 Aaron Kling     2025-04-30  2080  			dev_err(emc->dev, "failed to get EMC tables: %d\n", err);
48e6cf9a684da2 Aaron Kling     2025-04-30 @2081  			return err;
48e6cf9a684da2 Aaron Kling     2025-04-30  2082  		}
48e6cf9a684da2 Aaron Kling     2025-04-30  2083  
48e6cf9a684da2 Aaron Kling     2025-04-30  2084  		have_dt_tables = true;
48e6cf9a684da2 Aaron Kling     2025-04-30  2085  	}
0553d7b204ef48 Thierry Reding  2020-04-03  2086  
10de21148f7d28 Joseph Lo       2019-05-29  2087  	/* validate the tables */
0553d7b204ef48 Thierry Reding  2020-04-03  2088  	if (emc->nominal) {
0553d7b204ef48 Thierry Reding  2020-04-03  2089  		err = tegra210_emc_validate_timings(emc, emc->nominal,
10de21148f7d28 Joseph Lo       2019-05-29  2090  						    emc->num_timings);
10de21148f7d28 Joseph Lo       2019-05-29  2091  		if (err < 0)
10de21148f7d28 Joseph Lo       2019-05-29  2092  			goto release;
0553d7b204ef48 Thierry Reding  2020-04-03  2093  	}
0553d7b204ef48 Thierry Reding  2020-04-03  2094  
0553d7b204ef48 Thierry Reding  2020-04-03  2095  	if (emc->derated) {
0553d7b204ef48 Thierry Reding  2020-04-03  2096  		err = tegra210_emc_validate_timings(emc, emc->derated,
0553d7b204ef48 Thierry Reding  2020-04-03  2097  						    emc->num_timings);
0553d7b204ef48 Thierry Reding  2020-04-03  2098  		if (err < 0)
0553d7b204ef48 Thierry Reding  2020-04-03  2099  			goto release;
0553d7b204ef48 Thierry Reding  2020-04-03  2100  	}
0553d7b204ef48 Thierry Reding  2020-04-03  2101  
0553d7b204ef48 Thierry Reding  2020-04-03  2102  	/* default to the nominal table */
0553d7b204ef48 Thierry Reding  2020-04-03  2103  	emc->timings = emc->nominal;
10de21148f7d28 Joseph Lo       2019-05-29  2104  
10de21148f7d28 Joseph Lo       2019-05-29  2105  	/* pick the current timing based on the current EMC clock rate */
10de21148f7d28 Joseph Lo       2019-05-29  2106  	current_rate = clk_get_rate(emc->clk) / 1000;
10de21148f7d28 Joseph Lo       2019-05-29  2107  
10de21148f7d28 Joseph Lo       2019-05-29  2108  	for (i = 0; i < emc->num_timings; i++) {
10de21148f7d28 Joseph Lo       2019-05-29  2109  		if (emc->timings[i].rate == current_rate) {
10de21148f7d28 Joseph Lo       2019-05-29  2110  			emc->last = &emc->timings[i];
10de21148f7d28 Joseph Lo       2019-05-29  2111  			break;
10de21148f7d28 Joseph Lo       2019-05-29  2112  		}
10de21148f7d28 Joseph Lo       2019-05-29  2113  	}
10de21148f7d28 Joseph Lo       2019-05-29  2114  
10de21148f7d28 Joseph Lo       2019-05-29  2115  	if (i == emc->num_timings) {
10de21148f7d28 Joseph Lo       2019-05-29  2116  		dev_err(emc->dev, "no EMC table entry found for %lu kHz\n",
10de21148f7d28 Joseph Lo       2019-05-29  2117  			current_rate);
10de21148f7d28 Joseph Lo       2019-05-29  2118  		err = -ENOENT;
10de21148f7d28 Joseph Lo       2019-05-29  2119  		goto release;
10de21148f7d28 Joseph Lo       2019-05-29  2120  	}
10de21148f7d28 Joseph Lo       2019-05-29  2121  
10de21148f7d28 Joseph Lo       2019-05-29  2122  	/* pick a compatible clock change sequence for the EMC table */
10de21148f7d28 Joseph Lo       2019-05-29  2123  	for (i = 0; i < ARRAY_SIZE(tegra210_emc_sequences); i++) {
10de21148f7d28 Joseph Lo       2019-05-29  2124  		const struct tegra210_emc_sequence *sequence =
10de21148f7d28 Joseph Lo       2019-05-29  2125  				tegra210_emc_sequences[i];
10de21148f7d28 Joseph Lo       2019-05-29  2126  
10de21148f7d28 Joseph Lo       2019-05-29  2127  		if (emc->timings[0].revision == sequence->revision) {
10de21148f7d28 Joseph Lo       2019-05-29  2128  			emc->sequence = sequence;
10de21148f7d28 Joseph Lo       2019-05-29  2129  			break;
10de21148f7d28 Joseph Lo       2019-05-29  2130  		}
10de21148f7d28 Joseph Lo       2019-05-29  2131  	}
10de21148f7d28 Joseph Lo       2019-05-29  2132  
10de21148f7d28 Joseph Lo       2019-05-29  2133  	if (!emc->sequence) {
10de21148f7d28 Joseph Lo       2019-05-29  2134  		dev_err(&pdev->dev, "sequence %u not supported\n",
10de21148f7d28 Joseph Lo       2019-05-29  2135  			emc->timings[0].revision);
10de21148f7d28 Joseph Lo       2019-05-29  2136  		err = -ENOTSUPP;
10de21148f7d28 Joseph Lo       2019-05-29  2137  		goto release;
10de21148f7d28 Joseph Lo       2019-05-29  2138  	}
10de21148f7d28 Joseph Lo       2019-05-29  2139  
10de21148f7d28 Joseph Lo       2019-05-29  2140  	emc->offsets = &tegra210_emc_table_register_offsets;
0553d7b204ef48 Thierry Reding  2020-04-03  2141  	emc->refresh = TEGRA210_EMC_REFRESH_NOMINAL;
10de21148f7d28 Joseph Lo       2019-05-29  2142  
10de21148f7d28 Joseph Lo       2019-05-29  2143  	emc->provider.owner = THIS_MODULE;
10de21148f7d28 Joseph Lo       2019-05-29  2144  	emc->provider.dev = &pdev->dev;
10de21148f7d28 Joseph Lo       2019-05-29  2145  	emc->provider.set_rate = tegra210_emc_set_rate;
10de21148f7d28 Joseph Lo       2019-05-29  2146  
10de21148f7d28 Joseph Lo       2019-05-29  2147  	emc->provider.configs = devm_kcalloc(&pdev->dev, emc->num_timings,
10de21148f7d28 Joseph Lo       2019-05-29  2148  					     sizeof(*emc->provider.configs),
10de21148f7d28 Joseph Lo       2019-05-29  2149  					     GFP_KERNEL);
10de21148f7d28 Joseph Lo       2019-05-29  2150  	if (!emc->provider.configs) {
10de21148f7d28 Joseph Lo       2019-05-29  2151  		err = -ENOMEM;
10de21148f7d28 Joseph Lo       2019-05-29  2152  		goto release;
10de21148f7d28 Joseph Lo       2019-05-29  2153  	}
10de21148f7d28 Joseph Lo       2019-05-29  2154  
10de21148f7d28 Joseph Lo       2019-05-29  2155  	emc->provider.num_configs = emc->num_timings;
10de21148f7d28 Joseph Lo       2019-05-29  2156  
10de21148f7d28 Joseph Lo       2019-05-29  2157  	for (i = 0; i < emc->provider.num_configs; i++) {
10de21148f7d28 Joseph Lo       2019-05-29  2158  		struct tegra210_emc_timing *timing = &emc->timings[i];
10de21148f7d28 Joseph Lo       2019-05-29  2159  		struct tegra210_clk_emc_config *config =
10de21148f7d28 Joseph Lo       2019-05-29  2160  				&emc->provider.configs[i];
10de21148f7d28 Joseph Lo       2019-05-29  2161  		u32 value;
10de21148f7d28 Joseph Lo       2019-05-29  2162  
10de21148f7d28 Joseph Lo       2019-05-29  2163  		config->rate = timing->rate * 1000UL;
10de21148f7d28 Joseph Lo       2019-05-29  2164  		config->value = timing->clk_src_emc;
10de21148f7d28 Joseph Lo       2019-05-29  2165  
10de21148f7d28 Joseph Lo       2019-05-29  2166  		value = timing->burst_mc_regs[MC_EMEM_ARB_MISC0_INDEX];
10de21148f7d28 Joseph Lo       2019-05-29  2167  
10de21148f7d28 Joseph Lo       2019-05-29  2168  		if ((value & MC_EMEM_ARB_MISC0_EMC_SAME_FREQ) == 0)
10de21148f7d28 Joseph Lo       2019-05-29  2169  			config->same_freq = false;
10de21148f7d28 Joseph Lo       2019-05-29  2170  		else
10de21148f7d28 Joseph Lo       2019-05-29  2171  			config->same_freq = true;
10de21148f7d28 Joseph Lo       2019-05-29  2172  	}
10de21148f7d28 Joseph Lo       2019-05-29  2173  
10de21148f7d28 Joseph Lo       2019-05-29  2174  	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
10de21148f7d28 Joseph Lo       2019-05-29  2175  	if (err < 0) {
10de21148f7d28 Joseph Lo       2019-05-29  2176  		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
10de21148f7d28 Joseph Lo       2019-05-29  2177  		goto release;
10de21148f7d28 Joseph Lo       2019-05-29  2178  	}
10de21148f7d28 Joseph Lo       2019-05-29  2179  
10de21148f7d28 Joseph Lo       2019-05-29  2180  	emc->clkchange_delay = 100;
10de21148f7d28 Joseph Lo       2019-05-29  2181  	emc->training_interval = 100;
10de21148f7d28 Joseph Lo       2019-05-29  2182  	dev_set_drvdata(emc->dev, emc);
10de21148f7d28 Joseph Lo       2019-05-29  2183  
0553d7b204ef48 Thierry Reding  2020-04-03  2184  	timer_setup(&emc->refresh_timer, tegra210_emc_poll_refresh,
0553d7b204ef48 Thierry Reding  2020-04-03  2185  		    TIMER_DEFERRABLE);
0553d7b204ef48 Thierry Reding  2020-04-03  2186  	atomic_set(&emc->refresh_poll, 0);
0553d7b204ef48 Thierry Reding  2020-04-03  2187  	emc->refresh_poll_interval = 1000;
0553d7b204ef48 Thierry Reding  2020-04-03  2188  
10de21148f7d28 Joseph Lo       2019-05-29  2189  	timer_setup(&emc->training, tegra210_emc_train, 0);
10de21148f7d28 Joseph Lo       2019-05-29  2190  
10de21148f7d28 Joseph Lo       2019-05-29  2191  	tegra210_emc_debugfs_init(emc);
10de21148f7d28 Joseph Lo       2019-05-29  2192  
0553d7b204ef48 Thierry Reding  2020-04-03  2193  	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
0553d7b204ef48 Thierry Reding  2020-04-03  2194  						     &tegra210_emc_cd_ops);
0553d7b204ef48 Thierry Reding  2020-04-03  2195  	if (IS_ERR(cd)) {
0553d7b204ef48 Thierry Reding  2020-04-03  2196  		err = PTR_ERR(cd);
0553d7b204ef48 Thierry Reding  2020-04-03  2197  		dev_err(emc->dev, "failed to register cooling device: %d\n",
0553d7b204ef48 Thierry Reding  2020-04-03  2198  			err);
0553d7b204ef48 Thierry Reding  2020-04-03  2199  		goto detach;
0553d7b204ef48 Thierry Reding  2020-04-03  2200  	}
0553d7b204ef48 Thierry Reding  2020-04-03  2201  
10de21148f7d28 Joseph Lo       2019-05-29  2202  	return 0;
10de21148f7d28 Joseph Lo       2019-05-29  2203  
0553d7b204ef48 Thierry Reding  2020-04-03  2204  detach:
0553d7b204ef48 Thierry Reding  2020-04-03  2205  	debugfs_remove_recursive(emc->debugfs.root);
0553d7b204ef48 Thierry Reding  2020-04-03  2206  	tegra210_clk_emc_detach(emc->clk);
10de21148f7d28 Joseph Lo       2019-05-29  2207  release:
48e6cf9a684da2 Aaron Kling     2025-04-30  2208  	if (!have_dt_tables)
10de21148f7d28 Joseph Lo       2019-05-29  2209  		of_reserved_mem_device_release(emc->dev);
6c6bd2075f01f8 Dmitry Osipenko 2020-11-04  2210  
10de21148f7d28 Joseph Lo       2019-05-29  2211  	return err;
10de21148f7d28 Joseph Lo       2019-05-29  2212  }
10de21148f7d28 Joseph Lo       2019-05-29  2213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
