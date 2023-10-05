Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D439405C4
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUvE25dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696531874; x=1728067874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pRJM2kqK/vBf3x7UCit003/xdQT5xFmtiOe+D6OD9E=;
  b=SUvE25dH3iVVQLMkYopgv7QYSCi0KZmnrZPJujDmQW+0ERjWB/yWGD2Q
   OCM9iJuAwibNhYFqr4uqRLlGYlPGm09TJ89fbJTuPo96nzvznj80bba/t
   IFIhN72BmpiH4bZsIse1fNl7t84S5maM04evxqVNUSg+4TcL0orVCYSpn
   2yjQw2w4kwFlrb94cextO8d5wJlOX5ntsWHX0T+mB6ldjb9WwhF0K2qDO
   cBTE+FPhVFzR2+bG6gD1daEp8uWNh1Azo7qqbUZO9M49gagR6fOVs5v18
   O2FabavLNDdNOHeCSLpT8DhXdQASAyhIP+/qz7I/6yJFU/CTemwi29eD3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386417679"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="386417679"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 11:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842521377"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="842521377"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2023 11:51:11 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoTRF-000Ln6-1v;
	Thu, 05 Oct 2023 18:51:09 +0000
Date: Fri, 6 Oct 2023 02:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9785/9984] arch/x86/kvm/x86.c:8891
 x86_emulate_instruction() warn: missing error code? 'r'
Message-ID: <202310060227.XX3V0ZEt-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d730f1bf6f39ece2d9f3ae682f12e5b593d534d
commit: aeb904f6b9f1de588cf3130dc8a2c458b236704e [9785/9984] KVM: x86: Refactor can_emulate_instruction() return to be more expressive
:::::: branch date: 15 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060227.XX3V0ZEt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231006/202310060227.XX3V0ZEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310060227.XX3V0ZEt-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:8891 x86_emulate_instruction() warn: missing error code? 'r'

Old smatch warnings:
arch/x86/kvm/x86.c:5536 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5577 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7730 emulator_read_write() warn: missing error code? 'rc'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +/r +8891 arch/x86/kvm/x86.c

