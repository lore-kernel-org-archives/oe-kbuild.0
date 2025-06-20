Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A7101EE
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415704; cv=none; b=r/r3f+ZOFDvm5qXHBAtavjexqfn0bydmoQVQv9JmEti3doish4bMmp8y9G0sFFoRT5SDwskvWr46ceT9ws6UYGLI5azl+26y7bOAka1OfimZQUEXYL+uBYn1HP0cf65YknIxCRCSKm+hQ412EtuEKjTHE29Gan9lGQx4Q/H+Vyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415704; c=relaxed/simple;
	bh=Ta3FbyEhOC3pmnU8xmYG1EAg9eIQSvurb5lwzIPSNOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcTkOyZS9chq7PlA2Vh6ydXYx81LvHP8DXGjKowsATCr0Q0TscDoUYqn+tq2wJGdqq0OmKw53pvGnHRYgFYvXqhkk8OMdyXaHdRIExod28IjmRaRjMorEOrTHM572bgEiI5cTHjln3dsP5VJMVIorcQ8WTTNaEVPx2Nid5PXoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i40Qg7eJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i40Qg7eJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750415703; x=1781951703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ta3FbyEhOC3pmnU8xmYG1EAg9eIQSvurb5lwzIPSNOs=;
  b=i40Qg7eJdsYQWkFelaRmff80uGnbra+wP0qWIUcWqQm528I0zTze0HwZ
   lpKCpokyWuyaLQ5i1rJJsNkeiCnKED56yc/jA/9txsbxFbY1p6pk16uPv
   euQtULjS5G4O7s9uVXSWnXSxJJS32tcXxGfGoJNfv6TDnaO6z+JWHQLJJ
   9PlPUOv8WgbVYDH943trkPdG4zd7RMQM3MUDxlrX291SCfV/a1LCe6gcK
   npinhTNW/hHnRGGch9a9sJVQ8GxFYowuGfJl7YTifMyzx9VO3NBX2iToO
   4iifw0EArYZN6kus8r7kRI6ZiM5YTSX279FHyTGCqSSSb5CJIgJBRJa1z
   A==;
X-CSE-ConnectionGUID: jP2TgveDQoagZLVLxZsrtQ==
X-CSE-MsgGUID: uTs92iHSSYenj8XCuMcSmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63726176"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="63726176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 03:35:02 -0700
X-CSE-ConnectionGUID: fqTWUKQ9TGyINhLiGJ2ToQ==
X-CSE-MsgGUID: ckltyZn0TIGBrP2Nsg0/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150473756"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jun 2025 03:35:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSZ5G-000Lcw-2x;
	Fri, 20 Jun 2025 10:34:58 +0000
Date: Fri, 20 Jun 2025 18:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3438/3877]
 drivers/pinctrl/pinctrl-aw9523.c:658:1-7: preceding lock on line 642
Message-ID: <202506201841.imLBtvxC-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c923c845768a0f0e34b8161d70bc96525385782
commit: dffe286e2428a32bf5a70648d22a678b83080414 [3438/3877] pinctrl: aw9523: use new GPIO line value setter callbacks
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r051-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201841.imLBtvxC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506201841.imLBtvxC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-aw9523.c:658:1-7: preceding lock on line 642

vim +658 drivers/pinctrl/pinctrl-aw9523.c

576623d706613f AngeloGioacchino Del Regno 2024-03-01  627  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  628  static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  629  				    unsigned long *mask,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  630  				    unsigned long *bits)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  631  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  632  	struct aw9523 *awi = gpiochip_get_data(chip);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  633  	u8 mask_lo, mask_hi, bits_lo, bits_hi;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  634  	unsigned int reg;
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  635  	int ret = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  636  
4210ef801a2482 Andy Shevchenko            2024-03-29  637  	mask_lo = *mask;
4210ef801a2482 Andy Shevchenko            2024-03-29  638  	mask_hi = *mask >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  639  	bits_lo = *bits;
4210ef801a2482 Andy Shevchenko            2024-03-29  640  	bits_hi = *bits >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  641  
576623d706613f AngeloGioacchino Del Regno 2024-03-01 @642  	mutex_lock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  643  	if (mask_hi) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  644  		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  645  		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
091655b9285d83 Andy Shevchenko            2024-03-29  646  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  647  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  648  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  649  	if (mask_lo) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  650  		reg = AW9523_REG_OUT_STATE(0);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  651  		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  652  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  653  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  654  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  655  	mutex_unlock(&awi->i2c_lock);
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  656  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  657  out:
dffe286e2428a3 Bartosz Golaszewski        2025-06-12 @658  	return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  659  }
576623d706613f AngeloGioacchino Del Regno 2024-03-01  660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
