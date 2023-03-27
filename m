Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045C63B6
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 17:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679938291; x=1711474291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Yjq7vcL6SUnsTEsFx+2gx0158/Rey3JlzPHZWnBTfw=;
  b=YINMDSxLriQ//VWBUheSg+ZyESAKifvmbxmWvw5HucoED8J23wv1coFs
   CD//AsL2V5khiy5ydWLRG03cUxEgHVVndFYcj250OajSB5+51f+cV8KJ2
   dvMwE6YhdtSypQylJPfmzeM6FEOrNPWPOVTanzQraKJQcAatgvV9VHWqa
   VJjBaytCZqtz8UPNTtX41XnzC7iBq0CBH/rkiNDxAjbZ2zx0bVYGV9sNa
   VSe2gdHMICAVg+AS+lMAd0gJ+LitavE93E4B4w1PLrzz1uARd2cX6jJR6
   BrCUehIcHzJlHKaxBEx1OjxrYvAWCwgWvpw+QspFimwiktu+kQM2g9M+h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339057261"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="339057261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 10:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="686053696"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="686053696"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 10:31:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgqgh-000HsD-2M;
	Mon, 27 Mar 2023 17:31:19 +0000
Date: Tue, 28 Mar 2023 01:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:alexghiti_test 51/78] arch/riscv/kvm/aia_aplic.c:303
 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'inject'.
Message-ID: <202303280121.pelkT1tG-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: c9c4cf36341f2f48f84a8db75d1908a21d130de2 [51/78] RISC-V: KVM: Add in-kernel emulation of AIA APLIC
:::::: branch date: 4 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280121.pelkT1tG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303280121.pelkT1tG-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_aplic.c:303 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'inject'.
arch/riscv/kvm/aia_aplic.c:304 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'target'.

vim +/inject +303 arch/riscv/kvm/aia_aplic.c

c9c4cf36341f2f Anup Patel 2022-01-19  248  
c9c4cf36341f2f Anup Patel 2022-01-19  249  int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level)
c9c4cf36341f2f Anup Patel 2022-01-19  250  {
c9c4cf36341f2f Anup Patel 2022-01-19  251  	u32 target;
c9c4cf36341f2f Anup Patel 2022-01-19  252  	bool inject, ie;
c9c4cf36341f2f Anup Patel 2022-01-19  253  	unsigned long flags;
c9c4cf36341f2f Anup Patel 2022-01-19  254  	struct aplic_irq *irqd;
c9c4cf36341f2f Anup Patel 2022-01-19  255  	struct aplic *aplic = kvm->arch.aia.aplic_state;
c9c4cf36341f2f Anup Patel 2022-01-19  256  
c9c4cf36341f2f Anup Patel 2022-01-19  257  	if (!aplic || !source || (aplic->nr_irqs <= source))
c9c4cf36341f2f Anup Patel 2022-01-19  258  		return -ENODEV;
c9c4cf36341f2f Anup Patel 2022-01-19  259  	irqd = &aplic->irqs[source];
c9c4cf36341f2f Anup Patel 2022-01-19  260  	ie = (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;
c9c4cf36341f2f Anup Patel 2022-01-19  261  
c9c4cf36341f2f Anup Patel 2022-01-19  262  	raw_spin_lock_irqsave(&irqd->lock, flags);
c9c4cf36341f2f Anup Patel 2022-01-19  263  
c9c4cf36341f2f Anup Patel 2022-01-19  264  	if (irqd->sourcecfg & APLIC_SOURCECFG_D)
c9c4cf36341f2f Anup Patel 2022-01-19  265  		goto skip_unlock;
c9c4cf36341f2f Anup Patel 2022-01-19  266  
c9c4cf36341f2f Anup Patel 2022-01-19  267  	switch (irqd->sourcecfg & APLIC_SOURCECFG_SM_MASK) {
c9c4cf36341f2f Anup Patel 2022-01-19  268  	case APLIC_SOURCECFG_SM_EDGE_RISE:
c9c4cf36341f2f Anup Patel 2022-01-19  269  		if (level && !(irqd->state & APLIC_IRQ_STATE_INPUT) &&
c9c4cf36341f2f Anup Patel 2022-01-19  270  		    !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  271  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  272  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  273  	case APLIC_SOURCECFG_SM_EDGE_FALL:
c9c4cf36341f2f Anup Patel 2022-01-19  274  		if (!level && (irqd->state & APLIC_IRQ_STATE_INPUT) &&
c9c4cf36341f2f Anup Patel 2022-01-19  275  		    !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  276  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  277  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  278  	case APLIC_SOURCECFG_SM_LEVEL_HIGH:
c9c4cf36341f2f Anup Patel 2022-01-19  279  		if (level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  280  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  281  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  282  	case APLIC_SOURCECFG_SM_LEVEL_LOW:
c9c4cf36341f2f Anup Patel 2022-01-19  283  		if (!level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  284  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  285  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  286  	}
c9c4cf36341f2f Anup Patel 2022-01-19  287  
c9c4cf36341f2f Anup Patel 2022-01-19  288  	if (level)
c9c4cf36341f2f Anup Patel 2022-01-19  289  		irqd->state |= APLIC_IRQ_STATE_INPUT;
c9c4cf36341f2f Anup Patel 2022-01-19  290  	else
c9c4cf36341f2f Anup Patel 2022-01-19  291  		irqd->state &= ~APLIC_IRQ_STATE_INPUT;
c9c4cf36341f2f Anup Patel 2022-01-19  292  
c9c4cf36341f2f Anup Patel 2022-01-19  293  	inject = false;
c9c4cf36341f2f Anup Patel 2022-01-19  294  	target = irqd->target;
c9c4cf36341f2f Anup Patel 2022-01-19  295  	if (ie && (irqd->state & APLIC_IRQ_STATE_ENPEND)) {
c9c4cf36341f2f Anup Patel 2022-01-19  296  		irqd->state &= ~APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  297  		inject = true;
c9c4cf36341f2f Anup Patel 2022-01-19  298  	}
c9c4cf36341f2f Anup Patel 2022-01-19  299  
c9c4cf36341f2f Anup Patel 2022-01-19  300  skip_unlock:
c9c4cf36341f2f Anup Patel 2022-01-19  301  	raw_spin_unlock_irqrestore(&irqd->lock, flags);
c9c4cf36341f2f Anup Patel 2022-01-19  302  
c9c4cf36341f2f Anup Patel 2022-01-19 @303  	if (inject)
c9c4cf36341f2f Anup Patel 2022-01-19 @304  		aplic_inject_msi(kvm, source, target);
c9c4cf36341f2f Anup Patel 2022-01-19  305  
c9c4cf36341f2f Anup Patel 2022-01-19  306  	return 0;
c9c4cf36341f2f Anup Patel 2022-01-19  307  }
c9c4cf36341f2f Anup Patel 2022-01-19  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
