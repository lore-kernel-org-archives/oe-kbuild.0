Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83B442C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Jun 2025 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973933; cv=none; b=O7+BLs+g+Bxn+Yaf19hXwEh8LN45OPcOaIKGo0wRCY2l9IDXwv69XitcRVbiXbeMpLhS+k8DIJ4x5psaM56EyGU7PKqiV7hQVVf++JuIlZbCgJVgfdxB8jO3B/CNIiQ9e54o6XHobgbyN2fQvc7ZQR9hV/ow1yX82WW9heCsYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973933; c=relaxed/simple;
	bh=WM3pUFuVNABArtPJTwIwUGggaJDo1B/2pn467lh4E20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcT/SI4H4H7rThwu02xmQJKS68tuJvWYe6HZg1iElOl2bIZTChiD5GQxsFaUBXLxqugOgC61zTUKLs6Z+mBn3lRnlJ8QHUKM99+pV9t0fm7xRKRmH6KUwMjqDcc9JpT+ug8Fn2ihqpLEoQJt1i2H18GxdspTt3TYDK9teagr7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC5pEUU5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC5pEUU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750973931; x=1782509931;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WM3pUFuVNABArtPJTwIwUGggaJDo1B/2pn467lh4E20=;
  b=XC5pEUU5LzT82mZqSMqJFqW11k5yB0oiT+IqVgFEv1PVaJKBB03XxWPY
   nu/KP0R8NLPjPlsKCmSlGok5p2VXgI6F6np4aXOg0oDEG5znlmt3P/jm0
   81j93+U6/GJmC/A1Mo7x0sPVPR8KJDBHvQas7EeCIVPtxP5IGCG/Dte/a
   QI4FbavFENcFkUwf3PIuNwUXTEYx0LVLwy4rjVHJD5WfWxGSrprabOyQz
   G2hrvufR4g/NBtDnxBXrP1Y7mf9WH/tnir1CePZk0DR+jAQKkC63KUxjI
   dAvb0N43+vzycS0PT8/cFxXh5ZDT9TaE2aYxF1NJM22dt1qH1FuRRAr6E
   w==;
X-CSE-ConnectionGUID: 0dcwZUxXTQ+6vqZoNBsPYA==
X-CSE-MsgGUID: yLkI7XWRQKWPyixxbq1rAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64720844"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64720844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 14:38:50 -0700
X-CSE-ConnectionGUID: uqsRyrKAQKKziNsL7YfvWw==
X-CSE-MsgGUID: p5OqJbzrQbC61+5OVA+q2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="176309930"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2025 14:38:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUuIw-000VYU-2w;
	Thu, 26 Jun 2025 21:38:46 +0000
