Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF92701CF
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777924666; cv=none; b=jXcVDYoH8Qhud6BjEbA2Na+h2JR9cGhj5PI3vNCCCIu0/0W9Xo/G6g3k25F93rXo5KYq3/mJXpWEOZj/I8nG4KkZ1aPo2KfWMnPJhI7LtxJ158egmPo3qQlg0RHEYrMQpC7zvq5MkF1Z/WXKMKLvPK9gJQjng9n9x54Ou/9m3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777924666; c=relaxed/simple;
	bh=R4M8q1JlX7UWofio0wY68ZGn4XNEF7nT7KuqGwtuNvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J7G5MDlCPY6TwxK5uWscQrfmDS3ZoagzeTKy0BpiCZ3g/pmJYGbab6Q+QVghtRmqZrb5IImXP2HtmkOI4Dou5QvJ+/kFHM9vO1qWv/5lURbSkombXBdz5Z2UILgfklr9lXbH0yzsDBgksi2uPq45jNfie0elbmiR6fhfCzr0R3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNs7seTl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNs7seTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777924664; x=1809460664;
  h=date:from:to:cc:subject:message-id;
  bh=R4M8q1JlX7UWofio0wY68ZGn4XNEF7nT7KuqGwtuNvI=;
  b=iNs7seTlD1l1do14EAX9Sf9L632xEJ7qYW3yonKpYgVPuo4TyA13EEbR
   NBJnhqKMynI37HwV5BnPPkUv0vFSdNGnJzguLf2RHpcZWQ+N0990L7bM7
   /AYIn9vHusm4voFPSgd0+FRK32Xmu6nOyassyCdj26gRSBqGQ5Qts5l43
   TrDeINVa2ocjtY7a34xB4DiA04h+tsYEvOTx3cWg3X/nRrE1N83WU5Vt4
   fXs59MMDxk5Rts6QPoQ3EiztMavpLtSLE3nsLReh19W3HGLCAO+qRUp0Y
   10u3eS6q0dwMXdXr/nTZw8fwfVnh/Gnzf1qcjsyc5yl8w3xl6RmV15owW
   w==;
X-CSE-ConnectionGUID: Lj4xQ5/ZQNmTu7KULL4OBA==
X-CSE-MsgGUID: G/pcTLSjSoKsLB/ry00xjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96357288"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="96357288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 12:57:44 -0700
X-CSE-ConnectionGUID: +NkrspP2SG2gdzuVH0mIcg==
X-CSE-MsgGUID: vFD5CKxDQ5ydmc3Giiew+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="265949358"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2026 12:57:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJzQC-000000005wL-2eIV;
	Mon, 04 May 2026 19:57:40 +0000
Date: Mon, 04 May 2026 21:56:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000
 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was
 unexpected)
Message-ID: <202605042122.yDXgWyi5-lkp@intel.com>
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
CC: Thierry Reding <treding@nvidia.com>
CC: Andre Przywara <andre.przywara@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 7282b8add2988b93f35a155d927d08e14558c7b8 dt-bindings: serial: Convert arm,sbsa-uart to DT schema
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260504/202605042122.yDXgWyi5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042122.yDXgWyi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7282b8add298 ("dt-bindings: serial: Convert arm,sbsa-uart to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605042122.yDXgWyi5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-2: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-3: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@60080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@a0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@8,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@400,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@408,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@c0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/arm,sbsa-uart.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
