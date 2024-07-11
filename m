Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E616CD31
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720713455; cv=none; b=apOsQLaGfQ2bpPq8VmkxLkYReIUXJTHjRSxiN+cSp7jZ+I4oyTIGxEE93zPDyqumFhrOaXCrUkg1n6MCli1+C1NI3fdZnwrS3glzejTLGF8+xPJf1vmdE4h5hR+pg/dV3HWPJ+SS4KnPiB2aDOqDchU/ZFODrqbhhv5qGa18neg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720713455; c=relaxed/simple;
	bh=I8+AhPQLA9ls0gWmik3FbSxuvCKKvP+CZMnEDQIM/A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElUgoKcUpIyjJAdc9VcPX2zaZFEqDj2aFbmuZvcyYY0WA0wXqObLicnxeKDN7U8gN+uqZHAw343kA511dpiDXzso0upZx+yyaQSqBFaVLGYgqOOsKZxhSUjC0f0Uz0XKsQ7g4Cbqw443X67XEqiGIS/4P+Gu/Z0k2Uo8pIZWC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKdWwipm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKdWwipm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720713454; x=1752249454;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I8+AhPQLA9ls0gWmik3FbSxuvCKKvP+CZMnEDQIM/A0=;
  b=MKdWwipmB+KEj1ccYFq1hHvm6vrvKv7mCfqoRFud5wEQwYJ8pLESeXkk
   Mnj8XaKA7d4UCigCnh0UqOHKdKdo722ZJSovJrtVhH/QMguhDq7O8LhYI
   GvhDzQNq+wAelV68FkIhpJKv7S5+ViVDXbBePLqCL/RnDfgSpaDUWYTjW
   xJotSu6NZ3Gz0e0dHhWymyyhWbuPRkOA/bLSpuvhckUgyyGtgPFzj3EEZ
   ouTNbd7ysRtD9LWVOXJfOgZBllsKLAybiBuohUFP+/8o71HXU7vaBFxVs
   5hoD9VbMOzy6FQJYucGDiC9jVsgaHTZBHbQnIiPhKAl9qaeHhp8wUraKQ
   w==;
X-CSE-ConnectionGUID: ifARTzr3SASLDKW1ATGMnQ==
X-CSE-MsgGUID: Mz7xe/VFSba/oDzOQzCS6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29258527"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="29258527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 08:57:32 -0700
X-CSE-ConnectionGUID: wnQt46/NQuKuf6wZzaVnFg==
X-CSE-MsgGUID: eqLS/soESqegtqsA69BhHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="52992696"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 08:57:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRwAi-000ZSQ-1M;
	Thu, 11 Jul 2024 15:57:28 +0000
Date: Thu, 11 Jul 2024 23:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 3/6] dt-bindings: iio: dac: Generalize DAC common
 properties
Message-ID: <202407112348.tg60bZme-lkp@intel.com>
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
In-Reply-To: <20240711114221.62386-4-kimseer.paller@analog.com>
References: <20240711114221.62386-4-kimseer.paller@analog.com>
TO: Kim Seer Paller <kimseer.paller@analog.com>
TO: linux-kernel@vger.kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michael Hennerich <michael.hennerich@analog.com>
CC: "Nuno Sá" <noname.nuno@gmail.com>
CC: Kim Seer Paller <kimseer.paller@analog.com>

Hi Kim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1ebab783647a9e3bf357002d5c4ff060c8474a0a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kim-Seer-Paller/iio-ABI-Generalize-ABI-documentation-for-DAC/20240711-214749
base:   1ebab783647a9e3bf357002d5c4ff060c8474a0a
patch link:    https://lore.kernel.org/r/20240711114221.62386-4-kimseer.paller%40analog.com
patch subject: [PATCH v6 3/6] dt-bindings: iio: dac: Generalize DAC common properties
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407112348.tg60bZme-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112348.tg60bZme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407112348.tg60bZme-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:81.11-90.6: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:116.11-125.6: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: channel@0: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: channel@1: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a07g043', 'renesas,rcar-gen3-sdhi'] is too long
   	'renesas,sdhi-r9a07g043' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-sh73a0']
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:712.12-720.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:722.12-731.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:757.12-766.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: channel@0: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: channel@1: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: channel@2: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
