Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC713845C8
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610653; cv=none; b=JL/8kpyIDHKn5zzU9/cETUDmUCRo0U8jws3Xb1ihG4qj1Abk6Qn8pi0sY0ghMBP6/mttdwduXYGskCg/84N2TTc75mr4FW2E8JYXgXGZI3EDoLvZzfy1eMnhVo7xE/FjNpWiknp8Xi+bYTxKErcFWqfx5M6ZFM9raaH5xPU5DhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610653; c=relaxed/simple;
	bh=eCGyARZDBOKSAGWXsrSxTpkEikcv9DvShqfAVwhX6Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CisKVRJ4guJ+mGSB0aISIK03JWNqcjPaOGQxg+RswABZiN93oWAmQV1yTjlmlITgiQOqF4ekFWVNgUn7Ogq0TovWup2PHCdF/UJxU7U+Yq5ABejaUVzx4m7UcSheC3GYwtM1nGBIpQjzfjnxaBIciwP/o9/zk/Ejy/p5WAdbqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGtARaEr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGtARaEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772610630; x=1804146630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCGyARZDBOKSAGWXsrSxTpkEikcv9DvShqfAVwhX6Go=;
  b=eGtARaErUo6keDQv03bx28COykIGU8LWCWIwZRr9ZCrgOYiOXXYgqk8t
   1wz3Re8DM2FCNP1+z1QC0aUOj/QRe9cPbF6+sT0VI1EdIBh/X1GSkm60c
   ei08wCnEVITwbU+SRFJMGW8OXIXemsjQh15AAbsDNkfgY1N31KQNhmvB3
   AigEykHnuYVjaArKRycsJph3wuIy6dolfg/QI6/JbcsjcMR9DVAJU1J5A
   yiJX9Czq8wRwhU5+Wey2kMJVnNcaQHgoILc2A5OFGz5D98QpcH7BShy42
   edFDqqgGhoxctmr5vydFYJXNawZN12qqyBNTF9CJ3q0gH+oChqOSgYsX/
   Q==;
X-CSE-ConnectionGUID: /xc4nJIzSm6FgznOFvGgrw==
X-CSE-MsgGUID: HfYYl384S6K6HytKNjaBIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77533615"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="77533615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:50:29 -0800
X-CSE-ConnectionGUID: Upkah1YfTwCpKifTz3nLQQ==
X-CSE-MsgGUID: 4hfibAnMRlWvWVY/X3+uIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="222428601"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2026 23:50:27 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxgzw-000000001e5-1jDL;
	Wed, 04 Mar 2026 07:50:24 +0000
Date: Wed, 4 Mar 2026 08:50:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202603040852.A02YPw7U-lkp@intel.com>
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
In-Reply-To: <20260303092006.263715-2-a0987203069@gmail.com>
References: <20260303092006.263715-2-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: peppe.cavallaro@st.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-Nuvoton-MA35-family-GMAC/20260303-172422
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260303092006.263715-2-a0987203069%40gmail.com
patch subject: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260304/202603040852.A02YPw7U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040852.A02YPw7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603040852.A02YPw7U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clocks: [[8, 26], [6, 3], [6, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): reg: [[0, 4257218560, 0, 65536], [0, 4261560320, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): clocks: [[8, 26], [6, 3], [6, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): reg: [[0, 4257218560, 0, 65536], [0, 4261560320, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: ethernet@fdc00000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (unit_address_vs_reg): /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (simple_bus_reg): /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clocks: [[9, 36], [9, 2], [9, 13], [9, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible: ['amlogic,meson-axg-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (unit_address_vs_reg): /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (simple_bus_reg): /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clocks: [[9, 36], [9, 2], [9, 13], [9, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible: ['amlogic,meson-axg-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (unit_address_vs_reg): /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:353.33-1254.6: Warning (simple_bus_reg): /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1601.30-1708.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): clocks: [[22, 36], [22, 2], [22, 13], [22, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): compatible: ['amlogic,meson-axg-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: ethernet@ff3f0000 (amlogic,meson-axg-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): clocks: [[3, 36], [3, 4], [3, 15], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): compatible: ['amlogic,meson-gxbb-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: ethernet@c9410000 (amlogic,meson-gxbb-dwmac): reg: [[0, 3376480256, 0, 65536], [0, 3364046144, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clocks: [[5, 185], [2, 3], [2, 29]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): compatible: ['amlogic,meson-axg-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): reg: [[0, 4257218560, 0, 65536], [0, 4261560320, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:143.34-587.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): clocks: [[5, 185], [2, 3], [2, 29]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): compatible: ['amlogic,meson-axg-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): reg: [[0, 4257218560, 0, 65536], [0, 4261560320, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: ethernet@fdc00000 (amlogic,meson-axg-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): clocks: [[2, 38], [2, 2], [2, 13], [2, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): compatible: ['amlogic,meson-g12a-dwmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): reg: [[0, 4282318848, 0, 65536], [0, 4284695872, 0, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: ethernet@ff3f0000 (amlogic,meson-g12a-dwmac): Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
