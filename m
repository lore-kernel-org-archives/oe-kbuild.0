Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAF3093DF
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 23:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766360609; cv=none; b=bV0nknb4p+2ObMWriOa6C1jIdI48tlLHqMM741PyZy9eIBNuu++wWUIaXtR5c+UfkvWIQHtJxJA3JRxt57Xg5DlZ8tRUye5Qb2e+QlL7lPkOUCB4R76GnTseUsGq1N+cjJzA7GDD7pWmpwCpKiHaxjdrc7vz42Ci500htgO7zH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766360609; c=relaxed/simple;
	bh=Xf5jZuIMCJ/q17cnhRx0PWXo1vUtXWn5RtWYTeASN1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tFEjwt6V28cRZV6vC7OIGEdxiA2nD/Edua4k+RBSk7Dkq7ovVGAoheTPG94VgYILG7CuiSXgbU7EInIsJelnYp3EfqrLbnHhziA5AzwBNkCHHEP+CnfksxOnTRpaY4H+cAGKxCoXBKsvPtHRhbRK+WtwPWPJtmXL/m4/+nwDIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjiaKATs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjiaKATs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360606; x=1797896606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xf5jZuIMCJ/q17cnhRx0PWXo1vUtXWn5RtWYTeASN1A=;
  b=HjiaKATsqp0RMX/aCJScTF3blavg5DYnAr4hX9XqA9BSZaVEsZ4zasE/
   7WDpRR5AQO0LXzKqPRleSHx8XFl5aGeLyjsbZOJCHIL99lbxCTTA7ftXE
   2MBfZlnNqa9bSmr/aOl4W554mIKQy7u5UXDbejLt3fTZ5zObymyQL3Bl8
   4vf0bgYkCenika7SoLE59NzyrIaH/38KmzRzWgxmEkRFH2f+oDpYMdO7N
   NhsNwrz10oIHBuRKjpnytSnpeVHW4LGrAqr4fV6uf6nSd2gHHp3t9D428
   H2eBMasYnwpRmGGj6Z3aqYsio79UZ13854rE6wspZCUv/kT4p1veeqgq9
   Q==;
X-CSE-ConnectionGUID: HtSsDsYUT8+Pw79w+3g/sw==
X-CSE-MsgGUID: EvQXBSYFStyd/iq6Ivhu+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68266482"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68266482"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:43:25 -0800
X-CSE-ConnectionGUID: YhMjUXsrSVKTcFDzYftEHw==
X-CSE-MsgGUID: 1HHTBJdYQf2XJ0ZWO3N/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198623365"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Dec 2025 15:43:24 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT57-000000000J3-3PWR;
	Sun, 21 Dec 2025 23:43:21 +0000
Date: Mon, 22 Dec 2025 07:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 5/5] iio: adc: ad7768-1: add support for ADAQ776x-1
 ADC Family
