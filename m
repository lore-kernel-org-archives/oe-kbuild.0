Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26A111A3
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694025054; x=1725561054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opna9QO3O7qZ7D6jKm9BGbCTww92+YuTnqBsxOlkJgQ=;
  b=eEJ74JRnKJN/c5Y/F/C5/O48bURMzxeS5eyIy1FovJBoZ2yfiKCcsJn5
   HeJBahfTrETh/qpzOuxVY18z/nLm7wtEMuftYAqYwmS9nZOH+ztr1wuC1
   clYpxoOL8tvM1YuSSCpUao2hnX9oyzyXkHeUN8v4f15R+37vptYJX07Cg
   r43rvOzScBZRBn99jfms9Xkz/CCHvmfFkQI5fM4OFi8rH2OCIRhLWwKUU
   gnYo9E2x+RnUbW+5LxqRRzhwBLQ5iqXhzLzUCRTsu/9Ymvj90s0jcvPcA
   y6jrqjStUxiaxtfSxk1g3g2QaaD/HKnDLjPEqReCTme6pKsc+FksQiyUi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362183708"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362183708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915390866"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915390866"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2023 11:30:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxIe-0000UL-2N;
	Wed, 06 Sep 2023 18:30:48 +0000
Date: Thu, 7 Sep 2023 02:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:svm/sev_int3_mess 10/11] arch/x86/kvm/x86.c:8875
 x86_emulate_instruction() warn: missing error code? 'r'
Message-ID: <202309070246.El8AmLPs-lkp@intel.com>
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

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux svm/sev_int3_mess
head:   e76145fd41335b60d973b01c0c2177f4b00fd904
commit: 828c2238f1dbf8288084c8e59b02df45ccc24f32 [10/11] KVM: x86: Refactor can_emulate_instruction() return to be more expressive
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070246.El8AmLPs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070246.El8AmLPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070246.El8AmLPs-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:8875 x86_emulate_instruction() warn: missing error code? 'r'

Old smatch warnings:
arch/x86/kvm/x86.c:5520 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5561 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7714 emulator_read_write() warn: missing error code? 'rc'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +/r +8875 arch/x86/kvm/x86.c

