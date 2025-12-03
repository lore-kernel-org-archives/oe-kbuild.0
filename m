Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580662DAFC3
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 21:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798398; cv=none; b=lugwMGg+6gvn1evzz+1gvI6X2OwTtxm0uQJ5Qsb9jhvQhjwyt/pqOYdIzHsU18SZ8WI//WkMTpC7OBrhKAQ8G7KjZkf7T2t8ZO6hTv+ItNj6Z9fuWBQjsJkxX5SF6JkPqXS8EfxyQlPYqthb5WsXetr6RB3cRyHuNsUEDVyYARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798398; c=relaxed/simple;
	bh=K/Rj6ZUYTBOZGIH50Uy+erGKcxQ0IxgkYaiit9RXej0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbqunxbiEP/d5mTdFFo44CGelSMnitaMFNhTaolXtFJYsCLJo2p3e0pfjaRq2ETI84obhSGfJoYUvXb9WuXx/EoQOCqdtXZwdYmLndkQCKyiHxhyJCFmY6NV776zmqT7NgliyTMV0xvXhafTfe5/IH0xg7jdTlKyeOnV1ya7NV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQreBQs/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQreBQs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764798396; x=1796334396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/Rj6ZUYTBOZGIH50Uy+erGKcxQ0IxgkYaiit9RXej0=;
  b=cQreBQs/V3SqPgmZV9+k3UmBucMS1GKbOwmekV1gRauwrqKv7M0hrUQM
   pIoQvPBzA6OhSjQiY38wg4u8EQN+SkS+uf44t5FKjk2lrOrIWG1r+cNK+
   JPkT8VwerG8LcX+ApAfaOcIdumXSNIiv8Oo1PBfmMtzp25tSocjhWU/pw
   jm4Gi2Qy3PtWRCJpJuBLaOgygGqm/oV7D7FtakY+Qp4rVG48+0z8ckkCt
   sbPeBU+X65c9dC5EzxCRohFuJT3y8CsaFD/WQr0U6+5gmESrGWvyx7PHi
   Tus/qSEJlPMm9A3Q4gkW/n79VkzgyHlhBdU742wDVDheIyigNZmY9bfje
   g==;
X-CSE-ConnectionGUID: T/rglMlURIaD91OCpCV5Ag==
X-CSE-MsgGUID: qh8Hxkn+Sq2qP8Fcy5Cixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78159426"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78159426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:46:36 -0800
X-CSE-ConnectionGUID: VTTpO9ZpQC2uV5dKdzSsHw==
X-CSE-MsgGUID: YvQOZ8OfTDOGonrvaHXKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199928364"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2025 13:46:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQugC-00000000DBT-0n6Q;
	Wed, 03 Dec 2025 21:46:32 +0000
Date: Thu, 4 Dec 2025 05:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 12472/13147]
 drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of sizeof to
 pointer
Message-ID: <202512040525.zrHSDl5h-lkp@intel.com>
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
TO: Johan Hovold <johan@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: b276445e98fe28609688fb85b89a81b803910e63 [12472/13147] clk: keystone: fix compile testing
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r061-20251203 (https://download.01.org/0day-ci/archive/20251204/202512040525.zrHSDl5h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512040525.zrHSDl5h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of sizeof to pointer

vim +391 drivers/clk/keystone/sci-clk.c

f54d2cd3c1a231 Tero Kristo 2017-08-02  367  
b745c0794e2ff2 Tero Kristo 2017-06-13  368  /**
b745c0794e2ff2 Tero Kristo 2017-06-13  369   * sci_clk_get - Xlate function for getting clock handles
b745c0794e2ff2 Tero Kristo 2017-06-13  370   * @clkspec: device tree clock specifier
b745c0794e2ff2 Tero Kristo 2017-06-13  371   * @data: pointer to the clock provider
b745c0794e2ff2 Tero Kristo 2017-06-13  372   *
b745c0794e2ff2 Tero Kristo 2017-06-13  373   * Xlate function for retrieving clock TI SCI hw clock handles based on
b745c0794e2ff2 Tero Kristo 2017-06-13  374   * device tree clock specifier. Called from the common clock framework,
b745c0794e2ff2 Tero Kristo 2017-06-13  375   * when a corresponding of_clk_get call is executed. Returns a pointer
b745c0794e2ff2 Tero Kristo 2017-06-13  376   * to the TI SCI hw clock struct, or ERR_PTR value in failure.
b745c0794e2ff2 Tero Kristo 2017-06-13  377   */
b745c0794e2ff2 Tero Kristo 2017-06-13  378  static struct clk_hw *sci_clk_get(struct of_phandle_args *clkspec, void *data)
b745c0794e2ff2 Tero Kristo 2017-06-13  379  {
b745c0794e2ff2 Tero Kristo 2017-06-13  380  	struct sci_clk_provider *provider = data;
f54d2cd3c1a231 Tero Kristo 2017-08-02  381  	struct sci_clk **clk;
f54d2cd3c1a231 Tero Kristo 2017-08-02  382  	struct sci_clk key;
b745c0794e2ff2 Tero Kristo 2017-06-13  383  
b745c0794e2ff2 Tero Kristo 2017-06-13  384  	if (clkspec->args_count != 2)
b745c0794e2ff2 Tero Kristo 2017-06-13  385  		return ERR_PTR(-EINVAL);
b745c0794e2ff2 Tero Kristo 2017-06-13  386  
f54d2cd3c1a231 Tero Kristo 2017-08-02  387  	key.dev_id = clkspec->args[0];
f54d2cd3c1a231 Tero Kristo 2017-08-02  388  	key.clk_id = clkspec->args[1];
b745c0794e2ff2 Tero Kristo 2017-06-13  389  
f54d2cd3c1a231 Tero Kristo 2017-08-02  390  	clk = bsearch(&key, provider->clocks, provider->num_clocks,
f54d2cd3c1a231 Tero Kristo 2017-08-02 @391  		      sizeof(clk), _cmp_sci_clk);
b745c0794e2ff2 Tero Kristo 2017-06-13  392  
f54d2cd3c1a231 Tero Kristo 2017-08-02  393  	if (!clk)
b745c0794e2ff2 Tero Kristo 2017-06-13  394  		return ERR_PTR(-ENODEV);
f54d2cd3c1a231 Tero Kristo 2017-08-02  395  
f54d2cd3c1a231 Tero Kristo 2017-08-02  396  	return &(*clk)->hw;
b745c0794e2ff2 Tero Kristo 2017-06-13  397  }
b745c0794e2ff2 Tero Kristo 2017-06-13  398  

:::::: The code at line 391 was first introduced by commit
:::::: f54d2cd3c1a231e00732442fca329341d4f4250b clk: keystone: sci-clk: Fix sci_clk_get

:::::: TO: Tero Kristo <t-kristo@ti.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
