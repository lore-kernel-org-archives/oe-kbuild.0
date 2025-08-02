Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944518991E
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754115100; cv=none; b=qspYRCW6YuZDgDEgqaXrpNtfiuRXGQkWxTKUcdivifwMrsq7pCh0/AJVvjcMSY1Anx/ETFD61vhBK9bZASbA/SYv4ZQZkU9U055N8LBclqjfeXTqYfR994YcuVxE5NLOAYpyNmlBAOSaPRxzgp3/l4Zw2VjOCGJnvRjhisApyxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754115100; c=relaxed/simple;
	bh=S7JKL4bYKs1ty2MTBLly9da85YFwDMKvBuAEOtO98lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAv9oMrFRzFr0UFNr/ecayqZYssQfRz+Gk5FB2rrjgsuRzyLPrNT5WydxXFpuzaKFoMxC5zm4Fgkyu70xGRNhX49PO/lILju1F04te7XbA46NGr3ocuZh3S8SmlR8ixOACdl67OrZrgqBzthLctL+Xeexxggb6CZAXE2NeHEFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EB+DBrfT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EB+DBrfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754115099; x=1785651099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7JKL4bYKs1ty2MTBLly9da85YFwDMKvBuAEOtO98lk=;
  b=EB+DBrfTlwZZgyrZeroJeyHc3ht9Py1gPzSzvUMCYswbg7JNAUUAWK+V
   GiALzkJXj9P7zroGZldMaYz3bZbz4ATIQHEsxfY5gCRLLzVeudRPaK4xR
   pvw9OSSZGKRqgXLtspV7Q8soO0AJyBIHYZBkF6vc03XxFZ3tnfV4xSxp4
   6UJJ0yVpobAq8Xv70eyG/R6blODbZgaQSxsHH4Qerp2JKW0GQyBHUNhgV
   FqCbWYldX9r7DNqcMi/EOvCMsl9jlFmHJRhB8WErTMy5di2JumOjgJO04
   OYaN4BFNLaZE1FiufG1DYzTo8YfNNRGYAhBF4HngthlUHQ4S8LtT2Em3w
   g==;
X-CSE-ConnectionGUID: +fy7Rc9xQdCuStRjOWktxA==
X-CSE-MsgGUID: JDAcGpFEQWugY+G9Fmgwng==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56537913"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56537913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 23:11:37 -0700
X-CSE-ConnectionGUID: tfVrgJ2uQf6ighZ3xLQMeQ==
X-CSE-MsgGUID: xw8jknhNRRiazO2DHmimww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169113616"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 23:11:35 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui5Sv-0005DA-0W;
	Sat, 02 Aug 2025 06:11:33 +0000
Date: Sat, 2 Aug 2025 14:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/mediated_pmu 3/61] arch/x86/kvm/irq.c:218
 __kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented
Message-ID: <202508021408.3Yi6hiLr-lkp@intel.com>
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

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   b18322b780176f1931200b1f513b8f7eb536b39b
commit: edac8bea406a1708de388489983c9f6e28625b77 [3/61] KVM: x86: Add a wrapper to handle common case of IRQ delivery without dest_map
:::::: branch date: 8 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-r071-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021408.3Yi6hiLr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508021408.3Yi6hiLr-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/irq.c:218 __kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/irq.c:425 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented

vim +/i +218 arch/x86/kvm/irq.c

