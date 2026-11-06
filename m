Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947736;
	b=qqqgtRyI6gftNacgslz3Sv0EYHrPXJaNXc/Ed6IH9n8abyz7eqaO9Hanrx5rVCfdmAbk
	 Hb1+rATL+CsdaYJY3S//iNKUOyIYvIY+lGCgzxfeTrTPssdcqmWfu+2kKiQkGAeOBWpiT
	 MzLjyVv3qs1fuBUUg8h5TKel2ZBGKvoMy2Vf4s3HFvcvqhgkBXyDpFd8SEkLHiS7pyJHp
	 VYfbuJR7DN31NCGpe6wrd39IyjaraPtSJuh1VWtSO/Wb5xXcmPD6BtkoZA8ThVUy/pZSx
	 y2Q5guiaxhl+89UyBsu5rp/GCn7+P8wtmg0IK/8TE/WxID7XwrgdfqgxknRakZFinDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947736;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Lq+DPC443VmfIkhls9K9Dl9s8WOcJjJqClTtPxZPhLA=;
	b=THpMz7RhtD3eDibyaktJyaJA4wwmjYvhyK02kcrno2mski6lSu+gsVRGfjqFriXT3LgL
	 H01ADKEo06kqyB8vEMvEwauEfRKgIwZ11LacG7QWpmpLSDG0E1W9bs5/TzCw8xycsT9mi
	 SxBxfGXRmntQypnl+/WzlxEB+1gyrT1IsO68s5gNLnna7gdgt6udNPg3ZOnElFJHvlyzh
	 1W5JRIqlgT3RQfawsMvaFsTCUMRc0OYv0sr+8Gosz89fzp+KvGG0r4N3ccsUUceaGsR81
	 Su+QnX/Uf8oWcP1UFm3Q2mrdoTwKXkryrIkmU0OfBxXdwU9e0WA2azhKRBRQIhV5Pqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gp25SMaD;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FA606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 06:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gp25SMaD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793947735; x=1825483735;
  h=date:from:to:cc:subject:message-id;
  bh=N/2hR3tR2e+B164Qyk6GFt7nBCudt24/FFBgTmNF/04=;
  b=Gp25SMaDih6XuQnb6ZTGtxpNtdCGFsremIbMVA8Yq6jewDidK1yk+4M3
   KSbnWzxJAbVBzB0tb95afcdq1sPKfOMJGcGHNKHdWyKrR+tM9k5qIFgXC
   4784RZaeuKI92VXgNCHIf6po48MkZWV/S79Kv7wuTVIx50BrYvzqlqhir
   AyhAjcFewLhbqErTu87OKgKxhXaU5Uku7FrZJjQwVpR6cy7yPgwG+aOfz
   UA/08sTE6BMlPz0Mjxqr9/wv6ytiXi3RM/YUrPztBHolL5H5U14mF2+Xk
   EmeKy2O+TTr4Bnyafv0tML3TnAuytEaxkm0SJ0y0/0d3qksqilrHumPDs
   Q==;
X-CSE-ConnectionGUID: xrMxx4/OSq+H8pkA6DxU5g==
X-CSE-MsgGUID: 5rgKwES4QAmKKjp/6Grjdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2771142"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2771142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 22:48:55 -0800
X-CSE-ConnectionGUID: c+yzt461S+OQahqpQUA0ug==
X-CSE-MsgGUID: DGfFhvy/R/W1f+DYMOjJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7245321"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2026 22:48:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPDkp-00000000A6p-16KP;
	Fri, 06 Nov 2026 06:48:51 +0000
Date: Fri, 06 Nov 2026 07:47:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8x50/iio-max34417-adc-perr-verr 1/11]
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb:
 /soc@0/geniqup@ac0000/i2c@a94000/sensor@10: failed to match any schema with
 compatible: ['maxim,max34417']
Message-ID: <202611060754.p83bLHaH-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8x50/iio-max34417-adc-perr-verr
head:   560309472395672529dd22034adcd3eabc0559ea
commit: 54729cd85a044e8e2ee3f73ddda2d7c2fb39e199 [1/11] DONOTMERGE: deckard add max34417 nodes & config
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261106/202611060754.p83bLHaH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060754.p83bLHaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611060754.p83bLHaH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5762.27-5837.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5859.27-5915.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: /soc@0/geniqup@ac0000/i2c@a94000/sensor@10: failed to match any schema with compatible: ['maxim,max34417']
   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: /soc@0/geniqup@ac0000/i2c@a94000/sensor@12: failed to match any schema with compatible: ['maxim,max34417']
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: /soc@0/geniqup@ac0000/i2c@a94000/sensor@1a: failed to match any schema with compatible: ['maxim,max34417']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
