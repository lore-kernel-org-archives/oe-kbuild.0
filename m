Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F49182CD
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734405356; cv=none; b=YSiiNVUM4p8eLE+IaNa8OrdELcvVTRUcJfm38L8T9BEFY3WSWlPjJjeOiiLgn7sajLjE0aqdL6xpBBPxEoXBlZIOv4zoIshMahBapS4TlGNvunq6b1BwpUappscO0+peu/GR+i3YAGwLTgdn13Ethgcva5YZExgbfkmWw1pvbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734405356; c=relaxed/simple;
	bh=pEYpLsjeUTE6ribC1d6haYe0S08X7AR0Qs0xxkpJgNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSVdbw+jVJwFj+eHznabekdZvboaJWyRhKaPDj1hvX7C5BNNFifEso+7oxz3o/cKxLucn6dcn4VXuF2SpRK1+qM9uFi9VBMkT7HydSG/YrVbtckvOQa9g/vwqxBug8BCc28+3iUjhTOslL2lB1gXk7zSCWr+vdQh/1iEaRi+I/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtzeXWIu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtzeXWIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734405355; x=1765941355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEYpLsjeUTE6ribC1d6haYe0S08X7AR0Qs0xxkpJgNY=;
  b=LtzeXWIu9/CticPfIIhFt6/Kov6qBZY8TyLosiOuSebRtofc9ff/3nLl
   luDMuCSSwaVQVN9CKcIqxHtEN8fd7PusSnWcxll8MzO/VDXITZ7tZLaWW
   jgyeaZLvJJUxJOJiJ8IsQwxFhG374GAYIJog7sDUGGZ8n2UAV3PGGSfnp
   N1vwmUVSX5W5BPxi+uDHJNesvkjmSi7BeFU7ZSZgITF56ZsPWASbn3TDf
   bV43J5z21oQKzR0FIIV4e2bHpVPrMXkfQQT+l0LQfGANl4Yfn7R4LjfU9
   C7051LZBQkx/4/Y04yVjSzZA3/fR4iU4m9ojIn9dSO4D75CXFdf8TKvNa
   g==;
X-CSE-ConnectionGUID: dB7YBtvESlWyHslVieXl8w==
X-CSE-MsgGUID: Q7pBYKQLT2ygCxIvc3I10w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34548668"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="34548668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 19:15:55 -0800
X-CSE-ConnectionGUID: 0FT80t5OQaqLn0fze0PQ4A==
X-CSE-MsgGUID: oSBOUIsrT12JP0rpC6j4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="102254248"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2024 19:15:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNO3q-000EfU-2Y;
	Tue, 17 Dec 2024 03:15:50 +0000
Date: Tue, 17 Dec 2024 11:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol
 'fail'.
Message-ID: <202412171131.72aDJUdO-lkp@intel.com>
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
head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
commit: be0135bde1df5e80cffacd2ed6f952e6d38d6f71 KVM: arm64: nv: Add basic emulation of AT S1E1{R,W}P
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241217/202412171131.72aDJUdO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412171131.72aDJUdO-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol 'fail'.

vim +/fail +71 arch/arm64/kvm/at.c

477e89cabb1428d Marc Zyngier 2024-06-19  51  
be0135bde1df5e8 Marc Zyngier 2024-07-14  52  static bool at_s1e1p_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
be0135bde1df5e8 Marc Zyngier 2024-07-14  53  {
be0135bde1df5e8 Marc Zyngier 2024-07-14  54  	u64 host_pan;
be0135bde1df5e8 Marc Zyngier 2024-07-14  55  	bool fail;
be0135bde1df5e8 Marc Zyngier 2024-07-14  56  
be0135bde1df5e8 Marc Zyngier 2024-07-14  57  	host_pan = read_sysreg_s(SYS_PSTATE_PAN);
be0135bde1df5e8 Marc Zyngier 2024-07-14  58  	write_sysreg_s(*vcpu_cpsr(vcpu) & PSTATE_PAN, SYS_PSTATE_PAN);
be0135bde1df5e8 Marc Zyngier 2024-07-14  59  
be0135bde1df5e8 Marc Zyngier 2024-07-14  60  	switch (op) {
be0135bde1df5e8 Marc Zyngier 2024-07-14  61  	case OP_AT_S1E1RP:
be0135bde1df5e8 Marc Zyngier 2024-07-14  62  		fail = __kvm_at(OP_AT_S1E1RP, vaddr);
be0135bde1df5e8 Marc Zyngier 2024-07-14  63  		break;
be0135bde1df5e8 Marc Zyngier 2024-07-14  64  	case OP_AT_S1E1WP:
be0135bde1df5e8 Marc Zyngier 2024-07-14  65  		fail = __kvm_at(OP_AT_S1E1WP, vaddr);
be0135bde1df5e8 Marc Zyngier 2024-07-14  66  		break;
be0135bde1df5e8 Marc Zyngier 2024-07-14  67  	}
be0135bde1df5e8 Marc Zyngier 2024-07-14  68  
be0135bde1df5e8 Marc Zyngier 2024-07-14  69  	write_sysreg_s(host_pan, SYS_PSTATE_PAN);
be0135bde1df5e8 Marc Zyngier 2024-07-14  70  
be0135bde1df5e8 Marc Zyngier 2024-07-14 @71  	return fail;
be0135bde1df5e8 Marc Zyngier 2024-07-14  72  }
be0135bde1df5e8 Marc Zyngier 2024-07-14  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
