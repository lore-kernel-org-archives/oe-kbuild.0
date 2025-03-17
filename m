Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9314A4E0
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742219222; cv=none; b=Ti11lWxcBQuDzh7vRaoxsxZbefyGUDNVLkk4daGhD47/GjNPt4+Qaaq+m3DYFbe+8sfT3Nbqp+5/YqONRITSNTW8PMKvWZeQZLgqvnmZgaiW6rIKuchibPmh5Zob2TUMHY9Ru1OsDcfuyQAMrUXupOxqegW06a8vaEdpAC13GBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742219222; c=relaxed/simple;
	bh=OhhUM7M9yma/I654sqoyn0LZB52APkl+AVWAr25M3wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVzxgCo5Sff600OqpYo2uZOjqKykoBL7Ja4WGzlsHieQrq3UldKhqFzp4z2paHiftJNvKACetZCC4wyij/DMGxAfeXqOGtX/blqof4Uvk8cjopBGZEimrWe94UjLJTG6Dmzk/mmwdWd8/0/S/GE7Lvtd/S7WI6VzalKnXzj4EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0AOXk0i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0AOXk0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742219217; x=1773755217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OhhUM7M9yma/I654sqoyn0LZB52APkl+AVWAr25M3wE=;
  b=V0AOXk0isUTxITKBdS/gdDQT69CCD+6M26UkFdIQuNxQD62Vc6CsiEXq
   Q/J3uIcpq5V6dW9+k2Sqkh+sSlnlOSKniwPxX02wkCmShpQVjXioOR0yc
   fru2hmrK3E5Z+I7ZMa1V3qUp4ScTdY/gMwDsQr9z2b/LaA7g4HOML1hlO
   26lDvySihVrTDDNyKzSuA1zNBSICLVedHm4ilEg2ikRbVpE2k+QiJN/Zm
   304sEsVJvEPac88QamyvvfSUZzwWb+/uYQQbn9lM5RCGY3ZcjjA3XOzQD
   rKkTgnIKpDryiGqGvNt/tIXSM8ZraUPlZ9OGK4nZZIQo3r0uQlrIIBUVM
   w==;
X-CSE-ConnectionGUID: GTpb0Ag8ROuzbXIbX4Yr3Q==
X-CSE-MsgGUID: xSL6QrIqSKiYuJuM2pAbuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43048213"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43048213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 06:46:56 -0700
X-CSE-ConnectionGUID: ZI6NNFWnQqaLYA3nUdv2Wg==
X-CSE-MsgGUID: 0JIa4lrRQBSOtwxtIk277Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="152923641"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2025 06:46:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuAns-000Cn8-0j;
	Mon, 17 Mar 2025 13:46:52 +0000
Date: Mon, 17 Mar 2025 21:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <202503172111.ehFTuiuO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net>
References: <20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Crystal Wood <oss@buserror.net>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linuxppc-dev@lists.ozlabs.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-powerpc-Convert-fsl-pmc-txt-to-YAML/20250316-013002
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2%40posteo.net
patch subject: [PATCH] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250317 (https://download.01.org/0day-ci/archive/20250317/202503172111.ehFTuiuO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503172111.ehFTuiuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503172111.ehFTuiuO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/turris1x.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: localbus@ffe05000: cpld@3,0:ranges: [[0, 3, 0, 131072]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: localbus@ffe05000: nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: localbus@ffe05000: nor@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /pcie@fef08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /pci@ffe08000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /pci@fffe08000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8544-guts']
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e000a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e000a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: isa@1e: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-parent', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/interrupt-controller@20: failed to match any schema with compatible: ['chrp,iic']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/i8042@60/keyboard@0: failed to match any schema with compatible: ['pnpPNP,303']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /pcie@fffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: isa@1e: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-parent', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /pcie@fffe08000/pcie@0/uli1575@0/isa@1e/interrupt-controller@20: failed to match any schema with compatible: ['chrp,iic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /pcie@fffe08000/pcie@0/uli1575@0/isa@1e/i8042@60/keyboard@0: failed to match any schema with compatible: ['pnpPNP,303']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: isa@1e: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-parent', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/interrupt-controller@20: failed to match any schema with compatible: ['chrp,iic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/i8042@60/keyboard@0: failed to match any schema with compatible: ['pnpPNP,303']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/interrupt-controller@20: failed to match any schema with compatible: ['chrp,iic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/i8042@60/keyboard@0: failed to match any schema with compatible: ['pnpPNP,303']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/i8042@60/mouse@1: failed to match any schema with compatible: ['pnpPNP,f03']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000/pcie@0/uli1575@0/isa@1e/rtc@70: failed to match any schema with compatible: ['pnpPNP,b00']
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: cpld@6,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: board-control@5,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: serial@4,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: mram@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: serial@2,0: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /pcie@fffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: power@e0070: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /pci@fe0008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /pci@fe0008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /pci@fe0009000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /pcie@fe000a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /rapidio@fe00c0000: failed to match any schema with compatible: ['fsl,srio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
