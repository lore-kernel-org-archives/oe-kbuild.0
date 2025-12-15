Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0033F8C1
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827939; cv=none; b=ZIQVcJQXC4h99pcklDokd4iyIeKOWCQ0unFsrVWjdZ8XdrgfJWbC41thXLdKHw1whrHpqRM2Uni11vAOErFPhVbVLvmfFek5HCIIPOyfrHN4nSO0+Gixa1QGiDuPwj4Ymz1EbFTVwICxuAc+0KgVV1R3A4wOpMbDjXf1GIUVpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827939; c=relaxed/simple;
	bh=y0nM+yWJHZYn38WgWzHcuHLbZxIIgs/JDDVdJydFvhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hew6GFKm2qcuvRfxSDx7FdtNyym4NxpgNuW4Eftd0XCbcl3zTWlLSskKuW/P+HFsvl+TTiqqSn1IfELDehi+L0QgInifRzRmJgfKdiswt1jHrdtrLlkBq9IA2P3v4JkdqLidJKHC0ooLIOxYhZlFEABCwk/trHDZatj5/UyYD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzfxA+9L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzfxA+9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765827938; x=1797363938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0nM+yWJHZYn38WgWzHcuHLbZxIIgs/JDDVdJydFvhU=;
  b=OzfxA+9LkMJIt4YtfnLyBm6Q68mJmoc7sSVbmrmB1YIGs4hIP4WROQsD
   8xFqH3sXoxNg2y7BeqYXty0XmRKhuUO66ze7uMCZuaBGZmi+C91OFCqPl
   HrUjWpVTaszz6wNzOrnRysgRTTfZspGOX4IeAVW6Pi3A3eX03ZnFFlMT1
   Gm+/E/atuZyiY9qO+HqGE3uVUD1VZS0IlMcVwjN/LtPitwLk33LTb4o5E
   64GHg+uxH2VatmoQhxgyQ0rAhLwbQ4WEX40MEEnqcAlroIAxcrJmd99zq
   gRHZan0bnQuC8++8chPksCIwymk+i6kHwjf8Rng/iCGdZfSyHLHXuyhvX
   Q==;
X-CSE-ConnectionGUID: a3GNoXCBSEGXl47mKfB1Fw==
X-CSE-MsgGUID: /M5BK0CAROGiPajU6V0tCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67494334"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67494334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:45:36 -0800
X-CSE-ConnectionGUID: 7YIpa5MISiuS/6TiqI6OSg==
X-CSE-MsgGUID: 37LkHXDBQI6vXUl3yHXCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197084833"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 11:45:35 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVEVg-000000000g2-0NLQ;
	Mon, 15 Dec 2025 19:45:32 +0000
Date: Tue, 16 Dec 2025 03:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/lapic.c:1279 kvm_intr_is_single_vcpu() warn: iterator
 'i' not incremented
Message-ID: <202512160313.njQsasiq-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d273b52b6fad95b6b00b93250151c323c19de50d KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160313.njQsasiq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160313.njQsasiq-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/lapic.c:1279 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/lapic.c:404 kvm_recalculate_apic_map() warn: iterator 'i' not incremented
arch/x86/kvm/lapic.c:1316 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented

vim +/i +1279 arch/x86/kvm/lapic.c

8feb4a04dc7560 Feng Wu             2015-09-18  1268  
d273b52b6fad95 Sean Christopherson 2025-09-18  1269  bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
d273b52b6fad95 Sean Christopherson 2025-09-18  1270  			     struct kvm_vcpu **dest_vcpu)
d273b52b6fad95 Sean Christopherson 2025-09-18  1271  {
d273b52b6fad95 Sean Christopherson 2025-09-18  1272  	int r = 0;
d273b52b6fad95 Sean Christopherson 2025-09-18  1273  	unsigned long i;
d273b52b6fad95 Sean Christopherson 2025-09-18  1274  	struct kvm_vcpu *vcpu;
d273b52b6fad95 Sean Christopherson 2025-09-18  1275  
d273b52b6fad95 Sean Christopherson 2025-09-18  1276  	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
d273b52b6fad95 Sean Christopherson 2025-09-18  1277  		return true;
d273b52b6fad95 Sean Christopherson 2025-09-18  1278  
d273b52b6fad95 Sean Christopherson 2025-09-18 @1279  	kvm_for_each_vcpu(i, vcpu, kvm) {
d273b52b6fad95 Sean Christopherson 2025-09-18  1280  		if (!kvm_apic_present(vcpu))
d273b52b6fad95 Sean Christopherson 2025-09-18  1281  			continue;
d273b52b6fad95 Sean Christopherson 2025-09-18  1282  
d273b52b6fad95 Sean Christopherson 2025-09-18  1283  		if (!kvm_apic_match_dest(vcpu, NULL, irq->shorthand,
d273b52b6fad95 Sean Christopherson 2025-09-18  1284  					irq->dest_id, irq->dest_mode))
d273b52b6fad95 Sean Christopherson 2025-09-18  1285  			continue;
d273b52b6fad95 Sean Christopherson 2025-09-18  1286  
d273b52b6fad95 Sean Christopherson 2025-09-18  1287  		if (++r == 2)
d273b52b6fad95 Sean Christopherson 2025-09-18  1288  			return false;
d273b52b6fad95 Sean Christopherson 2025-09-18  1289  
d273b52b6fad95 Sean Christopherson 2025-09-18  1290  		*dest_vcpu = vcpu;
d273b52b6fad95 Sean Christopherson 2025-09-18  1291  	}
d273b52b6fad95 Sean Christopherson 2025-09-18  1292  
d273b52b6fad95 Sean Christopherson 2025-09-18  1293  	return r == 1;
d273b52b6fad95 Sean Christopherson 2025-09-18  1294  }
d273b52b6fad95 Sean Christopherson 2025-09-18  1295  EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
d273b52b6fad95 Sean Christopherson 2025-09-18  1296  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
