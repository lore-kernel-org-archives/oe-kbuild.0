Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB3330D32
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819035; cv=none; b=M4qoAVPC2VItYHsix6p36mnv4qQiMFm8CG/BkcJzFjxFOjVRMnti+yRozJegpPWuovwwPOAHoxOxHIsQwMXu/TzelEi1gG8Lz+n2o/yjLZvA10iKwWXx6+/1/IJgq2QnU/sBsVN9yeErFTVQtRY77YDPHIPMaEhE7ahcLc4qPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819035; c=relaxed/simple;
	bh=z0/o6zktMLoG5J5ccDMrICFnvJs9ekxLXYr5jLye1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HluZ9YEKmzR5Vi2MeGPXcTdtG52rIB5c3iMu0mfcs42MMqLZXUp/DZwLQ4DGpHO4DaE2/j8edXFyawX4JpsN5hTMJB/MDzJZ1CtGqFA6k9xD1ilsluUjJ63jER0gqN27UfU/4ODcEOBbq21UPv+APHdUoFUjCGrrZN8D6dLuCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvRREP8p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvRREP8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765819033; x=1797355033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0/o6zktMLoG5J5ccDMrICFnvJs9ekxLXYr5jLye1xE=;
  b=GvRREP8pQZXdunwS7VMRiFi5ol7TV8cJECi20xPjpl212M9eSuhV8UHk
   SgCYlw5Wxk10b+fC6L84QbNbnw4nzLp3qGmscbjOw1rRFIocJ2TD9+AxC
   W47TkXRS0EzkyJXRZ3ZrKR/q5Cjr0L42ryhDkQOYkViusgdZWsJubYCpJ
   MapZSUlithluvZusOLjj3xx30JFPY95ffbT64pnDCNQpTzWtJ+jFhP6Cj
   oBQxxg3Ccx1WfSG28cuP8Yxk+1D4X6HDn6TXU92aACeYyEucHFkW8siN/
   P8IjH67A9az+5/6dLXUYB4ISQo2+/+w/I02bGuCFxF/HHRB93hO2VJNca
   g==;
X-CSE-ConnectionGUID: cZThbUZxTw2aQrT7G4gMVQ==
X-CSE-MsgGUID: IWkA/WlxTI2Psvkc1Lgm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93202769"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="93202769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:17:12 -0800
X-CSE-ConnectionGUID: nPRtxxcHRsysFOy94RdvDw==
X-CSE-MsgGUID: nejEHTaTSUazmokko+ApIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="201953504"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 09:17:10 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVCC4-000000000X4-2ZpF;
	Mon, 15 Dec 2025 17:17:08 +0000
Date: Tue, 16 Dec 2025 01:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/lapic.c:1271 kvm_irq_delivery_to_apic() warn: iterator
 'i' not incremented
Message-ID: <202512160159.VZNnNXX0-lkp@intel.com>
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

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: cbf5d9457462c83c1bf851c0b8b04296b037a9dd KVM: x86: Move kvm_irq_delivery_to_apic() from irq.c to lapic.c
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160159.VZNnNXX0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160159.VZNnNXX0-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/lapic.c:1271 kvm_irq_delivery_to_apic() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/lapic.c:400 kvm_recalculate_apic_map() warn: iterator 'i' not incremented

vim +/i +1271 arch/x86/kvm/lapic.c

8feb4a04dc7560 Feng Wu             2015-09-18  1251  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1252  int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
cbf5d9457462c8 Sean Christopherson 2025-08-21  1253  			     struct kvm_lapic_irq *irq, struct dest_map *dest_map)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1254  {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1255  	int r = -1;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1256  	struct kvm_vcpu *vcpu, *lowest = NULL;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1257  	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
cbf5d9457462c8 Sean Christopherson 2025-08-21  1258  	unsigned int dest_vcpus = 0;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1259  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1260  	if (kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1261  		return r;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1262  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1263  	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
cbf5d9457462c8 Sean Christopherson 2025-08-21  1264  	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1265  		pr_info("apic: phys broadcast and lowest prio\n");
cbf5d9457462c8 Sean Christopherson 2025-08-21  1266  		irq->delivery_mode = APIC_DM_FIXED;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1267  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1268  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1269  	memset(dest_vcpu_bitmap, 0, sizeof(dest_vcpu_bitmap));
cbf5d9457462c8 Sean Christopherson 2025-08-21  1270  
cbf5d9457462c8 Sean Christopherson 2025-08-21 @1271  	kvm_for_each_vcpu(i, vcpu, kvm) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1272  		if (!kvm_apic_present(vcpu))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1273  			continue;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1274  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1275  		if (!kvm_apic_match_dest(vcpu, src, irq->shorthand,
cbf5d9457462c8 Sean Christopherson 2025-08-21  1276  					irq->dest_id, irq->dest_mode))
cbf5d9457462c8 Sean Christopherson 2025-08-21  1277  			continue;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1278  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1279  		if (!kvm_lowest_prio_delivery(irq)) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1280  			if (r < 0)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1281  				r = 0;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1282  			r += kvm_apic_set_irq(vcpu, irq, dest_map);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1283  		} else if (kvm_apic_sw_enabled(vcpu->arch.apic)) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1284  			if (!kvm_vector_hashing_enabled()) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1285  				if (!lowest)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1286  					lowest = vcpu;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1287  				else if (kvm_apic_compare_prio(vcpu, lowest) < 0)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1288  					lowest = vcpu;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1289  			} else {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1290  				__set_bit(i, dest_vcpu_bitmap);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1291  				dest_vcpus++;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1292  			}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1293  		}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1294  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1295  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1296  	if (dest_vcpus != 0) {
cbf5d9457462c8 Sean Christopherson 2025-08-21  1297  		int idx = kvm_vector_to_index(irq->vector, dest_vcpus,
cbf5d9457462c8 Sean Christopherson 2025-08-21  1298  					dest_vcpu_bitmap, KVM_MAX_VCPUS);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1299  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1300  		lowest = kvm_get_vcpu(kvm, idx);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1301  	}
cbf5d9457462c8 Sean Christopherson 2025-08-21  1302  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1303  	if (lowest)
cbf5d9457462c8 Sean Christopherson 2025-08-21  1304  		r = kvm_apic_set_irq(lowest, irq, dest_map);
cbf5d9457462c8 Sean Christopherson 2025-08-21  1305  
cbf5d9457462c8 Sean Christopherson 2025-08-21  1306  	return r;
cbf5d9457462c8 Sean Christopherson 2025-08-21  1307  }
cbf5d9457462c8 Sean Christopherson 2025-08-21  1308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
