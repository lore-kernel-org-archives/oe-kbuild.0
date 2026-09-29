Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A424078F5
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723859; cv=none; b=MPTBxmdM85Bs59EW07C2MIaVv2nBxxMKH9+E5k65GHhfCNfmR55OGX6/n2oZ3npBGOIQrdEvGgfL+tZRSAmfk3MPHD+O+FYhJUYH1OqwsWu2WSHDeT80fRIo54KKPM7UWZJKuUrqPw+gAwjDzcaqNHFp0PEnwspl6bSh2rjpy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723859; c=relaxed/simple;
	bh=tuVNRCnLrGIg7NAxiFXqil5WSoYmF8OXs/lczqpQFVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/OTk5r0GvWfB/lKet62FkMcxbh0RgFBOH8lZUj+FLhAf5g/vULwH59NYGaAVbc/hx4Ot4kWw8DbP1oPSmD1xIBOddsKrW4Q5UwxtkXg7Ti80i966ZdOiuTj75SVoSEGRsRjSWH+VLhvyBzdxTNVwWNdNn4QdWhwIZrhu4m5WtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6ZzzSoh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6ZzzSoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790723857; x=1822259857;
  h=date:from:to:cc:subject:message-id;
  bh=tuVNRCnLrGIg7NAxiFXqil5WSoYmF8OXs/lczqpQFVU=;
  b=a6ZzzSoh03bXjEPyzJA6XBTUEzgG5iEZy42i7W4hfpfX0AvE9iuHKeEJ
   uqifmuJdT9XRjYJ2bdG1TwTT8IBPwOiNMH8IAc69hffE2BFyBX64uLYqJ
   v3YhlJVXCWQjnayhkzN1RgAtL5pS1cWMZJb8ehJirrYECvIjdwwc8hdrW
   EI6rEB6NwCEFi8liCJg/GspP/eJSfZ4Svb6fBJrKaa9yy0rBtONrBjZvF
   d5JwpH/nT8wIN/VnjpAjk3nMs94N9Y1Gu35jTquV/PoFdGNArpGHh5LKD
   hT+IHpeIbn6CivxhX2VsyZLaPgQCemTux+E/sLfzqdvQTPu8hDQ7D5qyN
   Q==;
X-CSE-ConnectionGUID: rUuBHvoiTbqDw+uxPcMq4Q==
X-CSE-MsgGUID: 3U3Mq2aXRF+fkMGEEDPQ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91473759"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91473759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 16:17:37 -0700
X-CSE-ConnectionGUID: 82iuxLK1RemUGtGEqGLIeg==
X-CSE-MsgGUID: nv4ycZsfTpq4dUHxPdzELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275061341"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2026 16:17:36 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBh4n-000000001cF-2OEL;
	Tue, 29 Sep 2026 23:17:33 +0000
Date: Wed, 30 Sep 2026 01:16:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:devicetree-arm64/next 9/10]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/pwm@4009c000: failed to
 match any schema with compatible: ['raspberrypi,rp1-pwm']
Message-ID: <202609300158.0Tbzrdbu-lkp@intel.com>
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
TO: Stanimir Varbanov <svarbanov@suse.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Andrea della Porta <andrea.porta@suse.com>

tree:   https://github.com/Broadcom/stblinux devicetree-arm64/next
head:   4db272ba40c09eafda1ec0a4d59c0423561c8f7a
commit: 44aea8d7016e2e7e224cc756d8799a2aade9547e [9/10] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300158.0Tbzrdbu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300158.0Tbzrdbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300158.0Tbzrdbu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:532.11-716.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/pwm@4009c000: failed to match any schema with compatible: ['raspberrypi,rp1-pwm']
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:532.11-716.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/pwm@4009c000: failed to match any schema with compatible: ['raspberrypi,rp1-pwm']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
