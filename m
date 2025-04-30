Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495FC1EC01B
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746044053; cv=none; b=pedEbx4re/VheK2LLXHzi9PGaP+HAU6BlX+oJWyOIbbPTyyQ3FRcsaqBL5tCBYZmkOm5EimmWjSK02cZrIvpbXQPsdY0xvIkbIeendKUuC9vrYlp7Y7IUL3PvXHPC0SgE/9viLW6/68r2bkb5pEWhHkz0ocKUJX8XvXH7EaqUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746044053; c=relaxed/simple;
	bh=zK8IRXA3DjAA7bYRHcXohkjelxl05g7OyYvQJxv3hjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWnodg6tX0d80xoUGMAWNYy+J6DYm50d6Ukh9lFfVdpvQs7jritVSCr7taEhp/bzDLHS803JVyAfAJj//4YyPT5Q6EXG4YkBeM+bTXFBYfkMDlRN05rqgwD4IdniTdSvdj/rG5Cm4/HW2ICe/ubH/rr7dbCSmOMdq7GzckEH5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLmHZHYV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLmHZHYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746044051; x=1777580051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zK8IRXA3DjAA7bYRHcXohkjelxl05g7OyYvQJxv3hjs=;
  b=BLmHZHYVKbMTFLjDhvMCr7TBYniEUnGx3KVHSsGQU+l1/FdmbGs1IJpC
   hHRdDheLzLWeNrUuTfACL0cXFD5InNOf9FbKsVSBl0llBljMvwmgorOFD
   +SiZ9HaKxd43KnmaMNd6bysndiSvvLwrAO/7ImwfwiEoEoQysuwRk59Rv
   fvyKbfPUh2WcU2gMgmnOiMxmT0tuKxITPxGQyux0bH1oG6j7aFeYM5Jiy
   SsRcNnOCUurosq3vGJi0ZDb4FHMINq67zXfeyO6C4YJDJWI7CGGJF6wTy
   uy6Y8QKoDzb7ObDK3PG6Ew0aVFIgAsP6sW2cz2A69NkIsmxopKCgVAK76
   A==;
X-CSE-ConnectionGUID: f4XHyfHlS7CuRWDQza2YJw==
X-CSE-MsgGUID: 6ypsUROPTL2AtcXOW55JuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57917561"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="57917561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:14:11 -0700
X-CSE-ConnectionGUID: PcSvOMnoSfGQFsVMkS60Kw==
X-CSE-MsgGUID: 7OtafVeBS/CE+cfAXQ9+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="139393697"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2025 13:14:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uADok-0003kH-2n;
	Wed, 30 Apr 2025 20:14:06 +0000
Date: Thu, 1 May 2025 04:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/sm8750-integration-and-todo 16/25]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl):
 clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too
 short
Message-ID: <202505010403.CoAZ9xx4-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux wip/sm8750-integration-and-todo
head:   9a07f3b38595111e09f0158f61565645dc7793e2
commit: 60355e5fc2193b806c7bbd421f6d894f7e2c5322 [16/25] Merge branch 'b4/sm8750-display-dts' into wip/sm8750-integration-and-todo
:::::: branch date: 7 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-052-20250430 (https://download.01.org/0day-ci/archive/20250501/202505010403.CoAZ9xx4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010403.CoAZ9xx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010403.CoAZ9xx4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2814.27-2870.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[132, 12], [132, 15], [132, 72], [132, 62], [132, 6], [35, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2710.27-2792.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2814.27-2870.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 12], [123, 15], [123, 72], [123, 62], [123, 6], [35, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
