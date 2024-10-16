Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281931F8189
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083446; cv=none; b=URrl1TS3MGnWQG+QaKITBERZ7++LQBudVeLe2x+OSnjX7rISG/3mmpZCGt2CFn1r7ENRdyv8CJ1jSND4ENHYM7+n5+YTiQFCdjvE85lJUrN4QpYoEKLwIMkaCbgkM16GgDnSprPJwKr7yFKkIFUcm3wO+RraZXftSeoIxTq+2KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083446; c=relaxed/simple;
	bh=u3Usf99F2nZTkMx5TkP46J+8qhq1MPafGU9bg4JTOTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnbtpAuTVB8qH5QxIYiQDsiXYKvloYpfvksP1WyfhX0+uO+v22Mj8plxAVypOyp67DL51dNmd4iqAptOlpEAKu+Bv9kNngDlXVA4R0BX8HoM1/8xASyE+xAvwcwoAEwePyQmgHgvHAcDaopWDJKXgknBNiZiTVPwQr1aUOTlLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNAxG3TX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNAxG3TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083445; x=1760619445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3Usf99F2nZTkMx5TkP46J+8qhq1MPafGU9bg4JTOTY=;
  b=eNAxG3TXrgFuSx1x9qUYMvX3yUvIQepGIhgIKUGv+mVtNuKNF7wycQF0
   ylGQtZNwW4Jgtul7JZ1f5/naXPEb3qOraBixm+sPbtqyzQ8RaH/FnDldY
   L7VpVANA7/E2fTm/jLf+uN6wRhBXOHw4QlVYWHt/cKgwp4fgUeLGxkHV4
   Sk1pWa2oxOBhi22lwdmrqiQ4ihgjTELKaXnjmkQJK74kajHTdnTb0XEBq
   SLg0Di9BiotoEFFT0qGFtw3Nyh+jLOn0gY81BMMFCqQpkPowjRZLC9yNN
   6anq+PEmt2w4XpmZEb6Bz5KjNU+KQNPO2uOcmUzhg6IOmF3RhpaIqmgxR
   A==;
X-CSE-ConnectionGUID: sdBjseLiRk6PSfT1+nATTw==
X-CSE-MsgGUID: Bl4+0h+bQECealz08HB6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51064116"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51064116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:57:20 -0700
X-CSE-ConnectionGUID: 09l6Xzs4S0+a0SJpkzPrDg==
X-CSE-MsgGUID: G1dYI1tgT8KG71jWA78jBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="101551404"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Oct 2024 05:57:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t13aT-000Kuj-0b;
	Wed, 16 Oct 2024 12:57:13 +0000
Date: Wed, 16 Oct 2024 20:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/../../../virt/kvm/kvm_main.c:327
 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
Message-ID: <202410162003.dM9o5QOQ-lkp@intel.com>
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
TO: Venkatesh Srinivas <venkateshs@chromium.org>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 82e9c84d8712e8d29278a37aaa9aa767d50a16da KVM: Remove kvm_make_all_cpus_request_except()
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241016/202410162003.dM9o5QOQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410162003.dM9o5QOQ-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:327 kvm_make_all_cpus_request() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:518 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1730 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1723)
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1732 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1724)
include/linux/kvm_host.h:979 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4947 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:6076 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:6087 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +327 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  313  
82e9c84d8712e8 virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04  314  bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  315  {
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  316  	struct kvm_vcpu *vcpu;
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  317  	struct cpumask *cpus;
46808a4cb89708 virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  318  	unsigned long i;
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  319  	bool called;
46808a4cb89708 virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  320  	int me;
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  321  
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  322  	me = get_cpu();
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  323  
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  324  	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  325  	cpumask_clear(cpus);
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  326  
82e9c84d8712e8 virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04 @327  	kvm_for_each_vcpu(i, vcpu, kvm)
b56bd8e03cf4d5 virt/kvm/kvm_main.c    Jinrong Liang         2022-01-25  328  		kvm_make_vcpu_request(vcpu, req, cpus, me);
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  329  
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  330  	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  331  	put_cpu();
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  332  
498468961ed6f6 virt/kvm/kvm_main.c    Rusty Russell         2008-12-08  333  	return called;
d9e368d6126305 drivers/kvm/kvm_main.c Avi Kivity            2007-06-07  334  }
a2486020a82eef virt/kvm/kvm_main.c    Marcelo Tosatti       2021-05-26  335  EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
54163a346d4a0a virt/kvm/kvm_main.c    Suravee Suthikulpanit 2020-05-06  336  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
