Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958923C509
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755749332; cv=none; b=BcdoNOfsMIgwy2S3xraM6VXR/hyDQGbSbF/En3rhE3h670PXMQ1DXDD3UoDr2rH82cEQ8saEKE00G47MkhRA4FViJJXH2tF2hsiudKF08YYjKT0E4vvkIT/l/n3HuV0bg0WXryiLVGz8oSGO2yOz4lQDvs3ALW/O2IMSh547GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755749332; c=relaxed/simple;
	bh=dzCzbX0k5P1TYRIdVzdhV2EcpKv+68AGvenAk2t8+dA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7UFvVUCZq+Iu3VOQjvWG/SU5M9vBYthjQ3bmnn7VLZ3JDLCulFG5+qfm0rulvGcMZinWM76QZswjtlgn4Q2NEwUiudZmLvYPg/BdEQF3BjafENa9L5f6M1xHaVYH0fdsEnBhTzd9HQEy/X7ZyVaVqhidjKJjATnuAFBAGl0RWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KM0upp+O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KM0upp+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755749329; x=1787285329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzCzbX0k5P1TYRIdVzdhV2EcpKv+68AGvenAk2t8+dA=;
  b=KM0upp+OAQZ1E+1/vTqxMDYggh7EiGAHzLBe9eXiTdkq8snmEysXusw+
   WUMLcmoL73syg/KDsi2cAISAHNcqA7u+iP3uRLfuNQnA4Stq75SBmGKl+
   gFqgSGThGTPUmgpQbeMZYKQ0lvbDMw/vtUI5qpmsxI/6Tyt15bSU8dcjg
   LZgSTlMdghY+PT/8eRQFchabfCppN/55l+Lg082BydXnyImiMj8VxE3eY
   mk1FypyP5wp81OcT5KHxts3rct6V9wMPUjLiOrHbFi6H0wKJPqZz/L+Qb
   mTu+dPbBtXg0o2hmpgv4bWJnTd62rNeKrOQE8KEZGwaQK8btNJmBsM2/O
   g==;
X-CSE-ConnectionGUID: Xph0FDscRBmDjE9w6Tso3g==
X-CSE-MsgGUID: VSDOtyyZTN+Zg6ZQuOqM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61840864"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61840864"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 21:08:48 -0700
X-CSE-ConnectionGUID: hOn9JAGjQ/G7fC6Fa2S+Sw==
X-CSE-MsgGUID: oHhslg2CQVuQG0aZwf/vbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172536758"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2025 21:08:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uowbS-000Jv1-0z;
	Thu, 21 Aug 2025 04:08:42 +0000
Date: Thu, 21 Aug 2025 12:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/3] Revert "x86: kvm: rate-limit global clock updates"
Message-ID: <202508211152.EXwZfAmZ-lkp@intel.com>
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
In-Reply-To: <20250819152027.1687487-3-lei.chen@smartx.com>
References: <20250819152027.1687487-3-lei.chen@smartx.com>
TO: Lei Chen <lei.chen@smartx.com>
TO: Sean Christopherson <seanjc@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: x86@kernel.org
TO: "H. Peter Anvin" <hpa@zytor.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Lei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next linus/master v6.17-rc2 next-20250820]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Chen/Revert-x86-kvm-introduce-periodic-global-clock-updates/20250819-232402
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250819152027.1687487-3-lei.chen%40smartx.com
patch subject: [PATCH v1 2/3] Revert "x86: kvm: rate-limit global clock updates"
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211152.EXwZfAmZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508211152.EXwZfAmZ-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:3416 kvm_gen_kvmclock_update() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:1271 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1272 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:3066 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5761 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5802 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6382 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6811 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9021 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9401 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:16 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:11997 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12589 kvm_arch_enable_virtualization_cpu() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12956 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +3416 arch/x86/kvm/x86.c

5d6d6a7d7e66a9 David Woodhouse 2023-10-05  3398  
0061d53daf26ff Marcelo Tosatti 2013-05-09  3399  /*
0061d53daf26ff Marcelo Tosatti 2013-05-09  3400   * kvmclock updates which are isolated to a given vcpu, such as
0061d53daf26ff Marcelo Tosatti 2013-05-09  3401   * vcpu->cpu migration, should not allow system_timestamp from
0061d53daf26ff Marcelo Tosatti 2013-05-09  3402   * the rest of the vcpus to remain static. Otherwise ntp frequency
0061d53daf26ff Marcelo Tosatti 2013-05-09  3403   * correction applies to one vcpu's system_timestamp but not
0061d53daf26ff Marcelo Tosatti 2013-05-09  3404   * the others.
0061d53daf26ff Marcelo Tosatti 2013-05-09  3405   *
0061d53daf26ff Marcelo Tosatti 2013-05-09  3406   * So in those cases, request a kvmclock update for all vcpus.
66cb9c643e7256 Lei Chen        2025-08-19  3407   * The worst case for a remote vcpu to update its kvmclock
66cb9c643e7256 Lei Chen        2025-08-19  3408   * is then bounded by maximum nohz sleep latency.
0061d53daf26ff Marcelo Tosatti 2013-05-09  3409   */
66cb9c643e7256 Lei Chen        2025-08-19  3410  static void kvm_gen_kvmclock_update(struct kvm_vcpu *v)
0061d53daf26ff Marcelo Tosatti 2013-05-09  3411  {
46808a4cb89708 Marc Zyngier    2021-11-16  3412  	unsigned long i;
0061d53daf26ff Marcelo Tosatti 2013-05-09  3413  	struct kvm_vcpu *vcpu;
66cb9c643e7256 Lei Chen        2025-08-19  3414  	struct kvm *kvm = v->kvm;
0061d53daf26ff Marcelo Tosatti 2013-05-09  3415  
0061d53daf26ff Marcelo Tosatti 2013-05-09 @3416  	kvm_for_each_vcpu(i, vcpu, kvm) {
105b21bbf67bb5 Guo Hui Liu     2014-09-12  3417  		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
0061d53daf26ff Marcelo Tosatti 2013-05-09  3418  		kvm_vcpu_kick(vcpu);
0061d53daf26ff Marcelo Tosatti 2013-05-09  3419  	}
0061d53daf26ff Marcelo Tosatti 2013-05-09  3420  }
0061d53daf26ff Marcelo Tosatti 2013-05-09  3421  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
