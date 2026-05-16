Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6191A683B
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897243; cv=none; b=kI+bN+sIjX2pajMV1+IAOhyzNRM/WLU6UZEsvKsd1tmj7y0u2yzRPRgYZ4jK6iI1qGGWY6+1eK5x/lePkZnAVg132cCeOH+W3GcZXw2lFsgy9jwmnIUpukKEXodXdhj2YcOuwfWvkaNguRk8Ri5EFlFhM7u0SEbYGkrUBObFLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897243; c=relaxed/simple;
	bh=+TzHpLP3sD4y8bu6AYbP79383lWz7twEynkx1ha49g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg+4pdWw9cIxCJrLLxNdzstLY5QQpIsCY+Kim2F6eBoEPC7KwGBZCH3dcQ5McxYGd5U+T0BoD4q7wC7mDSIH1j5iJhTiX6jcPK1iWWJAzTn7gbbMXTs6Tpdx68KFD3Okd3ISpxSpsH6cML3q7DMozPl5aPIcFxuK2L6Rhy+tWgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+U49a90; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+U49a90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778897241; x=1810433241;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+TzHpLP3sD4y8bu6AYbP79383lWz7twEynkx1ha49g0=;
  b=Q+U49a90MnnqgPnMbBJdHqxNfcN/MbfVOzdSwKu0hzr/w1MgXPtDQAK7
   QpCC8/OymJxJEvFShifVGgHkrqHHer2oqxBiYuSm4O61MJ0+HbBBAdEAY
   8ZdwWGtLDpYpB4S2Eo9TNZFg+hkRmXu9PbYn9y5uhzKDyxa16/4+sXq0W
   slBJmgUc3a/0QPgG+NrYVA5s4vt0EBd3lS/D6esRMqHNWzqGaFpPx+c9m
   b5hRM9FInSqIU81qwXFX5He8sjNkqQh9QCM6WNyXomDLqDXWYTczf2P2V
   p/P/ECJ5PpQEs1VL1IRf4ggaKihOgvCK36dZDTd/AJpoVddKc0IVHPjAZ
   w==;
X-CSE-ConnectionGUID: ZAU8AkzUQmaw9DmqD4Z+TQ==
X-CSE-MsgGUID: +brmeWgyTr6hWbNflwHZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67381299"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="67381299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:07:21 -0700
X-CSE-ConnectionGUID: Qy3KTJHTTf+eqtaySl2/2w==
X-CSE-MsgGUID: SmIV4QAxTK23VMrof6x1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="234411697"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2026 19:07:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO4Qw-000000009AX-10bb;
	Sat, 16 May 2026 02:07:18 +0000
Date: Sat, 16 May 2026 04:06:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
Message-ID: <202605160438.P6xvpbyD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
TO: Michal Piekos <michal.piekos@mmpsystems.pl>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Maksim Kiselev <bigunclemax@gmail.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Michal Piekos <michal.piekos@mmpsystems.pl>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Piekos/dt-bindings-iio-adc-Add-GPADC-for-Allwinner-A523/20260515-200558
base:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
patch link:    https://lore.kernel.org/r/20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb%40mmpsystems.pl
patch subject: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-2052-20260515 (https://download.01.org/0day-ci/archive/20260516/202605160438.P6xvpbyD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160438.P6xvpbyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160438.P6xvpbyD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clocks: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'Bus clock'}, {'description': 'Module clock'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow 2
   	[{'description': 'Bus clock'}, {'description': 'Module clock'}] is too long
   	[{'description': 'Bus clock'}, {'description': 'Module clock'}] is too short
   	1 was expected
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clock-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'bus'}, {'const': 'mod'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: allOf:0:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow 2
   	[{'const': 'bus'}, {'const': 'mod'}] is too long
   	[{'const': 'bus'}, {'const': 'mod'}] is too short
   	1 was expected
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
