Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB921DFCD
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708985906; cv=none; b=owW9Po3qrBi9fLkW5yZopII3oZkqOKhrvx/8gnyDrKdQxpu1P+stZALnc3lfOLrrOXjum7RS5Pg2qjdP2v8xa17xemZX0lzNl3ZqRaBQcVAg7Q5XAvqzg96gBtE11P4PhBI9M0XG+l9cdUoAdNxIkB4WWd0M0o4FUpwr0OvdOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708985906; c=relaxed/simple;
	bh=r6pPCHKrFOyqY4fymojtknLaODcILdOh6vkaY0MeTwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgYKIa4Q3LH6k4YVETjJpdyJhEyZZsnqdD08N9I2jgHh1u3UjOv1m2zFiJQ9EaiP1sNDMhIn7cLk/MJeEJwM6d/PbACjBT3qc18ybkBhF3Mj49auq6Ujt0h5EafEZgnePQJtLjuUZ3eAuQuoTJItQ6abJcbbHU2Orr+1wGZHOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkTCVZJK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkTCVZJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708985904; x=1740521904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6pPCHKrFOyqY4fymojtknLaODcILdOh6vkaY0MeTwk=;
  b=ZkTCVZJKA9IjCSiLXLhLyUJQ5eYq8DvdFdnTOhrvOV2GFrlpRHwINOKX
   OUnOla3daQOkRvfipyDww/ASyULW5qwAnCveH58KyyBc6FF03cyJQBriE
   mUmqM7ldvL64itYXUtGJmx2ptbpT5VL9yPU68g3hJyh/t4tWI9NDuE18B
   BX3Gq0D7yCt5oxPllZd9LFnFKaTJJJ9cw2yLh6ZP6TAVm9GS3OR1anhmE
   Cm+wG28L59NUP9WrxvbSCKf6KGzWPVMIlPcUYInObQzec2Zr9VDVDVQxF
   RzqmZIxilsxWWnJJkTP1SXgZmF2inAapoO4oziFNMXFNciIZXTl96GHUr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="28745670"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="28745670"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 14:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6793821"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2024 14:18:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rejIh-000AiJ-2L;
	Mon, 26 Feb 2024 22:18:19 +0000
Date: Tue, 27 Feb 2024 06:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 9353/10236]
 arch/arm64/kvm/vgic/vgic-its.c:119:30-33: ERROR: reference preceded by free
 on line 98
Message-ID: <202402270651.XsqLZoIN-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Oliver Upton <oliver.upton@linux.dev>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8552c902efe7ef670b6961fb8885b67961aeb629
commit: 1d6f83f60f79ff0118823d904dc1f04ba89f9428 [9353/10236] KVM: arm64: vgic: Store LPIs in an xarray
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r054-20240226 (https://download.01.org/0day-ci/archive/20240227/202402270651.XsqLZoIN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402270651.XsqLZoIN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-its.c:119:30-33: ERROR: reference preceded by free on line 98

vim +119 arch/arm64/kvm/vgic/vgic-its.c

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
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   55  	ret = xa_reserve_irq(&dist->lpi_xa, intid, GFP_KERNEL_ACCOUNT);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   56  	if (ret) {
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   57  		kfree(irq);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   58  		return ERR_PTR(ret);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   59  	}
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   60  
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
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   95  	ret = xa_err(xa_store(&dist->lpi_xa, intid, irq, 0));
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   96  	if (ret) {
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   97  		xa_release(&dist->lpi_xa, intid);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  @98  		kfree(irq);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21   99  		goto out_unlock;
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  100  	}
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  101  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  102  	list_add_tail(&irq->lpi_list, &dist->lpi_list_head);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  103  	dist->lpi_list_count++;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  104  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  105  out_unlock:
fc3bc475231e12 virt/kvm/arm/vgic/vgic-its.c   Julien Thierry   2019-01-07  106  	raw_spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  107  
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  108  	if (ret)
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  109  		return ERR_PTR(ret);
1d6f83f60f79ff arch/arm64/kvm/vgic/vgic-its.c Oliver Upton     2024-02-21  110  
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  111  	/*
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  112  	 * We "cache" the configuration table entries in our struct vgic_irq's.
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  113  	 * However we only have those structs for mapped IRQs, so we read in
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  114  	 * the respective config data from memory here upon mapping the LPI.
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  115  	 *
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  116  	 * Should any of these fail, behave as if we couldn't create the LPI
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  117  	 * by dropping the refcount and returning the error.
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  118  	 */
6ce18e3a5f3308 virt/kvm/arm/vgic/vgic-its.c   Marc Zyngier     2017-10-27 @119  	ret = update_lpi_config(kvm, irq, NULL, false);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  120  	if (ret) {
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  121  		vgic_put_irq(kvm, irq);
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  122  		return ERR_PTR(ret);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  123  	}
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  124  
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  125  	ret = vgic_v3_lpi_sync_pending_status(kvm, irq);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  126  	if (ret) {
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  127  		vgic_put_irq(kvm, irq);
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  128  		return ERR_PTR(ret);
57bdb436ce869a virt/kvm/arm/vgic/vgic-its.c   Zenghui Yu       2020-04-14  129  	}
06bd5359549d7a virt/kvm/arm/vgic/vgic-its.c   Eric Auger       2017-05-04  130  
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  131  	return irq;
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  132  }
df9f58fbea9bc6 virt/kvm/arm/vgic/vgic-its.c   Andre Przywara   2016-07-15  133  

:::::: The code at line 119 was first introduced by commit
:::::: 6ce18e3a5f3308670b49093b1c350d2834428358 KVM: arm/arm64: GICv4: Handle INVALL applied to a vPE

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
