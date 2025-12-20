Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD22DC33F
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195555; cv=none; b=YuF5TE0xXnY74vVPmzHNmd8HiK0v82gsgIKkTa2wG6Pm6Vay+T2aHH78PESMYlvtHUw0pdQKYQXKoarB6mTR1OkWPiTnpGhbWETRKoZUY9eaabUaqohnXRhPDNDUN0VKjVynx3gTWeccPLU4QqGSneXBXGgPLl1H7t0s1Am/zuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195555; c=relaxed/simple;
	bh=nl6kXBZGe2/wThXizcW38TS+IoGVEna3/dJxBHB1EoI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ct9BCDJh3iBhodPwIfeFK7Xg8geqVFO9+yb6YLpPtBv7wkbVlWHqMHXE6c6aQLUwmG7OkOIWRiDkkGY8ZEUNarX5axNR259H2PqVeNFho4noZRQQGY7sh+BKFTBdIBP72UGMijjd7Oakf2H47JNOc2ToNXcGM0hornjHo8QlTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Te4ixiwi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te4ixiwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195553; x=1797731553;
  h=date:from:to:subject:message-id:mime-version;
  bh=nl6kXBZGe2/wThXizcW38TS+IoGVEna3/dJxBHB1EoI=;
  b=Te4ixiwigP2w7umuudhGBeELRfHVtI3g1KG574xNkCfxDQdwqH6bfM+W
   Aci6PKKsrlyhhtJH9OSR8dswhui43pmTCEUFUbpqt+mm7qvM5xMAcEl9W
   tu1N4titnDzNWxWKMtdxyT81nFPobOhZ3jE8YT/ZqjIdo5g8HUlAGckKb
   pCIOVGWTjH4maGMfCUUv+o11n5pZqT50lGqjlk5EBb84Caf6JUVvtsaQj
   u9WAaXhwn45ZOobMGFC5jfJAuIYws6UcWFwT2K9KqtyLuy6m4v1bDPirU
   E3/K6Nx0dOrfBuOj1CTHfv2D19ezWWAbkw/Q6PlwnDBDLzjtW2CmEYqwF
   w==;
X-CSE-ConnectionGUID: mjNq25bGSM6gRtpkU5uqBw==
X-CSE-MsgGUID: w5FzbHTPRcS9NzXw7MIjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71788859"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71788859"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:52:33 -0800
X-CSE-ConnectionGUID: zdWTF2+/Qqam8cPhs+JB2w==
X-CSE-MsgGUID: EHMuXtg1RSC1mboyVEgjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198593186"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2025 17:52:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWm8z-000000004RJ-0nyO
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:52:29 +0000
Date: Sat, 20 Dec 2025 02:52:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 41/82] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202512200259.Oq3bsb1s-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 630485e929592d57769e452952c4f66e473c28f1 [41/82] KVM: arm64: gic-v5: Add VPE doorbell domain
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200259.Oq3bsb1s-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#81: FILE: arch/arm64/kvm/vgic/vgic-v5.c:114:
+	switch(cmd_info->cmd_type) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
