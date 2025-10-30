Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655D34D395
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761864694; cv=none; b=fDl/r5aP1gCVZuPKR+nx6d8grI5OvCyPLdw0dqpXH0Cltde0mGb/hBu6PiiYC3Hbm8uGkBAddefboU/MUGJ42PUbQpceEv/YeHAY6XC+VjF3R7LjF1lG7k9jsoYTEqp2NL80gaLwWQXvMraGGQ4C7agadw7mJuoKnvmc1mN1JcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761864694; c=relaxed/simple;
	bh=gdQehCiztGJqCtIkRbLbeRTRltagzC/FDqkNfgwl2Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR/ISW37oAbZQ9q8dvzlG8BgL+0meKR7/u4f2dBhIqpTrWQALCoPpXXh2dB93RCqc3q/tRUKnbfxGsUCGddvl/6u6/K8Q1sQulBmUbE1gcWZkLds7qAedkY7JoYqA2boQf0cfi3CGuzwZZ1YDhQ9f3IFGuNBzbv3M+4mF4nYtSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McePNU/U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McePNU/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761864693; x=1793400693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdQehCiztGJqCtIkRbLbeRTRltagzC/FDqkNfgwl2Rs=;
  b=McePNU/UbnWcF5ZU50nS2fUioCg/XUncSBEGJM8odyu0yf5/7NLOYUey
   8VqKo0qs+bFJH7EbnlcR2LOjiHrhqjW1iryq0z3lys5XRfRKhNKKxKPoI
   AXZhGEw3Ku66kvvDzZZe1gTYLZNngBKyq8KB/VAKyg9nkdcuNxooVp9Tg
   1eZk+3I01T7yVeE9hNua+4HB0nMkwVs5sHZULib4udAUBfGt+xIiS/HSc
   m4+2Sl5qo4adg2LA5sevr4maJ41QjNmKjZvkSi33W71CS7fCL3KcwWKUB
   t4wGgUCxsj+FojP01Y4TYPI1uJLXXwycaw9prusElc39qhGM5bGjNzxWR
   A==;
X-CSE-ConnectionGUID: Hf49RWOQR6u54K7yObbUhg==
X-CSE-MsgGUID: ZSX1vj4US0mAu5Ii9o5Kmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64061434"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64061434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:51:32 -0700
X-CSE-ConnectionGUID: 8uoTt6D/S0WtPeSUn3tH2Q==
X-CSE-MsgGUID: jSyYoZJoTYKR586vGlEsCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190428510"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 15:51:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEbUO-000Mar-1t;
	Thu, 30 Oct 2025 22:51:28 +0000
Date: Fri, 31 Oct 2025 06:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/arm.c:142
 kvm_clear_hdbss() warn: iterator 'i' not incremented
Message-ID: <202510310636.P5P76f1C-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jinqian Yang <yangjinqian1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 00c93102b328bfe49e863eac41a86cf5cec4ba4e [3064/3064] KVM: arm64: fix memory leak in HDBSS
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310636.P5P76f1C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510310636.P5P76f1C-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/arm.c:142 kvm_clear_hdbss() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/arm.c:185 kvm_cap_arm_enable_hdbss() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:966 kvm_arm_halt_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:976 kvm_arm_resume_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:1945 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:2789 kvm_mpidr_to_vcpu() warn: iterator 'i' not incremented

vim +/i +142 arch/arm64/kvm/arm.c

749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  132  
8d2e1e3b26a998 arch/arm64/kvm/arm.c eillon           2025-04-02  133  #ifdef CONFIG_ARM64_HDBSS
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  134  static void kvm_clear_hdbss(struct kvm *kvm)
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  135  {
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  136  	unsigned long i;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  137  	struct kvm_vcpu *vcpu;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  138  	struct page *hdbss_pg;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  139  
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  140  	kvm->arch.vtcr &= ~(VTCR_EL2_HD | VTCR_EL2_HDBSS);
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  141  
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26 @142  	kvm_for_each_vcpu(i, vcpu, kvm) {
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  143  		/* Kick vcpus to flush hdbss buffer. */
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  144  		kvm_vcpu_kick(vcpu);
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  145  
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  146  		hdbss_pg = phys_to_page(HDBSSBR_BADDR(vcpu->arch.hdbss.br_el2));
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  147  		if (hdbss_pg)
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  148  			__free_pages(hdbss_pg, HDBSSBR_SZ(vcpu->arch.hdbss.br_el2));
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  149  
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  150  		vcpu->arch.hdbss.br_el2 = 0;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  151  		vcpu->arch.hdbss.prod_el2 = 0;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  152  	}
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  153  
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  154  	kvm->enable_hdbss = false;
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  155  }
00c93102b328bf arch/arm64/kvm/arm.c Jinqian Yang     2025-08-26  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
