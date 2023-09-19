Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4036B19
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695131059; x=1726667059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCDs726oyzdPdI4Ufvb1dvXnaMB7ymZecTL5Un9pni0=;
  b=AyCqnc2NcMZI9xVcuWC6bOPsNsyNXsaHhonASTaHKSSvnX7xV0ygN3SV
   erAEXuR5KfO09QkvAFWxpTq5qfwgiMJdOmt097GuA6xWol+fIoipp5tbz
   7lnL2cUKBdzf+yOQIsOD2wAPS6Otwj3jWwJhpG2KYSkxSDzbYon1Jytkc
   cZINIuuabZ3SxUvwy3LKPr0/9f6sDiGP5+A5iRdX2gY4IyIo7zIPaBSGD
   3RNaai69yHGMd00cxzhc3zW+Nyi9v1sdo62mn27YdpvPn98iJ9jaIN0wx
   YUksI+NQMDN1fLURoWqR2OxeV/LeNNQkAW9IWfUQ/6ER4nCNygg2Jo86T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378834814"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="378834814"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861553123"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="861553123"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2023 06:44:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qib1R-0007PY-2t;
	Tue, 19 Sep 2023 13:44:13 +0000
Date: Tue, 19 Sep 2023 21:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:kvm-upstream-next 247/323] arch/x86/kvm/x86.c:13864
 pre_move_enc_context_from() warn: missing error code 'ret'
Message-ID: <202309192154.mfAhCdZU-lkp@intel.com>
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
TO: Sagi Shahar <sagis@google.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f879e04c0619fde5c8eecb51a64da52a5ad4908e
commit: 09745396c9540c1e049a13cc29a6f895cb5cf512 [247/323] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192154.mfAhCdZU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309192154.mfAhCdZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309192154.mfAhCdZU-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:13864 pre_move_enc_context_from() warn: missing error code 'ret'

Old smatch warnings:
arch/x86/kvm/x86.c:5581 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5622 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7777 emulator_read_write() warn: missing error code? 'rc'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +/ret +13864 arch/x86/kvm/x86.c

09745396c9540c Sagi Shahar 2023-04-07  13839  
09745396c9540c Sagi Shahar 2023-04-07  13840  int pre_move_enc_context_from(struct kvm *dst_kvm, struct kvm *src_kvm,
09745396c9540c Sagi Shahar 2023-04-07  13841  			      atomic_t *dst_migration_in_progress,
09745396c9540c Sagi Shahar 2023-04-07  13842  			      atomic_t *src_migration_in_progress)
09745396c9540c Sagi Shahar 2023-04-07  13843  {
09745396c9540c Sagi Shahar 2023-04-07  13844  	struct kvm_vcpu *src_vcpu;
09745396c9540c Sagi Shahar 2023-04-07  13845  	unsigned long i;
09745396c9540c Sagi Shahar 2023-04-07  13846  	int ret = -EINVAL;
09745396c9540c Sagi Shahar 2023-04-07  13847  
09745396c9540c Sagi Shahar 2023-04-07  13848  	ret = lock_two_vms_for_migration(dst_kvm, src_kvm,
09745396c9540c Sagi Shahar 2023-04-07  13849  					 dst_migration_in_progress,
09745396c9540c Sagi Shahar 2023-04-07  13850  					 src_migration_in_progress);
09745396c9540c Sagi Shahar 2023-04-07  13851  	if (ret)
09745396c9540c Sagi Shahar 2023-04-07  13852  		return ret;
09745396c9540c Sagi Shahar 2023-04-07  13853  
09745396c9540c Sagi Shahar 2023-04-07  13854  	ret = lock_vcpus_for_migration(dst_kvm, MIGRATION_TARGET);
09745396c9540c Sagi Shahar 2023-04-07  13855  	if (ret)
09745396c9540c Sagi Shahar 2023-04-07  13856  		goto unlock_vms;
09745396c9540c Sagi Shahar 2023-04-07  13857  
09745396c9540c Sagi Shahar 2023-04-07  13858  	ret = lock_vcpus_for_migration(src_kvm, MIGRATION_SOURCE);
09745396c9540c Sagi Shahar 2023-04-07  13859  	if (ret)
09745396c9540c Sagi Shahar 2023-04-07  13860  		goto unlock_dst_vcpu;
09745396c9540c Sagi Shahar 2023-04-07  13861  
09745396c9540c Sagi Shahar 2023-04-07  13862  	if (atomic_read(&dst_kvm->online_vcpus) !=
09745396c9540c Sagi Shahar 2023-04-07  13863  	    atomic_read(&src_kvm->online_vcpus))
09745396c9540c Sagi Shahar 2023-04-07 @13864  		goto unlock_dst_vcpu;
09745396c9540c Sagi Shahar 2023-04-07  13865  
09745396c9540c Sagi Shahar 2023-04-07  13866  	kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
09745396c9540c Sagi Shahar 2023-04-07  13867  		if (!src_vcpu->arch.guest_state_protected)
09745396c9540c Sagi Shahar 2023-04-07  13868  			goto unlock_dst_vcpu;
09745396c9540c Sagi Shahar 2023-04-07  13869  	}
09745396c9540c Sagi Shahar 2023-04-07  13870  
09745396c9540c Sagi Shahar 2023-04-07  13871  	return 0;
09745396c9540c Sagi Shahar 2023-04-07  13872  
09745396c9540c Sagi Shahar 2023-04-07  13873  unlock_dst_vcpu:
09745396c9540c Sagi Shahar 2023-04-07  13874  	unlock_vcpus_for_migration(dst_kvm);
09745396c9540c Sagi Shahar 2023-04-07  13875  unlock_vms:
09745396c9540c Sagi Shahar 2023-04-07  13876  	unlock_two_vms_for_migration(dst_kvm, src_kvm,
09745396c9540c Sagi Shahar 2023-04-07  13877  				     dst_migration_in_progress,
09745396c9540c Sagi Shahar 2023-04-07  13878  				     src_migration_in_progress);
09745396c9540c Sagi Shahar 2023-04-07  13879  
09745396c9540c Sagi Shahar 2023-04-07  13880  	return ret;
09745396c9540c Sagi Shahar 2023-04-07  13881  }
09745396c9540c Sagi Shahar 2023-04-07  13882  EXPORT_SYMBOL_GPL(pre_move_enc_context_from);
09745396c9540c Sagi Shahar 2023-04-07  13883  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
