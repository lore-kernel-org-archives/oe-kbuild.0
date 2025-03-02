Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C24C81
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 05:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740892323; cv=none; b=YmlXQiLMrv8JMUrAfTXNDDPkOi1tUdof/bJsSXDFDYrUDi/NZ5K3UKH60CI3yk/RHKBNOUWGiItxZTzFRMlkuJtzeyYhY+ZilFB1FCYghXsnzCdtG+suMCc0Dg+e81Kz3KkCEIT0ufvJSCsPJqMFX/MgqVdN1PQ1iG6pczlyfmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740892323; c=relaxed/simple;
	bh=Y/xGzIzFglMsl7Ow2c9kLP0eokKOwSneDUR2CnZ/g+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCaGvmEdcGxaN4WbcS2rz/BVqnDIbpkKAkldj4OvJ9/uJD/LlDcfzJ4QHf1TuF48wiemM1pwFgSKq+wGwUtqmIa8VvePxCWBOzho+e/pxaHOb2SVDEeTwlFp5brk6sfemhOJsMjBQR9UId0qfBb4ktsr1AnJRHQB3/9DvI/5T3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcH34Qqc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcH34Qqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740892322; x=1772428322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/xGzIzFglMsl7Ow2c9kLP0eokKOwSneDUR2CnZ/g+A=;
  b=jcH34Qqco2q3o5QNxiYuC7szjFulW7l+7JWxZS7gZ08PP/KIJ91jXuKV
   uGB4ZKnMhicuW4eD/jqz21VDTswi37G8wIJHUp91U6xxBngT33Hyc4XPY
   EO4PPu7CYlU2I0dBmp9Pd70sQT5ANF9Rpa8HNjq4QNfW12JsLXYAP9F53
   NNYtTGdmlqfSk7hG98IoRJSMCzzKh1EQScq3gupk/ifjSDG7AokJ7WXYM
   w4ExWn90qo5uru/sFD5rP/LCyluzO/2XX7u7QgPKo9phn98MryECgpwds
   rviRgoJndn7QDYMIUusT3zKSYoA5+lHm3aOz6TE+L3bNhkUlxAqzNbUfL
   Q==;
X-CSE-ConnectionGUID: zrssuVzWS3iIkDeIVHeYfw==
X-CSE-MsgGUID: M4/KB5h2RK+FFAIf/5Sn7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="45706780"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="45706780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:12:01 -0800
X-CSE-ConnectionGUID: wcsCBCSnQTGpr4BF1viC7g==
X-CSE-MsgGUID: 7osYSBqjQbO0ToV1UGfUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117691654"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2025 21:11:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tobcL-000H5C-1b;
	Sun, 02 Mar 2025 05:11:57 +0000
Date: Sun, 2 Mar 2025 13:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] arm64: dts: imx95: add ref clock for pcie nodes
Message-ID: <202503021211.vj0unbai-lkp@intel.com>
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
In-Reply-To: <20250225170802.2671972-1-Frank.Li@nxp.com>
References: <20250225170802.2671972-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
TO: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
TO: open list <linux-kernel@vger.kernel.org>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20250228]
[cannot apply to krzk/for-next krzk-dt/for-next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx95-add-ref-clock-for-pcie-nodes/20250226-011210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250225170802.2671972-1-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/1] arm64: dts: imx95: add ref clock for pcie nodes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250302/202503021211.vj0unbai-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021211.vj0unbai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021211.vj0unbai-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
