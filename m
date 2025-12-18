Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA028371
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045270; cv=none; b=jkDTxN3TmzFfMorOTEdyqm5HZeI9LA8VM6ybLKbtyUTfAyhTIyebe4EuiY32r5H0ygoG6foKuyq69OJidw0rPBNQq25Kok1qARqkeTil1/tWAyV/Pl9oZeZDRkl+ZiDhoZMUaSq8bSHKiZTOAlv8bfUqMwx4jwd2KPJbEEcCTlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045270; c=relaxed/simple;
	bh=qNJ6OsVWFZxTLyDqzEn+GhJS8Rr8tDPuRgt0B1nSsCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTKY7+nHhR/Y/TLVRc0hgXzlyzhV4pt9EWHg0OtB7pOchRG8oMlQpyzcK2GHdry5qQx6DsDZQkRieeKKNizBDMasYPI1hxPqbDEQF5Pc+A9jrUrA5gCqBDLpXv2SKEq3t8Dd1aTeJ/79cVFEiQzpG/DHHZCx4ng0iOaaxm3iFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh77xZZ9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh77xZZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766045268; x=1797581268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNJ6OsVWFZxTLyDqzEn+GhJS8Rr8tDPuRgt0B1nSsCU=;
  b=jh77xZZ9IJ9JWwcZTFiqgyOkS5ExQsW6IigJon9VDt40wQBimvS1eHOE
   VaDFEiIP9Yn7KOF7hbBD1Bg/WEescxaCLq2dHe9TaXdr2rZIJMhwQrILN
   gGZQJOJDeNgi+rlBAZOI7R51boG5GsqcnVTl8tkYRPebh/MnL+bnvTSZ3
   wHb7rZstcQOycm8094RccBC+JMGpwsoexL+oar9ezEytyKV1op4zYbxfi
   aznRlOK5E7gvCVmEV4LB1md6EM95J8BtFfGQmOdJZ8ge7WKEM+aXDR+Tf
   FTuAGYpjymKq2NQFRXcFQwUzhrn/u2+/CPcEsy/lhlLeOLSLNl9NHSsvy
   A==;
X-CSE-ConnectionGUID: Lt4ZAgvtRw6Mv4SgHI+PJw==
X-CSE-MsgGUID: DsHzLDdgSCi/FERPwEVZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78631682"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78631682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 00:07:47 -0800
X-CSE-ConnectionGUID: I6MFvl5qQHqSxkwMo/fw2Q==
X-CSE-MsgGUID: OC2hQO7GTXaO+oEEWH5/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229215510"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 00:07:46 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW931-000000001nt-2yAQ;
	Thu, 18 Dec 2025 08:07:43 +0000
Date: Thu, 18 Dec 2025 16:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] phy: apple: Add Apple Type-C PHY
Message-ID: <202512181542.sy0ocSoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/apple/atc.c:2292:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251214-b4-atcphy-v3-3-ba82b20e9459@kernel.org>
References: <20251214-b4-atcphy-v3-3-ba82b20e9459@kernel.org>
TO: Sven Peter <sven@kernel.org>

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-Peter/soc-apple-Add-hardware-tunable-support/20251214-195404
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251214-b4-atcphy-v3-3-ba82b20e9459%40kernel.org
patch subject: [PATCH v3 3/3] phy: apple: Add Apple Type-C PHY
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r122-20251216 (https://download.01.org/0day-ci/archive/20251218/202512181542.sy0ocSoL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181542.sy0ocSoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181542.sy0ocSoL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:2292:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2292:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/apple/atc.c:2293:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2293:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: bad integer constant expression
   drivers/phy/apple/atc.c:2294:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/soc/apple/tunable.c:78:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:78:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/soc/apple/tunable.c:79:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:79:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/soc/apple/tunable.c:80:1: sparse: sparse: bad integer constant expression
   drivers/soc/apple/tunable.c:80:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +2292 drivers/phy/apple/atc.c

7ac6d338ba7686 Sven Peter 2025-12-14  2291  
7ac6d338ba7686 Sven Peter 2025-12-14 @2292  MODULE_AUTHOR("Sven Peter <sven@kernel.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
