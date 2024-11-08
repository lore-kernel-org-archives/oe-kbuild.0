Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEDC14A90
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 01:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030960; cv=none; b=kwH0THeAqUP5KlFH8BkxsRvmLjG0TR7FXs8m0boKhaqnsGK2gr/iDG8h4yr2GlAArRGvEqata8L/zsqlXq/gusKGnAILB8vgpJj75vrJHtB1RUiNyF/ZuSEJbrB7mLCb1WDQ5tvxaLSyv7oIg1ISR1dHYAMb7vNPmr/c2gMZEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030960; c=relaxed/simple;
	bh=AOVjfWyCSGec1KkulaHelVUEcaO/1/TG3NAbwr9xkpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBiHe46Th1uAZk0cxmdd0XL6t9XN6OsJaEN6XnVXOC89/IKDnqf030rTzqHyDcATPjJBHkVf7lg4nQ9KxP6AbfG25aSgnr60h5+uKQ7r4XD/sWQi+w6nJdHS0M+1pVFPmX3N1B29cVIyT0P77XhYlrxlowQ9o2nI/E/V5blgUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLoo8Kfn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLoo8Kfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731030959; x=1762566959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOVjfWyCSGec1KkulaHelVUEcaO/1/TG3NAbwr9xkpk=;
  b=cLoo8Kfngng7WnhLHM8qOHB5IrEwKmsJpQb4fbeO5XdkMqU+v08Kc/iC
   UODRzV2WLBgpzsvt4jVdv4mgPwDQYAi6zTpkYmEVvpk4i+fKTreR4+JOE
   9VxBu6NAX6iqH1F7aA+46xuHoE+lYODPeVUut1VQMpGFp35ILjBXK4Rqr
   JgRlifnl7qgX66us9gWBoiho+cKJw3F6TmwdYV/+bPxsWT+5u1qCCTQg/
   iI/TjsprRfka3FNZ9DO6VWb9qJ+gTf5pCLxtSLtlLVmkXi67oTIA1IoB6
   +DhHPbNXkhdVZFZ9jAuZF2WL8U0qUGXsAgl1yb7wwynK2FpU6X6HIoATn
   Q==;
X-CSE-ConnectionGUID: oFgBD/DtQDqtqedYcdwrQA==
X-CSE-MsgGUID: t4H5YAb2Raak1SjFnIU0RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33753701"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="33753701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:55:57 -0800
X-CSE-ConnectionGUID: TNc8BNQaS7GFsQXafLNd9g==
X-CSE-MsgGUID: 0PN+y/K4Qk6ZDejALs64pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85650675"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2024 17:55:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9EDr-000qtW-0k;
	Fri, 08 Nov 2024 01:55:39 +0000
Date: Fri, 8 Nov 2024 09:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Message-ID: <202411080949.t4LFRG5P-lkp@intel.com>
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
In-Reply-To: <20241106100741.173825-4-y.oudjana@protonmail.com>
References: <20241106100741.173825-4-y.oudjana@protonmail.com>
TO: Yassine Oudjana <y.oudjana@protonmail.com>
TO: Sean Wang <sean.wang@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Andy Teng <andy.teng@mediatek.com>
CC: Yassine Oudjana <y.oudjana@protonmail.com>
CC: linux-mediatek@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Oudjana/dt-bindings-pinctrl-mediatek-mt6779-pinctrl-Pull-pinctrl-node-changes-from-MT6795-document/20241106-181127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241106100741.173825-4-y.oudjana%40protonmail.com
patch subject: [PATCH v7 3/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080949.t4LFRG5P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080949.t4LFRG5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411080949.t4LFRG5P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pinctrl@10005000: interrupts: [[0, 153, 4], [0, 154, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: timer@10008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pwrap@1000d000: 'mt6331' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
