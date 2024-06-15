Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564091BDD3
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jun 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718441395; cv=none; b=uNqMJtd/65tNYfJtclaArhTXM4RZQF2X5F7hD6UgiMQ1tWCNwE7lM6klZLayxecVjSc13yHfpowPZ0KF5vko16kT2aZi77I33QxlZDvjN1NwBHg4k6bQ0ngtEyNidveSMNOeoXKX9vSHSB+dGaPoU3a/nTrXD2jTEqNZi2gRzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718441395; c=relaxed/simple;
	bh=E+2LRhn3leWP+V/7bRgmg39WlahznOwCOyI9/I9zSDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONQabHvn68uqb57mAGnptqWW/Wx5yF+31wMmqSmHyo8cbxWsr1SZd4MJtNqYYXcdtDXOaOHUK1GMOJZlQWqaaNoNF2PgoFNKtzWMcYBC3LTdUdSSmlPceqnG1YgIlv8A8nBfYC7qWkojlXZl1/PpiMBcVoHgzNRFIJeIomr5h34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp/NMjkm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp/NMjkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718441393; x=1749977393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E+2LRhn3leWP+V/7bRgmg39WlahznOwCOyI9/I9zSDc=;
  b=Kp/NMjkmEMFEGqS5tqsLu/P3zHoHsrFC8m2dThg/18OSqzVwVtDYBPmi
   ZEI6YSu8cC4t/PdKccIvZ/JAExBCUTAulc+EUNuSxyqQFFeO+Ux9zQQ12
   KlEM1e+osHBo3SUJwVqjC+ZJzlrHzCayNj373OHqaCDG4dScmA8V0jK4q
   GxZvmdpWf4aRvzuwT/PUyty8mWgpE+NP83I28MLkwWm1Qhk1gYm706cPX
   ek4FHYzLHctS/O9jM5s59zlcvmEEkc1+o2ePHhaeggGYgZAoreoR/lDVw
   kiuGrpMnpNw5ckUI8MXcn346FM4aOsqer4zTt2W85ZTbk4Ngx2Usf7RMy
   Q==;
X-CSE-ConnectionGUID: OPB28/XzSvyDO/Gd81IPVw==
X-CSE-MsgGUID: bS+iHzqaTFqKBkElQhK8jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15485663"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15485663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 01:49:53 -0700
X-CSE-ConnectionGUID: YEiDimu9QGuQc4oI50S9pw==
X-CSE-MsgGUID: ahLbFr+MSr60/cuLqbG9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40679658"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jun 2024 01:49:51 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIP6b-0002Ov-1A;
	Sat, 15 Jun 2024 08:49:49 +0000
Date: Sat, 15 Jun 2024 16:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] selftests: kvm: remove print_skip()
Message-ID: <202406151641.BjqL765q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240612104500.425012-1-usama.anjum@collabora.com>
References: <20240612104500.425012-1-usama.anjum@collabora.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Marc Zyngier <maz@kernel.org>
TO: Oliver Upton <oliver.upton@linux.dev>
TO: James Morse <james.morse@arm.com>
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
TO: Zenghui Yu <yuzenghui@huawei.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Christian Borntraeger <borntraeger@linux.ibm.com>
TO: Janosch Frank <frankja@linux.ibm.com>
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
TO: David Hildenbrand <david@redhat.com>
TO: Sean Christopherson <seanjc@google.com>
TO: Haibo Xu <haibo1.xu@intel.com>
TO: Anup Patel <anup@brainfault.org>
TO: Andrew Jones <ajones@ventanamicro.com>
TO: Aaron Lewis <aaronlewis@google.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Thomas Huth <thuth@redhat.com>
TO: "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: kernel@collabora.com
CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.linux.dev
CC: kvm@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvmarm/next kvms390/next linus/master v6.10-rc3 next-20240613]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/selftests-kvm-replace-exit-with-ksft_exit_fail_msg/20240612-184820
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20240612104500.425012-1-usama.anjum%40collabora.com
patch subject: [PATCH 1/2] selftests: kvm: remove print_skip()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151641.BjqL765q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406151641.BjqL765q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> x86_64/hyperv_cpuid.c:155:1: warning: unused label 'do_sys' [-Wunused-label]
     155 | do_sys:
         | ^~~~~~~
>> x86_64/hyperv_cpuid.c:165:1: warning: unused label 'out' [-Wunused-label]
     165 | out:
         | ^~~~
   2 warnings generated.


vim +/do_sys +155 tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c

7edcb73433276d Vitaly Kuznetsov     2018-12-10  128  
7edcb73433276d Vitaly Kuznetsov     2018-12-10  129  int main(int argc, char *argv[])
7edcb73433276d Vitaly Kuznetsov     2018-12-10  130  {
7edcb73433276d Vitaly Kuznetsov     2018-12-10  131  	struct kvm_vm *vm;
813e38cd6d7b42 Sean Christopherson  2022-06-14  132  	const struct kvm_cpuid2 *hv_cpuid_entries;
5c6e31b3bc4b52 Sean Christopherson  2022-02-15  133  	struct kvm_vcpu *vcpu;
7edcb73433276d Vitaly Kuznetsov     2018-12-10  134  
7ed397d107d461 Sean Christopherson  2022-05-27  135  	TEST_REQUIRE(kvm_has_cap(KVM_CAP_HYPERV_CPUID));
7edcb73433276d Vitaly Kuznetsov     2018-12-10  136  
5c6e31b3bc4b52 Sean Christopherson  2022-02-15  137  	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  138  
8b460692fee46a Vitaly Kuznetsov     2020-09-29  139  	/* Test vCPU ioctl version */
5c6e31b3bc4b52 Sean Christopherson  2022-02-15  140  	test_hv_cpuid_e2big(vm, vcpu);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  141  
768e9a61856b75 Sean Christopherson  2022-06-02  142  	hv_cpuid_entries = vcpu_get_supported_hv_cpuid(vcpu);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  143  	test_hv_cpuid(hv_cpuid_entries, false);
813e38cd6d7b42 Sean Christopherson  2022-06-14  144  	free((void *)hv_cpuid_entries);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  145  
1ecbb337fa107c Sean Christopherson  2022-06-14  146  	if (!kvm_cpu_has(X86_FEATURE_VMX) ||
a9af8b5d3d419a Muhammad Usama Anjum 2024-06-12  147  	    !kvm_has_cap(KVM_CAP_HYPERV_ENLIGHTENED_VMCS))
a9af8b5d3d419a Muhammad Usama Anjum 2024-06-12  148  		ksft_exit_skip("Enlightened VMCS is unsupported\n");
a9af8b5d3d419a Muhammad Usama Anjum 2024-06-12  149  
768e9a61856b75 Sean Christopherson  2022-06-02  150  	vcpu_enable_evmcs(vcpu);
768e9a61856b75 Sean Christopherson  2022-06-02  151  	hv_cpuid_entries = vcpu_get_supported_hv_cpuid(vcpu);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  152  	test_hv_cpuid(hv_cpuid_entries, true);
813e38cd6d7b42 Sean Christopherson  2022-06-14  153  	free((void *)hv_cpuid_entries);
8b460692fee46a Vitaly Kuznetsov     2020-09-29  154  
8b460692fee46a Vitaly Kuznetsov     2020-09-29 @155  do_sys:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
