Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03E4CB5B
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202089; cv=none; b=Mj8I3D23IFX6W0eF3iDhOhkDPnSI8OwkGBX2UqLINqQ0mp6WqwXo4BY+IQOHeFa5I6goJDWhRy9GsGNxp5tlGXguiVcKJH6TGpWZzN78N5SQGY0h+6NUWKoTsUlhEzMg7qNJeLAYtJKityDp6v0F6+BXCG9sGnhOFeo3S12Uddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202089; c=relaxed/simple;
	bh=1EiejKWZacH0wmIIdjqbbCAdRpzihqeH5NkWFVoqI+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KqvdttY5KsuRLiAq6/jVF6OdMWTZqRuckffjKsVuLm2j/8tSyidvk8m444hI06t4JW0p564IMTphwtIB+Tb/t5BkSXTufarD2k8BKUhJdnfwG8QRVNqpPXKUO8qJyOY4musVVfxjAhrnPvdMoGi3mG61A6H/qJjGEKHDPkasgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6G71btp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6G71btp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776202087; x=1807738087;
  h=date:from:to:cc:subject:message-id;
  bh=1EiejKWZacH0wmIIdjqbbCAdRpzihqeH5NkWFVoqI+0=;
  b=S6G71btpZkVALFIFaNsdzxlbL/XQuvf0w2hNKnnHUxk1bJWXy8lhwCN9
   GWDSWwV0Z/UVQB7cXbbpgRA1a6ktqB/ZrPYC+KQCRv2fAuLr7HHpCdkK5
   Py9yXbL/2gKmMsibNzARPDvXIRvdcukLwmu3ytCBm3lgG/iW/7TYg3inQ
   YRqEYPhQWFP4PIbT0VtL2e8nJwU3vOX/rBMUY/8JRadcgdxm+XONQudv3
   wXehwarQikNvsZnxRtCjeJIqut7pYoPK2MEhR/VdqO832GHDyI/hT5ZBE
   DooqbJiGms3qVkXR+BOavFEowCCQAmrdriZpboj2ATmpFcVKdJwugwxPQ
   w==;
X-CSE-ConnectionGUID: emCuUHj0QbCsb9Mlo7EMbA==
X-CSE-MsgGUID: 6oLJfT5kQemCiQkXwAsRPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77246903"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77246903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 14:28:07 -0700
X-CSE-ConnectionGUID: CqMXsxMaR/OnhPIMmv4+nA==
X-CSE-MsgGUID: LvZhba3fQW6ynb09sifWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235148507"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2026 14:28:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wClIh-000000000Uf-3VIQ;
	Tue, 14 Apr 2026 21:28:03 +0000
Date: Tue, 14 Apr 2026 23:27:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000
 (marvell,armada-8k-xhci): Unevaluated properties are not allowed
 ('vbus-supply' was unexpected)
Message-ID: <202604142348.aYtvXE8m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e80d033851b3bc94c3d254ac66660ddd0a49d72c
commit: 978719f90256ebee945562e82613ab6eb03fdaca dt-bindings: usb: xhci: Allow "iommus" and "dr_mode" properties
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2051-20260413 (https://download.01.org/0day-ci/archive/20260414/202604142348.aYtvXE8m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142348.aYtvXE8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 978719f90256 ("dt-bindings: usb: xhci: Allow "iommus" and "dr_mode" properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604142348.aYtvXE8m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('vbus-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml
--
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('vbus-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
