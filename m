Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980346FCD6
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byl4SUwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813416; x=1733349416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DPxz9LHHibPnAuZEYo+KeCJV+0vTamtb/ZLC4re8u4=;
  b=byl4SUwdv9s69TT8NSk/SNJsPSGybqiYBgRnzwMWRNviB9L7nPftWSqA
   7tMbzmdzAOZUkcS2VrKu2zpTZ6rQJsU2fSGDMNcLpxPSYDS/OTLVbNHJX
   0VkNqsWj9tdWkOI3FV0FqIk61UC8KWhsLfKbWrU+kTt+VjkZQS9cder+3
   iujj0Qdr4iKjFibBPB7iEfOuM2ZGRp938gV9BKVzqcOZuQT+WlNk7ZxJ6
   ZIYrWbLUjMEKAzKYHBcLiCUggbHAJYF2fiCUyVnw30JqbO6zyWxHBPuFb
   kIiscZVLW41mkbfDXyGYw1q8xhnxracY+qDKxW8TNu2L+tKg2ZP4xnsLm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392833550"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="392833550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747388078"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747388078"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 13:56:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPP-0009mP-33;
	Tue, 05 Dec 2023 21:56:51 +0000
Date: Wed, 6 Dec 2023 05:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-tdx:kvm-upstream-next 196/273] arch/x86/kvm/x86.c:13890:7-8:
 ERROR: iterator variable bound on line 13885 cannot be NULL
Message-ID: <202312060538.yM1czMk6-lkp@intel.com>
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
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-103-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060538.yM1czMk6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060538.yM1czMk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060538.yM1czMk6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/x86.c:13890:7-8: ERROR: iterator variable bound on line 13885 cannot be NULL
   arch/x86/kvm/x86.c:13910:6-7: ERROR: iterator variable bound on line 13905 cannot be NULL

vim +13890 arch/x86/kvm/x86.c

bf2a53c6d4d715 Sagi Shahar 2023-04-07  13879  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13880  static int lock_vcpus_for_migration(struct kvm *kvm, enum migration_role role)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13881  {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13882  	struct kvm_vcpu *vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13883  	unsigned long i, j;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13884  
bf2a53c6d4d715 Sagi Shahar 2023-04-07 @13885  	kvm_for_each_vcpu(i, vcpu, kvm) {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13886  		if (mutex_lock_killable_nested(&vcpu->mutex, role))
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13887  			goto out_unlock;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13888  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13889  #ifdef CONFIG_PROVE_LOCKING
bf2a53c6d4d715 Sagi Shahar 2023-04-07 @13890  		if (!i)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13891  			/*
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13892  			 * Reset the role to one that avoids colliding with
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13893  			 * the role used for the first vcpu mutex.
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13894  			 */
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13895  			role = NR_MIGRATION_ROLES;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13896  		else
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13897  			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13898  #endif
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13899  	}
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13900  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13901  	return 0;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13902  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13903  out_unlock:
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13904  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13905  	kvm_for_each_vcpu(j, vcpu, kvm) {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13906  		if (i == j)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13907  			break;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13908  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
