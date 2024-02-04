Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924FE79D2
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031104; cv=none; b=BdjPFxA39CAciPkX4iAKhk9f0EX2Oo6acz04WpoGHdBPwHzVtdeXBjYoHOc/l/pmbdONzCjjejEmiim40b1wToXpusxos6tzzkwF0wjsp7Z1Waz/YsnwSjtnVkceCSPXnp1RN9lyGlvQa+3YB7WhysN2mhRwoxDzIKeHlLbLCvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031104; c=relaxed/simple;
	bh=GqjS0+p19dVex3yZJZs97KBNqGsg2H5pfsoti6XKyvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlEbzEp9uxlJeUw1Muyt5HWYGLGBarP0SR+kasDjEh1/qE2fICDMeghg+vHsvuRqvYeYqpuhvwU2Nwc+/XSeRoqlpnXHBy3hZD2ZowVXh0/VgTdeuNaNTGHxEWr+SRiQWHK8vtEIpTFs+rnZd/dtPk2RNiDNmdbbHyThVhaRAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9bWqMia; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9bWqMia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707031102; x=1738567102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GqjS0+p19dVex3yZJZs97KBNqGsg2H5pfsoti6XKyvc=;
  b=F9bWqMiaU5oxkFfEpZFLzJz9RGOW3a6BckmJFibCHUyEFi9LkAx1HpQ9
   KT+/1vdeyqX5sGiThhuqo4nUbtc9tA+BcguVU9HLP89DtrjNmQWsKW9Ld
   4MgE6QWKtQCjpL9YJHrH/rGEqQGEMFRXz31xI3dgn9rJWfl59cYrd4Y7B
   Vb9O+wKFTODO/8GOQGTouECUmgJffSzsD2Rb+ZvLbmW0eA+dXcKVe2Mns
   S26Zqlk/sLnkANrwAcv94/sqa0p5Mb25WReCmEFcJb3Idl4WSXvyuyQhw
   f5XwDTPQlHbZ+7YG3eQgNsxFCnGs+X1fWBrBqiwLiaUI3IonJgkCnRKKg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11109657"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11109657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 23:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="657415"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2024 23:18:18 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWWld-00066q-13;
	Sun, 04 Feb 2024 07:18:17 +0000
