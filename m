Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679EE276054
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 01:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754702949; cv=none; b=RXDEqXnCII3ihmSctk+p4J7IUAozqOgDRstbMSc8YcwSAV2zhXIsxer1zO2AvVhM5tmBeTX+MYXw9QT5L0S4puXfZU7nr+vP3LmWfowXsM2jij9T19msflzVNMwCa6T4y524HYKI8K7WLYCoFCp2xejPwallGEySnw2Kqi2PZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754702949; c=relaxed/simple;
	bh=wvPLoofST3CmWiGqt8EVRh9q0Rg98WOb4o1dumH/458=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzlVeCVi+/UGG7Oa3NJbpGSVWNZj/6LBUTWb44auBDuaGK1K2AvESwuf2l+ZD7arh0bYetSxM4gWk/4PQwuhQ+3Ul4zt/jR/qkjhKH7JHBwTOI56E4LSMVjhpI3OJyrFpaLe+EPjxfN9ehzIT7K+L0r/EfTASrlRbedoI+3d1l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfuXyCwK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfuXyCwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754702945; x=1786238945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvPLoofST3CmWiGqt8EVRh9q0Rg98WOb4o1dumH/458=;
  b=dfuXyCwKqzajD5AR5RT8oZxJzzOzIicxZ0038lESOW7IvSqQuR1tuYjU
   iHDDHS6adTv7pLrDxXlUry6tWs/jNqHcRJ/i22408HGAUAjDZdXXk8QA4
   INep7+Wy2duZFQQ3YdLhfUR086us1fJpfPuhMG3r9FkDBdUDJ3Eacffsx
   rvpiWWj8AFXBI+y3hjyBj8SmNuRuhYM0lJLkNWvf7sbhaHvb9ibPY3RW6
   gWCbR6xeDx+f/hOGbjdEWj8c6XwH95OQBCM0ORpYj+ABqLCBts67AWpj6
   /FsqZRA5jy9w1hQufULA5QfASFyDHGe0xzSk9gyg5YcutZIDJHhruWcyr
   Q==;
X-CSE-ConnectionGUID: QHqeK0VmQXyrxDfTvcMw5Q==
X-CSE-MsgGUID: QFEYx+muR/y2NfIfApNxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56951859"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56951859"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 18:29:04 -0700
X-CSE-ConnectionGUID: 7XuLLDOsSYWNGQt1vwnszg==
X-CSE-MsgGUID: 2vs/Ed7/RSa250BVK75mWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169571243"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2025 18:29:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukYOJ-0004Rk-1e;
	Sat, 09 Aug 2025 01:28:59 +0000
Date: Sat, 9 Aug 2025 09:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
Message-ID: <202508090913.PokMSAYC-lkp@intel.com>
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
In-Reply-To: <20250807214432.4173273-1-robh@kernel.org>
References: <20250807214432.4173273-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Scott Wood <oss@buserror.net>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on krzk-dt/for-next linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-powerpc-Drop-duplicate-fsl-mpic-txt/20250808-054955
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250807214432.4173273-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc-randconfig-051-20250808 (https://download.01.org/0day-ci/archive/20250809/202508090913.PokMSAYC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090913.PokMSAYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508090913.PokMSAYC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/akebono.dts:63.9-66.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dts:157.13-249.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: / (ibm,akebono): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): '#size-cells', 'dcr-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/akebono.dtb: /plb: failed to match any schema with compatible: ['ibm,plb6']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-v1.2-msgr', 'fsl,mpic-msg']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: sdhc@2e000 (fsl,c293-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: sdhc@2e000 (fsl,c293-esdhc): compatible:0: 'fsl,c293-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: sdhc@2e000 (fsl,c293-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,c293-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000 (fsl,mpc8536-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000 (fsl,sec3.0): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000 (fsl,mpc8536-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000 (fsl,sec3.0): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: crypto@30000 (fsl,sec2.1): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000 (fsl,sec3.0): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000 (fsl,sec3.0): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000 (fsl,sec3.0): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): Unevaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000 (fsl,p1022-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000 (fsl,p1022-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000 (fsl,p1022-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v4.2', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000 (fsl,sec3.3): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@25000 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@26000 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
