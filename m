Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABBC1632E6
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962973; cv=none; b=htTLReppligdSvpbXseCviMaZ7fHyC1ce9l5wazeKhvtmorH1mfWJFd4HfxBo+jRZ+d4TgoiKZ4fcEbk9dTg0qe/ovXtdWGfmWn0GGq1u4Gq1b2oSX24UgkBaC9PJSWbTVjHKvXCX6R0BEo6vEmDZ75GdreEe675t+uxYO5l3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962973; c=relaxed/simple;
	bh=DCYZdZStdI/db4bEYOQvk/K84kwqMcSeVm03Hs+/Fxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LrR4molwhiMUEEY/jTzyCJBC/J1JB+HDhxiIlqw4DuvaQg/frPAuljCIOYsYcN/5aThjPeDLNbyDvWjS7RdrCxoy5efvSP43FZNW8s6q/ux91gPCynlTbk1gFHBQ6Z52rBuYOev157OXryrsTVu6Yne6aFVIhOvmPbw7UNbq+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXsbCRGJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXsbCRGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738962972; x=1770498972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DCYZdZStdI/db4bEYOQvk/K84kwqMcSeVm03Hs+/Fxw=;
  b=mXsbCRGJrjszVjhtkeCHGHcCCGJZjST98rILdmDJ5OHQ6Dj+/QwdVBNN
   62U58Sd93+DUOkf+qzA06vD+UICMIdMXebtA8Q+Fox65b7eDYW7TqPWMp
   KbbTtDkLPqQh1OR0W5bbzRMwwbetNaIFnEXirhhs5tB/0U5lfCuZGACAL
   ix9POhRJMs5fdS0LceLq1d4rgy+czXFlsjc0E332QgVrTxenL74FwuDOM
   yjXb7p/pdi+EBzEBzu7qFnGNJ/vs3nhuDhQGqWpIpV+2xaVk1IQuP034q
   GZI2rbRJT19yA6Vv7XQEPjsYRoBqOK2FpLx11w3vjn9Zy6o5S6uXcKB5B
   A==;
X-CSE-ConnectionGUID: 9dCdUpOiRbO5XqoqEvgSuw==
X-CSE-MsgGUID: xy9HTle7RECRjC7Pb4F9SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="27223128"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="27223128"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 13:16:11 -0800
X-CSE-ConnectionGUID: Jve8m8goR4KyA0PEoM/udw==
X-CSE-MsgGUID: BLlWlkHISmCi+lVL0SCSRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="116637321"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 13:16:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgVhn-000z3L-05;
	Fri, 07 Feb 2025 21:16:07 +0000
Date: Sat, 8 Feb 2025 05:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <202502080505.KUOSSGXi-lkp@intel.com>
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
In-Reply-To: <20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d@linaro.org>
References: <20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d@linaro.org>
TO: Abel Vesa <abel.vesa@linaro.org>

Hi Abel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00f3246adeeacbda0bd0b303604e46eb59c32e6e]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-usb-Add-Parade-PS8830-Type-C-retimer-bindings/20250206-173603
base:   00f3246adeeacbda0bd0b303604e46eb59c32e6e
patch link:    https://lore.kernel.org/r/20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d%40linaro.org
patch subject: [PATCH v6 1/2] dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080505.KUOSSGXi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080505.KUOSSGXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502080505.KUOSSGXi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4817.11-4827.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4817.11-4827.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
