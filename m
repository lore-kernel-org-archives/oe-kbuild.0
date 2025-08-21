Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1AB36CE02
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755739050; cv=none; b=ArdxRs0LVVYxf2R6GA7+C/bkJ1p86B+YkswANdtB5QBgEYj2+BCCLA9MA82oJxggrJPCCjWrFGGjIHaOyc/gzLEQlOCvOA6p9W3KP8ZVHXggeUAO7SCwlnytwcGXZDAJRiTigR2VkTpSDseuTCY463lNVFmT5OrP9XJUfzn/fVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755739050; c=relaxed/simple;
	bh=dmF0WUxST42Kok9fT7a4pJImSFBNk97nJof305lbl30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLZE6dLXClqX2uabFJzBYdRTc7KmbsYWN8meV/roKZYDHVos3ydXK538NmC/1WxJjoZZJ0xu97sNsc5SHA/NzIx1drh8+6KsSoQyPFHNoTTXatcJAEBmHdfo5oo2GR/rxjuxV7BEopQLZKhm7pLL8JlWgMvdzZnPXTyubKZOLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBKUYXUj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBKUYXUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755739048; x=1787275048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmF0WUxST42Kok9fT7a4pJImSFBNk97nJof305lbl30=;
  b=jBKUYXUjAvqdsjgaaRj3LZRk+kpqO82i+4yZv4CHR2T/kCXZDBW36fZa
   3U22/EnZ/QVSXXu5Ckpovr0zSNC4KwB9w/xNsFZtZ4xYGh5xcA6+XaDtv
   DgdQghADhM1UiOMfE9g6i20iNKdGTBxIaW6xkYmbeGtBdsJAk5st763/+
   QVn6afADbrbSfMOIw5HQ4AiwzqwaFZ4/0qiZaqkC0hbZCcvpneOEZONEQ
   DjXVovf+h+EutOLsb7e6C8FHJ6kISgqGlUKH+MmuvTUTJEQJ0ppT/KmUH
   Z+3AtA3nDoBvRdHWH5972pLdsV1XTrLxz7SruPhmrwMwlRqZMUMCJ/Sw/
   Q==;
X-CSE-ConnectionGUID: ngyukmQTREGLiXZ7WWzcnw==
X-CSE-MsgGUID: LnhZ5+YQTcGYgX1CaWdQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75602187"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75602187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 18:17:27 -0700
X-CSE-ConnectionGUID: K96s8dMmQIalqiPoF1ipaw==
X-CSE-MsgGUID: QACx7fodSB2g5BeXYcXR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168687209"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2025 18:17:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uotvT-000Jo7-1y;
	Thu, 21 Aug 2025 01:17:16 +0000
Date: Thu, 21 Aug 2025 09:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/vector_hashing_nth_bit 2/4] arch/x86/kvm/lapic.c:1273
 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented
Message-ID: <202508210930.jMn8LGLn-lkp@intel.com>
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

