Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4138E17991
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731894824; cv=none; b=TwxnB4q5FQuA6tnYiioLKV7XEb/BFWo+b6Dbl0q1ZX/lVAH2nDSGHQCM7J+fZzrJRR8DP4APimAHk+XlJP/4gxP5IAx1uGoFeWuqndQkQVAi1SVnC4Fgr4Tbg/JQFrUfEatmuTFc7rqdY5tDHKJMmTwIt94RjtAziIzTk8CB2Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731894824; c=relaxed/simple;
	bh=ZHdVQWRy12CeDpI55P3tgG1f5ZxvEFhJx4VqAuuiWE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN7Sa8wfoiGM4rjmXIgigxL11csbC+L5gSo2MNBnSlpt+242Wmcm6kIafsEfEqJe/KyYW3l1Tf8PvUMeaH4eFQWb3GBgDUUwU9xQ5JT3HIdLF5xJI9s6OkbV/mtNp+lG88fMFX/pkiMdjlHpePbfH+zeWkRQds1Rrcxn1CdkYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCo+/N/s; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCo+/N/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894823; x=1763430823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHdVQWRy12CeDpI55P3tgG1f5ZxvEFhJx4VqAuuiWE0=;
  b=mCo+/N/sQkvVNlbQUUQRsZSjCn9Oh6K38H9LIgIuYUmmW6r1P+stZqar
   IW2eItKhm69USKqxzAeFIoP35xkLHoKxQ26SMFiqAbFhWY0bQLyW+pWEL
   804pOoCC+3EDrqXZKVimbMoIZMAC95Ahd8SZQv0BjY8fXK32E30rMLshd
   mBieZLSuzN7aulUJEmNQueoYcDMkifN+COjZs2RRWXbOHZhvitYLUvP0U
   ilADgexoxV1/fmkTREKopsotmYTiavMa2g6PMiRVwUVvK/TcrXlyUgBrL
   I4TucrPBnTOXfJq1ebV2CRPWACtJ2iw5JF98Y5JMtah/dUck/DWeRhM7w
   Q==;
X-CSE-ConnectionGUID: ONF4sEMlQ427rtVuTNuNfw==
X-CSE-MsgGUID: 6xsJOUWHSmmDhRIvptCUdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49362902"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49362902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:53:42 -0800
X-CSE-ConnectionGUID: LsuLrLTjQTeEVXQPGz3mcQ==
X-CSE-MsgGUID: br82fRIRT2ioEZBBejdFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120025904"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2024 17:53:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqxP-0002CY-1O;
	Mon, 18 Nov 2024 01:53:39 +0000
Date: Mon, 18 Nov 2024 09:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [atishp04:b4/counter_delegation_v2 7/24]
 Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error
 parsing file
Message-ID: <202411180914.968OQlie-lkp@intel.com>
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
CC: Atish Patra <Atish.Patra@wdc.com>
TO: Atish Patra <atishp@rivosinc.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/atishp04/linux b4/counter_delegation_v2
head:   20eccade6e1057a3ea847f0f5f9a6eaab65150d6
commit: 58925d5036606d346a176279ab81132f173fb67a [7/24] dt-bindings: riscv: add Sxcsrind ISA extension description
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: csky-randconfig-052-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180914.968OQlie-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180914.968OQlie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411180914.968OQlie-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
