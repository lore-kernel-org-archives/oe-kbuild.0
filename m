Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFF633
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696230934; x=1727766934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Igfw4T/vzTdzfii8dzjdsKrZhtk9SfLunvPQqg/Iug4=;
  b=dBN3wogvhnnSt2ZFaUQzmhtz1a0k/iw176IXmUK3oDeDYJL64aVaUGpv
   +OULMj+xFxPtImvSknfa+7s4tVxyzS9SD/1IkQXcAdAWt9oKtA0YiGtAO
   0TggMn+WvSv9Zuns0Kbz5H9DSb1caCCu1GDHwNSCEYjbioA8od2hRsV0b
   ALGfS5+NryJg3MfHw92HHPK1SWIZWqoXAxhFvfUZEZ5NwmtxyK5GQWVq/
   8JyNOiR5W9KJJPUiEVsk+IvORX2w7SzB0O103vlqtr3K6amKGNcsyd2FL
   GCAi5cJqF3eIdHBeE/H8oDqjH1HaGhEdN2O+kZZbvqb+H/QhkBKWqHhd+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="367654327"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="367654327"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 00:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="866417670"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="866417670"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2023 00:15:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnD9N-0005qb-1N;
	Mon, 02 Oct 2023 07:15:29 +0000
Date: Mon, 2 Oct 2023 15:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:kvm-upstream-next 244/321] arch/x86/kvm/x86.c:13864
 pre_move_enc_context_from() warn: missing error code 'ret'
Message-ID: <202310021558.Tt0c8dgU-lkp@intel.com>
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
commit: 659d9ec85eda12fe80f61b7373f1de7f56a1d5b9 [244/321] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20230924 (https://download.01.org/0day-ci/archive/20231002/202310021558.Tt0c8dgU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021558.Tt0c8dgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310021558.Tt0c8dgU-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:13864 pre_move_enc_context_from() warn: missing error code 'ret'

Old smatch warnings:
arch/x86/kvm/x86.c:5581 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5622 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7777 emulator_read_write() warn: missing error code? 'rc'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +/ret +13864 arch/x86/kvm/x86.c

659d9ec85eda12 Sagi Shahar 2023-04-07  13839  
659d9ec85eda12 Sagi Shahar 2023-04-07  13840  int pre_move_enc_context_from(struct kvm *dst_kvm, struct kvm *src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13841  			      atomic_t *dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13842  			      atomic_t *src_migration_in_progress)
659d9ec85eda12 Sagi Shahar 2023-04-07  13843  {
659d9ec85eda12 Sagi Shahar 2023-04-07  13844  	struct kvm_vcpu *src_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13845  	unsigned long i;
659d9ec85eda12 Sagi Shahar 2023-04-07  13846  	int ret = -EINVAL;
659d9ec85eda12 Sagi Shahar 2023-04-07  13847  
659d9ec85eda12 Sagi Shahar 2023-04-07  13848  	ret = lock_two_vms_for_migration(dst_kvm, src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13849  					 dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13850  					 src_migration_in_progress);
659d9ec85eda12 Sagi Shahar 2023-04-07  13851  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13852  		return ret;
659d9ec85eda12 Sagi Shahar 2023-04-07  13853  
659d9ec85eda12 Sagi Shahar 2023-04-07  13854  	ret = lock_vcpus_for_migration(dst_kvm, MIGRATION_TARGET);
659d9ec85eda12 Sagi Shahar 2023-04-07  13855  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13856  		goto unlock_vms;
659d9ec85eda12 Sagi Shahar 2023-04-07  13857  
659d9ec85eda12 Sagi Shahar 2023-04-07  13858  	ret = lock_vcpus_for_migration(src_kvm, MIGRATION_SOURCE);
659d9ec85eda12 Sagi Shahar 2023-04-07  13859  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13860  		goto unlock_dst_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13861  
659d9ec85eda12 Sagi Shahar 2023-04-07  13862  	if (atomic_read(&dst_kvm->online_vcpus) !=
659d9ec85eda12 Sagi Shahar 2023-04-07  13863  	    atomic_read(&src_kvm->online_vcpus))
659d9ec85eda12 Sagi Shahar 2023-04-07 @13864  		goto unlock_dst_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13865  
659d9ec85eda12 Sagi Shahar 2023-04-07  13866  	kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
659d9ec85eda12 Sagi Shahar 2023-04-07  13867  		if (!src_vcpu->arch.guest_state_protected)
659d9ec85eda12 Sagi Shahar 2023-04-07  13868  			goto unlock_dst_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13869  	}
659d9ec85eda12 Sagi Shahar 2023-04-07  13870  
659d9ec85eda12 Sagi Shahar 2023-04-07  13871  	return 0;
659d9ec85eda12 Sagi Shahar 2023-04-07  13872  
659d9ec85eda12 Sagi Shahar 2023-04-07  13873  unlock_dst_vcpu:
659d9ec85eda12 Sagi Shahar 2023-04-07  13874  	unlock_vcpus_for_migration(dst_kvm);
659d9ec85eda12 Sagi Shahar 2023-04-07  13875  unlock_vms:
659d9ec85eda12 Sagi Shahar 2023-04-07  13876  	unlock_two_vms_for_migration(dst_kvm, src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13877  				     dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13878  				     src_migration_in_progress);
659d9ec85eda12 Sagi Shahar 2023-04-07  13879  
659d9ec85eda12 Sagi Shahar 2023-04-07  13880  	return ret;
659d9ec85eda12 Sagi Shahar 2023-04-07  13881  }
659d9ec85eda12 Sagi Shahar 2023-04-07  13882  EXPORT_SYMBOL_GPL(pre_move_enc_context_from);
659d9ec85eda12 Sagi Shahar 2023-04-07  13883  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
