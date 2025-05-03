Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD329443
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746236029; cv=none; b=hoFpsZcSvzJalHV4R4eAT6mi/gH4U4jgvieTuEdRXxWWygQauam2qKCxnrIBEpQK1/a11ulp3hNzlekY2mBHt9ATbaIKz4s5y8WYVR2S9Vg0CzOEIseqTDPkNHBGC6DjD+Jz2wxTdH6Ph+GcUE5TqYY+Jt8yfyMQGqBO/AzrrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746236029; c=relaxed/simple;
	bh=HfYsrJQfP4i80tt4SZzz7tdLTB6oH7KLObgOIVAlpOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IebE1HJd4tVmAWaKnSwl6OH6eXH5pP4/PDHrwOagMmbCFgnFZC46cXihghv+HHZ71SjQbVm1dhQIsjJj1sE1nHXuyVLMGMsbAraVVQZr0KwxdV4mUFK3pmKIDt3jdyqYqj2KUDy8lSx2fIequlwsnXM5RcMGva/YJDVwfHFsjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1eNwoEE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1eNwoEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746236027; x=1777772027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfYsrJQfP4i80tt4SZzz7tdLTB6oH7KLObgOIVAlpOM=;
  b=Q1eNwoEE9uvAOAMDLUikj1kWv2pbOCL0lkkYmVvL8dms9kxVqx4G9Y7T
   MfhWwUPMW6+zSjKwXK6UWbGFliBvfG0UFAVwSEzZOqAV8MjznrY7OHmdr
   TSolwtQBw1g2LcINd2Gr2h6zHXOsLeCU2JqLt5dkcR79JumansuRDV3eh
   fdY7yxADi8ZbyknPWbTqqsnJP1tgWBs5+UCfJmbxN/+FC08xWLlrsZEul
   9wj8NviIYYm/1Q7XOtchauUCbcID1ZvvgcXpBJ0yge1PoMIdrYmIROMVx
   Jq1lBjhCEfiVZabIgX5SLHk0UAJfUovR8hST+h6q7FkO3WeZ29CwOzBkR
   w==;
X-CSE-ConnectionGUID: wIvDqu4jQPuNwhbmip9ARg==
X-CSE-MsgGUID: 87DNKSBiQQW3toYX1oGh2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48067774"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="48067774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 18:33:46 -0700
X-CSE-ConnectionGUID: LeBMOmqSRtyttB3MQM1Ulg==
X-CSE-MsgGUID: HTvZviVlSDi3y2Y1V4yhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="134740501"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 May 2025 18:33:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB1l9-00059F-32;
	Sat, 03 May 2025 01:33:43 +0000
Date: Sat, 3 May 2025 09:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 07/10] ARM: dts: exynos: Add rtc clock definitions for
 MAX77686 PMIC for Exynos5250 smdk5250
Message-ID: <202505030957.Ve1geKPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250425132727.5160-8-linux.amoon@gmail.com>
References: <20250425132727.5160-8-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 02ddfb981de88a2c15621115dd7be2431252c568]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-clock-Add-RTC-clock-binding-for-Maxim-MAX77686/20250425-213549
base:   02ddfb981de88a2c15621115dd7be2431252c568
patch link:    https://lore.kernel.org/r/20250425132727.5160-8-linux.amoon%40gmail.com
patch subject: [PATCH v1 07/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos5250 smdk5250
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250503/202505030957.Ve1geKPC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030957.Ve1geKPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030957.Ve1geKPC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/samsung/exynos5250-smdk5250.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
