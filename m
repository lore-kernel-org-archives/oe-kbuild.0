Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBDC1A5B6
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du0wrbfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701904874; x=1733440874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbJtUtWlIkpyZZyrwo4vmddgrkrQ96t4UuadYxaiswY=;
  b=Du0wrbfvI84wvy8L5ahu0eDZtUdTJ3X3tGl6gwMS+N/w7/fzMEThVzM8
   sC6S4u9kSFkxsI14zhwRcqQFgSCa5qqwCIu1Xt9i386THKoGJBUOSYmZD
   1ARutOzzj8nQTmXNoxA0UGz/1kgrhk06+kfBZTys1qFLTKt8jK8bxhPNb
   t6HeY0natDC2cXu1tT5Hjf83RXOTGIm1eMRCcmLRwzVEOtibtA2gEv2h8
   JGLq6X6eGFa6z9ZjzSlNycQWYFqicixHPN7rm3JKFkquTXSDPwo8+BMvr
   TV+64MZAP6NY+8MvPTqv+maqTR/m//lc/cS8f9xeRN+c56Y/BB2xlDWGb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1211471"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1211471"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800516901"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800516901"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 15:21:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1CT-000BYM-0f;
	Wed, 06 Dec 2023 23:21:05 +0000
Date: Thu, 7 Dec 2023 07:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/uniphier/clk-uniphier-mux.c:47
 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'
Message-ID: <202312070700.rCOmRRKG-lkp@intel.com>
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
TO: Dragos Bogdan <dragos.bogdan@analog.com>
CC: Ley Foon Tan <ley.foon.tan@intel.com>
CC: Beniamin Bia <beniamin.bia@analog.com>

Hi Dragos,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: f26e433185cb2830b933df3a4d378558fe2fccd9 arch: nios2: Enable the common clk subsystem on Nios2
date:   3 years, 8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 8 months ago
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231207/202312070700.rCOmRRKG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070700.rCOmRRKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312070700.rCOmRRKG-lkp@intel.com/

smatch warnings:
drivers/clk/uniphier/clk-uniphier-mux.c:47 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'

vim +47 drivers/clk/uniphier/clk-uniphier-mux.c

734d82f4a678e8 Masahiro Yamada 2016-09-16  30  
734d82f4a678e8 Masahiro Yamada 2016-09-16  31  static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
734d82f4a678e8 Masahiro Yamada 2016-09-16  32  {
734d82f4a678e8 Masahiro Yamada 2016-09-16  33  	struct uniphier_clk_mux *mux = to_uniphier_clk_mux(hw);
734d82f4a678e8 Masahiro Yamada 2016-09-16  34  	int num_parents = clk_hw_get_num_parents(hw);
734d82f4a678e8 Masahiro Yamada 2016-09-16  35  	int ret;
c0ce317f0c8863 Masahiro Yamada 2016-10-17  36  	unsigned int val;
734d82f4a678e8 Masahiro Yamada 2016-09-16  37  	u8 i;
734d82f4a678e8 Masahiro Yamada 2016-09-16  38  
734d82f4a678e8 Masahiro Yamada 2016-09-16  39  	ret = regmap_read(mux->regmap, mux->reg, &val);
734d82f4a678e8 Masahiro Yamada 2016-09-16  40  	if (ret)
734d82f4a678e8 Masahiro Yamada 2016-09-16  41  		return ret;
734d82f4a678e8 Masahiro Yamada 2016-09-16  42  
734d82f4a678e8 Masahiro Yamada 2016-09-16  43  	for (i = 0; i < num_parents; i++)
734d82f4a678e8 Masahiro Yamada 2016-09-16  44  		if ((mux->masks[i] & val) == mux->vals[i])
734d82f4a678e8 Masahiro Yamada 2016-09-16  45  			return i;
734d82f4a678e8 Masahiro Yamada 2016-09-16  46  
734d82f4a678e8 Masahiro Yamada 2016-09-16 @47  	return -EINVAL;
734d82f4a678e8 Masahiro Yamada 2016-09-16  48  }
734d82f4a678e8 Masahiro Yamada 2016-09-16  49  

:::::: The code at line 47 was first introduced by commit
:::::: 734d82f4a678e897a3197b3e61313e32c9e77f46 clk: uniphier: add core support code for UniPhier clock driver

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
