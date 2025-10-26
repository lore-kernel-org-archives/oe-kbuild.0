Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB71E5201
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761448042; cv=none; b=W2yoTgzXxgzJd+P6+x8y4+oquFLoRaQhk0HImfEJG3j3+5drSsK5+MAHV12zRtBBiY1tNlz9b+zk2vwb/GMRNJWFWuowGinQUZawQGkA19WqvMOZ1ghvkdi1QU6CJQjwpVeLIkN+4ac3SuFJ3JuWGSEnyJ5RLnt/JNcDolqvmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761448042; c=relaxed/simple;
	bh=FFXvuJnhD9RC1X7joDeQorkRiN2SDNafAi94O5wvqIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZ1oM4lUbx3npTBfV3VM4WrDdr2haml/fey+ens50ZxHD2HSmyFdUyvPokKt4IYADNNkYVX2FyeYjgmJLcX71YQdYufD3derEHZXuUOPXptC6HDqBMmxt/KyGJ2YbzBa0Q76svJzTxdMECEVmyGWVDaOS0jWwCzcjTRBVIvxZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqnjsuQa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqnjsuQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761448040; x=1792984040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFXvuJnhD9RC1X7joDeQorkRiN2SDNafAi94O5wvqIc=;
  b=fqnjsuQa2dGtTXKbWCXqDzDSmshRIaYgIuq801tNsOyogKM5XjbnceOt
   see3u7AOfB2VSFZaBl6BDVYWgod/ux/JcWd/bJhSaNCFhIBOAOMvl1Qp4
   ywmbRCmsW/UdFx3ygNscGI6+T9wMr27/9v40T9rxm25llyT51aAiwqHXZ
   9BYx0rEPPxIK7iclzSmqPTHCUb1atQ3KuVfyZSfaj+SKwwYIo4AqDCrEx
   gDksCFXTYX1EAITghAgYEiQHFxKrbh0BUu2WV/eKWxEh5s/a2cvSfCEpy
   9gz7ZJ0K1Rz38fUKweWUmqUIZGwSBCREJDtDh2wK5x4kaxexQa8Fbby28
   Q==;
X-CSE-ConnectionGUID: yR75yrKITlOCMrrQ31aTAg==
X-CSE-MsgGUID: 8zhIvjSVQhy4GFodE0nmXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67215837"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="67215837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 20:07:20 -0700
X-CSE-ConnectionGUID: wyJM+2gDRKK52EVub2sG3Q==
X-CSE-MsgGUID: CIKUIRMvRX+plUhv3d6N4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185505217"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2025 20:07:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCr69-000Fq1-08;
	Sun, 26 Oct 2025 03:07:14 +0000
Date: Sun, 26 Oct 2025 11:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 14/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mfis_mbox@18842000
 (renesas,mfis-mbox): compatible:0: 'anyOf' conditional failed, one must be
 fixed:
Message-ID: <202510261105.ARphIzxT-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Hai Pham <hai.pham.ud@renesas.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide
head:   fe21d488fba0b6bcb0416fab7cf246e35592ce10
commit: aa6090b38c43a4e6a7a251b7e4055aafdcf82199 [14/21] arm64: renesas: r8a78000: enable to use SCP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251024 (https://download.01.org/0day-ci/archive/20251026/202510261105.ARphIzxT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261105.ARphIzxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261105.ARphIzxT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mfis_mbox@18842000 (renesas,mfis-mbox): compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,mfis-mbox' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,mfis-mbox' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
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
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /soc/scp@c1000000: failed to match any schema with compatible: ['arm,rcar-sram-ns', 'mmio-sram']
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /soc/scp@c1000000/scp-shmem@60000: failed to match any schema with compatible: ['arm,rcar-scp-shmem', 'arm,scmi-shmem']
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /soc/scp@c1000000/scp-shmem@60300: failed to match any schema with compatible: ['arm,rcar-scp-shmem', 'arm,scmi-shmem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
