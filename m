Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B825380
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746231045; cv=none; b=jBA6IPxAXHMr5MZe9j12eXKRnptmpNmedc/MbYR7BZeZQNNIY/l6tunHQmvYMHsk6KZXSUiB697tFb1K0dc0vtEsOO0Pp6KXVO3oef0NtPstrsx6GlYOgJ//Td+LP8XRNe3y48Q33W13c/zCclKnTGqnN20MvuhVdl1FveB3lpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746231045; c=relaxed/simple;
	bh=ucG78arrvI/EbyklEqcvHbHQLVeLEf6OOw7deFOswdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=re4d+HMLTx0BQtuvxbMO9+s09UQxUDoGcNbshTYosalATzzMUwxbJf+Mf0iHQAqUPO/alyXBjeo2gXPA9Z8P+Zv43/7KBHA11+a+NVH+T25oUVPi6bGuT5Z42qK3FbwaG8Fr+K64ETdCADYwJIVUbnCq2L2vgjrT78XaaGXuO1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BovsqYAE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BovsqYAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746231042; x=1777767042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucG78arrvI/EbyklEqcvHbHQLVeLEf6OOw7deFOswdo=;
  b=BovsqYAEis4JvsgP10mhMEYmz7mB9LMvqtcEcfIqim7T9YiVPhzZKXPN
   02IlyCEgdNnHsMDv+s04Cy5f8nLOeZcZ5OYqvXO2Of7GK5/H58Kd9nBDW
   i5fu4nvlYjrdk5gVQZBI7OAQ86dMOy2FR5kaJaOPloRilw+oL9LM4UE26
   EBX8DJqZdr9jkfBz9C4zY2xQrCc53++C3A5XTbA9KKaYXcGPGVSQQVHEa
   Zcc6LjdNZAGorTCjkd/otDUpOJzqyPXjkpvwn3To0c8d2Vw4c2KxZ5hKw
   SelX1is7vQFmBuMiuX+jxzpXfxoBuz+j9+bUA2dQvyW0bHRnLGiSgw7eq
   A==;
X-CSE-ConnectionGUID: 9vd303itTi64qOOJn8yffQ==
X-CSE-MsgGUID: zJisswjmRgai90HxOxX4dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58910066"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="58910066"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 17:10:41 -0700
X-CSE-ConnectionGUID: 0xXUXrV4S1KKceaWkGP17Q==
X-CSE-MsgGUID: Z7KTR13iTVaywn636P+r9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="138780190"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2025 17:10:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB0Sj-000569-1F;
	Sat, 03 May 2025 00:10:37 +0000
Date: Sat, 3 May 2025 08:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:sink 84/177] arch/x86/kvm/irq.c:217
 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented
Message-ID: <202505030824.dJrnpo76-lkp@intel.com>
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

tree:   https://github.com/sean-jc/linux sink
head:   b64923e38c20d35f52d3e78fe87993306d912851
commit: b9514325ecef9611e9f46e2fe968b035b60ac2af [84/177] KVM: x86: Fold irq_comm.c into irq.c
:::::: branch date: 7 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030824.dJrnpo76-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505030824.dJrnpo76-lkp@intel.com/

smatch warnings:
arch/x86/kvm/irq.c:217 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented
arch/x86/kvm/irq.c:412 kvm_intr_is_single_vcpu() warn: iterator 'i' not incremented

vim +/i +217 arch/x86/kvm/irq.c