Date: Fri, 27 Jun 2025 05:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/4] clk: add TI CDCE6214 clock driver
Message-ID: <202506270548.hderXu3u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250618-clk-cdce6214-v5-2-9938b8ed0b94@pengutronix.de>
References: <20250618-clk-cdce6214-v5-2-9938b8ed0b94@pengutronix.de>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: kernel@pengutronix.de
CC: "Alvin Šipraga" <alsi@bang-olufsen.dk>
CC: Sascha Hauer <s.hauer@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e04c78d86a9699d136910cfc0bdcf01087e3267e]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/dt-bindings-clock-add-TI-CDCE6214-binding/20250618-172505
base:   e04c78d86a9699d136910cfc0bdcf01087e3267e
patch link:    https://lore.kernel.org/r/20250618-clk-cdce6214-v5-2-9938b8ed0b94%40pengutronix.de
patch subject: [PATCH v5 2/4] clk: add TI CDCE6214 clock driver
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: parisc-randconfig-r073-20250619 (https://download.01.org/0day-ci/archive/20250627/202506270548.hderXu3u-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506270548.hderXu3u-lkp@intel.com/

smatch warnings:
drivers/clk/clk-cdce6214.c:549 cdce6214_clk_out_recalc_rate() error: uninitialized symbol 'div'.
drivers/clk/clk-cdce6214.c:633 cdce6214_clk_out_get_parent() error: uninitialized symbol 'idx'.
drivers/clk/clk-cdce6214.c:910 cdce6214_clk_psx_recalc_rate() error: uninitialized symbol 'div'.

vim +/div +549 drivers/clk/clk-cdce6214.c

5c09be6e85aa86 Sascha Hauer 2025-06-18  521  
5c09be6e85aa86 Sascha Hauer 2025-06-18  522  static unsigned long cdce6214_clk_out_recalc_rate(struct clk_hw *hw,
5c09be6e85aa86 Sascha Hauer 2025-06-18  523  						  unsigned long parent_rate)
5c09be6e85aa86 Sascha Hauer 2025-06-18  524  {
5c09be6e85aa86 Sascha Hauer 2025-06-18  525  	struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
5c09be6e85aa86 Sascha Hauer 2025-06-18  526  	struct cdce6214 *priv = clock->priv;
5c09be6e85aa86 Sascha Hauer 2025-06-18  527  	unsigned int val, div;
5c09be6e85aa86 Sascha Hauer 2025-06-18  528  	unsigned long r;
5c09be6e85aa86 Sascha Hauer 2025-06-18  529  
5c09be6e85aa86 Sascha Hauer 2025-06-18  530  	switch (clock->index) {
5c09be6e85aa86 Sascha Hauer 2025-06-18  531  	case CDCE6214_CLK_OUT1:
5c09be6e85aa86 Sascha Hauer 2025-06-18  532  		regmap_read(priv->regmap, R56, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  533  		div = FIELD_GET(R56_CH1_DIV, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  534  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  535  	case CDCE6214_CLK_OUT2:
5c09be6e85aa86 Sascha Hauer 2025-06-18  536  		regmap_read(priv->regmap, R62, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  537  		div = FIELD_GET(R62_CH2_DIV, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  538  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  539  	case CDCE6214_CLK_OUT3:
5c09be6e85aa86 Sascha Hauer 2025-06-18  540  		regmap_read(priv->regmap, R67, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  541  		div = FIELD_GET(R67_CH3_DIV, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  542  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  543  	case CDCE6214_CLK_OUT4:
5c09be6e85aa86 Sascha Hauer 2025-06-18  544  		regmap_read(priv->regmap, R72, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  545  		div = FIELD_GET(R72_CH4_DIV, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  546  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  547  	};
5c09be6e85aa86 Sascha Hauer 2025-06-18  548  
5c09be6e85aa86 Sascha Hauer 2025-06-18 @549  	if (!div)
5c09be6e85aa86 Sascha Hauer 2025-06-18  550  		div = 1;
5c09be6e85aa86 Sascha Hauer 2025-06-18  551  
5c09be6e85aa86 Sascha Hauer 2025-06-18  552  	r = DIV_ROUND_UP_ULL((u64)parent_rate, div);
5c09be6e85aa86 Sascha Hauer 2025-06-18  553  
5c09be6e85aa86 Sascha Hauer 2025-06-18  554  	return r;
5c09be6e85aa86 Sascha Hauer 2025-06-18  555  }
5c09be6e85aa86 Sascha Hauer 2025-06-18  556  
5c09be6e85aa86 Sascha Hauer 2025-06-18  557  static unsigned int cdce6214_get_out_div(unsigned long rate, unsigned long parent_rate)
5c09be6e85aa86 Sascha Hauer 2025-06-18  558  {
5c09be6e85aa86 Sascha Hauer 2025-06-18  559  	unsigned int div;
5c09be6e85aa86 Sascha Hauer 2025-06-18  560  
5c09be6e85aa86 Sascha Hauer 2025-06-18  561  	div = divider_get_val(rate, parent_rate, NULL, 14, CLK_DIVIDER_ONE_BASED);
5c09be6e85aa86 Sascha Hauer 2025-06-18  562  
5c09be6e85aa86 Sascha Hauer 2025-06-18  563  	if (div < 1)
5c09be6e85aa86 Sascha Hauer 2025-06-18  564  		div = 1;
5c09be6e85aa86 Sascha Hauer 2025-06-18  565  
5c09be6e85aa86 Sascha Hauer 2025-06-18  566  	return div;
5c09be6e85aa86 Sascha Hauer 2025-06-18  567  }
5c09be6e85aa86 Sascha Hauer 2025-06-18  568  
5c09be6e85aa86 Sascha Hauer 2025-06-18  569  static int cdce6214_clk_out_determine_rate(struct clk_hw *hw,
5c09be6e85aa86 Sascha Hauer 2025-06-18  570  					   struct clk_rate_request *req)
5c09be6e85aa86 Sascha Hauer 2025-06-18  571  {
5c09be6e85aa86 Sascha Hauer 2025-06-18  572  	unsigned int div = cdce6214_get_out_div(req->rate, req->best_parent_rate);
5c09be6e85aa86 Sascha Hauer 2025-06-18  573  
5c09be6e85aa86 Sascha Hauer 2025-06-18  574  	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
5c09be6e85aa86 Sascha Hauer 2025-06-18  575  
5c09be6e85aa86 Sascha Hauer 2025-06-18  576  	return 0;
5c09be6e85aa86 Sascha Hauer 2025-06-18  577  }
5c09be6e85aa86 Sascha Hauer 2025-06-18  578  
5c09be6e85aa86 Sascha Hauer 2025-06-18  579  static int cdce6214_clk_out_set_rate(struct clk_hw *hw, unsigned long rate,
5c09be6e85aa86 Sascha Hauer 2025-06-18  580  				     unsigned long parent_rate)
5c09be6e85aa86 Sascha Hauer 2025-06-18  581  {
5c09be6e85aa86 Sascha Hauer 2025-06-18  582  	unsigned int div = cdce6214_get_out_div(rate, parent_rate);
5c09be6e85aa86 Sascha Hauer 2025-06-18  583  	struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
5c09be6e85aa86 Sascha Hauer 2025-06-18  584  	struct cdce6214 *priv = clock->priv;
5c09be6e85aa86 Sascha Hauer 2025-06-18  585  
5c09be6e85aa86 Sascha Hauer 2025-06-18  586  	switch (clock->index) {
5c09be6e85aa86 Sascha Hauer 2025-06-18  587  	case CDCE6214_CLK_OUT1:
5c09be6e85aa86 Sascha Hauer 2025-06-18  588  		regmap_update_bits(priv->regmap, R56, R56_CH1_DIV,
5c09be6e85aa86 Sascha Hauer 2025-06-18  589  				   FIELD_PREP(R56_CH1_DIV, div));
5c09be6e85aa86 Sascha Hauer 2025-06-18  590  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  591  	case CDCE6214_CLK_OUT2:
5c09be6e85aa86 Sascha Hauer 2025-06-18  592  		regmap_update_bits(priv->regmap, R62, R62_CH2_DIV,
5c09be6e85aa86 Sascha Hauer 2025-06-18  593  				   FIELD_PREP(R62_CH2_DIV, div));
5c09be6e85aa86 Sascha Hauer 2025-06-18  594  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  595  	case CDCE6214_CLK_OUT3:
5c09be6e85aa86 Sascha Hauer 2025-06-18  596  		regmap_update_bits(priv->regmap, R67, R67_CH3_DIV,
5c09be6e85aa86 Sascha Hauer 2025-06-18  597  				   FIELD_PREP(R67_CH3_DIV, div));
5c09be6e85aa86 Sascha Hauer 2025-06-18  598  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  599  	case CDCE6214_CLK_OUT4:
5c09be6e85aa86 Sascha Hauer 2025-06-18  600  		regmap_update_bits(priv->regmap, R72, R72_CH4_DIV,
5c09be6e85aa86 Sascha Hauer 2025-06-18  601  				   FIELD_PREP(R72_CH4_DIV, div));
5c09be6e85aa86 Sascha Hauer 2025-06-18  602  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  603  	};
5c09be6e85aa86 Sascha Hauer 2025-06-18  604  
5c09be6e85aa86 Sascha Hauer 2025-06-18  605  	return 0;
5c09be6e85aa86 Sascha Hauer 2025-06-18  606  }
5c09be6e85aa86 Sascha Hauer 2025-06-18  607  
5c09be6e85aa86 Sascha Hauer 2025-06-18  608  static u8 cdce6214_clk_out_get_parent(struct clk_hw *hw)
5c09be6e85aa86 Sascha Hauer 2025-06-18  609  {
5c09be6e85aa86 Sascha Hauer 2025-06-18  610  	struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
5c09be6e85aa86 Sascha Hauer 2025-06-18  611  	struct cdce6214 *priv = clock->priv;
5c09be6e85aa86 Sascha Hauer 2025-06-18  612  	unsigned int val, idx;
5c09be6e85aa86 Sascha Hauer 2025-06-18  613  
5c09be6e85aa86 Sascha Hauer 2025-06-18  614  	switch (clock->index) {
5c09be6e85aa86 Sascha Hauer 2025-06-18  615  	case CDCE6214_CLK_OUT1:
5c09be6e85aa86 Sascha Hauer 2025-06-18  616  		regmap_read(priv->regmap, R56, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  617  		idx = FIELD_GET(R56_CH1_MUX, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  618  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  619  	case CDCE6214_CLK_OUT2:
5c09be6e85aa86 Sascha Hauer 2025-06-18  620  		regmap_read(priv->regmap, R62, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  621  		idx = FIELD_GET(R62_CH2_MUX, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  622  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  623  	case CDCE6214_CLK_OUT3:
5c09be6e85aa86 Sascha Hauer 2025-06-18  624  		regmap_read(priv->regmap, R67, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  625  		idx = FIELD_GET(R67_CH3_MUX, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  626  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  627  	case CDCE6214_CLK_OUT4:
5c09be6e85aa86 Sascha Hauer 2025-06-18  628  		regmap_read(priv->regmap, R72, &val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  629  		idx = FIELD_GET(R72_CH4_MUX, val);
5c09be6e85aa86 Sascha Hauer 2025-06-18  630  		break;
5c09be6e85aa86 Sascha Hauer 2025-06-18  631  	};
5c09be6e85aa86 Sascha Hauer 2025-06-18  632  
5c09be6e85aa86 Sascha Hauer 2025-06-18 @633  	return idx;
5c09be6e85aa86 Sascha Hauer 2025-06-18  634  }
5c09be6e85aa86 Sascha Hauer 2025-06-18  635  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
