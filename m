Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22FDF5C
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784856; cv=none; b=NYNbtfoj1p0wdbPngxfx5GZKg1QhOk8zFzraTYhX3oGdZh9YpQQ+rGa8V/0EHtS2wfk97p8PGp8VoYPQAd/DBM5Cx0uoFyLYRVtURgkRa5Rnb1iYrnVvj2gbcKTESKhMISGiTfSKI3sSOA9geJcSfHOpC8h8BOmxgkNVYeA+9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784856; c=relaxed/simple;
	bh=2gJy9ZLDs6AcvbsBvsGnIV7WODBwKfLVp/KTmJc8qzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8pwU1l8tJiTJ/FVRwx/5v5TwGhG4WdpO8wiN/wgXskPpEzfswlVKotm9y4wIMd/MwlKwckFopKcwV1I8PB/3e/rbddy24oc/6OquqO40tyUwQj87z2ziB6iecZLHj9KYeu9jR3zG14cA/fDT4yySZHyKtyKRwOSWEwn6pLrIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZLUYDss; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZLUYDss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738784854; x=1770320854;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2gJy9ZLDs6AcvbsBvsGnIV7WODBwKfLVp/KTmJc8qzM=;
  b=hZLUYDssVfTG7gZucxvVXivE6TCEytYtjkgR/lFRKDr29z2Ac2Ft2DJx
   qewG95vKIDPfxonj6xMM6WTbJzUwIoyFTbq/uoCY7GO3zVAQx0xRcnDLN
   sKJYPOHoMrXmVk3AmfXzOQrPI0dTzugnWjBpHd/rQLGv1GU3aJSpEZYEU
   UyYEPfBIrySJCSsRMOx4LL7xOWkLHhisd7RnGT3hVTzPJ0TMNEG3SFWMi
   /T70OnyzgNulONOyY48bjuX3HdBh9MGFF6UOezto40rDkwP60IGw/fmyD
   Q/tfnh3vttAZWSLsUE71QJEDYUqiVcak7omXJ0QJaYZnga4BMrgx/yqG2
   w==;
X-CSE-ConnectionGUID: GVrJjIsdS3+1glw0e+L6SQ==
X-CSE-MsgGUID: NGsdMdxgQYCx+uyoCPmKTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39248849"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39248849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 11:47:34 -0800
X-CSE-ConnectionGUID: H6zJxFEqRgCLox7bRp+ZDg==
X-CSE-MsgGUID: NqSnPMrcTlGipD0+QO6LUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="115988714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 11:47:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tflMw-000w0J-0B;
	Wed, 05 Feb 2025 19:47:30 +0000
Date: Thu, 6 Feb 2025 03:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 5/14]
 arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: phy@11100000:
 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502060349.uSV4Bu9v-lkp@intel.com>
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
TO: "André Draszik" <andre.draszik@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   0cbf9ca0a8a152ff1cb334f644ac466297be6c91
commit: 825c4bfd5c526b6fd18c8ad8503761143c90a142 [5/14] arm64: dts: exynos: gs101-raven: add new board file
:::::: branch date: 3 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250205 (https://download.01.org/0day-ci/archive/20250206/202502060349.uSV4Bu9v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060349.uSV4Bu9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502060349.uSV4Bu9v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: phy@11100000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
