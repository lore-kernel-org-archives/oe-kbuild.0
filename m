Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF89191F65
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729361451; cv=none; b=FYr5QHuRQFejJn1GU2XjJN6BGSuMm0S5MzcsEgcZCryCfVkQ019zIRVsnYgiEnJ4WeRBAtZP7dZb/SMOTtTrITA9RqkSifTxRvTMudKqUi23jAs+z77uMcfJTrj4HQzPOqjBI0oooKrJevo+mDGj+zBFCa7Al9B9lUDRgQtgq0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729361451; c=relaxed/simple;
	bh=rxfTjk1UhgcEBN7toPffxRd94y0gaLfbM/RtQ+01bQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGK4r6LSeqt+WnFaGYBiP79CLMFVqRonzx4Kf691u1KDqOHMNr5bKItCVuIe0XmtG6qIGbfxrRU0GFlZgiWLwT8O3q0OMZOFbPrVzV6PjGOqZlkZv5qyLsEfsAbchB/CMfSFc1AePfMn1z+2enTwEXJhxisfswQ7p8VVLNJO7m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQIicMhq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQIicMhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729361449; x=1760897449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rxfTjk1UhgcEBN7toPffxRd94y0gaLfbM/RtQ+01bQA=;
  b=JQIicMhq964nwIlULdQ/T3QeSgtk4r+f+atEX2tlgBEmo/NoTlcWCvfi
   enwkEqqMBKOm7hy2hBT9jFt3nUCUQ2kuYwfDg1BfjzUT5dBtmf0u/8Va3
   Z7sQc1CjVkAN0MKbDbYwxRdvvEcSTWdu10AyTW5A7ZUWqh3o7D1SXaH8q
   6zQbiadoYi11wIKsn/hwQrASbKVDwdO2Sh4X0KOUA5i8PZT7yP2K+jb7m
   3PV9x31rui3lPBlZxr9kT3Ur/2AKZMDTXD1qjKKG7CTwiElnr/OIqRZ3c
   sODlfGiOcu7LKGew7TgyuA/SO4pKPyeuMhAEiI61/4EClFzkd0C0IMgMi
   w==;
X-CSE-ConnectionGUID: 2BySkij8Tqaad5xorU9Kdw==
X-CSE-MsgGUID: iG6Mcb7/Tw+KPxX6mRTrXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29039766"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29039766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 11:10:49 -0700
X-CSE-ConnectionGUID: ZmtBms0jTlKczBSzK//qLQ==
X-CSE-MsgGUID: fDSWd26kQFCeQedzR8cOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79075645"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2024 11:10:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2DuW-000PLK-2G;
	Sat, 19 Oct 2024 18:10:44 +0000
Date: Sun, 20 Oct 2024 02:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol
 'fail'.
Message-ID: <202410200209.bAXXL58Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: be0135bde1df5e80cffacd2ed6f952e6d38d6f71 KVM: arm64: nv: Add basic emulation of AT S1E1{R,W}P
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241020/202410200209.bAXXL58Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410200209.bAXXL58Q-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol 'fail'.

vim +/fail +71 arch/arm64/kvm/at.c

477e89cabb1428 Marc Zyngier 2024-06-19  51  
be0135bde1df5e Marc Zyngier 2024-07-14  52  static bool at_s1e1p_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
be0135bde1df5e Marc Zyngier 2024-07-14  53  {
be0135bde1df5e Marc Zyngier 2024-07-14  54  	u64 host_pan;
be0135bde1df5e Marc Zyngier 2024-07-14  55  	bool fail;
be0135bde1df5e Marc Zyngier 2024-07-14  56  
be0135bde1df5e Marc Zyngier 2024-07-14  57  	host_pan = read_sysreg_s(SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  58  	write_sysreg_s(*vcpu_cpsr(vcpu) & PSTATE_PAN, SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  59  
be0135bde1df5e Marc Zyngier 2024-07-14  60  	switch (op) {
be0135bde1df5e Marc Zyngier 2024-07-14  61  	case OP_AT_S1E1RP:
be0135bde1df5e Marc Zyngier 2024-07-14  62  		fail = __kvm_at(OP_AT_S1E1RP, vaddr);
be0135bde1df5e Marc Zyngier 2024-07-14  63  		break;
be0135bde1df5e Marc Zyngier 2024-07-14  64  	case OP_AT_S1E1WP:
be0135bde1df5e Marc Zyngier 2024-07-14  65  		fail = __kvm_at(OP_AT_S1E1WP, vaddr);
be0135bde1df5e Marc Zyngier 2024-07-14  66  		break;
be0135bde1df5e Marc Zyngier 2024-07-14  67  	}
be0135bde1df5e Marc Zyngier 2024-07-14  68  
be0135bde1df5e Marc Zyngier 2024-07-14  69  	write_sysreg_s(host_pan, SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  70  
be0135bde1df5e Marc Zyngier 2024-07-14 @71  	return fail;
be0135bde1df5e Marc Zyngier 2024-07-14  72  }
be0135bde1df5e Marc Zyngier 2024-07-14  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
