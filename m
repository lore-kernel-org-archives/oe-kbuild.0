Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8DEA2
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 02:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694917669; x=1726453669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJ434/GzIhJwCwMA+K0sBnZoaFgu1Gl8/nmfRTXIc1M=;
  b=i0LxR0uf8eXfnyyLBrRfs/A0BaosMpZTmNal7AK4zVxbg7eM8439tyIT
   jvZtp0SpEoQInh7n1fseyYabsrtaeNcgOzxpfnPYkbyJsz3dk8ajXXbV1
   KXPzRqqihg+KlLJxqcBdjsR9jniDtiLz4YUBjGZqynyu44AWqrkVNr6B/
   rRu8zriSVMU5DyMjm0MKiA8E2RT+kr6NQC7JDx+oQX08NtwENn380yzYN
   VemdT3yCCz3Nsm+yJshqNdfewSaHd2iGDh8Ckn+m5MujQdi9qQx80tz2l
   tCamkcpS3O/iiTKBpDojgUwkgKaPe/eCc2DpZnpog691UnaHi2iwWXerx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="383294224"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="383294224"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 19:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835647510"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835647510"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 19:27:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhhVi-0004rM-04;
	Sun, 17 Sep 2023 02:27:46 +0000
Date: Sun, 17 Sep 2023 10:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/ingenic/jz4760-cgu.c:80 jz4760_cgu_calc_m_n_od() error:
 uninitialized symbol 'od'.
Message-ID: <202309171031.0PlKLhsr-lkp@intel.com>
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
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: ecfb9f404771dde909ce7743df954370933c3be2 clk: ingenic: jz4760: Update M/N/OD calculation algorithm
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230917/202309171031.0PlKLhsr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171031.0PlKLhsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309171031.0PlKLhsr-lkp@intel.com/

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
