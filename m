Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15D1F7569
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753991127; cv=none; b=HztKdRFOAJ83g8cgAycayd68KzxlUuEE69HUd+APjQx+6CkzxMubPcMyY3pMwgLHHxJf0TPL5thH2E3FW6Nr2SbkUMb5yPb8ciPf32eVFE0JP10jAlFPY5EqK4/bzZLolecRss6KcRDKdikVIHrXMu42xTq8QKHzPlODsyMly5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753991127; c=relaxed/simple;
	bh=Br1jieaLxVR2f64tt1DG92eCF9VpB6t31q3GHZ4SKVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buaXkkJu2RbTIA7c7b7inJm173PK+d+KU6Uzd/c5U5oPuN3KuhCQiBZErPP4eQVC38EeKgWY5Ct3WOzRmyackiYrkjHEkJOc1ZfaXYSedC8JvwlapiG2V1NQIQdZjm7Jxssz3DGOFKIZrtVUwdG/B0Qu5/cxwOUQiv2S61ohjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmtcLXM1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmtcLXM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753991126; x=1785527126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Br1jieaLxVR2f64tt1DG92eCF9VpB6t31q3GHZ4SKVE=;
  b=SmtcLXM1laHqFrUeIjGd4SnKIuq/iI1eW8n4qwBPF1wM5ojYRmYkvOdG
   bB73PC9ML/3OujI0FlRs5vSf5anl9VwyUTAo1dLjmCk6fs88UD0b2rkgQ
   ygL0SHLeDVMJMgg+ffs/shzuVlanurManUfckNhaGh+weO6J8E59FgWQ3
   yFG9yuT6hl8J+Y+sAFzO4t1Q906mOeEHiASfgfzzCTLwlscW8fhR4p1gt
   vPAwBzqtJsOgSt4uHe7Og9tzGrygyaeHQmckK9oYumPs3kuscEku48H6y
   6p7jxvgh946UHr5emvaEzuShP4LPNoM1GyoLydlVIXhsOittbxj9Po6uT
   A==;
X-CSE-ConnectionGUID: FVsWhQDiSICiZnkcOLSW0g==
X-CSE-MsgGUID: lGdlKEiHSI2PEnA2fLwoHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56260644"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56260644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 12:45:25 -0700
X-CSE-ConnectionGUID: IayHk955TEKl37D6M1N5Jw==
X-CSE-MsgGUID: JOOdnuq4Tn68u6tLusoh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163795083"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 12:45:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhZDN-00042a-2f;
	Thu, 31 Jul 2025 19:45:21 +0000
Date: Fri, 1 Aug 2025 03:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic,
 regulators, rtc, keys node names
Message-ID: <202508010303.oHL3M7CF-lkp@intel.com>
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
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
TO: robh@kernel.org
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: chunkuang.hu@kernel.org
CC: p.zabel@pengutronix.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: jassisinghbrar@gmail.com
CC: mchehab@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: chunfeng.yun@mediatek.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: sean.wang@kernel.org
CC: linus.walleij@linaro.org
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: andersson@kernel.org
CC: mathieu.poirier@linaro.org
CC: daniel.lezcano@linaro.org
CC: tglx@linutronix.de
CC: atenart@kernel.org
CC: jitao.shi@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next v6.16]
[cannot apply to linus/master next-20250731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-17-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250801/202508010303.oHL3M7CF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010303.oHL3M7CF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508010303.oHL3M7CF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0: 'vcam_io' does not match '^vcam(a|_af|d|io)$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('mediatek,latch-ck' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
