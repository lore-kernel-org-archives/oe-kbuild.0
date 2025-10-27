Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44180279346
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602856; cv=none; b=QsAHPQyELS9QOWuoZrcPvIjCiYyt+sJkyrl7Sh6OY2KNaPv7xcORXinHxBsZUiACricAYAVqXjtbfjxDG7ScXiqwh/meC1QSIRrc6bHzisTSzaWlbQBs8vzfeNM0QWYIjYyWu/CaT5HaiFahpvjXCbwfxHbjOcesf6IBugTVgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602856; c=relaxed/simple;
	bh=bo0YolDQO0HdudAXjftYHyP4qSy8/HwY6C+UQgytdK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CYZ6tzvkJ6kWJVBw4RZiaUYbm0McdiNww0XIlPMkq79mflHDRX6upyQgMBbjfSbbMTFBK9O9SzeAseQII/Z6Ekl285YrVG+vcsk9HeonZbwXpWG5yR3ynsEddvj5EbA2dPMsPln2MKLF4o/xrK65av1GPkA6DHqRAjdKN7Ea5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRbPTvGp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRbPTvGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761602854; x=1793138854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bo0YolDQO0HdudAXjftYHyP4qSy8/HwY6C+UQgytdK0=;
  b=BRbPTvGphdcIcQMBMb06sHz9vMfgTHQLdzecLljXw08fDVCC2u6sttWv
   NAK0GHNmU3OMp024oXUaU2B/7Q2BCbATOzQtNbd4rht0AzA176JXiK9vp
   zMN2DWhnLItxwEjcnES3z1zXICQ68raYT6cxgmrZ7up6NdE1RTWo/COhM
   cG5COUAV9DU2Gz4C+z854yGtoImFInbt3BaxjwHEf1+uZ2tQK7od9sB8T
   bgScjEZAC6fZkfe8yquUfvN7fWKw1H5D+rEbMHNNCuSDjXB34cHPPFbao
   sGQsjGSaQTkrmDcOoHQukZ8mE9eAkvrlPLLbLxbitgy1d7JS9ApVVBwSH
   A==;
X-CSE-ConnectionGUID: pxCuCqUSSSKmPT6w7b5YiA==
X-CSE-MsgGUID: aby2pKrKSQa6iiOeHTG65w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63601793"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63601793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:07:34 -0700
X-CSE-ConnectionGUID: lxmRV8+BSECbJbDxx4cm/w==
X-CSE-MsgGUID: XkD6Vk06Q3umSddGnFjZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184787741"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 15:07:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDVNB-000IVt-1g;
	Mon, 27 Oct 2025 22:07:29 +0000
Date: Tue, 28 Oct 2025 06:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 18/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000
 (renesas,scif-r8a78000): 'resets' is a required property
Message-ID: <202510280638.OZW7hDdv-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide
head:   fe21d488fba0b6bcb0416fab7cf246e35592ce10
commit: c87576b462097163e19e94adabd82faaf3129281 [18/21] FIXME: arm64: renesas: r8a78000: Switch HSCIF0 back to dummy clock, enable HSCIF1 with SCMI clock
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20251024 (https://download.01.org/0day-ci/archive/20251028/202510280638.OZW7hDdv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280638.OZW7hDdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510280638.OZW7hDdv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,mfis-mbox' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,mfis-mbox' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,mfis-mbox' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,mfis-mbox' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,mfis-mbox' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,mfis-mbox' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,mfis-mbox' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,mfis-mbox' is not one of ['renesas,smp-sram']
   	'renesas,mfis-mbox' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /soc/scp@c1000000: failed to match any schema with compatible: ['arm,rcar-sram-ns', 'mmio-sram']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
