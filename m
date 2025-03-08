Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0DC1917FB
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Mar 2025 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741433537; cv=none; b=ijBUT//AkZWFam9I+rQ4lFFlP1YEjT2pl71qXYP7rVJNWPcv4J4P0St9SM+lChiCHeBYbYo375tzFj/usozzciFdy75Uqqr9ogNy/2lumtpDKFjw9z1gvGo7leGbX3SN4XWUfVu/OIzCAPq2VJTJ4XgtAI7gPsQ2Fl8HTAeoQVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741433537; c=relaxed/simple;
	bh=Pf5Y/gvM5tANj8Uphj/QokBMyx3Z/bmcHxdv8wCVVrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McC47YSzsQuYrDsAYn3fjNtbVgZWk+PkwwveBBRqCLDhB5Wqv/KCenrvIN4T2t3wqlExnEoC38o5CUU0khmqH+luuxtzSkwd6PvUYHN3egB/oFDnq7JxiLk5Fs/6ydOJbIuTE9HAFp0561gnGrijxWOSvqC6nscIINn/j0B0ynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kM77PX6O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM77PX6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741433535; x=1772969535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pf5Y/gvM5tANj8Uphj/QokBMyx3Z/bmcHxdv8wCVVrM=;
  b=kM77PX6OaOVQLgvAZAZYyty5g1IB+hEoVWNIxugoTrVRRjZ/6EHKg9SP
   wafZhbsBUAY1T3vYTy4nFw3xhkJpML0UyT8q2SFKDoOdLyf/94pqrkpi8
   Ulk/2dOof98D7rr+6hQ/A0MF0e+j1b7L9Hd9Stlt5j+qouAoK84flzZLh
   huxI3uI1MjxZnGeBr4JQvsJzLZn2tNFvEnqsUT2IrV8a5Fw2znM0BY2+S
   xndNDAvxVNVk0p/wnXd0oq2z4A2j9Ill/c4A79atGcgtaAV7S9xz0I1JG
   t3tOiWU+aFamwQ49xbE9DrFAg81ZdYIwAawNswj2+BoKqAOh8x5TYykSm
   w==;
X-CSE-ConnectionGUID: cGETNBvrQYGNNOmSA16UxA==
X-CSE-MsgGUID: S3rHDSJZSB+t/ABw1q7deQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42701057"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42701057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 03:32:15 -0800
X-CSE-ConnectionGUID: joQZTf4eTtKYpFRYNU9/pw==
X-CSE-MsgGUID: x7TBMfSAQuCy2WcRMhPetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="120037349"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2025 03:32:13 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqsPb-0001qi-2W;
	Sat, 08 Mar 2025 11:32:11 +0000
Date: Sat, 8 Mar 2025 19:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] arm64: dts: amd/seattle: Fix bus, mmc, and ethernet
 node names
Message-ID: <202503081901.SuviWScl-lkp@intel.com>
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
In-Reply-To: <20250306-dt-amd-fixes-v1-3-011c423ba99a@kernel.org>
References: <20250306-dt-amd-fixes-v1-3-011c423ba99a@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: soc@kernel.org
TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
TO: Tom Lendacky <thomas.lendacky@amd.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
TO: Richard Cochran <richardcochran@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-amd-seattle-Base-Overdrive-B1-on-top-of-B0-version/20250307-090945
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250306-dt-amd-fixes-v1-3-011c423ba99a%40kernel.org
patch subject: [PATCH 3/4] arm64: dts: amd/seattle: Fix bus, mmc, and ethernet node names
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081901.SuviWScl-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081901.SuviWScl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503081901.SuviWScl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: sata@e0300000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: spi@e1020000: Unevaluated properties are not allowed ('spi-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: spi@e1030000: Unevaluated properties are not allowed ('spi-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ccp@e0100000: failed to match any schema with compatible: ['amd,ccp-seattle-v1a']
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0700000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0900000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
--
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0300000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0d00000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: spi@e1020000: Unevaluated properties are not allowed ('spi-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: spi@e1030000: Unevaluated properties are not allowed ('spi-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ccp@e0100000: failed to match any schema with compatible: ['amd,ccp-seattle-v1a']
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0700000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0900000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
