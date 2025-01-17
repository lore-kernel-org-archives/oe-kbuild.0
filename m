Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA41F8691
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110547; cv=none; b=Ttkoio29A7/Buu0dNeqSzbbPIq4iFEgk0bkWO44Kpi3rv0TfMaROTuCv80Y289EXHKU0R0TbwgsSjLuLjsey2dIXI/NNqsZoV5icQsc1SnUhZ3NM3H0pyS1t2VXLbF79TRnkmwY45iWpDJmVB8E479XvoUSOdqpI380UI8Yii2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110547; c=relaxed/simple;
	bh=9ct5JuyYFjL/AxmTWEtbNNMnNo7piOeHuh17YWHv20Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+cKyJ7gRG9XkFs8hjWXR+g5CeIZdhfGSnC2WFIVB4MZBsvKxriUbhnIi9Ijg+8qjBv86IiUI6qzI/ue+TpgZwsENwgJU4CMjDbxAVSL5S5B+1KIiWPOOJFhHduRFE1TBIZjlamE1gGgcp+sGDYc8Zkmf26Dwz+BpnmI92HvqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4DosYm4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4DosYm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737110546; x=1768646546;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9ct5JuyYFjL/AxmTWEtbNNMnNo7piOeHuh17YWHv20Q=;
  b=g4DosYm4m4p8pMLx6k9VIvFgEOFeq+teGPoVkWN00NxGGnJXCTQKC/Pd
   E32IdImmN+ppq+x+rwoUsARg25ojJeY0UxMJP4+8AwYV8+fDKAHh/3S1j
   0bQbDCxhPM2VLeeBNGlaah07120WW+9Y+1kfuDHhQpkL0N4LtjGvOZj97
   lzWQOmc0bBicz8gtdsRkWKGo1VNfSYLDEWcnPGLgZwTzAe1jrdxvIb3fP
   KKSTnyDKfJdoeDiuHOXm9TxfSPaLhVS+cLSEeYfn7KXgszMcFov2+V6ja
   /dRqRF0eO59w6ztgeTdPk1AYQSoB7/bgbtj48fXwYozQmz2NH82nqFZJq
   Q==;
X-CSE-ConnectionGUID: JhwOnXcRRWWC9H4wl4biEQ==
X-CSE-MsgGUID: fJSHXWz2TEyyosvuulb/pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48956213"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48956213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:42:25 -0800
X-CSE-ConnectionGUID: 5yXqYvQpRne+955tejGiCA==
X-CSE-MsgGUID: 6dxv6Rn+TNqSe96DQ97ZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105734350"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 02:42:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjny-000T4w-1U;
	Fri, 17 Jan 2025 10:42:22 +0000
Date: Fri, 17 Jan 2025 18:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v14 3/4] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Message-ID: <202501171821.GL4b92Y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250115-pxa1908-lkml-v14-3-847d24f3665a@skole.hr>
References: <20250115-pxa1908-lkml-v14-3-847d24f3665a@skole.hr>
TO: "Duje Mihanović via B4 Relay" <devnull+duje.mihanovic.skole.hr@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
TO: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: David Wronek <david@mainlining.org>
CC: Karel Balej <balejk@matfyz.cz>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-hardening@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: "Duje Mihanović" <duje.mihanovic@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/dt-bindings-marvell-Document-PXA1908-SoC-and-samsung-coreprimevelte/20250116-044350
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250115-pxa1908-lkml-v14-3-847d24f3665a%40skole.hr
patch subject: [PATCH v14 3/4] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171821.GL4b92Y8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171821.GL4b92Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501171821.GL4b92Y8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
