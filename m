Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1361312C499
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738979926; cv=none; b=mX/dsihWvn3WcpmX1Nj7+sc+zRLcnNIu4B/gAdd51ckfO46j1ZU/4oFNEf+K3z+QZNdkmy8PkwQx2xshzvVG+Y2Wwgzxkc+NzXTs01xev+qm0J2pi5mMQ5f6+ZxqlWckQcBMR163w2miiVxvVDgp1cDhRKwka7Hpu29t2biT99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738979926; c=relaxed/simple;
	bh=5TClYhZ9+gfN8RpyvhMTb4isOK7L2Pz6gBy0m6ZuUvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWo0PO3l92bc81xp0HZBN9VstBVErY+5MUOYH6NJMlRhVJzVwsGMSvMp4sRhUUlm07inIEp4XVKHaDCpTENHeqCaDsFN1eIR4HCdhnAMqPqJ98gJM3dhIm0NwL8M+qYdtEasva+37vewRO87egnP3BEzcRak38eD141yTSNRxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWpVaFJi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWpVaFJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738979924; x=1770515924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TClYhZ9+gfN8RpyvhMTb4isOK7L2Pz6gBy0m6ZuUvM=;
  b=MWpVaFJi19LvwdosSqX8JiulF5fehwFO6Zg/0akwQQ58uCNp9vjAXhMo
   p8HJTLlbp8XcH9ZEM+IvEdnX5mklpkT9rXnje5gUuHwl3nlxAMI3HAm0U
   d5aHnrlokGiIqNqBHKvfxclm8Dip3iz3VzszzmN6azjyPU0NHkzmqiGfg
   YItKpSBF7IQxPzf1yceqcUzja/uD4uo1zbWnOf0APEOlSrezom2kCbes5
   /wRuQasjt9vYi0MCxYfeV0I+UmRseZKkAz9FBjX27hKk5QEPy0ZVm5rIQ
   i3kOyUpJEnUZPARNzvTuQJyqFiRktQktTi4ZuQhDKsQGLOwBh+SjANd4i
   A==;
X-CSE-ConnectionGUID: W9UqNaghQbqoaBtwBQ9WhQ==
X-CSE-MsgGUID: Q8KndhIBQNKtG9DgksLNMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50257887"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="50257887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:58:44 -0800
X-CSE-ConnectionGUID: eE5CVRMiQVa/wXQbFcAA1A==
X-CSE-MsgGUID: BQwX+VIjReWIfahQZtuX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134920401"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 17:58:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tga7E-000zO3-1g;
	Sat, 08 Feb 2025 01:58:40 +0000
Date: Sat, 8 Feb 2025 09:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <202502080938.GMeci62j-lkp@intel.com>
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
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080938.GMeci62j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080938.GMeci62j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502080938.GMeci62j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4817.11-4827.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4817.11-4827.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: typec-mux@8: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
