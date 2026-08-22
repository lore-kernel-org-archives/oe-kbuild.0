Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA5DF72
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 00:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787356916; cv=none; b=KAGxLSr/uMjQ+kxFG3SXRVAqI4aAJ9V4Skayd7LKUEbeabevhZT8l/j3eW7aIyoklJhi/G33Uad16u81Y/jdYQhmWS3J5E8RYQhlex6qBsCrVp4Lg4ZsuQNr+iwWxFHae2dshojjZLMp9EbuCOp8FSFpIZFazVR+sFY826V7X8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787356916; c=relaxed/simple;
	bh=z8EC8T/7hErj7rfigxu8Qmcqku6G3IS6TMSr75rP/ZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CL+b52HfxVMzNfpZ+EfhGV41hrfZQ+nWjgRWKoxFuTI+7XaYHTPJfvZqQ9EN8ZKv4oStutFkglCNY1fqPWQhXHskJScL5v5/DqcFJ7YOdRP/zOnMT8lSC9wHClJThVOAauTpZrd5ORRVZFKcVs+bYkbJznou4OhEVa4YLZFRWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgGeaN4R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgGeaN4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787356913; x=1818892913;
  h=date:from:to:cc:subject:message-id;
  bh=z8EC8T/7hErj7rfigxu8Qmcqku6G3IS6TMSr75rP/ZA=;
  b=ZgGeaN4RTUIR3DAtYHL71tbrXYi7nrIP7lL0DX0Ygp3296xS8lIm4YkA
   v2d+wTF39eZv7TP31B5/rKn2cGrlIj+/Y3HItJsFTSGuhdw/9hi8hfAr+
   u+VeXGCBOfNFbXY511d5iCIbwmFuUej6VidiVE3MM06ZJwHfUaUVMNehw
   hesm5V8CF/DjEZ2Hoivgz4FqZOx6ZMaL/Zocpkeux4rOJVE89Vctne+RO
   /wuu7xQsc05zwhZ85RlidP+rQypEmSQDuUyvbbrz04E8q2qFdoR6ZN5sq
   u4M3JL4OwbH3VKIbPKHuPS5rlZ97nHpHR8qc3wMw49aL1zd+VZMljzseu
   A==;
X-CSE-ConnectionGUID: Qju7DF4sS7mzwc/nFtICXw==
X-CSE-MsgGUID: UTVijKSITGmWWb/B1VQyGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110695527"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="110695527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 17:01:52 -0700
X-CSE-ConnectionGUID: DW9BUcRERiSSQc1DNWX0Kg==
X-CSE-MsgGUID: UDf1BSeCQG+haxLZ+3FJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="268433717"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2026 17:01:49 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxZBD-000000007nA-3TVD;
	Sat, 22 Aug 2026 00:01:47 +0000
Date: Sat, 22 Aug 2026 02:01:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx952-evk.dtb: connector
 (fsl,imx952-evk-aud-io): False schema does not allow {'compatible':
 ['fsl,imx952-evk-aud-io', 'fsl,imx95-19x19-evk-aud-io'], 'gpio-controller':
 True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 71, 8, 1]],...
Message-ID: <202608220150.nauAzI5I-lkp@intel.com>
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
commit: b174f99754981d3bb971ddd9ad4a83b2efae0c36 arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260822/202608220150.nauAzI5I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220150.nauAzI5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220150.nauAzI5I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx952.dtsi:343.6-1534.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: connector (fsl,imx952-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx952-evk-aud-io', 'fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 71, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': b'\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00i', 'clock-map-mask': b'\x00\x00\x00\xff', '$nodename': ['connector']}
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: connector (fsl,imx952-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: connector (fsl,imx952-evk-aud-io): clock-map: b'\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00i' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: connector (fsl,imx952-evk-aud-io): clock-map-mask: b'\x00\x00\x00\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
