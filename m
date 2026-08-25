Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB23431E3
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 01:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623083; cv=none; b=Nsxbi8ocyBqlRmqQ8hRIWAdAJgnGxWxlLTow4Qh48K/Ue+fOM7qNegm/AbO+I/Ana17Qg0txx3/4CbSnoC/slEvmxZTMaKB0gDqPMP2bwce+o1b+di2wCBmuTLRvvgFbn32IE3Y0nyICFTfLx5a9RkazDrdIKLp/m4s26LOu9cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623083; c=relaxed/simple;
	bh=NHON/u9kl0Qz1SoYd88FAes3vsBc89lZyCkkxDWP79Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fkLRGnKWBJiJ/qSnl/v08IkonZZ8uoXMAQ1PjvvSzP4YWNESsNaXRS36ZQQmeX3WUHXejfxmR2AI+rowqIErs08+/LHKvlAsTDHBICQXazyLTxqOjCA+7WeSmWXrrgDh6r5n+gNs9/s/NiuXoqbrQwwKtc7tqF5QnoqYhgOIEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilmYrnSa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilmYrnSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787623078; x=1819159078;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NHON/u9kl0Qz1SoYd88FAes3vsBc89lZyCkkxDWP79Y=;
  b=ilmYrnSa3Ssz6jI/sHAhvIhvvhwUvvVB1tasQT21KuxlZHQ1+HC5eMQd
   h6NenBPcIfTQwp5uuQKQceWY3L5jKdFG2HYUqCCxYBItWy70gHBjTEXKx
   A6LpL1A9JQHLGfMsb13My3rjpvMX1WxfD06lJf2sDq9AKVHIAoByYzT73
   U5jDf7kODkNn6gKZbA1NAxZyYhpAvtgZVt7lttiplSScucSGCVUKN4mPL
   2WIYgDbeP2tk8A+fd8rii1QM/QzgKc23LXsutxi5pxN0TFA4BnBsEaFFw
   Gc4cP3kzxFJjD5UrRP5bhUR6Ts8Y7vpqDP+915LUgN2muJqGgLU+O0+W9
   Q==;
X-CSE-ConnectionGUID: wbLfER2SQuy+uiYnPnhXDw==
X-CSE-MsgGUID: /wC3lQcFSVy7zn8DGmOCow==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87033594"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87033594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 18:57:54 -0700
X-CSE-ConnectionGUID: pM1RnN7ARuOo889u/svTiA==
X-CSE-MsgGUID: b5JynzLqQteafaItshtxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="267212603"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Aug 2026 18:57:53 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wygQ4-000000004mP-3eep;
	Tue, 25 Aug 2026 01:57:46 +0000
Date: Tue, 25 Aug 2026 09:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kvm/powerpc.c:156 kvmppc_prepare_to_enter()
 warn: inconsistent returns 'irq'.
