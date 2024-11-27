Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E0433C8
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749450; cv=none; b=aqa0oE23h5R3TajMSLI5x+ln3kr/QkYJH6YmAm9MiYuYqMjT3G7SpPbWaGENBVVgj/vhbo/bfqfkT69zx7Bxh4WcYiCGA/AVNOeL93jnPGkY0cgKwdp3Fj/183YWDcFHr4g9FGLzVwhG6wbPwWVliiN81KqPGPot4asvraOgNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749450; c=relaxed/simple;
	bh=3M9e8Q2HARxw7R4N40oIeYynrBX11JScX9/rOelsi18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQ0rg59Cgw86xZlOP/D33Kg756iVrn0RHK+uuNgtK76laLg5f/We3al9QltY/rNhfR5mFaxDEcapIS+qVj+mvpXCLY/kYxo8nKPAzjuePhtEbXN1iO/LxIn5t0n4NW+gO9T+ft0Y2dZSp66Fdx40oDm2kZrss9Qb9pb8TeG2MW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULZ8np8r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULZ8np8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732749448; x=1764285448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3M9e8Q2HARxw7R4N40oIeYynrBX11JScX9/rOelsi18=;
  b=ULZ8np8rprzwaj35zIDusJdlRyeAoj1azm6huaGb0KHua5KjvoAt+xfE
   93NilzKRG/XLtwH6FVp3cXVcfNjVY3cJRUK2ECRogmu0jHUKZFqRqMhcG
   KUYm35KNLVs/I1sZFlPKB7pqXnh1wquoc+iZTdwRaxL0pLCW5W4MBprU1
   I/wM+CUcbggppuByIEV7BL08eChHenfiwx+yWMDba8yXgWz0EMCWEVBJ7
   9DI8gpoMp1SVXbCCrWbnxu+vYWSZojVLF4tEYhyzF4l+KokLejoT4ft2a
   5gAWzoLLIiFQcddhN0pf9B+Iv9onjuPQTe5pErqZx8tM6CKoWI9EZMjCZ
   w==;
X-CSE-ConnectionGUID: QOeYaw0cQXmaX7LbczGUqQ==
X-CSE-MsgGUID: MvxCa+dDTOG314FO8iR3qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43460653"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="43460653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:17:28 -0800
X-CSE-ConnectionGUID: Si0AvSXkTnmQmKpI7jvcfA==
X-CSE-MsgGUID: /c4uqjNaQBCBeVzc+teuww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92001212"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2024 15:17:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRHg-0008R1-1i;
	Wed, 27 Nov 2024 23:17:24 +0000
Date: Thu, 28 Nov 2024 07:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
Message-ID: <202411280729.WFy8IMCE-lkp@intel.com>
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
In-Reply-To: <20241121032619.16525-1-herbert1_wu@pegatron.corp-partner.google.com>
References: <20241121032619.16525-1-herbert1_wu@pegatron.corp-partner.google.com>
TO: Herbert Wu <herbert1_wu@pegatron.corp-partner.google.com>
TO: linux-kernel@vger.kernel.org
CC: geoffrey_chien@pegatron.corp-partner.google.com
CC: hsinyi@chromium.org
CC: shawnku@chromium.org
CC: Herbert Wu <herbert1_wu@pegatron.corp-partner.google.com>

Hi Herbert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12 next-20241127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Wu/arm64-dts-mt8186-Add-mt8186-skitty/20241121-155513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241121032619.16525-1-herbert1_wu%40pegatron.corp-partner.google.com
patch subject: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-052-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280729.WFy8IMCE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280729.WFy8IMCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411280729.WFy8IMCE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,skitty', 'google,corsola', 'mediatek,mt8186'] is too long
   	['google,skitty', 'google,corsola', 'mediatek,mt8186'] is too short
   	'google,skitty' is not one of ['mediatek,mt2701-evb']
   	'google,skitty' is not one of ['mediatek,mt2712-evb']
   	'google,skitty' is not one of ['mediatek,mt6580-evbp1']
   	'google,skitty' is not one of ['prestigio,pmt5008-3g']
   	'google,skitty' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,skitty' is not one of ['mediatek,mt6592-evb']
   	'google,skitty' is not one of ['mediatek,mt6755-evb']
   	'google,skitty' is not one of ['mediatek,mt6765-evb']
--
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,kakadu' was expected
   	'google,tentacruel-sku262145' was expected
   	'google,tentacruel-sku262149' was expected
   	'google,spherion-rev1' was expected
   	'google,dojo-sku3' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /: failed to match any schema with compatible: ['google,skitty', 'google,corsola', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /: failed to match any schema with compatible: ['google,skitty', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
