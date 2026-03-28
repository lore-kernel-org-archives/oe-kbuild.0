Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51021C181
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774672563; cv=none; b=fnYpqIykbWf+8qt4y4o72a0PwBxRjUfd20iEUrlE9ngODdUNuDtLEqLfgnuC6uVVcX3Uvh3K5mLfikgY2igskGgtZBbSaRosBNIV9V02Ar3bCkvb1C4wYErzk0ZuKxK2IU338tBirJmBTxB7u7g08jmni45f9ZapLWoA6dGTkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774672563; c=relaxed/simple;
	bh=G4XPCIKHp+z8mzp1Sn6xYM+d4areILRBxpgsYI5pkNw=;
	h=Date:From:To:Subject:Message-ID; b=ab06QNRgnd9hjFgoxqeeXhMWhzoAzcT8BcAb7tkZomI73UxGZcd31tACrGZIbHg/ch5sX4mFk6XSm/TKidBX2ZqOYnnqVSFlabn8e7yLFitPIugyLGw3KzLVFe9WXJByyO+Ei9DpbNnj6kayBiSw4L9lS/PzxorVOqXke8adwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFLLCdXU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFLLCdXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774672561; x=1806208561;
  h=date:from:to:subject:message-id;
  bh=G4XPCIKHp+z8mzp1Sn6xYM+d4areILRBxpgsYI5pkNw=;
  b=oFLLCdXUccRNMHAPCweNeh2ElnqRd4I4bCw0yLNN3tGkWOV3FaayaHdA
   hyTjZVy74Ej+uxqGAvDbFY19JQske8JCW3Fp2NVF0EKWREAvBkjTaX+4n
   nBM1LIF56drDit8M4C2AEhr9o24X7Q81wqPa77s/1u1j32GajSPZjBRyv
   WBzqfXwJEeTNOOhR7xgLHlZAEQ+sFt7TezgvZdvFkWPh9u9lrekjxB+Dv
   agWQWMV6Jz/BHLWhuiLQ8j4V3mYCmnErpw+cfyuW3ta83/2qFSrhKW4ZV
   XV3P1YgNUBQ7u5oqd2OaovWxtgFgBMYENogsOmhpdaKTS98F20JERr1ZB
   g==;
X-CSE-ConnectionGUID: 0QTYC2r1RR6j8lXe8ICQPw==
X-CSE-MsgGUID: 4YreVv/nThOzGJ410+UFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79605521"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79605521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:36:01 -0700
X-CSE-ConnectionGUID: MG2FDFbaQQ6J1yGt9UFcMw==
X-CSE-MsgGUID: Tk2ONH/ISvaSdV4r6Waixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222624961"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 21:36:00 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LOw-000000007ci-0xyS
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:35:58 +0000
Date: Sat, 28 Mar 2026 05:35:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 22/33] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202603280522.bacF1DBs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   beefe92070e2791d48e82a01ecd2977f100e31c0
commit: d1fa91d1961fae77d99af3d76b7c99ac10a54fb7 [22/33] iommupt: Add a kunit to test the iotlb invalidation flow
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280522.bacF1DBs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#32: 
struct iommu_iotlb_gather into HW operations executed on the the xarray

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
