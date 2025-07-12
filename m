Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84F22173A
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752326747; cv=none; b=fjTx8WKuAXqQKXWNzO9s2Wugzzs9zzTR/o9ZIULY5Uvvp6x6qTfgnW5IM/CUsECBRKlVXnWv8qk87w4FVn3cB819jwktOvVOLyy07AL/Nw18Husa5zUCumql2IRNsywFTdZJ5EdyesyTZggyoOE6T9mZIVb0a6zAGrA+iafA/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752326747; c=relaxed/simple;
	bh=VB4EShqgdZr1f1NcpbebuIawkyqP5UDcK2g+G44R9oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ba0z1qUVbi8GzlIqT5ff36e17Jl94k2a98/zeMHSN3Uj+ECtLH5sgFeDTXhQQuyaY1NV9S02ityWnw+/4ahAWM3W9J+GNvQHKBUl7bCvpS8zjAQFJKcaCpcA0fmcK7rOrZ83b5S0tO8CPswri+6HZE1ZyYj8jt3Vjx/hH5w70/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYLkUure; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYLkUure"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752326745; x=1783862745;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VB4EShqgdZr1f1NcpbebuIawkyqP5UDcK2g+G44R9oQ=;
  b=aYLkUurebuZBGjn07JGZVj20Yg/5avbu0xKNQi0ky6o7d6s6ZvB8AxGZ
   y5+Eail9d9GBy8AIWH+IyXDZAwY9qMXOfy4MxwmksNeqaCvfkFjyZiZbl
   /eCGCq3rVkne1PBosoGBIYb3CnBb/aoRAq9rBtyfe9IH2dD27tdG2xTq/
   q3baF3HOTCfg1+JMb64m6V7capFX3urgwf4Rrz7BGQb16/GASbFcWDg0R
   9mjdUiMujn2vmmJruPGZXPMDptrijDBnoADUm67FJyOHZ3S8pmBha3A+2
   v/4nqxDv5gJM4eCs2qdaVkBjLu9X7CTXdvHYTQ4wugUBCvClNgCVva8MH
   Q==;
X-CSE-ConnectionGUID: O009YpEGTi+heQlv73CYyg==
X-CSE-MsgGUID: rUmj+YxiRi+zEZgGvJD5Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65661104"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65661104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 06:25:44 -0700
X-CSE-ConnectionGUID: FphkgwgCRnS0o472Y+KrsA==
X-CSE-MsgGUID: RFztYJQyTIG7++pXzm6VWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156667554"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jul 2025 06:25:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaaEW-0007MF-1B;
	Sat, 12 Jul 2025 13:25:40 +0000
Date: Sat, 12 Jul 2025 21:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
Message-ID: <202507122125.eve8lg60-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>
TO: "Clément Le Goffic" <clement.legoffic@foss.st.com>
TO: Will Deacon <will@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Gatien Chevallier <gatien.chevallier@foss.st.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
TO: Le Goffic <legoffic.clement@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-perf-users@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: "Clément Le Goffic" <clement.legoffic@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-9-cdece720348f%40foss.st.com
patch subject: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sh-randconfig-r071-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122125.eve8lg60-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507122125.eve8lg60-lkp@intel.com/

smatch warnings:
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'pmu' (see line 376)
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'event' (see line 377)

vim +/pmu +380 drivers/perf/stm32_ddr_pmu.c

73af3c4ba702d7 Clément Le Goffic 2025-07-11  373  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  374  static int stm32_ddr_pmu_get_counter(struct stm32_ddr_pmu *pmu, struct perf_event *event)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  375  {
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @376  	u32 time_cnt_idx = pmu->cfg->time_cnt_idx;
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @377  	u32 config = event->attr.config;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  378  	struct stm32_ddr_cnt *cnt;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  379  
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @380  	if (!pmu || !event)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  381  		return -EINVAL;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  382  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  383  	pmu->selected_set = GROUP_VALUE(config);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  384  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  385  	if (config == TIME_CNT) {
73af3c4ba702d7 Clément Le Goffic 2025-07-11  386  		cnt = kzalloc(sizeof(*cnt), GFP_KERNEL);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  387  		if (!cnt)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  388  			return -ENOMEM;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  389  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  390  		cnt->evt = event;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  391  		cnt->idx = time_cnt_idx;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  392  		event->pmu_private = cnt;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  393  		list_add(&cnt->cnt_list, &pmu->counters[time_cnt_idx]);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  394  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  395  		return 0;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  396  	}
73af3c4ba702d7 Clément Le Goffic 2025-07-11  397  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  398  	cnt = stm32_get_event_counter(pmu, event);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  399  	if (IS_ERR(cnt))
73af3c4ba702d7 Clément Le Goffic 2025-07-11  400  		return PTR_ERR(cnt);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  401  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  402  	if (list_count_nodes(&cnt->cnt_list) == 1) {
73af3c4ba702d7 Clément Le Goffic 2025-07-11  403  		stm32_ddr_stop_counters(pmu);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  404  		stm32_ddr_sel_evnt(pmu, cnt);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  405  		stm32_ddr_counter_enable(pmu, cnt);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  406  		stm32_ddr_start_counters(pmu);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  407  	}
73af3c4ba702d7 Clément Le Goffic 2025-07-11  408  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  409  	return 0;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  410  }
73af3c4ba702d7 Clément Le Goffic 2025-07-11  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
