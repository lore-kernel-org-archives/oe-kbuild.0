Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53137377A81
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791110504; cv=none; b=Yfk79uTgMUiJIeAb2MZ27McwDQgPOj0CeggM9/bGffjuUdZY7RqnN93plDKeeO35ps+C+pYecCy38vCcUx5Ot7FqN4vyb3b9T5N+p+341wXkAqZguchVhJISxr+MzN6chO0durLlw85OC/6VL82/hzkULe0aHrsABaf64ucH2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791110504; c=relaxed/simple;
	bh=+0CKYn1e8Z+9MdWqecf8cxzEz0zurmfNuDyHOqhv5tQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GNaDZTjl3XtKsV+Rxu7Ts2FxixoYYyCvhdJXd6CvrELO2UONLaBFZHpHewNXfeI9+pCH1dAqv5M5Ie7r24y/rkRa9oQeSBHMfrWxKVqkKRH6ZQwyB9IKPmtn/TjgMMzOS6xIAh5PXBF9LySzVoUi8b5yckfWzLgeAInF8ltf2Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oG7fKcX9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oG7fKcX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791110502; x=1822646502;
  h=date:from:to:cc:subject:message-id;
  bh=+0CKYn1e8Z+9MdWqecf8cxzEz0zurmfNuDyHOqhv5tQ=;
  b=oG7fKcX96al9A8I8whDsCV5VdV+qJS/FOePFpHMTIi8WEG8RWOt+z6l2
   +Slalos+/T++xWHUkwQcIWOH+X7SadaKFfed63KbHyoKzL0+KvspE/Up5
   TQmhnzt45/+3KTtaJ871TuNowRoXIwLl1X51yO/s71VM1kbTvp3bD8uVm
   nWVumG+39fK0BdRVd3heP3+tlGcvNkYf0Adr3Nlj5aDuVdsfPq/bpFuEB
   g2n9T+jzP4MBqDfNdibVWnVr1fesbVZQdCWM0QBMDOWxDCS7f4N3bsQvZ
   oSiWe8Nl2zZmxrZB7kidQVoE5tkDIUCZduCiMk5/i8fVfr+oWLhwyjqjK
   A==;
X-CSE-ConnectionGUID: I48w1VLlQZ+lMDOquBEmYg==
X-CSE-MsgGUID: KJT3RD3IQZePLQvTo1q57w==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90862655"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90862655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 03:41:42 -0700
X-CSE-ConnectionGUID: ZPKCR6DwTue3rIePSeJJKg==
X-CSE-MsgGUID: 3e0AnHHPTTKPJ5hwSAVgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="276141209"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Oct 2026 03:41:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDJez-000000000Gv-2bSg;
	Sun, 04 Oct 2026 10:41:37 +0000
Date: Sun, 04 Oct 2026 12:41:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-tegra:for-7.4/arm64/dt 31/33]
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /ahub@70300000: failed to
 match any schema with compatible: ['nvidia,tegra132-ahub',
 'nvidia,tegra124-ahub']
Message-ID: <202610041237.W4tqFlMB-lkp@intel.com>
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
CC: linux-tegra@vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-7.4/arm64/dt
head:   ad4deb2e42ebb94425c003ca3ca39691ebe61e0f
commit: 13597d07c4e903cb351805636298608196a08a45 [31/33] arm64: tegra: Add Tegra132 specific compatible for AHUB
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2401-20261003 (https://download.01.org/0day-ci/archive/20261004/202610041237.W4tqFlMB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041237.W4tqFlMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041237.W4tqFlMB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: sd1: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: ldo0: ams,ext-control: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra132-mc']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible:0: 'nvidia,tegra132-emc' is not one of ['nvidia,tegra114-emc', 'nvidia,tegra124-emc']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc']
>> arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra132-ahub', 'nvidia,tegra124-ahub']
>> arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra132-ahub', 'nvidia,tegra124-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
