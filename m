Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780196;
	b=wAf/fgCqxQzkZt5h2crVAiU33CGq9bSWHZ3e3U414FfTwNSyXUrEx48AlZ2qiRzK9Ilx
	 AhQj7ZgxmtWcR/YengWkpJabnanuXu8wJ7BMh3MlXkC9kjo3E/G0pWJkKklXrVvcYjrr6
	 adbcXsenoxIEqPo47RmJEQ11Se4uuIi81NYTP33XypHzQrqoOU3j4A14V6cWIZzl70nOL
	 AOvLhqvMaEFbHbdfGc3Pk2fbyToRVu94nx/CzfvIg1NPlGbBcZEZtBAgZPSVNO1UcMT3J
	 3+hb9i5ZkSL4NyzV245FcA5spXKy0rYZdR0JoPsg/CpYs+NCKYPY3rSBtE6Q2VhTnxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780196;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5HRxkWdEbXhljuC1ITbnQnLzcNHRUmMgRPZV0VwpJA4=;
	b=iGF6nIDkvA4QUxZlyQ1ddSqwjtMXm/N5JTCCm1yX8PPLEkPRC5Yefb55YagQnrthgHmA
	 V0kYU3rVIrcCsmb21M1egXGQMh0dfOJ0y7FyCZ5qwm/8l+IPAQoFtc8itRMDokk2m/3uX
	 znXj8VCo89Y4xJPeWH4cnUdle1EpozvwvUlCtxDO0zY/OMjImR9tTyUwzgL2sGr9gKGwx
	 fIgE8R7xTQyOaUYAdDCX3Pn8I9qGgC7l00K3RAYI/KgzS/gdpfud023Jg4SiC8utKaNCM
	 A/D3EjbyNNYfDZY8Taj0U0sLLIju2n18AxryeXkR5Lv6Okw6zG0+MyOlr1egxrNkLeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APBtC++i;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E677606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 22:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E677606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APBtC++i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794780196; x=1826316196;
  h=date:from:to:cc:subject:message-id;
  bh=Gbt3jAT4Ib5RJXPtvNabUd34ONA6vYaOuUMk+tgsIxE=;
  b=APBtC++ii6xHDtIbpnNTDgajYfkD/whGxIOMSlI5o/aJ0iGj826+Q3bH
   gapRKWUxLaCobrYuQfDpVddsJuIAMbt8bKTen/f2zMeLxs8luArnL0Oey
   EM61WGA4cqf3Zo+7Z4TnOaLj9IQ+125c+fdwOdY7XIOFFU7wDwng5y76s
   wL/CZICugkA13RO8x0s76mQKO1G5ysH3OPi9SrV0fgFw9loCnV/8R1yDH
   HpHldURaEITudIvGAHdKW2KLI+8pKCGAmd1Nui4BrS5hTBQqNM26+TNtb
   q6cqbdniIvm1Vdnu/EpSIz/V4nJkT1XwDRauVxQ5TBlLfoRFuuU9uZyXA
   Q==;
X-CSE-ConnectionGUID: K079xKfPRoCU1TVJ8ibZ5A==
X-CSE-MsgGUID: ykPUPrTIQpuZDKQ8uPOzBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3368790"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3368790"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:03:15 -0800
X-CSE-ConnectionGUID: gIaC3wNGQeuiTgWuFbZAHQ==
X-CSE-MsgGUID: SLlXShi7Rla1t2dOWbMTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9314149"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2026 14:03:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSiJb-000000017NU-47CT;
	Sun, 15 Nov 2026 22:03:11 +0000
Date: Mon, 16 Nov 2026 06:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvm:kvm-memprot-v4 26/54]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2736:2: error: call to
 '__compiletime_assert_796' declared with 'error' attribute: BUILD_BUG_ON
 failed: sizeof(attrs->attributes) != sizeof(unsigned long)