4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8868  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8869  int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8870  			    int emulation_type, void *insn, int insn_len)
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8871  {
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8872  	int r;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8873  	struct x86_emulate_ctxt *ctxt = vcpu->arch.emulate_ctxt;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8874  	bool writeback = true;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8875  
aeb904f6b9f1de arch/x86/kvm/x86.c Sean Christopherson 2023-08-24  8876  	r = kvm_check_emulate_insn(vcpu, emulation_type, insn, insn_len);
aeb904f6b9f1de arch/x86/kvm/x86.c Sean Christopherson 2023-08-24  8877  	if (r != X86EMUL_CONTINUE)
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8878  		return 1;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8879  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8880  	vcpu->arch.l1tf_flush_l1d = true;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8881  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8882  	if (!(emulation_type & EMULTYPE_NO_DECODE)) {
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8883  		kvm_clear_exception_queue(vcpu);
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8884  
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8885  		/*
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8886  		 * Return immediately if RIP hits a code breakpoint, such #DBs
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8887  		 * are fault-like and are higher priority than any faults on
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8888  		 * the code fetch itself.
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8889  		 */
750f8fcb261ae3 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  8890  		if (kvm_vcpu_check_code_breakpoint(vcpu, emulation_type, &r))
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11 @8891  			return r;
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8892  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8893  		r = x86_decode_emulated_instruction(vcpu, emulation_type,
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8894  						    insn, insn_len);
1d2887e2d84996 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-07-30  8895  		if (r != EMULATION_OK)  {
b4000606205959 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8896  			if ((emulation_type & EMULTYPE_TRAP_UD) ||
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8897  			    (emulation_type & EMULTYPE_TRAP_UD_FORCED)) {
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8898  				kvm_queue_exception(vcpu, UD_VECTOR);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8899  				return 1;
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8900  			}
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8901  			if (reexecute_instruction(vcpu, cr2_or_gpa,
991eebf9f8e523 arch/x86/kvm/x86.c Gleb Natapov        2013-04-11  8902  						  emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8903  				return 1;
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8904  
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8905  			if (ctxt->have_exception &&
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8906  			    !(emulation_type & EMULTYPE_SKIP)) {
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8907  				/*
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8908  				 * #UD should result in just EMULATION_FAILED, and trap-like
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8909  				 * exception should not be encountered during decode.
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8910  				 */
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8911  				WARN_ON_ONCE(ctxt->exception.vector == UD_VECTOR ||
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8912  					     exception_type(ctxt->exception.vector) == EXCPT_TRAP);
8530a79c5a9f4e arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8913  				inject_emulated_exception(vcpu);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8914  				return 1;
8530a79c5a9f4e arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8915  			}
e23661712005fd arch/x86/kvm/x86.c Liran Alon          2018-03-12  8916  			return handle_emulation_failure(vcpu, emulation_type);
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8917  		}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8918  	}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8919  
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8920  	if ((emulation_type & EMULTYPE_VMWARE_GP) &&
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8921  	    !is_vmware_backdoor_opcode(ctxt)) {
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8922  		kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8923  		return 1;
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8924  	}
04789b6664a604 arch/x86/kvm/x86.c Liran Alon          2018-03-12  8925  
1957aa63be5395 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8926  	/*
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8927  	 * EMULTYPE_SKIP without EMULTYPE_COMPLETE_USER_EXIT is intended for
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8928  	 * use *only* by vendor callbacks for kvm_skip_emulated_instruction().
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8929  	 * The caller is responsible for updating interruptibility state and
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8930  	 * injecting single-step #DBs.
1957aa63be5395 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8931  	 */
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8932  	if (emulation_type & EMULTYPE_SKIP) {
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8933  		if (ctxt->mode != X86EMUL_MODE_PROT64)
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8934  			ctxt->eip = (u32)ctxt->_eip;
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8935  		else
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8936  			ctxt->eip = ctxt->_eip;
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8937  
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8938  		if (emulation_type & EMULTYPE_COMPLETE_USER_EXIT) {
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8939  			r = 1;
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8940  			goto writeback;
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8941  		}
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8942  
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8943  		kvm_rip_write(vcpu, ctxt->eip);
bb663c7ada380f arch/x86/kvm/x86.c Nadav Amit          2014-07-21  8944  		if (ctxt->eflags & X86_EFLAGS_RF)
bb663c7ada380f arch/x86/kvm/x86.c Nadav Amit          2014-07-21  8945  			kvm_set_rflags(vcpu, ctxt->eflags & ~X86_EFLAGS_RF);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8946  		return 1;
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8947  	}
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8948  
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8949  	if (retry_instruction(ctxt, cr2_or_gpa, emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8950  		return 1;
1cb3f3ae5a3855 arch/x86/kvm/x86.c Xiao Guangrong      2011-09-22  8951  
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8952  	/* this is needed for vmware backdoor interface to work since it
4d2179e1e9cb74 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8953  	   changes registers values  during IO operation */
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8954  	if (vcpu->arch.emulate_regs_need_sync_from_vcpu) {
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8955  		vcpu->arch.emulate_regs_need_sync_from_vcpu = false;
dd856efafe6097 arch/x86/kvm/x86.c Avi Kivity          2012-08-27  8956  		emulator_invalidate_register_cache(ctxt);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8957  	}
4d2179e1e9cb74 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8958  
5cd21917da245f arch/x86/kvm/x86.c Gleb Natapov        2010-03-18  8959  restart:
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8960  	if (emulation_type & EMULTYPE_PF) {
0f89b207b04a1a arch/x86/kvm/x86.c Tom Lendacky        2016-12-14  8961  		/* Save the faulting GPA (cr2) in the address field */
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8962  		ctxt->exception.address = cr2_or_gpa;
0f89b207b04a1a arch/x86/kvm/x86.c Tom Lendacky        2016-12-14  8963  
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8964  		/* With shadow page tables, cr2 contains a GVA or nGPA. */
347a0d0ded16a2 arch/x86/kvm/x86.c Paolo Bonzini       2022-02-10  8965  		if (vcpu->arch.mmu->root_role.direct) {
744e699c7e9913 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8966  			ctxt->gpa_available = true;
744e699c7e9913 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8967  			ctxt->gpa_val = cr2_or_gpa;
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8968  		}
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8969  	} else {
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8970  		/* Sanitize the address out of an abundance of paranoia. */
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8971  		ctxt->exception.address = 0;
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8972  	}
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8973  
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  8974  	r = x86_emulate_insn(ctxt);
c3cd7ffaf57ae6 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8975  
775fde8648ebc5 arch/x86/kvm/x86.c Joerg Roedel        2011-04-04  8976  	if (r == EMULATION_INTERCEPTED)
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8977  		return 1;
775fde8648ebc5 arch/x86/kvm/x86.c Joerg Roedel        2011-04-04  8978  
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  8979  	if (r == EMULATION_FAILED) {
258d985f6eb360 arch/x86/kvm/x86.c Sean Christopherson 2023-02-02  8980  		if (reexecute_instruction(vcpu, cr2_or_gpa, emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8981  			return 1;
c3cd7ffaf57ae6 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8982  
e23661712005fd arch/x86/kvm/x86.c Liran Alon          2018-03-12  8983  		return handle_emulation_failure(vcpu, emulation_type);
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8984  	}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8985  
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  8986  	if (ctxt->have_exception) {
0dc902267cb32a arch/x86/kvm/x86.c Sean Christopherson 2023-03-22  8987  		WARN_ON_ONCE(vcpu->mmio_needed && !vcpu->mmio_is_write);
0dc902267cb32a arch/x86/kvm/x86.c Sean Christopherson 2023-03-22  8988  		vcpu->mmio_needed = false;
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8989  		r = 1;
7709aba8f71613 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  8990  		inject_emulated_exception(vcpu);
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  8991  	} else if (vcpu->arch.pio.count) {
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8992  		if (!vcpu->arch.pio.in) {
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8993  			/* FIXME: return into emulator if single-stepping.  */
3457e4192e367f arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8994  			vcpu->arch.pio.count = 0;
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8995  		} else {
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8996  			writeback = false;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  8997  			vcpu->arch.complete_userspace_io = complete_emulated_pio;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  8998  		}
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8999  		r = 0;
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9000  	} else if (vcpu->mmio_needed) {
bc8a0aafcbb82e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9001  		++vcpu->stat.mmio_exits;
bc8a0aafcbb82e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9002  
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9003  		if (!vcpu->mmio_is_write)
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9004  			writeback = false;
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9005  		r = 0;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  9006  		vcpu->arch.complete_userspace_io = complete_emulated_mmio;
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  9007  	} else if (vcpu->arch.complete_userspace_io) {
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  9008  		writeback = false;
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  9009  		r = 0;
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9010  	} else if (r == EMULATION_RESTART)
5cd21917da245f arch/x86/kvm/x86.c Gleb Natapov        2010-03-18  9011  		goto restart;
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  9012  	else
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9013  		r = 1;
de7d789acd7f37 drivers/kvm/x86.c  Carsten Otte        2007-10-30  9014  
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  9015  writeback:
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9016  	if (writeback) {
b3646477d458fb arch/x86/kvm/x86.c Jason Baron         2021-01-14  9017  		unsigned long rflags = static_call(kvm_x86_get_rflags)(vcpu);
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  9018  		toggle_interruptibility(vcpu, ctxt->interruptibility);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9019  		vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9020  
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9021  		/*
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9022  		 * Note, EXCPT_DB is assumed to be fault-like as the emulator
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9023  		 * only supports code breakpoints and general detect #DB, both
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9024  		 * of which are fault-like.
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9025  		 */
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9026  		if (!ctxt->have_exception ||
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9027  		    exception_type(ctxt->exception.vector) == EXCPT_TRAP) {
9cd803d496e72c arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9028  			kvm_pmu_trigger_event(vcpu, PERF_COUNT_HW_INSTRUCTIONS);
018d70ffcfec8a arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9029  			if (ctxt->is_branch)
018d70ffcfec8a arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9030  				kvm_pmu_trigger_event(vcpu, PERF_COUNT_HW_BRANCH_INSTRUCTIONS);
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  9031  			kvm_rip_write(vcpu, ctxt->eip);
384dea1c918388 arch/x86/kvm/x86.c Felipe Franciosi    2020-05-19  9032  			if (r && (ctxt->tf || (vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)))
120c2c4f99a80e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9033  				r = kvm_vcpu_do_singlestep(vcpu);
2a89061451c799 arch/x86/kvm/x86.c Paolo Bonzini       2022-02-01  9034  			static_call_cond(kvm_x86_update_emulated_instruction)(vcpu);
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9035  			__kvm_set_rflags(vcpu, ctxt->eflags);
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9036  		}
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9037  
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9038  		/*
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9039  		 * For STI, interrupts are shadowed; so KVM_REQ_EVENT will
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9040  		 * do nothing, and it will be requested again as soon as
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9041  		 * the shadow expires.  But we still need to check here,
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9042  		 * because POPF has no interrupt shadow.
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9043  		 */
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9044  		if (unlikely((ctxt->eflags & ~rflags) & X86_EFLAGS_IF))
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9045  			kvm_make_request(KVM_REQ_EVENT, vcpu);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9046  	} else
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9047  		vcpu->arch.emulate_regs_need_sync_to_vcpu = true;
e85d28f8e8cef0 arch/x86/kvm/x86.c Gleb Natapov        2010-07-29  9048  
e85d28f8e8cef0 arch/x86/kvm/x86.c Gleb Natapov        2010-07-29  9049  	return r;
de7d789acd7f37 drivers/kvm/x86.c  Carsten Otte        2007-10-30  9050  }
c60658d1d98364 arch/x86/kvm/x86.c Sean Christopherson 2018-08-23  9051  

:::::: The code at line 8891 was first introduced by commit
:::::: fee060cd52d69c114b62d1a2948ea9648b5131f9 KVM: x86: avoid calling x86 emulator without a decoded instruction

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
