Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45D195
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732369431; cv=none; b=dB6/DxkZZTFVLoNThi6w7jm2g2D+nofhz2MOwDqzcNR4Ite/cFoH6rPIMZ8eSt2j1tvsmXd1AGAERg2gpeQKyjjwIlneytIFwyAWljm0C+SN4jFCdBknEfeSf1vtVdaDjpBNBp3QCU1NNi+d9ERNZGsCEl6zxcRDzJzxXQOJgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732369431; c=relaxed/simple;
	bh=t2ZgwIEqAmv2JzNcYd5l+o2En3MKrI5qSKTTV8CTwmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWeLuj1tmwz1QYR+rr+V20LPPnvl9BYvDyePSUPs0T0iWIZtBHHLhIfuyu4kWGNlhcHcchjRmi8tNAk91nHNmBAmZ+oSMctu+qhjzg/t2Oh2RlRen/lCrSLknfMRUNzUH7YHK6ltrKpWJDIu6tQQT2B8+OVvZyA0D3/Z5elBogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btWpwE37; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btWpwE37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732369429; x=1763905429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2ZgwIEqAmv2JzNcYd5l+o2En3MKrI5qSKTTV8CTwmI=;
  b=btWpwE37OjFuw8anaNVy+U0pLhHGlfzIm+XO2RgroXOZWT27XG4GDYmU
   fdPgbYu/7jJq9yzrQ1o532lbxWiMdRKSD9yN0xUtjFahAyrLQJJixyDco
   /eCSe0+QwdVUWhCEGZx/6L82c1STSz5aWvNQssFiCT7N4sFzIfsKILQSX
   w1ygyA3wqxah5SeklWwTGVDC/kSIQPXagdC+ICD0TNRT7N7hmUEnzmv9j
   SbTftH7q+BKd9RVUZRTBawHzI0cLS+K1MwSYfhXj98CXx0/vKTMztdgmw
   WinGe+6ddbvoxP8xdYeElJU2C2oY8UcfVTmOVH3pmDtmHNEW6YjhwVV7X
   Q==;
X-CSE-ConnectionGUID: vtUhM2tCQU+N6xDSqQcjtA==
X-CSE-MsgGUID: UmkD4EJPS5OFRIj9Zsk5eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="43025798"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="43025798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 05:43:49 -0800
X-CSE-ConnectionGUID: DF7FRb2dS4eBJdYXXrOD5A==
X-CSE-MsgGUID: qq81BnDVTwChb8SmW4QZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91185105"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Nov 2024 05:43:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEqQL-0004eR-3D;
	Sat, 23 Nov 2024 13:43:45 +0000
Date: Sat, 23 Nov 2024 21:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
Message-ID: <202411232127.AXsthle9-lkp@intel.com>
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
[also build test WARNING on linus/master v6.12 next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Wu/arm64-dts-mt8186-Add-mt8186-skitty/20241121-155513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241121032619.16525-1-herbert1_wu%40pegatron.corp-partner.google.com
patch subject: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20241122 (https://download.01.org/0day-ci/archive/20241123/202411232127.AXsthle9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411232127.AXsthle9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411232127.AXsthle9-lkp@intel.com/

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
