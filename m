Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510905;
	b=jv8n1t5F5b4a03RNbqyHcZZkGyprZByA4ggL3xtqRhWJIXY9IPkM17gEequTN8RRxpi0
	 bcmgT+qnJ73JUEY8yTTto8koGMF+HzgJDuLF5NSTaKUml5dqgu6VI+eGk6Trc8HaeMrGT
	 Lt5Zys6U/6X3thTuCjm7fTQv4pf5GhcKmD0EJWFCIObhRRqqB1dt9s/957q4zyJLN7xB2
	 lddLVPiG9QH1M64yVzSNr0QaJimqZ5ZqqBpFxvUeHowgaB7enXKnUeQFgCmlYA2kgZdim
	 QuOGjjGWdFZywfNqByPYzIj0OYOKDe8nbkXnGTLy0iL0t0ogvRdZ2AnIp2x98fDzgTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Pq36gQ0dkKq11hhFG1aDF8yFm/Y0CufqFSpokkDABWs=;
	b=0CxbC4yiLBo77QeC4MgXlc1yUoAkM9H9RJ6ipuK2k67qx00DmcauyhDzS5wvd+ZZsEke
	 z+nvpHncWzO6dHT6HUxEhWz5R+z4JTbo9r8sslKVxfnhQDD4SsepU+F9eUlzjUS9QkaqE
	 gOv2MQWLmExV7QEymosOBtr2+6AvM9I5J+ENJ1LGt92DeprpYyg/QzCGYXYFNXDrQrvtE
	 aCK8iRNqRVNt2g/Kfysjo/SvY1CdzZkXQmX+U8sUtFT/FuH3qleIDSP4IJkEbPnfBw7m3
	 SIIoXNXY7UNszflEBikeEJxtJElZ/iAgtmzVLlZwcOIZbJuMdZA2G09S4GLnoT8dtGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYJ5xb7a;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD7606A31B
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 15:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FD7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYJ5xb7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792510902; x=1824046902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzpDZ4CQHOPurSC6gad10nCmHDBxDfZuINvHY7Pkmd8=;
  b=VYJ5xb7aqWCvojDGgoSWp9Akjvysm/o3DydDsmgU0xy211NALDaxb9MV
   UrCdDCaJMlwcmqF0nlIxGqYZ30BiVUSTGEK1tzgHYGikmU+EtgNt7Irhq
   Nc8L4toYrrgGzboPvdEROw8EsyojZehWTThyA3AKw/Ad0I4fyTSESKUzz
   Ps37f8c3lyG01fXIbXla3+WHPLi5gkGH0xHNS+Rc9Q7TDLzf7cQsddOYA
   qGfJlo/nd65N03QAYf4eX98GGHM+aN9r8Wa6YM5KeCWPlxCTG9nUCbLd5
   tVs5kqCgeqQ8Nrv5/H/8w0y7c7WgkUpVidvztAaP858YfVme2dXZhc3HZ
   g==;
X-CSE-ConnectionGUID: qrwgb8xSTOu2XdiRJPyhYQ==
X-CSE-MsgGUID: 74CsEVumQYWG7/UpUz6tkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1093654"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1093654"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 08:41:42 -0700
X-CSE-ConnectionGUID: 2LW6BJoNQV2L1M1vccNnSQ==
X-CSE-MsgGUID: T9Rx3PpCS96SLAZHZBndDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2912856"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Oct 2026 08:41:42 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJBy7-000000006LD-01dA;
	Tue, 20 Oct 2026 15:41:39 +0000
Date: Tue, 20 Oct 2026 17:40:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] clk: socfpga: agilex: register the SP timer
 clocks early
Message-ID: <202610201741.iarcON9M-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
References: <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
TO: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: linux-clk@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Hi Adrian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Ng-Ho-Yin/clk-socfpga-agilex-register-the-SP-timer-clocks-early/20261013-150752
base:   1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548
patch link:    https://lore.kernel.org/r/1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng%40altera.com
patch subject: [PATCH v3 1/3] clk: socfpga: agilex: register the SP timer clocks early
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r2202-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201741.iarcON9M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610201741.iarcON9M-lkp@intel.com/

smatch warnings:
drivers/clk/socfpga/clk-agilex.c:635 agilex_clkmgr_init() warn: 'clk_data' can also be NULL
drivers/clk/socfpga/clk-agilex.c:656 n5x_clkmgr_init() warn: 'clk_data' can also be NULL

vim +/clk_data +635 drivers/clk/socfpga/clk-agilex.c

59988b8a07910f Adrian Ng Ho Yin 2026-10-13  626  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  627  static int agilex_clkmgr_init(struct platform_device *pdev)
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  628  {
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  629  	struct stratix10_clock_data *clk_data;
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  630  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  631  	clk_data = agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  632  	if (IS_ERR(clk_data))
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  633  		return PTR_ERR(clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  634  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13 @635  	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  636  				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  637  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  638  	agilex_clk_register_cnt_perip(agilex_main_perip_cnt_clks,
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  639  				   ARRAY_SIZE(agilex_main_perip_cnt_clks),
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  640  				   clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  641  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  642  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  643  			      clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  644  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  645  	return agilex_clkmgr_finish(pdev, clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  646  }
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  647  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  648  static int n5x_clkmgr_init(struct platform_device *pdev)
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  649  {
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  650  	struct stratix10_clock_data *clk_data;
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  651  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  652  	clk_data = agilex_clkmgr_get_clk_data(pdev, n5x_clk_register_early);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  653  	if (IS_ERR(clk_data))
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  654  		return PTR_ERR(clk_data);
a0f9819cbe9952 Dinh Nguyen      2021-02-12  655  
a0f9819cbe9952 Dinh Nguyen      2021-02-12 @656  	n5x_clk_register_c_perip(n5x_main_perip_c_clks,
a0f9819cbe9952 Dinh Nguyen      2021-02-12  657  				 ARRAY_SIZE(n5x_main_perip_c_clks), clk_data);
a0f9819cbe9952 Dinh Nguyen      2021-02-12  658  
a0f9819cbe9952 Dinh Nguyen      2021-02-12  659  	agilex_clk_register_cnt_perip(agilex_main_perip_cnt_clks,
a0f9819cbe9952 Dinh Nguyen      2021-02-12  660  				   ARRAY_SIZE(agilex_main_perip_cnt_clks),
a0f9819cbe9952 Dinh Nguyen      2021-02-12  661  				   clk_data);
a0f9819cbe9952 Dinh Nguyen      2021-02-12  662  
a0f9819cbe9952 Dinh Nguyen      2021-02-12  663  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
a0f9819cbe9952 Dinh Nguyen      2021-02-12  664  			      clk_data);
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  665  
59988b8a07910f Adrian Ng Ho Yin 2026-10-13  666  	return agilex_clkmgr_finish(pdev, clk_data);
a0f9819cbe9952 Dinh Nguyen      2021-02-12  667  }
a0f9819cbe9952 Dinh Nguyen      2021-02-12  668  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
