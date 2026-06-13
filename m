Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CED384CDC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781395111; cv=none; b=FCGpjNZ2Rr6+Q/OkW7mHZfZdA/KF7CAdg/O1N+Hrf7rK7NrG4YiypsKo7XgC9NSbBHR23rg1ixm0w+ctrSv8swrmWhH3DlADW8ahjbJjq7rXM2CTBeQFBgRPsZXrs5mGAsRQWDcsm5dc4FEnr9512H/Kn5E7LexFdgMSh0Qw/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781395111; c=relaxed/simple;
	bh=VOo/qSx3RdfeduWUnLxoJD1jCF+XSZ/NaITbsmnFk4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVgmjOBBE5Q3gB4829RyWOIp0IvxHH2yWoquBk8hL6MRtDzJi2dJij7OEiMq6SLIv3OzIjTv/e6ylttkUucnE4xOzyjATou2PgCSH7/Bh2hAABSIanNKVpwO/JQjlYGmYoemJMe5i823bQU/CyogsEWfGCxXvDNDz04wted1FSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B90UnRFQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B90UnRFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781395108; x=1812931108;
  h=date:from:to:cc:subject:message-id;
  bh=VOo/qSx3RdfeduWUnLxoJD1jCF+XSZ/NaITbsmnFk4g=;
  b=B90UnRFQ6BwiM8hBfrM4YhUUrZSlIH1upylnzUVwbIjUksT8bXfAUmrC
   xPDfRGehFkLKlsKP0sA3ZU+LetVpY3X/Ol+DtwbBc6cb7BYYmorjBWU7y
   LqKZDOmi7tiPFJhP0q2a4QKHei7t97+3AcyeYJ86xBv/uHuu5Yg8TPz/R
   tUAuIH8ngMl9VsqIFcGS0nyxI3lD3nz1k65ms7rXYoKuU+84fT+JlPQ3L
   nYGHnfwXryyAvD7wtwL4yluacW9FLInVmrHXAaMJmgtup0mriyMh+8ORJ
   6DA1hnyFLBRTBHToktl6t68hf3uZvWQdsY6XhxEHHJookWcwXoa3xC5Y1
   Q==;
X-CSE-ConnectionGUID: 9EUmrfXYQy6vi6ujabI11Q==
X-CSE-MsgGUID: N73jn9g/SC+wMLLMNts2Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82289819"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82289819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 16:58:28 -0700
X-CSE-ConnectionGUID: JTFlHZOqT3u564WnTA3ijw==
X-CSE-MsgGUID: mxL0ldoGSpuhAB1ecmCKag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="242759108"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jun 2026 16:58:27 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYYF6-000000004aX-1fk8;
	Sat, 13 Jun 2026 23:58:24 +0000
Date: Sun, 14 Jun 2026 01:57:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: bluetooth
 (qcom,qca6174-bt): Unevaluated properties are not allowed
 ('interrupt-parent', 'interrupts' were unexpected)
Message-ID: <202606140127.uqr0ZUKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: 68f3769ce01631eb6710b811e2dc5d767b76c5b6 dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-2052-20260610 (https://download.01.org/0day-ci/archive/20260614/202606140127.uqr0ZUKv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140127.uqr0ZUKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 68f3769ce016 ("dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606140127.uqr0ZUKv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: bluetooth (qcom,qca6174-bt): Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,qca2066-bt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
