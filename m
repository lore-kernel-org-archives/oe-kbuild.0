Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD42DC32E
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546291; cv=none; b=GcTRukqDQvSOvzpzC2dKoZSBof6+2nr3qdvg7LeWfO4F8iu1GIBOn1Erx4CN6OaRH1MhWWBJgkbI3tRNolcdIkpe5s8jz6rkkCD6o6XdYzXmbmdNiK4tMpJDHSmE60QUJbH2/IbBgbhDBScO3Yhm1ay/i5ojYp/n0iOu/DRNWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546291; c=relaxed/simple;
	bh=FFtTAfZDPSUDgwZEC51PK5QwFQW8w10zUVGEHnXYE38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPrKPFxew+LdUfbA0IHFr9+qzApKv+fQo45leIL+xJvcGDFXBtnF919p+IVtY7u6zIyxAklmyURzmNhZc8jRjUel2o3Y12YYGgPJAx4qe5r8iLmrcEKARmMJVpQFXAvUVKtUcL7/24hGi2WKWnHbOdrKfltuseT021b5VnUWcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd97e8d8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd97e8d8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761546289; x=1793082289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFtTAfZDPSUDgwZEC51PK5QwFQW8w10zUVGEHnXYE38=;
  b=Vd97e8d8o07N4VrqfDFHkGpxcqhw1z/Xx03rOglKpHHmHb84HiluvEzz
   zLh6BxeCL80dmAshWHB29tRc4KUUT0j67G5VLcsBPP9Iv7P5+gTeOR+SB
   L7oJ977cDk/cfUPYJqoMvDxw9XX4z32SbT24v4kIPnERbbAPnxz5SzVHI
   n2f+VB7PX4eJorDKKl7KKiuTzNof0X+mnEtlgVFpr0e3PZnWpthpYKVj3
   gJqSKBcGwyu/uA0Rdu2iJhkyNGe2uErg411f3AMgZccGyie+/MIAo8mnE
   H8vX2AIm36/PWenYGRxc5pHfsJnL89uh8HTSVBWsFGNca5C3LoP0siHuS
   g==;
X-CSE-ConnectionGUID: XEZ6o81jSw6buwNDvM4e2g==
X-CSE-MsgGUID: PZXg7W0nT4ec80V1Djtatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62650065"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="62650065"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:24:49 -0700
X-CSE-ConnectionGUID: 0DLpq9acQgKxRiYszNfPmQ==
X-CSE-MsgGUID: tjBtiaQ/R/+De26D2c9mnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184139746"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2025 23:24:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDGel-000GZ9-1N;
	Mon, 27 Oct 2025 06:24:40 +0000
Date: Mon, 27 Oct 2025 14:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 14/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mfis_mbox@18842000
 (renesas,mfis-mbox): compatible:0: 'anyOf' conditional failed, one must be
 fixed:
Message-ID: <202510271458.mtyTWB5n-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20251024 (https://download.01.org/0day-ci/archive/20251027/202510271458.mtyTWB5n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271458.mtyTWB5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271458.mtyTWB5n-lkp@intel.com/

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
