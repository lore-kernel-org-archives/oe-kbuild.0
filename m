Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6773D88F2
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348989; cv=none; b=NK4B0w4yuM3w4iyPxsvy9XCUYNdx0OL6qMmpJ7wruL2YbbuNa+ZHE1JMbdqM8UMt4lP3ocE1VDMojYmmI4rtxSCQvYDu9uggxq0e0hXhkyOOSIetg8PmqF1P9FgNMXKs+oh4PUn/Y7bH5XfjoIbwtpPXAvqdVuAGw3I9IFQH+A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348989; c=relaxed/simple;
	bh=E8yxylh2McAgjzp6BW80XOgyPyPH9KgncYFaq9T69r8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qFtUfwv12MNdIDya1QwMmIGjFkHEsiKQB/UbUG0ebdVZ/N2/kYC0zsaGtjV1KIejJWR+GuTwQAjYKQ/KucZopRD1ilKbD1KbX+m2/tfUhf7YDRmy7YoBiZPn75IEBgchpjG5mzuTzPvG/qk0zjWB2C4T7bndmJUso7e/jEGPSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrNHti/U; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrNHti/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787348987; x=1818884987;
  h=date:from:to:cc:subject:message-id;
  bh=E8yxylh2McAgjzp6BW80XOgyPyPH9KgncYFaq9T69r8=;
  b=YrNHti/U7hVzrb3jyXllgurQN3tbiSS6kHze/pWBwEk5T1NxFUkqDQkZ
   VqS/MP4hJXnPmeCbGnh+zGoDkDYvl9ATtZyF+XtblgdDZ5iiEl8LPa20I
   KECA9hkQp9/1tfjFN4j61uZNNUxQqJ1hR4faPU9enMFumnsS3YXHgaanA
   khfEEgVJCgFy+gGBswIMTKKs3CZwfFIINWTM7pa0T4Xlp+31pKxEKFU5D
   q7qbSNfTCScXW9Frs+IbEAwRD1hBatTvbX/P2nxv2NuFrsXP8c6SNSsgs
   yJqZPH8FxI+XvKmYEHi3rMCNxtRPPGOIGDyDElDCKYlj5Nl2benjfK50d
   A==;
X-CSE-ConnectionGUID: yhPvlLB3SQyrUx8gfIHY1g==
X-CSE-MsgGUID: 27RahweASWO1M7tm3bZS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87823456"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87823456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:49:47 -0700
X-CSE-ConnectionGUID: O4dJOyeXToiOPj38zr725Q==
X-CSE-MsgGUID: RCRSJnE9QVKb2lNBssixFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="296360111"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 14:49:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxX7P-000000007kX-3EWP;
	Fri, 21 Aug 2026 21:49:43 +0000
Date: Fri, 21 Aug 2026 23:49:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: connector
 (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible':
 ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2,
 'gpio-map': [[0, 0, 107, 8, 1]], 'gpio-map-mas...
Message-ID: <202608212343.mD1VKEgC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chancel Liu <chancel.liu@nxp.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/chancel-liu-oss-nxp-com/dt-bindings-connector-Add-fsl-aud-io-slot-binding/20260813-144309
head:   e98d5f01a20071b39847b1de89c3454d5e00eb90
commit: 54df942e0eeecc3e26a4273720039a48ea151ca8 arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260821/202608212343.mD1VKEgC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212343.mD1VKEgC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608212343.mD1VKEgC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 107, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', 'phandle': 243, '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:68.18-71.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 108, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 107, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', 'phandle': 243, '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 107, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', 'phandle': 243, '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
