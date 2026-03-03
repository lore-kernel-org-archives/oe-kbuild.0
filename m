Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8C373C03
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772501533; cv=none; b=uzEHk9TA6ptpjSe29u61IWDjCcuZ9zj1BdcEBhQROJD6fHGq8qUtrsU3sUHx7bnqygKaZteizQUPeb502O1wxk8d/kaAcZ+RpHBJfoaxkR+n3dHDjqd1H38NSteZ370K5UvQyFFOBYTpePTgHAekRp1kkyYmAWfsgUWD/MAPLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772501533; c=relaxed/simple;
	bh=XBg4RncNtS34ycsSy3m3R6ICzAhDoQBQMCX1ffNaQ8c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okmuHwLVv9sD1J1/SIOtapmLPy2o4y99yHstHguBr8vJRtxb33LqN3HBuePqzltK5Atb5Y02NVgCkEiPrtDY0z6SjweTdqNt0ImRSLMu8rGkNtGcfzxlsjswRc6VLotaYsmJQqepXLyc/wXxVvqpZ88Phc+tiMUBvpnTvhFE3tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJ/mo2JL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ/mo2JL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772501532; x=1804037532;
  h=date:from:to:subject:message-id:mime-version;
  bh=XBg4RncNtS34ycsSy3m3R6ICzAhDoQBQMCX1ffNaQ8c=;
  b=UJ/mo2JLvafPRAvgNuOls/zNQabwv77nEAAbzsBiurX5SlbZSKsQgv3Y
   pUlEkFECWqPo1Cc1y5VRXNqVOVOKgdUd0P/HthWUtxNpfO/SGf0F5/vg9
   8hG79yDqVh4Ggq+Zh3NaIO9/gZjjvmRDa7KycVQrZqyP7iaJp2zEa2zmB
   aBT+0Ub8s98GdfCh7e/bwaz9seTlJQanQ5GiMOCYcNnc3KLrxXlvriO/u
   LM4tV7MepV90YTjZyNC+QS42Urd1kdBb5sQjQRc1t49pttEBGeKRffVWQ
   lAgGqaMgY8TCdwy2Iso4/LYoQwN9SQRh1L11VT4JIc1HZUh8dRG24ANeV
   g==;
X-CSE-ConnectionGUID: qjDZ1Du1QDCvu4zSAzGO7Q==
X-CSE-MsgGUID: m17vmeDuQu2Rfn5jC1xz0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84163682"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="84163682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:32:11 -0800
X-CSE-ConnectionGUID: HMsAZpdwRguWHRQRN3Wd2g==
X-CSE-MsgGUID: +qNUx2vnSuWkRpsA6v2jPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="221995928"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2026 17:32:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEcK-000000001KX-2rbz
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 01:32:08 +0000
Date: Tue, 3 Mar 2026 02:31:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v7 14/26] KVM: nSVM: Drop the non-architectural
 consistency check for NP_ENABLE
Message-ID: <202603030209.SBjun6NN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260303003421.2185681-15-yosry@kernel.org>
References: <20260303003421.2185681-15-yosry@kernel.org>
TO: Yosry Ahmed <yosry@kernel.org>
TO: Sean Christopherson <seanjc@google.com>

Hi Yosry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 183bb0ce8c77b0fd1fb25874112bc8751a461e49]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-nSVM-Avoid-clearing-VMCB_LBR-in-vmcb12/20260303-084832
base:   183bb0ce8c77b0fd1fb25874112bc8751a461e49
patch link:    https://lore.kernel.org/r/20260303003421.2185681-15-yosry%40kernel.org
patch subject: [PATCH v7 14/26] KVM: nSVM: Drop the non-architectural consistency check for NP_ENABLE
:::::: branch date: 36 minutes ago
:::::: commit date: 37 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030209.SBjun6NN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#23: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
