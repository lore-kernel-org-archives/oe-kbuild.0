Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1AEEBB
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 19:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767123953; cv=none; b=n0RNxdQNQY46UkaVCbmi13D47z1slqz+Sc992YohP7SQN3YI9dbRon9iww5qibteG/ZNzgwDwVWqhuL7B+0Tk8fH17b1b40AYGXqbPzCCRqgt4ANjSL/8wHVYFx7BcSjI+2EWZqdnVAWgFjFo62FtntWBZrBeklkhSJPgopw9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767123953; c=relaxed/simple;
	bh=dtWuGSg0fShJ+DNCgQk/Pjba6uZw+4NKdE4hExepZaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUPfrkUMAUeUbZDKbJwBhcHcvK0fuxEBAXcGNZdb4DvtkQS1zNnLGlhqi1RX7037hAPPlo1915AknBk93IENIbnPyzNGvoUIFPyCnhqq9adzJROXAEiDlYOxzGIz9WHosNNcD1ZJNkabIM9Q/12zp3HEMkuLxv8+vpsNuskp70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpM7/+Bo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpM7/+Bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767123951; x=1798659951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dtWuGSg0fShJ+DNCgQk/Pjba6uZw+4NKdE4hExepZaw=;
  b=HpM7/+Bo34SH+mndKpftCEDZ6gunv992rcQJz0Unml/omRMThjLrnWpc
   Zt2utMIXJuD/1j6RLtdnLUa7d4SkUX81dE47EprxawqrJdCaoepXzjdPt
   nW1GLR6w0Ceh49A3c142+kcIde8isKuKisjFv3yxHXoFd6XR42yRxKHP8
   lBiAOwugQxjQFSxK/oKZu//k+Dlc2XtPTRbe2rUHudCe3SnP15l2SteS5
   r2fMWYPrpWoJjEu1LdDCaNSUkJRlr4/zw1H2om+aspo1DU8V0fTM05eOv
   gtlrFbQMxI1TiJ8THGFk40rKnGfdmS1kkidb5Tpoz5FdcBgR6Qt9ohDT7
   w==;
X-CSE-ConnectionGUID: Tutsu8aaRj+l6jisZ0PWRA==
X-CSE-MsgGUID: anZi9bu+QHqkZvcP348XcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79345292"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79345292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 11:45:51 -0800
X-CSE-ConnectionGUID: Kft9TPQiSuu/fIRjKFuYWQ==
X-CSE-MsgGUID: AGh2AiyOTzaLKdzbEVxlbw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 11:45:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaff9-000000000f7-1pvE;
	Tue, 30 Dec 2025 19:45:47 +0000
Date: Wed, 31 Dec 2025 03:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/9] clk: realtek: Add support for mux clock
Message-ID: <202512310307.swVDgnPU-lkp@intel.com>
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
In-Reply-To: <20251229075313.27254-7-eleanor.lin@realtek.com>
References: <20251229075313.27254-7-eleanor.lin@realtek.com>
TO: "Yu-Chun Lin" <eleanor.lin@realtek.com>
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: cylee12@realtek.com
TO: jyanchou@realtek.com
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: james.tai@realtek.com
CC: cy.huang@realtek.com
CC: stanley_chang@realtek.com
CC: eleanor.lin@realtek.com

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20251229-155549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251229075313.27254-7-eleanor.lin%40realtek.com
patch subject: [PATCH 6/9] clk: realtek: Add support for mux clock
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r072-20251231 (https://download.01.org/0day-ci/archive/20251231/202512310307.swVDgnPU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512310307.swVDgnPU-lkp@intel.com/

smatch warnings:
drivers/clk/realtek/clk-regmap-mux.c:23 clk_regmap_mux_get_parent() warn: signedness bug returning '(-22)'

vim +23 drivers/clk/realtek/clk-regmap-mux.c

f53de7a7df69f0 Yu-Chun Lin 2025-12-29   8  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29   9  static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  10  {
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  11  	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  12  	int num_parents = clk_hw_get_num_parents(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  13  	u32 val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  14  	int ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  15  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  16  	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  17  	if (ret)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  18  		return ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  19  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  20  	val = val >> clkm->shift & clkm->mask;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  21  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  22  	if (val >= num_parents)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29 @23  		return -EINVAL;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  24  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  25  	return val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  26  }
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
