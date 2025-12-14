Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FF2874ED
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745929; cv=none; b=f1gF0plAwjFevrL2JBmSNmUiCtCV3ve8JqzgvtNsJbkX6tnS0C6WOCsC45ukcEox9r1oNhhoVEhKYFsjhsksUDt9gC9SpsNv/kXabeYVk4wwbTWsYc0+GolddyftbXysjy77dNyI7j6dxSS1+IoPZGmrtwwsj81JNvhIS6MB5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745929; c=relaxed/simple;
	bh=tJALGF3hiGccAj7cNH6DQLNOITGzEXyQKvfnWQIVc6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApH9i1FplGufWdHHxLaW/jVlg0oXynDocAVRolUeRcfDIiOed7cgF7OOg5iM3tdjprkMSdZyz65mXWuj3+/86X2+GH2VDTWicdbW3gYWGbq6MA7rX2nTvN6vKSeBhZAGXk6cYxWbaDJ/zCBY/HvGXhERrZSiCdMEwgSy/nl2uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcoPtD7O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcoPtD7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765745928; x=1797281928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJALGF3hiGccAj7cNH6DQLNOITGzEXyQKvfnWQIVc6I=;
  b=RcoPtD7OCbNFDF3kkz9ezAspBTvHbzhIJwUtVQ9tiVNjAEhzs6WTa80L
   /sq1TiYWIYNg3Qr5YpgbiPy6uA6riKxfkZhVdIRrc4jKvN+ZdxoE2OlBd
   ZQbJRvZr1imzSzeEtYNjOLHlz0HyNBaWMLQgqgdT1QvGGYXry+dML7WLx
   XL+XWiu80tgbmhgZ9uHRs1CJqM29kV9G7YOUdwt0I9KP+efm3xwJMYtay
   d2FJSeBisMeHDA20QEeQWx5GuVNwMhDSB+RqENsbU1VT6zpE4fNlzLqpf
   D0dcrNcOhR4W/APld81HEK3GF9jmdTKwLrb35wHn7f1KSRJSRh870Ai6V
   Q==;
X-CSE-ConnectionGUID: L3ER8zwDTkCyOgybYgqB3Q==
X-CSE-MsgGUID: 0wTeMPmQSPeCJC/jwijXwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77969045"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="77969045"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 12:58:46 -0800
X-CSE-ConnectionGUID: 30kI/nyJSeWLGeq2PoeRGA==
X-CSE-MsgGUID: SuiZU84HSKGJgixnbTms3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228632634"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 12:58:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtAv-000000009Nt-3g1y;
	Sun, 14 Dec 2025 20:58:41 +0000
Date: Mon, 15 Dec 2025 04:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] hwrng: airoha: Fix wait_for_completion_timeout return
 value check
Message-ID: <202512150426.ZpTz5SFw-lkp@intel.com>
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
In-Reply-To: <20251208080836.1010-1-vulab@iscas.ac.cn>
References: <20251208080836.1010-1-vulab@iscas.ac.cn>
TO: Haotian Zhang <vulab@iscas.ac.cn>
TO: ansuelsmth@gmail.com
TO: olivia@selenic.com
TO: herbert@gondor.apana.org.au
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Haotian Zhang <vulab@iscas.ac.cn>

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19-rc1 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/hwrng-airoha-Fix-wait_for_completion_timeout-return-value-check/20251208-161314
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251208080836.1010-1-vulab%40iscas.ac.cn
patch subject: [PATCH] hwrng: airoha: Fix wait_for_completion_timeout return value check
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: m68k-randconfig-r062-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150426.ZpTz5SFw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512150426.ZpTz5SFw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/airoha-trng.c:108:5-8: WARNING: Unsigned expression compared with zero: ret < 0
   drivers/char/hw_random/airoha-trng.c:117:5-8: WARNING: Unsigned expression compared with zero: ret < 0

vim +108 drivers/char/hw_random/airoha-trng.c