b771b1616ff89d Sean Christopherson 2025-06-11  197  
edac8bea406a17 Sean Christopherson 2025-07-31  198  int __kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
edac8bea406a17 Sean Christopherson 2025-07-31  199  			       struct kvm_lapic_irq *irq,
edac8bea406a17 Sean Christopherson 2025-07-31  200  			       struct dest_map *dest_map)
e76c274513f24d Sean Christopherson 2025-06-11  201  {
e76c274513f24d Sean Christopherson 2025-06-11  202  	int r = -1;
e76c274513f24d Sean Christopherson 2025-06-11  203  	struct kvm_vcpu *vcpu, *lowest = NULL;
e76c274513f24d Sean Christopherson 2025-06-11  204  	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
e76c274513f24d Sean Christopherson 2025-06-11  205  	unsigned int dest_vcpus = 0;
e76c274513f24d Sean Christopherson 2025-06-11  206  
e76c274513f24d Sean Christopherson 2025-06-11  207  	if (kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
e76c274513f24d Sean Christopherson 2025-06-11  208  		return r;
e76c274513f24d Sean Christopherson 2025-06-11  209  
e76c274513f24d Sean Christopherson 2025-06-11  210  	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
e76c274513f24d Sean Christopherson 2025-06-11  211  	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
e76c274513f24d Sean Christopherson 2025-06-11  212  		pr_info("apic: phys broadcast and lowest prio\n");
e76c274513f24d Sean Christopherson 2025-06-11  213  		irq->delivery_mode = APIC_DM_FIXED;
e76c274513f24d Sean Christopherson 2025-06-11  214  	}
e76c274513f24d Sean Christopherson 2025-06-11  215  
e76c274513f24d Sean Christopherson 2025-06-11  216  	memset(dest_vcpu_bitmap, 0, sizeof(dest_vcpu_bitmap));
e76c274513f24d Sean Christopherson 2025-06-11  217  
e76c274513f24d Sean Christopherson 2025-06-11 @218  	kvm_for_each_vcpu(i, vcpu, kvm) {
e76c274513f24d Sean Christopherson 2025-06-11  219  		if (!kvm_apic_present(vcpu))
e76c274513f24d Sean Christopherson 2025-06-11  220  			continue;
e76c274513f24d Sean Christopherson 2025-06-11  221  
e76c274513f24d Sean Christopherson 2025-06-11  222  		if (!kvm_apic_match_dest(vcpu, src, irq->shorthand,
e76c274513f24d Sean Christopherson 2025-06-11  223  					irq->dest_id, irq->dest_mode))
e76c274513f24d Sean Christopherson 2025-06-11  224  			continue;
e76c274513f24d Sean Christopherson 2025-06-11  225  
e76c274513f24d Sean Christopherson 2025-06-11  226  		if (!kvm_lowest_prio_delivery(irq)) {
e76c274513f24d Sean Christopherson 2025-06-11  227  			if (r < 0)
e76c274513f24d Sean Christopherson 2025-06-11  228  				r = 0;
e76c274513f24d Sean Christopherson 2025-06-11  229  			r += kvm_apic_set_irq(vcpu, irq, dest_map);
e76c274513f24d Sean Christopherson 2025-06-11  230  		} else if (kvm_apic_sw_enabled(vcpu->arch.apic)) {
e76c274513f24d Sean Christopherson 2025-06-11  231  			if (!kvm_vector_hashing_enabled()) {
e76c274513f24d Sean Christopherson 2025-06-11  232  				if (!lowest)
e76c274513f24d Sean Christopherson 2025-06-11  233  					lowest = vcpu;
e76c274513f24d Sean Christopherson 2025-06-11  234  				else if (kvm_apic_compare_prio(vcpu, lowest) < 0)
e76c274513f24d Sean Christopherson 2025-06-11  235  					lowest = vcpu;
e76c274513f24d Sean Christopherson 2025-06-11  236  			} else {
e76c274513f24d Sean Christopherson 2025-06-11  237  				__set_bit(i, dest_vcpu_bitmap);
e76c274513f24d Sean Christopherson 2025-06-11  238  				dest_vcpus++;
e76c274513f24d Sean Christopherson 2025-06-11  239  			}
e76c274513f24d Sean Christopherson 2025-06-11  240  		}
e76c274513f24d Sean Christopherson 2025-06-11  241  	}
e76c274513f24d Sean Christopherson 2025-06-11  242  
e76c274513f24d Sean Christopherson 2025-06-11  243  	if (dest_vcpus != 0) {
e76c274513f24d Sean Christopherson 2025-06-11  244  		int idx = kvm_vector_to_index(irq->vector, dest_vcpus,
e76c274513f24d Sean Christopherson 2025-06-11  245  					dest_vcpu_bitmap, KVM_MAX_VCPUS);
e76c274513f24d Sean Christopherson 2025-06-11  246  
e76c274513f24d Sean Christopherson 2025-06-11  247  		lowest = kvm_get_vcpu(kvm, idx);
e76c274513f24d Sean Christopherson 2025-06-11  248  	}
e76c274513f24d Sean Christopherson 2025-06-11  249  
e76c274513f24d Sean Christopherson 2025-06-11  250  	if (lowest)
e76c274513f24d Sean Christopherson 2025-06-11  251  		r = kvm_apic_set_irq(lowest, irq, dest_map);
e76c274513f24d Sean Christopherson 2025-06-11  252  
e76c274513f24d Sean Christopherson 2025-06-11  253  	return r;
e76c274513f24d Sean Christopherson 2025-06-11  254  }
e76c274513f24d Sean Christopherson 2025-06-11  255  

:::::: The code at line 218 was first introduced by commit
:::::: e76c274513f24d92074e36e40f799b44aeb7a0fb KVM: x86: Fold irq_comm.c into irq.c

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
