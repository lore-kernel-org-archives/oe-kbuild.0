Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5CB385D68
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785065073; cv=none; b=IbDQc8Sk0PxfSu+EPCekCwCBRDAdwOhhnzZKFRJSKIcX87KqLUqc15sqe0PGZf68jMTWaJCa6ApGrDSjEoSYFU7eIC2OMc3uBRpVOxkZ6sN5oK4qxuKqNjlMY/fWbEAJ0ShXIhKTnJbX9jM06sFuiHpoIDCoCzyom14mZLkvmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785065073; c=relaxed/simple;
	bh=fstIQLg+glZPDMW/nPSwuIhP+DpGQOt7lkR4nVJB2M8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gqIvH7Zr+mebK8b/muwxmzXVgas8qSMSa5WrBYnTCIu6M7cshg7ilyvBXcejSFz1Hup3bLt0ehFyBXN/YO6+y94TsaV1tlsSc/zt99Ra/gor9rQDr4354Vn1XLsVzqGj1InNg1x4rqwVELe+IAs8WIqRoZXOAYzeIWNgJmNgUXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/G2Zwpy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/G2Zwpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785065071; x=1816601071;
  h=date:from:to:cc:subject:message-id;
  bh=fstIQLg+glZPDMW/nPSwuIhP+DpGQOt7lkR4nVJB2M8=;
  b=F/G2Zwpyl/sBTZEthOLMV+DdYl7sYt0DF+jNoq/3D1c1E4Ha9ykwm6Ma
   JQLRK9ookPIw+EpHZc6gCAf8P72f0Il9fu0eQcd0iDc20trG7fhlu2kqU
   +NHg3ivuFvFZYSc4axoMRYkjhlERS4N/p9cl3GboXJEU4HeXoZVkyobqU
   HAdrm+lMvHShvNF+sa0XeTCHxvUAvsntLMqFLC6Vgu8EnesWk301vNphl
   LEacgSRngAlGmA+lR/MaP8Dfpj/NzikbtcdeLASv+ax9gYMDSuyExZcnH
   U7QkPDnYxHdpMY+tJpr5EFRZTYlcvenmaC8T2FKjzHWYaj/sqD4lkPnKu
   A==;
X-CSE-ConnectionGUID: UuOfHUnwQ+am+1J5rNvYKQ==
X-CSE-MsgGUID: n5I2AGEmS4Szbp9TWzaIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85776979"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85776979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 04:24:30 -0700
X-CSE-ConnectionGUID: FSrbvynTQUCTAUDcoEbdFg==
X-CSE-MsgGUID: 8Wkxj99MQC2uWpwBVlMiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="252814761"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2026 04:24:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwy3-000000001QM-2DEC;
	Sun, 26 Jul 2026 11:24:27 +0000
Date: Sun, 26 Jul 2026 13:24:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 17/21]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1
 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match
 '^ethernet-phy(@[a-f0-9]+)?$'
Message-ID: <202607261335.hKiActXN-lkp@intel.com>
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
CC: Yixun Lan <dlan@kernel.org>
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Yixun Lan <dlan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git dt-for-next
head:   31efde747b5e5d2c185e06d872a9ef9b87f505ac
commit: 1b5753f2270072110c532e20e2785a1e2dbd7d3d [17/21] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
:::::: branch date: 3 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-2051-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261335.hKiActXN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261335.hKiActXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607261335.hKiActXN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
