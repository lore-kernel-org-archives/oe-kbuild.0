Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B798518A6AB
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754779717; cv=none; b=IP0crCJD8zleaePAGKYcP9+Z5GirnwQ0OcS6DYjmx12hCsbiAe+DOd4VCJ3ldcQQPASorrfjh6mGa3M0+ASw3QbxFKRY9qwVKRNFhCKFI6WfL3CQa8m5wh60nruyA4qiG6OKKTrcPtaNChU6vbd5l5oyEz0JWeLNaKNEwyqktys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754779717; c=relaxed/simple;
	bh=LkIfviPXiWtKVNBDIWHGjkOisFuXGL7BMSeEn+nds9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+kG11dSEY+HNaDvjicXg271P150zvxobjjkxvKwGzuJc/UNlM1l0O/6aYXra88DtYAZsrJz91mDOIFCeWk/8TnF6+8LCjUAKrjjW38Le1UQbvlljX/k/+1sqwSgJXKX83q9OjZXDCU9JXIumcwJenWXpNyvsphMTJG8TaI2O9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OveHRDRt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OveHRDRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754779716; x=1786315716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkIfviPXiWtKVNBDIWHGjkOisFuXGL7BMSeEn+nds9E=;
  b=OveHRDRtzCAotv2Xem8SpUxSqz/753I7isCnSfA0YGfJg1JJvKT4e9Np
   de13zBIWYPqNG9nElCnETtDUGDXpfMXkrj9s3i2uqj7S/+8Pb9YdMWHxa
   ABZHYl2X/TmXAPvqzmVCVUGx5bfKaFrpwlHt0LAY8ewDu2Dj5U04Eyq5q
   h2upMtnpojnEkYAAdobnyhZGZwTdR2t/O9L3EGmV9xzaqQVim3CZVZdmW
   1dV7lSsgcgjW54ShldkvZ/HPWClBVRf0tf5TY6LA6DtjXGY/8yH/WY+iq
   0n3IAvrv1t4HrqEAMHh6/mKhElzy4DbI/eeFSV7KHo86372Gy53+Hv8Ub
   A==;
X-CSE-ConnectionGUID: kAvtBATsT9m+L36z2/akbw==
X-CSE-MsgGUID: 5VkL6bmmScecCQb0ywuflQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57228822"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57228822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 15:48:35 -0700
X-CSE-ConnectionGUID: NktJwO/xTdOKSLFmbN/RcA==
X-CSE-MsgGUID: aQoSojMISweqg/gVDJcNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="170954715"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Aug 2025 15:48:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uksMa-00055Q-0M;
	Sat, 09 Aug 2025 22:48:32 +0000
Date: Sun, 10 Aug 2025 06:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: stm32: add resets property to m_can nodes in
 the stm32mp153
Message-ID: <202508100617.nEvBJamT-lkp@intel.com>
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
In-Reply-To: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
References: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: kernel@pengutronix.de
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

Hi Marc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1a32f7427eb3d1248bc64cd745b93f88cc838933]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Kleine-Budde/ARM-dts-stm32-add-resets-property-to-m_can-nodes-in-the-stm32mp153/20250806-170218
base:   1a32f7427eb3d1248bc64cd745b93f88cc838933
patch link:    https://lore.kernel.org/r/20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65%40pengutronix.de
patch subject: [PATCH] ARM: dts: stm32: add resets property to m_can nodes in the stm32mp153
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250810/202508100617.nEvBJamT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100617.nEvBJamT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100617.nEvBJamT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: touch@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
