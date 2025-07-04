Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A881876
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 04:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751601971; cv=none; b=GjO8fxWYLM7h9xyAVASKvyGGEkZ4hWg1kRoc2kHv3CDAbiyOqMWXlHX2sv74pDaFKn4F9eVvKJ9/3VeiPjEhxRpowXMEmyjR57WsaM0T8DtrIqPUNRWW/zm2dnJ4hU+g38f5gqIxGEWOEQ9K7LLf/VvVB94yzJfljYZWytWoOtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751601971; c=relaxed/simple;
	bh=Vw/gX4jVkV1r8j/JLVXe/s5UOipG0gBjqYKrmHCeI+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LR+KzXDe0HlEdTsO5iR6fdZA1ka75r8FbgvV354PA9P3MbaVJzB5fw8GTnm1DqIAaGsKZQ5rFGzKgcOQ3Tquuv11/dC8FTX7rpilzhst1F8VqnJkDXofk1SCo2dFU3V8ja4vLq8tldlkATXxanoLRK1N01Whtxo0YJN1ICysTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKT5ERwF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKT5ERwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751601968; x=1783137968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vw/gX4jVkV1r8j/JLVXe/s5UOipG0gBjqYKrmHCeI+U=;
  b=mKT5ERwFx8sYOUZaw/mGMrTNNtYOQxSMN0wbuRUIaFI+bfCZcm2oZtGw
   5sXfy6TZp29g5E8rMktIwWYfjqobgiyKujQBfW9BmGOwc9YajswlbmaPb
   saTEZzgaWGvjlZO3HJYjgGOBp6pt9zezseT679V/Oq1b3/YpCZjiEObHo
   xVRL0qAZDwvjNdb+hv933H7uqWoYqJP767xjn6TKiAl8IzUtee966j1Mi
   09/VGYzR8pommHcnRdKN+wFcxIp9d6x8N8LC6+82gP66fQqSLot1nOaGX
   PjJnu6S77l39ugE52dvperRFS0BBL39fMdAJvnMLn+auF8Nv4ZK1P0YS+
   g==;
X-CSE-ConnectionGUID: 9sca/kg1QQ2X/N/CDLSTtA==
X-CSE-MsgGUID: qWhNZpokQkyuZa5HJpfjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54053417"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="54053417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 21:06:04 -0700
X-CSE-ConnectionGUID: 6xHTNW02QSeZ24fTeinSTQ==
X-CSE-MsgGUID: xdVnHZetRDOHd42NRzqzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="160056060"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 21:06:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXXgW-0003JT-2k;
	Fri, 04 Jul 2025 04:06:00 +0000
Date: Fri, 4 Jul 2025 12:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add thermal sensor support
 on mt7981
Message-ID: <202507041132.71D618If-lkp@intel.com>
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
In-Reply-To: <20250702214830.255898-3-olek2@wp.pl>
References: <20250702214830.255898-3-olek2@wp.pl>
TO: Aleksander Jan Bajkowski <olek2@wp.pl>
TO: jic23@kernel.org
TO: dlechner@baylibre.com
TO: nuno.sa@analog.com
TO: andy@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: olek2@wp.pl
TO: zhiyong.tao@mediatek.com
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/dt-bindings-iio-adc-Add-support-for-MT7981/20250703-054942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250702214830.255898-3-olek2%40wp.pl
patch subject: [PATCH v2 2/2] arm64: dts: mediatek: add thermal sensor support on mt7981
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-052-20250703 (https://download.01.org/0day-ci/archive/20250704/202507041132.71D618If-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041132.71D618If-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507041132.71D618If-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
