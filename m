Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6DB1465A5
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753838517; cv=none; b=RIjqNzMo+WPVurctlQHvYQo5MYRbNyDC5qBLN8YS9QuCx5Kd53P8h5gOFqV4HK0Zy0q1IFvaJKeUtejeg/25cwWqmnKls+39djHYBY4UGo/neOUyzJCJjAFeB1yPCH9Is9Vc2AoH5CMa9wxd9eunM8c/vED/+t3HElP8InbZDh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753838517; c=relaxed/simple;
	bh=XSVMoDIf3zKPj+c1AgIa+XJqTyXAtDlhZqzbLbhMhyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnI7i0dae8wO1Mrgum5K3avnzXcoDCDIdkVmrtbbNI3Rs5D/5gx3FVLf7hKeTu5EQJtWVOfMLTpC9+lVlL6PdpmPZqZ/fhNxsNUzqe5FVriS5XoH6lZhFX1e0LrI8r2AlEcV4vd1hPu8udPpS1Gos8KhUzFGab2Zr+lLu1XSeQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxPrxWnB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxPrxWnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753838516; x=1785374516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSVMoDIf3zKPj+c1AgIa+XJqTyXAtDlhZqzbLbhMhyo=;
  b=GxPrxWnBS+Y/OsXk3S4YkhNxV+3hX6A/fjnipOuHlZ3VXBP2tVVFgCJW
   KS8SitlAC+G/JyQ+6Ag9OlZKQt9pnOkLsVYbktM/9etjwUyf1hUom8TQY
   Zzi6yrKcSPhaYYtMlBXQV+x6sOaZLvZk3MnSAsMaPxozIRSkzrHmiJC22
   DN3Cctr6jqT7Ex4FY7yxlhE6FP618aXgwl/hodTd44JtzKrFL+FKbDsui
   nFjVsz7+pxRCctlnvPf87I56HpTb8in+wi6JIeC9OGLuslZyuo7UiDiT/
   ZL302E8A3evvDePMnN2lNuzhJNUKPPNhlsqmtTYQ8ZxcSLUmGnPEcYlgT
   A==;
X-CSE-ConnectionGUID: A3FbIz0SQYWIJAmHQ/BRgQ==
X-CSE-MsgGUID: 2//H83OASmmG+5hiwshY7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56012116"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56012116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:21:44 -0700
X-CSE-ConnectionGUID: jGIWf0Z5QsOpa6EndtmO/Q==
X-CSE-MsgGUID: HsAlNp7oRNGM4h4xI/4Kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162570798"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 18:21:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugvVk-0001qb-2q;
	Wed, 30 Jul 2025 01:21:40 +0000
Date: Wed, 30 Jul 2025 09:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/kvm_exports_for_kvm 15/20] arch/x86/kvm/lapic.c:1270
 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented
Message-ID: <202507300937.UHZWSKDK-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/kvm_exports_for_kvm
head:   cca43acd1c516a441e1f944680aaa4916ff50fef
commit: 1fee4c35c48369fa58a9e456c9b3a600c439f46d [15/20] KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20250729 (https://download.01.org/0day-ci/archive/20250730/202507300937.UHZWSKDK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507300937.UHZWSKDK-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/lapic.c:1270 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/lapic.c:400 kvm_recalculate_apic_map() warn: iterator 'i' not incremented

vim +/i +1270 arch/x86/kvm/lapic.c

8feb4a04dc7560 Feng Wu             2015-09-18  1259  
1fee4c35c48369 Sean Christopherson 2025-06-23  1260  bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
1fee4c35c48369 Sean Christopherson 2025-06-23  1261  			     struct kvm_vcpu **dest_vcpu)
1fee4c35c48369 Sean Christopherson 2025-06-23  1262  {
1fee4c35c48369 Sean Christopherson 2025-06-23  1263  	int r = 0;
1fee4c35c48369 Sean Christopherson 2025-06-23  1264  	unsigned long i;
1fee4c35c48369 Sean Christopherson 2025-06-23  1265  	struct kvm_vcpu *vcpu;
1fee4c35c48369 Sean Christopherson 2025-06-23  1266  
1fee4c35c48369 Sean Christopherson 2025-06-23  1267  	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
1fee4c35c48369 Sean Christopherson 2025-06-23  1268  		return true;
1fee4c35c48369 Sean Christopherson 2025-06-23  1269  
1fee4c35c48369 Sean Christopherson 2025-06-23 @1270  	kvm_for_each_vcpu(i, vcpu, kvm) {
1fee4c35c48369 Sean Christopherson 2025-06-23  1271  		if (!kvm_apic_present(vcpu))
1fee4c35c48369 Sean Christopherson 2025-06-23  1272  			continue;
1fee4c35c48369 Sean Christopherson 2025-06-23  1273  
1fee4c35c48369 Sean Christopherson 2025-06-23  1274  		if (!kvm_apic_match_dest(vcpu, NULL, irq->shorthand,
1fee4c35c48369 Sean Christopherson 2025-06-23  1275  					irq->dest_id, irq->dest_mode))
1fee4c35c48369 Sean Christopherson 2025-06-23  1276  			continue;
1fee4c35c48369 Sean Christopherson 2025-06-23  1277  
1fee4c35c48369 Sean Christopherson 2025-06-23  1278  		if (++r == 2)
1fee4c35c48369 Sean Christopherson 2025-06-23  1279  			return false;
1fee4c35c48369 Sean Christopherson 2025-06-23  1280  
1fee4c35c48369 Sean Christopherson 2025-06-23  1281  		*dest_vcpu = vcpu;
1fee4c35c48369 Sean Christopherson 2025-06-23  1282  	}
1fee4c35c48369 Sean Christopherson 2025-06-23  1283  
1fee4c35c48369 Sean Christopherson 2025-06-23  1284  	return r == 1;
1fee4c35c48369 Sean Christopherson 2025-06-23  1285  }
1fee4c35c48369 Sean Christopherson 2025-06-23  1286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
