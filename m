Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F528BEC
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687178; cv=none; b=W3od4MDJu6f+qwf/a+AtFe7n7tqoWigLZMSMmIPQ6KBZMBYfSY1Rf413MTWRxLt3B0v9xVJcnHkxrWYDxLkLIIDytd/j4FNvjpIiLaKE0N9yIPoeur+++ULtje1gqEznrxhWiY6Pn0YylhPIL5/zZdXoGH4SVBaddC75n1Garak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687178; c=relaxed/simple;
	bh=rPJg73iVP5N228E7+V4ADIWP+i28ybD9Yu23qBA0et4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fejrzHhhCjORXiM71kSD+kB2YgGeMRI+KZLP9+MZIct+tQLZ0ZjXSZEeS3W+1i3wA2OWKtzI6vQPr4jgDgGG81Eu97PHZziDm2XlP/69Wm9qv/cBUIU10V91+qhbjY9kbwQAAP8wotvhb9rtSX7pFPWdxh3YLG5yVP88OieRvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Asnw+6a/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Asnw+6a/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740687176; x=1772223176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPJg73iVP5N228E7+V4ADIWP+i28ybD9Yu23qBA0et4=;
  b=Asnw+6a//i7QCBJjKmg9H3y8kG9Q2rAwtJLa5ToiB7VemDe7+JYsapXJ
   uhpTMfrsfYcrehor6PfCDPK/8NjVh090Pcn5KaJVVOSkq6KlIR7+LMUJ2
   g5EFNWegmfQypI2gF509cpObtRvQY1HJtBCKu/Q9XforBaPgBtBC0VCWK
   EkQ9swqBjHnOgk0/kbSMNrUlV8JRVblsXl+I+PpfRLvSpiEldCtLMiTzg
   jRoarzQH7ABhYyh1uiaOpkvYd3YvweEjGVP39v9gSxXsSihl2eI5NKx3e
   3JDyUOL3lPvst4+Z/fWchykP6q62ezo9zcPUemGXYQuD94RGfRu+ZKzLG
   w==;
X-CSE-ConnectionGUID: PpTmOu+lSkCrXayYgAZgHA==
X-CSE-MsgGUID: aDqYwx6nQ4W/QYZlGmNlIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45514977"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45514977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 12:12:55 -0800
X-CSE-ConnectionGUID: aJNLPy7dQHSPoE2g5Kt1yQ==
X-CSE-MsgGUID: z7lq4B77RKqU6bf22DVc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116896773"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 12:12:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnkFX-000DzK-28;
	Thu, 27 Feb 2025 20:12:51 +0000
Date: Fri, 28 Feb 2025 04:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH Resend] KVM: x86: ioapic: Optimize EOI handling to reduce
 unnecessary VM exits
Message-ID: <202502280432.Vb50hqIE-lkp@intel.com>
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
In-Reply-To: <20250225064253.309334-1-zijie.wei@linux.alibaba.com>
References: <20250225064253.309334-1-zijie.wei@linux.alibaba.com>
TO: weizijie <zijie.wei@linux.alibaba.com>
TO: Sean Christopherson <seanjc@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: x86@kernel.org
TO: "H . Peter Anvin" <hpa@zytor.com>
TO: kvm@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: weizijie <zijie.wei@linux.alibaba.com>
CC: xuyun <xuyun_xy.xy@linux.alibaba.com>

Hi weizijie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next linus/master v6.14-rc4 next-20250227]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/weizijie/KVM-x86-ioapic-Optimize-EOI-handling-to-reduce-unnecessary-VM-exits/20250225-144620
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250225064253.309334-1-zijie.wei%40linux.alibaba.com
patch subject: [PATCH Resend] KVM: x86: ioapic: Optimize EOI handling to reduce unnecessary VM exits
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-104-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280432.Vb50hqIE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502280432.Vb50hqIE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/ioapic.c:306:54-55: WARNING opportunity for max()
--
>> arch/x86/kvm/irq_comm.c:433:48-49: WARNING opportunity for max()

vim +306 arch/x86/kvm/ioapic.c

673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini   2014-03-18  276  
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini   2014-03-18  277  
6308630bd3dbb6 arch/x86/kvm/ioapic.c Andrey Smetanin 2015-11-10  278  void kvm_ioapic_scan_entry(struct kvm_vcpu *vcpu, ulong *ioapic_handled_vectors)
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  279  {
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  280  	struct kvm_ioapic *ioapic = vcpu->kvm->arch.vioapic;
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  281  	struct dest_map *dest_map = &ioapic->rtc_status.dest_map;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  282  	union kvm_ioapic_redirect_entry *e;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  283  	int index;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  284  
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  285  	spin_lock(&ioapic->lock);
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  286  
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  287  	/* Make sure we see any missing RTC EOI */
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  288  	if (test_bit(vcpu->vcpu_id, dest_map->map))
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  289  		__set_bit(dest_map->vectors[vcpu->vcpu_id],
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  290  			  ioapic_handled_vectors);
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel    2016-02-29  291  
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  292  	for (index = 0; index < IOAPIC_NUM_PINS; index++) {
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  293  		e = &ioapic->redirtbl[index];
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini   2014-07-30  294  		if (e->fields.trig_mode == IOAPIC_LEVEL_TRIG ||
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini   2014-07-30  295  		    kvm_irq_has_notifier(ioapic->kvm, KVM_IRQCHIP_IOAPIC, index) ||
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini   2014-07-30  296  		    index == RTC_GSI) {
5c69d5c113f15a arch/x86/kvm/ioapic.c Peter Xu        2019-12-04  297  			u16 dm = kvm_lapic_irq_dest_mode(!!e->fields.dest_mode);
5c69d5c113f15a arch/x86/kvm/ioapic.c Peter Xu        2019-12-04  298  
5c69d5c113f15a arch/x86/kvm/ioapic.c Peter Xu        2019-12-04  299  			if (kvm_apic_match_dest(vcpu, NULL, APIC_DEST_NOSHORT,
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  300  						e->fields.dest_id, dm))
cf9e65b773394c virt/kvm/ioapic.c     Yang Zhang      2013-04-11  301  				__set_bit(e->fields.vector,
6308630bd3dbb6 arch/x86/kvm/ioapic.c Andrey Smetanin 2015-11-10  302  					  ioapic_handled_vectors);
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  303  			else if (kvm_apic_pending_eoi(vcpu, e->fields.vector)) {
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  304  				__set_bit(e->fields.vector,
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  305  					  ioapic_handled_vectors);
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25 @306  				vcpu->arch.last_pending_vector = e->fields.vector >
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  307  					vcpu->arch.last_pending_vector ? e->fields.vector :
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  308  					vcpu->arch.last_pending_vector;
46ef9a892a9542 arch/x86/kvm/ioapic.c weizijie        2025-02-25  309  			}
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  310  		}
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  311  	}
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  312  	spin_unlock(&ioapic->lock);
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  313  }
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang      2013-01-25  314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
