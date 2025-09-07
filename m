Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865D25B1D2
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757245433; cv=none; b=VWoaaUZtkSW8K4T68BJLY6oalsEfdB6LOt/IRyE3zdGBFCBUmyUKrI0IJHXuRnUjAXxgp0KOo9Tik37lwOVdbrzxwkcDgCQPbv7pa0/q1YlwGofavIU7rFAIeEjtNbLwMWipDXPFC32hSaSWlmf2pBvDinoCEZUwQr6MOg0bbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757245433; c=relaxed/simple;
	bh=0swATiL8QfHjg3LuU5waGsGukPpmYpa/5yztW8Gs43I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zru4qmyJMgvmuSvUbk0tyBJFo/rVVO/PyKZQt6TBS44+j1I/4Vg0W46GcJe3aVqAfGSFh/N/ukeu4RJj91/A30qzkWLJk+olw3eZ9q9+VT2FWpgO9sLlNQGButIEMUzExs89yHMEIZaXiJ92degHRQnZ9PDD4v2GKqpmeKPqeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgmWmISp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgmWmISp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757245432; x=1788781432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0swATiL8QfHjg3LuU5waGsGukPpmYpa/5yztW8Gs43I=;
  b=XgmWmISpkOLSYaMrOyjcGMkS6jMfcTWhD7HcazWhdbUNO4cMeVEJm2cm
   LAIuBNgdiseyKqEyjcfaeODkK6+y25YdaAwdeOyHvOjjZdmQwConE8fxo
   srrawr35E6ToPFspbvQ4biLk51HRSI0wVeDjINWdAQWuSHg+fUkLdgya7
   moKV1NxyoMbxee5wzMCpn86bsb1PKfhum8WIe41MLRKwcQ+o4YAU4IdOs
   yapWrdYLaI/8fTR9VQnY6v+zYiT8FR2/U1PNCNjbEkK5O39m8ViUY55LX
   URLAy4axZ6I1MenoPzEN35oqxAePMCad3VIkAb0jStNbrEIVLaU6IJxJ4
   w==;
X-CSE-ConnectionGUID: Qff7e3FyRYayKrCB9xWqNw==
X-CSE-MsgGUID: uWCMdoaUTGiMssonWBRIJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70951402"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="70951402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 04:43:52 -0700
X-CSE-ConnectionGUID: 7J8ZHg/nQ+GU/S7CzZ2ljg==
X-CSE-MsgGUID: PtWEqsK2Q72m5BkNt/tCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="172910095"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2025 04:43:50 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvDoB-0002EN-32;
	Sun, 07 Sep 2025 11:43:47 +0000
Date: Sun, 7 Sep 2025 19:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add I3C node
Message-ID: <202509071925.AMgSWOsq-lkp@intel.com>
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
In-Reply-To: <20250904165909.281131-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904165909.281131-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Prabhakar <prabhakar.csengg@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar <prabhakar.csengg@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on next-20250905]
[cannot apply to linus/master v6.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g057-Add-I3C-node/20250905-010225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250904165909.281131-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add I3C node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071925.AMgSWOsq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509071925.AMgSWOsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509071925.AMgSWOsq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible:0: 'renesas,r9a09g056-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible: ['renesas,r9a09g056-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible:0: 'renesas,r9a09g056-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible: ['renesas,r9a09g056-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible:0: 'renesas,r9a09g056-i3c' is not one of ['renesas,r9a08g045-i3c', 'renesas,r9a09g047-i3c']
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: i3c@12400000 (renesas,r9a09g056-i3c): compatible: ['renesas,r9a09g056-i3c', 'renesas,r9a09g047-i3c'] is too long
   	from schema $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
