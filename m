Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3D6FC3
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752412006; cv=none; b=fAIWZuTne2Z5V5DnHrsTox+dqRnf7gvDXOuGSNRc5ALHM/GaMSUArQFbu2bADQN95PgK1lrN8OPVxOUqvmVNZDUpTn7+IIDfKHjsO73JbMW052GshSfxxuiDwIjDJ660d8NOQVxMoTOLon9iGed08zw+9hG+UwvJ82fBcKTBxM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752412006; c=relaxed/simple;
	bh=wjbzuM0ulQ+rIEgNg86rGwdEmRkgNo8Xz7zs7Fgx/k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjxJ3GNglzMHVExKXBJfy0i3H+HM2TffV1Puz+yuJNTVaniTgwFz801AcILSE+uCwPoaOL/6aQ2jvBP8L09GKYACkzsVhDMyQIh4kld5dtSI3umTiKjb5OGfyzLnnftV5i+5M+NNDmEBANYjPV6JeV5h+aRR2OIzVaaViL7/6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rnl/Txhs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rnl/Txhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752412004; x=1783948004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjbzuM0ulQ+rIEgNg86rGwdEmRkgNo8Xz7zs7Fgx/k4=;
  b=Rnl/TxhsCdkTYZipCTLguQavpYYWQu1QAAFe6eP26wAssoztmM25R1il
   fD6HLYvndFziQT0WxNI6AN0sMG8qGKaph0uNiYyU9UXs8oL+VVZo0ZpNy
   +1NTdgmfidd/7KR1ED/dEFjjPK7mneOJr7EnjubWLauQ5uceDiUa7Ffaq
   OR67ynn29679dkmHkTYIX8D4bd5TDaVG6TIClExiGIHE4JCeie4tLoFM1
   zmY7MnVhHQJwlBP1J/+2UeXwVdHeAsRehZ6SzDYC6Ur5wevAvSPMYuMD5
   fc39qOJaOvWaigzHq00E8XWnpFOd892O2/YkEiODBNdF4yT9WM4xT4rKa
   g==;
X-CSE-ConnectionGUID: 3Uj1VvNcTryq+c9Dg4PZJQ==
X-CSE-MsgGUID: 9UQ2cA5uSWmuufrDl9Jk8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66071894"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="66071894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 06:06:44 -0700
X-CSE-ConnectionGUID: OR4hSZgLRpaxJSjRlvtuBQ==
X-CSE-MsgGUID: LaA/65fbRL+Jw5I8HHR7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="161044247"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2025 06:06:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uawPf-00086R-2r;
	Sun, 13 Jul 2025 13:06:39 +0000
Date: Sun, 13 Jul 2025 21:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/2] arm64: dts: mediatek: add thermal sensor support
 on mt7981
Message-ID: <202507132047.0up35WqV-lkp@intel.com>
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
In-Reply-To: <20250712195904.6988-3-olek2@wp.pl>
References: <20250712195904.6988-3-olek2@wp.pl>
TO: Aleksander Jan Bajkowski <olek2@wp.pl>
TO: rafael@kernel.org
TO: daniel.lezcano@linaro.org
TO: rui.zhang@intel.com
TO: lukasz.luba@arm.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: s.hauer@pengutronix.de
TO: rafal@milecki.pl
TO: linux-pm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Aleksander Jan Bajkowski <olek2@wp.pl>

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/dt-bindings-thermal-mediatek-add-falback-compatible-string-for-MT7981-and-MT8516/20250713-040005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20250712195904.6988-3-olek2%40wp.pl
patch subject: [PATCH v4 2/2] arm64: dts: mediatek: add thermal sensor support on mt7981
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-051-20250713 (https://download.01.org/0day-ci/archive/20250713/202507132047.0up35WqV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507132047.0up35WqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507132047.0up35WqV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc']
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
