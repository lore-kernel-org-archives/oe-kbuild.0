Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8EA23393C
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783885611; cv=none; b=mEfmJ3wuXzz3gG0BxOrNvV29gPVUgqUYUmfS4IGwdX/A5YnrXFURnJ8T7ywKemjQBJJ2iKs3fP5b51RGkCO99fdjsvEKwHnaXhg/PdlsDzwfI8wSXYOoJGx8mh9vy0s7hQbB5F6Xh9QdqZUkaz82Z1cvD80YJB1NNPY7vIVYb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783885611; c=relaxed/simple;
	bh=rGzjkqbj8jMgqFgo9bMa26adqNk/gT4jSTn+YUkB87I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bw3QIr9A/xkuO625m3D4Kn/18PUbwSnoShQCczgh9UMeu3KrMzpd21YQ4XQdL15kHvyhMpqpJhWpa3wOEOWcjbZuTCp5NTDHT9EBLjNBEF3QYSLk9oCHllajOqCIIUzDjHxkw2IDSasYfglrbxMRfhslTTYemr+4LGFiAGcSb8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTmRapb8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTmRapb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783885609; x=1815421609;
  h=date:from:to:cc:subject:message-id;
  bh=rGzjkqbj8jMgqFgo9bMa26adqNk/gT4jSTn+YUkB87I=;
  b=iTmRapb8OzzDKJ9jEYMUMH+H+JCMBqayPs6mr8+7QYL7K7bLcqkMQ+Bq
   85/V3Kt1LVuOMD7YegtywZC7ny/ePKTI+iNoX7U3k8YrgUEeTadiQMBPT
   XDcY9MuThSfyrWbRtZMm+Q28pRo8NXuHVmycl9mMrWdG3SwrpvreV4eI1
   fQigvj9BND8cyJp9lo6y3D0BkbMvXOT/91PtHkqaW8uLShC6/fPEn1PzO
   sRiC34O6mRdWXDWV1lucPOQW29XVsEfL3rYlhZToZ7NYfW12+3mAhAIw0
   CwZooDn1FYWa6mZ6/w/VNRnHFCSyGQTVuu9EYlE8d4/6iBVhcmSpZ8/3Z
   Q==;
X-CSE-ConnectionGUID: jONfySwjSTWxIp7PKfogLg==
X-CSE-MsgGUID: Z+467qIUQ6WMjyA4UPPawA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88187275"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88187275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 12:46:48 -0700
X-CSE-ConnectionGUID: 57dE6s+7QSCJgTu0RxzH0Q==
X-CSE-MsgGUID: EnrPpxbhTrOLik8R3Zsurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254853878"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2026 12:46:46 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj08S-000000003ZJ-1yNd;
	Sun, 12 Jul 2026 19:46:44 +0000
Date: Sun, 12 Jul 2026 21:46:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-next 44/66]
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9890000
 (generic-ehci): False schema does not allow ['bus', 'phy', 'utmi']
Message-ID: <202607122137.L47wuEc0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-usb@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   1db5c6b0b9834aee2f14e39764becfcc29d09ccf
commit: bf0bff4db5d95c8c207f0907828e6fcd53b11aac [44/66] dt-bindings: usb: generic-ehci: Document clock-names in top-level
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260712 (https://download.01.org/0day-ci/archive/20260712/202607122137.L47wuEc0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607122137.L47wuEc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607122137.L47wuEc0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/pcie@9860000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-pcie']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('clock-names', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9890000 (generic-ehci): False schema does not allow ['bus', 'phy', 'utmi']
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9890000 (generic-ehci): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
