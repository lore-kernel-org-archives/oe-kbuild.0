Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8F713F00A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 23:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719529463; cv=none; b=AHRueyZQlg20+0Js1i/gmxpSyGc4PbzuJAwWts/X5kFUAeH04tnBfJ/LIcwA5BAffevOtllKah2FNJC99kTFhYce8sx53wwsKNkz6bXX3NGG+z6uVql1dL+fWbawPSldxZamRkUEoK7coZMF/TwmZhVcaGeXQsGkFplLiXCFqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719529463; c=relaxed/simple;
	bh=HPOAZmEPijdzM/i4ZyPK5yvKq6Uw0piS3Jfy4FRzxho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UeqEoj5huo23ujGbaQXO5Kzo+7TxIAHzBC1pQ+YrW9Q7yn0WwzSWKIBr5nJIYAh9LOY/y+25t/8yMtL9OHmbaRIN5omk0tRdYkT6/iXgyBUPqMKpYe6cO/H5ih9mKctq44GXJG2mHrFPmI6uMl1PrFEj224TKRZZW+B5c6d0Lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhHGI2mF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhHGI2mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719529462; x=1751065462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPOAZmEPijdzM/i4ZyPK5yvKq6Uw0piS3Jfy4FRzxho=;
  b=MhHGI2mFVBJG4vuaNsU27GFYJzZVRYGYrM6mwQO/U5z14R6cA+t31m+4
   gd90n0ub2rBZuwG51Gv67qRgrOLjMh9OvfY5KCPTk7HSMYwCsRpNLwdKU
   ffJIvuKSRX+zddmKdGQDggIV3jLXmh62z2cWMiBxdsOeoIyGoHJ7NE+Hm
   WbXnv3jaKlYq05Vcs8sY8CSMGg1l8aWJgUTLQjdH6cHpXUSVtHHnmlr7K
   W4votjvz00++u7ZEiFBrXY/P38XHFehjJ304Z1hTx0GwS/m48hvLV+CoY
   DGwvoE5K1zKOvNq5YWNtNl/3LoH+Bl1lCKtoyNN4VH1vn0VPEK+uhMU+X
   A==;
X-CSE-ConnectionGUID: Efy4VYcdSVa3WHJzFhfOWA==
X-CSE-MsgGUID: nwWgFq2NRUCOloRAQZZrpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16528727"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16528727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 16:04:22 -0700
X-CSE-ConnectionGUID: VJbratSWS3ybQv+GQt2B/Q==
X-CSE-MsgGUID: HSDI5E8IRg20nS1cAQMPqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44950065"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2024 16:04:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMyA6-000Gbm-0W;
	Thu, 27 Jun 2024 23:04:18 +0000
Date: Fri, 28 Jun 2024 07:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: timer@10008000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406280621.ek0cRhbq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d6444ba82053c716fb5ac83346202659023044e
commit: 5d3d723470996d3b9050a89427d9fc72cd0241e9 dt-bindings: timer: mediatek: Convert to json-schema
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280621.ek0cRhbq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280621.ek0cRhbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406280621.ek0cRhbq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: syscon@10006000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: timer@10008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: iommu@10205000: 'mediatek,infracfg' is a required property
--
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: timer@10008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pwrap@1000d000: 'mt6331' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/pwrap@1000d000/mt6331: failed to match any schema with compatible: ['mediatek,mt6331']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
