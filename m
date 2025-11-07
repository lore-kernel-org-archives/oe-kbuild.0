Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734322FE04C
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762552352; cv=none; b=RC9UZ4YEWAfw4zGITxniWKhe49V1ESf3+N3vF9uqNo/YcdXb23tOq5m1REa1ia2iujgYHcv5txi60FCVlSQ3amy/hfwGqX9v5rLxTgwZa2K4s+HmLIqkCVR4myFtoN3xA9X3T8q3LBOO+pkoar5LUStRjudCrSfDlxtZtp/8tvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762552352; c=relaxed/simple;
	bh=1Kki8FIghlU2LT136Za/UGN88i3+woJpVWzz7y1EkXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJqL0Pr8Ij3hPTtltQ/1nBpl65loDCzbCvMYvZwIwFtsjXXrtylnhAijmbhkNH+7ctGIcnzb35Bvoz/vRM7M6Hd44SExP4ovfnHuiVUOwHEb1hnTpwltmFxAenjNDxKF7Js916vcXSGNoBsXr81peZeTSK8QxuySZu9XqtfhJzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTV4y683; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTV4y683"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762552351; x=1794088351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Kki8FIghlU2LT136Za/UGN88i3+woJpVWzz7y1EkXA=;
  b=iTV4y683BQrMHc6dEbsyaFqme+kTVxAB8uJnECF5p2uSZfv9wtANTLxX
   2c9ojnN/a/uwWEI8FhPQt2PU0oRLwTZQScWGY1lvtCLIYIAeOgdxg7qu7
   bU5ep7pajIsJCLE5Vz6xJMoYiI6MLbCD3pTisHD+EPl0lt/3cKlzRfgWq
   kaljTmaBZr4hhrQ6Pdqi2BOTOKqYMZoQ4yP6v7Q9f37I6dXu67sW4y/Rv
   V1XmWJ6DWuO2BUN2q2ReQHESdOzdWTAMm7NvkZXaszGLDRwyg7RDXOlrf
   sgyDlx1QY0+mPgTh8x94v/4vS9+WfeLbt+L366QfPoMql8yoc9E+OiCpH
   A==;
X-CSE-ConnectionGUID: Pi++7JP0TYuiNYBpZz7TVA==
X-CSE-MsgGUID: FOXdytypRD2WaOmdivON+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68354221"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="68354221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 13:52:31 -0800
X-CSE-ConnectionGUID: mQ9lxBtBSRmZ9cxWpl9n0w==
X-CSE-MsgGUID: /cIpSn/zRvyBYJwR44DfZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187788660"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2025 13:52:29 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHUNf-000000003Vk-0SaH;
	Fri, 07 Nov 2025 21:52:27 +0000
Date: Fri, 7 Nov 2025 22:52:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dt-bindings-qcom-bluetooth 5/17]
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: bluetooth
 (qcom,qca6174-bt): Unevaluated properties are not allowed
 ('interrupt-parent', 'interrupts' were unexpected)
Message-ID: <202511072252.LEoArpCE-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/dt-bindings-qcom-bluetooth
head:   611b4c646ca9033f764bf5fe88e372b6e5fe37e1
commit: 989fa7f478e1a55eeef361fff5a2ba30a9b4c4e5 [5/17] dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-2052-20251106 (https://download.01.org/0day-ci/archive/20251107/202511072252.LEoArpCE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511072252.LEoArpCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511072252.LEoArpCE-lkp@intel.com/

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
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@48000000/segment@100000/target-module@d8000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
