Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C63093A8
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766092280; cv=none; b=EJUELG85LKp8EE/6R1MOH9Jrs5P+zOO5eQjVTs4BEQNacrWZ2LnCjYTLAg/hZwHxorjBgw1RqthpamztZowmMzet/HaBeTtoaLVtmodBHVMWWY++GgA2X6dSeMUbGsXkub6xX5pqVDkY5q44CiNVQbjJcNkqVyxRLGM8kEvdn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766092280; c=relaxed/simple;
	bh=kP690P1M1vwrNSSgwhkozHdk3BQuv4lLJOUUw5Ikel8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rf87JPPO21mSdPbS0uhGuZ0OpPc0QYgmq55aXpSJ1YuiI1mSi0cgalkFfhB+uLEV2+ToszXonMfPVKDrmNeqPmFM0Z14VhEWibylRP/w5wztBSmIg7wmt95VZr20oPOfRleIAxA9Vm4AgMxkkysxImhDhJpji5LZzV3jexIi+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMjq5ARU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMjq5ARU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766092278; x=1797628278;
  h=date:from:to:subject:message-id:mime-version;
  bh=kP690P1M1vwrNSSgwhkozHdk3BQuv4lLJOUUw5Ikel8=;
  b=gMjq5ARUBrXullmO6NE+4AA8CbopYPactvxzjmFnXrtbHmMorkMhbDgx
   vpRyQg/Rb92LwoHJEygqjvOqx0ODbtAM67INTVhyGiizguFgEZzK/oeBS
   zeKnavitEES6JmiIxDEunKhK2JcWT3pXIkFXg54u6Yo1qESMWfem16cub
   LB82wPbTJOB6YfTd56wGiDl98Q0LU71w7sC8cBHjAH0ij8ldjG+P9EUvu
   koNBLIey+k8Q0AL7z5OZAeuxUb83x2Y9A2osKFpu34pMF5u9ogpuh/kH3
   DuRKDUuoPyl5lIJs289XbZxYeY2Xr10c56xJRd1xwbmo1paAv/g139sKL
   w==;
X-CSE-ConnectionGUID: y75FcS0NT2Oriun6TgfkQA==
X-CSE-MsgGUID: nclozZdfRUmzYcbaCuvrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85642077"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="85642077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:11:16 -0800
X-CSE-ConnectionGUID: JQXgQILmSgG7SLnVtdmymw==
X-CSE-MsgGUID: 9Nc7p1YXRFG3VHEcrq1zZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="236105176"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 13:11:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLHE-0000000044O-2moS
	for oe-kbuild@lists.linux.dev;
	Thu, 18 Dec 2025 21:11:12 +0000
Date: Thu, 18 Dec 2025 22:10:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 24/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'in'
Message-ID: <202512182217.fUTtg0bc-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   d4bbfe35a214da7cae241d61b7d45d05da1b3bbd
commit: d3f44440fcc10e3acac775d628ede81b05cfc9c5 [24/29] KVM: arm64: Context switch SME state for guests
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512182217.fUTtg0bc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#26: 
guest operations that are invalid in in streaming mode will generate SME

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
