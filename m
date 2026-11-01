Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498985;
	b=jHslcnNHobZ1EK/EjQD1qnTlz9Q47cg/5myYmCZvypkqmbvk36JgrreRnTGgDUU2vZeL
	 MltBW8osmAfeVzl9dpeOUcbNPm1N9qq52kVjIlL8KJd6IBTl8xsOGblV0rTIEgzz84H1d
	 MyyI0WY3R2rIwnN+/ikVzH2TF64f/GaKCShjCxu8f16Wb6EKWPGDvxxt04I0H7N18N2yE
	 icw1Y+aga+m2y7xbyXr698XbQn7iI9vT7sGr6BdCC1/AGZ7GAPfiAwNIbTf3CZjNatYib
	 jjXg5K9ml0fhwHOFbwS1ztpYBjnAb+rfGwd9I446mk7pA54QtiWTmXSVdmtRvUcE5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498985;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Vd5ZWOxRCBltvJ2ZnW+c4TM6I5aW3+EkcrbjkzvLJ38=;
	b=41Wgd+wMprZwT23Ou1wXZbc4PTlLy8vnBddXEaSTWQATqH6zydUlLkN3NF3wEktJ4kvX
	 /+lgavGv2nhUbTptN33rUncvZ26EkoScSwB/zptIb3W5TNhRbFcgTQ7Ag7IPRNj98o0zQ
	 ayY6cnRR2nzO7rgrKkEUNFpaS8qGTkCsLMMzmrMx9Nk7xM6KpJQgV5CcrOk8SJapGyQj8
	 TduMc8sKbbwy4i6+dRxqysdM5li9FZDD5JL6ZzoWVNyPTih1CAiShhBi2wes5ZNmB+44m
	 ty3aYd8fENVp/ig/bIiozZ7oXO6o5H1Nk8f1UXm/R52jIXiXuAcgXh7hOImThWiy9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRfyFsBB;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8874606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 02:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8874606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRfyFsBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793498982; x=1825034982;
  h=date:from:to:cc:subject:message-id;
  bh=d4PAlrmmRcQoJSUylQICaeHIs1L4bBe/54GiAsACiT8=;
  b=XRfyFsBBGDKghW/tKajU1QF1sZilH//eXlr89oygPlfX2G1KB3qWCkvY
   NkOEjRKsCsH2bmGY7whYkhUXu5MmacXeTcqM2rHa6gnvPdW+YszZAmrkp
   gZu9Ss4cpblLZBxB2vtebLBcW9a6at6t1d1quj3g4+Tu3d34b3PGON0jy
   yX4v5BZLmNRsbWFoYFL0wx7nvN1JPdtaunV4sUdjFBfYNVJaaJcKKgdMz
   PqpJ3K7XQu43iitmXlws1Caidf0NY4MN4N9oCx7ze8pWzwnTZI95MXHO0
   BA6pp4Ns4Qh7p5bcnmLUpyCR92f3ftVFrbzddoBH5onF1MPQG+MayLuNv
   w==;
X-CSE-ConnectionGUID: cwY7o28BTxygWGaJQbx3QQ==
X-CSE-MsgGUID: Z/7CdhtUSS6O4hNDGNV+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2253789"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2253789"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 19:09:42 -0700
X-CSE-ConnectionGUID: oyRHfnWDQjSwABmXtx1IAQ==
X-CSE-MsgGUID: AsTzZ7kAR66mwt5K/OKQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="7590168"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 31 Oct 2026 19:09:39 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNL0r-000000006Ix-2wIw;
	Sun, 01 Nov 2026 02:09:37 +0000
Date: Sun, 01 Nov 2026 03:09:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 20377/21381]
 arch/arm64/kvm/vgic/vgic-init.c:524 vgic_init() warn: missing unwind goto?
