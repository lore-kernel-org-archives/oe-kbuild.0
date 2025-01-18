Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E535968
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 04:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737174745; cv=none; b=CYLQoSkTP7Yb0cbx4Irtrz2VB7MuaPPA9AmC8Q7nsGNk+o12A8CVth1Co2ldEaOOleGxiTub4hm3Zoxb+bV+mYJszwGTJXsjPGULCUYrxKjW54Wf5UC0wXE+IgN56mfM8alw0qHKw/F6wTem2doo1aTr5aG7s57U7CqAtPsBo9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737174745; c=relaxed/simple;
	bh=bqB/8o3fBEmGUJsXO2lKfnm/U6R9X4JXRuSOd+53HqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLXHsV15Q9uiR/D2sHPpN90KiQzREsuJ7NXd/4Shb78JCnM2oFEdRLzMm5UlvqP7hqrOijZWjMjUCtjDkxK1eVrHbBayn+sHKHpU0j3mm/kb+8lyE3/+oKLXBQwXPjUjFP2fuGLyjR96M+MTtPifNEr4/45WNxMsDTiKFM46dI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Utiqj+2d; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Utiqj+2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737174742; x=1768710742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bqB/8o3fBEmGUJsXO2lKfnm/U6R9X4JXRuSOd+53HqA=;
  b=Utiqj+2dpSZUXM6GFaEOi/1vh/oWVCk5S6wYepmB1WMHwr4s+G4NncjW
   l2v47X2NubfE0Een//BGl/BtD/x1l1VS50GJ+5zeAvgiX2cHvg4Ag0nyC
   +mpgCrjPlcKjVKzaTymbTJTfO7Hut+z9MREZVzPYBMSJqFNrbjNCrHk2U
   Msub25/8T5yzS7G4YvGYKsNm4xPY2y3g/pPn3fgR2FiFzCM0R7fHI5bH1
   tftNDM2yIRChhyunZfzlne/JL2z4Om7PZuLXI4DiHVEhb8a4pziRIfdyE
   4YJXRIHKwTiI0oEelkLiRkn5VbCSMir5O6x/eJvjau5q+lbs+moRZ3dFt
   w==;
X-CSE-ConnectionGUID: tPJVf/L/Sy+lh2Fa8X92+w==
X-CSE-MsgGUID: VKwjQcr4RuaWjIv5E60EWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48114303"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48114303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 20:32:21 -0800
X-CSE-ConnectionGUID: E8Og2fU4TkCtlLm3G0azcQ==
X-CSE-MsgGUID: YzyA8i6+T9iO/1OcU7ZGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="106549563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2025 20:32:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ0VO-000U5r-0h;
	Sat, 18 Jan 2025 04:32:18 +0000
Date: Sat, 18 Jan 2025 12:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/imx6 3/10]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000:
 clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
Message-ID: <202501181230.s2wFSA1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Richard Zhu <hongxing.zhu@nxp.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/imx6
head:   6dd24b0a858e64f9df596bf7cad2ddb436506f46
commit: d4627402bd04795b039cb652bf0c6792ad654a84 [3/10] dt-bindings: PCI: fsl,imx6q-pcie: Add Refclk for i.MX95 RC
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181230.s2wFSA1W-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181230.s2wFSA1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501181230.s2wFSA1W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