4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8852  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8853  int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8854  			    int emulation_type, void *insn, int insn_len)
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8855  {
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8856  	int r;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8857  	struct x86_emulate_ctxt *ctxt = vcpu->arch.emulate_ctxt;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8858  	bool writeback = true;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8859  
828c2238f1dbf8 arch/x86/kvm/x86.c Sean Christopherson 2023-08-23  8860  	r = kvm_check_emulate_insn(vcpu, emulation_type, insn, insn_len);
828c2238f1dbf8 arch/x86/kvm/x86.c Sean Christopherson 2023-08-23  8861  	if (r != X86EMUL_CONTINUE)
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8862  		return 1;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8863  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8864  	vcpu->arch.l1tf_flush_l1d = true;
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8865  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8866  	if (!(emulation_type & EMULTYPE_NO_DECODE)) {
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8867  		kvm_clear_exception_queue(vcpu);
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8868  
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8869  		/*
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8870  		 * Return immediately if RIP hits a code breakpoint, such #DBs
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8871  		 * are fault-like and are higher priority than any faults on
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8872  		 * the code fetch itself.
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8873  		 */
750f8fcb261ae3 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  8874  		if (kvm_vcpu_check_code_breakpoint(vcpu, emulation_type, &r))
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11 @8875  			return r;
fee060cd52d69c arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  8876  
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8877  		r = x86_decode_emulated_instruction(vcpu, emulation_type,
4aa2691dcbd38c arch/x86/kvm/x86.c Wei Huang           2021-01-26  8878  						    insn, insn_len);
1d2887e2d84996 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-07-30  8879  		if (r != EMULATION_OK)  {
b4000606205959 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8880  			if ((emulation_type & EMULTYPE_TRAP_UD) ||
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8881  			    (emulation_type & EMULTYPE_TRAP_UD_FORCED)) {
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8882  				kvm_queue_exception(vcpu, UD_VECTOR);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8883  				return 1;
c83fad65e2cae1 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8884  			}
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8885  			if (reexecute_instruction(vcpu, cr2_or_gpa,
991eebf9f8e523 arch/x86/kvm/x86.c Gleb Natapov        2013-04-11  8886  						  emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8887  				return 1;
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8888  
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8889  			if (ctxt->have_exception &&
17122c06b86c9f arch/x86/kvm/x86.c Sean Christopherson 2022-09-30  8890  			    !(emulation_type & EMULTYPE_SKIP)) {
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8891  				/*
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8892  				 * #UD should result in just EMULATION_FAILED, and trap-like
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8893  				 * exception should not be encountered during decode.
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8894  				 */
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8895  				WARN_ON_ONCE(ctxt->exception.vector == UD_VECTOR ||
c8848cee74ff05 arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8896  					     exception_type(ctxt->exception.vector) == EXCPT_TRAP);
8530a79c5a9f4e arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8897  				inject_emulated_exception(vcpu);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8898  				return 1;
8530a79c5a9f4e arch/x86/kvm/x86.c Jan Dakinevich      2019-08-27  8899  			}
e23661712005fd arch/x86/kvm/x86.c Liran Alon          2018-03-12  8900  			return handle_emulation_failure(vcpu, emulation_type);
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8901  		}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8902  	}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8903  
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8904  	if ((emulation_type & EMULTYPE_VMWARE_GP) &&
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8905  	    !is_vmware_backdoor_opcode(ctxt)) {
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8906  		kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8907  		return 1;
42cbf06872cc44 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8908  	}
04789b6664a604 arch/x86/kvm/x86.c Liran Alon          2018-03-12  8909  
1957aa63be5395 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8910  	/*
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8911  	 * EMULTYPE_SKIP without EMULTYPE_COMPLETE_USER_EXIT is intended for
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8912  	 * use *only* by vendor callbacks for kvm_skip_emulated_instruction().
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8913  	 * The caller is responsible for updating interruptibility state and
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8914  	 * injecting single-step #DBs.
1957aa63be5395 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8915  	 */
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8916  	if (emulation_type & EMULTYPE_SKIP) {
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8917  		if (ctxt->mode != X86EMUL_MODE_PROT64)
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8918  			ctxt->eip = (u32)ctxt->_eip;
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8919  		else
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8920  			ctxt->eip = ctxt->_eip;
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8921  
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8922  		if (emulation_type & EMULTYPE_COMPLETE_USER_EXIT) {
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8923  			r = 1;
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8924  			goto writeback;
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8925  		}
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8926  
5e854864ee4384 arch/x86/kvm/x86.c Sean Christopherson 2021-11-02  8927  		kvm_rip_write(vcpu, ctxt->eip);
bb663c7ada380f arch/x86/kvm/x86.c Nadav Amit          2014-07-21  8928  		if (ctxt->eflags & X86_EFLAGS_RF)
bb663c7ada380f arch/x86/kvm/x86.c Nadav Amit          2014-07-21  8929  			kvm_set_rflags(vcpu, ctxt->eflags & ~X86_EFLAGS_RF);
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8930  		return 1;
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8931  	}
ba8afb6b0a2c7e arch/x86/kvm/x86.c Gleb Natapov        2009-04-12  8932  
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8933  	if (retry_instruction(ctxt, cr2_or_gpa, emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8934  		return 1;
1cb3f3ae5a3855 arch/x86/kvm/x86.c Xiao Guangrong      2011-09-22  8935  
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8936  	/* this is needed for vmware backdoor interface to work since it
4d2179e1e9cb74 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8937  	   changes registers values  during IO operation */
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8938  	if (vcpu->arch.emulate_regs_need_sync_from_vcpu) {
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8939  		vcpu->arch.emulate_regs_need_sync_from_vcpu = false;
dd856efafe6097 arch/x86/kvm/x86.c Avi Kivity          2012-08-27  8940  		emulator_invalidate_register_cache(ctxt);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8941  	}
4d2179e1e9cb74 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8942  
5cd21917da245f arch/x86/kvm/x86.c Gleb Natapov        2010-03-18  8943  restart:
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8944  	if (emulation_type & EMULTYPE_PF) {
0f89b207b04a1a arch/x86/kvm/x86.c Tom Lendacky        2016-12-14  8945  		/* Save the faulting GPA (cr2) in the address field */
736c291c9f36b0 arch/x86/kvm/x86.c Sean Christopherson 2019-12-06  8946  		ctxt->exception.address = cr2_or_gpa;
0f89b207b04a1a arch/x86/kvm/x86.c Tom Lendacky        2016-12-14  8947  
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8948  		/* With shadow page tables, cr2 contains a GVA or nGPA. */
347a0d0ded16a2 arch/x86/kvm/x86.c Paolo Bonzini       2022-02-10  8949  		if (vcpu->arch.mmu->root_role.direct) {
744e699c7e9913 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8950  			ctxt->gpa_available = true;
744e699c7e9913 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8951  			ctxt->gpa_val = cr2_or_gpa;
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8952  		}
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8953  	} else {
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8954  		/* Sanitize the address out of an abundance of paranoia. */
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8955  		ctxt->exception.address = 0;
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8956  	}
92daa48b34d784 arch/x86/kvm/x86.c Sean Christopherson 2020-02-18  8957  
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  8958  	r = x86_emulate_insn(ctxt);
c3cd7ffaf57ae6 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8959  
775fde8648ebc5 arch/x86/kvm/x86.c Joerg Roedel        2011-04-04  8960  	if (r == EMULATION_INTERCEPTED)
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8961  		return 1;
775fde8648ebc5 arch/x86/kvm/x86.c Joerg Roedel        2011-04-04  8962  
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  8963  	if (r == EMULATION_FAILED) {
258d985f6eb360 arch/x86/kvm/x86.c Sean Christopherson 2023-02-02  8964  		if (reexecute_instruction(vcpu, cr2_or_gpa, emulation_type))
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8965  			return 1;
c3cd7ffaf57ae6 arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8966  
e23661712005fd arch/x86/kvm/x86.c Liran Alon          2018-03-12  8967  		return handle_emulation_failure(vcpu, emulation_type);
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8968  	}
bbd9b64e37aff5 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8969  
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  8970  	if (ctxt->have_exception) {
0dc902267cb32a arch/x86/kvm/x86.c Sean Christopherson 2023-03-22  8971  		WARN_ON_ONCE(vcpu->mmio_needed && !vcpu->mmio_is_write);
0dc902267cb32a arch/x86/kvm/x86.c Sean Christopherson 2023-03-22  8972  		vcpu->mmio_needed = false;
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8973  		r = 1;
7709aba8f71613 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  8974  		inject_emulated_exception(vcpu);
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  8975  	} else if (vcpu->arch.pio.count) {
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8976  		if (!vcpu->arch.pio.in) {
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8977  			/* FIXME: return into emulator if single-stepping.  */
3457e4192e367f arch/x86/kvm/x86.c Gleb Natapov        2010-04-28  8978  			vcpu->arch.pio.count = 0;
0912c9771e9902 arch/x86/kvm/x86.c Paolo Bonzini       2013-08-27  8979  		} else {
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8980  			writeback = false;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  8981  			vcpu->arch.complete_userspace_io = complete_emulated_pio;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  8982  		}
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8983  		r = 0;
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8984  	} else if (vcpu->mmio_needed) {
bc8a0aafcbb82e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8985  		++vcpu->stat.mmio_exits;
bc8a0aafcbb82e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8986  
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8987  		if (!vcpu->mmio_is_write)
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8988  			writeback = false;
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8989  		r = 0;
716d51abff06f4 arch/x86/kvm/x86.c Gleb Natapov        2012-09-03  8990  		vcpu->arch.complete_userspace_io = complete_emulated_mmio;
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8991  	} else if (vcpu->arch.complete_userspace_io) {
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8992  		writeback = false;
adbfb12d4c4517 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8993  		r = 0;
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  8994  	} else if (r == EMULATION_RESTART)
5cd21917da245f arch/x86/kvm/x86.c Gleb Natapov        2010-03-18  8995  		goto restart;
d2ddd1c48364e4 arch/x86/kvm/x86.c Gleb Natapov        2010-08-25  8996  	else
60fc3d02d5b882 arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  8997  		r = 1;
de7d789acd7f37 drivers/kvm/x86.c  Carsten Otte        2007-10-30  8998  
906fa90416fdb7 arch/x86/kvm/x86.c Hou Wenlong         2021-11-02  8999  writeback:
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9000  	if (writeback) {
b3646477d458fb arch/x86/kvm/x86.c Jason Baron         2021-01-14  9001  		unsigned long rflags = static_call(kvm_x86_get_rflags)(vcpu);
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  9002  		toggle_interruptibility(vcpu, ctxt->interruptibility);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9003  		vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9004  
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9005  		/*
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9006  		 * Note, EXCPT_DB is assumed to be fault-like as the emulator
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9007  		 * only supports code breakpoints and general detect #DB, both
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9008  		 * of which are fault-like.
5623f751bd9c43 arch/x86/kvm/x86.c Sean Christopherson 2022-08-30  9009  		 */
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9010  		if (!ctxt->have_exception ||
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9011  		    exception_type(ctxt->exception.vector) == EXCPT_TRAP) {
9cd803d496e72c arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9012  			kvm_pmu_trigger_event(vcpu, PERF_COUNT_HW_INSTRUCTIONS);
018d70ffcfec8a arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9013  			if (ctxt->is_branch)
018d70ffcfec8a arch/x86/kvm/x86.c Eric Hankland       2021-11-30  9014  				kvm_pmu_trigger_event(vcpu, PERF_COUNT_HW_BRANCH_INSTRUCTIONS);
9d74191ab1ea85 arch/x86/kvm/x86.c Takuya Yoshikawa    2011-05-29  9015  			kvm_rip_write(vcpu, ctxt->eip);
384dea1c918388 arch/x86/kvm/x86.c Felipe Franciosi    2020-05-19  9016  			if (r && (ctxt->tf || (vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)))
120c2c4f99a80e arch/x86/kvm/x86.c Sean Christopherson 2019-08-27  9017  				r = kvm_vcpu_do_singlestep(vcpu);
2a89061451c799 arch/x86/kvm/x86.c Paolo Bonzini       2022-02-01  9018  			static_call_cond(kvm_x86_update_emulated_instruction)(vcpu);
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9019  			__kvm_set_rflags(vcpu, ctxt->eflags);
75ee23b30dc712 arch/x86/kvm/x86.c Sean Christopherson 2019-08-23  9020  		}
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9021  
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9022  		/*
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9023  		 * For STI, interrupts are shadowed; so KVM_REQ_EVENT will
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9024  		 * do nothing, and it will be requested again as soon as
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9025  		 * the shadow expires.  But we still need to check here,
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9026  		 * because POPF has no interrupt shadow.
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9027  		 */
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9028  		if (unlikely((ctxt->eflags & ~rflags) & X86_EFLAGS_IF))
6addfc42992be4 arch/x86/kvm/x86.c Paolo Bonzini       2014-03-27  9029  			kvm_make_request(KVM_REQ_EVENT, vcpu);
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9030  	} else
7ae441eac521b2 arch/x86/kvm/x86.c Gleb Natapov        2011-03-31  9031  		vcpu->arch.emulate_regs_need_sync_to_vcpu = true;
e85d28f8e8cef0 arch/x86/kvm/x86.c Gleb Natapov        2010-07-29  9032  
e85d28f8e8cef0 arch/x86/kvm/x86.c Gleb Natapov        2010-07-29  9033  	return r;
de7d789acd7f37 drivers/kvm/x86.c  Carsten Otte        2007-10-30  9034  }
c60658d1d98364 arch/x86/kvm/x86.c Sean Christopherson 2018-08-23  9035  

:::::: The code at line 8875 was first introduced by commit
:::::: fee060cd52d69c114b62d1a2948ea9648b5131f9 KVM: x86: avoid calling x86 emulator without a decoded instruction

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