Message-ID: <202611160559.xUisOtEk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Farrah Chen <farrah.chen@intel.com>
TO: Nicolas Saenz Julienne <nsaenz@amazon.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-memprot-v4
head:   e71c4e83c03926c300f6c43e79b783d47ba8b588
commit: fd506bfd91720a0465a26f9baf6d9ee57c81b847 [26/54] KVM: Introduce NR/NW/NX memory attributes
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: i386-buildonly-randconfig-1005-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160559.xUisOtEk-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160559.xUisOtEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160559.xUisOtEk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2736:2: error: call to '__compiletime_assert_796' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(attrs->attributes) != sizeof(unsigned long)
    2736 |         BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:148:1: note: expanded from here
     148 | __compiletime_assert_796
         | ^
   1 error generated.


vim +2736 arch/x86/kvm/../../../virt/kvm/kvm_main.c

fd506bfd91720a0 Nicolas Saenz Julienne 2026-09-18  2712  
5a475554db1e476 Chao Peng              2023-10-27  2713  static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
5a475554db1e476 Chao Peng              2023-10-27  2714  					   struct kvm_memory_attributes *attrs)
5a475554db1e476 Chao Peng              2023-10-27  2715  {
5a475554db1e476 Chao Peng              2023-10-27  2716  	gfn_t start, end;
5a475554db1e476 Chao Peng              2023-10-27  2717  
5a475554db1e476 Chao Peng              2023-10-27  2718  	/* flags is currently not used. */
5a475554db1e476 Chao Peng              2023-10-27  2719  	if (attrs->flags)
5a475554db1e476 Chao Peng              2023-10-27  2720  		return -EINVAL;
fd506bfd91720a0 Nicolas Saenz Julienne 2026-09-18  2721  	if (!kvm_vm_mem_attributes_valid(kvm, attrs->attributes))
5a475554db1e476 Chao Peng              2023-10-27  2722  		return -EINVAL;
5a475554db1e476 Chao Peng              2023-10-27  2723  	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
5a475554db1e476 Chao Peng              2023-10-27  2724  		return -EINVAL;
5a475554db1e476 Chao Peng              2023-10-27  2725  	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
5a475554db1e476 Chao Peng              2023-10-27  2726  		return -EINVAL;
5a475554db1e476 Chao Peng              2023-10-27  2727  
5a475554db1e476 Chao Peng              2023-10-27  2728  	start = attrs->address >> PAGE_SHIFT;
5a475554db1e476 Chao Peng              2023-10-27  2729  	end = (attrs->address + attrs->size) >> PAGE_SHIFT;
5a475554db1e476 Chao Peng              2023-10-27  2730  
5a475554db1e476 Chao Peng              2023-10-27  2731  	/*
5a475554db1e476 Chao Peng              2023-10-27  2732  	 * xarray tracks data using "unsigned long", and as a result so does
5a475554db1e476 Chao Peng              2023-10-27  2733  	 * KVM.  For simplicity, supports generic attributes only on 64-bit
5a475554db1e476 Chao Peng              2023-10-27  2734  	 * architectures.
5a475554db1e476 Chao Peng              2023-10-27  2735  	 */
5a475554db1e476 Chao Peng              2023-10-27 @2736  	BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
5a475554db1e476 Chao Peng              2023-10-27  2737  
a84ef89cbf91e88 Sean Christopherson    2026-09-10  2738  	return kvm_set_vm_mem_attributes(kvm, start, end, attrs->attributes);
5a475554db1e476 Chao Peng              2023-10-27  2739  }
44e17d0a3663eeb Sean Christopherson    2026-09-10  2740  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
5a475554db1e476 Chao Peng              2023-10-27  2741  

:::::: The code at line 2736 was first introduced by commit
:::::: 5a475554db1e476a14216e742ea2bdb77362d5d5 KVM: Introduce per-page memory attributes

:::::: TO: Chao Peng <chao.p.peng@linux.intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
