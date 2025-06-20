Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647D137E
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388482; cv=none; b=qp31/9YZETaUHXS4OmlCogJwjk0JLTZxtC4sdA6YKNNJRpsug79udU+dfgWJrQuer7sHj/lW/fVsWYj8PGV3SjWMvSBX/eca1YHWJbsfhGVaW0swMKotrnDOcXLY6kWiqCBFCxiAtVlEjGuHdkSaOyppgziWgUgP/bYqO0oGTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388482; c=relaxed/simple;
	bh=6k4AN7xVbqFMdZ7Y8UD4CDnU6otX+xTPaLptz1U7mXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MprhKO1FOUnWes+as4sUEd+UvUU6BJA5f/fCMPWnKxAymki2xFD3BHMVNXVe2DX33pKwRcLstcFyNRklMd1qVt5Ly7yuttbuCb7WA7aQyaUIvdrg372a6vjQ4ifFiCaAl6OM2eSzeNVNzueuPGIJ48Ytf06uQQaVJ/FHUV8vApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZNpmxX3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZNpmxX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750388481; x=1781924481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6k4AN7xVbqFMdZ7Y8UD4CDnU6otX+xTPaLptz1U7mXc=;
  b=cZNpmxX3nVZSwDOgPKHHmyATqZ8pU9H7kRIFu53BNGTIgbDGz4kVuJEy
   r6mODVNHVc6cqV6u2tU0J0UKJdQHeUKld479B64jZgyUKSL9IpS4HM9tS
   ULZIj/yDdI7zIx8+uFHaOepNuauRrKsh3rSh+f39Meoxg7NOsLV86jTxM
   YXMCu2rm7hHfNZUZ4hZLZ6Xshv48v7b069ssiFXUDLk/jp5C6dUvEgPE9
   lNOTC6E/TjRzw02AbDwuO+iQG8euP4CsDUvSBj8LvTD0d3Fn0agzWdF4g
   oUEin/220FGWcDDtee/3vXqpWyDwE4BU2jPhbi36lF7SORZshkCEZfXEJ
   Q==;
X-CSE-ConnectionGUID: yvUNVA0LQA28t7h6DZE1+w==
X-CSE-MsgGUID: E96uGbMxQnK6D5y63Ryqww==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64073599"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="64073599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 20:01:19 -0700
X-CSE-ConnectionGUID: nvtVB7W9RQ+gBQ98tPO5TA==
X-CSE-MsgGUID: mNRE5uwdSweQCQF6R6e30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="150282491"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 20:01:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSS0B-000LJw-1x;
	Fri, 20 Jun 2025 03:01:15 +0000
Date: Fri, 20 Jun 2025 11:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] i2c: busses: Use min() to improve code
Message-ID: <202506201020.x0ig9fuA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250619142609.323082-1-rongqianfeng@vivo.com>
References: <20250619142609.323082-1-rongqianfeng@vivo.com>
TO: Qianfeng Rong <rongqianfeng@vivo.com>
TO: Patrice Chotard <patrice.chotard@foss.st.com>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-i2c@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: opensource.kernel@vivo.com
CC: Qianfeng Rong <rongqianfeng@vivo.com>

Hi Qianfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qianfeng-Rong/i2c-busses-Use-min-to-improve-code/20250619-222745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250619142609.323082-1-rongqianfeng%40vivo.com
patch subject: [PATCH] i2c: busses: Use min() to improve code
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-004-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201020.x0ig9fuA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201020.x0ig9fuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506201020.x0ig9fuA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-st.c:453:6: error: call to '__compiletime_assert_499' declared with 'error' attribute: min(max, 0x8 - tx_fstat) signedness error
     453 |         i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
         |             ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:166:1: note: expanded from here
     166 | __compiletime_assert_499
         | ^
>> drivers/i2c/busses/i2c-st.c:453:6: error: call to '__compiletime_assert_499' declared with 'error' attribute: min(max, 0x8 - tx_fstat) signedness error
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:166:1: note: expanded from here
     166 | __compiletime_assert_499
         | ^
   2 errors generated.


vim +453 drivers/i2c/busses/i2c-st.c

85b4fab2696000 Maxime COQUELIN 2013-11-06  431  
85b4fab2696000 Maxime COQUELIN 2013-11-06  432  /**
85b4fab2696000 Maxime COQUELIN 2013-11-06  433   * st_i2c_rd_fill_tx_fifo() - Fill the Tx FIFO in read mode
85b4fab2696000 Maxime COQUELIN 2013-11-06  434   * @i2c_dev: Controller's private data
f491c668733292 Alain Volmat    2020-03-26  435   * @max: Maximum amount of data to fill into the Tx FIFO
85b4fab2696000 Maxime COQUELIN 2013-11-06  436   *
85b4fab2696000 Maxime COQUELIN 2013-11-06  437   * This functions fills the Tx FIFO with fixed pattern when
85b4fab2696000 Maxime COQUELIN 2013-11-06  438   * in read mode to trigger clock.
85b4fab2696000 Maxime COQUELIN 2013-11-06  439   */
85b4fab2696000 Maxime COQUELIN 2013-11-06  440  static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
85b4fab2696000 Maxime COQUELIN 2013-11-06  441  {
85b4fab2696000 Maxime COQUELIN 2013-11-06  442  	struct st_i2c_client *c = &i2c_dev->client;
85b4fab2696000 Maxime COQUELIN 2013-11-06  443  	u32 tx_fstat, sta;
85b4fab2696000 Maxime COQUELIN 2013-11-06  444  	int i;
85b4fab2696000 Maxime COQUELIN 2013-11-06  445  
85b4fab2696000 Maxime COQUELIN 2013-11-06  446  	sta = readl_relaxed(i2c_dev->base + SSC_STA);
85b4fab2696000 Maxime COQUELIN 2013-11-06  447  	if (sta & SSC_STA_TX_FIFO_FULL)
85b4fab2696000 Maxime COQUELIN 2013-11-06  448  		return;
85b4fab2696000 Maxime COQUELIN 2013-11-06  449  
85b4fab2696000 Maxime COQUELIN 2013-11-06  450  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
85b4fab2696000 Maxime COQUELIN 2013-11-06  451  	tx_fstat &= SSC_TX_FSTAT_STATUS;
85b4fab2696000 Maxime COQUELIN 2013-11-06  452  
6a2a53759c181d Qianfeng Rong   2025-06-19 @453  	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
85b4fab2696000 Maxime COQUELIN 2013-11-06  454  
85b4fab2696000 Maxime COQUELIN 2013-11-06  455  	for (; i > 0; i--, c->xfered++)
85b4fab2696000 Maxime COQUELIN 2013-11-06  456  		st_i2c_write_tx_fifo(i2c_dev, 0xff);
85b4fab2696000 Maxime COQUELIN 2013-11-06  457  }
85b4fab2696000 Maxime COQUELIN 2013-11-06  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
