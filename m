Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEC11713
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192859; cv=none; b=uIhngcO+J86SJ7xhHzL0jxaYUb07i7KGXehIJnvd+haiEk54ULchLj9C8b/YfI6BGCYuxdM2lFEB1Y0Mr5wm+u+v+zSBmXgp4gavsDL7ZvSgXG3NwcKv6DQ1ABIB3zg88kT8SMpyHElZB1OlM4GpYvBJEGlsBQpn3CJbp2DZgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192859; c=relaxed/simple;
	bh=GfpjJh2yVHmehObZg8qOxG2mcknmUD5z0FFOw7Mdm68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecqsH2YmAqaiNIcGx5VfLmk01JkGiFP4qgrbAidoRcVFv5K1Rsovbfaq8EzbYJXRIOYQ+tIKnpqWoAYDz1e5TkdVGEuCLlaOIwxGc+ICLkGKRVfaMhivYqxBlk7ZGrnyaFpkxLwooZY10lNYX5lXe9RaBQRWP+89oR6b0K18gaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8g1nxBa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8g1nxBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746192857; x=1777728857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfpjJh2yVHmehObZg8qOxG2mcknmUD5z0FFOw7Mdm68=;
  b=N8g1nxBaU7N3RV2s9LC8o3fnnumqPZc9FKQcBaUfXdckP1ZljpbTzYgw
   CI6Z0ltq/f33pMOZkI8lqWJAeOuUPD5gVIsdXOn5qCy28OswzxCJtP0vl
   Pqf+YJn4iwGYBAiKsAQnE6hWFk5Qtz0uDwHxB7v+TfC7Uw1IOumP000/l
   4FRTpQZSwTR8/dtc2RdPbrEyYPVOIBwZSEgT8EZRiZ9WP4Egx/P63U+rh
   Fyav4kDnKkssxRebcvB0q8i6Lht+eE6DKdNhowkdsb5EyYc7DinR919b4
   h5dgKd00F6d/m+Z+6salF+s5MrlPL5/V4gUTkRqY+Y9fn0cy6O8ta3mJG
   g==;
X-CSE-ConnectionGUID: xB3LMZSHQnqnISO2JBaCnw==
X-CSE-MsgGUID: P/SNmCFQStOQG++F05/9LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58496838"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58496838"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:34:17 -0700
X-CSE-ConnectionGUID: 6wuetqa+TdKkKHWsJ5c4wA==
X-CSE-MsgGUID: ji1k9UGwQnalyqv/QPbrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="171887785"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 06:34:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAqWr-0004mP-1S;
	Fri, 02 May 2025 13:34:13 +0000
Date: Fri, 2 May 2025 21:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 05/10] ARM: dts: exynos: Add rtc clock definitions for
 MAX77686 PMIC for Exynos4412 p4note
Message-ID: <202505022148.52gEO826-lkp@intel.com>
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
In-Reply-To: <20250425132727.5160-6-linux.amoon@gmail.com>
References: <20250425132727.5160-6-linux.amoon@gmail.com>
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
patch link:    https://lore.kernel.org/r/20250425132727.5160-6-linux.amoon%40gmail.com
patch subject: [PATCH v1 05/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 p4note
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250502/202505022148.52gEO826-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022148.52gEO826-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505022148.52gEO826-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
   arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@c' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fuel-gauge@36' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-p4note-n8010.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
