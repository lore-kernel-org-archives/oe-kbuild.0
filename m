Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F873B14C1
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358176; cv=none; b=a9gWMDUsoxW1qa69Y3B5zUecNOE1IaHX9/u91qU3fsm6lyZ8YK7o15/vSAzuhOJegZHlzrHwv3FL3+V1gnWcOJIZrAa0/CAXNj0t9qZXVn191LW485nmxc5x+yLpCj9g7P2fLwDOkt02WQAV3WczlkQkE5nfA9dr+19sdc8JH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358176; c=relaxed/simple;
	bh=IYDNW9Wz0OTWrOC8hYsrjQj8nBwpCyFyLdV2b+9PMQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0dy/dMeLtIeAuJVcX+CoTgxSDjirlvP/RFDB8zh6hV69Tar5Xv6JBQ8pxjSW6+QCRn1V76kacuJez5Wubec+9Kp7IXLV8y9WtrVTBfsM8Q69k/uX1wlXZAPPwyumkgtGHfqy0qKuyMxnh7WevAvIgNhldlfK3rrL5/cfMwiMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsklQtua; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsklQtua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790358175; x=1821894175;
  h=date:from:to:cc:subject:message-id;
  bh=IYDNW9Wz0OTWrOC8hYsrjQj8nBwpCyFyLdV2b+9PMQ0=;
  b=hsklQtuacjDzY2Z5mYAYjVXhCqC5BCvLbfLlyvZS0dtygWbHbQp5flaq
   H9Jc/nFPUCHBAZ64eWIHA3/X9v2UOl6ZXeOU/LS1lkTLI83TYLYYHGRD3
   fw3isK5CYFnL407545oB9SKNRfXj36NMt9+IAJoB9tbx69AfJplGuas/v
   6tgq/HZX+EPmjU1ZdAYIT/59LK0bk5mFyUCf2hCkBz2luR6j1Cq5s9UGe
   l+DIQV9PV8f5tZTgoZtXdKUFa4EeZE4Qdepd56Eb1E+xdaZ2wWOwoJ8cs
   9tLqdKlc9yS02PGRQW6Pmu1teqBnNLnbYPIN6Dlryvm0C9Ryd0zVq6ZcO
   w==;
X-CSE-ConnectionGUID: jMByLGaFS0emdmaNz1kEhg==
X-CSE-MsgGUID: eDz/i33xTqiXHGN69MF76Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116678333"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116678333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:42:54 -0700
X-CSE-ConnectionGUID: Mh1UOLOFTi6a2bTYFmTpYw==
X-CSE-MsgGUID: HqgSooFZTKiE6tZabh93eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="282463875"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 10:42:53 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA9wh-000000000qU-17LJ;
	Fri, 25 Sep 2026 17:42:51 +0000
Date: Fri, 25 Sep 2026 19:42:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip
 4/85] arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000
 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai',
 'cmpbi'] is too short
Message-ID: <202609251958.yyy5pE7O-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip
head:   61382c1026cdebbf608e3aecb95c11d1cdbb9bb2
commit: b508d6fb28fe406c12e2070c53db79c57143d592 [4/85] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
:::::: branch date: 8 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-2400-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251958.yyy5pE7O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251958.yyy5pE7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251958.yyy5pE7O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014400 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014400 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014400 (renesas,r9a09g077-adc): interrupts: [[0, 703, 1], [0, 704, 1], [0, 705, 1], [0, 706, 4], [0, 707, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@80008000 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@80008000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
--
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014000 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014400 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014400 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014400 (renesas,r9a09g077-adc): interrupts: [[0, 703, 1], [0, 704, 1], [0, 705, 1], [0, 706, 4], [0, 707, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@80008000 (renesas,r9a09g077-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@80008000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
