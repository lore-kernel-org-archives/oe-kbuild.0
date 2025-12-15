Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E62C17B6
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 22:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837131; cv=none; b=IYFdGtk05L5oOPhOaAYPz7pGMa8ek1h5/cy8Qr88UgU39XlDhpdFFC0S5plNC8wbMFqxOfyWcBPgvsQCkP7m/SWFk4ZmykGFiZRe7xphqNaNA19J/ne1TRD4ekgkJ/JSX6FSlFpwxRD+S5UrJBzMS392RmGB/PrjFS+7YCSNMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837131; c=relaxed/simple;
	bh=wCI7ZVc4uuWdGsJmPeMPjW2XjVKrv3Nb5alEJ7IQUfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfbniK+ptZMH8g5j4vdRXTg03yZKDIdvDrERQGwLma2uuwrt/VWGtUPxBwIju05U49e2aPB2dj52b43fvZtc+Iiu6Qazbjz1KV0suaxiqpOP4SUzU7QYxT2lvhguEIng81cBjUMMIahKd/Ag5hmiAPDC/8tn7uz0cHcuH1G448c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFdzizM7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFdzizM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765837130; x=1797373130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCI7ZVc4uuWdGsJmPeMPjW2XjVKrv3Nb5alEJ7IQUfM=;
  b=RFdzizM7JlwvEh0J/bwhJ+4ltXiL2/sPaunNqJ62y76dPyYZA4+/e/Kb
   hLtLYvUbtb7pUrp3GaTS3Cx9oHEga31zcPSCxkXdzRyiwhHWnimee8PI3
   YhpnBLP1XcCYX+jbMBkJt+oyHYCv9DXyJ5IsvR8XivQgenHDBQpA618KS
   XxB++3BOphFHSY5Hl/GJdIs8yeRGH37dyZM/5x2aX3epvWqrVIes1UXOj
   TVqkZy+M7omo8E8ggD9+nVmsrvO2hrwZGgatclpsDWvWSPBaqnc70WJ6u
   Pd915zxexVeOH603vvupZCUkrRHD//0SeRCxGF4PzQGAxwiD5OIU0psrE
   A==;
X-CSE-ConnectionGUID: JJqzDs6kSzWQmUevbnZvTg==
X-CSE-MsgGUID: FXtvFF/aS4CELvD7Uld3Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79205924"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="79205924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 14:18:49 -0800
X-CSE-ConnectionGUID: YoS6gH1bRHmUcN65lWXy6w==
X-CSE-MsgGUID: VamMxgY/TGaWMPDiiFO8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="202021012"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 14:18:47 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVGtt-000000000sJ-0Bij;
	Mon, 15 Dec 2025 22:18:42 +0000
Date: Tue, 16 Dec 2025 06:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/x86.c:3535 kvm_gen_kvmclock_update() warn: iterator 'i'
 not incremented
Message-ID: <202512160655.V2bGzCWx-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lei Chen <lei.chen@smartx.com>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 446fcce2a52b533c543dabba26777813c347577c Revert "x86: kvm: rate-limit global clock updates"
date:   4 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160655.V2bGzCWx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160655.V2bGzCWx-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:3535 kvm_gen_kvmclock_update() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:1309 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1310 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:3185 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5959 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:6000 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6715 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:7148 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9401 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9788 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:16 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:12427 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13040 kvm_arch_enable_virtualization_cpu() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13421 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +3535 arch/x86/kvm/x86.c

5d6d6a7d7e66a9 David Woodhouse 2023-10-05  3517  
0061d53daf26ff Marcelo Tosatti 2013-05-09  3518  /*
0061d53daf26ff Marcelo Tosatti 2013-05-09  3519   * kvmclock updates which are isolated to a given vcpu, such as
0061d53daf26ff Marcelo Tosatti 2013-05-09  3520   * vcpu->cpu migration, should not allow system_timestamp from
0061d53daf26ff Marcelo Tosatti 2013-05-09  3521   * the rest of the vcpus to remain static. Otherwise ntp frequency
0061d53daf26ff Marcelo Tosatti 2013-05-09  3522   * correction applies to one vcpu's system_timestamp but not
0061d53daf26ff Marcelo Tosatti 2013-05-09  3523   * the others.
0061d53daf26ff Marcelo Tosatti 2013-05-09  3524   *
0061d53daf26ff Marcelo Tosatti 2013-05-09  3525   * So in those cases, request a kvmclock update for all vcpus.
446fcce2a52b53 Lei Chen        2025-08-19  3526   * The worst case for a remote vcpu to update its kvmclock
446fcce2a52b53 Lei Chen        2025-08-19  3527   * is then bounded by maximum nohz sleep latency.
0061d53daf26ff Marcelo Tosatti 2013-05-09  3528   */
446fcce2a52b53 Lei Chen        2025-08-19  3529  static void kvm_gen_kvmclock_update(struct kvm_vcpu *v)
0061d53daf26ff Marcelo Tosatti 2013-05-09  3530  {
46808a4cb89708 Marc Zyngier    2021-11-16  3531  	unsigned long i;
0061d53daf26ff Marcelo Tosatti 2013-05-09  3532  	struct kvm_vcpu *vcpu;
446fcce2a52b53 Lei Chen        2025-08-19  3533  	struct kvm *kvm = v->kvm;
0061d53daf26ff Marcelo Tosatti 2013-05-09  3534  
0061d53daf26ff Marcelo Tosatti 2013-05-09 @3535  	kvm_for_each_vcpu(i, vcpu, kvm) {
105b21bbf67bb5 Guo Hui Liu     2014-09-12  3536  		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
0061d53daf26ff Marcelo Tosatti 2013-05-09  3537  		kvm_vcpu_kick(vcpu);
0061d53daf26ff Marcelo Tosatti 2013-05-09  3538  	}
0061d53daf26ff Marcelo Tosatti 2013-05-09  3539  }
0061d53daf26ff Marcelo Tosatti 2013-05-09  3540  

:::::: The code at line 3535 was first introduced by commit
:::::: 0061d53daf26ff713ab43ab84ae5c44b5edbefa9 KVM: x86: limit difference between kvmclock updates

:::::: TO: Marcelo Tosatti <mtosatti@redhat.com>
:::::: CC: Gleb Natapov <gleb@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
