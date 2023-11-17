Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6B1C2B3
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTY7u3PA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700224990; x=1731760990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yby6pPqz1nnJwARlLt8YAimH6uZm/pOLJnSCpvTCJnU=;
  b=nTY7u3PA+sTvXCaQW/jVv1PpK5MQ6s9heTXNs7Ihq+uIytjAkfMhvRZ2
   zrd4GIq6KQnr8UXUnUVkMHcybt1eH9nen9UcBYOldH0YyOZ0PcXJW/VZn
   +F17Skgz8YalXwk85eXxbhyD7NsXQZbByn4Zm8cuCRMh4fQKAj0HVk9te
   xNpOFdj5JcOj26j6BuUxPpLwooBlnPZm81PSJTi6xrZYZOZ7BniLAkwHV
   BSx4sWyunfkdMeGauZnyhwyjijXt8vudCBzk4q2yS59fc3Z/V0meWoTDL
   sDdKuGSFR4M92wphOmUE3Jw71vY1erg9iNI/McRdZNjRuhBWIRR+reuEQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477509459"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="477509459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6833361"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2023 04:43:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3yBd-0002n7-2G;
	Fri, 17 Nov 2023 12:43:05 +0000
Date: Fri, 17 Nov 2023 20:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:kvm-upstream-next 196/273] arch/x86/kvm/x86.c:14007
 pre_move_enc_context_from() warn: missing error code 'ret'
Message-ID: <202311171944.g4l2vVTQ-lkp@intel.com>
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
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: bf2a53c6d4d7151ace11879b20cacf6b07bdedcb [196/273] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231117 (https://download.01.org/0day-ci/archive/20231117/202311171944.g4l2vVTQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311171944.g4l2vVTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311171944.g4l2vVTQ-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:14007 pre_move_enc_context_from() warn: missing error code 'ret'

Old smatch warnings:
arch/x86/kvm/x86.c:5700 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5742 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7902 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9068 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +/ret +14007 arch/x86/kvm/x86.c

bf2a53c6d4d715 Sagi Shahar 2023-04-07  13982  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13983  int pre_move_enc_context_from(struct kvm *dst_kvm, struct kvm *src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13984  			      atomic_t *dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13985  			      atomic_t *src_migration_in_progress)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13986  {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13987  	struct kvm_vcpu *src_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13988  	unsigned long i;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13989  	int ret = -EINVAL;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13990  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13991  	ret = lock_two_vms_for_migration(dst_kvm, src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13992  					 dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13993  					 src_migration_in_progress);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13994  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13995  		return ret;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13996  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13997  	ret = lock_vcpus_for_migration(dst_kvm, MIGRATION_TARGET);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13998  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13999  		goto unlock_vms;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14000  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14001  	ret = lock_vcpus_for_migration(src_kvm, MIGRATION_SOURCE);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14002  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14003  		goto unlock_dst_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14004  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14005  	if (atomic_read(&dst_kvm->online_vcpus) !=
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14006  	    atomic_read(&src_kvm->online_vcpus))
bf2a53c6d4d715 Sagi Shahar 2023-04-07 @14007  		goto unlock_dst_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14008  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14009  	kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14010  		if (!src_vcpu->arch.guest_state_protected)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14011  			goto unlock_dst_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14012  	}
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14013  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14014  	return 0;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14015  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14016  unlock_dst_vcpu:
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14017  	unlock_vcpus_for_migration(dst_kvm);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14018  unlock_vms:
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14019  	unlock_two_vms_for_migration(dst_kvm, src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14020  				     dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14021  				     src_migration_in_progress);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14022  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14023  	return ret;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14024  }
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14025  EXPORT_SYMBOL_GPL(pre_move_enc_context_from);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14026  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
