Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF61662FA
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720990; cv=none; b=Fn/Bjve/MiTUxVLnGqdHjHjA/YCPDZYUeodxzPZSSvTCCwjOO+Mjls4HaLNi8kKfhjOPEsGZA5w1mrYqDiBYbtaawhqCBZuA48U+VvWLReM9DfAM6vl7vR6N4zpELBfAfwZf0zFke3d7vBuVNi24Xb+Oncr3IURCAg6cJcrwiX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720990; c=relaxed/simple;
	bh=ZPUo7zXsg5jrwJJEN3/0eg0MpKNxsvGYmY7cJODJtFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njueXs5j9Oq1t7vkVkmYoTvYj/J01RvA7Xa32E5L25l3Ik6M58q1ugz1e/X1NCp1+7JUvYZFVaL0YjVkztSPAHLd7vGNdYKQoFtHFHRq/UVrs1b8gtD+B4iAg+8+qEjdXlqCBe8NytulfIGiOqeTt3sKKLLpLrCqe+F8SlXya7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhykxHOK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhykxHOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720989; x=1765256989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPUo7zXsg5jrwJJEN3/0eg0MpKNxsvGYmY7cJODJtFM=;
  b=bhykxHOKft4rtNmNb0WkEHxuH/vDTpBusgKREmJN6bGkMMctNXe2FXvp
   Bh7Dc9eUHdjZTRqdaz2t1w9sZlgwBATHsNHlOxFQFAvSOj2IPSudnZcmz
   lDNBPGEEf+d68KZdP1mtwI9Von/p7+tr9YE75TsnOdsuFHZ/TM46u6sdk
   liezy5/ROJi73b8xncZ0v2DoCCdFyyHinrkmVjqmWQmxUCtba0pTVVKR1
   eY8NvhiOVd6THopLl5SbjChoLUG2K098jNlR/SVnw2FJ6ySzmFksaY0k0
   JSWl2LwAtt2VWaWVNP5fqefT608fOn+iXpN9PSTzg473qdu2Fue7ruxVa
   g==;
X-CSE-ConnectionGUID: 9Y3+azLXSuG6AwTkQohJSg==
X-CSE-MsgGUID: OXRvHuWLRuefZOmkeTCLCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45383758"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45383758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: lJHd0SeMQhqk9gmzUOnoPA==
X-CSE-MsgGUID: frF+NXFKQaSa4As9XRGdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95053909"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yZ-2P;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error:
 uninitialized symbol 'ret'.
Message-ID: <202412091216.nj9gDyNa-lkp@intel.com>
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
TO: Peter Griffin <peter.griffin@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sam Protsenko <semen.protsenko@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 0b7c6075022ccff529318597dc6b165dd6a25c8f soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241209/202412091216.nj9gDyNa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412091216.nj9gDyNa-lkp@intel.com/

smatch warnings:
drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error: uninitialized symbol 'ret'.

vim +/ret +129 drivers/soc/samsung/exynos-pmu.c

0b7c6075022ccff Peter Griffin 2024-02-20   97  
0b7c6075022ccff Peter Griffin 2024-02-20   98  /*
0b7c6075022ccff Peter Griffin 2024-02-20   99   * For SoCs that have set/clear bit hardware this function can be used when
0b7c6075022ccff Peter Griffin 2024-02-20  100   * the PMU register will be accessed by multiple masters.
0b7c6075022ccff Peter Griffin 2024-02-20  101   *
0b7c6075022ccff Peter Griffin 2024-02-20  102   * For example, to set bits 13:8 in PMU reg offset 0x3e80
0b7c6075022ccff Peter Griffin 2024-02-20  103   * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
0b7c6075022ccff Peter Griffin 2024-02-20  104   *
0b7c6075022ccff Peter Griffin 2024-02-20  105   * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
0b7c6075022ccff Peter Griffin 2024-02-20  106   * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
0b7c6075022ccff Peter Griffin 2024-02-20  107   */
0b7c6075022ccff Peter Griffin 2024-02-20  108  static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
0b7c6075022ccff Peter Griffin 2024-02-20  109  				  u32 mask)
0b7c6075022ccff Peter Griffin 2024-02-20  110  {
0b7c6075022ccff Peter Griffin 2024-02-20  111  	int ret;
0b7c6075022ccff Peter Griffin 2024-02-20  112  	unsigned int i;
0b7c6075022ccff Peter Griffin 2024-02-20  113  
0b7c6075022ccff Peter Griffin 2024-02-20  114  	for (i = 0; i < 32; i++) {
0b7c6075022ccff Peter Griffin 2024-02-20  115  		if (!(mask & BIT(i)))
0b7c6075022ccff Peter Griffin 2024-02-20  116  			continue;
0b7c6075022ccff Peter Griffin 2024-02-20  117  
0b7c6075022ccff Peter Griffin 2024-02-20  118  		offset &= ~TENSOR_SET_BITS;
0b7c6075022ccff Peter Griffin 2024-02-20  119  
0b7c6075022ccff Peter Griffin 2024-02-20  120  		if (val & BIT(i))
0b7c6075022ccff Peter Griffin 2024-02-20  121  			offset |= TENSOR_SET_BITS;
0b7c6075022ccff Peter Griffin 2024-02-20  122  		else
0b7c6075022ccff Peter Griffin 2024-02-20  123  			offset |= TENSOR_CLR_BITS;
0b7c6075022ccff Peter Griffin 2024-02-20  124  
0b7c6075022ccff Peter Griffin 2024-02-20  125  		ret = tensor_sec_reg_write(ctx, offset, i);
0b7c6075022ccff Peter Griffin 2024-02-20  126  		if (ret)
0b7c6075022ccff Peter Griffin 2024-02-20  127  			return ret;
0b7c6075022ccff Peter Griffin 2024-02-20  128  	}
0b7c6075022ccff Peter Griffin 2024-02-20 @129  	return ret;
0b7c6075022ccff Peter Griffin 2024-02-20  130  }
0b7c6075022ccff Peter Griffin 2024-02-20  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
