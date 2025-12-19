Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648617AE11
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122884; cv=none; b=UbaKqPKsVmq2YN5bdnbGFAVIeeVy/N7DBTcZPUeowbbb0U7NVPcmRG307h0kqm/PoSMre9NSxv/NUKFDwQx4niIf7R3V3JG0vBh1P7lPBscC6a+UqIFwg0I2p2zMymX384Fd4tSWsCWnOlKTb1r7LmwRJuMRx2krDcgj3mOCPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122884; c=relaxed/simple;
	bh=X5ArFxZ/eRaAzyLYUO/dkAnWVUcO4Vp0dUw4DH+9A+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHtTpEt8objE9ksLIMrVqhyZzDiVBN83AD2GggrHq6uTZSdNnZ1+66fyM0U0FSzMLhf23IBSaONAfeGdR60DJBS5+K5rBiu/062pFP2L6RsRYS6F8FxCQwl3Ssc5ibIHVerL6vvNUSfv6/s1qOdPapd5VNXXE/G4tDa8JTBHDyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrbuDty9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrbuDty9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766122882; x=1797658882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X5ArFxZ/eRaAzyLYUO/dkAnWVUcO4Vp0dUw4DH+9A+E=;
  b=WrbuDty9pSkhhdl7xqSGc1xxQHPLRB2hzA7S8AKaN/Qe+8INhO+gVFBX
   dUjuXfyi1SAUf/OfupjmcDKTUfIWnX3WqTblNdObbwWcJ8AnSic8im39q
   +8kGSA8pfNCG4NnsUEAViuYdPfu9ye+0agAow6bFmXGsoBNRmxZWaQdjL
   weTK3J0OEFcrGJTvK/GWwG+bbSbzdUCUOhqizou0zismFmiAy/Ei696Cy
   Jn3rxvqsWy3jMTq8BXmHB1HDvhAN+2Jz3msvpdYXXCeAGxGgUeJCEc12Q
   SbSWp+dVugGax9KO208f6KIN4lqa55+5CTWU5kSWBls72/yfQmhqpJGTa
   Q==;
X-CSE-ConnectionGUID: Vflsm8KDRta+wMFR6K7hjw==
X-CSE-MsgGUID: eyc/ln00T2amYAGK9fRNYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68056336"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68056336"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:41:22 -0800
X-CSE-ConnectionGUID: GrBy1IPMT1ChDTD1agU3yA==
X-CSE-MsgGUID: 4wTNeIOyRtKC31M2LNHO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198691762"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 21:41:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTEs-000000004C4-0KpF;
	Fri, 19 Dec 2025 05:41:18 +0000
Date: Fri, 19 Dec 2025 06:40:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to
 YAML schema
Message-ID: <202512190633.w5khnb37-lkp@intel.com>
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
In-Reply-To: <20251212084657.29239-2-eichest@gmail.com>
References: <20251212084657.29239-2-eichest@gmail.com>
TO: Stefan Eichenberger <eichest@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: geert+renesas@glider.be
TO: ben.dooks@codethink.co.uk
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: francesco.dolcini@toradex.com
CC: rafael.beims@toradex.com
CC: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Eichenberger/dt-bindings-net-micrel-Convert-to-YAML-schema/20251212-165111
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251212084657.29239-2-eichest%40gmail.com
patch subject: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to YAML schema
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2051-20251215 (https://download.01.org/0day-ci/archive/20251219/202512190633.w5khnb37-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190633.w5khnb37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512190633.w5khnb37-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dtb: ethernet-phy@1 (ethernet-phy-id0022.1560): compatible: ['ethernet-phy-id0022.1560', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7790-stout.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7790-stout.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20 (adi,adv7180cp): ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): Unevaluated properties are not allowed ('micrel,led-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