Message-ID: <202608250901.S0fhUwed-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vishal Chourasia <vishalc@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 12013e3d4695721ef83b2e32fdfd20e2eb9b0cc9 KVM: powerpc: Use generic =
xfer to guest work function
date:   4 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r072-20260825 (https://download.01.org/0day-ci=
/archive/20260825/202608250901.S0fhUwed-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work functi=
on")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608250901.S0fhUwed-lkp@intel.com/

New smatch warnings:
arch/powerpc/kvm/powerpc.c:156 kvmppc_prepare_to_enter() warn: inconsistent=
 returns 'irq'.

Old smatch warnings:
arch/powerpc/kvm/powerpc.c:638 kvm_vm_ioctl_check_extension() error: we pre=
viously assumed 'kvmppc_hv_ops' could be null (see line 525)
arch/powerpc/include/asm/mmu.h:253 mmu_has_feature() warn: bitwise AND cond=
ition is false here

vim +/irq +156 arch/powerpc/kvm/powerpc.c

b6d33834bd4e8b Christoffer Dall 2012-03-08   69 =20
03d25c5bd5c312 Alexander Graf   2012-08-10   70  /*
03d25c5bd5c312 Alexander Graf   2012-08-10   71   * Common checks before en=
tering the guest world.  Call with interrupts
02c1b0824eb187 Andrew Donnellan 2025-08-06   72   * enabled.
03d25c5bd5c312 Alexander Graf   2012-08-10   73   *
7ee788556bf395 Alexander Graf   2012-08-13   74   * returns:
7ee788556bf395 Alexander Graf   2012-08-13   75   *
7ee788556bf395 Alexander Graf   2012-08-13   76   * =3D=3D 1 if we're ready=
 to go into guest state
7ee788556bf395 Alexander Graf   2012-08-13   77   * <=3D 0 if we need to go=
 back to the host with return value
03d25c5bd5c312 Alexander Graf   2012-08-10   78   */
03d25c5bd5c312 Alexander Graf   2012-08-10   79  int kvmppc_prepare_to_ente=
r(struct kvm_vcpu *vcpu)
03d25c5bd5c312 Alexander Graf   2012-08-10   80  {
6c85f52b10fd60 Scott Wood       2014-01-09   81  	int r;
6c85f52b10fd60 Scott Wood       2014-01-09   82 =20
6c85f52b10fd60 Scott Wood       2014-01-09   83  	WARN_ON(irqs_disabled());
12013e3d469572 Vishal Chourasia 2026-07-09   84  	/*
12013e3d469572 Vishal Chourasia 2026-07-09   85  	 * local_irq_disable() fi=
rst: on 32-bit, hard_irq_disable() alone is a
12013e3d469572 Vishal Chourasia 2026-07-09   86  	 * raw MSR[EE] clear that=
 bypasses the lockdep/irq-tracing state, and
12013e3d469572 Vishal Chourasia 2026-07-09   87  	 * the xfer_to_guest_mode=
 helpers assert IRQs are seen as disabled.
12013e3d469572 Vishal Chourasia 2026-07-09   88  	 */
12013e3d469572 Vishal Chourasia 2026-07-09   89  	local_irq_disable();
6c85f52b10fd60 Scott Wood       2014-01-09   90  	hard_irq_disable();
03d25c5bd5c312 Alexander Graf   2012-08-10   91 =20
03d25c5bd5c312 Alexander Graf   2012-08-10   92  	while (true) {
12013e3d469572 Vishal Chourasia 2026-07-09   93  		xfer_to_guest_mode_prepa=
re();
12013e3d469572 Vishal Chourasia 2026-07-09   94 =20
12013e3d469572 Vishal Chourasia 2026-07-09   95  		if (xfer_to_guest_mode_w=
ork_pending()) {
12013e3d469572 Vishal Chourasia 2026-07-09   96  			/*
12013e3d469572 Vishal Chourasia 2026-07-09   97  			 * The helper must run =
with IRQs enabled and may
12013e3d469572 Vishal Chourasia 2026-07-09   98  			 * schedule(). On a pen=
ding signal it returns -EINTR
12013e3d469572 Vishal Chourasia 2026-07-09   99  			 * with run->exit_reaso=
n and vcpu->stat.signal_exits
12013e3d469572 Vishal Chourasia 2026-07-09  100  			 * already set, so just=
 return to userspace.
12013e3d469572 Vishal Chourasia 2026-07-09  101  			 */
03d25c5bd5c312 Alexander Graf   2012-08-10  102  			local_irq_enable();
12013e3d469572 Vishal Chourasia 2026-07-09  103  			r =3D kvm_xfer_to_guest=
_mode_handle_work(vcpu);
12013e3d469572 Vishal Chourasia 2026-07-09  104  			local_irq_disable();
6c85f52b10fd60 Scott Wood       2014-01-09  105  			hard_irq_disable();
12013e3d469572 Vishal Chourasia 2026-07-09  106  			if (r) {
12013e3d469572 Vishal Chourasia 2026-07-09  107  				/*
12013e3d469572 Vishal Chourasia 2026-07-09  108  				 * The generic helper =
does not set the exit
12013e3d469572 Vishal Chourasia 2026-07-09  109  				 * type; record it for=
 the E500
12013e3d469572 Vishal Chourasia 2026-07-09  110  				 * CONFIG_KVM_EXIT_TIM=
ING histogram (a no-op
12013e3d469572 Vishal Chourasia 2026-07-09  111  				 * otherwise).
12013e3d469572 Vishal Chourasia 2026-07-09  112  				 */
12013e3d469572 Vishal Chourasia 2026-07-09  113  				kvmppc_set_exit_type(v=
cpu, SIGNAL_EXITS);
03d25c5bd5c312 Alexander Graf   2012-08-10  114  				break;
03d25c5bd5c312 Alexander Graf   2012-08-10  115  			}
12013e3d469572 Vishal Chourasia 2026-07-09  116  			continue;
12013e3d469572 Vishal Chourasia 2026-07-09  117  		}
03d25c5bd5c312 Alexander Graf   2012-08-10  118 =20
5bd1cf118533ab Scott Wood       2012-08-22  119  		vcpu->mode =3D IN_GUEST_=
MODE;
5bd1cf118533ab Scott Wood       2012-08-22  120 =20
5bd1cf118533ab Scott Wood       2012-08-22  121  		/*
5bd1cf118533ab Scott Wood       2012-08-22  122  		 * Reading vcpu->request=
s must happen after setting vcpu->mode,
5bd1cf118533ab Scott Wood       2012-08-22  123  		 * so we don't miss a re=
quest because the requester sees
5bd1cf118533ab Scott Wood       2012-08-22  124  		 * OUTSIDE_GUEST_MODE an=
d assumes we'll be checking requests
5bd1cf118533ab Scott Wood       2012-08-22  125  		 * before next entering =
the guest (and thus doesn't IPI).
489153c746746f Lan Tianyu       2016-03-13  126  		 * This also orders the =
write to mode from any reads
489153c746746f Lan Tianyu       2016-03-13  127  		 * to the page tables do=
ne while the VCPU is running.
489153c746746f Lan Tianyu       2016-03-13  128  		 * Please see the commen=
t in kvm_flush_remote_tlbs.
5bd1cf118533ab Scott Wood       2012-08-22  129  		 */
03d25c5bd5c312 Alexander Graf   2012-08-10  130  		smp_mb();
5bd1cf118533ab Scott Wood       2012-08-22  131 =20
2fa6e1e12a024b Radim Kr=C4=8Dm=C3=A1=C5=99     2017-06-04  132  		if (kvm_r=
equest_pending(vcpu)) {
03d25c5bd5c312 Alexander Graf   2012-08-10  133  			/* Make sure we process=
 requests preemptable */
03d25c5bd5c312 Alexander Graf   2012-08-10  134  			local_irq_enable();
03d25c5bd5c312 Alexander Graf   2012-08-10  135  			trace_kvm_check_request=
s(vcpu);
7c973a2ebb8fb9 Alexander Graf   2012-08-13  136  			r =3D kvmppc_core_check=
_requests(vcpu);
12013e3d469572 Vishal Chourasia 2026-07-09  137  			local_irq_disable();
6c85f52b10fd60 Scott Wood       2014-01-09  138  			hard_irq_disable();
7c973a2ebb8fb9 Alexander Graf   2012-08-13  139  			if (r > 0)
03d25c5bd5c312 Alexander Graf   2012-08-10  140  				continue;
7c973a2ebb8fb9 Alexander Graf   2012-08-13  141  			break;
03d25c5bd5c312 Alexander Graf   2012-08-10  142  		}
03d25c5bd5c312 Alexander Graf   2012-08-10  143 =20
03d25c5bd5c312 Alexander Graf   2012-08-10  144  		if (kvmppc_core_prepare_=
to_enter(vcpu)) {
03d25c5bd5c312 Alexander Graf   2012-08-10  145  			/* interrupts got enabl=
ed in between, so we
03d25c5bd5c312 Alexander Graf   2012-08-10  146  			   are back at square 1=
 */
03d25c5bd5c312 Alexander Graf   2012-08-10  147  			continue;
03d25c5bd5c312 Alexander Graf   2012-08-10  148  		}
03d25c5bd5c312 Alexander Graf   2012-08-10  149 =20
6edaa5307f3f51 Paolo Bonzini    2016-06-15  150  		guest_enter_irqoff();
6c85f52b10fd60 Scott Wood       2014-01-09  151  		return 1;
03d25c5bd5c312 Alexander Graf   2012-08-10  152  	}
03d25c5bd5c312 Alexander Graf   2012-08-10  153 =20
6c85f52b10fd60 Scott Wood       2014-01-09  154  	/* return to host */
6c85f52b10fd60 Scott Wood       2014-01-09  155  	local_irq_enable();
03d25c5bd5c312 Alexander Graf   2012-08-10 @156  	return r;
03d25c5bd5c312 Alexander Graf   2012-08-10  157  }
2ba9f0d8875073 Aneesh Kumar K.V 2013-10-07  158  EXPORT_SYMBOL_GPL(kvmppc_p=
repare_to_enter);
03d25c5bd5c312 Alexander Graf   2012-08-10  159 =20

:::::: The code at line 156 was first introduced by commit
:::::: 03d25c5bd5c3125055bd36f4813ddb817def19dd KVM: PPC: Use same kvmppc_p=
repare_to_enter code for booke and book3s_pr

:::::: TO: Alexander Graf <agraf@suse.de>
:::::: CC: Alexander Graf <agraf@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
