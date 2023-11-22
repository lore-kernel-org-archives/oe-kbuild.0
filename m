Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705F25570
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMvK4DQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700674488; x=1732210488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E+5XcEoyVBczt8P29CIGmeU+pfzCjBlf8I1LxMHR5J0=;
  b=dMvK4DQNAGpvP3oIA9Eo6Zc1X4smhjC+4EyZgXb98tO/2s9wTfb2zZum
   2TX8PLwxrzsLhGNTiMnI8Lbv1hSdbCM3kyvCboN1XsSKyPlNwx2HLYpBa
   N2WGGvMrW7S1U0OUDKsmhoZLW1yYIa4aj9WNMiH+068Q5l9RyT+a5Ge0e
   h+B/RO9w9UpKQghzfn3QL+JQZElsO1iDmUC+6A8cXLg4aiZD1nfyZvvgf
   s/7sTZT4TRH/dX1ZPLklQg39p6EsvhecuhIY1JWBgdaM3DlDrm7EcPH1i
   3vauce4DWiyV84Q7YpciXMROcs1QJC+fOg/cUdBNLvfl0+q3UK2RZ7JV/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="390966890"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="390966890"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910906612"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910906612"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 09:34:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5r7c-0000jI-08;
	Wed, 22 Nov 2023 17:34:44 +0000
Date: Thu, 23 Nov 2023 01:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/ingenic/jz4760-cgu.c:80 jz4760_cgu_calc_m_n_od() error:
 uninitialized symbol 'od'.
Message-ID: <202311230041.i2H8lEE3-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: ecfb9f404771dde909ce7743df954370933c3be2 clk: ingenic: jz4760: Update M/N/OD calculation algorithm
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311230041.i2H8lEE3-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230041.i2H8lEE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311230041.i2H8lEE3-lkp@intel.com/

smatch warnings:
drivers/clk/ingenic/jz4760-cgu.c:80 jz4760_cgu_calc_m_n_od() error: uninitialized symbol 'od'.

vim +/od +80 drivers/clk/ingenic/jz4760-cgu.c

bdbfc029374f6d Paul Cercueil 2021-05-30  55  
bdbfc029374f6d Paul Cercueil 2021-05-30  56  static void
bdbfc029374f6d Paul Cercueil 2021-05-30  57  jz4760_cgu_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
bdbfc029374f6d Paul Cercueil 2021-05-30  58  		       unsigned long rate, unsigned long parent_rate,
bdbfc029374f6d Paul Cercueil 2021-05-30  59  		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
bdbfc029374f6d Paul Cercueil 2021-05-30  60  {
ecfb9f404771dd Paul Cercueil 2022-12-14  61  	unsigned int m, n, od, m_max = (1 << pll_info->m_bits) - 1;
bdbfc029374f6d Paul Cercueil 2021-05-30  62  
bdbfc029374f6d Paul Cercueil 2021-05-30  63  	/* The frequency after the N divider must be between 1 and 50 MHz. */
bdbfc029374f6d Paul Cercueil 2021-05-30  64  	n = parent_rate / (1 * MHZ);
bdbfc029374f6d Paul Cercueil 2021-05-30  65  
bdbfc029374f6d Paul Cercueil 2021-05-30  66  	/* The N divider must be >= 2. */
bdbfc029374f6d Paul Cercueil 2021-05-30  67  	n = clamp_val(n, 2, 1 << pll_info->n_bits);
bdbfc029374f6d Paul Cercueil 2021-05-30  68  
ecfb9f404771dd Paul Cercueil 2022-12-14  69  	rate /= MHZ;
ecfb9f404771dd Paul Cercueil 2022-12-14  70  	parent_rate /= MHZ;
bdbfc029374f6d Paul Cercueil 2021-05-30  71  
ecfb9f404771dd Paul Cercueil 2022-12-14  72  	for (m = m_max; m >= m_max && n >= 2; n--) {
ecfb9f404771dd Paul Cercueil 2022-12-14  73  		m = rate * n / parent_rate;
ecfb9f404771dd Paul Cercueil 2022-12-14  74  		od = m & 1;
ecfb9f404771dd Paul Cercueil 2022-12-14  75  		m <<= od;
bdbfc029374f6d Paul Cercueil 2021-05-30  76  	}
bdbfc029374f6d Paul Cercueil 2021-05-30  77  
bdbfc029374f6d Paul Cercueil 2021-05-30  78  	*pm = m;
ecfb9f404771dd Paul Cercueil 2022-12-14  79  	*pn = n + 1;
bdbfc029374f6d Paul Cercueil 2021-05-30 @80  	*pod = 1 << od;
bdbfc029374f6d Paul Cercueil 2021-05-30  81  }
bdbfc029374f6d Paul Cercueil 2021-05-30  82  

:::::: The code at line 80 was first introduced by commit
:::::: bdbfc029374f6d9ed31bc44983501fd1008b677f clk: ingenic: Add support for the JZ4760

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