Date: Sun, 4 Feb 2024 15:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 01/15] KVM: arm64: vgic: Store LPIs in an xarray
Message-ID: <202402041412.mZlOxFFw-lkp@intel.com>
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
In-Reply-To: <20240124204909.105952-2-oliver.upton@linux.dev>
References: <20240124204909.105952-2-oliver.upton@linux.dev>
TO: Oliver Upton <oliver.upton@linux.dev>
TO: kvmarm@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Marc Zyngier <maz@kernel.org>
CC: James Morse <james.morse@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Zenghui Yu <yuzenghui@huawei.com>
CC: Raghavendra Rao Ananta <rananta@google.com>
CC: Jing Zhang <jingzhangos@google.com>
CC: Oliver Upton <oliver.upton@linux.dev>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6613476e225e090cc9aad49be7fa504e290dd33d]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Upton/KVM-arm64-vgic-Store-LPIs-in-an-xarray/20240125-045255
base:   6613476e225e090cc9aad49be7fa504e290dd33d
patch link:    https://lore.kernel.org/r/20240124204909.105952-2-oliver.upton%40linux.dev
patch subject: [PATCH 01/15] KVM: arm64: vgic: Store LPIs in an xarray
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-r081-20240129 (https://download.01.org/0day-ci/archive/20240204/202402041412.mZlOxFFw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4a39d08908942b2d415db405844cbe4af73e75d4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402041412.mZlOxFFw-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/vgic/vgic-its.c:128 vgic_add_lpi() warn: inconsistent returns '&dist->lpi_list_lock'.
arch/arm64/kvm/vgic/vgic-its.c:128 vgic_add_lpi() warn: inconsistent returns 'flags'.

Old smatch warnings:
arch/arm64/kvm/vgic/vgic-its.c:324 update_lpi_config() warn: inconsistent returns '&irq->irq_lock'.
arch/arm64/kvm/vgic/vgic-its.c:324 update_lpi_config() warn: inconsistent returns 'flags'.
arch/arm64/kvm/vgic/vgic-its.c:485 its_sync_lpi_pending_table() error: uninitialized symbol 'pendmask'.

vim +128 arch/arm64/kvm/vgic/vgic-its.c

59c5ab40989afa virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   25  
71afe470e20db1 virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-04-13   26  static int vgic_its_save_tables_v0(struct vgic_its *its);
71afe470e20db1 virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-04-13   27  static int vgic_its_restore_tables_v0(struct vgic_its *its);
71afe470e20db1 virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-04-13   28  static int vgic_its_commit_v0(struct vgic_its *its);
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04   29  static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
6ce18e3a5f3308 virt/kvm/arm/vgic/vgic-its.c   Marc Zyngier     2017-10-27   30  			     struct kvm_vcpu *filter_vcpu, bool needs_inv);
71afe470e20db1 virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-04-13   31  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   32  /*
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   33   * Creates a new (reference to a) struct vgic_irq for a given LPI.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   34   * If this LPI is already mapped on another ITS, we increase its refcount
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   35   * and return a pointer to the existing structure.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   36   * If this is a "new" LPI, we allocate and initialize a new struct vgic_irq.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   37   * This function returns a pointer to the _unlocked_ structure.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   38   */
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04   39  static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04   40  				     struct kvm_vcpu *vcpu)
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   41  {
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   42  	struct vgic_dist *dist = &kvm->arch.vgic;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   43  	struct vgic_irq *irq = vgic_get_irq(kvm, NULL, intid), *oldirq;
388d4359680b56 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2018-05-11   44  	unsigned long flags;
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04   45  	int ret;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   46  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   47  	/* In this case there is no put, since we keep the reference. */
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   48  	if (irq)
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   49  		return irq;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   50  
3ef231670b9e90 arch/arm64/kvm/vgic/vgic-its.c Jia He           2021-09-07   51  	irq = kzalloc(sizeof(struct vgic_irq), GFP_KERNEL_ACCOUNT);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   52  	if (!irq)
99e5e886a0a59d virt/kvm/arm/vgic/vgic-its.c   Christoffer Dall 2016-08-01   53  		return ERR_PTR(-ENOMEM);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   54  
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   55  	ret = xa_reserve_irq(&dist->lpi_xa, intid, GFP_KERNEL_ACCOUNT);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   56  	if (ret) {
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   57  		kfree(irq);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   58  		return ERR_PTR(ret);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   59  	}
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   60  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   61  	INIT_LIST_HEAD(&irq->lpi_list);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   62  	INIT_LIST_HEAD(&irq->ap_list);
8fa3adb8c6beee virt/kvm/arm/vgic/vgic-its.c   Julien Thierry   2019-01-07   63  	raw_spin_lock_init(&irq->irq_lock);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   64  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   65  	irq->config = VGIC_CONFIG_EDGE;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   66  	kref_init(&irq->refcount);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   67  	irq->intid = intid;
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04   68  	irq->target_vcpu = vcpu;
8df3c8f33f46ad virt/kvm/arm/vgic/vgic-its.c   Christoffer Dall 2018-07-16   69  	irq->group = 1;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   70  
fc3bc475231e12 virt/kvm/arm/vgic/vgic-its.c   Julien Thierry   2019-01-07   71  	raw_spin_lock_irqsave(&dist->lpi_list_lock, flags);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   72  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   73  	/*
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   74  	 * There could be a race with another vgic_add_lpi(), so we need to
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   75  	 * check that we don't add a second list entry with the same LPI.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   76  	 */
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   77  	list_for_each_entry(oldirq, &dist->lpi_list_head, lpi_list) {
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   78  		if (oldirq->intid != intid)
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   79  			continue;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   80  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   81  		/* Someone was faster with adding this LPI, lets use that. */
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   82  		kfree(irq);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   83  		irq = oldirq;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   84  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   85  		/*
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   86  		 * This increases the refcount, the caller is expected to
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   87  		 * call vgic_put_irq() on the returned pointer once it's
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   88  		 * finished with the IRQ.
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   89  		 */
d97594e6bc1b4a virt/kvm/arm/vgic/vgic-its.c   Marc Zyngier     2016-07-17   90  		vgic_get_irq_kref(irq);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   91  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   92  		goto out_unlock;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   93  	}
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15   94  
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   95  	ret = xa_err(xa_store(&dist->lpi_xa, intid, irq, 0));
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   96  	if (ret) {
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   97  		xa_release(&dist->lpi_xa, intid);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   98  		kfree(irq);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24   99  		return ERR_PTR(ret);
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24  100  	}
3e55a25b7db23f arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-01-24  101  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  102  	list_add_tail(&irq->lpi_list, &dist->lpi_list_head);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  103  	dist->lpi_list_count++;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  104  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  105  out_unlock:
fc3bc475231e12 virt/kvm/arm/vgic/vgic-its.c   Julien Thierry   2019-01-07  106  	raw_spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  107  
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  108  	/*
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  109  	 * We "cache" the configuration table entries in our struct vgic_irq's.
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  110  	 * However we only have those structs for mapped IRQs, so we read in
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  111  	 * the respective config data from memory here upon mapping the LPI.
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  112  	 *
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  113  	 * Should any of these fail, behave as if we couldn't create the LPI
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  114  	 * by dropping the refcount and returning the error.
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  115  	 */
6ce18e3a5f3308 virt/kvm/arm/vgic/vgic-its.c   Marc Zyngier     2017-10-27  116  	ret = update_lpi_config(kvm, irq, NULL, false);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  117  	if (ret) {
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  118  		vgic_put_irq(kvm, irq);
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  119  		return ERR_PTR(ret);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  120  	}
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  121  
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  122  	ret = vgic_v3_lpi_sync_pending_status(kvm, irq);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  123  	if (ret) {
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  124  		vgic_put_irq(kvm, irq);
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  125  		return ERR_PTR(ret);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  126  	}
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  127  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15 @128  	return irq;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  129  }
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
