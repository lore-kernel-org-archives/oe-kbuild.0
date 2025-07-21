Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503DB19995E
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753128162; cv=none; b=NIEJFVHyS6pKi+/5qh2T4PYlc6CFN22fJRLU7teMJcewFH7+iBLJrlY1nEt3rtZWipZ/x+nll6HMHxxeBKeU3R72XlnPMW02IHAkR6ggScstp0OiR7AbYO833Tkp9ltv80i7Mgou6qavoLMpm145jAIr+bfNa9ZiPcysAOH/wT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753128162; c=relaxed/simple;
	bh=2fqt53ISqwVOVCugn5X4ScLIeCLc+oNmkLiIRfYoDMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJA5J5f01K5AcLqDXng2HrqS3/4ej8O75jTT+ZWJCVHIpUnXDJ96v+OTKEtrP38bODg4qu/4nfoC5FU3xIaq1RnH2bk4qYGpClyERZSIpS3KvjBBAVrZfwSAnqp34ckucEgekVb2TGSgahuljIU13JAlQjiMTLIKTsur5n9STlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+ZNbRp8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+ZNbRp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753128160; x=1784664160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fqt53ISqwVOVCugn5X4ScLIeCLc+oNmkLiIRfYoDMI=;
  b=g+ZNbRp8fFUQo8duS0Ue4E/2RvHtk6yChgG3kIq+rd2TmJFNNqp7D2WD
   2hp/UreMx2zqaLiOBsJr3G9CMnAs4+RBq02caliByzu21APc+JbG3nU+/
   WXeQRAxIOD3Jf5wTi0acJpWT4aQvnHnlBu1Pqr2i0J6hfqJ4ED/AEmRZ4
   srSGq8wvgsTqoXfw+H2/wuzaqdKq5ID7KwcU8FGkc7ALL0gEk2Nmf4npC
   2FsjyM7CLgMuoQCyQ+OWCwUhVnBI2sSCx7jClgKQRRcECMTIJ/GkilHuQ
   bEKjMb6klMxa9AZhdLHrNdozut4TrgmqKRRyWvxBlrmpcoSOVoARZKNgV
   g==;
X-CSE-ConnectionGUID: cH9Wna76Tk6N0UgIZeEXkQ==
X-CSE-MsgGUID: zY9FA637R2mMmuQ3nWc18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55239517"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55239517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 13:02:40 -0700
X-CSE-ConnectionGUID: u5A5jvu9RT66NpV7b/3ymg==
X-CSE-MsgGUID: vtUcGZKaRmGUVjVxS6fDvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="196016079"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 21 Jul 2025 13:02:39 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udwia-0001Qb-1p;
	Mon, 21 Jul 2025 20:02:36 +0000
Date: Mon, 21 Jul 2025 22:02:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-2 45/48]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb:
 spi@11030000 (renesas,r9a09g056-xspi): compatible:0:
 'renesas,r9a09g047-xspi' was expected
Message-ID: <202507212227.HWOPBOrm-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt64-2
head:   145a2a9e27562926c592645a05d682fe8e1f82e9
commit: 3b443f01b3dda8d9f95e97c14c17b4c15273dab4 [45/48] arm64: dts: renesas: r9a09g056: Add XSPI node
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250721/202507212227.HWOPBOrm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212227.HWOPBOrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507212227.HWOPBOrm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible:0: 'renesas,r9a09g047-xspi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible: ['renesas,r9a09g056-xspi', 'renesas,r9a09g047-xspi'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible:0: 'renesas,r9a09g047-xspi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible: ['renesas,r9a09g056-xspi', 'renesas,r9a09g047-xspi'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
