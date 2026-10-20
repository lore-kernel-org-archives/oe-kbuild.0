Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485167;
	b=tyMMIXyQpMBZhoRjhXK5p/zD+/1fGoR0RKnUBcqRf9rwnAaPU6aSRVkRD9yVBPzO38Px
	 X4T/+4MZBT8vdbYnTn3mpTYH+6tjCzRtWYxjaznehRqbOqHaKK3Tvjj92SgEDLHL3EpL/
	 r+NTwmz8W2CGD4Y8lRUuk890jxrEw5vFWrYH5ZrZAG/MD3Vy9aqQ7zpsNppIw1cKdS5sZ
	 XNjX2q0HPBrPeLM+m+zIJH2Iu/kCbY/34rTZQmDBWsLR2JnnAbegXwTXM3n/7UPUCU/T2
	 L70jRWQo5LI49Yy8eckD2Fi4tDgVQ+y4B38a6rbnPxRarJOOGX81Efjgd+9stzaN7Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485167;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=er0Ep5hE5WPC8tWPgp6pM0HQRur6oVA8mPBYlqqA2Gk=;
	b=a9ipNvQli/zyWOmg5DqYpHgKyLezk95eM7AoB+m5l0fs34mRH1+WnMcmtrVypYR4eVv7
	 KjKbyPIGcDYkdZRvt4YD6zHsL7q3d0nU12Ds53pgl+f2KTrRt0iaf4DzProJzAVnhvg3U
	 F1tVtPLw5w1J7abXVb9YTChsjEll9EAEZ2TeV2DJ8nX5dekr86YUCbv2hNfzxKkwbxgkM
	 o0T8nByrPmXXraOV+eCBv7+9EdaVMeEuZYpQ/SUCcn9eWFh4HN5+KPHr7wj9aCt3QUbHT
	 23tdr4A6D+WgqEXxYvoWqpL4GiBl8IchdAsFGZskzn1PCjRYVaQo7OtRLhjnOSQjtFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DIRi1zz9;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910E606A31B
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 08:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8910E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DIRi1zz9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792485166; x=1824021166;
  h=date:from:to:cc:subject:message-id;
  bh=HCo69lXBDy0bYFI1K5o4CHFjtmknCTWqyLKhI1IseM8=;
  b=DIRi1zz9PzK2S8NIKsVZJZ7W2jW6ORrx2GC8eCQs3S+MRUHWCMWg3OHx
   iZKyTil7aszO+xH9NLRD2WL3bSpscKBPIj7WIgofFun6A1fEYumppMTKl
   XMK2uz+fd0IMNgJ0+QLGeb7TNwZx5510FI7TU+tshxBr+jwP6gakyhX62
   kdQJxVHQa1smnyV8B0qHg2tFCECuH8a5z+7e5W/b53Sob83gbVtf5pGbX
   HsEM8vG1/kVWtwOAaP/AWofKbTAhvQPrS6ZAyu9ykaTHm4is7QtD2qCO+
   nrW5mh0GabBejA9Uz9vIuUUui8kM0pzuXj778RKR8CkWbaP7zZ1uGCu+w
   Q==;
X-CSE-ConnectionGUID: qnhCdV+qQ+6DI21hzV7ygA==
X-CSE-MsgGUID: RU1dBDxITBu+zB6l5ES1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1083715"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1083715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:32:45 -0700
X-CSE-ConnectionGUID: peoASm7nRfCeCGMTqUKSmQ==
X-CSE-MsgGUID: Iw/xN+XlTv+kDQnQGuoMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2652945"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 01:32:45 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ5Gz-000000006Bn-43Te;
	Tue, 20 Oct 2026 08:32:41 +0000
Date: Tue, 20 Oct 2026 10:32:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 45/61]
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0
 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202610201000.YW8kW2Sc-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   c8132247fe4df52e9982d74c986bb199d792b85b
commit: 1b482faa86591dbd8524d294383281f4adf2f6cf [45/61] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261020/202610201000.YW8kW2Sc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201000.YW8kW2Sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610201000.YW8kW2Sc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: soc (simple-bus): reset: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff35000: failed to match any schema with compatible: ['hisilicon,hi3670-crgctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/pctrl@e8a09000: failed to match any schema with compatible: ['hisilicon,hi3670-pctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff34000: failed to match any schema with compatible: ['hisilicon,hi3670-pmuctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/sctrl@fff0a000: failed to match any schema with compatible: ['hisilicon,hi3670-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3670-iomcu', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media1_crgctrl@e87ff000: failed to match any schema with compatible: ['hisilicon,hi3670-media1-crg', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media2_crgctrl@e8900000: failed to match any schema with compatible: ['hisilicon,hi3670-media2-crg', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