b9514325ecef96 Sean Christopherson 2025-04-24  197  
b9514325ecef96 Sean Christopherson 2025-04-24  198  int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
b9514325ecef96 Sean Christopherson 2025-04-24  199  			     struct kvm_lapic_irq *irq, struct dest_map *dest_map)
b9514325ecef96 Sean Christopherson 2025-04-24  200  {
b9514325ecef96 Sean Christopherson 2025-04-24  201  	int r = -1;
b9514325ecef96 Sean Christopherson 2025-04-24  202  	struct kvm_vcpu *vcpu, *lowest = NULL;
b9514325ecef96 Sean Christopherson 2025-04-24  203  	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
b9514325ecef96 Sean Christopherson 2025-04-24  204  	unsigned int dest_vcpus = 0;
b9514325ecef96 Sean Christopherson 2025-04-24  205  
b9514325ecef96 Sean Christopherson 2025-04-24  206  	if (kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
b9514325ecef96 Sean Christopherson 2025-04-24  207  		return r;
b9514325ecef96 Sean Christopherson 2025-04-24  208  
b9514325ecef96 Sean Christopherson 2025-04-24  209  	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
b9514325ecef96 Sean Christopherson 2025-04-24  210  	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
b9514325ecef96 Sean Christopherson 2025-04-24  211  		pr_info("apic: phys broadcast and lowest prio\n");
b9514325ecef96 Sean Christopherson 2025-04-24  212  		irq->delivery_mode = APIC_DM_FIXED;
b9514325ecef96 Sean Christopherson 2025-04-24  213  	}
b9514325ecef96 Sean Christopherson 2025-04-24  214  
b9514325ecef96 Sean Christopherson 2025-04-24  215  	memset(dest_vcpu_bitmap, 0, sizeof(dest_vcpu_bitmap));
b9514325ecef96 Sean Christopherson 2025-04-24  216  
b9514325ecef96 Sean Christopherson 2025-04-24 @217  	kvm_for_each_vcpu(i, vcpu, kvm) {
b9514325ecef96 Sean Christopherson 2025-04-24  218  		if (!kvm_apic_present(vcpu))
b9514325ecef96 Sean Christopherson 2025-04-24  219  			continue;
b9514325ecef96 Sean Christopherson 2025-04-24  220  
b9514325ecef96 Sean Christopherson 2025-04-24  221  		if (!kvm_apic_match_dest(vcpu, src, irq->shorthand,
b9514325ecef96 Sean Christopherson 2025-04-24  222  					irq->dest_id, irq->dest_mode))
b9514325ecef96 Sean Christopherson 2025-04-24  223  			continue;
b9514325ecef96 Sean Christopherson 2025-04-24  224  
b9514325ecef96 Sean Christopherson 2025-04-24  225  		if (!kvm_lowest_prio_delivery(irq)) {
b9514325ecef96 Sean Christopherson 2025-04-24  226  			if (r < 0)
b9514325ecef96 Sean Christopherson 2025-04-24  227  				r = 0;
b9514325ecef96 Sean Christopherson 2025-04-24  228  			r += kvm_apic_set_irq(vcpu, irq, dest_map);
b9514325ecef96 Sean Christopherson 2025-04-24  229  		} else if (kvm_apic_sw_enabled(vcpu->arch.apic)) {
b9514325ecef96 Sean Christopherson 2025-04-24  230  			if (!kvm_vector_hashing_enabled()) {
b9514325ecef96 Sean Christopherson 2025-04-24  231  				if (!lowest)
b9514325ecef96 Sean Christopherson 2025-04-24  232  					lowest = vcpu;
b9514325ecef96 Sean Christopherson 2025-04-24  233  				else if (kvm_apic_compare_prio(vcpu, lowest) < 0)
b9514325ecef96 Sean Christopherson 2025-04-24  234  					lowest = vcpu;
b9514325ecef96 Sean Christopherson 2025-04-24  235  			} else {
b9514325ecef96 Sean Christopherson 2025-04-24  236  				__set_bit(i, dest_vcpu_bitmap);
b9514325ecef96 Sean Christopherson 2025-04-24  237  				dest_vcpus++;
b9514325ecef96 Sean Christopherson 2025-04-24  238  			}
b9514325ecef96 Sean Christopherson 2025-04-24  239  		}
b9514325ecef96 Sean Christopherson 2025-04-24  240  	}
b9514325ecef96 Sean Christopherson 2025-04-24  241  
b9514325ecef96 Sean Christopherson 2025-04-24  242  	if (dest_vcpus != 0) {
b9514325ecef96 Sean Christopherson 2025-04-24  243  		int idx = kvm_vector_to_index(irq->vector, dest_vcpus,
b9514325ecef96 Sean Christopherson 2025-04-24  244  					dest_vcpu_bitmap, KVM_MAX_VCPUS);
b9514325ecef96 Sean Christopherson 2025-04-24  245  
b9514325ecef96 Sean Christopherson 2025-04-24  246  		lowest = kvm_get_vcpu(kvm, idx);
b9514325ecef96 Sean Christopherson 2025-04-24  247  	}
b9514325ecef96 Sean Christopherson 2025-04-24  248  
b9514325ecef96 Sean Christopherson 2025-04-24  249  	if (lowest)
b9514325ecef96 Sean Christopherson 2025-04-24  250  		r = kvm_apic_set_irq(lowest, irq, dest_map);
b9514325ecef96 Sean Christopherson 2025-04-24  251  
b9514325ecef96 Sean Christopherson 2025-04-24  252  	return r;
b9514325ecef96 Sean Christopherson 2025-04-24  253  }
b9514325ecef96 Sean Christopherson 2025-04-24  254  
b9514325ecef96 Sean Christopherson 2025-04-24  255  void kvm_set_msi_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
b9514325ecef96 Sean Christopherson 2025-04-24  256  		     struct kvm_lapic_irq *irq)
b9514325ecef96 Sean Christopherson 2025-04-24  257  {
b9514325ecef96 Sean Christopherson 2025-04-24  258  	struct msi_msg msg = { .address_lo = e->msi.address_lo,
b9514325ecef96 Sean Christopherson 2025-04-24  259  			       .address_hi = e->msi.address_hi,
b9514325ecef96 Sean Christopherson 2025-04-24  260  			       .data = e->msi.data };
b9514325ecef96 Sean Christopherson 2025-04-24  261  
b9514325ecef96 Sean Christopherson 2025-04-24  262  	trace_kvm_msi_set_irq(msg.address_lo | (kvm->arch.x2apic_format ?
b9514325ecef96 Sean Christopherson 2025-04-24  263  			      (u64)msg.address_hi << 32 : 0), msg.data);
b9514325ecef96 Sean Christopherson 2025-04-24  264  
b9514325ecef96 Sean Christopherson 2025-04-24  265  	irq->dest_id = x86_msi_msg_get_destid(&msg, kvm->arch.x2apic_format);
b9514325ecef96 Sean Christopherson 2025-04-24  266  	irq->vector = msg.arch_data.vector;
b9514325ecef96 Sean Christopherson 2025-04-24  267  	irq->dest_mode = kvm_lapic_irq_dest_mode(msg.arch_addr_lo.dest_mode_logical);
b9514325ecef96 Sean Christopherson 2025-04-24  268  	irq->trig_mode = msg.arch_data.is_level;
b9514325ecef96 Sean Christopherson 2025-04-24  269  	irq->delivery_mode = msg.arch_data.delivery_mode << 8;
b9514325ecef96 Sean Christopherson 2025-04-24  270  	irq->msi_redir_hint = msg.arch_addr_lo.redirect_hint;
b9514325ecef96 Sean Christopherson 2025-04-24  271  	irq->level = 1;
b9514325ecef96 Sean Christopherson 2025-04-24  272  	irq->shorthand = APIC_DEST_NOSHORT;
b9514325ecef96 Sean Christopherson 2025-04-24  273  }
b9514325ecef96 Sean Christopherson 2025-04-24  274  EXPORT_SYMBOL_GPL(kvm_set_msi_irq);
b9514325ecef96 Sean Christopherson 2025-04-24  275  
b9514325ecef96 Sean Christopherson 2025-04-24  276  static inline bool kvm_msi_route_invalid(struct kvm *kvm,
b9514325ecef96 Sean Christopherson 2025-04-24  277  		struct kvm_kernel_irq_routing_entry *e)
b9514325ecef96 Sean Christopherson 2025-04-24  278  {
b9514325ecef96 Sean Christopherson 2025-04-24  279  	return kvm->arch.x2apic_format && (e->msi.address_hi & 0xff);
b9514325ecef96 Sean Christopherson 2025-04-24  280  }
b9514325ecef96 Sean Christopherson 2025-04-24  281  
b9514325ecef96 Sean Christopherson 2025-04-24  282  int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
b9514325ecef96 Sean Christopherson 2025-04-24  283  		struct kvm *kvm, int irq_source_id, int level, bool line_status)
b9514325ecef96 Sean Christopherson 2025-04-24  284  {
b9514325ecef96 Sean Christopherson 2025-04-24  285  	struct kvm_lapic_irq irq;
b9514325ecef96 Sean Christopherson 2025-04-24  286  
b9514325ecef96 Sean Christopherson 2025-04-24  287  	if (kvm_msi_route_invalid(kvm, e))
b9514325ecef96 Sean Christopherson 2025-04-24  288  		return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  289  
b9514325ecef96 Sean Christopherson 2025-04-24  290  	if (!level)
b9514325ecef96 Sean Christopherson 2025-04-24  291  		return -1;
b9514325ecef96 Sean Christopherson 2025-04-24  292  
b9514325ecef96 Sean Christopherson 2025-04-24  293  	kvm_set_msi_irq(kvm, e, &irq);
b9514325ecef96 Sean Christopherson 2025-04-24  294  
b9514325ecef96 Sean Christopherson 2025-04-24  295  	return kvm_irq_delivery_to_apic(kvm, NULL, &irq, NULL);
b9514325ecef96 Sean Christopherson 2025-04-24  296  }
b9514325ecef96 Sean Christopherson 2025-04-24  297  
b9514325ecef96 Sean Christopherson 2025-04-24  298  int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
b9514325ecef96 Sean Christopherson 2025-04-24  299  			      struct kvm *kvm, int irq_source_id, int level,
b9514325ecef96 Sean Christopherson 2025-04-24  300  			      bool line_status)
b9514325ecef96 Sean Christopherson 2025-04-24  301  {
b9514325ecef96 Sean Christopherson 2025-04-24  302  	struct kvm_lapic_irq irq;
b9514325ecef96 Sean Christopherson 2025-04-24  303  	int r;
b9514325ecef96 Sean Christopherson 2025-04-24  304  
b9514325ecef96 Sean Christopherson 2025-04-24  305  	switch (e->type) {
b9514325ecef96 Sean Christopherson 2025-04-24  306  #ifdef CONFIG_KVM_HYPERV
b9514325ecef96 Sean Christopherson 2025-04-24  307  	case KVM_IRQ_ROUTING_HV_SINT:
b9514325ecef96 Sean Christopherson 2025-04-24  308  		return kvm_hv_set_sint(e, kvm, irq_source_id, level,
b9514325ecef96 Sean Christopherson 2025-04-24  309  				       line_status);
b9514325ecef96 Sean Christopherson 2025-04-24  310  #endif
b9514325ecef96 Sean Christopherson 2025-04-24  311  
b9514325ecef96 Sean Christopherson 2025-04-24  312  	case KVM_IRQ_ROUTING_MSI:
b9514325ecef96 Sean Christopherson 2025-04-24  313  		if (kvm_msi_route_invalid(kvm, e))
b9514325ecef96 Sean Christopherson 2025-04-24  314  			return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  315  
b9514325ecef96 Sean Christopherson 2025-04-24  316  		kvm_set_msi_irq(kvm, e, &irq);
b9514325ecef96 Sean Christopherson 2025-04-24  317  
b9514325ecef96 Sean Christopherson 2025-04-24  318  		if (kvm_irq_delivery_to_apic_fast(kvm, NULL, &irq, &r, NULL))
b9514325ecef96 Sean Christopherson 2025-04-24  319  			return r;
b9514325ecef96 Sean Christopherson 2025-04-24  320  		break;
b9514325ecef96 Sean Christopherson 2025-04-24  321  
b9514325ecef96 Sean Christopherson 2025-04-24  322  #ifdef CONFIG_KVM_XEN
b9514325ecef96 Sean Christopherson 2025-04-24  323  	case KVM_IRQ_ROUTING_XEN_EVTCHN:
b9514325ecef96 Sean Christopherson 2025-04-24  324  		if (!level)
b9514325ecef96 Sean Christopherson 2025-04-24  325  			return -1;
b9514325ecef96 Sean Christopherson 2025-04-24  326  
b9514325ecef96 Sean Christopherson 2025-04-24  327  		return kvm_xen_set_evtchn_fast(&e->xen_evtchn, kvm);
b9514325ecef96 Sean Christopherson 2025-04-24  328  #endif
b9514325ecef96 Sean Christopherson 2025-04-24  329  	default:
b9514325ecef96 Sean Christopherson 2025-04-24  330  		break;
b9514325ecef96 Sean Christopherson 2025-04-24  331  	}
b9514325ecef96 Sean Christopherson 2025-04-24  332  
b9514325ecef96 Sean Christopherson 2025-04-24  333  	return -EWOULDBLOCK;
b9514325ecef96 Sean Christopherson 2025-04-24  334  }
b9514325ecef96 Sean Christopherson 2025-04-24  335  
b9514325ecef96 Sean Christopherson 2025-04-24  336  bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
b9514325ecef96 Sean Christopherson 2025-04-24  337  {
b9514325ecef96 Sean Christopherson 2025-04-24  338  	return irqchip_in_kernel(kvm);
b9514325ecef96 Sean Christopherson 2025-04-24  339  }
b9514325ecef96 Sean Christopherson 2025-04-24  340  
b9514325ecef96 Sean Christopherson 2025-04-24  341  int kvm_set_routing_entry(struct kvm *kvm,
b9514325ecef96 Sean Christopherson 2025-04-24  342  			  struct kvm_kernel_irq_routing_entry *e,
b9514325ecef96 Sean Christopherson 2025-04-24  343  			  const struct kvm_irq_routing_entry *ue)
b9514325ecef96 Sean Christopherson 2025-04-24  344  {
b9514325ecef96 Sean Christopherson 2025-04-24  345  	/* We can't check irqchip_in_kernel() here as some callers are
b9514325ecef96 Sean Christopherson 2025-04-24  346  	 * currently initializing the irqchip. Other callers should therefore
b9514325ecef96 Sean Christopherson 2025-04-24  347  	 * check kvm_arch_can_set_irq_routing() before calling this function.
b9514325ecef96 Sean Christopherson 2025-04-24  348  	 */
b9514325ecef96 Sean Christopherson 2025-04-24  349  	switch (ue->type) {
b9514325ecef96 Sean Christopherson 2025-04-24  350  #ifdef CONFIG_KVM_IOAPIC
b9514325ecef96 Sean Christopherson 2025-04-24  351  	case KVM_IRQ_ROUTING_IRQCHIP:
b9514325ecef96 Sean Christopherson 2025-04-24  352  		if (irqchip_split(kvm))
b9514325ecef96 Sean Christopherson 2025-04-24  353  			return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  354  		e->irqchip.pin = ue->u.irqchip.pin;
b9514325ecef96 Sean Christopherson 2025-04-24  355  		switch (ue->u.irqchip.irqchip) {
b9514325ecef96 Sean Christopherson 2025-04-24  356  		case KVM_IRQCHIP_PIC_SLAVE:
b9514325ecef96 Sean Christopherson 2025-04-24  357  			e->irqchip.pin += PIC_NUM_PINS / 2;
b9514325ecef96 Sean Christopherson 2025-04-24  358  			fallthrough;
b9514325ecef96 Sean Christopherson 2025-04-24  359  		case KVM_IRQCHIP_PIC_MASTER:
b9514325ecef96 Sean Christopherson 2025-04-24  360  			if (ue->u.irqchip.pin >= PIC_NUM_PINS / 2)
b9514325ecef96 Sean Christopherson 2025-04-24  361  				return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  362  			e->set = kvm_pic_set_irq;
b9514325ecef96 Sean Christopherson 2025-04-24  363  			break;
b9514325ecef96 Sean Christopherson 2025-04-24  364  		case KVM_IRQCHIP_IOAPIC:
b9514325ecef96 Sean Christopherson 2025-04-24  365  			if (ue->u.irqchip.pin >= KVM_IOAPIC_NUM_PINS)
b9514325ecef96 Sean Christopherson 2025-04-24  366  				return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  367  			e->set = kvm_ioapic_set_irq;
b9514325ecef96 Sean Christopherson 2025-04-24  368  			break;
b9514325ecef96 Sean Christopherson 2025-04-24  369  		default:
b9514325ecef96 Sean Christopherson 2025-04-24  370  			return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  371  		}
b9514325ecef96 Sean Christopherson 2025-04-24  372  		e->irqchip.irqchip = ue->u.irqchip.irqchip;
b9514325ecef96 Sean Christopherson 2025-04-24  373  		break;
b9514325ecef96 Sean Christopherson 2025-04-24  374  #endif
b9514325ecef96 Sean Christopherson 2025-04-24  375  	case KVM_IRQ_ROUTING_MSI:
b9514325ecef96 Sean Christopherson 2025-04-24  376  		e->set = kvm_set_msi;
b9514325ecef96 Sean Christopherson 2025-04-24  377  		e->msi.address_lo = ue->u.msi.address_lo;
b9514325ecef96 Sean Christopherson 2025-04-24  378  		e->msi.address_hi = ue->u.msi.address_hi;
b9514325ecef96 Sean Christopherson 2025-04-24  379  		e->msi.data = ue->u.msi.data;
b9514325ecef96 Sean Christopherson 2025-04-24  380  
b9514325ecef96 Sean Christopherson 2025-04-24  381  		if (kvm_msi_route_invalid(kvm, e))
b9514325ecef96 Sean Christopherson 2025-04-24  382  			return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  383  		break;
b9514325ecef96 Sean Christopherson 2025-04-24  384  #ifdef CONFIG_KVM_HYPERV
b9514325ecef96 Sean Christopherson 2025-04-24  385  	case KVM_IRQ_ROUTING_HV_SINT:
b9514325ecef96 Sean Christopherson 2025-04-24  386  		e->set = kvm_hv_set_sint;
b9514325ecef96 Sean Christopherson 2025-04-24  387  		e->hv_sint.vcpu = ue->u.hv_sint.vcpu;
b9514325ecef96 Sean Christopherson 2025-04-24  388  		e->hv_sint.sint = ue->u.hv_sint.sint;
b9514325ecef96 Sean Christopherson 2025-04-24  389  		break;
b9514325ecef96 Sean Christopherson 2025-04-24  390  #endif
b9514325ecef96 Sean Christopherson 2025-04-24  391  #ifdef CONFIG_KVM_XEN
b9514325ecef96 Sean Christopherson 2025-04-24  392  	case KVM_IRQ_ROUTING_XEN_EVTCHN:
b9514325ecef96 Sean Christopherson 2025-04-24  393  		return kvm_xen_setup_evtchn(kvm, e, ue);
b9514325ecef96 Sean Christopherson 2025-04-24  394  #endif
b9514325ecef96 Sean Christopherson 2025-04-24  395  	default:
b9514325ecef96 Sean Christopherson 2025-04-24  396  		return -EINVAL;
b9514325ecef96 Sean Christopherson 2025-04-24  397  	}
b9514325ecef96 Sean Christopherson 2025-04-24  398  
b9514325ecef96 Sean Christopherson 2025-04-24  399  	return 0;
b9514325ecef96 Sean Christopherson 2025-04-24  400  }
b9514325ecef96 Sean Christopherson 2025-04-24  401  
b9514325ecef96 Sean Christopherson 2025-04-24  402  bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
b9514325ecef96 Sean Christopherson 2025-04-24  403  			     struct kvm_vcpu **dest_vcpu)
b9514325ecef96 Sean Christopherson 2025-04-24  404  {
b9514325ecef96 Sean Christopherson 2025-04-24  405  	int r = 0;
b9514325ecef96 Sean Christopherson 2025-04-24  406  	unsigned long i;
b9514325ecef96 Sean Christopherson 2025-04-24  407  	struct kvm_vcpu *vcpu;
b9514325ecef96 Sean Christopherson 2025-04-24  408  
b9514325ecef96 Sean Christopherson 2025-04-24  409  	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
b9514325ecef96 Sean Christopherson 2025-04-24  410  		return true;
b9514325ecef96 Sean Christopherson 2025-04-24  411  
b9514325ecef96 Sean Christopherson 2025-04-24 @412  	kvm_for_each_vcpu(i, vcpu, kvm) {
b9514325ecef96 Sean Christopherson 2025-04-24  413  		if (!kvm_apic_present(vcpu))
b9514325ecef96 Sean Christopherson 2025-04-24  414  			continue;
b9514325ecef96 Sean Christopherson 2025-04-24  415  
b9514325ecef96 Sean Christopherson 2025-04-24  416  		if (!kvm_apic_match_dest(vcpu, NULL, irq->shorthand,
b9514325ecef96 Sean Christopherson 2025-04-24  417  					irq->dest_id, irq->dest_mode))
b9514325ecef96 Sean Christopherson 2025-04-24  418  			continue;
b9514325ecef96 Sean Christopherson 2025-04-24  419  
b9514325ecef96 Sean Christopherson 2025-04-24  420  		if (++r == 2)
b9514325ecef96 Sean Christopherson 2025-04-24  421  			return false;
b9514325ecef96 Sean Christopherson 2025-04-24  422  
b9514325ecef96 Sean Christopherson 2025-04-24  423  		*dest_vcpu = vcpu;
b9514325ecef96 Sean Christopherson 2025-04-24  424  	}
b9514325ecef96 Sean Christopherson 2025-04-24  425  
b9514325ecef96 Sean Christopherson 2025-04-24  426  	return r == 1;
b9514325ecef96 Sean Christopherson 2025-04-24  427  }
b9514325ecef96 Sean Christopherson 2025-04-24  428  EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
b9514325ecef96 Sean Christopherson 2025-04-24  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