tree:   https://github.com/sean-jc/linux x86/vector_hashing_nth_bit
head:   645ae3c0b60fb02f08528b78adc5608cc0126b43
commit: b174bea7113a0b18e1254ce2aa9ae0bdcd1e336a [2/4] KVM: x86: Move kvm_irq_delivery_to_apic() from irq.c to lapic.c
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20250821 (https://download.01.org/0day-ci/archive/20250821/202508210930.jMn8LGLn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508210930.jMn8LGLn-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/lapic.c:1273 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/lapic.c:400 kvm_recalculate_apic_map() warn: iterator 'i' not incremented

vim +/i +1273 arch/x86/kvm/lapic.c

8feb4a04dc7560 Feng Wu             2015-09-18  1253  
b174bea7113a0b Sean Christopherson 2025-08-18  1254  int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
b174bea7113a0b Sean Christopherson 2025-08-18  1255  			     struct kvm_lapic_irq *irq, struct dest_map *dest_map)
b174bea7113a0b Sean Christopherson 2025-08-18  1256  {
b174bea7113a0b Sean Christopherson 2025-08-18  1257  	int r = -1;
b174bea7113a0b Sean Christopherson 2025-08-18  1258  	struct kvm_vcpu *vcpu, *lowest = NULL;
b174bea7113a0b Sean Christopherson 2025-08-18  1259  	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
b174bea7113a0b Sean Christopherson 2025-08-18  1260  	unsigned int dest_vcpus = 0;
b174bea7113a0b Sean Christopherson 2025-08-18  1261  
b174bea7113a0b Sean Christopherson 2025-08-18  1262  	if (kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
b174bea7113a0b Sean Christopherson 2025-08-18  1263  		return r;
b174bea7113a0b Sean Christopherson 2025-08-18  1264  
b174bea7113a0b Sean Christopherson 2025-08-18  1265  	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
b174bea7113a0b Sean Christopherson 2025-08-18  1266  	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
b174bea7113a0b Sean Christopherson 2025-08-18  1267  		pr_info("apic: phys broadcast and lowest prio\n");
b174bea7113a0b Sean Christopherson 2025-08-18  1268  		irq->delivery_mode = APIC_DM_FIXED;
b174bea7113a0b Sean Christopherson 2025-08-18  1269  	}
b174bea7113a0b Sean Christopherson 2025-08-18  1270  
b174bea7113a0b Sean Christopherson 2025-08-18  1271  	memset(dest_vcpu_bitmap, 0, sizeof(dest_vcpu_bitmap));
b174bea7113a0b Sean Christopherson 2025-08-18  1272  
b174bea7113a0b Sean Christopherson 2025-08-18 @1273  	kvm_for_each_vcpu(i, vcpu, kvm) {
b174bea7113a0b Sean Christopherson 2025-08-18  1274  		if (!kvm_apic_present(vcpu))
b174bea7113a0b Sean Christopherson 2025-08-18  1275  			continue;
b174bea7113a0b Sean Christopherson 2025-08-18  1276  
b174bea7113a0b Sean Christopherson 2025-08-18  1277  		if (!kvm_apic_match_dest(vcpu, src, irq->shorthand,
b174bea7113a0b Sean Christopherson 2025-08-18  1278  					irq->dest_id, irq->dest_mode))
b174bea7113a0b Sean Christopherson 2025-08-18  1279  			continue;
b174bea7113a0b Sean Christopherson 2025-08-18  1280  
b174bea7113a0b Sean Christopherson 2025-08-18  1281  		if (!kvm_lowest_prio_delivery(irq)) {
b174bea7113a0b Sean Christopherson 2025-08-18  1282  			if (r < 0)
b174bea7113a0b Sean Christopherson 2025-08-18  1283  				r = 0;
b174bea7113a0b Sean Christopherson 2025-08-18  1284  			r += kvm_apic_set_irq(vcpu, irq, dest_map);
b174bea7113a0b Sean Christopherson 2025-08-18  1285  		} else if (kvm_apic_sw_enabled(vcpu->arch.apic)) {
b174bea7113a0b Sean Christopherson 2025-08-18  1286  			if (!kvm_vector_hashing_enabled()) {
b174bea7113a0b Sean Christopherson 2025-08-18  1287  				if (!lowest)
b174bea7113a0b Sean Christopherson 2025-08-18  1288  					lowest = vcpu;
b174bea7113a0b Sean Christopherson 2025-08-18  1289  				else if (kvm_apic_compare_prio(vcpu, lowest) < 0)
b174bea7113a0b Sean Christopherson 2025-08-18  1290  					lowest = vcpu;
b174bea7113a0b Sean Christopherson 2025-08-18  1291  			} else {
b174bea7113a0b Sean Christopherson 2025-08-18  1292  				__set_bit(i, dest_vcpu_bitmap);
b174bea7113a0b Sean Christopherson 2025-08-18  1293  				dest_vcpus++;
b174bea7113a0b Sean Christopherson 2025-08-18  1294  			}
b174bea7113a0b Sean Christopherson 2025-08-18  1295  		}
b174bea7113a0b Sean Christopherson 2025-08-18  1296  	}
b174bea7113a0b Sean Christopherson 2025-08-18  1297  
b174bea7113a0b Sean Christopherson 2025-08-18  1298  	if (dest_vcpus != 0) {
b174bea7113a0b Sean Christopherson 2025-08-18  1299  		int idx = kvm_vector_to_index(irq->vector, dest_vcpus,
b174bea7113a0b Sean Christopherson 2025-08-18  1300  					dest_vcpu_bitmap, KVM_MAX_VCPUS);
b174bea7113a0b Sean Christopherson 2025-08-18  1301  
b174bea7113a0b Sean Christopherson 2025-08-18  1302  		lowest = kvm_get_vcpu(kvm, idx);
b174bea7113a0b Sean Christopherson 2025-08-18  1303  	}
b174bea7113a0b Sean Christopherson 2025-08-18  1304  
b174bea7113a0b Sean Christopherson 2025-08-18  1305  	if (lowest)
b174bea7113a0b Sean Christopherson 2025-08-18  1306  		r = kvm_apic_set_irq(lowest, irq, dest_map);
b174bea7113a0b Sean Christopherson 2025-08-18  1307  
b174bea7113a0b Sean Christopherson 2025-08-18  1308  	return r;
b174bea7113a0b Sean Christopherson 2025-08-18  1309  }
b174bea7113a0b Sean Christopherson 2025-08-18  1310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
