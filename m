Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3D217735
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416190; cv=none; b=Pm0ePlLKEX4NfJ/j/xzKsjIuj7XCFftoRFO3GFg5jmHlfzVbXnsDjpA5n9E7wbXA/4mVj8do//dasAs2JDI5j2cHaVIhcAKffNJG4UuJhbii6lfiKfPUuGC3zSRvzJJZb8dp+7wG1v22v2wBFHD9I+h+a6WoWCDGXSyOOZRPg5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416190; c=relaxed/simple;
	bh=BdrBxgJKTaQOMVMozf2dISRae0AKWnqyEoDaUg549R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+HfguRBmjo+pQuEtBdhSzlnlRxr0DwCvCWmaxVQDPu1ZUOi+0TYc4HhbGRzIeQwDy7J9n/VGEPbeBmiNluBjkHGwdYTljKae7ptRwtQqSnl1oUsbclmBDuNIzOQx6pAmGfzl7bxB4Ld8WZskXdCTX38xccDEdRJuQknRk5tBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T61l6COU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T61l6COU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733416189; x=1764952189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdrBxgJKTaQOMVMozf2dISRae0AKWnqyEoDaUg549R8=;
  b=T61l6COUZMUYMEX2tCWlbwWjahd+PTheGWRo9cC0LtgRVj9ONcrd5TSH
   +PJzPjcuVrKyoGSWvjL4KTfm5YaNQTpmg6AgyrM/3c1moFTFlfnlmgC8h
   cypGZhtXIYHhQAF2M2Ua3Uqm33MlJWa0NBsOraF/uKbM6TGazAWhHDamJ
   GSjvYNQ/SvdCImSz2dKy1lnZGd9f/lOt/jv5arJGHIv51oXGDQVqHNR/6
   ffxvdqP3Rjtm3dsy7bhdL4jrHLX42XDsHwpAGK87KT/GIc/DzJc77ldlW
   oM12Jf1yNyjg/J0QqGfmYYPsgTmvwG/U9I3NidGV+x07umipFDduxqcP1
   g==;
X-CSE-ConnectionGUID: gzAVCmp3TWmqpeoy2pVvTA==
X-CSE-MsgGUID: PK01KoRGS2yQrnCeLFpxZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37525846"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="37525846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 08:29:48 -0800
X-CSE-ConnectionGUID: yw3tb+bYTMK54MxODb5dPw==
X-CSE-MsgGUID: 7UksVscVTSmRC7VyF/Vc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99182958"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 08:29:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEjZ-0000Ct-0u;
	Thu, 05 Dec 2024 16:29:45 +0000
Date: Fri, 6 Dec 2024 00:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ambarus:acpm-v3-upstream 7/10]
 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml:
 ignoring, error parsing file
Message-ID: <202412060036.Bi6iiVnc-lkp@intel.com>
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
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/ambarus/linux-0day acpm-v3-upstream
head:   20f606fa2a40e27ec03a65c1a7e7d59617173b99
commit: 7bc94b457d841b0bd51c226ce6f8389e88bd88c7 [7/10] dt-bindings: firmware: add samsung,exynos-acpm-ipc bindings
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-052-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060036.Bi6iiVnc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060036.Bi6iiVnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412060036.Bi6iiVnc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
