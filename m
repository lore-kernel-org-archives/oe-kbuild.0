Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C611AE863
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734209546; cv=none; b=M8/Ff9M25phia4TyJ1TKTtbPfEz8CFSVAZ26MQ4+ci5GhZco+JBrp3oKfMQkp32j+Pm586z3OZeqERMm8Ax81UN8fsQAYwhUHYoHlLwcOyXoh/R4V2JJGx9Ar05AdfmrosgU9fwzk7tH+i9dpwWd/nHNl8Qk6Vrk94507SJUUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734209546; c=relaxed/simple;
	bh=bTPUA5ZyuAhk99yzvgTmgHRt8nMGqy+E03a03BjPfQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Le+78XE0wZzga99Oo2hhTLaAhdk5BR3qGHdPdh+IaBa+T/IRuOG1Oadp1N/VsxInGX8Lmm6UMCi9oYGYgNaEcKYQxYcXZb9Pp45918fV1XO06rc0Qnf+wedj/Z5H/QM/gvsSmPvNT5CvljRtf8WmISo2zDl1VxV8/IVAsI5/2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9cl9KTn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9cl9KTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734209544; x=1765745544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTPUA5ZyuAhk99yzvgTmgHRt8nMGqy+E03a03BjPfQI=;
  b=Y9cl9KTnONddWnVVu/3axHKAf9IuTA5dok06z3NDrW3Idl3BnxsugxqP
   iZWDiIBYeY2/zlrE6IFrSZN7a0sKT6YDPAuiheq9qXX5UqEuZeUhXpYXV
   6VDRg1cOrDd6byGKD1qvR33YicX3268vZzl0yMpc95zbqpJHJGtBegkYl
   8wSI2IS2KeM0DdRa5HbvQm4ZqCuKeGAL7vwRmF7X4d8swn+ko9r+AAsEo
   BDTYvB+iesCfGKJJ60RLeKxhRzpUVJ4t+PhGWdVyQeuu7WrgIdTm2N5bb
   M0Boc1DxOQ0M6aHaQwJzl3QAT9eY9+RWaq1TbxPr/z6sGcJsdRprhzwDX
   A==;
X-CSE-ConnectionGUID: ICB4P5Y3QRiYZD2xTHS3pg==
X-CSE-MsgGUID: oQlEt62iSq6Z2Qo78p1DQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34542566"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34542566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 12:52:21 -0800
X-CSE-ConnectionGUID: K/NBrTKaQ4uAVqFu9QtEhg==
X-CSE-MsgGUID: G0FcLtShSSislBphXHxq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97399865"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 12:52:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZ7a-000DDj-1E;
	Sat, 14 Dec 2024 20:52:18 +0000
Date: Sun, 15 Dec 2024 04:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error:
 uninitialized symbol 'ret'.
Message-ID: <202412150446.8DQaQnPQ-lkp@intel.com>
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
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: 0b7c6075022ccff529318597dc6b165dd6a25c8f soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241215/202412150446.8DQaQnPQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150446.8DQaQnPQ-lkp@intel.com/

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
