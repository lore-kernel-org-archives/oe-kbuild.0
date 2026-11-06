Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947737;
	b=Umu+gyEjGZUTXFPlNVMolC9UstVkd5PemmwbT5NvWBrNxe6YvLc0nINy7CBI8nr5XaJ7
	 0B0h7X8/pzRXpTB4fQXJ/5syVFklaoPalHP6uyQBiapK7WkOMbaOv5yNo75m3jjkIY5S6
	 gX7o6/7LAzfaiB+Y6topFEGB+/utNuF1fGcpezkbu5tUM7FkWOrFhcplgOx/ZUlhTBIb7
	 S6Tf7VK7Aff04lcubNTaQBpGGg+R2VgzK4g4QeQIWPqGBoU+LPcgC6MCBjvFWaKEl5GwF
	 XyuC7L+eUrbRnrWEAZFyewGDjAyWTlri1V9z2mu28yquW3gS+Ljqefyt8UsONdQp12w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947737;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a67am9hqnKvMp6JLpvG8eghg5QRaVS6bqsz4lg0kQOk=;
	b=X1hnswoCH/jV6frBjprenVptFJRNY//6s4m3qiUEFLRXc5xijB6GSPcQrMtThmP04w4w
	 8TpU1O7CXBRi1DwPv6vPpVaIgJ5840IcoRH3RaMoO/+2nU1PHVxN3Y9mmR5hcknYf7FjC
	 YM+fJTZ+qEoLvcvZ2jM3Sc0Rmd4iLoZ6x2Chq6UXk8TjDFzrYrrN2y9QHxsNaQpJn4uiM
	 VhPVQ1mojGH0YR57U0+FDbL+rIG+twHmlh38AcdTtQpzK1UA9Lg39ArmHbRdxzkLvTUi/
	 XliTuc7hCyUjza9ZIg+zn6QTIKGT5Ty9apnr/29SuUuiK/JJO971oMJkdbmbsUusWQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6ja5lYd;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1F606A329
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 06:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E1F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6ja5lYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793947737; x=1825483737;
  h=date:from:to:cc:subject:message-id;
  bh=hBgCipiBCw907JDpYK2hxpe77YK2lkBOYK6Nl2gZ7lQ=;
  b=V6ja5lYdIejWynpkNFL34KHMqbBQBEd5Q6AZNAptSbIVqUpt0Og5rhd4
   WLAZQHjemmiO1ftZFp3m1D1Jhpq6xW7ltRZbz1iOP9lgvQLmNNaPG75lb
   qQlcFRhdkd6TDZl1Zj91cP890ULjhd+OarZL3uJNhfSuucaDxbKPP4SES
   XF3Pm4HZw3SksUxl1K+HrR1gdd/b9lLxta4GuuBQ3BGVOnsjVx4PP4na8
   5V+x/eu2coiLAJNB/2itY6V4CWOTiNhN4jQheovYXVE3XhnVPtoWTwUm1
   wyd20IRBEnls0Ds2u5udyhgIHCaakXIqiZGIMt9cmRLYWVx7DTHA2lKpQ
   g==;
X-CSE-ConnectionGUID: 3Unp268rTFmTP8AmldiwKA==
X-CSE-MsgGUID: qfZYVaaBQu60qJAZOIDfTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2771143"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2771143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 22:48:55 -0800
X-CSE-ConnectionGUID: +1stdMahT5ebRqt/fZBpIg==
X-CSE-MsgGUID: vTLCg5tJTzmrUk5VNa75bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7245323"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2026 22:48:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPDkp-00000000A6r-1K62;
	Fri, 06 Nov 2026 06:48:51 +0000
Date: Fri, 06 Nov 2026 07:47:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611060724.z0dcpyNx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 836aa9a16eef4207c85cc11171fb74b28bdccaeb [14/36] Allwinner: A523: add support for A523 THS0/1 controllers
:::::: branch date: 6 months ago
:::::: commit date: 7 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261106/202611060724.z0dcpyNx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060724.z0dcpyNx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611060724.z0dcpyNx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
