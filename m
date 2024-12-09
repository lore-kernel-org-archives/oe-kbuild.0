Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674915623A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717823; cv=none; b=qDeTAWAqm2R0DCcpAAxUdXe8b1qLK+/9NaFh1naJlzqfHXbJDpyH8/yNjmyppxvgVl0LIojA5tYxqAcXcTlK/FldKxXkwadZas+IBwPPYCh0hsLyCcRdr1GndBn/DsHwTarWvoOpyzGzVYMSVyd/eH0GZqB59KvjwiCsu+CoR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717823; c=relaxed/simple;
	bh=hJAwvK0yqqll6cNk549ZpTtSpI1kaUeav1VoXBW6lyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UV9vyoU0DFTRmYDs8+61OGeuEKlsYAFjYl/R0c2YrC6qHsjqOeh2HOE+XnF/qPL8EeByc8ZVRyN5/fM+i06gmguSd4PRCjGK0fOQA5Ozr/lvs5lQeFphyjD8xwGpoqCAbXHSzD5jUwFEsUZb5JpkDfIfsVdyhDIZjcbuYF0zG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcFs6ntR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcFs6ntR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717822; x=1765253822;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hJAwvK0yqqll6cNk549ZpTtSpI1kaUeav1VoXBW6lyk=;
  b=CcFs6ntR8oxUV4VLXpqdYXUOH7k+HvIcK8TD13nZiPHiOEakLMhOTSNR
   SG6UVVJDgLfozKdXs8YquvwVJYGRIfxJ3R8IZH8OA59JUxerNQ4UYV8nx
   DYPHIfOxkdqFV3OqTtnJ33rnup6eq63Ip0fhFwFpjRI72pEvbuZ2dqx7w
   P6T+E2itvRe7ZB7V2iK1CTHHMZrjitBaojc/q3kXDL4FzavbvSM28EOKU
   EKtW5yN2BM2a+/6FdoqZXz3eF8Y0z0Ek8RO4Qj1ZbHInjqV6ZNAYruOSm
   sixo/iB3tbwjzbIc8ZwwUr2BkEYMZLRowgJIvtSM3hk+4mcQ6FsWLR5sZ
   w==;
X-CSE-ConnectionGUID: vnY5S4ZPTgezuSI5h/dcDQ==
X-CSE-MsgGUID: y44592gETtWtlWhFcW2t/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34235961"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34235961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:16:10 -0800
X-CSE-ConnectionGUID: X2lB8VkfR1KiwNTlorZF9A==
X-CSE-MsgGUID: gRm5rg4iQxmbEVjT0wNlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94823952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:16:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVBm-0003p3-0v;
	Mon, 09 Dec 2024 04:16:06 +0000
Date: Mon, 9 Dec 2024 12:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <202412071956.CjjEGCcI-lkp@intel.com>
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
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: Peter Griffin <peter.griffin@linaro.org>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Sam Protsenko <semen.protsenko@linaro.org>
CC: Will McVicker <willmcvicker@google.com>
CC: Roy Luo <royluo@google.com>
CC: kernel-team@android.com
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: "André Draszik" <andre.draszik@linaro.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c245a7a79602ccbee780c004c1e4abcda66aec32]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/dt-bindings-phy-samsung-usb3-drd-phy-add-blank-lines-between-DT-properties/20241207-003504
base:   c245a7a79602ccbee780c004c1e4abcda66aec32
patch link:    https://lore.kernel.org/r/20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149%40linaro.org
patch subject: [PATCH v4 2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071956.CjjEGCcI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071956.CjjEGCcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412071956.CjjEGCcI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: phy@11100000: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: phy@11100000: 'orientation-switch' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: phy@11100000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
