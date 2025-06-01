Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE615ECD7
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748772108; cv=none; b=bzkVpAGGnG+z23PaCP7+lMgpXnbVFoCBjfMA23RViztxOuXZBrJ5gc8U4ZwnpbX1TKdcmcKcyxXT3hY+s4Yn9obdkKS+x+J/g0KtR82F/u9Nf34AI5I/nFXAkYv2DfukQr+ngcoMs6wu4AxRInlROHa15zjt4Xzz4Kgcid0tA3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748772108; c=relaxed/simple;
	bh=rT2qldoudLd/dVX9HdoEIqvTJCaETO7w73lk6H4jTw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gr/pLHazGLd6jdY+c55jqwqS5M71IjmLeuBD5G1EZ/n0ztRFkafHC4yhIuILouJAEFXs1kWSzpyV3SIho9mb80HPxQdBk+jN8aB6LVuLIMgAEQE78kB1U9eb8nXJ1n09y9Wi6rz8lFupmgZF85X6oTdX1cvCYngZNacSlkDETUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERMTrNEV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERMTrNEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748772105; x=1780308105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rT2qldoudLd/dVX9HdoEIqvTJCaETO7w73lk6H4jTw8=;
  b=ERMTrNEVofdMDOBENLUPis6chhstCaidXVzBE4+Z97CigCSp3on24Fj0
   5M/IyOOqGXXfJcN6HkLvUhy9yhmOiXnfmEL0dFl+b2Sb5GFnGwY4n3mlj
   jOLKcVnTkNRgG1tidJU0i16zwvGZLHhwSwFTfAAc6LGZuPKGNB8lvBfwK
   7/esBeV3qnez9Xhc5GL20uKO38bTCO+N+ILL2Sfvk/MeDjYaCy2NJVVdp
   lfxufUD0umK0hyoK4GgaW5HOL1jfsZQKmcA0xkILwnL+Jy7EY1XSssTdJ
   MLEERI5EO/fz4RqJqGGSpNGcRpb9uf7Dk8qmr2O8DSJZc1Rl9U4NePhDP
   Q==;
X-CSE-ConnectionGUID: 21uwXYcRRjW4Vv3AOj6s5w==
X-CSE-MsgGUID: Tq+KafxgQOChBISKwKtdCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50676957"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="50676957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 03:01:44 -0700
X-CSE-ConnectionGUID: zZ4AOkc0Qmij6H10nK5jag==
X-CSE-MsgGUID: fkFEgPq0QnqVp3rev+cc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="175169934"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2025 03:01:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLfVd-000YtE-0u;
	Sun, 01 Jun 2025 10:01:41 +0000
Date: Sun, 1 Jun 2025 18:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Define fallback
 compatible
Message-ID: <202506011708.JpAe80uD-lkp@intel.com>
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
In-Reply-To: <20250523184354.1249577-2-florian.fainelli@broadcom.com>
References: <20250523184354.1249577-2-florian.fainelli@broadcom.com>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: linux-kernel@vger.kernel.org
CC: justin.chen@broadcom.com
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/dt-bindings-memory-controller-Define-fallback-compatible/20250524-025201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20250523184354.1249577-2-florian.fainelli%40broadcom.com
patch subject: [PATCH 1/2] dt-bindings: memory-controller: Define fallback compatible
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250601/202506011708.JpAe80uD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011708.JpAe80uD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506011708.JpAe80uD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/syscon@3e2400: failed to match any schema with compatible: ['brcm,bcm7445-hif-cpubiuctrl', 'syscon']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/syscon@452000: failed to match any schema with compatible: ['brcm,bcm7445-hif-continuation', 'syscon']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/aon-ctrl@410000: failed to match any schema with compatible: ['brcm,brcmstb-aon-ctrl']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: gpio@4172c0 (brcm,bcm7445-gpio): interrupts-extended: [[6, 6], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memory_controllers@f1100000 (simple-bus): $nodename:0: 'memory_controllers@f1100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@0 (brcm,brcmstb-memc): $nodename:0: 'memc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.1', 'brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@0/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@80000 (brcm,brcmstb-memc): $nodename:0: 'memc@80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.1', 'brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@80000/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@100000 (brcm,brcmstb-memc): $nodename:0: 'memc@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000: failed to match any schema with compatible: ['brcm,brcmstb-memc', 'simple-bus']
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc-ddr@2000 (brcm,brcmstb-memc-ddr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,brcmstb-memc-ddr'] is too short
   	'brcm,brcmstb-memc-ddr' is not one of ['brcm,brcmstb-memc-ddr-rev-b.2.1', 'brcm,brcmstb-memc-ddr-rev-b.2.2', 'brcm,brcmstb-memc-ddr-rev-b.2.3', 'brcm,brcmstb-memc-ddr-rev-b.2.5', 'brcm,brcmstb-memc-ddr-rev-b.2.6', 'brcm,brcmstb-memc-ddr-rev-b.2.7', 'brcm,brcmstb-memc-ddr-rev-b.2.8', 'brcm,brcmstb-memc-ddr-rev-b.3.0', 'brcm,brcmstb-memc-ddr-rev-b.3.1', 'brcm,brcmstb-memc-ddr-rev-c.1.0', 'brcm,brcmstb-memc-ddr-rev-c.1.1', 'brcm,brcmstb-memc-ddr-rev-c.1.2', 'brcm,brcmstb-memc-ddr-rev-c.1.3', 'brcm,brcmstb-memc-ddr-rev-c.1.4']
   	'brcm,brcmstb-memc-ddr-rev-b.2.0' was expected
   	'brcm,brcmstb-memc-ddr-rev-b.1.x' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/brcm,brcmstb-memc-ddr.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000/ddr-phy@6000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-phy-v240.1']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /memory_controllers@f1100000/memc@100000/shimphy@8000: failed to match any schema with compatible: ['brcm,brcmstb-ddr-shimphy-v1.0']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: sram@ffe00000 (brcm,boot-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: sram@ffe00000 (brcm,boot-sram): '#size-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
