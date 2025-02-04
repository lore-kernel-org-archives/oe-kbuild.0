Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255ED219A70
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700698; cv=none; b=b6+71i54v1t3wEJs4fAmCdWc6UNuT4nHkMxJBk8J73Ixa0xpN6SxTvOYiZAqwYVdoHSoXaZchHdOIDhPzlSkX9eKjXPYJXnrsQRfWkn7h94E5t7jjdbJxNPQu9bGSANSmJKzDkXTPJA69fpwfIab1dcorr9j2y+NXmwPTMZp24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700698; c=relaxed/simple;
	bh=yfbfswtnx+ivIB4K224qxj9uxxNji4o49K0H9m+3jas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfyXD3Tmq/ejKndH4UyLLieaYzwkCqrlEh2TyF6DnqY8/rNqekXogUkRxHUBM0To1G3rD6CJgxqImwBHWR/NeEN076AECv3J4n9uza4tPZMnAqCudJtotLHTM7me7bpkNi2Xyvp8Z5LONZLIguDouZDYYTwt0sECv2UrXXV19gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXEjHPPT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXEjHPPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738700694; x=1770236694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfbfswtnx+ivIB4K224qxj9uxxNji4o49K0H9m+3jas=;
  b=SXEjHPPTWmZwoQIWBWdI5+NPlAO5smcQ0brwTm3EicNLHvAqZmlkeFZR
   vAQdJNmO59mD6wziPrmT9RFVqiG/cd/uFzzseETMHYjd62spObNV1oDMI
   gxCsQEqA421jk2Bkmy8WBfIq3OIrd+FEiezfTGfsgPfMTBjHVvzHCBOsz
   HTtvAXp4wyPCofDazr68EGY/x6i0bRrk3bpQYRgAKiAw9K4J00SFk1BVv
   pIFNfBWN4bGHIK0hWegHpjU3sbjbbFpribO8MZhhBQ0qFChjJMnDzLN4L
   16HTQSvJ3Wg7K8jFsvcrv0jzVqD8/yKnGwtgGY6BVGWE0ZTVzcnbbKH6s
   Q==;
X-CSE-ConnectionGUID: BSV6oMakSl6zQepXsIh69g==
X-CSE-MsgGUID: Y/jldOIQQL6bVkBU8lIBlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42902142"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="42902142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 12:24:53 -0800
X-CSE-ConnectionGUID: Hls1m5EsQEGUfOsUNytAlQ==
X-CSE-MsgGUID: M3E3GOqMRwKSeW7jNDOkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141563650"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 12:24:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfPTV-000syJ-0y;
	Tue, 04 Feb 2025 20:24:49 +0000
Date: Wed, 5 Feb 2025 04:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML
 format
Message-ID: <202502050407.F26uwQuJ-lkp@intel.com>
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
In-Reply-To: <20250203091111.21667-1-andrei.simion@microchip.com>
References: <20250203091111.21667-1-andrei.simion@microchip.com>
TO: Andrei Simion <andrei.simion@microchip.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: claudiu.beznea@tuxon.dev
TO: alexandre.belloni@bootlin.com
TO: broonie@kernel.org
TO: lgirdwood@gmail.com
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: Andrei Simion <andrei.simion@microchip.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00f3246adeeacbda0bd0b303604e46eb59c32e6e]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Simion/ASoC-dt-bindings-atmel-at91-ssc-Convert-to-YAML-format/20250203-171330
base:   00f3246adeeacbda0bd0b303604e46eb59c32e6e
patch link:    https://lore.kernel.org/r/20250203091111.21667-1-andrei.simion%40microchip.com
patch subject: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML format
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050407.F26uwQuJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050407.F26uwQuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502050407.F26uwQuJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: ssc@f0010000: compatible:0: 'microchip,sam9x7-ssc' is not one of ['atmel,at91rm9200-ssc', 'atmel,at91sam9g45-ssc']
   	from schema $id: http://devicetree.org/schemas/sound/atmel,at91-ssc.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: ssc@f0010000: compatible: ['microchip,sam9x7-ssc', 'atmel,at91sam9g45-ssc'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/atmel,at91-ssc.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ssc@f0010000: failed to match any schema with compatible: ['microchip,sam9x7-ssc', 'atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0028000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0028000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0040000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0040000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
