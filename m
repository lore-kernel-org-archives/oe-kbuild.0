Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D23208A9
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 23:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721086783; cv=none; b=FEjrgSdLeZhP+du3st4GjXux4M42cpm+EhPCeVaVzvXeN7U+Q+eouCZKJkmE9G+X/I62/Wqn6ZQSirTgrrHmlKld8AUWdNhYUqjtgFivUOJ1pLXJ2O8z77v7LP1n84903FZ0rDci1Kjp6pIjNK5Ios/L82VqKopaPZATEVPIJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721086783; c=relaxed/simple;
	bh=yMKBdsZl0BOAMRbeE/Tf1nGmeohOVFkx5NuzDNFffdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hFWsrC/D9hbB01bXzmgYobvx2IqnOKyVVIx5zKWIWVIUd8hfsHBObixRbOQSANwE7537RHfGwwWG98V1fb23jQ3UuM1KZBX0vzh4K0LV4IGzYsMb9fNokseXNdLZR0kAQC7D1NNhkNkZfG23euD+8C214fGxOUT4nB0uHt2krAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fa3PzsXe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa3PzsXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721086781; x=1752622781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMKBdsZl0BOAMRbeE/Tf1nGmeohOVFkx5NuzDNFffdE=;
  b=Fa3PzsXe+3L1SGL1y0PHg6Jq4GWoOtCdN0VZMlBgzDKJ8DJH89CVtzsp
   Hy+v4dYR9nYNvwfXC62qmVF61qkbJYLdVoDfej0+N6vJfQnl43m4lnIbO
   589apBq5AfAjvx+wNfgz1l8yiaA+r+9stYWX9e9tJMEAuVEiywQiQkjmn
   LUzfPkppMKkyVSCZtchjygEJ+K+5G3lf5TmEBeWY9cbpIWdcgz8G2Yiu3
   wnb2Y+1Cktheke/zea/f3CCTXsQyFQmeOX2R1m9G1YM20ssRdvFvHRifa
   Rhg8N+/lSOvKo952/SwAxC6xI90YVOSPPspmRSHy1ex0IqcK+xPeA7HK/
   A==;
X-CSE-ConnectionGUID: z1C69yfuRI2BaJcnYxMfoA==
X-CSE-MsgGUID: b5g6UCznRg6DaUZ3Z5aQ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18343000"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18343000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 16:39:41 -0700
X-CSE-ConnectionGUID: 1XQ2/1ESSquNy3v1vSxjFg==
X-CSE-MsgGUID: HhuimOJTTWOTUt2eKVVQtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49687729"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2024 16:39:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTVI9-000efH-2Q;
	Mon, 15 Jul 2024 23:39:37 +0000
Date: Tue, 16 Jul 2024 07:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 35/44]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: mailbox@29000000:
 ti,mbox-num-fifos: 16 was expected
Message-ID: <202407160726.821nC86N-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Hari Nagalla <hnagalla@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   57a6017c36af1015d5e7ac626d8ab1de0ccb6c22
commit: 4c9b145cd486028900954681de70d3d8fd137d1f [35/44] arm64: dts: ti: k3-am62a7-sk: HACK: Reduce mailbox fifos
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20240716/202407160726.821nC86N-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160726.821nC86N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407160726.821nC86N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': 129, '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': 129, '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@a40000: 'cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: mailbox@29000000: ti,mbox-num-fifos: 16 was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/ti,omap-mailbox.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: mailbox@29010000: ti,mbox-num-fifos: 16 was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/ti,omap-mailbox.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: mailbox@29020000: ti,mbox-num-fifos: 16 was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/ti,omap-mailbox.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: video-codec@30210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /reserved-memory/edgeai_shared-memories: failed to match any schema with compatible: ['dma-heap-carveout']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
