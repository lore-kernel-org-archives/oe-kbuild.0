Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5837F2E7BBA
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801069; cv=none; b=CHVpM2ylLq5gwfAtx3onv9q/pam3BbtJIF225D0F30ByYbb4So5jlSktdZUfWtJEFhQtZxT0FJqng4Q10p5jxOHMxNdb/EorCik62w+Eg9hxaufPfQIrDJDJHtCA7ORveOQEIqHpyAMmiDidfQARRvNW+w/lFsm3hCRdrLaTfh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801069; c=relaxed/simple;
	bh=qH2/wMbUXnXGymIQchhN12OgQN+V+QrYxuz9qmJgb08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ql+lFQ+FcPu8lIOmfy23q7pNib0NEkjR384COmRaL1PqKnK7qJDpSC1rBYf+P5jMRYl4N0UY0PZMIUvyEq7H3xcy9D6vSplOnIgYDkTI/P1jTA4546T1y6UiUdORxkLP/LB3/+djQCg87BUJ3upGgGsjWjKIf/h0hCjaNfWaNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVBhRQbg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVBhRQbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758801067; x=1790337067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qH2/wMbUXnXGymIQchhN12OgQN+V+QrYxuz9qmJgb08=;
  b=LVBhRQbgldlVWr/mMUsgVad6DRNihOLxUcYlDt87XtSP5845GFHjefRu
   hxYvNtFRCl8LjosIsFrBm27kVQrlvMcMjfno3dQkU481/JUy2WZ/2qLvo
   2tFPDPGSDGkH6q7qaH0OaSu1lt3+4Y54lwFRn3ytoLFQLRQmxwbpB85m1
   tgazksevRILk6VJ9qJQApRDTxHdlIZwBAT2ALwIQ+uI8R+7ez+ykfAxVO
   G8vZnkscyZot8JTmvW7HpZl/rPT8CPrsrqQpaclhs5ROB3prJcVhJI550
   SRDhLB2GUymY8ZGRFChpeyjNvws5t++OueAtMWihy5OtuHIGXVHFlp97Y
   Q==;
X-CSE-ConnectionGUID: ZgixpV3KR/ixhwky0jlM0g==
X-CSE-MsgGUID: 5WfJxZEjQRSQuvw3NoRXhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61165783"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="61165783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 04:51:06 -0700
X-CSE-ConnectionGUID: DFQ22whsS92JLaRTaXupAQ==
X-CSE-MsgGUID: VgfQNxpLTS+SzAYr79r6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="182577424"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2025 04:51:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1kV5-0005Bp-2c;
	Thu, 25 Sep 2025 11:51:03 +0000
Date: Thu, 25 Sep 2025 19:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 3/3] arm64: dts: imx94: Add OCOTP node
Message-ID: <202509251952.n1kTgDQU-lkp@intel.com>
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
In-Reply-To: <20250924-imx943-v1-3-0d32d7852ecb@oss.nxp.com>
References: <20250924-imx943-v1-3-0d32d7852ecb@oss.nxp.com>
TO: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
TO: Srinivas Kandagatla <srini@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Alice Guo <alice.guo@nxp.com>

Hi Alice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cec1e6e5d1ab33403b809f79cd20d6aff124ccfe]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Guo-OSS/dt-bindings-nvmem-imx-ocotp-Add-binding-for-i-MX94/20250924-180810
base:   cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
patch link:    https://lore.kernel.org/r/20250924-imx943-v1-3-0d32d7852ecb%40oss.nxp.com
patch subject: [PATCH v1 3/3] arm64: dts: imx94: Add OCOTP node
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251952.n1kTgDQU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251952.n1kTgDQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509251952.n1kTgDQU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: efuse@47510000 (fsl,imx94-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx94-ocotp'] is too short
   	'fsl,imx94-ocotp' is not one of ['fsl,imx8mn-ocotp', 'fsl,imx8mp-ocotp']
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: efuse@47510000 (fsl,imx94-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