e53ca8efcc5ec1a Christian Marangi 2024-10-17   75  
e53ca8efcc5ec1a Christian Marangi 2024-10-17   76  static int airoha_trng_init(struct hwrng *rng)
e53ca8efcc5ec1a Christian Marangi 2024-10-17   77  {
e53ca8efcc5ec1a Christian Marangi 2024-10-17   78  	struct airoha_trng *trng = container_of(rng, struct airoha_trng, rng);
cd62dba83f93a0d Haotian Zhang     2025-12-08   79  	unsigned long ret;
e53ca8efcc5ec1a Christian Marangi 2024-10-17   80  	u32 val;
e53ca8efcc5ec1a Christian Marangi 2024-10-17   81  
e53ca8efcc5ec1a Christian Marangi 2024-10-17   82  	val = readl(trng->base + TRNG_NS_SEK_AND_DAT_EN);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   83  	val |= RNG_EN;
e53ca8efcc5ec1a Christian Marangi 2024-10-17   84  	writel(val, trng->base + TRNG_NS_SEK_AND_DAT_EN);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   85  
e53ca8efcc5ec1a Christian Marangi 2024-10-17   86  	/* Set out of SW Reset */
e53ca8efcc5ec1a Christian Marangi 2024-10-17   87  	airoha_trng_irq_unmask(trng);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   88  	writel(0, trng->base + TRNG_HEALTH_TEST_SW_RST);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   89  
e53ca8efcc5ec1a Christian Marangi 2024-10-17   90  	ret = wait_for_completion_timeout(&trng->rng_op_done, BUSY_LOOP_TIMEOUT);
cd62dba83f93a0d Haotian Zhang     2025-12-08   91  	if (ret == 0) {
e53ca8efcc5ec1a Christian Marangi 2024-10-17   92  		dev_err(trng->dev, "Timeout waiting for Health Check\n");
e53ca8efcc5ec1a Christian Marangi 2024-10-17   93  		airoha_trng_irq_mask(trng);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   94  		return -ENODEV;
e53ca8efcc5ec1a Christian Marangi 2024-10-17   95  	}
e53ca8efcc5ec1a Christian Marangi 2024-10-17   96  
e53ca8efcc5ec1a Christian Marangi 2024-10-17   97  	/* Check if Health Test Failed */
e53ca8efcc5ec1a Christian Marangi 2024-10-17   98  	val = readl(trng->base + TRNG_HEALTH_TEST_STATUS);
e53ca8efcc5ec1a Christian Marangi 2024-10-17   99  	if (val & (RST_STARTUP_AP_TEST_FAIL | RST_STARTUP_RC_TEST_FAIL)) {
e53ca8efcc5ec1a Christian Marangi 2024-10-17  100  		dev_err(trng->dev, "Health Check fail: %s test fail\n",
e53ca8efcc5ec1a Christian Marangi 2024-10-17  101  			val & RST_STARTUP_AP_TEST_FAIL ? "AP" : "RC");
e53ca8efcc5ec1a Christian Marangi 2024-10-17  102  		return -ENODEV;
e53ca8efcc5ec1a Christian Marangi 2024-10-17  103  	}
e53ca8efcc5ec1a Christian Marangi 2024-10-17  104  
e53ca8efcc5ec1a Christian Marangi 2024-10-17  105  	/* Check if IP is ready */
e53ca8efcc5ec1a Christian Marangi 2024-10-17  106  	ret = readl_poll_timeout(trng->base + TRNG_IP_RDY, val,
e53ca8efcc5ec1a Christian Marangi 2024-10-17  107  				 val & SAMPLE_RDY, 10, 1000);
e53ca8efcc5ec1a Christian Marangi 2024-10-17 @108  	if (ret < 0) {
e53ca8efcc5ec1a Christian Marangi 2024-10-17  109  		dev_err(trng->dev, "Timeout waiting for IP ready");
e53ca8efcc5ec1a Christian Marangi 2024-10-17  110  		return -ENODEV;
e53ca8efcc5ec1a Christian Marangi 2024-10-17  111  	}
e53ca8efcc5ec1a Christian Marangi 2024-10-17  112  
e53ca8efcc5ec1a Christian Marangi 2024-10-17  113  	/* CNT_TRANS must be 0x80 for IP to be considered ready */
e53ca8efcc5ec1a Christian Marangi 2024-10-17  114  	ret = readl_poll_timeout(trng->base + TRNG_IP_RDY, val,
e53ca8efcc5ec1a Christian Marangi 2024-10-17  115  				 FIELD_GET(CNT_TRANS, val) == TRNG_CNT_TRANS_VALID,
e53ca8efcc5ec1a Christian Marangi 2024-10-17  116  				 10, 1000);
e53ca8efcc5ec1a Christian Marangi 2024-10-17  117  	if (ret < 0) {
e53ca8efcc5ec1a Christian Marangi 2024-10-17  118  		dev_err(trng->dev, "Timeout waiting for IP ready");
e53ca8efcc5ec1a Christian Marangi 2024-10-17  119  		return -ENODEV;
e53ca8efcc5ec1a Christian Marangi 2024-10-17  120  	}
e53ca8efcc5ec1a Christian Marangi 2024-10-17  121  
e53ca8efcc5ec1a Christian Marangi 2024-10-17  122  	return 0;
e53ca8efcc5ec1a Christian Marangi 2024-10-17  123  }
e53ca8efcc5ec1a Christian Marangi 2024-10-17  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
