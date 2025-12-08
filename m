Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BEC242D79
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765221122; cv=none; b=unFzEaF4hOIIbqOA8rJEG7n+29s7FudcMbxUm8WRaLXp47H7+qZjzv579bgg2Vm8/xS1eutHvNGvZDl9wOqgbPVpuO+WFOFx8qFi7yyUjDqVQ6yIhZ3e/IWl61Pkx3KBC77xnyBe6m+WoZ28GPwXzToheTZI3/rdTpiZICI4QgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765221122; c=relaxed/simple;
	bh=6KnB0sfUPCyfWsHVcDAc05c3uTzP1Y/je2CkUOFLtS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpVFfgDYHAbEHlnwF0w2cngAZjX07JH4E+UN6hBaJ9glcv6nuxqvIoQTleB//1B2b96hHTiKMbl5Xj2OQVlvpEH+nBvaYO0li19USUrOwkTHs4w3cBsaMbeQnbtSXiPWX12jaOYEK56+JrTSoYm/zyxhzY4c07cpjpV3Cla3yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHtNVLHY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHtNVLHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765221120; x=1796757120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KnB0sfUPCyfWsHVcDAc05c3uTzP1Y/je2CkUOFLtS8=;
  b=QHtNVLHYe8o2GptgDyjIoZiA0Krjkgs8gBJtRFrkv6zKjM3u2sT0kKHl
   q6OX+R+5v91uEMXy38q4tSqXZ6KCoMEIGYcArFjxt87k7plomDTB9btfV
   cWIHHGQRamtlTwzWvFgybxLxSL5Jk/CDFFzvc5RqTQKVYxZ3CUqMm3MII
   KaHGqmsblLYjH2Si2n+JKmwAYvydWADHn3KiS/xKmk+XhjCeIuTSxj9QS
   M1wbAGGzEH9zXdXqjMgIKJdCsfQnM6rax1TpMQOuYEtowqiPtm13sYgSY
   aThJBXjlq36HwkG1M5xT/wZsvq6hktg8xJRIE5obi6EIfRX9fhsaM2D5B
   g==;
X-CSE-ConnectionGUID: GGdUqqfuQVi3XPsX6/WbAw==
X-CSE-MsgGUID: b7Rf8D+XT5yxBVm7ElBoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66354229"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="66354229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:11:59 -0800
X-CSE-ConnectionGUID: X0pc/5imQWOdDrrToWVYhg==
X-CSE-MsgGUID: EePr4/PiR8qUIA0gDqbyuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195296864"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2025 11:11:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgeJ-000000000kX-0oru;
	Mon, 08 Dec 2025 19:11:55 +0000
Date: Tue, 9 Dec 2025 03:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/irq_no_destmap 7/10] arch/x86/kvm/lapic.c:1314
 __kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented
Message-ID: <202512090250.nEnbUEkh-lkp@intel.com>
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

tree:   https://github.com/sean-jc/linux x86/irq_no_destmap
head:   0ed74286d031b1d01174262f82e5484bf55e607e
commit: 6790cffdfb45243c3cec0001ce2f7c1c446ee6c5 [7/10] KVM: x86: Add a wrapper to handle common case of IRQ delivery without dest_map
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090250.nEnbUEkh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512090250.nEnbUEkh-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/lapic.c:1314 __kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/lapic.c:404 kvm_recalculate_apic_map() warn: iterator 'i' not incremented
arch/x86/kvm/lapic.c:1276 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented

vim +/i +1314 arch/x86/kvm/lapic.c

d273b52b6fad95 Sean Christopherson 2025-09-18  1293  
6790cffdfb4524 Sean Christopherson 2025-07-31  1294  int __kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
6790cffdfb4524 Sean Christopherson 2025-07-31  1295  			       struct kvm_lapic_irq *irq,
6790cffdfb4524 Sean Christopherson 2025-07-31  1296  			       struct dest_map *dest_map)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1297  {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1298  	int r = -1;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1299  	struct kvm_vcpu *vcpu, *lowest = NULL;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1300  	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
cbf5d9457462c8 Sean Christopherson 2025-08-21  1301  	unsigned int dest_vcpus = 0;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1302  
6790cffdfb4524 Sean Christopherson 2025-07-31  1303  	if (__kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1304  		return r;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1305  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1306  	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
cbf5d9457462c8 Sean Christopherson 2025-08-21  1307  	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1308  		pr_info("apic: phys broadcast and lowest prio\n");
cbf5d9457462c8 Sean Christopherson 2025-08-21  1309  		irq->delivery_mode = APIC_DM_FIXED;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1310  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1311  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1312  	memset(dest_vcpu_bitmap, 0, sizeof(dest_vcpu_bitmap));
cbf5d9457462c8 Sean Christopherson 2025-08-21  1313  
cbf5d9457462c8 Sean Christopherson 2025-08-21 @1314  	kvm_for_each_vcpu(i, vcpu, kvm) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1315  		if (!kvm_apic_present(vcpu))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1316  			continue;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1317  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1318  		if (!kvm_apic_match_dest(vcpu, src, irq->shorthand,
cbf5d9457462c8 Sean Christopherson 2025-08-21  1319  					irq->dest_id, irq->dest_mode))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1320  			continue;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1321  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1322  		if (!kvm_lowest_prio_delivery(irq)) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1323  			if (r < 0)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1324  				r = 0;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1325  			r += kvm_apic_set_irq(vcpu, irq, dest_map);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1326  		} else if (kvm_apic_sw_enabled(vcpu->arch.apic)) {
aac057dd623132 Sean Christopherson 2025-08-21  1327  			if (!vector_hashing_enabled) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1328  				if (!lowest)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1329  					lowest = vcpu;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1330  				else if (kvm_apic_compare_prio(vcpu, lowest) < 0)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1331  					lowest = vcpu;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1332  			} else {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1333  				__set_bit(i, dest_vcpu_bitmap);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1334  				dest_vcpus++;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1335  			}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1336  		}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1337  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1338  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1339  	if (dest_vcpus != 0) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1340  		int idx = kvm_vector_to_index(irq->vector, dest_vcpus,
cbf5d9457462c8 Sean Christopherson 2025-08-21  1341  					dest_vcpu_bitmap, KVM_MAX_VCPUS);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1342  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1343  		lowest = kvm_get_vcpu(kvm, idx);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1344  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1345  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1346  	if (lowest)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1347  		r = kvm_apic_set_irq(lowest, irq, dest_map);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1348  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1349  	return r;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1350  }
cbf5d9457462c8 Sean Christopherson 2025-08-21  1351  

:::::: The code at line 1314 was first introduced by commit
:::::: cbf5d9457462c83c1bf851c0b8b04296b037a9dd KVM: x86: Move kvm_irq_delivery_to_apic() from irq.c to lapic.c

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
