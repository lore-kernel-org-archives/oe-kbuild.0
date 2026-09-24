Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130A14A4F00
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263952; cv=none; b=MmiAjFu45Isogkr7URqkMP60Z1xfZCrKEMLvRbrRUoGmnZH8xoG9XervMOc4UnOB+PSmYHfZIw5zq1LqAGzYKSiKcRSB2730n8NOayktHIJecZoMDVRSeUJgWHDIIBO24D3ChrWSnL7nSIiudtNrzoCzqP2hKdx/ubikjupQPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263952; c=relaxed/simple;
	bh=cigQP6GEixSY/gFPf7bq1QQkToE446JmJdYIDucJdLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XFI1mmTVPddnLGYZ9EszZFzz3teDWu7vo9X5dmemicopnVUkmY7oqFnFNUyTKZ5XgQRTCc53x1A610BMRqGm5yxqWVnKRe6bZG1vR79D91rTgLv7UpD5V4FbaKDIFZ4D5RIsBAhdMB3v8qdVY2L0exo717I10H4v0GCqTWVHf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLZG0LoU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLZG0LoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790263950; x=1821799950;
  h=date:from:to:cc:subject:message-id;
  bh=cigQP6GEixSY/gFPf7bq1QQkToE446JmJdYIDucJdLw=;
  b=FLZG0LoUjnK9p9hzn7Ihqb8wL0+wLmbK0Ol/P3UHou2vCrnbQJc/nR0v
   D99SJh1gb3oM7emUcLQ+fmwaaGUZEvWivXp/1Fml6KPWvci40zZBrNQuF
   3IQP3yqZGvBEMFV9t/XTbH0zmkQB4k7Sqa991hhiGsieIEyFvbtHAn0s5
   xsMezIDlC+JIDYI/S2gKbs18tr91a5OB9QWZm8k8sx66KxyJQtU0ID2NV
   N9179sayIXxLnlZwD/Nq813HkeoQcplPCqEYBvnOqaKID+XmasXkFPZgt
   mqYNPs2YyI4w8z9e0mCnjIoM3JvDwSDzwj7JYE5cypWJRedc3mlmneCJ/
   Q==;
X-CSE-ConnectionGUID: bzDXyUOqSUOyVLf008BMfA==
X-CSE-MsgGUID: eNsRZUR2Rly5jbAn09ovnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90903674"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90903674"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:32:29 -0700
X-CSE-ConnectionGUID: aOfkXJcFT3+2gegrHRE7CQ==
X-CSE-MsgGUID: CQTk4uXoRzGOmlGfDLwW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="303575353"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2026 08:32:28 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9lQw-000000000M2-1DJq;
	Thu, 24 Sep 2026 15:32:26 +0000
Date: Thu, 24 Sep 2026 17:31:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.4 64/75]
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000
 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes:
 '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
Message-ID: <202609241711.X9Pct1iP-lkp@intel.com>
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
TO: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.4
head:   81f524d9eed7c25f7f95edbca47447ef12d26e93
commit: 81f524d9eed7c25f7f95edbca47447ef12d26e93 [64/75] arm64: dts: renesas: r9a09g087: Wire up DMA support for ADC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2402-20260923 (https://download.01.org/0day-ci/archive/20260924/202609241711.X9Pct1iP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241711.X9Pct1iP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241711.X9Pct1iP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014400 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@80008000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014400 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@80008000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
