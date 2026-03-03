Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54935F179
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 20:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571086; cv=none; b=jNkuaDToNCmHa3A2o6RqPOm8LxRNUUtDH0PeE4yBDjhcjNwy3WQW+lU4Griib/Kv3H6tRFp73Bgnc43YlerkI48htCqbW9lhMYcIkhXsOVnVOpdnCJ1+GQywZ6d/Rm3jfFKKlj/TfXduSQF7FWzDwAcvMs1p/qaPsC8BGSi1304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571086; c=relaxed/simple;
	bh=wsVTVGJGOYTgWbThgGqfGi8QOHBjpkSbCDBnsEZwRgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obu7PGWT6c1IBplLmc2p3oV8hKQLmSBHNZCxrBJgexTS6RwJPJeh4Rz9JB3Js+8B4pRfkM6g+7ztVONktHzgnc/QkPC1qnp6+fVB/KlBZq6AuYU/l5P+Hl9HIbTk+9u4v7QbgOWdBvV7iW1Li7gqo0XvYCFCo7c00bwxAgCr0Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUxBygzO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUxBygzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772571083; x=1804107083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wsVTVGJGOYTgWbThgGqfGi8QOHBjpkSbCDBnsEZwRgc=;
  b=kUxBygzOzVB3qot8DRmYt9UT9mulaHfJfnMKYY9ZO0hf2Bhi9tfPQWAx
   89wEiKGdgGf775Sd4/57ZLDQTmzB2DBgKEQPf/SRf7PTaj0m0UewDlqvi
   Y69yzxGI5Htc3bg2X2fMOCMRnHyZhSxslQ3sv39bAgyXJZJYxltyiTuv2
   QvIDWm2xP2Nkwn8xunVJv5om2zhVxDKMz0Nc4iF2BjnurKQC1DQPKY1P7
   +RZdywdp8domYlR3LyYpMc/IfLQuiRvSFPckEcSUgzGMyGqlL15IGCUbl
   t/NLaYG5z9MxtKy/PXvSanCLld9kEVTCsL+3L+rCNE+xXrw1hR0efZnqD
   g==;
X-CSE-ConnectionGUID: U/p/K85VRQm2ViOyjTSFhg==
X-CSE-MsgGUID: CBBS5M6VQTyk8rgCWajPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96233289"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="96233289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 12:51:23 -0800
X-CSE-ConnectionGUID: NUS9cmowRJS4Uya8xIVd6w==
X-CSE-MsgGUID: cLUhBr4ESy2ngZuUwcRF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215575451"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 12:51:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxWi7-000000001Xl-0E55;
	Tue, 03 Mar 2026 20:51:19 +0000
Date: Tue, 3 Mar 2026 21:50:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202603032130.dl5tmsDF-lkp@intel.com>
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
In-Reply-To: <20260303092006.263715-2-a0987203069@gmail.com>
References: <20260303092006.263715-2-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: peppe.cavallaro@st.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-Nuvoton-MA35-family-GMAC/20260303-172422
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260303092006.263715-2-a0987203069%40gmail.com
patch subject: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: loongarch-randconfig-2052-20260303 (https://download.01.org/0day-ci/archive/20260303/202603032130.dl5tmsDF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032130.dl5tmsDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032130.dl5tmsDF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): compatible: ['snps,dwmac-3.70a'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): Unevaluated properties are not allowed ('bus_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): compatible: ['snps,dwmac-3.70a'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: ethernet@1f030000 (snps,dwmac-3.70a): Unevaluated properties are not allowed ('bus_id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
