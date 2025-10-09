Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33A84039
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 23:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760051874; cv=none; b=QZ0Mk8N7SVyWG2AK8miAUaM4sLQkss17WXDOUAPAiqRw//iVVJZAF0LL8n+J/pWOmgPzMICSlW60+HyuaAQKNFl90t9JyVa0Oe2+oa2nSpYYwC2yf16OMsnzBo1dESrstij1AfHvqZb/2fAdvh7D2mIKECMriG4AjijK6rzVGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760051874; c=relaxed/simple;
	bh=6MCw4GcCxntavOcA4RPX12zKlPQDeb5siCpah1yC5RM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ei4icvIqvm8OeLG/9G36zwhqza3296y8aLqFDh5bUNKssAg4jYnqLvo4wukBu5oZjUHVArMcNgzaAqBsqK2UpeHaim4WWI+EWZl1+s+3X2oDhb07hpItqqjQeRCYCZUe+oHSbti3GQ6M7Rteiql//1thxtU86K5+nDboqMqqUaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQ5q0nwM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQ5q0nwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760051872; x=1791587872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MCw4GcCxntavOcA4RPX12zKlPQDeb5siCpah1yC5RM=;
  b=GQ5q0nwM6mK3RFG3hUAV+mt+UpX0Fw++5Adr6LgqsrPiev6nBMULuccq
   HQLUNoCSCkLGCFOf+0oWFjvk4gb645pl9zB1qCoXBGle091gAgVuf23B1
   daC48qhqtqQN3rnfFvXbfLBYwGoFeLS8MDiKzXUuiVee0nbq87LtJsJC8
   TFhefjcH3xlk2Cq2lvf49hlBk5cu8HqZ14irGFPBQgtKpjjB4cygSUPIX
   hrb9k2/q7vzLTrf/7Um6p5+LRZVWvXzbCuPy4gLQ/8DVZWRVGXlwCj5lx
   Y0DO8+o/znaa1Yr9xnbMlGhNRY38AgN6BV3Rh41/iLPPkr/WGCDwpyO7U
   A==;
X-CSE-ConnectionGUID: J78TFyZ7SUirgdf/EWvdvQ==
X-CSE-MsgGUID: /7RAnJ4PSVicmaeDq8EQNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="61977681"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="61977681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 16:17:52 -0700
X-CSE-ConnectionGUID: E8y5hu8zSVqP+KlasjusGQ==
X-CSE-MsgGUID: S5dOC7mARAq1CIbUA92Mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180850867"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2025 16:17:51 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6ztM-000000008FB-15kP;
	Thu, 09 Oct 2025 23:17:48 +0000
Date: Fri, 10 Oct 2025 01:16:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:i2c/for-next 6/7]
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b10000
 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was
 unexpected)
Message-ID: <202510100139.LYy04Wrs-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
head:   fa7de93b129bfefe4c78603c0949470b8ee8625b
commit: eb4faf6343889fcd7edba3deeae49fc5a06531fd [6/7] dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-2053-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100139.LYy04Wrs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100139.LYy04Wrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510100139.LYy04Wrs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-crg', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/system-controller@8000000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-sysctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b10000 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/hisilicon,hix5hd2-i2c.yaml#
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b12000 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/hisilicon,hix5hd2-i2c.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: spi@8b1a000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
