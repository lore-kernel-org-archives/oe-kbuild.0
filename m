Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1C2594
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740983490; cv=none; b=osMTUpB58xqXfPtodsJEhrj8POwWJO2APyTMRa2gWv97QFe4GiCmzJOe+MJDIahse6HuucEGF6fsGBoZFNnrZ1fS0YtJ/wLv4gztACwLiokrFaFlgXZh0OMXjl7ycL14hi0Dj9PAitgV25qo3Jb3axqmTyTIAWpnFrSSiJTwJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740983490; c=relaxed/simple;
	bh=hiQ6rH/5fTH1UYDk4uOH3qTwSTWte4OSz+BWiw7sWRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1jPDyNLBSt7iZbQexckdmI63bE0m5XvW5HxGwuoljJsfz0CAnJ7x/Wq+rmw6leU6sXAM/aI6Yz/bzwgOIdj0RbdaSl3waAhNI5MHAh5irNNgTHlK1wYeWRKMf/lxF1F5O68Ou5EP72/W1A3idRGU1qbVkbd7q2pTgG8cEfezb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpoOWR2+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpoOWR2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740983488; x=1772519488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hiQ6rH/5fTH1UYDk4uOH3qTwSTWte4OSz+BWiw7sWRE=;
  b=VpoOWR2+9Kqo1uGX6ySY8JRzvmMiQl71g0z3g80wL3mUrglen/ch9GgL
   3BIySQbFHcpJA40MH/OcGW0bbE234EuUis+HKus3k0OPXYJrLmX6dG8cj
   l/o8hLahA/yDKfxKlpud+7meSO3XIeSSSkL5xnDVXLjySqjl/3xjZbE7M
   fhbdlrK1plNc5XGVIK+ALKseE0bhBFISHbCteND69x0DeTs2otPAHW7vI
   eFmSMpHMXNYLml0LxI3fSdsazLcCzy0Dtpk9HA8nc446o4QNDXaV3M5QL
   8Ri+gN8nlfH8NXqrfur3lNHiPvI4F/hlANUR0qyTHtOTv/89UPj5d0oxs
   g==;
X-CSE-ConnectionGUID: cCNEfZgrSoCtMThJCdb5Ww==
X-CSE-MsgGUID: Z73umGc2S/ibXOsafOxI4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41967129"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41967129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 22:31:28 -0800
X-CSE-ConnectionGUID: 1ppadrpfSbajPjpUfoLOCQ==
X-CSE-MsgGUID: 4i2l3XqUTUyOI7+H4/RwSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123065935"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Mar 2025 22:31:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tozKn-000I1D-0K;
	Mon, 03 Mar 2025 06:31:25 +0000
Date: Mon, 3 Mar 2025 14:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <202503031458.VyeBrCa0-lkp@intel.com>
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
In-Reply-To: <20250227170012.124768-10-marex@denx.de>
References: <20250227170012.124768-10-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: linux-arm-kernel@lists.infradead.org
CC: Marek Vasut <marex@denx.de>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Sebastian Reichel <sre@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Simona Vetter <simona@ffwll.ch>
CC: Steven Price <steven.price@arm.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: imx@lists.linux.dev

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.14-rc5 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-reset-imx95-gpu-blk-ctrl-Document-Freescale-i-MX95-GPU-reset/20250228-011031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250227170012.124768-10-marex%40denx.de
patch subject: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503031458.VyeBrCa0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031458.VyeBrCa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503031458.VyeBrCa0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp_table: $nodename:0: 'opp_table' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp_table: Unevaluated properties are not allowed ('opp-1000000000', 'opp-500000000', 'opp-800000000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/reset-controller@4d810000: failed to match any schema with compatible: ['fsl,imx95-gpu-blk-ctrl']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:0: 'job' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:1: 'mmu' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:2: 'gpu' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
