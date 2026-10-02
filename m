Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08F9368D76
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 04:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917200; cv=none; b=s7wPGNN2drfNRo3yuppTu2Ov71FzC4RawrcVZxdjtJ8xsiGxLVK5gHIgTw+kTzZa7vPunIUYdR05Xxvn8rzsHAVO5KxlOc9IC+yKtfx0JHoMaSCuVIvwgANevZBksK38YS18tmgIDrIEsr66ngCWy4DcmZo8wSVzQwVuJpinVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917200; c=relaxed/simple;
	bh=ZJQxV/ebPYD59M4j56ERyyvUZCwq+wj1ct1BhK0WnWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=daGQDXArjN8zOff3/Vae3w7eFcy4G+ZZwQuAYtBb0TwJdQ/6Akb4aJ5ovaCxTLQt20sgDeS5HSBU7tQw+q3xeUMXioJCYS+WLQv5lpLF+ifRdndYrWjfnsYuVwzUNohsaILFCsz9nS2OPJbhywn5IA7+wuTaDcPSO5PtvyjCaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6wzOCkR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6wzOCkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790917198; x=1822453198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJQxV/ebPYD59M4j56ERyyvUZCwq+wj1ct1BhK0WnWk=;
  b=k6wzOCkRuErNJdiIDLTk+HEJUmnU0HPsO29oNu4lzxWepqsmtw7FdU3K
   LzUAS0X87lEEdqjERmuUJ7L9YTyt0l2bF6RogH6zwHnHw3ua4zdYvNlqY
   UdCHUbaYR83hLg0KfeYcKIVcgn69hwcX8mXhkcpccjlnsjKuvosfjFjyB
   LgXCdUYi+P47Xu1Rxlbgp72wII6PSJDs7kJrZLEq5A9F+wHaBf+H0/xKK
   ihifM93D6sLxwoWpZaqPXHuavxLnwmUDJ4y8SyYlCnwQpIKsiNadpvbwB
   4Rt56bfEtJBsmwS24NMV7chrFcy4gqHoW92IinavxUDmFsNb77nKE8dmK
   g==;
X-CSE-ConnectionGUID: Rsz1RdKUT7W+xyD+ml7oOQ==
X-CSE-MsgGUID: 5XmuUoa/RZGV+NWvlUtuQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90637828"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90637828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:59:57 -0700
X-CSE-ConnectionGUID: ivsod7LbTtSHJwSbq5iCEQ==
X-CSE-MsgGUID: dv936P/GSeSlASalleSH6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274815258"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Oct 2026 21:59:55 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCVNB-000000000Pj-0VGO;
	Fri, 02 Oct 2026 04:59:53 +0000
Date: Fri, 2 Oct 2026 06:58:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal
 sensors
Message-ID: <202610020617.oJTSrnyb-lkp@intel.com>
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
In-Reply-To: <202610020617.oJTSrnyb-lkp@intel.com>
References: <202610020617.oJTSrnyb-lkp@intel.com>

Hi Anvesh,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
base:   
patch link:    https://lore.kernel.org/r/202610020617.oJTSrnyb-lkp%40intel.com
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261002/202610020617.oJTSrnyb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020617.oJTSrnyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020617.oJTSrnyb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
