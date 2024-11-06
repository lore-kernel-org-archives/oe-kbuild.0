Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462318F2DB
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730866510; cv=none; b=dvzb4f03Fvkm6uAI3Dm+J81ooTxmIC3DXzxDyYszRMsBeFGeraKOcVlnY88rYOz7Oh//jSQvKCA5ROPxrGYs3rZSuOEeZB5RLz+7suwzCJIxdzM2dXST+CiLJM52ft2Pf06mjB/wqMjknt2ErlJv0XNsHJECPrOfUfaRo2iKvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730866510; c=relaxed/simple;
	bh=twyEqcjjSyxl2NOkRzi9Muo4adaM9wow30rn0KJ2DuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tyv+w2MHXnTgsUe7jIqMkz+2BeJxVx9ZJVCynmi4QSetbegGxES3wNkr9uYIsgOPvrPit9wWR/SVmvI1OcNo/Svs0PTH7wvbk9hHSXMyh8K83ZzEFCVaHY6a5+N4wbq7L8RR4vPIvjoEAcb5v2FE8npKnCNa7kYA5XRRZq9V2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk3Ssd6j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk3Ssd6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730866508; x=1762402508;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=twyEqcjjSyxl2NOkRzi9Muo4adaM9wow30rn0KJ2DuY=;
  b=Nk3Ssd6jh5h0WyW0in09QEVffs/dWrXhkUUmMdbWiaqRL6nWaESbz4EQ
   owfieNqwFyWNTbuFzwlnSaiwzF+dSGbBgjQx2FIqMA+yWRuNo+bS0bPoy
   PFwoelIZKskRuVQloRFq0lA41Reb2nJzq5PxI3V3evtRTqTMbBBZnRFHz
   so4yu6Xq9lmqKnik5+9bij7a2TD1nyIEVWTUcvK2tBAaOb/hzfs7+Wct4
   7tgs6100Lf+VQRNlhW0gm3iydlhZixOOSpCqlbAEmzmbyxUr/D3H0MVFg
   AJ3Qy6t7LSGKuGIBLCIrBFBXKe3pJ6RUsqa7vtb0BfWS2PV9BPHlwW+AC
   w==;
X-CSE-ConnectionGUID: iFwvjydHTr21AF2MF6dpHQ==
X-CSE-MsgGUID: PXWp4yADQwijFmTfMFPB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30762690"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30762690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 20:15:07 -0800
X-CSE-ConnectionGUID: mB0E7YsjQaOOSUSB04KMZg==
X-CSE-MsgGUID: bXB+f2eITAmou6o3i4/zSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="88821677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2024 20:15:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8XRg-000mvT-1h;
	Wed, 06 Nov 2024 04:15:04 +0000
Date: Wed, 6 Nov 2024 12:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RESEND v13 11/12] arm64: dts: Add DTS for Marvell PXA1908
 and samsung,coreprimevelte
Message-ID: <202411061108.kn6BbdSf-lkp@intel.com>
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
In-Reply-To: <20241104-pxa1908-lkml-v13-11-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-11-e050609b8d6c@skole.hr>
TO: "Duje Mihanović via B4 Relay" <devnull+duje.mihanovic.skole.hr@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Haojian Zhuang <haojian.zhuang@linaro.org>
TO: "Duje Mihanović" <duje.mihanovic@skole.hr>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Karel Balej <balejk@matfyz.cz>
CC: David Wronek <david@mainlining.org>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241105-010102
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241104-pxa1908-lkml-v13-11-e050609b8d6c%40skole.hr
patch subject: [PATCH RESEND v13 11/12] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20241105 (https://download.01.org/0day-ci/archive/20241106/202411061108.kn6BbdSf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061108.kn6BbdSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061108.kn6BbdSf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
