Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8922A2F2619
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 02:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787366036; cv=none; b=JGdBC/aHhSCYrMQI0/VqeH/WmrHB6RgjL3UfXdk9+EJ9nJhXxr3jX5txKVYJ7UG8/i8L8e8ojN0gMbDKjKryFehk3tKyUzWOD328tTVdiyumgt71yVMZvCUVBWQbqdvQpecjWjkByTLIRhDJn4VxLjYWciKkvSZxUbVQnHMfvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787366036; c=relaxed/simple;
	bh=vz/WYlGX1XGTySHxbq1YFNRe7tH4QIvDsLCTG5bKLzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s2hj6i5xceN679BZ3gkMg7nR6kM3jAg2zfL0n+/brdC30xd6zV/H0GIL8UeMAPUzuY+anHvTCHhWK3sAch3piiv1vvMZBb9XZFiIsXegE37iUvahvNBIec/MuilEumrjqZwKm60glHH7McTz8Fg9K45mv2CxhbIo40x29Kj8fko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dO9I/al5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dO9I/al5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787366033; x=1818902033;
  h=date:from:to:cc:subject:message-id;
  bh=vz/WYlGX1XGTySHxbq1YFNRe7tH4QIvDsLCTG5bKLzA=;
  b=dO9I/al5Pszi5FYj4YQA+bPDEfSrJcEpjw4xQtLvctyyFXlp2Vw8oPp/
   1lMH0ndkAHT5lI/mjXJnRd0CTCqmqi6fv8gmSIhxYvXIa3uTTcIddcvzH
   U95nIxjP2W2nyFe+rv7YNK3IHL8/loMQpnoe1s3EWavLof4xc8723g9SN
   PyltMDgf1etw+iruB449UGSLgov7svdJWxyLt2OnCWaQCbsznoAukTTyO
   ildGTWL7Iw1wCHJ3iqK1VwNi5rKbotx6myXaRe6Xc/dMdPP4WybDY70MP
   bYUKW0VB8nKBDgBM/SxlgW/o6phB8SucIftwEmJwPLU0Zb9y68AInxddA
   w==;
X-CSE-ConnectionGUID: GQoCb+FKRXixAt6Ay8VQKw==
X-CSE-MsgGUID: bR7hMhK+RQGeMJDEpLKbrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="75451800"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="75451800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 19:33:53 -0700
X-CSE-ConnectionGUID: ckyq+SWGRgS+czpPl1L8vw==
X-CSE-MsgGUID: FQWslewxQ/WvJIy7GtC9jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="304702630"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 19:33:52 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxbYL-000000007oz-1VaD;
	Sat, 22 Aug 2026 02:33:49 +0000
Date: Sat, 22 Aug 2026 04:33:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608220400.bdzi2eGx-lkp@intel.com>
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
commit: e98d5f01a20071b39847b1de89c3454d5e00eb90 arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260822/202608220400.bdzi2eGx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220400.bdzi2eGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220400.bdzi2eGx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 107, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', 'phandle': 243, '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00 \x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-aud-io.dtb: connector (fsl,imx95-19x19-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: connector (fsl,imx952-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx952-evk-aud-io', 'fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 71, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', 'phandle': 173, '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: connector (fsl,imx952-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: connector (fsl,imx952-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-aud-io.dtb: connector (fsl,imx952-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
