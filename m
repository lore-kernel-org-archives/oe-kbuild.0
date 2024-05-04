Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ACC57C9A
	for <oe-kbuild@lists.linux.dev>; Sat,  4 May 2024 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714850869; cv=none; b=kuNqV+itmxbenE6qDKLXeOWvmoVNxoPgNidjLp8ftctjcqsgd4EZ/oJWlD8eQMSHODCI6Q2FCNDJOwSn038V8KoP/sembwvnPOzGVFXlHYt+cXWrXAMWOM9KdhK3zUyeiD54hw+XAJ57OLfH+zdP109679IzZ/iEEO5zzKmMejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714850869; c=relaxed/simple;
	bh=9R5cUT8msr1ENIzPFIk7uoNF2xQK28pesQ4bsa/Teds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2lfFklieP3YlCavykYw5N+uGUHpFgfEFfbITQZOFjBV8nAv+22tFDBmC4cHULO/dEm3aKnfdPRmmgh+7hihyEcUbqEPbdR3Y+R057VY5AfYRVvYJ/bZw+kFhKoD22vsXxVcEBCMw/wTDSewYhyWGqE6MvBb58GiGn9k2tVtJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+5Jzo2E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+5Jzo2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714850867; x=1746386867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9R5cUT8msr1ENIzPFIk7uoNF2xQK28pesQ4bsa/Teds=;
  b=N+5Jzo2Ehmy3afBGR3HlMpSEipHVJC8dZDFWGm1xa1cGtMbj7kzJjigJ
   QgKA/zoeayoiIWpdBr09HpmcyCWbvgGSelsqrP4jroEm5zHHTdNs8StS0
   kvS2y9yE2oTukQktiiYoEBKwoLWkhNsHAKIcWqzJeWEEIc1i+u3S4rbs1
   UoQe8XPJP2Qo0jiocKQffZ6EzpfMnV+kGbqqmkI6c3B2e0DamSVQHmYmg
   sJNwaEG/UGcZ/yfoKqd/XIxB8ziuWhpPTGQCmQD5FF/O9ljx36D/Cu3ta
   fIHGGTCFlCHWL/A1CbF/BNXmKZOBLDoEVnAzwH8fmQcumwb28FHOZsQLk
   Q==;
X-CSE-ConnectionGUID: mvXD/JT6R5KGBbMTM5cpnA==
X-CSE-MsgGUID: oHdGMv8lR56/2cnLknkjVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10794091"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="10794091"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 12:27:46 -0700
X-CSE-ConnectionGUID: d0ChQF4tRMCn3zQmtI+SHA==
X-CSE-MsgGUID: arzh8U6/TZaZZklTuIP95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32574932"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 12:27:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3L2t-000D6W-0L;
	Sat, 04 May 2024 19:27:43 +0000
Date: Sun, 5 May 2024 03:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agraf-2.6:kvm-kho-gmem-test 19/27] lib/kvm_util.c:202:46: warning:
 unused variable 'region'
Message-ID: <202405050343.ZgfQxdbN-lkp@intel.com>
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
CC: kvm-ppc@vger.kernel.org
TO: Alexander Graf <graf@amazon.com>

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: ea39f95803e6da8a46791922be3724b49bea2c7a [19/27] XXX make fdbox work
:::::: branch date: 35 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050343.ZgfQxdbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405050343.ZgfQxdbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/kvm_util.c: In function 'vm_open':
>> lib/kvm_util.c:202:46: warning: unused variable 'region' [-Wunused-variable]
     202 |                 struct userspace_mem_region *region;
         |                                              ^~~~~~
>> lib/kvm_util.c:201:36: warning: unused variable 'node' [-Wunused-variable]
     201 |                 struct hlist_node *node;
         |                                    ^~~~
>> lib/kvm_util.c:200:21: warning: unused variable 'ctr' [-Wunused-variable]
     200 |                 int ctr;
         |                     ^~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics


vim +/region +202 tools/testing/selftests/kvm/lib/kvm_util.c

ea39f95803e6da Alexander Graf      2024-03-15  191  
ccc82ba6bea451 Sean Christopherson 2022-02-14  192  static void vm_open(struct kvm_vm *vm)
fa3899add1056f Paolo Bonzini       2018-07-26  193  {
ccc82ba6bea451 Sean Christopherson 2022-02-14  194  	vm->kvm_fd = _open_kvm_dev_path_or_exit(O_RDWR);
fa3899add1056f Paolo Bonzini       2018-07-26  195  
7ed397d107d461 Sean Christopherson 2022-05-27  196  	TEST_REQUIRE(kvm_has_cap(KVM_CAP_IMMEDIATE_EXIT));
c68c21ca929771 Paolo Bonzini       2019-04-11  197  
ea39f95803e6da Alexander Graf      2024-03-15  198  	/* XXX HACK! */
ea39f95803e6da Alexander Graf      2024-03-15  199  	if (old_vmfd) {
ea39f95803e6da Alexander Graf      2024-03-15  200  		int ctr;
ea39f95803e6da Alexander Graf      2024-03-15  201  		struct hlist_node *node;
ea39f95803e6da Alexander Graf      2024-03-15 @202  		struct userspace_mem_region *region;
ea39f95803e6da Alexander Graf      2024-03-15  203  
ea39f95803e6da Alexander Graf      2024-03-15  204  		/* Recover old VM fd */
ea39f95803e6da Alexander Graf      2024-03-15  205  		vm->fd = old_vmfd;
ea39f95803e6da Alexander Graf      2024-03-15  206  	} else
fcba483e824628 Sean Christopherson 2022-06-01  207  		vm->fd = __kvm_ioctl(vm->kvm_fd, KVM_CREATE_VM, (void *)vm->type);
f9725f89dc5027 Sean Christopherson 2022-02-15  208  	TEST_ASSERT(vm->fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm->fd));
fa3899add1056f Paolo Bonzini       2018-07-26  209  }
fa3899add1056f Paolo Bonzini       2018-07-26  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
