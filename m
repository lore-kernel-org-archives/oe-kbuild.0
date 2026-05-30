Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E62C187
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147072; cv=none; b=RsWy3b7QtjXkyZU683QFOWwb2YjRBdF7KexAOyk34DH6YDpxkrYOgXck4VPodVTriR48c7nDzhXl3Nu8tcc0i+UlWqssIge7w/2PClwEHyxfTPWZ2SEGLrXIPrxoKjiswdb5qNFNtnxuenp+gklH/JM9YwiCHMAEw8qzqk7xtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147072; c=relaxed/simple;
	bh=v41dnnlU8xhO9/QENdf0fi979TfK3ZQAR8kUR5JT/vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b10fQTTKqHVaYspH1tqdhkw3+w1GTtBKlC/W7b5wAz7gdbuaVQiBnyEdmLgWKToGpeJAgHBz2pvgoqWH9WVLn9r8yj3Q6H1fYE2wClv4/RL6zlfl8GOS2Lc4YXSG/PfokACkPkTzqLcHGVkYFTyjFKb0KH0C4yPO7vAegOFoJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVFC+kUt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVFC+kUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780147070; x=1811683070;
  h=date:from:to:cc:subject:message-id;
  bh=v41dnnlU8xhO9/QENdf0fi979TfK3ZQAR8kUR5JT/vk=;
  b=mVFC+kUtR6/lQ6XkzUyc7Wq9z3Xn5aNtWvOetkz+K53ibjEQJ80h/sji
   Zfqlo3sda3xdebu8Si7DnGnAOmC0Njzdv04NDxI9g8UuWtVHAsGzD7M+Z
   GJ1VKpGlGADWuV8OqUdCEUymFcp8xyxjM+3kpAr01WjKTQaWCW108Ypfy
   UYZTY9oXy57YQRwaFokkKt0ZWWhJRL+r4HHrorg6L2E4TwQiGW3eaqpRv
   LTmsXj/4Vc9pNyDLWjmUnTJTKeFHI9joc9MCtcV7m7Uu5KvhFt7zzKCgh
   BDRPS2vGUBrrRgyCr/wROoxOGZDCXxqiUlfCN/dGOQtECKvxfdOaIf2h0
   w==;
X-CSE-ConnectionGUID: Pq3WeQukR+aCUcnTt+ovrQ==
X-CSE-MsgGUID: TFl4Ws9NQ9+UqH9E6W6C1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80705757"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80705757"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 06:17:50 -0700
X-CSE-ConnectionGUID: 6ngxxojcTkm3gR5V60dnDw==
X-CSE-MsgGUID: 5+bJuzrHSou4/Tzt8e+U+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="247106948"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2026 06:17:49 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTJZS-00000000189-3SMS;
	Sat, 30 May 2026 13:17:46 +0000
Date: Sat, 30 May 2026 15:17:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/gemini-raidsonic-ib4420-b 3/5]
 arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: spi@4a000000
 (faraday,ftssp010): cs-gpios: True is not of type 'array'
Message-ID: <202605301505.BTtx0pRs-lkp@intel.com>
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
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/gemini-raidsonic-ib4420-b
head:   8385b2491fdddc8dfd1d2f303598b186295bbe22
commit: 7b6e0f36ecd123091a549decc09678c4727021c8 [3/5] ARM: dts: gemini-nas4220b: Add SSP/SPI block
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260530/202605301505.BTtx0pRs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301505.BTtx0pRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301505.BTtx0pRs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: spi@4a000000 (faraday,ftssp010): cs-gpios: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
