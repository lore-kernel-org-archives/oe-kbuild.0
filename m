Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8C3B3894
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480235; cv=none; b=bCHd7l9QCS9RgkKw/+ucJx8nk9Dr0h4Gs0H9XY8ERsVOXCnrORDAQF/NvTzXdMSZfYdncL0h/bD+hIZGKuyY4Gm0fTkwqVOHkrV4dnNsX4UYw92hBXz8vuAjR2bhxSiBdVWlyxjQ/JByiTPNq0GJx3PQUDiocOgkZDnJwuLB1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480235; c=relaxed/simple;
	bh=ofgilpPol3RB9QrrXCw1nS08WJssov/P58zt0ykAaRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n0zezuzhfbw9I5NnYoyo/8g5PXBxKnAaFvNTJ1zjnGQT2lyF+Lvrrdwp6A32tIRczysUfXND+negdeEz+gSOxcvQ8ueMXBqqlp7WlUF3No0Ol6lo7haBEO8h79i3zVeow30Q3I32KeE2q+K4RAdnutASCyprTQhuXUI54B1ThRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VN6qWDgc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VN6qWDgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791480232; x=1823016232;
  h=date:from:to:cc:subject:message-id;
  bh=ofgilpPol3RB9QrrXCw1nS08WJssov/P58zt0ykAaRY=;
  b=VN6qWDgcONsutZz385ZYwBJgzK0bEI+1GdBPRd6mJIbd8mf4CUbWZL5U
   XOOyn07OQTPL9cdU+irzqa3xr4wb7N343kg42ZdpQFguUhRBj9BEy9jCb
   C/o1lF1dbCa9M/L39wyTazfC2HQ7UjFZ7pgB+PJwmg4euFGf/MI/cs6kT
   8ZDNg0PHFkrDDd2b+OEyOrMEwJCEXSaF0qZkbYjhHyPWSyTB6JJpf3LTo
   xXtr/GPzYxyZr/0BqSWrOxZcmdGsYU22Gz+PGnhQlnf//obuF1R6suJQg
   zhcu3sgoT1iv8w6KZoYX58RxnlMrFhKx9ctO9sSFp6C03qyJgOqPfsf6m
   Q==;
X-CSE-ConnectionGUID: RqVjbUujSmCt0qJyqLI8ug==
X-CSE-MsgGUID: L+YuM7HSSnCD0FAaeNfiMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="268903"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="268903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:23:51 -0700
X-CSE-ConnectionGUID: bayn9MNvRqWVRVtAGWdkhg==
X-CSE-MsgGUID: 7a6On5NuTuScKtn8U6JaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="211888"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2026 10:23:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xErqO-000000005nP-2I7h;
	Thu, 08 Oct 2026 17:23:48 +0000
Date: Thu, 08 Oct 2026 19:23:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit-com:wip/k3-pm-v2.4 44/45]
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: gpu@cac00000
 (spacemit,k3-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202610081917.o0WdtmYS-lkp@intel.com>
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
TO: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux wip/k3-pm-v2.4
head:   6f866f6a11e33b4cdfc71149681779041dbc310d
commit: 036fddf701ce097e2203c49a1657952a5c1ebb8a [44/45] dt-bindings: power: spacemit: Add power domain controller IDs
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-2400-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081917.o0WdtmYS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081917.o0WdtmYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610081917.o0WdtmYS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: gpu@cac00000 (spacemit,k3-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too short
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too long
   	'spacemit,k3-gpu' is not one of ['mediatek,mt8173-gpu', 'renesas,r8a7796-gpu', 'renesas,r8a77961-gpu']
   	'spacemit,k3-gpu' is not one of ['renesas,r8a77965-gpu', 'renesas,r8a779a0-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62-gpu']
   	'spacemit,k3-gpu' is not one of ['thead,th1520-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62p-gpu', 'ti,j721s2-gpu']
   	'img,img-gx6250' was expected
   	'img,img-ge7800' was expected
   	'img,img-axe-1-16m' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/gpu@cac00000: failed to match any schema with compatible: ['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
--
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: gpu@cac00000 (spacemit,k3-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too short
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too long
   	'spacemit,k3-gpu' is not one of ['mediatek,mt8173-gpu', 'renesas,r8a7796-gpu', 'renesas,r8a77961-gpu']
   	'spacemit,k3-gpu' is not one of ['renesas,r8a77965-gpu', 'renesas,r8a779a0-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62-gpu']
   	'spacemit,k3-gpu' is not one of ['thead,th1520-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62p-gpu', 'ti,j721s2-gpu']
   	'img,img-gx6250' was expected
   	'img,img-ge7800' was expected
   	'img,img-axe-1-16m' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/gpu@cac00000: failed to match any schema with compatible: ['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: edp@cac84000 (spacemit,k3-inno-dp): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: dp@cac88000 (spacemit,k3-inno-dp): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml
--
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: gpu@cac00000 (spacemit,k3-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too short
   	['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too long
   	'spacemit,k3-gpu' is not one of ['mediatek,mt8173-gpu', 'renesas,r8a7796-gpu', 'renesas,r8a77961-gpu']
   	'spacemit,k3-gpu' is not one of ['renesas,r8a77965-gpu', 'renesas,r8a779a0-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62-gpu']
   	'spacemit,k3-gpu' is not one of ['thead,th1520-gpu']
   	'spacemit,k3-gpu' is not one of ['ti,am62p-gpu', 'ti,j721s2-gpu']
   	'img,img-gx6250' was expected
   	'img,img-ge7800' was expected
   	'img,img-axe-1-16m' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/gpu@cac00000: failed to match any schema with compatible: ['spacemit,k3-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: edp@cac84000 (spacemit,k3-inno-dp): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: dp@cac88000 (spacemit,k3-inno-dp): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