Message-ID: <202512220737.1ahHKy8N-lkp@intel.com>
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
In-Reply-To: <dab6e0ffc1a297d857f5a9c75184794c301d70f3.1765900411.git.Jonathan.Santos@analog.com>
References: <dab6e0ffc1a297d857f5a9c75184794c301d70f3.1765900411.git.Jonathan.Santos@analog.com>
TO: Jonathan Santos <Jonathan.Santos@analog.com>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Jonathan Santos <Jonathan.Santos@analog.com>
CC: lars@metafoo.de
CC: Michael.Hennerich@analog.com
CC: jic23@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: jonath4nns@gmail.com

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on daea3a394a8b425a2dd206ab09eb37f0d1087d35]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Santos/dt-bindings-iio-adc-ad7768-1-add-new-supported-parts/20251218-004832
base:   daea3a394a8b425a2dd206ab09eb37f0d1087d35
patch link:    https://lore.kernel.org/r/dab6e0ffc1a297d857f5a9c75184794c301d70f3.1765900411.git.Jonathan.Santos%40analog.com
patch subject: [PATCH v5 5/5] iio: adc: ad7768-1: add support for ADAQ776x-1 ADC Family
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-r072-20251222 (https://download.01.org/0day-ci/archive/20251222/202512220737.1ahHKy8N-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 789845e319bbf346d42ee2c0090a9b8e153797a2)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512220737.1ahHKy8N-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7768-1.c:544 ad7768_fill_scale_tbl() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +544 drivers/iio/adc/ad7768-1.c

a5f8c7da3dbee2 Stefan Popa     2019-01-31  533  
8ce4507474b53f Jonathan Santos 2025-12-17  534  static void ad7768_fill_scale_tbl(struct iio_dev *dev)
8ce4507474b53f Jonathan Santos 2025-12-17  535  {
8ce4507474b53f Jonathan Santos 2025-12-17  536  	struct ad7768_state *st = iio_priv(dev);
8ce4507474b53f Jonathan Santos 2025-12-17  537  	const struct iio_scan_type *scan_type;
8ce4507474b53f Jonathan Santos 2025-12-17  538  	int val, val2, tmp0, tmp1, i;
8ce4507474b53f Jonathan Santos 2025-12-17  539  	struct u32_fract fract;
8ce4507474b53f Jonathan Santos 2025-12-17  540  	unsigned long n, d;
8ce4507474b53f Jonathan Santos 2025-12-17  541  	u64 tmp2;
8ce4507474b53f Jonathan Santos 2025-12-17  542  
8ce4507474b53f Jonathan Santos 2025-12-17  543  	scan_type = iio_get_current_scan_type(dev, &dev->channels[0]);
8ce4507474b53f Jonathan Santos 2025-12-17 @544  	if (scan_type->sign == 's')
8ce4507474b53f Jonathan Santos 2025-12-17  545  		val2 = scan_type->realbits - 1;
8ce4507474b53f Jonathan Santos 2025-12-17  546  	else
8ce4507474b53f Jonathan Santos 2025-12-17  547  		val2 = scan_type->realbits;
8ce4507474b53f Jonathan Santos 2025-12-17  548  
8ce4507474b53f Jonathan Santos 2025-12-17  549  	for (i = 0; i < st->chip->num_pga_modes; i++) {
8ce4507474b53f Jonathan Santos 2025-12-17  550  		/* Convert gain to a fraction format */
8ce4507474b53f Jonathan Santos 2025-12-17  551  		fract.numerator = st->chip->pga_gains[i];
8ce4507474b53f Jonathan Santos 2025-12-17  552  		fract.denominator = MILLI;
8ce4507474b53f Jonathan Santos 2025-12-17  553  		if (st->chip->has_variable_aaf) {
8ce4507474b53f Jonathan Santos 2025-12-17  554  			fract.numerator *= ad7768_aaf_gains_bp[st->aaf_gain];
8ce4507474b53f Jonathan Santos 2025-12-17  555  			fract.denominator *= BASIS_POINTS;
8ce4507474b53f Jonathan Santos 2025-12-17  556  		}
8ce4507474b53f Jonathan Santos 2025-12-17  557  
8ce4507474b53f Jonathan Santos 2025-12-17  558  		rational_best_approximation(fract.numerator, fract.denominator,
8ce4507474b53f Jonathan Santos 2025-12-17  559  					    INT_MAX, INT_MAX, &n, &d);
8ce4507474b53f Jonathan Santos 2025-12-17  560  
8ce4507474b53f Jonathan Santos 2025-12-17  561  		val = mult_frac(st->vref_uv, d, n);
8ce4507474b53f Jonathan Santos 2025-12-17  562  		/* Would multiply by NANO here, but value is already in milli */
8ce4507474b53f Jonathan Santos 2025-12-17  563  		tmp2 = ((u64)val * MICRO) >> val2;
8ce4507474b53f Jonathan Santos 2025-12-17  564  		tmp0 = div_u64_rem(tmp2, NANO, &tmp1);
8ce4507474b53f Jonathan Santos 2025-12-17  565  		st->scale_tbl[i][0] = tmp0; /* Integer part */
8ce4507474b53f Jonathan Santos 2025-12-17  566  		st->scale_tbl[i][1] = abs(tmp1); /* Fractional part */
8ce4507474b53f Jonathan Santos 2025-12-17  567  	}
8ce4507474b53f Jonathan Santos 2025-12-17  568  }
8ce4507474b53f Jonathan Santos 2025-12-17  569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
