Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2610E6
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 04:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675398035; x=1706934035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aA7mML88mIP3sSnit+Fzol+quCuInGsvhkqnlkHAAgQ=;
  b=di8DJWYpsf27SQJVELWJYkCZb4WC2kQME7VeGJVZu+XgbcmlQhZ4zvzC
   qaLB+N7hwM6lVKzbQxqvbnqSnbUikcnvA/xz0iC+mQK86hFIR/wIuD/Rj
   /fNIfg59SYyl2sDLrdjzRpTM7HV5Q5DtqHfRAVG+kQNfwZTrs2/E7z4Uf
   VqCEC8qIMtPf92kJ2i+7M8x/luM9O5Sv1aBJ7iu0/TCcbpKc/Jh0L9rwo
   bdv9Gzc7C7bLy0xYyMUgicrSA8FJJ++TJXFxRUk1tNMlXZsT67knqE48D
   /Nwrc/XKkHYRAOGtVKyREJUzfZUgCxZlVevFtC1jWaUKOXPPBUJTHkS6f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330784669"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="330784669"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 20:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615570806"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="615570806"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Feb 2023 20:20:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNnYu-00005t-2d;
	Fri, 03 Feb 2023 04:20:32 +0000
Date: Fri, 3 Feb 2023 12:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6973/10357] drivers/clk/ingenic/jz4760-cgu.c:80
 jz4760_cgu_calc_m_n_od() error: uninitialized symbol 'od'.
Message-ID: <202302031212.THLYMkki-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Cercueil <paul@crapouillou.net>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: ecfb9f404771dde909ce7743df954370933c3be2 [6973/10357] clk: ingenic: jz4760: Update M/N/OD calculation algorithm
:::::: branch date: 80 minutes ago
:::::: commit date: 8 days ago
config: openrisc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031212.THLYMkki-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

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
https://github.com/intel/lkp-tests
