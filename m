Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924831DE4CA
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902518; cv=none; b=qN33fQ7DajVeFFKawt88rzTP9lfE9FFQSrIDPKULuGRIuEiQrnRmI8FNUCjOAO/YUXZZYx4Oq3qhmb+1Q3I389ZeTtE6dp4PrgWy48+vHlm5kZfT//E0lKVfTxeB9fam1YkEGRshWTS3pgKJYNwVicC4WV5Nr69nMz2Ci/zmqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902518; c=relaxed/simple;
	bh=PVH76adY41vDYCZB4CqlR073DYXi4diW1FCM2UuMTMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwb81wiSaHGsgTbl7b1PvdwX3ScCBahuEZM5itc9t/pT1sBRZv6eBx+3lTwaR0jljPC2PmYijRbMSU43LQ+sGFW90QUzQzcZNCzRGCL+oUVRZS5Y421pTnFAAWq0idZU6PuuXwLq3tkZEXG8pZj30RUuQ6Q/wj0GsprVPeoaVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU6kPpjO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU6kPpjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730902517; x=1762438517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVH76adY41vDYCZB4CqlR073DYXi4diW1FCM2UuMTMw=;
  b=hU6kPpjOLQ4GsT9jaDQVya4Zh1FLtdpMznHPqFUAbCutVrHmC8Amiie2
   2SLTFZE9U1w2BZxtRuCxiBQ0y5m52kESV5LTGYkSjfDLKZKBHg9O8NvLE
   JWFp5MBgYrx+sEujQLh6AfYxQ957qCigsuvKtII6eFRe7lbuQpNVuxvo6
   4U6XVzXXwuHrOZ5uRLqCJDqkXHhgHmggena6N/k010c1e90qMWkV2Ja6S
   rZtSNJT9McpCzDnMsNQJBWILFoCxyQD49LC6HLvs+1MAQrthJueRdJ8F1
   BEpr2tzmRruyNlCX+B4+H4k83Sb8zdOvrR9spALka9LPmpf7dj9JehG0B
   Q==;
X-CSE-ConnectionGUID: LGvHVXkaS46eqvH+uyJOzA==
X-CSE-MsgGUID: SLNWGekXT0Cj/xA+6eApIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42100953"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="42100953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 06:15:16 -0800
X-CSE-ConnectionGUID: 7xjP6kyORFy5MhsA5ezTzg==
X-CSE-MsgGUID: SnwMeR5tRUWvuJHy/7Ujzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84473492"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 06:15:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8goS-000oz4-2v;
	Wed, 06 Nov 2024 14:15:12 +0000
Date: Wed, 6 Nov 2024 22:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <202411062105.K9uCyyFT-lkp@intel.com>
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
In-Reply-To: <20241101070610.1267391-11-hongxing.zhu@nxp.com>
References: <20241101070610.1267391-11-hongxing.zhu@nxp.com>
TO: Richard Zhu <hongxing.zhu@nxp.com>
TO: l.stach@pengutronix.de
TO: bhelgaas@google.com
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: frank.li@nxp.com
TO: s.hauer@pengutronix.de
TO: festevam@gmail.com
CC: imx@lists.linux.dev
CC: kernel@pengutronix.de
CC: linux-pci@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Richard Zhu <hongxing.zhu@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus shawnguo/for-next mani-mhi/mhi-next linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Zhu/dt-bindings-imx6q-pcie-Add-ref-clock-for-i-MX95-PCIe-RC/20241101-150006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241101070610.1267391-11-hongxing.zhu%40nxp.com
patch subject: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20241104 (https://download.01.org/0day-ci/archive/20241106/202411062105.K9uCyyFT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062105.K9uCyyFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411062105.K9uCyyFT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/syscon@4c0100c0: failed to match any schema with compatible: ['nxp,imx95-hsio-blk-ctl', 'syscon']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[25, 87], [25, 36], [25, 35], [25, 88], [55, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[25, 87], [25, 36], [25, 35], [25, 88], [55, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