Message-ID: <202611010359.UIGFCHgh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
commit: 25993ec8c5bb30baa746936d7a76f03c58150927 [20377/21381] KVM: arm64: vgic: Tear down what vgic_init() created when it fails
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r2200-20261031 (https://download.01.org/0day-ci/archive/20261101/202611010359.UIGFCHgh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611010359.UIGFCHgh-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/vgic/vgic-init.c:524 vgic_init() warn: missing unwind goto?

vim +524 arch/arm64/kvm/vgic/vgic-init.c

ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  474  
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  475  /*
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  476   * vgic_init: allocates and initializes dist and vcpu data structures
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  477   * depending on two dimensioning parameters:
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  478   * - the number of spis
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  479   * - the number of vcpus
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  480   * The function is generally called when nr_spis has been explicitly set
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  481   * by the guest through the KVM DEVICE API. If not nr_spis is set to 256.
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  482   * vgic_initialized() returns true when this function has succeeded.
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  483   */
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  484  int vgic_init(struct kvm *kvm)
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  485  {
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  486  	struct vgic_dist *dist = &kvm->arch.vgic;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  487  	struct kvm_vcpu *vcpu;
b3aa9283c0c505b arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2025-02-12  488  	int ret = 0;
46808a4cb89708c arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2021-11-16  489  	unsigned long idx;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  490  
f00327731131d1b arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2023-03-27  491  	lockdep_assert_held(&kvm->arch.config_lock);
f00327731131d1b arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2023-03-27  492  
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  493  	if (vgic_initialized(kvm))
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  494  		return 0;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  495  
1d47191de7e1590 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2018-07-03  496  	/* Are we also in the middle of creating a VCPU? */
1d47191de7e1590 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2018-07-03  497  	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
1d47191de7e1590 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2018-07-03  498  		return -EBUSY;
1d47191de7e1590 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2018-07-03  499  
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  500  	if (!vgic_is_v5(kvm)) {
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  501  		/* freeze the number of spis */
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  502  		if (!dist->nr_spis)
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  503  			dist->nr_spis = VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  504  
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  505  		ret = kvm_vgic_dist_init(kvm, dist->nr_spis);
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  506  		if (ret)
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  507  			return ret;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  508  
958e8e14fd24c0a virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2020-04-24  509  		/*
82221a4e66f044a arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2025-07-23  510  		 * Ensure vPEs are allocated if direct IRQ injection (e.g. vSGIs,
82221a4e66f044a arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2025-07-23  511  		 * vLPIs) is supported.
958e8e14fd24c0a virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2020-04-24  512  		 */
82221a4e66f044a arch/arm64/kvm/vgic/vgic-init.c Oliver Upton     2025-07-23  513  		if (vgic_supports_direct_irqs(kvm)) {
74fe55dc9ab7714 virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2017-10-27  514  			ret = vgic_v4_init(kvm);
74fe55dc9ab7714 virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2017-10-27  515  			if (ret)
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  516  				goto out_free_spis;
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  517  		}
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  518  	} else {
c7f62066f2cf452 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-09-04  519  		if (!dist->nr_spis)
c7f62066f2cf452 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-09-04  520  			dist->nr_spis = VGIC_V5_DEFAULT_NR_SPIS;
c7f62066f2cf452 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-09-04  521  
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  522  		ret = vgic_v5_init(kvm);
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  523  		if (ret)
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19 @524  			return ret;
f8f85dc00b7427d virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2018-01-12  525  	}
74fe55dc9ab7714 virt/kvm/arm/vgic/vgic-init.c   Marc Zyngier     2017-10-27  526  
46808a4cb89708c arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2021-11-16  527  	kvm_for_each_vcpu(idx, vcpu, kvm)
f04b8a5a83dbaff arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2025-11-20  528  		kvm_vgic_vcpu_reset(vcpu);
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  529  
180ae7b1182344c virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2016-07-22  530  	ret = kvm_vgic_setup_default_irq_routing(kvm);
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  531  	if (ret)
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  532  		goto out_teardown;
180ae7b1182344c virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2016-07-22  533  
10f92c4c537794f virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-01-17  534  	vgic_debug_init(kvm);
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  535  	dist->initialized = true;
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  536  
f4d37c7c3576957 arch/arm64/kvm/vgic/vgic-init.c Sascha Bischoff  2026-03-19  537  	return 0;
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  538  
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  539  out_teardown:
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  540  	if (vgic_is_v5(kvm))
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  541  		vgic_v5_teardown(kvm);
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  542  	else
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  543  		vgic_v4_teardown(kvm);
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  544  out_free_spis:
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  545  	kfree(dist->spis);
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  546  	dist->spis = NULL;
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  547  
25993ec8c5bb30b arch/arm64/kvm/vgic/vgic-init.c Fuad Tabba       2026-09-21  548  	return ret;
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  549  }
ad275b8bb1e659b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2015-12-21  550  

:::::: The code at line 524 was first introduced by commit
:::::: f4d37c7c35769579c51aa5fe00161c690b89811d KVM: arm64: gic-v5: Create and initialise vgic_v5

:::::: TO: Sascha Bischoff <Sascha.Bischoff@arm.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
