Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B5157A5A
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196725; cv=none; b=StlX/ay8rojbnFvqXNcDXdJYkO9yRtmmnJ/eI2B2sp5UFusIbcDaI1zJ/hxKObRnQuigGwBFifn+Gd9kk9v003xrBuQaObjP9kKVgmwMAM3V3mF6/3iEVkaQ+sgWpv3FiYmW8BFVsRCKtMmNNI2ztd1i2j+h/mMuF/lgBGN3oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196725; c=relaxed/simple;
	bh=TI9eGwgPL3VXAur+dlO4d2AzeOxP4PmPH0tH6pgkcgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sq+SDDu5UcJjhT4qhokK7UssCAWtSmOz7nLvU4nVONt2tbxH/E7L3I/3ygA/dves5hKHG8WjnsUKVgABj5sLhn72KtqlpSHBphtbOQ0qWhCGZvCCMig5kcpVdbpBaE0XL0jEpHREoETjFpczqCDmBt8xcQXwQIrXwPieT8Lq7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWdku/YE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWdku/YE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761196723; x=1792732723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TI9eGwgPL3VXAur+dlO4d2AzeOxP4PmPH0tH6pgkcgA=;
  b=HWdku/YEyoOLcNm2juY8WQOxZgwKqheyfo+kaMSCWBUP1i964HttKg21
   H15BhHtVFHOEOEhB1nR9Qjdkq+9SAax73oNhGtNvpHbceDUZvRRwxwFX5
   sSOCsL7ZoJeZ1ST+8RntCupVdJBdPKZcTIH+73suqgRRKO7rw5ZpcGDcn
   YXKrLMHznxAGlsS06peo8GwDu5okWfyIpmOkCOv20NdaCyc8Q8jFTqXCv
   Cr9ZsE6lu+ie4ntHsedjsJuV9+UN07Dfe0zJuijMTPAmnct+aeFKJnul5
   CtKjg3anpk8oWrXuNOhSIHZatxuukQtKSS7ZImD509Glpv9BhvWzB02qZ
   w==;
X-CSE-ConnectionGUID: P0IyR0czTwma/T9avmqb3g==
X-CSE-MsgGUID: T9PxvioaRvySiUnF021EgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74702560"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74702560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:18:43 -0700
X-CSE-ConnectionGUID: YlST5IIhQKO/06gulpT7Tg==
X-CSE-MsgGUID: U6WSEHAtQQCCX45dhr0c2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183660021"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 22:18:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBnih-000D3R-2r;
	Thu, 23 Oct 2025 05:18:39 +0000
Date: Thu, 23 Oct 2025 13:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <202510231308.43vCHJXi-lkp@intel.com>
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
In-Reply-To: <20251022-fpg-nxp-imx93-frdm-v3-2-03ec40a1ccc0@pengutronix.de>
References: <20251022-fpg-nxp-imx93-frdm-v3-2-03ec40a1ccc0@pengutronix.de>
TO: Fabian Pflug <f.pflug@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Fabian Pflug <f.pflug@pengutronix.de>
CC: Haidong Zheng <haidong.zheng@nxp.com>
CC: Danwei Luo <danwei.luo@nxp.com>
CC: Lei Xu <lei.xu@nxp.com>

Hi Fabian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 552c50713f273b494ac6c77052032a49bc9255e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabian-Pflug/dt-bindings-arm-fsl-add-i-MX93-11x11-FRDM-board/20251022-222344
base:   552c50713f273b494ac6c77052032a49bc9255e2
patch link:    https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-2-03ec40a1ccc0%40pengutronix.de
patch subject: [PATCH v3 2/2] arm64: dts: freescale: add support for NXP i.MX93 FRDM
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-052-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231308.43vCHJXi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231308.43vCHJXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510231308.43vCHJXi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts:326.10-337.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: hdmi@4c (ite,it6263): 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: hdmi@4c (ite,it6263): 'data-mapping' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
