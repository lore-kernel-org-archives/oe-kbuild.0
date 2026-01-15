Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C12D7D2F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 05:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768454885; cv=none; b=Ib+fk++1PDmm5oHHHHEMhu/AQxCK5oeI6Kyz4193XAo7VFckF4bvoK7UDGeNKWKkl9ygoSsGzp6NsTNBKh+y3vPF3b8eO0s0cpRmaJ0HQZlNSrFekAUKXT47W0GRZF+F3Y4zbbrlAgxoSe/ApRN0xml8AKv08CLfBAr/GSczRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768454885; c=relaxed/simple;
	bh=DDUzP+X8VuGARu3rJDEKY5myQUdJ3i9S1U62XNBs/Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDAENtBfUjanua54UxDRWJ+sntaOUwjq0z9h3Q1PCmpIV/zBIcaTdOMK9ZYsg1V23SM61jeTP8rit8wdsh1qILrgdloXHKGzpVB6kSukApOI4zHBFSAj1cfVqX/+HWNx/jauxNta60rd/XWM6IGEZAyh7dXGt7Yp/iKOZxKqkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3f62Qfo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3f62Qfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768454884; x=1799990884;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DDUzP+X8VuGARu3rJDEKY5myQUdJ3i9S1U62XNBs/Tg=;
  b=n3f62QfocN/1y1aBt6VGtYJt9BI3r6m8IpFQxfXcLaNtv0S5lbfrtgo0
   FUxUL+qlZEpToSh31RICYLRxPGLaxFMKSEUArdCeF4S7L6AwT++3DiWXk
   ShLy6lHZT2UM0SOZ4HoJPpUDzJOuqht8mxvQ4Vq7nYW3AslhTgpbEAjwn
   Z5CW/fApfx2FnIwWqucZgRl3nRYkDSDbmvqVTbY7ouh39WAP7I5FJ1rUZ
   48cy/FRuP792FxFjTpwwhxLPwSxc6lmjn2b1P3Hv2rXz1brgaxcZ5mrdk
   cjCd6m86ilORBDNore42vPMb0jn+FPacCk7mKvKgr2VQQrXJMlawXsUYG
   A==;
X-CSE-ConnectionGUID: Img4h2SjQyiRqt8mwPo7ww==
X-CSE-MsgGUID: DETGbH0AT2Skg0usEIZK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80404770"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80404770"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:28:03 -0800
X-CSE-ConnectionGUID: uVslOvnIQvmMRUtKQHHRTA==
X-CSE-MsgGUID: NwlSX+k4T4aZPLuXNEQs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236123390"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jan 2026 21:28:02 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgFtn-000000001Vd-3svl;
	Thu, 15 Jan 2026 05:27:59 +0000
Date: Thu, 15 Jan 2026 06:27:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 08/11] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
Message-ID: <202601150652.ANnSJHO9-lkp@intel.com>
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
In-Reply-To: <20260109-debug_bus-v1-8-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-8-8f2142b5a738@foss.st.com>
TO: Gatien Chevallier <gatien.chevallier@foss.st.com>
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
TO: Mike Leach <mike.leach@linaro.org>
TO: James Clark <james.clark@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Leo Yan <leo.yan@linux.dev>
TO: "Clément Le Goffic" <legoffic.clement@gmail.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: coresight@lists.linaro.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Gatien Chevallier <gatien.chevallier@foss.st.com>

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-document-access-controllers-property-for-coresight-peripherals/20260109-190526
base:   9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
patch link:    https://lore.kernel.org/r/20260109-debug_bus-v1-8-8f2142b5a738%40foss.st.com
patch subject: [PATCH 08/11] arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-2051-20260113 (https://download.01.org/0day-ci/archive/20260115/202601150652.ANnSJHO9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150652.ANnSJHO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601150652.ANnSJHO9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
--
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
